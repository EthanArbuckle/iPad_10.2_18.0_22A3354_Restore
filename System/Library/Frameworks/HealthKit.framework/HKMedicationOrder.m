@implementation HKMedicationOrder

+ (id)medicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 prescriber:(id)a16 numberOfFills:(int64_t)a17 dosages:(id)a18 earliestDosageDate:(id)a19 writtenDate:(id)a20 endedDate:(id)a21 statusCoding:(id)a22 reasonCodingCollections:(id)a23 reasonEndedCodingCollection:(id)a24 statusReasonCodingCollection:(id)a25
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newMedicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                                           a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           a23,
                                           a24,
                                           a25,
                                           0));
}

+ (id)_newMedicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 prescriber:(id)a16 numberOfFills:(int64_t)a17 dosages:(id)a18 earliestDosageDate:(id)a19 writtenDate:(id)a20 endedDate:(id)a21 statusCoding:(id)a22 reasonCodingCollections:(id)a23 reasonEndedCodingCollection:(id)a24 statusReasonCodingCollection:(id)a25 config:(id)a26
{
  id v26;
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
  void *v46;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _BOOL4 v63;
  id v64;
  id v65;
  id v66;
  objc_super v67;
  _QWORD aBlock[4];
  id v69;
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
  int64_t v80;

  v63 = a5;
  v26 = a15;
  v27 = a16;
  v28 = a18;
  v29 = a19;
  v30 = a20;
  v31 = a21;
  v32 = a22;
  v33 = a23;
  v34 = a24;
  v35 = a25;
  v36 = a26;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __365__HKMedicationOrder__newMedicationOrderWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_prescriber_numberOfFills_dosages_earliestDosageDate_writtenDate_endedDate_statusCoding_reasonCodingCollections_reasonEndedCodingCollection_statusReasonCodingCollection_config___block_invoke;
  aBlock[3] = &unk_1E37E6FB0;
  v69 = v26;
  v70 = v27;
  v71 = v28;
  v72 = v29;
  v73 = v30;
  v74 = v31;
  v75 = v32;
  v76 = v33;
  v77 = v34;
  v78 = v35;
  v79 = v36;
  v80 = a17;
  v66 = v36;
  v65 = v35;
  v62 = v34;
  v61 = v33;
  v60 = v32;
  v59 = v31;
  v58 = v30;
  v57 = v29;
  v56 = v28;
  v55 = v27;
  v54 = v26;
  v37 = a13;
  v38 = a12;
  v39 = a11;
  v40 = a10;
  v41 = a8;
  v42 = a7;
  v43 = a6;
  v44 = a4;
  v45 = a3;
  v46 = _Block_copy(aBlock);
  v67.receiver = a1;
  v67.super_class = (Class)&OBJC_METACLASS___HKMedicationOrder;
  v64 = objc_msgSendSuper2(&v67, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v45, v44, v63, v43, v42, v41, a9, v40, v39, v38, v37, a14, v46);

  return v64;
}

void __365__HKMedicationOrder__newMedicationOrderWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_prescriber_numberOfFills_dosages_earliestDosageDate_writtenDate_endedDate_statusCoding_reasonCodingCollections_reasonEndedCodingCollection_statusReasonCodingCollection_config___block_invoke(uint64_t a1, void *a2)
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

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v24[23];
  v24[23] = v5;

  v24[24] = *(_QWORD *)(a1 + 120);
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

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v24[30];
  v24[30] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v24[31];
  v24[31] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v24[32];
  v24[32] = v21;

  v23 = *(_QWORD *)(a1 + 112);
  if (v23)
    (*(void (**)(uint64_t, _QWORD *))(v23 + 16))(v23, v24);

}

