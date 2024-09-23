@implementation _HKMedicalIDData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKMedicalIDData)init
{
  _HKMedicalIDData *v2;
  _HKMedicalIDData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKMedicalIDData;
  v2 = -[_HKMedicalIDData init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_HKMedicalIDData setSchemaVersion:](v2, "setSchemaVersion:", 4);
  return v3;
}

- (_HKMedicalIDData)initWithCoder:(id)a3
{
  id v4;
  _HKMedicalIDData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v69;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_HKMedicalIDData;
  v5 = -[_HKMedicalIDData init](&v69, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataDateSavedKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setDateSaved:](v5, "setDateSaved:", v6);

    -[_HKMedicalIDData setSchemaVersion:](v5, "setSchemaVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HKMedicalIDDataSchemaVersionKey")));
    -[_HKMedicalIDData setIsDisabled:](v5, "setIsDisabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HKMedicalIDDataIsDisabledKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataIsDisabledModifiedDateKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setIsDisabledModifiedDate:](v5, "setIsDisabledModifiedDate:", v7);

    -[_HKMedicalIDData setShareDuringEmergency:](v5, "setShareDuringEmergency:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HKMedicalIDDataShareDuringEmergencyKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataShareDuringEmergencyModifiedDateKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setShareDuringEmergencyModifiedDate:](v5, "setShareDuringEmergencyModifiedDate:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPictureDataKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPictureData:](v5, "setPictureData:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPictureDataModifiedDateKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPictureDataModifiedDate:](v5, "setPictureDataModifiedDate:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataNameKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setName:](v5, "setName:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataNameModifiedDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setNameModifiedDate:](v5, "setNameModifiedDate:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataBirthdateKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setBirthdate:](v5, "setBirthdate:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataGmtBirthdateKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setGmtBirthdate:](v5, "setGmtBirthdate:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataGregorianBirthdateModifiedDateKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setGregorianBirthdayModifiedDate:](v5, "setGregorianBirthdayModifiedDate:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPrimaryLanguageCodeKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPrimaryLanguageCode:](v5, "setPrimaryLanguageCode:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPrimaryLanguageCodeModifiedDateKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPrimaryLanguageCodeModifiedDate:](v5, "setPrimaryLanguageCodeModifiedDate:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataHeightKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setHeight:](v5, "setHeight:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataHeightModifiedDateKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setHeightModifiedDate:](v5, "setHeightModifiedDate:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataWeightKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setWeight:](v5, "setWeight:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataWeightModifiedDateKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setWeightModifiedDate:](v5, "setWeightModifiedDate:", v21);

    -[_HKMedicalIDData setBloodType:](v5, "setBloodType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HKMedicalIDDataBloodTypeKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataBloodTypeModifiedDateKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setBloodTypeModifiedDate:](v5, "setBloodTypeModifiedDate:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataIsOrganDonorKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setIsOrganDonor:](v5, "setIsOrganDonor:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataIsOrganDonorModifiedDateKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setIsOrganDonorModifiedDate:](v5, "setIsOrganDonorModifiedDate:", v24);

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("HKMedicalIDDataEmergencyContactsKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setEmergencyContacts:](v5, "setEmergencyContacts:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataEmergencyContactsModifiedDateKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setEmergencyContactsModifiedDate:](v5, "setEmergencyContactsModifiedDate:", v29);

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("HKMedicalIDDataClinicalContactsKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setClinicalContacts:](v5, "setClinicalContacts:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataClinicalContactsModifiedDateKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setClinicalContactsModifiedDate:](v5, "setClinicalContactsModifiedDate:", v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicalConditionsKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicalConditions:](v5, "setMedicalConditions:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicalConditionsModifiedDateKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicalConditionsModifiedDate:](v5, "setMedicalConditionsModifiedDate:", v36);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicalNotesKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicalNotes:](v5, "setMedicalNotes:", v37);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicalNotesModifiedDateKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicalNotesModifiedDate:](v5, "setMedicalNotesModifiedDate:", v38);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataAllergyInfoKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setAllergyInfo:](v5, "setAllergyInfo:", v39);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataAllergyInfoModifiedDateKey"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setAllergyInfoModifiedDate:](v5, "setAllergyInfoModifiedDate:", v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicationInfoKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicationInfo:](v5, "setMedicationInfo:", v41);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicationInfoModifiedDateKey"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicationInfoModifiedDate:](v5, "setMedicationInfoModifiedDate:", v42);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPregnancyStartDateKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPregnancyStartDate:](v5, "setPregnancyStartDate:", v43);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPregnancyStartDateModifiedDateKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPregnancyStartDateModifiedDate:](v5, "setPregnancyStartDateModifiedDate:", v44);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPregnancyEstimatedDueDateKey"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPregnancyEstimatedDueDate:](v5, "setPregnancyEstimatedDueDate:", v45);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataPregnancyEstimatedDueDateModifiedDateKey"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setPregnancyEstimatedDueDateModifiedDate:](v5, "setPregnancyEstimatedDueDateModifiedDate:", v46);

    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("HKMedicalIDDataMedicationsListKey"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicationsList:](v5, "setMedicationsList:", v50);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicationsListModifiedDateKey"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicationsListModifiedDate:](v5, "setMedicationsListModifiedDate:", v51);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicationsListVersionKey"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicationsListVersion:](v5, "setMedicationsListVersion:", v52);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataMedicationsListVersionModifiedDateKey"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setMedicationsListVersionModifiedDate:](v5, "setMedicationsListVersionModifiedDate:", v53);

    v54 = (void *)MEMORY[0x1E0C99E60];
    v55 = objc_opt_class();
    objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("HKMedicalIDDataAllergiesListKey"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setAllergiesList:](v5, "setAllergiesList:", v57);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataAllergiesListModifiedDateKey"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setAllergiesListModifiedDate:](v5, "setAllergiesListModifiedDate:", v58);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataAllergiesListVersionKey"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setAllergiesListVersion:](v5, "setAllergiesListVersion:", v59);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataAllergiesListVersionModifiedDateKey"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setAllergiesListVersionModifiedDate:](v5, "setAllergiesListVersionModifiedDate:", v60);

    v61 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v63, CFSTR("HKMedicalIDDataConditionsListKey"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setConditionsList:](v5, "setConditionsList:", v64);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataConditionsListModifiedDateKey"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setConditionsListModifiedDate:](v5, "setConditionsListModifiedDate:", v65);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataConditionsListVersionKey"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setConditionsListVersion:](v5, "setConditionsListVersion:", v66);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDDataConditionsListVersionModifiedDateKey"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData setConditionsListVersionModifiedDate:](v5, "setConditionsListVersionModifiedDate:", v67);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v4 = a3;
  -[_HKMedicalIDData dateSaved](self, "dateSaved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HKMedicalIDDataDateSavedKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_HKMedicalIDData schemaVersion](self, "schemaVersion"), CFSTR("HKMedicalIDDataSchemaVersionKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_HKMedicalIDData isDisabled](self, "isDisabled"), CFSTR("HKMedicalIDDataIsDisabledKey"));
  -[_HKMedicalIDData isDisabledModifiedDate](self, "isDisabledModifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HKMedicalIDDataIsDisabledModifiedDateKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency"), CFSTR("HKMedicalIDDataShareDuringEmergencyKey"));
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](self, "shareDuringEmergencyModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HKMedicalIDDataShareDuringEmergencyModifiedDateKey"));

  -[_HKMedicalIDData pictureData](self, "pictureData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HKMedicalIDDataPictureDataKey"));

  -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HKMedicalIDDataPictureDataModifiedDateKey"));

  -[_HKMedicalIDData name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HKMedicalIDDataNameKey"));

  -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HKMedicalIDDataNameModifiedDateKey"));

  -[_HKMedicalIDData birthdate](self, "birthdate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HKMedicalIDDataBirthdateKey"));

  -[_HKMedicalIDData gmtBirthdate](self, "gmtBirthdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("HKMedicalIDDataGmtBirthdateKey"));

  -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("HKMedicalIDDataGregorianBirthdateKey"));

  -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("HKMedicalIDDataGregorianBirthdateModifiedDateKey"));

  -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("HKMedicalIDDataPrimaryLanguageCodeKey"));

  -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("HKMedicalIDDataPrimaryLanguageCodeModifiedDateKey"));

  -[_HKMedicalIDData height](self, "height");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("HKMedicalIDDataHeightKey"));

  -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("HKMedicalIDDataHeightModifiedDateKey"));

  -[_HKMedicalIDData weight](self, "weight");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("HKMedicalIDDataWeightKey"));

  -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("HKMedicalIDDataWeightModifiedDateKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_HKMedicalIDData bloodType](self, "bloodType"), CFSTR("HKMedicalIDDataBloodTypeKey"));
  -[_HKMedicalIDData bloodTypeModifiedDate](self, "bloodTypeModifiedDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("HKMedicalIDDataBloodTypeModifiedDateKey"));

  -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("HKMedicalIDDataIsOrganDonorKey"));

  -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("HKMedicalIDDataIsOrganDonorModifiedDateKey"));

  -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("HKMedicalIDDataEmergencyContactsKey"));

  -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("HKMedicalIDDataEmergencyContactsModifiedDateKey"));

  -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("HKMedicalIDDataClinicalContactsKey"));

  -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("HKMedicalIDDataClinicalContactsModifiedDateKey"));

  -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("HKMedicalIDDataMedicalConditionsKey"));

  -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("HKMedicalIDDataMedicalConditionsModifiedDateKey"));

  -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("HKMedicalIDDataMedicalNotesKey"));

  -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("HKMedicalIDDataMedicalNotesModifiedDateKey"));

  -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("HKMedicalIDDataAllergyInfoKey"));

  -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("HKMedicalIDDataAllergyInfoModifiedDateKey"));

  -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("HKMedicalIDDataMedicationInfoKey"));

  -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("HKMedicalIDDataMedicationInfoModifiedDateKey"));

  -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("HKMedicalIDDataPregnancyStartDateKey"));

  -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("HKMedicalIDDataPregnancyStartDateModifiedDateKey"));

  -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("HKMedicalIDDataPregnancyEstimatedDueDateKey"));

  -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("HKMedicalIDDataPregnancyEstimatedDueDateModifiedDateKey"));

  -[_HKMedicalIDData medicationsList](self, "medicationsList");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("HKMedicalIDDataMedicationsListKey"));

  -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("HKMedicalIDDataMedicationsListModifiedDateKey"));

  -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("HKMedicalIDDataMedicationsListVersionKey"));

  -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("HKMedicalIDDataMedicationsListVersionModifiedDateKey"));

  -[_HKMedicalIDData allergiesList](self, "allergiesList");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, CFSTR("HKMedicalIDDataAllergiesListKey"));

  -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v46, CFSTR("HKMedicalIDDataAllergiesListModifiedDateKey"));

  -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, CFSTR("HKMedicalIDDataAllergiesListVersionKey"));

  -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v48, CFSTR("HKMedicalIDDataAllergiesListVersionModifiedDateKey"));

  -[_HKMedicalIDData conditionsList](self, "conditionsList");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("HKMedicalIDDataConditionsListKey"));

  -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("HKMedicalIDDataConditionsListModifiedDateKey"));

  -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v51, CFSTR("HKMedicalIDDataConditionsListVersionKey"));

  -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v52, CFSTR("HKMedicalIDDataConditionsListVersionModifiedDateKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _HKMedicalIDData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;

  v4 = -[_HKMedicalIDData init](+[_HKMedicalIDData allocWithZone:](_HKMedicalIDData, "allocWithZone:", a3), "init");
  -[_HKMedicalIDData dateSaved](self, "dateSaved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_HKMedicalIDData setDateSaved:](v4, "setDateSaved:", v6);

  -[_HKMedicalIDData setSchemaVersion:](v4, "setSchemaVersion:", -[_HKMedicalIDData schemaVersion](self, "schemaVersion"));
  -[_HKMedicalIDData setIsDisabled:](v4, "setIsDisabled:", -[_HKMedicalIDData isDisabled](self, "isDisabled"));
  -[_HKMedicalIDData isDisabledModifiedDate](self, "isDisabledModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[_HKMedicalIDData setIsDisabledModifiedDate:](v4, "setIsDisabledModifiedDate:", v8);

  -[_HKMedicalIDData setShareDuringEmergency:](v4, "setShareDuringEmergency:", -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency"));
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](self, "shareDuringEmergencyModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_HKMedicalIDData setShareDuringEmergencyModifiedDate:](v4, "setShareDuringEmergencyModifiedDate:", v10);

  -[_HKMedicalIDData pictureData](self, "pictureData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[_HKMedicalIDData setPictureData:](v4, "setPictureData:", v12);

  -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[_HKMedicalIDData setPictureDataModifiedDate:](v4, "setPictureDataModifiedDate:", v14);

  -[_HKMedicalIDData name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[_HKMedicalIDData setName:](v4, "setName:", v16);

  -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[_HKMedicalIDData setNameModifiedDate:](v4, "setNameModifiedDate:", v18);

  -[_HKMedicalIDData birthdate](self, "birthdate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[_HKMedicalIDData setBirthdate:](v4, "setBirthdate:", v20);

  -[_HKMedicalIDData gmtBirthdate](self, "gmtBirthdate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[_HKMedicalIDData setGmtBirthdate:](v4, "setGmtBirthdate:", v22);

  -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[_HKMedicalIDData setGregorianBirthday:](v4, "setGregorianBirthday:", v24);

  -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  -[_HKMedicalIDData setGregorianBirthdayModifiedDate:](v4, "setGregorianBirthdayModifiedDate:", v26);

  -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[_HKMedicalIDData setPrimaryLanguageCode:](v4, "setPrimaryLanguageCode:", v28);

  -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  -[_HKMedicalIDData setPrimaryLanguageCodeModifiedDate:](v4, "setPrimaryLanguageCodeModifiedDate:", v30);

  -[_HKMedicalIDData height](self, "height");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[_HKMedicalIDData setHeight:](v4, "setHeight:", v32);

  -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[_HKMedicalIDData setHeightModifiedDate:](v4, "setHeightModifiedDate:", v34);

  -[_HKMedicalIDData weight](self, "weight");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  -[_HKMedicalIDData setWeight:](v4, "setWeight:", v36);

  -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  -[_HKMedicalIDData setWeightModifiedDate:](v4, "setWeightModifiedDate:", v38);

  -[_HKMedicalIDData setBloodType:](v4, "setBloodType:", -[_HKMedicalIDData bloodType](self, "bloodType"));
  -[_HKMedicalIDData bloodTypeModifiedDate](self, "bloodTypeModifiedDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  -[_HKMedicalIDData setBloodTypeModifiedDate:](v4, "setBloodTypeModifiedDate:", v40);

  -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  -[_HKMedicalIDData setIsOrganDonor:](v4, "setIsOrganDonor:", v42);

  -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  -[_HKMedicalIDData setIsOrganDonorModifiedDate:](v4, "setIsOrganDonorModifiedDate:", v44);

  -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  -[_HKMedicalIDData setEmergencyContacts:](v4, "setEmergencyContacts:", v46);

  -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  -[_HKMedicalIDData setEmergencyContactsModifiedDate:](v4, "setEmergencyContactsModifiedDate:", v48);

  -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  -[_HKMedicalIDData setClinicalContacts:](v4, "setClinicalContacts:", v50);

  -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  -[_HKMedicalIDData setClinicalContactsModifiedDate:](v4, "setClinicalContactsModifiedDate:", v52);

  -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");
  -[_HKMedicalIDData setMedicalConditions:](v4, "setMedicalConditions:", v54);

  -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copy");
  -[_HKMedicalIDData setMedicalConditionsModifiedDate:](v4, "setMedicalConditionsModifiedDate:", v56);

  -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");
  -[_HKMedicalIDData setMedicalNotes:](v4, "setMedicalNotes:", v58);

  -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "copy");
  -[_HKMedicalIDData setMedicalNotesModifiedDate:](v4, "setMedicalNotesModifiedDate:", v60);

  -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copy");
  -[_HKMedicalIDData setAllergyInfo:](v4, "setAllergyInfo:", v62);

  -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "copy");
  -[_HKMedicalIDData setAllergyInfoModifiedDate:](v4, "setAllergyInfoModifiedDate:", v64);

  -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "copy");
  -[_HKMedicalIDData setMedicationInfo:](v4, "setMedicationInfo:", v66);

  -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "copy");
  -[_HKMedicalIDData setMedicationInfoModifiedDate:](v4, "setMedicationInfoModifiedDate:", v68);

  -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "copy");
  -[_HKMedicalIDData setPregnancyStartDate:](v4, "setPregnancyStartDate:", v70);

  -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");
  -[_HKMedicalIDData setPregnancyStartDateModifiedDate:](v4, "setPregnancyStartDateModifiedDate:", v72);

  -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "copy");
  -[_HKMedicalIDData setPregnancyEstimatedDueDate:](v4, "setPregnancyEstimatedDueDate:", v74);

  -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v75, "copy");
  -[_HKMedicalIDData setPregnancyEstimatedDueDateModifiedDate:](v4, "setPregnancyEstimatedDueDateModifiedDate:", v76);

  -[_HKMedicalIDData medicationsList](self, "medicationsList");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "copy");
  -[_HKMedicalIDData setMedicationsList:](v4, "setMedicationsList:", v78);

  -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v79, "copy");
  -[_HKMedicalIDData setMedicationsListModifiedDate:](v4, "setMedicationsListModifiedDate:", v80);

  -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v81, "copy");
  -[_HKMedicalIDData setMedicationsListVersion:](v4, "setMedicationsListVersion:", v82);

  -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "copy");
  -[_HKMedicalIDData setMedicationsListVersionModifiedDate:](v4, "setMedicationsListVersionModifiedDate:", v84);

  -[_HKMedicalIDData allergiesList](self, "allergiesList");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v85, "copy");
  -[_HKMedicalIDData setAllergiesList:](v4, "setAllergiesList:", v86);

  -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v87, "copy");
  -[_HKMedicalIDData setAllergiesListModifiedDate:](v4, "setAllergiesListModifiedDate:", v88);

  -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v89, "copy");
  -[_HKMedicalIDData setAllergiesListVersion:](v4, "setAllergiesListVersion:", v90);

  -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v91, "copy");
  -[_HKMedicalIDData setAllergiesListVersionModifiedDate:](v4, "setAllergiesListVersionModifiedDate:", v92);

  -[_HKMedicalIDData conditionsList](self, "conditionsList");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v93, "copy");
  -[_HKMedicalIDData setConditionsList:](v4, "setConditionsList:", v94);

  -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v95, "copy");
  -[_HKMedicalIDData setConditionsListModifiedDate:](v4, "setConditionsListModifiedDate:", v96);

  -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend(v97, "copy");
  -[_HKMedicalIDData setConditionsListVersion:](v4, "setConditionsListVersion:", v98);

  -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v99, "copy");
  -[_HKMedicalIDData setConditionsListVersionModifiedDate:](v4, "setConditionsListVersionModifiedDate:", v100);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  _BOOL4 v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  int v65;
  int v66;
  BOOL v67;
  int v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  _BOOL4 v73;
  int64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  int64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  int v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  _BYTE v239[20];
  uint64_t v240;
  _BYTE v241[12];
  _BOOL4 v242;
  uint64_t v243;
  _BOOL4 v244;
  int v245;
  _BOOL4 v246;
  _BOOL4 v247;
  _BOOL4 v248;
  int v249;
  _BOOL4 v250;
  _BOOL4 v251;
  int v252;
  _BOOL4 v253;
  _BOOL4 v254;
  __int128 v255;
  _BOOL4 v256;
  _BOOL4 v257;
  _BOOL4 v258;
  _BOOL4 v259;
  _BOOL4 v260;
  _BOOL4 v261;
  _BOOL4 v262;
  _BOOL4 v263;
  int v264;
  int v265;
  _BOOL4 v266;
  uint64_t v267;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_240;
  }
  -[_HKMedicalIDData pictureData](self, "pictureData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
    goto LABEL_7;
  objc_msgSend(v6, "pictureData");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v210 = 0;
    v242 = 0;
    v245 = 0;
    v240 = 0;
    memset(v241, 0, sizeof(v241));
    v255 = 0uLL;
    v11 = 0;
    v267 = 0;
    memset(v239, 0, sizeof(v239));
    v235 = 0;
    v237 = 0;
    v266 = 0;
    v230 = 0;
    v233 = 0;
    v262 = 0;
    v259 = 0;
    v265 = 0;
    v221 = 0;
    v224 = 0;
    v261 = 0;
    v257 = 0;
    v264 = 0;
    v217 = 0;
    v219 = 0;
    v263 = 0;
    v214 = 0;
    v218 = 0;
    v260 = 0;
    v213 = 0;
    v216 = 0;
    v258 = 0;
    v212 = 0;
    v215 = 0;
    v256 = 0;
    v211 = 0;
    v222 = 0;
    v254 = 0;
    v220 = 0;
    v226 = 0;
    v253 = 0;
    v223 = 0;
    v227 = 0;
    v250 = 0;
    v247 = 0;
    v252 = 0;
    v225 = 0;
    v228 = 0;
    v251 = 0;
    v229 = 0;
    v232 = 0;
    v246 = 0;
    v244 = 0;
    v249 = 0;
    v231 = 0;
    v234 = 0;
    v248 = 0;
    v236 = 0;
    v238 = 0;
    v243 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_89;
  }
  v210 = (void *)v9;
  -[_HKMedicalIDData pictureData](self, "pictureData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureData");
  v207 = v10;
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:"))
  {
LABEL_7:
    -[_HKMedicalIDData name](self, "name");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v209 = (void *)v17;
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v17 != (_QWORD)v208;
    v242 = v7 != v8;
    if ((void *)v17 != v208)
    {
      objc_msgSend(v6, "name");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v205 = 0;
        v240 = 0;
        memset(v241, 0, sizeof(v241));
        *(_QWORD *)((char *)&v255 + 4) = 0;
        LODWORD(v255) = 0;
        v11 = 0;
        v267 = 0;
        memset(v239, 0, sizeof(v239));
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        HIDWORD(v255) = 1;
        goto LABEL_89;
      }
      v205 = (void *)v18;
      -[_HKMedicalIDData name](self, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v202 = v19;
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "isEqualToString:"))
      {
        *(_QWORD *)((char *)&v255 + 4) = 0;
        v240 = 0;
        LODWORD(v255) = 0;
        v11 = 0;
        v267 = 0;
        memset(v239, 0, sizeof(v239));
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        *(_DWORD *)&v241[8] = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        HIDWORD(v255) = 1;
        *(_QWORD *)v241 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData birthdate](self, "birthdate");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "birthdate");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v20 != v21;
    v204 = (void *)v20;
    v203 = (void *)v21;
    HIDWORD(v255) = v3;
    if (v20 != v21)
    {
      objc_msgSend(v6, "birthdate");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        v200 = 0;
        v240 = 0;
        *(_QWORD *)&v255 = 0;
        v11 = 0;
        v267 = 0;
        memset(v239, 0, sizeof(v239));
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        DWORD2(v255) = 1;
        goto LABEL_89;
      }
      v200 = (void *)v23;
      -[_HKMedicalIDData birthdate](self, "birthdate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "birthdate");
      v197 = v24;
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "isEqual:"))
      {
        *(_QWORD *)&v255 = 0;
        v11 = 0;
        v267 = 0;
        memset(v239, 0, sizeof(v239));
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        DWORD2(v255) = 1;
        v240 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData gmtBirthdate](self, "gmtBirthdate");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gmtBirthdate");
    v26 = objc_claimAutoreleasedReturnValue();
    v4 = v25 != v26;
    DWORD2(v255) = v22;
    v199 = (void *)v25;
    v198 = (void *)v26;
    if (v25 != v26)
    {
      objc_msgSend(v6, "gmtBirthdate");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        v195 = 0;
        *(_QWORD *)&v255 = 0x100000000;
        v11 = 0;
        v267 = 0;
        memset(v239, 0, sizeof(v239));
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        v240 = v22 | 0x100000000;
        v12 = 0;
        goto LABEL_89;
      }
      v195 = (void *)v27;
      -[_HKMedicalIDData gmtBirthdate](self, "gmtBirthdate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gmtBirthdate");
      v192 = v28;
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v28, "isEqual:"))
      {
        *(_QWORD *)&v255 = 0x100000000;
        *(_QWORD *)&v239[4] = 0;
        v11 = 0;
        v267 = 0;
        *(_DWORD *)v239 = 0;
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_QWORD *)&v239[12] = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryLanguageCode");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 != (_QWORD)v193;
    DWORD1(v255) = v4;
    v194 = (void *)v29;
    if ((void *)v29 != v193)
    {
      objc_msgSend(v6, "primaryLanguageCode");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v190 = 0;
        *(_QWORD *)&v239[4] = 0;
        v11 = 0;
        v267 = 0;
        *(_DWORD *)v239 = 0;
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[12] = v4;
        LODWORD(v255) = 1;
        goto LABEL_89;
      }
      v190 = (void *)v31;
      -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "primaryLanguageCode");
      v187 = v32;
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "isEqualToString:"))
      {
        v11 = 0;
        v267 = 0;
        *(_QWORD *)v239 = 0;
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[12] = v4;
        LODWORD(v255) = 1;
        *(_DWORD *)&v239[8] = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData height](self, "height");
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "height");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v33;
    v188 = (void *)v34;
    v36 = v33 == v34;
    v37 = v33 != v34;
    LODWORD(v255) = v30;
    v189 = v35;
    if (v36)
    {
      HIDWORD(v267) = v37;
    }
    else
    {
      objc_msgSend(v6, "height");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        v185 = 0;
        *(_QWORD *)v239 = 0;
        v267 = 0x100000000;
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        goto LABEL_89;
      }
      HIDWORD(v267) = v37;
      v185 = (void *)v38;
      -[_HKMedicalIDData height](self, "height");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "height");
      v182 = v39;
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v39, "isEqual:"))
      {
        v267 = 0x100000000;
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        *(_QWORD *)v239 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData weight](self, "weight");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "weight");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v267) = v40 != (_QWORD)v183;
    v184 = (void *)v40;
    if ((void *)v40 != v183)
    {
      objc_msgSend(v6, "weight");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        v180 = 0;
        v235 = 0;
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        LODWORD(v267) = 1;
        goto LABEL_89;
      }
      v180 = (void *)v41;
      -[_HKMedicalIDData weight](self, "weight");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "weight");
      v177 = v42;
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v42, "isEqual:"))
      {
        v237 = 0;
        v266 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        LODWORD(v267) = 1;
        v235 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isOrganDonor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = v43 != (_QWORD)v178;
    v179 = (void *)v43;
    if ((void *)v43 != v178)
    {
      objc_msgSend(v6, "isOrganDonor");
      v44 = objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        v175 = 0;
        v230 = 0;
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v266 = 1;
        goto LABEL_89;
      }
      v175 = (void *)v44;
      -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isOrganDonor");
      v172 = v45;
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v45, "isEqual:"))
      {
        v233 = 0;
        v262 = 0;
        v259 = 0;
        v265 = 0;
        v221 = 0;
        v224 = 0;
        v261 = 0;
        v257 = 0;
        v264 = 0;
        v217 = 0;
        v219 = 0;
        v263 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v266 = 1;
        v230 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emergencyContacts");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = v46 != (_QWORD)v173;
    v174 = (void *)v46;
    if ((void *)v46 == v173)
    {
      v259 = 0;
      v265 = 0;
    }
    else
    {
      objc_msgSend(v6, "emergencyContacts");
      v47 = objc_claimAutoreleasedReturnValue();
      v259 = v47 != 0;
      v168 = (void *)v47;
      if (v47
        && (-[_HKMedicalIDData emergencyContacts](self, "emergencyContacts"),
            v48 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "emergencyContacts"),
            v163 = v48,
            v162 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v48, "isEqual:") & 1) != 0))
      {
        v265 = 0;
        v259 = 1;
      }
      else
      {
        -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v167, "count"))
        {
          v221 = 0;
          v224 = 0;
          v261 = 0;
          v257 = 0;
          v264 = 0;
          v217 = 0;
          v219 = 0;
          v263 = 0;
          v214 = 0;
          v218 = 0;
          v260 = 0;
          v213 = 0;
          v216 = 0;
          v258 = 0;
          v212 = 0;
          v215 = 0;
          v256 = 0;
          v211 = 0;
          v222 = 0;
          v254 = 0;
          v220 = 0;
          v226 = 0;
          v253 = 0;
          v223 = 0;
          v227 = 0;
          v250 = 0;
          v247 = 0;
          v252 = 0;
          v225 = 0;
          v228 = 0;
          v251 = 0;
          v229 = 0;
          v232 = 0;
          v246 = 0;
          v244 = 0;
          v249 = 0;
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          v243 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v245 = 1;
          *(_QWORD *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          v240 = v22 | 0x100000000;
          v12 = 0;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v262 = 1;
          v265 = 1;
          goto LABEL_89;
        }
        objc_msgSend(v6, "emergencyContacts");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v155, "count"))
        {
          v245 = 1;
          v224 = 0;
          v261 = 0;
          v257 = 0;
          v264 = 0;
          v217 = 0;
          v219 = 0;
          v263 = 0;
          v214 = 0;
          v218 = 0;
          v260 = 0;
          v213 = 0;
          v216 = 0;
          v258 = 0;
          v212 = 0;
          v215 = 0;
          v256 = 0;
          v211 = 0;
          v222 = 0;
          v254 = 0;
          v220 = 0;
          v226 = 0;
          v253 = 0;
          v223 = 0;
          v227 = 0;
          v250 = 0;
          v247 = 0;
          v252 = 0;
          v225 = 0;
          v228 = 0;
          v251 = 0;
          v229 = 0;
          v232 = 0;
          v246 = 0;
          v244 = 0;
          v249 = 0;
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          v243 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          v240 = v22 | 0x100000000;
          v12 = 0;
          *(_QWORD *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v262 = 1;
          v265 = 1;
          v221 = 1;
          goto LABEL_89;
        }
        v265 = 1;
      }
    }
    -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clinicalContacts");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = v49 != (_QWORD)v169;
    v170 = (void *)v49;
    if ((void *)v49 == v169)
    {
      v257 = 0;
      v264 = 0;
    }
    else
    {
      objc_msgSend(v6, "clinicalContacts");
      v50 = objc_claimAutoreleasedReturnValue();
      v257 = v50 != 0;
      v164 = (void *)v50;
      if (v50
        && (-[_HKMedicalIDData clinicalContacts](self, "clinicalContacts"),
            v51 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "clinicalContacts"),
            v159 = v51,
            v158 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v51, "isEqual:") & 1) != 0))
      {
        v264 = 0;
        v257 = 1;
      }
      else
      {
        -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v161, "count"))
        {
          v217 = 0;
          v219 = 0;
          v263 = 0;
          v214 = 0;
          v218 = 0;
          v260 = 0;
          v213 = 0;
          v216 = 0;
          v258 = 0;
          v212 = 0;
          v215 = 0;
          v256 = 0;
          v211 = 0;
          v222 = 0;
          v254 = 0;
          v220 = 0;
          v226 = 0;
          v253 = 0;
          v223 = 0;
          v227 = 0;
          v250 = 0;
          v247 = 0;
          v252 = 0;
          v225 = 0;
          v228 = 0;
          v251 = 0;
          v229 = 0;
          v232 = 0;
          v246 = 0;
          v244 = 0;
          v249 = 0;
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          v243 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v245 = 1;
          *(_QWORD *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          v240 = v22 | 0x100000000;
          v12 = 0;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v261 = 1;
          v264 = 1;
          goto LABEL_89;
        }
        objc_msgSend(v6, "clinicalContacts");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v149, "count"))
        {
          v245 = 1;
          v219 = 0;
          v263 = 0;
          v214 = 0;
          v218 = 0;
          v260 = 0;
          v213 = 0;
          v216 = 0;
          v258 = 0;
          v212 = 0;
          v215 = 0;
          v256 = 0;
          v211 = 0;
          v222 = 0;
          v254 = 0;
          v220 = 0;
          v226 = 0;
          v253 = 0;
          v223 = 0;
          v227 = 0;
          v250 = 0;
          v247 = 0;
          v252 = 0;
          v225 = 0;
          v228 = 0;
          v251 = 0;
          v229 = 0;
          v232 = 0;
          v246 = 0;
          v244 = 0;
          v249 = 0;
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          v243 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          v240 = v22 | 0x100000000;
          v12 = 0;
          *(_QWORD *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v261 = 1;
          v264 = 1;
          v217 = 1;
          goto LABEL_89;
        }
        v264 = 1;
      }
    }
    -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicalConditions");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v263 = v52 != (_QWORD)v165;
    v166 = (void *)v52;
    if ((void *)v52 != v165)
    {
      objc_msgSend(v6, "medicalConditions");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!v53)
      {
        v160 = 0;
        v214 = 0;
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v263 = 1;
        goto LABEL_89;
      }
      v160 = (void *)v53;
      -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "medicalConditions");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = v54;
      if (!objc_msgSend(v54, "isEqualToString:"))
      {
        v218 = 0;
        v260 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v263 = 1;
        v214 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
    v55 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicalNotes");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = v55 != (_QWORD)v156;
    v157 = (void *)v55;
    if ((void *)v55 != v156)
    {
      objc_msgSend(v6, "medicalNotes");
      v56 = objc_claimAutoreleasedReturnValue();
      if (!v56)
      {
        v152 = 0;
        v213 = 0;
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v260 = 1;
        goto LABEL_89;
      }
      v152 = (void *)v56;
      -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "medicalNotes");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v57;
      if (!objc_msgSend(v57, "isEqualToString:"))
      {
        v216 = 0;
        v258 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v260 = 1;
        v213 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allergyInfo");
    v59 = objc_claimAutoreleasedReturnValue();
    v258 = v58 != v59;
    v150 = (void *)v59;
    v151 = (void *)v58;
    if (v58 != v59)
    {
      objc_msgSend(v6, "allergyInfo");
      v60 = objc_claimAutoreleasedReturnValue();
      if (!v60)
      {
        v146 = 0;
        v212 = 0;
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v258 = 1;
        goto LABEL_89;
      }
      v146 = (void *)v60;
      -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allergyInfo");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = v61;
      if (!objc_msgSend(v61, "isEqualToString:"))
      {
        v215 = 0;
        v256 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v258 = 1;
        v212 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicationInfo");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = v62 != (_QWORD)v144;
    v145 = (void *)v62;
    if ((void *)v62 != v144)
    {
      objc_msgSend(v6, "medicationInfo");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v143)
      {
        v143 = 0;
        v211 = 0;
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v256 = 1;
        goto LABEL_89;
      }
      -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "medicationInfo");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = v63;
      if (!objc_msgSend(v63, "isEqualToString:"))
      {
        v222 = 0;
        v254 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v243 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_QWORD *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        v240 = v22 | 0x100000000;
        v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        v11 = 1;
        v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v256 = 1;
        v64 = 1;
LABEL_87:
        v211 = v64;
        goto LABEL_89;
      }
    }
    v65 = -[_HKMedicalIDData isDisabled](self, "isDisabled");
    if (v65 != objc_msgSend(v6, "isDisabled")
      || (v66 = -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency"),
          v66 != objc_msgSend(v6, "shareDuringEmergency")))
    {
      v222 = 0;
      v254 = 0;
      v220 = 0;
      v226 = 0;
      v253 = 0;
      v223 = 0;
      v227 = 0;
      v250 = 0;
      v247 = 0;
      v252 = 0;
      v225 = 0;
      v228 = 0;
      v251 = 0;
      v229 = 0;
      v232 = 0;
      v246 = 0;
      v244 = 0;
      v249 = 0;
      v231 = 0;
      v234 = 0;
      v248 = 0;
      v236 = 0;
      v238 = 0;
      v243 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v245 = 1;
      *(_DWORD *)v241 = v3;
      *(_QWORD *)&v241[4] = 1;
      *(_DWORD *)&v239[16] = 1;
      v240 = v22 | 0x100000000;
      v12 = 0;
      *(_DWORD *)&v239[8] = v30;
      *(_DWORD *)&v239[12] = v4;
LABEL_86:
      v11 = 1;
      *(_DWORD *)v239 = HIDWORD(v267);
      *(_DWORD *)&v239[4] = 1;
      v235 = v267;
      v237 = 1;
      v230 = v266;
      v233 = 1;
      v221 = v265;
      v224 = 1;
      v217 = v264;
      v219 = 1;
      v214 = v263;
      v218 = 1;
      v213 = v260;
      v216 = 1;
      v212 = v258;
      v215 = 1;
      v64 = v256;
      goto LABEL_87;
    }
    v75 = -[_HKMedicalIDData bloodType](self, "bloodType");
    if (v75 != objc_msgSend(v6, "bloodType"))
    {
      v222 = 0;
      v254 = 0;
      v220 = 0;
      v226 = 0;
      v253 = 0;
      v223 = 0;
      v227 = 0;
      v250 = 0;
      v247 = 0;
      v252 = 0;
      v225 = 0;
      v228 = 0;
      v251 = 0;
      v229 = 0;
      v232 = 0;
      v246 = 0;
      v244 = 0;
      v249 = 0;
      v231 = 0;
      v234 = 0;
      v248 = 0;
      v236 = 0;
      v238 = 0;
      v243 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v245 = 1;
      *(_DWORD *)&v241[4] = 1;
      *(_DWORD *)&v241[8] = 0;
      v240 = DWORD2(v255) | 0x100000000;
      *(_DWORD *)v241 = v3;
      *(_DWORD *)&v239[16] = 1;
      *(_QWORD *)&v239[8] = v255;
      goto LABEL_86;
    }
    -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
    v76 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pregnancyStartDate");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (void *)v76;
    v254 = v76 != (_QWORD)v137;
    if ((void *)v76 != v137)
    {
      objc_msgSend(v6, "pregnancyStartDate");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v136)
      {
        v136 = 0;
        v220 = 0;
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v254 = 1;
        goto LABEL_89;
      }
      -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pregnancyStartDate");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = v77;
      if (!objc_msgSend(v77, "isEqual:"))
      {
        v226 = 0;
        v253 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v254 = 1;
        v220 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
    v78 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pregnancyEstimatedDueDate");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = (void *)v78;
    v253 = v78 != (_QWORD)v134;
    if ((void *)v78 != v134)
    {
      objc_msgSend(v6, "pregnancyEstimatedDueDate");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v133)
      {
        v133 = 0;
        v223 = 0;
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v253 = 1;
        goto LABEL_89;
      }
      -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pregnancyEstimatedDueDate");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v79;
      if (!objc_msgSend(v79, "isEqual:"))
      {
        v227 = 0;
        v250 = 0;
        v247 = 0;
        v252 = 0;
        v225 = 0;
        v228 = 0;
        v251 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v253 = 1;
        v223 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData medicationsList](self, "medicationsList");
    v80 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicationsList");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = (void *)v80;
    v250 = v80 != (_QWORD)v129;
    if ((void *)v80 == v129)
    {
      v247 = 0;
      v252 = 0;
    }
    else
    {
      objc_msgSend(v6, "medicationsList");
      v81 = objc_claimAutoreleasedReturnValue();
      v247 = v81 != 0;
      v124 = (void *)v81;
      if (v81
        && (-[_HKMedicalIDData medicationsList](self, "medicationsList"),
            v82 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "medicationsList"),
            v120 = (void *)objc_claimAutoreleasedReturnValue(),
            v121 = v82,
            (objc_msgSend(v82, "isEqual:") & 1) != 0))
      {
        v252 = 0;
        v247 = 1;
      }
      else
      {
        -[_HKMedicalIDData medicationsList](self, "medicationsList");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v122, "count"))
        {
          v225 = 0;
          v228 = 0;
          v251 = 0;
          v229 = 0;
          v232 = 0;
          v246 = 0;
          v244 = 0;
          v249 = 0;
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          v243 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v245 = 1;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_QWORD *)&v239[8] = v255;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v217 = v264;
          v219 = 1;
          v214 = v263;
          v218 = 1;
          v213 = v260;
          v216 = 1;
          v212 = v258;
          v215 = 1;
          v211 = v256;
          v222 = 1;
          v220 = v254;
          v226 = 1;
          v223 = v253;
          v227 = 1;
          v250 = 1;
          v252 = 1;
          goto LABEL_89;
        }
        objc_msgSend(v6, "medicationsList");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = 1;
        if (objc_msgSend(v111, "count"))
        {
          v228 = 0;
          v251 = 0;
          v229 = 0;
          v232 = 0;
          v246 = 0;
          v244 = 0;
          v249 = 0;
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          v243 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_QWORD *)&v239[8] = v255;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v217 = v264;
          v219 = 1;
          v214 = v263;
          v218 = 1;
          v213 = v260;
          v216 = 1;
          v212 = v258;
          v215 = 1;
          v211 = v256;
          v222 = 1;
          v220 = v254;
          v226 = 1;
          v223 = v253;
          v227 = 1;
          v250 = 1;
          v252 = 1;
          v225 = 1;
          goto LABEL_89;
        }
        v252 = 1;
      }
    }
    -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
    v83 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicationsListVersion");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = (void *)v83;
    v251 = v83 != (_QWORD)v125;
    if ((void *)v83 != v125)
    {
      objc_msgSend(v6, "medicationsListVersion");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v123)
      {
        v123 = 0;
        v229 = 0;
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v223 = v253;
        v227 = 1;
        v225 = v252;
        v228 = 1;
        v251 = 1;
        goto LABEL_89;
      }
      -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "medicationsListVersion");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v84;
      if (!objc_msgSend(v84, "isEqual:"))
      {
        v232 = 0;
        v246 = 0;
        v244 = 0;
        v249 = 0;
        v231 = 0;
        v234 = 0;
        v248 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v223 = v253;
        v227 = 1;
        v225 = v252;
        v228 = 1;
        v251 = 1;
        v229 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData allergiesList](self, "allergiesList");
    v85 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allergiesList");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (void *)v85;
    v246 = v85 != (_QWORD)v118;
    if ((void *)v85 == v118)
    {
      v244 = 0;
      v249 = 0;
    }
    else
    {
      objc_msgSend(v6, "allergiesList");
      v86 = objc_claimAutoreleasedReturnValue();
      v244 = v86 != 0;
      v113 = (void *)v86;
      if (v86
        && (-[_HKMedicalIDData allergiesList](self, "allergiesList"),
            v87 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "allergiesList"),
            v108 = (void *)objc_claimAutoreleasedReturnValue(),
            v109 = v87,
            (objc_msgSend(v87, "isEqual:") & 1) != 0))
      {
        v249 = 0;
        v244 = 1;
      }
      else
      {
        -[_HKMedicalIDData allergiesList](self, "allergiesList");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v110, "count"))
        {
          v231 = 0;
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          v243 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v245 = 1;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_QWORD *)&v239[8] = v255;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v217 = v264;
          v219 = 1;
          v214 = v263;
          v218 = 1;
          v213 = v260;
          v216 = 1;
          v212 = v258;
          v215 = 1;
          v211 = v256;
          v222 = 1;
          v220 = v254;
          v226 = 1;
          v223 = v253;
          v227 = 1;
          v225 = v252;
          v228 = 1;
          v229 = v251;
          v232 = 1;
          v246 = 1;
          v249 = 1;
          goto LABEL_89;
        }
        objc_msgSend(v6, "allergiesList");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = 1;
        if (objc_msgSend(v99, "count"))
        {
          v234 = 0;
          v248 = 0;
          v236 = 0;
          v238 = 0;
          v243 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_QWORD *)&v239[8] = v255;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v217 = v264;
          v219 = 1;
          v214 = v263;
          v218 = 1;
          v213 = v260;
          v216 = 1;
          v212 = v258;
          v215 = 1;
          v211 = v256;
          v222 = 1;
          v220 = v254;
          v226 = 1;
          v223 = v253;
          v227 = 1;
          v225 = v252;
          v228 = 1;
          v229 = v251;
          v232 = 1;
          v246 = 1;
          v249 = 1;
          v231 = 1;
          goto LABEL_89;
        }
        v249 = 1;
      }
    }
    -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
    v88 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allergiesListVersion");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (void *)v88;
    v248 = v88 != (_QWORD)v114;
    if ((void *)v88 != v114)
    {
      objc_msgSend(v6, "allergiesListVersion");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v112)
      {
        v112 = 0;
        v236 = 0;
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v223 = v253;
        v227 = 1;
        v225 = v252;
        v228 = 1;
        v229 = v251;
        v232 = 1;
        v231 = v249;
        v234 = 1;
        v248 = 1;
        goto LABEL_89;
      }
      -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allergiesListVersion");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v89;
      if (!objc_msgSend(v89, "isEqual:"))
      {
        v238 = 0;
        v243 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v223 = v253;
        v227 = 1;
        v225 = v252;
        v228 = 1;
        v229 = v251;
        v232 = 1;
        v231 = v249;
        v234 = 1;
        v248 = 1;
        v236 = 1;
        goto LABEL_89;
      }
    }
    -[_HKMedicalIDData conditionsList](self, "conditionsList");
    v90 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conditionsList");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)v90;
    LODWORD(v243) = v90 != (_QWORD)v106;
    if ((void *)v90 == v106)
    {
      *(_DWORD *)&v241[8] = 0;
      HIDWORD(v243) = 0;
    }
    else
    {
      objc_msgSend(v6, "conditionsList");
      v91 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v241[8] = v91 != 0;
      v103 = (void *)v91;
      if (v91
        && (-[_HKMedicalIDData conditionsList](self, "conditionsList"),
            v92 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "conditionsList"),
            v96 = (void *)objc_claimAutoreleasedReturnValue(),
            v97 = v92,
            (objc_msgSend(v92, "isEqual:") & 1) != 0))
      {
        HIDWORD(v243) = 0;
        *(_DWORD *)&v241[8] = 1;
      }
      else
      {
        -[_HKMedicalIDData conditionsList](self, "conditionsList");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v98, "count"))
        {
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v245 = 1;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v241[4] = 1;
          v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)&v239[12] = v4;
          *(_DWORD *)&v239[16] = 1;
          v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_DWORD *)&v239[8] = v255;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v217 = v264;
          v219 = 1;
          v214 = v263;
          v218 = 1;
          v213 = v260;
          v216 = 1;
          v212 = v258;
          v215 = 1;
          v211 = v256;
          v222 = 1;
          v220 = v254;
          v226 = 1;
          v223 = v253;
          v227 = 1;
          v225 = v252;
          v228 = 1;
          v229 = v251;
          v232 = 1;
          v231 = v249;
          v234 = 1;
          v236 = v248;
          v238 = 1;
          v243 = 0x100000001;
          goto LABEL_89;
        }
        objc_msgSend(v6, "conditionsList");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = 1;
        if (objc_msgSend(v95, "count"))
        {
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v241[4] = 1;
          v240 = v22 | 0x100000000;
          *(_DWORD *)&v239[16] = 1;
          v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_QWORD *)&v239[8] = v255;
          v235 = v267;
          v237 = 1;
          v230 = v266;
          v233 = 1;
          v221 = v265;
          v224 = 1;
          v217 = v264;
          v219 = 1;
          v214 = v263;
          v218 = 1;
          v213 = v260;
          v216 = 1;
          v212 = v258;
          v215 = 1;
          v211 = v256;
          v222 = 1;
          v220 = v254;
          v226 = 1;
          v223 = v253;
          v227 = 1;
          v225 = v252;
          v228 = 1;
          v229 = v251;
          v232 = 1;
          v231 = v249;
          v234 = 1;
          v236 = v248;
          v238 = 1;
          v243 = 0x100000001;
          v12 = 1;
          goto LABEL_89;
        }
        HIDWORD(v243) = 1;
      }
    }
    -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
    v93 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conditionsListVersion");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)v93;
    if ((void *)v93 != v101)
    {
      objc_msgSend(v6, "conditionsListVersion");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v100)
      {
        v100 = 0;
        v15 = 0;
        v16 = 0;
        v245 = 1;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v241[4] = 1;
        v240 = v22 | 0x100000000;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v223 = v253;
        v227 = 1;
        v225 = v252;
        v228 = 1;
        v229 = v251;
        v232 = 1;
        v231 = v249;
        v234 = 1;
        v236 = v248;
        v238 = 1;
        v12 = HIDWORD(v243);
        v13 = 1;
        goto LABEL_298;
      }
      -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "conditionsListVersion");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend((id)v4, "isEqual:", v3))
      {
        v16 = 0;
        v245 = 1;
        *(_DWORD *)v241 = HIDWORD(v255);
        *(_DWORD *)&v241[4] = 1;
        v240 = v22 | 0x100000000;
        *(_DWORD *)&v239[16] = 1;
        v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(_QWORD *)&v239[8] = v255;
        v235 = v267;
        v237 = 1;
        v230 = v266;
        v233 = 1;
        v221 = v265;
        v224 = 1;
        v217 = v264;
        v219 = 1;
        v214 = v263;
        v218 = 1;
        v213 = v260;
        v216 = 1;
        v212 = v258;
        v215 = 1;
        v211 = v256;
        v222 = 1;
        v220 = v254;
        v226 = 1;
        v223 = v253;
        v227 = 1;
        v225 = v252;
        v228 = 1;
        v229 = v251;
        v232 = 1;
        v231 = v249;
        v234 = 1;
        v236 = v248;
        v15 = 1;
        v238 = 1;
        v12 = HIDWORD(v243);
        v13 = 1;
LABEL_298:
        v14 = 1;
        goto LABEL_89;
      }
    }
    v94 = -[_HKMedicalIDData schemaVersion](self, "schemaVersion");
    v16 = v94 == objc_msgSend(v6, "schemaVersion");
    v245 = 1;
    *(_DWORD *)v241 = HIDWORD(v255);
    *(_DWORD *)&v241[4] = 1;
    v240 = v22 | 0x100000000;
    *(_DWORD *)&v239[16] = 1;
    v11 = 1;
    *(_DWORD *)v239 = HIDWORD(v267);
    *(_DWORD *)&v239[4] = 1;
    *(_QWORD *)&v239[8] = v255;
    v235 = v267;
    v237 = 1;
    v230 = v266;
    v233 = 1;
    v221 = v265;
    v224 = 1;
    v217 = v264;
    v219 = 1;
    v214 = v263;
    v218 = 1;
    v213 = v260;
    v216 = 1;
    v212 = v258;
    v215 = 1;
    v211 = v256;
    v222 = 1;
    v220 = v254;
    v226 = 1;
    v223 = v253;
    v227 = 1;
    v225 = v252;
    v228 = 1;
    v229 = v251;
    v232 = 1;
    v231 = v249;
    v234 = 1;
    v236 = v248;
    v238 = 1;
    v12 = HIDWORD(v243);
    v13 = 1;
    v14 = v93 != (_QWORD)v101;
    v15 = v14;
    goto LABEL_89;
  }
  v245 = 0;
  v240 = 0;
  memset(v241, 0, sizeof(v241));
  v255 = 0uLL;
  v11 = 0;
  v267 = 0;
  memset(v239, 0, sizeof(v239));
  v235 = 0;
  v237 = 0;
  v266 = 0;
  v230 = 0;
  v233 = 0;
  v262 = 0;
  v259 = 0;
  v265 = 0;
  v221 = 0;
  v224 = 0;
  v261 = 0;
  v257 = 0;
  v264 = 0;
  v217 = 0;
  v219 = 0;
  v263 = 0;
  v214 = 0;
  v218 = 0;
  v260 = 0;
  v213 = 0;
  v216 = 0;
  v258 = 0;
  v212 = 0;
  v215 = 0;
  v256 = 0;
  v211 = 0;
  v222 = 0;
  v254 = 0;
  v220 = 0;
  v226 = 0;
  v253 = 0;
  v223 = 0;
  v227 = 0;
  v250 = 0;
  v247 = 0;
  v252 = 0;
  v225 = 0;
  v228 = 0;
  v251 = 0;
  v229 = 0;
  v232 = 0;
  v246 = 0;
  v244 = 0;
  v249 = 0;
  v231 = 0;
  v234 = 0;
  v248 = 0;
  v236 = 0;
  v238 = 0;
  v243 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v242 = 1;
