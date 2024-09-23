@implementation _HKClinicalContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_HKClinicalContact name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKClinicalContact phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_HKClinicalContact)initWithCoder:(id)a3
{
  id v4;
  _HKClinicalContact *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[_HKClinicalContact init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKClinicalContactNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKClinicalContact setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKClinicalContactNameContactIdentifierKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKClinicalContact setNameContactIdentifier:](v5, "setNameContactIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKEClinicalContactPhoneNumberKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKClinicalContact setPhoneNumber:](v5, "setPhoneNumber:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKClinicalContactPhoneNumberContactIdentifierKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKClinicalContact setPhoneNumberContactIdentifier:](v5, "setPhoneNumberContactIdentifier:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKClinicalContactPhoneNumberLabelKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKClinicalContact setPhoneNumberLabel:](v5, "setPhoneNumberLabel:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKClinicalContactRelationshipKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKClinicalContact setRelationship:](v5, "setRelationship:", v11);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v62;
  void *v63;
  void *v64;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_HKClinicalContact name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      objc_msgSend(v5, "name");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v11 = 0;
        goto LABEL_75;
      }
      v3 = (void *)v8;
      -[_HKClinicalContact name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v9;
      if (!objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = 0;
LABEL_74:

        goto LABEL_75;
      }
      v63 = v10;
    }
    -[_HKClinicalContact nameContactIdentifier](self, "nameContactIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nameContactIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      objc_msgSend(v5, "nameContactIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_32;
      v15 = (void *)v14;
      v60 = v3;
      -[_HKClinicalContact nameContactIdentifier](self, "nameContactIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nameContactIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", v17) & 1) == 0)
      {

        v11 = 0;
        v10 = v63;
        v3 = v60;
        if (v6 == v7)
          goto LABEL_75;
        goto LABEL_74;
      }
      v56 = v16;
      v57 = v15;
      v58 = v17;
      v3 = v60;
    }
    -[_HKClinicalContact phoneNumber](self, "phoneNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v62 = v18;
    if (v18 == (void *)v19)
    {
      v59 = (void *)v19;
      goto LABEL_18;
    }
    objc_msgSend(v5, "phoneNumber");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v55 = (void *)v21;
      -[_HKClinicalContact phoneNumber](self, "phoneNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "phoneNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v22) & 1) != 0)
      {
        v51 = v18;
        v59 = v20;
        v50 = v22;
LABEL_18:
        -[_HKClinicalContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "phoneNumberContactIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 == v24)
        {
          v54 = v12;
LABEL_25:
          -[_HKClinicalContact phoneNumberLabel](self, "phoneNumberLabel");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "phoneNumberLabel");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27 == v53)
          {
            v48 = v24;
            v52 = v23;
            v61 = v3;
          }
          else
          {
            objc_msgSend(v5, "phoneNumberLabel");
            v28 = objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              v52 = v23;
              v11 = 0;
              v38 = v58;
              goto LABEL_52;
            }
            v43 = v27;
            v45 = (void *)v28;
            -[_HKClinicalContact phoneNumberLabel](self, "phoneNumberLabel");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "phoneNumberLabel");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v29, "isEqualToString:", v18) & 1) == 0)
            {

              v30 = v23;
              v11 = 0;
              if (v30 != v24)
              {
LABEL_67:
                v31 = v59;

                v12 = v54;
LABEL_68:

                v39 = v62;
                if (v62 == v31)
                {
LABEL_70:

                  if (v12 != v13)
                  {

                  }
                  goto LABEL_73;
                }
LABEL_69:

                goto LABEL_70;
              }
LABEL_47:

              v31 = v59;
              v39 = v62;
              v12 = v54;
              if (v62 == v59)
                goto LABEL_70;
              goto LABEL_69;
            }
            v42 = v29;
            v48 = v24;
            v52 = v23;
            v61 = v3;
            v27 = v43;
          }
          -[_HKClinicalContact relationship](self, "relationship");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "relationship");
          v33 = objc_claimAutoreleasedReturnValue();
          v11 = v32 == (void *)v33;
          if (v32 == (void *)v33)
          {

          }
          else
          {
            v34 = (void *)v33;
            objc_msgSend(v5, "relationship");
            v35 = objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v41 = v18;
              v44 = (void *)v35;
              -[_HKClinicalContact relationship](self, "relationship");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "relationship");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v36, "isEqualToString:", v37);

              if (v27 == v53)
              {

              }
              else
              {

              }
              v30 = v52;
              v24 = v48;
              v3 = v61;
              if (v52 != v48)
                goto LABEL_67;
              goto LABEL_47;
            }

          }
          if (v27 == v53)
          {

            v24 = v48;
            v3 = v61;
            v38 = v58;
            if (v52 == v48)
              goto LABEL_54;
            goto LABEL_53;
          }

          v3 = v61;
          v38 = v58;
          v24 = v48;
