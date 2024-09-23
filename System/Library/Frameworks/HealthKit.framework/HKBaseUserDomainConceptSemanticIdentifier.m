@implementation HKBaseUserDomainConceptSemanticIdentifier

- (HKBaseUserDomainConceptSemanticIdentifier)init
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

- (HKBaseUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
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

- (HKBaseUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3
{
  id v5;
  void *v6;
  HKBaseUserDomainConceptSemanticIdentifier *v7;
  objc_super v9;

  v5 = a3;
  +[HKUserDomainConceptTypeIdentifier baseUserDomainConceptIdentifier](HKUserDomainConceptTypeIdentifier, "baseUserDomainConceptIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HKBaseUserDomainConceptSemanticIdentifier;
  v7 = -[HKUserDomainConceptSemanticIdentifier initWithTypeIdentifier:](&v9, sel_initWithTypeIdentifier_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_UUID, a3);

  return v7;
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("(null)")) & 1) == 0 && v4)
    {
      v6 = (objc_class *)MEMORY[0x1E0CB3A28];
      v7 = v4;
      v8 = (void *)objc_msgSend([v6 alloc], "initWithUUIDString:", v7);

      if (v8)
        v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUUID:", v8);
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
  v8.super_class = (Class)HKBaseUserDomainConceptSemanticIdentifier;
  -[HKUserDomainConceptSemanticIdentifier stringValue](&v8, sel_stringValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("|█|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
