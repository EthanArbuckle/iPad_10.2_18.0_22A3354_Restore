@implementation CKRecord(BRCSharingAdditions)

- (uint64_t)isFolderShare
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0D10D48]);

  return v2;
}

- (id)brc_sharedRootExtension
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D10D48]) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (!v2)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412546;
        v9 = v4;
        v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] share has no CKShareTypeKey, using extension from CKShareTitleKey (%@)%@", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(v4, "br_pathExtension");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    v2 = v2;
    v3 = v2;
  }

  return v3;
}

- (id)brc_sharedRootDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2)
    {
LABEL_3:
      objc_msgSend(v2, "brc_mangledNameFromURLFragment:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v2, "brc_stringByDeletingPathExtension");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "brc_mangledNameFromURLFragment:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "share");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v11;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't find document name for share %@ and can't extract it from URL; using '%@' as default%@",
        (uint8_t *)&v16,
        0x20u);

    }
  }
  objc_msgSend(a1, "brc_sharedRootExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v4;
  }
  v14 = v13;

  return v14;
}

- (void)brc_updateWithLogicalName:()BRCSharingAdditions isFolder:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "br_displayFilenameWithExtensionHidden:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C94A80]);
    objc_msgSend(a1, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D10D48], *MEMORY[0x1E0C94A88]);
  }
  else
  {
    objc_msgSend(v6, "br_displayFilenameWithExtensionHidden:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C94A80]);

    objc_msgSend(v7, "br_pathExtension");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C94A88]);
  }
}

@end
