@implementation DMCAKAppleIDSession

void __DMCAKAppleIDSession_block_invoke()
{
  void *v0;
  NSObject *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AuthKitBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  DMCAKAppleIDSession_theClass = objc_msgSend(v0, "classNamed:", CFSTR("AKAppleIDSession"));

  if (!DMCAKAppleIDSession_theClass)
  {
    v1 = *DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v2 = 138543362;
      v3 = CFSTR("AKAppleIDSession");
      _os_log_impl(&dword_1A4951000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

@end
