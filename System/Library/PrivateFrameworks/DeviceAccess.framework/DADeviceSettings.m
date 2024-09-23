@implementation DADeviceSettings

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  const char *v8;
  NSString *displayName;
  id v10;
  const char *v11;
  NSData *bridgingIdentifier;
  NSData *v13;
  id v14;
  NSData *v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  NSString *SSID;
  const char *v20;
  xpc_object_t xdict;

  v4 = a3;
  -[UTType identifier](self->_iconType, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  if (v8)
    xpc_dictionary_set_string(v6, "dvPT", v8);

  displayName = self->_displayName;
  v10 = v6;
  v11 = -[NSString UTF8String](objc_retainAutorelease(displayName), "UTF8String");
  if (v11)
    xpc_dictionary_set_string(v10, "name", v11);

  bridgingIdentifier = self->_bridgingIdentifier;
  if (bridgingIdentifier)
  {
    v13 = objc_retainAutorelease(bridgingIdentifier);
    v14 = v10;
    v15 = v13;
    v16 = -[NSData bytes](v15, "bytes");
    if (v16)
      v17 = (const char *)v16;
    else
      v17 = "";
    v18 = -[NSData length](v15, "length");

    xpc_dictionary_set_data(v14, "btCa", v17, v18);
  }
  SSID = self->_SSID;
  xdict = v10;
  v20 = -[NSString UTF8String](objc_retainAutorelease(SSID), "UTF8String");
  if (v20)
    xpc_dictionary_set_string(xdict, "ssID", v20);

  if (self->_userInitiated)
    xpc_dictionary_set_BOOL(xdict, "uItd", 1);

}

- (DADeviceSettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DADeviceSettings *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DADeviceSettings *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = -[DADeviceSettings init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      DAErrorF(350004, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  if (MEMORY[0x2199CAB58](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_10;
  }
  if (CUXPCDecodeNSString()
    && CUXPCDecodeNSData()
    && CUXPCDecodeNSString()
    && CUXPCDecodeNSString()
    && CUXPCDecodeBool())
  {
    v14 = v7;
  }
  else
  {
    v14 = 0;
  }

LABEL_10:
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
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSData copy](self->_bridgingIdentifier, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = -[NSString copy](self->_displayName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[UTType copy](self->_iconType, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = -[NSString copy](self->_SSID, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (id)description
{
  return -[DADeviceSettings descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  UTType *iconType;
  UTType *v6;
  __CFString *v7;
  NSString *displayName;
  __CFString *v9;
  NSData *bridgingIdentifier;
  NSData *v11;
  __CFString *v12;
  NSString *SSID;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v19;
  NSString *v20;
  void *v21;
  NSString *v22;

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
  iconType = self->_iconType;
  if (iconType)
  {
    v6 = iconType;
    -[UTType identifier](v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v7 = v4;

    v4 = v7;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v20 = displayName;
    CUAppendF();
    v9 = v4;

    v4 = v9;
  }
  bridgingIdentifier = self->_bridgingIdentifier;
  if (bridgingIdentifier)
  {
    v11 = bridgingIdentifier;
    CUPrintNSDataAddress();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v12 = v4;

    v4 = v12;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v22 = SSID;
    CUAppendF();
    v14 = v4;

    v4 = v14;
  }
  if (self->_userInitiated)
  {
    CUAppendF();
    v15 = v4;

    v4 = v15;
  }
  v16 = &stru_24D169BB8;
  if (v4)
    v16 = v4;
  v17 = v16;

  return v17;
}

- (UTType)iconType
{
  return self->_iconType;
}

- (void)setIconType:(id)a3
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

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)bridgingIdentifier
{
  return self->_bridgingIdentifier;
}

- (void)setBridgingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgingIdentifier, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_iconType, 0);
}

@end
