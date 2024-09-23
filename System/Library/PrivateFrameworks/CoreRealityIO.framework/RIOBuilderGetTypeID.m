@implementation RIOBuilderGetTypeID

void __RIOBuilderGetTypeID_block_invoke()
{
  if (!RIOBuilderGetTypeID::typeID)
    RIOBuilderGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
