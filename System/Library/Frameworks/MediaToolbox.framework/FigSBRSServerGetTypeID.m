@implementation FigSBRSServerGetTypeID

uint64_t __FigSBRSServerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigSBRSServerGetTypeID_typeID = result;
  return result;
}

@end
