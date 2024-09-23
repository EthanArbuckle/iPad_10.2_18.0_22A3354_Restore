@implementation CTPNRContextInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", isReady=%d"), -[CTPNRContextInfo isReady](self, "isReady"));
  -[CTPNRContextInfo plmn](self, "plmn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", plmn=%@"), v4);

  -[CTPNRContextInfo imsi](self, "imsi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", imsi=%@"), v5);

  -[CTPNRContextInfo phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber=%@"), v6);

  -[CTPNRContextInfo phoneNumberOnSIM](self, "phoneNumberOnSIM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumberOnSIM=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTPNRContextInfo)init
{
  CTPNRContextInfo *v2;
  CTPNRContextInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTPNRContextInfo;
  v2 = -[CTPNRContextInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CTPNRContextInfo setIsReady:](v2, "setIsReady:", 0);
  return v3;
}

- (BOOL)isEqualToPNRContextInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;

  v8 = a3;
  v9 = -[CTPNRContextInfo isReady](self, "isReady");
  if (v9 != objc_msgSend(v8, "isReady"))
  {
    v10 = 0;
    goto LABEL_43;
  }
  -[CTPNRContextInfo imsi](self, "imsi");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v8, "imsi");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v33 = 0;
      goto LABEL_9;
    }
  }
  -[CTPNRContextInfo imsi](self, "imsi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imsi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v33 = 1;
LABEL_9:
    -[CTPNRContextInfo plmn](self, "plmn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v8, "plmn"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTPNRContextInfo plmn](self, "plmn");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "plmn");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqualToString:"))
      {
        v10 = 0;
        goto LABEL_35;
      }
      v28 = v13;
      v31 = 1;
    }
    else
    {
      v31 = 0;
    }
    -[CTPNRContextInfo phoneNumber](self, "phoneNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v8, "phoneNumber"), (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = v6;
      -[CTPNRContextInfo phoneNumber](self, "phoneNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "phoneNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v16;
      if (!objc_msgSend(v16, "isEqualToString:"))
      {
        v10 = 0;
        v6 = v15;
LABEL_30:

        goto LABEL_31;
      }
      v27 = v3;
      v26 = 1;
      v6 = v15;
    }
    else
    {
      v27 = v3;
      v24 = 0;
      v26 = 0;
    }
    -[CTPNRContextInfo phoneNumberOnSIM](self, "phoneNumberOnSIM");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 || (objc_msgSend(v8, "phoneNumberOnSIM"), (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v25 = v6;
      -[CTPNRContextInfo phoneNumberOnSIM](self, "phoneNumberOnSIM");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "phoneNumberOnSIM");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v18, "isEqualToString:", v19);

      if (v17)
      {

        if (v26)
        {
          v6 = v25;
          v3 = v27;
          goto LABEL_30;
        }
        v6 = v25;
        v3 = v27;
LABEL_31:
        if (!v14)

        if (!v31)
          goto LABEL_36;
        v13 = v28;
LABEL_35:

LABEL_36:
        if (!v12)

        if (v33)
        {

        }
        goto LABEL_40;
      }
      v6 = v25;
      v3 = v27;
      v20 = v26;
      v21 = (void *)v23;
    }
    else
    {
      v21 = 0;
      v10 = 1;
      v3 = v27;
      v20 = v26;
    }

    if ((v20 & 1) != 0)
      goto LABEL_30;
    goto LABEL_31;
  }

  v10 = 0;
LABEL_40:
  if (!v11)

LABEL_43:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTPNRContextInfo *v4;
  CTPNRContextInfo *v5;
  BOOL v6;

  v4 = (CTPNRContextInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTPNRContextInfo isEqualToPNRContextInfo:](self, "isEqualToPNRContextInfo:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTPNRContextInfo *v4;

  v4 = +[CTPNRContextInfo allocWithZone:](CTPNRContextInfo, "allocWithZone:", a3);
  -[CTPNRContextInfo setIsReady:](v4, "setIsReady:", self->_isReady);
  -[CTPNRContextInfo setImsi:](v4, "setImsi:", self->_imsi);
  -[CTPNRContextInfo setPlmn:](v4, "setPlmn:", self->_plmn);
  -[CTPNRContextInfo setPhoneNumber:](v4, "setPhoneNumber:", self->_phoneNumber);
  -[CTPNRContextInfo setPhoneNumberOnSIM:](v4, "setPhoneNumberOnSIM:", self->_phoneNumberOnSIM);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isReady;
  id v5;

  isReady = self->_isReady;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isReady, CFSTR("registered"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_plmn, CFSTR("plmn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imsi, CFSTR("imsi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phone_number"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumberOnSIM, CFSTR("phone_number_on_sim"));

}

- (CTPNRContextInfo)initWithCoder:(id)a3
{
  id v4;
  CTPNRContextInfo *v5;
  uint64_t v6;
  NSString *plmn;
  uint64_t v8;
  NSString *imsi;
  uint64_t v10;
  NSString *phoneNumber;
  uint64_t v12;
  NSString *phoneNumberOnSIM;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTPNRContextInfo;
  v5 = -[CTPNRContextInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plmn"));
    v6 = objc_claimAutoreleasedReturnValue();
    plmn = v5->_plmn;
    v5->_plmn = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imsi"));
    v8 = objc_claimAutoreleasedReturnValue();
    imsi = v5->_imsi;
    v5->_imsi = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phone_number"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phone_number_on_sim"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneNumberOnSIM = v5->_phoneNumberOnSIM;
    v5->_phoneNumberOnSIM = (NSString *)v12;

    v5->_isReady = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("registered"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (NSString)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (NSString)imsi
{
  return self->_imsi;
}

- (void)setImsi:(id)a3
{
  objc_storeStrong((id *)&self->_imsi, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)phoneNumberOnSIM
{
  return self->_phoneNumberOnSIM;
}

- (void)setPhoneNumberOnSIM:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberOnSIM, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberOnSIM, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_imsi, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
