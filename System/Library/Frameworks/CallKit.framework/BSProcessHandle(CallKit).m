@implementation BSProcessHandle(CallKit)

- (id)cx_applicationIdentifier
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("application-identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)cx_applicationRecord
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CA5870], "cx_applicationRecordForBundleIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BSProcessHandle(CallKit) cx_applicationRecord].cold.1((uint64_t)a1, v4);

    v3 = 0;
  }

  return v3;
}

- (id)cx_capabilities
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.callkit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }

  return v2;
}

- (void)cx_applicationRecord
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Could not obtain bundle identifier from process handle %@", (uint8_t *)&v2, 0xCu);
}

@end
