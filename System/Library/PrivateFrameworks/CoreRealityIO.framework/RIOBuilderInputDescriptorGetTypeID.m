@implementation RIOBuilderInputDescriptorGetTypeID

void __RIOBuilderInputDescriptorGetTypeID_block_invoke()
{
  if (!RIOBuilderInputDescriptorGetTypeID::typeID)
    RIOBuilderInputDescriptorGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
