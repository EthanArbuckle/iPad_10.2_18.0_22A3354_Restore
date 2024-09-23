@implementation BSXPCObjectBaseClass

void __BSXPCObjectBaseClass_block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  _MergedGlobals_25 = (uint64_t)NSClassFromString(CFSTR("OS_xpc_object"));
  if (!_MergedGlobals_25)
  {
    BSLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      v1 = 138543362;
      v2 = CFSTR("OS_xpc_object");
      _os_log_error_impl(&dword_18A184000, v0, OS_LOG_TYPE_ERROR, "Unable to determine xpc_object_t base class; expected '%{public}@' but didn't find it.",
        (uint8_t *)&v1,
        0xCu);
    }

  }
}

@end
