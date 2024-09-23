@implementation APECPurposeConfig

+ (id)purposeConfig:(int64_t)a3
{
  uint64_t v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  void *v10;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__classForPurpose_(a1, a2, a3);
  if (v4)
  {
    objc_msgSend_configurationForClass_(APConfigurationMediator, v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 >= 1)
    {
      APLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v13 = (id)objc_opt_class();
        v14 = 2048;
        v15 = a3;
        v8 = v13;
        _os_log_impl(&dword_235C39000, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, class not implemented for purpose: %lu.", buf, 0x16u);

      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("Error: Class not implemented for purpose: %lu."), a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      APSimulateCrash();

    }
    v6 = 0;
  }
  return v6;
}

+ (Class)_classForPurpose:(int64_t)a3
{
  void *v3;

  v3 = 0;
  if (a3 > 102)
  {
    if (a3 == 103 || a3 == 8501)
      goto LABEL_7;
  }
  else if (a3 == 100 || a3 == 101)
  {
LABEL_7:
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

@end
