@implementation NINearbyAccessoryConfiguration

- (NINearbyAccessoryConfiguration)initWithData:(NSData *)data error:(NSError *)error
{
  NSData *v7;
  _QWORD *v8;
  NSData *v9;
  const void *v10;
  size_t v11;
  size_t v12;
  char v13;
  uint64_t v14;
  unsigned int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  unsigned int v18;
  uint64_t v19;
  NINearbyAccessoryConfiguration *v20;
  int v22;
  BOOL v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NIDiscoveryToken *v30;
  void *v31;
  void *v32;
  void *__p;
  _BYTE *v34;
  uint64_t v35;
  objc_super v36;
  int __dst;
  unsigned __int8 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  unsigned __int8 v42;
  unsigned __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = data;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v36.receiver = self;
  v36.super_class = (Class)NINearbyAccessoryConfiguration;
  v8 = -[NIConfiguration initInternal](&v36, sel_initInternal);
  if (!v8)
    goto LABEL_22;
  v9 = objc_retainAutorelease(v7);
  v10 = -[NSData bytes](v9, "bytes");
  v11 = -[NSData length](v9, "length");
  __p = 0;
  v34 = 0;
  v35 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, v10, (uint64_t)v10 + v11, v11);
  v12 = v34 - (_BYTE *)__p;
  if ((unint64_t)(v34 - (_BYTE *)__p) < 0x14)
    goto LABEL_5;
  v14 = 0;
  v15 = *(unsigned __int16 *)__p;
  v16 = !*((_WORD *)__p + 1) && v15 == 1;
  v17 = *((_WORD *)__p + 1) && v15 == 1;
  v18 = *((unsigned __int16 *)__p + 8);
  v19 = *((unsigned __int16 *)__p + 9);
  do
  {
    if (__PAIR64__(v19, v18) == __PAIR64__((unsigned __int16)rose::fira::kUWBInteropSpecificationSupportedVersions[v14 + 1], (unsigned __int16)rose::fira::kUWBInteropSpecificationSupportedVersions[v14]))
    {
      v22 = 1;
      goto LABEL_25;
    }
    v14 += 2;
  }
  while (v14 != 6);
  v22 = 0;
LABEL_25:
  v23 = v18 == 1 && v19 > 2;
  v24 = v23;
  v25 = v18 <= 1 ? v24 : 1;
  v26 = v15 > 1 || v16;
  if ((v26 | v17) != 1 || !(v22 | v25))
    goto LABEL_5;
  if (v22)
  {
    if (v18 != 1 || v19 >= 3)
      __assert_rtn("UWBConfigDataTotalLengthBytes", "NIFiRaDefinitions.h", 375, "false");
    if (v12 != 2 * v19 + 35 || *((unsigned __int8 *)__p + 15) != (2 * v19 + 19))
      goto LABEL_5;
  }
  else if (v25)
  {
    if (v12 < 0x27 || *((unsigned __int8 *)__p + 15) < 0x17u)
      goto LABEL_5;
    v12 = 39;
  }
  else
  {
    v12 = 0;
  }
  __dst = 0;
  v41 = 0;
  v44 = 0;
  v39 = 0;
  v40 = 0;
  memcpy(&__dst, __p, v12);
  if (v38 <= 0x14u
    && ((1 << v38) & 0x100401) != 0
    && v42 <= 1u
    && BYTE2(v44) <= 1u
    && HIBYTE(v44) <= 8u
    && ((1 << SHIBYTE(v44)) & 0x10D) != 0)
  {
    v27 = v43;
    v28 = -[NSData copy](v9, "copy");
    v29 = (void *)v8[4];
    v8[4] = v28;

    v30 = -[NIDiscoveryToken initWithDeviceAddress:]([NIDiscoveryToken alloc], "initWithDeviceAddress:", v27);
    v31 = (void *)v8[6];
    v8[6] = v30;

    *((_BYTE *)v8 + 40) = 0;
    v8[9] = 0;
    v13 = 1;
    goto LABEL_19;
  }
LABEL_5:
  if (error)
  {
    NIErrorWithCodeAndUserInfo(-5888, 0);
    v13 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_19:
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  if ((v13 & 1) == 0)
  {
    v20 = 0;
    goto LABEL_24;
  }
LABEL_22:
  v20 = v8;
LABEL_24:

  return v20;
}

