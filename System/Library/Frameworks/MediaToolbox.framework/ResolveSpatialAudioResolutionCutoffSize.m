@implementation ResolveSpatialAudioResolutionCutoffSize

uint64_t __fpfsi_ResolveSpatialAudioResolutionCutoffSize_block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = FigGetCFPreferenceSizeWithDefault();
  fpfsi_ResolveSpatialAudioResolutionCutoffSize_defaultSpatialAudioResolutionCutoffSize_0 = v1;
  fpfsi_ResolveSpatialAudioResolutionCutoffSize_defaultSpatialAudioResolutionCutoffSize_1 = v2;
  return result;
}

@end
