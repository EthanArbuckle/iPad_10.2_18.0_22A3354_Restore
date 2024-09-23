@implementation AXUIRepresentedKeyboardElement

void __AXUIRepresentedKeyboardElement_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40E0]), "initWithUUID:andRemotePid:andContextId:", CFSTR("KeyboardSingleton"), 2147483637, 0);
  v1 = (void *)AXUIRepresentedKeyboardElement_RepresentedKeyboardElement;
  AXUIRepresentedKeyboardElement_RepresentedKeyboardElement = v0;

}

@end
