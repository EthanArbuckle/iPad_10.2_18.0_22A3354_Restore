@implementation VNEntityUniqueIdentifierSupportedRequestClasses

void __VNEntityUniqueIdentifierSupportedRequestClasses_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)VNEntityUniqueIdentifierSupportedRequestClasses::ourClasses;
  VNEntityUniqueIdentifierSupportedRequestClasses::ourClasses = v3;

}

@end
