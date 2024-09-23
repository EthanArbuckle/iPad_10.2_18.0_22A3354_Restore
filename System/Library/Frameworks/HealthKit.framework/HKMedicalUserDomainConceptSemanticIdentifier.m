@implementation HKMedicalUserDomainConceptSemanticIdentifier

- (HKMedicalUserDomainConceptSemanticIdentifier)init
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

- (HKMedicalUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
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

- (HKMedicalUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3 countryCode:(id)a4 medicalCoding:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HKMedicalUserDomainConceptSemanticIdentifier *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((v10 != 0) != (v12 == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicalUserDomainConceptSemanticIdentifier.m"), 32, CFSTR("Trying to initialize a medical user domain concept semantic identifier, but UUID and Medical coding are both populated, or both unpopulated"));

  }
  +[HKUserDomainConceptTypeIdentifier medicalUserDomainConceptIdentifier](HKUserDomainConceptTypeIdentifier, "medicalUserDomainConceptIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HKMedicalUserDomainConceptSemanticIdentifier;
  v14 = -[HKUserDomainConceptSemanticIdentifier initWithTypeIdentifier:](&v17, sel_initWithTypeIdentifier_, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_UUID, a3);
    objc_storeStrong((id *)&v14->_countryCode, a4);
    objc_storeStrong((id *)&v14->_medicalCoding, a5);
  }

  return v14;
}

+ (HKMedicalUserDomainConceptSemanticIdentifier)semanticIdentifierWithComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  HKMedicalCoding *v13;
  id v14;
  HKMedicalCoding *v15;
  id v16;
  HKMedicalCoding *v17;
  void *v18;
  HKMedicalCoding *v19;
  void *v20;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 3)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("(null)")))
      v5 = 0;
    else
      v5 = v4;
    v6 = v5;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("(null)")))
      v8 = 0;
    else
      v8 = v7;
    v9 = v8;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("(null)")))
      v11 = 0;
    else
      v11 = v10;
    v12 = v11;
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("UUID")))
    {
      if (v12)
      {
        v13 = (HKMedicalCoding *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
        if (!v13)
        {
          v18 = 0;
          goto LABEL_19;
        }
        v14 = objc_alloc((Class)objc_opt_class());
        v15 = v13;
        v16 = v6;
        v17 = 0;
LABEL_18:
        v18 = (void *)objc_msgSend(v14, "initWithUUID:countryCode:medicalCoding:", v15, v16, v17);
LABEL_19:

LABEL_21:
        goto LABEL_22;
      }
    }
    else if (v9)
    {
      v19 = [HKMedicalCoding alloc];
      +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HKMedicalCoding initWithCodingSystem:codingVersion:code:displayString:](v19, "initWithCodingSystem:codingVersion:code:displayString:", v20, 0, v12, 0);

      v14 = objc_alloc((Class)objc_opt_class());
      v15 = 0;
      v16 = v6;
      v17 = v13;
      goto LABEL_18;
    }
    v18 = 0;
    goto LABEL_21;
  }
  v18 = 0;
LABEL_22:

  return (HKMedicalUserDomainConceptSemanticIdentifier *)v18;
}

- (id)stringValue
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  HKMedicalCoding *medicalCoding;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19.receiver = self;
  v19.super_class = (Class)HKMedicalUserDomainConceptSemanticIdentifier;
  -[HKUserDomainConceptSemanticIdentifier stringValue](&v19, sel_stringValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[NSString uppercaseString](self->_countryCode, "uppercaseString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("(null)");
  objc_msgSend(v3, "addObject:", v7);

  medicalCoding = self->_medicalCoding;
  if (medicalCoding)
  {
    -[HKMedicalCoding codingSystem](medicalCoding, "codingSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = CFSTR("(null)");
    objc_msgSend(v3, "addObject:", v12);

    -[HKMedicalCoding code](self->_medicalCoding, "code");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = CFSTR("(null)");
    objc_msgSend(v3, "addObject:", v15);
  }
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("UUID"));
    -[HKMedicalUserDomainConceptSemanticIdentifier UUID](self, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|█|"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (HKMedicalCoding)medicalCoding
{
  return self->_medicalCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalCoding, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
