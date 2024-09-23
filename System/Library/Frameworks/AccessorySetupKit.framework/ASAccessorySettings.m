@implementation ASAccessorySettings

+ (ASAccessorySettings)defaultSettings
{
  return objc_alloc_init(ASAccessorySettings);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAccessorySettings)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  objc_opt_class();
  NSDecodeObjectIfPresent();
  v5 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v6 = v5;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *displayName;
  NSString *SSID;
  NSData *bluetoothTransportBridgingIdentifier;
  id v8;

  v4 = a3;
  displayName = self->_displayName;
  v8 = v4;
  if (displayName)
  {
    objc_msgSend(v4, "encodeObject:forKey:", displayName, CFSTR("dNm"));
    v4 = v8;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    objc_msgSend(v8, "encodeObject:forKey:", SSID, CFSTR("wsd"));
    v4 = v8;
  }
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", bluetoothTransportBridgingIdentifier, CFSTR("mPid"));
    v4 = v8;
  }

}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  const char *v5;
  NSString *SSID;
  const char *v7;
  NSData *bluetoothTransportBridgingIdentifier;
  NSData *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  size_t v13;
  xpc_object_t xdict;

  v4 = a3;
  v5 = -[NSString UTF8String](objc_retainAutorelease(self->_displayName), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "dNm", v5);
  SSID = self->_SSID;
  xdict = v4;
  v7 = -[NSString UTF8String](objc_retainAutorelease(SSID), "UTF8String");
  if (v7)
    xpc_dictionary_set_string(xdict, "wsd", v7);

  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    v9 = objc_retainAutorelease(bluetoothTransportBridgingIdentifier);
    v10 = xdict;
    v11 = -[NSData bytes](v9, "bytes");
    if (v11)
      v12 = (const char *)v11;
    else
      v12 = "";
    v13 = -[NSData length](v9, "length");

    xpc_dictionary_set_data(v10, "mPid", v12, v13);
  }

}

- (ASAccessorySettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ASAccessorySettings *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ASAccessorySettings *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = -[ASAccessorySettings init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  if (MEMORY[0x2349290D0](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_7;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_12;
  }
  v14 = v7;
LABEL_7:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_displayName, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSString copy](self->_SSID, "copy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  v9 = -[NSData copy](self->_bluetoothTransportBridgingIdentifier, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (id)description
{
  return -[ASAccessorySettings descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  NSString *displayName;
  __CFString *v6;
  NSString *SSID;
  __CFString *v8;
  NSData *bluetoothTransportBridgingIdentifier;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSString *v14;
  NSString *v15;
  NSData *v16;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v14 = displayName;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v15 = SSID;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  bluetoothTransportBridgingIdentifier = self->_bluetoothTransportBridgingIdentifier;
  if (bluetoothTransportBridgingIdentifier)
  {
    v16 = bluetoothTransportBridgingIdentifier;
    CUAppendF();
    v10 = v4;

    v4 = v10;
  }
  v11 = &stru_250420148;
  if (v4)
    v11 = v4;
  v12 = v11;

  return v12;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)bluetoothTransportBridgingIdentifier
{
  return self->_bluetoothTransportBridgingIdentifier;
}

- (void)setBluetoothTransportBridgingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bluetoothTransportBridgingIdentifier, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
