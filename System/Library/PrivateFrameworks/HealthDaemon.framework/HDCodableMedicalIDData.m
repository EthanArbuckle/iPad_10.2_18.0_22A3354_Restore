@implementation HDCodableMedicalIDData

- (BOOL)hasMedicalIDBytes
{
  return self->_medicalIDBytes != 0;
}

- (void)setDateSaved:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_dateSaved = a3;
}

- (void)setHasDateSaved:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDateSaved
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSchemaVersion:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_schemaVersion = a3;
}

- (void)setHasSchemaVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasSchemaVersion
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setIsDisabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_isDisabled = a3;
}

- (void)setHasIsDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsDisabled
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsDisabledModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_isDisabledModifiedDate = a3;
}

- (void)setHasIsDisabledModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasIsDisabledModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasPictureData
{
  return self->_pictureData != 0;
}

- (void)setPictureDataModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_pictureDataModifiedDate = a3;
}

- (void)setHasPictureDataModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPictureDataModifiedDate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setNameModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_nameModifiedDate = a3;
}

- (void)setHasNameModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasNameModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasGregorianBirthday
{
  return self->_gregorianBirthday != 0;
}

- (void)setGregorianBirthdayModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_gregorianBirthdayModifiedDate = a3;
}

- (void)setHasGregorianBirthdayModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGregorianBirthdayModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasHeight
{
  return self->_height != 0;
}

- (void)setHeightModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_heightModifiedDate = a3;
}

- (void)setHasHeightModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasHeightModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasWeight
{
  return self->_weight != 0;
}

- (void)setWeightModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_weightModifiedDate = a3;
}

- (void)setHasWeightModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasWeightModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (int)bloodType
{
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    return self->_bloodType;
  else
    return 0;
}

- (void)setBloodType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_bloodType = a3;
}

- (void)setHasBloodType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasBloodType
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (id)bloodTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E6CF1670[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBloodType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSet")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APositive")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANegative")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BPositive")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BNegative")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABPositive")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABNegative")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPositive")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONegative")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setBloodTypeModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_bloodTypeModifiedDate = a3;
}

- (void)setHasBloodTypeModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBloodTypeModifiedDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsOrganDonor:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_isOrganDonor = a3;
}

- (void)setHasIsOrganDonor:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIsOrganDonor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsOrganDonorModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_isOrganDonorModifiedDate = a3;
}

- (void)setHasIsOrganDonorModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasIsOrganDonorModifiedDate
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearEmergencyContacts
{
  -[NSMutableArray removeAllObjects](self->_emergencyContacts, "removeAllObjects");
}

- (void)addEmergencyContacts:(id)a3
{
  id v4;
  NSMutableArray *emergencyContacts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  emergencyContacts = self->_emergencyContacts;
  v8 = v4;
  if (!emergencyContacts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_emergencyContacts;
    self->_emergencyContacts = v6;

    v4 = v8;
    emergencyContacts = self->_emergencyContacts;
  }
  -[NSMutableArray addObject:](emergencyContacts, "addObject:", v4);

}

- (unint64_t)emergencyContactsCount
{
  return -[NSMutableArray count](self->_emergencyContacts, "count");
}

- (id)emergencyContactsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_emergencyContacts, "objectAtIndex:", a3);
}

+ (Class)emergencyContactsType
{
  return (Class)objc_opt_class();
}

- (void)setEmergencyContactsModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_emergencyContactsModifiedDate = a3;
}

- (void)setHasEmergencyContactsModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasEmergencyContactsModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearClinicalContacts
{
  -[NSMutableArray removeAllObjects](self->_clinicalContacts, "removeAllObjects");
}

- (void)addClinicalContacts:(id)a3
{
  id v4;
  NSMutableArray *clinicalContacts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clinicalContacts = self->_clinicalContacts;
  v8 = v4;
  if (!clinicalContacts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clinicalContacts;
    self->_clinicalContacts = v6;

    v4 = v8;
    clinicalContacts = self->_clinicalContacts;
  }
  -[NSMutableArray addObject:](clinicalContacts, "addObject:", v4);

}

- (unint64_t)clinicalContactsCount
{
  return -[NSMutableArray count](self->_clinicalContacts, "count");
}

- (id)clinicalContactsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clinicalContacts, "objectAtIndex:", a3);
}

+ (Class)clinicalContactsType
{
  return (Class)objc_opt_class();
}

- (void)setClinicalContactsModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_clinicalContactsModifiedDate = a3;
}

- (void)setHasClinicalContactsModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasClinicalContactsModifiedDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasMedicalConditions
{
  return self->_medicalConditions != 0;
}

- (void)setMedicalConditionsModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_medicalConditionsModifiedDate = a3;
}

- (void)setHasMedicalConditionsModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMedicalConditionsModifiedDate
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasMedicalNotes
{
  return self->_medicalNotes != 0;
}

- (void)setMedicalNotesModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_medicalNotesModifiedDate = a3;
}

- (void)setHasMedicalNotesModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMedicalNotesModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasAllergyInfo
{
  return self->_allergyInfo != 0;
}

- (void)setAllergyInfoModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_allergyInfoModifiedDate = a3;
}

- (void)setHasAllergyInfoModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAllergyInfoModifiedDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasMedicationInfo
{
  return self->_medicationInfo != 0;
}

- (void)setMedicationInfoModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_medicationInfoModifiedDate = a3;
}

- (void)setHasMedicationInfoModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMedicationInfoModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setShareDuringEmergency:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_shareDuringEmergency = a3;
}

- (void)setHasShareDuringEmergency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasShareDuringEmergency
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setShareDuringEmergencyModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_shareDuringEmergencyModifiedDate = a3;
}

- (void)setHasShareDuringEmergencyModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasShareDuringEmergencyModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasPrimaryLanguageCode
{
  return self->_primaryLanguageCode != 0;
}

- (void)setPrimaryLanguageCodeModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_primaryLanguageCodeModifiedDate = a3;
}

- (void)setHasPrimaryLanguageCodeModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasPrimaryLanguageCodeModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setPregnancyStartDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_pregnancyStartDate = a3;
}

- (void)setHasPregnancyStartDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasPregnancyStartDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setPregnancyStartDateModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_pregnancyStartDateModifiedDate = a3;
}

- (void)setHasPregnancyStartDateModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasPregnancyStartDateModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setPregnancyEstimatedDueDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_pregnancyEstimatedDueDate = a3;
}

- (void)setHasPregnancyEstimatedDueDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasPregnancyEstimatedDueDate
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setPregnancyEstimatedDueDateModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_pregnancyEstimatedDueDateModifiedDate = a3;
}

- (void)setHasPregnancyEstimatedDueDateModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPregnancyEstimatedDueDateModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)clearMedicationsLists
{
  -[NSMutableArray removeAllObjects](self->_medicationsLists, "removeAllObjects");
}

- (void)addMedicationsList:(id)a3
{
  id v4;
  NSMutableArray *medicationsLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  medicationsLists = self->_medicationsLists;
  v8 = v4;
  if (!medicationsLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_medicationsLists;
    self->_medicationsLists = v6;

    v4 = v8;
    medicationsLists = self->_medicationsLists;
  }
  -[NSMutableArray addObject:](medicationsLists, "addObject:", v4);

}

- (unint64_t)medicationsListsCount
{
  return -[NSMutableArray count](self->_medicationsLists, "count");
}

- (id)medicationsListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_medicationsLists, "objectAtIndex:", a3);
}

+ (Class)medicationsListType
{
  return (Class)objc_opt_class();
}

- (void)setMedicationsListModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_medicationsListModifiedDate = a3;
}

- (void)setHasMedicationsListModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMedicationsListModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMedicationsListVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_medicationsListVersion = a3;
}

- (void)setHasMedicationsListVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMedicationsListVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMedicationsListVersionModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_medicationsListVersionModifiedDate = a3;
}

- (void)setHasMedicationsListVersionModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMedicationsListVersionModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)clearAllergiesLists
{
  -[NSMutableArray removeAllObjects](self->_allergiesLists, "removeAllObjects");
}

- (void)addAllergiesList:(id)a3
{
  id v4;
  NSMutableArray *allergiesLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allergiesLists = self->_allergiesLists;
  v8 = v4;
  if (!allergiesLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_allergiesLists;
    self->_allergiesLists = v6;

    v4 = v8;
    allergiesLists = self->_allergiesLists;
  }
  -[NSMutableArray addObject:](allergiesLists, "addObject:", v4);

}

- (unint64_t)allergiesListsCount
{
  return -[NSMutableArray count](self->_allergiesLists, "count");
}

- (id)allergiesListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allergiesLists, "objectAtIndex:", a3);
}

+ (Class)allergiesListType
{
  return (Class)objc_opt_class();
}

- (void)setAllergiesListModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_allergiesListModifiedDate = a3;
}

- (void)setHasAllergiesListModifiedDate:(BOOL)a3
{
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAllergiesListModifiedDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAllergiesListVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_allergiesListVersion = a3;
}

- (void)setHasAllergiesListVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAllergiesListVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAllergiesListVersionModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_allergiesListVersionModifiedDate = a3;
}

- (void)setHasAllergiesListVersionModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAllergiesListVersionModifiedDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearConditionsLists
{
  -[NSMutableArray removeAllObjects](self->_conditionsLists, "removeAllObjects");
}

- (void)addConditionsList:(id)a3
{
  id v4;
  NSMutableArray *conditionsLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  conditionsLists = self->_conditionsLists;
  v8 = v4;
  if (!conditionsLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conditionsLists;
    self->_conditionsLists = v6;

    v4 = v8;
    conditionsLists = self->_conditionsLists;
  }
  -[NSMutableArray addObject:](conditionsLists, "addObject:", v4);

}

- (unint64_t)conditionsListsCount
{
  return -[NSMutableArray count](self->_conditionsLists, "count");
}

- (id)conditionsListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_conditionsLists, "objectAtIndex:", a3);
}

+ (Class)conditionsListType
{
  return (Class)objc_opt_class();
}

- (void)setConditionsListModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_conditionsListModifiedDate = a3;
}

- (void)setHasConditionsListModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasConditionsListModifiedDate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setConditionsListVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_conditionsListVersion = a3;
}

- (void)setHasConditionsListVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasConditionsListVersion
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setConditionsListVersionModifiedDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_conditionsListVersionModifiedDate = a3;
}

- (void)setHasConditionsListVersionModifiedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasConditionsListVersionModifiedDate
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicalIDData;
  -[HDCodableMedicalIDData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *medicalIDBytes;
  $668054F355966D14195D4E399A549C9C has;
  void *v7;
  NSData *pictureData;
  void *v9;
  NSString *name;
  void *v11;
  HDCodableDateComponents *gregorianBirthday;
  void *v13;
  void *v14;
  HDCodableQuantity *height;
  void *v16;
  void *v17;
  HDCodableQuantity *weight;
  void *v19;
  $668054F355966D14195D4E399A549C9C v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSString *medicalConditions;
  void *v39;
  NSString *medicalNotes;
  void *v41;
  NSString *allergyInfo;
  void *v43;
  NSString *medicationInfo;
  $668054F355966D14195D4E399A549C9C v45;
  void *v46;
  NSString *primaryLanguageCode;
  $668054F355966D14195D4E399A549C9C v48;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  $668054F355966D14195D4E399A549C9C v57;
  void *v58;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  void *v65;
  $668054F355966D14195D4E399A549C9C v66;
  void *v67;
  void *v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  void *v74;
  $668054F355966D14195D4E399A549C9C v75;
  void *v76;
  id v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t bloodType;
  __CFString *v84;
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
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  medicalIDBytes = self->_medicalIDBytes;
  if (medicalIDBytes)
    objc_msgSend(v3, "setObject:forKey:", medicalIDBytes, CFSTR("medicalIDBytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateSaved);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("dateSaved"));

    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_QWORD *)&has & 0x200000000) == 0)
        goto LABEL_6;
      goto LABEL_122;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_schemaVersion);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("schemaVersion"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDisabled);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("isDisabled"));

  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_isDisabledModifiedDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isDisabledModifiedDate"));

  }
