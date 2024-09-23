@implementation HMMTRSoftwareUpdateProviderApplyUpdateResponseParams

- (HMMTRSoftwareUpdateProviderApplyUpdateResponseParams)initWithAction:(id)a3 delayedActionTime:(id)a4
{
  id v7;
  id v8;
  HMMTRSoftwareUpdateProviderApplyUpdateResponseParams *v9;
  HMMTRSoftwareUpdateProviderApplyUpdateResponseParams *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSoftwareUpdateProviderApplyUpdateResponseParams;
  v9 = -[HMMTRSoftwareUpdateProviderApplyUpdateResponseParams init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_delayedActionTime, a4);
  }

  return v10;
}

- (NSNumber)action
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)delayedActionTime
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedActionTime, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
