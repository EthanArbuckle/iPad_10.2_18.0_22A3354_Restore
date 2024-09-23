@implementation NEVPNIKEv1ProposalParameters

- (NEVPNIKEv1ProposalParameters)init
{
  NEVPNIKEv1ProposalParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEVPNIKEv1ProposalParameters;
  result = -[NEVPNIKEv1ProposalParameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_encryptionAlgorithm = xmmword_19BED7570;
    *(_QWORD *)&result->_diffieHellmanGroup = 0xE1000000002;
  }
  return result;
}

- (NEVPNIKEv1ProposalParameters)initWithCoder:(id)a3
{
  id v4;
  NEVPNIKEv1ProposalParameters *v5;

  v4 = a3;
  v5 = -[NEVPNIKEv1ProposalParameters init](self, "init");
  if (v5)
  {
    v5->_encryptionAlgorithm = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LegacyEncryptionAlgorithm"));
    v5->_integrityAlgorithm = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LegacyIntegrityAlgorithm"));
    v5->_diffieHellmanGroup = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LegacyDiffieHellmanGroup"));
    v5->_lifetimeSeconds = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LegacyLifeTime"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm"), CFSTR("LegacyEncryptionAlgorithm"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm"), CFSTR("LegacyIntegrityAlgorithm"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"), CFSTR("LegacyDiffieHellmanGroup"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"), CFSTR("LegacyLifeTime"));

}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  const __CFString *v8;
  const __CFString *v9;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 1)
  {
    v8 = CFSTR("DES");
  }
  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 2)
  {
    v8 = CFSTR("3DES");
  }
  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 3)
  {
    v8 = CFSTR("AES");
  }
  else
  {
    if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") != 4)
      goto LABEL_10;
    v8 = CFSTR("AES-256");
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("encryptionAlgorithm"), v5, a4);
LABEL_10:
  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 1)
  {
    v9 = CFSTR("SHA1");
LABEL_14:
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("integrityAlgorithm"), v5, a4);
    goto LABEL_15;
  }
  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 2)
  {
    v9 = CFSTR("MD5");
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"), CFSTR("diffieHellmanGroup"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"), CFSTR("lifetimeSeconds"), v5, a4);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEVPNIKEv1ProposalParameters *v4;

  v4 = -[NEVPNIKEv1ProposalParameters init](+[NEVPNIKEv1ProposalParameters allocWithZone:](NEVPNIKEv1ProposalParameters, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[NEVPNIKEv1ProposalParameters setEncryptionAlgorithm:](v4, "setEncryptionAlgorithm:", -[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm"));
    -[NEVPNIKEv1ProposalParameters setIntegrityAlgorithm:](v4, "setIntegrityAlgorithm:", -[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm"));
    -[NEVPNIKEv1ProposalParameters setDiffieHellmanGroup:](v4, "setDiffieHellmanGroup:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
    -[NEVPNIKEv1ProposalParameters setLifetimeSeconds:](v4, "setLifetimeSeconds:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"));
  }
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds") >= 600
    && -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds") <= 86400)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid SA lifetime seconds (%d), valid range is %d to %d inclusive"), -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"), 600, 86400);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v5, v4);

    v6 = 0;
  }

  return v6;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEVPNIKEv1ProposalParameters *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NEVPNIKEv1ProposalParameters;
  v5 = -[NEVPNIKEv1ProposalParameters init](&v31, sel_init);
  if (!v5)
    goto LABEL_22;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptionAlgorithm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = isa_nsstring(v6);

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptionAlgorithm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(CFSTR("DES"), "isEqualToString:", v8);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptionAlgorithm"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(CFSTR("3DES"), "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
        v10 = 2;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptionAlgorithm"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(CFSTR("AES"), "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v10 = 3;
        }
        else
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptionAlgorithm"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(CFSTR("AES256"), "isEqualToString:", v15);

          if (!v16)
            goto LABEL_12;
          v10 = 4;
        }
      }
    }
    -[NEVPNIKEv1ProposalParameters setEncryptionAlgorithm:](v5, "setEncryptionAlgorithm:", v10);
  }
LABEL_12:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HashAlgorithm"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = isa_nsstring(v17);

  if (v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HashAlgorithm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(CFSTR("SHA1"), "isEqualToString:", v19);

    if ((v20 & 1) != 0)
    {
      v21 = 1;
LABEL_17:
      -[NEVPNIKEv1ProposalParameters setIntegrityAlgorithm:](v5, "setIntegrityAlgorithm:", v21);
      goto LABEL_18;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HashAlgorithm"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(CFSTR("MD5"), "isEqualToString:", v22);

    if (v23)
    {
      v21 = 2;
      goto LABEL_17;
    }
  }
LABEL_18:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DHGroup"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = isa_nsnumber(v24);

  if (v25)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DHGroup"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNIKEv1ProposalParameters setDiffieHellmanGroup:](v5, "setDiffieHellmanGroup:", objc_msgSend(v26, "intValue"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Lifetime"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = isa_nsnumber(v27);

  if (v28)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Lifetime"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNIKEv1ProposalParameters setLifetimeSeconds:](v5, "setLifetimeSeconds:", objc_msgSend(v29, "intValue"));

  }
LABEL_22:

  return v5;
}

- (id)copyLegacyDictionary
{
  id v3;
  __CFString **v4;
  __CFString **v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 1)
  {
    v4 = &kNEIKEv1EncryptionAlgorithmDESValue;
  }
  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 2)
  {
    v4 = &kNEIKEv1EncryptionAlgorithm3DESValue;
  }
  else if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") == 3)
  {
    v4 = &kNEIKEv1EncryptionAlgorithmAESValue;
  }
  else
  {
    if (-[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm") != 4)
      goto LABEL_10;
    v4 = &kNEIKEv1EncryptionAlgorithmAES256Value;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v4, CFSTR("EncryptionAlgorithm"));
LABEL_10:
  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 1)
  {
    v5 = &kNEIKEv1IntegrityAlgorithmSHA1Value;
LABEL_14:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *v5, CFSTR("HashAlgorithm"));
    goto LABEL_15;
  }
  if (-[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm") == 2)
  {
    v5 = &kNEIKEv1IntegrityAlgorithmMD5Value;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("DHGroup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Lifetime"));

  return v3;
}

- (int64_t)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(int64_t)a3
{
  self->_encryptionAlgorithm = a3;
}

- (int64_t)integrityAlgorithm
{
  return self->_integrityAlgorithm;
}

- (void)setIntegrityAlgorithm:(int64_t)a3
{
  self->_integrityAlgorithm = a3;
}

- (int)diffieHellmanGroup
{
  return self->_diffieHellmanGroup;
}

- (void)setDiffieHellmanGroup:(int)a3
{
  self->_diffieHellmanGroup = a3;
}

- (int)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setLifetimeSeconds:(int)a3
{
  self->_lifetimeSeconds = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
