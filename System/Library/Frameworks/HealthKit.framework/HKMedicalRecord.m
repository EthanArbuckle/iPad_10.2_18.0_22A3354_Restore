@implementation HKMedicalRecord

- (NSArray)medicalRecordCodings
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)fallbackDisplayString
{
  return (id)objc_msgSend((id)objc_opt_class(), "defaultDisplayString");
}

+ (id)defaultDisplayString
{
  return &stru_1E37FD4C0;
}

- (int64_t)recordCategoryType
{
  return 0;
}

- (id)_init
{
  _QWORD *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicalRecord;
  v2 = -[HKSample _init](&v5, sel__init);
  v3 = (void *)v2[12];
  v2[12] = 0;

  return v2;
}

+ (id)_newMedicalRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 config:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v38;
  id v40;
  id v41;
  id v43;
  objc_super v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int64_t v53;
  unint64_t v54;
  BOOL v55;

  v38 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a12;
  v22 = a13;
  v23 = a15;
  v41 = a11;
  v24 = a10;
  v25 = a3;
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v27 = v26;
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v29 = v28;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __166__HKMedicalRecord__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config___block_invoke;
  v45[3] = &unk_1E37EE228;
  v55 = a5;
  v46 = v38;
  v47 = v18;
  v48 = v19;
  v49 = v20;
  v50 = v21;
  v51 = v22;
  v53 = a9;
  v54 = a14;
  v52 = v23;
  v44.receiver = a1;
  v44.super_class = (Class)&OBJC_METACLASS___HKMedicalRecord;
  v43 = v23;
  v40 = v22;
  v30 = v21;
  v31 = v20;
  v32 = v19;
  v33 = v18;
  v34 = v38;
  v35 = objc_msgSendSuper2(&v44, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v25, v24, v41, v45, v27, v29);

  return v35;
}

void __166__HKMedicalRecord__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config___block_invoke(uint64_t a1, void *a2)
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
  void *v15;
  uint64_t v16;
  _QWORD *v17;

  v17 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v17[14];
  v17[14] = v3;

  *((_BYTE *)v17 + 104) = *(_BYTE *)(a1 + 104);
  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v17[15];
  v17[15] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v17[16];
  v17[16] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v17[17];
  v17[17] = v9;

  v17[18] = *(_QWORD *)(a1 + 88);
  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v17[19];
  v17[19] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v17[20];
  v17[20] = v13;

  v15 = v17;
  v17[21] = *(_QWORD *)(a1 + 96);
  v16 = *(_QWORD *)(a1 + 80);
  if (v16)
  {
    (*(void (**)(uint64_t, _QWORD *))(v16 + 16))(v16, v17);
    v15 = v17;
  }

}

- (HKFHIRIdentifier)FHIRIdentifier
{
  return -[HKMedicalRecordOriginIdentifier fhirIdentifier](self->_originIdentifier, "fhirIdentifier");
}

