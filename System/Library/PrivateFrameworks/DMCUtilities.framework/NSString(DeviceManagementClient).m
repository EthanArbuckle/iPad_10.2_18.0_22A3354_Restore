@implementation NSString(DeviceManagementClient)

- (id)dmc_substringWithPattern:()DeviceManagementClient
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", a3, 16, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    v6 = *DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[NSString(DeviceManagementClient) dmc_substringWithPattern:]";
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1A4951000, v6, OS_LOG_TYPE_ERROR, "%s Failed to create regex with error: %{public}@", buf, 0x16u);
    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "rangeAtIndex:", 1);
      objc_msgSend(a1, "substringWithRange:", v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

@end
