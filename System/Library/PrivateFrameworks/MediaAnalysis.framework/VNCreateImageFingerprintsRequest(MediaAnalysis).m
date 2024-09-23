@implementation VNCreateImageFingerprintsRequest(MediaAnalysis)

+ (uint64_t)vcp_sceneRequest
{
  return objc_msgSend(MEMORY[0x1E0CEDF50], "vcp_sceneRequestWithRequestClass:andRevision:", objc_opt_class(), 1);
}

@end