LABEL_89:
  if (v15)
  {
    v67 = v16;
    v68 = v12;
    v69 = v13;
    v70 = v8;
    v71 = v7;
    v72 = v11;
    v73 = v14;

    v14 = v73;
    v11 = v72;
    v7 = v71;
    v8 = v70;
    v13 = v69;
    v12 = v68;
    v16 = v67;
  }
  if (v14)

  if (v13)
  {

  }
  if (v12)

  if (HIDWORD(v243))
  if (*(_DWORD *)&v241[8])
  {

  }
  if ((_DWORD)v243)

  if (v238)
  {

  }
  if (v236)
  {

  }
  if (v248)

  if (v234)
  {

  }
  if (v231)

  if (v249)
  if (v244)
  {

  }
  if (v246)

  if (v232)
  {

  }
  if (v229)
  {

  }
  if (v251)

  if (v228)
  {

  }
  if (v225)

  if (v252)
  if (v247)
  {

  }
  if (v250)

  if (v227)
  {

  }
  if (v223)
  {

  }
  if (v253)

  if (v226)
  {

  }
  if (v220)
  {

  }
  if (v254)

  if (v222)
  {

  }
  if (v211)
  {

  }
  if (v256)

  if (v215)
  {

  }
  if (v212)
  {

  }
  if (v258)

  if (v216)
  {

  }
  if (v213)
  {

  }
  if (v260)

  if (v218)
  {

  }
  if (v214)
  {

  }
  if (v263)

  if (v219)
  {

  }
  if (v217)

  if (v264)
  if (v257)
  {

  }
  if (v261)

  if (v224)
  {

  }
  if (v221)

  if (v265)
  if (v259)
  {

  }
  if (v262)

  if (v233)
  {

  }
  if (v230)
  {

  }
  if (v266)

  if (v237)
  {

  }
  if (v235)
  {

  }
  if ((_DWORD)v267)

  if (*(_DWORD *)&v239[4])
  {

  }
  if (*(_DWORD *)v239)
  {

  }
  if (HIDWORD(v267))

  if (v11)
  {

  }
  if (*(_DWORD *)&v239[8])
  {

  }
  if ((_DWORD)v255)

  if (*(_DWORD *)&v239[16])
  {

  }
  if (*(_DWORD *)&v239[12])
  {

  }
  if (DWORD1(v255))

  if (HIDWORD(v240))
  {

  }
  if ((_DWORD)v240)
  {

  }
  if (DWORD2(v255))

  if (*(_DWORD *)&v241[4])
  {

  }
  if (*(_DWORD *)v241)
  {

  }
  if (HIDWORD(v255))

  if (v245)
  {

  }
  if (v242)
  {

  }
  if (v7 != v8)

