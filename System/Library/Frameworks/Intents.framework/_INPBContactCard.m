@implementation _INPBContactCard

- (void)setBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_birthday, a3);
}

- (BOOL)hasBirthday
{
  return self->_birthday != 0;
}

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (void)setContactRelations:(id)a3
{
  NSArray *v4;
  NSArray *contactRelations;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  contactRelations = self->_contactRelations;
  self->_contactRelations = v4;

}

- (void)clearContactRelations
{
  -[NSArray removeAllObjects](self->_contactRelations, "removeAllObjects");
}

- (void)addContactRelations:(id)a3
{
  id v4;
  NSArray *contactRelations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contactRelations = self->_contactRelations;
  v8 = v4;
  if (!contactRelations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contactRelations;
    self->_contactRelations = v6;

    v4 = v8;
    contactRelations = self->_contactRelations;
  }
  -[NSArray addObject:](contactRelations, "addObject:", v4);

}

- (unint64_t)contactRelationsCount
{
  return -[NSArray count](self->_contactRelations, "count");
}

- (id)contactRelationsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contactRelations, "objectAtIndexedSubscript:", a3);
}

- (void)setDates:(id)a3
{
  NSArray *v4;
  NSArray *dates;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  dates = self->_dates;
  self->_dates = v4;

}

- (void)clearDates
{
  -[NSArray removeAllObjects](self->_dates, "removeAllObjects");
}

- (void)addDates:(id)a3
{
  id v4;
  NSArray *dates;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  dates = self->_dates;
  v8 = v4;
  if (!dates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dates;
    self->_dates = v6;

    v4 = v8;
    dates = self->_dates;
  }
  -[NSArray addObject:](dates, "addObject:", v4);

}

- (unint64_t)datesCount
{
  return -[NSArray count](self->_dates, "count");
}

- (id)datesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_dates, "objectAtIndexedSubscript:", a3);
}

- (void)setDepartmentName:(id)a3
{
  NSString *v4;
  NSString *departmentName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  departmentName = self->_departmentName;
  self->_departmentName = v4;

}

- (BOOL)hasDepartmentName
{
  return self->_departmentName != 0;
}

- (void)setEmailAddresses:(id)a3
{
  NSArray *v4;
  NSArray *emailAddresses;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v4;

}

- (void)clearEmailAddresses
{
  -[NSArray removeAllObjects](self->_emailAddresses, "removeAllObjects");
}

- (void)addEmailAddresses:(id)a3
{
  id v4;
  NSArray *emailAddresses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  emailAddresses = self->_emailAddresses;
  v8 = v4;
  if (!emailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  -[NSArray addObject:](emailAddresses, "addObject:", v4);

}

- (unint64_t)emailAddressesCount
{
  return -[NSArray count](self->_emailAddresses, "count");
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_emailAddresses, "objectAtIndexedSubscript:", a3);
}

- (void)setFirstName:(id)a3
{
  NSString *v4;
  NSString *firstName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  firstName = self->_firstName;
  self->_firstName = v4;

}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (void)setFullName:(id)a3
{
  NSString *v4;
  NSString *fullName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fullName = self->_fullName;
  self->_fullName = v4;

}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setInstantMessageAddresses:(id)a3
{
  NSArray *v4;
  NSArray *instantMessageAddresses;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  instantMessageAddresses = self->_instantMessageAddresses;
  self->_instantMessageAddresses = v4;

}

- (void)clearInstantMessageAddresses
{
  -[NSArray removeAllObjects](self->_instantMessageAddresses, "removeAllObjects");
}

- (void)addInstantMessageAddresses:(id)a3
{
  id v4;
  NSArray *instantMessageAddresses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  instantMessageAddresses = self->_instantMessageAddresses;
  v8 = v4;
  if (!instantMessageAddresses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_instantMessageAddresses;
    self->_instantMessageAddresses = v6;

    v4 = v8;
    instantMessageAddresses = self->_instantMessageAddresses;
  }
  -[NSArray addObject:](instantMessageAddresses, "addObject:", v4);

}

- (unint64_t)instantMessageAddressesCount
{
  return -[NSArray count](self->_instantMessageAddresses, "count");
}

- (id)instantMessageAddressesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_instantMessageAddresses, "objectAtIndexedSubscript:", a3);
}

