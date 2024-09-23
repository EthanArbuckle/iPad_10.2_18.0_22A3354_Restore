@implementation VNClassifyImageRequest(MediaAnalysis)

+ (id)vcp_sceneRequest
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CEDF50], "vcp_sceneRequestWithRequestClass:andRevision:", objc_opt_class(), 3737841667);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setMaximumLeafObservations:", 15);
  objc_msgSend(v0, "setMaximumHierarchicalObservations:", 15);
  return v0;
}

@end
