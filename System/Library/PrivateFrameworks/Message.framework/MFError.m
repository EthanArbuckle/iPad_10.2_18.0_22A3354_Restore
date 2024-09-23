@implementation MFError

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5 title:(id)a6 userInfo:(id)a7
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (unint64_t)a5;
  v14 = (unint64_t)a6;
  v15 = a7;
  v16 = v15;
  if (v12)
  {
    if (v13 | v14)
    {
      if (v15)
        v18 = (id)objc_msgSend(v15, "mutableCopy");
      else
        v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19 = v18;
      if (v13)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D50]);
      if (v14)
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("_MFShortDescription"));
      objc_msgSend(a1, "errorWithDomain:code:localizedDescription:title:userInfo:", v12, a4, 0, 0, v19);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("MFNoErrorLog"));

      if ((v21 & 1) == 0)
      {
        MFLogGeneral();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFError errorWithDomain:code:localizedDescription:title:userInfo:].cold.1(v23, v25, v22);
        }

      }
    }
    else
    {
      objc_msgSend(a1, "errorWithDomain:code:userInfo:", v12, a4, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17 = 0;
  }

  return (MFError *)v17;
}

+ (void)errorWithDomain:(os_log_t)log code:localizedDescription:title:userInfo:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Created error: %{public}@", buf, 0xCu);

}

__CFString *__40__MFError_initWithDomain_code_userInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1028) < 0x20)
    return off_1E4E8C0E0[a2 - 1028];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Error Code %ld"), a2);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)mf_shortDescription
{
  os_unfair_lock_s *p_moreUserInfoLock;
  void *v4;
  objc_super v6;

  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  -[NSMutableDictionary objectForKey:](self->_moreUserInfo, "objectForKey:", CFSTR("_MFShortDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_moreUserInfoLock);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFError;
    -[NSError mf_shortDescription](&v6, sel_mf_shortDescription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)userInfo
{
  void *v3;
  os_unfair_lock_s *p_moreUserInfoLock;
  NSMutableDictionary *moreUserInfo;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFError;
  -[MFError userInfo](&v8, sel_userInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  moreUserInfo = self->_moreUserInfo;
  if (moreUserInfo)
  {
    if (v3)
    {
      v6 = (void *)-[NSMutableDictionary mutableCopy](moreUserInfo, "mutableCopy");
      objc_msgSend(v6, "addEntriesFromDictionary:", v3);

    }
    else
    {
      v6 = (void *)-[NSMutableDictionary copy](moreUserInfo, "copy");
    }
  }
  else
  {
    v6 = v3;
  }
  os_unfair_lock_unlock(p_moreUserInfoLock);
  return v6;
}

- (MFError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  MFError *v10;
  MFError *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  if (initWithDomain_code_userInfo__onceToken != -1)
    dispatch_once(&initWithDomain_code_userInfo__onceToken, &__block_literal_global_31);
  v13.receiver = self;
  v13.super_class = (Class)MFError;
  v10 = -[MFError initWithDomain:code:userInfo:](&v13, sel_initWithDomain_code_userInfo_, v8, a4, v9);
  v11 = v10;
  if (v10)
    v10->_moreUserInfoLock._os_unfair_lock_opaque = 0;

  return v11;
}

uint64_t __40__MFError_initWithDomain_code_userInfo___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "ef_setDecoder:forDomain:", &__block_literal_global_17_0, CFSTR("MFMessageErrorDomain"));
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  _setUserInfoObjectForKey(self, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreUserInfo, 0);
}

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5
{
  objc_msgSend(a1, "errorWithDomain:code:localizedDescription:title:userInfo:", a3, a4, a5, 0, 0);
  return (MFError *)(id)objc_claimAutoreleasedReturnValue();
}

+ (MFError)errorWithException:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFError *)v5;
}

- (id)localizedDescription
{
  os_unfair_lock_s *p_moreUserInfoLock;
  void *v4;
  objc_super v6;

  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  -[NSMutableDictionary objectForKey:](self->_moreUserInfo, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_moreUserInfoLock);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFError;
    -[MFError localizedDescription](&v6, sel_localizedDescription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)recoveryAttempter
{
  void *v2;
  id v3;
  NSString *v4;
  NSString *v5;

  -[MFError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB3148]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("RecoveryAttemptorClassName"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v3 = objc_alloc_init(NSClassFromString(v4));
    else
      v3 = 0;

  }
  return v3;
}

- (id)mf_moreInfo
{
  os_unfair_lock_s *p_moreUserInfoLock;
  void *v4;
  objc_super v6;

  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  -[NSMutableDictionary objectForKey:](self->_moreUserInfo, "objectForKey:", CFSTR("_MFMoreInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_moreUserInfoLock);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFError;
    -[NSError mf_moreInfo](&v6, sel_mf_moreInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setLocalizedDescription:(id)a3
{
  _setUserInfoObjectForKey(self, a3, (void *)*MEMORY[0x1E0CB2D50]);
}

- (void)setMoreInfo:(id)a3
{
  _setUserInfoObjectForKey(self, a3, CFSTR("_MFMoreInfo"));
}

- (void)setShortDescription:(id)a3
{
  _setUserInfoObjectForKey(self, a3, CFSTR("_MFShortDescription"));
}

- (void)useGenericDescription:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[MFError localizedDescription](self, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
    MFLookupLocalizedString(CFSTR("MSG_SERVER_ERROR"), CFSTR("%@\n\nThe server error encountered was: %@"), CFSTR("Delayed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFormat:", v7, v9, v5);

    v9 = (id)v8;
  }
  -[MFError setLocalizedDescription:](self, "setLocalizedDescription:", v9);

}

@end
