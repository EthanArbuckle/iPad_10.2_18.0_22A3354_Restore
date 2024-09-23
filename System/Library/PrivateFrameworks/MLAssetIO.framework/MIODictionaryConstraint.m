@implementation MIODictionaryConstraint

- (MIODictionaryConstraint)initWithSpecification:(const void *)a3
{
  char *v4;
  MIODictionaryConstraint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MIODictionaryConstraint;
  v4 = -[MIODictionaryConstraint init](&v7, sel_init);
  v5 = (MIODictionaryConstraint *)v4;
  if (v4)
    CoreML::Specification::DictionaryFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
  return v5;
}

- (const)dictionaryFeatureTypeSpecification
{
  return &self->_dictionaryFeatureTypeParams;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  MIOFeatureTypeToString(-[MIODictionaryConstraint keyType](self, "keyType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("MIODictionaryConstraint { keyType: %@ }"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  MIODictionaryConstraint *v4;
  MIODictionaryConstraint *v5;
  int64_t v6;
  BOOL v7;

  v4 = (MIODictionaryConstraint *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIODictionaryConstraint keyType](self, "keyType");
      v7 = v6 == -[MIODictionaryConstraint keyType](v5, "keyType");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)keyType
{
  unsigned int v2;
  int64_t v3;

  v2 = self->_dictionaryFeatureTypeParams._oneof_case_[0];
  v3 = 3;
  if (v2 != 2)
    v3 = 0;
  if (v2 == 1)
    return 1;
  else
    return v3;
}

- (void).cxx_destruct
{
  CoreML::Specification::DictionaryFeatureType::~DictionaryFeatureType((CoreML::Specification::DictionaryFeatureType *)&self->_dictionaryFeatureTypeParams);
}

- (id).cxx_construct
{
  CoreML::Specification::DictionaryFeatureType::DictionaryFeatureType((CoreML::Specification::DictionaryFeatureType *)&self->_dictionaryFeatureTypeParams);
  return self;
}

@end
