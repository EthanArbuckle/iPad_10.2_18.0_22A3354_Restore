@implementation HMAccessoryAdvertisementInfo

- (HMAccessoryAdvertisementInfo)initWithAccessoryIdentifier:(id)a3
{
  id v4;
  HMAccessoryAdvertisementInfo *v5;
  uint64_t v6;
  NSString *deviceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryAdvertisementInfo;
  v5 = -[HMAccessoryAdvertisementInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
