@implementation GCHIDEventUIKitClient

void __40___GCHIDEventUIKitClient_initWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  IOHIDEventGetSenderID();
  IOHIDEventGetTimeStamp();
  IOHIDEventGetType();
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "publishHIDEvent:", a2);

}

@end
