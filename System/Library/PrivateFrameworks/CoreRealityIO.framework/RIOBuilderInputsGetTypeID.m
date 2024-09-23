@implementation RIOBuilderInputsGetTypeID

void __RIOBuilderInputsGetTypeID_block_invoke()
{
  if (!RIOBuilderInputsGetTypeID::typeID)
    RIOBuilderInputsGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
