@implementation AVPairedDevice

+ (id)pairedDevicesConnectedToOutputDevice:(id)a3
{
  return (id)objc_msgSend(a3, "connectedPairedDevices");
}

- (AVPairedDevice)initWithName:(id)a3 ID:(id)a4 modelID:(id)a5 playing:(BOOL)a6 productName:(id)a7
{
  AVPairedDevice *v12;
  AVPairedDeviceInternal *v13;
  AVPairedDevice *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVPairedDevice;
  v12 = -[AVPairedDevice init](&v16, sel_init);
  if (v12 && (v13 = objc_alloc_init(AVPairedDeviceInternal), (v12->_ivars = v13) != 0))
  {
    v12->_ivars->name = (NSString *)objc_msgSend(a3, "copy");
    v12->_ivars->ID = (NSString *)objc_msgSend(a4, "copy");
    v12->_ivars->modelID = (NSString *)objc_msgSend(a5, "copy");
    v12->_ivars->playing = a6;
    v12->_ivars->productName = (NSString *)objc_msgSend(a7, "copy");
    v14 = v12;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  AVPairedDeviceInternal *ivars;
  objc_super v4;

  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPairedDevice;
  -[AVPairedDevice dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  return self->_ivars->name;
}

- (NSString)pairedDeviceID
{
  return self->_ivars->ID;
}

- (NSString)modelID
{
  return self->_ivars->modelID;
}

- (BOOL)isPlaying
{
  return self->_ivars->playing;
}

- (NSString)productName
{
  return self->_ivars->productName;
}

@end
