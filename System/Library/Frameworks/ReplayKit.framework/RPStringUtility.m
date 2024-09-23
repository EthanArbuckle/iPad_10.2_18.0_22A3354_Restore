@implementation RPStringUtility

+ (id)numberFromString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD16F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "numberFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)rotatingDeviceUniqueID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("kSCDeviceUniqueID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("kSCDeviceUniqueID"));
      objc_msgSend(v3, "synchronize");
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 8196, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "weekOfYear");
    v10 = objc_msgSend(v8, "yearForWeekOfYear");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%lu%lu"), v4, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hash");

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RPStringUtility rotatingDeviceUniqueID].cold.1();
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isInvalidBundleId:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("(null)"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("Unknown")))
  {
    v4 = 0;
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RPStringUtility isInvalidBundleId:].cold.1((uint64_t)v3);
    v4 = 1;
  }

  return v4;
}

+ (void)rotatingDeviceUniqueID
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = 136446466;
  v1 = "+[RPStringUtility rotatingDeviceUniqueID]";
  v2 = 1024;
  v3 = 33;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Could not get NSUserDefaults shared defaults object", (uint8_t *)&v0, 0x12u);
}

+ (void)isInvalidBundleId:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 136446722;
  v2 = "+[RPStringUtility isInvalidBundleId:]";
  v3 = 1024;
  v4 = 54;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d bundleID=%@ is invalid", (uint8_t *)&v1, 0x1Cu);
}

@end