- (void)setIsMe:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isMe = a3;
}

- (BOOL)hasIsMe
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsMe:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setJobTitle:(id)a3
{
  NSString *v4;
  NSString *jobTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  jobTitle = self->_jobTitle;
  self->_jobTitle = v4;

}

- (BOOL)hasJobTitle
{
  return self->_jobTitle != 0;
}

- (void)setLastName:(id)a3
{
  NSString *v4;
  NSString *lastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lastName = self->_lastName;
  self->_lastName = v4;

}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (void)setMiddleName:(id)a3
{
  NSString *v4;
  NSString *middleName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  middleName = self->_middleName;
  self->_middleName = v4;

}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (void)setNamePrefix:(id)a3
{
  NSString *v4;
  NSString *namePrefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  namePrefix = self->_namePrefix;
  self->_namePrefix = v4;

}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (void)setNameSuffix:(id)a3
{
  NSString *v4;
  NSString *nameSuffix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  nameSuffix = self->_nameSuffix;
  self->_nameSuffix = v4;

}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (void)setNickName:(id)a3
{
  NSString *v4;
  NSString *nickName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  nickName = self->_nickName;
  self->_nickName = v4;

}

- (BOOL)hasNickName
{
  return self->_nickName != 0;
}

- (void)setNonGregorianBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_nonGregorianBirthday, a3);
}

- (BOOL)hasNonGregorianBirthday
{
  return self->_nonGregorianBirthday != 0;
}

- (void)setOrganizationName:(id)a3
{
  NSString *v4;
  NSString *organizationName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  organizationName = self->_organizationName;
  self->_organizationName = v4;

}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setPhoneNumbers:(id)a3
{
  NSArray *v4;
  NSArray *phoneNumbers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  phoneNumbers = self->_phoneNumbers;
  self->_phoneNumbers = v4;

}

- (void)clearPhoneNumbers
{
  -[NSArray removeAllObjects](self->_phoneNumbers, "removeAllObjects");
}

- (void)addPhoneNumbers:(id)a3
{
  id v4;
  NSArray *phoneNumbers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  v8 = v4;
  if (!phoneNumbers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  -[NSArray addObject:](phoneNumbers, "addObject:", v4);

}

- (unint64_t)phoneNumbersCount
{
  return -[NSArray count](self->_phoneNumbers, "count");
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_phoneNumbers, "objectAtIndexedSubscript:", a3);
}

- (void)setPhoneticFirstName:(id)a3
{
  NSString *v4;
  NSString *phoneticFirstName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticFirstName = self->_phoneticFirstName;
  self->_phoneticFirstName = v4;

}

- (BOOL)hasPhoneticFirstName
{
  return self->_phoneticFirstName != 0;
}

- (void)setPhoneticLastName:(id)a3
{
  NSString *v4;
  NSString *phoneticLastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticLastName = self->_phoneticLastName;
  self->_phoneticLastName = v4;

}

- (BOOL)hasPhoneticLastName
{
  return self->_phoneticLastName != 0;
}

- (void)setPhoneticMiddleName:(id)a3
{
  NSString *v4;
  NSString *phoneticMiddleName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticMiddleName = self->_phoneticMiddleName;
  self->_phoneticMiddleName = v4;

}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (void)setPhoneticNamePrefix:(id)a3
{
  NSString *v4;
  NSString *phoneticNamePrefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticNamePrefix = self->_phoneticNamePrefix;
  self->_phoneticNamePrefix = v4;

}

- (BOOL)hasPhoneticNamePrefix
{
  return self->_phoneticNamePrefix != 0;
}

- (void)setPhoneticNameSuffix:(id)a3
{
  NSString *v4;
  NSString *phoneticNameSuffix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticNameSuffix = self->_phoneticNameSuffix;
  self->_phoneticNameSuffix = v4;

}

- (BOOL)hasPhoneticNameSuffix
{
  return self->_phoneticNameSuffix != 0;
}

- (void)setPhoneticNickName:(id)a3
{
  NSString *v4;
  NSString *phoneticNickName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticNickName = self->_phoneticNickName;
  self->_phoneticNickName = v4;

}

- (BOOL)hasPhoneticNickName
{
  return self->_phoneticNickName != 0;
}

