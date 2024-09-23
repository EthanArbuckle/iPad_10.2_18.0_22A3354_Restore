@implementation BWStillImageCaptureConstantColorAnalyticsPayload

- (BWStillImageCaptureConstantColorAnalyticsPayload)init
{
  BWStillImageCaptureConstantColorAnalyticsPayload *v2;
  BWStillImageCaptureConstantColorAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureConstantColorAnalyticsPayload;
  v2 = -[BWStillImageCaptureAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStillImageCaptureConstantColorAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureConstantColorAnalyticsPayload;
  -[BWStillImageCaptureAnalyticsPayload reset](&v3, sel_reset);
  self->_constantColorApplied = 0;
  self->_constantColorCenterWeightedMeanConfidenceLevel = 0.0;
  self->_constantColorAnalyticsVersion = 0;
  self->_constantColorStrobeWhitePointRGain = 0.0;
  self->_constantColorStrobeWhitePointGGain = 0.0;
  self->_constantColorStrobeWhitePointBGain = 0.0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.StillImageCaptureConstantColor");
}

- (id)eventDictionary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWStillImageCaptureConstantColorAnalyticsPayload;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[BWStillImageCaptureAnalyticsPayload eventDictionary](&v9, sel_eventDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_constantColorApplied), CFSTR("constantColorApplied"));
  if (self->_constantColorApplied)
  {
    *(float *)&v4 = self->_constantColorCenterWeightedMeanConfidenceLevel;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("constantColorCenterWeightedMeanConfidenceLevel"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_constantColorAnalyticsVersion), CFSTR("constantColorAnalyticsVersion"));
    *(float *)&v5 = self->_constantColorStrobeWhitePointRGain;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("constantColorStrobeWhitePointRGain"));
    *(float *)&v6 = self->_constantColorStrobeWhitePointGGain;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("constantColorStrobeWhitePointGGain"));
    *(float *)&v7 = self->_constantColorStrobeWhitePointBGain;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("constantColorStrobeWhitePointBGain"));
  }
  return v3;
}

- (BOOL)constantColorApplied
{
  return self->_constantColorApplied;
}

- (void)setConstantColorApplied:(BOOL)a3
{
  self->_constantColorApplied = a3;
}

- (float)constantColorCenterWeightedMeanConfidenceLevel
{
  return self->_constantColorCenterWeightedMeanConfidenceLevel;
}

- (void)setConstantColorCenterWeightedMeanConfidenceLevel:(float)a3
{
  self->_constantColorCenterWeightedMeanConfidenceLevel = a3;
}

- (unsigned)constantColorAnalyticsVersion
{
  return self->_constantColorAnalyticsVersion;
}

- (void)setConstantColorAnalyticsVersion:(unsigned int)a3
{
  self->_constantColorAnalyticsVersion = a3;
}

- (float)constantColorStrobeWhitePointRGain
{
  return self->_constantColorStrobeWhitePointRGain;
}

- (void)setConstantColorStrobeWhitePointRGain:(float)a3
{
  self->_constantColorStrobeWhitePointRGain = a3;
}

- (float)constantColorStrobeWhitePointGGain
{
  return self->_constantColorStrobeWhitePointGGain;
}

- (void)setConstantColorStrobeWhitePointGGain:(float)a3
{
  self->_constantColorStrobeWhitePointGGain = a3;
}

- (float)constantColorStrobeWhitePointBGain
{
  return self->_constantColorStrobeWhitePointBGain;
}

- (void)setConstantColorStrobeWhitePointBGain:(float)a3
{
  self->_constantColorStrobeWhitePointBGain = a3;
}

@end
