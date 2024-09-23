@implementation HMDCoordinationPrimaryElectionLogEvent

- (HMDCoordinationPrimaryElectionLogEvent)initWithIsPrimary:(BOOL)a3 didChangePrimary:(BOOL)a4
{
  HMDCoordinationPrimaryElectionLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCoordinationPrimaryElectionLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_isPrimary = a3;
    result->_didChangePrimary = a4;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.CoordinationPrimaryElection");
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDCoordinationPrimaryElectionLogEvent isPrimary](self, "isPrimary"))
    v4 = &unk_24E96A148;
  else
    v4 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isPrimary"));
  if (-[HMDCoordinationPrimaryElectionLogEvent didChangePrimary](self, "didChangePrimary"))
    v5 = &unk_24E96A148;
  else
    v5 = &unk_24E96A160;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("didChangePrimary"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v6;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)didChangePrimary
{
  return self->_didChangePrimary;
}

@end
