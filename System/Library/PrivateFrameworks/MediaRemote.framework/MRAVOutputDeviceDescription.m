@implementation MRAVOutputDeviceDescription

- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5
{
  return -[MRAVOutputDeviceDescription initWithDeviceType:deviceSubtype:uid:name:](self, "initWithDeviceType:deviceSubtype:uid:name:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0);
}

- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5 name:(id)a6
{
  return -[MRAVOutputDeviceDescription initWithDeviceType:deviceSubtype:uid:name:modelID:](self, "initWithDeviceType:deviceSubtype:uid:name:modelID:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (MRAVOutputDeviceDescription)initWithDeviceType:(unsigned int)a3 deviceSubtype:(unsigned int)a4 uid:(id)a5 name:(id)a6 modelID:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  _MRAVOutputDeviceDescriptorProtobuf *v15;
  MRAVOutputDeviceDescription *v16;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v15, "setUniqueIdentifier:", v14);

  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v15, "setDeviceType:", v10);
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v15, "setDeviceSubType:", v9);
  -[_MRAVOutputDeviceDescriptorProtobuf setName:](v15, "setName:", v13);

  -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](v15, "setModelID:", v12);
  v16 = -[MRAVOutputDeviceDescription initWithDescriptor:](self, "initWithDescriptor:", v15);

  return v16;
}

- (MRAVOutputDeviceDescription)initWithAVDescription:(id)a3
{
  id v4;
  MRAVOutputDeviceDescription *v5;
  MRAVConcreteOutputDeviceDescriptionImpl *v6;
  MRAVOutputDeviceDescriptionImpl *impl;
  uint64_t v8;
  NSArray *subComponents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputDeviceDescription;
  v5 = -[MRAVOutputDeviceDescription init](&v11, sel_init);
  if (v5)
  {
    v6 = -[MRAVConcreteOutputDeviceDescriptionImpl initWithAVDescription:]([MRAVConcreteOutputDeviceDescriptionImpl alloc], "initWithAVDescription:", v4);
    impl = v5->_impl;
    v5->_impl = (MRAVOutputDeviceDescriptionImpl *)v6;

    -[MRAVOutputDeviceDescriptionImpl subComponents](v5->_impl, "subComponents");
    v8 = objc_claimAutoreleasedReturnValue();
    subComponents = v5->_subComponents;
    v5->_subComponents = (NSArray *)v8;

  }
  return v5;
}

- (MRAVOutputDeviceDescription)initWithDescriptor:(id)a3
{
  id v4;
  MRAVOutputDeviceDescription *v5;
  MRAVDistantOutputDeviceDescriptionImpl *v6;
  MRAVOutputDeviceDescriptionImpl *impl;
  uint64_t v8;
  NSArray *subComponents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputDeviceDescription;
  v5 = -[MRAVOutputDeviceDescription init](&v11, sel_init);
  if (v5)
  {
    v6 = -[MRAVDistantOutputDeviceDescriptionImpl initWithDescriptor:]([MRAVDistantOutputDeviceDescriptionImpl alloc], "initWithDescriptor:", v4);
    impl = v5->_impl;
    v5->_impl = (MRAVOutputDeviceDescriptionImpl *)v6;

    -[MRAVOutputDeviceDescriptionImpl subComponents](v5->_impl, "subComponents");
    v8 = objc_claimAutoreleasedReturnValue();
    subComponents = v5->_subComponents;
    v5->_subComponents = (NSArray *)v8;

  }
  return v5;
}

