@implementation DABluetoothPairingInfo

- (DABluetoothPairingInfo)initWithBluetoothIdentifier:(id)a3 pairingType:(int64_t)a4
{
  id v7;
  DABluetoothPairingInfo *v8;
  DABluetoothPairingInfo *v9;
  NSNumber *passkey;
  DABluetoothPairingInfo *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DABluetoothPairingInfo;
  v8 = -[DABluetoothPairingInfo init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_accept = 0;
    objc_storeStrong((id *)&v8->_bluetoothIdentifier, a3);
    passkey = v9->_passkey;
    v9->_pairingType = a4;
    v9->_passkey = 0;

    v11 = v9;
  }

  return v9;
}

- (DABluetoothPairingInfo)initWithBluetoothIdentifier:(id)a3 pairedCTKD:(BOOL)a4 appConfirmsAuth:(BOOL)a5 pairingRequired:(BOOL)a6
{
  id v11;
  DABluetoothPairingInfo *v12;
  DABluetoothPairingInfo *v13;
  NSNumber *passkey;
  DABluetoothPairingInfo *v15;
  objc_super v17;

  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DABluetoothPairingInfo;
  v12 = -[DABluetoothPairingInfo init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_accept = 0;
    objc_storeStrong((id *)&v12->_bluetoothIdentifier, a3);
    passkey = v13->_passkey;
    v13->_pairingType = 0;
    v13->_passkey = 0;

    v13->_pairedWithCTKD = a4;
    v13->_appConfirmsAuth = a5;
    v13->_pairingRequired = a6;
    v15 = v13;
  }

  return v13;
}

- (DABluetoothPairingInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  NSNumber *v7;
  NSNumber *passkey;
  DABluetoothPairingInfo *v9;

  v5 = a3;
  if (!self || !CUXPCDecodeBool() || CUXPCDecodeSInt64RangedEx() == 5)
    goto LABEL_11;
  v6 = CUXPCDecodeSInt64RangedEx();
  if (v6 == 6)
  {
    self->_pairingType = 0;
  }
  else if (v6 == 5)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_10;
  }
  if (!CUXPCDecodeNSUUID() || !CUXPCDecodeBool())
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  passkey = self->_passkey;
  self->_passkey = v7;

  v9 = self;
LABEL_10:

  return v9;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t pairingType;
  NSUUID *bluetoothIdentifier;
  id v9;
  unsigned __int8 uuid[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_accept)
    xpc_dictionary_set_BOOL(v4, "btPA", 1);
  v6 = -[NSNumber intValue](self->_passkey, "intValue");
  if (v6)
    xpc_dictionary_set_int64(v5, "btPk", v6);
  pairingType = self->_pairingType;
  if (pairingType)
    xpc_dictionary_set_int64(v5, "btPT", pairingType);
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v9 = v5;
    -[NSUUID getUUIDBytes:](bluetoothIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v9, "devi", uuid);

  }
  if (self->_pairedWithCTKD)
    xpc_dictionary_set_BOOL(v5, "btPC", 1);

}

- (id)description
{
  return -[DABluetoothPairingInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v3 = 0;
  }
  CUAppendF();
  v4 = v3;

  CUAppendF();
  v5 = v4;

  CUAppendF();
  v6 = v5;

  CUAppendF();
  v7 = v6;

  CUAppendF();
  v8 = (__CFString *)v7;

  v9 = &stru_24D169BB8;
  if (v8)
    v9 = v8;
  v10 = v9;

  return v10;
}

- (BOOL)accept
{
  return self->_accept;
}

- (void)setAccept:(BOOL)a3
{
  self->_accept = a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (NSNumber)passkey
{
  return self->_passkey;
}

- (void)setPasskey:(id)a3
{
  objc_storeStrong((id *)&self->_passkey, a3);
}

- (BOOL)pairedWithCTKD
{
  return self->_pairedWithCTKD;
}

- (BOOL)pairingRequired
{
  return self->_pairingRequired;
}

- (BOOL)appConfirmsAuth
{
  return self->_appConfirmsAuth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkey, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

@end
