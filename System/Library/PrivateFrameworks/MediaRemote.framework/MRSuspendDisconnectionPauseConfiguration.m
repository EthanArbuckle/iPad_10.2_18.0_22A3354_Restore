@implementation MRSuspendDisconnectionPauseConfiguration

- (MRSuspendDisconnectionPauseConfiguration)initWithXPCMessage:(id)a3
{
  id v4;
  MRSuspendDisconnectionPauseConfiguration *v5;
  uint64_t v6;
  NSString *deviceAddress;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRSuspendDisconnectionPauseConfiguration;
  v5 = -[MRSuspendDisconnectionPauseConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(v4, (const char *)MRSuspendDisconnectionPauseConfigurationKeyDeviceAddress), 4);
    v6 = objc_claimAutoreleasedReturnValue();
    deviceAddress = v5->_deviceAddress;
    v5->_deviceAddress = (NSString *)v6;

  }
  return v5;
}

- (id)XPCMessage
{
  xpc_object_t v3;
  const char *v4;
  id v5;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "MRXPC_MESSAGE_ID_KEY", 0x100000000000019uLL);
  v4 = (const char *)MRSuspendDisconnectionPauseConfigurationKeyDeviceAddress;
  -[MRSuspendDisconnectionPauseConfiguration deviceAddress](self, "deviceAddress");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v3, v4, (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

  return v3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end
