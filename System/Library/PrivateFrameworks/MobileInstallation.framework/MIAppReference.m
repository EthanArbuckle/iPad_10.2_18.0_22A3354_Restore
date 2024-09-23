@implementation MIAppReference

- (MIAppReference)initWithReferenceUUID:(id)a3 identity:(id)a4 domain:(unint64_t)a5 uid:(unsigned int)a6
{
  id v11;
  id v12;
  MIAppReference *v13;
  MIAppReference *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIAppReference;
  v13 = -[MIAppReference init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_referenceUUID, a3);
    objc_storeStrong((id *)&v14->_identity, a4);
    v14->_domain = a5;
    v14->_uid = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppReference)initWithCoder:(id)a3
{
  id v4;
  MIAppReference *v5;
  uint64_t v6;
  NSUUID *referenceUUID;
  uint64_t v8;
  MIAppIdentity *identity;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIAppReference;
  v5 = -[MIAppReference init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceUUID = v5->_referenceUUID;
    v5->_referenceUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (MIAppIdentity *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_domain = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uid = objc_msgSend(v11, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MIAppReference referenceUUID](self, "referenceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("referenceUUID"));

  -[MIAppReference identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIAppReference domain](self, "domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("domain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MIAppReference uid](self, "uid"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("uid"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[MIAppReference referenceUUID](self, "referenceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIAppReference identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[MIAppReference domain](self, "domain");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MIAppReference *v4;
  MIAppReference *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  unsigned int v13;
  BOOL v14;

  v4 = (MIAppReference *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIAppReference referenceUUID](self, "referenceUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppReference referenceUUID](v5, "referenceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (!v8)
        goto LABEL_9;
      -[MIAppReference identity](self, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppReference identity](v5, "identity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MICompareObjects(v9, v10);

      if (!v11)
        goto LABEL_9;
      v12 = -[MIAppReference domain](self, "domain");
      if (v12 == -[MIAppReference domain](v5, "domain"))
      {
        v13 = -[MIAppReference uid](self, "uid");
        v14 = v13 == -[MIAppReference uid](v5, "uid");
      }
      else
      {
LABEL_9:
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIAppReference referenceUUID](self, "referenceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppReference identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[uuid:%@ identity:%@ domain:%lu uid:%u]"), v4, v5, -[MIAppReference domain](self, "domain"), -[MIAppReference uid](self, "uid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)validateAppReference:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v16;
  id v17;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    v12 = (void *)*MEMORY[0x1E0D3ACC0];
    v13 = CFSTR("app reference is nil");
    v14 = 112;
LABEL_8:
    _CreateError((uint64_t)"+[MIAppReference validateAppReference:withError:]", v14, v12, 25, 0, 0, v13, v6, v16);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "identity");
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _CreateError((uint64_t)"+[MIAppReference validateAppReference:withError:]", 117, (void *)*MEMORY[0x1E0D3ACC0], 25, 0, 0, CFSTR("app reference has nil app identity"), v9, v16);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!objc_msgSend(v7, "domain"))
  {
    v12 = (void *)*MEMORY[0x1E0D3ACC0];
    v13 = CFSTR("app reference has unknown domain");
    v14 = 122;
    goto LABEL_8;
  }
  v8 = MEMORY[0x1E0D3AD48];
  objc_msgSend(v7, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  LOBYTE(v8) = objc_msgSend((id)v8, "validateAppIdentity:withError:", v10, &v17);
  v11 = v17;

LABEL_9:
  if (a4 && (v8 & 1) == 0)
    *a4 = objc_retainAutorelease(v11);

  return v8;
}

- (NSUUID)referenceUUID
{
  return self->_referenceUUID;
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_referenceUUID, 0);
}

@end
