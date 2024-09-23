@implementation HKOrganDonationRegistrant

+ (HKOrganDonationRegistrant)organDonationRegistrantWithJSONDictionary:(id)a3
{
  id v3;
  HKOrganDonationRegistrant *v4;
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

  v3 = a3;
  v4 = objc_alloc_init(HKOrganDonationRegistrant);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstname"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setFirstname:](v4, "setFirstname:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("middlename"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setMiddlename:](v4, "setMiddlename:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastname"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setLastname:](v4, "setLastname:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dob"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setDob:](v4, "setDob:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setSex:](v4, "setSex:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("email"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setEmail:](v4, "setEmail:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setAddress1:](v4, "setAddress1:", v11);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setAddress2:](v4, "setAddress2:", v12);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("city"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setCity:](v4, "setCity:", v13);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setState:](v4, "setState:", v14);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zip"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setZip:](v4, "setZip:", v15);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("last4SSN"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOrganDonationRegistrant setLast4SSN:](v4, "setLast4SSN:", v16);
  return v4;
}

+ (HKOrganDonationRegistrant)organDonationRegistrantWithDemographicsInformation:(id)a3
{
  id v4;
  HKOrganDonationRegistrant *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
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
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v66;
  HKOrganDonationRegistrant *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id obj;
  uint64_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HKOrganDonationRegistrant);
  if (!v4)
    goto LABEL_60;
  v66 = a1;
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setFirstname:](v5, "setFirstname:", v6);

  objc_msgSend(v4, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setMiddlename:](v5, "setMiddlename:", v7);

  objc_msgSend(v4, "lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegistrant setLastname:](v5, "setLastname:", v8);

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v4, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  v10 = (uint64_t *)MEMORY[0x1E0C96FF8];
  v67 = v5;
  v68 = v4;
  if (!v9)
  {
    v70 = 0;
    v29 = obj;
LABEL_39:

    goto LABEL_40;
  }
  v11 = v9;
  v12 = 0;
  v72 = *(_QWORD *)v79;
  v69 = *MEMORY[0x1E0C997B0];
  v13 = *MEMORY[0x1E0C96FF8];
  v14 = obj;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v79 != v72)
        objc_enumerationMutation(v14);
      v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ISOCountryCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
      {
        objc_msgSend(v17, "ISOCountryCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("us"));
      }
      else
      {
        objc_msgSend(v17, "country");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "displayNameForKey:value:", v69, CFSTR("us"));
        v24 = v12;
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "isEqualToString:", v25);
        v12 = v24;
        v14 = obj;
      }

      v26 = objc_msgSend(v18, "isEqualToString:", v13);
      if (!v22 || (v26 & 1) != 0 || v12)
      {
        if ((v22 & v26) == 1)
        {
          objc_msgSend(v16, "value");
          v27 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v27;
        }
      }
      else
      {
        objc_msgSend(v16, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  }
  while (v11);

  if (v12)
  {
    objc_msgSend(v12, "street");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("\n"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v68;
    if (objc_msgSend(v29, "count") == 1)
    {
      objc_msgSend(v29, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationRegistrant setAddress1:](v67, "setAddress1:", v30);
      v10 = (uint64_t *)MEMORY[0x1E0C96FF8];
    }
    else
    {
      v31 = objc_msgSend(v29, "count");
      v10 = (uint64_t *)MEMORY[0x1E0C96FF8];
      if (v31 < 2)
        goto LABEL_27;
      objc_msgSend(v29, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationRegistrant setAddress1:](v67, "setAddress1:", v32);

      objc_msgSend(v29, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationRegistrant setAddress2:](v67, "setAddress2:", v30);
    }

LABEL_27:
    objc_msgSend(v12, "city");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationRegistrant setCity:](v67, "setCity:", v33);

    v70 = v12;
    objc_msgSend(v12, "postalCode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v34, "length") < 5)
    {
      v35 = v34;
    }
    else
    {
      objc_msgSend(v34, "substringToIndex:", 5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v66, "_isNumericStringValid:withLength:", v35, 5))
        -[HKOrganDonationRegistrant setZip:](v67, "setZip:", v35);
    }
    objc_msgSend(v70, "state");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "uppercaseString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v37, "length") == 2)
    {
      objc_msgSend(v66, "_loadStateInformationIfNeeded");
      if (objc_msgSend((id)_sortedStateAbbreviations, "indexOfObject:", v37) != 0x7FFFFFFFFFFFFFFFLL)
        -[HKOrganDonationRegistrant setState:](v67, "setState:", v37);
    }
    else if (objc_msgSend(v37, "length"))
    {
      v38 = v29;
      objc_msgSend(v66, "_loadStateInformationIfNeeded");
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF LIKE[c] %@"), v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_sortedStateNames, "filteredArrayUsingPredicate:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v42 = objc_msgSend((id)_sortedStateNames, "indexOfObject:", v41);
        objc_msgSend((id)_sortedStateAbbreviations, "objectAtIndexedSubscript:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant setState:](v67, "setState:", v43);

      }
      v29 = v38;
    }

    goto LABEL_39;
  }
  v70 = 0;
  v4 = v68;
  v10 = (uint64_t *)MEMORY[0x1E0C96FF8];
LABEL_40:
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v4, "emailAddresses");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v45)
  {
    v46 = v45;
    v73 = 0;
    v47 = *(_QWORD *)v75;
    v48 = *v10;
    while (2)
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v75 != v47)
          objc_enumerationMutation(v44);
        v50 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_msgSend(v50, "value");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "rangeOfString:options:", CFSTR("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"), 1025);

        if (v52 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v50, "label");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "isEqualToString:", v48);

          if (v54)
          {
            objc_msgSend(v50, "value");
            v55 = objc_claimAutoreleasedReturnValue();

            v73 = (void *)v55;
            goto LABEL_54;
          }
          if (!v73)
          {
            objc_msgSend(v50, "value");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      if (v46)
        continue;
      break;
    }
  }
  else
  {
    v73 = 0;
  }
