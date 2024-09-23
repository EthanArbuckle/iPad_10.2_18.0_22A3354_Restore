@implementation ICASUserData

- (ICASUserData)initWithUserID:(id)a3 userStorefrontID:(id)a4 saltVersion:(id)a5 userStartMonth:(id)a6 userStartYear:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICASUserData *v17;
  ICASUserData *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASUserData;
  v17 = -[ICASUserData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userID, a3);
    objc_storeStrong((id *)&v18->_userStorefrontID, a4);
    objc_storeStrong((id *)&v18->_saltVersion, a5);
    objc_storeStrong((id *)&v18->_userStartMonth, a6);
    objc_storeStrong((id *)&v18->_userStartYear, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("UserData");
}

- (id)toDict
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("userID");
  -[ICASUserData userID](self, "userID");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASUserData userID](self, "userID", v19);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = CFSTR("userStorefrontID");
  -[ICASUserData userStorefrontID](self, "userStorefrontID", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICASUserData userStorefrontID](self, "userStorefrontID");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = CFSTR("saltVersion");
  -[ICASUserData saltVersion](self, "saltVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICASUserData saltVersion](self, "saltVersion");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = CFSTR("userStartMonth");
  -[ICASUserData userStartMonth](self, "userStartMonth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASUserData userStartMonth](self, "userStartMonth");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = CFSTR("userStartYear");
  -[ICASUserData userStartYear](self, "userStartYear");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASUserData userStartYear](self, "userStartYear");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v22[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)userStorefrontID
{
  return self->_userStorefrontID;
}

- (NSString)saltVersion
{
  return self->_saltVersion;
}

- (NSNumber)userStartMonth
{
  return self->_userStartMonth;
}

- (NSNumber)userStartYear
{
  return self->_userStartYear;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStartYear, 0);
  objc_storeStrong((id *)&self->_userStartMonth, 0);
  objc_storeStrong((id *)&self->_saltVersion, 0);
  objc_storeStrong((id *)&self->_userStorefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
