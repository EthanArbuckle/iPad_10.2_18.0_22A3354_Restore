@implementation CMLUseCaseGroup

- (CMLUseCaseGroup)initWithKeyExpirationMinutes:(int64_t)a3 keyRotationBeforeExpirationMinutes:(int64_t)a4 keyRotationIgnoreMissingEvaluationKey:(BOOL)a5 useCases:(id)a6 networkConfig:(id)a7
{
  id v12;
  id v13;
  CMLUseCaseGroup *v14;
  CMLUseCaseGroup *v15;
  uint64_t v16;
  NSDictionary *useCases;
  objc_super v19;

  v12 = a6;
  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CMLUseCaseGroup;
  v14 = -[CMLUseCaseGroup init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_keyExpirationMinutes = a3;
    v14->_keyRotationBeforeExpirationMinutes = a4;
    v14->_keyRotationIgnoreMissingEvaluationKey = a5;
    v16 = objc_msgSend(v12, "copy");
    useCases = v15->_useCases;
    v15->_useCases = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_networkConfig, a7);
  }

  return v15;
}

- (CMLUseCaseGroup)initWithKeyExpirationMinutes:(int64_t)a3 keyRotationBeforeExpirationMinutes:(int64_t)a4 useCases:(id)a5 networkConfig:(id)a6
{
  return -[CMLUseCaseGroup initWithKeyExpirationMinutes:keyRotationBeforeExpirationMinutes:keyRotationIgnoreMissingEvaluationKey:useCases:networkConfig:](self, "initWithKeyExpirationMinutes:keyRotationBeforeExpirationMinutes:keyRotationIgnoreMissingEvaluationKey:useCases:networkConfig:", a3, a4, 0, a5, a6);
}

- (CMLUseCaseGroup)initWithUseCases:(id)a3 networkConfig:(id)a4
{
  return -[CMLUseCaseGroup initWithKeyExpirationMinutes:keyRotationBeforeExpirationMinutes:useCases:networkConfig:](self, "initWithKeyExpirationMinutes:keyRotationBeforeExpirationMinutes:useCases:networkConfig:", 43200, 2880, a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  CMLUseCaseGroup *v4;
  CMLUseCaseGroup *v5;
  BOOL v6;

  v4 = (CMLUseCaseGroup *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLUseCaseGroup isEqualToUseCaseGroup:](self, "isEqualToUseCaseGroup:", v5);

  return v6;
}

- (BOOL)isEqualToUseCaseGroup:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[CMLUseCaseGroup keyExpirationMinutes](self, "keyExpirationMinutes");
  if (v5 == objc_msgSend(v4, "keyExpirationMinutes")
    && (v6 = -[CMLUseCaseGroup keyRotationBeforeExpirationMinutes](self, "keyRotationBeforeExpirationMinutes"),
        v6 == objc_msgSend(v4, "keyRotationBeforeExpirationMinutes"))
    && (v7 = -[CMLUseCaseGroup keyRotationIgnoreMissingEvaluationKey](self, "keyRotationIgnoreMissingEvaluationKey"),
        v7 == objc_msgSend(v4, "keyRotationIgnoreMissingEvaluationKey")))
  {
    -[CMLUseCaseGroup useCases](self, "useCases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "useCases");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v11))
    {
      -[CMLUseCaseGroup networkConfig](self, "networkConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "networkConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[CMLUseCaseGroup keyExpirationMinutes](self, "keyExpirationMinutes");
  v4 = -[CMLUseCaseGroup keyRotationBeforeExpirationMinutes](self, "keyRotationBeforeExpirationMinutes") ^ v3;
  v5 = -[CMLUseCaseGroup keyRotationIgnoreMissingEvaluationKey](self, "keyRotationIgnoreMissingEvaluationKey");
  -[CMLUseCaseGroup useCases](self, "useCases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash") ^ v5;
  -[CMLUseCaseGroup networkConfig](self, "networkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLUseCaseGroup)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  CMLUseCaseGroup *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyExpirationMinutes"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyRotationBeforeExpirationMinutes"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keyRotationIgnoreMissingEvaluationKey"));
  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("useCases"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkConfig"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[CMLUseCaseGroup initWithKeyExpirationMinutes:keyRotationBeforeExpirationMinutes:keyRotationIgnoreMissingEvaluationKey:useCases:networkConfig:](self, "initWithKeyExpirationMinutes:keyRotationBeforeExpirationMinutes:keyRotationIgnoreMissingEvaluationKey:useCases:networkConfig:", v5, v6, v7, v9, v10);
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseGroup keyExpirationMinutes](self, "keyExpirationMinutes"), CFSTR("keyExpirationMinutes"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseGroup keyRotationBeforeExpirationMinutes](self, "keyRotationBeforeExpirationMinutes"), CFSTR("keyRotationBeforeExpirationMinutes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CMLUseCaseGroup keyRotationIgnoreMissingEvaluationKey](self, "keyRotationIgnoreMissingEvaluationKey"), CFSTR("keyRotationIgnoreMissingEvaluationKey"));
  -[CMLUseCaseGroup useCases](self, "useCases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("useCases"));

  -[CMLUseCaseGroup networkConfig](self, "networkConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("networkConfig"));

}

- (int64_t)keyExpirationMinutes
{
  return self->_keyExpirationMinutes;
}

- (void)setKeyExpirationMinutes:(int64_t)a3
{
  self->_keyExpirationMinutes = a3;
}

- (int64_t)keyRotationBeforeExpirationMinutes
{
  return self->_keyRotationBeforeExpirationMinutes;
}

- (void)setKeyRotationBeforeExpirationMinutes:(int64_t)a3
{
  self->_keyRotationBeforeExpirationMinutes = a3;
}

- (BOOL)keyRotationIgnoreMissingEvaluationKey
{
  return self->_keyRotationIgnoreMissingEvaluationKey;
}

- (void)setKeyRotationIgnoreMissingEvaluationKey:(BOOL)a3
{
  self->_keyRotationIgnoreMissingEvaluationKey = a3;
}

- (NSDictionary)useCases
{
  return self->_useCases;
}

- (void)setUseCases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CMLNetworkManager)networkConfig
{
  return self->_networkConfig;
}

- (void)setNetworkConfig:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfig, 0);
  objc_storeStrong((id *)&self->_useCases, 0);
}

@end
