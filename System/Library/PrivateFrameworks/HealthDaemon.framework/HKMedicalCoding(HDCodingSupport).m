@implementation HKMedicalCoding(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "hasCodingSystem"))
    {
      v5 = (void *)MEMORY[0x1E0CB6838];
      objc_msgSend(v4, "codingSystem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "codeSystemWithIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v9 = (void *)MEMORY[0x1E0CB6828];
    objc_msgSend(v4, "codingVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "code");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "medicalCodingWithSystem:codingVersion:code:displayString:", v7, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_validateConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v8 = 0;
    else
      v8 = v13;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HDCodableMedicalCoding)codableRepresentationForSync
{
  HDCodableMedicalCoding *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(HDCodableMedicalCoding);
  objc_msgSend(a1, "codingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalCoding setCodingSystem:](v2, "setCodingSystem:", v4);

  objc_msgSend(a1, "codingVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalCoding setCodingVersion:](v2, "setCodingVersion:", v5);

  objc_msgSend(a1, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalCoding setCode:](v2, "setCode:", v6);

  objc_msgSend(a1, "displayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalCoding setDisplayString:](v2, "setDisplayString:", v7);

  return v2;
}

@end
