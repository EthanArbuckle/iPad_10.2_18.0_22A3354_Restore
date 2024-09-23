@implementation MDLabelGetTypeID

uint64_t __MDLabelGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  MDLabelGetTypeID_typeID = result;
  return result;
}

@end
