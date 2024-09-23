@implementation DNDContact

+ (id)normalizePhoneNumber:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  void *String;
  void *v11;
  NSObject *v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543619;
    v16 = a1;
    v17 = 2113;
    v18 = v4;
    _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ normalizing phonenumber %{private}@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CFPhoneNumberCreate();
  if (!v8
    || (v9 = (const void *)v8, String = (void *)CFPhoneNumberCreateString(), CFRelease(v9), (v11 = String) == 0))
  {
    v12 = DNDLogModeConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      +[DNDContact normalizePhoneNumber:].cold.1((uint64_t)a1, (uint64_t)v4, v12);
    v11 = 0;
    String = v4;
  }
  v13 = String;

  return v13;
}

- (DNDContact)initWithContactIdentifier:(id)a3
{
  return (DNDContact *)-[DNDContact _initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:](self, "_initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:", a3, 0, 0, 0, 0, 0, 0, 0);
}

- (id)_initWithContactIdentifier:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 nickName:(id)a7 organizationName:(id)a8 phoneNumbers:(id)a9 emailAddresses:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  DNDContact *v24;
  uint64_t v25;
  NSString *contactIdentifier;
  uint64_t v27;
  NSString *firstName;
  uint64_t v29;
  NSString *middleName;
  uint64_t v31;
  NSString *lastName;
  uint64_t v33;
  NSString *nickName;
  uint64_t v35;
  NSString *organizationName;
  uint64_t v37;
  NSSet *phoneNumbers;
  uint64_t v39;
  NSSet *emailAddresses;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)DNDContact;
  v24 = -[DNDContact init](&v42, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    contactIdentifier = v24->_contactIdentifier;
    v24->_contactIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    firstName = v24->_firstName;
    v24->_firstName = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    middleName = v24->_middleName;
    v24->_middleName = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    lastName = v24->_lastName;
    v24->_lastName = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    nickName = v24->_nickName;
    v24->_nickName = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    organizationName = v24->_organizationName;
    v24->_organizationName = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    phoneNumbers = v24->_phoneNumbers;
    v24->_phoneNumbers = (NSSet *)v37;

    v39 = objc_msgSend(v23, "copy");
    emailAddresses = v24->_emailAddresses;
    v24->_emailAddresses = (NSSet *)v39;

  }
  return v24;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[DNDContact contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDContact firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDContact middleName](self, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDContact lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDContact nickName](self, "nickName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDContact organizationName](self, "organizationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[DNDContact phoneNumbers](self, "phoneNumbers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[DNDContact emailAddresses](self, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  DNDContact *v4;
  DNDContact *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _BOOL4 v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _BOOL4 v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  DNDContact *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  void *v76;
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
  _BYTE v123[44];
  _QWORD v124[5];
  __int128 v125;

  v4 = (DNDContact *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_124;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_124;
  }
  v5 = v4;
  -[DNDContact contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDContact contactIdentifier](v5, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    -[DNDContact contactIdentifier](self, "contactIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v122 = 0;
      v125 = 0uLL;
      v12 = 0;
      v13 = 0;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, sizeof(v124));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_64;
    }
    v122 = (void *)v8;
    -[DNDContact contactIdentifier](v5, "contactIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v119 = 0;
      v12 = 0;
      v13 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 36);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[4]) = 1;
      goto LABEL_64;
    }
    v119 = (void *)v10;
    -[DNDContact contactIdentifier](self, "contactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact contactIdentifier](v5, "contactIdentifier");
    v115 = v11;
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqual:"))
    {
      v124[3] = 0;
      v12 = 0;
      v13 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v124[4] = 0x100000000;
      HIDWORD(v124[2]) = 1;
      goto LABEL_64;
    }
  }
  -[DNDContact firstName](self, "firstName");
  v19 = objc_claimAutoreleasedReturnValue();
  -[DNDContact firstName](v5, "firstName");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v19 != v20;
  HIDWORD(v124[4]) = v6 != v7;
  v120 = (void *)v20;
  v121 = (void *)v19;
  if (v19 != v20)
  {
    -[DNDContact firstName](self, "firstName");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v118 = 0;
      v12 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      LODWORD(v124[3]) = 1;
      *(_QWORD *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      v13 = 0;
      goto LABEL_64;
    }
    v118 = (void *)v22;
    -[DNDContact firstName](v5, "firstName");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v113 = 0;
      v124[0] = 0;
      v124[1] = 0;
      v12 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      LODWORD(v124[3]) = 1;
      *(_QWORD *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      v13 = 0;
      LODWORD(v124[2]) = 1;
      goto LABEL_64;
    }
    v113 = (void *)v23;
    -[DNDContact firstName](self, "firstName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact firstName](v5, "firstName");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      v12 = 0;
      v124[0] = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      LODWORD(v124[3]) = 1;
      *(_QWORD *)((char *)&v124[3] + 4) = 0x100000000;
      LODWORD(v124[2]) = 1;
      HIDWORD(v124[2]) = v6 != v7;
      v13 = 0;
      v124[1] = 1;
      goto LABEL_64;
    }
  }
  -[DNDContact middleName](self, "middleName");
  v25 = objc_claimAutoreleasedReturnValue();
  -[DNDContact middleName](v5, "middleName");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v25 != v26;
  LODWORD(v124[4]) = v21;
  v116 = (void *)v26;
  v117 = (void *)v25;
  if (v25 != v26)
  {
    -[DNDContact middleName](self, "middleName");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v112 = 0;
      v9 = 0;
      v124[0] = 0;
      v125 = 0uLL;
      v40 = v21;
      v12 = 0;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v13 = 0;
      LODWORD(v124[2]) = v40;
      v124[1] = v40 | 0x100000000;
      goto LABEL_64;
    }
    v112 = (void *)v28;
    -[DNDContact middleName](v5, "middleName");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v107 = 0;
      v9 = 0;
      v124[0] = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v13 = 0;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = 1;
      goto LABEL_64;
    }
    v107 = (void *)v29;
    -[DNDContact middleName](self, "middleName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact middleName](v5, "middleName");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v30;
    if (!objc_msgSend(v30, "isEqual:"))
    {
      v124[0] = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = 1;
      v13 = 1;
      goto LABEL_64;
    }
  }
  -[DNDContact lastName](self, "lastName");
  v31 = objc_claimAutoreleasedReturnValue();
  -[DNDContact lastName](v5, "lastName");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v31;
  v110 = (void *)v32;
  v34 = v31 == v32;
  v35 = v31 != v32;
  HIDWORD(v124[3]) = v27;
  v111 = v33;
  if (v34)
  {
    HIDWORD(v125) = v35;
  }
  else
  {
    -[DNDContact lastName](self, "lastName");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      v106 = 0;
      *(_QWORD *)((char *)&v125 + 4) = 0;
      v46 = v27;
      memset(v123, 0, sizeof(v123));
      LODWORD(v125) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v46;
      v13 = v46;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      goto LABEL_64;
    }
    v106 = (void *)v36;
    -[DNDContact lastName](v5, "lastName");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      v101 = 0;
      *(_QWORD *)((char *)&v125 + 4) = 0;
      v54 = v27;
      memset(v123, 0, 28);
      LODWORD(v125) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v54;
      v13 = v54;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_OWORD *)&v123[28] = 1uLL;
      goto LABEL_64;
    }
    HIDWORD(v125) = v35;
    v101 = (void *)v37;
    -[DNDContact lastName](self, "lastName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact lastName](v5, "lastName");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(_QWORD *)&v123[36] = 0;
      *(_QWORD *)((char *)&v125 + 4) = 0;
      v39 = v27;
      memset(v123, 0, 24);
      LODWORD(v125) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v39;
      v13 = v39;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 0;
      *(_QWORD *)&v123[24] = 0x100000001;
      goto LABEL_64;
    }
  }
  -[DNDContact nickName](self, "nickName");
  v41 = objc_claimAutoreleasedReturnValue();
  -[DNDContact nickName](v5, "nickName");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD2(v125) = v41 != (_QWORD)v104;
  v105 = (void *)v41;
  if ((void *)v41 != v104)
  {
    -[DNDContact nickName](self, "nickName");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v100 = 0;
      *(_QWORD *)&v125 = 0;
      v55 = v27;
      memset(v123, 0, 24);
      *(_QWORD *)&v123[32] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v55;
      v13 = v55;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      goto LABEL_64;
    }
    v100 = (void *)v42;
    -[DNDContact nickName](v5, "nickName");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v95 = 0;
      *(_QWORD *)&v123[12] = 0;
      *(_DWORD *)&v123[20] = 0;
      *(_QWORD *)&v125 = 0;
      v60 = v27;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[32] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v60;
      v13 = v60;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_DWORD *)&v123[8] = 1;
      goto LABEL_64;
    }
    v95 = (void *)v43;
    -[DNDContact nickName](self, "nickName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact nickName](v5, "nickName");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v44;
    if (!objc_msgSend(v44, "isEqual:"))
    {
      *(_QWORD *)&v125 = 0;
      v45 = v27;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[32] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v45;
      v13 = v45;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_OWORD *)&v123[8] = 0x100000001uLL;
      goto LABEL_64;
    }
  }
  -[DNDContact organizationName](self, "organizationName");
  v47 = objc_claimAutoreleasedReturnValue();
  -[DNDContact organizationName](v5, "organizationName");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v47;
  v34 = v47 == v48;
  v50 = v47 != v48;
  v98 = (void *)v48;
  v99 = v49;
  if (v34)
  {
    DWORD1(v125) = v50;
  }
  else
  {
    -[DNDContact organizationName](self, "organizationName");
    v51 = objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      v94 = 0;
      v61 = v27;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[16] = 0x100000000;
      *(_QWORD *)&v123[32] = 0;
      *(_QWORD *)&v125 = 0x100000000;
      v9 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v61;
      v13 = v61;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[8] = DWORD2(v125);
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      goto LABEL_64;
    }
    v94 = (void *)v51;
    -[DNDContact organizationName](v5, "organizationName");
    v52 = objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      v89 = 0;
      *(_QWORD *)&v123[16] = 0x100000000;
      *(_QWORD *)&v123[32] = 0;
      *(_QWORD *)&v125 = 0x100000000;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_QWORD *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
    DWORD1(v125) = v50;
    v89 = (void *)v52;
    -[DNDContact organizationName](self, "organizationName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact organizationName](v5, "organizationName");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v53;
    if (!objc_msgSend(v53, "isEqual:"))
    {
      *(_QWORD *)&v123[32] = 0;
      *(_QWORD *)&v125 = 0x100000000;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_QWORD *)&v123[12] = DWORD2(v125) | 0x100000000;
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
  }
  -[DNDContact phoneNumbers](self, "phoneNumbers");
  v56 = objc_claimAutoreleasedReturnValue();
  -[DNDContact phoneNumbers](v5, "phoneNumbers");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v125) = v56 != (_QWORD)v92;
  v93 = (void *)v56;
  if ((void *)v56 != v92)
  {
    -[DNDContact phoneNumbers](self, "phoneNumbers");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
    {
      v88 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[32] = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      goto LABEL_64;
    }
    v88 = (void *)v57;
    -[DNDContact phoneNumbers](v5, "phoneNumbers");
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      v84 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 1;
      goto LABEL_64;
    }
    v84 = (void *)v58;
    -[DNDContact phoneNumbers](self, "phoneNumbers");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact phoneNumbers](v5, "phoneNumbers");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v59;
    if (!objc_msgSend(v59, "isEqual:"))
    {
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[32] = 1;
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      v124[0] = 0x100000001;
      goto LABEL_64;
    }
  }
  -[DNDContact emailAddresses](self, "emailAddresses");
  v62 = objc_claimAutoreleasedReturnValue();
  -[DNDContact emailAddresses](v5, "emailAddresses");
  v63 = objc_claimAutoreleasedReturnValue();
  v9 = v62;
  if (v62 == v63)
  {
    v16 = 0;
    v17 = 0;
    HIDWORD(v124[2]) = v6 != v7;
    LODWORD(v124[3]) = 1;
    LODWORD(v124[2]) = v21;
    v124[1] = v21 | 0x100000000;
    v12 = v27;
    v13 = v27;
    v15 = 0;
    *(_DWORD *)&v123[24] = HIDWORD(v125);
    *(_DWORD *)&v123[28] = HIDWORD(v125);
    *(_DWORD *)&v123[40] = 1;
    *(_DWORD *)&v123[12] = DWORD2(v125);
    *(_DWORD *)&v123[20] = 1;
    *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
    *(_DWORD *)&v123[16] = DWORD1(v125);
    *(_DWORD *)&v123[36] = 1;
    *(_DWORD *)&v123[32] = v125;
    v124[0] = v125 | 0x100000000;
    v87 = (void *)v62;
    v14 = 1;
    v123[0] = 1;
  }
  else
  {
    v87 = (void *)v63;
    -[DNDContact emailAddresses](self, "emailAddresses");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v83 = (void *)v64;
      -[DNDContact emailAddresses](v5, "emailAddresses");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v80 = (void *)v65;
        -[DNDContact emailAddresses](self, "emailAddresses");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDContact emailAddresses](v5, "emailAddresses");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v66;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        v12 = v27;
        v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[36] = 1;
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        v123[0] = objc_msgSend(v66, "isEqual:");
        *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
        *(_DWORD *)&v123[32] = v125;
        v124[0] = v125 | 0x100000000;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        v17 = 1;
      }
      else
      {
        v80 = 0;
        v17 = 0;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        v12 = v27;
        v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        v123[0] = 0;
        *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[32] = v125;
        *(_DWORD *)&v123[36] = 1;
        v124[0] = v125 | 0x100000000;
        v14 = 1;
        v15 = 1;
        v16 = 1;
      }
    }
    else
    {
      v83 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v123[0] = 0;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[32] = v125;
      *(_DWORD *)&v123[36] = 1;
      v124[0] = v125 | 0x100000000;
      v14 = 1;
      v15 = 1;
    }
    v9 = v62;
  }
