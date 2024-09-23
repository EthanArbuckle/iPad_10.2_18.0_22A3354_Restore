@implementation MPMultiSortDescriptor

- (NSDictionary)relatedProperties
{
  return self->_relatedProperties;
}

+ (id)sortDescriptorWithRelatedProperties:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:ascending:", v8, v4);

  objc_msgSend(v9, "setRelatedProperties:", v5);
  return v9;
}

- (void)setRelatedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MPMultiSortDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMultiSortDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPMultiSortDescriptor;
  v5 = -[MPMultiSortDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("relatedProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMultiSortDescriptor setRelatedProperties:](v5, "setRelatedProperties:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMultiSortDescriptor;
  v4 = a3;
  -[MPMultiSortDescriptor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[MPMultiSortDescriptor relatedProperties](self, "relatedProperties", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("relatedProperties"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedProperties, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
