@implementation FigDataQueueServerStateGetTypeID

uint64_t __FigDataQueueServerStateGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigDataQueueServerStateGetTypeID_sDataQueueServerStateTypeID = result;
  return result;
}

@end