LABEL_54:

  v5 = v67;
  -[HKOrganDonationRegistrant setEmail:](v67, "setEmail:", v73);
  v4 = v68;
  objc_msgSend(v68, "dateOfBirthComponents");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    +[HKSimpleDataEntryDateItem gregorianGMTCalendar](HKSimpleDataEntryDateItem, "gregorianGMTCalendar");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dateOfBirthComponents");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dateFromComponents:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "exportDateFormatter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringFromDate:", v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationRegistrant setDob:](v67, "setDob:", v61);

  }
  objc_msgSend(v68, "biologicalSexObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v68, "biologicalSexObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "biologicalSex");

    if ((unint64_t)(v64 - 1) <= 2)
      -[HKOrganDonationRegistrant setSex:](v67, "setSex:", off_1E9C44C00[v64 - 1]);
  }

LABEL_60:
  return v5;
}

- (HKOrganDonationRegistrant)init
{
  HKOrganDonationRegistrant *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dataEntryItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKOrganDonationRegistrant;
  v2 = -[HKOrganDonationRegistrant init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataEntryItems = v2->_dataEntryItems;
    v2->_dataEntryItems = v3;

    v2->_hasEdits = 0;
  }
  return v2;
}

- (HKOrganDonationRegistrant)initWithCoder:(id)a3
{
  id v4;
  HKOrganDonationRegistrant *v5;
  uint64_t v6;
  NSString *firstname;
  uint64_t v8;
  NSString *middlename;
  uint64_t v10;
  NSString *lastname;
  uint64_t v12;
  NSString *dob;
  uint64_t v14;
  NSString *sex;
  uint64_t v16;
  NSString *email;
  uint64_t v18;
  NSString *address1;
  uint64_t v20;
  NSString *address2;
  uint64_t v22;
  NSString *city;
  uint64_t v24;
  NSString *state;
  uint64_t v26;
  NSString *zip;
  uint64_t v28;
  NSString *last4SSN;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HKOrganDonationRegistrant;
  v5 = -[HKOrganDonationRegistrant init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("firstname"));
    v6 = objc_claimAutoreleasedReturnValue();
    firstname = v5->_firstname;
    v5->_firstname = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("middlename"));
    v8 = objc_claimAutoreleasedReturnValue();
    middlename = v5->_middlename;
    v5->_middlename = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("lastname"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastname = v5->_lastname;
    v5->_lastname = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dob"));
    v12 = objc_claimAutoreleasedReturnValue();
    dob = v5->_dob;
    v5->_dob = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sex"));
    v14 = objc_claimAutoreleasedReturnValue();
    sex = v5->_sex;
    v5->_sex = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("email"));
    v16 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("address1"));
    v18 = objc_claimAutoreleasedReturnValue();
    address1 = v5->_address1;
    v5->_address1 = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("address2"));
    v20 = objc_claimAutoreleasedReturnValue();
    address2 = v5->_address2;
    v5->_address2 = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("city"));
    v22 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("state"));
    v24 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("zip"));
    v26 = objc_claimAutoreleasedReturnValue();
    zip = v5->_zip;
    v5->_zip = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("last4SSN"));
    v28 = objc_claimAutoreleasedReturnValue();
    last4SSN = v5->_last4SSN;
    v5->_last4SSN = (NSString *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *firstname;
  id v5;

  firstname = self->_firstname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", firstname, CFSTR("firstname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_middlename, CFSTR("middlename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastname, CFSTR("lastname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dob, CFSTR("dob"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sex, CFSTR("sex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_email, CFSTR("email"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address1, CFSTR("address1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address2, CFSTR("address2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zip, CFSTR("zip"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_last4SSN, CFSTR("last4SSN"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  HKOrganDonationRegistrant *v5;
  uint64_t v6;
  NSString *firstname;
  uint64_t v8;
  NSString *middlename;
  uint64_t v10;
  NSString *lastname;
  uint64_t v12;
  NSString *dob;
  uint64_t v14;
  NSString *sex;
  uint64_t v16;
  NSString *email;
  uint64_t v18;
  NSString *address1;
  uint64_t v20;
  NSString *address2;
  uint64_t v22;
  NSString *city;
  uint64_t v24;
  NSString *state;
  uint64_t v26;
  NSString *zip;
  uint64_t v28;
  NSString *last4SSN;

  v5 = -[HKOrganDonationRegistrant init](+[HKOrganDonationRegistrant allocWithZone:](HKOrganDonationRegistrant, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_firstname, "copyWithZone:", a3);
  firstname = v5->_firstname;
  v5->_firstname = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_middlename, "copyWithZone:", a3);
  middlename = v5->_middlename;
  v5->_middlename = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_lastname, "copyWithZone:", a3);
  lastname = v5->_lastname;
  v5->_lastname = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_dob, "copyWithZone:", a3);
  dob = v5->_dob;
  v5->_dob = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_sex, "copyWithZone:", a3);
  sex = v5->_sex;
  v5->_sex = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_email, "copyWithZone:", a3);
  email = v5->_email;
  v5->_email = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_address1, "copyWithZone:", a3);
  address1 = v5->_address1;
  v5->_address1 = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_address2, "copyWithZone:", a3);
  address2 = v5->_address2;
  v5->_address2 = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_city, "copyWithZone:", a3);
  city = v5->_city;
  v5->_city = (NSString *)v22;

  v24 = -[NSString copyWithZone:](self->_state, "copyWithZone:", a3);
  state = v5->_state;
  v5->_state = (NSString *)v24;

  v26 = -[NSString copyWithZone:](self->_zip, "copyWithZone:", a3);
  zip = v5->_zip;
  v5->_zip = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_last4SSN, "copyWithZone:", a3);
  last4SSN = v5->_last4SSN;
  v5->_last4SSN = (NSString *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)jsonDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *firstname;
  NSString *middlename;
  NSString *lastname;
  NSString *email;
  void *v9;
  void *v10;
  NSString *dob;
  NSString *sex;
  NSString *address1;
  NSString *address2;
  NSString *city;
  NSString *state;
  void *v17;
  NSString *zip;
  void *v19;
  void *v20;
  void *v21;
  NSString *last4SSN;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  firstname = self->_firstname;
  if (firstname)
    objc_msgSend(v3, "setObject:forKey:", firstname, CFSTR("firstname"));
  middlename = self->_middlename;
  if (middlename)
    objc_msgSend(v4, "setObject:forKey:", middlename, CFSTR("middlename"));
  lastname = self->_lastname;
  if (lastname)
    objc_msgSend(v4, "setObject:forKey:", lastname, CFSTR("lastname"));
  email = self->_email;
  if (email)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByTrimmingCharactersInSet:](email, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("email"));

  }
  dob = self->_dob;
  if (dob)
    objc_msgSend(v4, "setObject:forKey:", dob, CFSTR("dob"));
  sex = self->_sex;
  if (sex)
    objc_msgSend(v4, "setObject:forKey:", sex, CFSTR("gender"));
  address1 = self->_address1;
  if (address1)
    objc_msgSend(v4, "setObject:forKey:", address1, CFSTR("address1"));
  address2 = self->_address2;
  if (address2)
    objc_msgSend(v4, "setObject:forKey:", address2, CFSTR("address2"));
  city = self->_city;
  if (city)
    objc_msgSend(v4, "setObject:forKey:", city, CFSTR("city"));
  state = self->_state;
  if (state)
    objc_msgSend(v4, "setObject:forKey:", state, CFSTR("state"));
  if (self->_zip)
  {
    v17 = (void *)objc_opt_class();
    zip = self->_zip;
    objc_msgSend((id)objc_opt_class(), "zipcodeNumberFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertLocalizedNumericStringToLatin:withNumberFormatter:", zip, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("zip"));
  }
  if (self->_last4SSN)
  {
    v21 = (void *)objc_opt_class();
    last4SSN = self->_last4SSN;
    objc_msgSend((id)objc_opt_class(), "ssnNumberFormatter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertLocalizedNumericStringToLatin:withNumberFormatter:", last4SSN, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("last4SSN"));
  }
  return v4;
}

