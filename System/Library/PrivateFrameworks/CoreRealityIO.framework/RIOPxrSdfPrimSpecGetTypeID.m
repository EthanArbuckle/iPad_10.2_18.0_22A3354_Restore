@implementation RIOPxrSdfPrimSpecGetTypeID

void __RIOPxrSdfPrimSpecGetTypeID_block_invoke()
{
  if (!RIOPxrSdfPrimSpecGetTypeID::typeID)
    RIOPxrSdfPrimSpecGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
