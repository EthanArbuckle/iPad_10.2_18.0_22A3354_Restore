@implementation CMSContentFailureEvent

- (CMSContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4 errorCode:(int64_t)a5 doesServiceSupportPlaybackFailureRecovery:(BOOL)a6
{
  CMSContentFailureEvent *v8;
  CMSContentFailureEvent *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMSContentFailureEvent;
  v8 = -[CMSBaseContentFailureEvent initWithServiceID:sessionIdentifier:](&v11, sel_initWithServiceID_sessionIdentifier_, a3, a4);
  v9 = v8;
  if (v8)
  {
    -[CMSBaseContentFailureEvent setEventName:](v8, "setEventName:", CFSTR("com.apple.cloudmediaservices.contentFailure"));
    v9->_errorCode = a5;
    v9->_doesServiceSupportPlaybackFailureRecovery = a6;
    v9->_didReachMaxRetries = 0;
  }
  return v9;
}

- (CMSContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4 errorCode:(int64_t)a5
{
  return -[CMSContentFailureEvent initWithServiceID:sessionIdentifier:errorCode:doesServiceSupportPlaybackFailureRecovery:](self, "initWithServiceID:sessionIdentifier:errorCode:doesServiceSupportPlaybackFailureRecovery:", a3, a4, a5, 0);
}

- (id)encoded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMSContentFailureEvent;
  -[CMSBaseContentFailureEvent encoded](&v9, sel_encoded);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_errorCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didReachMaxRetries);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("didReachMaxRetries"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_doesServiceSupportPlaybackFailureRecovery);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("doesServiceSupportPlaybackFailureRecovery"));

  return v4;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (BOOL)didReachMaxRetries
{
  return self->_didReachMaxRetries;
}

- (void)setDidReachMaxRetries:(BOOL)a3
{
  self->_didReachMaxRetries = a3;
}

- (BOOL)doesServiceSupportPlaybackFailureRecovery
{
  return self->_doesServiceSupportPlaybackFailureRecovery;
}

- (void)setDoesServiceSupportPlaybackFailureRecovery:(BOOL)a3
{
  self->_doesServiceSupportPlaybackFailureRecovery = a3;
}

@end