LABEL_52:

          if (v52 == v24)
          {
LABEL_54:

            if (v62 != v59)
            {

            }
            if (v54 != v13)
            {

            }
LABEL_73:
            v10 = v63;
            if (v6 != v7)
              goto LABEL_74;
LABEL_75:

            goto LABEL_76;
          }
LABEL_53:

          goto LABEL_54;
        }
        objc_msgSend(v5, "phoneNumberContactIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v30 = v23;
          v31 = v59;
          v11 = 0;
          goto LABEL_68;
        }
        v49 = (void *)v25;
        v54 = v12;
        -[_HKClinicalContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "phoneNumberContactIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqualToString:", v26) & 1) != 0)
        {
          v46 = v26;
          v47 = v18;
          goto LABEL_25;
        }

        if (v62 == v59)
        {

        }
        else
        {

        }
        if (v54 != v13)
        {

        }
LABEL_34:
        v11 = 0;
        goto LABEL_73;
      }

    }
    if (v12 == v13)
    {

      goto LABEL_33;
    }

LABEL_32:
LABEL_33:

    goto LABEL_34;
  }
  v11 = 0;
LABEL_76:

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
  -[_HKClinicalContact name](self, "name");
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
    -[_HKClinicalContact name](self, "name");
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
  -[_HKClinicalContact phoneNumber](self, "phoneNumber");
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
    -[_HKClinicalContact phoneNumber](self, "phoneNumber");
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
    -[_HKClinicalContact phoneNumberLabel](self, "phoneNumberLabel");
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
      -[_HKClinicalContact relationship](self, "relationship", v33);
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
      -[_HKClinicalContact phoneNumberLabel](self, "phoneNumberLabel");
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
      -[_HKClinicalContact relationship](self, "relationship", v21);
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
        -[_HKClinicalContact relationship](self, "relationship");
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
  id v10;

  v4 = a3;
  -[_HKClinicalContact name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HKClinicalContactNameKey"));

  -[_HKClinicalContact nameContactIdentifier](self, "nameContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HKClinicalContactNameContactIdentifierKey"));

  -[_HKClinicalContact phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HKEClinicalContactPhoneNumberKey"));

  -[_HKClinicalContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HKClinicalContactPhoneNumberContactIdentifierKey"));

  -[_HKClinicalContact phoneNumberLabel](self, "phoneNumberLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HKClinicalContactPhoneNumberLabelKey"));

  -[_HKClinicalContact relationship](self, "relationship");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HKClinicalContactRelationshipKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _HKClinicalContact *v4;
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

  v4 = -[_HKClinicalContact init](+[_HKClinicalContact allocWithZone:](_HKClinicalContact, "allocWithZone:", a3), "init");
  -[_HKClinicalContact name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_HKClinicalContact setName:](v4, "setName:", v6);

  -[_HKClinicalContact nameContactIdentifier](self, "nameContactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[_HKClinicalContact setNameContactIdentifier:](v4, "setNameContactIdentifier:", v8);

  -[_HKClinicalContact phoneNumber](self, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_HKClinicalContact setPhoneNumber:](v4, "setPhoneNumber:", v10);

  -[_HKClinicalContact phoneNumberContactIdentifier](self, "phoneNumberContactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[_HKClinicalContact setPhoneNumberContactIdentifier:](v4, "setPhoneNumberContactIdentifier:", v12);

  -[_HKClinicalContact phoneNumberLabel](self, "phoneNumberLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[_HKClinicalContact setPhoneNumberLabel:](v4, "setPhoneNumberLabel:", v14);

  -[_HKClinicalContact relationship](self, "relationship");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[_HKClinicalContact setRelationship:](v4, "setRelationship:", v16);

  return v4;
}

+ (id)clinicalContactWithContact:(id)a3 property:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _HKClinicalContact *v9;
  void *v10;
  void *v11;
  _HKClinicalContact *v12;
  _QWORD v14[4];
  _HKClinicalContact *v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contact");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = objc_alloc_init(_HKClinicalContact);
  _HKFormattedMedicalIDNameForContact(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKClinicalContact setName:](v9, "setName:", v10);

  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKClinicalContact setNameContactIdentifier:](v9, "setNameContactIdentifier:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58___HKClinicalContact_clinicalContactWithContact_property___block_invoke;
  v14[3] = &unk_1E37F2FE0;
  v12 = v9;
  v15 = v12;
  _HKMedicalIDPhoneNumberForContact(v5, v7, v14);

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)nameContactIdentifier
{
  return self->_nameContactIdentifier;
}

- (void)setNameContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier;
}

- (void)setPhoneNumberContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
