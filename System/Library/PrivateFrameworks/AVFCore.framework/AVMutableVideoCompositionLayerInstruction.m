@implementation AVMutableVideoCompositionLayerInstruction

+ (AVMutableVideoCompositionLayerInstruction)videoCompositionLayerInstructionWithAssetTrack:(AVAssetTrack *)track
{
  AVMutableVideoCompositionLayerInstruction *v4;

  v4 = (AVMutableVideoCompositionLayerInstruction *)objc_alloc_init((Class)a1);
  if (track)
    -[AVMutableVideoCompositionLayerInstruction setTrackID:](v4, "setTrackID:", -[AVAssetTrack trackID](track, "trackID"));
  return v4;
}

+ (AVMutableVideoCompositionLayerInstruction)videoCompositionLayerInstruction
{
  return (AVMutableVideoCompositionLayerInstruction *)objc_alloc_init((Class)a1);
}

- (CMPersistentTrackID)trackID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  return -[AVVideoCompositionLayerInstruction trackID](&v3, sel_trackID);
}

- (void)setTrackID:(CMPersistentTrackID)trackID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  -[AVVideoCompositionLayerInstruction setTrackID:](&v3, sel_setTrackID_, *(_QWORD *)&trackID);
}

- (void)setTransform:(CGAffineTransform *)transform atTime:(CMTime *)time
{
  __int128 v4;
  CMTime v5;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  v4 = *(_OWORD *)&transform->c;
  v6[0] = *(_OWORD *)&transform->a;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&transform->tx;
  v5 = *time;
  -[AVVideoCompositionLayerInstruction setTransform:atTime:](&v7, sel_setTransform_atTime_, v6, &v5);
}

- (void)setTransformRampFromStartTransform:(CGAffineTransform *)startTransform toEndTransform:(CGAffineTransform *)endTransform timeRange:(CMTimeRange *)timeRange
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  _OWORD v9[3];
  _OWORD v10[3];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  v5 = *(_OWORD *)&startTransform->c;
  v10[0] = *(_OWORD *)&startTransform->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&startTransform->tx;
  v6 = *(_OWORD *)&endTransform->c;
  v9[0] = *(_OWORD *)&endTransform->a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&endTransform->tx;
  v7 = *(_OWORD *)&timeRange->start.epoch;
  v8[0] = *(_OWORD *)&timeRange->start.value;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVVideoCompositionLayerInstruction setTransformRampFromStartTransform:toEndTransform:timeRange:](&v11, sel_setTransformRampFromStartTransform_toEndTransform_timeRange_, v10, v9, v8);
}

- (void)setOpacity:(float)opacity atTime:(CMTime *)time
{
  CMTime v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  v4 = *time;
  -[AVVideoCompositionLayerInstruction setOpacity:atTime:](&v5, sel_setOpacity_atTime_, &v4);
}

- (void)setOpacityRampFromStartOpacity:(float)startOpacity toEndOpacity:(float)endOpacity timeRange:(CMTimeRange *)timeRange
{
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  v5 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVVideoCompositionLayerInstruction setOpacityRampFromStartOpacity:toEndOpacity:timeRange:](&v7, sel_setOpacityRampFromStartOpacity_toEndOpacity_timeRange_, v6);
}

- (void)setCropRectangle:(CGRect)cropRectangle atTime:(CMTime *)time
{
  CMTime v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  v4 = *time;
  -[AVVideoCompositionLayerInstruction setCropRectangle:atTime:](&v5, sel_setCropRectangle_atTime_, &v4, cropRectangle.origin.x, cropRectangle.origin.y, cropRectangle.size.width, cropRectangle.size.height);
}

- (void)setCropRectangleRampFromStartCropRectangle:(CGRect)startCropRectangle toEndCropRectangle:(CGRect)endCropRectangle timeRange:(CMTimeRange *)timeRange
{
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  v5 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVVideoCompositionLayerInstruction setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:](&v7, sel_setCropRectangleRampFromStartCropRectangle_toEndCropRectangle_timeRange_, v6, startCropRectangle.origin.x, startCropRectangle.origin.y, startCropRectangle.size.width, startCropRectangle.size.height, endCropRectangle.origin.x, endCropRectangle.origin.y, endCropRectangle.size.width, endCropRectangle.size.height);
}

@end