- (id)dataEntryItemsValidOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  v7 = objc_msgSend(v6, "isGivenNameFirst");
  if (v7)
    v8 = 0;
  else
    v8 = 2;
  if (v7)
    v9 = 2;
  else
    v9 = 0;
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, v8);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 1);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, v9);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 3);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 12);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 5);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 7);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 8);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 9);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 10);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 11);
  -[HKOrganDonationRegistrant _addDataEntryItemIntoArray:validOnly:forField:](self, "_addDataEntryItemIntoArray:validOnly:forField:", v5, v3, 4);

  return v5;
}

- (void)_addDataEntryItemIntoArray:(id)a3 validOnly:(BOOL)a4 forField:(int64_t)a5
{
  _BOOL4 v6;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  if (!v6 || -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", a5))
  {
    -[HKOrganDonationRegistrant dataEntryItemForRegistrantField:](self, "dataEntryItemForRegistrantField:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (id)dataEntryItemForRegistrantField:(int64_t)a3
{
  void *v5;
  HKOrganDonationAddressEntryItem *v6;
  HKSimpleDataEntryPlainTextItem *v7;
  void *v8;
  void *v9;
  void *v10;
  HKOrganDonationRegistrant *v11;
  uint64_t v12;
  HKSimpleDataEntryPlainTextItem *v13;
  void *v14;
  void *v15;
  void *v16;
  HKSimpleDataEntryPlainTextItem *v17;
  void *v18;
  void *v19;
  void *v20;
  HKSimpleDataEntryMultipleChoiceItem *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HKSimpleDataEntryPlainTextItem *v28;
  void *v29;
  void *v30;
  void *v31;
  HKSimpleDataEntryPlainTextItem *v32;
  void *v33;
  void *v34;
  void *v35;
  HKSimpleDataEntryPlainTextItem *v36;
  void *v37;
  void *v38;
  void *v39;
  HKSimpleDataEntryPlainTextItem *v40;
  void *v41;
  void *v42;
  void *v43;
  HKSimpleDataEntryMultipleChoiceItem *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HKSimpleDataEntryPlainTextItem *v50;
  void *v51;
  void *v52;
  void *v53;
  HKSimpleDataEntryPlainTextItem *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  _QWORD v65[5];

  v65[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataEntryItems, "objectForKeyedSubscript:", v5);
  v6 = (HKOrganDonationAddressEntryItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    switch(a3)
    {
      case 0:
        v7 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OD_FIRST_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant firstname](self, "firstname");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v7, "initWithTitle:registrantModelKey:defaultText:intention:", v9, CFSTR("firstname"), v10, 0);

        v11 = self;
        v12 = 0;
        goto LABEL_17;
      case 1:
        v13 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OD_MIDDLE_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant middlename](self, "middlename");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v13, "initWithTitle:registrantModelKey:defaultText:intention:", v15, CFSTR("middlename"), v16, 1);

        v11 = self;
        v12 = 1;
        goto LABEL_17;
      case 2:
        v17 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OD_LAST_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant lastname](self, "lastname");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v17, "initWithTitle:registrantModelKey:defaultText:intention:", v19, CFSTR("lastname"), v20, 2);

        v11 = self;
        v12 = 2;
        goto LABEL_17;
      case 3:
        -[HKOrganDonationRegistrant _createDateOfBirthEntryItem](self, "_createDateOfBirthEntryItem");
        v6 = (HKOrganDonationAddressEntryItem *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        v21 = [HKSimpleDataEntryMultipleChoiceItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("OD_BIOLOGICAL_SEX"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = &stru_1E9C4C428;
        v65[1] = CFSTR("M");
        v65[2] = CFSTR("F");
        v65[3] = CFSTR("O");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = &stru_1E9C4C428;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("OD_MALE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = v61;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("OD_FEMALE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v64[2] = v23;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OD_SEX_OTHER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v64[3] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant sex](self, "sex");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryMultipleChoiceItem initWithTitle:registrantModelKey:choices:choiceDisplayNames:defaultChoice:](v21, "initWithTitle:registrantModelKey:choices:choiceDisplayNames:defaultChoice:", v22, CFSTR("sex"), v59, v26, v27);

        v11 = self;
        v12 = 4;
        goto LABEL_17;
      case 5:
        v28 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("OD_EMAIL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant email](self, "email");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v28, "initWithTitle:registrantModelKey:defaultText:intention:", v30, CFSTR("email"), v31, 3);

        v11 = self;
        v12 = 5;
        goto LABEL_17;
      case 6:
        v6 = -[HKOrganDonationAddressEntryItem initWithRegistrant:]([HKOrganDonationAddressEntryItem alloc], "initWithRegistrant:", self);
        v11 = self;
        v12 = 6;
        goto LABEL_17;
      case 7:
        v32 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("OD_ADDRESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant address1](self, "address1");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v32, "initWithTitle:registrantModelKey:defaultText:intention:", v34, CFSTR("address1"), v35, 4);

        v11 = self;
        v12 = 7;
        goto LABEL_17;
      case 8:
        v36 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("OD_ADDRESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant address2](self, "address2");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v36, "initWithTitle:registrantModelKey:defaultText:intention:", v38, CFSTR("address2"), v39, 5);

        v11 = self;
        v12 = 8;
        goto LABEL_17;
      case 9:
        v40 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("OD_ADDRESS_CITY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant city](self, "city");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v40, "initWithTitle:registrantModelKey:defaultText:intention:", v42, CFSTR("city"), v43, 6);

        v11 = self;
        v12 = 9;
        goto LABEL_17;
      case 10:
        v44 = [HKSimpleDataEntryMultipleChoiceItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("OD_ADDRESS_STATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant _stateChoiceValues](self, "_stateChoiceValues");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant _stateChoiceDisplayNames](self, "_stateChoiceDisplayNames");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant state](self, "state");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryMultipleChoiceItem initWithTitle:registrantModelKey:choices:choiceDisplayNames:defaultChoice:](v44, "initWithTitle:registrantModelKey:choices:choiceDisplayNames:defaultChoice:", v46, CFSTR("state"), v47, v48, v49);

        v11 = self;
        v12 = 10;
        goto LABEL_17;
      case 11:
        v50 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("OD_ADDRESS_ZIP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant zip](self, "zip");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v50, "initWithTitle:registrantModelKey:defaultText:intention:", v52, CFSTR("zip"), v53, 7);

        v11 = self;
        v12 = 11;
        goto LABEL_17;
      case 12:
        v54 = [HKSimpleDataEntryPlainTextItem alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("OD_SSN"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant last4SSN](self, "last4SSN");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[HKSimpleDataEntryPlainTextItem initWithTitle:registrantModelKey:defaultText:intention:](v54, "initWithTitle:registrantModelKey:defaultText:intention:", v56, CFSTR("last4SSN"), v57, 8);

        v11 = self;
        v12 = 12;
LABEL_17:
        -[HKSimpleDataEntryItem setPlaceholderType:](v6, "setPlaceholderType:", -[HKOrganDonationRegistrant _placeHolderTypeForField:](v11, "_placeHolderTypeForField:", v12));
        -[HKSimpleDataEntryItem setDelegate:](v6, "setDelegate:", self);
        break;
      default:
        v6 = 0;
        break;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataEntryItems, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

- (unint64_t)_placeHolderTypeForField:(int64_t)a3
{
  return a3 != 8 && a3 != 1;
}

- (BOOL)isFieldValid:(int64_t)a3
{
  NSString *email;
  NSString *firstname;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  NSString *zip;
  uint64_t v14;

  LOBYTE(email) = 1;
  switch(a3)
  {
    case 0:
      firstname = self->_firstname;
      goto LABEL_12;
    case 1:
      firstname = self->_middlename;
      goto LABEL_12;
    case 2:
      firstname = self->_lastname;
      goto LABEL_12;
    case 3:
      objc_msgSend((id)objc_opt_class(), "exportDateFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateFromString:", self->_dob);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(email) = v7 != 0;

      return (char)email;
    case 4:
      LOBYTE(email) = -[NSString length](self->_sex, "length") == 1;
      return (char)email;
    case 5:
      email = self->_email;
      if (email)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByTrimmingCharactersInSet:](email, "stringByTrimmingCharactersInSet:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(email) = objc_msgSend(v9, "rangeOfString:options:", CFSTR("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"), 1025) != 0x7FFFFFFFFFFFFFFFLL;

      }
      return (char)email;
    case 7:
      firstname = self->_address1;
      goto LABEL_12;
    case 8:
      firstname = self->_address2;
      goto LABEL_12;
    case 9:
      firstname = self->_city;
LABEL_12:
      v10 = -[NSString length](firstname, "length") == 0;
      goto LABEL_13;
    case 10:
      v10 = objc_msgSend((id)_sortedStateAbbreviations, "indexOfObject:", self->_state) == 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
      LOBYTE(email) = !v10;
      return (char)email;
    case 11:
      if (!self->_zip)
        goto LABEL_23;
      v12 = (void *)objc_opt_class();
      zip = self->_zip;
      v14 = 5;
      return objc_msgSend(v12, "_isNumericStringValid:withLength:", zip, v14);
    case 12:
      if (self->_last4SSN)
      {
        v12 = (void *)objc_opt_class();
        zip = self->_last4SSN;
        v14 = 4;
        return objc_msgSend(v12, "_isNumericStringValid:withLength:", zip, v14);
      }
      else
      {
LABEL_23:
        LOBYTE(email) = 0;
        return (char)email;
      }
    default:
      return (char)email;
  }
}

- (BOOL)isRegistrantValid
{
  return -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 0)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 2)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 5)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 4)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 3)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 7)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 9)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 10)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 11)
      && -[HKOrganDonationRegistrant isFieldValid:](self, "isFieldValid:", 12);
}

- (NSNumber)age
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_dob)
  {
    objc_msgSend((id)objc_opt_class(), "exportDateFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFromString:", self->_dob);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      +[HKSimpleDataEntryDateItem gregorianGMTCalendar](HKSimpleDataEntryDateItem, "gregorianGMTCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationRegistrant _todayBirthdayDateComponents](self, "_todayBirthdayDateComponents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "components:fromDateComponents:toDateComponents:options:", 4, v6, v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "year"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return (NSNumber *)v10;
}

+ (id)exportDateFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)exportDateFormatter___dateFormatter;
  if (!exportDateFormatter___dateFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)exportDateFormatter___dateFormatter;
    exportDateFormatter___dateFormatter = (uint64_t)v3;

    v5 = (void *)exportDateFormatter___dateFormatter;
    +[HKSimpleDataEntryDateItem gregorianGMTCalendar](HKSimpleDataEntryDateItem, "gregorianGMTCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCalendar:", v6);

    v7 = (void *)exportDateFormatter___dateFormatter;
    +[HKSimpleDataEntryDateItem gregorianGMTCalendar](HKSimpleDataEntryDateItem, "gregorianGMTCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v9);

    objc_msgSend((id)exportDateFormatter___dateFormatter, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    v10 = (void *)exportDateFormatter___dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("_US"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v11);

    v2 = (void *)exportDateFormatter___dateFormatter;
  }
  return v2;
}

