@implementation CLSPerson

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSPerson;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSPerson)initWithCoder:(id)a3
{
  id v4;
  CLSPerson *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *iCloudUserID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *orgID;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *givenName;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *middleName;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *familyName;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *phoneticGivenName;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSString *phoneticMiddleName;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *phoneticFamilyName;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  NSString *emailAddress;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSString *grade;
  const char *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSString *personNumber;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)CLSPerson;
  v5 = -[CLSObject initWithCoder:](&v62, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("appleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("iCloudUserID"));
    v12 = objc_claimAutoreleasedReturnValue();
    iCloudUserID = v5->_iCloudUserID;
    v5->_iCloudUserID = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("orgID"));
    v16 = objc_claimAutoreleasedReturnValue();
    orgID = v5->_orgID;
    v5->_orgID = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("givenName"));
    v20 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("middleName"));
    v24 = objc_claimAutoreleasedReturnValue();
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, CFSTR("familyName"));
    v28 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, CFSTR("phoneticGivenName"));
    v32 = objc_claimAutoreleasedReturnValue();
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v32;

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, CFSTR("phoneticMiddleName"));
    v36 = objc_claimAutoreleasedReturnValue();
    phoneticMiddleName = v5->_phoneticMiddleName;
    v5->_phoneticMiddleName = (NSString *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, CFSTR("phoneticFamilyName"));
    v40 = objc_claimAutoreleasedReturnValue();
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v40;

    v5->_passcodeType = (int)objc_msgSend_decodeInt32ForKey_(v4, v42, (uint64_t)CFSTR("passcodeType"));
    v5->_progressTrackingAllowed = objc_msgSend_decodeInt32ForKey_(v4, v43, (uint64_t)CFSTR("progressTrackingAllowed")) != 0;
    v5->_federatedAccount = objc_msgSend_decodeInt32ForKey_(v4, v44, (uint64_t)CFSTR("federatedAccount")) != 0;
    v5->_axmAccountStatus = (int)objc_msgSend_decodeInt32ForKey_(v4, v45, (uint64_t)CFSTR("accountStatus"));
    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, CFSTR("emailAddress"));
    v48 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v48;

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, CFSTR("grade"));
    v52 = objc_claimAutoreleasedReturnValue();
    grade = v5->_grade;
    v5->_grade = (NSString *)v52;

    v5->_isSearchable = objc_msgSend_decodeIntegerForKey_(v4, v54, (uint64_t)CFSTR("isSearchable")) != 0;
    v5->_sourceType = (int)objc_msgSend_decodeInt32ForKey_(v4, v55, (uint64_t)CFSTR("source"));
    v5->_isEditable = objc_msgSend_decodeIntegerForKey_(v4, v56, (uint64_t)CFSTR("isEditable")) != 0;
    v57 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, CFSTR("personNumber"));
    v59 = objc_claimAutoreleasedReturnValue();
    personNumber = v5->_personNumber;
    v5->_personNumber = (NSString *)v59;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLSPerson;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_appleID, CFSTR("appleID"), v24.receiver, v24.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_iCloudUserID, CFSTR("iCloudUserID"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_orgID, CFSTR("orgID"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_givenName, CFSTR("givenName"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_middleName, CFSTR("middleName"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_familyName, CFSTR("familyName"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_phoneticGivenName, CFSTR("phoneticGivenName"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_phoneticMiddleName, CFSTR("phoneticMiddleName"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_phoneticFamilyName, CFSTR("phoneticFamilyName"));
  objc_msgSend_encodeInt32_forKey_(v4, v14, LODWORD(self->_passcodeType), CFSTR("passcodeType"));
  objc_msgSend_encodeInt32_forKey_(v4, v15, self->_progressTrackingAllowed, CFSTR("progressTrackingAllowed"));
  objc_msgSend_encodeInt32_forKey_(v4, v16, self->_federatedAccount, CFSTR("federatedAccount"));
  objc_msgSend_encodeInt32_forKey_(v4, v17, LODWORD(self->_axmAccountStatus), CFSTR("accountStatus"));
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)self->_emailAddress, CFSTR("emailAddress"));
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)self->_grade, CFSTR("grade"));
  objc_msgSend_encodeInteger_forKey_(v4, v20, self->_isSearchable, CFSTR("isSearchable"));
  objc_msgSend_encodeInt32_forKey_(v4, v21, LODWORD(self->_sourceType), CFSTR("source"));
  objc_msgSend_encodeInteger_forKey_(v4, v22, self->_isEditable, CFSTR("isEditable"));
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)self->_personNumber, CFSTR("personNumber"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSPerson;
  -[CLSObject mergeWithObject:](&v21, sel_mergeWithObject_, v4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend__propertyNames(CLSPerson, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v22, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v16, (uint64_t)v15, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v22, 16);
    }
    while (v11);
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *appleID;
  NSString *iCloudUserID;
  NSString *orgID;
  NSString *givenName;
  NSString *middleName;
  NSString *familyName;
  NSString *phoneticGivenName;
  NSString *phoneticMiddleName;
  NSString *phoneticFamilyName;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  NSString *emailAddress;
  NSString *grade;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  NSString *personNumber;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CLSPerson;
  -[CLSObject dictionaryRepresentation](&v40, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  appleID = self->_appleID;
  if (appleID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)appleID, CFSTR("appleID"));
  iCloudUserID = self->_iCloudUserID;
  if (iCloudUserID)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)iCloudUserID, CFSTR("iCloudUserID"));
  orgID = self->_orgID;
  if (orgID)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)orgID, CFSTR("orgID"));
  givenName = self->_givenName;
  if (givenName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)givenName, CFSTR("givenName"));
  middleName = self->_middleName;
  if (middleName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)middleName, CFSTR("middleName"));
  familyName = self->_familyName;
  if (familyName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)familyName, CFSTR("familyName"));
  phoneticGivenName = self->_phoneticGivenName;
  if (phoneticGivenName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)phoneticGivenName, CFSTR("phoneticGivenName"));
  phoneticMiddleName = self->_phoneticMiddleName;
  if (phoneticMiddleName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)phoneticMiddleName, CFSTR("phoneticMiddleName"));
  phoneticFamilyName = self->_phoneticFamilyName;
  if (phoneticFamilyName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)phoneticFamilyName, CFSTR("phoneticFamilyName"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, self->_passcodeType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v16, (uint64_t)v15, CFSTR("passcodeType"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v17, self->_progressTrackingAllowed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v19, (uint64_t)v18, CFSTR("progressTrackingAllowed"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v20, self->_federatedAccount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v22, (uint64_t)v21, CFSTR("federatedAccount"));

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v23, self->_axmAccountStatus);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v25, (uint64_t)v24, CFSTR("accountStatus"));

  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v26, (uint64_t)emailAddress, CFSTR("emailAddress"));
  grade = self->_grade;
  if (grade)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v26, (uint64_t)grade, CFSTR("grade"));
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v26, self->_isSearchable);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v30, (uint64_t)v29, CFSTR("isSearchable"));

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v31, self->_sourceType);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v33, (uint64_t)v32, CFSTR("source"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v34, self->_isEditable);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v36, (uint64_t)v35, CFSTR("isEditable"));

  personNumber = self->_personNumber;
  if (personNumber)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v37, (uint64_t)personNumber, CFSTR("personNumber"));
  return v5;
}

