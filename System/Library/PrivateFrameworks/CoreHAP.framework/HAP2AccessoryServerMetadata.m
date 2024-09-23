@implementation HAP2AccessoryServerMetadata

- (HAP2AccessoryServerMetadata)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessoryServerMetadata)initWithDeviceID:(id)a3 hasPairings:(BOOL)a4 protocolVersion:(id)a5 name:(id)a6 model:(id)a7 category:(unint64_t)a8 stateNumber:(unsigned __int16)a9 configNumber:(unsigned __int16)a10 setupHash:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  HAP2AccessoryServerMetadata *v20;
  HAP2AccessoryServerMetadata *v21;
  id v25;
  objc_super v26;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v25 = a7;
  v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)HAP2AccessoryServerMetadata;
  v20 = -[HAP2AccessoryServerMetadata init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceID, a3);
    v21->_hasPairings = a4;
    objc_storeStrong((id *)&v21->_protocolVersion, a5);
    objc_storeStrong((id *)&v21->_name, a6);
    objc_storeStrong((id *)&v21->_model, a7);
    v21->_category = a8;
    v21->_stateNumber = a9;
    v21->_configNumber = a10;
    objc_storeStrong((id *)&v21->_setupHash, a11);
  }

  return v21;
}

- (HAPDeviceID)deviceID
{
  return self->_deviceID;
}

- (BOOL)hasPairings
{
  return self->_hasPairings;
}

- (HMFVersion)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (unint64_t)category
{
  return self->_category;
}

- (unsigned)stateNumber
{
  return self->_stateNumber;
}

- (unsigned)configNumber
{
  return self->_configNumber;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
