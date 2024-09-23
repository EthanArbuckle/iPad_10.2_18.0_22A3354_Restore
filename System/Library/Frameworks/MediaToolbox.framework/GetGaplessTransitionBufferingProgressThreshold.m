@implementation GetGaplessTransitionBufferingProgressThreshold

uint64_t __fpfs_GetGaplessTransitionBufferingProgressThreshold_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = FigGetCFPreferenceDoubleWithDefault();
  gGaplessTransitionBufferingProgressThreshold = v1;
  return result;
}

@end
