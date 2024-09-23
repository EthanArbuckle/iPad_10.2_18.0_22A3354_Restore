@implementation CRKFetchRestrictionsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchRestrictionsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchRestrictionsResultObject valuesByRestriction](self, "valuesByRestriction", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("valuesByRestriction"));

}

- (CRKFetchRestrictionsResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchRestrictionsResultObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *valuesByRestriction;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchRestrictionsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("valuesByRestriction"));
    v10 = objc_claimAutoreleasedReturnValue();
    valuesByRestriction = v5->_valuesByRestriction;
    v5->_valuesByRestriction = (NSDictionary *)v10;

  }
  return v5;
}

- (NSDictionary)valuesByRestriction
{
  return self->_valuesByRestriction;
}

- (void)setValuesByRestriction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByRestriction, 0);
}

@end
