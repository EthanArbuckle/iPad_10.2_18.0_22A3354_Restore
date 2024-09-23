@implementation AFUIContactInfo

- (AFUIContactInfo)initWithLabel:(id)a3
{
  id v4;
  AFUIContactInfo *v5;
  AFUIContactInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFUIContactInfo;
  v5 = -[AFUIContactInfo init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AFUIContactInfo setLabel:](v5, "setLabel:", v4);

  return v6;
}

- (id)propertyForTextContentType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B330]))
  {
    -[AFUIContactInfo nameString](self, "nameString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B318]))
  {
    -[AFUIContactInfo givenNameString](self, "givenNameString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B308]))
  {
    -[AFUIContactInfo familyNameString](self, "familyNameString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B328]))
  {
    -[AFUIContactInfo middleNameString](self, "middleNameString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B338]))
  {
    -[AFUIContactInfo namePrefixString](self, "namePrefixString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B340]))
  {
    -[AFUIContactInfo nameSuffixString](self, "nameSuffixString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B350]))
  {
    -[AFUIContactInfo nicknameString](self, "nicknameString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B320]))
  {
    -[AFUIContactInfo jobTitleString](self, "jobTitleString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B368]))
  {
    -[AFUIContactInfo organizationNameString](self, "organizationNameString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2D0]))
  {
    -[AFUIContactInfo birthdateString](self, "birthdateString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2D8]))
  {
    -[AFUIContactInfo birthdateDayString](self, "birthdateDayString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2E0]))
  {
    -[AFUIContactInfo birthdateMonthString](self, "birthdateMonthString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2E8]))
  {
    -[AFUIContactInfo birthdateYearString](self, "birthdateYearString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B310]))
  {
    -[AFUIContactInfo fullStreetAddressString](self, "fullStreetAddressString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B380]))
  {
    -[AFUIContactInfo streetAddressLine1String](self, "streetAddressLine1String");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B388]))
  {
    -[AFUIContactInfo streetAddressLine2String](self, "streetAddressLine2String");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2B8]))
  {
    -[AFUIContactInfo cityString](self, "cityString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2C8]))
  {
    -[AFUIContactInfo stateString](self, "stateString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B390]))
  {
    -[AFUIContactInfo sublocalityString](self, "sublocalityString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B2F0]))
  {
    -[AFUIContactInfo countryString](self, "countryString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B378]))
  {
    -[AFUIContactInfo postalCodeString](self, "postalCodeString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B398]))
  {
    -[AFUIContactInfo phoneString](self, "phoneString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("tel-national")))
  {
    -[AFUIContactInfo phoneNationalNumberString](self, "phoneNationalNumberString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("tel-country-code")))
  {
    -[AFUIContactInfo phoneCountryCodeString](self, "phoneCountryCodeString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("tel-area-code")))
  {
    -[AFUIContactInfo phoneAreaCodeString](self, "phoneAreaCodeString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("tel-local")))
  {
    -[AFUIContactInfo phoneLocalNumberString](self, "phoneLocalNumberString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("tel-extension")))
  {
    -[AFUIContactInfo phoneExtensionString](self, "phoneExtensionString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B300]))
  {
    -[AFUIContactInfo emailString](self, "emailString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0B3A0]))
    {
      v6 = 0;
      goto LABEL_60;
    }
    -[AFUIContactInfo urlString](self, "urlString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_60:

  return v6;
}

- (id)customInfoFromContactInfo
{
  id v3;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AFUIContactInfo nameString](self, "nameString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AFUIContactInfo nameString](self, "nameString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BE0B330]);

  }
  -[AFUIContactInfo givenNameString](self, "givenNameString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AFUIContactInfo givenNameString](self, "givenNameString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x24BE0B318]);

  }
  -[AFUIContactInfo familyNameString](self, "familyNameString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AFUIContactInfo familyNameString](self, "familyNameString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BE0B308]);

  }
  -[AFUIContactInfo middleNameString](self, "middleNameString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AFUIContactInfo middleNameString](self, "middleNameString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, *MEMORY[0x24BE0B328]);

  }
  -[AFUIContactInfo namePrefixString](self, "namePrefixString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AFUIContactInfo namePrefixString](self, "namePrefixString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, *MEMORY[0x24BE0B338]);

  }
  -[AFUIContactInfo nameSuffixString](self, "nameSuffixString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AFUIContactInfo nameSuffixString](self, "nameSuffixString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, *MEMORY[0x24BE0B340]);

  }
  -[AFUIContactInfo nicknameString](self, "nicknameString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AFUIContactInfo nicknameString](self, "nicknameString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x24BE0B350]);

  }
  -[AFUIContactInfo jobTitleString](self, "jobTitleString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AFUIContactInfo jobTitleString](self, "jobTitleString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, *MEMORY[0x24BE0B320]);

  }
  -[AFUIContactInfo organizationNameString](self, "organizationNameString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AFUIContactInfo organizationNameString](self, "organizationNameString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, *MEMORY[0x24BE0B368]);

  }
  -[AFUIContactInfo birthdateString](self, "birthdateString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[AFUIContactInfo birthdateString](self, "birthdateString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, *MEMORY[0x24BE0B2D0]);

  }
  -[AFUIContactInfo birthdateDayString](self, "birthdateDayString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[AFUIContactInfo birthdateDayString](self, "birthdateDayString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, *MEMORY[0x24BE0B2D8]);

  }
  -[AFUIContactInfo birthdateMonthString](self, "birthdateMonthString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AFUIContactInfo birthdateMonthString](self, "birthdateMonthString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, *MEMORY[0x24BE0B2E0]);

  }
  -[AFUIContactInfo birthdateYearString](self, "birthdateYearString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[AFUIContactInfo birthdateYearString](self, "birthdateYearString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, *MEMORY[0x24BE0B2E8]);

  }
  -[AFUIContactInfo fullStreetAddressString](self, "fullStreetAddressString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[AFUIContactInfo fullStreetAddressString](self, "fullStreetAddressString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, *MEMORY[0x24BE0B310]);

  }
  -[AFUIContactInfo streetAddressLine1String](self, "streetAddressLine1String");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AFUIContactInfo streetAddressLine1String](self, "streetAddressLine1String");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, *MEMORY[0x24BE0B380]);

  }
  -[AFUIContactInfo streetAddressLine2String](self, "streetAddressLine2String");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[AFUIContactInfo streetAddressLine2String](self, "streetAddressLine2String");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, *MEMORY[0x24BE0B388]);

  }
  -[AFUIContactInfo cityString](self, "cityString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[AFUIContactInfo cityString](self, "cityString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, *MEMORY[0x24BE0B2B8]);

  }
  -[AFUIContactInfo stateString](self, "stateString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[AFUIContactInfo stateString](self, "stateString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, *MEMORY[0x24BE0B2C8]);

  }
  -[AFUIContactInfo sublocalityString](self, "sublocalityString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[AFUIContactInfo sublocalityString](self, "sublocalityString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, *MEMORY[0x24BE0B390]);

  }
  -[AFUIContactInfo countryString](self, "countryString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[AFUIContactInfo countryString](self, "countryString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, *MEMORY[0x24BE0B2F0]);

  }
  -[AFUIContactInfo postalCodeString](self, "postalCodeString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[AFUIContactInfo postalCodeString](self, "postalCodeString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, *MEMORY[0x24BE0B378]);

  }
  -[AFUIContactInfo phoneString](self, "phoneString");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[AFUIContactInfo phoneString](self, "phoneString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, *MEMORY[0x24BE0B398]);

  }
  -[AFUIContactInfo phoneNationalNumberString](self, "phoneNationalNumberString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[AFUIContactInfo phoneNationalNumberString](self, "phoneNationalNumberString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("tel-national"));

  }
  -[AFUIContactInfo phoneCountryCodeString](self, "phoneCountryCodeString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[AFUIContactInfo phoneCountryCodeString](self, "phoneCountryCodeString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("tel-country-code"));

  }
  -[AFUIContactInfo phoneAreaCodeString](self, "phoneAreaCodeString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[AFUIContactInfo phoneAreaCodeString](self, "phoneAreaCodeString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("tel-area-code"));

  }
  -[AFUIContactInfo phoneLocalNumberString](self, "phoneLocalNumberString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[AFUIContactInfo phoneLocalNumberString](self, "phoneLocalNumberString");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("tel-local"));

  }
  -[AFUIContactInfo phoneExtensionString](self, "phoneExtensionString");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[AFUIContactInfo phoneExtensionString](self, "phoneExtensionString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("tel-extension"));

  }
  -[AFUIContactInfo emailString](self, "emailString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[AFUIContactInfo emailString](self, "emailString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v59, *MEMORY[0x24BE0B300]);

  }
  -[AFUIContactInfo urlString](self, "urlString");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[AFUIContactInfo urlString](self, "urlString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v61, *MEMORY[0x24BE0B3A0]);

  }
  return v3;
}

- (id)titleText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AFUIContactInfo label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[AFUIContactInfo nameString](self, "nameString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIContactInfo label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ - %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AFUIContactInfo nameString](self, "nameString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)subtitleTextForAutoFillContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  AFUIPreferredSubtitleOrder();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v9 = *MEMORY[0x24BE0B300];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && AFTextContentTypeIsInNameSet(v11))
        {
          v13 = objc_msgSend(v4, "containsObject:", CFSTR("Name"));

          if ((v13 & 1) == 0)
          {
            v14 = v4;
            v15 = CFSTR("Name");
LABEL_27:
            objc_msgSend(v14, "addObject:", v15);
            continue;
          }
        }
        else
        {

        }
        objc_msgSend(v3, "objectForKey:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 && AFTextContentTypeIsInPhoneSet(v11))
        {
          v17 = objc_msgSend(v4, "containsObject:", CFSTR("Phone"));

          if ((v17 & 1) == 0)
          {
            v14 = v4;
            v15 = CFSTR("Phone");
            goto LABEL_27;
          }
        }
        else
        {

        }
        objc_msgSend(v3, "objectForKey:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && objc_msgSend(v11, "isEqualToString:", v9))
        {
          v19 = objc_msgSend(v4, "containsObject:", CFSTR("Email"));

          if ((v19 & 1) == 0)
          {
            v14 = v4;
            v15 = CFSTR("Email");
            goto LABEL_27;
          }
        }
        else
        {

        }
        objc_msgSend(v3, "objectForKey:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20
          || !AFTextContentTypeIsInContactSet(v11)
          || (AFTextContentTypeIsInBirthdaySet(v11) & 1) != 0)
        {

          continue;
        }
        v21 = objc_msgSend(v4, "containsObject:", CFSTR("Address"));

        if ((v21 & 1) == 0)
        {
          v14 = v4;
          v15 = CFSTR("Address");
          goto LABEL_27;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", v27, &stru_250857310, CFSTR("Localizable"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "length"))
          objc_msgSend(v22, "appendString:", CFSTR(", "));
        objc_msgSend(v22, "appendString:", v29);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v24);
  }

  return v22;
}

+ (id)symbolNameForLabel:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "localizedCaseInsensitiveCompare:", CFSTR("Home")))
  {
    if (objc_msgSend(v3, "localizedCaseInsensitiveCompare:", CFSTR("Work")))
    {
      if (objc_msgSend(v3, "localizedCaseInsensitiveCompare:", CFSTR("Phone")))
      {
        if (objc_msgSend(v3, "localizedCaseInsensitiveCompare:", CFSTR("Mobile")))
          v4 = CFSTR("person.text.rectangle");
        else
          v4 = CFSTR("iphone");
      }
      else
      {
        v4 = CFSTR("phone");
      }
    }
    else
    {
      v4 = CFSTR("building.2");
    }
  }
  else
  {
    v4 = CFSTR("house");
  }

  return (id)v4;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)nameString
{
  return self->_nameString;
}

- (void)setNameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)givenNameString
{
  return self->_givenNameString;
}

- (void)setGivenNameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)familyNameString
{
  return self->_familyNameString;
}

- (void)setFamilyNameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)middleNameString
{
  return self->_middleNameString;
}

- (void)setMiddleNameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)namePrefixString
{
  return self->_namePrefixString;
}

- (void)setNamePrefixString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)nameSuffixString
{
  return self->_nameSuffixString;
}

- (void)setNameSuffixString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)nicknameString
{
  return self->_nicknameString;
}

- (void)setNicknameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)jobTitleString
{
  return self->_jobTitleString;
}

- (void)setJobTitleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)organizationNameString
{
  return self->_organizationNameString;
}

- (void)setOrganizationNameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)birthdateString
{
  return self->_birthdateString;
}

- (void)setBirthdateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)birthdateDayString
{
  return self->_birthdateDayString;
}

- (void)setBirthdateDayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)birthdateMonthString
{
  return self->_birthdateMonthString;
}

