@implementation MRAVRoutingDiscoverySessionConfiguration

- (void)setTargetAudioSessionID:(unsigned int)a3
{
  self->_targetAudioSessionID = a3;
}

- (void)setEnableThrottling:(BOOL)a3
{
  self->_enableThrottling = a3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_routingContextUID, "hash");
  v4 = -[NSString hash](self->_outputDeviceUID, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_features);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetAudioSessionID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8 ^ (100 * self->_enableThrottling) ^ (200 * self->_alwaysAllowUpdates) ^ (300
                                                                                       * self->_populatesExternalDevice);
}

- (unsigned)features
{
  return self->_features;
}

- (BOOL)isLocal
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
    return 1;
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clusterID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) != 0
    || (-[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "deviceUID"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqualToString:", v14),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v16, "isEqualToString:", v17);

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = self->_enableThrottling;
  v4[9] = self->_alwaysAllowUpdates;
  *((_DWORD *)v4 + 3) = self->_features;
  v4[10] = self->_populatesExternalDevice;
  *((_DWORD *)v4 + 4) = self->_targetAudioSessionID;
  v5 = -[NSString copy](self->_routingContextUID, "copy");
  v6 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v5;

  v7 = -[NSString copy](self->_outputDeviceUID, "copy");
  v8 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || objc_msgSend(v7, "features") != self->_features
    || (v8 = objc_msgSend(v7, "enableThrottling"),
        v8 != -[MRAVRoutingDiscoverySessionConfiguration enableThrottling](self, "enableThrottling"))
    || (v9 = objc_msgSend(v7, "alwaysAllowUpdates"),
        v9 != -[MRAVRoutingDiscoverySessionConfiguration alwaysAllowUpdates](self, "alwaysAllowUpdates"))
    || (v10 = objc_msgSend(v7, "populatesExternalDevice"),
        v10 != -[MRAVRoutingDiscoverySessionConfiguration populatesExternalDevice](self, "populatesExternalDevice"))
    || (v11 = objc_msgSend(v7, "targetAudioSessionID"),
        v11 != -[MRAVRoutingDiscoverySessionConfiguration targetAudioSessionID](self, "targetAudioSessionID")))
  {
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "routingContextUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[MRAVRoutingDiscoverySessionConfiguration routingContextUID](self, "routingContextUID"),
        (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "routingContextUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoutingDiscoverySessionConfiguration routingContextUID](self, "routingContextUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v4))
    {
      v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v13 = 1;
  }
  else
  {
    v19 = 0;
    v13 = 0;
  }
  objc_msgSend(v7, "outputDeviceUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v14 = 1;
LABEL_24:

      if ((v13 & 1) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  objc_msgSend(v7, "outputDeviceUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySessionConfiguration outputDeviceUID](self, "outputDeviceUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v17, "isEqualToString:", v18);

  if (!v16)
    goto LABEL_24;

  if (v13)
    goto LABEL_19;
LABEL_20:
  if (!v12)

LABEL_12:
  return v14;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (BOOL)populatesExternalDevice
{
  return self->_populatesExternalDevice;
}

- (BOOL)alwaysAllowUpdates
{
  return self->_alwaysAllowUpdates;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (unsigned)targetAudioSessionID
{
  return self->_targetAudioSessionID;
}

- (BOOL)enableThrottling
{
  return self->_enableThrottling;
}

- (void)setRoutingContextUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MRAVRoutingDiscoverySessionConfiguration)initWithEndpointFeatures:(unsigned int)a3
{
  MRAVRoutingDiscoverySessionConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRAVRoutingDiscoverySessionConfiguration;
  result = -[MRAVRoutingDiscoverySessionConfiguration init](&v5, sel_init);
  if (result)
  {
    result->_features = a3;
    result->_populatesExternalDevice = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
}

+ (MRAVRoutingDiscoverySessionConfiguration)configurationWithEndpointFeatures:(unsigned int)a3
{
  return -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]([MRAVRoutingDiscoverySessionConfiguration alloc], "initWithEndpointFeatures:", *(_QWORD *)&a3);
}

- (MRAVRoutingDiscoverySessionConfiguration)initWithProtobuf:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *outputDeviceUID;
  void *v9;
  uint64_t v10;
  NSString *routingContextUID;
  MRAVRoutingDiscoverySessionConfiguration *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)MRAVRoutingDiscoverySessionConfiguration;
    v5 = -[MRAVRoutingDiscoverySessionConfiguration init](&v14, sel_init);
    if (v5)
    {
      v5->_features = objc_msgSend(v4, "features");
      objc_msgSend(v4, "outputDeviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      outputDeviceUID = v5->_outputDeviceUID;
      v5->_outputDeviceUID = (NSString *)v7;

      objc_msgSend(v4, "routingContextUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      routingContextUID = v5->_routingContextUID;
      v5->_routingContextUID = (NSString *)v10;

      v5->_alwaysAllowUpdates = objc_msgSend(v4, "alwaysAllowUpdates");
      v5->_enableThrottling = objc_msgSend(v4, "enableThrottling");
      v5->_populatesExternalDevice = objc_msgSend(v4, "populatesExternalDevice");
      v5->_targetAudioSessionID = objc_msgSend(v4, "targetSessionID");
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_MRDiscoverySessionConfigurationProtobuf)protobuf
{
  _MRDiscoverySessionConfigurationProtobuf *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_MRDiscoverySessionConfigurationProtobuf);
  -[_MRDiscoverySessionConfigurationProtobuf setFeatures:](v3, "setFeatures:", self->_features);
  v4 = (void *)-[NSString copy](self->_outputDeviceUID, "copy");
  -[_MRDiscoverySessionConfigurationProtobuf setOutputDeviceUID:](v3, "setOutputDeviceUID:", v4);

  v5 = (void *)-[NSString copy](self->_routingContextUID, "copy");
  -[_MRDiscoverySessionConfigurationProtobuf setRoutingContextUID:](v3, "setRoutingContextUID:", v5);

  if (self->_alwaysAllowUpdates)
    -[_MRDiscoverySessionConfigurationProtobuf setAlwaysAllowUpdates:](v3, "setAlwaysAllowUpdates:", 1);
  if (self->_enableThrottling)
    -[_MRDiscoverySessionConfigurationProtobuf setEnableThrottling:](v3, "setEnableThrottling:", 1);
  if (self->_populatesExternalDevice)
    -[_MRDiscoverySessionConfigurationProtobuf setPopulatesExternalDevice:](v3, "setPopulatesExternalDevice:", 1);
  if (self->_targetAudioSessionID)
    -[_MRDiscoverySessionConfigurationProtobuf setTargetSessionID:](v3, "setTargetSessionID:");
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MRAVRoutingDiscoverySessionConfiguration protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRAVRoutingDiscoverySessionConfiguration protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (MRAVRoutingDiscoverySessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRAVRoutingDiscoverySessionConfiguration *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MRAVRoutingDiscoverySessionConfiguration initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  self->_alwaysAllowUpdates = a3;
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  self->_populatesExternalDevice = a3;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