LABEL_8:
  pictureData = self->_pictureData;
  if (pictureData)
    objc_msgSend(v4, "setObject:forKey:", pictureData, CFSTR("pictureData"));
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pictureDataModifiedDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("pictureDataModifiedDate"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_nameModifiedDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("nameModifiedDate"));

  }
  gregorianBirthday = self->_gregorianBirthday;
  if (gregorianBirthday)
  {
    -[HDCodableDateComponents dictionaryRepresentation](gregorianBirthday, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("gregorianBirthday"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_gregorianBirthdayModifiedDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("gregorianBirthdayModifiedDate"));

  }
  height = self->_height;
  if (height)
  {
    -[HDCodableQuantity dictionaryRepresentation](height, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("height"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_heightModifiedDate);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("heightModifiedDate"));

  }
  weight = self->_weight;
  if (weight)
  {
    -[HDCodableQuantity dictionaryRepresentation](weight, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("weight"));

  }
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_weightModifiedDate);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("weightModifiedDate"));

    v20 = self->_has;
    if ((*(_DWORD *)&v20 & 0x80000000) == 0)
    {
LABEL_28:
      if ((*(_BYTE *)&v20 & 0x10) == 0)
        goto LABEL_29;
      goto LABEL_146;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  bloodType = self->_bloodType;
  if (bloodType >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_bloodType);
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = off_1E6CF1670[bloodType];
  }
  objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("bloodType"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v20 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bloodTypeModifiedDate);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("bloodTypeModifiedDate"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v20 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_isOrganDonor);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v98, CFSTR("isOrganDonor"));

  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_isOrganDonorModifiedDate);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("isOrganDonorModifiedDate"));

  }
LABEL_32:
  if (-[NSMutableArray count](self->_emergencyContacts, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_emergencyContacts, "count"));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v23 = self->_emergencyContacts;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v116 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("emergencyContacts"));
  }
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_emergencyContactsModifiedDate);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("emergencyContactsModifiedDate"));

  }
  if (-[NSMutableArray count](self->_clinicalContacts, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clinicalContacts, "count"));
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v31 = self->_clinicalContacts;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v112;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v112 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * j), "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
      }
      while (v33);
    }

    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("clinicalContacts"));
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clinicalContactsModifiedDate);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("clinicalContactsModifiedDate"));

  }
  medicalConditions = self->_medicalConditions;
  if (medicalConditions)
    objc_msgSend(v4, "setObject:forKey:", medicalConditions, CFSTR("medicalConditions"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medicalConditionsModifiedDate);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("medicalConditionsModifiedDate"));

  }
  medicalNotes = self->_medicalNotes;
  if (medicalNotes)
    objc_msgSend(v4, "setObject:forKey:", medicalNotes, CFSTR("medicalNotes"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medicalNotesModifiedDate);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("medicalNotesModifiedDate"));

  }
  allergyInfo = self->_allergyInfo;
  if (allergyInfo)
    objc_msgSend(v4, "setObject:forKey:", allergyInfo, CFSTR("allergyInfo"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_allergyInfoModifiedDate);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("allergyInfoModifiedDate"));

  }
  medicationInfo = self->_medicationInfo;
  if (medicationInfo)
    objc_msgSend(v4, "setObject:forKey:", medicationInfo, CFSTR("medicationInfo"));
  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medicationInfoModifiedDate);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("medicationInfoModifiedDate"));

    v45 = self->_has;
    if ((*(_QWORD *)&v45 & 0x400000000) == 0)
    {
LABEL_70:
      if ((*(_DWORD *)&v45 & 0x20000000) == 0)
        goto LABEL_72;
      goto LABEL_71;
    }
  }
  else if ((*(_QWORD *)&v45 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shareDuringEmergency);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("shareDuringEmergency"));

  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_71:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_shareDuringEmergencyModifiedDate);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("shareDuringEmergencyModifiedDate"));

  }
LABEL_72:
  primaryLanguageCode = self->_primaryLanguageCode;
  if (primaryLanguageCode)
    objc_msgSend(v4, "setObject:forKey:", primaryLanguageCode, CFSTR("primaryLanguageCode"));
  v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_primaryLanguageCodeModifiedDate);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("primaryLanguageCodeModifiedDate"));

    v48 = self->_has;
    if ((*(_DWORD *)&v48 & 0x4000000) == 0)
    {
LABEL_76:
      if ((*(_DWORD *)&v48 & 0x8000000) == 0)
        goto LABEL_77;
      goto LABEL_132;
    }
  }
  else if ((*(_DWORD *)&v48 & 0x4000000) == 0)
  {
    goto LABEL_76;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pregnancyStartDate);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("pregnancyStartDate"));

  v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x8000000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v48 & 0x1000000) == 0)
      goto LABEL_78;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pregnancyStartDateModifiedDate);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("pregnancyStartDateModifiedDate"));

  v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x1000000) == 0)
  {
LABEL_78:
    if ((*(_DWORD *)&v48 & 0x2000000) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pregnancyEstimatedDueDate);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("pregnancyEstimatedDueDate"));

  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
  {
LABEL_79:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pregnancyEstimatedDueDateModifiedDate);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("pregnancyEstimatedDueDateModifiedDate"));

  }
LABEL_80:
  if (-[NSMutableArray count](self->_medicationsLists, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_medicationsLists, "count"));
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v51 = self->_medicationsLists;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v108;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v108 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * k), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("medicationsList"));
  }
  v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medicationsListModifiedDate);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v91, CFSTR("medicationsListModifiedDate"));

    v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x100000) == 0)
    {
LABEL_91:
      if ((*(_DWORD *)&v57 & 0x200000) == 0)
        goto LABEL_93;
      goto LABEL_92;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x100000) == 0)
  {
    goto LABEL_91;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_medicationsListVersion);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v92, CFSTR("medicationsListVersion"));

  if ((*(_QWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_92:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medicationsListVersionModifiedDate);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("medicationsListVersionModifiedDate"));

  }
LABEL_93:
  if (-[NSMutableArray count](self->_allergiesLists, "count"))
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_allergiesLists, "count"));
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v60 = self->_allergiesLists;
    v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v104;
      do
      {
        for (m = 0; m != v62; ++m)
        {
          if (*(_QWORD *)v104 != v63)
            objc_enumerationMutation(v60);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * m), "dictionaryRepresentation");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v65);

        }
        v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
      }
      while (v62);
    }

    objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("allergiesList"));
  }
  v66 = self->_has;
  if ((*(_BYTE *)&v66 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_allergiesListModifiedDate);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v93, CFSTR("allergiesListModifiedDate"));

    v66 = self->_has;
    if ((*(_BYTE *)&v66 & 2) == 0)
    {
LABEL_104:
      if ((*(_BYTE *)&v66 & 4) == 0)
        goto LABEL_106;
      goto LABEL_105;
    }
  }
  else if ((*(_BYTE *)&v66 & 2) == 0)
  {
    goto LABEL_104;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_allergiesListVersion);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v94, CFSTR("allergiesListVersion"));

  if ((*(_QWORD *)&self->_has & 4) != 0)
  {
LABEL_105:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_allergiesListVersionModifiedDate);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("allergiesListVersionModifiedDate"));

  }
LABEL_106:
  if (-[NSMutableArray count](self->_conditionsLists, "count"))
  {
    v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_conditionsLists, "count"));
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v69 = self->_conditionsLists;
    v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v100;
      do
      {
        for (n = 0; n != v71; ++n)
        {
          if (*(_QWORD *)v100 != v72)
            objc_enumerationMutation(v69);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * n), "dictionaryRepresentation");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "addObject:", v74);

        }
        v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
      }
      while (v71);
    }

    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("conditionsList"));
  }
  v75 = self->_has;
  if ((*(_BYTE *)&v75 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v75 & 0x80) == 0)
      goto LABEL_117;
LABEL_142:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_conditionsListVersion);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v96, CFSTR("conditionsListVersion"));

    if ((*(_QWORD *)&self->_has & 0x100) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_conditionsListModifiedDate);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("conditionsListModifiedDate"));

  v75 = self->_has;
  if ((*(_BYTE *)&v75 & 0x80) != 0)
    goto LABEL_142;
LABEL_117:
  if ((*(_WORD *)&v75 & 0x100) != 0)
  {
LABEL_118:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_conditionsListVersionModifiedDate);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("conditionsListVersionModifiedDate"));

  }
LABEL_119:
  v77 = v4;

  return v77;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalIDDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $668054F355966D14195D4E399A549C9C has;
  $668054F355966D14195D4E399A549C9C v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $668054F355966D14195D4E399A549C9C v17;
  $668054F355966D14195D4E399A549C9C v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $668054F355966D14195D4E399A549C9C v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  $668054F355966D14195D4E399A549C9C v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  $668054F355966D14195D4E399A549C9C v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_medicalIDBytes)
    PBDataWriterWriteDataField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_QWORD *)&has & 0x200000000) == 0)
        goto LABEL_6;
      goto LABEL_112;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_pictureData)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_name)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_gregorianBirthday)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_height)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_weight)
    PBDataWriterWriteSubmessage();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_28:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_29;
      goto LABEL_116;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_117:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
LABEL_31:
    PBDataWriterWriteDoubleField();
LABEL_32:
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = self->_emergencyContacts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v54;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    PBDataWriterWriteDoubleField();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = self->_clinicalContacts;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_medicalConditions)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_medicalNotes)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_allergyInfo)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_medicationInfo)
    PBDataWriterWriteStringField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v17 = self->_has;
    if ((*(_QWORD *)&v17 & 0x400000000) == 0)
    {
LABEL_66:
      if ((*(_DWORD *)&v17 & 0x20000000) == 0)
        goto LABEL_68;
      goto LABEL_67;
    }
  }
  else if ((*(_QWORD *)&v17 & 0x400000000) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
LABEL_67:
    PBDataWriterWriteDoubleField();
LABEL_68:
  if (self->_primaryLanguageCode)
    PBDataWriterWriteStringField();
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x4000000) == 0)
    {
LABEL_72:
      if ((*(_DWORD *)&v18 & 0x8000000) == 0)
        goto LABEL_73;
      goto LABEL_124;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x4000000) == 0)
  {
    goto LABEL_72;
  }
  PBDataWriterWriteDoubleField();
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x8000000) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0)
      goto LABEL_74;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteDoubleField();
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v18 & 0x2000000) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_125:
  PBDataWriterWriteDoubleField();
  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
LABEL_75:
    PBDataWriterWriteDoubleField();
LABEL_76:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = self->_medicationsLists;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v46;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v21);
  }

  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x100000) == 0)
    {
LABEL_85:
      if ((*(_DWORD *)&v24 & 0x200000) == 0)
        goto LABEL_87;
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x100000) == 0)
  {
    goto LABEL_85;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x200000) != 0)
