@implementation WatchSetupAdvertisementIdentifier

- (WatchSetupAdvertisementIdentifier)initWithAdvertisingIdentifier:(unsigned int)a3 pairingStrategy:(unsigned __int8)a4 deviceSize:(unsigned __int8)a5 enclosureMaterial:(unsigned __int8)a6
{
  WatchSetupAdvertisementIdentifier *v11;
  WatchSetupAdvertisementIdentifier *v12;
  objc_super v14;

  if (+[WatchSetupAdvertisementIdentifier _consistencyCheckForAdvertisingIdentifier:pairingStrategy:deviceSize:enclosureMaterial:](WatchSetupAdvertisementIdentifier, "_consistencyCheckForAdvertisingIdentifier:pairingStrategy:deviceSize:enclosureMaterial:"))
  {
    v14.receiver = self;
    v14.super_class = (Class)WatchSetupAdvertisementIdentifier;
    v11 = -[WatchSetupAdvertisementIdentifier init](&v14, sel_init);
    if (v11)
    {
      v11->_advertisingIdentifier = a3;
      v11->_pairingStrategy = a4;
      v11->_deviceSize = a5;
      v11->_enclosureMaterial = a6;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WatchSetupAdvertisementIdentifier)initWithPackedIdentifierData:(id)a3
{
  id v4;
  WatchSetupAdvertisementIdentifier *v5;
  unsigned int v6;
  uint8_t v7;
  int v8;
  unint64_t v9;
  WatchSetupAdvertisementIdentifier *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length") == 4)
  {
    v15.receiver = self;
    v15.super_class = (Class)WatchSetupAdvertisementIdentifier;
    v5 = -[WatchSetupAdvertisementIdentifier init](&v15, sel_init);
    if (v5)
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v4, "getBytes:length:", buf, 4);
      v6 = buf[0];
      v5->_pairingStrategy = buf[0] >> 5;
      v7 = buf[2];
      HIDWORD(v9) = buf[1];
      LODWORD(v9) = buf[2] << 24;
      v8 = v9 >> 28;
      HIDWORD(v9) = v6;
      LODWORD(v9) = buf[1] << 24;
      v5->_advertisingIdentifier = bswap32(((v9 >> 28) << 16) | (v8 << 24) | (((v6 >> 4) & 1) << 8));
      LOBYTE(v6) = buf[3];
      v5->_deviceSize = (buf[3] >> 6) & 0xC3 | (4 * (v7 & 0xF));
      v5->_enclosureMaterial = v6 & 0x3F;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    nr_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      nr_framework_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v17 = 4;
        v18 = 2048;
        v19 = objc_msgSend(v4, "length");
        _os_log_error_impl(&dword_1A0BDB000, v13, OS_LOG_TYPE_ERROR, "Incorrect size of packed identifier data, expecting %lu but got %lu", buf, 0x16u);
      }

    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_consistencyCheckForAdvertisingIdentifier:(unsigned int)a3 pairingStrategy:(unsigned __int8)a4 deviceSize:(unsigned __int8)a5 enclosureMaterial:(unsigned __int8)a6
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = objc_msgSend(CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"), "length");
  v11 = 0;
  if (a3 >> 5 <= 0xC34 && !(a3 >> 17) && v8 <= 7)
  {
    v12 = v10 > v7 && v10 > v6;
    v13 = v10 > v8 && v12;
    return (v6 | v7) <= 0x3F && v13;
  }
  return v11;
}

- (id)packedIdentifierData
{
  unsigned int v2;
  unint64_t v3;
  unsigned __int8 deviceSize;
  _BYTE v6[4];

  v2 = bswap32(self->_advertisingIdentifier);
  v6[0] = (v2 >> 4) & 0x10 | (v2 >> 20) & 0xF | (32 * self->_pairingStrategy);
  HIDWORD(v3) = HIWORD(v2);
  LODWORD(v3) = v2;
  v6[1] = v3 >> 28;
  deviceSize = self->_deviceSize;
  v6[2] = (v2 >> 20) & 0xF0 | (deviceSize >> 2) & 0xF;
  v6[3] = self->_enclosureMaterial & 0x3F | (deviceSize << 6);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v6, 4);
}

- (NSString)humanReadableName
{
  uint64_t advertisingIdentifier;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v11;

  advertisingIdentifier = self->_advertisingIdentifier;
  _NRStringRepresentationFromInteger(self->_pairingStrategy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NRStringRepresentationFromInteger(self->_enclosureMaterial);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NRStringRepresentationFromInteger(self->_deviceSize);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (advertisingIdentifier >> 5 > 0xC34 || v4 == 0 || v5 == 0 || v6 == 0)
    v11 = 0;
  else
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%05lu%@%@%@"), advertisingIdentifier, v4, v5, v6);

  return (NSString *)v11;
}

- (unsigned)pairingStrategy
{
  return self->_pairingStrategy;
}

- (unsigned)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (unsigned)deviceSize
{
  return self->_deviceSize;
}

- (unsigned)enclosureMaterial
{
  return self->_enclosureMaterial;
}

@end
