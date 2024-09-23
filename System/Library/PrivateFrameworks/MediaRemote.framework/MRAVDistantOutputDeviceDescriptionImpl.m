@implementation MRAVDistantOutputDeviceDescriptionImpl

- (MRAVDistantOutputDeviceDescriptionImpl)initWithDescriptor:(id)a3
{
  id v5;
  MRAVDistantOutputDeviceDescriptionImpl *v6;
  MRAVDistantOutputDeviceDescriptionImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVDistantOutputDeviceDescriptionImpl;
  v6 = -[MRAVDistantOutputDeviceDescriptionImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
}

- (unsigned)deviceType
{
  return -[_MRAVOutputDeviceDescriptorProtobuf deviceType](self->_descriptor, "deviceType");
}

- (unsigned)deviceSubtype
{
  return -[_MRAVOutputDeviceDescriptorProtobuf deviceSubType](self->_descriptor, "deviceSubType");
}

- (NSString)uid
{
  return -[_MRAVOutputDeviceDescriptorProtobuf uniqueIdentifier](self->_descriptor, "uniqueIdentifier");
}

- (NSString)name
{
  return -[_MRAVOutputDeviceDescriptorProtobuf name](self->_descriptor, "name");
}

- (NSString)modelID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf modelID](self->_descriptor, "modelID");
}

- (NSString)roomID
{
  return -[_MRAVOutputDeviceDescriptorProtobuf roomID](self->_descriptor, "roomID");
}

- (NSString)roomName
{
  return -[_MRAVOutputDeviceDescriptorProtobuf roomName](self->_descriptor, "roomName");
}

- (BOOL)isClusterLeader
{
  return -[_MRAVOutputDeviceDescriptorProtobuf isClusterLeader](self->_descriptor, "isClusterLeader");
}

- (unsigned)clusterType
{
  return -[_MRAVOutputDeviceDescriptorProtobuf clusterType](self->_descriptor, "clusterType");
}

- (NSArray)subComponents
{
  void *v2;
  void *v3;

  -[_MRAVOutputDeviceDescriptorProtobuf allClusterMembers](self->_descriptor, "allClusterMembers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_122);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

MRAVOutputDeviceDescription *__55__MRAVDistantOutputDeviceDescriptionImpl_subComponents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVOutputDeviceDescription *v3;

  v2 = a2;
  v3 = -[MRAVOutputDeviceDescription initWithDescriptor:]([MRAVOutputDeviceDescription alloc], "initWithDescriptor:", v2);

  return v3;
}

- (BOOL)supportsEngageOnClusterActivation
{
  return -[_MRAVOutputDeviceDescriptorProtobuf engageOnClusterActivate](self->_descriptor, "engageOnClusterActivate");
}

- (_MRAVOutputDeviceDescriptorProtobuf)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