+ (id)zipcodeNumberFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)zipcodeNumberFormatter__numberFormatter;
  if (!zipcodeNumberFormatter__numberFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4 = (void *)zipcodeNumberFormatter__numberFormatter;
    zipcodeNumberFormatter__numberFormatter = (uint64_t)v3;

    objc_msgSend((id)zipcodeNumberFormatter__numberFormatter, "setNumberStyle:", 0);
    objc_msgSend((id)zipcodeNumberFormatter__numberFormatter, "setFormatWidth:", 5);
    objc_msgSend((id)zipcodeNumberFormatter__numberFormatter, "setPaddingCharacter:", CFSTR("0"));
    v5 = (void *)zipcodeNumberFormatter__numberFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("_US"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v6);

    v2 = (void *)zipcodeNumberFormatter__numberFormatter;
  }
  return v2;
}

+ (id)ssnNumberFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)ssnNumberFormatter__numberFormatter;
  if (!ssnNumberFormatter__numberFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4 = (void *)ssnNumberFormatter__numberFormatter;
    ssnNumberFormatter__numberFormatter = (uint64_t)v3;

    objc_msgSend((id)ssnNumberFormatter__numberFormatter, "setNumberStyle:", 0);
    objc_msgSend((id)ssnNumberFormatter__numberFormatter, "setFormatWidth:", 4);
    objc_msgSend((id)ssnNumberFormatter__numberFormatter, "setPaddingCharacter:", CFSTR("0"));
    v5 = (void *)ssnNumberFormatter__numberFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("_US"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v6);

    v2 = (void *)ssnNumberFormatter__numberFormatter;
  }
  return v2;
}

