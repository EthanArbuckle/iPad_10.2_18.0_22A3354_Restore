@implementation HKMedicationUserDomainConceptSemanticIdentifier

- (id)stringValue
{
  id v3;
  void *v4;
  HKMedicalCoding *medicalCoding;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", CFSTR("medication"));
  objc_msgSend(&unk_1E6CE01A0, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  medicalCoding = self->_medicalCoding;
  if (medicalCoding)
  {
    -[HKMedicalCoding codingSystem](medicalCoding, "codingSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *MEMORY[0x1E0CB6088];
    if (v7)
      v10 = v7;
    else
      v10 = *MEMORY[0x1E0CB6088];
    objc_msgSend(v3, "addObject:", v10);

    -[HKMedicalCoding code](self->_medicalCoding, "code");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = v11;
    else
      v13 = v9;
    objc_msgSend(v3, "addObject:", v13);
  }
  else
  {
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0CB6098]);
    -[HKMedicationUserDomainConceptSemanticIdentifier UUID](self, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  objc_msgSend(v3, "componentsJoinedByString:", *MEMORY[0x1E0CB6090]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (HKMedicationUserDomainConceptSemanticIdentifier)init
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

- (HKMedicationUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
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

- (HKMedicationUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3 medicalCoding:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HKMedicationUserDomainConceptSemanticIdentifier *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if ((v8 != 0) != (v9 == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationUserDomainConceptSemanticIdentifier.m"), 27, CFSTR("Trying to initialize a medication user domain concept semantic identifier, but UUID and Medical coding are both populated, or both unpopulated"));

  }
  objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationUserDomainConceptSemanticIdentifier;
  v11 = -[HKUserDomainConceptSemanticIdentifier initWithTypeIdentifier:](&v14, sel_initWithTypeIdentifier_, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_UUID, a3);
    objc_storeStrong((id *)&v11->_medicalCoding, a4);
  }

  return v11;
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CB6088];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB6088]))
      v6 = 0;
    else
      v6 = v4;
    v7 = v6;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v5))
      v9 = 0;
    else
      v9 = v8;
    v10 = v9;
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB6098]))
    {
      if (v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
        if (!v11)
        {
          v15 = 0;
          goto LABEL_16;
        }
        v12 = objc_alloc((Class)objc_opt_class());
        v13 = v11;
        v14 = 0;
LABEL_15:
        v15 = (void *)objc_msgSend(v12, "initWithUUID:medicalCoding:", v13, v14);
LABEL_16:

LABEL_18:
        goto LABEL_19;
      }
    }
    else if (v7)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB6828]);
      objc_msgSend(MEMORY[0x1E0CB6838], "codeSystemWithIdentifier:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v16, "initWithCodingSystem:codingVersion:code:displayString:", v17, 0, v10, 0);

      v12 = objc_alloc((Class)objc_opt_class());
      v13 = 0;
      v14 = v11;
      goto LABEL_15;
    }
    v15 = 0;
    goto LABEL_18;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (HKMedicalCoding)medicalCoding
{
  return self->_medicalCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalCoding, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
