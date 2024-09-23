@implementation DNDSContactRecord

- (DNDSContactRecord)init
{
  return (DNDSContactRecord *)-[DNDSContactRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
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
  id v13;

  v4 = a3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[DNDSContactRecord _initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:](self, "_initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
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
  DNDSContactRecord *v24;
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
  v42.super_class = (Class)DNDSContactRecord;
  v24 = -[DNDSContactRecord init](&v42, sel_init);
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

  -[DNDSContactRecord contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSContactRecord firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSContactRecord middleName](self, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSContactRecord lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSContactRecord nickName](self, "nickName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDSContactRecord organizationName](self, "organizationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[DNDSContactRecord phoneNumbers](self, "phoneNumbers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[DNDSContactRecord emailAddresses](self, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  DNDSContactRecord *v4;
  DNDSContactRecord *v5;
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
  DNDSContactRecord *v68;
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

  v4 = (DNDSContactRecord *)a3;
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
  -[DNDSContactRecord contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord contactIdentifier](v5, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    -[DNDSContactRecord contactIdentifier](self, "contactIdentifier");
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
    -[DNDSContactRecord contactIdentifier](v5, "contactIdentifier");
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
    -[DNDSContactRecord contactIdentifier](self, "contactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord contactIdentifier](v5, "contactIdentifier");
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
  -[DNDSContactRecord firstName](self, "firstName");
  v19 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord firstName](v5, "firstName");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v19 != v20;
  HIDWORD(v124[4]) = v6 != v7;
  v120 = (void *)v20;
  v121 = (void *)v19;
  if (v19 != v20)
  {
    -[DNDSContactRecord firstName](self, "firstName");
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
    -[DNDSContactRecord firstName](v5, "firstName");
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
    -[DNDSContactRecord firstName](self, "firstName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord firstName](v5, "firstName");
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
  -[DNDSContactRecord middleName](self, "middleName");
  v25 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord middleName](v5, "middleName");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v25 != v26;
  LODWORD(v124[4]) = v21;
  v116 = (void *)v26;
  v117 = (void *)v25;
  if (v25 != v26)
  {
    -[DNDSContactRecord middleName](self, "middleName");
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
    -[DNDSContactRecord middleName](v5, "middleName");
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
    -[DNDSContactRecord middleName](self, "middleName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord middleName](v5, "middleName");
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
  -[DNDSContactRecord lastName](self, "lastName");
  v31 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord lastName](v5, "lastName");
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
    -[DNDSContactRecord lastName](self, "lastName");
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
    -[DNDSContactRecord lastName](v5, "lastName");
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
    -[DNDSContactRecord lastName](self, "lastName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord lastName](v5, "lastName");
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
  -[DNDSContactRecord nickName](self, "nickName");
  v41 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord nickName](v5, "nickName");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD2(v125) = v41 != (_QWORD)v104;
  v105 = (void *)v41;
  if ((void *)v41 != v104)
  {
    -[DNDSContactRecord nickName](self, "nickName");
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
    -[DNDSContactRecord nickName](v5, "nickName");
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
    -[DNDSContactRecord nickName](self, "nickName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord nickName](v5, "nickName");
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
  -[DNDSContactRecord organizationName](self, "organizationName");
  v47 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord organizationName](v5, "organizationName");
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
    -[DNDSContactRecord organizationName](self, "organizationName");
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
    -[DNDSContactRecord organizationName](v5, "organizationName");
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
    -[DNDSContactRecord organizationName](self, "organizationName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord organizationName](v5, "organizationName");
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
  -[DNDSContactRecord phoneNumbers](self, "phoneNumbers");
  v56 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord phoneNumbers](v5, "phoneNumbers");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v125) = v56 != (_QWORD)v92;
  v93 = (void *)v56;
  if ((void *)v56 != v92)
  {
    -[DNDSContactRecord phoneNumbers](self, "phoneNumbers");
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
    -[DNDSContactRecord phoneNumbers](v5, "phoneNumbers");
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
    -[DNDSContactRecord phoneNumbers](self, "phoneNumbers");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactRecord phoneNumbers](v5, "phoneNumbers");
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
  -[DNDSContactRecord emailAddresses](self, "emailAddresses");
  v62 = objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord emailAddresses](v5, "emailAddresses");
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
    -[DNDSContactRecord emailAddresses](self, "emailAddresses");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v83 = (void *)v64;
      -[DNDSContactRecord emailAddresses](v5, "emailAddresses");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v80 = (void *)v65;
        -[DNDSContactRecord emailAddresses](self, "emailAddresses");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSContactRecord emailAddresses](v5, "emailAddresses");
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

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[DNDSContactRecord contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord middleName](self, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord nickName](self, "nickName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord organizationName](self, "organizationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord phoneNumbers](self, "phoneNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactRecord emailAddresses](self, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; contactIdentifier: %@; firstName: '%@'; middleName: %@; lastName: %@; nickName: %@; organizationName: %@; phoneNumbers: %@; emailAddresses: %@>"),
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSContactRecord _initWithRecord:]([DNDSMutableContactRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  if (a4 <= 1 && a5 >= 2)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "bs_safeArrayForKey:", CFSTR("phoneNumbers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x1E0D1D5C0], "normalizePhoneNumber:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_setSafeObject:forKey:", v19, CFSTR("phoneNumbers"));

  }
  return v8;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  Class v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;

  v48 = a4;
  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("contactIdentifier"), objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("firstName"), objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("middleName"), objc_opt_class());
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("lastName"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("nickName"), objc_opt_class());
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("organizationName"), objc_opt_class());
  v46 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("phoneNumbers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("emailAddresses"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("type"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("value"), objc_opt_class());
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = v14;
  v45 = (void *)v15;
  if (!v14 || !v15)
  {
    v20 = (void *)v46;
    v19 = (void *)v47;
    goto LABEL_6;
  }
  if (objc_msgSend(v14, "unsignedIntegerValue") != 1)
  {
    v22 = objc_msgSend(v14, "unsignedIntegerValue");
    v20 = (void *)v46;
    v19 = (void *)v47;
    if (v22 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
      v23 = objc_claimAutoreleasedReturnValue();
      v18 = v10;
      v10 = (void *)v23;
      goto LABEL_9;
    }
LABEL_6:
    v21 = (objc_class *)a1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v13;
  v13 = (void *)v17;
  v20 = (void *)v46;
  v19 = (void *)v47;
LABEL_9:
  v21 = (objc_class *)a1;

LABEL_10:
  if (v50)
  {
    v24 = (void *)objc_msgSend([v21 alloc], "_initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:", v50, v49, v6, v7, v19, v20, v10, v13);
  }
  else
  {
    v40 = v16;
    v25 = objc_alloc_init(MEMORY[0x1E0D1D6E8]);
    objc_msgSend(v25, "setFirstName:", v49);
    objc_msgSend(v25, "setLastName:", v7);
    objc_msgSend(v25, "setMiddleName:", v6);
    objc_msgSend(v25, "setNickName:", v19);
    objc_msgSend(v25, "setOrganizationName:", v20);
    objc_msgSend(v25, "setPhoneNumbers:", v10);
    objc_msgSend(v25, "setEmailAddresses:", v13);
    objc_msgSend(v48, "contactProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contactForContact:", v25);
    v41 = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = [v21 alloc];
    objc_msgSend(v27, "contactIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "middleName");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "nickName");
    v44 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "organizationName");
    v42 = v7;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "phoneNumbers");
    v39 = v13;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "emailAddresses");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v28;
    v24 = (void *)objc_msgSend(v38, "_initWithContactIdentifier:firstName:middleName:lastName:nickName:organizationName:phoneNumbers:emailAddresses:", v37, v36, v28, v29, v30, v31, v32, v33);

    v20 = (void *)v46;
    v13 = v39;
    v19 = (void *)v47;

    v7 = v42;
    v6 = v44;

    v10 = v41;
    v16 = v40;
  }

  return v24;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "arrayHealingSource", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v12 = (void *)objc_msgSend((id)objc_opt_class(), "newWithDictionaryRepresentation:context:", v11, v4);
        if (-[DNDSContactRecord isEqual:](self, "isEqual:", v12))
        {
          v13 = objc_msgSend(v11, "mutableCopy");

          v5 = (void *)v13;
          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  -[DNDSContactRecord firstName](self, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v14, CFSTR("firstName"));

  -[DNDSContactRecord middleName](self, "middleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v15, CFSTR("middleName"));

  -[DNDSContactRecord lastName](self, "lastName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v16, CFSTR("lastName"));

  -[DNDSContactRecord nickName](self, "nickName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v17, CFSTR("nickName"));

  -[DNDSContactRecord organizationName](self, "organizationName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v18, CFSTR("organizationName"));

  -[DNDSContactRecord phoneNumbers](self, "phoneNumbers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v20, CFSTR("phoneNumbers"));

  -[DNDSContactRecord emailAddresses](self, "emailAddresses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v22, CFSTR("emailAddresses"));

  if (objc_msgSend(v4, "destination") == 1)
  {
    -[DNDSContactRecord contactIdentifier](self, "contactIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_setSafeObject:forKey:", v23, CFSTR("contactIdentifier"));

  }
  return v5;
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

@end