- (HKMedicationOrder)init
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
  v9.super_class = (Class)HKMedicationOrder;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@medicationCodingCollection = %@prescriber = %@numberOfFills = %lddosages = %@earliestDosageDate = %@writtenDate = %@endedDate = %@statusCoding = %@reasonCodingCollections = %@reasonEndedCodingCollection = %@statusReasonCodingCollection = %@>"), v5, self, v6, self->_medicationCodingCollection, self->_prescriber, self->_numberOfFills, self->_dosages, self->_earliestDosageDate, self->_writtenDate, self->_endedDate, self->_statusCoding, self->_reasonCodingCollections, self->_reasonEndedCodingCollection, self->_statusReasonCodingCollection);
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
  v5.super_class = (Class)HKMedicationOrder;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationCodingCollection, CFSTR("MedicationCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_prescriber, CFSTR("Prescriber"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numberOfFills, CFSTR("NumberOfFills"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dosages, CFSTR("Dosages"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_earliestDosageDate, CFSTR("EarliestDosageDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_writtenDate, CFSTR("WrittenDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endedDate, CFSTR("EndedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonCodingCollections, CFSTR("ReasonCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonEndedCodingCollection, CFSTR("ReasonEndedCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusReasonCodingCollection, CFSTR("StatusReasonCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_medication, CFSTR("Medication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reason, CFSTR("Reason"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonEnded, CFSTR("ReasonEnded"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusReason, CFSTR("StatusReason"));

}

- (HKMedicationOrder)initWithCoder:(id)a3
{
  id v4;
  HKMedicationOrder *v5;
  uint64_t v6;
  HKMedicalCodingCollection *medicationCodingCollection;
  uint64_t v8;
  NSString *prescriber;
  void *v10;
  uint64_t v11;
  NSArray *dosages;
  uint64_t v13;
  HKMedicalDate *earliestDosageDate;
  uint64_t v15;
  HKMedicalDate *writtenDate;
  uint64_t v17;
  HKMedicalDate *endedDate;
  uint64_t v19;
  HKMedicalCoding *statusCoding;
  void *v21;
  uint64_t v22;
  NSArray *reasonCodingCollections;
  uint64_t v24;
  HKMedicalCodingCollection *reasonEndedCodingCollection;
  uint64_t v26;
  HKMedicalCodingCollection *statusReasonCodingCollection;
  uint64_t v28;
  HKConcept *medication;
  uint64_t v30;
  HKConcept *status;
  void *v32;
  uint64_t v33;
  NSArray *reason;
  uint64_t v35;
  HKConcept *reasonEnded;
  uint64_t v37;
  HKConcept *statusReason;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)HKMedicationOrder;
  v5 = -[HKMedicalRecord initWithCoder:](&v40, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    medicationCodingCollection = v5->_medicationCodingCollection;
    v5->_medicationCodingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Prescriber"));
    v8 = objc_claimAutoreleasedReturnValue();
    prescriber = v5->_prescriber;
    v5->_prescriber = (NSString *)v8;

    v5->_numberOfFills = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfFills"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Dosages"));
    v11 = objc_claimAutoreleasedReturnValue();
    dosages = v5->_dosages;
    v5->_dosages = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EarliestDosageDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    earliestDosageDate = v5->_earliestDosageDate;
    v5->_earliestDosageDate = (HKMedicalDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WrittenDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    writtenDate = v5->_writtenDate;
    v5->_writtenDate = (HKMedicalDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndedDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    endedDate = v5->_endedDate;
    v5->_endedDate = (HKMedicalDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v19 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v19;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("ReasonCodingCollections"));
    v22 = objc_claimAutoreleasedReturnValue();
    reasonCodingCollections = v5->_reasonCodingCollections;
    v5->_reasonCodingCollections = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReasonEndedCodingCollection"));
    v24 = objc_claimAutoreleasedReturnValue();
    reasonEndedCodingCollection = v5->_reasonEndedCodingCollection;
    v5->_reasonEndedCodingCollection = (HKMedicalCodingCollection *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusReasonCodingCollection"));
    v26 = objc_claimAutoreleasedReturnValue();
    statusReasonCodingCollection = v5->_statusReasonCodingCollection;
    v5->_statusReasonCodingCollection = (HKMedicalCodingCollection *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Medication"));
    v28 = objc_claimAutoreleasedReturnValue();
    medication = v5->_medication;
    v5->_medication = (HKConcept *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v30 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v30;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("Reason"));
    v33 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSArray *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReasonEnded"));
    v35 = objc_claimAutoreleasedReturnValue();
    reasonEnded = v5->_reasonEnded;
    v5->_reasonEnded = (HKConcept *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusReason"));
    v37 = objc_claimAutoreleasedReturnValue();
    statusReason = v5->_statusReason;
    v5->_statusReason = (HKConcept *)v37;

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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int64_t v21;
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
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  objc_super v101;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v101.receiver = self;
    v101.super_class = (Class)HKMedicationOrder;
    if (!-[HKMedicalRecord isEquivalent:](&v101, sel_isEquivalent_, v5))
      goto LABEL_80;
    -[HKMedicationOrder medicationCodingCollection](self, "medicationCodingCollection");
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
        goto LABEL_79;
      v10 = (void *)v9;
      -[HKMedicationOrder medicationCodingCollection](self, "medicationCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medicationCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_80;
    }
    -[HKMedicationOrder prescriber](self, "prescriber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prescriber");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "prescriber");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_79;
      v17 = (void *)v16;
      -[HKMedicationOrder prescriber](self, "prescriber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prescriber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if (!v20)
        goto LABEL_80;
    }
    v21 = -[HKMedicationOrder numberOfFills](self, "numberOfFills");
    if (v21 != objc_msgSend(v5, "numberOfFills"))
      goto LABEL_80;
    -[HKMedicationOrder dosages](self, "dosages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dosages");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v22)
    {

    }
    else
    {
      v8 = (void *)v22;
      objc_msgSend(v5, "dosages");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_79;
      v24 = (void *)v23;
      -[HKMedicationOrder dosages](self, "dosages");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dosages");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqualToArray:", v26);

      if (!v27)
        goto LABEL_80;
    }
    -[HKMedicationOrder earliestDosageDate](self, "earliestDosageDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earliestDosageDate");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v28)
    {

    }
    else
    {
      v8 = (void *)v28;
      objc_msgSend(v5, "earliestDosageDate");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_79;
      v30 = (void *)v29;
      -[HKMedicationOrder earliestDosageDate](self, "earliestDosageDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "earliestDosageDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_80;
    }
    -[HKMedicationOrder writtenDate](self, "writtenDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writtenDate");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v34)
    {

    }
    else
    {
      v8 = (void *)v34;
      objc_msgSend(v5, "writtenDate");
      v35 = objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_79;
      v36 = (void *)v35;
      -[HKMedicationOrder writtenDate](self, "writtenDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "writtenDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_80;
    }
    -[HKMedicationOrder endedDate](self, "endedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endedDate");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v40)
    {

    }
    else
    {
      v8 = (void *)v40;
      objc_msgSend(v5, "endedDate");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
        goto LABEL_79;
      v42 = (void *)v41;
      -[HKMedicationOrder endedDate](self, "endedDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endedDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_80;
    }
    -[HKMedicationOrder statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v46)
    {

    }
    else
    {
      v8 = (void *)v46;
      objc_msgSend(v5, "statusCoding");
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
        goto LABEL_79;
      v48 = (void *)v47;
      -[HKMedicationOrder statusCoding](self, "statusCoding");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
        goto LABEL_80;
    }
    -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonCodingCollections");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v52)
    {

    }
    else
    {
      v8 = (void *)v52;
      objc_msgSend(v5, "reasonCodingCollections");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!v53)
        goto LABEL_79;
      v54 = (void *)v53;
      -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonCodingCollections");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "isEqualToArray:", v56);

      if (!v57)
        goto LABEL_80;
    }
    -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonEndedCodingCollection");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v58)
    {

    }
    else
    {
      v8 = (void *)v58;
      objc_msgSend(v5, "reasonEndedCodingCollection");
      v59 = objc_claimAutoreleasedReturnValue();
      if (!v59)
        goto LABEL_79;
      v60 = (void *)v59;
      -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonEndedCodingCollection");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if (!v63)
        goto LABEL_80;
    }
    -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusReasonCodingCollection");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v64)
    {

    }
    else
    {
      v8 = (void *)v64;
      objc_msgSend(v5, "statusReasonCodingCollection");
      v65 = objc_claimAutoreleasedReturnValue();
      if (!v65)
        goto LABEL_79;
      v66 = (void *)v65;
      -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusReasonCodingCollection");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if (!v69)
        goto LABEL_80;
    }
    -[HKMedicationOrder medication](self, "medication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medication");
    v70 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v70)
    {

    }
    else
    {
      v8 = (void *)v70;
      objc_msgSend(v5, "medication");
      v71 = objc_claimAutoreleasedReturnValue();
      if (!v71)
        goto LABEL_79;
      v72 = (void *)v71;
      -[HKMedicationOrder medication](self, "medication");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medication");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "isEqual:", v74);

      if (!v75)
        goto LABEL_80;
    }
    -[HKMedicationOrder status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v76 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v76)
    {

    }
    else
    {
      v8 = (void *)v76;
      objc_msgSend(v5, "status");
      v77 = objc_claimAutoreleasedReturnValue();
      if (!v77)
        goto LABEL_79;
      v78 = (void *)v77;
      -[HKMedicationOrder status](self, "status");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v79, "isEqual:", v80);

      if (!v81)
        goto LABEL_80;
    }
    -[HKMedicationOrder reason](self, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reason");
    v82 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v82)
    {

    }
    else
    {
      v8 = (void *)v82;
      objc_msgSend(v5, "reason");
      v83 = objc_claimAutoreleasedReturnValue();
      if (!v83)
        goto LABEL_79;
      v84 = (void *)v83;
      -[HKMedicationOrder reason](self, "reason");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reason");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v85, "isEqualToArray:", v86);

      if (!v87)
        goto LABEL_80;
    }
    -[HKMedicationOrder reasonEnded](self, "reasonEnded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonEnded");
    v88 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v88)
    {

    }
    else
    {
      v8 = (void *)v88;
      objc_msgSend(v5, "reasonEnded");
      v89 = objc_claimAutoreleasedReturnValue();
      if (!v89)
        goto LABEL_79;
      v90 = (void *)v89;
      -[HKMedicationOrder reasonEnded](self, "reasonEnded");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonEnded");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v91, "isEqual:", v92);

      if (!v93)
        goto LABEL_80;
    }
    -[HKMedicationOrder statusReason](self, "statusReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusReason");
    v94 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v94)
    {

LABEL_84:
      v14 = 1;
      goto LABEL_81;
    }
    v8 = (void *)v94;
    objc_msgSend(v5, "statusReason");
    v95 = objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      v96 = (void *)v95;
      -[HKMedicationOrder statusReason](self, "statusReason");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusReason");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v97, "isEqual:", v98);

      if ((v99 & 1) != 0)
        goto LABEL_84;
