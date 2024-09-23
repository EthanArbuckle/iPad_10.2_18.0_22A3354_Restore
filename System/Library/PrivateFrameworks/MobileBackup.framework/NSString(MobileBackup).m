@implementation NSString(MobileBackup)

+ (id)mb_stringWithFileSystemRepresentation:()MobileBackup
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", a3, strlen(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mb_stringByAppendingSlash
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("/"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)mb_pathComponentExistsInSet:()MobileBackup
{
  id v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = a1;
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = v5;
    while (1)
    {
      v8 = objc_msgSend(v7, "length");
      v6 = v8 != 0;
      if (!v8)
        break;
      objc_msgSend(v7, "stringByDeletingLastPathComponent");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v5;
      if (objc_msgSend(v4, "containsObject:", v5))
        goto LABEL_8;
    }
    v5 = v7;
  }
LABEL_8:

  return v6;
}

- (uint64_t)mb_pathHasSQLiteJournalSuffix
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  MBSQLiteJournalSuffixes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(a1, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)mb_stringByAppendingGreenteaSuffix
{
  id v3;
  _QWORD block[6];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NSString_MobileBackup__mb_stringByAppendingGreenteaSuffix__block_invoke;
  block[3] = &unk_1E995D2C0;
  block[4] = a1;
  block[5] = a2;
  if (mb_stringByAppendingGreenteaSuffix_once != -1)
    dispatch_once(&mb_stringByAppendingGreenteaSuffix_once, block);
  if (mb_stringByAppendingGreenteaSuffix_isGreenTea)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CH"), a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (id)mb_backupIDByAddingCKPrefix
{
  id v2;

  if ((objc_msgSend(a1, "hasPrefix:", CFSTR("D:")) & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("D:"), a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)mb_backupIDByRemovingCKPrefix
{
  id v2;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("D:")))
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(CFSTR("D:"), "length"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

@end
