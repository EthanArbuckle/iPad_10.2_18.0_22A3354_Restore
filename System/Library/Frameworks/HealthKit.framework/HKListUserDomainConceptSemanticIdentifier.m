@implementation HKListUserDomainConceptSemanticIdentifier

- (HKListUserDomainConceptSemanticIdentifier)init
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

- (HKListUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (HKListUserDomainConceptSemanticIdentifier)initWithListType:(unint64_t)a3
{
  void *v5;
  HKListUserDomainConceptSemanticIdentifier *v6;
  objc_super v8;

  +[HKUserDomainConceptTypeIdentifier listUserDomainConceptIdentifier](HKUserDomainConceptTypeIdentifier, "listUserDomainConceptIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HKListUserDomainConceptSemanticIdentifier;
  v6 = -[HKUserDomainConceptSemanticIdentifier initWithTypeIdentifier:](&v8, sel_initWithTypeIdentifier_, v5);

  if (v6)
    v6->_listType = a3;
  return v6;
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("(null)")) & 1) == 0 && v4)
    {
      v6 = (objc_class *)MEMORY[0x1E0CB37F0];
      v7 = v4;
      v8 = objc_alloc_init(v6);
      objc_msgSend(v8, "numberFromString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithListType:", objc_msgSend(v9, "integerValue"));
      else
        v5 = 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HKListUserDomainConceptSemanticIdentifier;
  -[HKUserDomainConceptSemanticIdentifier stringValue](&v8, sel_stringValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_listType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("|█|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)listType
{
  return self->_listType;
}

@end
