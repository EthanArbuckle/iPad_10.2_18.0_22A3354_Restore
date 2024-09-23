@implementation DABluetoothDeviceAccessInfo

- (DABluetoothDeviceAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DABluetoothDeviceAccessInfo *v7;
  DABluetoothDeviceAccessInfo *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DABluetoothDeviceAccessInfo;
  v7 = -[DABluetoothDeviceAccessInfo init](&v17, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v10 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v11, v12, v13, v14, v15, v16, v10);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_4;
  }
  if (!CUXPCDecodeNSUUID())
    goto LABEL_7;
  v8 = v7;
LABEL_4:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSUUID *identifier;
  unsigned __int8 uuid[16];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  identifier = self->_identifier;
  if (identifier)
  {
    -[NSUUID getUUIDBytes:](identifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "id", uuid);
  }

}

- (id)description
{
  return -[DABluetoothDeviceAccessInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  NSUUID *identifier;
  NSUUID *v7;
  id v8;
  NSArray *bluetoothServices;
  NSArray *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v16;
  void *v17;
  void *v18;

  CUAppendF();
  v4 = 0;
  v5 = v4;
  identifier = self->_identifier;
  if (identifier)
  {
    v18 = v4;
    v7 = identifier;
    CUPrintNSObjectOneLine();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v8 = v18;

    v5 = v8;
  }
  bluetoothServices = self->_bluetoothServices;
  if (bluetoothServices)
  {
    v10 = bluetoothServices;
    CUPrintNSObjectOneLine();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v11 = v5;

    v5 = v11;
  }
  CUAppendF();
  v12 = v5;

  v13 = &stru_24D169BB8;
  if (v12)
    v13 = v12;
  v14 = v13;

  return v14;
}

- (NSArray)bluetoothServices
{
  return self->_bluetoothServices;
}

- (void)setBluetoothServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bluetoothServices, 0);
}

@end
