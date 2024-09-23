@implementation RIOPxrVtValueGetTypeID

void __RIOPxrVtValueGetTypeID_block_invoke()
{
  if (!RIOPxrVtValueGetTypeID::typeID)
    RIOPxrVtValueGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
