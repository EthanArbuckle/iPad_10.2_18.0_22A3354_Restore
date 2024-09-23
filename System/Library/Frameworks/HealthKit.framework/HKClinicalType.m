@implementation HKClinicalType

- (HKClinicalType)initWithIdentifier:(id)a3
{
  id v4;
  HKClinicalType *v5;

  v4 = a3;
  +[HKObjectType clinicalTypeForIdentifier:](HKObjectType, "clinicalTypeForIdentifier:", v4);
  v5 = (HKClinicalType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

- (BOOL)isClinicalType
{
  return 1;
}

+ (id)sampleTypesForResourceType:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[2];
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AllergyIntolerance")))
  {
    +[HKClinicalType allergyRecordType](HKClinicalType, "allergyRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = (void **)v20;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Condition")))
  {
    +[HKClinicalType conditionRecordType](HKClinicalType, "conditionRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v19;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Coverage")))
  {
    +[HKClinicalType coverageRecordType](HKClinicalType, "coverageRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v18;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("DiagnosticReport")))
  {
    +[HKClinicalType clinicalNoteRecordType](HKClinicalType, "clinicalNoteRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v17;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("DocumentReference")))
  {
    +[HKClinicalType clinicalNoteRecordType](HKClinicalType, "clinicalNoteRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v16;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Immunization")))
  {
    +[HKClinicalType immunizationRecordType](HKClinicalType, "immunizationRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v15;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MedicationDispense")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("MedicationOrder")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("MedicationRequest")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("MedicationStatement")))
  {
    +[HKClinicalType medicationRecordType](HKClinicalType, "medicationRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v14;
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Observation")))
    {
      +[HKClinicalType labResultRecordType](HKClinicalType, "labResultRecordType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v6;
      +[HKClinicalType vitalSignRecordType](HKClinicalType, "vitalSignRecordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Patient")) & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_20;
    }
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Procedure")))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("There is no clinical record type known for resourceType %@"), v5);
      v9 = 0;
      goto LABEL_20;
    }
    +[HKClinicalType procedureRecordType](HKClinicalType, "procedureRecordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v12;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
  return v9;
}

+ (id)allTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__HKClinicalType_allTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allTypes_onceToken != -1)
    dispatch_once(&allTypes_onceToken, block);
  return (id)allTypes_allTypes;
}

void __26__HKClinicalType_allTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierAllergyRecord"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierConditionRecord"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierImmunizationRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierLabResultRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierMedicationRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierProcedureRecord"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierVitalSignRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierCoverageRecord"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierClinicalNoteRecord"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)allTypes_allTypes;
  allTypes_allTypes = v11;

}

+ (id)allergyRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierAllergyRecord"));
}

+ (id)conditionRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierConditionRecord"));
}

+ (id)immunizationRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierImmunizationRecord"));
}

+ (id)labResultRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierLabResultRecord"));
}

+ (id)medicationRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierMedicationRecord"));
}

+ (id)procedureRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierProcedureRecord"));
}

+ (id)vitalSignRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierVitalSignRecord"));
}

+ (id)coverageRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierCoverageRecord"));
}

+ (id)clinicalNoteRecordType
{
  return (id)objc_msgSend(a1, "clinicalTypeForIdentifier:", CFSTR("HKClinicalTypeIdentifierClinicalNoteRecord"));
}

@end
