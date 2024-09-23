@implementation RIOBuilderStageDeltaGetTypeID

void __RIOBuilderStageDeltaGetTypeID_block_invoke()
{
  if (!RIOBuilderStageDeltaGetTypeID::typeID)
    RIOBuilderStageDeltaGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
