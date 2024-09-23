@implementation ASAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *bluetoothIdentifier;
  NSString *identifier;
  ASDiscoveryDescriptor *descriptor;
  NSString *displayName;
  NSString *SSID;
  int64_t state;
  id v11;

  v4 = a3;
  bluetoothIdentifier = self->_bluetoothIdentifier;
  v11 = v4;
  if (bluetoothIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bluetoothIdentifier, CFSTR("bId"));
    v4 = v11;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v11, "encodeObject:forKey:", identifier, CFSTR("aSi"));
    v4 = v11;
  }
  descriptor = self->_descriptor;
  if (descriptor)
  {
    objc_msgSend(v11, "encodeObject:forKey:", descriptor, CFSTR("aDr"));
    v4 = v11;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    objc_msgSend(v11, "encodeObject:forKey:", displayName, CFSTR("dNm"));
    v4 = v11;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    objc_msgSend(v11, "encodeObject:forKey:", SSID, CFSTR("wsd"));
    v4 = v11;
  }
  state = self->_state;
  if (state)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", state, CFSTR("aSt"));
    v4 = v11;
  }

}

- (ASAccessory)initWithCoder:(id)a3
{
  id v4;
  ASAccessory *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  ASAccessory *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  v5 = -[ASAccessory init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v9;
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("aSt")))
      v5->_state = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("aSt"));

    v11 = v5;
  }
  else
  {
    v13 = objc_opt_class();
    ASErrorF(1, (uint64_t)"%@ init failed", v14, v15, v16, v17, v18, v19, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v20);

  }
  return v5;
}

- (ASAccessory)initWithDADevice:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *identifier;
  NSString *v14;
  NSString *v15;
  NSUUID *bluetoothIdentifier;
  NSUUID **p_bluetoothIdentifier;
  NSUUID *v18;
  void *v19;
  void *v20;
  void *v21;
  ASDiscoveryDescriptor *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *displayName;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  int64_t v31;
  NSString *SSID;
  NSString **p_SSID;
  NSString *v34;
  ASAccessory *v35;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "flags") & 8) != 0
    && (self = -[ASAccessory init](self, "init")) != 0
    && (objc_msgSend(v6, "flags") & 8) != 0)
  {
    objc_msgSend(v6, "appAccessInfoMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
        identifier = self->_identifier;
        self->_identifier = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        identifier = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(identifier, "UUIDString");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v15 = self->_identifier;
        self->_identifier = v14;

      }
      if ((objc_msgSend(v9, "accessoryOptions") & 1) != 0)
      {
        objc_msgSend(v6, "bluetoothIdentifier");
        v18 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        p_bluetoothIdentifier = &self->_bluetoothIdentifier;
        bluetoothIdentifier = self->_bluetoothIdentifier;
        self->_bluetoothIdentifier = v18;
      }
      else
      {
        p_bluetoothIdentifier = &self->_bluetoothIdentifier;
        bluetoothIdentifier = self->_bluetoothIdentifier;
        self->_bluetoothIdentifier = 0;
      }

      objc_msgSend(v6, "appAccessInfoMap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appDiscoveryConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        v22 = -[ASDiscoveryDescriptor initWithDiscoveryConfiguration:]([ASDiscoveryDescriptor alloc], "initWithDiscoveryConfiguration:", v21);
      else
        v22 = 0;
      objc_storeStrong((id *)&self->_descriptor, v22);
      objc_msgSend(v6, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;
      }
      else
      {
        objc_msgSend(v21, "displayName");
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      displayName = self->_displayName;
      self->_displayName = v25;

      objc_msgSend(v6, "appAccessInfoMap");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "state");

      v30 = v29 == 20 || v29 == 10;
      v31 = 10;
      if (!v30)
        v31 = 0;
      if (v29 == 25)
        v31 = 20;
      self->_state = v31;
      if ((objc_msgSend(v9, "accessoryOptions") & 2) != 0)
      {
        objc_msgSend(v6, "SSID");
        v34 = (NSString *)objc_claimAutoreleasedReturnValue();
        p_SSID = &self->_SSID;
        SSID = self->_SSID;
        self->_SSID = v34;
      }
      else
      {
        p_SSID = &self->_SSID;
        SSID = self->_SSID;
        self->_SSID = 0;
      }

      if (*p_bluetoothIdentifier || *p_SSID)
        v35 = self;
      else
        v35 = 0;

    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSUUID *bluetoothIdentifier;
  NSString *identifier;
  id v7;
  const char *v8;
  NSString *displayName;
  id v10;
  const char *v11;
  NSString *SSID;
  id v13;
  const char *v14;
  int64_t state;
  unsigned __int8 uuid[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    -[NSUUID getUUIDBytes:](bluetoothIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "bId", uuid);
  }
  identifier = self->_identifier;
  v7 = v4;
  v8 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v8)
    xpc_dictionary_set_string(v7, "aSi", v8);

  CUXPCEncodeObject();
  displayName = self->_displayName;
  v10 = v7;
  v11 = -[NSString UTF8String](objc_retainAutorelease(displayName), "UTF8String");
  if (v11)
    xpc_dictionary_set_string(v10, "dNm", v11);

  SSID = self->_SSID;
  v13 = v10;
  v14 = -[NSString UTF8String](objc_retainAutorelease(SSID), "UTF8String");
  if (v14)
    xpc_dictionary_set_string(v13, "wsd", v14);

  state = self->_state;
  if (state)
    xpc_dictionary_set_int64(v13, "aSt", state);

}

