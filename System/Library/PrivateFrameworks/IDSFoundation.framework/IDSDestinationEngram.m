@implementation IDSDestinationEngram

- (IDSDestinationEngram)initWithENGroup:(id)a3
{
  id v5;
  IDSDestinationEngram *v6;
  IDSDestinationEngram *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDestinationEngram;
  v6 = -[IDSDestinationEngram init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingGroup, a3);

  return v7;
}

- (IDSDestinationEngram)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  IDSDestinationEngram *v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSDestinationEngramENGroupKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (IDSDestinationEngram *)objc_msgSend_initWithENGroup_(self, v9, (uint64_t)v8, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_underlyingGroup(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, CFSTR("kIDSDestinationEngramENGroupKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_underlyingGroup(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinations(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_destinationURIs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p groupID: %@>"), v10, v4, self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (ENGroup)underlyingGroup
{
  return self->_underlyingGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingGroup, 0);
}

@end