LABEL_240:
  return v16;
}

- (BOOL)isEqualToSyncedData:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  char v22;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  BOOL v76;
  _BOOL4 v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  int v106;
  int v107;
  int v108;
  int64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  int v256;
  int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  int v262;
  int v263;
  int v264;
  int v265;
  int v266;
  int v267;
  int v268;
  int v269;
  int v270;
  uint64_t v271;
  int v272;
  int v273;
  int v274;
  int v275;
  int v276;
  int v277;
  _QWORD v278[3];
  int v279;
  uint64_t v280;
  _BOOL4 v281;
  _BOOL4 v282;
  _BOOL4 v283;
  _BOOL4 v284;
  _BOOL4 v285;
  _BOOL4 v286;
  int v287;
  int v288;
  int v289;
  int v290;
  _BOOL4 v291;
  uint64_t v292;
  _BOOL4 v293;
  _BOOL4 v294;
  _BOOL4 v295;
  _BOOL4 v296;
  _BOOL4 v297;
  _BOOL4 v298;
  __int128 v299;

  v7 = a3;
  -[_HKMedicalIDData pictureData](self, "pictureData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pictureData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 != v9;
  if (v8 != v9)
  {
    objc_msgSend(v7, "pictureData");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v238 = 0;
      v285 = 0;
      v289 = 0;
      v292 = 0;
      v299 = 0uLL;
      memset(v278, 0, sizeof(v278));
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_15;
    }
    v238 = (void *)v11;
    -[_HKMedicalIDData pictureData](self, "pictureData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pictureData");
    v234 = v12;
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqual:"))
    {
      v289 = 0;
      v292 = 0;
      v299 = 0uLL;
      memset(v278, 0, sizeof(v278));
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v285 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 != v4;
  v285 = v8 != v9;
  v237 = v3;
  v236 = v4;
  if (v3 != v4)
  {
    objc_msgSend(v7, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v232 = 0;
      v292 = 0x100000000;
      v299 = 0uLL;
      memset(v278, 0, sizeof(v278));
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      goto LABEL_15;
    }
    v232 = (void *)v15;
    -[_HKMedicalIDData name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v229 = v16;
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isEqualToString:"))
    {
      v292 = 0x100000000;
      v299 = 0uLL;
      memset(v278, 0, 20);
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      HIDWORD(v278[2]) = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData birthdate](self, "birthdate");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "birthdate");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 != (_QWORD)v230;
  HIDWORD(v292) = v3 != v4;
  v231 = (void *)v17;
  if ((void *)v17 != v230)
  {
    objc_msgSend(v7, "birthdate");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v227 = 0;
      v278[0] = 0;
      v278[1] = 0;
      v299 = 0uLL;
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v292) = 1;
      goto LABEL_15;
    }
    v227 = (void *)v19;
    -[_HKMedicalIDData birthdate](self, "birthdate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "birthdate");
    v224 = v20;
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isEqual:"))
    {
      *(_QWORD *)((char *)v278 + 4) = 0;
      v299 = 0uLL;
      LODWORD(v278[0]) = 0;
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v292) = 1;
      HIDWORD(v278[1]) = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData gmtBirthdate](self, "gmtBirthdate");
  v73 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gmtBirthdate");
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v73;
  v225 = (void *)v74;
  v76 = v73 == v74;
  v77 = v73 != v74;
  LODWORD(v292) = v18;
  v226 = v75;
  if (v76)
  {
    HIDWORD(v299) = v77;
  }
  else
  {
    objc_msgSend(v7, "gmtBirthdate");
    v78 = objc_claimAutoreleasedReturnValue();
    if (!v78)
    {
      v222 = 0;
      v278[0] = 0;
      *(_QWORD *)((char *)&v299 + 4) = 0;
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      LODWORD(v299) = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v299) = 1;
      goto LABEL_15;
    }
    HIDWORD(v299) = v77;
    v79 = v9;
    v80 = v8;
    v222 = (void *)v78;
    -[_HKMedicalIDData gmtBirthdate](self, "gmtBirthdate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gmtBirthdate");
    v219 = v81;
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v81, "isEqual:"))
    {
      v278[0] = 0x100000000;
      *(_QWORD *)((char *)&v299 + 4) = 0;
      v276 = 0;
      v274 = 0;
      v272 = 0;
      v270 = 0;
      LODWORD(v299) = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v277 = 0;
      v273 = 0;
      v275 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v299) = 1;
      v21 = 1;
      v8 = v80;
      v9 = v79;
      v13 = 0;
      goto LABEL_17;
    }
    v8 = v80;
    v9 = v79;
  }
  -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
  v82 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryLanguageCode");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD2(v299) = v82 != (_QWORD)v220;
  v221 = (void *)v82;
  if ((void *)v82 != v220)
  {
    objc_msgSend(v7, "primaryLanguageCode");
    v83 = objc_claimAutoreleasedReturnValue();
    if (!v83)
    {
      v235 = 0;
      v276 = 0;
      v274 = 0;
      *(_QWORD *)&v299 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v275 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      DWORD2(v299) = 1;
      goto LABEL_15;
    }
    v235 = (void *)v83;
    -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryLanguageCode");
    v215 = v84;
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v84, "isEqualToString:"))
    {
      v274 = 0;
      *(_QWORD *)&v299 = 0;
      v272 = 0;
      v270 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      DWORD2(v299) = 1;
      v275 = 0;
      v276 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData height](self, "height");
  v85 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "height");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD1(v299) = v85 != (_QWORD)v216;
  v217 = (void *)v85;
  if ((void *)v85 != v216)
  {
    objc_msgSend(v7, "height");
    v86 = objc_claimAutoreleasedReturnValue();
    if (!v86)
    {
      v213 = 0;
      v272 = 0;
      v270 = 0;
      *(_QWORD *)&v299 = 0x100000000;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      goto LABEL_15;
    }
    v213 = (void *)v86;
    -[_HKMedicalIDData height](self, "height");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "height");
    v210 = v87;
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v87, "isEqual:"))
    {
      v270 = 0;
      *(_QWORD *)&v299 = 0x100000000;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData weight](self, "weight");
  v88 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "weight");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v299) = v88 != (_QWORD)v211;
  v212 = (void *)v88;
  if ((void *)v88 != v211)
  {
    objc_msgSend(v7, "weight");
    v89 = objc_claimAutoreleasedReturnValue();
    if (!v89)
    {
      v208 = 0;
      v268 = 0;
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      LODWORD(v299) = 1;
      goto LABEL_15;
    }
    v208 = (void *)v89;
    -[_HKMedicalIDData weight](self, "weight");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "weight");
    v205 = v90;
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v90, "isEqual:", v204))
    {
      v266 = 0;
      v298 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      LODWORD(v299) = 1;
      v268 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
  v91 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isOrganDonor");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v298 = v91 != (_QWORD)v206;
  v207 = (void *)v91;
  if ((void *)v91 != v206)
  {
    objc_msgSend(v7, "isOrganDonor");
    v92 = objc_claimAutoreleasedReturnValue();
    if (!v92)
    {
      v203 = 0;
      v264 = 0;
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v298 = 1;
      goto LABEL_15;
    }
    v203 = (void *)v92;
    -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isOrganDonor");
    v200 = v93;
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v93, "isEqual:", v199))
    {
      v261 = 0;
      v297 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v298 = 1;
      v264 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
  v94 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicalConditions");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v297 = v94 != (_QWORD)v201;
  v202 = (void *)v94;
  if ((void *)v94 != v201)
  {
    objc_msgSend(v7, "medicalConditions");
    v95 = objc_claimAutoreleasedReturnValue();
    if (!v95)
    {
      v198 = 0;
      v258 = 0;
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v297 = 1;
      goto LABEL_15;
    }
    v198 = (void *)v95;
    -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicalConditions");
    v195 = v96;
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v96, "isEqualToString:", v194))
    {
      v256 = 0;
      v296 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v297 = 1;
      v258 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
  v97 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicalNotes");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v296 = v97 != (_QWORD)v196;
  v197 = (void *)v97;
  if ((void *)v97 != v196)
  {
    objc_msgSend(v7, "medicalNotes");
    v98 = objc_claimAutoreleasedReturnValue();
    if (!v98)
    {
      v193 = 0;
      v251 = 0;
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v296 = 1;
      goto LABEL_15;
    }
    v193 = (void *)v98;
    -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicalNotes");
    v190 = v99;
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v99, "isEqualToString:", v189))
    {
      v249 = 0;
      v295 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v296 = 1;
      v251 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
  v100 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allergyInfo");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v295 = v100 != (_QWORD)v191;
  v192 = (void *)v100;
  if ((void *)v100 != v191)
  {
    objc_msgSend(v7, "allergyInfo");
    v101 = objc_claimAutoreleasedReturnValue();
    if (!v101)
    {
      v188 = 0;
      v241 = 0;
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v295 = 1;
      goto LABEL_15;
    }
    v188 = (void *)v101;
    -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allergyInfo");
    v185 = v102;
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v102, "isEqualToString:", v184))
    {
      v240 = 0;
      v294 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v295 = 1;
      v241 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
  v103 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicationInfo");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v294 = v103 != (_QWORD)v186;
  v187 = (void *)v103;
  if ((void *)v103 != v186)
  {
    objc_msgSend(v7, "medicationInfo");
    v104 = objc_claimAutoreleasedReturnValue();
    if (!v104)
    {
      v183 = 0;
      v239 = 0;
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v294 = 1;
      goto LABEL_15;
    }
    v183 = (void *)v104;
    -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicationInfo");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v105;
    if (!objc_msgSend(v105, "isEqualToString:"))
    {
      v253 = 0;
      v293 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v106 = 1;
      v240 = 1;
      v294 = 1;
LABEL_245:
      v239 = v106;
      goto LABEL_15;
    }
  }
  v107 = -[_HKMedicalIDData isDisabled](self, "isDisabled");
  if (v107 != objc_msgSend(v7, "isDisabled")
    || (v108 = -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency"),
        v108 != objc_msgSend(v7, "shareDuringEmergency"))
    || (v109 = -[_HKMedicalIDData bloodType](self, "bloodType"), v109 != objc_msgSend(v7, "bloodType")))
  {
    v253 = 0;
    v293 = 0;
    v246 = 0;
    v248 = 0;
    v291 = 0;
    v243 = 0;
    v247 = 0;
    v284 = 0;
    v290 = 0;
    v242 = 0;
    v244 = 0;
    v250 = 0;
    v283 = 0;
    v288 = 0;
    v245 = 0;
    v252 = 0;
    v255 = 0;
    v282 = 0;
    v287 = 0;
    v254 = 0;
    v257 = 0;
    v259 = 0;
    v286 = 0;
    v260 = 0;
    v262 = 0;
    v281 = 0;
    v279 = 0;
    v263 = 0;
    v265 = 0;
    v267 = 0;
    v280 = 0;
    v269 = 0;
    v271 = 0;
    v13 = 0;
    v14 = 0;
    v289 = 1;
    LODWORD(v278[2]) = 1;
    HIDWORD(v278[2]) = v3 != v4;
    LODWORD(v278[1]) = 1;
    HIDWORD(v278[1]) = v18;
    HIDWORD(v278[0]) = HIDWORD(v299);
    v277 = 0;
    LODWORD(v278[0]) = 1;
    v275 = 0;
    v276 = DWORD2(v299);
    v273 = 0;
    v274 = 1;
    v272 = DWORD1(v299);
    v270 = 1;
    v268 = v299;
    v266 = 1;
    v264 = v298;
    v261 = 1;
    v258 = v297;
    v256 = 1;
    v251 = v296;
    v249 = 1;
    v241 = v295;
    v240 = 1;
    v106 = v294;
    goto LABEL_245;
  }
  -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
  v110 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pregnancyStartDate");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = (void *)v110;
  v293 = v110 != (_QWORD)v179;
  if ((void *)v110 != v179)
  {
    objc_msgSend(v7, "pregnancyStartDate");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v178)
    {
      v178 = 0;
      v246 = 0;
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v293 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pregnancyStartDate");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v111;
    if (!objc_msgSend(v111, "isEqual:"))
    {
      v248 = 0;
      v291 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v293 = 1;
      v246 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
  v112 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pregnancyEstimatedDueDate");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = (void *)v112;
  v291 = v112 != (_QWORD)v176;
  if ((void *)v112 != v176)
  {
    objc_msgSend(v7, "pregnancyEstimatedDueDate");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v175)
    {
      v175 = 0;
      v243 = 0;
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v291 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pregnancyEstimatedDueDate");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v113;
    if (!objc_msgSend(v113, "isEqual:"))
    {
      v247 = 0;
      v284 = 0;
      v290 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v291 = 1;
      v243 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
  v114 = objc_claimAutoreleasedReturnValue();
  v284 = v114 == 0;
  v171 = (void *)v114;
  if (v114 || (objc_msgSend(v7, "emergencyContacts"), (v167 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v172)
    {
      v172 = 0;
      v242 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v290 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v7, "emergencyContacts");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v170)
    {
      v170 = 0;
      v244 = 0;
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v290 = 1;
      v242 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v165, "count");
    objc_msgSend(v7, "emergencyContacts");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = 1;
    if (v115 != objc_msgSend(v164, "count"))
    {
      v250 = 0;
      v283 = 0;
      v288 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v290 = 1;
      v242 = 1;
      v244 = 1;
      goto LABEL_15;
    }
    v290 = 1;
  }
  else
  {
    v167 = 0;
    v290 = 0;
  }
  -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
  v116 = objc_claimAutoreleasedReturnValue();
  v283 = v116 == 0;
  v163 = (void *)v116;
  if (v116 || (objc_msgSend(v7, "clinicalContacts"), (v161 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v166)
    {
      v166 = 0;
      v245 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v288 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v7, "clinicalContacts");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v162)
    {
      v162 = 0;
      v252 = 0;
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v288 = 1;
      v245 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v159, "count");
    objc_msgSend(v7, "clinicalContacts");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = 1;
    if (v117 != objc_msgSend(v158, "count"))
    {
      v255 = 0;
      v282 = 0;
      v287 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v288 = 1;
      v245 = 1;
      v252 = 1;
      goto LABEL_15;
    }
    v288 = 1;
  }
  else
  {
    v161 = 0;
    v288 = 0;
  }
  -[_HKMedicalIDData medicationsList](self, "medicationsList");
  v118 = objc_claimAutoreleasedReturnValue();
  v282 = v118 == 0;
  v157 = (void *)v118;
  if (v118 || (objc_msgSend(v7, "medicationsList"), (v155 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_HKMedicalIDData medicationsList](self, "medicationsList");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v160)
    {
      v160 = 0;
      v254 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v287 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v7, "medicationsList");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v156)
    {
      v156 = 0;
      v257 = 0;
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v287 = 1;
      v254 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData medicationsList](self, "medicationsList");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v154, "count");
    objc_msgSend(v7, "medicationsList");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = 1;
    if (v119 != objc_msgSend(v153, "count"))
    {
      v259 = 0;
      v286 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v287 = 1;
      v254 = 1;
      v257 = 1;
      goto LABEL_15;
    }
    v287 = 1;
  }
  else
  {
    v155 = 0;
    v287 = 0;
  }
  -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
  v120 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "medicationsListVersion");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)v120;
  v286 = v120 != (_QWORD)v151;
  if ((void *)v120 != v151)
  {
    objc_msgSend(v7, "medicationsListVersion");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v150)
    {
      v150 = 0;
      v260 = 0;
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v286 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicationsListVersion");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v121;
    if (!objc_msgSend(v121, "isEqual:"))
    {
      v262 = 0;
      v281 = 0;
      v279 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v286 = 1;
      v260 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData allergiesList](self, "allergiesList");
  v122 = objc_claimAutoreleasedReturnValue();
  v281 = v122 == 0;
  v148 = (void *)v122;
  if (v122 || (objc_msgSend(v7, "allergiesList"), (v144 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_HKMedicalIDData allergiesList](self, "allergiesList");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v149)
    {
      v149 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v279 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v7, "allergiesList");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v147)
    {
      v147 = 0;
      v265 = 0;
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v279 = 1;
      v263 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData allergiesList](self, "allergiesList");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v143, "count");
    objc_msgSend(v7, "allergiesList");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = 1;
    if (v123 != objc_msgSend(v142, "count"))
    {
      v267 = 0;
      v280 = 0;
      v269 = 0;
      v271 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v273 = 0;
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v279 = 1;
      v263 = 1;
      v265 = 1;
      goto LABEL_15;
    }
    v279 = 1;
  }
  else
  {
    v144 = 0;
    v279 = 0;
  }
  -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
  v124 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allergiesListVersion");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)v124;
  LODWORD(v280) = v124 != (_QWORD)v140;
  if ((void *)v124 != v140)
  {
    objc_msgSend(v7, "allergiesListVersion");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v139)
    {
      v139 = 0;
      v269 = 0;
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v280 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allergiesListVersion");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v125;
    if (!objc_msgSend(v125, "isEqual:"))
    {
      v271 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v277 = 0;
      LODWORD(v278[0]) = 1;
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v280 = 1;
      v269 = 1;
      goto LABEL_15;
    }
  }
  -[_HKMedicalIDData conditionsList](self, "conditionsList");
  v126 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v280) = v126 == 0;
  v135 = (void *)v126;
  if (v126 || (objc_msgSend(v7, "conditionsList"), (v133 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_HKMedicalIDData conditionsList](self, "conditionsList");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v138)
    {
      v138 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v269 = v280;
      v271 = 1;
      v277 = 1;
      goto LABEL_15;
    }
    objc_msgSend(v7, "conditionsList");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v134)
    {
      v134 = 0;
      v273 = 0;
      v13 = 0;
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v269 = v280;
      v271 = 0x100000001;
      v277 = 1;
      goto LABEL_15;
    }
    -[_HKMedicalIDData conditionsList](self, "conditionsList");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v132, "count");
    objc_msgSend(v7, "conditionsList");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = 1;
    if (v127 != objc_msgSend(v131, "count"))
    {
      v13 = 0;
      v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v275 = 0;
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v269 = v280;
      v271 = 0x100000001;
      v277 = 1;
      v273 = 1;
      goto LABEL_15;
    }
    v277 = 1;
  }
  else
  {
    v133 = 0;
    v277 = 0;
  }
  -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
  v128 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conditionsListVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)v128;
  v76 = v128 == (_QWORD)v4;
  v13 = v128 != (_QWORD)v4;
  if (!v76)
  {
    objc_msgSend(v7, "conditionsListVersion", v130);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v14 = 0;
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = HIDWORD(v292);
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v269 = v280;
      LODWORD(v271) = 1;
      HIDWORD(v271) = v277;
      v273 = v277;
      v275 = 1;
      v13 = 1;
LABEL_15:
      v21 = 1;
      if (!v14)
        goto LABEL_17;
      goto LABEL_16;
    }
    -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditionsListVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v10, "isEqual:", v3))
    {
      v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = HIDWORD(v292);
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      v276 = DWORD2(v299);
      v274 = 1;
      v272 = DWORD1(v299);
      v270 = 1;
      v268 = v299;
      v266 = 1;
      v264 = v298;
      v261 = 1;
      v258 = v297;
      v256 = 1;
      v251 = v296;
      v249 = 1;
      v241 = v295;
      v240 = 1;
      v239 = v294;
      v253 = 1;
      v246 = v293;
      v248 = 1;
      v243 = v291;
      v247 = 1;
      v242 = v290;
      v244 = v290;
      v250 = 1;
      v245 = v288;
      v252 = v288;
      v255 = 1;
      v254 = v287;
      v257 = v287;
      v259 = 1;
      v260 = v286;
      v262 = 1;
      v263 = v279;
      v265 = v279;
      v267 = 1;
      v269 = v280;
      LODWORD(v271) = 1;
      HIDWORD(v271) = v277;
      v273 = v277;
      v14 = 1;
      v275 = 1;
      v13 = 1;
      goto LABEL_15;
    }
  }
  v129 = -[_HKMedicalIDData schemaVersion](self, "schemaVersion", v130);
  v21 = v129 != objc_msgSend(v7, "schemaVersion");
  v289 = 1;
  LODWORD(v278[2]) = 1;
  HIDWORD(v278[2]) = HIDWORD(v292);
  LODWORD(v278[1]) = 1;
  HIDWORD(v278[1]) = v292;
  LODWORD(v278[0]) = 1;
  HIDWORD(v278[0]) = HIDWORD(v299);
  v276 = DWORD2(v299);
  v274 = 1;
  v272 = DWORD1(v299);
  v270 = 1;
  v268 = v299;
  v266 = 1;
  v264 = v298;
  v261 = 1;
  v258 = v297;
  v256 = 1;
  v251 = v296;
  v249 = 1;
  v241 = v295;
  v240 = 1;
  v239 = v294;
  v253 = 1;
  v246 = v293;
  v248 = 1;
  v243 = v291;
  v247 = 1;
  v242 = v290;
  v244 = v290;
  v250 = 1;
  v245 = v288;
  v252 = v288;
  v255 = 1;
  v254 = v287;
  v257 = v287;
  v259 = 1;
  v260 = v286;
  v262 = 1;
  v263 = v279;
  v265 = v279;
  v267 = 1;
  v269 = v280;
  LODWORD(v271) = 1;
  HIDWORD(v271) = v277;
  v273 = v277;
  v275 = 1;
  if (v13)
  {
LABEL_16:

  }
