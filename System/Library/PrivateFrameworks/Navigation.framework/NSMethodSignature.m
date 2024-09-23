@implementation NSMethodSignature

void __90__NSMethodSignature_NavigationMethodForwarding___navigation_methodSignatureForEmptyMethod__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", "v@:");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v0;

}

@end
