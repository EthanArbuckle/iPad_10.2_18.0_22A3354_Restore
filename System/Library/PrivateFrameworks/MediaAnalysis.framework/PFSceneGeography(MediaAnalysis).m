@implementation PFSceneGeography(MediaAnalysis)

+ (id)vcp_sharedSceneGeography
{
  if (+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::once != -1)
    dispatch_once(&+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::once, &__block_literal_global_11);
  return (id)+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance;
}

@end