- (NINearbyAccessoryConfiguration)initWithAccessoryData:(NSData *)accessoryData bluetoothPeerIdentifier:(NSUUID *)identifier error:(NSError *)error
{
  NSData *v9;
  NSUUID *v10;
  NSUUID *v11;
  NINearbyAccessoryConfiguration *v12;
  NINearbyAccessoryConfiguration *v13;
  NINearbyAccessoryConfiguration *v14;
  void *v16;
  void *v17;

  v9 = accessoryData;
  v10 = identifier;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryData"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v12 = -[NINearbyAccessoryConfiguration initWithData:error:](self, "initWithData:error:", v9, error);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bluetoothDeviceIdentifier, identifier);
    v13->_backgroundMode = 2;
    v14 = v13;
  }

  return v13;
}

- (NINearbyAccessoryConfiguration)initWithDataExchangeDisabledAndUsingParameterOverrides:(id)a3
{
  id v5;
  NINearbyAccessoryConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSData *rawData;
  NIDiscoveryToken *v16;
  void *v17;
  uint64_t v18;
  NIDiscoveryToken *accessoryDiscoveryToken;
  void *v21;
  uint64_t v22;
  objc_super v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterOverrides"));

  }
  v23.receiver = self;
  v23.super_class = (Class)NINearbyAccessoryConfiguration;
  v6 = -[NIConfiguration initInternal](&v23, sel_initInternal);
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("DisableDataExchangeAndUseParameterOverrides"));
    objc_msgSend(v7, "addEntriesFromDictionary:", v5);
    objc_storeStrong((id *)&v6->_debugParameters, v7);
    -[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("UWBSessionIdOverride"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");
    -[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("LocalAddressOverride"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");
    -[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("PeerAddressOverride"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (v9 << 32) | (v11 << 16) | objc_msgSend(v12, "unsignedLongLongValue");

    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v22, 8);
    v14 = objc_claimAutoreleasedReturnValue();
    rawData = v6->_rawData;
    v6->_rawData = (NSData *)v14;

    v16 = [NIDiscoveryToken alloc];
    -[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("PeerAddressOverride"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NIDiscoveryToken initWithDeviceAddress:](v16, "initWithDeviceAddress:", objc_msgSend(v17, "unsignedShortValue"));
    accessoryDiscoveryToken = v6->_accessoryDiscoveryToken;
    v6->_accessoryDiscoveryToken = (NIDiscoveryToken *)v18;

    v6->_cameraAssistanceEnabled = 0;
    v6->_backgroundMode = 0;

  }
  return v6;
}

- (BOOL)dataExchangeDisabledAndUsingParameterOverrides
{
  void *v3;
  char v4;

  if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    return 0;
  -[NSDictionary objectForKeyedSubscript:](self->_debugParameters, "objectForKeyedSubscript:", CFSTR("DisableDataExchangeAndUseParameterOverrides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSData)accessoryConfigData
{
  return self->_rawData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NINearbyAccessoryConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v13, sel_copyWithZone_);
  objc_msgSend(v5, "setBluetoothDeviceIdentifier:", self->_bluetoothDeviceIdentifier);
  objc_msgSend(v5, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  objc_msgSend(v5, "setBackgroundMode:", self->_backgroundMode);
  v6 = -[NSData copyWithZone:](self->_rawData, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NIDiscoveryToken copyWithZone:](self->_accessoryDiscoveryToken, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  if (self->_debugParameters)
  {
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugParameters, 1);
    v11 = (void *)v5[8];
    v5[8] = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NINearbyAccessoryConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawData, CFSTR("rawData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessoryDiscoveryToken, CFSTR("accessoryDiscoveryToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bluetoothDeviceIdentifier, CFSTR("bluetoothDeviceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugParameters, CFSTR("debugParameters"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_backgroundMode, CFSTR("backgroundMode"));

}

- (NINearbyAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  unint64_t v14;
  NINearbyAccessoryConfiguration *v15;
  NINearbyAccessoryConfiguration *v16;
  unint64_t v17;
  id v19;
  id obj;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryDiscoveryToken"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawData"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothDeviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v8, v11, CFSTR("debugParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundMode"));
  v21.receiver = self;
  v21.super_class = (Class)NINearbyAccessoryConfiguration;
  v15 = -[NIConfiguration initWithCoder:](&v21, sel_initWithCoder_, v4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryDiscoveryToken, obj);
    objc_storeStrong((id *)&v16->_debugParameters, v12);
    objc_storeStrong((id *)&v16->_rawData, v19);
    objc_storeStrong((id *)&v16->_bluetoothDeviceIdentifier, v5);
    v16->_cameraAssistanceEnabled = v13;
    if (v14 >= 3)
      v17 = 0;
    else
      v17 = v14;
    v16->_backgroundMode = v17;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NINearbyAccessoryConfiguration *v5;
  NINearbyAccessoryConfiguration *v6;
  NSData *rawData;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  char v12;
  void *v13;
  int v14;
  int cameraAssistanceEnabled;
  int v16;
  int64_t backgroundMode;
  void *v18;
  _BOOL4 v19;
  void *v20;
  char v21;
  BOOL v23;
  uint64_t v24;
  int64_t v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NINearbyAccessoryConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v12 = 1;
    }
    else
    {
      rawData = self->_rawData;
      -[NINearbyAccessoryConfiguration accessoryConfigData](v5, "accessoryConfigData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSData isEqualToData:](rawData, "isEqualToData:", v8);

      -[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](v6, "bluetoothDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = 0;
      else
        v11 = self->_bluetoothDeviceIdentifier == 0;

      -[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](v6, "bluetoothDeviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", self->_bluetoothDeviceIdentifier);

      cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      v16 = -[NINearbyAccessoryConfiguration isCameraAssistanceEnabled](v6, "isCameraAssistanceEnabled");
      backgroundMode = self->_backgroundMode;
      v24 = -[NINearbyAccessoryConfiguration backgroundMode](v6, "backgroundMode");
      v25 = backgroundMode;
      -[NINearbyAccessoryConfiguration debugParameters](v6, "debugParameters");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v9;
      if (v18)
        v23 = 0;
      else
        v23 = self->_debugParameters == 0;

      -[NINearbyAccessoryConfiguration debugParameters](v6, "debugParameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToDictionary:", self->_debugParameters);

      v12 = 0;
      if ((v19 & (v11 | v14)) == 1 && cameraAssistanceEnabled == v16)
      {
        if (v25 == v24)
          v12 = v23 | v21;
        else
          v12 = 0;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSData hash](self->_rawData, "hash");
  v4 = -[NIDiscoveryToken hash](self->_accessoryDiscoveryToken, "hash");
  return v3 ^ v4 ^ -[NSUUID hash](self->_bluetoothDeviceIdentifier, "hash") ^ self->_cameraAssistanceEnabled ^ self->_backgroundMode ^ 0x1F;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NINearbyAccessoryConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  NIDiscoveryToken *accessoryDiscoveryToken;
  void *v5;
  NSUUID *bluetoothDeviceIdentifier;
  void *v7;
  const char *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E4363DF8);
  accessoryDiscoveryToken = self->_accessoryDiscoveryToken;
  if (accessoryDiscoveryToken)
  {
    -[NIDiscoveryToken descriptionInternal](accessoryDiscoveryToken, "descriptionInternal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Device Token: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("Device Token: null"));
  }
  bluetoothDeviceIdentifier = self->_bluetoothDeviceIdentifier;
  if (bluetoothDeviceIdentifier)
  {
    -[NSUUID UUIDString](bluetoothDeviceIdentifier, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", Bluetooth Device: %@"), v7);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(", Bluetooth Device: null"));
  }
  if (self->_cameraAssistanceEnabled)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCameraAssistanceEnabled: %s"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(", backgroundMode: %s"), +[NIUtils NISessionBackgroundModeToString:](NIUtils, "NISessionBackgroundModeToString:", self->_backgroundMode));
  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (NIDiscoveryToken)accessoryDiscoveryToken
{
  return self->_accessoryDiscoveryToken;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (NSUUID)bluetoothDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBluetoothDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDebugParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_backgroundMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
