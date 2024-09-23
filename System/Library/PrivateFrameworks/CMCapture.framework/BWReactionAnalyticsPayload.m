@implementation BWReactionAnalyticsPayload

- (BWReactionAnalyticsPayload)init
{
  BWReactionAnalyticsPayload *v2;
  BWReactionAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWReactionAnalyticsPayload;
  v2 = -[BWReactionAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWReactionAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWReactionAnalyticsPayload;
  -[BWReactionAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  self->_reactionType = 0;
  self->_uiTriggeredReaction = 0;

  self->_clientApplicationID = 0;
  self->_continuityCameraClientDeviceClass = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.Reaction");
}

- (id)eventDictionary
{
  void *v3;
  int continuityCameraClientDeviceClass;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_reactionType, CFSTR("reactionType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_uiTriggeredReaction), CFSTR("uiTriggeredReaction"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  continuityCameraClientDeviceClass = self->_continuityCameraClientDeviceClass;
  v5 = CFSTR("AppleTV");
  if (continuityCameraClientDeviceClass != 4)
    v5 = 0;
  if (continuityCameraClientDeviceClass == 100)
    v6 = CFSTR("Mac");
  else
    v6 = v5;
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("continuityCameraClientDeviceClass"));
  return v3;
}

- (NSString)reactionType
{
  return self->_reactionType;
}

- (void)setReactionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)uiTriggeredReaction
{
  return self->_uiTriggeredReaction;
}

- (void)setUiTriggeredReaction:(BOOL)a3
{
  self->_uiTriggeredReaction = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_continuityCameraClientDeviceClass = a3;
}

@end
