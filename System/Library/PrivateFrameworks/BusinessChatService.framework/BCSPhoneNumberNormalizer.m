@implementation BCSPhoneNumberNormalizer

+ (id)normalizedPhoneNumberForPhoneNumber:(id)a3
{
  id v4;
  _NBPhoneNumberUtil *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(_NBPhoneNumberUtil);
  objc_msgSend(a1, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[_NBPhoneNumberUtil parse:defaultRegion:error:](v5, "parse:defaultRegion:error:", v4, v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("us")))
  {
    objc_msgSend(v7, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == 1)
    {
      if (-[_NBPhoneNumberUtil truncateTooLongNumber:](v5, "truncateTooLongNumber:", v7))
      {
        ABSLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v20 = "+[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:]";
          _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s Successfully truncated a too long phone number", buf, 0xCu);
        }

      }
    }
  }
  if (v8)
  {
    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "+[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:]";
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to get normalized phone number with error %@", buf, 0x16u);

    }
    v14 = v4;
  }
  else
  {
    v17 = 0;
    -[_NBPhoneNumberUtil format:numberFormat:error:](v5, "format:numberFormat:error:", v7, 0, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;

    if (!v8)
      goto LABEL_12;
    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "+[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:]";
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to get E164 formated phone number with error %@", buf, 0x16u);

    }
  }

LABEL_12:
  return v14;
}

+ (id)countryCode
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
