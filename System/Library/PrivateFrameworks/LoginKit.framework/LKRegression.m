@implementation LKRegression

+ (void)executeDelayByUserDefaultIfSet:(id)a3
{
  id v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerForKey:", v3);

      if (v6 >= 1)
      {
        v7 = (void *)LKLogRegression;
        if (os_log_type_enabled((os_log_t)LKLogRegression, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)MEMORY[0x24BDD17F0];
          v9 = v7;
          objc_msgSend(v8, "currentThread");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412802;
          v12 = v10;
          v13 = 2048;
          v14 = v6;
          v15 = 2112;
          v16 = v3;
          _os_log_impl(&dword_2167FC000, v9, OS_LOG_TYPE_DEFAULT, "Delaying %@ for %lu seconds because %@ (user default) is set.", (uint8_t *)&v11, 0x20u);

        }
        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", (double)v6);
      }
    }
  }

}

@end
