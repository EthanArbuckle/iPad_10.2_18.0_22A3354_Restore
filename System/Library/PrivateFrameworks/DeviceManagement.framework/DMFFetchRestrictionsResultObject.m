@implementation DMFFetchRestrictionsResultObject

- (DMFFetchRestrictionsResultObject)initWithRestrictions:(id)a3
{
  id v4;
  DMFFetchRestrictionsResultObject *v5;
  uint64_t v6;
  NSDictionary *globalRestrictions;
  uint64_t v8;
  NSDictionary *restrictions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchRestrictionsResultObject;
  v5 = -[CATTaskResultObject init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    globalRestrictions = v5->_globalRestrictions;
    v5->_globalRestrictions = (NSDictionary *)v6;

    v8 = objc_msgSend(v4, "copy");
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSDictionary *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchRestrictionsResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchRestrictionsResultObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *globalRestrictions;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *restrictions;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DMFFetchRestrictionsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v35, sel_initWithCoder_, v4);
  if (v5)
  {
    v33 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v29 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v31, v29, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("globalRestrictions"));
    v15 = objc_claimAutoreleasedReturnValue();
    globalRestrictions = v5->_globalRestrictions;
    v5->_globalRestrictions = (NSDictionary *)v15;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v30 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v32, v30, v17, v18, v19, v20, v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("restrictions"));
    v26 = objc_claimAutoreleasedReturnValue();
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSDictionary *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFFetchRestrictionsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFFetchRestrictionsResultObject globalRestrictions](self, "globalRestrictions", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("globalRestrictions"));

  -[DMFFetchRestrictionsResultObject restrictions](self, "restrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("restrictions"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DMFFetchRestrictionsResultObject restrictions](self, "restrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)restrictions
{
  return self->_restrictions;
}

- (NSDictionary)globalRestrictions
{
  return self->_globalRestrictions;
}

- (NSDictionary)profileRestrictions
{
  return self->_profileRestrictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileRestrictions, 0);
  objc_storeStrong((id *)&self->_globalRestrictions, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
}

@end
