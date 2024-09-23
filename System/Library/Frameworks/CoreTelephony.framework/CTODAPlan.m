@implementation CTODAPlan

- (CTODAPlan)initWithSetupUrl:(id)a3 mcc:(id)a4 mnc:(id)a5 gid1:(id)a6 gid2:(id)a7 handoffToken:(id)a8 inBuddy:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  CTODAPlan *v19;
  CTODAPlan *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CTODAPlan;
  v19 = -[CTODAPlan init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mcc, a4);
    objc_storeStrong((id *)&v20->_mnc, a5);
    objc_storeStrong((id *)&v20->_gid1, a6);
    objc_storeStrong((id *)&v20->_gid2, a7);
    objc_storeStrong((id *)&v20->_setupURL, a3);
    objc_storeStrong((id *)&v20->_handoffToken, a8);
    v20->_inBuddy = a9;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_mcc)
    objc_msgSend(v3, "appendFormat:", CFSTR(", mcc=%@"), self->_mcc);
  if (self->_mnc)
    objc_msgSend(v4, "appendFormat:", CFSTR(", mnc=%@"), self->_mnc);
  if (self->_gid1)
    objc_msgSend(v4, "appendFormat:", CFSTR(", gid1=%@"), self->_gid1);
  if (self->_gid2)
    objc_msgSend(v4, "appendFormat:", CFSTR(", gid1=%@"), self->_gid2);
  if (self->_setupURL)
    objc_msgSend(v4, "appendFormat:", CFSTR(", setupURL=%@"), self->_setupURL);
  if (self->_handoffToken)
    objc_msgSend(v4, "appendFormat:", CFSTR(", handoffToken=%@"), self->_handoffToken);
  if (self->_inBuddy)
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v4, "appendFormat:", CFSTR(", inBuddy=%s"), v5);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
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
  objc_super v47;

  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CTODAPlan;
  if (-[CTPlan isEqual:](&v47, sel_isEqual_, v6))
  {
    -[CTODAPlan mcc](self, "mcc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mcc");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      -[CTODAPlan mcc](self, "mcc");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mcc");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        LOBYTE(v9) = 0;
        goto LABEL_39;
      }
    }
    -[CTODAPlan mnc](self, "mnc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mnc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[CTODAPlan mnc](self, "mnc");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mnc");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v13))
      {
        LOBYTE(v9) = 0;
LABEL_37:

LABEL_38:
        if (v7 == v8)
        {
LABEL_40:

          goto LABEL_41;
        }
LABEL_39:

        goto LABEL_40;
      }
      v43 = v13;
      v44 = v12;
    }
    -[CTODAPlan gid1](self, "gid1");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gid1");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v14;
    if ((void *)v14 != v45)
    {
      -[CTODAPlan gid1](self, "gid1");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gid1");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        LOBYTE(v9) = 0;
LABEL_35:

LABEL_36:
        v13 = v43;
        v12 = v44;
        if (v10 == v11)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    -[CTODAPlan gid2](self, "gid2");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gid2");
    v17 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v16;
    v39 = (void *)v17;
    if (v16 != v17)
    {
      v18 = (void *)v17;
      -[CTODAPlan gid2](self, "gid2");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gid2");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v19;
      if (!objc_msgSend(v19, "isEqual:"))
      {
        LOBYTE(v9) = 0;
        v20 = v42;
LABEL_33:

LABEL_34:
        if (v46 == v45)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
    -[CTODAPlan setupURL](self, "setupURL");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setupURL");
    v36 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21 == v36)
    {
      v32 = v4;
      v33 = v3;
    }
    else
    {
      -[CTODAPlan setupURL](self, "setupURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setupURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v23;
      if (!objc_msgSend(v23, "isEqual:"))
      {
        LOBYTE(v9) = 0;
        v27 = (void *)v36;
LABEL_31:

LABEL_32:
        v20 = v42;
        v18 = v39;
        if (v42 == v39)
          goto LABEL_34;
        goto LABEL_33;
      }
      v32 = v4;
      v33 = v3;
    }
    -[CTODAPlan handoffToken](self, "handoffToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handoffToken");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == v25
      || (-[CTODAPlan handoffToken](self, "handoffToken"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "handoffToken"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = v26,
          objc_msgSend(v26, "isEqual:")))
    {
      v28 = -[CTODAPlan inBuddy](self, "inBuddy");
      v9 = v28 ^ objc_msgSend(v6, "inBuddy") ^ 1;
      if (v24 == v25)
      {

        v27 = (void *)v36;
LABEL_30:
        v4 = v32;
        v3 = v33;
        if (v22 == v27)
          goto LABEL_32;
        goto LABEL_31;
      }
      v27 = (void *)v36;
    }
    else
    {
      LOBYTE(v9) = 0;
      v27 = (void *)v36;
    }

    goto LABEL_30;
  }
  LOBYTE(v9) = 0;
LABEL_41:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTODAPlan)initWithCoder:(id)a3
{
  id v4;
  CTODAPlan *v5;
  uint64_t v6;
  NSString *mcc;
  uint64_t v8;
  NSString *mnc;
  uint64_t v10;
  NSString *gid1;
  uint64_t v12;
  NSString *gid2;
  uint64_t v14;
  NSString *setupURL;
  uint64_t v16;
  NSString *handoffToken;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTODAPlan;
  v5 = -[CTPlan initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcc"));
    v6 = objc_claimAutoreleasedReturnValue();
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnc"));
    v8 = objc_claimAutoreleasedReturnValue();
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid1"));
    v10 = objc_claimAutoreleasedReturnValue();
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid2"));
    v12 = objc_claimAutoreleasedReturnValue();
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    setupURL = v5->_setupURL;
    v5->_setupURL = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handoffToken"));
    v16 = objc_claimAutoreleasedReturnValue();
    handoffToken = v5->_handoffToken;
    v5->_handoffToken = (NSString *)v16;

    v5->_inBuddy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inBuddy"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTODAPlan;
  v4 = a3;
  -[CTPlan encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mcc, CFSTR("mcc"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mnc, CFSTR("mnc"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gid1, CFSTR("gid1"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gid2, CFSTR("gid2"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_setupURL, CFSTR("setupURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_handoffToken, CFSTR("handoffToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_inBuddy, CFSTR("inBuddy"));

}

- (NSString)mcc
{
  return self->_mcc;
}

- (NSString)mnc
{
  return self->_mnc;
}

- (NSString)gid1
{
  return self->_gid1;
}

- (NSString)gid2
{
  return self->_gid2;
}

- (NSString)setupURL
{
  return self->_setupURL;
}

- (NSString)handoffToken
{
  return self->_handoffToken;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffToken, 0);
  objc_storeStrong((id *)&self->_setupURL, 0);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
}

@end
