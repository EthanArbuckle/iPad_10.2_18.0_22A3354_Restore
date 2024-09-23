@implementation NINearbyPeerConfiguration

- (NINearbyPeerConfiguration)initWithPeerToken:(NIDiscoveryToken *)peerToken
{
  NIDiscoveryToken *v6;
  id *v7;
  NINearbyPeerConfiguration *v8;
  NSDictionary *debugParameters;
  void *v11;
  objc_super v12;

  v6 = peerToken;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peerToken"));

  }
  v12.receiver = self;
  v12.super_class = (Class)NINearbyPeerConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, sel_initInternal);
  v8 = (NINearbyPeerConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, peerToken);
    v8->_longRangeEnabled = 1;
    v8->_cameraAssistanceEnabled = 0;
    v8->_backgroundMode = 0;
    debugParameters = v8->_debugParameters;
    v8->_debugParameters = 0;

    v8->_extendedDistanceMeasurementEnabled = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NINearbyPeerConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v10, sel_copyWithZone_);
  objc_msgSend(v5, "setLongRangeEnabled:", self->_longRangeEnabled);
  objc_msgSend(v5, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  objc_msgSend(v5, "setBackgroundMode:", self->_backgroundMode);
  v6 = -[NIDiscoveryToken copyWithZone:](self->_peerDiscoveryToken, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v6;

  if (self->_debugParameters)
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugParameters, 1);
    objc_msgSend(v5, "setDebugParameters:", v8);

  }
  *((_BYTE *)v5 + 33) = self->_extendedDistanceMeasurementEnabled;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NINearbyPeerConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerDiscoveryToken, CFSTR("peerDiscoveryToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_longRangeEnabled, CFSTR("longRangeEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_backgroundMode, CFSTR("backgroundMode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugParameters, CFSTR("debugParameters"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_extendedDistanceMeasurementEnabled, CFSTR("extendedDistanceMeasurementEnabled"));

}

- (NINearbyPeerConfiguration)initWithCoder:(id)a3
{
  id v4;
  char v5;
  char v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NINearbyPeerConfiguration *v16;
  NINearbyPeerConfiguration *v17;
  unint64_t v18;
  id obj;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerDiscoveryToken"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("longRangeEnabled"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundMode"));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v10, v13, CFSTR("debugParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extendedDistanceMeasurementEnabled"));
  v21.receiver = self;
  v21.super_class = (Class)NINearbyPeerConfiguration;
  v16 = -[NIConfiguration initWithCoder:](&v21, sel_initWithCoder_, v4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_peerDiscoveryToken, obj);
    v17->_longRangeEnabled = v5;
    v17->_cameraAssistanceEnabled = v6;
    objc_storeStrong((id *)&v17->_debugParameters, v14);
    if (v7 >= 3)
      v18 = 0;
    else
      v18 = v7;
    v17->_backgroundMode = v18;
    v17->_extendedDistanceMeasurementEnabled = v15;
  }

  return v17;
}

- (NINearbyPeerConfiguration)init
{
  __assert_rtn("-[NINearbyPeerConfiguration init]", "NIConfiguration.mm", 543, "NO");
}

+ (NINearbyPeerConfiguration)new
{
  __assert_rtn("+[NINearbyPeerConfiguration new]", "NIConfiguration.mm", 548, "NO");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NINearbyPeerConfiguration *v5;
  NINearbyPeerConfiguration *v6;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v8;
  _BOOL4 v9;
  int longRangeEnabled;
  int v11;
  int cameraAssistanceEnabled;
  int v13;
  NSDictionary *debugParameters;
  void *v15;
  void *v16;
  char v17;
  int extendedDistanceMeasurementEnabled;
  int v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  int64_t backgroundMode;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NINearbyPeerConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v20 = 1;
LABEL_16:

      goto LABEL_17;
    }
    peerDiscoveryToken = self->_peerDiscoveryToken;
    -[NINearbyPeerConfiguration peerDiscoveryToken](v5, "peerDiscoveryToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NIDiscoveryToken isEqual:](peerDiscoveryToken, "isEqual:", v8);

    longRangeEnabled = self->_longRangeEnabled;
    v11 = -[NINearbyPeerConfiguration isLongRangeEnabled](v6, "isLongRangeEnabled");
    cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
    v13 = -[NINearbyPeerConfiguration isCameraAssistanceEnabled](v6, "isCameraAssistanceEnabled");
    backgroundMode = self->_backgroundMode;
    v22 = -[NINearbyPeerConfiguration backgroundMode](v6, "backgroundMode");
    debugParameters = self->_debugParameters;
    if (!debugParameters)
    {
      -[NINearbyPeerConfiguration debugParameters](v6, "debugParameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v17 = 1;
        goto LABEL_7;
      }
      debugParameters = self->_debugParameters;
    }
    -[NINearbyPeerConfiguration debugParameters](v6, "debugParameters", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSDictionary isEqual:](debugParameters, "isEqual:", v16);

LABEL_7:
    extendedDistanceMeasurementEnabled = self->_extendedDistanceMeasurementEnabled;
    v19 = -[NINearbyPeerConfiguration isExtendedDistanceMeasurementEnabled](v6, "isExtendedDistanceMeasurementEnabled", v22);
    v20 = 0;
    if (v9 && longRangeEnabled == v11 && cameraAssistanceEnabled == v13 && backgroundMode == v23)
    {
      if (extendedDistanceMeasurementEnabled == v19)
        v20 = v17;
      else
        v20 = 0;
    }
    goto LABEL_16;
  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL8 longRangeEnabled;
  _BOOL8 cameraAssistanceEnabled;
  int64_t backgroundMode;

  v3 = -[NIDiscoveryToken hash](self->_peerDiscoveryToken, "hash");
  longRangeEnabled = self->_longRangeEnabled;
  cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
  backgroundMode = self->_backgroundMode;
  return v3 ^ longRangeEnabled ^ cameraAssistanceEnabled ^ backgroundMode ^ -[NSDictionary hash](self->_debugParameters, "hash") ^ self->_extendedDistanceMeasurementEnabled ^ 0x1F;
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
  -[NINearbyPeerConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E4363DF8);
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    -[NIDiscoveryToken descriptionInternal](peerDiscoveryToken, "descriptionInternal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Peer Token: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("Peer Token: null"));
  }
  if (self->_cameraAssistanceEnabled)
    v6 = "Yes";
  else
    v6 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCameraAssistanceEnabled: %s"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(", backgroundMode: %s"), +[NIUtils NISessionBackgroundModeToString:](NIUtils, "NISessionBackgroundModeToString:", self->_backgroundMode));
  -[NSDictionary description](self->_debugParameters, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", debugParameters:%@"), v7);

  if (self->_longRangeEnabled)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isLongRangeEnabled: %s"), v8);
  if (self->_extendedDistanceMeasurementEnabled)
    v9 = "Yes";
  else
    v9 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isExtendedDistanceMeasurementEnabled: %s"), v9);
  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (void)setPeerDiscoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (void)setExtendedDistanceMeasurementEnabled:(BOOL)extendedDistanceMeasurementEnabled
{
  self->_extendedDistanceMeasurementEnabled = extendedDistanceMeasurementEnabled;
}

- (BOOL)isLongRangeEnabled
{
  return self->_longRangeEnabled;
}

- (void)setLongRangeEnabled:(BOOL)a3
{
  self->_longRangeEnabled = a3;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_backgroundMode = a3;
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebugParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_peerDiscoveryToken, 0);
}

@end