- (void)setBirthdateMonthString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)birthdateYearString
{
  return self->_birthdateYearString;
}

- (void)setBirthdateYearString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)phoneString
{
  return self->_phoneString;
}

- (void)setPhoneString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)phoneNationalNumberString
{
  return self->_phoneNationalNumberString;
}

- (void)setPhoneNationalNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)phoneCountryCodeString
{
  return self->_phoneCountryCodeString;
}

- (void)setPhoneCountryCodeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)phoneAreaCodeString
{
  return self->_phoneAreaCodeString;
}

- (void)setPhoneAreaCodeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)phoneLocalNumberString
{
  return self->_phoneLocalNumberString;
}

- (void)setPhoneLocalNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)phoneExtensionString
{
  return self->_phoneExtensionString;
}

- (void)setPhoneExtensionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)emailString
{
  return self->_emailString;
}

- (void)setEmailString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)fullStreetAddressString
{
  return self->_fullStreetAddressString;
}

- (void)setFullStreetAddressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)streetAddressLine1String
{
  return self->_streetAddressLine1String;
}

- (void)setStreetAddressLine1String:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)streetAddressLine2String
{
  return self->_streetAddressLine2String;
}

- (void)setStreetAddressLine2String:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)sublocalityString
{
  return self->_sublocalityString;
}

