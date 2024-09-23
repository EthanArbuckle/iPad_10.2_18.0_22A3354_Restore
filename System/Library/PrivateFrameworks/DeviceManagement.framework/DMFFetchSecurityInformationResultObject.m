@implementation DMFFetchSecurityInformationResultObject

- (DMFFetchSecurityInformationResultObject)initWithSecurityInformation:(id)a3
{
  id v4;
  DMFFetchSecurityInformationResultObject *v5;
  uint64_t v6;
  DMFSecurityInformation *securityInformation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchSecurityInformationResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    securityInformation = v5->_securityInformation;
    v5->_securityInformation = (DMFSecurityInformation *)v6;

  }
  return v5;
}

- (DMFFetchSecurityInformationResultObject)initWithValuesByPropertyKey:(id)a3 errorsByPropertyKey:(id)a4
{
  id v6;
  id v7;
  DMFFetchSecurityInformationResultObject *v8;
  uint64_t v9;
  NSDictionary *valuesByPropertyKey;
  uint64_t v11;
  NSDictionary *errorsByPropertyKey;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMFFetchSecurityInformationResultObject;
  v8 = -[CATTaskResultObject init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    valuesByPropertyKey = v8->_valuesByPropertyKey;
    v8->_valuesByPropertyKey = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    errorsByPropertyKey = v8->_errorsByPropertyKey;
    v8->_errorsByPropertyKey = (NSDictionary *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchSecurityInformationResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchSecurityInformationResultObject *v5;
  void *v6;
  uint64_t v7;
  DMFSecurityInformation *securityInformation;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *valuesByPropertyKey;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *errorsByPropertyKey;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DMFFetchSecurityInformationResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v38, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("securityInformation"));
    v7 = objc_claimAutoreleasedReturnValue();
    securityInformation = v5->_securityInformation;
    v5->_securityInformation = (DMFSecurityInformation *)v7;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v32 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v34, v32, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("valuesByPropertyKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    valuesByPropertyKey = v5->_valuesByPropertyKey;
    v5->_valuesByPropertyKey = (NSDictionary *)v18;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    v33 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v35, v33, v20, v21, v22, v23, v24, v25, v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("errorsByPropertyKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    errorsByPropertyKey = v5->_errorsByPropertyKey;
    v5->_errorsByPropertyKey = (NSDictionary *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMFFetchSecurityInformationResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[DMFFetchSecurityInformationResultObject securityInformation](self, "securityInformation", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("securityInformation"));

  -[DMFFetchSecurityInformationResultObject valuesByPropertyKey](self, "valuesByPropertyKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valuesByPropertyKey"));

  -[DMFFetchSecurityInformationResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("errorsByPropertyKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[DMFFetchSecurityInformationResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMFFetchSecurityInformationResultObject valuesByPropertyKey](self, "valuesByPropertyKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[DMFFetchSecurityInformationResultObject securityInformation](self, "securityInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p %@ %@>"), v8, self, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (DMFSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (NSDictionary)valuesByPropertyKey
{
  return self->_valuesByPropertyKey;
}

- (NSDictionary)errorsByPropertyKey
{
  return self->_errorsByPropertyKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByPropertyKey, 0);
  objc_storeStrong((id *)&self->_valuesByPropertyKey, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
}

@end
