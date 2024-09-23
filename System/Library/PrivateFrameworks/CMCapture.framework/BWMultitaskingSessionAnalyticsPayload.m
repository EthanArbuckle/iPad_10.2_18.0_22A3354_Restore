@implementation BWMultitaskingSessionAnalyticsPayload

- (BOOL)windowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (void)setPipEnabled:(BOOL)a3
{
  self->_pipEnabled = a3;
}

- (BOOL)pipEnabled
{
  return self->_pipEnabled;
}

- (void)reset
{

  self->_clientApplicationID = 0;
  *(_WORD *)&self->_windowed = 0;
}

- (BWMultitaskingSessionAnalyticsPayload)init
{
  BWMultitaskingSessionAnalyticsPayload *v2;
  BWMultitaskingSessionAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWMultitaskingSessionAnalyticsPayload;
  v2 = -[BWMultitaskingSessionAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWMultitaskingSessionAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMultitaskingSessionAnalyticsPayload;
  -[BWMultitaskingSessionAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.MultitaskingSession");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_windowed), CFSTR("windowed"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pipEnabled), CFSTR("pipEnabled"));
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

@end