LABEL_17:
  if (v13)

  if (v275)
  {

  }
  if (v273)
  {

  }
  if (HIDWORD(v271))

  if (v277)
  if (HIDWORD(v280))

  if ((_DWORD)v271)
  if (v269)
  {

  }
  if ((_DWORD)v280)

  if (v267)
  {

  }
  if (v265)
  {

  }
  if (v263)

  if (v279)
  if (v281)

  if (v262)
  if (v260)
  {

  }
  if (v286)

  if (v259)
  {

  }
  if (v257)
  {

  }
  if (v254)

  if (v287)
  if (v282)

  if (v255)
  if (v252)
  {

  }
  if (v245)

  if (v288)
  if (v283)

  if (v250)
  if (v244)
  {

  }
  if (v242)

  if (v290)
  if (v284)

  if (v247)
  if (v243)
  {

  }
  if (v291)

  if (v248)
  {

  }
  if (v246)
  {

  }
  if (v293)

  if (v253)
  {

  }
  if (v239)
  {

  }
  if (v294)

  if (v240)
  {

  }
  if (v241)
  {

  }
  if (v295)

  if (v249)
  {

  }
  if (v251)
  {

  }
  if (v296)

  if (v256)
  {

  }
  if (v258)
  {

  }
  if (v297)

  if (v261)
  {

  }
  if (v264)
  {

  }
  if (v298)

  if (v266)
  {

  }
  if (v268)
  {

  }
  if ((_DWORD)v299)

  if (v270)
  {

  }
  if (v272)
  {

  }
  if (DWORD1(v299))

  if (v274)
  {

  }
  if (v276)
  {

  }
  if (DWORD2(v299))

  if (LODWORD(v278[0]))
  {

  }
  if (HIDWORD(v278[0]))
  {

  }
  if (HIDWORD(v299))

  if (LODWORD(v278[1]))
  {

  }
  if (HIDWORD(v278[1]))
  {

  }
  if ((_DWORD)v292)

  if (LODWORD(v278[2]))
  {

  }
  if (HIDWORD(v278[2]))
  {

  }
  if (HIDWORD(v292))

  if (v289)
  {

  }
  if (v285)
  {

  }
  if (v8 != v9)

  if (v21)
  {
LABEL_166:
    v22 = 0;
    goto LABEL_167;
  }
  -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = 0;
    do
    {
      -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emergencyContacts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v28, "isEqualToSyncedContact:", v30);

      if ((v31 & 1) == 0)
        goto LABEL_166;
      ++v26;
      -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

    }
    while (v26 < v33);
  }
  -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = 0;
    do
    {
      -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clinicalContacts");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v38, "isEqualToSyncedContact:", v40);

      if ((v41 & 1) == 0)
        goto LABEL_166;
      ++v36;
      -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

    }
    while (v36 < v43);
  }
  -[_HKMedicalIDData medicationsList](self, "medicationsList");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  if (v45)
  {
    v46 = 0;
    do
    {
      -[_HKMedicalIDData medicationsList](self, "medicationsList");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectAtIndexedSubscript:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "medicationsList");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", v46);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v48, "isEqualToSyncedData:", v50);

      if ((v51 & 1) == 0)
        goto LABEL_166;
      ++v46;
      -[_HKMedicalIDData medicationsList](self, "medicationsList");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count");

    }
    while (v46 < v53);
  }
  -[_HKMedicalIDData allergiesList](self, "allergiesList");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "count");

  if (v55)
  {
    v56 = 0;
    do
    {
      -[_HKMedicalIDData allergiesList](self, "allergiesList");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndexedSubscript:", v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allergiesList");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectAtIndexedSubscript:", v56);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v58, "isEqualToSyncedData:", v60);

      if ((v61 & 1) == 0)
        goto LABEL_166;
      ++v56;
      -[_HKMedicalIDData allergiesList](self, "allergiesList");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "count");

    }
    while (v56 < v63);
  }
  -[_HKMedicalIDData conditionsList](self, "conditionsList");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "count");

  if (v65)
  {
    v66 = 0;
    do
    {
      -[_HKMedicalIDData conditionsList](self, "conditionsList");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectAtIndexedSubscript:", v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conditionsList");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectAtIndexedSubscript:", v66);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v68, "isEqualToSyncedData:", v70);

      if ((v22 & 1) == 0)
        break;
      ++v66;
      -[_HKMedicalIDData conditionsList](self, "conditionsList");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "count");

    }
    while (v66 < v72);
  }
  else
  {
    v22 = 1;
  }
LABEL_167:

  return v22;
}

- (void)setGregorianBirthday:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (v5)
  {
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMedicalIDData.m"), 658, CFSTR("Only date components with a gregorian calendar attached is accepted"));

    }
    -[_HKMedicalIDData _gregorianUtcCalendar](self, "_gregorianUtcCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_HKMedicalIDData setGmtBirthdate:](self, "setGmtBirthdate:", v10);
    -[_HKMedicalIDData setBirthdate:](self, "setBirthdate:", v10);

  }
  else
  {
    -[_HKMedicalIDData setGmtBirthdate:](self, "setGmtBirthdate:", 0);
  }

}

- (NSDateComponents)gregorianBirthday
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_gmtBirthdate)
  {
    -[_HKMedicalIDData _gregorianUtcCalendar](self, "_gregorianUtcCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", self->_gmtBirthdate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCalendar:", v5);

  }
  else
  {
    v4 = 0;
  }
  return (NSDateComponents *)v4;
}

- (NSDate)dateSaved
{
  id v3;
  void *v4;
  NSDate *v5;
  NSDate *legacyDateSaved;

  if (-[_HKMedicalIDData hasAnyModificationDate](self, "hasAnyModificationDate"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v3;
    if (self->_isDisabledModifiedDate)
      objc_msgSend(v3, "addObject:");
    if (self->_shareDuringEmergencyModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_pictureDataModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_nameModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_gregorianBirthdayModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_primaryLanguageCodeModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_heightModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_weightModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_bloodTypeModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_isOrganDonorModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_emergencyContactsModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_clinicalContactsModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_medicalConditionsModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_medicalNotesModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_allergyInfoModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_medicationInfoModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_pregnancyStartDateModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_pregnancyEstimatedDueDateModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_medicationsListModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_medicationsListVersionModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_allergiesListModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_allergiesListVersionModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_conditionsListModifiedDate)
      objc_msgSend(v4, "addObject:");
    if (self->_conditionsListVersionModifiedDate)
      objc_msgSend(v4, "addObject:");
    objc_msgSend(MEMORY[0x1E0C99D68], "hk_mostRecentDate:", v4);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    legacyDateSaved = self->_legacyDateSaved;
    self->_legacyDateSaved = v5;

  }
  return self->_legacyDateSaved;
}

- (void)setDateSaved:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDateSaved, a3);
}

- (BOOL)hasAnyModificationDate
{
  return self->_isDisabledModifiedDate
      || self->_shareDuringEmergencyModifiedDate
      || self->_pictureDataModifiedDate
      || self->_nameModifiedDate
      || self->_gregorianBirthdayModifiedDate
      || self->_primaryLanguageCodeModifiedDate
      || self->_heightModifiedDate
      || self->_weightModifiedDate
      || self->_bloodTypeModifiedDate
      || self->_isOrganDonorModifiedDate
      || self->_emergencyContactsModifiedDate
      || self->_clinicalContactsModifiedDate
      || self->_medicalConditionsModifiedDate
      || self->_medicalNotesModifiedDate
      || self->_allergyInfoModifiedDate
      || self->_medicationInfoModifiedDate
      || self->_pregnancyStartDateModifiedDate
      || self->_pregnancyEstimatedDueDateModifiedDate
      || self->_medicationsListModifiedDate
      || self->_medicationsListVersionModifiedDate
      || self->_allergiesListModifiedDate
      || self->_allergiesListVersionModifiedDate
      || self->_conditionsListModifiedDate
      || self->_conditionsListVersionModifiedDate != 0;
}

- (BOOL)hasAnyData
{
  if (self->_isDisabled)
    return 0;
  else
    return !-[_HKMedicalIDData isEmpty](self, "isEmpty");
}

- (BOOL)isEmpty
{
  return !self->_pictureData
      && !-[NSString length](self->_name, "length")
      && !self->_gmtBirthdate
      && !-[NSString length](self->_primaryLanguageCode, "length")
      && !self->_height
      && !self->_weight
      && !self->_bloodType
      && !self->_isOrganDonor
      && !-[NSArray count](self->_emergencyContacts, "count")
      && !-[NSArray count](self->_clinicalContacts, "count")
      && !-[NSString length](self->_medicalConditions, "length")
      && !-[NSString length](self->_medicalNotes, "length")
      && !-[NSString length](self->_allergyInfo, "length")
      && !-[NSString length](self->_medicationInfo, "length")
      && !self->_pregnancyStartDate
      && !self->_pregnancyEstimatedDueDate
      && !-[NSArray count](self->_medicationsList, "count")
      && !self->_medicationsListVersion
      && !-[NSArray count](self->_allergiesList, "count")
      && !self->_allergiesListVersion
      && !-[NSArray count](self->_conditionsList, "count")
      && self->_conditionsListVersion == 0;
}

- (void)setModificationDatesForUpdatedFieldsWithMedicalIDData:(id)a3
{
  uint64_t v3;
  id v5;
  int isDisabled;
  NSDate *v7;
  NSDate *isDisabledModifiedDate;
  int shareDuringEmergency;
  NSDate *v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *shareDuringEmergencyModifiedDate;
  void *pictureData;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSData *v19;
  void *v20;
  NSDate *v21;
  NSDate *pictureDataModifiedDate;
  NSDate *v23;
  NSString *name;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSString *v28;
  void *v29;
  NSDate *v30;
  NSDate *nameModifiedDate;
  NSDate *v32;
  NSDate *gregorianBirthdayModifiedDate;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  NSDate *v41;
  NSString *primaryLanguageCode;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSString *v46;
  void *v47;
  void *v48;
  NSDate *v49;
  NSDate *primaryLanguageCodeModifiedDate;
  NSDate *v51;
  NSDate *heightModifiedDate;
  void *height;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  HKQuantity *v58;
  void *v59;
  NSDate *v60;
  HKQuantity *weight;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  HKQuantity *v65;
  void *v66;
  void *v67;
  NSDate *v68;
  NSDate *weightModifiedDate;
  NSDate *v70;
  NSDate *bloodTypeModifiedDate;
  int64_t bloodType;
  NSDate *v73;
  NSDate *v74;
  NSNumber *isOrganDonor;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  NSNumber *v79;
  void *v80;
  void *v81;
  NSDate *v82;
  NSDate *isOrganDonorModifiedDate;
  NSDate *v84;
  NSDate *emergencyContactsModifiedDate;
  NSArray *emergencyContacts;
  uint64_t v87;
  NSDate *v88;
  void *v89;
  NSArray *v90;
  void *v91;
  uint64_t v92;
  NSDate *v93;
  NSArray *clinicalContacts;
  uint64_t v95;
  void *v96;
  NSArray *v97;
  NSDate *v98;
  NSDate *clinicalContactsModifiedDate;
  NSDate *medicalConditions;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  NSString *v105;
  void *v106;
  NSDate *v107;
  NSDate *medicalConditionsModifiedDate;
  NSDate *v109;
  NSString *medicalNotes;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  NSString *v114;
  void *v115;
  void *v116;
  NSDate *v117;
  NSDate *medicalNotesModifiedDate;
  NSDate *v119;
  NSDate *allergyInfoModifiedDate;
  NSDate *allergyInfo;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  NSString *v126;
  void *v127;
  NSDate *v128;
  NSString *medicationInfo;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  NSString *v133;
  void *v134;
  void *v135;
  NSDate *v136;
  NSDate *medicationInfoModifiedDate;
  NSDate *v138;
  NSDate *pregnancyStartDateModifiedDate;
  NSDate *pregnancyStartDate;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  NSDate *v145;
  void *v146;
  NSDate *v147;
  NSDate *pregnancyEstimatedDueDate;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  NSDate *v152;
  void *v153;
  void *v154;
  NSDate *v155;
  NSDate *pregnancyEstimatedDueDateModifiedDate;
  NSDate *v157;
  NSDate *medicationsListModifiedDate;
  NSArray *medicationsList;
  uint64_t v160;
  NSDate *v161;
  void *v162;
  NSArray *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  NSDate *v168;
  NSNumber *medicationsListVersion;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  NSNumber *v173;
  void *v174;
  void *v175;
  NSDate *v176;
  NSDate *medicationsListVersionModifiedDate;
  NSDate *v178;
  NSDate *allergiesListModifiedDate;
  NSArray *allergiesList;
  uint64_t v181;
  NSDate *v182;
  void *v183;
  NSArray *v184;
  void *v185;
  uint64_t v186;
  NSDate *v187;
  NSNumber *allergiesListVersion;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  NSNumber *v192;
  void *v193;
  void *v194;
  NSDate *v195;
  NSDate *allergiesListVersionModifiedDate;
  NSDate *v197;
  NSDate *conditionsListModifiedDate;
  NSArray *conditionsList;
  uint64_t v200;
  NSDate *v201;
  void *v202;
  NSArray *v203;
  void *v204;
  uint64_t v205;
  NSDate *v206;
  void *conditionsListVersion;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  NSNumber *v211;
  void *v212;
  NSDate *v213;
  id v214;

  v5 = a3;
  v214 = v5;
  if (v5)
  {
    isDisabled = self->_isDisabled;
    if (isDisabled != objc_msgSend(v5, "isDisabled"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      isDisabledModifiedDate = self->_isDisabledModifiedDate;
      self->_isDisabledModifiedDate = v7;

    }
    shareDuringEmergency = self->_shareDuringEmergency;
    if (shareDuringEmergency == objc_msgSend(v214, "shareDuringEmergency"))
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v11 = self->_isDisabledModifiedDate;
    self->_isDisabledModifiedDate = v10;

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  shareDuringEmergencyModifiedDate = self->_shareDuringEmergencyModifiedDate;
  self->_shareDuringEmergencyModifiedDate = v12;

  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pictureDataModifiedDate = self->_pictureDataModifiedDate;
    self->_pictureDataModifiedDate = v21;
    goto LABEL_20;
  }
LABEL_8:
  pictureData = self->_pictureData;
  objc_msgSend(v214, "pictureData");
  v15 = objc_claimAutoreleasedReturnValue();
  if (pictureData == (void *)v15)
  {
LABEL_15:

    goto LABEL_16;
  }
  v16 = (void *)v15;
  objc_msgSend(v214, "pictureData");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

    goto LABEL_14;
  }
  v18 = (void *)v17;
  v19 = self->_pictureData;
  objc_msgSend(v214, "pictureData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NSData isEqual:](v19, "isEqual:", v20);

  if ((v3 & 1) == 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pictureData = self->_pictureDataModifiedDate;
    self->_pictureDataModifiedDate = v23;
    goto LABEL_15;
  }
LABEL_16:
  name = self->_name;
  objc_msgSend(v214, "name");
  v25 = objc_claimAutoreleasedReturnValue();
  if (name == (NSString *)v25)
  {

    goto LABEL_24;
  }
  pictureDataModifiedDate = (NSDate *)v25;
  objc_msgSend(v214, "name");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    v28 = self->_name;
    objc_msgSend(v214, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSString isEqualToString:](v28, "isEqualToString:", v29);

    if ((v3 & 1) != 0)
      goto LABEL_24;
    goto LABEL_21;
  }
LABEL_20:

LABEL_21:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
  nameModifiedDate = self->_nameModifiedDate;
  self->_nameModifiedDate = v30;

  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
    gregorianBirthdayModifiedDate = self->_gregorianBirthdayModifiedDate;
    self->_gregorianBirthdayModifiedDate = v32;
    goto LABEL_36;
  }
LABEL_24:
  -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "gregorianBirthday");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v34 == (void *)v35)
  {

LABEL_31:
    goto LABEL_32;
  }
  v36 = (void *)v35;
  objc_msgSend(v214, "gregorianBirthday");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
  {

    goto LABEL_30;
  }
  v3 = v37;
  -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "gregorianBirthday");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqual:", v39);

  if ((v40 & 1) == 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v41 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v34 = self->_gregorianBirthdayModifiedDate;
    self->_gregorianBirthdayModifiedDate = v41;
    goto LABEL_31;
  }
LABEL_32:
  primaryLanguageCode = self->_primaryLanguageCode;
  objc_msgSend(v214, "primaryLanguageCode");
  v43 = objc_claimAutoreleasedReturnValue();
  if (primaryLanguageCode == (NSString *)v43)
  {

    v48 = v214;
    goto LABEL_40;
  }
  gregorianBirthdayModifiedDate = (NSDate *)v43;
  objc_msgSend(v214, "primaryLanguageCode");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    v46 = self->_primaryLanguageCode;
    objc_msgSend(v214, "primaryLanguageCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSString isEqualToString:](v46, "isEqualToString:", v47);

    v48 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_40;
    goto LABEL_37;
  }
LABEL_36:

LABEL_37:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v49 = (NSDate *)objc_claimAutoreleasedReturnValue();
  primaryLanguageCodeModifiedDate = self->_primaryLanguageCodeModifiedDate;
  self->_primaryLanguageCodeModifiedDate = v49;

  v48 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v51 = (NSDate *)objc_claimAutoreleasedReturnValue();
    heightModifiedDate = self->_heightModifiedDate;
    self->_heightModifiedDate = v51;
    goto LABEL_51;
  }
LABEL_40:
  height = self->_height;
  objc_msgSend(v48, "height");
  v54 = objc_claimAutoreleasedReturnValue();
  if (height == (void *)v54)
  {
LABEL_46:

    goto LABEL_47;
  }
  v55 = (void *)v54;
  objc_msgSend(v214, "height");
  v56 = objc_claimAutoreleasedReturnValue();
  if (!v56)
  {

    goto LABEL_45;
  }
  v57 = (void *)v56;
  v58 = self->_height;
  objc_msgSend(v214, "height");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HKQuantity isEqual:](v58, "isEqual:", v59);

  if ((v3 & 1) == 0)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v60 = (NSDate *)objc_claimAutoreleasedReturnValue();
    height = self->_heightModifiedDate;
    self->_heightModifiedDate = v60;
    goto LABEL_46;
  }
LABEL_47:
  weight = self->_weight;
  objc_msgSend(v214, "weight");
  v62 = objc_claimAutoreleasedReturnValue();
  if (weight == (HKQuantity *)v62)
  {

    v67 = v214;
    goto LABEL_55;
  }
  heightModifiedDate = (NSDate *)v62;
  objc_msgSend(v214, "weight");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    v65 = self->_weight;
    objc_msgSend(v214, "weight");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[HKQuantity isEqual:](v65, "isEqual:", v66);

    v67 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_55;
    goto LABEL_52;
  }
LABEL_51:

LABEL_52:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v68 = (NSDate *)objc_claimAutoreleasedReturnValue();
  weightModifiedDate = self->_weightModifiedDate;
  self->_weightModifiedDate = v68;

  v67 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v70 = (NSDate *)objc_claimAutoreleasedReturnValue();
    bloodTypeModifiedDate = self->_bloodTypeModifiedDate;
    self->_bloodTypeModifiedDate = v70;
    goto LABEL_61;
  }
LABEL_55:
  bloodType = self->_bloodType;
  if (bloodType != objc_msgSend(v67, "bloodType"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v73 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v74 = self->_bloodTypeModifiedDate;
    self->_bloodTypeModifiedDate = v73;

  }
  isOrganDonor = self->_isOrganDonor;
  objc_msgSend(v214, "isOrganDonor");
  v76 = objc_claimAutoreleasedReturnValue();
  if (isOrganDonor == (NSNumber *)v76)
  {

    v81 = v214;
    goto LABEL_65;
  }
  bloodTypeModifiedDate = (NSDate *)v76;
  objc_msgSend(v214, "isOrganDonor");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    v79 = self->_isOrganDonor;
    objc_msgSend(v214, "isOrganDonor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSNumber isEqual:](v79, "isEqual:", v80);

    v81 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_65;
    goto LABEL_62;
  }
LABEL_61:

LABEL_62:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v82 = (NSDate *)objc_claimAutoreleasedReturnValue();
  isOrganDonorModifiedDate = self->_isOrganDonorModifiedDate;
  self->_isOrganDonorModifiedDate = v82;

  v81 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v84 = (NSDate *)objc_claimAutoreleasedReturnValue();
    emergencyContactsModifiedDate = self->_emergencyContactsModifiedDate;
    self->_emergencyContactsModifiedDate = v84;
    goto LABEL_90;
  }
