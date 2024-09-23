@implementation HMDPrimaryResidentDiscoveryLogEvent

- (HMDPrimaryResidentDiscoveryLogEvent)initWithHomeUUID:(id)a3
{
  HMDPrimaryResidentDiscoveryLogEvent *v3;
  HMDPrimaryResidentDiscoveryLogEvent *v4;
  NSError *residentChannelActiveResolvePrimaryError;
  NSError *accountMessageError;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDPrimaryResidentDiscoveryLogEvent;
  v3 = -[HMMHomeLogEvent initWithHomeUUID:](&v8, sel_initWithHomeUUID_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_residentChannelActive = 0;
    v3->_residentChannelActiveNoPrimaryResolved = 0;
    residentChannelActiveResolvePrimaryError = v3->_residentChannelActiveResolvePrimaryError;
    v3->_residentChannelActiveResolvePrimaryError = 0;

    v4->_accountMessageSent = 0;
    v4->_accountMessageNoPrimaryResolved = 0;
    accountMessageError = v4->_accountMessageError;
    v4->_accountMessageError = 0;

  }
  return v4;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.primary.resident.discovery");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[9];
  _QWORD v14[10];

  v14[9] = *MEMORY[0x24BDAC8D0];
  v14[0] = &unk_24E96D100;
  v13[0] = CFSTR("primaryResidentDiscoveryCount");
  v13[1] = CFSTR("residentChannelActiveCount");
  if (-[HMDPrimaryResidentDiscoveryLogEvent residentChannelActive](self, "residentChannelActive"))
    v3 = &unk_24E96D100;
  else
    v3 = &unk_24E96D118;
  v14[1] = v3;
  v13[2] = CFSTR("residentChannelActiveBool");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent residentChannelActive](self, "residentChannelActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  v13[3] = CFSTR("residentChannelActiveNoPrimaryResolvedCount");
  if (-[HMDPrimaryResidentDiscoveryLogEvent residentChannelActiveNoPrimaryResolved](self, "residentChannelActiveNoPrimaryResolved"))
  {
    v5 = &unk_24E96D100;
  }
  else
  {
    v5 = &unk_24E96D118;
  }
  v14[3] = v5;
  v13[4] = CFSTR("residentChannelActiveNoPrimaryResolvedBool");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent residentChannelActiveNoPrimaryResolved](self, "residentChannelActiveNoPrimaryResolved"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  v13[5] = CFSTR("accountMessageCount");
  if (-[HMDPrimaryResidentDiscoveryLogEvent accountMessageSent](self, "accountMessageSent"))
    v7 = &unk_24E96D100;
  else
    v7 = &unk_24E96D118;
  v14[5] = v7;
  v13[6] = CFSTR("accountMessageBool");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent accountMessageSent](self, "accountMessageSent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  v13[7] = CFSTR("accountMessageNoPrimaryResolvedCount");
  if (-[HMDPrimaryResidentDiscoveryLogEvent accountMessageNoPrimaryResolved](self, "accountMessageNoPrimaryResolved"))
    v9 = &unk_24E96D100;
  else
    v9 = &unk_24E96D118;
  v14[7] = v9;
  v13[8] = CFSTR("accountMessageNoPrimaryResolvedBool");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent accountMessageNoPrimaryResolved](self, "accountMessageNoPrimaryResolved"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (BOOL)residentChannelActive
{
  return self->_residentChannelActive;
}

- (void)setResidentChannelActive:(BOOL)a3
{
  self->_residentChannelActive = a3;
}

- (BOOL)residentChannelActiveNoPrimaryResolved
{
  return self->_residentChannelActiveNoPrimaryResolved;
}

- (void)setResidentChannelActiveNoPrimaryResolved:(BOOL)a3
{
  self->_residentChannelActiveNoPrimaryResolved = a3;
}

- (NSError)residentChannelActiveResolvePrimaryError
{
  return self->_residentChannelActiveResolvePrimaryError;
}

- (void)setResidentChannelActiveResolvePrimaryError:(id)a3
{
  objc_storeStrong((id *)&self->_residentChannelActiveResolvePrimaryError, a3);
}

- (BOOL)accountMessageSent
{
  return self->_accountMessageSent;
}

- (void)setAccountMessageSent:(BOOL)a3
{
  self->_accountMessageSent = a3;
}

- (BOOL)accountMessageNoPrimaryResolved
{
  return self->_accountMessageNoPrimaryResolved;
}

- (void)setAccountMessageNoPrimaryResolved:(BOOL)a3
{
  self->_accountMessageNoPrimaryResolved = a3;
}

- (NSError)accountMessageError
{
  return self->_accountMessageError;
}

- (void)setAccountMessageError:(id)a3
{
  objc_storeStrong((id *)&self->_accountMessageError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountMessageError, 0);
  objc_storeStrong((id *)&self->_residentChannelActiveResolvePrimaryError, 0);
}

@end
