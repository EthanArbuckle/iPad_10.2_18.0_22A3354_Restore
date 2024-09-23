@implementation FBKLicenseAgreement

+ (NSAttributedString)currentLicenseAgreement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:subdirectory:localization:", CFSTR("License"), CFSTR("rtf"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("License"), CFSTR("rtf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  v7 = *MEMORY[0x24BEBB3C0];
  v8 = *MEMORY[0x24BEBB338];
  v12[0] = *MEMORY[0x24BEBB348];
  v12[1] = v8;
  v13[0] = v7;
  v13[1] = &unk_24E18CBF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithURL:options:documentAttributes:error:", v5, v9, 0, 0);

  return (NSAttributedString *)v10;
}

+ (void)agreeToCurrentLicenseAgreement
{
  id v2;

  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", +[FBKSharedConstants currentLegalVersion](FBKSharedConstants, "currentLegalVersion"), CFSTR("AgreedLegalVersion"));

}

+ (BOOL)hasAgreedToCurrentLicenseAgreement
{
  int64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = +[FBKSharedConstants currentLegalVersion](FBKSharedConstants, "currentLegalVersion");
  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("AgreedLegalVersion"));

  if (v4 > v2)
  {
    if (Log_onceToken != -1)
      dispatch_once(&Log_onceToken, &__block_literal_global_31);
    v5 = Log_log;
    if (os_log_type_enabled((os_log_t)Log_log, OS_LOG_TYPE_INFO))
    {
      v7 = 134218240;
      v8 = v4;
      v9 = 2048;
      v10 = v2;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Agreed legal version [%ld] exceeds current version [%ld].", (uint8_t *)&v7, 0x16u);
    }
  }
  return v4 >= v2;
}

@end
