@implementation RIOPxrTfTokenGetTypeID

void __RIOPxrTfTokenGetTypeID_block_invoke()
{
  if (!RIOPxrTfTokenGetTypeID::typeID)
    RIOPxrTfTokenGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
