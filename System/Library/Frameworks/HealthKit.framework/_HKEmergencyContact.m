@implementation _HKEmergencyContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKEmergencyContact)init
{
  _HKEmergencyContact *v2;
  _HKEmergencyContact *v3;
  NSNumber *nameRecordID;
  NSNumber *phoneNumberPropertyID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKEmergencyContact;
  v2 = -[_HKEmergencyContact init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    nameRecordID = v2->_nameRecordID;
    v2->_nameRecordID = (NSNumber *)&unk_1E3895530;

    phoneNumberPropertyID = v3->_phoneNumberPropertyID;
    v3->_phoneNumberPropertyID = (NSNumber *)&unk_1E3895530;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_HKEmergencyContact name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_HKEmergencyContact)initWithCoder:(id)a3
{
  id v4;
  _HKEmergencyContact *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[_HKEmergencyContact init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactPhoneNumberKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setPhoneNumber:](v5, "setPhoneNumber:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactRelationshipKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setRelationship:](v5, "setRelationship:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactNameRecordIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setNameRecordID:](v5, "setNameRecordID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactPhoneNumberPropertyIDKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setPhoneNumberPropertyID:](v5, "setPhoneNumberPropertyID:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactNameContactIdentifierKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setNameContactIdentifier:](v5, "setNameContactIdentifier:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactPhoneNumberContactIdentifierKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setPhoneNumberContactIdentifier:](v5, "setPhoneNumberContactIdentifier:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEmergencyContactPhoneNumberLabelKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKEmergencyContact setPhoneNumberLabel:](v5, "setPhoneNumberLabel:", v13);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_HKEmergencyContact name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      objc_msgSend(v6, "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v11 = 0;
LABEL_88:

        goto LABEL_89;
      }
      -[_HKEmergencyContact name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = 0;
LABEL_51:

        goto LABEL_88;
      }
      v85 = v10;
      v86 = v9;
    }
    -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phoneNumber");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v89)
    {
      v81 = 0;
    }
    else
    {
      objc_msgSend(v6, "phoneNumber");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {

        v11 = 0;
        goto LABEL_86;
      }
      v14 = (void *)v13;
      -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumber");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqualToString:"))
      {
        v11 = 0;
LABEL_49:

        goto LABEL_50;
      }
      v81 = v12 != v89;
      v79 = v14;
    }
    -[_HKEmergencyContact relationship](self, "relationship");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relationship");
    v87 = v15;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != v88;
    if (v15 != v88)
    {
      objc_msgSend(v6, "relationship");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        v11 = 0;
        if (v12 != v89)
        {
          LOBYTE(v27) = 1;
          v28 = v79;
          goto LABEL_83;
        }
        v27 = 0;
        v28 = v79;
LABEL_91:
        if (!v27)
          goto LABEL_85;
        goto LABEL_84;
      }
      v75 = (void *)v17;
      -[_HKEmergencyContact relationship](self, "relationship");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "relationship");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v18;
      if (!objc_msgSend(v18, "isEqualToString:"))
      {
        v83 = v3;
        v19 = v12;
        v11 = 0;
        v21 = v87;
        v20 = v88;
        goto LABEL_48;
      }
    }
    -[_HKEmergencyContact nameRecordID](self, "nameRecordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nameRecordID");
    v23 = objc_claimAutoreleasedReturnValue();
    v72 = v22 != (void *)v23;
    v80 = (void *)v23;
    v83 = v3;
    if (v22 == (void *)v23)
    {
      v71 = v4;
    }
    else
    {
      objc_msgSend(v6, "nameRecordID");
      v24 = objc_claimAutoreleasedReturnValue();
      v19 = v12;
      if (!v24)
      {

        v11 = 0;
        v21 = v87;
        v20 = v88;
        if (v87 != v88)
        {
          LOBYTE(v34) = 1;
          goto LABEL_80;
        }
        v34 = 0;
        goto LABEL_93;
      }
      v25 = v16;
      v68 = (void *)v24;
      -[_HKEmergencyContact nameRecordID](self, "nameRecordID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nameRecordID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v26;
      if (!objc_msgSend(v26, "isEqual:"))
      {
        v78 = v22;
        v11 = 0;
        v21 = v87;
        v20 = v88;
        goto LABEL_47;
      }
      v71 = v4;
      v16 = v25;
      v12 = v19;
      v3 = v83;
    }
    -[_HKEmergencyContact phoneNumberPropertyID](self, "phoneNumberPropertyID");
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phoneNumberPropertyID");
    v73 = (void *)v29;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == (_QWORD)v74;
    v31 = v29 != (_QWORD)v74;
    v78 = v22;
    if (!v30)
    {
      objc_msgSend(v6, "phoneNumberPropertyID");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v67 = v16;

        v40 = v22;
        v11 = 0;
        v4 = v71;
        v21 = v87;
        v20 = v88;
        v19 = v12;
        if (v40 != v80)
        {
          LOBYTE(v41) = 1;
          goto LABEL_77;
        }
        v41 = 0;
LABEL_95:
        if (!v41)
        {
LABEL_79:

          v34 = v67;
          if (v21 != v20)
          {
LABEL_80:

            if (!v34)
              goto LABEL_82;
            goto LABEL_81;
          }
LABEL_93:
          if (v34)
LABEL_81:

LABEL_82:
          v12 = v19;
          v30 = v19 == v89;
          v28 = v79;
          v27 = v81;
          v3 = v83;
          if (!v30)
          {
LABEL_83:

            if (!v27)
            {
LABEL_85:

LABEL_86:
              if (v7 != v8)
              {

                goto LABEL_88;
              }
              goto LABEL_89;
            }
LABEL_84:

            goto LABEL_85;
          }
          goto LABEL_91;
        }
LABEL_78:

        goto LABEL_79;
      }
      v66 = v31;
      v61 = (void *)v32;
      -[_HKEmergencyContact phoneNumberPropertyID](self, "phoneNumberPropertyID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumberPropertyID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        v67 = v16;
        v11 = 0;
        v21 = v87;
        v20 = v88;
LABEL_46:
        v19 = v12;

        v4 = v71;
        if (v78 == v80)
          goto LABEL_79;
LABEL_47:

        if (v21 != v20)
        {
LABEL_48:

          v12 = v19;
          v30 = v19 == v89;
          v14 = v79;
          v3 = v83;
          if (!v30)
            goto LABEL_49;
          goto LABEL_85;
        }
        goto LABEL_82;
      }
      v31 = v66;
    }
    -[_HKEmergencyContact nameContactIdentifier](self, "nameContactIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nameContactIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v35;
    if (v35 != v64)
    {
      objc_msgSend(v6, "nameContactIdentifier");
      v36 = objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        v67 = v16;

        v11 = 0;
        v21 = v87;
        v20 = v88;
        if (v73 != v74)
          goto LABEL_68;
LABEL_71:
        if (v31)
          goto LABEL_72;
LABEL_75:
        v19 = v12;
LABEL_76:

        v4 = v71;
        v41 = v72;
        if (v78 != v80)
        {
LABEL_77:

          if (!v41)
            goto LABEL_79;
          goto LABEL_78;
        }
        goto LABEL_95;
      }
      v58 = (void *)v36;
      -[_HKEmergencyContact nameContactIdentifier](self, "nameContactIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nameContactIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v37;
      if (!objc_msgSend(v37, "isEqualToString:"))
      {
        v67 = v16;
        v11 = 0;
        v21 = v87;
        v20 = v88;
        v39 = v64;
        v38 = v65;
LABEL_66:

        if (v73 != v74)
        {
          LOBYTE(v31) = 1;
LABEL_68:

          if (!v31)
            goto LABEL_75;
LABEL_72:
          v19 = v12;

          goto LABEL_76;
        }
        v31 = 0;
        goto LABEL_71;
      }
    }
    -[_HKEmergencyContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phoneNumberContactIdentifier");
    v59 = v42;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 != v60)
    {
      objc_msgSend(v6, "phoneNumberContactIdentifier");
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        v67 = v16;
        v11 = 0;
        v21 = v87;
        v20 = v88;
        goto LABEL_65;
      }
      v55 = (void *)v43;
      -[_HKEmergencyContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumberContactIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v44;
      if ((objc_msgSend(v44, "isEqualToString:", v42) & 1) == 0)
      {

        v11 = 0;
LABEL_99:
        if (v65 != v64)
        {

        }
        if (v73 != v74)
        {

        }
        if (v78 != v80)
        {

        }
        if (v87 != v88)
        {

        }
        if (v12 != v89)
        {

        }
LABEL_50:

        v10 = v85;
        v9 = v86;
        if (v7 != v8)
          goto LABEL_51;
LABEL_89:

        goto LABEL_90;
      }
    }
    -[_HKEmergencyContact phoneNumberLabel](self, "phoneNumberLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phoneNumberLabel");
    v46 = objc_claimAutoreleasedReturnValue();
    v11 = v45 == (void *)v46;
    if (v45 == (void *)v46)
    {
      v51 = v42;
      v67 = v16;

    }
    else
    {
      v53 = v42;
      v47 = (void *)v46;
      objc_msgSend(v6, "phoneNumberLabel");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v82 = (void *)v48;
        -[_HKEmergencyContact phoneNumberLabel](self, "phoneNumberLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "phoneNumberLabel");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v49, "isEqualToString:", v50);

        if (v59 == v60)
        {

        }
        else
        {

        }
        goto LABEL_99;
      }
      v51 = v53;
      v67 = v16;

    }
    v42 = v59;
    if (v59 == v60)
    {

      v39 = v64;
      v38 = v65;
      v21 = v87;
      v20 = v88;
      if (v65 != v64)
        goto LABEL_66;
LABEL_74:

      if (v73 == v74)
        goto LABEL_75;
      goto LABEL_46;
    }

    v21 = v87;
    v20 = v88;
LABEL_65:

    v39 = v64;
    v38 = v65;
    if (v65 != v64)
      goto LABEL_66;
    goto LABEL_74;
  }
  v11 = 0;
