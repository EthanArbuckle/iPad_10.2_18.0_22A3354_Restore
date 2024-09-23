@implementation DAKeyInformation

- (DAKeyInformation)initWithEndpoint:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *publicKeyIdentifier;
  DAAlishaKeyInformation *v8;
  void *alishaKeyInformation;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  DAKeyInformation *v15;
  int64_t v16;
  int64_t v17;
  DAHomeKeyInformation *v18;
  DAHydraKeyInformation *v19;
  objc_super v21;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  v21.receiver = self;
  v21.super_class = (Class)DAKeyInformation;
  self = -[DAKeyInformation init](&v21, sel_init);
  if (!self)
  {
LABEL_5:
    v10 = objc_msgSend(v4, "endPointType");
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyInformation initWithEndpoint:]", 75, CFSTR("Invalid EP type %d"), v11, v12, v13, v14, v10);
LABEL_6:
    v15 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "publicKeyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  kmlUtilHexStringFromData(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  publicKeyIdentifier = self->_publicKeyIdentifier;
  self->_publicKeyIdentifier = v6;

  switch(objc_msgSend(v4, "endPointType"))
  {
    case 1:
      self->_keyType = 1;
      +[DAAlishaKeyInformation withEndpoint:](DAAlishaKeyInformation, "withEndpoint:", v4);
      v8 = (DAAlishaKeyInformation *)objc_claimAutoreleasedReturnValue();
      alishaKeyInformation = self->_alishaKeyInformation;
      self->_alishaKeyInformation = v8;
      break;
    case 2:
      v16 = 2;
      goto LABEL_12;
    case 3:
      v17 = 3;
      goto LABEL_10;
    case 4:
      v17 = 5;
LABEL_10:
      self->_keyType = v17;
      +[DAHomeKeyInformation withEndpoint:](DAHomeKeyInformation, "withEndpoint:", v4);
      v18 = (DAHomeKeyInformation *)objc_claimAutoreleasedReturnValue();
      alishaKeyInformation = self->_homeKeyInformation;
      self->_homeKeyInformation = v18;
      break;
    case 5:
      v16 = 4;
LABEL_12:
      self->_keyType = v16;
      +[DAHydraKeyInformation withEndpoint:](DAHydraKeyInformation, "withEndpoint:", v4);
      v19 = (DAHydraKeyInformation *)objc_claimAutoreleasedReturnValue();
      alishaKeyInformation = self->_hydraKeyInformation;
      self->_hydraKeyInformation = v19;
      break;
    default:
      goto LABEL_5;
  }

  self = self;
  v15 = self;
LABEL_14:

  return v15;
}

+ (id)alishaKeyWithPublicKeyIdentifier:(id)a3 alishaKeyInformation:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[2];
  v7[1] = 1;
  v7[2] = v5;
  v9 = v5;

  v10 = (void *)v7[3];
  v7[3] = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t keyType;
  id v5;

  keyType = self->_keyType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", keyType, CFSTR("keyType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKeyIdentifier, CFSTR("publicKeyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alishaKeyInformation, CFSTR("alishaKeyInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hydraKeyInformation, CFSTR("hydraKeyInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKeyInformation, CFSTR("homeKeyInformation"));

}

- (DAKeyInformation)initWithCoder:(id)a3
{
  id v4;
  DAKeyInformation *v5;
  uint64_t v6;
  NSString *publicKeyIdentifier;
  uint64_t v8;
  DAAlishaKeyInformation *alishaKeyInformation;
  uint64_t v10;
  DAHydraKeyInformation *hydraKeyInformation;
  uint64_t v12;
  DAHomeKeyInformation *homeKeyInformation;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeyInformation;
  v5 = -[DAKeyInformation init](&v15, sel_init);
  if (v5)
  {
    v5->_keyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alishaKeyInformation"));
    v8 = objc_claimAutoreleasedReturnValue();
    alishaKeyInformation = v5->_alishaKeyInformation;
    v5->_alishaKeyInformation = (DAAlishaKeyInformation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hydraKeyInformation"));
    v10 = objc_claimAutoreleasedReturnValue();
    hydraKeyInformation = v5->_hydraKeyInformation;
    v5->_hydraKeyInformation = (DAHydraKeyInformation *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeKeyInformation"));
    v12 = objc_claimAutoreleasedReturnValue();
    homeKeyInformation = v5->_homeKeyInformation;
    v5->_homeKeyInformation = (DAHomeKeyInformation *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    KeyId      : %@\n"), self->_publicKeyIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("    KeyType    : %d\n"), self->_keyType);
  v4 = self->_keyType - 1;
  if (v4 <= 4)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@"), *(Class *)((char *)&self->super.isa + qword_20A638D48[v4]));
  return v3;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (DAAlishaKeyInformation)alishaKeyInformation
{
  return self->_alishaKeyInformation;
}

- (DAHydraKeyInformation)hydraKeyInformation
{
  return self->_hydraKeyInformation;
}

- (DAHomeKeyInformation)homeKeyInformation
{
  return self->_homeKeyInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKeyInformation, 0);
  objc_storeStrong((id *)&self->_hydraKeyInformation, 0);
  objc_storeStrong((id *)&self->_alishaKeyInformation, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
}

@end