LABEL_86:
    PBDataWriterWriteDoubleField();
LABEL_87:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = self->_allergiesLists;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v27);
  }

  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v30 = self->_has;
    if ((*(_BYTE *)&v30 & 2) == 0)
    {
LABEL_96:
      if ((*(_BYTE *)&v30 & 4) == 0)
        goto LABEL_98;
      goto LABEL_97;
    }
  }
  else if ((*(_BYTE *)&v30 & 2) == 0)
  {
    goto LABEL_96;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 4) != 0)
LABEL_97:
    PBDataWriterWriteDoubleField();
LABEL_98:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = self->_conditionsLists;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v38;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    }
    while (v33);
  }

  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v36 & 0x80) == 0)
      goto LABEL_107;
LABEL_134:
    PBDataWriterWriteInt64Field();
    if ((*(_QWORD *)&self->_has & 0x100) == 0)
      goto LABEL_109;
    goto LABEL_108;
  }
  PBDataWriterWriteDoubleField();
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x80) != 0)
    goto LABEL_134;
LABEL_107:
  if ((*(_WORD *)&v36 & 0x100) != 0)
LABEL_108:
    PBDataWriterWriteDoubleField();
LABEL_109:

}

- (void)copyTo:(id)a3
{
  char *v4;
  $668054F355966D14195D4E399A549C9C has;
  $668054F355966D14195D4E399A549C9C v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  char *v15;
  $668054F355966D14195D4E399A549C9C v16;
  $668054F355966D14195D4E399A549C9C v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t k;
  void *v21;
  $668054F355966D14195D4E399A549C9C v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t m;
  void *v26;
  $668054F355966D14195D4E399A549C9C v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t n;
  void *v31;
  $668054F355966D14195D4E399A549C9C v32;
  char *v33;

  v4 = (char *)a3;
  v33 = v4;
  if (self->_medicalIDBytes)
  {
    objc_msgSend(v4, "setMedicalIDBytes:");
    v4 = v33;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_dateSaved;
    *(_QWORD *)(v4 + 404) |= 0x200uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_QWORD *)&has & 0x200000000) == 0)
        goto LABEL_6;
      goto LABEL_97;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 96) = self->_schemaVersion;
  *(_QWORD *)(v4 + 404) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_97:
  v4[400] = self->_isDisabled;
  *(_QWORD *)(v4 + 404) |= 0x200000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_isDisabledModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x2000uLL;
  }
LABEL_8:
  if (self->_pictureData)
  {
    objc_msgSend(v33, "setPictureData:");
    v4 = v33;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *((_QWORD *)v4 + 24) = *(_QWORD *)&self->_pictureDataModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x800000uLL;
  }
  if (self->_name)
  {
    objc_msgSend(v33, "setName:");
    v4 = v33;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_nameModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x400000uLL;
  }
  if (self->_gregorianBirthday)
  {
    objc_msgSend(v33, "setGregorianBirthday:");
    v4 = v33;
  }
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_gregorianBirthdayModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x800uLL;
  }
  if (self->_height)
  {
    objc_msgSend(v33, "setHeight:");
    v4 = v33;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_heightModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x1000uLL;
  }
  if (self->_weight)
  {
    objc_msgSend(v33, "setWeight:");
    v4 = v33;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) != 0)
  {
    *((_QWORD *)v4 + 31) = *(_QWORD *)&self->_weightModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x40000000uLL;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_28:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_29;
      goto LABEL_101;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)v4 + 68) = self->_bloodType;
  *(_QWORD *)(v4 + 404) |= 0x80000000uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_30;
LABEL_102:
    *((_QWORD *)v4 + 15) = self->_isOrganDonor;
    *(_QWORD *)(v4 + 404) |= 0x4000uLL;
    if ((*(_QWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_101:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_bloodTypeModifiedDate;
  *(_QWORD *)(v4 + 404) |= 0x10uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_102;
LABEL_30:
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
LABEL_31:
    *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_isOrganDonorModifiedDate;
    *(_QWORD *)(v4 + 404) |= 0x8000uLL;
  }
LABEL_32:
  if (-[HDCodableMedicalIDData emergencyContactsCount](self, "emergencyContactsCount"))
  {
    objc_msgSend(v33, "clearEmergencyContacts");
    v7 = -[HDCodableMedicalIDData emergencyContactsCount](self, "emergencyContactsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[HDCodableMedicalIDData emergencyContactsAtIndex:](self, "emergencyContactsAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addEmergencyContacts:", v10);

      }
    }
  }
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *((_QWORD *)v33 + 11) = *(_QWORD *)&self->_emergencyContactsModifiedDate;
    *(_QWORD *)(v33 + 404) |= 0x400uLL;
  }
  if (-[HDCodableMedicalIDData clinicalContactsCount](self, "clinicalContactsCount"))
  {
    objc_msgSend(v33, "clearClinicalContacts");
    v11 = -[HDCodableMedicalIDData clinicalContactsCount](self, "clinicalContactsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[HDCodableMedicalIDData clinicalContactsAtIndex:](self, "clinicalContactsAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addClinicalContacts:", v14);

      }
    }
  }
  v15 = v33;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)v33 + 6) = *(_QWORD *)&self->_clinicalContactsModifiedDate;
    *(_QWORD *)(v33 + 404) |= 0x20uLL;
  }
  if (self->_medicalConditions)
  {
    objc_msgSend(v33, "setMedicalConditions:");
    v15 = v33;
  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *((_QWORD *)v15 + 17) = *(_QWORD *)&self->_medicalConditionsModifiedDate;
    *(_QWORD *)(v15 + 404) |= 0x10000uLL;
  }
  if (self->_medicalNotes)
  {
    objc_msgSend(v33, "setMedicalNotes:");
    v15 = v33;
  }
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *((_QWORD *)v15 + 18) = *(_QWORD *)&self->_medicalNotesModifiedDate;
    *(_QWORD *)(v15 + 404) |= 0x20000uLL;
  }
  if (self->_allergyInfo)
  {
    objc_msgSend(v33, "setAllergyInfo:");
    v15 = v33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v15 + 4) = *(_QWORD *)&self->_allergyInfoModifiedDate;
    *(_QWORD *)(v15 + 404) |= 8uLL;
  }
  if (self->_medicationInfo)
  {
    objc_msgSend(v33, "setMedicationInfo:");
    v15 = v33;
  }
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) != 0)
  {
    *((_QWORD *)v15 + 19) = *(_QWORD *)&self->_medicationInfoModifiedDate;
    *(_QWORD *)(v15 + 404) |= 0x40000uLL;
    v16 = self->_has;
    if ((*(_QWORD *)&v16 & 0x400000000) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v16 & 0x20000000) == 0)
        goto LABEL_62;
      goto LABEL_61;
    }
  }
  else if ((*(_QWORD *)&v16 & 0x400000000) == 0)
  {
    goto LABEL_60;
  }
  v15[401] = self->_shareDuringEmergency;
  *(_QWORD *)(v15 + 404) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_61:
    *((_QWORD *)v15 + 30) = *(_QWORD *)&self->_shareDuringEmergencyModifiedDate;
    *(_QWORD *)(v15 + 404) |= 0x20000000uLL;
  }
LABEL_62:
  if (self->_primaryLanguageCode)
  {
    objc_msgSend(v33, "setPrimaryLanguageCode:");
    v15 = v33;
  }
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000000) != 0)
  {
    *((_QWORD *)v15 + 29) = *(_QWORD *)&self->_primaryLanguageCodeModifiedDate;
    *(_QWORD *)(v15 + 404) |= 0x10000000uLL;
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x4000000) == 0)
    {
LABEL_66:
      if ((*(_DWORD *)&v17 & 0x8000000) == 0)
        goto LABEL_67;
      goto LABEL_109;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x4000000) == 0)
  {
    goto LABEL_66;
  }
  *((_QWORD *)v15 + 27) = *(_QWORD *)&self->_pregnancyStartDate;
  *(_QWORD *)(v15 + 404) |= 0x4000000uLL;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x8000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0)
      goto LABEL_68;
LABEL_110:
    *((_QWORD *)v15 + 25) = *(_QWORD *)&self->_pregnancyEstimatedDueDate;
    *(_QWORD *)(v15 + 404) |= 0x1000000uLL;
    if ((*(_QWORD *)&self->_has & 0x2000000) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
LABEL_109:
  *((_QWORD *)v15 + 28) = *(_QWORD *)&self->_pregnancyStartDateModifiedDate;
  *(_QWORD *)(v15 + 404) |= 0x8000000uLL;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) != 0)
    goto LABEL_110;
LABEL_68:
  if ((*(_DWORD *)&v17 & 0x2000000) != 0)
  {
LABEL_69:
    *((_QWORD *)v15 + 26) = *(_QWORD *)&self->_pregnancyEstimatedDueDateModifiedDate;
    *(_QWORD *)(v15 + 404) |= 0x2000000uLL;
  }
LABEL_70:
  if (-[HDCodableMedicalIDData medicationsListsCount](self, "medicationsListsCount"))
  {
    objc_msgSend(v33, "clearMedicationsLists");
    v18 = -[HDCodableMedicalIDData medicationsListsCount](self, "medicationsListsCount");
    if (v18)
    {
      v19 = v18;
      for (k = 0; k != v19; ++k)
      {
        -[HDCodableMedicalIDData medicationsListAtIndex:](self, "medicationsListAtIndex:", k);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addMedicationsList:", v21);

      }
    }
  }
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) == 0)
  {
    if ((*(_DWORD *)&v22 & 0x100000) == 0)
      goto LABEL_76;
LABEL_113:
    *((_QWORD *)v33 + 21) = self->_medicationsListVersion;
    *(_QWORD *)(v33 + 404) |= 0x100000uLL;
    if ((*(_QWORD *)&self->_has & 0x200000) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
  *((_QWORD *)v33 + 20) = *(_QWORD *)&self->_medicationsListModifiedDate;
  *(_QWORD *)(v33 + 404) |= 0x80000uLL;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x100000) != 0)
    goto LABEL_113;
LABEL_76:
  if ((*(_DWORD *)&v22 & 0x200000) != 0)
  {
LABEL_77:
    *((_QWORD *)v33 + 22) = *(_QWORD *)&self->_medicationsListVersionModifiedDate;
    *(_QWORD *)(v33 + 404) |= 0x200000uLL;
  }
LABEL_78:
  if (-[HDCodableMedicalIDData allergiesListsCount](self, "allergiesListsCount"))
  {
    objc_msgSend(v33, "clearAllergiesLists");
    v23 = -[HDCodableMedicalIDData allergiesListsCount](self, "allergiesListsCount");
    if (v23)
    {
      v24 = v23;
      for (m = 0; m != v24; ++m)
      {
        -[HDCodableMedicalIDData allergiesListAtIndex:](self, "allergiesListAtIndex:", m);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAllergiesList:", v26);

      }
    }
  }
  v27 = self->_has;
  if ((*(_BYTE *)&v27 & 1) == 0)
  {
    if ((*(_BYTE *)&v27 & 2) == 0)
      goto LABEL_84;
LABEL_116:
    *((_QWORD *)v33 + 2) = self->_allergiesListVersion;
    *(_QWORD *)(v33 + 404) |= 2uLL;
    if ((*(_QWORD *)&self->_has & 4) == 0)
      goto LABEL_86;
    goto LABEL_85;
  }
  *((_QWORD *)v33 + 1) = *(_QWORD *)&self->_allergiesListModifiedDate;
  *(_QWORD *)(v33 + 404) |= 1uLL;
  v27 = self->_has;
  if ((*(_BYTE *)&v27 & 2) != 0)
    goto LABEL_116;
