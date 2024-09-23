@implementation RIOBuilderDirtyPropertyDescriptorGetTypeID

void __RIOBuilderDirtyPropertyDescriptorGetTypeID_block_invoke()
{
  if (!RIOBuilderDirtyPropertyDescriptorGetTypeID::typeID)
    RIOBuilderDirtyPropertyDescriptorGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
