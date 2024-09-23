@implementation MRRegisterVoiceInputDeviceMessage

- (MRRegisterVoiceInputDeviceMessage)initWithDescriptor:(id)a3
{
  id v4;
  MRRegisterVoiceInputDeviceMessage *v5;
  uint64_t v6;
  MRVirtualVoiceInputDeviceDescriptor *descriptor;
  void *v8;
  _MRRegisterVoiceInputDeviceMessageProtobuf *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRRegisterVoiceInputDeviceMessage;
  v5 = -[MRProtocolMessage init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    descriptor = v5->_descriptor;
    v5->_descriptor = (MRVirtualVoiceInputDeviceDescriptor *)v6;

    -[MRVirtualVoiceInputDeviceDescriptor protobuf](v5->_descriptor, "protobuf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(_MRRegisterVoiceInputDeviceMessageProtobuf);
    -[_MRRegisterVoiceInputDeviceMessageProtobuf setDescriptor:](v9, "setDescriptor:", v8);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v9);

  }
  return v5;
}

- (unint64_t)type
{
  return 28;
}

- (MRVirtualVoiceInputDeviceDescriptor)descriptor
{
  MRVirtualVoiceInputDeviceDescriptor *descriptor;
  MRVirtualVoiceInputDeviceDescriptor *v4;
  void *v5;
  void *v6;
  MRVirtualVoiceInputDeviceDescriptor *v7;
  MRVirtualVoiceInputDeviceDescriptor *v8;

  descriptor = self->_descriptor;
  if (!descriptor)
  {
    v4 = [MRVirtualVoiceInputDeviceDescriptor alloc];
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRVirtualVoiceInputDeviceDescriptor initWithProtobuf:](v4, "initWithProtobuf:", v6);
    v8 = self->_descriptor;
    self->_descriptor = v7;

    descriptor = self->_descriptor;
  }
  return descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
