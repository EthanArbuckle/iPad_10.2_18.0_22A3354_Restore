@implementation ICASPrivateUserData

- (ICASPrivateUserData)initWithPrivateUserID:(id)a3 saltVersion:(id)a4 userStartMonth:(id)a5 userStartYear:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASPrivateUserData *v15;
  ICASPrivateUserData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASPrivateUserData;
  v15 = -[ICASPrivateUserData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_privateUserID, a3);
    objc_storeStrong((id *)&v16->_saltVersion, a4);
    objc_storeStrong((id *)&v16->_userStartMonth, a5);
    objc_storeStrong((id *)&v16->_userStartYear, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("PrivateUserData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("privateUserID");
  -[ICASPrivateUserData privateUserID](self, "privateUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASPrivateUserData privateUserID](self, "privateUserID");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("saltVersion");
  -[ICASPrivateUserData saltVersion](self, "saltVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASPrivateUserData saltVersion](self, "saltVersion");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("userStartMonth");
  -[ICASPrivateUserData userStartMonth](self, "userStartMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASPrivateUserData userStartMonth](self, "userStartMonth");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("userStartYear");
  -[ICASPrivateUserData userStartYear](self, "userStartYear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASPrivateUserData userStartYear](self, "userStartYear");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)privateUserID
{
  return self->_privateUserID;
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
  objc_storeStrong((id *)&self->_privateUserID, 0);
}

@end
