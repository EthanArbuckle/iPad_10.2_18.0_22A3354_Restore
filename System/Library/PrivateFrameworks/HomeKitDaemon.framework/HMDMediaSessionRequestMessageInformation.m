@implementation HMDMediaSessionRequestMessageInformation

- (HMDMediaSessionRequestMessageInformation)initWithMessage:(id)a3
{
  id v5;
  void *v6;
  HMDMediaSessionRequestMessageInformation *v7;
  HMDMediaSessionRequestMessageInformation *v8;
  HMDMediaSessionRequestMessageInformation *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDMediaSessionRequestMessageInformation;
    v7 = -[HMDMediaSessionRequestMessageInformation init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_message, a3);

    return v8;
  }
  else
  {
    v10 = (HMDMediaSessionRequestMessageInformation *)_HMFPreconditionFailure();
    return (HMDMediaSessionRequestMessageInformation *)-[HMDMediaSessionRequestMessageInformation messageIdentifier](v10, v11);
  }
}

- (NSUUID)messageIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaSessionRequestMessageInformation message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (HMDDevice)remoteSourceDevice
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[HMDMediaSessionRequestMessageInformation message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (HMDDevice *)v8;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSessionRequestMessageInformation messageIdentifier](self, "messageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("messageIdentifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSessionRequestMessageInformation remoteSourceDevice](self, "remoteSourceDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("remoteSourceDevice"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_130104 != -1)
    dispatch_once(&logCategory__hmf_once_t2_130104, &__block_literal_global_130105);
  return (id)logCategory__hmf_once_v3_130106;
}

void __55__HMDMediaSessionRequestMessageInformation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_130106;
  logCategory__hmf_once_v3_130106 = v0;

}

@end
