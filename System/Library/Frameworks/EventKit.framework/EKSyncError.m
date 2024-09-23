@implementation EKSyncError

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_13 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_13, &__block_literal_global_80);
  return (id)knownIdentityKeysForComparison_keys_13;
}

void __45__EKSyncError_knownIdentityKeysForComparison__block_invoke()
{
  void *v0;

  v0 = (void *)knownIdentityKeysForComparison_keys_13;
  knownIdentityKeysForComparison_keys_13 = MEMORY[0x1E0C9AA60];

}

- (EKSyncError)initWithAccountError:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  EKSyncError *v7;
  EKSyncError *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncError;
  v7 = -[EKObject init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EKSyncError setErrorType:](v7, "setErrorType:", 0);
    -[EKSyncError setErrorCode:](v8, "setErrorCode:", a3);
    -[EKSyncError setUserInfo:](v8, "setUserInfo:", v6);
  }

  return v8;
}

- (EKSyncError)initWithCalendarError:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  EKSyncError *v7;
  EKSyncError *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncError;
  v7 = -[EKObject init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EKSyncError setErrorType:](v7, "setErrorType:", 2);
    -[EKSyncError setErrorCode:](v8, "setErrorCode:", a3);
    -[EKSyncError setUserInfo:](v8, "setUserInfo:", v6);
  }

  return v8;
}

- (EKSyncError)initWithCalendarItemError:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  EKSyncError *v7;
  EKSyncError *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncError;
  v7 = -[EKObject init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EKSyncError setErrorType:](v7, "setErrorType:", 1);
    -[EKSyncError setErrorCode:](v8, "setErrorCode:", a3);
    -[EKSyncError setUserInfo:](v8, "setUserInfo:", v6);
  }

  return v8;
}

- (unint64_t)errorType
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setErrorType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B5E8]);

}

- (unint64_t)errorCode
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setErrorCode:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B5E0]);

}

- (id)userInfoData
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5F8]);
}

- (void)setUserInfoData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B5F8]);
}

- (NSDictionary)userInfo
{
  void *v2;
  void *v3;

  -[EKSyncError userInfoData](self, "userInfoData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKSyncStatusUtils errorUserInfoFromData:](EKSyncStatusUtils, "errorUserInfoFromData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setUserInfo:(id)a3
{
  id v4;

  +[EKSyncStatusUtils dataFromErrorUserInfo:](EKSyncStatusUtils, "dataFromErrorUserInfo:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKSyncError setUserInfoData:](self, "setUserInfoData:", v4);

}

+ (id)augmentSyncErrorUserInfo:(id)a3 for:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
      v8 = (id)objc_msgSend(v6, "mutableCopy");
    else
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v7;
      if (objc_msgSend(v11, "isPhantom"))
      {
        objc_msgSend(v11, "detachedItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "anyObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = v13;

          v11 = v14;
        }

      }
      objc_msgSend(v11, "calendar");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "source");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v7;
        objc_msgSend(v15, "source");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v11 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v7;
          v11 = 0;
          v15 = 0;
        }
        else
        {
          v11 = 0;
          v15 = 0;
          v16 = 0;
        }
      }
    }
    if ((objc_msgSend(v15, "isSubscribed") & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v16, "title");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v17;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("AccountName"));
    objc_msgSend(v15, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("CalendarName"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("CalendarItem"));
    objc_msgSend(v11, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("CalendarItemName"));

    v20 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v22, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "augmentSyncErrorUserInfo:for:", v24, v7);
        v31 = v16;
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v22, "domain");
        v27 = v6;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", v28, objc_msgSend(v22, "code"), v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v27;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, v20);

        v16 = v31;
      }
    }
    v9 = (id)objc_msgSend(v10, "copy", v31);

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

@end
