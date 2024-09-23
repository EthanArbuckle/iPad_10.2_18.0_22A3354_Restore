@implementation UARPManifestProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPManifestProperties)initWithBoardID:(unsigned int)a3 chipID:(unsigned int)a4 securityDomain:(unint64_t)a5 securityMode:(BOOL)a6 productionMode:(BOOL)a7
{
  UARPManifestProperties *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UARPManifestProperties;
  result = -[UARPManifestProperties init](&v13, sel_init);
  if (result)
  {
    result->_boardID = a3;
    result->_chipID = a4;
    result->_securityDomain = a5;
    result->_securityMode = a6;
    result->_productionMode = a7;
  }
  return result;
}

- (UARPManifestProperties)initWithCoder:(id)a3
{
  id v4;
  UARPManifestProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *ecID;
  uint64_t v13;
  NSData *nonce;
  uint64_t v15;
  NSNumber *chipEpoch;
  uint64_t v17;
  NSNumber *enableMixMatch;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UARPManifestProperties;
  v5 = -[UARPManifestProperties init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boardID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_boardID = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chipID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_chipID = objc_msgSend(v7, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityDomain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_securityDomain = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_securityMode = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productionMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_productionMode = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecID"));
    v11 = objc_claimAutoreleasedReturnValue();
    ecID = v5->_ecID;
    v5->_ecID = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v13 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chipEpoch"));
    v15 = objc_claimAutoreleasedReturnValue();
    chipEpoch = v5->_chipEpoch;
    v5->_chipEpoch = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enableMixMatch"));
    v17 = objc_claimAutoreleasedReturnValue();
    enableMixMatch = v5->_enableMixMatch;
    v5->_enableMixMatch = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveProductionMode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_effectiveProductionMode = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveSecurityMode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_effectiveSecurityMode = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsImg4"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsImg4 = objc_msgSend(v21, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t boardID;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  boardID = self->_boardID;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", boardID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("boardID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("chipID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_securityDomain);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("securityDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_securityMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("securityMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_productionMode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("productionMode"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_ecID, CFSTR("ecID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_chipEpoch, CFSTR("chipEpoch"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_enableMixMatch, CFSTR("enableMixMatch"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_effectiveProductionMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("effectiveProductionMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_effectiveSecurityMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("effectiveSecurityMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsImg4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("supportsImg4"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPManifestProperties *v4;

  v4 = objc_alloc_init(UARPManifestProperties);
  v4->_boardID = self->_boardID;
  v4->_chipID = self->_chipID;
  v4->_securityDomain = self->_securityDomain;
  v4->_securityMode = self->_securityMode;
  v4->_productionMode = self->_productionMode;
  -[UARPManifestProperties setEcID:](v4, "setEcID:", self->_ecID);
  -[UARPManifestProperties setNonce:](v4, "setNonce:", self->_nonce);
  -[UARPManifestProperties setChipEpoch:](v4, "setChipEpoch:", self->_chipEpoch);
  -[UARPManifestProperties setEnableMixMatch:](v4, "setEnableMixMatch:", self->_enableMixMatch);
  -[UARPManifestProperties setEffectiveProductionMode:](v4, "setEffectiveProductionMode:", self->_effectiveProductionMode);
  -[UARPManifestProperties setEffectiveSecurityMode:](v4, "setEffectiveSecurityMode:", self->_effectiveSecurityMode);
  -[UARPManifestProperties setSupportsImg4:](v4, "setSupportsImg4:", self->_supportsImg4);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UARPManifestProperties *v4;
  UARPManifestProperties *v5;
  unsigned int boardID;
  unsigned int chipID;
  unint64_t securityDomain;
  _BOOL4 securityMode;
  _BOOL4 productionMode;
  NSNumber *ecID;
  void *v12;
  NSData *nonce;
  void *v14;
  NSNumber *chipEpoch;
  void *v16;
  NSNumber *enableMixMatch;
  void *v18;
  _BOOL4 effectiveProductionMode;
  _BOOL4 effectiveSecurityMode;
  _BOOL4 supportsImg4;
  BOOL v22;

  v4 = (UARPManifestProperties *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v22 = 1;
    }
    else
    {
      v5 = v4;
      boardID = self->_boardID;
      if (boardID == -[UARPManifestProperties boardID](v5, "boardID")
        && (chipID = self->_chipID, chipID == -[UARPManifestProperties chipID](v5, "chipID"))
        && (securityDomain = self->_securityDomain,
            securityDomain == -[UARPManifestProperties securityDomain](v5, "securityDomain"))
        && (securityMode = self->_securityMode,
            securityMode == -[UARPManifestProperties securityMode](v5, "securityMode"))
        && (productionMode = self->_productionMode,
            productionMode == -[UARPManifestProperties productionMode](v5, "productionMode")))
      {
        ecID = self->_ecID;
        -[UARPManifestProperties ecID](v5, "ecID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (nullableObjectsEqual(ecID, (uint64_t)v12))
        {
          nonce = self->_nonce;
          -[UARPManifestProperties nonce](v5, "nonce");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (nullableObjectsEqual(nonce, (uint64_t)v14))
          {
            chipEpoch = self->_chipEpoch;
            -[UARPManifestProperties chipEpoch](v5, "chipEpoch");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (nullableObjectsEqual(chipEpoch, (uint64_t)v16))
            {
              enableMixMatch = self->_enableMixMatch;
              -[UARPManifestProperties enableMixMatch](v5, "enableMixMatch");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (nullableObjectsEqual(enableMixMatch, (uint64_t)v18)
                && (effectiveProductionMode = self->_effectiveProductionMode,
                    effectiveProductionMode == -[UARPManifestProperties effectiveProductionMode](v5, "effectiveProductionMode"))&& (effectiveSecurityMode = self->_effectiveSecurityMode, effectiveSecurityMode == -[UARPManifestProperties effectiveSecurityMode](v5, "effectiveSecurityMode")))
              {
                supportsImg4 = self->_supportsImg4;
                v22 = supportsImg4 == -[UARPManifestProperties supportsImg4](v5, "supportsImg4");
              }
              else
              {
                v22 = 0;
              }

            }
            else
            {
              v22 = 0;
            }

          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (const)securityDomainString
{
  unint64_t securityDomain;

  securityDomain = self->_securityDomain;
  if (securityDomain > 3)
    return "unrecognized";
  else
    return off_24CEA4040[securityDomain];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSNumber *ecID;
  const char *v8;
  const char *v9;
  NSNumber *chipEpoch;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" boardID=0x%x"), self->_boardID);
  objc_msgSend(v6, "appendFormat:", CFSTR(" chipID=0x%x"), self->_chipID);
  ecID = self->_ecID;
  if (ecID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" ecID=0x%llx"), -[NSNumber unsignedLongLongValue](ecID, "unsignedLongLongValue"));
  if (self->_nonce)
    objc_msgSend(v6, "appendFormat:", CFSTR(" nonce=%@"), self->_nonce);
  objc_msgSend(v6, "appendFormat:", CFSTR(" securityDomain=%s"), -[UARPManifestProperties securityDomainString](self, "securityDomainString"));
  if (self->_securityMode)
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR(" securityMode=%s"), v8);
  if (self->_productionMode)
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v6, "appendFormat:", CFSTR(" productionMode=%s"), v9);
  chipEpoch = self->_chipEpoch;
  if (chipEpoch)
    objc_msgSend(v6, "appendFormat:", CFSTR(" chipEpoch=0x%x"), -[NSNumber unsignedIntValue](chipEpoch, "unsignedIntValue"));
  if (self->_enableMixMatch)
    objc_msgSend(v6, "appendFormat:", CFSTR(" enableMixMatch=%@"), self->_enableMixMatch);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unint64_t)securityDomain
{
  return self->_securityDomain;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (NSNumber)ecID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEcID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)chipEpoch
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChipEpoch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)enableMixMatch
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEnableMixMatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)effectiveProductionMode
{
  return self->_effectiveProductionMode;
}

- (void)setEffectiveProductionMode:(BOOL)a3
{
  self->_effectiveProductionMode = a3;
}

- (BOOL)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

- (void)setEffectiveSecurityMode:(BOOL)a3
{
  self->_effectiveSecurityMode = a3;
}

- (BOOL)supportsImg4
{
  return self->_supportsImg4;
}

- (void)setSupportsImg4:(BOOL)a3
{
  self->_supportsImg4 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableMixMatch, 0);
  objc_storeStrong((id *)&self->_chipEpoch, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ecID, 0);
}

@end
