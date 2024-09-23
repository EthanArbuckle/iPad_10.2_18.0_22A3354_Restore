@implementation _PASBloomFilter(Conversion)

- (NSObject)_bloomFilterStringWithJSONObj:()Conversion
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  __int16 v11[8];
  uint8_t buf[16];
  uint8_t v13[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("fields"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filter"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
      v7 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v7;
        v8 = v7;
LABEL_14:

        goto LABEL_15;
      }
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11[0] = 0;
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "BCSChatSuggestBloomFilter bloomFilterString is not an NSString", (uint8_t *)v11, 2u);
      }

    }
    else
    {
      ABSLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_ERROR, "BCSChatSuggestBloomFilter fields parameter is not an NSDictioanry", buf, 2u);
      }
    }
    v8 = 0;
    goto LABEL_14;
  }
  ABSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_ERROR, "BCSChatSuggestBloomFilter records parameter is not an NSArray", v13, 2u);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (uint64_t)initWithJSONObj:()Conversion
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_bloomFilterStringWithJSONObj:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v2, 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
