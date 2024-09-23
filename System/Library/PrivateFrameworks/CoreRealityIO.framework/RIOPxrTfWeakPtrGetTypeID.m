@implementation RIOPxrTfWeakPtrGetTypeID

void __RIOPxrTfWeakPtrGetTypeID_block_invoke()
{
  if (!RIOPxrTfWeakPtrGetTypeID::typeID)
    RIOPxrTfWeakPtrGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
