@implementation WatchSetupExtendedMetadata

- (WatchSetupExtendedMetadata)initWithPairingVersion:(unsigned __int8)a3 productVersionMajor:(unsigned __int8)a4 productVersionMinor:(unsigned __int8)a5 postFailSafeObliteration:(BOOL)a6 encodedSystemVersion:(unsigned int)a7
{
  WatchSetupExtendedMetadata *v13;
  WatchSetupExtendedMetadata *v14;
  objc_super v16;

  if (+[WatchSetupExtendedMetadata _consistencyCheckForPairingVersion:productVersionMajor:productVersionMinor:postFailSafeObliteration:encodedSystemVersion:](WatchSetupExtendedMetadata, "_consistencyCheckForPairingVersion:productVersionMajor:productVersionMinor:postFailSafeObliteration:encodedSystemVersion:"))
  {
    v16.receiver = self;
    v16.super_class = (Class)WatchSetupExtendedMetadata;
    v13 = -[WatchSetupExtendedMetadata init](&v16, sel_init);
    if (v13)
    {
      v13->_pairingVersion = a3;
      v13->_productVersionMajor = a4;
      v13->_productVersionMinor = a5;
      v13->_postFailSafeObliteration = a6;
      v13->_encodedSystemVersion = a7;
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WatchSetupExtendedMetadata)initWithPackedExtendedMetadataData:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  WatchSetupExtendedMetadata *v8;
  WatchSetupExtendedMetadata *v9;
  char v10;
  char v11;
  int v12;
  int v13;
  unint64_t v14;
  int v15;
  unsigned int v16;
  objc_super v18;
  _BYTE buf[12];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") > 6)
  {
    v18.receiver = self;
    v18.super_class = (Class)WatchSetupExtendedMetadata;
    v9 = -[WatchSetupExtendedMetadata init](&v18, sel_init);
    if (v9)
    {
      *(_DWORD *)&buf[3] = 0;
      *(_DWORD *)buf = 0;
      objc_msgSend(v4, "getBytes:length:", buf, 7);
      v10 = buf[0];
      v9->_pairingVersion = buf[0] >> 2;
      v11 = buf[1];
      v9->_productVersionMajor = (buf[1] >> 3) & 0x9F | (32 * (v10 & 3));
      v12 = buf[2];
      v9->_productVersionMinor = (buf[2] >> 4) & 0x8F | (16 * (v11 & 7));
      v9->_postFailSafeObliteration = (v12 & 8) != 0;
      HIDWORD(v14) = buf[5];
      LODWORD(v14) = buf[6] << 24;
      v13 = v14 >> 27;
      HIDWORD(v14) = buf[4];
      LODWORD(v14) = buf[5] << 24;
      v15 = ((v14 >> 27) << 16) | (v13 << 24);
      HIDWORD(v14) = buf[3];
      LODWORD(v14) = buf[4] << 24;
      v16 = v15 & 0xFFFF00FF | ((v14 >> 27) << 8);
      HIDWORD(v14) = v12;
      LODWORD(v14) = buf[3] << 24;
      v9->_encodedSystemVersion = bswap32(v16 & 0xFFFFFF00 | (v14 >> 27));
    }
    self = v9;
    v8 = self;
  }
  else
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = 7;
        v20 = 2048;
        v21 = objc_msgSend(v4, "length");
        _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "Incorrect size of packed extended metadata, expecting >= %lu but got %lu", buf, 0x16u);
      }

    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_consistencyCheckForPairingVersion:(unsigned __int8)a3 productVersionMajor:(unsigned __int8)a4 productVersionMinor:(unsigned __int8)a5 postFailSafeObliteration:(BOOL)a6 encodedSystemVersion:(unsigned int)a7
{
  return a3 < 0x40u && ((a5 | a4) & 0x80u) == 0;
}

- (id)packedExtendedMetadataData
{
  unsigned __int8 productVersionMajor;
  char v3;
  unsigned __int8 productVersionMinor;
  char v5;
  unsigned int v6;
  unint64_t v7;
  _BYTE v9[7];

  productVersionMajor = self->_productVersionMajor;
  v9[0] = (4 * self->_pairingVersion) | (productVersionMajor >> 5) & 3;
  v3 = 8 * productVersionMajor;
  productVersionMinor = self->_productVersionMinor;
  v9[1] = v3 & 0xF8 | (productVersionMinor >> 4) & 7;
  v5 = 16 * productVersionMinor;
  v6 = bswap32(self->_encodedSystemVersion);
  v9[2] = v5 & 0xF8 | (v6 >> 5) | (8 * self->_postFailSafeObliteration);
  HIDWORD(v7) = v6;
  LODWORD(v7) = v6 << 16;
  v9[3] = v7 >> 29;
  HIDWORD(v7) = v6 >> 8;
  LODWORD(v7) = v6 << 8;
  v9[4] = v7 >> 29;
  HIDWORD(v7) = HIWORD(v6);
  LODWORD(v7) = v6;
  v9[5] = v7 >> 29;
  v9[6] = (v6 >> 21) & 0xF8;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v9, 7);
}

- (unsigned)pairingVersion
{
  return self->_pairingVersion;
}

- (unsigned)productVersionMajor
{
  return self->_productVersionMajor;
}

- (unsigned)productVersionMinor
{
  return self->_productVersionMinor;
}

- (BOOL)postFailSafeObliteration
{
  return self->_postFailSafeObliteration;
}

- (unsigned)encodedSystemVersion
{
  return self->_encodedSystemVersion;
}

@end
