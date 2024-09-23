@implementation HKUserDomainConceptLink

- (HKUserDomainConceptLink)initWithLinkStructWrapper:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKUserDomainConceptLink *v7;

  v4 = a3;
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");

  v7 = -[HKUserDomainConceptLink initWithTarget:type:](self, "initWithTarget:type:", v5, v6);
  return v7;
}

- (HKUserDomainConceptLink)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptLink)initWithTarget:(id)a3 type:(int64_t)a4
{
  id v6;
  HKUserDomainConceptLink *v7;
  HKUserDomainConceptLinkStructWrapper *v8;
  HKUserDomainConceptLinkStructWrapper *implementation;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLink;
  v7 = -[HKUserDomainConceptLink init](&v11, sel_init);
  if (v7)
  {
    v8 = -[HKUserDomainConceptLinkStructWrapper initWithTarget:type:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithTarget:type:", v6, a4);
    implementation = v7->_implementation;
    v7->_implementation = v8;

  }
  return v7;
}

- (HKUserDomainConceptLink)initWithUserConcept:(id)a3 type:(int64_t)a4
{
  void *v6;
  HKUserDomainConceptLink *v7;

  objc_msgSend(a3, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKUserDomainConceptLink initWithTarget:type:](self, "initWithTarget:type:", v6, a4);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  HKStringFromUserDomainConceptLinkType(-[HKUserDomainConceptLink type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConceptLink targetUUID](self, "targetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_shortRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%@, %@)>"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)targetUUID
{
  return -[HKUserDomainConceptLinkStructWrapper target](self->_implementation, "target");
}

- (int64_t)type
{
  return -[HKUserDomainConceptLinkStructWrapper type](self->_implementation, "type");
}

- (unint64_t)hash
{
  return -[HKUserDomainConceptLinkStructWrapper hash](self->_implementation, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptLink *v4;
  BOOL v5;

  v4 = (HKUserDomainConceptLink *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKUserDomainConceptLinkStructWrapper isEqual:](self->_implementation, "isEqual:", v4->_implementation);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKUserDomainConceptLinkStructWrapper *implementation;
  void *v5;
  id v6;

  implementation = self->_implementation;
  v6 = a3;
  -[HKUserDomainConceptLinkStructWrapper target](implementation, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("uuid"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[HKUserDomainConceptLinkStructWrapper type](self->_implementation, "type"), CFSTR("type"));
}

- (HKUserDomainConceptLink)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKUserDomainConceptLink *v7;
  HKUserDomainConceptLinkStructWrapper *v8;
  HKUserDomainConceptLinkStructWrapper *implementation;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLink;
  v7 = -[HKUserDomainConceptLink init](&v11, sel_init);
  if (v7)
  {
    v8 = -[HKUserDomainConceptLinkStructWrapper initWithTarget:type:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithTarget:type:", v5, v6);
    implementation = v7->_implementation;
    v7->_implementation = v8;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
}

@end
