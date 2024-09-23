@implementation MRAVConcreteOutputDeviceDescriptionImpl

- (MRAVConcreteOutputDeviceDescriptionImpl)initWithAVDescription:(id)a3
{
  id v5;
  MRAVConcreteOutputDeviceDescriptionImpl *v6;
  MRAVConcreteOutputDeviceDescriptionImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVConcreteOutputDeviceDescriptionImpl;
  v6 = -[MRAVConcreteOutputDeviceDescriptionImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_avDescription, a3);

  return v7;
}

- (unsigned)deviceType
{
  return MRAVOutputDeviceTypeFromAVType(-[AVOutputDeviceDescription deviceType](self->_avDescription, "deviceType"));
}

- (unsigned)deviceSubtype
{
  return MRAVOutputDeviceSubtypeFromAVSubtype(-[AVOutputDeviceDescription deviceSubType](self->_avDescription, "deviceSubType"));
}

- (NSString)uid
{
  return (NSString *)-[AVOutputDeviceDescription deviceID](self->_avDescription, "deviceID");
}

- (NSString)name
{
  return (NSString *)-[AVOutputDeviceDescription deviceName](self->_avDescription, "deviceName");
}

- (NSString)modelID
{
  return (NSString *)-[AVOutputDeviceDescription modelID](self->_avDescription, "modelID");
}

- (NSString)roomID
{
  return 0;
}

- (NSString)roomName
{
  return 0;
}

- (BOOL)isClusterLeader
{
  return -[AVOutputDeviceDescription isClusterLeader](self->_avDescription, "isClusterLeader");
}

- (unsigned)clusterType
{
  return 0;
}

- (NSArray)subComponents
{
  return 0;
}

- (BOOL)supportsEngageOnClusterActivation
{
  return 0;
}

- (AVOutputDeviceDescription)avDescription
{
  return self->_avDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avDescription, 0);
}

@end
