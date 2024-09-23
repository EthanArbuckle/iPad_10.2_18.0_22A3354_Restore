@implementation HKVerifiableClinicalRecordDetailDataProvider

- (HKVerifiableClinicalRecordDetailDataProvider)initWithSignedRecord:(id)a3 medicalRecords:(id)a4
{
  id v7;
  id v8;
  HKVerifiableClinicalRecordDetailDataProvider *v9;
  HKVerifiableClinicalRecordDetailDataProvider *v10;
  uint64_t v11;
  NSArray *medicalRecords;
  NSMutableDictionary *v13;
  NSMutableDictionary *displayItems;
  NSMutableDictionary *v15;
  NSMutableDictionary *sectionHeaders;
  NSMutableDictionary *v17;
  NSMutableDictionary *sectionFooters;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKVerifiableClinicalRecordDetailDataProvider;
  v9 = -[HKVerifiableClinicalRecordDetailDataProvider init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_39);
    v11 = objc_claimAutoreleasedReturnValue();
    medicalRecords = v10->_medicalRecords;
    v10->_medicalRecords = (NSArray *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    displayItems = v10->_displayItems;
    v10->_displayItems = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionHeaders = v10->_sectionHeaders;
    v10->_sectionHeaders = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionFooters = v10->_sectionFooters;
    v10->_sectionFooters = v17;

    v10->_sectionIndex = 0;
    -[HKVerifiableClinicalRecordDetailDataProvider createDisplayItems](v10, "createDisplayItems");
  }

  return v10;
}

uint64_t __84__HKVerifiableClinicalRecordDetailDataProvider_initWithSignedRecord_medicalRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "sortDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary allKeys](self->_displayItems, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfRowsForSection:(int64_t)a3
{
  NSMutableDictionary *displayItems;
  void *v4;
  void *v5;
  int64_t v6;

  displayItems = self->_displayItems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](displayItems, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "count");
  else
    v6 = 0;

  return v6;
}

- (id)headerForSection:(int64_t)a3
{
  NSMutableDictionary *sectionHeaders;
  void *v4;
  void *v5;

  sectionHeaders = self->_sectionHeaders;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionHeaders, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)footerForSection:(int64_t)a3
{
  NSMutableDictionary *sectionFooters;
  void *v4;
  void *v5;

  sectionFooters = self->_sectionFooters;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionFooters, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)displayItemForSection:(int64_t)a3 row:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKVerifiableClinicalRecordDetailDataProvider displayItems](self, "displayItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)createDisplayItems
{
  -[HKVerifiableClinicalRecordDetailDataProvider createPersonalInfoItems](self, "createPersonalInfoItems");
  -[HKVerifiableClinicalRecordDetailDataProvider createRecordSections](self, "createRecordSections");
  -[HKVerifiableClinicalRecordDetailDataProvider createVerificationItems](self, "createVerificationItems");
}

- (void)createPersonalInfoItems
{
  void *v3;
  void *v4;
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
  NSMutableDictionary *sectionHeaders;
  void *v18;
  NSMutableDictionary *displayItems;
  void *v20;
  id v21;

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKVerifiableClinicalRecordDetailDataProvider nameItem](self, "nameItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v3);

  -[HKVerifiableClinicalRecordDetailDataProvider birthdayItem](self, "birthdayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v4);

  -[HKVerifiableClinicalRecordDetailDataProvider genderItem](self, "genderItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v5);

  -[HKVerifiableClinicalRecordDetailDataProvider emailAddressesItem](self, "emailAddressesItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v6);

  -[HKVerifiableClinicalRecordDetailDataProvider phoneNumbersItem](self, "phoneNumbersItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v7);

  -[HKVerifiableClinicalRecordDetailDataProvider addressesItem](self, "addressesItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v8);

  -[HKVerifiableClinicalRecordDetailDataProvider maritalStatusItem](self, "maritalStatusItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v9);

  -[HKVerifiableClinicalRecordDetailDataProvider raceItem](self, "raceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v10);

  -[HKVerifiableClinicalRecordDetailDataProvider ethnicityItem](self, "ethnicityItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v11);

  -[HKVerifiableClinicalRecordDetailDataProvider birthSexItem](self, "birthSexItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v12);

  -[HKVerifiableClinicalRecordDetailDataProvider identifiersItem](self, "identifiersItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_addNonNilObject:", v13);

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedUppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sectionHeaders = self->_sectionHeaders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sectionIndex);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](sectionHeaders, "setObject:forKeyedSubscript:", v16, v18);

    displayItems = self->_displayItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sectionIndex);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](displayItems, "setObject:forKeyedSubscript:", v21, v20);

    ++self->_sectionIndex;
  }

}

- (id)nameItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_NAME_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)birthdayItem
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

  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "birthDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateForUTC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_utcDateAdjustedToCalendar:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_DOB_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v6, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)genderItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_GENDER_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)emailAddressesItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_EMAIL_ADDRESSES_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)phoneNumbersItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_PHONE_NUMBERS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)addressesItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_ADDRESSES_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)maritalStatusItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_MARITAL_STATUS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maritalStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)raceItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_RACE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "race");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ethnicityItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_ETHNICITY_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ethnicity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)birthSexItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_BIRTH_SEX_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "birthSex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifiersItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKSignedClinicalDataRecord subject](self->_record, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_260);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SUBJECT_IDENTIFIERS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __63__HKVerifiableClinicalRecordDetailDataProvider_identifiersItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "componentsJoinedByString:", CFSTR(": "));
}

- (void)createRecordSections
{
  int64_t sectionIndex;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  NSMutableDictionary *sectionHeaders;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  NSMutableDictionary *displayItems;
  void *v19;
  NSArray *obj;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  sectionIndex = self->_sectionIndex;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_medicalRecords;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = 0x1E0CB3000uLL;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "displayItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v10 = self->_sectionIndex;
          if (v10 == sectionIndex)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedUppercaseString");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            sectionHeaders = self->_sectionHeaders;
            objc_msgSend(*(id *)(v7 + 2024), "numberWithInteger:", self->_sectionIndex);
            v13 = v7;
            v14 = v5;
            v15 = v6;
            v16 = sectionIndex;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](sectionHeaders, "setObject:forKeyedSubscript:", v11, v17);

            sectionIndex = v16;
            v6 = v15;
            v5 = v14;
            v7 = v13;

            v10 = self->_sectionIndex;
          }
          displayItems = self->_displayItems;
          objc_msgSend(*(id *)(v7 + 2024), "numberWithInteger:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](displayItems, "setObject:forKeyedSubscript:", v9, v19);

          ++self->_sectionIndex;
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

}

