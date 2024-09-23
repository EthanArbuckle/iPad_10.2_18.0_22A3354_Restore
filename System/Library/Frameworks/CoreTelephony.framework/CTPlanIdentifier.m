@implementation CTPlanIdentifier

- (CTPlanIdentifier)initWithIccid:(id)a3 carrierName:(id)a4 phoneNumber:(id)a5 countryCode:(id)a6 label:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CTPlanIdentifier *v26;
  uint64_t v27;
  NSString *iccid;
  uint64_t v29;
  NSString *carrierName;
  uint64_t v31;
  NSString *phoneNumber;
  uint64_t v33;
  NSString *countryCode;
  uint64_t v35;
  NSString *label;
  uint64_t v37;
  NSString *mcc;
  uint64_t v39;
  NSString *mnc;
  uint64_t v41;
  NSString *gid1;
  uint64_t v43;
  NSString *gid2;
  objc_super v46;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v46.receiver = self;
  v46.super_class = (Class)CTPlanIdentifier;
  v26 = -[CTPlanIdentifier init](&v46, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v17, "copy");
    iccid = v26->_iccid;
    v26->_iccid = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    carrierName = v26->_carrierName;
    v26->_carrierName = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    phoneNumber = v26->_phoneNumber;
    v26->_phoneNumber = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    countryCode = v26->_countryCode;
    v26->_countryCode = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    label = v26->_label;
    v26->_label = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    mcc = v26->_mcc;
    v26->_mcc = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    mnc = v26->_mnc;
    v26->_mnc = (NSString *)v39;

    v41 = objc_msgSend(v24, "copy");
    gid1 = v26->_gid1;
    v26->_gid1 = (NSString *)v41;

    v43 = objc_msgSend(v25, "copy");
    gid2 = v26->_gid2;
    v26->_gid2 = (NSString *)v43;

  }
  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPlanIdentifier iccid](self, "iccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" iccid=%@"), v4);

  -[CTPlanIdentifier carrierName](self, "carrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" carrierName=%@"), v5);

  -[CTPlanIdentifier phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" phoneNumber=%@"), v6);

  -[CTPlanIdentifier countryCode](self, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" countryCode=%@"), v7);

  -[CTPlanIdentifier label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" label=%@"), v8);

  -[CTPlanIdentifier mcc](self, "mcc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" mcc=%@"), v9);

  -[CTPlanIdentifier mnc](self, "mnc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" mnc=%@"), v10);

  -[CTPlanIdentifier gid1](self, "gid1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" gid1=%@"), v11);

  -[CTPlanIdentifier gid2](self, "gid2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" gid2=%@"), v12);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CTPlanIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v5 = (CTPlanIdentifier *)a3;
  if (v5 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTPlanIdentifier iccid](self, "iccid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier iccid](v5, "iccid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[CTPlanIdentifier iccid](self, "iccid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier iccid](v5, "iccid");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v8;
        if (!objc_msgSend(v8, "isEqualToString:", v3))
        {
          v9 = 0;
          goto LABEL_49;
        }
      }
      -[CTPlanIdentifier carrierName](self, "carrierName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier carrierName](v5, "carrierName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[CTPlanIdentifier carrierName](self, "carrierName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier carrierName](v5, "carrierName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqualToString:", v13))
        {
          v9 = 0;
LABEL_47:

LABEL_48:
          if (v6 == v7)
          {
LABEL_50:

            goto LABEL_51;
          }
LABEL_49:

          goto LABEL_50;
        }
        v61 = v13;
        v62 = v12;
      }
      -[CTPlanIdentifier phoneNumber](self, "phoneNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier phoneNumber](v5, "phoneNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        v16 = v3;
        -[CTPlanIdentifier phoneNumber](self, "phoneNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier phoneNumber](v5, "phoneNumber");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v17;
        if (!objc_msgSend(v17, "isEqualToString:"))
        {
          v9 = 0;
          v3 = v16;
LABEL_45:

LABEL_46:
          v13 = v61;
          v12 = v62;
          if (v10 == v11)
            goto LABEL_48;
          goto LABEL_47;
        }
        v3 = v16;
      }
      -[CTPlanIdentifier countryCode](self, "countryCode");
      v18 = objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier countryCode](v5, "countryCode");
      v58 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v18;
      if (v18 != v58)
      {
        -[CTPlanIdentifier countryCode](self, "countryCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier countryCode](v5, "countryCode");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v19;
        if (!objc_msgSend(v19, "isEqualToString:"))
        {
          v9 = 0;
          v20 = (void *)v58;
LABEL_43:

LABEL_44:
          if (v14 == v15)
            goto LABEL_46;
          goto LABEL_45;
        }
      }
      -[CTPlanIdentifier label](self, "label");
      v21 = objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier label](v5, "label");
      v57 = (void *)v21;
      v54 = objc_claimAutoreleasedReturnValue();
      if (v21 != v54)
      {
        -[CTPlanIdentifier label](self, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier label](v5, "label");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v22;
        if (!objc_msgSend(v22, "isEqualToString:"))
        {
          v9 = 0;
          v23 = (void *)v54;
LABEL_41:

LABEL_42:
          v20 = (void *)v58;
          if (v63 == (void *)v58)
            goto LABEL_44;
          goto LABEL_43;
        }
      }
      -[CTPlanIdentifier mcc](self, "mcc");
      v24 = objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier mcc](v5, "mcc");
      v50 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v24;
      if (v24 != v50)
      {
        -[CTPlanIdentifier mcc](self, "mcc");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier mcc](v5, "mcc");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v25;
        if (!objc_msgSend(v25, "isEqualToString:"))
        {
          v9 = 0;
          v26 = (void *)v50;
LABEL_39:

LABEL_40:
          v23 = (void *)v54;
          if (v57 == (void *)v54)
            goto LABEL_42;
          goto LABEL_41;
        }
      }
      -[CTPlanIdentifier mnc](self, "mnc");
      v27 = objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier mnc](v5, "mnc");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v27;
      if (v27 != v48)
      {
        -[CTPlanIdentifier mnc](self, "mnc");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier mnc](v5, "mnc");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v28;
        if (!objc_msgSend(v28, "isEqualToString:"))
        {
          v9 = 0;
          v29 = (void *)v48;
LABEL_37:

LABEL_38:
          v26 = (void *)v50;
          if (v53 == (void *)v50)
            goto LABEL_40;
          goto LABEL_39;
        }
      }
      -[CTPlanIdentifier gid1](self, "gid1");
      v30 = objc_claimAutoreleasedReturnValue();
      -[CTPlanIdentifier gid1](v5, "gid1");
      v45 = (void *)v30;
      v42 = objc_claimAutoreleasedReturnValue();
      if (v30 == v42
        || (-[CTPlanIdentifier gid1](self, "gid1"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTPlanIdentifier gid1](v5, "gid1"),
            v40 = (void *)objc_claimAutoreleasedReturnValue(),
            v41 = v31,
            objc_msgSend(v31, "isEqualToString:")))
      {
        -[CTPlanIdentifier gid2](self, "gid2");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanIdentifier gid2](v5, "gid2");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v33 == (void *)v34)
        {

          v9 = 1;
        }
        else
        {
          v39 = (void *)v34;
          -[CTPlanIdentifier gid2](self, "gid2");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTPlanIdentifier gid2](v5, "gid2");
          v38 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v37, "isEqualToString:", v35);

        }
        v32 = (void *)v42;
        if (v45 == (void *)v42)
        {
LABEL_36:

          v29 = (void *)v48;
          if (v49 == (void *)v48)
            goto LABEL_38;
          goto LABEL_37;
        }
      }
      else
      {
        v9 = 0;
        v32 = (void *)v42;
      }

      goto LABEL_36;
    }
    v9 = 0;
  }
