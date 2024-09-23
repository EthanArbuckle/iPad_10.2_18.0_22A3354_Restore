@implementation CMSContentFailureRecoveryEvent

- (CMSContentFailureRecoveryEvent)initWithSessionID:(id)a3 sessionIdentifier:(id)a4 recoveryDuration:(unint64_t)a5
{
  CMSContentFailureRecoveryEvent *v5;
  CMSContentFailureRecoveryEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMSContentFailureRecoveryEvent;
  v5 = -[CMSBaseContentFailureEvent initWithServiceID:sessionIdentifier:](&v8, sel_initWithServiceID_sessionIdentifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CMSBaseContentFailureEvent setEventName:](v5, "setEventName:", CFSTR("com.apple.cloudmediaservices.contentFailureRecovery"));
    v6->_recoveryDuration = 0;
  }
  return v6;
}

- (id)encoded
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMSContentFailureRecoveryEvent;
  -[CMSBaseContentFailureEvent encoded](&v7, sel_encoded);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_recoveryDuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("recoveryDuration"));

  return v4;
}

- (unint64_t)recoveryDuration
{
  return self->_recoveryDuration;
}

- (void)setRecoveryDuration:(unint64_t)a3
{
  self->_recoveryDuration = a3;
}

@end
