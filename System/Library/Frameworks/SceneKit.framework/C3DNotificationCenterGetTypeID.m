@implementation C3DNotificationCenterGetTypeID

uint64_t __C3DNotificationCenterGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DNotificationCenterGetTypeID_typeID = result;
  return result;
}

@end
