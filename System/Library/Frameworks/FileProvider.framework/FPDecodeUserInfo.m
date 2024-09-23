@implementation FPDecodeUserInfo

void __FPDecodeUserInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPSearchableItemValue objectFromString:](FPSearchableItemValue, "objectFromString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPSearchableItemValue objectFromString:](FPSearchableItemValue, "objectFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to decode key/value pair %@: %@ in userInfo. Allowed types are String, Number, Date, Boolean.", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v8);
  }

}

@end
