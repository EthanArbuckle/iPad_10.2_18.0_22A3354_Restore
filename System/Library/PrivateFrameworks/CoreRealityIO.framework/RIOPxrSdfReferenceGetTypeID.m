@implementation RIOPxrSdfReferenceGetTypeID

void __RIOPxrSdfReferenceGetTypeID_block_invoke()
{
  if (!RIOPxrSdfReferenceGetTypeID::typeID)
    RIOPxrSdfReferenceGetTypeID::typeID = _CFRuntimeRegisterClass();
}

@end
