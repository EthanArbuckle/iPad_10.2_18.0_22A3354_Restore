@implementation MRDeviceInfoMessage

- (MRDeviceInfoMessage)initWithDeviceInfo:(id)a3
{
  id v4;
  MRDeviceInfoMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDeviceInfoMessage;
  v5 = -[MRProtocolMessage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleIdentifier:", v7);

    objc_msgSend(v6, "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleVersion:", v9);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqualToString:", CFSTR("tvremoted")))
      objc_msgSend(v4, "setBundleIdentifier:", CFSTR("com.apple.tvremotecore.xpc"));
    objc_msgSend(v4, "protobuf");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastSupportedMessageType:", 134);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v12);

  }
  return v5;
}

- (MRDeviceInfo)deviceInfo
{
  MRDeviceInfo *v3;
  void *v4;
  MRDeviceInfo *v5;

  v3 = [MRDeviceInfo alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRDeviceInfo initWithProtobuf:](v3, "initWithProtobuf:", v4);

  -[MRDeviceInfo setLastSupportedProtocolMessageType:](v5, "setLastSupportedProtocolMessageType:", -[MRDeviceInfoMessage _lastSupportedMessageType](self));
  return v5;
}

- (uint64_t)_lastSupportedMessageType
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = (uint64_t)a1;
  if (a1)
  {
    objc_msgSend(a1, "underlyingCodableMessage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hasLastSupportedMessageType"))
    {
      objc_msgSend((id)v1, "underlyingCodableMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v3, "lastSupportedMessageType");

    }
    else
    {
      v1 = 36;
    }

  }
  return v1;
}

- (MRSupportedProtocolMessages)supportedProtocolMessages
{
  MRSupportedProtocolMessages *supportedProtocolMessages;
  MRSupportedProtocolMessages *v4;
  MRSupportedProtocolMessages *v5;

  supportedProtocolMessages = self->_supportedProtocolMessages;
  if (!supportedProtocolMessages)
  {
    v4 = -[MRSupportedProtocolMessages initWithLastSupportedMessageType:]([MRSupportedProtocolMessages alloc], "initWithLastSupportedMessageType:", -[MRDeviceInfoMessage _lastSupportedMessageType](self));
    v5 = self->_supportedProtocolMessages;
    self->_supportedProtocolMessages = v4;

    supportedProtocolMessages = self->_supportedProtocolMessages;
  }
  return supportedProtocolMessages;
}

- (unint64_t)encryptionType
{
  return 2;
}

- (unint64_t)type
{
  return 15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedProtocolMessages, 0);
}

@end
