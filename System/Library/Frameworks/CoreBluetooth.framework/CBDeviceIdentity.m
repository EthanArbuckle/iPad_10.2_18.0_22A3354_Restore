@implementation CBDeviceIdentity

- (CBDeviceIdentity)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBDeviceIdentity *v13;
  int v14;
  CBDeviceIdentity *v15;
  const char *v17;
  uint64_t v18;
  objc_super v19;
  uint64_t v20;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CBDeviceIdentity;
  v13 = -[CBDeviceIdentity init](&v19, sel_init);
  if (!v13)
  {
    if (!a4)
      goto LABEL_21;
    v17 = "CBDeviceIdentity super init failed";
LABEL_20:
    CBErrorF(-6756, (uint64_t)v17, v7, v8, v9, v10, v11, v12, v18);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_21;
    v17 = "XPC non-dict";
    goto LABEL_20;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSUUID()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_21;
  }
  v20 = 0;
  v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5)
      goto LABEL_14;
LABEL_21:
    v15 = 0;
    goto LABEL_15;
  }
  v13->_type = v20;
LABEL_14:
  v15 = v13;
LABEL_15:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  const char *v5;
  NSUUID *bluetoothIdentifier;
  id v7;
  NSString *contactID;
  id v9;
  const char *v10;
  NSData *irkData;
  NSData *v12;
  id v13;
  NSData *v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  NSString *identifier;
  id v19;
  const char *v20;
  NSString *idsDeviceID;
  id v22;
  const char *v23;
  NSString *model;
  id v25;
  const char *v26;
  NSString *name;
  id v28;
  const char *v29;
  int64_t type;
  unsigned __int8 uuid[8];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSString UTF8String](objc_retainAutorelease(self->_accountID), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "acID", v5);
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    *(_QWORD *)uuid = 0;
    v32 = 0;
    v7 = v4;
    -[NSUUID getUUIDBytes:](bluetoothIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v7, "btID", uuid);

  }
  contactID = self->_contactID;
  v9 = v4;
  v10 = -[NSString UTF8String](objc_retainAutorelease(contactID), "UTF8String");
  if (v10)
    xpc_dictionary_set_string(v9, "cnID", v10);

  irkData = self->_irkData;
  if (irkData)
  {
    v12 = objc_retainAutorelease(irkData);
    v13 = v9;
    v14 = v12;
    v15 = -[NSData bytes](v14, "bytes");
    if (v15)
      v16 = (const char *)v15;
    else
      v16 = "";
    v17 = -[NSData length](v14, "length");

    xpc_dictionary_set_data(v13, "irkD", v16, v17);
  }
  identifier = self->_identifier;
  v19 = v9;
  v20 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v20)
    xpc_dictionary_set_string(v19, "id", v20);

  idsDeviceID = self->_idsDeviceID;
  v22 = v19;
  v23 = -[NSString UTF8String](objc_retainAutorelease(idsDeviceID), "UTF8String");
  if (v23)
    xpc_dictionary_set_string(v22, "idsI", v23);

  model = self->_model;
  v25 = v22;
  v26 = -[NSString UTF8String](objc_retainAutorelease(model), "UTF8String");
  if (v26)
    xpc_dictionary_set_string(v25, "md", v26);

  name = self->_name;
  v28 = v25;
  v29 = -[NSString UTF8String](objc_retainAutorelease(name), "UTF8String");
  if (v29)
    xpc_dictionary_set_string(v28, "nm", v29);

  type = self->_type;
  if ((_DWORD)type)
    xpc_dictionary_set_int64(v28, "idTy", type);

}

