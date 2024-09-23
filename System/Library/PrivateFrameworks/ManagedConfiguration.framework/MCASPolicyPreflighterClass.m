@implementation MCASPolicyPreflighterClass

void __MCASPolicyPreflighterClass_block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (DAEASBundle_onceToken != -1)
    dispatch_once(&DAEASBundle_onceToken, &__block_literal_global_218);
  MCASPolicyPreflighterClass_theClass = objc_msgSend((id)DAEASBundle_retval, "classNamed:", CFSTR("ASPolicyPreflighter"));
  if (!MCASPolicyPreflighterClass_theClass)
  {
    v0 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v1 = 138543362;
      v2 = CFSTR("ASPolicyPreflighter");
      _os_log_impl(&dword_19ECC4000, v0, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v1, 0xCu);
    }
  }
}

@end
