@implementation HKUserDomainConceptTypeIdentifier(HDSyncSupport)

- (HDCodableUserDomainConceptTypeIdentifier)codableRepresentationForSync
{
  HDCodableUserDomainConceptTypeIdentifier *v2;
  void *v3;

  v2 = objc_alloc_init(HDCodableUserDomainConceptTypeIdentifier);
  objc_msgSend(a1, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptTypeIdentifier setSchema:](v2, "setSchema:", v3);

  -[HDCodableUserDomainConceptTypeIdentifier setCode:](v2, "setCode:", objc_msgSend(a1, "code"));
  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB6D48]);
    v5 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "schema");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithCode:schema:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