- (void)setSublocalityString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)cityString
{
  return self->_cityString;
}

- (void)setCityString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)stateString
{
  return self->_stateString;
}

- (void)setStateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)postalCodeString
{
  return self->_postalCodeString;
}

- (void)setPostalCodeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)countryString
{
  return self->_countryString;
}

- (void)setCountryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryString, 0);
  objc_storeStrong((id *)&self->_postalCodeString, 0);
  objc_storeStrong((id *)&self->_stateString, 0);
  objc_storeStrong((id *)&self->_cityString, 0);
  objc_storeStrong((id *)&self->_sublocalityString, 0);
  objc_storeStrong((id *)&self->_streetAddressLine2String, 0);
  objc_storeStrong((id *)&self->_streetAddressLine1String, 0);
  objc_storeStrong((id *)&self->_fullStreetAddressString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_emailString, 0);
  objc_storeStrong((id *)&self->_phoneExtensionString, 0);
  objc_storeStrong((id *)&self->_phoneLocalNumberString, 0);
  objc_storeStrong((id *)&self->_phoneAreaCodeString, 0);
  objc_storeStrong((id *)&self->_phoneCountryCodeString, 0);
  objc_storeStrong((id *)&self->_phoneNationalNumberString, 0);
  objc_storeStrong((id *)&self->_phoneString, 0);
  objc_storeStrong((id *)&self->_birthdateYearString, 0);
  objc_storeStrong((id *)&self->_birthdateMonthString, 0);
  objc_storeStrong((id *)&self->_birthdateDayString, 0);
  objc_storeStrong((id *)&self->_birthdateString, 0);
  objc_storeStrong((id *)&self->_organizationNameString, 0);
  objc_storeStrong((id *)&self->_jobTitleString, 0);
  objc_storeStrong((id *)&self->_nicknameString, 0);
  objc_storeStrong((id *)&self->_nameSuffixString, 0);
  objc_storeStrong((id *)&self->_namePrefixString, 0);
  objc_storeStrong((id *)&self->_middleNameString, 0);
  objc_storeStrong((id *)&self->_familyNameString, 0);
  objc_storeStrong((id *)&self->_givenNameString, 0);
  objc_storeStrong((id *)&self->_nameString, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
