@implementation BTAudioRoutingResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTAudioRoutingResponse)initWithCoder:(id)a3
{
  id v4;
  BTAudioRoutingResponse *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BTAudioRoutingResponse *v10;

  v4 = a3;
  v5 = -[BTAudioRoutingResponse init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_action = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t action;
  uint64_t clientID;
  NSString *deviceAddress;
  NSError *error;
  NSString *reason;
  NSDictionary *wxInfo;
  id v11;

  v4 = a3;
  action = self->_action;
  v11 = v4;
  if ((_DWORD)action)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", action, CFSTR("actn"));
    v4 = v11;
  }
  clientID = self->_clientID;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v11;
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    objc_msgSend(v11, "encodeObject:forKey:", deviceAddress, CFSTR("dAdr"));
    v4 = v11;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v11, "encodeObject:forKey:", error, CFSTR("err"));
    v4 = v11;
  }
  reason = self->_reason;
  if (reason)
  {
    objc_msgSend(v11, "encodeObject:forKey:", reason, CFSTR("reas"));
    v4 = v11;
  }
  wxInfo = self->_wxInfo;
  if (wxInfo)
  {
    objc_msgSend(v11, "encodeObject:forKey:", wxInfo, CFSTR("wxif"));
    v4 = v11;
  }

}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)wxInfo
{
  return self->_wxInfo;
}

- (void)setWxInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_wxInfo, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end
