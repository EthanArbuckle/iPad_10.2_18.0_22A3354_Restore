@implementation HKMedicationRecord

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKMedicationRecord medicationCodingCollection](self, "medicationCodingCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "codings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultDisplayString
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_MEDICATION"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)recordCategoryType
{
  return 1;
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)medicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 assertionType:(int64_t)a16 asserter:(id)a17 assertionDate:(id)a18 statusCoding:(id)a19 dosages:(id)a20 earliestDosageDate:(id)a21 reasonForUseCodingCollections:(id)a22 notTaken:(BOOL)a23 reasonsNotTakenCodingCollections:(id)a24 effectiveStartDate:(id)a25 effectiveEndDate:(id)a26
{
  uint64_t v27;

  LOBYTE(v27) = a23;
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newMedicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                                           a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           v27,
                                           a24,
                                           a25,
                                           a26,
                                           0));
}

+ (id)_newMedicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 assertionType:(int64_t)a16 asserter:(id)a17 assertionDate:(id)a18 statusCoding:(id)a19 dosages:(id)a20 earliestDosageDate:(id)a21 reasonForUseCodingCollections:(id)a22 notTaken:(BOOL)a23 reasonsNotTakenCodingCollections:(id)a24 effectiveStartDate:(id)a25 effectiveEndDate:(id)a26 config:(id)a27
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _BOOL4 v66;
  id v67;
  objc_super v68;
  _QWORD aBlock[4];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  int64_t v81;
  BOOL v82;

  v66 = a5;
  v27 = a15;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v31 = a20;
  v32 = a21;
  v33 = a22;
  v34 = a24;
  v35 = a25;
  v36 = a26;
  v37 = a27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __384__HKMedicationRecord__newMedicationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_assertionType_asserter_assertionDate_statusCoding_dosages_earliestDosageDate_reasonForUseCodingCollections_notTaken_reasonsNotTakenCodingCollections_effectiveStartDate_effectiveEndDate_config___block_invoke;
  aBlock[3] = &unk_1E37F2C58;
  v70 = v27;
  v71 = v28;
  v72 = v29;
  v73 = v30;
  v74 = v31;
  v75 = v32;
  v82 = a23;
  v76 = v33;
  v77 = v34;
  v78 = v35;
  v79 = v36;
  v80 = v37;
  v81 = a16;
  v65 = v37;
  v64 = v36;
  v63 = v35;
  v62 = v34;
  v61 = v33;
  v60 = v32;
  v59 = v31;
  v58 = v30;
  v57 = v29;
  v56 = v28;
  v55 = v27;
  v38 = a13;
  v39 = a12;
  v40 = a11;
  v41 = a10;
  v42 = a8;
  v43 = a7;
  v44 = a6;
  v45 = a4;
  v46 = a3;
  v47 = _Block_copy(aBlock);
  v68.receiver = a1;
  v68.super_class = (Class)&OBJC_METACLASS___HKMedicationRecord;
  v67 = objc_msgSendSuper2(&v68, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v46, v45, v66, v44, v43, v42, a9, v41, v40, v39, v38, a14, v47);

  return v67;
}

void __384__HKMedicationRecord__newMedicationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_assertionType_asserter_assertionDate_statusCoding_dosages_earliestDosageDate_reasonForUseCodingCollections_notTaken_reasonsNotTakenCodingCollections_effectiveStartDate_effectiveEndDate_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;

  v24 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v24[22];
  v24[22] = v3;

  v24[23] = *(_QWORD *)(a1 + 120);
  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v24[24];
  v24[24] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v24[25];
  v24[25] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v24[26];
  v24[26] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v24[27];
  v24[27] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v24[28];
  v24[28] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v24[29];
  v24[29] = v15;

  *((_BYTE *)v24 + 240) = *(_BYTE *)(a1 + 128);
  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v24[31];
  v24[31] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v24[32];
  v24[32] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v24[33];
  v24[33] = v21;

  v23 = *(_QWORD *)(a1 + 112);
  if (v23)
    (*(void (**)(uint64_t, _QWORD *))(v23 + 16))(v23, v24);

}