- (void)setPostalAddresses:(id)a3
{
  NSArray *v4;
  NSArray *postalAddresses;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  postalAddresses = self->_postalAddresses;
  self->_postalAddresses = v4;

}

- (void)clearPostalAddresses
{
  -[NSArray removeAllObjects](self->_postalAddresses, "removeAllObjects");
}

- (void)addPostalAddresses:(id)a3
{
  id v4;
  NSArray *postalAddresses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  postalAddresses = self->_postalAddresses;
  v8 = v4;
  if (!postalAddresses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_postalAddresses;
    self->_postalAddresses = v6;

    v4 = v8;
    postalAddresses = self->_postalAddresses;
  }
  -[NSArray addObject:](postalAddresses, "addObject:", v4);

}

- (unint64_t)postalAddressesCount
{
  return -[NSArray count](self->_postalAddresses, "count");
}

- (id)postalAddressesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_postalAddresses, "objectAtIndexedSubscript:", a3);
}

- (void)setUrlAddresses:(id)a3
{
  NSArray *v4;
  NSArray *urlAddresses;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  urlAddresses = self->_urlAddresses;
  self->_urlAddresses = v4;

}

- (void)clearUrlAddresses
{
  -[NSArray removeAllObjects](self->_urlAddresses, "removeAllObjects");
}

- (void)addUrlAddresses:(id)a3
{
  id v4;
  NSArray *urlAddresses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  urlAddresses = self->_urlAddresses;
  v8 = v4;
  if (!urlAddresses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_urlAddresses;
    self->_urlAddresses = v6;

    v4 = v8;
    urlAddresses = self->_urlAddresses;
  }
  -[NSArray addObject:](urlAddresses, "addObject:", v4);

}

- (unint64_t)urlAddressesCount
{
  return -[NSArray count](self->_urlAddresses, "count");
}

- (id)urlAddressesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_urlAddresses, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactCardReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
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
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBContactCard birthday](self, "birthday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBContactCard birthday](self, "birthday");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBContactCard contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v8 = self->_contactRelations;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v88;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v88 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    }
    while (v10);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v13 = self->_dates;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v84;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v84 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    }
    while (v15);
  }

  -[_INPBContactCard departmentName](self, "departmentName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v19 = self->_emailAddresses;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v80;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v80 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    }
    while (v21);
  }

  -[_INPBContactCard firstName](self, "firstName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    PBDataWriterWriteStringField();
  -[_INPBContactCard fullName](self, "fullName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    PBDataWriterWriteStringField();
  -[_INPBContactCard image](self, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_INPBContactCard image](self, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v28 = self->_instantMessageAddresses;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v76;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v76 != v31)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage();
        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
    }
    while (v30);
  }

  if (-[_INPBContactCard hasIsMe](self, "hasIsMe"))
    PBDataWriterWriteBOOLField();
  -[_INPBContactCard jobTitle](self, "jobTitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    PBDataWriterWriteStringField();
  -[_INPBContactCard lastName](self, "lastName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    PBDataWriterWriteStringField();
  -[_INPBContactCard middleName](self, "middleName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    PBDataWriterWriteStringField();
  -[_INPBContactCard namePrefix](self, "namePrefix");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    PBDataWriterWriteStringField();
  -[_INPBContactCard nameSuffix](self, "nameSuffix");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    PBDataWriterWriteStringField();
  -[_INPBContactCard nickName](self, "nickName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    PBDataWriterWriteStringField();
  -[_INPBContactCard nonGregorianBirthday](self, "nonGregorianBirthday");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[_INPBContactCard nonGregorianBirthday](self, "nonGregorianBirthday");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBContactCard organizationName](self, "organizationName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    PBDataWriterWriteStringField();
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v42 = self->_phoneNumbers;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v71, v93, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v72;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v72 != v45)
          objc_enumerationMutation(v42);
        PBDataWriterWriteSubmessage();
        ++v46;
      }
      while (v44 != v46);
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v71, v93, 16);
    }
    while (v44);
  }

  -[_INPBContactCard phoneticFirstName](self, "phoneticFirstName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    PBDataWriterWriteStringField();
  -[_INPBContactCard phoneticLastName](self, "phoneticLastName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    PBDataWriterWriteStringField();
  -[_INPBContactCard phoneticMiddleName](self, "phoneticMiddleName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
    PBDataWriterWriteStringField();
  -[_INPBContactCard phoneticNamePrefix](self, "phoneticNamePrefix");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
    PBDataWriterWriteStringField();
  -[_INPBContactCard phoneticNameSuffix](self, "phoneticNameSuffix");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    PBDataWriterWriteStringField();
  -[_INPBContactCard phoneticNickName](self, "phoneticNickName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
    PBDataWriterWriteStringField();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v53 = self->_postalAddresses;
  v54 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v68;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v68 != v56)
          objc_enumerationMutation(v53);
        PBDataWriterWriteSubmessage();
        ++v57;
      }
      while (v55 != v57);
      v55 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
    }
    while (v55);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v58 = self->_urlAddresses;
  v59 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v63, v91, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v64;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v64 != v61)
          objc_enumerationMutation(v58);
        PBDataWriterWriteSubmessage();
        ++v62;
      }
      while (v60 != v62);
      v60 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v63, v91, 16);
    }
    while (v60);
  }

}

