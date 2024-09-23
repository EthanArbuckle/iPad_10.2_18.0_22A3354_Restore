@implementation ARLinkedOnOrAfterAzul

void __ARLinkedOnOrAfterAzul_block_invoke()
{
  uint64_t v0;
  void *v1;

  ARLinkedOnOrAfterAzul_cachedReturn = dyld_program_sdk_at_least();
  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", CFSTR("com.apple.arkit.forceLinkedOnOrAfterAzul"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARLinkedOnOrAfterAzul_forceAssumeLinkedOnOrAfterAzul;
  ARLinkedOnOrAfterAzul_forceAssumeLinkedOnOrAfterAzul = v0;

}

@end
