@implementation LNSearchCriteriaValueType

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

+ (LNSearchCriteriaValueType)stringValueType
{
  if (stringValueType_onceToken != -1)
    dispatch_once(&stringValueType_onceToken, &__block_literal_global);
  return (LNSearchCriteriaValueType *)(id)stringValueType_value;
}

- (LNSearchCriteriaValueType)initWithTypeIdentifier:(int64_t)a3
{
  LNSearchCriteriaValueType *v4;
  LNSearchCriteriaValueType *v5;
  LNSearchCriteriaValueType *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNSearchCriteriaValueType;
  v4 = -[LNValueType _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_typeIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)typeIdentifierAsString
{
  -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier");
  return (NSString *)CFSTR("String");
}

- (Class)objectClass
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "supportedClassesByTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (id)description
{
  -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier");
  return CFSTR("String");
}

- (LNSearchCriteriaValueType)initWithCoder:(id)a3
{
  return -[LNSearchCriteriaValueType initWithTypeIdentifier:](self, "initWithTypeIdentifier:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("typeIdentifier")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier"), CFSTR("typeIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  LNSearchCriteriaValueType *v4;
  LNSearchCriteriaValueType *v5;
  LNSearchCriteriaValueType *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNSearchCriteriaValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier");
      v8 = v7 == -[LNSearchCriteriaValueType typeIdentifier](v6, "typeIdentifier");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)objectClassesForCoding
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "supportedClassesByTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = &unk_1E39B46B8;
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __44__LNSearchCriteriaValueType_stringValueType__block_invoke()
{
  LNSearchCriteriaValueType *v0;
  void *v1;

  v0 = -[LNSearchCriteriaValueType initWithTypeIdentifier:]([LNSearchCriteriaValueType alloc], "initWithTypeIdentifier:", 0);
  v1 = (void *)stringValueType_value;
  stringValueType_value = (uint64_t)v0;

}

@end