- (_INPBContactCard)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBContactCard *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBContactCard *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBContactCard *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBContactCard initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBContactCard data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBContactCard *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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

  v5 = -[_INPBContactCard init](+[_INPBContactCard allocWithZone:](_INPBContactCard, "allocWithZone:"), "init");
  v6 = -[_INPBDateTimeRangeValue copyWithZone:](self->_birthday, "copyWithZone:", a3);
  -[_INPBContactCard setBirthday:](v5, "setBirthday:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  -[_INPBContactCard setContactIdentifier:](v5, "setContactIdentifier:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_contactRelations, "copyWithZone:", a3);
  -[_INPBContactCard setContactRelations:](v5, "setContactRelations:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_dates, "copyWithZone:", a3);
  -[_INPBContactCard setDates:](v5, "setDates:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_departmentName, "copyWithZone:", a3);
  -[_INPBContactCard setDepartmentName:](v5, "setDepartmentName:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_emailAddresses, "copyWithZone:", a3);
  -[_INPBContactCard setEmailAddresses:](v5, "setEmailAddresses:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  -[_INPBContactCard setFirstName:](v5, "setFirstName:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_fullName, "copyWithZone:", a3);
  -[_INPBContactCard setFullName:](v5, "setFullName:", v13);

  v14 = -[_INPBImageValue copyWithZone:](self->_image, "copyWithZone:", a3);
  -[_INPBContactCard setImage:](v5, "setImage:", v14);

  v15 = (void *)-[NSArray copyWithZone:](self->_instantMessageAddresses, "copyWithZone:", a3);
  -[_INPBContactCard setInstantMessageAddresses:](v5, "setInstantMessageAddresses:", v15);

  if (-[_INPBContactCard hasIsMe](self, "hasIsMe"))
    -[_INPBContactCard setIsMe:](v5, "setIsMe:", -[_INPBContactCard isMe](self, "isMe"));
  v16 = (void *)-[NSString copyWithZone:](self->_jobTitle, "copyWithZone:", a3);
  -[_INPBContactCard setJobTitle:](v5, "setJobTitle:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  -[_INPBContactCard setLastName:](v5, "setLastName:", v17);

  v18 = (void *)-[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  -[_INPBContactCard setMiddleName:](v5, "setMiddleName:", v18);

  v19 = (void *)-[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  -[_INPBContactCard setNamePrefix:](v5, "setNamePrefix:", v19);

  v20 = (void *)-[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  -[_INPBContactCard setNameSuffix:](v5, "setNameSuffix:", v20);

  v21 = (void *)-[NSString copyWithZone:](self->_nickName, "copyWithZone:", a3);
  -[_INPBContactCard setNickName:](v5, "setNickName:", v21);

  v22 = -[_INPBDateTimeRangeValue copyWithZone:](self->_nonGregorianBirthday, "copyWithZone:", a3);
  -[_INPBContactCard setNonGregorianBirthday:](v5, "setNonGregorianBirthday:", v22);

  v23 = (void *)-[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  -[_INPBContactCard setOrganizationName:](v5, "setOrganizationName:", v23);

  v24 = (void *)-[NSArray copyWithZone:](self->_phoneNumbers, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneNumbers:](v5, "setPhoneNumbers:", v24);

  v25 = (void *)-[NSString copyWithZone:](self->_phoneticFirstName, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneticFirstName:](v5, "setPhoneticFirstName:", v25);

  v26 = (void *)-[NSString copyWithZone:](self->_phoneticLastName, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneticLastName:](v5, "setPhoneticLastName:", v26);

  v27 = (void *)-[NSString copyWithZone:](self->_phoneticMiddleName, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneticMiddleName:](v5, "setPhoneticMiddleName:", v27);

  v28 = (void *)-[NSString copyWithZone:](self->_phoneticNamePrefix, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneticNamePrefix:](v5, "setPhoneticNamePrefix:", v28);

  v29 = (void *)-[NSString copyWithZone:](self->_phoneticNameSuffix, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneticNameSuffix:](v5, "setPhoneticNameSuffix:", v29);

  v30 = (void *)-[NSString copyWithZone:](self->_phoneticNickName, "copyWithZone:", a3);
  -[_INPBContactCard setPhoneticNickName:](v5, "setPhoneticNickName:", v30);

  v31 = (void *)-[NSArray copyWithZone:](self->_postalAddresses, "copyWithZone:", a3);
  -[_INPBContactCard setPostalAddresses:](v5, "setPostalAddresses:", v31);

  v32 = (void *)-[NSArray copyWithZone:](self->_urlAddresses, "copyWithZone:", a3);
  -[_INPBContactCard setUrlAddresses:](v5, "setUrlAddresses:", v32);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  int v57;
  int isMe;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  char v143;
  BOOL v144;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_141;
  -[_INPBContactCard birthday](self, "birthday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "birthday");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard birthday](self, "birthday");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBContactCard birthday](self, "birthday");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "birthday");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard contactIdentifier](self, "contactIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBContactCard contactIdentifier](self, "contactIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard contactRelations](self, "contactRelations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactRelations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard contactRelations](self, "contactRelations");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBContactCard contactRelations](self, "contactRelations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactRelations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard dates](self, "dates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard dates](self, "dates");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBContactCard dates](self, "dates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard departmentName](self, "departmentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departmentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard departmentName](self, "departmentName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBContactCard departmentName](self, "departmentName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departmentName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard emailAddresses](self, "emailAddresses");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBContactCard emailAddresses](self, "emailAddresses");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailAddresses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard firstName](self, "firstName");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBContactCard firstName](self, "firstName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard fullName](self, "fullName");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBContactCard fullName](self, "fullName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard image](self, "image");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBContactCard image](self, "image");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard instantMessageAddresses](self, "instantMessageAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instantMessageAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard instantMessageAddresses](self, "instantMessageAddresses");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBContactCard instantMessageAddresses](self, "instantMessageAddresses");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instantMessageAddresses");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_141;
  }
  else
  {

  }
  v57 = -[_INPBContactCard hasIsMe](self, "hasIsMe");
  if (v57 != objc_msgSend(v4, "hasIsMe"))
    goto LABEL_141;
  if (-[_INPBContactCard hasIsMe](self, "hasIsMe"))
  {
    if (objc_msgSend(v4, "hasIsMe"))
    {
      isMe = self->_isMe;
      if (isMe != objc_msgSend(v4, "isMe"))
        goto LABEL_141;
    }
  }
  -[_INPBContactCard jobTitle](self, "jobTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jobTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard jobTitle](self, "jobTitle");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[_INPBContactCard jobTitle](self, "jobTitle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jobTitle");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard lastName](self, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard lastName](self, "lastName");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_INPBContactCard lastName](self, "lastName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard middleName](self, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard middleName](self, "middleName");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    -[_INPBContactCard middleName](self, "middleName");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "middleName");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqual:", v72);

    if (!v73)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard namePrefix](self, "namePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard namePrefix](self, "namePrefix");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    v75 = (void *)v74;
    -[_INPBContactCard namePrefix](self, "namePrefix");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namePrefix");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqual:", v77);

    if (!v78)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard nameSuffix](self, "nameSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard nameSuffix](self, "nameSuffix");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    -[_INPBContactCard nameSuffix](self, "nameSuffix");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameSuffix");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v81, "isEqual:", v82);

    if (!v83)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard nickName](self, "nickName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard nickName](self, "nickName");
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    v85 = (void *)v84;
    -[_INPBContactCard nickName](self, "nickName");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nickName");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v86, "isEqual:", v87);

    if (!v88)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard nonGregorianBirthday](self, "nonGregorianBirthday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonGregorianBirthday");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard nonGregorianBirthday](self, "nonGregorianBirthday");
  v89 = objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    v90 = (void *)v89;
    -[_INPBContactCard nonGregorianBirthday](self, "nonGregorianBirthday");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nonGregorianBirthday");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v91, "isEqual:", v92);

    if (!v93)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard organizationName](self, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard organizationName](self, "organizationName");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v95 = (void *)v94;
    -[_INPBContactCard organizationName](self, "organizationName");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqual:", v97);

    if (!v98)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneNumbers](self, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneNumbers](self, "phoneNumbers");
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = (void *)v99;
    -[_INPBContactCard phoneNumbers](self, "phoneNumbers");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumbers");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v101, "isEqual:", v102);

    if (!v103)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneticFirstName](self, "phoneticFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneticFirstName](self, "phoneticFirstName");
  v104 = objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    v105 = (void *)v104;
    -[_INPBContactCard phoneticFirstName](self, "phoneticFirstName");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticFirstName");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v106, "isEqual:", v107);

    if (!v108)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneticLastName](self, "phoneticLastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticLastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneticLastName](self, "phoneticLastName");
  v109 = objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    v110 = (void *)v109;
    -[_INPBContactCard phoneticLastName](self, "phoneticLastName");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticLastName");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v111, "isEqual:", v112);

    if (!v113)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneticMiddleName](self, "phoneticMiddleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticMiddleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneticMiddleName](self, "phoneticMiddleName");
  v114 = objc_claimAutoreleasedReturnValue();
  if (v114)
  {
    v115 = (void *)v114;
    -[_INPBContactCard phoneticMiddleName](self, "phoneticMiddleName");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticMiddleName");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v116, "isEqual:", v117);

    if (!v118)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneticNamePrefix](self, "phoneticNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneticNamePrefix](self, "phoneticNamePrefix");
  v119 = objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    v120 = (void *)v119;
    -[_INPBContactCard phoneticNamePrefix](self, "phoneticNamePrefix");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticNamePrefix");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v121, "isEqual:", v122);

    if (!v123)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneticNameSuffix](self, "phoneticNameSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticNameSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneticNameSuffix](self, "phoneticNameSuffix");
  v124 = objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    v125 = (void *)v124;
    -[_INPBContactCard phoneticNameSuffix](self, "phoneticNameSuffix");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticNameSuffix");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v126, "isEqual:", v127);

    if (!v128)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard phoneticNickName](self, "phoneticNickName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticNickName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard phoneticNickName](self, "phoneticNickName");
  v129 = objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    v130 = (void *)v129;
    -[_INPBContactCard phoneticNickName](self, "phoneticNickName");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticNickName");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v131, "isEqual:", v132);

    if (!v133)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard postalAddresses](self, "postalAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_140;
  -[_INPBContactCard postalAddresses](self, "postalAddresses");
  v134 = objc_claimAutoreleasedReturnValue();
  if (v134)
  {
    v135 = (void *)v134;
    -[_INPBContactCard postalAddresses](self, "postalAddresses");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postalAddresses");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v136, "isEqual:", v137);

    if (!v138)
      goto LABEL_141;
  }
  else
  {

  }
  -[_INPBContactCard urlAddresses](self, "urlAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBContactCard urlAddresses](self, "urlAddresses");
    v139 = objc_claimAutoreleasedReturnValue();
    if (!v139)
    {

LABEL_144:
      v144 = 1;
      goto LABEL_142;
    }
    v140 = (void *)v139;
    -[_INPBContactCard urlAddresses](self, "urlAddresses");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlAddresses");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v141, "isEqual:", v142);

    if ((v143 & 1) != 0)
      goto LABEL_144;
  }
  else
  {
LABEL_140:

  }
LABEL_141:
  v144 = 0;
LABEL_142:

  return v144;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  unint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t v29;
  unint64_t v31;

  v31 = -[_INPBDateTimeRangeValue hash](self->_birthday, "hash");
  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  v4 = -[NSArray hash](self->_contactRelations, "hash");
  v5 = -[NSArray hash](self->_dates, "hash");
  v6 = -[NSString hash](self->_departmentName, "hash");
  v7 = -[NSArray hash](self->_emailAddresses, "hash");
  v8 = -[NSString hash](self->_firstName, "hash");
  v9 = -[NSString hash](self->_fullName, "hash");
  v10 = -[_INPBImageValue hash](self->_image, "hash");
  v11 = -[NSArray hash](self->_instantMessageAddresses, "hash");
  if (-[_INPBContactCard hasIsMe](self, "hasIsMe"))
    v12 = 2654435761 * self->_isMe;
  else
    v12 = 0;
  v13 = v3 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  v14 = -[NSString hash](self->_jobTitle, "hash");
  v15 = v14 ^ -[NSString hash](self->_lastName, "hash");
  v16 = v15 ^ -[NSString hash](self->_middleName, "hash");
  v17 = v16 ^ -[NSString hash](self->_namePrefix, "hash");
  v18 = v13 ^ v17 ^ -[NSString hash](self->_nameSuffix, "hash");
  v19 = -[NSString hash](self->_nickName, "hash");
  v20 = v19 ^ -[_INPBDateTimeRangeValue hash](self->_nonGregorianBirthday, "hash");
  v21 = v20 ^ -[NSString hash](self->_organizationName, "hash");
  v22 = v21 ^ -[NSArray hash](self->_phoneNumbers, "hash");
  v23 = v22 ^ -[NSString hash](self->_phoneticFirstName, "hash");
  v24 = v18 ^ v23 ^ -[NSString hash](self->_phoneticLastName, "hash");
  v25 = -[NSString hash](self->_phoneticMiddleName, "hash");
  v26 = v25 ^ -[NSString hash](self->_phoneticNamePrefix, "hash");
  v27 = v26 ^ -[NSString hash](self->_phoneticNameSuffix, "hash");
  v28 = v27 ^ -[NSString hash](self->_phoneticNickName, "hash");
  v29 = v28 ^ -[NSArray hash](self->_postalAddresses, "hash");
  return v24 ^ v29 ^ -[NSArray hash](self->_urlAddresses, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  NSArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
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
  NSArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NSArray *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  __int128 v96;
  __int128 v97;
  __int128 v98;
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
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBContactCard birthday](self, "birthday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("birthday"));

  if (self->_contactIdentifier)
  {
    -[_INPBContactCard contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("contactIdentifier"));

  }
  if (-[NSArray count](self->_contactRelations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v9 = self->_contactRelations;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v121;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v121 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contactRelations"));
  }
  if (-[NSArray count](self->_dates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v16 = self->_dates;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v117;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v117 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * v20), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("dates"));
  }
  if (self->_departmentName)
  {
    -[_INPBContactCard departmentName](self, "departmentName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("departmentName"));

  }
  if (-[NSArray count](self->_emailAddresses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v25 = self->_emailAddresses;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v113;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v113 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * v29), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("emailAddresses"));
  }
  if (self->_firstName)
  {
    -[_INPBContactCard firstName](self, "firstName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("firstName"));

  }
  if (self->_fullName)
  {
    -[_INPBContactCard fullName](self, "fullName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("fullName"));

  }
  -[_INPBContactCard image](self, "image");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryRepresentation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("image"));

  if (-[NSArray count](self->_instantMessageAddresses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v38 = self->_instantMessageAddresses;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v109;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v109 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * v42), "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v43);

          ++v42;
        }
        while (v40 != v42);
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
      }
      while (v40);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("instantMessageAddresses"));
  }
  if (-[_INPBContactCard hasIsMe](self, "hasIsMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBContactCard isMe](self, "isMe"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isMe"));

  }
  if (self->_jobTitle)
  {
    -[_INPBContactCard jobTitle](self, "jobTitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("jobTitle"));

  }
  if (self->_lastName)
  {
    -[_INPBContactCard lastName](self, "lastName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("lastName"));

  }
  if (self->_middleName)
  {
    -[_INPBContactCard middleName](self, "middleName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("middleName"));

  }
  if (self->_namePrefix)
  {
    -[_INPBContactCard namePrefix](self, "namePrefix");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("namePrefix"));

  }
  if (self->_nameSuffix)
  {
    -[_INPBContactCard nameSuffix](self, "nameSuffix");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("nameSuffix"));

  }
  if (self->_nickName)
  {
    -[_INPBContactCard nickName](self, "nickName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v55, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("nickName"));

  }
  -[_INPBContactCard nonGregorianBirthday](self, "nonGregorianBirthday");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "dictionaryRepresentation");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("nonGregorianBirthday"));

  if (self->_organizationName)
  {
    -[_INPBContactCard organizationName](self, "organizationName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("organizationName"));

  }
  if (-[NSArray count](self->_phoneNumbers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v62 = self->_phoneNumbers;
    v63 = -[NSArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v105;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v105 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v66), "dictionaryRepresentation");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v67);

          ++v66;
        }
        while (v64 != v66);
        v64 = -[NSArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
      }
      while (v64);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("phoneNumbers"));
  }
  if (self->_phoneticFirstName)
  {
    -[_INPBContactCard phoneticFirstName](self, "phoneticFirstName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("phoneticFirstName"));

  }
  if (self->_phoneticLastName)
  {
    -[_INPBContactCard phoneticLastName](self, "phoneticLastName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("phoneticLastName"));

  }
  if (self->_phoneticMiddleName)
  {
    -[_INPBContactCard phoneticMiddleName](self, "phoneticMiddleName");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v72, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("phoneticMiddleName"));

  }
  if (self->_phoneticNamePrefix)
  {
    -[_INPBContactCard phoneticNamePrefix](self, "phoneticNamePrefix");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v74, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("phoneticNamePrefix"));

  }
  if (self->_phoneticNameSuffix)
  {
    -[_INPBContactCard phoneticNameSuffix](self, "phoneticNameSuffix");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v76, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("phoneticNameSuffix"));

  }
  if (self->_phoneticNickName)
  {
    -[_INPBContactCard phoneticNickName](self, "phoneticNickName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v78, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("phoneticNickName"));

  }
  if (-[NSArray count](self->_postalAddresses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v81 = self->_postalAddresses;
    v82 = -[NSArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v101;
      do
      {
        v85 = 0;
        do
        {
          if (*(_QWORD *)v101 != v84)
            objc_enumerationMutation(v81);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * v85), "dictionaryRepresentation");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addObject:", v86);

          ++v85;
        }
        while (v83 != v85);
        v83 = -[NSArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
      }
      while (v83);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("postalAddresses"));
  }
  if (-[NSArray count](self->_urlAddresses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v88 = self->_urlAddresses;
    v89 = -[NSArray countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v97;
      do
      {
        v92 = 0;
        do
        {
          if (*(_QWORD *)v97 != v91)
            objc_enumerationMutation(v88);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v92), "dictionaryRepresentation", (_QWORD)v96);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "addObject:", v93);

          ++v92;
        }
        while (v90 != v92);
        v90 = -[NSArray countByEnumeratingWithState:objects:count:](v88, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
      }
      while (v90);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("urlAddresses"));
  }
  v94 = v3;

  return v94;
}

- (_INPBDateTimeRangeValue)birthday
{
  return self->_birthday;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSArray)contactRelations
{
  return self->_contactRelations;
}

- (NSArray)dates
{
  return self->_dates;
}

- (NSString)departmentName
{
  return self->_departmentName;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (_INPBDateTimeRangeValue)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (NSString)phoneticNamePrefix
{
  return self->_phoneticNamePrefix;
}

- (NSString)phoneticNameSuffix
{
  return self->_phoneticNameSuffix;
}

- (NSString)phoneticNickName
{
  return self->_phoneticNickName;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)urlAddresses
{
  return self->_urlAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneticNickName, 0);
  objc_storeStrong((id *)&self->_phoneticNameSuffix, 0);
  objc_storeStrong((id *)&self->_phoneticNamePrefix, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_contactRelations, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
}

+ (Class)contactRelationsType
{
  return (Class)objc_opt_class();
}

+ (Class)datesType
{
  return (Class)objc_opt_class();
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)instantMessageAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

+ (Class)postalAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)urlAddressesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
