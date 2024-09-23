@implementation NRWatchPairingExtendedMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  const char *v2;
  const char *v3;

  v2 = "YES";
  if (self->_postFailsafeObliteration)
    v3 = "YES";
  else
    v3 = "NO";
  if (!self->_isCellularEnabled)
    v2 = "NO";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ chipID = %ld pairingVersion = %ld productType = \"%@\" postFailsafeObliteration = \"%s\" isCellularEnabled = \"%s\" encodedSystemVersion = \"%ld\" }"), *(_OWORD *)&self->_chipID, self->_productType, v3, v2, self->_encodedSystemVersion);
}

- (NRWatchPairingExtendedMetadata)initWithCoder:(id)a3
{
  id v4;
  NRWatchPairingExtendedMetadata *v5;
  uint64_t v6;
  NSString *productType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRWatchPairingExtendedMetadata;
  v5 = -[NRWatchPairingExtendedMetadata init](&v9, sel_init);
  if (v5)
  {
    v5->_chipID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("chipID"));
    v5->_pairingVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pairingVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v6 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v6;

    v5->_postFailsafeObliteration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("postFailsafeObliteration"));
    v5->_isCellularEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCellularEnabled"));
    v5->_encodedSystemVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("encodedSystemVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t chipID;
  id v5;

  chipID = self->_chipID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", chipID, CFSTR("chipID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pairingVersion, CFSTR("pairingVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_postFailsafeObliteration, CFSTR("postFailsafeObliteration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCellularEnabled, CFSTR("isCellularEnabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_encodedSystemVersion, CFSTR("encodedSystemVersion"));

}

- (int64_t)chipID
{
  return self->_chipID;
}

- (void)setChipID:(int64_t)a3
{
  self->_chipID = a3;
}

- (int64_t)pairingVersion
{
  return self->_pairingVersion;
}

- (void)setPairingVersion:(int64_t)a3
{
  self->_pairingVersion = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (BOOL)postFailsafeObliteration
{
  return self->_postFailsafeObliteration;
}

- (void)setPostFailsafeObliteration:(BOOL)a3
{
  self->_postFailsafeObliteration = a3;
}

- (BOOL)isCellularEnabled
{
  return self->_isCellularEnabled;
}

- (void)setIsCellularEnabled:(BOOL)a3
{
  self->_isCellularEnabled = a3;
}

- (unint64_t)encodedSystemVersion
{
  return self->_encodedSystemVersion;
}

- (void)setEncodedSystemVersion:(unint64_t)a3
{
  self->_encodedSystemVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
}

@end
