@implementation HMMTRSoftwareUpdateProviderNotifyUpdateParams

- (HMMTRSoftwareUpdateProviderNotifyUpdateParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4 didTimeout:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v12;
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRSoftwareUpdateProviderNotifyUpdateParams;
  v12 = -[HMMTRSoftwareUpdateProviderNotifyUpdateParams init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_updateToken, a3);
    objc_storeStrong((id *)&v13->_softwareVersion, a4);
    objc_storeStrong((id *)&v13->_didTimeout, a5);
  }

  return v13;
}

- (HMMTRSoftwareUpdateProviderNotifyUpdateParams)initWithUpdateToken:(id)a3 softwareVersion:(id)a4 transportTypeForMetrics:(id)a5 previousSoftwareVersionNumberForMetrics:(id)a6 didTimeout:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v17;
  HMMTRSoftwareUpdateProviderNotifyUpdateParams *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRSoftwareUpdateProviderNotifyUpdateParams;
  v17 = -[HMMTRSoftwareUpdateProviderNotifyUpdateParams init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_updateToken, a3);
    objc_storeStrong((id *)&v18->_softwareVersion, a4);
    objc_storeStrong((id *)&v18->_transportTypeForMetrics, a5);
    objc_storeStrong((id *)&v18->_previousSoftwareVersionNumberForMetrics, a6);
    objc_storeStrong((id *)&v18->_didTimeout, a7);
  }

  return v18;
}

- (NSData)updateToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)softwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)transportTypeForMetrics
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)previousSoftwareVersionNumberForMetrics
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)didTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didTimeout, 0);
  objc_storeStrong((id *)&self->_previousSoftwareVersionNumberForMetrics, 0);
  objc_storeStrong((id *)&self->_transportTypeForMetrics, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
}

@end
