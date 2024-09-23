@implementation HAP2AccessoryServerDiscoveryHAPAccessoryInfo

- (HAP2AccessoryServerDiscoveryHAPAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (HAP2AccessoryServerDiscoveryHAPAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4 name:(id)a5 model:(id)a6 status:(unsigned __int8)a7 category:(unint64_t)a8 configurationNumber:(unint64_t)a9 stateNumber:(unint64_t)a10 protocolVersion:(id)a11 featureFlags:(unint64_t)a12 setupHash:(id)a13
{
  id v18;
  id v19;
  id v20;
  HAP2AccessoryServerDiscoveryHAPAccessoryInfo *v21;
  HAP2AccessoryServerDiscoveryHAPAccessoryInfo *v22;
  id v26;
  objc_super v27;

  v18 = a5;
  v19 = a6;
  v26 = a11;
  v20 = a13;
  v27.receiver = self;
  v27.super_class = (Class)HAP2AccessoryServerDiscoveryHAPAccessoryInfo;
  v21 = -[HAP2AccessoryServerDiscoveryAccessoryInfo initWithDeviceID:rawDiscoveryInfo:](&v27, sel_initWithDeviceID_rawDiscoveryInfo_, a3, a4);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a5);
    objc_storeStrong((id *)&v22->_model, a6);
    v22->_status = a7;
    v22->_category = a8;
    v22->_configurationNumber = a9;
    v22->_stateNumber = a10;
    objc_storeStrong((id *)&v22->_protocolVersion, a11);
    v22->_featureFlags = a12;
    objc_storeStrong((id *)&v22->_setupHash, a13);
  }

  return v22;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (unsigned)status
{
  return self->_status;
}

- (unint64_t)category
{
  return self->_category;
}

- (unint64_t)configurationNumber
{
  return self->_configurationNumber;
}

- (unint64_t)stateNumber
{
  return self->_stateNumber;
}

- (HMFVersion)protocolVersion
{
  return self->_protocolVersion;
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
