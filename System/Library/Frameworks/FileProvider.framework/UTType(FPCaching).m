@implementation UTType(FPCaching)

+ (id)fp_cachedTypeWithIdentifier:()FPCaching alreadyAvailableType:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a3;
  v6 = a4;
  if (fp_cachedTypeWithIdentifier_alreadyAvailableType__onceToken != -1)
    dispatch_once(&fp_cachedTypeWithIdentifier_alreadyAvailableType__onceToken, &__block_literal_global_63);
  if (!fp_cachedTypeWithIdentifier_alreadyAvailableType__hasFastSequenceNumber)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "getKnowledgeUUID:andSequenceNumber:", 0, &v23);
  v8 = v23;
  v9 = v23;

  v10 = (void *)fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration;
  if (!fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration)
  {
    objc_storeStrong((id *)&fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration, v8);
    v10 = (void *)fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration;
  }
  if ((objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
  {
    objc_msgSend((id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache, "removeAllObjects");
    objc_storeStrong((id *)&fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration, v8);
  }

  if (fp_cachedTypeWithIdentifier_alreadyAvailableType__hasFastSequenceNumber)
  {
    objc_msgSend((id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache, "objectForKey:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (v6)
      {
        objc_msgSend((id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache, "setObject:forKey:", v6, v5);
        v11 = v6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = (void *)*MEMORY[0x1E0CEC528];
        if (v20)
          v22 = (void *)v20;
        v11 = v22;

        objc_msgSend((id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache, "setObject:forKey:", v11, v5);
      }
    }
  }
  else
  {
LABEL_12:
    objc_msgSend((id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache, "objectForKey:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = v6;
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = (void *)*MEMORY[0x1E0CEC528];
    if (v13)
      v15 = (void *)v13;
    v16 = v15;

    if (!v12 || (v17 = objc_msgSend(v16, "isEqual:", v12), v18 = v12, (v17 & 1) == 0))
    {
      objc_msgSend((id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache, "setObject:forKey:", v16, v5);
      v18 = v16;
    }
    v11 = v18;

  }
  return v11;
}

+ (uint64_t)fp_cachedTypeWithIdentifier:()FPCaching
{
  return objc_msgSend(a1, "fp_cachedTypeWithIdentifier:alreadyAvailableType:", a3, 0);
}

@end