LABEL_84:
  if ((*(_BYTE *)&v27 & 4) != 0)
  {
LABEL_85:
    *((_QWORD *)v33 + 3) = *(_QWORD *)&self->_allergiesListVersionModifiedDate;
    *(_QWORD *)(v33 + 404) |= 4uLL;
  }
LABEL_86:
  if (-[HDCodableMedicalIDData conditionsListsCount](self, "conditionsListsCount"))
  {
    objc_msgSend(v33, "clearConditionsLists");
    v28 = -[HDCodableMedicalIDData conditionsListsCount](self, "conditionsListsCount");
    if (v28)
    {
      v29 = v28;
      for (n = 0; n != v29; ++n)
      {
        -[HDCodableMedicalIDData conditionsListAtIndex:](self, "conditionsListAtIndex:", n);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addConditionsList:", v31);

      }
    }
  }
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v32 & 0x80) == 0)
      goto LABEL_92;
LABEL_119:
    *((_QWORD *)v33 + 8) = self->_conditionsListVersion;
    *(_QWORD *)(v33 + 404) |= 0x80uLL;
    if ((*(_QWORD *)&self->_has & 0x100) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
  *((_QWORD *)v33 + 7) = *(_QWORD *)&self->_conditionsListModifiedDate;
  *(_QWORD *)(v33 + 404) |= 0x40uLL;
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 0x80) != 0)
    goto LABEL_119;
LABEL_92:
  if ((*(_WORD *)&v32 & 0x100) != 0)
  {
LABEL_93:
    *((_QWORD *)v33 + 9) = *(_QWORD *)&self->_conditionsListVersionModifiedDate;
    *(_QWORD *)(v33 + 404) |= 0x100uLL;
  }
LABEL_94:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $668054F355966D14195D4E399A549C9C has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  $668054F355966D14195D4E399A549C9C v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $668054F355966D14195D4E399A549C9C v40;
  uint64_t v41;
  void *v42;
  $668054F355966D14195D4E399A549C9C v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  $668054F355966D14195D4E399A549C9C v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  $668054F355966D14195D4E399A549C9C v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  $668054F355966D14195D4E399A549C9C v64;
  id v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_medicalIDBytes, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v6;

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *(double *)(v5 + 80) = self->_dateSaved;
    *(_QWORD *)(v5 + 404) |= 0x200uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x200000000) == 0)
        goto LABEL_4;
      goto LABEL_90;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 384) = self->_schemaVersion;
  *(_QWORD *)(v5 + 404) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_90:
  *(_BYTE *)(v5 + 400) = self->_isDisabled;
  *(_QWORD *)(v5 + 404) |= 0x200000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    *(double *)(v5 + 112) = self->_isDisabledModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x2000uLL;
  }
LABEL_6:
  v9 = -[NSData copyWithZone:](self->_pictureData, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v9;

  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *(double *)(v5 + 192) = self->_pictureDataModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x800000uLL;
  }
  v11 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v11;

  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *(double *)(v5 + 184) = self->_nameModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x400000uLL;
  }
  v13 = -[HDCodableDateComponents copyWithZone:](self->_gregorianBirthday, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v13;

  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *(double *)(v5 + 96) = self->_gregorianBirthdayModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x800uLL;
  }
  v15 = -[HDCodableQuantity copyWithZone:](self->_height, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v15;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(double *)(v5 + 104) = self->_heightModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x1000uLL;
  }
  v17 = -[HDCodableQuantity copyWithZone:](self->_weight, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v17;

  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x40000000) != 0)
  {
    *(double *)(v5 + 248) = self->_weightModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x40000000uLL;
    v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x80000000) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&v19 & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_94;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v5 + 272) = self->_bloodType;
  *(_QWORD *)(v5 + 404) |= 0x80000000uLL;
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v19 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_95;
  }
LABEL_94:
  *(double *)(v5 + 40) = self->_bloodTypeModifiedDate;
  *(_QWORD *)(v5 + 404) |= 0x10uLL;
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v19 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_95:
  *(_QWORD *)(v5 + 120) = self->_isOrganDonor;
  *(_QWORD *)(v5 + 404) |= 0x4000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_19:
    *(double *)(v5 + 128) = self->_isOrganDonorModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x8000uLL;
  }
LABEL_20:
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v20 = self->_emergencyContacts;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v84;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v84 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEmergencyContacts:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v22);
  }

  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *(double *)(v5 + 88) = self->_emergencyContactsModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x400uLL;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v26 = self->_clinicalContacts;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v80;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v80 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v30), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addClinicalContacts:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    }
    while (v28);
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_clinicalContactsModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x20uLL;
  }
  v32 = -[NSString copyWithZone:](self->_medicalConditions, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v32;

  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(double *)(v5 + 136) = self->_medicalConditionsModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x10000uLL;
  }
  v34 = -[NSString copyWithZone:](self->_medicalNotes, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v34;

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(double *)(v5 + 144) = self->_medicalNotesModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x20000uLL;
  }
  v36 = -[NSString copyWithZone:](self->_allergyInfo, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v36;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_allergyInfoModifiedDate;
    *(_QWORD *)(v5 + 404) |= 8uLL;
  }
  v38 = -[NSString copyWithZone:](self->_medicationInfo, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v38;

  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x40000) != 0)
  {
    *(double *)(v5 + 152) = self->_medicationInfoModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x40000uLL;
    v40 = self->_has;
    if ((*(_QWORD *)&v40 & 0x400000000) == 0)
    {
LABEL_46:
      if ((*(_DWORD *)&v40 & 0x20000000) == 0)
        goto LABEL_48;
      goto LABEL_47;
    }
  }
  else if ((*(_QWORD *)&v40 & 0x400000000) == 0)
  {
    goto LABEL_46;
  }
  *(_BYTE *)(v5 + 401) = self->_shareDuringEmergency;
  *(_QWORD *)(v5 + 404) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_47:
    *(double *)(v5 + 240) = self->_shareDuringEmergencyModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x20000000uLL;
  }
LABEL_48:
  v41 = -[NSString copyWithZone:](self->_primaryLanguageCode, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v41;

  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x10000000) != 0)
  {
    *(double *)(v5 + 232) = self->_primaryLanguageCodeModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x10000000uLL;
    v43 = self->_has;
    if ((*(_DWORD *)&v43 & 0x4000000) == 0)
    {
LABEL_50:
      if ((*(_DWORD *)&v43 & 0x8000000) == 0)
        goto LABEL_51;
      goto LABEL_102;
    }
  }
  else if ((*(_DWORD *)&v43 & 0x4000000) == 0)
  {
    goto LABEL_50;
  }
  *(double *)(v5 + 216) = self->_pregnancyStartDate;
  *(_QWORD *)(v5 + 404) |= 0x4000000uLL;
  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x8000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v43 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_103;
  }
LABEL_102:
  *(double *)(v5 + 224) = self->_pregnancyStartDateModifiedDate;
  *(_QWORD *)(v5 + 404) |= 0x8000000uLL;
  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x1000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v43 & 0x2000000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_103:
  *(double *)(v5 + 200) = self->_pregnancyEstimatedDueDate;
  *(_QWORD *)(v5 + 404) |= 0x1000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
  {
LABEL_53:
    *(double *)(v5 + 208) = self->_pregnancyEstimatedDueDateModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x2000000uLL;
  }
LABEL_54:
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v44 = self->_medicationsLists;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v76;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v76 != v47)
          objc_enumerationMutation(v44);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v48), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMedicationsList:", v49);

        ++v48;
      }
      while (v46 != v48);
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v46);
  }

  v50 = self->_has;
  if ((*(_DWORD *)&v50 & 0x80000) != 0)
  {
    *(double *)(v5 + 160) = self->_medicationsListModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x80000uLL;
    v50 = self->_has;
    if ((*(_DWORD *)&v50 & 0x100000) == 0)
    {
LABEL_63:
      if ((*(_DWORD *)&v50 & 0x200000) == 0)
        goto LABEL_65;
      goto LABEL_64;
    }
  }
  else if ((*(_DWORD *)&v50 & 0x100000) == 0)
  {
    goto LABEL_63;
  }
  *(_QWORD *)(v5 + 168) = self->_medicationsListVersion;
  *(_QWORD *)(v5 + 404) |= 0x100000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_64:
    *(double *)(v5 + 176) = self->_medicationsListVersionModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x200000uLL;
  }
LABEL_65:
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v51 = self->_allergiesLists;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v72;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v72 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v55), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllergiesList:", v56);

        ++v55;
      }
      while (v53 != v55);
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    }
    while (v53);
  }

  v57 = self->_has;
  if ((*(_BYTE *)&v57 & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_allergiesListModifiedDate;
    *(_QWORD *)(v5 + 404) |= 1uLL;
    v57 = self->_has;
    if ((*(_BYTE *)&v57 & 2) == 0)
    {
LABEL_74:
      if ((*(_BYTE *)&v57 & 4) == 0)
        goto LABEL_76;
      goto LABEL_75;
    }
  }
  else if ((*(_BYTE *)&v57 & 2) == 0)
  {
    goto LABEL_74;
  }
  *(_QWORD *)(v5 + 16) = self->_allergiesListVersion;
  *(_QWORD *)(v5 + 404) |= 2uLL;
  if ((*(_QWORD *)&self->_has & 4) != 0)
  {
LABEL_75:
    *(double *)(v5 + 24) = self->_allergiesListVersionModifiedDate;
    *(_QWORD *)(v5 + 404) |= 4uLL;
  }
LABEL_76:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v58 = self->_conditionsLists;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v68;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v68 != v61)
          objc_enumerationMutation(v58);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v62), "copyWithZone:", a3, (_QWORD)v67);
        objc_msgSend((id)v5, "addConditionsList:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    }
    while (v60);
  }

  v64 = self->_has;
  if ((*(_BYTE *)&v64 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v64 & 0x80) == 0)
      goto LABEL_85;