LABEL_65:
  emergencyContacts = self->_emergencyContacts;
  objc_msgSend(v81, "emergencyContacts");
  v87 = objc_claimAutoreleasedReturnValue();
  if (emergencyContacts == (NSArray *)v87)
  {
    v88 = (NSDate *)emergencyContacts;
    goto LABEL_79;
  }
  v88 = (NSDate *)v87;
  objc_msgSend(v214, "emergencyContacts");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = self->_emergencyContacts;
  if (!v89)
  {
    if (-[NSArray count](self->_emergencyContacts, "count"))
    {
LABEL_74:

LABEL_78:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v93 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v88 = self->_emergencyContactsModifiedDate;
      self->_emergencyContactsModifiedDate = v93;
      goto LABEL_79;
    }
LABEL_75:
    objc_msgSend(v214, "emergencyContacts");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "count");

    if (v89)
    {

    }
    if (!v92)
      goto LABEL_80;
    goto LABEL_78;
  }
  objc_msgSend(v214, "emergencyContacts");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[NSArray isEqual:](v90, "isEqual:", v3))
  {
    if (-[NSArray count](self->_emergencyContacts, "count"))
    {

      goto LABEL_74;
    }
    goto LABEL_75;
  }

LABEL_79:
LABEL_80:
  clinicalContacts = self->_clinicalContacts;
  objc_msgSend(v214, "clinicalContacts");
  v95 = objc_claimAutoreleasedReturnValue();
  if (clinicalContacts == (NSArray *)v95)
  {
    emergencyContactsModifiedDate = (NSDate *)clinicalContacts;
    goto LABEL_85;
  }
  emergencyContactsModifiedDate = (NSDate *)v95;
  objc_msgSend(v214, "clinicalContacts");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = self->_clinicalContacts;
  if (v96)
  {
    objc_msgSend(v214, "clinicalContacts");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](v97, "isEqual:", v3))
    {

LABEL_85:
      goto LABEL_92;
    }
    if (-[NSArray count](self->_clinicalContacts, "count"))
    {

      goto LABEL_90;
    }
LABEL_148:
    objc_msgSend(v214, "clinicalContacts");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_msgSend(v164, "count");

    if (v96)
    {

    }
    if (!v165)
      goto LABEL_92;
    goto LABEL_91;
  }
  if (!-[NSArray count](self->_clinicalContacts, "count"))
    goto LABEL_148;
LABEL_90:

LABEL_91:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v98 = (NSDate *)objc_claimAutoreleasedReturnValue();
  clinicalContactsModifiedDate = self->_clinicalContactsModifiedDate;
  self->_clinicalContactsModifiedDate = v98;

  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v107 = (NSDate *)objc_claimAutoreleasedReturnValue();
    medicalConditionsModifiedDate = self->_medicalConditionsModifiedDate;
    self->_medicalConditionsModifiedDate = v107;
    goto LABEL_104;
  }
LABEL_92:
  medicalConditions = (NSDate *)self->_medicalConditions;
  objc_msgSend(v214, "medicalConditions");
  v101 = objc_claimAutoreleasedReturnValue();
  if (medicalConditions == (NSDate *)v101)
  {
LABEL_99:

    goto LABEL_100;
  }
  v102 = (void *)v101;
  objc_msgSend(v214, "medicalConditions");
  v103 = objc_claimAutoreleasedReturnValue();
  if (!v103)
  {

    goto LABEL_98;
  }
  v104 = (void *)v103;
  v105 = self->_medicalConditions;
  objc_msgSend(v214, "medicalConditions");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NSString isEqualToString:](v105, "isEqualToString:", v106);

  if ((v3 & 1) == 0)
  {
LABEL_98:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v109 = (NSDate *)objc_claimAutoreleasedReturnValue();
    medicalConditions = self->_medicalConditionsModifiedDate;
    self->_medicalConditionsModifiedDate = v109;
    goto LABEL_99;
  }
LABEL_100:
  medicalNotes = self->_medicalNotes;
  objc_msgSend(v214, "medicalNotes");
  v111 = objc_claimAutoreleasedReturnValue();
  if (medicalNotes == (NSString *)v111)
  {

    v116 = v214;
    goto LABEL_108;
  }
  medicalConditionsModifiedDate = (NSDate *)v111;
  objc_msgSend(v214, "medicalNotes");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    v114 = self->_medicalNotes;
    objc_msgSend(v214, "medicalNotes");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSString isEqualToString:](v114, "isEqualToString:", v115);

    v116 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_108;
    goto LABEL_105;
  }
LABEL_104:

LABEL_105:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v117 = (NSDate *)objc_claimAutoreleasedReturnValue();
  medicalNotesModifiedDate = self->_medicalNotesModifiedDate;
  self->_medicalNotesModifiedDate = v117;

  v116 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v119 = (NSDate *)objc_claimAutoreleasedReturnValue();
    allergyInfoModifiedDate = self->_allergyInfoModifiedDate;
    self->_allergyInfoModifiedDate = v119;
    goto LABEL_119;
  }
LABEL_108:
  allergyInfo = (NSDate *)self->_allergyInfo;
  objc_msgSend(v116, "allergyInfo");
  v122 = objc_claimAutoreleasedReturnValue();
  if (allergyInfo == (NSDate *)v122)
  {
LABEL_114:

    goto LABEL_115;
  }
  v123 = (void *)v122;
  objc_msgSend(v214, "allergyInfo");
  v124 = objc_claimAutoreleasedReturnValue();
  if (!v124)
  {

    goto LABEL_113;
  }
  v125 = (void *)v124;
  v126 = self->_allergyInfo;
  objc_msgSend(v214, "allergyInfo");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NSString isEqualToString:](v126, "isEqualToString:", v127);

  if ((v3 & 1) == 0)
  {
LABEL_113:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v128 = (NSDate *)objc_claimAutoreleasedReturnValue();
    allergyInfo = self->_allergyInfoModifiedDate;
    self->_allergyInfoModifiedDate = v128;
    goto LABEL_114;
  }
LABEL_115:
  medicationInfo = self->_medicationInfo;
  objc_msgSend(v214, "medicationInfo");
  v130 = objc_claimAutoreleasedReturnValue();
  if (medicationInfo == (NSString *)v130)
  {

    v135 = v214;
    goto LABEL_123;
  }
  allergyInfoModifiedDate = (NSDate *)v130;
  objc_msgSend(v214, "medicationInfo");
  v131 = objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    v132 = (void *)v131;
    v133 = self->_medicationInfo;
    objc_msgSend(v214, "medicationInfo");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSString isEqualToString:](v133, "isEqualToString:", v134);

    v135 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_123;
    goto LABEL_120;
  }
LABEL_119:

LABEL_120:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v136 = (NSDate *)objc_claimAutoreleasedReturnValue();
  medicationInfoModifiedDate = self->_medicationInfoModifiedDate;
  self->_medicationInfoModifiedDate = v136;

  v135 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v138 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pregnancyStartDateModifiedDate = self->_pregnancyStartDateModifiedDate;
    self->_pregnancyStartDateModifiedDate = v138;
    goto LABEL_134;
  }
LABEL_123:
  pregnancyStartDate = self->_pregnancyStartDate;
  objc_msgSend(v135, "pregnancyStartDate");
  v141 = objc_claimAutoreleasedReturnValue();
  if (pregnancyStartDate == (NSDate *)v141)
  {
LABEL_129:

    goto LABEL_130;
  }
  v142 = (void *)v141;
  objc_msgSend(v214, "pregnancyStartDate");
  v143 = objc_claimAutoreleasedReturnValue();
  if (!v143)
  {

    goto LABEL_128;
  }
  v144 = (void *)v143;
  v145 = self->_pregnancyStartDate;
  objc_msgSend(v214, "pregnancyStartDate");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NSDate isEqual:](v145, "isEqual:", v146);

  if ((v3 & 1) == 0)
  {
LABEL_128:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v147 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pregnancyStartDate = self->_pregnancyStartDateModifiedDate;
    self->_pregnancyStartDateModifiedDate = v147;
    goto LABEL_129;
  }
LABEL_130:
  pregnancyEstimatedDueDate = self->_pregnancyEstimatedDueDate;
  objc_msgSend(v214, "pregnancyEstimatedDueDate");
  v149 = objc_claimAutoreleasedReturnValue();
  if (pregnancyEstimatedDueDate == (NSDate *)v149)
  {

    v154 = v214;
    goto LABEL_138;
  }
  pregnancyStartDateModifiedDate = (NSDate *)v149;
  objc_msgSend(v214, "pregnancyEstimatedDueDate");
  v150 = objc_claimAutoreleasedReturnValue();
  if (v150)
  {
    v151 = (void *)v150;
    v152 = self->_pregnancyEstimatedDueDate;
    objc_msgSend(v214, "pregnancyEstimatedDueDate");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSDate isEqual:](v152, "isEqual:", v153);

    v154 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_138;
    goto LABEL_135;
  }
LABEL_134:

LABEL_135:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v155 = (NSDate *)objc_claimAutoreleasedReturnValue();
  pregnancyEstimatedDueDateModifiedDate = self->_pregnancyEstimatedDueDateModifiedDate;
  self->_pregnancyEstimatedDueDateModifiedDate = v155;

  v154 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v157 = (NSDate *)objc_claimAutoreleasedReturnValue();
    medicationsListModifiedDate = self->_medicationsListModifiedDate;
    self->_medicationsListModifiedDate = v157;
    goto LABEL_161;
  }
LABEL_138:
  medicationsList = self->_medicationsList;
  objc_msgSend(v154, "medicationsList");
  v160 = objc_claimAutoreleasedReturnValue();
  if (medicationsList == (NSArray *)v160)
  {
    v161 = (NSDate *)medicationsList;
    goto LABEL_156;
  }
  v161 = (NSDate *)v160;
  objc_msgSend(v214, "medicationsList");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = self->_medicationsList;
  if (v162)
  {
    objc_msgSend(v214, "medicationsList");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](v163, "isEqual:", v3))
    {

LABEL_156:
      goto LABEL_157;
    }
    if (-[NSArray count](self->_medicationsList, "count"))
    {

      goto LABEL_147;
    }
  }
  else if (-[NSArray count](self->_medicationsList, "count"))
  {
LABEL_147:

LABEL_155:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v168 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v161 = self->_medicationsListModifiedDate;
    self->_medicationsListModifiedDate = v168;
    goto LABEL_156;
  }
  objc_msgSend(v214, "medicationsList");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v166, "count");

  if (v162)
  {

  }
  if (v167)
    goto LABEL_155;
LABEL_157:
  medicationsListVersion = self->_medicationsListVersion;
  objc_msgSend(v214, "medicationsListVersion");
  v170 = objc_claimAutoreleasedReturnValue();
  if (medicationsListVersion == (NSNumber *)v170)
  {

    v175 = v214;
    goto LABEL_165;
  }
  medicationsListModifiedDate = (NSDate *)v170;
  objc_msgSend(v214, "medicationsListVersion");
  v171 = objc_claimAutoreleasedReturnValue();
  if (v171)
  {
    v172 = (void *)v171;
    v173 = self->_medicationsListVersion;
    objc_msgSend(v214, "medicationsListVersion");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSNumber isEqual:](v173, "isEqual:", v174);

    v175 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_165;
    goto LABEL_162;
  }
LABEL_161:

LABEL_162:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v176 = (NSDate *)objc_claimAutoreleasedReturnValue();
  medicationsListVersionModifiedDate = self->_medicationsListVersionModifiedDate;
  self->_medicationsListVersionModifiedDate = v176;

  v175 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v178 = (NSDate *)objc_claimAutoreleasedReturnValue();
    allergiesListModifiedDate = self->_allergiesListModifiedDate;
    self->_allergiesListModifiedDate = v178;
    goto LABEL_184;
  }
LABEL_165:
  allergiesList = self->_allergiesList;
  objc_msgSend(v175, "allergiesList");
  v181 = objc_claimAutoreleasedReturnValue();
  if (allergiesList == (NSArray *)v181)
  {
    v182 = (NSDate *)allergiesList;
    goto LABEL_179;
  }
  v182 = (NSDate *)v181;
  objc_msgSend(v214, "allergiesList");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = self->_allergiesList;
  if (v183)
  {
    objc_msgSend(v214, "allergiesList");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](v184, "isEqual:", v3))
    {

LABEL_179:
      goto LABEL_180;
    }
    if (-[NSArray count](self->_allergiesList, "count"))
    {

      goto LABEL_174;
    }
  }
  else if (-[NSArray count](self->_allergiesList, "count"))
  {
LABEL_174:

LABEL_178:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v187 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v182 = self->_allergiesListModifiedDate;
    self->_allergiesListModifiedDate = v187;
    goto LABEL_179;
  }
  objc_msgSend(v214, "allergiesList");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend(v185, "count");

  if (v183)
  {

  }
  if (v186)
    goto LABEL_178;
LABEL_180:
  allergiesListVersion = self->_allergiesListVersion;
  objc_msgSend(v214, "allergiesListVersion");
  v189 = objc_claimAutoreleasedReturnValue();
  if (allergiesListVersion == (NSNumber *)v189)
  {

    v194 = v214;
    goto LABEL_188;
  }
  allergiesListModifiedDate = (NSDate *)v189;
  objc_msgSend(v214, "allergiesListVersion");
  v190 = objc_claimAutoreleasedReturnValue();
  if (v190)
  {
    v191 = (void *)v190;
    v192 = self->_allergiesListVersion;
    objc_msgSend(v214, "allergiesListVersion");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[NSNumber isEqual:](v192, "isEqual:", v193);

    v194 = v214;
    if ((v3 & 1) != 0)
      goto LABEL_188;
    goto LABEL_185;
  }
LABEL_184:

LABEL_185:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v195 = (NSDate *)objc_claimAutoreleasedReturnValue();
  allergiesListVersionModifiedDate = self->_allergiesListVersionModifiedDate;
  self->_allergiesListVersionModifiedDate = v195;

  v194 = v214;
  if (!v214)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v197 = (NSDate *)objc_claimAutoreleasedReturnValue();
    conditionsListModifiedDate = self->_conditionsListModifiedDate;
    self->_conditionsListModifiedDate = v197;
    goto LABEL_207;
  }
LABEL_188:
  conditionsList = self->_conditionsList;
  objc_msgSend(v194, "conditionsList");
  v200 = objc_claimAutoreleasedReturnValue();
  if (conditionsList == (NSArray *)v200)
  {
    v201 = (NSDate *)conditionsList;
    goto LABEL_202;
  }
  v201 = (NSDate *)v200;
  objc_msgSend(v214, "conditionsList");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = self->_conditionsList;
  if (v202)
  {
    objc_msgSend(v214, "conditionsList");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](v203, "isEqual:", v3))
    {

LABEL_202:
      goto LABEL_203;
    }
    if (-[NSArray count](self->_conditionsList, "count"))
    {

      goto LABEL_197;
    }
  }
  else if (-[NSArray count](self->_conditionsList, "count"))
  {
LABEL_197:

LABEL_201:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v206 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v201 = self->_conditionsListModifiedDate;
    self->_conditionsListModifiedDate = v206;
    goto LABEL_202;
  }
  objc_msgSend(v214, "conditionsList");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = objc_msgSend(v204, "count");

  if (v202)
  {

  }
  if (v205)
    goto LABEL_201;
LABEL_203:
  conditionsListVersion = self->_conditionsListVersion;
  objc_msgSend(v214, "conditionsListVersion");
  v208 = objc_claimAutoreleasedReturnValue();
  if (conditionsListVersion != (void *)v208)
  {
    conditionsListModifiedDate = (NSDate *)v208;
    objc_msgSend(v214, "conditionsListVersion");
    v209 = objc_claimAutoreleasedReturnValue();
    if (v209)
    {
      v210 = (void *)v209;
      v211 = self->_conditionsListVersion;
      objc_msgSend(v214, "conditionsListVersion");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v211) = -[NSNumber isEqual:](v211, "isEqual:", v212);

      if ((v211 & 1) != 0)
        goto LABEL_210;
      goto LABEL_208;
    }
LABEL_207:

LABEL_208:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v213 = (NSDate *)objc_claimAutoreleasedReturnValue();
    conditionsListVersion = self->_conditionsListVersionModifiedDate;
    self->_conditionsListVersionModifiedDate = v213;
  }

LABEL_210:
}

- (void)setModificationDatesToCurrentDate
{
  NSDate *v3;
  NSDate *conditionsListVersionModifiedDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_isDisabledModifiedDate, v3);
  objc_storeStrong((id *)&self->_shareDuringEmergencyModifiedDate, v3);
  objc_storeStrong((id *)&self->_pictureDataModifiedDate, v3);
  objc_storeStrong((id *)&self->_nameModifiedDate, v3);
  objc_storeStrong((id *)&self->_gregorianBirthdayModifiedDate, v3);
  objc_storeStrong((id *)&self->_primaryLanguageCodeModifiedDate, v3);
  objc_storeStrong((id *)&self->_heightModifiedDate, v3);
  objc_storeStrong((id *)&self->_weightModifiedDate, v3);
  objc_storeStrong((id *)&self->_bloodTypeModifiedDate, v3);
  objc_storeStrong((id *)&self->_isOrganDonorModifiedDate, v3);
  objc_storeStrong((id *)&self->_emergencyContactsModifiedDate, v3);
  objc_storeStrong((id *)&self->_clinicalContactsModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicalConditionsModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicalNotesModifiedDate, v3);
  objc_storeStrong((id *)&self->_allergyInfoModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicationInfoModifiedDate, v3);
  objc_storeStrong((id *)&self->_pregnancyStartDateModifiedDate, v3);
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDateModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicationsListModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicationsListVersionModifiedDate, v3);
  objc_storeStrong((id *)&self->_allergiesListModifiedDate, v3);
  objc_storeStrong((id *)&self->_allergiesListVersionModifiedDate, v3);
  objc_storeStrong((id *)&self->_conditionsListModifiedDate, v3);
  conditionsListVersionModifiedDate = self->_conditionsListVersionModifiedDate;
  self->_conditionsListVersionModifiedDate = v3;

}

- (id)_gregorianUtcCalendar
{
  if (_gregorianUtcCalendar_onceToken != -1)
    dispatch_once(&_gregorianUtcCalendar_onceToken, &__block_literal_global_94);
  return (id)_gregorianUtcCalendar__calendar;
}

- (id)merge:(id)a3
{
  _HKMedicalIDData *v4;
  _HKMedicalIDData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  _HKMedicalIDData *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL8 v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  _HKMedicalIDData *v34;
  void *v35;
  void *v36;
  int v37;
  _BOOL8 v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  _HKMedicalIDData *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  _HKMedicalIDData *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  int v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  _HKMedicalIDData *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  NSObject *v143;
  void *v144;
  NSObject *v145;
  void *v146;
  _HKMedicalIDData *v147;
  void *v148;
  void *v149;
  NSObject *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  void *v171;
  NSObject *v172;
  void *v173;
  NSObject *v174;
  void *v175;
  _HKMedicalIDData *v176;
  void *v177;
  void *v178;
  NSObject *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  int v195;
  void *v196;
  void *v197;
  int v198;
  void *v199;
  void *v200;
  NSObject *v201;
  void *v202;
  NSObject *v203;
  void *v204;
  _HKMedicalIDData *v205;
  void *v206;
  void *v207;
  NSObject *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  int v224;
  void *v225;
  void *v226;
  int v227;
  void *v228;
  void *v229;
  NSObject *v230;
  void *v231;
  NSObject *v232;
  void *v233;
  _HKMedicalIDData *v234;
  void *v235;
  void *v236;
  NSObject *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  int v253;
  uint64_t v254;
  void *v255;
  _HKMedicalIDData *v256;
  void *v257;
  void *v258;
  int v259;
  int64_t v260;
  NSObject *v261;
  int64_t v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  int v272;
  void *v273;
  void *v274;
  int v275;
  void *v276;
  void *v277;
  NSObject *v278;
  void *v279;
  NSObject *v280;
  void *v281;
  _HKMedicalIDData *v282;
  void *v283;
  void *v284;
  NSObject *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  int v301;
  void *v302;
  void *v303;
  int v304;
  void *v305;
  void *v306;
  NSObject *v307;
  void *v308;
  NSObject *v309;
  void *v310;
  _HKMedicalIDData *v311;
  void *v312;
  void *v313;
  NSObject *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  int v330;
  void *v331;
  void *v332;
  int v333;
  void *v334;
  void *v335;
  NSObject *v336;
  void *v337;
  NSObject *v338;
  void *v339;
  _HKMedicalIDData *v340;
  void *v341;
  void *v342;
  NSObject *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  int v359;
  void *v360;
  void *v361;
  int v362;
  void *v363;
  void *v364;
  NSObject *v365;
  void *v366;
  NSObject *v367;
  void *v368;
  _HKMedicalIDData *v369;
  void *v370;
  void *v371;
  NSObject *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  int v388;
  void *v389;
  void *v390;
  int v391;
  void *v392;
  void *v393;
  NSObject *v394;
  void *v395;
  NSObject *v396;
  void *v397;
  _HKMedicalIDData *v398;
  void *v399;
  void *v400;
  NSObject *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  int v417;
  void *v418;
  void *v419;
  int v420;
  void *v421;
  void *v422;
  NSObject *v423;
  void *v424;
  NSObject *v425;
  void *v426;
  _HKMedicalIDData *v427;
  void *v428;
  void *v429;
  NSObject *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  int v446;
  void *v447;
  void *v448;
  int v449;
  void *v450;
  void *v451;
  NSObject *v452;
  void *v453;
  NSObject *v454;
  void *v455;
  _HKMedicalIDData *v456;
  void *v457;
  void *v458;
  NSObject *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  int v475;
  void *v476;
  void *v477;
  int v478;
  void *v479;
  void *v480;
  NSObject *v481;
  void *v482;
  NSObject *v483;
  void *v484;
  _HKMedicalIDData *v485;
  void *v486;
  void *v487;
  NSObject *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  int v504;
  void *v505;
  void *v506;
  int v507;
  void *v508;
  void *v509;
  NSObject *v510;
  void *v511;
  NSObject *v512;
  void *v513;
  _HKMedicalIDData *v514;
  void *v515;
  void *v516;
  NSObject *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  int v533;
  void *v534;
  void *v535;
  int v536;
  void *v537;
  void *v538;
  NSObject *v539;
  void *v540;
  NSObject *v541;
  void *v542;
  _HKMedicalIDData *v543;
  void *v544;
  void *v545;
  NSObject *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  int v562;
  void *v563;
  void *v564;
  int v565;
  void *v566;
  void *v567;
  NSObject *v568;
  void *v569;
  NSObject *v570;
  void *v571;
  _HKMedicalIDData *v572;
  void *v573;
  void *v574;
  NSObject *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  int v591;
  void *v592;
  void *v593;
  int v594;
  void *v595;
  void *v596;
  NSObject *v597;
  void *v598;
  NSObject *v599;
  void *v600;
  _HKMedicalIDData *v601;
  void *v602;
  void *v603;
  NSObject *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  int v620;
  void *v621;
  void *v622;
  int v623;
  void *v624;
  void *v625;
  NSObject *v626;
  void *v627;
  NSObject *v628;
  void *v629;
  _HKMedicalIDData *v630;
  void *v631;
  void *v632;
  NSObject *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  int v649;
  void *v650;
  void *v651;
  int v652;
  void *v653;
  void *v654;
  NSObject *v655;
  void *v656;
  NSObject *v657;
  void *v658;
  _HKMedicalIDData *v659;
  void *v660;
  void *v661;
  NSObject *v662;
  void *v663;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  _HKMedicalIDData *v672;

  v4 = (_HKMedicalIDData *)a3;
  v5 = objc_alloc_init(_HKMedicalIDData);
  -[_HKMedicalIDData isDisabledModifiedDate](self, "isDisabledModifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[_HKMedicalIDData isDisabledModifiedDate](v4, "isDisabledModifiedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v21 = -[_HKMedicalIDData isDisabled](self, "isDisabled");
      if (v21 != -[_HKMedicalIDData isDisabled](v4, "isDisabled"))
      {
        _HKInitializeLogging();
        v20 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.68();
        goto LABEL_15;
      }
LABEL_16:
      v19 = -[_HKMedicalIDData isDisabled](self, "isDisabled");
      goto LABEL_17;
    }
  }
  -[_HKMedicalIDData isDisabledModifiedDate](self, "isDisabledModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_7:
    v13 = -[_HKMedicalIDData isDisabled](v4, "isDisabled");
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsDisabled:", v13);

    v15 = v4;
    goto LABEL_18;
  }
  -[_HKMedicalIDData isDisabledModifiedDate](v4, "isDisabledModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_16;
  -[_HKMedicalIDData isDisabledModifiedDate](self, "isDisabledModifiedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData isDisabledModifiedDate](v4, "isDisabledModifiedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

  if (v12)
    goto LABEL_7;
  -[_HKMedicalIDData isDisabledModifiedDate](self, "isDisabledModifiedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData isDisabledModifiedDate](v4, "isDisabledModifiedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "hk_isAfterDate:", v17);

  v19 = -[_HKMedicalIDData isDisabled](self, "isDisabled");
  if (!v18)
  {
    if (v19 != -[_HKMedicalIDData isDisabled](v4, "isDisabled"))
    {
      _HKInitializeLogging();
      v20 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_HKMedicalIDData merge:].cold.69();
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIsDisabled:", v19);

  v15 = self;
LABEL_18:
  -[_HKMedicalIDData isDisabledModifiedDate](v15, "isDisabledModifiedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setIsDisabledModifiedDate:", v23);

  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](self, "shareDuringEmergencyModifiedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    -[_HKMedicalIDData shareDuringEmergencyModifiedDate](v4, "shareDuringEmergencyModifiedDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v40 = -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency");
      if (v40 != -[_HKMedicalIDData shareDuringEmergency](v4, "shareDuringEmergency"))
      {
        _HKInitializeLogging();
        v39 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.66();
        goto LABEL_32;
      }
LABEL_33:
      v38 = -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency");
      goto LABEL_34;
    }
  }
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](self, "shareDuringEmergencyModifiedDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
LABEL_24:
    v32 = -[_HKMedicalIDData shareDuringEmergency](v4, "shareDuringEmergency");
    objc_opt_self();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setShareDuringEmergency:", v32);

    v34 = v4;
    goto LABEL_35;
  }
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](v4, "shareDuringEmergencyModifiedDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    goto LABEL_33;
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](self, "shareDuringEmergencyModifiedDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](v4, "shareDuringEmergencyModifiedDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "hk_isBeforeDate:", v30);

  if (v31)
    goto LABEL_24;
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](self, "shareDuringEmergencyModifiedDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](v4, "shareDuringEmergencyModifiedDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "hk_isAfterDate:", v36);

  v38 = -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency");
  if (!v37)
  {
    if (v38 != -[_HKMedicalIDData shareDuringEmergency](v4, "shareDuringEmergency"))
    {
      _HKInitializeLogging();
      v39 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[_HKMedicalIDData merge:].cold.67();
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
LABEL_34:
  objc_opt_self();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setShareDuringEmergency:", v38);

  v34 = self;
LABEL_35:
  -[_HKMedicalIDData shareDuringEmergencyModifiedDate](v34, "shareDuringEmergencyModifiedDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setShareDuringEmergencyModifiedDate:", v42);

  -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {

  }
  else
  {
    -[_HKMedicalIDData pictureDataModifiedDate](v4, "pictureDataModifiedDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      -[_HKMedicalIDData pictureData](self, "pictureData");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData pictureData](v4, "pictureData");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61 != v62)
      {
        _HKInitializeLogging();
        v63 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.63();

      }
      -[_HKMedicalIDData pictureData](self, "pictureData");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData pictureData](self, "pictureData");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v65)
          goto LABEL_59;
        -[_HKMedicalIDData pictureData](self, "pictureData");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setPictureData:", v66);

        -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setPictureDataModifiedDate:", v64);

      }
      goto LABEL_59;
    }
  }
  -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[_HKMedicalIDData pictureDataModifiedDate](v4, "pictureDataModifiedDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
      goto LABEL_49;
    -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData pictureDataModifiedDate](v4, "pictureDataModifiedDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "hk_isBeforeDate:", v49);

    if (!v50)
    {
      -[_HKMedicalIDData pictureDataModifiedDate](self, "pictureDataModifiedDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData pictureDataModifiedDate](v4, "pictureDataModifiedDate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "hk_isAfterDate:", v52);

      -[_HKMedicalIDData pictureData](self, "pictureData");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
LABEL_50:
        objc_opt_self();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setPictureData:", v54);

        v60 = self;
        goto LABEL_60;
      }
      -[_HKMedicalIDData pictureData](v4, "pictureData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54 != v55)
      {
        _HKInitializeLogging();
        v56 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.65();

        -[_HKMedicalIDData pictureData](self, "pictureData");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v57)
        {
          _HKInitializeLogging();
          v58 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.64();

        }
      }
LABEL_49:
      -[_HKMedicalIDData pictureData](self, "pictureData");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    }
  }
