@implementation FigUserExperienceScorerGetClassID

uint64_t __FigUserExperienceScorerGetClassID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  sFigUserExperienceScorerID = result;
  return result;
}

@end
