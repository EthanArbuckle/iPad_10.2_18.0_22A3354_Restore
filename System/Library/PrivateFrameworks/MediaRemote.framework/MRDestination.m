@implementation MRDestination

+ (id)proactiveDestination
{
  return -[MRDestination initWithOutputDeviceUID:]([MRDestination alloc], "initWithOutputDeviceUID:", CFSTR("proactiveEndpoint"));
}

+ (id)userSelectedDestination
{
  return -[MRDestination initWithOutputDeviceUID:]([MRDestination alloc], "initWithOutputDeviceUID:", CFSTR("userSelectedEndpoint"));
}

+ (id)localDestination
{
  return -[MRDestination initWithEndpoint:]([MRDestination alloc], "initWithEndpoint:", MRAVEndpointGetLocalEndpoint(0));
}

- (MRDestination)initWithPlayerPath:(id)a3
{
  id v4;
  MRDestination *v5;
  MRPlayerPath *v6;
  MRPlayerPath *playerPath;

  v4 = a3;
  v5 = -[MRDestination _init](self, "_init");
  if (v5)
  {
    if (v4)
      v6 = (MRPlayerPath *)objc_msgSend(v4, "copy");
    else
      v6 = objc_alloc_init(MRPlayerPath);
    playerPath = v5->_playerPath;
    v5->_playerPath = v6;

  }
  return v5;
}

- (MRDestination)initWithOrigin:(id)a3
{
  id v4;
  MRDestination *v5;
  MRPlayerPath *v6;
  void *v7;
  uint64_t v8;
  MRPlayerPath *playerPath;

  v4 = a3;
  v5 = -[MRDestination _init](self, "_init");
  if (v5)
  {
    v6 = [MRPlayerPath alloc];
    v7 = (void *)objc_msgSend(v4, "copy");
    v8 = -[MRPlayerPath initWithOrigin:client:player:](v6, "initWithOrigin:client:player:", v7, 0, 0);
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v8;

  }
  return v5;
}

- (MRDestination)initWithEndpoint:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  void *v8;
  MRPlayerPath *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  MRDestination *v14;
  MRDestination *v15;

  v5 = a3;
  v6 = -[MRDestination _init](self, "_init");
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      +[MRDestination localDestination](MRDestination, "localDestination");
      v14 = (MRDestination *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_storeStrong(v6 + 3, a3);
    objc_msgSend(v5, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [MRPlayerPath alloc];
      objc_msgSend(v5, "origin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
      v12 = -[MRPlayerPath initWithOrigin:client:player:](v9, "initWithOrigin:client:player:", v11, 0, 0);
      v13 = v7[4];
      v7[4] = (id)v12;

    }
  }
  v14 = v7;
LABEL_7:
  v15 = v14;

  return v15;
}

- (MRDestination)initWithOutputDeviceUID:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  MRDestination *v8;
  MRDestination *v9;

  v4 = a3;
  v5 = -[MRDestination _init](self, "_init");
  if (v5)
  {
    if (!v4)
    {
      +[MRDestination localDestination](MRDestination, "localDestination");
      v8 = (MRDestination *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  v8 = v5;
LABEL_6:
  v9 = v8;

  return v9;
}

- (MRDestination)initWithOutputContextUID:(id)a3
{
  id v5;
  MRDestination *v6;
  uint64_t v7;
  NSString *outputContextUID;
  void *v10;

  v5 = a3;
  v6 = -[MRDestination _init](self, "_init");
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRDestination.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputContextUID"));

    }
    v7 = objc_msgSend(v5, "copy");
    outputContextUID = v6->_outputContextUID;
    v6->_outputContextUID = (NSString *)v7;

  }
  return v6;
}

