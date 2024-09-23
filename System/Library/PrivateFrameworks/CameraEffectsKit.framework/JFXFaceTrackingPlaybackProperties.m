@implementation JFXFaceTrackingPlaybackProperties

- (JFXFaceTrackingPlaybackProperties)initWithNonFaceTrackableMediaTimeRange:(id *)a3
{
  JFXFaceTrackingPlaybackProperties *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXFaceTrackingPlaybackProperties;
  result = -[JFXFaceTrackingPlaybackProperties init](&v7, sel_init);
  if (result)
  {
    result->_canTrackFace = 0;
    v5 = *(_OWORD *)&a3->var0.var0;
    v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_mediaTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_mediaTimeRange.start.epoch = v6;
    *(_OWORD *)&result->_mediaTimeRange.start.value = v5;
    result->_mediaInterfaceOrientationForDisplay = 0;
  }
  return result;
}

- (JFXFaceTrackingPlaybackProperties)initWithFaceTrackableMediaTimeRange:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4 faceTrackingTransform:(id)a5 arMetadata:(id)a6
{
  id v11;
  id v12;
  JFXFaceTrackingPlaybackProperties *v13;
  JFXFaceTrackingPlaybackProperties *v14;
  __int128 v15;
  __int128 v16;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)JFXFaceTrackingPlaybackProperties;
  v13 = -[JFXFaceTrackingPlaybackProperties init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_canTrackFace = 1;
    v13->_mediaInterfaceOrientationForDisplay = a4;
    objc_storeStrong((id *)&v13->_faceTrackingTransform, a5);
    v15 = *(_OWORD *)&a3->var0.var0;
    v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v14->_mediaTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&v14->_mediaTimeRange.start.epoch = v16;
    *(_OWORD *)&v14->_mediaTimeRange.start.value = v15;
    objc_storeStrong((id *)&v14->_arMetadata, a6);
  }

  return v14;
}

- (BOOL)containsMediaTime:(id *)a3 forDisplayingMediaAtInterfaceOrientation:(int64_t)a4
{
  int v7;
  CMTimeRange v9;
  CMTime time;
  CMTimeRange range;

  if (-[JFXFaceTrackingPlaybackProperties canTrackFace](self, "canTrackFace"))
  {
    -[JFXFaceTrackingPlaybackProperties mediaTimeRange](self, "mediaTimeRange");
    time = (CMTime)*a3;
    v7 = CMTimeRangeContainsTime(&v9, &time);
    if (v7)
      LOBYTE(v7) = -[JFXFaceTrackingPlaybackProperties mediaInterfaceOrientationForDisplay](self, "mediaInterfaceOrientationForDisplay") == a4;
  }
  else
  {
    -[JFXFaceTrackingPlaybackProperties mediaTimeRange](self, "mediaTimeRange");
    time = (CMTime)*a3;
    LOBYTE(v7) = CMTimeRangeContainsTime(&range, &time) != 0;
  }
  return v7;
}

- (BOOL)canTrackFace
{
  return self->_canTrackFace;
}

- (JFXFaceTrackedEffectTransform)faceTrackingTransform
{
  return self->_faceTrackingTransform;
}

- ($70930193D4F448A53BB9343C0237EB5F)mediaTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (JFXARMetadata)arMetadata
{
  return self->_arMetadata;
}

- (int64_t)mediaInterfaceOrientationForDisplay
{
  return self->_mediaInterfaceOrientationForDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arMetadata, 0);
  objc_storeStrong((id *)&self->_faceTrackingTransform, 0);
}

@end