LABEL_59:
  -[_HKMedicalIDData pictureData](v4, "pictureData");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setPictureData:", v69);

  v60 = v4;
LABEL_60:
  -[_HKMedicalIDData pictureDataModifiedDate](v60, "pictureDataModifiedDate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setPictureDataModifiedDate:", v71);

  -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {

  }
  else
  {
    -[_HKMedicalIDData nameModifiedDate](v4, "nameModifiedDate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v74)
    {
      -[_HKMedicalIDData name](self, "name");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData name](v4, "name");
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      if (v90 != v91)
      {
        _HKInitializeLogging();
        v92 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.60();

      }
      -[_HKMedicalIDData name](self, "name");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData name](self, "name");
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v94)
          goto LABEL_84;
        -[_HKMedicalIDData name](self, "name");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setName:", v95);

        -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setNameModifiedDate:", v93);

      }
      goto LABEL_84;
    }
  }
  -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[_HKMedicalIDData nameModifiedDate](v4, "nameModifiedDate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v76)
      goto LABEL_74;
    -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData nameModifiedDate](v4, "nameModifiedDate");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "hk_isBeforeDate:", v78);

    if (!v79)
    {
      -[_HKMedicalIDData nameModifiedDate](self, "nameModifiedDate");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData nameModifiedDate](v4, "nameModifiedDate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "hk_isAfterDate:", v81);

      -[_HKMedicalIDData name](self, "name");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v82)
      {
LABEL_75:
        objc_opt_self();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setName:", v83);

        v89 = self;
        goto LABEL_85;
      }
      -[_HKMedicalIDData name](v4, "name");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v83 != v84)
      {
        _HKInitializeLogging();
        v85 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.62();

        -[_HKMedicalIDData name](self, "name");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v86)
        {
          _HKInitializeLogging();
          v87 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.61();

        }
      }
LABEL_74:
      -[_HKMedicalIDData name](self, "name");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    }
  }
LABEL_84:
  -[_HKMedicalIDData name](v4, "name");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setName:", v98);

  v89 = v4;
LABEL_85:
  -[_HKMedicalIDData nameModifiedDate](v89, "nameModifiedDate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setNameModifiedDate:", v100);

  -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
  {

  }
  else
  {
    -[_HKMedicalIDData gregorianBirthdayModifiedDate](v4, "gregorianBirthdayModifiedDate");
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v103)
    {
      -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData gregorianBirthday](v4, "gregorianBirthday");
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      if (v119 != v120)
      {
        _HKInitializeLogging();
        v121 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.57();

      }
      -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v123)
          goto LABEL_109;
        -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setGregorianBirthday:", v124);

        -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "setGregorianBirthdayModifiedDate:", v122);

      }
      goto LABEL_109;
    }
  }
  -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    -[_HKMedicalIDData gregorianBirthdayModifiedDate](v4, "gregorianBirthdayModifiedDate");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v105)
      goto LABEL_99;
    -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData gregorianBirthdayModifiedDate](v4, "gregorianBirthdayModifiedDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v106, "hk_isBeforeDate:", v107);

    if (!v108)
    {
      -[_HKMedicalIDData gregorianBirthdayModifiedDate](self, "gregorianBirthdayModifiedDate");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData gregorianBirthdayModifiedDate](v4, "gregorianBirthdayModifiedDate");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v109, "hk_isAfterDate:", v110);

      -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (v111)
      {
LABEL_100:
        objc_opt_self();
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setGregorianBirthday:", v112);

        v118 = self;
        goto LABEL_110;
      }
      -[_HKMedicalIDData gregorianBirthday](v4, "gregorianBirthday");
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      if (v112 != v113)
      {
        _HKInitializeLogging();
        v114 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.59();

        -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v115)
        {
          _HKInitializeLogging();
          v116 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.58();

        }
      }
LABEL_99:
      -[_HKMedicalIDData gregorianBirthday](self, "gregorianBirthday");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_100;
    }
  }
LABEL_109:
  -[_HKMedicalIDData gregorianBirthday](v4, "gregorianBirthday");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setGregorianBirthday:", v127);

  v118 = v4;
LABEL_110:
  -[_HKMedicalIDData gregorianBirthdayModifiedDate](v118, "gregorianBirthdayModifiedDate");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setGregorianBirthdayModifiedDate:", v129);

  -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
  {

  }
  else
  {
    -[_HKMedicalIDData primaryLanguageCodeModifiedDate](v4, "primaryLanguageCodeModifiedDate");
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v132)
    {
      -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData primaryLanguageCode](v4, "primaryLanguageCode");
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      if (v148 != v149)
      {
        _HKInitializeLogging();
        v150 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.54();

      }
      -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v152)
          goto LABEL_134;
        -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "setPrimaryLanguageCode:", v153);

        -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "setPrimaryLanguageCodeModifiedDate:", v151);

      }
      goto LABEL_134;
    }
  }
  -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v133)
  {
    -[_HKMedicalIDData primaryLanguageCodeModifiedDate](v4, "primaryLanguageCodeModifiedDate");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v134)
      goto LABEL_124;
    -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData primaryLanguageCodeModifiedDate](v4, "primaryLanguageCodeModifiedDate");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "hk_isBeforeDate:", v136);

    if (!v137)
    {
      -[_HKMedicalIDData primaryLanguageCodeModifiedDate](self, "primaryLanguageCodeModifiedDate");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData primaryLanguageCodeModifiedDate](v4, "primaryLanguageCodeModifiedDate");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v138, "hk_isAfterDate:", v139);

      -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      if (v140)
      {
LABEL_125:
        objc_opt_self();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "setPrimaryLanguageCode:", v141);

        v147 = self;
        goto LABEL_135;
      }
      -[_HKMedicalIDData primaryLanguageCode](v4, "primaryLanguageCode");
      v142 = (void *)objc_claimAutoreleasedReturnValue();

      if (v141 != v142)
      {
        _HKInitializeLogging();
        v143 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.56();

        -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
        v144 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v144)
        {
          _HKInitializeLogging();
          v145 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.55();

        }
      }
LABEL_124:
      -[_HKMedicalIDData primaryLanguageCode](self, "primaryLanguageCode");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_125;
    }
  }
LABEL_134:
  -[_HKMedicalIDData primaryLanguageCode](v4, "primaryLanguageCode");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setPrimaryLanguageCode:", v156);

  v147 = v4;
LABEL_135:
  -[_HKMedicalIDData primaryLanguageCodeModifiedDate](v147, "primaryLanguageCodeModifiedDate");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "setPrimaryLanguageCodeModifiedDate:", v158);

  -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  if (v160)
  {

  }
  else
  {
    -[_HKMedicalIDData heightModifiedDate](v4, "heightModifiedDate");
    v161 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v161)
    {
      -[_HKMedicalIDData height](self, "height");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData height](v4, "height");
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      if (v177 != v178)
      {
        _HKInitializeLogging();
        v179 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.51();

      }
      -[_HKMedicalIDData height](self, "height");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData height](self, "height");
        v181 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v181)
          goto LABEL_159;
        -[_HKMedicalIDData height](self, "height");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "setHeight:", v182);

        -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "setHeightModifiedDate:", v180);

      }
      goto LABEL_159;
    }
  }
  -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  if (v162)
  {
    -[_HKMedicalIDData heightModifiedDate](v4, "heightModifiedDate");
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v163)
      goto LABEL_149;
    -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData heightModifiedDate](v4, "heightModifiedDate");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v164, "hk_isBeforeDate:", v165);

    if (!v166)
    {
      -[_HKMedicalIDData heightModifiedDate](self, "heightModifiedDate");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData heightModifiedDate](v4, "heightModifiedDate");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = objc_msgSend(v167, "hk_isAfterDate:", v168);

      -[_HKMedicalIDData height](self, "height");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      if (v169)
      {
LABEL_150:
        objc_opt_self();
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "setHeight:", v170);

        v176 = self;
        goto LABEL_160;
      }
      -[_HKMedicalIDData height](v4, "height");
      v171 = (void *)objc_claimAutoreleasedReturnValue();

      if (v170 != v171)
      {
        _HKInitializeLogging();
        v172 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.53();

        -[_HKMedicalIDData height](self, "height");
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v173)
        {
          _HKInitializeLogging();
          v174 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.52();

        }
      }
LABEL_149:
      -[_HKMedicalIDData height](self, "height");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_150;
    }
  }
LABEL_159:
  -[_HKMedicalIDData height](v4, "height");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "setHeight:", v185);

  v176 = v4;
LABEL_160:
  -[_HKMedicalIDData heightModifiedDate](v176, "heightModifiedDate");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "setHeightModifiedDate:", v187);

  -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (v189)
  {

  }
  else
  {
    -[_HKMedicalIDData weightModifiedDate](v4, "weightModifiedDate");
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v190)
    {
      -[_HKMedicalIDData weight](self, "weight");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData weight](v4, "weight");
      v207 = (void *)objc_claimAutoreleasedReturnValue();

      if (v206 != v207)
      {
        _HKInitializeLogging();
        v208 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v208, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.48();

      }
      -[_HKMedicalIDData weight](self, "weight");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData weight](self, "weight");
        v210 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v210)
          goto LABEL_184;
        -[_HKMedicalIDData weight](self, "weight");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v212, "setWeight:", v211);

        -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v213, "setWeightModifiedDate:", v209);

      }
      goto LABEL_184;
    }
  }
  -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  if (v191)
  {
    -[_HKMedicalIDData weightModifiedDate](v4, "weightModifiedDate");
    v192 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v192)
      goto LABEL_174;
    -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData weightModifiedDate](v4, "weightModifiedDate");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = objc_msgSend(v193, "hk_isBeforeDate:", v194);

    if (!v195)
    {
      -[_HKMedicalIDData weightModifiedDate](self, "weightModifiedDate");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData weightModifiedDate](v4, "weightModifiedDate");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = objc_msgSend(v196, "hk_isAfterDate:", v197);

      -[_HKMedicalIDData weight](self, "weight");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      if (v198)
      {
LABEL_175:
        objc_opt_self();
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "setWeight:", v199);

        v205 = self;
        goto LABEL_185;
      }
      -[_HKMedicalIDData weight](v4, "weight");
      v200 = (void *)objc_claimAutoreleasedReturnValue();

      if (v199 != v200)
      {
        _HKInitializeLogging();
        v201 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.50();

        -[_HKMedicalIDData weight](self, "weight");
        v202 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v202)
        {
          _HKInitializeLogging();
          v203 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.49();

        }
      }
LABEL_174:
      -[_HKMedicalIDData weight](self, "weight");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_175;
    }
  }
LABEL_184:
  -[_HKMedicalIDData weight](v4, "weight");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "setWeight:", v214);

  v205 = v4;
LABEL_185:
  -[_HKMedicalIDData weightModifiedDate](v205, "weightModifiedDate");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "setWeightModifiedDate:", v216);

  -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  if (v218)
  {

  }
  else
  {
    -[_HKMedicalIDData isOrganDonorModifiedDate](v4, "isOrganDonorModifiedDate");
    v219 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v219)
    {
      -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData isOrganDonor](v4, "isOrganDonor");
      v236 = (void *)objc_claimAutoreleasedReturnValue();

      if (v235 != v236)
      {
        _HKInitializeLogging();
        v237 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.45();

      }
      -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
        v239 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v239)
          goto LABEL_209;
        -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v241, "setIsOrganDonor:", v240);

        -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v242, "setIsOrganDonorModifiedDate:", v238);

      }
      goto LABEL_209;
    }
  }
  -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  if (v220)
  {
    -[_HKMedicalIDData isOrganDonorModifiedDate](v4, "isOrganDonorModifiedDate");
    v221 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v221)
      goto LABEL_199;
    -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData isOrganDonorModifiedDate](v4, "isOrganDonorModifiedDate");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = objc_msgSend(v222, "hk_isBeforeDate:", v223);

    if (!v224)
    {
      -[_HKMedicalIDData isOrganDonorModifiedDate](self, "isOrganDonorModifiedDate");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData isOrganDonorModifiedDate](v4, "isOrganDonorModifiedDate");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      v227 = objc_msgSend(v225, "hk_isAfterDate:", v226);

      -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      if (v227)
      {
LABEL_200:
        objc_opt_self();
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "setIsOrganDonor:", v228);

        v234 = self;
        goto LABEL_210;
      }
      -[_HKMedicalIDData isOrganDonor](v4, "isOrganDonor");
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      if (v228 != v229)
      {
        _HKInitializeLogging();
        v230 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.47();

        -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
        v231 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v231)
        {
          _HKInitializeLogging();
          v232 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.46();

        }
      }
LABEL_199:
      -[_HKMedicalIDData isOrganDonor](self, "isOrganDonor");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_200;
    }
  }
LABEL_209:
  -[_HKMedicalIDData isOrganDonor](v4, "isOrganDonor");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setIsOrganDonor:", v243);

  v234 = v4;
LABEL_210:
  -[_HKMedicalIDData isOrganDonorModifiedDate](v234, "isOrganDonorModifiedDate");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setIsOrganDonorModifiedDate:", v245);

  -[_HKMedicalIDData bloodTypeModifiedDate](self, "bloodTypeModifiedDate");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  if (v247)
  {

  }
  else
  {
    -[_HKMedicalIDData bloodTypeModifiedDate](v4, "bloodTypeModifiedDate");
    v248 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v248)
    {
      v262 = -[_HKMedicalIDData bloodType](self, "bloodType");
      if (v262 != -[_HKMedicalIDData bloodType](v4, "bloodType"))
      {
        _HKInitializeLogging();
        v261 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.43();
        goto LABEL_224;
      }
LABEL_225:
      v260 = -[_HKMedicalIDData bloodType](self, "bloodType");
      goto LABEL_226;
    }
  }
  -[_HKMedicalIDData bloodTypeModifiedDate](self, "bloodTypeModifiedDate");
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v249)
  {
LABEL_216:
    v254 = -[_HKMedicalIDData bloodType](v4, "bloodType");
    objc_opt_self();
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "setBloodType:", v254);

    v256 = v4;
    goto LABEL_227;
  }
  -[_HKMedicalIDData bloodTypeModifiedDate](v4, "bloodTypeModifiedDate");
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v250)
    goto LABEL_225;
  -[_HKMedicalIDData bloodTypeModifiedDate](self, "bloodTypeModifiedDate");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData bloodTypeModifiedDate](v4, "bloodTypeModifiedDate");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v253 = objc_msgSend(v251, "hk_isBeforeDate:", v252);

  if (v253)
    goto LABEL_216;
  -[_HKMedicalIDData bloodTypeModifiedDate](self, "bloodTypeModifiedDate");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData bloodTypeModifiedDate](v4, "bloodTypeModifiedDate");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = objc_msgSend(v257, "hk_isAfterDate:", v258);

  v260 = -[_HKMedicalIDData bloodType](self, "bloodType");
  if (!v259)
  {
    if (v260 != -[_HKMedicalIDData bloodType](v4, "bloodType"))
    {
      _HKInitializeLogging();
      v261 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
        -[_HKMedicalIDData merge:].cold.44();
LABEL_224:

      goto LABEL_225;
    }
    goto LABEL_225;
  }
LABEL_226:
  objc_opt_self();
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v263, "setBloodType:", v260);

  v256 = self;
LABEL_227:
  -[_HKMedicalIDData bloodTypeModifiedDate](v256, "bloodTypeModifiedDate");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "setBloodTypeModifiedDate:", v264);

  -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  if (v266)
  {

  }
  else
  {
    -[_HKMedicalIDData emergencyContactsModifiedDate](v4, "emergencyContactsModifiedDate");
    v267 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v267)
    {
      -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData emergencyContacts](v4, "emergencyContacts");
      v284 = (void *)objc_claimAutoreleasedReturnValue();

      if (v283 != v284)
      {
        _HKInitializeLogging();
        v285 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.40();

      }
      -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
        v287 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v287)
          goto LABEL_251;
        -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v289, "setEmergencyContacts:", v288);

        -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "setEmergencyContactsModifiedDate:", v286);

      }
      goto LABEL_251;
    }
  }
  -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  if (v268)
  {
    -[_HKMedicalIDData emergencyContactsModifiedDate](v4, "emergencyContactsModifiedDate");
    v269 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v269)
      goto LABEL_241;
    -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData emergencyContactsModifiedDate](v4, "emergencyContactsModifiedDate");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = objc_msgSend(v270, "hk_isBeforeDate:", v271);

    if (!v272)
    {
      -[_HKMedicalIDData emergencyContactsModifiedDate](self, "emergencyContactsModifiedDate");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData emergencyContactsModifiedDate](v4, "emergencyContactsModifiedDate");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      v275 = objc_msgSend(v273, "hk_isAfterDate:", v274);

      -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      if (v275)
      {
LABEL_242:
        objc_opt_self();
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v281, "setEmergencyContacts:", v276);

        v282 = self;
        goto LABEL_252;
      }
      -[_HKMedicalIDData emergencyContacts](v4, "emergencyContacts");
      v277 = (void *)objc_claimAutoreleasedReturnValue();

      if (v276 != v277)
      {
        _HKInitializeLogging();
        v278 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.42();

        -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
        v279 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v279)
        {
          _HKInitializeLogging();
          v280 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.41();

        }
      }
LABEL_241:
      -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_242;
    }
  }
LABEL_251:
  -[_HKMedicalIDData emergencyContacts](v4, "emergencyContacts");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "setEmergencyContacts:", v291);

  v282 = v4;
LABEL_252:
  -[_HKMedicalIDData emergencyContactsModifiedDate](v282, "emergencyContactsModifiedDate");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "setEmergencyContactsModifiedDate:", v293);

  -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  if (v295)
  {

  }
  else
  {
    -[_HKMedicalIDData clinicalContactsModifiedDate](v4, "clinicalContactsModifiedDate");
    v296 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v296)
    {
      -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData clinicalContacts](v4, "clinicalContacts");
      v313 = (void *)objc_claimAutoreleasedReturnValue();

      if (v312 != v313)
      {
        _HKInitializeLogging();
        v314 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v314, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.37();

      }
      -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
        v316 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v316)
          goto LABEL_276;
        -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v318, "setClinicalContacts:", v317);

        -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v319, "setClinicalContactsModifiedDate:", v315);

      }
      goto LABEL_276;
    }
  }
  -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  if (v297)
  {
    -[_HKMedicalIDData clinicalContactsModifiedDate](v4, "clinicalContactsModifiedDate");
    v298 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v298)
      goto LABEL_266;
    -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData clinicalContactsModifiedDate](v4, "clinicalContactsModifiedDate");
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    v301 = objc_msgSend(v299, "hk_isBeforeDate:", v300);

    if (!v301)
    {
      -[_HKMedicalIDData clinicalContactsModifiedDate](self, "clinicalContactsModifiedDate");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData clinicalContactsModifiedDate](v4, "clinicalContactsModifiedDate");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      v304 = objc_msgSend(v302, "hk_isAfterDate:", v303);

      -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      if (v304)
      {
LABEL_267:
        objc_opt_self();
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v310, "setClinicalContacts:", v305);

        v311 = self;
        goto LABEL_277;
      }
      -[_HKMedicalIDData clinicalContacts](v4, "clinicalContacts");
      v306 = (void *)objc_claimAutoreleasedReturnValue();

      if (v305 != v306)
      {
        _HKInitializeLogging();
        v307 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v307, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.39();

        -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
        v308 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v308)
        {
          _HKInitializeLogging();
          v309 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.38();

        }
      }