LABEL_80:
      v14 = 0;
LABEL_81:

      goto LABEL_82;
    }
LABEL_79:

    goto LABEL_80;
  }
  v14 = 0;
LABEL_82:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKMedicationOrder statusCoding](self, "statusCoding");
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

  -[HKMedicationOrder medicationCodingCollection](self, "medicationCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  medication = self->_medication;
  self->_medication = v6;

}

- (NSString)prescriber
{
  return self->_prescriber;
}

- (void)_setPrescriber:(id)a3
{
  NSString *v4;
  NSString *prescriber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  prescriber = self->_prescriber;
  self->_prescriber = v4;

}

- (int64_t)numberOfFills
{
  return self->_numberOfFills;
}

- (void)_setNumberOfFills:(int64_t)a3
{
  self->_numberOfFills = a3;
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

- (HKMedicalDate)writtenDate
{
  return self->_writtenDate;
}

- (void)_setWrittenDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *writtenDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  writtenDate = self->_writtenDate;
  self->_writtenDate = v4;

}

- (HKMedicalDate)endedDate
{
  return self->_endedDate;
}

- (void)_setEndedDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *endedDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  endedDate = self->_endedDate;
  self->_endedDate = v4;

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

  -[HKMedicationOrder statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

}

- (NSArray)reasonCodingCollections
{
  return self->_reasonCodingCollections;
}

