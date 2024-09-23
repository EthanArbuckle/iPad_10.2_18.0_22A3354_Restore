@implementation LSRecord(IconServices)

+ (void)_is_getSequenceNumber:()IconServices andUUID:
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CA58C0], "sharedDatabaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v6, "canAccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = &unk_1E5816128;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v7, "getKnowledgeUUID:andSequenceNumber:", a4, &v9);
    v8 = v9;

  }
  *a3 = objc_msgSend(v8, "unsignedLongLongValue");

}

+ (id)_is_resourceTokenForRecords:()IconServices
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 16 * objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "persistentIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendData:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (uint64_t)_is_canProvideIconResources
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "iconDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      v3 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    v2 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    legacyResourceNames();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    expandedNamesFromResourceNames(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v18 = v2;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(a1, "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "URLByAppendingPathComponent:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

          if ((v16 & 1) != 0)
          {
            v3 = 1;
            goto LABEL_17;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          continue;
        break;
      }
      v3 = 0;
LABEL_17:
      v2 = v18;
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
LABEL_20:

  return v3;
}

- (uint64_t)_is_providesPrecomposedIconResources
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  objc_msgSend(a1, "iconDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultToTemplatizedAppIcons") ^ 1;

  v5 = objc_msgSend(v2, "_IF_BOOLForKeys:defaultValue:", &unk_1E5816550, v4);
  return v5;
}

@end
