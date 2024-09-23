@implementation RIOBuilderPropertyDeltaGetTypeID

void __RIOBuilderPropertyDeltaGetTypeID_block_invoke()
{
  if (!RIOBuilderPropertyDeltaGetTypeID::typeID)
    RIOBuilderPropertyDeltaGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
