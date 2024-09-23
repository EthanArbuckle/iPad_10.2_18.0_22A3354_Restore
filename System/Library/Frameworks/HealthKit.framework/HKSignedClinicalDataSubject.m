@implementation HKSignedClinicalDataSubject

- (HKSignedClinicalDataSubject)initWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 identifiers:(id)a8 addresses:(id)a9 maritalStatus:(id)a10 race:(id)a11 ethnicity:(id)a12 birthSex:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HKSignedClinicalDataSubject *v27;
  uint64_t v28;
  NSString *fullName;
  uint64_t v30;
  HKMedicalDate *birthDate;
  uint64_t v32;
  NSString *gender;
  uint64_t v34;
  NSArray *emailAddresses;
  uint64_t v36;
  NSArray *phoneNumbers;
  uint64_t v38;
  NSArray *identifiers;
  uint64_t v40;
  NSArray *addresses;
  uint64_t v42;
  NSString *maritalStatus;
  uint64_t v44;
  NSString *race;
  uint64_t v46;
  NSString *ethnicity;
  uint64_t v48;
  NSString *birthSex;
  id v52;
  id v53;
  objc_super v54;

  v18 = a3;
  v19 = a4;
  v53 = a5;
  v52 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v54.receiver = self;
  v54.super_class = (Class)HKSignedClinicalDataSubject;
  v27 = -[HKSignedClinicalDataSubject init](&v54, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v18, "copy");
    fullName = v27->_fullName;
    v27->_fullName = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    birthDate = v27->_birthDate;
    v27->_birthDate = (HKMedicalDate *)v30;

    v32 = objc_msgSend(v53, "copy");
    gender = v27->_gender;
    v27->_gender = (NSString *)v32;

    v34 = objc_msgSend(v52, "copy");
    emailAddresses = v27->_emailAddresses;
    v27->_emailAddresses = (NSArray *)v34;

    v36 = objc_msgSend(v20, "copy");
    phoneNumbers = v27->_phoneNumbers;
    v27->_phoneNumbers = (NSArray *)v36;

    v38 = objc_msgSend(v21, "copy");
    identifiers = v27->_identifiers;
    v27->_identifiers = (NSArray *)v38;

    v40 = objc_msgSend(v22, "copy");
    addresses = v27->_addresses;
    v27->_addresses = (NSArray *)v40;

    v42 = objc_msgSend(v23, "copy");
    maritalStatus = v27->_maritalStatus;
    v27->_maritalStatus = (NSString *)v42;

    v44 = objc_msgSend(v24, "copy");
    race = v27->_race;
    v27->_race = (NSString *)v44;

    v46 = objc_msgSend(v25, "copy");
    ethnicity = v27->_ethnicity;
    v27->_ethnicity = (NSString *)v46;

    v48 = objc_msgSend(v26, "copy");
    birthSex = v27->_birthSex;
    v27->_birthSex = (NSString *)v48;

  }
  return v27;
}

+ (HKSignedClinicalDataSubject)subjectWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFullName:birthDate:gender:emailAddresses:phoneNumbers:identifiers:addresses:maritalStatus:race:ethnicity:birthSex:", v16, v15, v14, v13, v12, 0, 0, 0, 0, 0, 0);

  return (HKSignedClinicalDataSubject *)v17;
}