LABEL_64:
  v67 = v9;
  if (v17)
  {
    v68 = v5;
    v69 = v13;
    v70 = v7;
    v71 = v6;
    v72 = v14;
    v73 = v12;
    v74 = v15;
    v75 = v16;

    v9 = v67;
    v16 = v75;
    v15 = v74;
    v12 = v73;
    v14 = v72;
    v6 = v71;
    v7 = v70;
    v13 = v69;
    v5 = v68;
  }
  if (v16)
  {

    v9 = v67;
  }
  if (v15)
  {

    v9 = v67;
  }
  if (v14)
  {
    v76 = (void *)v9;

  }
  if (LODWORD(v124[0]))
  {

  }
  if (*(_DWORD *)&v123[32])

  if ((_DWORD)v125)
  if (*(_DWORD *)&v123[36])
  {

  }
  if (*(_DWORD *)&v123[16])
  {

  }
  if (*(_DWORD *)&v123[4])

  if (DWORD1(v125))
  if (*(_DWORD *)&v123[20])
  {

  }
  if (*(_DWORD *)&v123[12])
  {

  }
  if (*(_DWORD *)&v123[8])

  if (DWORD2(v125))
  if (*(_DWORD *)&v123[40])
  {

  }
  if (*(_DWORD *)&v123[24])
  {

  }
  if (*(_DWORD *)&v123[28])

  if (HIDWORD(v125))
  if (HIDWORD(v124[0]))
  {

    if (!v13)
    {
LABEL_104:
      if (!v12)
        goto LABEL_105;
LABEL_127:

      if (!HIDWORD(v124[3]))
        goto LABEL_107;
      goto LABEL_106;
    }
  }
  else if (!v13)
  {
    goto LABEL_104;
  }

  if (v12)
    goto LABEL_127;