- (unint64_t)medicalRecordOriginType
{
  void *v2;

  -[HKMedicalRecordOriginIdentifier signedClinicalDataRecordIdentifier](self->_originIdentifier, "signedClinicalDataRecordIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 3;
  else
    return 1;
}

- (id)attachmentObjectIdentifier
{
  return +[HKAttachmentObjectIdentifierUtilities attachmentObjectIdentifierForMedicalRecord:](HKAttachmentObjectIdentifierUtilities, "attachmentObjectIdentifierForMedicalRecord:", self);
}

- (id)attachmentSchemaIdentifier
{
  return CFSTR("HKClinicalRecord");
}

- (HKConcept)primaryConcept
{
  HKConcept *primaryConcept;
  HKConcept *v3;
  void *v4;
  void *v5;

  primaryConcept = self->_primaryConcept;
  if (primaryConcept)
  {
    v3 = primaryConcept;
  }
  else
  {
    -[HKMedicalRecord medicalRecordCodings](self, "medicalRecordCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v5);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
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
  v5.super_class = (Class)HKMedicalRecord;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_note, CFSTR("Note"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_enteredInError, CFSTR("EnteredInError"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_modifiedDate, CFSTR("ModifiedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originIdentifier, CFSTR("MedicalRecordOriginIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_locale, CFSTR("Locale"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_extractionVersion, CFSTR("ExtractionVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDate, CFSTR("SortDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryConcept, CFSTR("PrimaryConcept"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_country, CFSTR("Country"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("State"));

}

- (HKMedicalRecord)initWithCoder:(id)a3
{
  id v4;
  HKMedicalRecord *v5;
  uint64_t v6;
  NSString *note;
  uint64_t v8;
  NSDate *modifiedDate;
  uint64_t v10;
  HKMedicalRecordOriginIdentifier *originIdentifier;
  uint64_t v12;
  NSLocale *locale;
  uint64_t v14;
  HKSemanticDate *sortDate;
  uint64_t v16;
  HKConcept *primaryConcept;
  uint64_t v18;
  NSString *country;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKMedicalRecord;
  v5 = -[HKSample initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Note"));
    v6 = objc_claimAutoreleasedReturnValue();
    note = v5->_note;
    v5->_note = (NSString *)v6;

    v5->_enteredInError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnteredInError"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModifiedDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicalRecordOriginIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    originIdentifier = v5->_originIdentifier;
    v5->_originIdentifier = (HKMedicalRecordOriginIdentifier *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Locale"));
    v12 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v12;

    v5->_extractionVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ExtractionVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SortDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    sortDate = v5->_sortDate;
    v5->_sortDate = (HKSemanticDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryConcept"));
    v16 = objc_claimAutoreleasedReturnValue();
    primaryConcept = v5->_primaryConcept;
    v5->_primaryConcept = (HKConcept *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Country"));
    v18 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v18;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
  }

  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  HKMedicalRecord *v4;
  uint64_t v5;
  HKMedicalRecord *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  unint64_t v38;
  objc_super v39;
  objc_super v40;

  v4 = (HKMedicalRecord *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v40.receiver = self;
    v40.super_class = (Class)HKMedicalRecord;
    if (-[HKMedicalRecord isKindOfClass:](&v40, sel_isKindOfClass_, v5))
    {
      v39.receiver = self;
      v39.super_class = (Class)HKMedicalRecord;
      if (-[HKSample isEquivalent:](&v39, sel_isEquivalent_, v4))
      {
        v6 = v4;
        v7 = -[HKMedicalRecord enteredInError](self, "enteredInError");
        if (v7 != -[HKMedicalRecord enteredInError](v6, "enteredInError"))
          goto LABEL_28;
        -[HKMedicalRecord sortDate](self, "sortDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalRecord sortDate](v6, "sortDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (!v10)
          goto LABEL_28;
        -[HKMedicalRecord modifiedDate](self, "modifiedDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalRecord modifiedDate](v6, "modifiedDate");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {

        }
        else
        {
          v13 = (void *)v12;
          -[HKMedicalRecord modifiedDate](v6, "modifiedDate");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_27;
          v15 = (void *)v14;
          -[HKMedicalRecord modifiedDate](self, "modifiedDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicalRecord modifiedDate](v6, "modifiedDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (!v18)
            goto LABEL_28;
        }
        -[HKMedicalRecord locale](self, "locale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalRecord locale](v6, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v11 != 0) != (v13 == 0))
        {
          -[HKMedicalRecord locale](v6, "locale");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            -[HKMedicalRecord locale](self, "locale");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMedicalRecord locale](v6, "locale");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "hk_isEquivalent:", v23);

            if (!v24)
              goto LABEL_28;
          }
          else
          {

          }
          -[HKMedicalRecord note](self, "note");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicalRecord note](v6, "note");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v11 == (void *)v25)
          {

          }
          else
          {
            v13 = (void *)v25;
            -[HKMedicalRecord note](v6, "note");
            v26 = objc_claimAutoreleasedReturnValue();
            if (!v26)
              goto LABEL_27;
            v27 = (void *)v26;
            -[HKMedicalRecord note](self, "note");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMedicalRecord note](v6, "note");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "isEqualToString:", v29);

            if (!v30)
              goto LABEL_28;
          }
          -[HKMedicalRecord country](self, "country");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicalRecord country](v6, "country");
          v31 = objc_claimAutoreleasedReturnValue();
          if (v11 == (void *)v31)
          {

LABEL_32:
            v38 = -[HKMedicalRecord state](self, "state");
            v19 = v38 == -[HKMedicalRecord state](v6, "state");
            goto LABEL_29;
          }
          v13 = (void *)v31;
          -[HKMedicalRecord country](v6, "country");
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            -[HKMedicalRecord country](self, "country");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMedicalRecord country](v6, "country");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqualToString:", v35);

            if (v36)
              goto LABEL_32;
LABEL_28:
            v19 = 0;
LABEL_29:

            goto LABEL_30;
          }
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    v19 = 0;
  }
LABEL_30:

  return v19;
}

- (void)_setNote:(id)a3
{
  NSString *v4;
  NSString *note;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  note = self->_note;
  self->_note = v4;

}

- (void)_setEnteredInError:(BOOL)a3
{
  self->_enteredInError = a3;
}

- (void)_setModifiedDate:(id)a3
{
  NSDate *v4;
  NSDate *modifiedDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  modifiedDate = self->_modifiedDate;
  self->_modifiedDate = v4;

}

- (void)_setOriginIdentifier:(id)a3
{
  HKMedicalRecordOriginIdentifier *v4;
  HKMedicalRecordOriginIdentifier *originIdentifier;

  v4 = (HKMedicalRecordOriginIdentifier *)objc_msgSend(a3, "copy");
  originIdentifier = self->_originIdentifier;
  self->_originIdentifier = v4;

}

- (void)_setLocale:(id)a3
{
  NSLocale *v4;
  NSLocale *locale;

  v4 = (NSLocale *)objc_msgSend(a3, "copy");
  locale = self->_locale;
  self->_locale = v4;

}

- (void)_setExtractionVersion:(int64_t)a3
{
  self->_extractionVersion = a3;
}

- (void)_setSortDate:(id)a3
{
  HKSemanticDate *v4;
  HKSemanticDate *sortDate;

  v4 = (HKSemanticDate *)objc_msgSend(a3, "copy");
  sortDate = self->_sortDate;
  self->_sortDate = v4;

}

- (void)_setPrimaryConcept:(id)a3
{
  HKConcept *v4;
  void *v5;
  HKConcept *primaryConcept;

  v4 = (HKConcept *)a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKMedicalRecord _setPrimaryConcept:].cold.1(v5);
  }
  primaryConcept = self->_primaryConcept;
  self->_primaryConcept = v4;

}

- (void)_setCountry:(id)a3
{
  NSString *v4;
  NSString *country;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  country = self->_country;
  self->_country = v4;

}

- (void)_setState:(unint64_t)a3
{
  self->_state = a3;
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
  v13.super_class = (Class)HKMedicalRecord;
  -[HKSample _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_13:
    v8 = v7;
    goto LABEL_14;
  }
  if (!self->_modifiedDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: modifiedDate must not be nil");
LABEL_12:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!self->_sortDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: sortDate must not be nil");
    goto LABEL_12;
  }
  if (!self->_originIdentifier)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: originIdentifier must not be nil");
    goto LABEL_12;
  }
  if (!self->_extractionVersion)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: _extractionVersion must not be nil");
    goto LABEL_12;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

+ (id)_sortDateIntervalFromStartDateComponents:(id)a3 endDateComponents:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isValidDateInCalendar:", v10) & 1) != 0)
    {
      if ((objc_msgSend(v9, "isValidDateInCalendar:", v10) & 1) != 0)
      {
        objc_msgSend(v10, "dateFromComponents:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateFromComponents:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hk_isAfterDate:", v12))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("start date components after end date components"));
          v13 = 0;
        }
        else
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v12);
        }

        goto LABEL_13;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("end date components are not a valid date");
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("start date components are not a valid date");
    }
    objc_msgSend(v14, "hk_assignError:code:format:", a5, 3, v15);
    v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("start and end date components must be nonnull"));
  v13 = 0;
LABEL_14:

  return v13;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (NSString)note
{
  return self->_note;
}

- (BOOL)enteredInError
{
  return self->_enteredInError;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (HKMedicalRecordOriginIdentifier)originIdentifier
{
  return self->_originIdentifier;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int64_t)extractionVersion
{
  return self->_extractionVersion;
}

- (HKSemanticDate)sortDate
{
  return self->_sortDate;
}

- (NSString)country
{
  return self->_country;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_primaryConcept, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 0;
}

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "indexableConceptKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)indexableConceptKeyPaths
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("primaryConcept");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cachedConceptRelationshipKeyPaths
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("primaryConcept.groupByConcept");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("primaryConcept")))
  {
    -[HKMedicalRecord medicalRecordCodings](self, "medicalRecordCodings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  objc_class *v14;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("primaryConcept"));
  if (v10)
  {
    v11 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5);

    if (!v11)
    {
      LOBYTE(v10) = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "object");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HKMedicalRecord _setPrimaryConcept:](self, "_setPrimaryConcept:", v9);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_assignError:code:format:", a5, 3, CFSTR("%@ does not support applying concepts for key-path %@"), v12, v9);
  }

LABEL_7:
  return v10;
}

- (void)_setPrimaryConcept:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_19A0E6000, v1, OS_LOG_TYPE_FAULT, "Tried to set a nil primaryConcept in class %@", (uint8_t *)&v4, 0xCu);

}

@end
