@implementation FigNeroPlayServerGetTypeID

uint64_t __FigNeroPlayServerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigNeroPlayServerGetTypeID_sFigNeroPlayServerTypeID = result;
  return result;
}

@end