LABEL_266:
      -[_HKMedicalIDData clinicalContacts](self, "clinicalContacts");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_267;
    }
  }
LABEL_276:
  -[_HKMedicalIDData clinicalContacts](v4, "clinicalContacts");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "setClinicalContacts:", v320);

  v311 = v4;
LABEL_277:
  -[_HKMedicalIDData clinicalContactsModifiedDate](v311, "clinicalContactsModifiedDate");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "setClinicalContactsModifiedDate:", v322);

  -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  if (v324)
  {

  }
  else
  {
    -[_HKMedicalIDData medicalConditionsModifiedDate](v4, "medicalConditionsModifiedDate");
    v325 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v325)
    {
      -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicalConditions](v4, "medicalConditions");
      v342 = (void *)objc_claimAutoreleasedReturnValue();

      if (v341 != v342)
      {
        _HKInitializeLogging();
        v343 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.34();

      }
      -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
        v345 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v345)
          goto LABEL_301;
        -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v347 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v347, "setMedicalConditions:", v346);

        -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v348 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v348, "setMedicalConditionsModifiedDate:", v344);

      }
      goto LABEL_301;
    }
  }
  -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
  v326 = (void *)objc_claimAutoreleasedReturnValue();

  if (v326)
  {
    -[_HKMedicalIDData medicalConditionsModifiedDate](v4, "medicalConditionsModifiedDate");
    v327 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v327)
      goto LABEL_291;
    -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData medicalConditionsModifiedDate](v4, "medicalConditionsModifiedDate");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    v330 = objc_msgSend(v328, "hk_isBeforeDate:", v329);

    if (!v330)
    {
      -[_HKMedicalIDData medicalConditionsModifiedDate](self, "medicalConditionsModifiedDate");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicalConditionsModifiedDate](v4, "medicalConditionsModifiedDate");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      v333 = objc_msgSend(v331, "hk_isAfterDate:", v332);

      -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      if (v333)
      {
LABEL_292:
        objc_opt_self();
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v339, "setMedicalConditions:", v334);

        v340 = self;
        goto LABEL_302;
      }
      -[_HKMedicalIDData medicalConditions](v4, "medicalConditions");
      v335 = (void *)objc_claimAutoreleasedReturnValue();

      if (v334 != v335)
      {
        _HKInitializeLogging();
        v336 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.36();

        -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
        v337 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v337)
        {
          _HKInitializeLogging();
          v338 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v338, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.35();

        }
      }
LABEL_291:
      -[_HKMedicalIDData medicalConditions](self, "medicalConditions");
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_292;
    }
  }
LABEL_301:
  -[_HKMedicalIDData medicalConditions](v4, "medicalConditions");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "setMedicalConditions:", v349);

  v340 = v4;
LABEL_302:
  -[_HKMedicalIDData medicalConditionsModifiedDate](v340, "medicalConditionsModifiedDate");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v352, "setMedicalConditionsModifiedDate:", v351);

  -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  if (v353)
  {

  }
  else
  {
    -[_HKMedicalIDData medicalNotesModifiedDate](v4, "medicalNotesModifiedDate");
    v354 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v354)
    {
      -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicalNotes](v4, "medicalNotes");
      v371 = (void *)objc_claimAutoreleasedReturnValue();

      if (v370 != v371)
      {
        _HKInitializeLogging();
        v372 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v372, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.31();

      }
      -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
      v373 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
        v374 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v374)
          goto LABEL_326;
        -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "setMedicalNotes:", v375);

        -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
        v373 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v377 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v377, "setMedicalNotesModifiedDate:", v373);

      }
      goto LABEL_326;
    }
  }
  -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
  v355 = (void *)objc_claimAutoreleasedReturnValue();

  if (v355)
  {
    -[_HKMedicalIDData medicalNotesModifiedDate](v4, "medicalNotesModifiedDate");
    v356 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v356)
      goto LABEL_316;
    -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
    v357 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData medicalNotesModifiedDate](v4, "medicalNotesModifiedDate");
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    v359 = objc_msgSend(v357, "hk_isBeforeDate:", v358);

    if (!v359)
    {
      -[_HKMedicalIDData medicalNotesModifiedDate](self, "medicalNotesModifiedDate");
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicalNotesModifiedDate](v4, "medicalNotesModifiedDate");
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      v362 = objc_msgSend(v360, "hk_isAfterDate:", v361);

      -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      if (v362)
      {
LABEL_317:
        objc_opt_self();
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v368, "setMedicalNotes:", v363);

        v369 = self;
        goto LABEL_327;
      }
      -[_HKMedicalIDData medicalNotes](v4, "medicalNotes");
      v364 = (void *)objc_claimAutoreleasedReturnValue();

      if (v363 != v364)
      {
        _HKInitializeLogging();
        v365 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v365, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.33();

        -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
        v366 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v366)
        {
          _HKInitializeLogging();
          v367 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v367, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.32();

        }
      }
LABEL_316:
      -[_HKMedicalIDData medicalNotes](self, "medicalNotes");
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_317;
    }
  }
LABEL_326:
  -[_HKMedicalIDData medicalNotes](v4, "medicalNotes");
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v379, "setMedicalNotes:", v378);

  v369 = v4;
LABEL_327:
  -[_HKMedicalIDData medicalNotesModifiedDate](v369, "medicalNotesModifiedDate");
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v381, "setMedicalNotesModifiedDate:", v380);

  -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  if (v382)
  {

  }
  else
  {
    -[_HKMedicalIDData allergyInfoModifiedDate](v4, "allergyInfoModifiedDate");
    v383 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v383)
    {
      -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData allergyInfo](v4, "allergyInfo");
      v400 = (void *)objc_claimAutoreleasedReturnValue();

      if (v399 != v400)
      {
        _HKInitializeLogging();
        v401 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.28();

      }
      -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
        v403 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v403)
          goto LABEL_351;
        -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
        v404 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v405 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v405, "setAllergyInfo:", v404);

        -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
        v402 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v406, "setAllergyInfoModifiedDate:", v402);

      }
      goto LABEL_351;
    }
  }
  -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
  v384 = (void *)objc_claimAutoreleasedReturnValue();

  if (v384)
  {
    -[_HKMedicalIDData allergyInfoModifiedDate](v4, "allergyInfoModifiedDate");
    v385 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v385)
      goto LABEL_341;
    -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData allergyInfoModifiedDate](v4, "allergyInfoModifiedDate");
    v387 = (void *)objc_claimAutoreleasedReturnValue();
    v388 = objc_msgSend(v386, "hk_isBeforeDate:", v387);

    if (!v388)
    {
      -[_HKMedicalIDData allergyInfoModifiedDate](self, "allergyInfoModifiedDate");
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData allergyInfoModifiedDate](v4, "allergyInfoModifiedDate");
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      v391 = objc_msgSend(v389, "hk_isAfterDate:", v390);

      -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      if (v391)
      {
LABEL_342:
        objc_opt_self();
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v397, "setAllergyInfo:", v392);

        v398 = self;
        goto LABEL_352;
      }
      -[_HKMedicalIDData allergyInfo](v4, "allergyInfo");
      v393 = (void *)objc_claimAutoreleasedReturnValue();

      if (v392 != v393)
      {
        _HKInitializeLogging();
        v394 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v394, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.30();

        -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
        v395 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v395)
        {
          _HKInitializeLogging();
          v396 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v396, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.29();

        }
      }
LABEL_341:
      -[_HKMedicalIDData allergyInfo](self, "allergyInfo");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_342;
    }
  }
LABEL_351:
  -[_HKMedicalIDData allergyInfo](v4, "allergyInfo");
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v408, "setAllergyInfo:", v407);

  v398 = v4;
LABEL_352:
  -[_HKMedicalIDData allergyInfoModifiedDate](v398, "allergyInfoModifiedDate");
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v410, "setAllergyInfoModifiedDate:", v409);

  -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  if (v411)
  {

  }
  else
  {
    -[_HKMedicalIDData medicationInfoModifiedDate](v4, "medicationInfoModifiedDate");
    v412 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v412)
    {
      -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicationInfo](v4, "medicationInfo");
      v429 = (void *)objc_claimAutoreleasedReturnValue();

      if (v428 != v429)
      {
        _HKInitializeLogging();
        v430 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v430, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.25();

      }
      -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
      v431 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
        v432 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v432)
          goto LABEL_376;
        -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
        v433 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v434 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v434, "setMedicationInfo:", v433);

        -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
        v431 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v435 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v435, "setMedicationInfoModifiedDate:", v431);

      }
      goto LABEL_376;
    }
  }
  -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
  v413 = (void *)objc_claimAutoreleasedReturnValue();

  if (v413)
  {
    -[_HKMedicalIDData medicationInfoModifiedDate](v4, "medicationInfoModifiedDate");
    v414 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v414)
      goto LABEL_366;
    -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData medicationInfoModifiedDate](v4, "medicationInfoModifiedDate");
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    v417 = objc_msgSend(v415, "hk_isBeforeDate:", v416);

    if (!v417)
    {
      -[_HKMedicalIDData medicationInfoModifiedDate](self, "medicationInfoModifiedDate");
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicationInfoModifiedDate](v4, "medicationInfoModifiedDate");
      v419 = (void *)objc_claimAutoreleasedReturnValue();
      v420 = objc_msgSend(v418, "hk_isAfterDate:", v419);

      -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
      v421 = (void *)objc_claimAutoreleasedReturnValue();
      if (v420)
      {
LABEL_367:
        objc_opt_self();
        v426 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v426, "setMedicationInfo:", v421);

        v427 = self;
        goto LABEL_377;
      }
      -[_HKMedicalIDData medicationInfo](v4, "medicationInfo");
      v422 = (void *)objc_claimAutoreleasedReturnValue();

      if (v421 != v422)
      {
        _HKInitializeLogging();
        v423 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v423, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.27();

        -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
        v424 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v424)
        {
          _HKInitializeLogging();
          v425 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v425, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.26();

        }
      }
LABEL_366:
      -[_HKMedicalIDData medicationInfo](self, "medicationInfo");
      v421 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_367;
    }
  }
LABEL_376:
  -[_HKMedicalIDData medicationInfo](v4, "medicationInfo");
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v437, "setMedicationInfo:", v436);

  v427 = v4;
LABEL_377:
  -[_HKMedicalIDData medicationInfoModifiedDate](v427, "medicationInfoModifiedDate");
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v439, "setMedicationInfoModifiedDate:", v438);

  -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  if (v440)
  {

  }
  else
  {
    -[_HKMedicalIDData pregnancyStartDateModifiedDate](v4, "pregnancyStartDateModifiedDate");
    v441 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v441)
    {
      -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
      v457 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData pregnancyStartDate](v4, "pregnancyStartDate");
      v458 = (void *)objc_claimAutoreleasedReturnValue();

      if (v457 != v458)
      {
        _HKInitializeLogging();
        v459 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v459, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.22();

      }
      -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
        v461 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v461)
          goto LABEL_401;
        -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
        v462 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v463 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v463, "setPregnancyStartDate:", v462);

        -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v464 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v464, "setPregnancyStartDateModifiedDate:", v460);

      }
      goto LABEL_401;
    }
  }
  -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
  v442 = (void *)objc_claimAutoreleasedReturnValue();

  if (v442)
  {
    -[_HKMedicalIDData pregnancyStartDateModifiedDate](v4, "pregnancyStartDateModifiedDate");
    v443 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v443)
      goto LABEL_391;
    -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
    v444 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData pregnancyStartDateModifiedDate](v4, "pregnancyStartDateModifiedDate");
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    v446 = objc_msgSend(v444, "hk_isBeforeDate:", v445);

    if (!v446)
    {
      -[_HKMedicalIDData pregnancyStartDateModifiedDate](self, "pregnancyStartDateModifiedDate");
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData pregnancyStartDateModifiedDate](v4, "pregnancyStartDateModifiedDate");
      v448 = (void *)objc_claimAutoreleasedReturnValue();
      v449 = objc_msgSend(v447, "hk_isAfterDate:", v448);

      -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      if (v449)
      {
LABEL_392:
        objc_opt_self();
        v455 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v455, "setPregnancyStartDate:", v450);

        v456 = self;
        goto LABEL_402;
      }
      -[_HKMedicalIDData pregnancyStartDate](v4, "pregnancyStartDate");
      v451 = (void *)objc_claimAutoreleasedReturnValue();

      if (v450 != v451)
      {
        _HKInitializeLogging();
        v452 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v452, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.24();

        -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
        v453 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v453)
        {
          _HKInitializeLogging();
          v454 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v454, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.23();

        }
      }
LABEL_391:
      -[_HKMedicalIDData pregnancyStartDate](self, "pregnancyStartDate");
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_392;
    }
  }
LABEL_401:
  -[_HKMedicalIDData pregnancyStartDate](v4, "pregnancyStartDate");
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v466, "setPregnancyStartDate:", v465);

  v456 = v4;
LABEL_402:
  -[_HKMedicalIDData pregnancyStartDateModifiedDate](v456, "pregnancyStartDateModifiedDate");
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v468, "setPregnancyStartDateModifiedDate:", v467);

  -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  if (v469)
  {

  }
  else
  {
    -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](v4, "pregnancyEstimatedDueDateModifiedDate");
    v470 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v470)
    {
      -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
      v486 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData pregnancyEstimatedDueDate](v4, "pregnancyEstimatedDueDate");
      v487 = (void *)objc_claimAutoreleasedReturnValue();

      if (v486 != v487)
      {
        _HKInitializeLogging();
        v488 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v488, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.19();

      }
      -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
      v489 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
        v490 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v490)
          goto LABEL_426;
        -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
        v491 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v492 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v492, "setPregnancyEstimatedDueDate:", v491);

        -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
        v489 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v493 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v493, "setPregnancyEstimatedDueDateModifiedDate:", v489);

      }
      goto LABEL_426;
    }
  }
  -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
  v471 = (void *)objc_claimAutoreleasedReturnValue();

  if (v471)
  {
    -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](v4, "pregnancyEstimatedDueDateModifiedDate");
    v472 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v472)
      goto LABEL_416;
    -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
    v473 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](v4, "pregnancyEstimatedDueDateModifiedDate");
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    v475 = objc_msgSend(v473, "hk_isBeforeDate:", v474);

    if (!v475)
    {
      -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](self, "pregnancyEstimatedDueDateModifiedDate");
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](v4, "pregnancyEstimatedDueDateModifiedDate");
      v477 = (void *)objc_claimAutoreleasedReturnValue();
      v478 = objc_msgSend(v476, "hk_isAfterDate:", v477);

      -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      if (v478)
      {
LABEL_417:
        objc_opt_self();
        v484 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v484, "setPregnancyEstimatedDueDate:", v479);

        v485 = self;
        goto LABEL_427;
      }
      -[_HKMedicalIDData pregnancyEstimatedDueDate](v4, "pregnancyEstimatedDueDate");
      v480 = (void *)objc_claimAutoreleasedReturnValue();

      if (v479 != v480)
      {
        _HKInitializeLogging();
        v481 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v481, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.21();

        -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
        v482 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v482)
        {
          _HKInitializeLogging();
          v483 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v483, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.20();

        }
      }
LABEL_416:
      -[_HKMedicalIDData pregnancyEstimatedDueDate](self, "pregnancyEstimatedDueDate");
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_417;
    }
  }
LABEL_426:
  -[_HKMedicalIDData pregnancyEstimatedDueDate](v4, "pregnancyEstimatedDueDate");
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v495, "setPregnancyEstimatedDueDate:", v494);

  v485 = v4;
LABEL_427:
  -[_HKMedicalIDData pregnancyEstimatedDueDateModifiedDate](v485, "pregnancyEstimatedDueDateModifiedDate");
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v497, "setPregnancyEstimatedDueDateModifiedDate:", v496);

  -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  if (v498)
  {

  }
  else
  {
    -[_HKMedicalIDData medicationsListModifiedDate](v4, "medicationsListModifiedDate");
    v499 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v499)
    {
      -[_HKMedicalIDData medicationsList](self, "medicationsList");
      v515 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicationsList](v4, "medicationsList");
      v516 = (void *)objc_claimAutoreleasedReturnValue();

      if (v515 != v516)
      {
        _HKInitializeLogging();
        v517 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v517, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.16();

      }
      -[_HKMedicalIDData medicationsList](self, "medicationsList");
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData medicationsList](self, "medicationsList");
        v519 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v519)
          goto LABEL_451;
        -[_HKMedicalIDData medicationsList](self, "medicationsList");
        v520 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v521 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v521, "setMedicationsList:", v520);

        -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
        v518 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v522 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v522, "setMedicationsListModifiedDate:", v518);

      }
      goto LABEL_451;
    }
  }
  -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
  v500 = (void *)objc_claimAutoreleasedReturnValue();

  if (v500)
  {
    -[_HKMedicalIDData medicationsListModifiedDate](v4, "medicationsListModifiedDate");
    v501 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v501)
      goto LABEL_441;
    -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
    v502 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData medicationsListModifiedDate](v4, "medicationsListModifiedDate");
    v503 = (void *)objc_claimAutoreleasedReturnValue();
    v504 = objc_msgSend(v502, "hk_isBeforeDate:", v503);

    if (!v504)
    {
      -[_HKMedicalIDData medicationsListModifiedDate](self, "medicationsListModifiedDate");
      v505 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicationsListModifiedDate](v4, "medicationsListModifiedDate");
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      v507 = objc_msgSend(v505, "hk_isAfterDate:", v506);

      -[_HKMedicalIDData medicationsList](self, "medicationsList");
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      if (v507)
      {
LABEL_442:
        objc_opt_self();
        v513 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v513, "setMedicationsList:", v508);

        v514 = self;
        goto LABEL_452;
      }
      -[_HKMedicalIDData medicationsList](v4, "medicationsList");
      v509 = (void *)objc_claimAutoreleasedReturnValue();

      if (v508 != v509)
      {
        _HKInitializeLogging();
        v510 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v510, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.18();

        -[_HKMedicalIDData medicationsList](self, "medicationsList");
        v511 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v511)
        {
          _HKInitializeLogging();
          v512 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v512, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.17();

        }
      }
LABEL_441:
      -[_HKMedicalIDData medicationsList](self, "medicationsList");
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_442;
    }
  }
LABEL_451:
  -[_HKMedicalIDData medicationsList](v4, "medicationsList");
  v523 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v524, "setMedicationsList:", v523);

  v514 = v4;
LABEL_452:
  -[_HKMedicalIDData medicationsListModifiedDate](v514, "medicationsListModifiedDate");
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v526, "setMedicationsListModifiedDate:", v525);

  -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  if (v527)
  {

  }
  else
  {
    -[_HKMedicalIDData medicationsListVersionModifiedDate](v4, "medicationsListVersionModifiedDate");
    v528 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v528)
    {
      -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicationsListVersion](v4, "medicationsListVersion");
      v545 = (void *)objc_claimAutoreleasedReturnValue();

      if (v544 != v545)
      {
        _HKInitializeLogging();
        v546 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v546, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.13();

      }
      -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
      v547 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
        v548 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v548)
          goto LABEL_476;
        -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
        v549 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v550 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v550, "setMedicationsListVersion:", v549);

        -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
        v547 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v551 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v551, "setMedicationsListVersionModifiedDate:", v547);

      }
      goto LABEL_476;
    }
  }
  -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
  v529 = (void *)objc_claimAutoreleasedReturnValue();

  if (v529)
  {
    -[_HKMedicalIDData medicationsListVersionModifiedDate](v4, "medicationsListVersionModifiedDate");
    v530 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v530)
      goto LABEL_466;
    -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
    v531 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData medicationsListVersionModifiedDate](v4, "medicationsListVersionModifiedDate");
    v532 = (void *)objc_claimAutoreleasedReturnValue();
    v533 = objc_msgSend(v531, "hk_isBeforeDate:", v532);

    if (!v533)
    {
      -[_HKMedicalIDData medicationsListVersionModifiedDate](self, "medicationsListVersionModifiedDate");
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData medicationsListVersionModifiedDate](v4, "medicationsListVersionModifiedDate");
      v535 = (void *)objc_claimAutoreleasedReturnValue();
      v536 = objc_msgSend(v534, "hk_isAfterDate:", v535);

      -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
      v537 = (void *)objc_claimAutoreleasedReturnValue();
      if (v536)
      {
LABEL_467:
        objc_opt_self();
        v542 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v542, "setMedicationsListVersion:", v537);

        v543 = self;
        goto LABEL_477;
      }
      -[_HKMedicalIDData medicationsListVersion](v4, "medicationsListVersion");
      v538 = (void *)objc_claimAutoreleasedReturnValue();

      if (v537 != v538)
      {
        _HKInitializeLogging();
        v539 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v539, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.15();

        -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
        v540 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v540)
        {
          _HKInitializeLogging();
          v541 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v541, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.14();

        }
      }
LABEL_466:
      -[_HKMedicalIDData medicationsListVersion](self, "medicationsListVersion");
      v537 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_467;
    }
  }
LABEL_476:
  -[_HKMedicalIDData medicationsListVersion](v4, "medicationsListVersion");
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v553, "setMedicationsListVersion:", v552);

  v543 = v4;
LABEL_477:
  -[_HKMedicalIDData medicationsListVersionModifiedDate](v543, "medicationsListVersionModifiedDate");
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v555, "setMedicationsListVersionModifiedDate:", v554);

  -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  if (v556)
  {

  }
  else
  {
    -[_HKMedicalIDData allergiesListModifiedDate](v4, "allergiesListModifiedDate");
    v557 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v557)
    {
      -[_HKMedicalIDData allergiesList](self, "allergiesList");
      v573 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData allergiesList](v4, "allergiesList");
      v574 = (void *)objc_claimAutoreleasedReturnValue();

      if (v573 != v574)
      {
        _HKInitializeLogging();
        v575 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v575, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.10();

      }
      -[_HKMedicalIDData allergiesList](self, "allergiesList");
      v576 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData allergiesList](self, "allergiesList");
        v577 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v577)
          goto LABEL_501;
        -[_HKMedicalIDData allergiesList](self, "allergiesList");
        v578 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v579 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v579, "setAllergiesList:", v578);

        -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
        v576 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v580 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v580, "setAllergiesListModifiedDate:", v576);

      }
      goto LABEL_501;
    }
  }
  -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
  v558 = (void *)objc_claimAutoreleasedReturnValue();

  if (v558)
  {
    -[_HKMedicalIDData allergiesListModifiedDate](v4, "allergiesListModifiedDate");
    v559 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v559)
      goto LABEL_491;
    -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
    v560 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData allergiesListModifiedDate](v4, "allergiesListModifiedDate");
    v561 = (void *)objc_claimAutoreleasedReturnValue();
    v562 = objc_msgSend(v560, "hk_isBeforeDate:", v561);

    if (!v562)
    {
      -[_HKMedicalIDData allergiesListModifiedDate](self, "allergiesListModifiedDate");
      v563 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData allergiesListModifiedDate](v4, "allergiesListModifiedDate");
      v564 = (void *)objc_claimAutoreleasedReturnValue();
      v565 = objc_msgSend(v563, "hk_isAfterDate:", v564);

      -[_HKMedicalIDData allergiesList](self, "allergiesList");
      v566 = (void *)objc_claimAutoreleasedReturnValue();
      if (v565)
      {
LABEL_492:
        objc_opt_self();
        v571 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v571, "setAllergiesList:", v566);

        v572 = self;
        goto LABEL_502;
      }
      -[_HKMedicalIDData allergiesList](v4, "allergiesList");
      v567 = (void *)objc_claimAutoreleasedReturnValue();

      if (v566 != v567)
      {
        _HKInitializeLogging();
        v568 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v568, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.12();

        -[_HKMedicalIDData allergiesList](self, "allergiesList");
        v569 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v569)
        {
          _HKInitializeLogging();
          v570 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v570, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.11();

        }
      }
