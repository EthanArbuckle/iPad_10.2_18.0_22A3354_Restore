@implementation MTEnvironmentDeviceDelegate

- (BOOL)isAnonymous
{
  return 0;
}

- (id)osVersion
{
  if (osVersion_onceToken != -1)
    dispatch_once(&osVersion_onceToken, &__block_literal_global_21);
  return (id)osVersion_productVersion;
}

- (id)osBuildNumber
{
  return (id)MGCopyAnswer();
}

- (id)os
{
  return CFSTR("iOS");
}

- (id)app
{
  void *v2;
  void *v3;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostProcessBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hardwareFamily
{
  __CFString *v2;

  v2 = (__CFString *)MGCopyAnswer();
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
  {

    v2 = CFSTR("iPod touch");
  }
  return v2;
}

- (id)appVersion
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hardwareModel
{
  return (id)MGGetStringAnswer();
}

- (id)osLanguages
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
}

void __40__MTEnvironmentDeviceDelegate_osVersion__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBD200]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)osVersion_productVersion;
  osVersion_productVersion = v0;

}

- (id)pixelRatio
{
  float v2;
  void *v3;

  MGGetFloat32Answer();
  if (v2 <= 0.0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)screenHeight
{
  uint64_t v2;
  void *v3;

  v2 = MGGetSInt32Answer();
  if ((int)v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)screenWidth
{
  uint64_t v2;
  void *v3;

  v2 = MGGetSInt32Answer();
  if ((int)v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)windowInnerHeight
{
  return 0;
}

- (id)windowInnerWidth
{
  return 0;
}

- (id)_diskUsage
{
  return +[MTEventHandler cachableWithKey:onBackgroundThread:block:](MTEventHandler, "cachableWithKey:onBackgroundThread:block:", CFSTR("diskUsage"), 1, &__block_literal_global_27);
}

id __41__MTEnvironmentDeviceDelegate__diskUsage__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (!v0)
    v0 = (void *)MEMORY[0x24BDBD1B8];
  v2 = v0;

  return v2;
}

- (id)capacityData
{
  void *v2;
  void *v3;

  -[MTEnvironmentDeviceDelegate _diskUsage](self, "_diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MTEnvironmentDeviceDelegate_capacityData__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BED86B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)capacityDataAvailable
{
  void *v2;
  void *v3;

  -[MTEnvironmentDeviceDelegate _diskUsage](self, "_diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __52__MTEnvironmentDeviceDelegate_capacityDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BED86A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)capacityDisk
{
  void *v2;
  void *v3;

  -[MTEnvironmentDeviceDelegate _diskUsage](self, "_diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__MTEnvironmentDeviceDelegate_capacityDisk__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BED86C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)capacitySystem
{
  void *v2;
  void *v3;

  -[MTEnvironmentDeviceDelegate _diskUsage](self, "_diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __45__MTEnvironmentDeviceDelegate_capacitySystem__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BED86E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)capacitySystemAvailable
{
  void *v2;
  void *v3;

  -[MTEnvironmentDeviceDelegate _diskUsage](self, "_diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__MTEnvironmentDeviceDelegate_capacitySystemAvailable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BED86D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)windowOuterHeight
{
  return 0;
}

- (id)windowOuterWidth
{
  return 0;
}

- (id)connectionType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate connectionType]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)cookies
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate cookies]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)dsId
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate dsId]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)hostApp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate hostApp]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)pageUrl
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate pageUrl]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)resourceRevNum
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate resourceRevNum]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)storeFrontHeader
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate storeFrontHeader]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)userAgent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate userAgent]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)userType
{
  return 0;
}

@end
