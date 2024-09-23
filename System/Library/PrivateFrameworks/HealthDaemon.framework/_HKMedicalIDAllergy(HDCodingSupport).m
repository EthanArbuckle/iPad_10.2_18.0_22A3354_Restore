@implementation _HKMedicalIDAllergy(HDCodingSupport)

- (HDCodableMedicalIDAllergy)codableRepresentationForSync
{
  HDCodableMedicalIDAllergy *v2;
  void *v3;

  v2 = objc_alloc_init(HDCodableMedicalIDAllergy);
  objc_msgSend(a1, "textDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDAllergy setTextDescription:](v2, "setTextDescription:", v3);

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB6FC8];
    v5 = v3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v5, "textDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setTextDescription:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
