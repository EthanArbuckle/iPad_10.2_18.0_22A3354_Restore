@implementation NUFlexRangeProperties

id __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  CGImageMetadataTag *v4;
  CGImageMetadataTag *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRToneMap"), a2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 32), 0, v3);
  v5 = v4;
  if (v4)
    v6 = (void *)CGImageMetadataTagCopyValue(v4);
  else
    v6 = 0;

  return v6;
}

float __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v7 = (void *)_NULogger;
    v6 = 0.0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_retainAutorelease(v3);
      v10 = v7;
      v11 = objc_msgSend(v9, "UTF8String");
      objc_msgSend(v4, "description");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = 136315394;
      v14 = v11;
      v15 = 2080;
      v16 = objc_msgSend(v12, "UTF8String");
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Invalid '%s' tag value: %s", (uint8_t *)&v13, 0x16u);

    }
  }

  return v6;
}

uint64_t __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_312(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      a3 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
      v7 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_retainAutorelease(v5);
        v10 = v7;
        v11 = objc_msgSend(v9, "UTF8String");
        objc_msgSend(v6, "description");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = 136315394;
        v14 = v11;
        v15 = 2080;
        v16 = objc_msgSend(v12, "UTF8String");
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Invalid '%s' tag value: %s", (uint8_t *)&v13, 0x16u);

      }
    }
  }

  return a3;
}

id __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_314(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v6 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_retainAutorelease(v3);
      v9 = v6;
      v10 = objc_msgSend(v8, "UTF8String");
      objc_msgSend(v4, "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = 136315394;
      v13 = v10;
      v14 = 2080;
      v15 = objc_msgSend(v11, "UTF8String");
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Invalid '%s' tag value: %s", (uint8_t *)&v12, 0x16u);

    }
    v5 = 0;
  }

  return v5;
}

float __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_317(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  float v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%lu].%@"), CFSTR("ChannelMetadata"), a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(float (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v5;
}

@end