LABEL_90:

  return v11;
}

- (BOOL)isEqualToSyncedContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v33;
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

  v8 = a3;
  -[_HKEmergencyContact name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_msgSend(v8, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = 0;
      goto LABEL_40;
    }
    v5 = (void *)v11;
    -[_HKEmergencyContact name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v4))
    {
      v12 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "phoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v14)
  {
    v43 = v13;
    goto LABEL_11;
  }
  objc_msgSend(v8, "phoneNumber");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v45 = v4;
    v16 = v3;
    v17 = v5;
    v41 = (void *)v15;
    -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v18) & 1) == 0)
    {

      v12 = 0;
      v5 = v17;
      v3 = v16;
      v4 = v45;
      if (v9 == v10)
        goto LABEL_40;
      goto LABEL_39;
    }
    v37 = v18;
    v43 = v13;
    v5 = v17;
    v3 = v16;
    v4 = v45;
LABEL_11:
    -[_HKEmergencyContact phoneNumberLabel](self, "phoneNumberLabel");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneNumberLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v19;
    v40 = v6;
    if ((void *)v19 == v44)
    {
      v38 = v3;
      v39 = v14;
      v46 = v4;
      -[_HKEmergencyContact relationship](self, "relationship", v33);
    }
    else
    {
      objc_msgSend(v8, "phoneNumberLabel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v12 = 0;
        v29 = (void *)v19;
        goto LABEL_26;
      }
      v39 = v14;
      v36 = (void *)v20;
      -[_HKEmergencyContact phoneNumberLabel](self, "phoneNumberLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "phoneNumberLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", v14) & 1) == 0)
      {

        v12 = 0;
        v13 = v43;
        v14 = v39;
        v31 = v43 == v39;
LABEL_35:
        if (!v31)
        {

        }
        goto LABEL_37;
      }
      v46 = v4;
      v38 = v3;
      -[_HKEmergencyContact relationship](self, "relationship", v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relationship");
    v23 = objc_claimAutoreleasedReturnValue();
    v12 = v22 == (void *)v23;
    if (v22 == (void *)v23)
    {

      v29 = v42;
      if (v42 == v44)
        goto LABEL_31;
    }
    else
    {
      v24 = (void *)v23;
      v35 = v5;
      objc_msgSend(v8, "relationship");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        -[_HKEmergencyContact relationship](self, "relationship");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "relationship");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v27, "isEqualToString:", v28);

        if (v42 == v44)
        {

        }
        else
        {

        }
        v13 = v43;
        v3 = v38;
        v14 = v39;
        v31 = v43 == v39;
        v5 = v35;
        v4 = v46;
        goto LABEL_35;
      }

      v29 = v42;
      if (v42 == v44)
      {
LABEL_31:

        v30 = v43;
        v3 = v38;
        v14 = v39;
        v4 = v46;
        if (v43 == v39)
          goto LABEL_28;
        goto LABEL_27;
      }
    }

    v3 = v38;
    v14 = v39;
    v4 = v46;
