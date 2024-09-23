@implementation HDTinkerPairedUserInfo

- (BOOL)isEqual:(id)a3
{
  HDTinkerPairedUserInfo *v4;
  HDTinkerPairedUserInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;

  v4 = (HDTinkerPairedUserInfo *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HDTinkerPairedUserInfo firstName](self, "firstName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDTinkerPairedUserInfo firstName](v5, "firstName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HDTinkerPairedUserInfo firstName](v5, "firstName");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        -[HDTinkerPairedUserInfo firstName](self, "firstName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDTinkerPairedUserInfo firstName](v5, "firstName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_20;
      }
      -[HDTinkerPairedUserInfo lastName](self, "lastName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDTinkerPairedUserInfo lastName](v5, "lastName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HDTinkerPairedUserInfo lastName](v5, "lastName");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v17 = (void *)v16;
        -[HDTinkerPairedUserInfo lastName](self, "lastName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDTinkerPairedUserInfo lastName](v5, "lastName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_20;
      }
      -[HDTinkerPairedUserInfo dsid](self, "dsid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDTinkerPairedUserInfo dsid](v5, "dsid");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

LABEL_24:
        v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      -[HDTinkerPairedUserInfo dsid](v5, "dsid");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        -[HDTinkerPairedUserInfo dsid](self, "dsid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDTinkerPairedUserInfo dsid](v5, "dsid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDTinkerPairedUserInfo firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo dsid](self, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p firstName:%@ lastName:%@ DSID:%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
