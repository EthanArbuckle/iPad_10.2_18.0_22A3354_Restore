@implementation NIRangingAuthConfiguration

- (id)initAsResponder:(BOOL)a3 macAddress:(id)a4 key:(id)a5
{
  id v9;
  id v10;
  id *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  NIDiscoveryToken *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NIRangingAuthConfiguration;
  v11 = -[NIConfiguration initInternal](&v19, sel_initInternal);
  v12 = v11;
  if (v11)
  {
    *((_BYTE *)v11 + 32) = a3;
    objc_storeStrong(v11 + 6, a4);
    objc_storeStrong(v12 + 7, a5);
    v20[0] = &unk_1E43704B0;
    v13 = v12[6];
    v20[1] = &unk_1E43704C8;
    v21[0] = v13;
    v21[1] = v12[7];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AF8054](v14, 8, 0);
    v16 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v15);
    v17 = v12[5];
    v12[5] = v16;

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NIRangingAuthConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v12, sel_copyWithZone_, a3);
  v4[32] = self->_isResponder;
  v5 = -[NIDiscoveryToken copy](self->_peerToken, "copy");
  v6 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v5;

  v7 = -[NSData copy](self->_macAddress, "copy");
  v8 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v7;

  v9 = -[NSData copy](self->_secureKey, "copy");
  v10 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIRangingAuthConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isResponder, CFSTR("isResponder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_macAddress, CFSTR("macAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secureKey, CFSTR("secureKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerToken, CFSTR("peerToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NIRangingAuthConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIRangingAuthConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  NIRangingAuthConfiguration *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NIRangingAuthConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_isResponder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isResponder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("macAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v9 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v5->_macAddress, v6);
      objc_storeStrong((id *)&v5->_secureKey, v7);
      objc_storeStrong((id *)&v5->_peerToken, v8);
      v9 = v5;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIRangingAuthConfiguration *v5;
  NIRangingAuthConfiguration *v6;
  int isResponder;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  unint64_t peerToken;
  BOOL v14;
  char v15;
  int v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIRangingAuthConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v17 = 1;
    }
    else
    {
      isResponder = self->_isResponder;
      v8 = -[NIRangingAuthConfiguration isResponder](v5, "isResponder");
      -[NIRangingAuthConfiguration macAddress](v6, "macAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToData:", self->_macAddress);

      -[NIRangingAuthConfiguration secureKey](v6, "secureKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToData:", self->_secureKey);

      peerToken = (unint64_t)v6->_peerToken;
      v14 = (peerToken | (unint64_t)self->_peerToken) == 0;
      v15 = objc_msgSend((id)peerToken, "isEqual:");
      if (isResponder == v8)
        v16 = v10;
      else
        v16 = 0;
      if (v16 == 1)
        v17 = v12 & (v14 | v15);
      else
        v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  _BOOL8 isResponder;
  uint64_t v4;
  uint64_t v5;

  isResponder = self->_isResponder;
  v4 = -[NSData hash](self->_macAddress, "hash") ^ isResponder;
  v5 = -[NSData hash](self->_secureKey, "hash");
  return v4 ^ v5 ^ -[NIDiscoveryToken hash](self->_peerToken, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NIRangingAuthConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionInternal
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self->_isResponder)
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  -[NIDiscoveryToken descriptionInternal](self->_peerToken, "descriptionInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(", isResponder: %@, peerToken: %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isResponder
{
  return self->_isResponder;
}

- (NIDiscoveryToken)peerToken
{
  return self->_peerToken;
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (NSData)secureKey
{
  return self->_secureKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureKey, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
}

@end
