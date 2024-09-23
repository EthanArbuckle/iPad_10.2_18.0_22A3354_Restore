@implementation INContactCard

- (INContactCard)initWithContactIdentifier:(id)a3 nameComponents:(id)a4 isMe:(BOOL)a5 image:(id)a6 organizationName:(id)a7 departmentName:(id)a8 jobTitle:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 contactRelations:(id)a14 instantMessageAddresses:(id)a15 birthday:(id)a16 dates:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  INContactCard *v33;
  uint64_t v34;
  NSString *contactIdentifier;
  uint64_t v36;
  NSPersonNameComponents *nameComponents;
  uint64_t v38;
  INImage *image;
  uint64_t v40;
  NSString *organizationName;
  uint64_t v42;
  NSString *departmentName;
  uint64_t v44;
  NSString *jobTitle;
  uint64_t v46;
  NSArray *phoneNumbers;
  uint64_t v48;
  NSArray *emailAddresses;
  uint64_t v50;
  NSArray *postalAddresses;
  uint64_t v52;
  NSArray *urlAddresses;
  uint64_t v54;
  NSArray *contactRelations;
  uint64_t v56;
  NSArray *instantMessageAddresses;
  uint64_t v58;
  NSDateComponents *birthday;
  uint64_t v60;
  NSArray *dates;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;

  v21 = a3;
  v22 = a4;
  v23 = a6;
  v24 = a7;
  v69 = a8;
  v25 = v23;
  v68 = a9;
  v26 = v22;
  v67 = a10;
  v66 = a11;
  v65 = a12;
  v27 = v24;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v32 = a17;
  v70.receiver = self;
  v70.super_class = (Class)INContactCard;
  v33 = -[INContactCard init](&v70, sel_init);
  if (v33)
  {
    v34 = objc_msgSend(v21, "copy");
    contactIdentifier = v33->_contactIdentifier;
    v33->_contactIdentifier = (NSString *)v34;

    v36 = objc_msgSend(v26, "copy");
    nameComponents = v33->_nameComponents;
    v33->_nameComponents = (NSPersonNameComponents *)v36;

    v33->_isMe = a5;
    v38 = objc_msgSend(v25, "copy");
    image = v33->_image;
    v33->_image = (INImage *)v38;

    v40 = objc_msgSend(v27, "copy");
    organizationName = v33->_organizationName;
    v33->_organizationName = (NSString *)v40;

    v42 = objc_msgSend(v69, "copy");
    departmentName = v33->_departmentName;
    v33->_departmentName = (NSString *)v42;

    v44 = objc_msgSend(v68, "copy");
    jobTitle = v33->_jobTitle;
    v33->_jobTitle = (NSString *)v44;

    v46 = objc_msgSend(v67, "copy");
    phoneNumbers = v33->_phoneNumbers;
    v33->_phoneNumbers = (NSArray *)v46;

    v48 = objc_msgSend(v66, "copy");
    emailAddresses = v33->_emailAddresses;
    v33->_emailAddresses = (NSArray *)v48;

    v50 = objc_msgSend(v65, "copy");
    postalAddresses = v33->_postalAddresses;
    v33->_postalAddresses = (NSArray *)v50;

    v52 = objc_msgSend(v28, "copy");
    urlAddresses = v33->_urlAddresses;
    v33->_urlAddresses = (NSArray *)v52;

    v54 = objc_msgSend(v29, "copy");
    contactRelations = v33->_contactRelations;
    v33->_contactRelations = (NSArray *)v54;

    v56 = objc_msgSend(v30, "copy");
    instantMessageAddresses = v33->_instantMessageAddresses;
    v33->_instantMessageAddresses = (NSArray *)v56;

    v58 = objc_msgSend(v31, "copy");
    birthday = v33->_birthday;
    v33->_birthday = (NSDateComponents *)v58;

    v60 = objc_msgSend(v32, "copy");
    dates = v33->_dates;
    v33->_dates = (NSArray *)v60;

  }
  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  v4 = -[NSPersonNameComponents hash](self->_nameComponents, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMe);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[INImage hash](self->_image, "hash") ^ v6;
  v8 = -[NSString hash](self->_organizationName, "hash");
  v9 = v8 ^ -[NSString hash](self->_departmentName, "hash");
  v10 = v9 ^ -[NSString hash](self->_jobTitle, "hash");
  v11 = v7 ^ v10 ^ -[NSArray hash](self->_phoneNumbers, "hash");
  v12 = -[NSArray hash](self->_emailAddresses, "hash");
  v13 = v12 ^ -[NSArray hash](self->_postalAddresses, "hash");
  v14 = v13 ^ -[NSArray hash](self->_urlAddresses, "hash");
  v15 = v14 ^ -[NSArray hash](self->_contactRelations, "hash");
  v16 = v11 ^ v15 ^ -[NSArray hash](self->_instantMessageAddresses, "hash");
  v17 = -[NSDateComponents hash](self->_birthday, "hash");
  v18 = v16 ^ v17 ^ -[NSArray hash](self->_dates, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *contactIdentifier;
  BOOL v7;
  NSPersonNameComponents *nameComponents;
  INImage *image;
  NSString *organizationName;
  NSString *departmentName;
  NSString *jobTitle;
  NSArray *phoneNumbers;
  NSArray *emailAddresses;
  NSArray *postalAddresses;
  NSArray *urlAddresses;
  NSArray *contactRelations;
  NSArray *instantMessageAddresses;
  NSDateComponents *birthday;
  NSArray *dates;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    contactIdentifier = self->_contactIdentifier;
    if (contactIdentifier && v5[1] && (-[NSString isEqual:](contactIdentifier, "isEqual:") & 1) != 0)
      goto LABEL_5;
    nameComponents = self->_nameComponents;
    if (nameComponents != (NSPersonNameComponents *)v5[2]
      && !-[NSPersonNameComponents isEqual:](nameComponents, "isEqual:"))
    {
      goto LABEL_34;
    }
    if (self->_isMe != *((unsigned __int8 *)v5 + 24))
      goto LABEL_34;
    image = self->_image;
    if (image != (INImage *)v5[4] && !-[INImage isEqual:](image, "isEqual:"))
      goto LABEL_34;
    organizationName = self->_organizationName;
    if (organizationName != (NSString *)v5[5] && !-[NSString isEqual:](organizationName, "isEqual:"))
      goto LABEL_34;
    departmentName = self->_departmentName;
    if (departmentName != (NSString *)v5[6] && !-[NSString isEqual:](departmentName, "isEqual:"))
      goto LABEL_34;
    jobTitle = self->_jobTitle;
    if (jobTitle != (NSString *)v5[7] && !-[NSString isEqual:](jobTitle, "isEqual:"))
      goto LABEL_34;
    phoneNumbers = self->_phoneNumbers;
    if (phoneNumbers != (NSArray *)v5[8] && !-[NSArray isEqual:](phoneNumbers, "isEqual:"))
      goto LABEL_34;
    if (((emailAddresses = self->_emailAddresses, emailAddresses == (NSArray *)v5[9])
       || -[NSArray isEqual:](emailAddresses, "isEqual:"))
      && ((postalAddresses = self->_postalAddresses, postalAddresses == (NSArray *)v5[10])
       || -[NSArray isEqual:](postalAddresses, "isEqual:"))
      && ((urlAddresses = self->_urlAddresses, urlAddresses == (NSArray *)v5[11])
       || -[NSArray isEqual:](urlAddresses, "isEqual:"))
      && ((contactRelations = self->_contactRelations, contactRelations == (NSArray *)v5[12])
       || -[NSArray isEqual:](contactRelations, "isEqual:"))
      && ((instantMessageAddresses = self->_instantMessageAddresses, instantMessageAddresses == (NSArray *)v5[13])
       || -[NSArray isEqual:](instantMessageAddresses, "isEqual:"))
      && ((birthday = self->_birthday, birthday == (NSDateComponents *)v5[14])
       || -[NSDateComponents isEqual:](birthday, "isEqual:"))
      && ((dates = self->_dates, dates == (NSArray *)v5[15]) || -[NSArray isEqual:](dates, "isEqual:")))
    {
LABEL_5:
      v7 = 1;
    }
    else
    {
LABEL_34:
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameComponents, CFSTR("nameComponents"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMe, CFSTR("isMe"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departmentName, CFSTR("departmentName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jobTitle, CFSTR("jobTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalAddresses, CFSTR("postalAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlAddresses, CFSTR("urlAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactRelations, CFSTR("contactRelations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instantMessageAddresses, CFSTR("instantMessageAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthday, CFSTR("birthday"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dates, CFSTR("dates"));

}

- (INContactCard)initWithCoder:(id)a3
{
  id v4;
  INContactCard *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  uint64_t v8;
  NSPersonNameComponents *nameComponents;
  uint64_t v10;
  INImage *image;
  uint64_t v12;
  NSString *organizationName;
  uint64_t v14;
  NSString *departmentName;
  uint64_t v16;
  NSString *jobTitle;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *phoneNumbers;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSArray *postalAddresses;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSArray *urlAddresses;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSArray *contactRelations;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  NSArray *instantMessageAddresses;
  uint64_t v86;
  NSDateComponents *birthday;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  NSArray *dates;
  objc_super v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111[3];
  uint64_t v112[3];
  uint64_t v113[3];
  uint64_t v114[3];
  uint64_t v115[3];
  uint64_t v116[4];

  v116[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v101.receiver = self;
  v101.super_class = (Class)INContactCard;
  v5 = -[INContactCard init](&v101, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v8;

    v5->_isMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMe"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v10 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (INImage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
    v12 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departmentName"));
    v14 = objc_claimAutoreleasedReturnValue();
    departmentName = v5->_departmentName;
    v5->_departmentName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jobTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    jobTitle = v5->_jobTitle;
    v5->_jobTitle = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v116[0] = objc_opt_class();
    v116[1] = (uint64_t)getCNLabeledValueClass_55949(v116[0], v19, v20, v21, v22, v23, v24, v25);
    v107 = 0;
    v108 = &v107;
    v109 = 0x2050000000;
    v26 = (void *)getCNPhoneNumberClass_softClass;
    v110 = getCNPhoneNumberClass_softClass;
    if (!getCNPhoneNumberClass_softClass)
    {
      v102 = MEMORY[0x1E0C809B0];
      v103 = 3221225472;
      v104 = __getCNPhoneNumberClass_block_invoke;
      v105 = &unk_1E22953C0;
      v106 = &v107;
      __getCNPhoneNumberClass_block_invoke((uint64_t)&v102);
      v26 = (void *)v108[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v107, 8);
    v116[2] = (uint64_t)v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("phoneNumbers"));
    v30 = objc_claimAutoreleasedReturnValue();
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v115[0] = objc_opt_class();
    v115[1] = (uint64_t)getCNLabeledValueClass_55949(v115[0], v33, v34, v35, v36, v37, v38, v39);
    v107 = 0;
    v108 = &v107;
    v109 = 0x2050000000;
    v40 = (void *)getCNPostalAddressClass_softClass;
    v110 = getCNPostalAddressClass_softClass;
    if (!getCNPostalAddressClass_softClass)
    {
      v102 = MEMORY[0x1E0C809B0];
      v103 = 3221225472;
      v104 = __getCNPostalAddressClass_block_invoke;
      v105 = &unk_1E22953C0;
      v106 = &v107;
      __getCNPostalAddressClass_block_invoke((uint64_t)&v102);
      v40 = (void *)v108[3];
    }
    v41 = objc_retainAutorelease(v40);
    _Block_object_dispose(&v107, 8);
    v115[2] = (uint64_t)v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("postalAddresses"));
    v44 = objc_claimAutoreleasedReturnValue();
    postalAddresses = v5->_postalAddresses;
    v5->_postalAddresses = (NSArray *)v44;

    v46 = (void *)MEMORY[0x1E0C99E60];
    v114[0] = objc_opt_class();
    v114[1] = (uint64_t)getCNLabeledValueClass_55949(v114[0], v47, v48, v49, v50, v51, v52, v53);
    v114[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setWithArray:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("urlAddresses"));
    v56 = objc_claimAutoreleasedReturnValue();
    urlAddresses = v5->_urlAddresses;
    v5->_urlAddresses = (NSArray *)v56;

    v58 = (void *)MEMORY[0x1E0C99E60];
    v113[0] = objc_opt_class();
    v113[1] = (uint64_t)getCNLabeledValueClass_55949(v113[0], v59, v60, v61, v62, v63, v64, v65);
    v107 = 0;
    v108 = &v107;
    v109 = 0x2050000000;
    v66 = (void *)getCNContactRelationClass_softClass;
    v110 = getCNContactRelationClass_softClass;
    if (!getCNContactRelationClass_softClass)
    {
      v102 = MEMORY[0x1E0C809B0];
      v103 = 3221225472;
      v104 = __getCNContactRelationClass_block_invoke;
      v105 = &unk_1E22953C0;
      v106 = &v107;
      __getCNContactRelationClass_block_invoke((uint64_t)&v102);
      v66 = (void *)v108[3];
    }
    v67 = objc_retainAutorelease(v66);
    _Block_object_dispose(&v107, 8);
    v113[2] = (uint64_t)v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 3);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setWithArray:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v69, CFSTR("contactRelations"));
    v70 = objc_claimAutoreleasedReturnValue();
    contactRelations = v5->_contactRelations;
    v5->_contactRelations = (NSArray *)v70;

    v72 = (void *)MEMORY[0x1E0C99E60];
    v112[0] = objc_opt_class();
    v112[1] = (uint64_t)getCNLabeledValueClass_55949(v112[0], v73, v74, v75, v76, v77, v78, v79);
    v107 = 0;
    v108 = &v107;
    v109 = 0x2050000000;
    v80 = (void *)getCNInstantMessageAddressClass_softClass;
    v110 = getCNInstantMessageAddressClass_softClass;
    if (!getCNInstantMessageAddressClass_softClass)
    {
      v102 = MEMORY[0x1E0C809B0];
      v103 = 3221225472;
      v104 = __getCNInstantMessageAddressClass_block_invoke;
      v105 = &unk_1E22953C0;
      v106 = &v107;
      __getCNInstantMessageAddressClass_block_invoke((uint64_t)&v102);
      v80 = (void *)v108[3];
    }
    v81 = objc_retainAutorelease(v80);
    _Block_object_dispose(&v107, 8);
    v112[2] = (uint64_t)v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 3);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setWithArray:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v83, CFSTR("instantMessageAddresses"));
    v84 = objc_claimAutoreleasedReturnValue();
    instantMessageAddresses = v5->_instantMessageAddresses;
    v5->_instantMessageAddresses = (NSArray *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("birthday"));
    v86 = objc_claimAutoreleasedReturnValue();
    birthday = v5->_birthday;
    v5->_birthday = (NSDateComponents *)v86;

    v88 = (void *)MEMORY[0x1E0C99E60];
    v111[0] = objc_opt_class();
    v111[1] = (uint64_t)getCNLabeledValueClass_55949(v111[0], v89, v90, v91, v92, v93, v94, v95);
    v111[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 3);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setWithArray:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v97, CFSTR("dates"));
    v98 = objc_claimAutoreleasedReturnValue();
    dates = v5->_dates;
    v5->_dates = (NSArray *)v98;

  }
  return v5;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)departmentName
{
  return self->_departmentName;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)urlAddresses
{
  return self->_urlAddresses;
}

- (NSArray)contactRelations
{
  return self->_contactRelations;
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (NSDateComponents)birthday
{
  return self->_birthday;
}

- (NSArray)dates
{
  return self->_dates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_contactRelations, 0);
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

+ (id)initWithContactIdentifier:(id)a3 nameComponents:(id)a4 isMe:(BOOL)a5 image:(id)a6 organizationName:(id)a7 departmentName:(id)a8 jobTitle:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 contactRelations:(id)a14 instantMessageAddresses:(id)a15 birthday:(id)a16 dates:(id)a17
{
  return (id)objc_msgSend(a1, "initWithContactIdentifier:nameComponents:isMe:image:organizationName:departmentName:jobTitle:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:contactRelations:instantMessageAddresses:birthday:dates:", a3, a4, a5, a6, a7, a8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
