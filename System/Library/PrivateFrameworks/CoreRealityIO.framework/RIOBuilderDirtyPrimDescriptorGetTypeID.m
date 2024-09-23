@implementation RIOBuilderDirtyPrimDescriptorGetTypeID

void __RIOBuilderDirtyPrimDescriptorGetTypeID_block_invoke()
{
  if (!RIOBuilderDirtyPrimDescriptorGetTypeID::typeID)
    RIOBuilderDirtyPrimDescriptorGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