- (HKMedicationRecord)init
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

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@medicationCodingCollection = %@assertionType = %ldasserter = %@assertionDate = %@statusCoding = %@dosages = %@earliestDosageDate = %@reasonForUseCodingCollections = %@notTaken = %ldreasonsNotTakenCodingCollections = %@effectiveStartDate = %@effectiveEndDate = %@>"), v5, self, v6, self->_medicationCodingCollection, self->_assertionType, self->_asserter, self->_assertionDate, self->_statusCoding, self->_dosages, self->_earliestDosageDate, self->_reasonForUseCodingCollections, self->_notTaken, self->_reasonsNotTakenCodingCollections, self->_effectiveStartDate, self->_effectiveEndDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicationRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationCodingCollection, CFSTR("MedicationCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_assertionType, CFSTR("AssertionType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_asserter, CFSTR("Asserter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_assertionDate, CFSTR("AssertionDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dosages, CFSTR("Dosages"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_earliestDosageDate, CFSTR("EarliestDosageDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonForUseCodingCollections, CFSTR("ReasonForUseCodingCollections"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_notTaken, CFSTR("NotTaken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsNotTakenCodingCollections, CFSTR("ReasonsNotTakenCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveStartDate, CFSTR("EffectiveStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveEndDate, CFSTR("EffectiveEndDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_medication, CFSTR("Medication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonForUse, CFSTR("ReasonForUse"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsNotTaken, CFSTR("ReasonsNotTaken"));

}

- (HKMedicationRecord)initWithCoder:(id)a3
{
  id v4;
  HKMedicationRecord *v5;
  uint64_t v6;
  HKMedicalCodingCollection *medicationCodingCollection;
  uint64_t v8;
  NSString *asserter;
  uint64_t v10;
  HKMedicalDate *assertionDate;
  uint64_t v12;
  HKMedicalCoding *statusCoding;
  void *v14;
  uint64_t v15;
  NSArray *dosages;
  uint64_t v17;
  HKMedicalDate *earliestDosageDate;
  void *v19;
  uint64_t v20;
  NSArray *reasonForUseCodingCollections;
  void *v22;
  uint64_t v23;
  NSArray *reasonsNotTakenCodingCollections;
  uint64_t v25;
  HKMedicalDate *effectiveStartDate;
  uint64_t v27;
  HKMedicalDate *effectiveEndDate;
  uint64_t v29;
  HKConcept *medication;
  uint64_t v31;
  HKConcept *status;
  void *v33;
  uint64_t v34;
  NSArray *reasonForUse;
  void *v36;
  uint64_t v37;
  NSArray *reasonsNotTaken;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)HKMedicationRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v40, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    medicationCodingCollection = v5->_medicationCodingCollection;
    v5->_medicationCodingCollection = (HKMedicalCodingCollection *)v6;

    v5->_assertionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AssertionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Asserter"));
    v8 = objc_claimAutoreleasedReturnValue();
    asserter = v5->_asserter;
    v5->_asserter = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssertionDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    assertionDate = v5->_assertionDate;
    v5->_assertionDate = (HKMedicalDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v12 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("Dosages"));
    v15 = objc_claimAutoreleasedReturnValue();
    dosages = v5->_dosages;
    v5->_dosages = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EarliestDosageDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    earliestDosageDate = v5->_earliestDosageDate;
    v5->_earliestDosageDate = (HKMedicalDate *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("ReasonForUseCodingCollections"));
    v20 = objc_claimAutoreleasedReturnValue();
    reasonForUseCodingCollections = v5->_reasonForUseCodingCollections;
    v5->_reasonForUseCodingCollections = (NSArray *)v20;

    v5->_notTaken = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotTaken"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("ReasonsNotTakenCodingCollections"));
    v23 = objc_claimAutoreleasedReturnValue();
    reasonsNotTakenCodingCollections = v5->_reasonsNotTakenCodingCollections;
    v5->_reasonsNotTakenCodingCollections = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EffectiveStartDate"));
    v25 = objc_claimAutoreleasedReturnValue();
    effectiveStartDate = v5->_effectiveStartDate;
    v5->_effectiveStartDate = (HKMedicalDate *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EffectiveEndDate"));
    v27 = objc_claimAutoreleasedReturnValue();
    effectiveEndDate = v5->_effectiveEndDate;
    v5->_effectiveEndDate = (HKMedicalDate *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Medication"));
    v29 = objc_claimAutoreleasedReturnValue();
    medication = v5->_medication;
    v5->_medication = (HKConcept *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v31 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v31;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("ReasonForUse"));
    v34 = objc_claimAutoreleasedReturnValue();
    reasonForUse = v5->_reasonForUse;
    v5->_reasonForUse = (NSArray *)v34;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("ReasonsNotTaken"));
    v37 = objc_claimAutoreleasedReturnValue();
    reasonsNotTaken = v5->_reasonsNotTaken;
    v5->_reasonsNotTaken = (NSArray *)v37;

  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  objc_super v96;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v96.receiver = self;
    v96.super_class = (Class)HKMedicationRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v96, sel_isEquivalent_, v5))
      goto LABEL_76;
    -[HKMedicationRecord medicationCodingCollection](self, "medicationCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medicationCodingCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "medicationCodingCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_75;
      v10 = (void *)v9;
      -[HKMedicationRecord medicationCodingCollection](self, "medicationCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medicationCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_76;
    }
    v15 = -[HKMedicationRecord assertionType](self, "assertionType");
    if (v15 != objc_msgSend(v5, "assertionType"))
      goto LABEL_76;
    -[HKMedicationRecord asserter](self, "asserter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asserter");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v16)
    {

    }
    else
    {
      v8 = (void *)v16;
      objc_msgSend(v5, "asserter");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_75;
      v18 = (void *)v17;
      -[HKMedicationRecord asserter](self, "asserter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asserter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (!v21)
        goto LABEL_76;
    }
    -[HKMedicationRecord assertionDate](self, "assertionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionDate");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v22)
    {

    }
    else
    {
      v8 = (void *)v22;
      objc_msgSend(v5, "assertionDate");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_75;
      v24 = (void *)v23;
      -[HKMedicationRecord assertionDate](self, "assertionDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assertionDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_76;
    }
    -[HKMedicationRecord statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v28)
    {

    }
    else
    {
      v8 = (void *)v28;
      objc_msgSend(v5, "statusCoding");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_75;
      v30 = (void *)v29;
      -[HKMedicationRecord statusCoding](self, "statusCoding");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_76;
    }
    -[HKMedicationRecord dosages](self, "dosages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dosages");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v34)
    {

    }
    else
    {
      v8 = (void *)v34;
      objc_msgSend(v5, "dosages");
      v35 = objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_75;
      v36 = (void *)v35;
      -[HKMedicationRecord dosages](self, "dosages");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dosages");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqualToArray:", v38);

      if (!v39)
        goto LABEL_76;
    }
    -[HKMedicationRecord earliestDosageDate](self, "earliestDosageDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earliestDosageDate");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v40)
    {

    }
    else
    {
      v8 = (void *)v40;
      objc_msgSend(v5, "earliestDosageDate");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
        goto LABEL_75;
      v42 = (void *)v41;
      -[HKMedicationRecord earliestDosageDate](self, "earliestDosageDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "earliestDosageDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_76;
    }
    -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonForUseCodingCollections");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v46)
    {

    }
    else
    {
      v8 = (void *)v46;
      objc_msgSend(v5, "reasonForUseCodingCollections");
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
        goto LABEL_75;
      v48 = (void *)v47;
      -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonForUseCodingCollections");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqualToArray:", v50);

      if (!v51)
        goto LABEL_76;
    }
    v52 = -[HKMedicationRecord notTaken](self, "notTaken");
    if (v52 != objc_msgSend(v5, "notTaken"))
      goto LABEL_76;
    -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsNotTakenCodingCollections");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v53)
    {

    }
    else
    {
      v8 = (void *)v53;
      objc_msgSend(v5, "reasonsNotTakenCodingCollections");
      v54 = objc_claimAutoreleasedReturnValue();
      if (!v54)
        goto LABEL_75;
      v55 = (void *)v54;
      -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsNotTakenCodingCollections");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v56, "isEqualToArray:", v57);

      if (!v58)
        goto LABEL_76;
    }
    -[HKMedicationRecord effectiveStartDate](self, "effectiveStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveStartDate");
    v59 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v59)
    {

    }
    else
    {
      v8 = (void *)v59;
      objc_msgSend(v5, "effectiveStartDate");
      v60 = objc_claimAutoreleasedReturnValue();
      if (!v60)
        goto LABEL_75;
      v61 = (void *)v60;
      -[HKMedicationRecord effectiveStartDate](self, "effectiveStartDate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveStartDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "isEqual:", v63);

      if (!v64)
        goto LABEL_76;
    }
    -[HKMedicationRecord effectiveEndDate](self, "effectiveEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveEndDate");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v65)
    {

    }
    else
    {
      v8 = (void *)v65;
      objc_msgSend(v5, "effectiveEndDate");
      v66 = objc_claimAutoreleasedReturnValue();
      if (!v66)
        goto LABEL_75;
      v67 = (void *)v66;
      -[HKMedicationRecord effectiveEndDate](self, "effectiveEndDate");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveEndDate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "isEqual:", v69);

      if (!v70)
        goto LABEL_76;
    }
    -[HKMedicationRecord medication](self, "medication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medication");
    v71 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v71)
    {

    }
    else
    {
      v8 = (void *)v71;
      objc_msgSend(v5, "medication");
      v72 = objc_claimAutoreleasedReturnValue();
      if (!v72)
        goto LABEL_75;
      v73 = (void *)v72;
      -[HKMedicationRecord medication](self, "medication");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medication");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_76;
    }
    -[HKMedicationRecord status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v77 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v77)
    {

    }
    else
    {
      v8 = (void *)v77;
      objc_msgSend(v5, "status");
      v78 = objc_claimAutoreleasedReturnValue();
      if (!v78)
        goto LABEL_75;
      v79 = (void *)v78;
      -[HKMedicationRecord status](self, "status");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "isEqual:", v81);

      if (!v82)
        goto LABEL_76;
    }
    -[HKMedicationRecord reasonForUse](self, "reasonForUse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonForUse");
    v83 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v83)
    {

    }
    else
    {
      v8 = (void *)v83;
      objc_msgSend(v5, "reasonForUse");
      v84 = objc_claimAutoreleasedReturnValue();
      if (!v84)
        goto LABEL_75;
      v85 = (void *)v84;
      -[HKMedicationRecord reasonForUse](self, "reasonForUse");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonForUse");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v86, "isEqualToArray:", v87);

      if (!v88)
        goto LABEL_76;
    }
    -[HKMedicationRecord reasonsNotTaken](self, "reasonsNotTaken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsNotTaken");
    v89 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v89)
    {

LABEL_80:
      v14 = 1;
      goto LABEL_77;
    }
    v8 = (void *)v89;
    objc_msgSend(v5, "reasonsNotTaken");
    v90 = objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      v91 = (void *)v90;
      -[HKMedicationRecord reasonsNotTaken](self, "reasonsNotTaken");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsNotTaken");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v92, "isEqualToArray:", v93);

      if ((v94 & 1) != 0)
        goto LABEL_80;