LABEL_105:
  if (HIDWORD(v124[3]))
LABEL_106:

LABEL_107:
  if (HIDWORD(v124[1]))
  {

  }
  if (LODWORD(v124[1]))
  {

  }
  if (LODWORD(v124[2]))

  if (LODWORD(v124[4]))
  if (LODWORD(v124[3]))
  {

  }
  if (HIDWORD(v124[2]))
  {

  }
  if (HIDWORD(v124[4]))

  if (v6 != v7)
  v18 = v123[0];
LABEL_124:

  return v18;
}

- (id)normalizedPhoneNumbers
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_phoneNumbers;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[DNDContact normalizePhoneNumber:](DNDContact, "normalizePhoneNumber:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)matchesContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
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
  char v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;

  v4 = a3;
  -[DNDContact contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[DNDContact contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v12 = 1;
    }
    else
    {
      -[DNDContact contactIdentifier](self, "contactIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[DNDContact contactIdentifier](self, "contactIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contactIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  -[DNDContact firstName](self, "firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != v14)
  {
    -[DNDContact firstName](self, "firstName");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v28 = 0;
      goto LABEL_99;
    }
    v16 = (void *)v15;
    objc_msgSend(v4, "firstName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v28 = 0;
LABEL_98:

      goto LABEL_99;
    }
    -[DNDContact firstName](self, "firstName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isEqual:", v19))
    {
      v28 = 0;
LABEL_97:

      goto LABEL_98;
    }
    v95 = v16;
    v96 = v19;
    v97 = v18;
    v98 = v17;
  }
  -[DNDContact middleName](self, "middleName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v21)
  {
    v94 = v12;
    goto LABEL_25;
  }
  -[DNDContact middleName](self, "middleName");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
LABEL_38:

    v28 = 0;
    v18 = v97;
    v17 = v98;
    v16 = v95;
    v19 = v96;
    if (v13 == v14)
      goto LABEL_99;
    goto LABEL_97;
  }
  v23 = (void *)v22;
  objc_msgSend(v4, "middleName");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

    goto LABEL_38;
  }
  v25 = (void *)v24;
  v94 = v12;
  -[DNDContact middleName](self, "middleName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqual:", v27) & 1) == 0)
  {

    goto LABEL_94;
  }
  v90 = v27;
  v91 = v26;
  v88 = v25;
  v89 = v23;
