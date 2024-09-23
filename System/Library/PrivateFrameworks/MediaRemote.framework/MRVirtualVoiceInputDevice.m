@implementation MRVirtualVoiceInputDevice

- (MRVirtualVoiceInputDevice)initWithDeviceID:(unsigned int)a3
{
  MRVirtualVoiceInputDevice *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRVirtualVoiceInputDevice;
  result = -[MRVirtualVoiceInputDevice init](&v5, sel_init);
  if (result)
  {
    result->_deviceID = a3;
    result->_recordingState = 2;
  }
  return result;
}

- (MRVirtualVoiceInputDevice)initWithData:(id)a3
{
  id v4;
  MRVirtualVoiceInputDevice *v5;
  _MRVoiceInputDevice *v6;
  MRVirtualVoiceInputDeviceDescriptor *v7;
  void *v8;
  uint64_t v9;
  MRVirtualVoiceInputDeviceDescriptor *descriptor;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRVirtualVoiceInputDevice;
  v5 = -[MRVirtualVoiceInputDevice init](&v12, sel_init);
  if (v5)
  {
    v6 = -[_MRVoiceInputDevice initWithData:]([_MRVoiceInputDevice alloc], "initWithData:", v4);
    v5->_deviceID = -[_MRVoiceInputDevice deviceID](v6, "deviceID");
    v5->_recordingState = -[_MRVoiceInputDevice recordingState](v6, "recordingState");
    v7 = [MRVirtualVoiceInputDeviceDescriptor alloc];
    -[_MRVoiceInputDevice descriptor](v6, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MRVirtualVoiceInputDeviceDescriptor initWithProtobuf:](v7, "initWithProtobuf:", v8);
    descriptor = v5->_descriptor;
    v5->_descriptor = (MRVirtualVoiceInputDeviceDescriptor *)v9;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("NotRecording");
  if (self->_recordingState == 1)
    v7 = CFSTR("Recording");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %u, recordingState=%@, descriptor=%@>"), v5, self, self->_deviceID, v7, self->_descriptor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)data
{
  _MRVoiceInputDevice *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_MRVoiceInputDevice);
  -[_MRVoiceInputDevice setDeviceID:](v3, "setDeviceID:", self->_deviceID);
  -[_MRVoiceInputDevice setRecordingState:](v3, "setRecordingState:", self->_recordingState);
  -[MRVirtualVoiceInputDeviceDescriptor protobuf](self->_descriptor, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVoiceInputDevice setDescriptor:](v3, "setDescriptor:", v4);

  -[_MRVoiceInputDevice data](v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (MRVirtualVoiceInputDeviceDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)recordingState
{
  return self->_recordingState;
}

- (void)setRecordingState:(unsigned int)a3
{
  self->_recordingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
