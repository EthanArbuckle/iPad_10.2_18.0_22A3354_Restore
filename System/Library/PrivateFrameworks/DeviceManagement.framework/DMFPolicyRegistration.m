@implementation DMFPolicyRegistration

- (NSSet)policyTypes
{
  return self->_policyTypes;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_policyTypes, CFSTR("policyTypes"));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_policyTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (DMFPolicyRegistration)initWithCoder:(id)a3
{
  id v4;
  DMFPolicyRegistration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSSet *policyTypes;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFPolicyRegistration;
  v5 = -[DMFPolicyRegistration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("policyTypes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v10, "copy");
    policyTypes = v5->_policyTypes;
    v5->_policyTypes = (NSSet *)v13;

  }
  return v5;
}

- (DMFPolicyRegistration)initWithIdentifier:(id)a3 policyTypes:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  DMFPolicyRegistration *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSSet *policyTypes;
  uint64_t v17;
  id callback;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFPolicyRegistration.m"), 21, CFSTR("Missing policy types"));

  }
  v21.receiver = self;
  v21.super_class = (Class)DMFPolicyRegistration;
  v12 = -[DMFPolicyRegistration init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    policyTypes = v12->_policyTypes;
    v12->_policyTypes = (NSSet *)v15;

    v17 = MEMORY[0x1BCCB7F34](v11);
    callback = v12->_callback;
    v12->_callback = (id)v17;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:policyTypes:callback:", self->_identifier, self->_policyTypes, self->_callback);
}

- (BOOL)isEqual:(id)a3
{
  DMFPolicyRegistration *v4;
  DMFPolicyRegistration *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (DMFPolicyRegistration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFPolicyRegistration identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFPolicyRegistration identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DMFPolicyRegistration identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