- (void)createVerificationItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *sectionHeaders;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *sectionFooters;
  void *v15;
  NSMutableDictionary *displayItems;
  void *v17;
  id v18;

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKVerifiableClinicalRecordDetailDataProvider sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_addNonNilObject:", v3);

  -[HKVerifiableClinicalRecordDetailDataProvider statusItem](self, "statusItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_addNonNilObject:", v4);

  -[HKVerifiableClinicalRecordDetailDataProvider issuedItem](self, "issuedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_addNonNilObject:", v5);

  -[HKVerifiableClinicalRecordDetailDataProvider expiresItem](self, "expiresItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_addNonNilObject:", v6);

  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_VERIFICATION_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sectionHeaders = self->_sectionHeaders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sectionIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](sectionHeaders, "setObject:forKeyedSubscript:", v9, v11);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_VERIFICATION_FOOTER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sectionFooters = self->_sectionFooters;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sectionIndex);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](sectionFooters, "setObject:forKeyedSubscript:", v13, v15);

    displayItems = self->_displayItems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sectionIndex);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](displayItems, "setObject:forKeyedSubscript:", v18, v17);

  }
}

- (id)sourceItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_VERIFICATION_SOURCE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord recordIssuerDisplayName](self->_record, "recordIssuerDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)statusItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_VERIFICATION_STATUS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSignedClinicalDataRecord signatureStatusDisplayString](self->_record, "signatureStatusDisplayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:attributedDetailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:attributedDetailText:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)issuedItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSignedClinicalDataRecord issuedDate](self->_record, "issuedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v2, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_VERIFICATION_ISSUED_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)expiresItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSignedClinicalDataRecord expirationDate](self->_record, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v2, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_VERIFICATION_EXPIRES_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:detailText:](HKVerifiableClinicalRecordDisplayItem, "valueItemWithTitleText:detailText:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HKSignedClinicalDataRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSArray)medicalRecords
{
  return self->_medicalRecords;
}

- (void)setMedicalRecords:(id)a3
{
  objc_storeStrong((id *)&self->_medicalRecords, a3);
}

- (NSMutableDictionary)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

- (NSMutableDictionary)sectionHeaders
{
  return self->_sectionHeaders;
}

- (void)setSectionHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaders, a3);
}

- (NSMutableDictionary)sectionFooters
{
  return self->_sectionFooters;
}

- (void)setSectionFooters:(id)a3
{
  objc_storeStrong((id *)&self->_sectionFooters, a3);
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFooters, 0);
  objc_storeStrong((id *)&self->_sectionHeaders, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_medicalRecords, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