LABEL_51:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanIdentifier)initWithCoder:(id)a3
{
  id v4;
  CTPlanIdentifier *v5;
  uint64_t v6;
  NSString *iccid;
  uint64_t v8;
  NSString *carrierName;
  uint64_t v10;
  NSString *phoneNumber;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSString *label;
  uint64_t v16;
  NSString *mcc;
  uint64_t v18;
  NSString *mnc;
  uint64_t v20;
  NSString *gid1;
  uint64_t v22;
  NSString *gid2;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTPlanIdentifier;
  v5 = -[CTPlanIdentifier init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v6 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierName"));
    v8 = objc_claimAutoreleasedReturnValue();
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v14 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcc"));
    v16 = objc_claimAutoreleasedReturnValue();
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnc"));
    v18 = objc_claimAutoreleasedReturnValue();
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid1"));
    v20 = objc_claimAutoreleasedReturnValue();
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid2"));
    v22 = objc_claimAutoreleasedReturnValue();
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *iccid;
  id v5;

  iccid = self->_iccid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", iccid, CFSTR("iccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_carrierName, CFSTR("carrierName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mcc, CFSTR("mcc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mnc, CFSTR("mnc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gid1, CFSTR("gid1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gid2, CFSTR("gid2"));

}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  objc_storeStrong((id *)&self->_iccid, a3);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierName, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
  objc_storeStrong((id *)&self->_mcc, a3);
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
  objc_storeStrong((id *)&self->_mnc, a3);
}

- (NSString)gid1
{
  return self->_gid1;
}

- (void)setGid1:(id)a3
{
  objc_storeStrong((id *)&self->_gid1, a3);
}

- (NSString)gid2
{
  return self->_gid2;
}

- (void)setGid2:(id)a3
{
  objc_storeStrong((id *)&self->_gid2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end
