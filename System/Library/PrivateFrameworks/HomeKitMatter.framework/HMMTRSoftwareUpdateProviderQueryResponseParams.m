@implementation HMMTRSoftwareUpdateProviderQueryResponseParams

- (HMMTRSoftwareUpdateProviderQueryResponseParams)initWithStatus:(id)a3 delayedActionTime:(id)a4 imageURI:(id)a5 softwareVersion:(id)a6 softwareVersionString:(id)a7 updateToken:(id)a8 userConsentNeeded:(id)a9 metadataForRequestor:(id)a10
{
  id v17;
  HMMTRSoftwareUpdateProviderQueryResponseParams *v18;
  HMMTRSoftwareUpdateProviderQueryResponseParams *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)HMMTRSoftwareUpdateProviderQueryResponseParams;
  v18 = -[HMMTRSoftwareUpdateProviderQueryResponseParams init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_status, a3);
    objc_storeStrong((id *)&v19->_delayedActionTime, a4);
    objc_storeStrong((id *)&v19->_imageURI, a5);
    objc_storeStrong((id *)&v19->_softwareVersion, a6);
    objc_storeStrong((id *)&v19->_softwareVersionString, a7);
    objc_storeStrong((id *)&v19->_updateToken, a8);
    objc_storeStrong((id *)&v19->_userConsentNeeded, a9);
    objc_storeStrong((id *)&v19->_metadataForRequestor, a10);
  }

  return v19;
}

- (NSNumber)status
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)delayedActionTime
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)imageURI
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)softwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)softwareVersionString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)updateToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)userConsentNeeded
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)metadataForRequestor
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataForRequestor, 0);
  objc_storeStrong((id *)&self->_userConsentNeeded, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_softwareVersionString, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_imageURI, 0);
  objc_storeStrong((id *)&self->_delayedActionTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
