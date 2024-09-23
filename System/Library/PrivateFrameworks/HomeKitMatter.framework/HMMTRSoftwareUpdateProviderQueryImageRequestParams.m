@implementation HMMTRSoftwareUpdateProviderQueryImageRequestParams

- (HMMTRSoftwareUpdateProviderQueryImageRequestParams)initWithVendorID:(id)a3 productId:(id)a4 softwareVersion:(id)a5 protocolsSupported:(id)a6 hardwareVersion:(id)a7 location:(id)a8 requestorCanConsent:(id)a9 metadataForProvider:(id)a10
{
  id v17;
  HMMTRSoftwareUpdateProviderQueryImageRequestParams *v18;
  HMMTRSoftwareUpdateProviderQueryImageRequestParams *v19;
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
  v28.super_class = (Class)HMMTRSoftwareUpdateProviderQueryImageRequestParams;
  v18 = -[HMMTRSoftwareUpdateProviderQueryImageRequestParams init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_vendorId, a3);
    objc_storeStrong((id *)&v19->_productId, a4);
    objc_storeStrong((id *)&v19->_softwareVersion, a5);
    objc_storeStrong((id *)&v19->_protocolsSupported, a6);
    objc_storeStrong((id *)&v19->_hardwareVersion, a7);
    objc_storeStrong((id *)&v19->_location, a8);
    objc_storeStrong((id *)&v19->_requestorCanConsent, a9);
    objc_storeStrong((id *)&v19->_metadataForProvider, a10);
  }

  return v19;
}

- (NSNumber)vendorId
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)productId
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)softwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)protocolsSupported
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)hardwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)location
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)requestorCanConsent
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)metadataForProvider
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataForProvider, 0);
  objc_storeStrong((id *)&self->_requestorCanConsent, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_protocolsSupported, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
}

@end
