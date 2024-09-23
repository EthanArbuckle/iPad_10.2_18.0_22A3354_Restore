@implementation CNContactProviderSupportSession

- (CNContactProviderSupportSession)init
{
  CNContactProviderSupportSession *v2;
  CNContactProviderSupportSession *v3;
  NSProgress *v4;
  NSProgress *progress;
  NSString *displayName;
  NSDictionary *userInfo;
  CNContactProviderSupportSession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactProviderSupportSession;
  v2 = -[CNContactProviderSupportSession init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_synchronizationReason, CFSTR("App Requested"));
    v4 = (NSProgress *)objc_alloc_init(MEMORY[0x1E0CB38A8]);
    progress = v3->_progress;
    v3->_progress = v4;

    displayName = v3->_displayName;
    v3->_displayName = (NSString *)&stru_1E29FF900;

    userInfo = v3->_userInfo;
    v3->_userInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v8 = v3;
  }

  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("reason"), self->_synchronizationReason);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("displayName"), self->_displayName);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("userInfo"), self->_userInfo);
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("progress"), self->_progress);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProviderSupportSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *synchronizationReason;
  void *v8;
  NSString *v9;
  NSString *displayName;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *userInfo;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_synchronizationReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  synchronizationReason = self->_synchronizationReason;
  self->_synchronizationReason = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)objc_msgSend(v8, "copy");
  displayName = self->_displayName;
  self->_displayName = v9;

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_userInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (NSDictionary *)objc_msgSend(v17, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v18;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *synchronizationReason;
  id v5;

  synchronizationReason = self->_synchronizationReason;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", synchronizationReason, CFSTR("_synchronizationReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNContactProviderSupportSession *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(CNContactProviderSupportSession);
  -[CNContactProviderSupportSession synchronizationReason](self, "synchronizationReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportSession setSynchronizationReason:](v4, "setSynchronizationReason:", v5);

  -[CNContactProviderSupportSession displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportSession setDisplayName:](v4, "setDisplayName:", v6);

  -[CNContactProviderSupportSession userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportSession setUserInfo:](v4, "setUserInfo:", v7);

  -[CNContactProviderSupportSession progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportSession setProgress:](v4, "setProgress:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CNContactProviderSupportSession *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;

  v4 = (CNContactProviderSupportSession *)a3;
  if (self == v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v5 = (unint64_t)-[CNContactProviderSupportSession synchronizationReason](self, "synchronizationReason");
  v6 = (unint64_t)-[CNContactProviderSupportSession synchronizationReason](v4, "synchronizationReason");
  if (v5 | v6)
  {
    if (!objc_msgSend((id)v5, "isEqual:", v6))
      goto LABEL_12;
  }
  if (((v7 = (unint64_t)-[CNContactProviderSupportSession progress](self, "progress"),
         v8 = (unint64_t)-[CNContactProviderSupportSession progress](v4, "progress"),
         !(v7 | v8))
     || objc_msgSend((id)v7, "isEqual:", v8))
    && ((v9 = (unint64_t)-[CNContactProviderSupportSession displayName](self, "displayName"),
         v10 = (unint64_t)-[CNContactProviderSupportSession displayName](v4, "displayName"),
         !(v9 | v10))
     || objc_msgSend((id)v9, "isEqual:", v10))
    && ((v11 = (unint64_t)-[CNContactProviderSupportSession userInfo](self, "userInfo"),
         v12 = (unint64_t)-[CNContactProviderSupportSession userInfo](v4, "userInfo"),
         !(v11 | v12))
     || objc_msgSend((id)v11, "isEqual:", v12)))
  {
LABEL_11:
    v13 = 1;
  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (NSString)synchronizationReason
{
  return self->_synchronizationReason;
}

- (void)setSynchronizationReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_synchronizationReason, 0);
}

@end