LABEL_112:
    *(_QWORD *)(v5 + 64) = self->_conditionsListVersion;
    *(_QWORD *)(v5 + 404) |= 0x80uLL;
    if ((*(_QWORD *)&self->_has & 0x100) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
  *(double *)(v5 + 56) = self->_conditionsListModifiedDate;
  *(_QWORD *)(v5 + 404) |= 0x40uLL;
  v64 = self->_has;
  if ((*(_BYTE *)&v64 & 0x80) != 0)
    goto LABEL_112;
LABEL_85:
  if ((*(_WORD *)&v64 & 0x100) != 0)
  {
LABEL_86:
    *(double *)(v5 + 72) = self->_conditionsListVersionModifiedDate;
    *(_QWORD *)(v5 + 404) |= 0x100uLL;
  }
LABEL_87:
  v65 = (id)v5;

  return v65;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSData *medicalIDBytes;
  $668054F355966D14195D4E399A549C9C has;
  uint64_t v7;
  NSData *pictureData;
  NSString *name;
  HDCodableDateComponents *gregorianBirthday;
  HDCodableQuantity *height;
  HDCodableQuantity *weight;
  NSMutableArray *emergencyContacts;
  NSMutableArray *clinicalContacts;
  NSString *medicalConditions;
  NSString *medicalNotes;
  NSString *allergyInfo;
  NSString *medicationInfo;
  NSString *primaryLanguageCode;
  NSMutableArray *medicationsLists;
  NSMutableArray *allergiesLists;
  NSMutableArray *conditionsLists;
  BOOL v23;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_230;
  medicalIDBytes = self->_medicalIDBytes;
  if ((unint64_t)medicalIDBytes | *((_QWORD *)v4 + 41))
  {
    if (!-[NSData isEqual:](medicalIDBytes, "isEqual:"))
      goto LABEL_230;
  }
  has = self->_has;
  v7 = *(_QWORD *)(v4 + 404);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_dateSaved != *((double *)v4 + 10))
      goto LABEL_230;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_schemaVersion != *((_DWORD *)v4 + 96))
      goto LABEL_230;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0)
      goto LABEL_230;
    if (self->_isDisabled)
    {
      if (!v4[400])
        goto LABEL_230;
    }
    else if (v4[400])
    {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_isDisabledModifiedDate != *((double *)v4 + 14))
      goto LABEL_230;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_230;
  }
  pictureData = self->_pictureData;
  if ((unint64_t)pictureData | *((_QWORD *)v4 + 46))
  {
    if (!-[NSData isEqual:](pictureData, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_pictureDataModifiedDate != *((double *)v4 + 24))
      goto LABEL_230;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_230;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_nameModifiedDate != *((double *)v4 + 23))
      goto LABEL_230;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_230;
  }
  gregorianBirthday = self->_gregorianBirthday;
  if ((unint64_t)gregorianBirthday | *((_QWORD *)v4 + 38))
  {
    if (!-[HDCodableDateComponents isEqual:](gregorianBirthday, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_gregorianBirthdayModifiedDate != *((double *)v4 + 12))
      goto LABEL_230;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_230;
  }
  height = self->_height;
  if ((unint64_t)height | *((_QWORD *)v4 + 39))
  {
    if (!-[HDCodableQuantity isEqual:](height, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_heightModifiedDate != *((double *)v4 + 13))
      goto LABEL_230;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_230;
  }
  weight = self->_weight;
  if ((unint64_t)weight | *((_QWORD *)v4 + 49))
  {
    if (!-[HDCodableQuantity isEqual:](weight, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_weightModifiedDate != *((double *)v4 + 31))
      goto LABEL_230;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_bloodType != *((_DWORD *)v4 + 68))
      goto LABEL_230;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bloodTypeModifiedDate != *((double *)v4 + 5))
      goto LABEL_230;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_isOrganDonor != *((_QWORD *)v4 + 15))
      goto LABEL_230;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_isOrganDonorModifiedDate != *((double *)v4 + 16))
      goto LABEL_230;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_230;
  }
  emergencyContacts = self->_emergencyContacts;
  if ((unint64_t)emergencyContacts | *((_QWORD *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](emergencyContacts, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_emergencyContactsModifiedDate != *((double *)v4 + 11))
      goto LABEL_230;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_230;
  }
  clinicalContacts = self->_clinicalContacts;
  if ((unint64_t)clinicalContacts | *((_QWORD *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](clinicalContacts, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_clinicalContactsModifiedDate != *((double *)v4 + 6))
      goto LABEL_230;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_230;
  }
  medicalConditions = self->_medicalConditions;
  if ((unint64_t)medicalConditions | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](medicalConditions, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_medicalConditionsModifiedDate != *((double *)v4 + 17))
      goto LABEL_230;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_230;
  }
  medicalNotes = self->_medicalNotes;
  if ((unint64_t)medicalNotes | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](medicalNotes, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_medicalNotesModifiedDate != *((double *)v4 + 18))
      goto LABEL_230;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_230;
  }
  allergyInfo = self->_allergyInfo;
  if ((unint64_t)allergyInfo | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](allergyInfo, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_allergyInfoModifiedDate != *((double *)v4 + 4))
      goto LABEL_230;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_230;
  }
  medicationInfo = self->_medicationInfo;
  if ((unint64_t)medicationInfo | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](medicationInfo, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_medicationInfoModifiedDate != *((double *)v4 + 19))
      goto LABEL_230;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0)
      goto LABEL_230;
    if (self->_shareDuringEmergency)
    {
      if (!v4[401])
        goto LABEL_230;
    }
    else if (v4[401])
    {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_shareDuringEmergencyModifiedDate != *((double *)v4 + 30))
      goto LABEL_230;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_230;
  }
  primaryLanguageCode = self->_primaryLanguageCode;
  if ((unint64_t)primaryLanguageCode | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](primaryLanguageCode, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_primaryLanguageCodeModifiedDate != *((double *)v4 + 29))
      goto LABEL_230;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_pregnancyStartDate != *((double *)v4 + 27))
      goto LABEL_230;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_pregnancyStartDateModifiedDate != *((double *)v4 + 28))
      goto LABEL_230;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_pregnancyEstimatedDueDate != *((double *)v4 + 25))
      goto LABEL_230;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_pregnancyEstimatedDueDateModifiedDate != *((double *)v4 + 26))
      goto LABEL_230;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_230;
  }
  medicationsLists = self->_medicationsLists;
  if ((unint64_t)medicationsLists | *((_QWORD *)v4 + 44))
  {
    if (!-[NSMutableArray isEqual:](medicationsLists, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_medicationsListModifiedDate != *((double *)v4 + 20))
      goto LABEL_230;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_medicationsListVersion != *((_QWORD *)v4 + 21))
      goto LABEL_230;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_medicationsListVersionModifiedDate != *((double *)v4 + 22))
      goto LABEL_230;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_230;
  }
  allergiesLists = self->_allergiesLists;
  if ((unint64_t)allergiesLists | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](allergiesLists, "isEqual:"))
      goto LABEL_230;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 404);
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_allergiesListModifiedDate != *((double *)v4 + 1))
      goto LABEL_230;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_allergiesListVersion != *((_QWORD *)v4 + 2))
      goto LABEL_230;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_allergiesListVersionModifiedDate != *((double *)v4 + 3))
      goto LABEL_230;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_230;
  }
  conditionsLists = self->_conditionsLists;
  if ((unint64_t)conditionsLists | *((_QWORD *)v4 + 36))
  {
    if (-[NSMutableArray isEqual:](conditionsLists, "isEqual:"))
    {
      has = self->_has;
      v7 = *(_QWORD *)(v4 + 404);
      goto LABEL_215;
    }
LABEL_230:
    v23 = 0;
    goto LABEL_231;
  }
LABEL_215:
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_conditionsListModifiedDate != *((double *)v4 + 7))
      goto LABEL_230;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_conditionsListVersion != *((_QWORD *)v4 + 8))
      goto LABEL_230;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_conditionsListVersionModifiedDate != *((double *)v4 + 9))
      goto LABEL_230;
    v23 = 1;
  }
  else
  {
    v23 = (v7 & 0x100) == 0;
  }
LABEL_231:

  return v23;
}