LABEL_76:
      v14 = 0;
LABEL_77:

      goto LABEL_78;
    }
LABEL_75:

    goto LABEL_76;
  }
  v14 = 0;
LABEL_78:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKMedicationRecord statusCoding](self, "statusCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKMedicalCodingCollection)medicationCodingCollection
{
  return self->_medicationCodingCollection;
}

- (void)_setMedicationCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *medicationCodingCollection;
  HKConcept *v6;
  HKConcept *medication;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  medicationCodingCollection = self->_medicationCodingCollection;
  self->_medicationCodingCollection = v4;

  -[HKMedicationRecord medicationCodingCollection](self, "medicationCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  medication = self->_medication;
  self->_medication = v6;

}

- (int64_t)assertionType
{
  return self->_assertionType;
}

- (void)_setAssertionType:(int64_t)a3
{
  self->_assertionType = a3;
}

- (NSString)asserter
{
  return self->_asserter;
}

- (void)_setAsserter:(id)a3
{
  NSString *v4;
  NSString *asserter;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  asserter = self->_asserter;
  self->_asserter = v4;

}

- (HKMedicalDate)assertionDate
{
  return self->_assertionDate;
}

- (void)_setAssertionDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *assertionDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  assertionDate = self->_assertionDate;
  self->_assertionDate = v4;

}

