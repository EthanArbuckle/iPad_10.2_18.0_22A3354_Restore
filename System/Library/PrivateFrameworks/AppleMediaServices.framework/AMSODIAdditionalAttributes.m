@implementation AMSODIAdditionalAttributes

- (AMSODIAdditionalAttributes)initWithAttributes:(id)a3
{
  id v4;
  AMSODIAdditionalAttributes *v5;
  uint64_t v6;
  NSDictionary *attributes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSODIAdditionalAttributes;
  v5 = -[AMSODIAdditionalAttributes init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSODIAdditionalAttributes *v5;
  uint64_t v6;
  NSDictionary *attributes;

  v5 = objc_alloc_init(AMSODIAdditionalAttributes);
  v6 = -[NSDictionary copyWithZone:](self->_attributes, "copyWithZone:", a3);
  attributes = v5->_attributes;
  v5->_attributes = (NSDictionary *)v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_attributes, CFSTR("attributes"));
}

- (AMSODIAdditionalAttributes)initWithCoder:(id)a3
{
  id v4;
  AMSODIAdditionalAttributes *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *attributes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSODIAdditionalAttributes;
  v5 = -[AMSODIAdditionalAttributes init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("attributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