- (unint64_t)hash
{
  $668054F355966D14195D4E399A549C9C has;
  unint64_t v4;
  double dateSaved;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double isDisabledModifiedDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double pictureDataModifiedDate;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double nameModifiedDate;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double gregorianBirthdayModifiedDate;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double heightModifiedDate;
  double v31;
  long double v32;
  double v33;
  $668054F355966D14195D4E399A549C9C v34;
  unint64_t v35;
  double weightModifiedDate;
  double v37;
  long double v38;
  double v39;
  double bloodTypeModifiedDate;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  double isOrganDonorModifiedDate;
  double v47;
  long double v48;
  double v49;
  unint64_t v50;
  double emergencyContactsModifiedDate;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  double clinicalContactsModifiedDate;
  double v57;
  long double v58;
  double v59;
  unint64_t v60;
  double medicalConditionsModifiedDate;
  double v62;
  long double v63;
  double v64;
  unint64_t v65;
  double medicalNotesModifiedDate;
  double v67;
  long double v68;
  double v69;
  unint64_t v70;
  double allergyInfoModifiedDate;
  double v72;
  long double v73;
  double v74;
  $668054F355966D14195D4E399A549C9C v75;
  unint64_t v76;
  double medicationInfoModifiedDate;
  double v78;
  long double v79;
  double v80;
  unint64_t v81;
  double shareDuringEmergencyModifiedDate;
  double v83;
  long double v84;
  double v85;
  $668054F355966D14195D4E399A549C9C v86;
  unint64_t v87;
  double primaryLanguageCodeModifiedDate;
  double v89;
  long double v90;
  double v91;
  unint64_t v92;
  double pregnancyStartDate;
  double v94;
  long double v95;
  double v96;
  unint64_t v97;
  double pregnancyStartDateModifiedDate;
  double v99;
  long double v100;
  double v101;
  unint64_t v102;
  double pregnancyEstimatedDueDate;
  double v104;
  long double v105;
  double v106;
  unint64_t v107;
  double pregnancyEstimatedDueDateModifiedDate;
  double v109;
  long double v110;
  double v111;
  $668054F355966D14195D4E399A549C9C v112;
  unint64_t v113;
  double medicationsListModifiedDate;
  double v115;
  long double v116;
  double v117;
  unint64_t v118;
  double medicationsListVersionModifiedDate;
  double v120;
  long double v121;
  double v122;
  $668054F355966D14195D4E399A549C9C v123;
  unint64_t v124;
  double allergiesListModifiedDate;
  double v126;
  long double v127;
  double v128;
  double allergiesListVersionModifiedDate;
  double v130;
  long double v131;
  double v132;
  unint64_t v133;
  uint64_t v134;
  $668054F355966D14195D4E399A549C9C v135;
  unint64_t v136;
  double conditionsListModifiedDate;
  double v138;
  long double v139;
  double v140;
  uint64_t v141;
  double conditionsListVersionModifiedDate;
  double v143;
  long double v144;
  double v145;
  unint64_t v146;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;
  NSUInteger v158;
  unint64_t v159;
  uint64_t v160;
  unint64_t v161;
  NSUInteger v162;
  unint64_t v163;
  NSUInteger v164;
  unint64_t v165;
  NSUInteger v166;
  unint64_t v167;
  NSUInteger v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  NSUInteger v184;
  unint64_t v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;

  v191 = -[NSData hash](self->_medicalIDBytes, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    dateSaved = self->_dateSaved;
    v6 = -dateSaved;
    if (dateSaved >= 0.0)
      v6 = self->_dateSaved;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    v189 = 2654435761 * self->_schemaVersion;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_11;
  }
  else
  {
    v189 = 0;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
    {
LABEL_11:
      v188 = 2654435761 * self->_isDisabled;
      goto LABEL_14;
    }
  }
  v188 = 0;
LABEL_14:
  v190 = v4;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    isDisabledModifiedDate = self->_isDisabledModifiedDate;
    v11 = -isDisabledModifiedDate;
    if (isDisabledModifiedDate >= 0.0)
      v11 = self->_isDisabledModifiedDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v187 = v9;
  v186 = -[NSData hash](self->_pictureData, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    pictureDataModifiedDate = self->_pictureDataModifiedDate;
    v16 = -pictureDataModifiedDate;
    if (pictureDataModifiedDate >= 0.0)
      v16 = self->_pictureDataModifiedDate;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v185 = v14;
  v184 = -[NSString hash](self->_name, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    nameModifiedDate = self->_nameModifiedDate;
    v21 = -nameModifiedDate;
    if (nameModifiedDate >= 0.0)
      v21 = self->_nameModifiedDate;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v183 = v19;
  v182 = -[HDCodableDateComponents hash](self->_gregorianBirthday, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    gregorianBirthdayModifiedDate = self->_gregorianBirthdayModifiedDate;
    v26 = -gregorianBirthdayModifiedDate;
    if (gregorianBirthdayModifiedDate >= 0.0)
      v26 = self->_gregorianBirthdayModifiedDate;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  v181 = v24;
  v180 = -[HDCodableQuantity hash](self->_height, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    heightModifiedDate = self->_heightModifiedDate;
    v31 = -heightModifiedDate;
    if (heightModifiedDate >= 0.0)
      v31 = self->_heightModifiedDate;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  v179 = v29;
  v178 = -[HDCodableQuantity hash](self->_weight, "hash");
  v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x40000000) != 0)
  {
    weightModifiedDate = self->_weightModifiedDate;
    v37 = -weightModifiedDate;
    if (weightModifiedDate >= 0.0)
      v37 = self->_weightModifiedDate;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  if ((*(_DWORD *)&v34 & 0x80000000) != 0)
  {
    v176 = 2654435761 * self->_bloodType;
    if ((*(_BYTE *)&v34 & 0x10) != 0)
      goto LABEL_64;
LABEL_69:
    v44 = 0;
    goto LABEL_72;
  }
  v176 = 0;
  if ((*(_BYTE *)&v34 & 0x10) == 0)
    goto LABEL_69;
LABEL_64:
  bloodTypeModifiedDate = self->_bloodTypeModifiedDate;
  v41 = -bloodTypeModifiedDate;
  if (bloodTypeModifiedDate >= 0.0)
    v41 = self->_bloodTypeModifiedDate;
  v42 = floor(v41 + 0.5);
  v43 = (v41 - v42) * 1.84467441e19;
  v44 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
  if (v43 >= 0.0)
  {
    if (v43 > 0.0)
      v44 += (unint64_t)v43;
  }
  else
  {
    v44 -= (unint64_t)fabs(v43);
  }
LABEL_72:
  if ((*(_WORD *)&v34 & 0x4000) != 0)
    v174 = 2654435761 * self->_isOrganDonor;
  else
    v174 = 0;
  v175 = v44;
  if ((*(_WORD *)&v34 & 0x8000) != 0)
  {
    isOrganDonorModifiedDate = self->_isOrganDonorModifiedDate;
    v47 = -isOrganDonorModifiedDate;
    if (isOrganDonorModifiedDate >= 0.0)
      v47 = self->_isOrganDonorModifiedDate;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v173 = v45;
  v172 = -[NSMutableArray hash](self->_emergencyContacts, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    emergencyContactsModifiedDate = self->_emergencyContactsModifiedDate;
    v52 = -emergencyContactsModifiedDate;
    if (emergencyContactsModifiedDate >= 0.0)
      v52 = self->_emergencyContactsModifiedDate;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  v171 = v50;
  v170 = -[NSMutableArray hash](self->_clinicalContacts, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    clinicalContactsModifiedDate = self->_clinicalContactsModifiedDate;
    v57 = -clinicalContactsModifiedDate;
    if (clinicalContactsModifiedDate >= 0.0)
      v57 = self->_clinicalContactsModifiedDate;
    v58 = floor(v57 + 0.5);
    v59 = (v57 - v58) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0)
        v55 += (unint64_t)v59;
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    v55 = 0;
  }
  v169 = v55;
  v168 = -[NSString hash](self->_medicalConditions, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    medicalConditionsModifiedDate = self->_medicalConditionsModifiedDate;
    v62 = -medicalConditionsModifiedDate;
    if (medicalConditionsModifiedDate >= 0.0)
      v62 = self->_medicalConditionsModifiedDate;
    v63 = floor(v62 + 0.5);
    v64 = (v62 - v63) * 1.84467441e19;
    v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0)
        v60 += (unint64_t)v64;
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    v60 = 0;
  }
  v167 = v60;
  v166 = -[NSString hash](self->_medicalNotes, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    medicalNotesModifiedDate = self->_medicalNotesModifiedDate;
    v67 = -medicalNotesModifiedDate;
    if (medicalNotesModifiedDate >= 0.0)
      v67 = self->_medicalNotesModifiedDate;
    v68 = floor(v67 + 0.5);
    v69 = (v67 - v68) * 1.84467441e19;
    v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0)
        v65 += (unint64_t)v69;
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    v65 = 0;
  }
  v165 = v65;
  v164 = -[NSString hash](self->_allergyInfo, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    allergyInfoModifiedDate = self->_allergyInfoModifiedDate;
    v72 = -allergyInfoModifiedDate;
    if (allergyInfoModifiedDate >= 0.0)
      v72 = self->_allergyInfoModifiedDate;
    v73 = floor(v72 + 0.5);
    v74 = (v72 - v73) * 1.84467441e19;
    v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0)
        v70 += (unint64_t)v74;
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    v70 = 0;
  }
  v163 = v70;
  v162 = -[NSString hash](self->_medicationInfo, "hash");
  v75 = self->_has;
  if ((*(_DWORD *)&v75 & 0x40000) != 0)
  {
    medicationInfoModifiedDate = self->_medicationInfoModifiedDate;
    v78 = -medicationInfoModifiedDate;
    if (medicationInfoModifiedDate >= 0.0)
      v78 = self->_medicationInfoModifiedDate;
    v79 = floor(v78 + 0.5);
    v80 = (v78 - v79) * 1.84467441e19;
    v76 = 2654435761u * (unint64_t)fmod(v79, 1.84467441e19);
    if (v80 >= 0.0)
    {
      if (v80 > 0.0)
        v76 += (unint64_t)v80;
    }
    else
    {
      v76 -= (unint64_t)fabs(v80);
    }
  }
  else
  {
    v76 = 0;
  }
  if ((*(_QWORD *)&v75 & 0x400000000) != 0)
    v160 = 2654435761 * self->_shareDuringEmergency;
  else
    v160 = 0;
  v161 = v76;
  if ((*(_DWORD *)&v75 & 0x20000000) != 0)
  {
    shareDuringEmergencyModifiedDate = self->_shareDuringEmergencyModifiedDate;
    v83 = -shareDuringEmergencyModifiedDate;
    if (shareDuringEmergencyModifiedDate >= 0.0)
      v83 = self->_shareDuringEmergencyModifiedDate;
    v84 = floor(v83 + 0.5);
    v85 = (v83 - v84) * 1.84467441e19;
    v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0)
        v81 += (unint64_t)v85;
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    v81 = 0;
  }
  v159 = v81;
  v158 = -[NSString hash](self->_primaryLanguageCode, "hash");
  v86 = self->_has;
  if ((*(_DWORD *)&v86 & 0x10000000) != 0)
  {
    primaryLanguageCodeModifiedDate = self->_primaryLanguageCodeModifiedDate;
    v89 = -primaryLanguageCodeModifiedDate;
    if (primaryLanguageCodeModifiedDate >= 0.0)
      v89 = self->_primaryLanguageCodeModifiedDate;
    v90 = floor(v89 + 0.5);
    v91 = (v89 - v90) * 1.84467441e19;
    v87 = 2654435761u * (unint64_t)fmod(v90, 1.84467441e19);
    if (v91 >= 0.0)
    {
      if (v91 > 0.0)
        v87 += (unint64_t)v91;
    }
    else
    {
      v87 -= (unint64_t)fabs(v91);
    }
  }
  else
  {
    v87 = 0;
  }
  if ((*(_DWORD *)&v86 & 0x4000000) != 0)
  {
    pregnancyStartDate = self->_pregnancyStartDate;
    v94 = -pregnancyStartDate;
    if (pregnancyStartDate >= 0.0)
      v94 = self->_pregnancyStartDate;
    v95 = floor(v94 + 0.5);
    v96 = (v94 - v95) * 1.84467441e19;
    v92 = 2654435761u * (unint64_t)fmod(v95, 1.84467441e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0)
        v92 += (unint64_t)v96;
    }
    else
    {
      v92 -= (unint64_t)fabs(v96);
    }
  }
  else
  {
    v92 = 0;
  }
  if ((*(_DWORD *)&v86 & 0x8000000) != 0)
  {
    pregnancyStartDateModifiedDate = self->_pregnancyStartDateModifiedDate;
    v99 = -pregnancyStartDateModifiedDate;
    if (pregnancyStartDateModifiedDate >= 0.0)
      v99 = self->_pregnancyStartDateModifiedDate;
    v100 = floor(v99 + 0.5);
    v101 = (v99 - v100) * 1.84467441e19;
    v97 = 2654435761u * (unint64_t)fmod(v100, 1.84467441e19);
    if (v101 >= 0.0)
    {
      if (v101 > 0.0)
        v97 += (unint64_t)v101;
    }
    else
    {
      v97 -= (unint64_t)fabs(v101);
    }
  }
  else
  {
    v97 = 0;
  }
  if ((*(_DWORD *)&v86 & 0x1000000) != 0)
  {
    pregnancyEstimatedDueDate = self->_pregnancyEstimatedDueDate;
    v104 = -pregnancyEstimatedDueDate;
    if (pregnancyEstimatedDueDate >= 0.0)
      v104 = self->_pregnancyEstimatedDueDate;
    v105 = floor(v104 + 0.5);
    v106 = (v104 - v105) * 1.84467441e19;
    v102 = 2654435761u * (unint64_t)fmod(v105, 1.84467441e19);
    if (v106 >= 0.0)
    {
      if (v106 > 0.0)
        v102 += (unint64_t)v106;
    }
    else
    {
      v102 -= (unint64_t)fabs(v106);
    }
  }
  else
  {
    v102 = 0;
  }
  v155 = v102;
  v177 = v35;
  if ((*(_DWORD *)&v86 & 0x2000000) != 0)
  {
    pregnancyEstimatedDueDateModifiedDate = self->_pregnancyEstimatedDueDateModifiedDate;
    v109 = -pregnancyEstimatedDueDateModifiedDate;
    if (pregnancyEstimatedDueDateModifiedDate >= 0.0)
      v109 = self->_pregnancyEstimatedDueDateModifiedDate;
    v110 = floor(v109 + 0.5);
    v111 = (v109 - v110) * 1.84467441e19;
    v107 = 2654435761u * (unint64_t)fmod(v110, 1.84467441e19);
    if (v111 >= 0.0)
    {
      if (v111 > 0.0)
        v107 += (unint64_t)v111;
    }
    else
    {
      v107 -= (unint64_t)fabs(v111);
    }
  }
  else
  {
    v107 = 0;
  }
  v154 = v107;
  v153 = -[NSMutableArray hash](self->_medicationsLists, "hash");
  v112 = self->_has;
  if ((*(_DWORD *)&v112 & 0x80000) != 0)
  {
    medicationsListModifiedDate = self->_medicationsListModifiedDate;
    v115 = -medicationsListModifiedDate;
    if (medicationsListModifiedDate >= 0.0)
      v115 = self->_medicationsListModifiedDate;
    v116 = floor(v115 + 0.5);
    v117 = (v115 - v116) * 1.84467441e19;
    v113 = 2654435761u * (unint64_t)fmod(v116, 1.84467441e19);
    if (v117 >= 0.0)
    {
      if (v117 > 0.0)
        v113 += (unint64_t)v117;
    }
    else
    {
      v113 -= (unint64_t)fabs(v117);
    }
  }
  else
  {
    v113 = 0;
  }
  if ((*(_DWORD *)&v112 & 0x100000) != 0)
    v151 = 2654435761 * self->_medicationsListVersion;
  else
    v151 = 0;
  v152 = v113;
  v157 = v87;
  if ((*(_DWORD *)&v112 & 0x200000) != 0)
  {
    medicationsListVersionModifiedDate = self->_medicationsListVersionModifiedDate;
    v120 = -medicationsListVersionModifiedDate;
    if (medicationsListVersionModifiedDate >= 0.0)
      v120 = self->_medicationsListVersionModifiedDate;
    v121 = floor(v120 + 0.5);
    v122 = (v120 - v121) * 1.84467441e19;
    v118 = 2654435761u * (unint64_t)fmod(v121, 1.84467441e19);
    if (v122 >= 0.0)
    {
      if (v122 > 0.0)
        v118 += (unint64_t)v122;
    }
    else
    {
      v118 -= (unint64_t)fabs(v122);
    }
  }
  else
  {
    v118 = 0;
  }
  v156 = v92;
  v150 = -[NSMutableArray hash](self->_allergiesLists, "hash");
  v123 = self->_has;
  if ((*(_BYTE *)&v123 & 1) != 0)
  {
    allergiesListModifiedDate = self->_allergiesListModifiedDate;
    v126 = -allergiesListModifiedDate;
    if (allergiesListModifiedDate >= 0.0)
      v126 = self->_allergiesListModifiedDate;
    v127 = floor(v126 + 0.5);
    v128 = (v126 - v127) * 1.84467441e19;
    v124 = 2654435761u * (unint64_t)fmod(v127, 1.84467441e19);
    if (v128 >= 0.0)
    {
      if (v128 > 0.0)
        v124 += (unint64_t)v128;
    }
    else
    {
      v124 -= (unint64_t)fabs(v128);
    }
  }
  else
  {
    v124 = 0;
  }
  if ((*(_BYTE *)&v123 & 2) != 0)
  {
    v148 = 2654435761 * self->_allergiesListVersion;
    if ((*(_BYTE *)&v123 & 4) != 0)
      goto LABEL_211;
LABEL_216:
    v133 = 0;
    goto LABEL_219;
  }
  v148 = 0;
  if ((*(_BYTE *)&v123 & 4) == 0)
    goto LABEL_216;
