@implementation FigNeroGetTypeID

uint64_t __FigNeroGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigNeroGetTypeID_sNeroTypeID = result;
  return result;
}

@end
