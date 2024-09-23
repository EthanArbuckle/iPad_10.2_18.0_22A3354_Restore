@implementation ICASSyncHealthPrivateUserData

- (ICASSyncHealthPrivateUserData)initWithSyncHealthPrivateUserID:(id)a3
{
  id v5;
  ICASSyncHealthPrivateUserData *v6;
  ICASSyncHealthPrivateUserData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSyncHealthPrivateUserData;
  v6 = -[ICASSyncHealthPrivateUserData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_syncHealthPrivateUserID, a3);

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SyncHealthPrivateUserData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("syncHealthPrivateUserID");
  -[ICASSyncHealthPrivateUserData syncHealthPrivateUserID](self, "syncHealthPrivateUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSyncHealthPrivateUserData syncHealthPrivateUserID](self, "syncHealthPrivateUserID");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)syncHealthPrivateUserID
{
  return self->_syncHealthPrivateUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncHealthPrivateUserID, 0);
}

@end
