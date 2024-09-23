@implementation RIOBuilderInputsDescriptorGetTypeID

void __RIOBuilderInputsDescriptorGetTypeID_block_invoke()
{
  if (!RIOBuilderInputsDescriptorGetTypeID::typeID)
    RIOBuilderInputsDescriptorGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
