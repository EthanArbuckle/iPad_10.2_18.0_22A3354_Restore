@implementation NEVPNIKEv2SecurityAssociationParameters

- (NEVPNIKEv2SecurityAssociationParameters)init
{
  NEVPNIKEv2SecurityAssociationParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEVPNIKEv2SecurityAssociationParameters;
  result = -[NEVPNIKEv2SecurityAssociationParameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_encryptionAlgorithm = xmmword_19BED7560;
    result->_diffieHellmanGroup = 14;
    result->_lifetimeMinutes = 10;
  }
  return result;
}

- (NEVPNIKEv2SecurityAssociationParameters)initWithCoder:(id)a3
{
  id v4;
  NEVPNIKEv2SecurityAssociationParameters *v5;
  uint64_t v6;
  NSArray *additionalKeyExchangeMethods;

  v4 = a3;
  v5 = -[NEVPNIKEv2SecurityAssociationParameters init](self, "init");
  if (v5)
  {
    v5->_encryptionAlgorithm = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("EncryptionAlgorithm"));
    v5->_integrityAlgorithm = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("IntegrityAlgorithm"));
    v5->_diffieHellmanGroup = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DiffieHellmanGroup"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("AdditionalKeyExchangeMethods"));
    v6 = objc_claimAutoreleasedReturnValue();
    additionalKeyExchangeMethods = v5->_additionalKeyExchangeMethods;
    v5->_additionalKeyExchangeMethods = (NSArray *)v6;

    v5->_lifetimeMinutes = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LifeTime"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  id Property;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm"), CFSTR("EncryptionAlgorithm"));
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm"), CFSTR("IntegrityAlgorithm"));
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"), CFSTR("DiffieHellmanGroup"));
  if (self)
    Property = objc_getProperty(self, v4, 40, 1);
  else
    Property = 0;
  objc_msgSend(v6, "encodeObject:forKey:", Property, CFSTR("AdditionalKeyExchangeMethods"));
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"), CFSTR("LifeTime"));

}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") == NEVPNIKEv2EncryptionAlgorithmDES)
  {
    v8 = CFSTR("DES");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") == NEVPNIKEv2EncryptionAlgorithm3DES)
  {
    v8 = CFSTR("3DES");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") == NEVPNIKEv2EncryptionAlgorithmAES128)
  {
    v8 = CFSTR("AES-128");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") == NEVPNIKEv2EncryptionAlgorithmAES256)
  {
    v8 = CFSTR("AES-256");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") == NEVPNIKEv2EncryptionAlgorithmAES128GCM)
  {
    v8 = CFSTR("AES-128-GCM");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") == NEVPNIKEv2EncryptionAlgorithmAES256GCM)
  {
    v8 = CFSTR("AES-256-GCM");
  }
  else
  {
    if (-[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm") != NEVPNIKEv2EncryptionAlgorithmChaCha20Poly1305)
      goto LABEL_16;
    v8 = CFSTR("ChaCha20Poly1305");
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("encryptionAlgorithm"), v5, a4);
LABEL_16:
  if (-[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm") == NEVPNIKEv2IntegrityAlgorithmSHA96)
  {
    v9 = CFSTR("SHA1-96");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm") == NEVPNIKEv2IntegrityAlgorithmSHA160)
  {
    v9 = CFSTR("SHA1-160");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm") == NEVPNIKEv2IntegrityAlgorithmSHA256)
  {
    v9 = CFSTR("SHA2-256");
  }
  else if (-[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm") == NEVPNIKEv2IntegrityAlgorithmSHA384)
  {
    v9 = CFSTR("SHA2-384");
  }
  else
  {
    if (-[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm") != NEVPNIKEv2IntegrityAlgorithmSHA512)
      goto LABEL_27;
    v9 = CFSTR("SHA2-512");
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("integrityAlgorithm"), v5, a4);
LABEL_27:
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"), CFSTR("diffieHellmanGroup"), v5, a4);
  if (self)
    Property = objc_getProperty(self, v10, 40, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("additionalKeyExchangeMethods"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"), CFSTR("lifetimeMinutes"), v5, a4);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEVPNIKEv2SecurityAssociationParameters *v4;
  const char *v5;
  id v6;
  SEL v7;
  void *v8;
  SEL v9;

  v4 = -[NEVPNIKEv2SecurityAssociationParameters init](+[NEVPNIKEv2SecurityAssociationParameters allocWithZone:](NEVPNIKEv2SecurityAssociationParameters, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v4, "setEncryptionAlgorithm:", -[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm"));
    -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v4, "setIntegrityAlgorithm:", -[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm"));
    -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v4, "setDiffieHellmanGroup:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
    if (self && objc_getProperty(self, v5, 40, 1))
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D20]);
      v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", objc_getProperty(self, v7, 40, 1), 1);
      objc_setProperty_atomic(v4, v9, v8, 40);

    }
    -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v4, "setLifetimeMinutes:", -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"));
  }
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  const char *v8;
  const char *v9;
  const char *v10;
  id v11;
  SEL v12;
  void *v13;
  void *v14;
  SEL v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes") < 10
    || -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes") >= 1441)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid SA life time (%d), valid range is %d to %d inclusive"), -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"), 10, 1440);
    goto LABEL_4;
  }
  if (-[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") != NEVPNIKEv2DiffieHellmanGroup1
    && -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") != NEVPNIKEv2DiffieHellmanGroup2
    && -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") != NEVPNIKEv2DiffieHellmanGroup5
    && -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") != NEVPNIKEv2DiffieHellmanGroup31
    && -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") != NEVPNIKEv2DiffieHellmanGroup32
    && (-[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") < NEVPNIKEv2DiffieHellmanGroup14
     || -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup") >= (NEVPNIKEv2DiffieHellmanGroup20|NEVPNIKEv2DiffieHellmanGroup2)))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid DH group (%ld), valid values are 1, 2, 5, 14-21, 31, and 32"), -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"), v29, v30);
    goto LABEL_4;
  }
  if (!self)
    goto LABEL_39;
  v6 = 1;
  if (objc_getProperty(self, v8, 40, 1))
  {
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v9, 40, 1), "count") < 8)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99E20]);
      v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(objc_getProperty(self, v12, 40, 1), "count") + 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v16 = objc_getProperty(self, v15, 40, 1);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v17)
        goto LABEL_38;
      v18 = v17;
      v19 = *(_QWORD *)v32;
      while (1)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v20);
          if (!isa_nsnumber(v21))
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Additional key method not a number"), v4);
            goto LABEL_41;
          }
          v22 = v21;
          v23 = objc_msgSend(v22, "integerValue");
          v24 = v23;
          v25 = v23 > 0x20 || ((1 << v23) & 0x180000027) == 0;
          if (v25 && v23 - 22 <= 0xFFFFFFFFFFFFFFF7)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid KE Method (%ld), valid values are 0, 1, 2, 5, 14-21, 31, and 32"), v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v28, v4);

LABEL_41:
            goto LABEL_5;
          }
          if (objc_msgSend(v13, "containsObject:", v22))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicated KE method (%ld)"), v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v26, v4);

          }
          else if (v24)
          {
            objc_msgSend(v13, "addObject:", v22);
          }

          ++v20;
        }
        while (v18 != v20);
        v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v18 = v27;
        if (!v27)
        {
LABEL_38:

LABEL_39:
          v6 = 1;
          goto LABEL_6;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Too many additional key methods (%zu > 7)"), objc_msgSend(objc_getProperty(self, v10, 40, 1), "count"), v29, v30);
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v5, v4);

LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (NEVPNIKEv2EncryptionAlgorithm)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(NEVPNIKEv2EncryptionAlgorithm)encryptionAlgorithm
{
  self->_encryptionAlgorithm = encryptionAlgorithm;
}

- (NEVPNIKEv2IntegrityAlgorithm)integrityAlgorithm
{
  return self->_integrityAlgorithm;
}

- (void)setIntegrityAlgorithm:(NEVPNIKEv2IntegrityAlgorithm)integrityAlgorithm
{
  self->_integrityAlgorithm = integrityAlgorithm;
}

- (NEVPNIKEv2DiffieHellmanGroup)diffieHellmanGroup
{
  return self->_diffieHellmanGroup;
}

- (void)setDiffieHellmanGroup:(NEVPNIKEv2DiffieHellmanGroup)diffieHellmanGroup
{
  self->_diffieHellmanGroup = diffieHellmanGroup;
}

- (int32_t)lifetimeMinutes
{
  return self->_lifetimeMinutes;
}

- (void)setLifetimeMinutes:(int32_t)lifetimeMinutes
{
  self->_lifetimeMinutes = lifetimeMinutes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalKeyExchangeMethods, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyDictionary
{
  id v2;
  __CFString **v3;
  __CFString **v4;
  void *v5;
  SEL v6;
  void *v7;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(a1, "encryptionAlgorithm") == 1)
  {
    v3 = kNEIKEv2EncryptionAlgorithmDESValue;
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 2)
  {
    v3 = kNEIKEv2EncryptionAlgorithm3DESValue;
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 3)
  {
    v3 = kNEIKEv2EncryptionAlgorithmAES128Value;
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 4)
  {
    v3 = kNEIKEv2EncryptionAlgorithmAES256Value;
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 5)
  {
    v3 = kNEIKEv2EncryptionAlgorithmAES128GCMValue;
  }
  else if (objc_msgSend(a1, "encryptionAlgorithm") == 6)
  {
    v3 = kNEIKEv2EncryptionAlgorithmAES256GCMValue;
  }
  else
  {
    if (objc_msgSend(a1, "encryptionAlgorithm") != 7)
      goto LABEL_17;
    v3 = kNEIKEv2EncryptionAlgorithmChaCha20Poly1305Value;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *v3, CFSTR("EncryptionAlgorithm"));
LABEL_17:
  if (objc_msgSend(a1, "integrityAlgorithm") == 1)
  {
    v4 = kNEIKEv2IntegrityAlgorithmSHA96Value;
LABEL_27:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *v4, CFSTR("IntegrityAlgorithm"));
    goto LABEL_28;
  }
  if (objc_msgSend(a1, "integrityAlgorithm") == 2)
  {
    v4 = kNEIKEv2IntegrityAlgorithmSHA160Value;
    goto LABEL_27;
  }
  if (objc_msgSend(a1, "integrityAlgorithm") == 3)
  {
    v4 = kNEIKEv2IntegrityAlgorithmSHA256Value;
    goto LABEL_27;
  }
  if (objc_msgSend(a1, "integrityAlgorithm") == 4)
  {
    v4 = kNEIKEv2IntegrityAlgorithmSHA384Value;
    goto LABEL_27;
  }
  if (objc_msgSend(a1, "integrityAlgorithm") == 5)
  {
    v4 = kNEIKEv2IntegrityAlgorithmSHA512Value;
    goto LABEL_27;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "diffieHellmanGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("DiffieHellmanGroup"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_getProperty(a1, v6, 40, 1), CFSTR("AdditionalKeyExchangeMethods"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "lifetimeMinutes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("LifeTimeInMinutes"));

  return v2;
}

@end
