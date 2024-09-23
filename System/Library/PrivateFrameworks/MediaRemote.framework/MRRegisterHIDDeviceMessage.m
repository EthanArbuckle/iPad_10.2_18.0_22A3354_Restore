@implementation MRRegisterHIDDeviceMessage

- (MRRegisterHIDDeviceMessage)initWithDeviceDescriptor:(id)a3
{
  id v4;
  MRRegisterHIDDeviceMessage *v5;
  _MRRegisterHIDDeviceMessageProtobuf *v6;
  _MRVirtualTouchDeviceDescriptorProtobuf *v7;
  int v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRRegisterHIDDeviceMessage;
  v5 = -[MRProtocolMessage init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRRegisterHIDDeviceMessageProtobuf);
    v7 = objc_alloc_init(_MRVirtualTouchDeviceDescriptorProtobuf);
    -[_MRVirtualTouchDeviceDescriptorProtobuf setAbsolute:](v7, "setAbsolute:", objc_msgSend(v4, "isAbsolute"));
    -[_MRVirtualTouchDeviceDescriptorProtobuf setIntegratedDisplay:](v7, "setIntegratedDisplay:", objc_msgSend(v4, "isIntegratedDisplay"));
    objc_msgSend(v4, "screenSize");
    -[_MRVirtualTouchDeviceDescriptorProtobuf setScreenSizeWidth:](v7, "setScreenSizeWidth:");
    objc_msgSend(v4, "screenSize");
    LODWORD(v9) = v8;
    -[_MRVirtualTouchDeviceDescriptorProtobuf setScreenSizeHeight:](v7, "setScreenSizeHeight:", v9);
    -[_MRRegisterHIDDeviceMessageProtobuf setDeviceDescriptor:](v6, "setDeviceDescriptor:", v7);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (MRVirtualTouchDeviceDescriptor)deviceDescriptor
{
  MRVirtualTouchDeviceDescriptor *deviceDescriptor;
  void *v4;
  MRMutableVirtualTouchDeviceDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  MRVirtualTouchDeviceDescriptor *v16;

  deviceDescriptor = self->_deviceDescriptor;
  if (!deviceDescriptor)
  {
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MRMutableVirtualTouchDeviceDescriptor);
    objc_msgSend(v4, "deviceDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMutableVirtualTouchDeviceDescriptor setAbsolute:](v5, "setAbsolute:", objc_msgSend(v6, "absolute"));

    objc_msgSend(v4, "deviceDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMutableVirtualTouchDeviceDescriptor setIntegratedDisplay:](v5, "setIntegratedDisplay:", objc_msgSend(v7, "integratedDisplay"));

    objc_msgSend(v4, "deviceDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screenSizeWidth");
    v10 = v9;
    objc_msgSend(v4, "deviceDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screenSizeHeight");
    v13 = v12;

    LODWORD(v14) = v10;
    LODWORD(v15) = v13;
    -[MRMutableVirtualTouchDeviceDescriptor setScreenSize:](v5, "setScreenSize:", v14, v15);
    v16 = self->_deviceDescriptor;
    self->_deviceDescriptor = &v5->super;

    deviceDescriptor = self->_deviceDescriptor;
  }
  return deviceDescriptor;
}

- (unint64_t)type
{
  return 6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDescriptor, 0);
}

@end
