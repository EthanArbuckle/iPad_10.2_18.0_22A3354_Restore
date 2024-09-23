@implementation ARImageTrackingTechnique

- (ARImageTrackingTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4
{
  return -[ARImageTrackingTechnique initWithReferenceImages:maximumNumberOfTrackedImages:deterministicMode:](self, "initWithReferenceImages:maximumNumberOfTrackedImages:deterministicMode:", a3, a4, 0);
}

- (ARImageTrackingTechnique)initWithReferenceImages:(id)a3 maximumNumberOfTrackedImages:(int64_t)a4 deterministicMode:(BOOL)a5
{
  id v7;
  void *v8;
  ARImageTrackingTechnique *v9;
  ARImageTrackingTechnique *v10;
  objc_super v12;

  v7 = a3;
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.ARImageTrackingTechnique");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)ARImageTrackingTechnique;
  v9 = -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:continuousDetection:processingQueue:](&v12, sel_initWithReferenceImages_maximumNumberOfTrackedImages_continuousDetection_processingQueue_, v7, a4, 0, v8);
  v10 = v9;
  if (v9)
    v9->super._needsWorldTrackingPoseData = 0;

  return v10;
}

@end
