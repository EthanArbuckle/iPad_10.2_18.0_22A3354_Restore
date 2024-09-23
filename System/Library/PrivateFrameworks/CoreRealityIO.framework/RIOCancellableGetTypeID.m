@implementation RIOCancellableGetTypeID

void __RIOCancellableGetTypeID_block_invoke()
{
  if (!RIOCancellableGetTypeID::typeID)
    RIOCancellableGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