LABEL_25:
  -[DNDContact lastName](self, "lastName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 == v30)
    goto LABEL_32;
  -[DNDContact lastName](self, "lastName");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
LABEL_48:

    if (v20 == v21)
    {

LABEL_95:
      v28 = 0;
      goto LABEL_96;
    }
    goto LABEL_93;
  }
  v92 = (void *)v31;
  objc_msgSend(v4, "lastName");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
LABEL_47:

    goto LABEL_48;
  }
  v87 = (void *)v32;
  -[DNDContact lastName](self, "lastName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v33, "isEqual:", v34) & 1) == 0)
  {

    goto LABEL_47;
  }
  v81 = v34;
  v83 = v33;
LABEL_32:
  -[DNDContact nickName](self, "nickName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickName");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 != v93)
  {
    -[DNDContact nickName](self, "nickName");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {

      if (v29 == v30)
      {

      }
      else
      {

      }
      if (v20 == v21)
        goto LABEL_94;
      goto LABEL_93;
    }
    v82 = (void *)v36;
    objc_msgSend(v4, "nickName");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

      if (v29 == v30)
      {

LABEL_91:
        goto LABEL_92;
      }
LABEL_89:

LABEL_90:
      goto LABEL_91;
    }
    v85 = v30;
    v38 = v29;
    v39 = v35;
    v79 = (void *)v37;
    -[DNDContact nickName](self, "nickName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nickName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v40, "isEqual:", v41) & 1) == 0)
    {

      if (v38 == v85)
      {

      }
      else
      {

      }
LABEL_92:
      if (v20 != v21)
      {
LABEL_93:

      }
LABEL_94:

      goto LABEL_95;
    }
    v73 = v40;
    v80 = v41;
    v35 = v39;
    v29 = v38;
    v30 = v85;
  }
  -[DNDContact organizationName](self, "organizationName");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v42;
  if ((void *)v42 != v84)
  {
    -[DNDContact organizationName](self, "organizationName");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v74 = (void *)v43;
      objc_msgSend(v4, "organizationName");
      v44 = objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v75 = v35;
        v72 = (void *)v44;
        -[DNDContact organizationName](self, "organizationName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "organizationName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v45, "isEqual:", v46) & 1) != 0)
        {
          v71 = v45;
          v68 = v46;
          v35 = v75;
          goto LABEL_52;
        }

        if (v75 == v93)
        {

        }
        else
        {

        }
        v57 = v29 == v30;
