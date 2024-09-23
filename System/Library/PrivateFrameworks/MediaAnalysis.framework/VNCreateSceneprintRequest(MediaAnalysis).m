@implementation VNCreateSceneprintRequest(MediaAnalysis)

+ (uint64_t)vcp_sceneRequest
{
  return objc_msgSend(MEMORY[0x1E0CEDF50], "vcp_sceneRequestWithRequestClass:andRevision:", objc_opt_class(), 3737841671);
}

+ (uint64_t)vcp_sceneRequestForWallpaper
{
  return 0;
}

@end
