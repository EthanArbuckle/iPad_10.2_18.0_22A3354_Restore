@implementation BWVideoDataOutputAnalyticsPayload

- (void)setDeviceMask:(int)a3
{
  self->_deviceMask = a3;
}

- (int)deviceMask
{
  return self->_deviceMask;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (void)setHdrVideo:(BOOL)a3
{
  self->_hdrVideo = a3;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BWVideoDataOutputAnalyticsPayload)init
{
  BWVideoDataOutputAnalyticsPayload *v2;
  BWVideoDataOutputAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWVideoDataOutputAnalyticsPayload;
  v2 = -[BWVideoDataOutputAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWVideoDataOutputAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  self->_duration = 0.0;
  *(_QWORD *)&self->_deviceMask = 0;
  self->_videoMirrored = 0;
  self->_nominalFramerate = 3.4028e38;
  *(_QWORD *)&self->_height = 0x8000000080000000;

  self->_clientApplicationID = 0;
  *(_WORD *)&self->_hdrVideo = 0;
  self->_colorSpace = -1;
  self->_numberOfISPFramesDropped = 0;
  self->_numberOfFrames = 0;
  self->_numberOfFramesDropped = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoDataOutputAnalyticsPayload;
  -[BWVideoDataOutputAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (id)eventName
{
  if (self->_proresVideo)
    return CFSTR("com.apple.coremedia.camera.ProResVideoDataOutput");
  else
    return CFSTR("com.apple.coremedia.camera.VideoDataOutput");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_videoMirrored), CFSTR("videoMirrored"));
  if (self->_deviceMask)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("deviceMask"));
  if (self->_devicePosition)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("devicePosition"));
  if (self->_duration != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("duration"));
  if (self->_nominalFramerate != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("nominalFramerate"));
  if (self->_height != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("height"));
  if (self->_width != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("width"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hdrVideo), CFSTR("hdrVideo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfFramesDropped), CFSTR("numberOfFramesDropped"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfISPFramesDropped), CFSTR("numberOfISPFramesDropped"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfFrames), CFSTR("numberOfFrames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_proresVideo), CFSTR("proresVideo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_colorSpace), CFSTR("colorSpace"));
  return v3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (BOOL)videoMirrored
{
  return self->_videoMirrored;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (float)nominalFramerate
{
  return self->_nominalFramerate;
}

- (void)setNominalFramerate:(float)a3
{
  self->_nominalFramerate = a3;
}

- (int)height
{
  return self->_height;
}

- (int)width
{
  return self->_width;
}

- (BOOL)hdrVideo
{
  return self->_hdrVideo;
}

- (BOOL)proresVideo
{
  return self->_proresVideo;
}

- (void)setProresVideo:(BOOL)a3
{
  self->_proresVideo = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (unint64_t)numberOfFramesDropped
{
  return self->_numberOfFramesDropped;
}

- (void)setNumberOfFramesDropped:(unint64_t)a3
{
  self->_numberOfFramesDropped = a3;
}

- (unint64_t)numberOfISPFramesDropped
{
  return self->_numberOfISPFramesDropped;
}

- (void)setNumberOfISPFramesDropped:(unint64_t)a3
{
  self->_numberOfISPFramesDropped = a3;
}

- (unint64_t)numberOfFrames
{
  return self->_numberOfFrames;
}

- (void)setNumberOfFrames:(unint64_t)a3
{
  self->_numberOfFrames = a3;
}

@end
