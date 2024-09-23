@implementation ISImageStyleDescriptor

+ (id)defaultStyleDescriptor
{
  if (defaultStyleDescriptor_onceToken != -1)
    dispatch_once(&defaultStyleDescriptor_onceToken, &__block_literal_global_0);
  return (id)defaultStyleDescriptor_defaultStyleDescriptor;
}

void __48__ISImageStyleDescriptor_defaultStyleDescriptor__block_invoke()
{
  ISImageStyleDescriptor *v0;
  void *v1;

  v0 = objc_alloc_init(ISImageStyleDescriptor);
  v1 = (void *)defaultStyleDescriptor_defaultStyleDescriptor;
  defaultStyleDescriptor_defaultStyleDescriptor = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISImageStyleDescriptor)initWithCoder:(id)a3
{
  id v4;
  ISImageStyleDescriptor *v5;
  uint64_t v6;
  IFColor *tintColor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISImageStyleDescriptor;
  v5 = -[ISImageStyleDescriptor init](&v9, sel_init);
  if (v5)
  {
    v5->_templateVariant = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("templateVariant"));
    v5->_selectedVariant = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selectedVariant"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (IFColor *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 selectedVariant;
  id v5;

  selectedVariant = self->_selectedVariant;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", selectedVariant, CFSTR("selectedVariant"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_templateVariant, CFSTR("templateVariant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSelectedVariant:", self->_selectedVariant);
  objc_msgSend(v4, "setTemplateVariant:", self->_templateVariant);
  return v4;
}

- (NSUUID)digest
{
  void *v3;
  IFColor *tintColor;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int16 v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10 = *(_WORD *)&self->_templateVariant;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithBytes:size:", &v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tintColor = self->_tintColor;
  if (tintColor)
  {
    v5 = (void *)MEMORY[0x1E0CB3A28];
    -[IFColor digest](tintColor, "digest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_IF_UUIDByXORingUUIDs:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  return (NSUUID *)v3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_selectedVariant = a3;
}

- (IFColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