- (HKMedicalCoding)statusCoding
{
  return self->_statusCoding;
}

- (void)_setStatusCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *statusCoding;
  HKConcept *v6;
  HKConcept *status;
  id v8;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  -[HKMedicationRecord statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

}

- (NSArray)dosages
{
  return self->_dosages;
}

- (void)_setDosages:(id)a3
{
  NSArray *v4;
  NSArray *dosages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dosages = self->_dosages;
  self->_dosages = v4;

}

- (HKMedicalDate)earliestDosageDate
{
  return self->_earliestDosageDate;
}

- (void)_setEarliestDosageDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *earliestDosageDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  earliestDosageDate = self->_earliestDosageDate;
  self->_earliestDosageDate = v4;

}

- (NSArray)reasonForUseCodingCollections
{
  return self->_reasonForUseCodingCollections;
}

- (void)_setReasonForUseCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *reasonForUseCodingCollections;
  NSArray *v6;
  NSArray *reasonForUse;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonForUseCodingCollections = self->_reasonForUseCodingCollections;
  self->_reasonForUseCodingCollections = v4;

  if (self->_reasonForUseCodingCollections)
  {
    -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_91);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reasonForUse = self->_reasonForUse;
    self->_reasonForUse = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reasonForUse;
    self->_reasonForUse = 0;
  }

}