+ (id)stringForRole:(unint64_t)a3
{
  char v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __CFString *v11;

  if (!a3)
  {
    v11 = CFSTR("none");
    return v11;
  }
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend_appendString_(v4, v5, (uint64_t)CFSTR("student,"));
    if ((v3 & 2) == 0)
    {
LABEL_4:
      if ((v3 & 4) == 0)
        goto LABEL_5;
LABEL_14:
      objc_msgSend_appendString_(v6, v5, (uint64_t)CFSTR("parent,"));
      if ((v3 & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend_appendString_(v6, v5, (uint64_t)CFSTR("instructor,"));
  if ((v3 & 4) != 0)
    goto LABEL_14;
LABEL_5:
  if ((v3 & 8) != 0)
LABEL_6:
    objc_msgSend_appendString_(v6, v5, (uint64_t)CFSTR("administrator"));
LABEL_7:
  if (objc_msgSend_hasSuffix_(v6, v5, (uint64_t)CFSTR(",")))
  {
    v9 = objc_msgSend_length(v6, v7, v8);
    objc_msgSend_deleteCharactersInRange_(v6, v10, v9 - 1, 1);
  }
  objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v7, (uint64_t)v6);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (unint64_t)roleFromString:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5
    && ((objc_msgSend_isEqualToString_(&stru_1E974C8A0, v3, (uint64_t)v5) & 1) != 0
     || !objc_msgSend_caseInsensitiveCompare_(CFSTR("none"), v6, (uint64_t)v5)))
  {
    v15 = 0;
  }
  else
  {
    v21 = v5;
    objc_msgSend_lowercaseString(v5, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByString_(v7, v8, (uint64_t)CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, v26, 16);
    if (v12)
    {
      v14 = v12;
      v15 = 0;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v10);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
          if (v18)
          {
            if (objc_msgSend_isEqualToString_(CFSTR("student"), v13, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17)))
            {
              v15 |= 1uLL;
            }
            else if ((objc_msgSend_isEqualToString_(CFSTR("instructor"), v13, v18) & 1) != 0
                   || objc_msgSend_isEqualToString_(CFSTR("teacher"), v13, v18))
            {
              v15 |= 2uLL;
            }
            else if (objc_msgSend_isEqualToString_(CFSTR("parent"), v13, v18))
            {
              v15 |= 4uLL;
            }
            else if (objc_msgSend_isEqualToString_(CFSTR("administrator"), v13, v18))
            {
              v15 |= 8uLL;
            }
          }
          ++v17;
        }
        while (v14 != v17);
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, v26, 16);
        v14 = v19;
      }
      while (v19);
    }
    else
    {
      v15 = 0;
    }

    v5 = v21;
  }

  return v15;
}

