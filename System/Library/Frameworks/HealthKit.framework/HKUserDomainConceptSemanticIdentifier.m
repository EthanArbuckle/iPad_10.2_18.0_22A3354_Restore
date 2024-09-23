@implementation HKUserDomainConceptSemanticIdentifier

- (HKUserDomainConceptSemanticIdentifier)init
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

- (HKUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  id v5;
  HKUserDomainConceptSemanticIdentifier *v6;
  HKUserDomainConceptSemanticIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserDomainConceptSemanticIdentifier;
  v6 = -[HKUserDomainConceptSemanticIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_typeIdentifier, a3);

  return v7;
}

- (NSString)stringValue
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[HKUserDomainConceptTypeIdentifier schema](self->_typeIdentifier, "schema");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("(null)");
  if (v3)
    v5 = (const __CFString *)v3;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKUserDomainConceptTypeIdentifier code](self->_typeIdentifier, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("|█|"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKUserDomainConceptSemanticIdentifier stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptSemanticIdentifier *v4;
  HKUserDomainConceptSemanticIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HKUserDomainConceptSemanticIdentifier *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKUserDomainConceptSemanticIdentifier stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKUserDomainConceptSemanticIdentifier stringValue](v5, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v11 = 1;
      }
      else
      {
        -[HKUserDomainConceptSemanticIdentifier stringValue](v5, "stringValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKUserDomainConceptSemanticIdentifier stringValue](self, "stringValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKUserDomainConceptSemanticIdentifier stringValue](v5, "stringValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqualToString:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (HKUserDomainConceptTypeIdentifier)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