- (MRDestination)initWithData:(id)a3
{
  id v4;
  _MRDestinationProtobuf *v5;
  MRDestination *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRDestinationProtobuf initWithData:]([_MRDestinationProtobuf alloc], "initWithData:", v4);

    self = -[MRDestination initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRDestination)initWithProtobuf:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  MRPlayerPath *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MRAVDistantEndpoint *v13;
  void *v14;
  MRAVDistantEndpoint *v15;
  MRDestination *v16;
  MRAVDistantEndpoint *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  if (v4)
  {
    v5 = -[MRDestination _init](self, "_init");
    if (v5)
    {
      objc_msgSend(v4, "outputDeviceUID");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v5[1];
      v5[1] = v6;

      v8 = [MRPlayerPath alloc];
      objc_msgSend(v4, "playerPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MRPlayerPath initWithProtobuf:](v8, "initWithProtobuf:", v9);
      v11 = (void *)v5[4];
      v5[4] = v10;

      objc_msgSend(v4, "endpoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = [MRAVDistantEndpoint alloc];
        objc_msgSend(v4, "endpoint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MRAVDistantEndpoint initWithDescriptor:](v13, "initWithDescriptor:", v14);

      }
      else
      {
        v15 = 0;
      }

      if (-[MRAVDistantEndpoint connectionType](v15, "connectionType") == 1)
      {
        +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
        v17 = (MRAVDistantEndpoint *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v15;
      }
      v18 = (void *)v5[3];
      v5[3] = v17;

      objc_msgSend(v4, "outputContextUID");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v5[2];
      v5[2] = v19;

    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRDestination;
  return -[MRDestination init](&v3, sel_init);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  MRAVEndpoint *endpoint;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_outputDeviceUID)
    objc_msgSend(v3, "addObject:");
  if (self->_outputContextUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ctx=%@"), self->_outputContextUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    -[MRAVEndpoint uniqueIdentifier](endpoint, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  if (self->_playerPath)
    objc_msgSend(v4, "addObject:");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %@>"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (MROrigin)origin
{
  void *v2;
  void *v3;

  -[MRDestination playerPath](self, "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MROrigin *)v3;
}

- (void)setOrigin:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6
    || (-[MRDestination playerPath](self, "playerPath"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[MRDestination populatePlayerPathIfNeeded](self, "populatePlayerPathIfNeeded");
    -[MRDestination playerPath](self, "playerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOrigin:", v6);

  }
}

- (MRClient)client
{
  void *v2;
  void *v3;

  -[MRDestination playerPath](self, "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRClient *)v3;
}

- (void)setClient:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6
    || (-[MRDestination playerPath](self, "playerPath"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[MRDestination populatePlayerPathIfNeeded](self, "populatePlayerPathIfNeeded");
    -[MRDestination playerPath](self, "playerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClient:", v6);

  }
}

- (MRPlayer)player
{
  void *v2;
  void *v3;

  -[MRDestination playerPath](self, "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRPlayer *)v3;
}

- (void)setPlayer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6
    || (-[MRDestination playerPath](self, "playerPath"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[MRDestination populatePlayerPathIfNeeded](self, "populatePlayerPathIfNeeded");
    -[MRDestination playerPath](self, "playerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayer:", v6);

  }
}

- (void)populatePlayerPathIfNeeded
{
  void *v3;
  MRPlayerPath *v4;

  -[MRDestination playerPath](self, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MRPlayerPath);
    -[MRDestination setPlayerPath:](self, "setPlayerPath:", v4);

  }
}

- (BOOL)isLocal
{
  char v3;
  NSString *outputDeviceUID;
  void *v5;
  void *v6;

  if (-[MRAVEndpoint isEqual:](self->_endpoint, "isEqual:", MRAVEndpointGetLocalEndpoint(0)))
    return 1;
  outputDeviceUID = self->_outputDeviceUID;
  +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](outputDeviceUID, "isEqual:", v5) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[MRPlayerPath origin](self->_playerPath, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "isLocal");

  }
  return v3;
}

- (BOOL)isProactive
{
  return -[NSString isEqual:](self->_outputDeviceUID, "isEqual:", CFSTR("proactiveEndpoint"));
}

- (BOOL)isUserSelected
{
  return -[NSString isEqual:](self->_outputDeviceUID, "isEqual:", CFSTR("userSelectedEndpoint"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  objc_storeStrong((id *)(v5 + 24), self->_endpoint);
  v6 = -[NSString copyWithZone:](self->_outputContextUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[MRPlayerPath copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRDestination protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRDestinationProtobuf)protobuf
{
  _MRDestinationProtobuf *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_MRDestinationProtobuf);
  -[_MRDestinationProtobuf setOutputDeviceUID:](v3, "setOutputDeviceUID:", self->_outputDeviceUID);
  -[MRAVEndpoint descriptor](self->_endpoint, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDestinationProtobuf setEndpoint:](v3, "setEndpoint:", v4);

  -[MRPlayerPath protobuf](self->_playerPath, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDestinationProtobuf setPlayerPath:](v3, "setPlayerPath:", v5);

  -[_MRDestinationProtobuf setOutputContextUID:](v3, "setOutputContextUID:", self->_outputContextUID);
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
  -[MRDestination protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (MRDestination)initWithCoder:(id)a3
{
  id v4;
  MRDestination *v5;
  void *v6;
  MRDestination *v7;

  v4 = a3;
  v5 = [MRDestination alloc];
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MRDestination initWithProtobuf:](v5, "initWithProtobuf:", v6);
  return v7;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (NSString)outputContextUID
{
  return self->_outputContextUID;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_outputContextUID, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
