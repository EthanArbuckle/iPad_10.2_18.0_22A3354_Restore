@implementation HMDMPCSessionControllerExecutionEvent

- (NSString)resultString
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v7;

  -[HMMLogEvent error](self, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[HMDMPCSessionControllerExecutionEvent didPartiallySucceed](self, "didPartiallySucceed");

    if (v5)
      return (NSString *)CFSTR("Partial Success");
  }
  -[HMMLogEvent error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return (NSString *)CFSTR("Failure");
  else
    return (NSString *)CFSTR("Success");
}

- (id)coreAnalyticsEventName
{
  return CFSTR("com.apple.HomeKit.daemon.media.playbackAction.execution");
}

- (id)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDMPCSessionControllerExecutionEvent;
  -[HMDMediaPlaybackActionEvent coreAnalyticsEventDictionary](&v7, sel_coreAnalyticsEventDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDMPCSessionControllerExecutionEvent resultString](self, "resultString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("executionResult"));

  return v4;
}

- (BOOL)didPartiallySucceed
{
  return self->_didPartiallySucceed;
}

- (void)setDidPartiallySucceed:(BOOL)a3
{
  self->_didPartiallySucceed = a3;
}

+ (id)identifier
{
  if (identifier_onceToken != -1)
    dispatch_once(&identifier_onceToken, &__block_literal_global_178669);
  return (id)identifier_identifier;
}

void __51__HMDMPCSessionControllerExecutionEvent_identifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)identifier_identifier;
  identifier_identifier = v0;

}

@end
