@implementation LSApplicationRecord(CX)

+ (id)cx_applicationRecordForBundleIdentifier:()CX
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v8);
  v5 = v8;
  if (!v4)
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(CX) cx_applicationRecordForBundleIdentifier:].cold.1((uint64_t)v3, (uint64_t)v5, v6);

  }
  return v4;
}

+ (id)cx_applicationRecordForConnection:()CX
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "cx_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "cx_applicationRecordForBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(CX) cx_applicationRecordForConnection:].cold.1((uint64_t)v4, v7);

    v6 = 0;
  }

  return v6;
}

- (uint64_t)cx_backgroundModeOptions
{
  uint64_t HasBackgroundMode;

  HasBackgroundMode = _cx_LSAppRecordHasBackgroundMode(a1, CFSTR("voip"));
  if (_cx_LSAppRecordHasBackgroundMode(a1, CFSTR("push-to-talk")))
    return HasBackgroundMode | 2;
  else
    return HasBackgroundMode;
}

- (BOOL)containsBackgroundModeOptions:()CX
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "cx_backgroundModeOptions");
  if (a3)
    return (a3 & ~v4) == 0;
  else
    return v4 == 0;
}

+ (void)cx_applicationRecordForBundleIdentifier:()CX .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A402D000, log, OS_LOG_TYPE_ERROR, "Attempt to retrieve application record for bundle identifier %@ failed with error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)cx_applicationRecordForConnection:()CX .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Could not obtain bundle identifier from connection %@", (uint8_t *)&v2, 0xCu);
}

@end