id __56__HKMedicationRecord__setReasonForUseCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (BOOL)notTaken
{
  return self->_notTaken;
}

- (void)_setNotTaken:(BOOL)a3
{
  self->_notTaken = a3;
}

- (NSArray)reasonsNotTakenCodingCollections
{
  return self->_reasonsNotTakenCodingCollections;
}

- (void)_setReasonsNotTakenCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *reasonsNotTakenCodingCollections;
  NSArray *v6;
  NSArray *reasonsNotTaken;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsNotTakenCodingCollections = self->_reasonsNotTakenCodingCollections;
  self->_reasonsNotTakenCodingCollections = v4;

  if (self->_reasonsNotTakenCodingCollections)
  {
    -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_90_0);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reasonsNotTaken = self->_reasonsNotTaken;
    self->_reasonsNotTaken = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reasonsNotTaken;
    self->_reasonsNotTaken = 0;
  }

}

id __59__HKMedicationRecord__setReasonsNotTakenCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKMedicalDate)effectiveStartDate
{
  return self->_effectiveStartDate;
}

- (void)_setEffectiveStartDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *effectiveStartDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  effectiveStartDate = self->_effectiveStartDate;
  self->_effectiveStartDate = v4;

}

- (HKMedicalDate)effectiveEndDate
{
  return self->_effectiveEndDate;
}

