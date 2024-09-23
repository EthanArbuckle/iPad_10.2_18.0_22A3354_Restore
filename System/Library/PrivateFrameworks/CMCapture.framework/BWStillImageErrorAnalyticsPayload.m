@implementation BWStillImageErrorAnalyticsPayload

- (BWStillImageErrorAnalyticsPayload)init
{
  BWStillImageErrorAnalyticsPayload *v2;
  BWStillImageErrorAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageErrorAnalyticsPayload;
  v2 = -[BWStillImageAnalyticsPayloadCommon init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStillImageErrorAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageErrorAnalyticsPayload;
  -[BWStillImageAnalyticsPayloadCommon reset](&v3, sel_reset);
  self->_error = 0;
  self->_digitalZoomRatioFromSource = 3.4028e38;
}

- (id)eventName
{
  if (-[BWStillImageAnalyticsPayloadCommon deferred](self, "deferred"))
    return CFSTR("com.apple.coremedia.camera.DeferredPhotoCapture");
  else
    return CFSTR("com.apple.coremedia.camera.PhotoCapture");
}

- (id)eventDictionary
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageErrorAnalyticsPayload;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[BWStillImageAnalyticsPayloadCommon eventDictionary](&v5, sel_eventDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_error), CFSTR("error"));
  if (self->_digitalZoomRatioFromSource != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("digitalZoomRatioFromSource"));
  return v3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (float)digitalZoomRatioFromSource
{
  return self->_digitalZoomRatioFromSource;
}

- (void)setDigitalZoomRatioFromSource:(float)a3
{
  self->_digitalZoomRatioFromSource = a3;
}

@end