+ (HKSignedClinicalDataSubject)subjectWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 identifiers:(id)a8 addresses:(id)a9 maritalStatus:(id)a10 race:(id)a11 ethnicity:(id)a12 birthSex:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  Class v32;

  v29 = a13;
  v28 = a12;
  v27 = a11;
  v18 = a10;
  v19 = a9;
  v26 = a8;
  v20 = a7;
  v21 = a6;
  v25 = a5;
  v22 = a4;
  v23 = a3;
  v32 = (Class)objc_msgSend(objc_alloc((Class)a1), "initWithFullName:birthDate:gender:emailAddresses:phoneNumbers:identifiers:addresses:maritalStatus:race:ethnicity:birthSex:", v23, v22, v25, v21, v20, v26, v19, v18, v27, v28, v29);

  return (HKSignedClinicalDataSubject *)v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_fullName, "hash");
  v4 = -[HKMedicalDate hash](self->_birthDate, "hash") ^ v3;
  v5 = -[NSString hash](self->_gender, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_emailAddresses, "hash");
  v7 = -[NSArray hash](self->_phoneNumbers, "hash");
  v8 = v7 ^ -[NSArray hash](self->_identifiers, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_addresses, "hash");
  v10 = -[NSString hash](self->_maritalStatus, "hash");
  v11 = v10 ^ -[NSString hash](self->_race, "hash");
  v12 = v11 ^ -[NSString hash](self->_ethnicity, "hash");
  return v9 ^ v12 ^ -[NSString hash](self->_birthSex, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSignedClinicalDataSubject *v4;
  HKSignedClinicalDataSubject *v5;
  void *identifiers;
  void *v7;
  char v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSString *fullName;
  NSString *v17;
  NSString *v18;
  void *v19;
  HKMedicalDate *birthDate;
  HKMedicalDate *v21;
  uint64_t v22;
  HKMedicalDate *v23;
  NSString *gender;
  uint64_t v25;
  NSString *v26;
  NSString *v27;
  NSArray *emailAddresses;
  BOOL v29;
  _BOOL4 v30;
  uint64_t v31;
  NSArray *v32;
  NSString *v33;
  _BOOL4 v34;
  NSArray *phoneNumbers;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  _BOOL4 v39;
  NSArray *addresses;
  uint64_t v41;
  NSArray *v42;
  uint64_t v43;
  NSArray *v44;
  NSString *maritalStatus;
  _BOOL4 v46;
  uint64_t v47;
  NSString *v48;
  NSString *race;
  uint64_t v50;
  NSString *v51;
  NSString *v52;
  _BOOL4 v53;
  NSString *ethnicity;
  uint64_t v55;
  NSString *v56;
  void *v57;
  NSString *birthSex;
  uint64_t v59;
  uint64_t v60;
  NSString *v61;
  void *v62;
  NSString *v63;
  NSString *v64;
  NSString *v65;
  void *v67;
  void *v68;
  NSString *v69;
  void *v70;
  void *v71;
  NSString *v72;
  NSString *v73;
  void *v74;
  void *v75;
  NSString *v76;
  NSString *v77;
  void *v78;
  void *v79;
  NSString *v80;
  NSArray *v81;
  _BOOL4 v82;
  BOOL v83;
  NSArray *v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  void *v88;
  NSArray *v89;
  void *v90;
  _BOOL4 v91;
  NSArray *v92;
  void *v93;
  NSArray *v94;
  void *v95;
  _BOOL4 v96;
  NSArray *v97;
  void *v98;
  NSString *v99;
  void *v100;
  NSString *v101;
  _BOOL4 v102;
  void *v103;
  void *v104;

  v4 = (HKSignedClinicalDataSubject *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifiers = self->_identifiers;
      -[HKSignedClinicalDataSubject identifiers](v5, "identifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (identifiers)
      {
        if (!v7)
        {
LABEL_20:
          v15 = 0;
          goto LABEL_21;
        }
      }
      else if (v7)
      {
        goto LABEL_20;
      }
      v9 = -[NSArray count](self->_identifiers, "count");
      -[HKSignedClinicalDataSubject identifiers](v5, "identifiers");
      identifiers = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(identifiers, "count");

      if (v9 != v10)
        goto LABEL_20;
      if (-[NSArray count](self->_identifiers, "count"))
      {
        for (i = 0; -[NSArray count](self->_identifiers, "count") > i; ++i)
        {
          -[NSArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", i);
          identifiers = (void *)objc_claimAutoreleasedReturnValue();
          -[HKSignedClinicalDataSubject identifiers](v5, "identifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (identifiers == v13)
          {

          }
          else
          {
            if (!v13)
            {

              goto LABEL_20;
            }
            v14 = objc_msgSend(identifiers, "isEqualToArray:", v13);

            if (!v14)
              goto LABEL_20;
          }
        }
      }
      v15 = 1;
LABEL_21:
      fullName = self->_fullName;
      -[HKSignedClinicalDataSubject fullName](v5, "fullName");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (fullName != v17)
      {
        -[HKSignedClinicalDataSubject fullName](v5, "fullName");
        identifiers = (void *)objc_claimAutoreleasedReturnValue();
        if (!identifiers)
        {
          v8 = 0;
LABEL_125:

          goto LABEL_126;
        }
        v18 = self->_fullName;
        -[HKSignedClinicalDataSubject fullName](v5, "fullName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v18, "isEqualToString:", v19))
        {
          v8 = 0;
LABEL_73:

          goto LABEL_125;
        }
        v104 = v19;
      }
      birthDate = self->_birthDate;
      -[HKSignedClinicalDataSubject birthDate](v5, "birthDate");
      v21 = (HKMedicalDate *)objc_claimAutoreleasedReturnValue();
      v102 = birthDate != v21;
      if (birthDate != v21)
      {
        -[HKSignedClinicalDataSubject birthDate](v5, "birthDate");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {

          v8 = 0;
          v19 = v104;
          if (fullName == v17)
          {
LABEL_124:
            if (fullName != v17)
              goto LABEL_125;
            goto LABEL_126;
          }
LABEL_123:

          goto LABEL_124;
        }
        v98 = (void *)v22;
        v23 = self->_birthDate;
        -[HKSignedClinicalDataSubject birthDate](v5, "birthDate");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKMedicalDate isEqual:](v23, "isEqual:"))
        {
          v8 = 0;
          v19 = v104;
          goto LABEL_72;
        }
      }
      gender = self->_gender;
      -[HKSignedClinicalDataSubject gender](v5, "gender");
      v101 = (NSString *)objc_claimAutoreleasedReturnValue();
      v99 = gender;
      v96 = gender != v101;
      if (gender != v101)
      {
        -[HKSignedClinicalDataSubject gender](v5, "gender");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {

          v8 = 0;
          if (birthDate != v21)
          {
            LOBYTE(v34) = 1;
            v19 = v104;
            goto LABEL_120;
          }
          v34 = 0;
          v19 = v104;
LABEL_128:
          if (!v34)
            goto LABEL_122;
LABEL_121:

          goto LABEL_122;
        }
        v93 = (void *)v25;
        v26 = self->_gender;
        -[HKSignedClinicalDataSubject gender](v5, "gender");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v26, "isEqualToString:"))
        {
          v8 = 0;
          v27 = v101;
          goto LABEL_71;
        }
      }
      emailAddresses = self->_emailAddresses;
      -[HKSignedClinicalDataSubject emailAddresses](v5, "emailAddresses");
      v97 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v94 = emailAddresses;
      v29 = emailAddresses == v97;
      v30 = emailAddresses != v97;
      if (v29)
      {
        v91 = v30;
      }
      else
      {
        -[HKSignedClinicalDataSubject emailAddresses](v5, "emailAddresses");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
        {

          v8 = 0;
          v27 = v101;
          if (v99 != v101)
          {
            LOBYTE(v39) = 1;
            goto LABEL_117;
          }
          v39 = 0;
LABEL_130:
          if (!v39)
            goto LABEL_119;
LABEL_118:

          goto LABEL_119;
        }
        v91 = v30;
        v88 = (void *)v31;
        v32 = self->_emailAddresses;
        -[HKSignedClinicalDataSubject emailAddresses](v5, "emailAddresses");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSArray isEqualToArray:](v32, "isEqualToArray:"))
        {
          v8 = 0;
          v27 = v101;
          v33 = v99;
          goto LABEL_70;
        }
      }
      phoneNumbers = self->_phoneNumbers;
      -[HKSignedClinicalDataSubject phoneNumbers](v5, "phoneNumbers");
      v36 = objc_claimAutoreleasedReturnValue();
      v89 = phoneNumbers;
      v87 = phoneNumbers != (NSArray *)v36;
      v92 = (NSArray *)v36;
      if (phoneNumbers != (NSArray *)v36)
      {
        -[HKSignedClinicalDataSubject phoneNumbers](v5, "phoneNumbers");
        v37 = objc_claimAutoreleasedReturnValue();
        if (!v37)
        {

          v8 = 0;
          v27 = v101;
          v33 = v99;
          if (v94 != v97)
          {
            LOBYTE(v91) = 1;
            goto LABEL_114;
          }
          v91 = 0;
LABEL_132:
          if (!v91)
            goto LABEL_116;
LABEL_115:

          goto LABEL_116;
        }
        v85 = (void *)v37;
        v38 = self->_phoneNumbers;
        -[HKSignedClinicalDataSubject phoneNumbers](v5, "phoneNumbers");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSArray isEqualToArray:](v38, "isEqualToArray:"))
        {
          v8 = 0;
          v27 = v101;
          v33 = v99;
          goto LABEL_69;
        }
        v36 = (uint64_t)v92;
      }
      if (!v15)
      {
        v8 = 0;
        v27 = v101;
        v33 = v99;
        if (v89 != (NSArray *)v36)
          goto LABEL_111;
        goto LABEL_134;
      }
      addresses = self->_addresses;
      -[HKSignedClinicalDataSubject addresses](v5, "addresses");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (NSArray *)v41;
      v81 = addresses;
      v82 = addresses != (NSArray *)v41;
      if (addresses == (NSArray *)v41)
      {
        v84 = (NSArray *)v41;
      }
      else
      {
        -[HKSignedClinicalDataSubject addresses](v5, "addresses");
        v43 = objc_claimAutoreleasedReturnValue();
        if (!v43)
        {

          v8 = 0;
          v27 = v101;
          v33 = v99;
          if (v89 != v92)
          {
            LOBYTE(v87) = 1;
            goto LABEL_111;
          }
          v87 = 0;
LABEL_134:
          if (!v87)
            goto LABEL_113;
LABEL_112:

          goto LABEL_113;
        }
        v78 = (void *)v43;
        v44 = self->_addresses;
        -[HKSignedClinicalDataSubject addresses](v5, "addresses");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v42;
        if (!-[NSArray isEqualToArray:](v44, "isEqualToArray:"))
        {
          v8 = 0;
          v27 = v101;
          v33 = v99;
          goto LABEL_68;
        }
      }
      maritalStatus = self->_maritalStatus;
      -[HKSignedClinicalDataSubject maritalStatus](v5, "maritalStatus");
      v80 = (NSString *)objc_claimAutoreleasedReturnValue();
      v77 = maritalStatus;
      v46 = maritalStatus != v80;
      if (maritalStatus != v80)
      {
        -[HKSignedClinicalDataSubject maritalStatus](v5, "maritalStatus");
        v47 = objc_claimAutoreleasedReturnValue();
        if (!v47)
        {

          v8 = 0;
          v27 = v101;
          v33 = v99;
          if (v81 != v84)
          {
            LOBYTE(v53) = 1;
            goto LABEL_108;
          }
          v53 = 0;
LABEL_136:
          if (!v53)
            goto LABEL_110;
LABEL_109:

          goto LABEL_110;
        }
        v74 = (void *)v47;
        v48 = self->_maritalStatus;
        -[HKSignedClinicalDataSubject maritalStatus](v5, "maritalStatus");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v48, "isEqualToString:"))
        {
          v8 = 0;
          v27 = v101;
          goto LABEL_67;
        }
      }
      race = self->_race;
      -[HKSignedClinicalDataSubject race](v5, "race");
      v76 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (race != v76)
      {
        -[HKSignedClinicalDataSubject race](v5, "race");
        v50 = objc_claimAutoreleasedReturnValue();
        if (!v50)
        {

          v8 = 0;
          v27 = v101;
          if (v77 != v80)
            goto LABEL_102;
          goto LABEL_105;
        }
        v51 = race;
        v71 = (void *)v50;
        v52 = self->_race;
        -[HKSignedClinicalDataSubject race](v5, "race");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v52, "isEqualToString:"))
        {
          v8 = 0;
          v27 = v101;
          v64 = v76;
LABEL_100:

          if (v77 != v80)
          {
            LOBYTE(v46) = 1;
LABEL_102:

            if (!v46)
              goto LABEL_107;
LABEL_106:

            goto LABEL_107;
          }
          v46 = 0;
LABEL_105:
          if (!v46)
            goto LABEL_107;
          goto LABEL_106;
        }
        race = v51;
      }
      ethnicity = self->_ethnicity;
      -[HKSignedClinicalDataSubject ethnicity](v5, "ethnicity");
      v72 = (NSString *)objc_claimAutoreleasedReturnValue();
      v73 = race;
      v69 = ethnicity;
      if (ethnicity != v72)
      {
        -[HKSignedClinicalDataSubject ethnicity](v5, "ethnicity");
        v55 = objc_claimAutoreleasedReturnValue();
        if (!v55)
        {
          v8 = 0;
          v27 = v101;
          v63 = v72;
          goto LABEL_99;
        }
        v68 = (void *)v55;
        v56 = self->_ethnicity;
        -[HKSignedClinicalDataSubject ethnicity](v5, "ethnicity");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v56, "isEqualToString:", v57))
        {

          v8 = 0;
          goto LABEL_143;
        }
        v67 = v57;
      }
      birthSex = self->_birthSex;
      -[HKSignedClinicalDataSubject birthSex](v5, "birthSex");
      v59 = objc_claimAutoreleasedReturnValue();
      v8 = birthSex == (NSString *)v59;
      if (birthSex != (NSString *)v59)
      {
        birthSex = (NSString *)v59;
        -[HKSignedClinicalDataSubject birthSex](v5, "birthSex");
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v61 = self->_birthSex;
          v103 = (void *)v60;
          -[HKSignedClinicalDataSubject birthSex](v5, "birthSex");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[NSString isEqualToString:](v61, "isEqualToString:", v62);

          if (v69 == v72)
          {

          }
          else
          {

          }
LABEL_143:
          if (v73 != v76)
          {

          }
          if (v77 != v80)
          {

          }
          if (v81 != v84)
          {

          }
          if (v89 != v92)
          {

          }
          if (v94 != v97)
          {

          }
          if (v99 != v101)
          {

          }
          if (birthDate != v21)
          {

          }
          v19 = v104;
          if (fullName == v17)
            goto LABEL_126;
          goto LABEL_73;
        }
      }

      v63 = v72;
      if (v69 == v72)
      {

        v64 = v76;
        v65 = v73;
        v27 = v101;
        if (v73 != v76)
          goto LABEL_100;
        goto LABEL_140;
      }

      v27 = v101;
