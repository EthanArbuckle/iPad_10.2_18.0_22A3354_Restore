@implementation SWPersonIdentity

+ (SWPersonIdentity)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (SWPersonIdentity *)+[SWPersonIdentity allocWithZone:](_SWPersonIdentity, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SWPersonIdentity;
  return (SWPersonIdentity *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (SWPersonIdentity)initWithRootHash:(id)a3 publicKeys:(id)a4 trackingPreventionSalt:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWPersonIdentity *v12;
  id *p_isa;
  SWPersonIdentity *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "length") == 32)
  {
    v17.receiver = self;
    v17.super_class = (Class)SWPersonIdentity;
    v12 = -[SWPersonIdentity init](&v17, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_rootHash, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    SWFrameworkLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B618000, v15, OS_LOG_TYPE_DEFAULT, "SWPersonIdentity's rootHash must be a SHA-256 digest. Return nil from [SWPersonIdentity initWithRootHash:publicKeys:]", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (SWPersonIdentity)initWithRootHash:(NSData *)rootHash
{
  return -[SWPersonIdentity initWithRootHash:publicKeys:trackingPreventionSalt:](self, "initWithRootHash:publicKeys:trackingPreventionSalt:", rootHash, MEMORY[0x1E0C9AA60], 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWPersonIdentity rootHash](self, "rootHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" rootHash=%@"), v4);

  -[SWPersonIdentity publicKeys](self, "publicKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" publicKeys=%lu"), objc_msgSend(v5, "count"));

  -[SWPersonIdentity trackingPreventionSalt](self, "trackingPreventionSalt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" trackingPreventionSalt=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SWPersonIdentity isEqualToPersonIdentity:](self, "isEqualToPersonIdentity:", v4);

  return v5;
}

- (BOOL)isEqualToPersonIdentity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;

  v9 = a3;
  -[SWPersonIdentity rootHash](self, "rootHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v9, "rootHash"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWPersonIdentity rootHash](self, "rootHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootHash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
    {

      v12 = 0;
      goto LABEL_26;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  -[SWPersonIdentity publicKeys](self, "publicKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v9, "publicKeys"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWPersonIdentity publicKeys](self, "publicKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publicKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
    {

      if (v13)
      else

      v12 = 0;
      if ((v11 & 1) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
    v24 = 1;
    v25 = v11;
  }
  else
  {
    v24 = 0;
    v25 = v11;
    v21 = 0;
  }
  -[SWPersonIdentity trackingPreventionSalt](self, "trackingPreventionSalt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (objc_msgSend(v9, "trackingPreventionSalt"), (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = v5;
    v23 = v3;
    -[SWPersonIdentity trackingPreventionSalt](self, "trackingPreventionSalt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackingPreventionSalt");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "isEqual:", v16);

    if (v14)
    {

      v5 = v22;
      v3 = v23;
      v17 = v25;
      if (!v24)
        goto LABEL_22;
      goto LABEL_21;
    }
    v5 = v22;
    v3 = v23;
    v17 = v25;
    v19 = (void *)v20;
  }
  else
  {
    v19 = 0;
    v12 = 1;
    v17 = v25;
  }

  if ((v24 & 1) != 0)
  {
LABEL_21:

  }
LABEL_22:
  if (!v13)

  if (v17)
  {
LABEL_25:

  }
LABEL_26:
  if (!v10)

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SWPersonIdentity rootHash](self, "rootHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SWPersonIdentity publicKeys](self, "publicKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SWPersonIdentity trackingPreventionSalt](self, "trackingPreventionSalt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SWPersonIdentity rootHash](self, "rootHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rootHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SWPersonIdentity publicKeys](self, "publicKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_publicKeys);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SWPersonIdentity trackingPreventionSalt](self, "trackingPreventionSalt");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_trackingPreventionSalt);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (SWPersonIdentity)initWithCoder:(id)a3
{
  id v4;
  SWPersonIdentity *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSData *rootHash;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *publicKeys;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSData *trackingPreventionSalt;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SWPersonIdentity;
  v5 = -[SWPersonIdentity init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_rootHash);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    rootHash = v5->_rootHash;
    v5->_rootHash = (NSData *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_publicKeys);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    publicKeys = v5->_publicKeys;
    v5->_publicKeys = (NSArray *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_trackingPreventionSalt);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    trackingPreventionSalt = v5->_trackingPreventionSalt;
    v5->_trackingPreventionSalt = (NSData *)v18;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SWPersonIdentity rootHash](self, "rootHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWPersonIdentity publicKeys](self, "publicKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWPersonIdentity trackingPreventionSalt](self, "trackingPreventionSalt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithRootHash:publicKeys:trackingPreventionSalt:", v5, v6, v7);

  return v8;
}

- (NSData)rootHash
{
  return self->_rootHash;
}

- (NSArray)publicKeys
{
  return self->_publicKeys;
}

- (NSData)trackingPreventionSalt
{
  return self->_trackingPreventionSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingPreventionSalt, 0);
  objc_storeStrong((id *)&self->_publicKeys, 0);
  objc_storeStrong((id *)&self->_rootHash, 0);
}

@end