LABEL_211:
  allergiesListVersionModifiedDate = self->_allergiesListVersionModifiedDate;
  v130 = -allergiesListVersionModifiedDate;
  if (allergiesListVersionModifiedDate >= 0.0)
    v130 = self->_allergiesListVersionModifiedDate;
  v131 = floor(v130 + 0.5);
  v132 = (v130 - v131) * 1.84467441e19;
  v133 = 2654435761u * (unint64_t)fmod(v131, 1.84467441e19);
  if (v132 >= 0.0)
  {
    if (v132 > 0.0)
      v133 += (unint64_t)v132;
  }
  else
  {
    v133 -= (unint64_t)fabs(v132);
  }
LABEL_219:
  v134 = -[NSMutableArray hash](self->_conditionsLists, "hash", v148);
  v135 = self->_has;
  if ((*(_BYTE *)&v135 & 0x40) != 0)
  {
    conditionsListModifiedDate = self->_conditionsListModifiedDate;
    v138 = -conditionsListModifiedDate;
    if (conditionsListModifiedDate >= 0.0)
      v138 = self->_conditionsListModifiedDate;
    v139 = floor(v138 + 0.5);
    v140 = (v138 - v139) * 1.84467441e19;
    v136 = 2654435761u * (unint64_t)fmod(v139, 1.84467441e19);
    if (v140 >= 0.0)
    {
      if (v140 > 0.0)
        v136 += (unint64_t)v140;
    }
    else
    {
      v136 -= (unint64_t)fabs(v140);
    }
  }
  else
  {
    v136 = 0;
  }
  if ((*(_BYTE *)&v135 & 0x80) != 0)
  {
    v141 = 2654435761 * self->_conditionsListVersion;
    if ((*(_WORD *)&v135 & 0x100) != 0)
      goto LABEL_229;
LABEL_234:
    v146 = 0;
    return v190 ^ v191 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v97 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v118 ^ v150 ^ v124 ^ v149 ^ v133 ^ v134 ^ v136 ^ v141 ^ v146;
  }
  v141 = 0;
  if ((*(_WORD *)&v135 & 0x100) == 0)
    goto LABEL_234;
