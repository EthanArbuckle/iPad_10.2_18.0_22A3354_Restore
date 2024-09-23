@implementation CMLPECConfig

- (CMLPECConfig)initWithPECConfig:(id)a3 keyStatus:(id)a4
{
  id v6;
  id v7;
  CMLPECConfig *v8;
  uint64_t v9;
  NSData *serializedPECConfig;
  uint64_t v11;
  NSData *serializedKeyStatus;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMLPECConfig;
  v8 = -[CMLPECConfig init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    serializedPECConfig = v8->_serializedPECConfig;
    v8->_serializedPECConfig = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    serializedKeyStatus = v8->_serializedKeyStatus;
    v8->_serializedKeyStatus = (NSData *)v11;

  }
  return v8;
}

- (BOOL)isEqualToPECConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CMLPECConfig serializedPECConfig](self, "serializedPECConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedPECConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToData:", v6))
  {
    -[CMLPECConfig serializedKeyStatus](self, "serializedKeyStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serializedKeyStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToData:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CMLPECConfig *v4;
  CMLPECConfig *v5;
  BOOL v6;

  v4 = (CMLPECConfig *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLPECConfig isEqualToPECConfig:](self, "isEqualToPECConfig:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CMLPECConfig serializedPECConfig](self, "serializedPECConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CMLPECConfig serializedKeyStatus](self, "serializedKeyStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLPECConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CMLPECConfig *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedPECConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedKeyStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CMLPECConfig initWithPECConfig:keyStatus:](self, "initWithPECConfig:keyStatus:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CMLPECConfig serializedPECConfig](self, "serializedPECConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serializedPECConfig"));

  -[CMLPECConfig serializedKeyStatus](self, "serializedKeyStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serializedKeyStatus"));

}

- (NSData)serializedPECConfig
{
  return self->_serializedPECConfig;
}

- (NSData)serializedKeyStatus
{
  return self->_serializedKeyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedKeyStatus, 0);
  objc_storeStrong((id *)&self->_serializedPECConfig, 0);
}

@end
