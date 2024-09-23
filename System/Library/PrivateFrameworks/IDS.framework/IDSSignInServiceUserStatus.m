@implementation IDSSignInServiceUserStatus

- (IDSSignInServiceUserStatus)initWithServiceType:(unint64_t)a3 userInfos:(id)a4
{
  id v7;
  NSObject *v8;
  IDSSignInServiceUserStatus *v9;
  IDSSignInServiceUserStatus *v10;
  IDSSignInServiceUserStatus *v11;
  objc_super v13;

  v7 = a4;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "signInController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907E949C();

    v9 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSSignInServiceUserStatus;
    v10 = -[IDSSignInServiceUserStatus init](&v13, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->_serviceType = a3;
      objc_storeStrong((id *)&v10->_serviceUserInfos, a4);
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  unint64_t serviceType;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("iMessage");
  serviceType = self->_serviceType;
  if (serviceType != 1)
    v5 = 0;
  if (!serviceType)
    v5 = CFSTR("FaceTime");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Service: %@ Infos: %@"), v4, self, v5, self->_serviceUserInfos);
}

- (unint64_t)phoneUserStatus
{
  NSArray *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_serviceUserInfos;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v6, "type", (_QWORD)v8))
        {
          v3 = objc_msgSend(v6, "status");
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)appleIDUserStatus
{
  NSArray *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_serviceUserInfos;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (_QWORD)v8) == 1)
        {
          v3 = objc_msgSend(v6, "status");
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)serviceUserInfos
{
  return self->_serviceUserInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUserInfos, 0);
}

@end
