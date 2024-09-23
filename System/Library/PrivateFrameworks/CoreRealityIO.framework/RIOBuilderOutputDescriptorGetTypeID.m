@implementation RIOBuilderOutputDescriptorGetTypeID

void __RIOBuilderOutputDescriptorGetTypeID_block_invoke()
{
  if (!RIOBuilderOutputDescriptorGetTypeID::typeID)
    RIOBuilderOutputDescriptorGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
