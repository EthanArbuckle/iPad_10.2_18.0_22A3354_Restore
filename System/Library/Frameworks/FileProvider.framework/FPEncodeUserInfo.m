@implementation FPEncodeUserInfo

void __FPEncodeUserInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[FPSearchableItemValue stringFromObject:](FPSearchableItemValue, "stringFromObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPSearchableItemValue stringFromObject:](FPSearchableItemValue, "stringFromObject:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to encode key/value pair %@: %@ in userInfo. Allowed types are String, Number, Date, Boolean.", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

@end
