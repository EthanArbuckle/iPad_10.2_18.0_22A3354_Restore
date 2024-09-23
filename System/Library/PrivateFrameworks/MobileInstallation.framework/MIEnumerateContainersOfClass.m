@implementation MIEnumerateContainersOfClass

uint64_t __MIEnumerateContainersOfClass_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v18;

  v5 = a2;
  v6 = (void *)MEMORY[0x1B5E0ACCC]();
  if (a3 == 4)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.mobile_container_manager.metadata.plist"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v7, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMMetadataIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMMetadataInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = v14;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;

      v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        v13 = 1;
        goto LABEL_15;
      }
      objc_msgSend(v7, "path");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
      v13 = 1;
    }

LABEL_15:
    goto LABEL_16;
  }
  v13 = 1;
LABEL_16:
  objc_autoreleasePoolPop(v6);

  return v13;
}

@end