- (id)description
{
  return -[CBDeviceIdentity descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t type;
  const char *v6;
  id v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  id v12;
  NSUUID *bluetoothIdentifier;
  NSUUID *v14;
  id v15;
  NSString *name;
  id v17;
  NSString *model;
  id v19;
  NSString *accountID;
  id v21;
  NSString *contactID;
  id v23;
  NSData *irkData;
  NSData *v25;
  id v26;
  id v27;
  id v28;
  const char *v30;
  void *v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  void *v36;

  type = self->_type;
  if (type > 6)
    v6 = "?";
  else
    v6 = off_1E5400400[type];
  v30 = v6;
  NSAppendPrintF_safe();
  v7 = 0;
  v8 = self->_identifier;
  v9 = self->_idsDeviceID;
  if ((-[NSString isEqual:](v9, "isEqual:", v8, v30) & 1) != 0)
  {
    v10 = v8;
    v8 = 0;
  }
  else
  {
    if (!v8)
      goto LABEL_9;
    NSAppendPrintF_safe();
    v11 = v7;
    v10 = (NSString *)v7;
    v7 = v11;
  }

LABEL_9:
  if (v9)
  {
    NSAppendPrintF_safe();
    v12 = v7;

    v7 = v12;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v14 = bluetoothIdentifier;
    -[NSUUID UUIDString](v14, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v15 = v7;

    v7 = v15;
  }
  name = self->_name;
  if (name)
  {
    v32 = name;
    NSAppendPrintF_safe();
    v17 = v7;

    v7 = v17;
  }
  model = self->_model;
  if (model)
  {
    v33 = model;
    NSAppendPrintF_safe();
    v19 = v7;

    v7 = v19;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    v34 = accountID;
    NSAppendPrintF_safe();
    v21 = v7;

    v7 = v21;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    v35 = contactID;
    NSAppendPrintF_safe();
    v23 = v7;

    v7 = v23;
  }
  irkData = self->_irkData;
  if (irkData)
  {
    v25 = irkData;
    CUPrintNSObjectMasked();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v26 = v7;

    v7 = v26;
  }
  if (a3 <= 20)
  {
    NSAppendPrintF_safe();
    v27 = v7;

    v7 = v27;
  }
  v28 = v7;

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  CBDeviceIdentity *v4;
  CBDeviceIdentity *v5;
  void *v6;
  NSString *accountID;
  id v8;
  NSString *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  NSUUID *bluetoothIdentifier;
  NSUUID *v15;
  int v16;
  void *v17;
  NSString *contactID;
  NSString *v19;
  int v20;
  void *v21;
  NSString *identifier;
  NSString *v23;
  int v24;
  void *v25;
  NSString *idsDeviceID;
  NSString *v27;
  int v28;
  void *v29;
  NSData *irkData;
  NSData *v31;
  int v32;
  void *v33;
  NSString *model;
  NSString *v35;
  int v36;
  void *v37;
  NSString *name;
  NSString *v39;
  int v40;

  v4 = (CBDeviceIdentity *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CBDeviceIdentity accountID](v5, "accountID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      accountID = self->_accountID;
      v8 = v6;
      v9 = accountID;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if ((v8 == 0) == (v9 != 0))
          goto LABEL_44;
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_45;
      }
      -[CBDeviceIdentity bluetoothIdentifier](v5, "bluetoothIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      bluetoothIdentifier = self->_bluetoothIdentifier;
      v8 = v13;
      v15 = bluetoothIdentifier;
      if (v8 == v15)
      {

      }
      else
      {
        v10 = v15;
        if ((v8 == 0) == (v15 != 0))
          goto LABEL_44;
        v16 = objc_msgSend(v8, "isEqual:", v15);

        if (!v16)
          goto LABEL_45;
      }
      -[CBDeviceIdentity contactID](v5, "contactID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      contactID = self->_contactID;
      v8 = v17;
      v19 = contactID;
      if (v8 == v19)
      {

      }
      else
      {
        v10 = v19;
        if ((v8 == 0) == (v19 != 0))
          goto LABEL_44;
        v20 = objc_msgSend(v8, "isEqual:", v19);

        if (!v20)
          goto LABEL_45;
      }
      -[CBDeviceIdentity identifier](v5, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v8 = v21;
      v23 = identifier;
      if (v8 == v23)
      {

      }
      else
      {
        v10 = v23;
        if ((v8 == 0) == (v23 != 0))
          goto LABEL_44;
        v24 = objc_msgSend(v8, "isEqual:", v23);

        if (!v24)
          goto LABEL_45;
      }
      -[CBDeviceIdentity idsDeviceID](v5, "idsDeviceID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      idsDeviceID = self->_idsDeviceID;
      v8 = v25;
      v27 = idsDeviceID;
      if (v8 == v27)
      {

      }
      else
      {
        v10 = v27;
        if ((v8 == 0) == (v27 != 0))
          goto LABEL_44;
        v28 = objc_msgSend(v8, "isEqual:", v27);

        if (!v28)
          goto LABEL_45;
      }
      -[CBDeviceIdentity irkData](v5, "irkData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      irkData = self->_irkData;
      v8 = v29;
      v31 = irkData;
      if (v8 == v31)
      {

      }
      else
      {
        v10 = v31;
        if ((v8 == 0) == (v31 != 0))
          goto LABEL_44;
        v32 = objc_msgSend(v8, "isEqual:", v31);

        if (!v32)
          goto LABEL_45;
      }
      -[CBDeviceIdentity model](v5, "model");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      model = self->_model;
      v8 = v33;
      v35 = model;
      if (v8 == v35)
      {

      }
      else
      {
        v10 = v35;
        if ((v8 == 0) == (v35 != 0))
          goto LABEL_44;
        v36 = objc_msgSend(v8, "isEqual:", v35);

        if (!v36)
          goto LABEL_45;
      }
      -[CBDeviceIdentity name](v5, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      v8 = v37;
      v39 = name;
      if (v8 == v39)
      {

LABEL_49:
        v12 = -[CBDeviceIdentity type](v5, "type") == self->_type;
        goto LABEL_46;
      }
      v10 = v39;
      if ((v8 == 0) != (v39 != 0))
      {
        v40 = objc_msgSend(v8, "isEqual:", v39);

        if (v40)
          goto LABEL_49;
LABEL_45:
        v12 = 0;
LABEL_46:

        goto LABEL_47;
      }
LABEL_44:

      goto LABEL_45;
    }
    v12 = 0;
  }
LABEL_47:

  return v12;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