+ (id)_importNumberFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_importNumberFormatter__numberFormatter;
  if (!_importNumberFormatter__numberFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4 = (void *)_importNumberFormatter__numberFormatter;
    _importNumberFormatter__numberFormatter = (uint64_t)v3;

    objc_msgSend((id)_importNumberFormatter__numberFormatter, "setNumberStyle:", 0);
    v2 = (void *)_importNumberFormatter__numberFormatter;
  }
  return v2;
}

+ (BOOL)_isNumericStringValid:(id)a3 withLength:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3900], "localizedScannerWithString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "scanCharactersFromSet:intoString:", v6, &v10);
  v7 = v10;

  v8 = objc_msgSend(v7, "length");
  return v8 == a4;
}

+ (id)convertLocalizedNumericStringToLatin:(id)a3 withNumberFormatter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_importNumberFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_todayBirthdayDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  +[HKSimpleDataEntryDateItem gregorianGMTCalendar](HKSimpleDataEntryDateItem, "gregorianGMTCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_dateOfBirthDateComponentsWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createDateOfBirthEntryItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKSimpleDataEntryDateItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKSimpleDataEntryDateItem *v14;
  void *v16;
  void *v17;
  void *v18;

  -[HKOrganDonationRegistrant _todayBirthdayDateComponents](self, "_todayBirthdayDateComponents");
  v3 = objc_claimAutoreleasedReturnValue();
  +[HKSimpleDataEntryDateItem gregorianGMTCalendar](HKSimpleDataEntryDateItem, "gregorianGMTCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v3;
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 4, -130, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 4, -30, v5, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_dob, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "exportDateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", self->_dob);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = [HKSimpleDataEntryDateItem alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OD_DATE_OF_BIRTH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "exportDateFormatter");
  v16 = (void *)v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKSimpleDataEntryDateItem initWithTitle:registrantModelKey:date:defaultDate:dateRange:exportFormatter:](v9, "initWithTitle:registrantModelKey:date:defaultDate:dateRange:exportFormatter:", v11, CFSTR("dob"), v8, v17, v12, v13);

  -[HKSimpleDataEntryItem setPlaceholderType:](v14, "setPlaceholderType:", -[HKOrganDonationRegistrant _placeHolderTypeForField:](self, "_placeHolderTypeForField:", 3));
  -[HKSimpleDataEntryItem setDelegate:](v14, "setDelegate:", self);

  return v14;
}