- (void)_setEffectiveEndDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *effectiveEndDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  effectiveEndDate = self->_effectiveEndDate;
  self->_effectiveEndDate = v4;

}

- (HKConcept)medication
{
  HKConcept *medication;
  HKConcept *v3;
  void *v4;

  medication = self->_medication;
  if (medication)
  {
    v3 = medication;
  }
  else
  {
    -[HKMedicationRecord medicationCodingCollection](self, "medicationCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setMedication:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKConcept *v13;
  HKConcept *medication;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKMedicationRecord _setMedication:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  medication = self->_medication;
  self->_medication = v13;

}

- (HKConcept)status
{
  HKConcept *status;
  HKConcept *v3;
  void *v4;

  status = self->_status;
  if (status)
  {
    v3 = status;
  }
  else
  {
    -[HKMedicationRecord statusCodingCollection](self, "statusCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKConcept *v13;
  HKConcept *status;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKMedicationRecord _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

}

- (NSArray)reasonForUse
{
  NSArray *reasonForUse;
  NSArray *v3;
  void *v4;

  if (self->_reasonForUseCodingCollections)
  {
    reasonForUse = self->_reasonForUse;
    if (reasonForUse)
    {
      v3 = reasonForUse;
    }
    else
    {
      -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_91_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __34__HKMedicationRecord_reasonForUse__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReasonForUse:(id)a3
{
  NSArray *v4;
  NSArray *reasonForUse;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonForUse = self->_reasonForUse;
  self->_reasonForUse = v4;

}

- (NSArray)reasonsNotTaken
{
  NSArray *reasonsNotTaken;
  NSArray *v3;
  void *v4;

  if (self->_reasonsNotTakenCodingCollections)
  {
    reasonsNotTaken = self->_reasonsNotTaken;
    if (reasonsNotTaken)
    {
      v3 = reasonsNotTaken;
    }
    else
    {
      -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_92_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __37__HKMedicationRecord_reasonsNotTaken__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReasonsNotTaken:(id)a3
{
  NSArray *v4;
  NSArray *reasonsNotTaken;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsNotTaken = self->_reasonsNotTaken;
  self->_reasonsNotTaken = v4;

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKMedicationRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_9:
    v8 = v7;
    goto LABEL_10;
  }
  if (!self->_medicationCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: medicationCodingCollection must not be nil");
LABEL_8:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!self->_statusCoding)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: statusCoding must not be nil");
    goto LABEL_8;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonsNotTaken, 0);
  objc_storeStrong((id *)&self->_reasonForUse, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_effectiveEndDate, 0);
  objc_storeStrong((id *)&self->_effectiveStartDate, 0);
  objc_storeStrong((id *)&self->_reasonsNotTakenCodingCollections, 0);
  objc_storeStrong((id *)&self->_reasonForUseCodingCollections, 0);
  objc_storeStrong((id *)&self->_earliestDosageDate, 0);
  objc_storeStrong((id *)&self->_dosages, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_assertionDate, 0);
  objc_storeStrong((id *)&self->_asserter, 0);
  objc_storeStrong((id *)&self->_medicationCodingCollection, 0);
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKMedicationRecord;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("medication"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("reasonForUse"));
  objc_msgSend(v3, "addObject:", CFSTR("reasonsNotTaken"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKMedicationRecord;
  objc_msgSendSuper2(&v3, sel_cachedConceptRelationshipKeyPaths);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("medication")))
    {
      -[HKMedicationRecord medicationCodingCollection](self, "medicationCodingCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
    {
      -[HKMedicationRecord statusCoding](self, "statusCoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("reasonForUse")))
    {
      -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v9 = (void *)v15;
        +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v15, v6, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("reasonsNotTaken")))
      {
        v17.receiver = self;
        v17.super_class = (Class)HKMedicationRecord;
        -[HKMedicalRecord codingsForKeyPath:error:](&v17, sel_codingsForKeyPath_error_, v6, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("medication")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
    {
      if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationRecord _setStatus:](self, "_setStatus:", v13);
        goto LABEL_8;
      }
LABEL_9:
      v14 = 0;
      goto LABEL_10;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("reasonForUse")))
    {
      -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKMedicationRecord reasonForUseCodingCollections](self, "reasonForUseCodingCollections");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v17, "count"), v9, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v18 != 0;
        if (v18)
          -[HKMedicationRecord _setReasonForUse:](self, "_setReasonForUse:", v18);
LABEL_19:

        goto LABEL_10;
      }
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("reasonsNotTaken")))
      {
        v22.receiver = self;
        v22.super_class = (Class)HKMedicationRecord;
        v21 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v22, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
        goto LABEL_22;
      }
      -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HKMedicationRecord reasonsNotTakenCodingCollections](self, "reasonsNotTakenCodingCollections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v20, "count"), v9, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v18 != 0;
        if (v18)
          -[HKMedicationRecord _setReasonsNotTaken:](self, "_setReasonsNotTaken:", v18);
        goto LABEL_19;
      }
    }
    v21 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
LABEL_22:
    v14 = v21;
    goto LABEL_10;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    goto LABEL_9;
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationRecord _setMedication:](self, "_setMedication:", v13);
LABEL_8:

  v14 = 1;
LABEL_10:

  return v14;
}

+ (id)medicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodingCollection:(id)a14 assertionType:(int64_t)a15 asserter:(id)a16 assertionDate:(id)a17 statusCoding:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 reasonForUseCodingCollections:(id)a21 notTaken:(BOOL)a22 reasonsNotTakenCodingCollections:(id)a23 effectiveStartDate:(id)a24 effectiveEndDate:(id)a25
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __CFString *v35;
  id v36;
  void *v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  uint64_t v41;
  __CFString *v42;
  uint64_t v43;
  __CFString *v44;
  uint64_t v45;
  void *v46;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  _BOOL4 v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;

  v52 = a5;
  v62 = a3;
  v61 = a4;
  v29 = a6;
  v55 = a7;
  v54 = a8;
  v60 = a10;
  v59 = a11;
  v58 = a12;
  v57 = a14;
  v56 = a16;
  v30 = a17;
  v51 = a18;
  v50 = a19;
  v31 = a20;
  v49 = a21;
  v32 = a23;
  v33 = a24;
  v34 = a25;
  v35 = CFSTR("modifiedDate");
  v36 = v29;
  v37 = v36;
  if (v30)
  {
    v38 = CFSTR("assertionDate");

    objc_msgSend(v30, "dateForUTC");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v38;
    if (!v34)
      goto LABEL_4;
    goto LABEL_3;
  }
  v39 = v36;
  if (v34)
  {
LABEL_3:
    v40 = CFSTR("effectiveEndDate");

    objc_msgSend(v34, "dateForUTC");
    v41 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v41;
    v35 = v40;
  }
LABEL_4:
  if (v33)
  {
    v42 = CFSTR("effectiveStartDate");

    objc_msgSend(v33, "dateForUTC");
    v43 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v43;
    v35 = v42;
  }
  if (v31)
  {
    v44 = CFSTR("earliestDosageDate");

    objc_msgSend(v31, "dateForUTC");
    v45 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v45;
    v35 = v44;
  }
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v35, v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v48) = a22;
  +[HKMedicationRecord medicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:](HKMedicationRecord, "medicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:", v62, v61, v52, v37, v55, v54, a9, v60, v59, v46, v58, a13, v57, a15, v56,
    v30,
    v51,
    v50,
    v31,
    v49,
    v48,
    v32,
    v33,
    v34);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (void)_setMedication:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property medication for record type HKMedicationRecord.", a5, a6, a7, a8, 0);
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKMedicationRecord.", a5, a6, a7, a8, 0);
}

@end
