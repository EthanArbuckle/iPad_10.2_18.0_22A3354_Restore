@implementation FigDataChannelGroupGetTypeID

uint64_t __FigDataChannelGroupGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigDataChannelGroupGetTypeID_sDataChannelGroupTypeID = result;
  return result;
}

@end