LABEL_491:
      -[_HKMedicalIDData allergiesList](self, "allergiesList");
      v566 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_492;
    }
  }
LABEL_501:
  -[_HKMedicalIDData allergiesList](v4, "allergiesList");
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v582, "setAllergiesList:", v581);

  v572 = v4;
LABEL_502:
  -[_HKMedicalIDData allergiesListModifiedDate](v572, "allergiesListModifiedDate");
  v583 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v584, "setAllergiesListModifiedDate:", v583);

  -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  if (v585)
  {

  }
  else
  {
    -[_HKMedicalIDData allergiesListVersionModifiedDate](v4, "allergiesListVersionModifiedDate");
    v586 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v586)
    {
      -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
      v602 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData allergiesListVersion](v4, "allergiesListVersion");
      v603 = (void *)objc_claimAutoreleasedReturnValue();

      if (v602 != v603)
      {
        _HKInitializeLogging();
        v604 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v604, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.7();

      }
      -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
      v605 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
        v606 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v606)
          goto LABEL_526;
        -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
        v607 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v608 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v608, "setAllergiesListVersion:", v607);

        -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
        v605 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v609 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v609, "setAllergiesListVersionModifiedDate:", v605);

      }
      goto LABEL_526;
    }
  }
  -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
  v587 = (void *)objc_claimAutoreleasedReturnValue();

  if (v587)
  {
    -[_HKMedicalIDData allergiesListVersionModifiedDate](v4, "allergiesListVersionModifiedDate");
    v588 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v588)
      goto LABEL_516;
    -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
    v589 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData allergiesListVersionModifiedDate](v4, "allergiesListVersionModifiedDate");
    v590 = (void *)objc_claimAutoreleasedReturnValue();
    v591 = objc_msgSend(v589, "hk_isBeforeDate:", v590);

    if (!v591)
    {
      -[_HKMedicalIDData allergiesListVersionModifiedDate](self, "allergiesListVersionModifiedDate");
      v592 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData allergiesListVersionModifiedDate](v4, "allergiesListVersionModifiedDate");
      v593 = (void *)objc_claimAutoreleasedReturnValue();
      v594 = objc_msgSend(v592, "hk_isAfterDate:", v593);

      -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
      v595 = (void *)objc_claimAutoreleasedReturnValue();
      if (v594)
      {
LABEL_517:
        objc_opt_self();
        v600 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v600, "setAllergiesListVersion:", v595);

        v601 = self;
        goto LABEL_527;
      }
      -[_HKMedicalIDData allergiesListVersion](v4, "allergiesListVersion");
      v596 = (void *)objc_claimAutoreleasedReturnValue();

      if (v595 != v596)
      {
        _HKInitializeLogging();
        v597 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v597, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.9();

        -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
        v598 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v598)
        {
          _HKInitializeLogging();
          v599 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v599, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.8();

        }
      }
LABEL_516:
      -[_HKMedicalIDData allergiesListVersion](self, "allergiesListVersion");
      v595 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_517;
    }
  }
LABEL_526:
  -[_HKMedicalIDData allergiesListVersion](v4, "allergiesListVersion");
  v610 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v611 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v611, "setAllergiesListVersion:", v610);

  v601 = v4;
LABEL_527:
  -[_HKMedicalIDData allergiesListVersionModifiedDate](v601, "allergiesListVersionModifiedDate");
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v613 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v613, "setAllergiesListVersionModifiedDate:", v612);

  -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
  v614 = (void *)objc_claimAutoreleasedReturnValue();
  if (v614)
  {

  }
  else
  {
    -[_HKMedicalIDData conditionsListModifiedDate](v4, "conditionsListModifiedDate");
    v615 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v615)
    {
      -[_HKMedicalIDData conditionsList](self, "conditionsList");
      v631 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData conditionsList](v4, "conditionsList");
      v632 = (void *)objc_claimAutoreleasedReturnValue();

      if (v631 != v632)
      {
        _HKInitializeLogging();
        v633 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v633, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.4();

      }
      -[_HKMedicalIDData conditionsList](self, "conditionsList");
      v634 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData conditionsList](self, "conditionsList");
        v635 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v635)
          goto LABEL_551;
        -[_HKMedicalIDData conditionsList](self, "conditionsList");
        v636 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v637 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v637, "setConditionsList:", v636);

        -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
        v634 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v638 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v638, "setConditionsListModifiedDate:", v634);

      }
      goto LABEL_551;
    }
  }
  -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
  v616 = (void *)objc_claimAutoreleasedReturnValue();

  if (v616)
  {
    -[_HKMedicalIDData conditionsListModifiedDate](v4, "conditionsListModifiedDate");
    v617 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v617)
      goto LABEL_541;
    -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
    v618 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData conditionsListModifiedDate](v4, "conditionsListModifiedDate");
    v619 = (void *)objc_claimAutoreleasedReturnValue();
    v620 = objc_msgSend(v618, "hk_isBeforeDate:", v619);

    if (!v620)
    {
      -[_HKMedicalIDData conditionsListModifiedDate](self, "conditionsListModifiedDate");
      v621 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData conditionsListModifiedDate](v4, "conditionsListModifiedDate");
      v622 = (void *)objc_claimAutoreleasedReturnValue();
      v623 = objc_msgSend(v621, "hk_isAfterDate:", v622);

      -[_HKMedicalIDData conditionsList](self, "conditionsList");
      v624 = (void *)objc_claimAutoreleasedReturnValue();
      if (v623)
      {
LABEL_542:
        objc_opt_self();
        v629 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v629, "setConditionsList:", v624);

        v630 = self;
        goto LABEL_552;
      }
      -[_HKMedicalIDData conditionsList](v4, "conditionsList");
      v625 = (void *)objc_claimAutoreleasedReturnValue();

      if (v624 != v625)
      {
        _HKInitializeLogging();
        v626 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v626, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.6();

        -[_HKMedicalIDData conditionsList](self, "conditionsList");
        v627 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v627)
        {
          _HKInitializeLogging();
          v628 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v628, OS_LOG_TYPE_ERROR))
            -[_HKMedicalIDData merge:].cold.5();

        }
      }
LABEL_541:
      -[_HKMedicalIDData conditionsList](self, "conditionsList");
      v624 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_542;
    }
  }
LABEL_551:
  -[_HKMedicalIDData conditionsList](v4, "conditionsList");
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v640, "setConditionsList:", v639);

  v630 = v4;
LABEL_552:
  -[_HKMedicalIDData conditionsListModifiedDate](v630, "conditionsListModifiedDate");
  v641 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v642 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v642, "setConditionsListModifiedDate:", v641);

  -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
  v643 = (void *)objc_claimAutoreleasedReturnValue();
  if (v643)
  {

  }
  else
  {
    -[_HKMedicalIDData conditionsListVersionModifiedDate](v4, "conditionsListVersionModifiedDate");
    v644 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v644)
    {
      -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
      v660 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData conditionsListVersion](v4, "conditionsListVersion");
      v661 = (void *)objc_claimAutoreleasedReturnValue();

      if (v660 != v661)
      {
        _HKInitializeLogging();
        v662 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v662, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.1();

      }
      -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
      v663 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
        v664 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v664)
          goto LABEL_576;
        -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
        v665 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v666 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v666, "setConditionsListVersion:", v665);

        -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
        v663 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v667 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v667, "setConditionsListVersionModifiedDate:", v663);

      }
      goto LABEL_576;
    }
  }
  -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
  v645 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v645)
    goto LABEL_576;
  -[_HKMedicalIDData conditionsListVersionModifiedDate](v4, "conditionsListVersionModifiedDate");
  v646 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v646)
  {
LABEL_566:
    -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
    v653 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_567;
  }
  -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData conditionsListVersionModifiedDate](v4, "conditionsListVersionModifiedDate");
  v648 = (void *)objc_claimAutoreleasedReturnValue();
  v649 = objc_msgSend(v647, "hk_isBeforeDate:", v648);

  if (v649)
  {
LABEL_576:
    -[_HKMedicalIDData conditionsListVersion](v4, "conditionsListVersion");
    v668 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v669 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v669, "setConditionsListVersion:", v668);

    v659 = v4;
    goto LABEL_577;
  }
  -[_HKMedicalIDData conditionsListVersionModifiedDate](self, "conditionsListVersionModifiedDate");
  v650 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData conditionsListVersionModifiedDate](v4, "conditionsListVersionModifiedDate");
  v651 = (void *)objc_claimAutoreleasedReturnValue();
  v652 = objc_msgSend(v650, "hk_isAfterDate:", v651);

  -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v652)
  {
    -[_HKMedicalIDData conditionsListVersion](v4, "conditionsListVersion");
    v654 = (void *)objc_claimAutoreleasedReturnValue();

    if (v653 != v654)
    {
      _HKInitializeLogging();
      v655 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v655, OS_LOG_TYPE_ERROR))
        -[_HKMedicalIDData merge:].cold.3();

      -[_HKMedicalIDData conditionsListVersion](self, "conditionsListVersion");
      v656 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v656)
      {
        _HKInitializeLogging();
        v657 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v657, OS_LOG_TYPE_ERROR))
          -[_HKMedicalIDData merge:].cold.2();

      }
    }
    goto LABEL_566;
  }
LABEL_567:
  objc_opt_self();
  v658 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v658, "setConditionsListVersion:", v653);

  v659 = self;
LABEL_577:
  -[_HKMedicalIDData conditionsListVersionModifiedDate](v659, "conditionsListVersionModifiedDate");
  v670 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v671, "setConditionsListVersionModifiedDate:", v670);

  v672 = v5;
  return v672;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (NSDate)isDisabledModifiedDate
{
  return self->_isDisabledModifiedDate;
}

- (void)setIsDisabledModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_isDisabledModifiedDate, a3);
}

- (BOOL)shareDuringEmergency
{
  return self->_shareDuringEmergency;
}

- (void)setShareDuringEmergency:(BOOL)a3
{
  self->_shareDuringEmergency = a3;
}

- (NSDate)shareDuringEmergencyModifiedDate
{
  return self->_shareDuringEmergencyModifiedDate;
}

- (void)setShareDuringEmergencyModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_shareDuringEmergencyModifiedDate, a3);
}

- (NSData)pictureData
{
  return self->_pictureData;
}

- (void)setPictureData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)pictureDataModifiedDate
{
  return self->_pictureDataModifiedDate;
}

- (void)setPictureDataModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_pictureDataModifiedDate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)nameModifiedDate
{
  return self->_nameModifiedDate;
}

- (void)setNameModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_nameModifiedDate, a3);
}

- (NSDate)gmtBirthdate
{
  return self->_gmtBirthdate;
}

- (void)setGmtBirthdate:(id)a3
{
  objc_storeStrong((id *)&self->_gmtBirthdate, a3);
}

- (NSDate)gregorianBirthdayModifiedDate
{
  return self->_gregorianBirthdayModifiedDate;
}

- (void)setGregorianBirthdayModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianBirthdayModifiedDate, a3);
}

- (NSString)primaryLanguageCode
{
  return self->_primaryLanguageCode;
}

- (void)setPrimaryLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)primaryLanguageCodeModifiedDate
{
  return self->_primaryLanguageCodeModifiedDate;
}

- (void)setPrimaryLanguageCodeModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLanguageCodeModifiedDate, a3);
}

- (HKQuantity)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (NSDate)heightModifiedDate
{
  return self->_heightModifiedDate;
}

- (void)setHeightModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_heightModifiedDate, a3);
}

- (HKQuantity)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
  objc_storeStrong((id *)&self->_weight, a3);
}

- (NSDate)weightModifiedDate
{
  return self->_weightModifiedDate;
}

- (void)setWeightModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_weightModifiedDate, a3);
}

- (int64_t)bloodType
{
  return self->_bloodType;
}

- (void)setBloodType:(int64_t)a3
{
  self->_bloodType = a3;
}

- (NSDate)bloodTypeModifiedDate
{
  return self->_bloodTypeModifiedDate;
}

- (void)setBloodTypeModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_bloodTypeModifiedDate, a3);
}

- (NSNumber)isOrganDonor
{
  return self->_isOrganDonor;
}

- (void)setIsOrganDonor:(id)a3
{
  objc_storeStrong((id *)&self->_isOrganDonor, a3);
}

- (NSDate)isOrganDonorModifiedDate
{
  return self->_isOrganDonorModifiedDate;
}

- (void)setIsOrganDonorModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_isOrganDonorModifiedDate, a3);
}

- (NSArray)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void)setEmergencyContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDate)emergencyContactsModifiedDate
{
  return self->_emergencyContactsModifiedDate;
}

- (void)setEmergencyContactsModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContactsModifiedDate, a3);
}

- (NSArray)clinicalContacts
{
  return self->_clinicalContacts;
}

- (void)setClinicalContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDate)clinicalContactsModifiedDate
{
  return self->_clinicalContactsModifiedDate;
}

- (void)setClinicalContactsModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalContactsModifiedDate, a3);
}

- (NSString)medicalConditions
{
  return self->_medicalConditions;
}

- (void)setMedicalConditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)medicalConditionsModifiedDate
{
  return self->_medicalConditionsModifiedDate;
}

- (void)setMedicalConditionsModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_medicalConditionsModifiedDate, a3);
}

- (NSString)medicalNotes
{
  return self->_medicalNotes;
}

- (void)setMedicalNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDate)medicalNotesModifiedDate
{
  return self->_medicalNotesModifiedDate;
}

- (void)setMedicalNotesModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_medicalNotesModifiedDate, a3);
}

- (NSString)allergyInfo
{
  return self->_allergyInfo;
}

- (void)setAllergyInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)allergyInfoModifiedDate
{
  return self->_allergyInfoModifiedDate;
}

- (void)setAllergyInfoModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_allergyInfoModifiedDate, a3);
}

- (NSString)medicationInfo
{
  return self->_medicationInfo;
}

- (void)setMedicationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSDate)medicationInfoModifiedDate
{
  return self->_medicationInfoModifiedDate;
}

- (void)setMedicationInfoModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_medicationInfoModifiedDate, a3);
}

- (NSDate)pregnancyStartDate
{
  return self->_pregnancyStartDate;
}

- (void)setPregnancyStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)pregnancyStartDateTimeZoneID
{
  return self->_pregnancyStartDateTimeZoneID;
}

- (void)setPregnancyStartDateTimeZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSDate)pregnancyStartDateModifiedDate
{
  return self->_pregnancyStartDateModifiedDate;
}

- (void)setPregnancyStartDateModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyStartDateModifiedDate, a3);
}

- (NSDate)pregnancyEstimatedDueDate
{
  return self->_pregnancyEstimatedDueDate;
}

- (void)setPregnancyEstimatedDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSDate)pregnancyEstimatedDueDateModifiedDate
{
  return self->_pregnancyEstimatedDueDateModifiedDate;
}

- (void)setPregnancyEstimatedDueDateModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDateModifiedDate, a3);
}

- (NSArray)medicationsList
{
  return self->_medicationsList;
}

- (void)setMedicationsList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSDate)medicationsListModifiedDate
{
  return self->_medicationsListModifiedDate;
}

- (void)setMedicationsListModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_medicationsListModifiedDate, a3);
}

- (NSNumber)medicationsListVersion
{
  return self->_medicationsListVersion;
}

- (void)setMedicationsListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSDate)medicationsListVersionModifiedDate
{
  return self->_medicationsListVersionModifiedDate;
}

- (void)setMedicationsListVersionModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_medicationsListVersionModifiedDate, a3);
}

- (NSArray)allergiesList
{
  return self->_allergiesList;
}

- (void)setAllergiesList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSDate)allergiesListModifiedDate
{
  return self->_allergiesListModifiedDate;
}

- (void)setAllergiesListModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_allergiesListModifiedDate, a3);
}

- (NSNumber)allergiesListVersion
{
  return self->_allergiesListVersion;
}

- (void)setAllergiesListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSDate)allergiesListVersionModifiedDate
{
  return self->_allergiesListVersionModifiedDate;
}

- (void)setAllergiesListVersionModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_allergiesListVersionModifiedDate, a3);
}

- (NSArray)conditionsList
{
  return self->_conditionsList;
}

- (void)setConditionsList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSDate)conditionsListModifiedDate
{
  return self->_conditionsListModifiedDate;
}

- (void)setConditionsListModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsListModifiedDate, a3);
}

- (NSNumber)conditionsListVersion
{
  return self->_conditionsListVersion;
}

- (void)setConditionsListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSDate)conditionsListVersionModifiedDate
{
  return self->_conditionsListVersionModifiedDate;
}

- (void)setConditionsListVersionModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsListVersionModifiedDate, a3);
}

- (NSDate)birthdate
{
  return self->_birthdate;
}

- (void)setBirthdate:(id)a3
{
  objc_storeStrong((id *)&self->_birthdate, a3);
}

- (NSDate)legacyDateSaved
{
  return self->_legacyDateSaved;
}

- (void)setLegacyDateSaved:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDateSaved, a3);
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(int64_t)a3
{
  self->_schemaVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDateSaved, 0);
  objc_storeStrong((id *)&self->_birthdate, 0);
  objc_storeStrong((id *)&self->_conditionsListVersionModifiedDate, 0);
  objc_storeStrong((id *)&self->_conditionsListVersion, 0);
  objc_storeStrong((id *)&self->_conditionsListModifiedDate, 0);
  objc_storeStrong((id *)&self->_conditionsList, 0);
  objc_storeStrong((id *)&self->_allergiesListVersionModifiedDate, 0);
  objc_storeStrong((id *)&self->_allergiesListVersion, 0);
  objc_storeStrong((id *)&self->_allergiesListModifiedDate, 0);
  objc_storeStrong((id *)&self->_allergiesList, 0);
  objc_storeStrong((id *)&self->_medicationsListVersionModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicationsListVersion, 0);
  objc_storeStrong((id *)&self->_medicationsListModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicationsList, 0);
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDateModifiedDate, 0);
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDate, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDateModifiedDate, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDateTimeZoneID, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDate, 0);
  objc_storeStrong((id *)&self->_medicationInfoModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicationInfo, 0);
  objc_storeStrong((id *)&self->_allergyInfoModifiedDate, 0);
  objc_storeStrong((id *)&self->_allergyInfo, 0);
  objc_storeStrong((id *)&self->_medicalNotesModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicalNotes, 0);
  objc_storeStrong((id *)&self->_medicalConditionsModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicalConditions, 0);
  objc_storeStrong((id *)&self->_clinicalContactsModifiedDate, 0);
  objc_storeStrong((id *)&self->_clinicalContacts, 0);
  objc_storeStrong((id *)&self->_emergencyContactsModifiedDate, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_isOrganDonorModifiedDate, 0);
  objc_storeStrong((id *)&self->_isOrganDonor, 0);
  objc_storeStrong((id *)&self->_bloodTypeModifiedDate, 0);
  objc_storeStrong((id *)&self->_weightModifiedDate, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_heightModifiedDate, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCodeModifiedDate, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
  objc_storeStrong((id *)&self->_gregorianBirthdayModifiedDate, 0);
  objc_storeStrong((id *)&self->_gmtBirthdate, 0);
  objc_storeStrong((id *)&self->_nameModifiedDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pictureDataModifiedDate, 0);
  objc_storeStrong((id *)&self->_pictureData, 0);
  objc_storeStrong((id *)&self->_shareDuringEmergencyModifiedDate, 0);
  objc_storeStrong((id *)&self->_isDisabledModifiedDate, 0);
}

- (id)consolidatedSOSContactsWithSOSContactsManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  _HKEmergencyContactWrapper *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  _HKEmergencyContact *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _HKEmergencyContactWrapper *v29;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "legacyContactsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SOSLegacyContacts");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v8;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[_HKMedicalIDData emergencyContacts](self, "emergencyContacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v16 = objc_alloc_init(_HKEmergencyContactWrapper);
        -[_HKEmergencyContactWrapper setContact:](v16, "setContact:", v15);
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v12);
  }

  v17 = v32;
  if (objc_msgSend(v32, "count"))
  {
    v31 = v4;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = v32;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          v24 = objc_alloc_init(_HKEmergencyContact);
          objc_msgSend(v23, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HKEmergencyContact setName:](v24, "setName:", v25);

          objc_msgSend(v23, "nameContactIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HKEmergencyContact setNameContactIdentifier:](v24, "setNameContactIdentifier:", v26);

          objc_msgSend(v23, "phoneNumber");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HKEmergencyContact setPhoneNumber:](v24, "setPhoneNumber:", v27);

          objc_msgSend(v23, "phoneNumberContactIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HKEmergencyContact setPhoneNumberContactIdentifier:](v24, "setPhoneNumberContactIdentifier:", v28);

          v29 = objc_alloc_init(_HKEmergencyContactWrapper);
          -[_HKEmergencyContactWrapper setContact:](v29, "setContact:", v24);
          if ((objc_msgSend(v9, "containsObject:", v29) & 1) == 0)
            objc_msgSend(v33, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v20);
    }

    v4 = v31;
    v17 = v32;
  }

  return v33;
}

- (void)merge:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Conditions List Version"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Conditions List Version"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Conditions List Version"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "conditionsListVersionModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Conditions List"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.5()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Conditions List"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Conditions List"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "conditionsListModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.7()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergies List Version"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergies List Version"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.9()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergies List Version"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "allergiesListVersionModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.10()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergies List"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.11()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergies List"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.12()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergies List"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "allergiesListModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.13()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medications List Version"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.14()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medications List Version"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.15()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medications List Version"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "medicationsListVersionModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.16()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medications List"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.17()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medications List"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.18()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medications List"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "medicationsListModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.19()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Pregnancy Estimated Due Date"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.20()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Pregnancy Estimated Due Date"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.21()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Pregnancy Estimated Due Date"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "pregnancyEstimatedDueDateModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.22()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Pregnancy Start Date"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.23()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Pregnancy Start Date"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.24()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Pregnancy Start Date"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "pregnancyStartDateModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.25()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medication"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.26()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medication"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.27()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medication"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "medicationInfoModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.28()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergy"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.29()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergy"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.30()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Allergy"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "allergyInfoModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.31()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medical Notes"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.32()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medical Notes"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.33()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medical Notes"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "medicalNotesModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.34()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medical Conditions"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.35()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medical Conditions"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.36()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Medical Conditions"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "medicalConditionsModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.37()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Clinical Contacts"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.38()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Clinical Contacts"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.39()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Clinical Contacts"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "clinicalContactsModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.40()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Emergency Contacts"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.41()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Emergency Contacts"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.42()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Emergency Contacts"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "emergencyContactsModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.43()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Blood Type"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ flags with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.44()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Blood Type"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "bloodTypeModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ flags with equal modification dates %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.45()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Organ Donor"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.46()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Organ Donor"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.47()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Organ Donor"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "isOrganDonorModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.48()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Weight"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.49()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Weight"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.50()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Weight"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "weightModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.51()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Height"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.52()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Height"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.53()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Height"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "heightModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.54()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Primary Language Code"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.55()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Primary Language Code"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.56()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Primary Language Code"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "primaryLanguageCodeModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.57()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Gregorian Birthday"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.58()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Gregorian Birthday"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.59()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Gregorian Birthday"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "gregorianBirthdayModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.60()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Name"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.61()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Name"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.62()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Name"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "nameModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.63()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Picture"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.64()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Picture"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.65()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Picture"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "pictureDataModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.66()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Share During Emergency"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ flags with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.67()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Share During Emergency"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "shareDuringEmergencyModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ flags with equal modification dates %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

- (void)merge:.cold.68()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Disabled"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ flags with nil modification dates", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_2();
}

- (void)merge:.cold.69()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_1();
  HKSensitiveLogItem(CFSTR("Disabled"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "isDisabledModifiedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ flags with equal modification dates %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_1();
}

@end
