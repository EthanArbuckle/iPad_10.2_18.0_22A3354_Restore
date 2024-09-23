@implementation RIOBuilderOutputsGetTypeID

void __RIOBuilderOutputsGetTypeID_block_invoke()
{
  if (!RIOBuilderOutputsGetTypeID::typeID)
    RIOBuilderOutputsGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