- (void)_setReasonCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *reasonCodingCollections;
  NSArray *v6;
  NSArray *reason;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonCodingCollections = self->_reasonCodingCollections;
  self->_reasonCodingCollections = v4;

  if (self->_reasonCodingCollections)
  {
    -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reason = self->_reason;
    self->_reason = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reason;
    self->_reason = 0;
  }

}

id __49__HKMedicationOrder__setReasonCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKMedicalCodingCollection)reasonEndedCodingCollection
{
  return self->_reasonEndedCodingCollection;
}

- (void)_setReasonEndedCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *reasonEndedCodingCollection;
  HKConcept *v6;
  HKConcept *reasonEnded;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  reasonEndedCodingCollection = self->_reasonEndedCodingCollection;
  self->_reasonEndedCodingCollection = v4;

  if (self->_reasonEndedCodingCollection)
  {
    -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    reasonEnded = self->_reasonEnded;
    self->_reasonEnded = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_reasonEnded;
    self->_reasonEnded = 0;
  }

}

- (HKMedicalCodingCollection)statusReasonCodingCollection
{
  return self->_statusReasonCodingCollection;
}

- (void)_setStatusReasonCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *statusReasonCodingCollection;
  HKConcept *v6;
  HKConcept *statusReason;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  statusReasonCodingCollection = self->_statusReasonCodingCollection;
  self->_statusReasonCodingCollection = v4;

  if (self->_statusReasonCodingCollection)
  {
    -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    statusReason = self->_statusReason;
    self->_statusReason = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_statusReason;
    self->_statusReason = 0;
  }

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
    -[HKMedicationOrder medicationCodingCollection](self, "medicationCodingCollection");
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
      -[HKMedicationOrder _setMedication:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
    -[HKMedicationOrder statusCodingCollection](self, "statusCodingCollection");
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
      -[HKMedicationOrder _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

}

- (NSArray)reason
{
  NSArray *reason;
  NSArray *v3;
  void *v4;

  if (self->_reasonCodingCollections)
  {
    reason = self->_reason;
    if (reason)
    {
      v3 = reason;
    }
    else
    {
      -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_90);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __27__HKMedicationOrder_reason__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReason:(id)a3
{
  NSArray *v4;
  NSArray *reason;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reason = self->_reason;
  self->_reason = v4;

}

- (HKConcept)reasonEnded
{
  HKConcept *reasonEnded;
  HKConcept *v3;
  void *v4;

  if (self->_reasonEndedCodingCollection)
  {
    reasonEnded = self->_reasonEnded;
    if (reasonEnded)
    {
      v3 = reasonEnded;
    }
    else
    {
      -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
      v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setReasonEnded:(id)a3
{
  HKConcept *v4;
  HKConcept *reasonEnded;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  reasonEnded = self->_reasonEnded;
  self->_reasonEnded = v4;

}

- (HKConcept)statusReason
{
  HKConcept *statusReason;
  HKConcept *v3;
  void *v4;

  if (self->_statusReasonCodingCollection)
  {
    statusReason = self->_statusReason;
    if (statusReason)
    {
      v3 = statusReason;
    }
    else
    {
      -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
      v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setStatusReason:(id)a3
{
  HKConcept *v4;
  HKConcept *statusReason;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  statusReason = self->_statusReason;
  self->_statusReason = v4;

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
  v13.super_class = (Class)HKMedicationOrder;
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
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_reasonEnded, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_statusReasonCodingCollection, 0);
  objc_storeStrong((id *)&self->_reasonEndedCodingCollection, 0);
  objc_storeStrong((id *)&self->_reasonCodingCollections, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_endedDate, 0);
  objc_storeStrong((id *)&self->_writtenDate, 0);
  objc_storeStrong((id *)&self->_earliestDosageDate, 0);
  objc_storeStrong((id *)&self->_dosages, 0);
  objc_storeStrong((id *)&self->_prescriber, 0);
  objc_storeStrong((id *)&self->_medicationCodingCollection, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKMedicationOrder medicationCodingCollection](self, "medicationCodingCollection");
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

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKMedicationOrder;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("medication"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("reason"));
  objc_msgSend(v3, "addObject:", CFSTR("reasonEnded"));
  objc_msgSend(v3, "addObject:", CFSTR("statusReason"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKMedicationOrder;
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
  void **v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  objc_super v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("medication")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
    {
      -[HKMedicationOrder statusCoding](self, "statusCoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("reason")))
    {
      -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v14, v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("reasonEnded")))
    {
      -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v23;
        goto LABEL_4;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("statusReason")))
      {
        v21.receiver = self;
        v21.super_class = (Class)HKMedicationOrder;
        -[HKMedicalRecord codingsForKeyPath:error:](&v21, sel_codingsForKeyPath_error_, v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v22;
        goto LABEL_4;
      }
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  -[HKMedicationOrder medicationCodingCollection](self, "medicationCodingCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = (void **)v25;
LABEL_4:
  objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
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
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("medication")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationOrder _setMedication:](self, "_setMedication:", v12);
LABEL_8:

      LOBYTE(a5) = 1;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationOrder _setStatus:](self, "_setStatus:", v12);
      goto LABEL_8;
    }
LABEL_9:
    LOBYTE(a5) = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("reason")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("reasonEnded")))
    {
      v17 = objc_msgSend(v8, "count");
      -[HKMedicationOrder reasonEndedCodingCollection](self, "reasonEndedCodingCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v17, v18 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!(_DWORD)a5)
        goto LABEL_10;
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationOrder _setReasonEnded:](self, "_setReasonEnded:", v12);
      goto LABEL_8;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("statusReason")))
    {
      v19 = objc_msgSend(v8, "count");
      -[HKMedicationOrder statusReasonCodingCollection](self, "statusReasonCodingCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v19, v20 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!(_DWORD)a5)
        goto LABEL_10;
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationOrder _setStatusReason:](self, "_setStatusReason:", v12);
      goto LABEL_8;
    }
    v22.receiver = self;
    v22.super_class = (Class)HKMedicationOrder;
    v21 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v22, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
LABEL_24:
    LOBYTE(a5) = v21;
    goto LABEL_10;
  }
  -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v21 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
    goto LABEL_24;
  }
  -[HKMedicationOrder reasonCodingCollections](self, "reasonCodingCollections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v15, "count"), v9, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = v16 != 0;
  if (v16)
    -[HKMedicationOrder _setReason:](self, "_setReason:", v16);

LABEL_10:
  return (char)a5;
}

+ (id)medicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodingCollection:(id)a14 prescriber:(id)a15 numberOfFills:(int64_t)a16 dosages:(id)a17 earliestDosageDate:(id)a18 writtenDate:(id)a19 endedDate:(id)a20 statusCoding:(id)a21 reasonCodingCollections:(id)a22 reasonEndedCodingCollection:(id)a23 statusReasonCodingCollection:(id)a24
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  id v35;
  void *v36;
  __CFString *v37;
  void *v38;
  __CFString *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  _BOOL4 v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;

  v48 = a5;
  v58 = a3;
  v57 = a4;
  v28 = a6;
  v53 = a7;
  v52 = a8;
  v51 = a10;
  v50 = a11;
  v56 = a12;
  v29 = a14;
  v55 = a15;
  v54 = a17;
  v30 = a18;
  v31 = a19;
  v47 = a20;
  v32 = a21;
  v46 = a22;
  v33 = a23;
  v45 = a24;
  v34 = CFSTR("modifiedDate");
  v35 = v28;
  v36 = v35;
  if (!v30)
  {
    v38 = v35;
    if (!v31)
      goto LABEL_4;
    goto LABEL_3;
  }
  v37 = CFSTR("earliestDosageDate");

  objc_msgSend(v30, "dateForUTC");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v37;
  if (v31)
  {
LABEL_3:
    v39 = CFSTR("writtenDate");

    objc_msgSend(v31, "dateForUTC");
    v40 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v40;
    v34 = v39;
  }
LABEL_4:
  v41 = v31;
  v44 = v31;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v34, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicationOrder medicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:](HKMedicationOrder, "medicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:", v58, v57, v48, v36, v53, v52, a9, v51, v50, v42, v56, a13, v29, v55, a16,
    v54,
    v30,
    v41,
    v47,
    v32,
    v46,
    v33,
    v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (void)_setMedication:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property medication for record type HKMedicationOrder.", a5, a6, a7, a8, 0);
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKMedicationOrder.", a5, a6, a7, a8, 0);
}

@end
