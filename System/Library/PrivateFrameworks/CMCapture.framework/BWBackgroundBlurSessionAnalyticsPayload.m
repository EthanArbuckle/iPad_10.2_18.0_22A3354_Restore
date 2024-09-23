@implementation BWBackgroundBlurSessionAnalyticsPayload

- (BWBackgroundBlurSessionAnalyticsPayload)init
{
  BWBackgroundBlurSessionAnalyticsPayload *v2;
  BWBackgroundBlurSessionAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWBackgroundBlurSessionAnalyticsPayload;
  v2 = -[BWBackgroundBlurSessionAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWBackgroundBlurSessionAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBackgroundBlurSessionAnalyticsPayload;
  -[BWBackgroundBlurSessionAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  *(_OWORD *)&self->_numberOfFrames = 0u;
  *(_OWORD *)&self->_averageProcessingTime = 0u;
  *(_OWORD *)&self->_clientApplicationID = 0u;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.BackgroundBlurSession");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_effectQuality), CFSTR("averageQuality"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageProcessingTime), CFSTR("averageProcessingTime"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxProcessingTime), CFSTR("maxProcessingTime"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numberOfFrames), CFSTR("numberOfFrames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfFrameDrops), CFSTR("numberOfFrameDrops"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxThermalSystemPressureLevel), CFSTR("maxThermalSystemPressurelLevel"));
  return v3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->_effectQuality = a3;
}

- (double)averageProcessingTime
{
  return self->_averageProcessingTime;
}

- (void)setAverageProcessingTime:(double)a3
{
  self->_averageProcessingTime = a3;
}

- (double)maxProcessingTime
{
  return self->_maxProcessingTime;
}

- (void)setMaxProcessingTime:(double)a3
{
  self->_maxProcessingTime = a3;
}

- (int64_t)numberOfFrames
{
  return self->_numberOfFrames;
}

- (void)setNumberOfFrames:(int64_t)a3
{
  self->_numberOfFrames = a3;
}

- (int)numberOfFrameDrops
{
  return self->_numberOfFrameDrops;
}

- (void)setNumberOfFrameDrops:(int)a3
{
  self->_numberOfFrameDrops = a3;
}

- (int)maxThermalSystemPressureLevel
{
  return self->_maxThermalSystemPressureLevel;
}

- (void)setMaxThermalSystemPressureLevel:(int)a3
{
  self->_maxThermalSystemPressureLevel = a3;
}

@end
