@implementation ULFingerprintMetaInfo

- (ULFingerprintMetaInfo)initWithNumWiFiAccessPoints:(id)a3 numBLESources:(id)a4 numUWBSources:(id)a5 requestIdentifier:(id)a6 errors:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ULFingerprintMetaInfo *v17;
  ULFingerprintMetaInfo *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ULFingerprintMetaInfo;
  v17 = -[ULFingerprintMetaInfo init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_numberOfWiFiAccessPoints, a3);
    objc_storeStrong((id *)&v18->_numberOfBLESources, a4);
    objc_storeStrong((id *)&v18->_numberOfUWBSources, a5);
    objc_storeStrong((id *)&v18->_requestIdentifier, a6);
    objc_storeStrong((id *)&v18->_errors, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v5 = objc_alloc((Class)objc_opt_class());
  -[ULFingerprintMetaInfo numberOfWiFiAccessPoints](self, "numberOfWiFiAccessPoints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v17, "copyWithZone:", a3);
  -[ULFingerprintMetaInfo numberOfBLESources](self, "numberOfBLESources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  -[ULFingerprintMetaInfo numberOfUWBSources](self, "numberOfUWBSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[ULFingerprintMetaInfo requestIdentifier](self, "requestIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[ULFingerprintMetaInfo errors](self, "errors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  v15 = (void *)objc_msgSend(v5, "initWithNumWiFiAccessPoints:numBLESources:numUWBSources:requestIdentifier:errors:", v6, v8, v10, v12, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *numberOfWiFiAccessPoints;
  id v5;

  numberOfWiFiAccessPoints = self->_numberOfWiFiAccessPoints;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", numberOfWiFiAccessPoints, CFSTR("numberOfWiFiAccessPoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfBLESources, CFSTR("numberOfBLESources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfUWBSources, CFSTR("numberOfUWBSources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("requestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errors, CFSTR("errors"));

}

- (ULFingerprintMetaInfo)initWithCoder:(id)a3
{
  id v4;
  ULFingerprintMetaInfo *v5;
  void *v6;
  uint64_t v7;
  NSNumber *numberOfWiFiAccessPoints;
  void *v9;
  uint64_t v10;
  NSNumber *numberOfBLESources;
  void *v12;
  uint64_t v13;
  NSNumber *numberOfUWBSources;
  void *v15;
  uint64_t v16;
  NSUUID *requestIdentifier;
  ULFingerprintMetaInfo *v18;
  uint64_t v19;
  NSArray *errors;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ULFingerprintMetaInfo;
  v5 = -[ULFingerprintMetaInfo init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfWiFiAccessPoints"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = objc_claimAutoreleasedReturnValue();

    numberOfWiFiAccessPoints = v5->_numberOfWiFiAccessPoints;
    v5->_numberOfWiFiAccessPoints = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfBLESources"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = objc_claimAutoreleasedReturnValue();

    numberOfBLESources = v5->_numberOfBLESources;
    v5->_numberOfBLESources = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfUWBSources"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = objc_claimAutoreleasedReturnValue();

    numberOfUWBSources = v5->_numberOfUWBSources;
    v5->_numberOfUWBSources = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = objc_claimAutoreleasedReturnValue();

    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v16;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("errors"));
    v18 = (ULFingerprintMetaInfo *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_self();
      v19 = objc_claimAutoreleasedReturnValue();

      errors = v5->_errors;
      v5->_errors = (NSArray *)v19;

      v18 = v5;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[ULFingerprintMetaInfo numberOfWiFiAccessPoints](self, "numberOfWiFiAccessPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfWiFiAccessPoints: %@"), v7);

  -[ULFingerprintMetaInfo numberOfBLESources](self, "numberOfBLESources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfBLESources: %@"), v8);

  -[ULFingerprintMetaInfo numberOfUWBSources](self, "numberOfUWBSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", numberOfUWBSources: %@"), v9);

  -[ULFingerprintMetaInfo requestIdentifier](self, "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", requestIdentifier: %@"), v10);

  -[ULFingerprintMetaInfo errors](self, "errors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", errors: %@"), v11);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ULFingerprintMetaInfo numberOfWiFiAccessPoints](self, "numberOfWiFiAccessPoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfWiFiAccessPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[ULFingerprintMetaInfo numberOfWiFiAccessPoints](self, "numberOfWiFiAccessPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfWiFiAccessPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_15;
    }
    -[ULFingerprintMetaInfo numberOfBLESources](self, "numberOfBLESources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfBLESources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

    }
    else
    {
      -[ULFingerprintMetaInfo numberOfBLESources](self, "numberOfBLESources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfBLESources");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_15;
    }
    -[ULFingerprintMetaInfo numberOfUWBSources](self, "numberOfUWBSources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfUWBSources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {

    }
    else
    {
      -[ULFingerprintMetaInfo numberOfUWBSources](self, "numberOfUWBSources");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberOfUWBSources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
        goto LABEL_15;
    }
    -[ULFingerprintMetaInfo requestIdentifier](self, "requestIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", v20))
    {

      goto LABEL_18;
    }
    -[ULFingerprintMetaInfo requestIdentifier](self, "requestIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 == v22)
    {
LABEL_18:
      -[ULFingerprintMetaInfo errors](self, "errors");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqual:", v25))
      {

        v8 = 1;
      }
      else
      {
        -[ULFingerprintMetaInfo errors](self, "errors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "errors");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26 != v27;

        v8 = !v28;
      }
      goto LABEL_16;
    }
LABEL_15:
    v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSNumber hash](self->_numberOfWiFiAccessPoints, "hash");
  v4 = -[NSNumber hash](self->_numberOfBLESources, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_numberOfUWBSources, "hash");
  v6 = v4 ^ v5 ^ -[NSUUID hash](self->_requestIdentifier, "hash");
  return v6 ^ -[NSArray hash](self->_errors, "hash");
}

- (ULFingerprintMetaInfo)init
{
  __assert_rtn("-[ULFingerprintMetaInfo init]", "ULConnectionDelegateTypes.m", 928, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULFingerprintMetaInfo new]", "ULConnectionDelegateTypes.m", 933, "NO");
}

- (NSNumber)numberOfWiFiAccessPoints
{
  return self->_numberOfWiFiAccessPoints;
}

- (void)setNumberOfWiFiAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfWiFiAccessPoints, a3);
}

- (NSNumber)numberOfBLESources
{
  return self->_numberOfBLESources;
}

- (void)setNumberOfBLESources:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfBLESources, a3);
}

- (NSNumber)numberOfUWBSources
{
  return self->_numberOfUWBSources;
}

- (void)setNumberOfUWBSources:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfUWBSources, a3);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfUWBSources, 0);
  objc_storeStrong((id *)&self->_numberOfBLESources, 0);
  objc_storeStrong((id *)&self->_numberOfWiFiAccessPoints, 0);
}

@end
