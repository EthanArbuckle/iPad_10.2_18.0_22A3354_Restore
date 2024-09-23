@implementation HMAccessoryLinkQualityResult

- (HMAccessoryLinkQualityResult)initWithLinkQualitySupported:(BOOL)a3 linkLayerType:(unint64_t)a4 macAddress:(id)a5 networkName:(id)a6 linkQuality:(unint64_t)a7
{
  id v13;
  id v14;
  HMAccessoryLinkQualityResult *v15;
  HMAccessoryLinkQualityResult *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMAccessoryLinkQualityResult;
  v15 = -[HMAccessoryLinkQualityResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_supported = a3;
    v15->_linkLayerType = a4;
    objc_storeStrong((id *)&v15->_macAddress, a5);
    objc_storeStrong((id *)&v16->_networkName, a6);
    v16->_linkQuality = a7;
  }

  return v16;
}

- (BOOL)supported
{
  return self->_supported;
}

- (unint64_t)linkLayerType
{
  return self->_linkLayerType;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (unint64_t)linkQuality
{
  return self->_linkQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
}

@end
