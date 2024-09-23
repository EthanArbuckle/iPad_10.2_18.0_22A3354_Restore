@implementation BWISPStartupAnalyticsPayload

- (void)setIspStartupTime:(int)a3
{
  self->_ispStartupTime = a3;
}

- (BWISPStartupAnalyticsPayload)init
{
  BWISPStartupAnalyticsPayload *v2;
  BWISPStartupAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWISPStartupAnalyticsPayload;
  v2 = -[BWISPStartupAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWISPStartupAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  self->_ispStartupTime = -1;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.ISPStartup");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ispStartupTime), CFSTR("ispStartupTime"));
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWISPStartupAnalyticsPayload;
  -[BWISPStartupAnalyticsPayload dealloc](&v2, sel_dealloc);
}

- (int)ispStartupTime
{
  return self->_ispStartupTime;
}

@end