- (_MRAVOutputDeviceDescriptorProtobuf)descriptor
{
  _MRAVOutputDeviceDescriptorProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  -[MRAVOutputDeviceDescription uid](self, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v3, "setUniqueIdentifier:", v4);

  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v3, "setDeviceSubType:", -[MRAVOutputDeviceDescription deviceSubtype](self, "deviceSubtype"));
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v3, "setDeviceType:", -[MRAVOutputDeviceDescription deviceType](self, "deviceType"));
  -[MRAVOutputDeviceDescription name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setName:](v3, "setName:", v5);

  -[MRAVOutputDeviceDescription modelID](self, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](v3, "setModelID:", v6);

  -[MRAVOutputDeviceDescription roomName](self, "roomName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setRoomName:](v3, "setRoomName:", v7);

  -[MRAVOutputDeviceDescription roomID](self, "roomID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setRoomID:](v3, "setRoomID:", v8);

  -[_MRAVOutputDeviceDescriptorProtobuf setClusterType:](v3, "setClusterType:", -[MRAVOutputDeviceDescription clusterType](self, "clusterType"));
  -[MRAVOutputDeviceDescription subComponents](self, "subComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "msv_map:", &__block_literal_global_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[_MRAVOutputDeviceDescriptorProtobuf setAllClusterMembers:](v3, "setAllClusterMembers:", v11);

  -[_MRAVOutputDeviceDescriptorProtobuf setEngageOnClusterActivate:](v3, "setEngageOnClusterActivate:", -[MRAVOutputDeviceDescription supportsEngageOnClusterActivation](self, "supportsEngageOnClusterActivation"));
  return v3;
}

uint64_t __41__MRAVOutputDeviceDescription_descriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRAVOutputDeviceDescription name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDeviceDescription uid](self, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MRAVOutputDeviceTypeCopyDescription(-[MRAVOutputDeviceDescription deviceType](self, "deviceType"));
  v8 = MRAVOutputDeviceSubtypeCopyDescription(-[MRAVOutputDeviceDescription deviceSubtype](self, "deviceSubtype"));
  -[MRAVOutputDeviceDescription modelID](self, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDeviceDescription roomName](self, "roomName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputDeviceDescription roomID](self, "roomID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MRAVOutputDeviceDescription clusterType](self, "clusterType") - 1;
  if (v12 > 2)
    v13 = CFSTR("None");
  else
    v13 = off_1E30C5C30[v12];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@:%@ %@:%@:%@ room=%@:%@ clusterType=%@>"), v4, self, v5, v6, v7, v8, v9, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)composedTypeDescription
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MRAVOutputDeviceTypeCopyDescription(-[MRAVOutputDeviceDescription deviceType](self, "deviceType"));
  objc_msgSend(v3, "addObject:", v4);

  if (-[MRAVOutputDeviceDescription deviceType](self, "deviceType") == 1)
    objc_msgSend(v3, "addObject:", CFSTR("2"));
  v5 = MRAVOutputDeviceSubtypeCopyDescription(-[MRAVOutputDeviceDescription deviceSubtype](self, "deviceSubtype"));
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  MRAVOutputDeviceDescription *v4;
  MRAVOutputDeviceDescription *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MRAVOutputDeviceDescription *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRAVOutputDeviceDescription uid](self, "uid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVOutputDeviceDescription uid](v5, "uid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRAVOutputDeviceDescription uid](self, "uid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)deviceType
{
  return -[MRAVOutputDeviceDescriptionImpl deviceType](self->_impl, "deviceType");
}

- (unsigned)deviceSubtype
{
  return -[MRAVOutputDeviceDescriptionImpl deviceSubtype](self->_impl, "deviceSubtype");
}

- (NSString)uid
{
  return (NSString *)-[MRAVOutputDeviceDescriptionImpl uid](self->_impl, "uid");
}

- (NSString)name
{
  return (NSString *)-[MRAVOutputDeviceDescriptionImpl name](self->_impl, "name");
}

- (NSString)modelID
{
  return (NSString *)-[MRAVOutputDeviceDescriptionImpl modelID](self->_impl, "modelID");
}

- (NSString)roomID
{
  return (NSString *)-[MRAVOutputDeviceDescriptionImpl roomID](self->_impl, "roomID");
}

- (NSString)roomName
{
  return (NSString *)-[MRAVOutputDeviceDescriptionImpl roomName](self->_impl, "roomName");
}

- (BOOL)isClusterLeader
{
  return -[MRAVOutputDeviceDescriptionImpl isClusterLeader](self->_impl, "isClusterLeader");
}

- (unsigned)clusterType
{
  return -[MRAVOutputDeviceDescriptionImpl clusterType](self->_impl, "clusterType");
}

- (BOOL)supportsEngageOnClusterActivation
{
  return -[MRAVOutputDeviceDescriptionImpl supportsEngageOnClusterActivation](self->_impl, "supportsEngageOnClusterActivation");
}

- (NSArray)subComponents
{
  return self->_subComponents;
}

- (BOOL)containsUID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[MRAVOutputDeviceDescription uid](self, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[MRAVOutputDeviceDescription subComponents](self, "subComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__MRAVOutputDeviceDescription_containsUID___block_invoke;
    v10[3] = &unk_1E30C5BF0;
    v11 = v4;
    objc_msgSend(v7, "msv_firstWhere:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;

  }
  return v6;
}

uint64_t __43__MRAVOutputDeviceDescription_containsUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (void)setSubComponents:(id)a3
{
  objc_storeStrong((id *)&self->_subComponents, a3);
}

- (MRAVOutputDeviceDescriptionImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_subComponents, 0);
}

@end
