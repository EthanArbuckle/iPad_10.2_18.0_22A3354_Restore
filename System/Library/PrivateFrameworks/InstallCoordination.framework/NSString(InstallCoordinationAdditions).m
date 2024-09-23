@implementation NSString(InstallCoordinationAdditions)

+ (id)stringWithFileSystemRepresentation:()InstallCoordinationAdditions length:
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFileSystemRepresentation:length:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)stringWithFileSystemRepresentation:()InstallCoordinationAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
}

- (uint64_t)containsDotDotPathComponents
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pathComponents");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "isEqualToString:", CFSTR(".."), (_QWORD)v8) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

@end
