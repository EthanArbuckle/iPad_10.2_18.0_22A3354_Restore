@implementation GCIPCObjectIdentifier

void __GCIPCObjectIdentifier_Classes_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc((Class)&off_254DEBEC0);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)GCIPCObjectIdentifier_Classes_IPCObjectIdentifierTypes;
  GCIPCObjectIdentifier_Classes_IPCObjectIdentifierTypes = v3;

}

@end