- (id)_stateChoiceDisplayNames
{
  objc_msgSend((id)objc_opt_class(), "_loadStateInformationIfNeeded");
  return (id)_sortedStateNames;
}

- (id)_stateChoiceValues
{
  objc_msgSend((id)objc_opt_class(), "_loadStateInformationIfNeeded");
  return (id)_sortedStateAbbreviations;
}

+ (void)_loadStateInformationIfNeeded
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  id obj;
  void *v32;
  void *v33;
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
  if (_sortedStateNames)
    v2 = _sortedStateAbbreviations == 0;
  else
    v2 = 1;
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    HKHealthUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("USStateAbbreviations"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v6;
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-USState"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "addObject:", v16);
          objc_msgSend(v8, "setObject:forKey:", v13, v16);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v10);
    }

    objc_msgSend(v33, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "insertObject:atIndex:", &stru_1E9C4C428, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v25)
            v27 = (const __CFString *)v25;
          else
            v27 = &stru_1E9C4C428;
          objc_msgSend(v19, "addObject:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v22);
    }

    v28 = (void *)_sortedStateNames;
    _sortedStateNames = (uint64_t)v20;
    v29 = v20;

    v30 = (void *)_sortedStateAbbreviations;
    _sortedStateAbbreviations = (uint64_t)v19;

  }
}