+ (id)_propertyNames
{
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("appleID");
  v3[1] = CFSTR("iCloudUserID");
  v3[2] = CFSTR("orgID");
  v3[3] = CFSTR("givenName");
  v3[4] = CFSTR("middleName");
  v3[5] = CFSTR("familyName");
  v3[6] = CFSTR("phoneticGivenName");
  v3[7] = CFSTR("phoneticMiddleName");
  v3[8] = CFSTR("phoneticFamilyName");
  v3[9] = CFSTR("personNumber");
  v3[10] = CFSTR("dateLastModified");
  v3[11] = CFSTR("passcodeType");
  v3[12] = CFSTR("progressTrackingAllowed");
  v3[13] = CFSTR("federatedAccount");
  v3[14] = CFSTR("axmAccountStatus");
  v3[15] = CFSTR("emailAddress");
  v3[16] = CFSTR("grade");
  v3[17] = CFSTR("isSearchable");
  v3[18] = CFSTR("sourceType");
  v3[19] = CFSTR("isEditable");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)displayName
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3858];
  objc_msgSend_nameComponents(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringFromPersonNameComponents_style_options_(v3, v5, (uint64_t)v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSPersonNameComponents)nameComponents
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  id v7;
  const char *v8;
  NSString *phoneticGivenName;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSString *phoneticMiddleName;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSString *phoneticFamilyName;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend_setGivenName_(v3, v4, (uint64_t)self->_givenName);
  objc_msgSend_setMiddleName_(v3, v5, (uint64_t)self->_middleName);
  objc_msgSend_setFamilyName_(v3, v6, (uint64_t)self->_familyName);
  if (self->_phoneticGivenName || self->_phoneticFamilyName || self->_phoneticMiddleName)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend_setPhoneticRepresentation_(v3, v8, (uint64_t)v7);

    phoneticGivenName = self->_phoneticGivenName;
    objc_msgSend_phoneticRepresentation(v3, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v12, v13, (uint64_t)phoneticGivenName);

    phoneticMiddleName = self->_phoneticMiddleName;
    objc_msgSend_phoneticRepresentation(v3, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMiddleName_(v17, v18, (uint64_t)phoneticMiddleName);

    phoneticFamilyName = self->_phoneticFamilyName;
    objc_msgSend_phoneticRepresentation(v3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v22, v23, (uint64_t)phoneticFamilyName);

  }
  return (NSPersonNameComponents *)v3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setPhoneticMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)iCloudUserID
{
  return self->_iCloudUserID;
}

- (void)setICloudUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)orgID
{
  return self->_orgID;
}

- (void)setOrgID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)personNumber
{
  return self->_personNumber;
}

- (void)setPersonNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(int64_t)a3
{
  self->_passcodeType = a3;
}

- (BOOL)isProgressTrackingAllowed
{
  return self->_progressTrackingAllowed;
}

- (void)setProgressTrackingAllowed:(BOOL)a3
{
  self->_progressTrackingAllowed = a3;
}

- (BOOL)isFederatedAccount
{
  return self->_federatedAccount;
}

- (void)setFederatedAccount:(BOOL)a3
{
  self->_federatedAccount = a3;
}

- (int64_t)axmAccountStatus
{
  return self->_axmAccountStatus;
}

- (void)setAxmAccountStatus:(int64_t)a3
{
  self->_axmAccountStatus = a3;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)grade
{
  return self->_grade;
}

- (void)setGrade:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (BOOL)isSearchable
{
  return self->_isSearchable;
}

- (void)setIsSearchable:(BOOL)a3
{
  self->_isSearchable = a3;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_grade, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_personNumber, 0);
  objc_storeStrong((id *)&self->_orgID, 0);
  objc_storeStrong((id *)&self->_iCloudUserID, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
