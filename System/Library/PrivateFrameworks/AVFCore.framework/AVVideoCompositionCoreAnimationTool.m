@implementation AVVideoCompositionCoreAnimationTool

- (AVVideoCompositionCoreAnimationTool)initWithMagicTrackID:(int)a3 animationLayer:(id)a4 videoLayers:(id)a5
{
  AVVideoCompositionCoreAnimationTool *v8;
  AVVideoCompositionCoreAnimationToolInternal *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVVideoCompositionCoreAnimationTool;
  v8 = -[AVVideoCompositionCoreAnimationTool init](&v11, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(AVVideoCompositionCoreAnimationToolInternal);
    v8->_videoCompositionTool = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_videoCompositionTool->way = a3 == 0;
      v8->_videoCompositionTool->animationLayer = (CALayer *)a4;
      v8->_videoCompositionTool->auxiliaryTrackID = a3;
      v8->_videoCompositionTool->postProcessingVideoLayers = (NSArray *)objc_msgSend(a5, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithAdditionalLayer:(CALayer *)layer asTrackID:(CMPersistentTrackID)trackID
{
  return (AVVideoCompositionCoreAnimationTool *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMagicTrackID:animationLayer:videoLayers:", *(_QWORD *)&trackID, layer, 0);
}

+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:(CALayer *)videoLayer inLayer:(CALayer *)animationLayer
{
  id v6;

  v6 = objc_alloc((Class)a1);
  return (AVVideoCompositionCoreAnimationTool *)(id)objc_msgSend(v6, "initWithMagicTrackID:animationLayer:videoLayers:", 0, animationLayer, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", videoLayer));
}

+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers:(NSArray *)videoLayers inLayer:(CALayer *)animationLayer
{
  return (AVVideoCompositionCoreAnimationTool *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMagicTrackID:animationLayer:videoLayers:", 0, animationLayer, videoLayers);
}

- (void)dealloc
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;
  objc_super v4;

  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool)
  {

    CFRelease(self->_videoCompositionTool);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoCompositionCoreAnimationTool;
  -[AVVideoCompositionCoreAnimationTool dealloc](&v4, sel_dealloc);
}

- (BOOL)_hasLayerAsAuxiliaryTrack
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;

  videoCompositionTool = self->_videoCompositionTool;
  return !videoCompositionTool->way && videoCompositionTool->animationLayer != 0;
}

- (id)_auxiliaryTrackLayer
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;

  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way)
    return 0;
  else
    return videoCompositionTool->animationLayer;
}

- (int)_auxiliaryTrackID
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;

  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way)
    return 0;
  else
    return videoCompositionTool->auxiliaryTrackID;
}

- (BOOL)_hasPostProcessingLayers
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;

  videoCompositionTool = self->_videoCompositionTool;
  return videoCompositionTool->way == 1 && videoCompositionTool->animationLayer != 0;
}

- (id)_postProcessingRootLayer
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;

  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way == 1)
    return videoCompositionTool->animationLayer;
  else
    return 0;
}

- (id)_postProcessingVideoLayers
{
  AVVideoCompositionCoreAnimationToolInternal *videoCompositionTool;

  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way == 1)
    return videoCompositionTool->postProcessingVideoLayers;
  else
    return 0;
}

@end
