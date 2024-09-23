@implementation NSProgress(FPAdditions)

- (uint64_t)fp_isAccountedAsCopyProgress
{
  if ((objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30B0]) & 1) != 0
    || (objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30C0]) & 1) != 0
    || (objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30A8]) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30D8]);
  }
}

- (uint64_t)fp_isOfFileOperationKind:()FPAdditions strict:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  objc_msgSend(a1, "fp_fileOperationKindStrict:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  return v8;
}

- (id)fp_fileOperationKindStrict:()FPAdditions
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  if (a3
    && (objc_msgSend(a1, "kind"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB30F8]),
        v4,
        !v5))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NSProgress(FPAdditions) fp_fileOperationKindStrict:].cold.1((uint64_t)v7, v9);

      v8 = 0;
    }
    else
    {
      v8 = v7;
    }

  }
  return v8;
}

- (uint64_t)fp_isOfFileOperationKind:()FPAdditions
{
  return objc_msgSend(a1, "fp_isOfFileOperationKind:strict:", a3, 1);
}

- (BOOL)fp_isGlobalProgressForDomainAt:()FPAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL8 v13;

  v4 = a3;
  objc_msgSend(a1, "fp_fileOperationKindStrict:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  objc_msgSend(a1, "fileTotalCount");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  v7 = (void *)v6;
  objc_msgSend(a1, "fileCompletedCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB30E0]) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB30B8]))
  {
    goto LABEL_8;
  }
  objc_msgSend(a1, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FPProgressIsCreatedByFileProviderKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(a1, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fp_relationshipToItemAtURL:", v4) == 1;

  }
  else
  {
LABEL_8:
    v13 = 0;
  }

  return v13;
}

- (uint64_t)fp_fileOperationKind
{
  return objc_msgSend(a1, "fp_fileOperationKindStrict:", 1);
}

- (void)fp_setFileOperationKind:()FPAdditions
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0CB30F8];
  v5 = a3;
  objc_msgSend(a1, "setKind:", v4);
  objc_msgSend(a1, "setUserInfoObject:forKey:", v5, *MEMORY[0x1E0CB30C8]);

}

- (void)fp_addChildProgress:()FPAdditions withUnitCount:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a4, "longLongValue");
  if (!v7)
    v7 = objc_msgSend(v6, "totalUnitCount");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  if (objc_msgSend(a1, "totalUnitCount") == -1)
  {
    objc_msgSend(a1, "setTotalUnitCount:", v8);
    objc_msgSend(v6, "fileTotalCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFileTotalCount:", v14);

    objc_msgSend(a1, "setFileCompletedCount:", &unk_1E448E980);
    objc_msgSend(a1, "setCompletedUnitCount:", 0);
  }
  else
  {
    objc_msgSend(a1, "setTotalUnitCount:", objc_msgSend(a1, "totalUnitCount") + v8);
    objc_msgSend(a1, "fileTotalCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v6, "fileTotalCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue") + v10;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFileTotalCount:", v13);

  }
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = a1;
    v20 = 2048;
    v21 = v8;
    _os_log_debug_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Adding child progress %@ to parent %@ with %lld unit counts", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(a1, "addChild:withPendingUnitCount:", v6, v8);
}

- (void)fp_fileOperationKindStrict:()FPAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] userinfo[NSProgressFileOperationKindKey] is of unexpected class %@", (uint8_t *)&v4, 0xCu);

}

@end