LABEL_103:
        if (!v57)
        {

        }
        if (v20 == v21)
          goto LABEL_94;
        goto LABEL_93;
      }
      v50 = v29;
      v51 = v80;

    }
    else
    {
      v50 = v29;
      v51 = v80;
    }

    if (v35 == v93)
    {

    }
    else
    {

    }
    v29 = v50;
    v57 = v50 == v30;
    goto LABEL_103;
  }
LABEL_52:
  -[DNDContact normalizedPhoneNumbers](self, "normalizedPhoneNumbers");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPhoneNumbers");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47 == v78)
  {
    v76 = v47;
    goto LABEL_63;
  }
  -[DNDContact normalizedPhoneNumbers](self, "normalizedPhoneNumbers");
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
  {
    v58 = v71;
    v77 = v35;
    goto LABEL_84;
  }
  v70 = (void *)v48;
  objc_msgSend(v4, "normalizedPhoneNumbers");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49)
  {
LABEL_83:
    v58 = v71;
    v77 = v35;

LABEL_84:
    if (v86 != v84)
    {

    }
    if (v77 != v93)
    {

    }
    if (v29 == v30)
      goto LABEL_90;
    goto LABEL_89;
  }
  v67 = v49;
  -[DNDContact normalizedPhoneNumbers](self, "normalizedPhoneNumbers");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPhoneNumbers");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v69, "isEqual:") & 1) == 0)
  {

    v49 = v67;
    goto LABEL_83;
  }
  v76 = v47;