- (ASAccessory)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ASAccessory *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ASAccessory *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = -[ASAccessory init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  if (MEMORY[0x2349290D0](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_6;
  }
  CUXPCDecodeNSUUID();
  CUXPCDecodeNSString();
  objc_opt_class();
  CUXPCDecodeObject();
  CUXPCDecodeNSString();
  CUXPCDecodeNSString();
  if (CUXPCDecodeSInt64RangedEx() == 6)
    v7->_state = 0;
  v14 = v7;
LABEL_6:

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
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_bluetoothIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_identifier, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[ASDiscoveryDescriptor copy](self->_descriptor, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSString copy](self->_displayName, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_SSID, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v4[1] = self->_state;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ASAccessory *v4;
  ASAccessory *v5;
  ASAccessory *v6;
  NSUUID *bluetoothIdentifier;
  void *v8;
  NSUUID *v9;
  NSUUID *v10;
  NSUUID *v11;
  int v12;
  BOOL v13;
  NSString *identifier;
  void *v15;
  NSString *p_isa;
  NSUUID *v17;
  int v18;
  ASDiscoveryDescriptor *descriptor;
  void *v20;
  ASDiscoveryDescriptor *v21;
  ASDiscoveryDescriptor *v22;
  _BOOL4 v23;
  NSString *displayName;
  void *v25;
  NSString *v26;
  ASDiscoveryDescriptor *v27;
  int v28;
  NSString *SSID;
  void *v30;
  NSString *v31;
  NSString *v32;
  int v33;
  int64_t state;

  v4 = (ASAccessory *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!-[ASAccessory isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v13 = 0;
LABEL_42:

      goto LABEL_43;
    }
    bluetoothIdentifier = self->_bluetoothIdentifier;
    -[ASAccessory bluetoothIdentifier](v6, "bluetoothIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = bluetoothIdentifier;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if ((v9 == 0) == (v10 != 0))
      {
        v13 = 0;
        p_isa = (NSString *)&v10->super.isa;
LABEL_39:

        goto LABEL_40;
      }
      v12 = -[NSUUID isEqual:](v9, "isEqual:", v10);

      if (!v12)
      {
        v13 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    identifier = self->_identifier;
    -[ASAccessory identifier](v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    p_isa = identifier;
    v17 = v15;
    v9 = v17;
    if (p_isa == (NSString *)v17)
    {

    }
    else
    {
      if ((p_isa == 0) == (v17 != 0))
      {
        v13 = 0;
        v21 = (ASDiscoveryDescriptor *)v17;
LABEL_38:

        goto LABEL_39;
      }
      v18 = -[NSString isEqual:](p_isa, "isEqual:", v17);

      if (!v18)
      {
        v13 = 0;
LABEL_40:

        goto LABEL_41;
      }
    }
    descriptor = self->_descriptor;
    -[ASAccessory descriptor](v6, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = descriptor;
    v22 = v20;
    p_isa = (NSString *)&v22->super.isa;
    if (v21 == v22)
    {

    }
    else
    {
      if ((v21 == 0) == (v22 != 0))
      {
        v13 = 0;
        v26 = (NSString *)&v22->super.isa;
LABEL_37:

        goto LABEL_38;
      }
      v23 = -[ASDiscoveryDescriptor isEqual:](v21, "isEqual:", v22);

      if (!v23)
      {
        v13 = 0;
        goto LABEL_39;
      }
    }
    displayName = self->_displayName;
    -[ASAccessory displayName](v6, "displayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = displayName;
    v27 = v25;
    v21 = v27;
    if (v26 == (NSString *)v27)
    {

    }
    else
    {
      if ((v26 == 0) == (v27 != 0))
      {

        goto LABEL_36;
      }
      v28 = -[NSString isEqual:](v26, "isEqual:", v27);

      if (!v28)
      {
        v13 = 0;
        goto LABEL_38;
      }
    }
    SSID = self->_SSID;
    -[ASAccessory SSID](v6, "SSID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = SSID;
    v32 = v30;
    v26 = v32;
    if (v31 == v32)
    {

LABEL_34:
      state = self->_state;
      v13 = state == -[ASAccessory state](v6, "state");
      goto LABEL_37;
    }
    if ((v31 == 0) != (v32 != 0))
    {
      v33 = -[NSString isEqual:](v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_36;
      goto LABEL_34;
    }

LABEL_36:
    v13 = 0;
    goto LABEL_37;
  }
  v13 = 1;
LABEL_43:

  return v13;
}

- (id)description
{
  return -[ASAccessory descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  NSString *identifier;
  id v6;
  NSString *displayName;
  id v8;
  NSUUID *bluetoothIdentifier;
  id v10;
  NSString *SSID;
  id v12;
  __CFString *v13;
  ASDiscoveryDescriptor *descriptor;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  NSString *v19;
  NSString *v20;
  NSUUID *v21;
  NSString *v22;
  ASDiscoveryDescriptor *v23;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = 0;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v19 = identifier;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v20 = displayName;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v21 = bluetoothIdentifier;
    CUAppendF();
    v10 = v4;

    v4 = v10;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v22 = SSID;
    CUAppendF();
    v12 = v4;

    v4 = v12;
  }
  CUAppendF();
  v13 = (__CFString *)v4;

  descriptor = self->_descriptor;
  if (descriptor)
  {
    v23 = descriptor;
    CUAppendF();
    v15 = v13;

    v13 = v15;
  }
  v16 = &stru_250420148;
  if (v13)
    v16 = v13;
  v17 = v16;

  return v17;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)bluetoothTransportBridgingIdentifier
{
  return self->_bluetoothTransportBridgingIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ASDiscoveryDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bluetoothTransportBridgingIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

@end
