@implementation FigManifoldServerCompanionGetTypeID

uint64_t __FigManifoldServerCompanionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gServerCompanionTypeID = result;
  return result;
}

@end
