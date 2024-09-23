@implementation HKMedicationDispenseRecord

+ (id)medicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodings:(id)a15 quantityDispensed:(id)a16 preparationDate:(id)a17 handOverDate:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 statusCoding:(id)a21 daysSupplyQuantity:(id)a22
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newMedicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           0));
}

+ (id)_newMedicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodings:(id)a15 quantityDispensed:(id)a16 preparationDate:(id)a17 handOverDate:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 statusCoding:(id)a21 daysSupplyQuantity:(id)a22 config:(id)a23
{
  id v23;
  id v24;
  id v25;
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
  void *v41;
  id v49;
  _BOOL4 v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  _QWORD aBlock[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;

  v50 = a5;
  v23 = a15;
  v24 = a16;
  v25 = a17;
  v26 = a18;
  v27 = a19;
  v28 = a20;
  v29 = a21;
  v30 = a22;
  v31 = a23;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __312__HKMedicationDispenseRecord__newMedicationDispenseRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodings_quantityDispensed_preparationDate_handOverDate_dosages_earliestDosageDate_statusCoding_daysSupplyQuantity_config___block_invoke;
  aBlock[3] = &unk_1E37E6F08;
  v62 = v23;
  v63 = v24;
  v64 = v25;
  v65 = v26;
  v66 = v27;
  v67 = v28;
  v68 = v29;
  v69 = v30;
  v70 = v31;
  v59 = v31;
  v58 = v30;
  v57 = v29;
  v56 = v28;
  v55 = v27;
  v54 = v26;
  v53 = v25;
  v52 = v24;
  v49 = v23;
  v32 = a13;
  v33 = a12;
  v34 = a11;
  v35 = a10;
  v36 = a8;
  v37 = a7;
  v38 = a6;
  v39 = a4;
  v40 = a3;
  v41 = _Block_copy(aBlock);
  v60.receiver = a1;
  v60.super_class = (Class)&OBJC_METACLASS___HKMedicationDispenseRecord;
  v51 = objc_msgSendSuper2(&v60, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v40, v39, v50, v38, v37, v36, a9, v35, v34, v33, v32, a14, v41);

  return v51;
}

void __312__HKMedicationDispenseRecord__newMedicationDispenseRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodings_quantityDispensed_preparationDate_handOverDate_dosages_earliestDosageDate_statusCoding_daysSupplyQuantity_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v20;

  v20 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v20[22];
  v20[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v20[23];
  v20[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v20[24];
  v20[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v20[25];
  v20[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v20[26];
  v20[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v20[27];
  v20[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v20[28];
  v20[28] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v20[29];
  v20[29] = v17;

  v19 = *(_QWORD *)(a1 + 96);
  if (v19)
    (*(void (**)(uint64_t, _QWORD *))(v19 + 16))(v19, v20);

}

- (HKMedicationDispenseRecord)init
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
  v9.super_class = (Class)HKMedicationDispenseRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@medicationCodings = %@quantityDispensed = %@preparationDate = %@handOverDate = %@dosages = %@earliestDosageDate = %@statusCoding = %@daysSupplyQuantity = %@>"), v5, self, v6, self->_medicationCodings, self->_quantityDispensed, self->_preparationDate, self->_handOverDate, self->_dosages, self->_earliestDosageDate, self->_statusCoding, self->_daysSupplyQuantity);
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
  v5.super_class = (Class)HKMedicationDispenseRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationCodings, CFSTR("MedicationCodings"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityDispensed, CFSTR("QuantityDispensed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preparationDate, CFSTR("PreparationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_handOverDate, CFSTR("HandOverDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dosages, CFSTR("Dosages"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_earliestDosageDate, CFSTR("EarliestDosageDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_daysSupplyQuantity, CFSTR("DaysSupplyQuantity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_medication, CFSTR("Medication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));

}

- (HKMedicationDispenseRecord)initWithCoder:(id)a3
{
  id v4;
  HKMedicationDispenseRecord *v5;
  void *v6;
  uint64_t v7;
  NSArray *medicationCodings;
  uint64_t v9;
  HKCodedQuantity *quantityDispensed;
  uint64_t v11;
  HKMedicalDate *preparationDate;
  uint64_t v13;
  HKMedicalDate *handOverDate;
  void *v15;
  uint64_t v16;
  NSArray *dosages;
  uint64_t v18;
  HKMedicalDate *earliestDosageDate;
  uint64_t v20;
  HKMedicalCoding *statusCoding;
  uint64_t v22;
  HKCodedQuantity *daysSupplyQuantity;
  uint64_t v24;
  HKConcept *medication;
  uint64_t v26;
  HKConcept *status;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HKMedicationDispenseRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("MedicationCodings"));
    v7 = objc_claimAutoreleasedReturnValue();
    medicationCodings = v5->_medicationCodings;
    v5->_medicationCodings = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QuantityDispensed"));
    v9 = objc_claimAutoreleasedReturnValue();
    quantityDispensed = v5->_quantityDispensed;
    v5->_quantityDispensed = (HKCodedQuantity *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreparationDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    preparationDate = v5->_preparationDate;
    v5->_preparationDate = (HKMedicalDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HandOverDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    handOverDate = v5->_handOverDate;
    v5->_handOverDate = (HKMedicalDate *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("Dosages"));
    v16 = objc_claimAutoreleasedReturnValue();
    dosages = v5->_dosages;
    v5->_dosages = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EarliestDosageDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    earliestDosageDate = v5->_earliestDosageDate;
    v5->_earliestDosageDate = (HKMedicalDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v20 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DaysSupplyQuantity"));
    v22 = objc_claimAutoreleasedReturnValue();
    daysSupplyQuantity = v5->_daysSupplyQuantity;
    v5->_daysSupplyQuantity = (HKCodedQuantity *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Medication"));
    v24 = objc_claimAutoreleasedReturnValue();
    medication = v5->_medication;
    v5->_medication = (HKConcept *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v26 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v26;

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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  objc_super v70;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v70.receiver = self;
    v70.super_class = (Class)HKMedicationDispenseRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v70, sel_isEquivalent_, v5))
      goto LABEL_54;
    -[HKMedicationDispenseRecord medicationCodings](self, "medicationCodings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medicationCodings");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "medicationCodings");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_53;
      v10 = (void *)v9;
      -[HKMedicationDispenseRecord medicationCodings](self, "medicationCodings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medicationCodings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToArray:", v12);

      if (!v13)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord quantityDispensed](self, "quantityDispensed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quantityDispensed");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "quantityDispensed");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_53;
      v17 = (void *)v16;
      -[HKMedicationDispenseRecord quantityDispensed](self, "quantityDispensed");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "quantityDispensed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord preparationDate](self, "preparationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preparationDate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "preparationDate");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_53;
      v23 = (void *)v22;
      -[HKMedicationDispenseRecord preparationDate](self, "preparationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preparationDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord handOverDate](self, "handOverDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handOverDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "handOverDate");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_53;
      v29 = (void *)v28;
      -[HKMedicationDispenseRecord handOverDate](self, "handOverDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handOverDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord dosages](self, "dosages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dosages");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "dosages");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_53;
      v35 = (void *)v34;
      -[HKMedicationDispenseRecord dosages](self, "dosages");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dosages");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToArray:", v37);

      if (!v38)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord earliestDosageDate](self, "earliestDosageDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earliestDosageDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "earliestDosageDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_53;
      v41 = (void *)v40;
      -[HKMedicationDispenseRecord earliestDosageDate](self, "earliestDosageDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "earliestDosageDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "statusCoding");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_53;
      v47 = (void *)v46;
      -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord daysSupplyQuantity](self, "daysSupplyQuantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "daysSupplyQuantity");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

    }
    else
    {
      v8 = (void *)v51;
      objc_msgSend(v5, "daysSupplyQuantity");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_53;
      v53 = (void *)v52;
      -[HKMedicationDispenseRecord daysSupplyQuantity](self, "daysSupplyQuantity");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "daysSupplyQuantity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord medication](self, "medication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medication");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v57)
    {

    }
    else
    {
      v8 = (void *)v57;
      objc_msgSend(v5, "medication");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_53;
      v59 = (void *)v58;
      -[HKMedicationDispenseRecord medication](self, "medication");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medication");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      if (!v62)
        goto LABEL_54;
    }
    -[HKMedicationDispenseRecord status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v63)
    {

LABEL_58:
      v14 = 1;
      goto LABEL_55;
    }
    v8 = (void *)v63;
    objc_msgSend(v5, "status");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v65 = (void *)v64;
      -[HKMedicationDispenseRecord status](self, "status");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqual:", v67);

      if ((v68 & 1) != 0)
        goto LABEL_58;
LABEL_54:
      v14 = 0;
LABEL_55:

      goto LABEL_56;
    }
LABEL_53:

    goto LABEL_54;
  }
  v14 = 0;
LABEL_56:

  return v14;
}

- (id)medicationCodingsCollection
{
  void *v2;
  void *v3;

  -[HKMedicationDispenseRecord medicationCodings](self, "medicationCodings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)statusCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSArray)medicationCodings
{
  return self->_medicationCodings;
}

- (void)_setMedicationCodings:(id)a3
{
  NSArray *v4;
  NSArray *medicationCodings;
  HKConcept *v6;
  HKConcept *medication;
  id v8;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  medicationCodings = self->_medicationCodings;
  self->_medicationCodings = v4;

  -[HKMedicationDispenseRecord medicationCodingsCollection](self, "medicationCodingsCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  medication = self->_medication;
  self->_medication = v6;

}

- (HKCodedQuantity)quantityDispensed
{
  return self->_quantityDispensed;
}

- (void)_setQuantityDispensed:(id)a3
{
  HKCodedQuantity *v4;
  HKCodedQuantity *quantityDispensed;

  v4 = (HKCodedQuantity *)objc_msgSend(a3, "copy");
  quantityDispensed = self->_quantityDispensed;
  self->_quantityDispensed = v4;

}

- (HKMedicalDate)preparationDate
{
  return self->_preparationDate;
}

- (void)_setPreparationDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *preparationDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  preparationDate = self->_preparationDate;
  self->_preparationDate = v4;

}

- (HKMedicalDate)handOverDate
{
  return self->_handOverDate;
}

- (void)_setHandOverDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *handOverDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  handOverDate = self->_handOverDate;
  self->_handOverDate = v4;

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
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  if (self->_statusCoding)
  {
    -[HKMedicationDispenseRecord statusCodingCollection](self, "statusCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    status = self->_status;
    self->_status = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_status;
    self->_status = 0;
  }

}

- (HKCodedQuantity)daysSupplyQuantity
{
  return self->_daysSupplyQuantity;
}

- (void)_setDaysSupplyQuantity:(id)a3
{
  HKCodedQuantity *v4;
  HKCodedQuantity *daysSupplyQuantity;

  v4 = (HKCodedQuantity *)objc_msgSend(a3, "copy");
  daysSupplyQuantity = self->_daysSupplyQuantity;
  self->_daysSupplyQuantity = v4;

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
    -[HKMedicationDispenseRecord medicationCodingsCollection](self, "medicationCodingsCollection");
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
  HKConcept *v6;
  HKConcept *medication;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKMedicationDispenseRecord _setMedication:].cold.1(v5);
  }
  v6 = (HKConcept *)objc_msgSend(v4, "copy");
  medication = self->_medication;
  self->_medication = v6;

}

- (HKConcept)status
{
  HKConcept *status;
  HKConcept *v3;
  void *v4;

  if (self->_statusCoding)
  {
    status = self->_status;
    if (status)
    {
      v3 = status;
    }
    else
    {
      -[HKMedicationDispenseRecord statusCodingCollection](self, "statusCodingCollection");
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

- (void)_setStatus:(id)a3
{
  HKConcept *v4;
  HKConcept *status;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  status = self->_status;
  self->_status = v4;

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMedicationDispenseRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (self->_medicationCodings)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: medicationCodings must not be nil"), self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_daysSupplyQuantity, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_earliestDosageDate, 0);
  objc_storeStrong((id *)&self->_dosages, 0);
  objc_storeStrong((id *)&self->_handOverDate, 0);
  objc_storeStrong((id *)&self->_preparationDate, 0);
  objc_storeStrong((id *)&self->_quantityDispensed, 0);
  objc_storeStrong((id *)&self->_medicationCodings, 0);
}

+ (id)medicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodings:(id)a14 quantityDispensed:(id)a15 preparationDate:(id)a16 handOverDate:(id)a17 dosages:(id)a18 earliestDosageDate:(id)a19 statusCoding:(id)a20 daysSupplyQuantity:(id)a21
{
  id v25;
  id v26;
  id v27;
  id v28;
  __CFString *v29;
  id v30;
  void *v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;

  v43 = a5;
  v53 = a3;
  v52 = a4;
  v25 = a6;
  v51 = a7;
  v46 = a8;
  v45 = a10;
  v47 = a11;
  v50 = a12;
  v49 = a14;
  v48 = a15;
  v26 = a16;
  v27 = a17;
  v42 = a18;
  v28 = a19;
  v41 = a20;
  v40 = a21;
  v29 = CFSTR("modifiedDate");
  v30 = v25;
  v31 = v30;
  if (v28)
  {
    v32 = CFSTR("earliestDosageDate");

    objc_msgSend(v28, "dateForUTC");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v32;
    if (!v26)
      goto LABEL_4;
    goto LABEL_3;
  }
  v33 = v30;
  if (v26)
  {
LABEL_3:
    v34 = CFSTR("preparationDate");

    objc_msgSend(v26, "dateForUTC");
    v35 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v35;
    v29 = v34;
  }
LABEL_4:
  if (v27)
  {
    v36 = CFSTR("handOverDate");

    objc_msgSend(v27, "dateForUTC");
    v37 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v37;
    v29 = v36;
  }
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v29, v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicationDispenseRecord medicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:](HKMedicationDispenseRecord, "medicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:", v53, v52, v43, v31, v51, v46, a9, v45, v47, v38, v50, a13, v49, v48, v26,
    v27,
    v42,
    v28,
    v41,
    v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
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

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKMedicationDispenseRecord;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("medication"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKMedicationDispenseRecord;
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
  void **v13;
  void *v14;
  void *v15;
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
      -[HKMedicationDispenseRecord medicationCodings](self, "medicationCodings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = (void **)v19;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
      {
        v17.receiver = self;
        v17.super_class = (Class)HKMedicationDispenseRecord;
        -[HKMedicalRecord codingsForKeyPath:error:](&v17, sel_codingsForKeyPath_error_, v6, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v14 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_11;
      }
      -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v18;
    }
    objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("medication")))
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
    {
      v19.receiver = self;
      v19.super_class = (Class)HKMedicationDispenseRecord;
      v17 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v19, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
      goto LABEL_10;
    }
    v14 = objc_msgSend(v8, "count");
    -[HKMedicationDispenseRecord statusCoding](self, "statusCoding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HKIndexableObjectCheckCardinalityForIndexRestore(v14, v15 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v16)
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationDispenseRecord _setStatus:](self, "_setStatus:", v13);
      goto LABEL_8;
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    goto LABEL_9;
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationDispenseRecord _setMedication:](self, "_setMedication:", v13);
LABEL_8:

  v17 = 1;
LABEL_10:

  return v17;
}

- (void)_setMedication:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property medication for record type HKMedicationDispenseRecord.", v1, 2u);
}

@end
