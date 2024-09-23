@implementation AVClusterComponentOutputDeviceDescription

- (AVClusterComponentOutputDeviceDescription)initWithDeviceID:(id)a3 deviceName:(id)a4 deviceSubType:(int64_t)a5 isClusterLeader:(BOOL)a6 modelID:(id)a7
{
  AVClusterComponentOutputDeviceDescription *v12;
  uint64_t v13;
  uint64_t v14;
  AVClusterComponentOutputDeviceDescription *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVClusterComponentOutputDeviceDescription;
  v12 = -[AVClusterComponentOutputDeviceDescription init](&v17, sel_init);
  if (v12
    && (v13 = objc_msgSend(a3, "copy"), (v12->_deviceID = (NSString *)v13) != 0)
    && (v14 = objc_msgSend(a4, "copy"), (v12->_deviceName = (NSString *)v14) != 0))
  {
    v12->_modelID = (NSString *)objc_msgSend(a7, "copy");
    v12->_deviceType = 0;
    v12->_deviceSubType = a5;
    v12->_isClusterLeader = a6;
    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVClusterComponentOutputDeviceDescription;
  -[AVClusterComponentOutputDeviceDescription dealloc](&v3, sel_dealloc);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)deviceSubType
{
  return self->_deviceSubType;
}

- (BOOL)isClusterLeader
{
  return self->_isClusterLeader;
}

- (NSString)modelID
{
  return self->_modelID;
}

@end