LABEL_63:
  -[DNDContact emailAddresses](self, "emailAddresses");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddresses");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v52 == (void *)v53)
  {

    v28 = 1;
  }
  else
  {
    v64 = v52;
    v65 = (void *)v53;
    -[DNDContact emailAddresses](self, "emailAddresses");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v63 = (void *)v54;
      objc_msgSend(v4, "emailAddresses");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        v62 = v55;
        -[DNDContact emailAddresses](self, "emailAddresses");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "emailAddresses");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v61, "isEqual:");

        v55 = v62;
      }
      else
      {
        v28 = 0;
      }

    }
    else
    {

      v28 = 0;
    }
  }
  v60 = v78;
  if (v76 != v78)
  {

    v60 = v78;
  }

  if (v86 != v84)
  {

  }
  if (v35 != v93)
  {

  }
  if (v29 != v30)
  {

  }
  if (v20 != v21)
  {

  }
LABEL_96:
  v18 = v97;
  v17 = v98;
  v16 = v95;
  v19 = v96;
  v12 = v94;
  if (v13 != v14)
    goto LABEL_97;
LABEL_99:

  return v12 | v28;
}

- (BOOL)matchesContactHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;

  v4 = a3;
  -[DNDContact contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[DNDContact contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v12 = 1;
    }
    else
    {
      -[DNDContact contactIdentifier](self, "contactIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[DNDContact contactIdentifier](self, "contactIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contactIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v4, "normalizedValue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    LOBYTE(v13) = -[NSSet containsObject:](self->_phoneNumbers, "containsObject:", v13)
               || -[NSSet containsObject:](self->_emailAddresses, "containsObject:", v14);
  v15 = v12 | v13;

  return v15;
}

- (id)description
{
  return -[DNDContact _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (id)redactedDescription
{
  return -[DNDContact _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  NSString *firstName;
  NSString *contactIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  contactIdentifier = self->_contactIdentifier;
  firstName = self->_firstName;
  if (a3)
  {
    -[NSString dnd_privacyObfuscatedString](firstName, "dnd_privacyObfuscatedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString dnd_privacyObfuscatedString](self->_middleName, "dnd_privacyObfuscatedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString dnd_privacyObfuscatedString](self->_lastName, "dnd_privacyObfuscatedString");
    v18 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString dnd_privacyObfuscatedString](self->_nickName, "dnd_privacyObfuscatedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString dnd_privacyObfuscatedString](self->_nickName, "dnd_privacyObfuscatedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact _redactedDescriptionsForStrings:](self, "_redactedDescriptionsForStrings:", self->_phoneNumbers);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDContact _redactedDescriptionsForStrings:](self, "_redactedDescriptionsForStrings:", self->_emailAddresses);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; contactIdentifier: %@; firstName: %@; middleName: %@; lastName: %@; nickName: %@; organizationName: %@; phoneNumbers: %@; emailAddresses: %@;>"),
      v6,
      self,
      contactIdentifier,
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; contactIdentifier: %@; firstName: %@; middleName: %@; lastName: %@; nickName: %@; organizationName: %@; phoneNumbers: %@; emailAddresses: %@;>"),
      v6,
      self,
      contactIdentifier,
      firstName,
      self->_middleName,
      self->_lastName,
      self->_nickName,
      self->_organizationName,
      self->_phoneNumbers,
      self->_emailAddresses);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (id)_redactedDescriptionsForStrings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dnd_privacyObfuscatedString", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)diffDescription
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_contactIdentifier, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("contactIdentifier:%@;"), self->_contactIdentifier);
  if (-[NSString length](self->_firstName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("firstName:%@;"), self->_firstName);
  if (-[NSString length](self->_middleName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("middleName:%@;"), self->_middleName);
  if (-[NSString length](self->_lastName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("lastName:%@;"), self->_lastName);
  if (-[NSString length](self->_nickName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("nickName:%@;"), self->_nickName);
  if (-[NSString length](self->_organizationName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("organizationName:%@;"), self->_organizationName);
  if (-[NSSet count](self->_phoneNumbers, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("phoneNumbers:%@;"), self->_phoneNumbers);
  if (-[NSSet count](self->_emailAddresses, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("emailAddresses:%@;"), self->_emailAddresses);
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDContact _initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:]([DNDMutableContact alloc], "_initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:", self->_contactIdentifier, self->_firstName, self->_middleName, self->_lastName, self->_nickName, self->_organizationName, self->_phoneNumbers, self->_emailAddresses);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDContact)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  DNDContact *v17;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("middleName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("phoneNumbers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("emailAddresses"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[DNDContact _initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:](self, "_initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:", v19, v4, v5, v6, v7, v8, v12, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_middleName, CFSTR("middleName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nickName, CFSTR("nickName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

+ (void)normalizePhoneNumber:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543619;
  v4 = a1;
  v5 = 2113;
  v6 = a2;
  _os_log_error_impl(&dword_19ABEB000, log, OS_LOG_TYPE_ERROR, "%{public}@ couldnt normalize phonenumber %{private}@", (uint8_t *)&v3, 0x16u);
}

@end
