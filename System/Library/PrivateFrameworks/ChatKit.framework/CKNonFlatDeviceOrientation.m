@implementation CKNonFlatDeviceOrientation

void *__CKNonFlatDeviceOrientation_block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("BKHIDServicesGetNonFlatDeviceOrientation", CFSTR("BackBoardServices"));
  CKNonFlatDeviceOrientation__BKHIDServicesGetNonFlatDeviceOrientation = result;
  return result;
}

@end