LABEL_229:
  conditionsListVersionModifiedDate = self->_conditionsListVersionModifiedDate;
  v143 = -conditionsListVersionModifiedDate;
  if (conditionsListVersionModifiedDate >= 0.0)
    v143 = self->_conditionsListVersionModifiedDate;
  v144 = floor(v143 + 0.5);
  v145 = (v143 - v144) * 1.84467441e19;
  v146 = 2654435761u * (unint64_t)fmod(v144, 1.84467441e19);
  if (v145 >= 0.0)
  {
    if (v145 > 0.0)
      v146 += (unint64_t)v145;
  }
  else
  {
    v146 -= (unint64_t)fabs(v145);
  }
  return v190 ^ v191 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v97 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v118 ^ v150 ^ v124 ^ v149 ^ v133 ^ v134 ^ v136 ^ v141 ^ v146;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  HDCodableDateComponents *gregorianBirthday;
  uint64_t v7;
  HDCodableQuantity *height;
  uint64_t v9;
  HDCodableQuantity *weight;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 41))
    -[HDCodableMedicalIDData setMedicalIDBytes:](self, "setMedicalIDBytes:");
  v5 = *(_QWORD *)(v4 + 404);
  if ((v5 & 0x200) != 0)
  {
    self->_dateSaved = *((double *)v4 + 10);
    *(_QWORD *)&self->_has |= 0x200uLL;
    v5 = *(_QWORD *)(v4 + 404);
    if ((v5 & 0x100000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x200000000) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  self->_schemaVersion = *((_DWORD *)v4 + 96);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)(v4 + 404);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  self->_isDisabled = v4[400];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  if ((*(_QWORD *)(v4 + 404) & 0x2000) != 0)
  {
LABEL_7:
    self->_isDisabledModifiedDate = *((double *)v4 + 14);
    *(_QWORD *)&self->_has |= 0x2000uLL;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 46))
    -[HDCodableMedicalIDData setPictureData:](self, "setPictureData:");
  if (v4[406] < 0)
  {
    self->_pictureDataModifiedDate = *((double *)v4 + 24);
    *(_QWORD *)&self->_has |= 0x800000uLL;
  }
  if (*((_QWORD *)v4 + 45))
    -[HDCodableMedicalIDData setName:](self, "setName:");
  if ((v4[406] & 0x40) != 0)
  {
    self->_nameModifiedDate = *((double *)v4 + 23);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
  gregorianBirthday = self->_gregorianBirthday;
  v7 = *((_QWORD *)v4 + 38);
  if (gregorianBirthday)
  {
    if (v7)
      -[HDCodableDateComponents mergeFrom:](gregorianBirthday, "mergeFrom:");
  }
  else if (v7)
  {
    -[HDCodableMedicalIDData setGregorianBirthday:](self, "setGregorianBirthday:");
  }
  if ((v4[405] & 8) != 0)
  {
    self->_gregorianBirthdayModifiedDate = *((double *)v4 + 12);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
  height = self->_height;
  v9 = *((_QWORD *)v4 + 39);
  if (height)
  {
    if (v9)
      -[HDCodableQuantity mergeFrom:](height, "mergeFrom:");
  }
  else if (v9)
  {
    -[HDCodableMedicalIDData setHeight:](self, "setHeight:");
  }
  if ((v4[405] & 0x10) != 0)
  {
    self->_heightModifiedDate = *((double *)v4 + 13);
    *(_QWORD *)&self->_has |= 0x1000uLL;
  }
  weight = self->_weight;
  v11 = *((_QWORD *)v4 + 49);
  if (weight)
  {
    if (v11)
      -[HDCodableQuantity mergeFrom:](weight, "mergeFrom:");
  }
  else if (v11)
  {
    -[HDCodableMedicalIDData setWeight:](self, "setWeight:");
  }
  v12 = *(_QWORD *)(v4 + 404);
  if ((v12 & 0x40000000) != 0)
  {
    self->_weightModifiedDate = *((double *)v4 + 31);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v12 = *(_QWORD *)(v4 + 404);
    if ((v12 & 0x80000000) == 0)
    {
LABEL_41:
      if ((v12 & 0x10) == 0)
        goto LABEL_42;
      goto LABEL_125;
    }
  }
  else if ((v12 & 0x80000000) == 0)
  {
    goto LABEL_41;
  }
  self->_bloodType = *((_DWORD *)v4 + 68);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v12 = *(_QWORD *)(v4 + 404);
  if ((v12 & 0x10) == 0)
  {
LABEL_42:
    if ((v12 & 0x4000) == 0)
      goto LABEL_43;
    goto LABEL_126;
  }
LABEL_125:
  self->_bloodTypeModifiedDate = *((double *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v12 = *(_QWORD *)(v4 + 404);
  if ((v12 & 0x4000) == 0)
  {
LABEL_43:
    if ((v12 & 0x8000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_126:
  self->_isOrganDonor = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  if ((*(_QWORD *)(v4 + 404) & 0x8000) != 0)
  {
LABEL_44:
    self->_isOrganDonorModifiedDate = *((double *)v4 + 16);
    *(_QWORD *)&self->_has |= 0x8000uLL;
  }
LABEL_45:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v13 = *((id *)v4 + 37);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v60 != v16)
          objc_enumerationMutation(v13);
        -[HDCodableMedicalIDData addEmergencyContacts:](self, "addEmergencyContacts:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v15);
  }

  if ((v4[405] & 4) != 0)
  {
    self->_emergencyContactsModifiedDate = *((double *)v4 + 11);
    *(_QWORD *)&self->_has |= 0x400uLL;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v18 = *((id *)v4 + 35);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v56 != v21)
          objc_enumerationMutation(v18);
        -[HDCodableMedicalIDData addClinicalContacts:](self, "addClinicalContacts:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v20);
  }

  if ((v4[404] & 0x20) != 0)
  {
    self->_clinicalContactsModifiedDate = *((double *)v4 + 6);
    *(_QWORD *)&self->_has |= 0x20uLL;
  }
  if (*((_QWORD *)v4 + 40))
    -[HDCodableMedicalIDData setMedicalConditions:](self, "setMedicalConditions:");
  if ((v4[406] & 1) != 0)
  {
    self->_medicalConditionsModifiedDate = *((double *)v4 + 17);
    *(_QWORD *)&self->_has |= 0x10000uLL;
  }
  if (*((_QWORD *)v4 + 42))
    -[HDCodableMedicalIDData setMedicalNotes:](self, "setMedicalNotes:");
  if ((v4[406] & 2) != 0)
  {
    self->_medicalNotesModifiedDate = *((double *)v4 + 18);
    *(_QWORD *)&self->_has |= 0x20000uLL;
  }
  if (*((_QWORD *)v4 + 33))
    -[HDCodableMedicalIDData setAllergyInfo:](self, "setAllergyInfo:");
  if ((v4[404] & 8) != 0)
  {
    self->_allergyInfoModifiedDate = *((double *)v4 + 4);
    *(_QWORD *)&self->_has |= 8uLL;
  }
  if (*((_QWORD *)v4 + 43))
    -[HDCodableMedicalIDData setMedicationInfo:](self, "setMedicationInfo:");
  v23 = *(_QWORD *)(v4 + 404);
  if ((v23 & 0x40000) != 0)
  {
    self->_medicationInfoModifiedDate = *((double *)v4 + 19);
    *(_QWORD *)&self->_has |= 0x40000uLL;
    v23 = *(_QWORD *)(v4 + 404);
    if ((v23 & 0x400000000) == 0)
    {
LABEL_79:
      if ((v23 & 0x20000000) == 0)
        goto LABEL_81;
      goto LABEL_80;
    }
  }
  else if ((v23 & 0x400000000) == 0)
  {
    goto LABEL_79;
  }
  self->_shareDuringEmergency = v4[401];
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  if ((*(_QWORD *)(v4 + 404) & 0x20000000) != 0)
  {
LABEL_80:
    self->_shareDuringEmergencyModifiedDate = *((double *)v4 + 30);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
  }
LABEL_81:
  if (*((_QWORD *)v4 + 47))
    -[HDCodableMedicalIDData setPrimaryLanguageCode:](self, "setPrimaryLanguageCode:");
  v24 = *(_QWORD *)(v4 + 404);
  if ((v24 & 0x10000000) != 0)
  {
    self->_primaryLanguageCodeModifiedDate = *((double *)v4 + 29);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
    v24 = *(_QWORD *)(v4 + 404);
    if ((v24 & 0x4000000) == 0)
    {
LABEL_85:
      if ((v24 & 0x8000000) == 0)
        goto LABEL_86;
      goto LABEL_133;
    }
  }
  else if ((v24 & 0x4000000) == 0)
  {
    goto LABEL_85;
  }
  self->_pregnancyStartDate = *((double *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v24 = *(_QWORD *)(v4 + 404);
  if ((v24 & 0x8000000) == 0)
  {
LABEL_86:
    if ((v24 & 0x1000000) == 0)
      goto LABEL_87;
    goto LABEL_134;
  }
LABEL_133:
  self->_pregnancyStartDateModifiedDate = *((double *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v24 = *(_QWORD *)(v4 + 404);
  if ((v24 & 0x1000000) == 0)
  {
LABEL_87:
    if ((v24 & 0x2000000) == 0)
      goto LABEL_89;
    goto LABEL_88;
  }
LABEL_134:
  self->_pregnancyEstimatedDueDate = *((double *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  if ((*(_QWORD *)(v4 + 404) & 0x2000000) != 0)
  {
LABEL_88:
    self->_pregnancyEstimatedDueDateModifiedDate = *((double *)v4 + 26);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
  }
LABEL_89:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v25 = *((id *)v4 + 44);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v52 != v28)
          objc_enumerationMutation(v25);
        -[HDCodableMedicalIDData addMedicationsList:](self, "addMedicationsList:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v27);
  }

  v30 = *(_QWORD *)(v4 + 404);
  if ((v30 & 0x80000) != 0)
  {
    self->_medicationsListModifiedDate = *((double *)v4 + 20);
    *(_QWORD *)&self->_has |= 0x80000uLL;
    v30 = *(_QWORD *)(v4 + 404);
    if ((v30 & 0x100000) == 0)
    {
LABEL_98:
      if ((v30 & 0x200000) == 0)
        goto LABEL_100;
      goto LABEL_99;
    }
  }
  else if ((v30 & 0x100000) == 0)
  {
    goto LABEL_98;
  }
  self->_medicationsListVersion = *((_QWORD *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  if ((*(_QWORD *)(v4 + 404) & 0x200000) != 0)
  {
LABEL_99:
    self->_medicationsListVersionModifiedDate = *((double *)v4 + 22);
    *(_QWORD *)&self->_has |= 0x200000uLL;
  }
LABEL_100:
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v31 = *((id *)v4 + 32);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v48;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(v31);
        -[HDCodableMedicalIDData addAllergiesList:](self, "addAllergiesList:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    }
    while (v33);
  }

  v36 = *(_QWORD *)(v4 + 404);
  if ((v36 & 1) != 0)
  {
    self->_allergiesListModifiedDate = *((double *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v36 = *(_QWORD *)(v4 + 404);
    if ((v36 & 2) == 0)
    {
LABEL_109:
      if ((v36 & 4) == 0)
        goto LABEL_111;
      goto LABEL_110;
    }
  }
  else if ((v36 & 2) == 0)
  {
    goto LABEL_109;
  }
  self->_allergiesListVersion = *((_QWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  if ((*(_QWORD *)(v4 + 404) & 4) != 0)
  {
LABEL_110:
    self->_allergiesListVersionModifiedDate = *((double *)v4 + 3);
    *(_QWORD *)&self->_has |= 4uLL;
  }
LABEL_111:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v37 = *((id *)v4 + 36);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v44;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(v37);
        -[HDCodableMedicalIDData addConditionsList:](self, "addConditionsList:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * n), (_QWORD)v43);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    }
    while (v39);
  }

  v42 = *(_QWORD *)(v4 + 404);
  if ((v42 & 0x40) == 0)
  {
    if ((v42 & 0x80) == 0)
      goto LABEL_120;
LABEL_143:
    self->_conditionsListVersion = *((_QWORD *)v4 + 8);
    *(_QWORD *)&self->_has |= 0x80uLL;
    if ((*(_QWORD *)(v4 + 404) & 0x100) == 0)
      goto LABEL_122;
    goto LABEL_121;
  }
  self->_conditionsListModifiedDate = *((double *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v42 = *(_QWORD *)(v4 + 404);
  if ((v42 & 0x80) != 0)
    goto LABEL_143;
LABEL_120:
  if ((v42 & 0x100) != 0)
  {
LABEL_121:
    self->_conditionsListVersionModifiedDate = *((double *)v4 + 9);
    *(_QWORD *)&self->_has |= 0x100uLL;
  }
LABEL_122:

}

- (NSData)medicalIDBytes
{
  return self->_medicalIDBytes;
}

- (void)setMedicalIDBytes:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDBytes, a3);
}

- (double)dateSaved
{
  return self->_dateSaved;
}

- (unsigned)schemaVersion
{
  return self->_schemaVersion;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (double)isDisabledModifiedDate
{
  return self->_isDisabledModifiedDate;
}

- (NSData)pictureData
{
  return self->_pictureData;
}

- (void)setPictureData:(id)a3
{
  objc_storeStrong((id *)&self->_pictureData, a3);
}

- (double)pictureDataModifiedDate
{
  return self->_pictureDataModifiedDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)nameModifiedDate
{
  return self->_nameModifiedDate;
}

- (HDCodableDateComponents)gregorianBirthday
{
  return self->_gregorianBirthday;
}

- (void)setGregorianBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianBirthday, a3);
}

- (double)gregorianBirthdayModifiedDate
{
  return self->_gregorianBirthdayModifiedDate;
}

- (HDCodableQuantity)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (double)heightModifiedDate
{
  return self->_heightModifiedDate;
}

- (HDCodableQuantity)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
  objc_storeStrong((id *)&self->_weight, a3);
}

- (double)weightModifiedDate
{
  return self->_weightModifiedDate;
}

- (double)bloodTypeModifiedDate
{
  return self->_bloodTypeModifiedDate;
}

- (int64_t)isOrganDonor
{
  return self->_isOrganDonor;
}

- (double)isOrganDonorModifiedDate
{
  return self->_isOrganDonorModifiedDate;
}

- (NSMutableArray)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void)setEmergencyContacts:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContacts, a3);
}

- (double)emergencyContactsModifiedDate
{
  return self->_emergencyContactsModifiedDate;
}

- (NSMutableArray)clinicalContacts
{
  return self->_clinicalContacts;
}

- (void)setClinicalContacts:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalContacts, a3);
}

- (double)clinicalContactsModifiedDate
{
  return self->_clinicalContactsModifiedDate;
}

- (NSString)medicalConditions
{
  return self->_medicalConditions;
}

- (void)setMedicalConditions:(id)a3
{
  objc_storeStrong((id *)&self->_medicalConditions, a3);
}

- (double)medicalConditionsModifiedDate
{
  return self->_medicalConditionsModifiedDate;
}

- (NSString)medicalNotes
{
  return self->_medicalNotes;
}

- (void)setMedicalNotes:(id)a3
{
  objc_storeStrong((id *)&self->_medicalNotes, a3);
}

- (double)medicalNotesModifiedDate
{
  return self->_medicalNotesModifiedDate;
}

- (NSString)allergyInfo
{
  return self->_allergyInfo;
}

- (void)setAllergyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_allergyInfo, a3);
}

- (double)allergyInfoModifiedDate
{
  return self->_allergyInfoModifiedDate;
}

- (NSString)medicationInfo
{
  return self->_medicationInfo;
}

- (void)setMedicationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_medicationInfo, a3);
}

- (double)medicationInfoModifiedDate
{
  return self->_medicationInfoModifiedDate;
}

- (BOOL)shareDuringEmergency
{
  return self->_shareDuringEmergency;
}

- (double)shareDuringEmergencyModifiedDate
{
  return self->_shareDuringEmergencyModifiedDate;
}

- (NSString)primaryLanguageCode
{
  return self->_primaryLanguageCode;
}

- (void)setPrimaryLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLanguageCode, a3);
}

- (double)primaryLanguageCodeModifiedDate
{
  return self->_primaryLanguageCodeModifiedDate;
}

- (double)pregnancyStartDate
{
  return self->_pregnancyStartDate;
}

- (double)pregnancyStartDateModifiedDate
{
  return self->_pregnancyStartDateModifiedDate;
}

- (double)pregnancyEstimatedDueDate
{
  return self->_pregnancyEstimatedDueDate;
}

- (double)pregnancyEstimatedDueDateModifiedDate
{
  return self->_pregnancyEstimatedDueDateModifiedDate;
}

- (NSMutableArray)medicationsLists
{
  return self->_medicationsLists;
}

- (void)setMedicationsLists:(id)a3
{
  objc_storeStrong((id *)&self->_medicationsLists, a3);
}

- (double)medicationsListModifiedDate
{
  return self->_medicationsListModifiedDate;
}

- (int64_t)medicationsListVersion
{
  return self->_medicationsListVersion;
}

- (double)medicationsListVersionModifiedDate
{
  return self->_medicationsListVersionModifiedDate;
}

- (NSMutableArray)allergiesLists
{
  return self->_allergiesLists;
}

- (void)setAllergiesLists:(id)a3
{
  objc_storeStrong((id *)&self->_allergiesLists, a3);
}

- (double)allergiesListModifiedDate
{
  return self->_allergiesListModifiedDate;
}

- (int64_t)allergiesListVersion
{
  return self->_allergiesListVersion;
}

- (double)allergiesListVersionModifiedDate
{
  return self->_allergiesListVersionModifiedDate;
}

- (NSMutableArray)conditionsLists
{
  return self->_conditionsLists;
}

- (void)setConditionsLists:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsLists, a3);
}

- (double)conditionsListModifiedDate
{
  return self->_conditionsListModifiedDate;
}

- (int64_t)conditionsListVersion
{
  return self->_conditionsListVersion;
}

- (double)conditionsListVersionModifiedDate
{
  return self->_conditionsListVersionModifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
  objc_storeStrong((id *)&self->_pictureData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_medicationsLists, 0);
  objc_storeStrong((id *)&self->_medicationInfo, 0);
  objc_storeStrong((id *)&self->_medicalNotes, 0);
  objc_storeStrong((id *)&self->_medicalIDBytes, 0);
  objc_storeStrong((id *)&self->_medicalConditions, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_gregorianBirthday, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_conditionsLists, 0);
  objc_storeStrong((id *)&self->_clinicalContacts, 0);
  objc_storeStrong((id *)&self->_allergyInfo, 0);
  objc_storeStrong((id *)&self->_allergiesLists, 0);
}

@end