LABEL_99:

      v64 = v76;
      v65 = v73;
      if (v73 != v76)
        goto LABEL_100;
LABEL_140:

      if (v77 != v80)
      {
LABEL_67:

        v33 = v99;
        if (v81 != v84)
        {
LABEL_68:

          if (v89 != v92)
          {
LABEL_69:

            if (v94 != v97)
            {
LABEL_70:

              if (v33 != v27)
              {
LABEL_71:

                v29 = birthDate == v21;
                v19 = v104;
                if (!v29)
                {
LABEL_72:

                  if (fullName != v17)
                    goto LABEL_73;
LABEL_126:

                  goto LABEL_127;
                }
LABEL_122:

                if (fullName == v17)
                  goto LABEL_124;
                goto LABEL_123;
              }
LABEL_119:

              v29 = birthDate == v21;
              v19 = v104;
              v34 = v102;
              if (!v29)
              {
LABEL_120:

                if (!v34)
                  goto LABEL_122;
                goto LABEL_121;
              }
              goto LABEL_128;
            }
LABEL_116:

            v29 = v33 == v27;
            v39 = v96;
            if (!v29)
            {
LABEL_117:

              if (!v39)
                goto LABEL_119;
              goto LABEL_118;
            }
            goto LABEL_130;
          }
LABEL_113:

          if (v94 != v97)
          {
LABEL_114:

            if (!v91)
              goto LABEL_116;
            goto LABEL_115;
          }
          goto LABEL_132;
        }
LABEL_110:

        if (v89 != v92)
        {
LABEL_111:

          if (!v87)
            goto LABEL_113;
          goto LABEL_112;
        }
        goto LABEL_134;
      }
