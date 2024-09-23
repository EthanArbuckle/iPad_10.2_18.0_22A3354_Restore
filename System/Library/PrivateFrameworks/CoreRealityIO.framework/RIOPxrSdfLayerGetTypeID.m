@implementation RIOPxrSdfLayerGetTypeID

void __RIOPxrSdfLayerGetTypeID_block_invoke()
{
  if (!RIOPxrSdfLayerGetTypeID::typeID)
    RIOPxrSdfLayerGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
