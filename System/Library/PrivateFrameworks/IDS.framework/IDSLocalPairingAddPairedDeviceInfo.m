@implementation IDSLocalPairingAddPairedDeviceInfo

- (IDSLocalPairingAddPairedDeviceInfo)initWithCBUUID:(id)a3 pairingProtocolVersion:(int64_t)a4 BTOutOfBandKey:(id)a5
{
  id v9;
  id v10;
  IDSLocalPairingAddPairedDeviceInfo *v11;
  IDSLocalPairingAddPairedDeviceInfo *v12;
  NSData *bluetoothMACAddress;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalPairingAddPairedDeviceInfo;
  v11 = -[IDSLocalPairingAddPairedDeviceInfo init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cbuuid, a3);
    v12->_pairingProtocolVersion = a4;
    objc_storeStrong((id *)&v12->_BTOutOfBandKey, a5);
    v12->_supportsIPsecWithSPPLink = 0;
    bluetoothMACAddress = v12->_bluetoothMACAddress;
    v12->_bluetoothMACAddress = 0;

    v12->_shouldPairDirectlyOverIPsec = 0;
    v12->_pairingType = 0;
  }

  return v12;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSLocalPairingAddPairedDeviceInfo cbuuid](self, "cbuuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IDSLocalPairingAddPairedDeviceInfo pairingProtocolVersion](self, "pairingProtocolVersion");
  -[IDSLocalPairingAddPairedDeviceInfo BTOutOfBandKey](self, "BTOutOfBandKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = -[IDSLocalPairingAddPairedDeviceInfo supportsIPsecWithSPPLink](self, "supportsIPsecWithSPPLink");
  v10 = -[IDSLocalPairingAddPairedDeviceInfo shouldPairDirectlyOverIPsec](self, "shouldPairDirectlyOverIPsec");
  -[IDSLocalPairingAddPairedDeviceInfo bluetoothMACAddress](self, "bluetoothMACAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p cbuuid: %@, pairingProtocolVersion: %ld, BTOutOfBandKey.length: %ld, supportsIPsecWithSPPLink: %ld, shouldPairDirectlyOverIPsec: %ld, bluetoothMACAddress.length: %ld, pairingType: %ld>"), v4, self, v5, v6, v8, v9, v10, objc_msgSend(v11, "length"), -[IDSLocalPairingAddPairedDeviceInfo pairingType](self, "pairingType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSLocalPairingAddPairedDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  IDSLocalPairingAddPairedDeviceInfo *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kcbuuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPairingProtocolVersion"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBTOutOfBandKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSLocalPairingAddPairedDeviceInfo initWithCBUUID:pairingProtocolVersion:BTOutOfBandKey:](self, "initWithCBUUID:pairingProtocolVersion:BTOutOfBandKey:", v5, v6, v7);
  -[IDSLocalPairingAddPairedDeviceInfo setSupportsIPsecWithSPPLink:](v8, "setSupportsIPsecWithSPPLink:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsIPsecWithSPPLink")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBluetoothMACAddress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSLocalPairingAddPairedDeviceInfo setBluetoothMACAddress:](v8, "setBluetoothMACAddress:", v9);

  -[IDSLocalPairingAddPairedDeviceInfo setShouldPairDirectlyOverIPsec:](v8, "setShouldPairDirectlyOverIPsec:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kShouldPairDirectlyOverIPsec")));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPairingType"));

  -[IDSLocalPairingAddPairedDeviceInfo setPairingType:](v8, "setPairingType:", v10);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IDSLocalPairingAddPairedDeviceInfo cbuuid](self, "cbuuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("kcbuuid"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[IDSLocalPairingAddPairedDeviceInfo pairingProtocolVersion](self, "pairingProtocolVersion"), CFSTR("kPairingProtocolVersion"));
  -[IDSLocalPairingAddPairedDeviceInfo BTOutOfBandKey](self, "BTOutOfBandKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kBTOutOfBandKey"));

  objc_msgSend(v7, "encodeBool:forKey:", -[IDSLocalPairingAddPairedDeviceInfo supportsIPsecWithSPPLink](self, "supportsIPsecWithSPPLink"), CFSTR("kSupportsIPsecWithSPPLink"));
  objc_msgSend(v7, "encodeBool:forKey:", -[IDSLocalPairingAddPairedDeviceInfo shouldPairDirectlyOverIPsec](self, "shouldPairDirectlyOverIPsec"), CFSTR("kShouldPairDirectlyOverIPsec"));
  -[IDSLocalPairingAddPairedDeviceInfo bluetoothMACAddress](self, "bluetoothMACAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kBluetoothMACAddress"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[IDSLocalPairingAddPairedDeviceInfo pairingType](self, "pairingType"), CFSTR("kPairingType"));
}

- (NSUUID)cbuuid
{
  return self->_cbuuid;
}

- (int64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (NSData)BTOutOfBandKey
{
  return self->_BTOutOfBandKey;
}

- (BOOL)supportsIPsecWithSPPLink
{
  return self->_supportsIPsecWithSPPLink;
}

- (void)setSupportsIPsecWithSPPLink:(BOOL)a3
{
  self->_supportsIPsecWithSPPLink = a3;
}

- (NSData)bluetoothMACAddress
{
  return self->_bluetoothMACAddress;
}

- (void)setBluetoothMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothMACAddress, a3);
}

- (BOOL)shouldPairDirectlyOverIPsec
{
  return self->_shouldPairDirectlyOverIPsec;
}

- (void)setShouldPairDirectlyOverIPsec:(BOOL)a3
{
  self->_shouldPairDirectlyOverIPsec = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothMACAddress, 0);
  objc_storeStrong((id *)&self->_BTOutOfBandKey, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
}

@end
