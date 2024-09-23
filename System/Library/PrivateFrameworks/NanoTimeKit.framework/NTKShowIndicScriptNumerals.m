@implementation NTKShowIndicScriptNumerals

void __NTKShowIndicScriptNumerals_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  char v4;
  id v5;

  v5 = a2;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("10262875-CE7F-4736-BEE0-2233E4EAA468"));
  v3 = objc_msgSend(v5, "supportsCapability:", v2);

  if ((v3 & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v5, "isPaired") ^ 1;
  NTKShowIndicScriptNumerals___isFeatureEnabled = v4 & _os_feature_enabled_impl();

}

@end
