@implementation CTRemoteBlacklistPlan

- (CTRemoteBlacklistPlan)initWithkey:(id)a3 blacklistIMEI:(id)a4 blacklistEID:(id)a5 blacklistICCID:(id)a6 uploaderIMEI:(id)a7 uploaderEID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CTRemoteBlacklistPlan *v20;
  uint64_t v21;
  NSString *key;
  uint64_t v23;
  NSString *blacklistIMEI;
  uint64_t v25;
  NSString *blacklistEID;
  uint64_t v27;
  NSString *blacklistICCID;
  uint64_t v29;
  NSString *uploaderIMEI;
  uint64_t v31;
  NSString *uploaderEID;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CTRemoteBlacklistPlan;
  v20 = -[CTRemoteBlacklistPlan init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    key = v20->_key;
    v20->_key = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    blacklistIMEI = v20->_blacklistIMEI;
    v20->_blacklistIMEI = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    blacklistEID = v20->_blacklistEID;
    v20->_blacklistEID = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    blacklistICCID = v20->_blacklistICCID;
    v20->_blacklistICCID = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    uploaderIMEI = v20->_uploaderIMEI;
    v20->_uploaderIMEI = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    uploaderEID = v20->_uploaderEID;
    v20->_uploaderEID = (NSString *)v31;

  }
  return v20;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTRemoteBlacklistPlan key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" RecordID=%@"), v4);

  -[CTRemoteBlacklistPlan blacklistIMEI](self, "blacklistIMEI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" BlacklistIMEI=%@"), v5);

  -[CTRemoteBlacklistPlan blacklistEID](self, "blacklistEID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" BlacklistEID=%@"), v6);

  -[CTRemoteBlacklistPlan blacklistICCID](self, "blacklistICCID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" BlacklistICCID=%@"), v7);

  -[CTRemoteBlacklistPlan uploaderIMEI](self, "uploaderIMEI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UploaderIMEI=%@"), v8);

  -[CTRemoteBlacklistPlan uploaderEID](self, "uploaderEID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UploaderEID=%@"), v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTRemoteBlacklistPlan *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v6 = (CTRemoteBlacklistPlan *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTRemoteBlacklistPlan key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteBlacklistPlan key](v6, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[CTRemoteBlacklistPlan key](self, "key");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteBlacklistPlan key](v6, "key");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v3;
        if (!objc_msgSend(v3, "isEqualToString:"))
        {
          v9 = 0;
          goto LABEL_36;
        }
      }
      -[CTRemoteBlacklistPlan blacklistIMEI](self, "blacklistIMEI");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteBlacklistPlan blacklistIMEI](v6, "blacklistIMEI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[CTRemoteBlacklistPlan blacklistIMEI](self, "blacklistIMEI");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteBlacklistPlan blacklistIMEI](v6, "blacklistIMEI");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v4))
        {
          v9 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      -[CTRemoteBlacklistPlan blacklistEID](self, "blacklistEID");
      v12 = objc_claimAutoreleasedReturnValue();
      -[CTRemoteBlacklistPlan blacklistEID](v6, "blacklistEID");
      v13 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v12;
      v14 = v12 == v13;
      v15 = (void *)v13;
      if (!v14)
      {
        -[CTRemoteBlacklistPlan blacklistEID](self, "blacklistEID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteBlacklistPlan blacklistEID](v6, "blacklistEID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v16;
        if (!objc_msgSend(v16, "isEqualToString:"))
        {
          v9 = 0;
          v17 = v47;
LABEL_32:

LABEL_33:
          if (v10 == v11)
            goto LABEL_35;
          goto LABEL_34;
        }
      }
      -[CTRemoteBlacklistPlan blacklistICCID](self, "blacklistICCID");
      v18 = objc_claimAutoreleasedReturnValue();
      -[CTRemoteBlacklistPlan blacklistICCID](v6, "blacklistICCID");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v18;
      v44 = v15;
      if (v18 == v45)
      {
        v38 = v11;
      }
      else
      {
        v19 = v10;
        v20 = v4;
        v21 = v3;
        -[CTRemoteBlacklistPlan blacklistICCID](self, "blacklistICCID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteBlacklistPlan blacklistICCID](v6, "blacklistICCID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v22;
        if (!objc_msgSend(v22, "isEqualToString:"))
        {
          v9 = 0;
          v25 = (void *)v45;
          v3 = v21;
          v4 = v20;
          v10 = v19;
LABEL_30:

LABEL_31:
          v15 = v44;
          v17 = v47;
          if (v47 == v44)
            goto LABEL_33;
          goto LABEL_32;
        }
        v38 = v11;
        v3 = v21;
        v4 = v20;
        v10 = v19;
      }
      -[CTRemoteBlacklistPlan uploaderIMEI](self, "uploaderIMEI");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteBlacklistPlan uploaderIMEI](v6, "uploaderIMEI");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v23 == (void *)v39)
      {
        v34 = v4;
        v35 = v3;
      }
      else
      {
        -[CTRemoteBlacklistPlan uploaderIMEI](self, "uploaderIMEI");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteBlacklistPlan uploaderIMEI](v6, "uploaderIMEI");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v24;
        if (!objc_msgSend(v24, "isEqualToString:"))
        {
          v9 = 0;
          v11 = v38;
          v31 = (void *)v39;
          goto LABEL_28;
        }
        v34 = v4;
        v35 = v3;
      }
      -[CTRemoteBlacklistPlan uploaderEID](self, "uploaderEID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteBlacklistPlan uploaderEID](v6, "uploaderEID");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

        v9 = 1;
      }
      else
      {
        v28 = (void *)v27;
        -[CTRemoteBlacklistPlan uploaderEID](self, "uploaderEID");
        v33 = v23;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteBlacklistPlan uploaderEID](v6, "uploaderEID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v29, "isEqualToString:", v30);

        v23 = v33;
      }
      v11 = v38;
      v31 = (void *)v39;
      v4 = v34;
      v3 = v35;
      if (v23 == (void *)v39)
      {
LABEL_29:

        v25 = (void *)v45;
        if (v46 == (void *)v45)
          goto LABEL_31;
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v9 = 0;
  }
LABEL_38:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemoteBlacklistPlan)initWithCoder:(id)a3
{
  id v4;
  CTRemoteBlacklistPlan *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSString *blacklistIMEI;
  uint64_t v10;
  NSString *blacklistEID;
  uint64_t v12;
  NSString *blacklistICCID;
  uint64_t v14;
  NSString *uploaderIMEI;
  uint64_t v16;
  NSString *uploaderEID;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTRemoteBlacklistPlan;
  v5 = -[CTRemoteBlacklistPlan init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordId"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blacklistIMEI"));
    v8 = objc_claimAutoreleasedReturnValue();
    blacklistIMEI = v5->_blacklistIMEI;
    v5->_blacklistIMEI = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blacklistEID"));
    v10 = objc_claimAutoreleasedReturnValue();
    blacklistEID = v5->_blacklistEID;
    v5->_blacklistEID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blacklistICCID"));
    v12 = objc_claimAutoreleasedReturnValue();
    blacklistICCID = v5->_blacklistICCID;
    v5->_blacklistICCID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploaderIMEI"));
    v14 = objc_claimAutoreleasedReturnValue();
    uploaderIMEI = v5->_uploaderIMEI;
    v5->_uploaderIMEI = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploaderEID"));
    v16 = objc_claimAutoreleasedReturnValue();
    uploaderEID = v5->_uploaderEID;
    v5->_uploaderEID = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("recordId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blacklistIMEI, CFSTR("blacklistIMEI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blacklistEID, CFSTR("blacklistEID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blacklistICCID, CFSTR("blacklistICCID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uploaderIMEI, CFSTR("uploaderIMEI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uploaderEID, CFSTR("uploaderEID"));

}

- (NSString)key
{
  return self->_key;
}

- (NSString)blacklistIMEI
{
  return self->_blacklistIMEI;
}

- (NSString)blacklistEID
{
  return self->_blacklistEID;
}

- (NSString)blacklistICCID
{
  return self->_blacklistICCID;
}

- (NSString)uploaderIMEI
{
  return self->_uploaderIMEI;
}

- (NSString)uploaderEID
{
  return self->_uploaderEID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploaderEID, 0);
  objc_storeStrong((id *)&self->_uploaderIMEI, 0);
  objc_storeStrong((id *)&self->_blacklistICCID, 0);
  objc_storeStrong((id *)&self->_blacklistEID, 0);
  objc_storeStrong((id *)&self->_blacklistIMEI, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
