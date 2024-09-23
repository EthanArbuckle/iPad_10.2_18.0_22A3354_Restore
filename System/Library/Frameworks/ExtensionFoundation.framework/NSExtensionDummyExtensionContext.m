@implementation NSExtensionDummyExtensionContext

void ___NSExtensionDummyExtensionContext_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0CB35E0]);
  v1 = objc_msgSend(v0, "initWithInputItems:contextUUID:", MEMORY[0x1E0C9AA60], 0);
  v2 = (void *)_NSExtensionDummyExtensionContext_context;
  _NSExtensionDummyExtensionContext_context = v1;

}

@end
