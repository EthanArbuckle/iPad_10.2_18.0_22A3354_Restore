@implementation NIFindingConfiguration

+ (id)localDeviceConfiguration
{
  return -[NIFindingConfiguration _initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:]([NIFindingConfiguration alloc], "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:", 2, 0, 0, 0, 3);
}

- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5
{
  return (NIFindingConfiguration *)-[NIFindingConfiguration _initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:](self, "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:", 1, (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0, (a3 & 0xFFFFFFFFFFFFFFFELL) == 2, a4, a5);
}

- (NIDiscoveryToken)sessionDiscoveryToken
{
  return self->_specifiedToken;
}

- (NIDiscoveryToken)findingDiscoveryToken
{
  return self->_specifiedToken;
}

- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7
{
  id v13;
  id *v14;
  id *v15;
  id v16;
  objc_super v18;

  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NIFindingConfiguration;
  v14 = -[NIConfiguration initInternal](&v18, sel_initInternal);
  v15 = v14;
  if (v14)
  {
    *((_BYTE *)v14 + 34) = a4;
    *((_BYTE *)v14 + 35) = a5;
    v14[6] = (id)a3;
    objc_storeStrong(v14 + 7, a6);
    v15[5] = (id)a7;
    *((_BYTE *)v15 + 32) = 0;
    *((_BYTE *)v15 + 33) = 1;
    v16 = v15[8];
    v15[8] = 0;

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NIFindingConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIsFinder:", self->_isFinder);
  objc_msgSend(v4, "setIsObserver:", self->_isObserver);
  objc_msgSend(v4, "setConfigType:", self->_configType);
  v5 = (void *)-[NIDiscoveryToken copy](self->_specifiedToken, "copy");
  objc_msgSend(v4, "setSpecifiedToken:", v5);

  objc_msgSend(v4, "setPreferredUpdateRate:", self->_preferredUpdateRate);
  objc_msgSend(v4, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  objc_msgSend(v4, "setCameraAssistanceInClientProcess:", self->_cameraAssistanceInClientProcess);
  v6 = (void *)-[NSDictionary copy](self->_debugParameters, "copy");
  objc_msgSend(v4, "setDebugParameters:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIFindingConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isFinder, CFSTR("isFinder"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isObserver, CFSTR("isObserver"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_configType, CFSTR("configType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_specifiedToken, CFSTR("specifiedToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preferredUpdateRate, CFSTR("preferredUpdateRate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceInClientProcess, CFSTR("cameraAssistanceInClientProcess"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugParameters, CFSTR("debugParameters"));

}

- (NIFindingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIFindingConfiguration *v5;
  char v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NIFindingConfiguration *v18;
  char v20;
  char v21;
  BOOL v22;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NIFindingConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinder"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isObserver"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specifiedToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredUpdateRate")),
          +[NIUtils isIntValidNearbyObjectUpdateRate:](NIUtils, "isIntValidNearbyObjectUpdateRate:", v10)))
    {
      v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
      v22 = v6;
      v20 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceInClientProcess"));
      v11 = (void *)MEMORY[0x1E0C99E60];
      v25[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0C99E60];
      v24 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v13, v16, CFSTR("debugParameters"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isFinder = v22;
      v5->_isObserver = v7;
      if (v8 == 1)
      {
        v5->_configType = 1;
        objc_storeStrong((id *)&v5->_specifiedToken, v9);
        v5->_preferredUpdateRate = v10;
        v5->_cameraAssistanceEnabled = v21;
        v5->_cameraAssistanceInClientProcess = v20;
        objc_storeStrong((id *)&v5->_debugParameters, v17);
        v18 = v5;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  NIFindingConfiguration *v4;
  NIFindingConfiguration *v5;
  int v6;
  int isFinder;
  int v8;
  _BOOL4 isObserver;
  int64_t configType;
  unint64_t specifiedToken;
  NIDiscoveryToken *v12;
  int v13;
  int v14;
  int v15;
  int cameraAssistanceEnabled;
  _BOOL4 v17;
  BOOL v18;
  BOOL v20;
  int v23;
  uint64_t v24;

  v4 = (NIFindingConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v18 = 1;
    }
    else
    {
      v6 = -[NIFindingConfiguration isFinder](v4, "isFinder");
      isFinder = self->_isFinder;
      v8 = -[NIFindingConfiguration isObserver](v5, "isObserver");
      isObserver = self->_isObserver;
      v24 = -[NIFindingConfiguration configType](v5, "configType");
      v23 = isObserver;
      configType = self->_configType;
      specifiedToken = (unint64_t)v5->_specifiedToken;
      v12 = self->_specifiedToken;
      v13 = objc_msgSend((id)specifiedToken, "isEqual:", v12);
      if (specifiedToken | (unint64_t)v12)
        v14 = v13;
      else
        v14 = 1;
      v15 = -[NIFindingConfiguration isCameraAssistanceEnabled](v5, "isCameraAssistanceEnabled");
      cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      v17 = -[NIFindingConfiguration isCameraAssistanceInClientProcess](v5, "isCameraAssistanceInClientProcess");
      v18 = 0;
      v20 = isFinder == v6 && v23 == v8 && v24 == configType;
      if (v20 && ((v14 ^ 1) & 1) == 0)
        v18 = cameraAssistanceEnabled == v15 && self->_cameraAssistanceInClientProcess == v17;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIFindingConfiguration *v5;
  uint64_t v6;
  int64_t preferredUpdateRate;
  NSDictionary *debugParameters;
  NSDictionary *v9;
  char v10;
  char v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIFindingConfiguration *)v4;
    if (v5 == self)
    {
      v12 = 1;
    }
    else if (-[NIFindingConfiguration canUpdateToConfiguration:](self, "canUpdateToConfiguration:", v5))
    {
      v6 = -[NIFindingConfiguration preferredUpdateRate](v5, "preferredUpdateRate");
      preferredUpdateRate = self->_preferredUpdateRate;
      debugParameters = v5->_debugParameters;
      v9 = self->_debugParameters;
      v10 = -[NSDictionary isEqualToDictionary:](debugParameters, "isEqualToDictionary:", v9);
      if ((unint64_t)debugParameters | (unint64_t)v9)
        v11 = v10;
      else
        v11 = 1;
      if (v6 == preferredUpdateRate)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
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
  int64_t configType;
  unint64_t v5;
  unint64_t v6;

  v3 = self->_isFinder ^ self->_isObserver ^ 0x1Fu;
  configType = self->_configType;
  v5 = configType ^ -[NIDiscoveryToken hash](self->_specifiedToken, "hash") ^ self->_preferredUpdateRate ^ v3;
  v6 = self->_cameraAssistanceEnabled ^ (unint64_t)self->_cameraAssistanceInClientProcess;
  return v5 ^ v6 ^ -[NSDictionary hash](self->_debugParameters, "hash");
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
  -[NIFindingConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  _BOOL8 isFinder;
  _BOOL8 isObserver;
  int64_t configType;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  isFinder = self->_isFinder;
  isObserver = self->_isObserver;
  configType = self->_configType;
  -[NIDiscoveryToken descriptionInternal](self->_specifiedToken, "descriptionInternal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<finder: %d [observer %d], cfg-type: %d, ses-token: %@, rate: %s, camera: %d [client %d], debug-params: %@>"), isFinder, isObserver, configType, v7, +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_preferredUpdateRate), self->_cameraAssistanceEnabled, self->_cameraAssistanceInClientProcess, self->_debugParameters);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_preferredUpdateRate = a3;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (BOOL)isCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (void)setCameraAssistanceInClientProcess:(BOOL)a3
{
  self->_cameraAssistanceInClientProcess = a3;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (void)setIsFinder:(BOOL)a3
{
  self->_isFinder = a3;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_isObserver = a3;
}

- (int64_t)configType
{
  return self->_configType;
}

- (void)setConfigType:(int64_t)a3
{
  self->_configType = a3;
}

- (NIDiscoveryToken)specifiedToken
{
  return self->_specifiedToken;
}

- (void)setSpecifiedToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)debugParameters
{
  return self->_debugParameters;
}

- (void)setDebugParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_specifiedToken, 0);
}

@end
