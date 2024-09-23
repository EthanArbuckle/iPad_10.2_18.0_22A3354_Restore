@implementation AVSampleBufferDisplayLayer(AVPictureInPictureSuppport)

- (AVSampleBufferDisplayLayerPlayerController)avkit_sampleBufferDisplayLayerPlayerController
{
  AVSampleBufferDisplayLayerPlayerController *v2;

  objc_getAssociatedObject(a1, "AVSBDLPlayerControllerKey");
  v2 = (AVSampleBufferDisplayLayerPlayerController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AVSampleBufferDisplayLayerPlayerController);
    objc_setAssociatedObject(a1, "AVSBDLPlayerControllerKey", v2, 0);
  }
  return v2;
}

- (void)avkit_removePictureInPicturePlayerController
{
  objc_setAssociatedObject(a1, "AVSBDLPlayerControllerKey", 0, 0);
}

@end