- (void)dataEntryItemDidUpdateValue:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "formattedKeyAndValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationRegistrant valueForKey:](self, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
        {
          -[HKOrganDonationRegistrant setValue:forKey:](self, "setValue:forKey:", v10, v9);
          self->_hasEdits = 1;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  -[HKOrganDonationRegistrant delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "organDonationRegistrantDidUpdateValue:", self);

}

- (HKOrganDonationRegistrantDelegate)delegate
{
  return (HKOrganDonationRegistrantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)firstname
{
  return self->_firstname;
}

- (void)setFirstname:(id)a3
{
  objc_storeStrong((id *)&self->_firstname, a3);
}

- (NSString)middlename
{
  return self->_middlename;
}

- (void)setMiddlename:(id)a3
{
  objc_storeStrong((id *)&self->_middlename, a3);
}

- (NSString)lastname
{
  return self->_lastname;
}

- (void)setLastname:(id)a3
{
  objc_storeStrong((id *)&self->_lastname, a3);
}

- (NSString)address1
{
  return self->_address1;
}

- (void)setAddress1:(id)a3
{
  objc_storeStrong((id *)&self->_address1, a3);
}

- (NSString)address2
{
  return self->_address2;
}

- (void)setAddress2:(id)a3
{
  objc_storeStrong((id *)&self->_address2, a3);
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
  objc_storeStrong((id *)&self->_zip, a3);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)last4SSN
{
  return self->_last4SSN;
}

- (void)setLast4SSN:(id)a3
{
  objc_storeStrong((id *)&self->_last4SSN, a3);
}

- (NSString)sex
{
  return self->_sex;
}

- (void)setSex:(id)a3
{
  objc_storeStrong((id *)&self->_sex, a3);
}

- (NSString)dob
{
  return self->_dob;
}

- (void)setDob:(id)a3
{
  objc_storeStrong((id *)&self->_dob, a3);
}

- (BOOL)hasEdits
{
  return self->_hasEdits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dob, 0);
  objc_storeStrong((id *)&self->_sex, 0);
  objc_storeStrong((id *)&self->_last4SSN, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_address2, 0);
  objc_storeStrong((id *)&self->_address1, 0);
  objc_storeStrong((id *)&self->_lastname, 0);
  objc_storeStrong((id *)&self->_middlename, 0);
  objc_storeStrong((id *)&self->_firstname, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
}

@end