LABEL_107:

      v33 = v99;
      v53 = v82;
      if (v81 != v84)
      {
LABEL_108:
        v83 = v53;

        if (!v83)
          goto LABEL_110;
        goto LABEL_109;
      }
      goto LABEL_136;
    }
    v8 = 0;
  }
LABEL_127:

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  NSString *fullName;
  void *v7;
  NSString *gender;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[NSArray hk_map:](self->_identifiers, "hk_map:", &__block_literal_global_93);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  fullName = self->_fullName;
  -[HKMedicalDate description](self->_birthDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  gender = self->_gender;
  -[NSArray componentsJoinedByString:](self->_emailAddresses, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_phoneNumbers, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_addresses, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Full Name: %@, Birth Date: %@, Gender: %@, Email Addresses: %@, Phone Numbers: %@, Identifiers: %@, Addresses: %@, Marital Status: %@, Race: %@, Ethnicity: %@, Birth Sex: %@"), fullName, v7, gender, v9, v10, v4, v11, self->_maritalStatus, self->_race, self->_ethnicity, self->_birthSex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __47__HKSignedClinicalDataSubject_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "componentsJoinedByString:", CFSTR(": "));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSignedClinicalDataSubject)initWithCoder:(id)a3
{
  id v4;
  HKSignedClinicalDataSubject *v5;
  uint64_t v6;
  NSString *fullName;
  uint64_t v8;
  HKMedicalDate *birthDate;
  uint64_t v10;
  NSString *gender;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *emailAddresses;
  uint64_t v17;
  NSArray *phoneNumbers;
  uint64_t v19;
  NSArray *identifiers;
  uint64_t v21;
  NSArray *addresses;
  uint64_t v23;
  NSString *maritalStatus;
  uint64_t v25;
  NSString *race;
  uint64_t v27;
  NSString *ethnicity;
  uint64_t v29;
  NSString *birthSex;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HKSignedClinicalDataSubject;
  v5 = -[HKSignedClinicalDataSubject init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullName"));
    v6 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("birthDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    birthDate = v5->_birthDate;
    v5->_birthDate = (HKMedicalDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gender"));
    v10 = objc_claimAutoreleasedReturnValue();
    gender = v5->_gender;
    v5->_gender = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("emailAddresses"));
    v15 = objc_claimAutoreleasedReturnValue();
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("phoneNumbers"));
    v17 = objc_claimAutoreleasedReturnValue();
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("identifiersNumbers"));
    v19 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("addressesNumbers"));
    v21 = objc_claimAutoreleasedReturnValue();
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maritalStatusNumbers"));
    v23 = objc_claimAutoreleasedReturnValue();
    maritalStatus = v5->_maritalStatus;
    v5->_maritalStatus = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("raceNumbers"));
    v25 = objc_claimAutoreleasedReturnValue();
    race = v5->_race;
    v5->_race = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ethnicityNumbers"));
    v27 = objc_claimAutoreleasedReturnValue();
    ethnicity = v5->_ethnicity;
    v5->_ethnicity = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("birthSexNumbers"));
    v29 = objc_claimAutoreleasedReturnValue();
    birthSex = v5->_birthSex;
    v5->_birthSex = (NSString *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fullName;
  id v5;

  fullName = self->_fullName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fullName, CFSTR("fullName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthDate, CFSTR("birthDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gender, CFSTR("gender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifiers, CFSTR("identifiersNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addresses, CFSTR("addressesNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maritalStatus, CFSTR("maritalStatusNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_race, CFSTR("raceNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ethnicity, CFSTR("ethnicityNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthSex, CFSTR("birthSexNumbers"));

}

- (NSString)fullName
{
  return self->_fullName;
}

- (HKMedicalDate)birthDate
{
  return self->_birthDate;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSString)maritalStatus
{
  return self->_maritalStatus;
}

- (NSString)race
{
  return self->_race;
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (NSString)birthSex
{
  return self->_birthSex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_birthSex, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_race, 0);
  objc_storeStrong((id *)&self->_maritalStatus, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_birthDate, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