LABEL_26:

    v30 = v43;
    if (v43 == v14)
    {
LABEL_28:

      goto LABEL_38;
    }
LABEL_27:

    goto LABEL_28;
  }
  v12 = 0;
LABEL_37:

LABEL_38:
  if (v9 != v10)
    goto LABEL_39;
LABEL_40:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[_HKEmergencyContact name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HKEmergencyContactNameKey"));

  -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HKEmergencyContactPhoneNumberKey"));

  -[_HKEmergencyContact relationship](self, "relationship");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HKEmergencyContactRelationshipKey"));

  -[_HKEmergencyContact nameRecordID](self, "nameRecordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HKEmergencyContactNameRecordIDKey"));

  -[_HKEmergencyContact phoneNumberPropertyID](self, "phoneNumberPropertyID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HKEmergencyContactPhoneNumberPropertyIDKey"));

  -[_HKEmergencyContact nameContactIdentifier](self, "nameContactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HKEmergencyContactNameContactIdentifierKey"));

  -[_HKEmergencyContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HKEmergencyContactPhoneNumberContactIdentifierKey"));

  -[_HKEmergencyContact phoneNumberLabel](self, "phoneNumberLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HKEmergencyContactPhoneNumberLabelKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _HKEmergencyContact *v4;
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

  v4 = -[_HKEmergencyContact init](+[_HKEmergencyContact allocWithZone:](_HKEmergencyContact, "allocWithZone:", a3), "init");
  -[_HKEmergencyContact name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_HKEmergencyContact setName:](v4, "setName:", v6);

  -[_HKEmergencyContact phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[_HKEmergencyContact setPhoneNumber:](v4, "setPhoneNumber:", v8);

  -[_HKEmergencyContact relationship](self, "relationship");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_HKEmergencyContact setRelationship:](v4, "setRelationship:", v10);

  -[_HKEmergencyContact nameRecordID](self, "nameRecordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[_HKEmergencyContact setNameRecordID:](v4, "setNameRecordID:", v12);

  -[_HKEmergencyContact phoneNumberPropertyID](self, "phoneNumberPropertyID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[_HKEmergencyContact setPhoneNumberPropertyID:](v4, "setPhoneNumberPropertyID:", v14);

  -[_HKEmergencyContact nameContactIdentifier](self, "nameContactIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[_HKEmergencyContact setNameContactIdentifier:](v4, "setNameContactIdentifier:", v16);

  -[_HKEmergencyContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[_HKEmergencyContact setPhoneNumberContactIdentifier:](v4, "setPhoneNumberContactIdentifier:", v18);

  -[_HKEmergencyContact phoneNumberLabel](self, "phoneNumberLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[_HKEmergencyContact setPhoneNumberLabel:](v4, "setPhoneNumberLabel:", v20);

  return v4;
}

+ (id)emergencyContactWithContact:(id)a3 property:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _HKEmergencyContact *v9;
  void *v10;
  void *v11;
  _HKEmergencyContact *v12;
  _QWORD v14[4];
  _HKEmergencyContact *v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contact");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = objc_alloc_init(_HKEmergencyContact);
  _HKFormattedMedicalIDNameForContact(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyContact setName:](v9, "setName:", v10);

  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEmergencyContact setNameContactIdentifier:](v9, "setNameContactIdentifier:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60___HKEmergencyContact_emergencyContactWithContact_property___block_invoke;
  v14[3] = &unk_1E37F2FE0;
  v12 = v9;
  v15 = v12;
  _HKMedicalIDPhoneNumberForContact(v5, v7, v14);

  return v12;
}

+ (id)emergencyContactUsingSimCardNumberWithContact:(id)a3 property:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[_HKEmergencyContact emergencyContactWithContact:property:](_HKEmergencyContact, "emergencyContactWithContact:property:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMedicalIDSimNumberForContact(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "setPhoneNumber:", v7);

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)nameRecordID
{
  return self->_nameRecordID;
}

- (void)setNameRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_nameRecordID, a3);
}

- (NSString)nameContactIdentifier
{
  return self->_nameContactIdentifier;
}

- (void)setNameContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)phoneNumberPropertyID
{
  return self->_phoneNumberPropertyID;
}

- (void)setPhoneNumberPropertyID:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberPropertyID, a3);
}

- (NSString)phoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier;
}

- (void)setPhoneNumberContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberPropertyID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);
  objc_storeStrong((id *)&self->_nameRecordID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
