@implementation RIOPxrUsdObjectGetTypeID

void __RIOPxrUsdObjectGetTypeID_block_invoke()
{
  if (!RIOPxrUsdObjectGetTypeID::typeID)
    RIOPxrUsdObjectGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
