@implementation HMDAppleAccountContext

- (HMDAppleAccountContext)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAppleAccountContext)initWithAccount:(id)a3
{
  id v4;
  HMDAppleAccountContext *v5;
  void *v6;
  uint64_t v7;
  NSString *username;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSString *alternateDSID;
  HMDAppleAccountContext *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDAppleAccountContext;
    v5 = -[HMDAppleAccountContext init](&v17, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "username");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      username = v5->_username;
      v5->_username = (NSString *)v7;

      objc_msgSend(v4, "aa_personID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

      objc_msgSend(v4, "aa_altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      alternateDSID = v5->_alternateDSID;
      v5->_alternateDSID = (NSString *)v13;

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAppleAccountContext identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAppleAccountContext *v4;
  HMDAppleAccountContext *v5;
  HMDAppleAccountContext *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (HMDAppleAccountContext *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_9;
    -[HMDAppleAccountContext identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleAccountContext identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_9;
    -[HMDAppleAccountContext username](self, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleAccountContext username](v6, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (v12)
    {
      -[HMDAppleAccountContext alternateDSID](self, "alternateDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccountContext alternateDSID](v6, "alternateDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v15 = 0;
    }

  }
  return v15;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAppleAccountContext identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("ID"), v4, 0, v5);
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAppleAccountContext username](self, "username", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:options:formatter:", CFSTR("UN"), v8, 0, v9);
  v17[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAppleAccountContext alternateDSID](self, "alternateDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:value:options:formatter:", CFSTR("ADSID"), v12, 0, v13);
  v17[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)alternateDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
