@implementation RIOBuilderPrimDeltaGetTypeID

void __RIOBuilderPrimDeltaGetTypeID_block_invoke()
{
  if (!RIOBuilderPrimDeltaGetTypeID::typeID)
    RIOBuilderPrimDeltaGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
