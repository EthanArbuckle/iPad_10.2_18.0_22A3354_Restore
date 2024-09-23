@implementation NSError(EFPubliclyDescribableAdditions)

- (id)ef_publicDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;

  if (initErrorDecodersOnce_onceToken != -1)
    dispatch_once(&initErrorDecodersOnce_onceToken, &__block_literal_global_16);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NSError_EFPubliclyDescribableAdditions__ef_publicDescription__block_invoke;
  block[3] = &unk_1E62A59A0;
  block[4] = a1;
  block[5] = &v26;
  dispatch_sync((dispatch_queue_t)sErrorDecodeQueue, block);
  v3 = v27[5];
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Code=%@(%ld)"), v3, objc_msgSend(a1, "code"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Code=%ld"), objc_msgSend(a1, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EFPublicErrorInfoKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32[0] = v2;
    v32[1] = 3221225472;
    v32[2] = __stringForPublicInfo_block_invoke;
    v32[3] = &unk_1E62A6518;
    v33 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v32);

  }
  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternal");

  if (v9)
  {
    objc_msgSend(a1, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Code=%ld"), objc_msgSend(a1, "code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v11, v4);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    truncatedDescriptionToMaxAllowableSize(v7, 0x96uLL);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "ef_publicDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR(" UnderlyingError=%@"), v17);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = &stru_1E62A84D8;
    }
    if (objc_msgSend(v7, "length"))
    {
      if (-[__CFString length](v13, "length"))
        v18 = 75;
      else
        v18 = 150;
    }
    else
    {
      v18 = 150;
    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    objc_msgSend(a1, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedDescriptionToMaxAllowableSize(v7, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedDescriptionToMaxAllowableSize(v13, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ Domain=%@ %@%@%@"), v20, v21, v4, v22, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v26, 8);

  return v14;
}

+ (void)ef_setDecoder:()EFPubliclyDescribableAdditions forDomain:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (initErrorDecodersOnce_onceToken != -1)
    dispatch_once(&initErrorDecodersOnce_onceToken, &__block_literal_global_16);
  v7 = sErrorDecodeQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__NSError_EFPubliclyDescribableAdditions__ef_setDecoder_forDomain___block_invoke;
  v10[3] = &unk_1E62A64F0;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

@end
