@implementation BWStereoVideoCaptureAnalyticsPayload

- (BWStereoVideoCaptureAnalyticsPayload)init
{
  BWStereoVideoCaptureAnalyticsPayload *v2;
  BWStereoVideoCaptureAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStereoVideoCaptureAnalyticsPayload;
  v2 = -[BWStereoVideoCaptureAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStereoVideoCaptureAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.StereoVideoCapture");
}

- (id)eventDictionary
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (self->_videoOrientation)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("videoOrientation"));
  if (self->_cameraPosture)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("cameraPosture"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stereoVideoCaptureEnabled), CFSTR("stereoVideoCaptureEnabled"));
  if (self->_stereoVideoCaptureEnabled)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stereoVideoCaptureStatus), CFSTR("stereoVideoCaptureStatus"));
    *(float *)&v4 = self->_stereoVideoCaptureDuration;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("stereoVideoCaptureDuration"));
    *(float *)&v5 = self->_percentageOfFramesWithAggressiveLuxLevel;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("percentageOfFramesWithAggressiveLuxLevel"));
    *(float *)&v6 = self->_percentageOfFramesWithAggressiveFocusDistance;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("percentageOfFramesWithAggressiveFocusDistance"));
  }
  return v3;
}

- (void)reset
{
  self->_stereoVideoCaptureEnabled = 0;
  *(_QWORD *)&self->_videoOrientation = 0;
  self->_stereoVideoCaptureStatus = 1;
  *(_QWORD *)&self->_stereoVideoCaptureDuration = 0;
  self->_percentageOfFramesWithAggressiveFocusDistance = 0.0;
}

- (int)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int)a3
{
  self->_videoOrientation = a3;
}

- (int)cameraPosture
{
  return self->_cameraPosture;
}

- (void)setCameraPosture:(int)a3
{
  self->_cameraPosture = a3;
}

- (BOOL)stereoVideoCaptureEnabled
{
  return self->_stereoVideoCaptureEnabled;
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  self->_stereoVideoCaptureEnabled = a3;
}

- (int)stereoVideoCaptureStatus
{
  return self->_stereoVideoCaptureStatus;
}

- (void)setStereoVideoCaptureStatus:(int)a3
{
  self->_stereoVideoCaptureStatus = a3;
}

- (float)stereoVideoCaptureDuration
{
  return self->_stereoVideoCaptureDuration;
}

- (void)setStereoVideoCaptureDuration:(float)a3
{
  self->_stereoVideoCaptureDuration = a3;
}

- (float)percentageOfFramesWithAggressiveLuxLevel
{
  return self->_percentageOfFramesWithAggressiveLuxLevel;
}

- (void)setPercentageOfFramesWithAggressiveLuxLevel:(float)a3
{
  self->_percentageOfFramesWithAggressiveLuxLevel = a3;
}

- (float)percentageOfFramesWithAggressiveFocusDistance
{
  return self->_percentageOfFramesWithAggressiveFocusDistance;
}

- (void)setPercentageOfFramesWithAggressiveFocusDistance:(float)a3
{
  self->_percentageOfFramesWithAggressiveFocusDistance = a3;
}

@end
