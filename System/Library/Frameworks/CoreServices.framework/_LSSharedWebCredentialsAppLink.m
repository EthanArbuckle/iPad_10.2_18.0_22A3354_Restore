@implementation _LSSharedWebCredentialsAppLink

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____LSSharedWebCredentialsAppLink;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1)
    _LSIsSWCAvailable();
}

+ (id)_SWCSpecifierForSettingsWithApplicationIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
  _LSSWCServiceTypeAppLinks();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithServiceType:applicationIdentifier:domain:", v5, v3, 0);

  return v6;
}

- (id)_SWCSpecifierForSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[_SWCServiceDetails serviceSpecifier](self->_serviceDetails, "serviceSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_SWCSpecifierForSettingsWithApplicationIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_SWCSettingsWithApplicationIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_SWCSpecifierForSettingsWithApplicationIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_LSSWCServiceSettingsClass(), "serviceSettingsWithServiceSpecifier:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_SWCSettingsReturningError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[_SWCServiceDetails serviceSpecifier](self->_serviceDetails, "serviceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_SWCSettingsWithApplicationIdentifier:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_setSWCSetting:(id)a3 forKey:(id)a4 withApplicationIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v21;
  id v22;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  while (1)
  {
    objc_msgSend(a1, "_SWCSettingsWithApplicationIdentifier:error:", v11, a6, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
      break;
    objc_msgSend(v12, "setObject:forKey:", v21, v10);
    v22 = 0;
    v14 = objc_msgSend(v13, "commitReturningError:", &v22);
    v15 = v22;
    v16 = v15;
    if ((v14 & 1) != 0)
      goto LABEL_9;
    if (objc_msgSend(v15, "code") != 1000
      || (objc_msgSend(v16, "domain"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          _LSSWCErrorDomain(),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v17, "isEqual:", v18),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      if (a6)
        *a6 = objc_retainAutorelease(v16);
LABEL_9:

      goto LABEL_11;
    }

  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_setSWCSetting:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  -[_SWCServiceDetails serviceSpecifier](self->_serviceDetails, "serviceSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "_setSWCSetting:forKey:withApplicationIdentifier:error:", v8, v9, v11, a5);
  return (char)a5;
}

+ (BOOL)_areAppLinksEnabledForServiceDetails:(id)a3 cachedSettings:(id *)a4
{
  id v6;
  int v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v6 = a3;
  if ((objc_msgSend(v6, "isAlwaysEnabled") & 1) != 0)
  {
    v7 = 1;
    v8 = 1;
    goto LABEL_11;
  }
  v9 = *a4;
  if (!v9)
  {
    objc_msgSend(v6, "serviceSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_SWCSettingsWithApplicationIdentifier:error:", v11, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_storeStrong(a4, v9);
  }
  objc_msgSend(v9, "objectForKey:ofClass:", CFSTR("com.apple.LaunchServices.enabled"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v7 = objc_msgSend(v12, "BOOLValue");

  }
  else
  {

    objc_msgSend(v6, "isEnabledByDefault");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (!v14)
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_10;
    }
    v7 = objc_msgSend(v14, "BOOLValue");
  }
  v8 = 1;
LABEL_10:

LABEL_11:
  v15 = objc_msgSend((id)objc_opt_class(), "areEnabledByDefault");
  if (v8)
    v16 = v7 != 0;
  else
    v16 = v15;

  return v16;
}

+ (void)afterAppLinksBecomeAvailableForURL:(id)a3 limit:(unint64_t)a4 performBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;
  id v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "_dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke;
  v13[3] = &unk_1E10416A0;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v17 = a1;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (BOOL)isAlwaysEnabled
{
  return -[_SWCServiceDetails isAlwaysEnabled](self->_serviceDetails, "isAlwaysEnabled");
}

- (BOOL)isEnabled
{
  char v2;
  id v4;

  v4 = 0;
  v2 = objc_msgSend((id)objc_opt_class(), "_areAppLinksEnabledForServiceDetails:cachedSettings:", self->_serviceDetails, &v4);

  return v2;
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[_LSSharedWebCredentialsAppLink _setSWCSetting:forKey:error:](self, "_setSWCSetting:forKey:error:", v6, CFSTR("com.apple.LaunchServices.enabled"), a4);

  return (char)a4;
}

+ (int64_t)settingsSwitchStateForApplicationIdentifier:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int64_t v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_SWCSpecifierForSettingsWithApplicationIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_LSSWCServiceDetailsClass(), "serviceDetailsWithServiceSpecifier:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v6 = objc_msgSend(v5, "count");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isAlwaysEnabled", (_QWORD)v16))
          --v6;
        else
          v8 += objc_msgSend(a1, "_areAppLinksEnabledForServiceDetails:cachedSettings:", v12, &v20);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

  if (v6)
  {
    if (v8 == v6)
      v13 = 2;
    else
      v13 = v8 < v6 && v8 != 0;
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

+ (BOOL)setSettingsSwitchState:(int64_t)a3 forApplicationIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((a3 | 2) == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 == 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a5) = objc_msgSend(a1, "_setSWCSetting:forKey:withApplicationIdentifier:error:", v9, CFSTR("com.apple.LaunchServices.enabled"), v8, a5);

  }
  else if (a5)
  {
    v12 = *MEMORY[0x1E0CB2938];
    v13[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[_LSSharedWebCredentialsAppLink setSettingsSwitchState:forApplicationIdentifier:error:]", 391, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (id)browserSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[_LSSharedWebCredentialsAppLink _SWCSettingsReturningError:](self, "_SWCSettingsReturningError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = v2,
        objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("com.apple.LaunchServices.browserSettings"), objc_opt_class()),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v4;
}

- (BOOL)setBrowserSettings:(id)a3 error:(id *)a4
{
  return -[_LSSharedWebCredentialsAppLink _setSWCSetting:forKey:error:](self, "_setSWCSetting:forKey:error:", a3, CFSTR("com.apple.LaunchServices.browserSettings"), a4);
}

- (BOOL)removeSettingsReturningError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[_LSSharedWebCredentialsAppLink _SWCSpecifierForSettings](self, "_SWCSpecifierForSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_LSSWCServiceSettingsClass();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = CFSTR("com.apple.LaunchServices.enabled");
    v11[1] = CFSTR("com.apple.LaunchServices.browserSettings");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v5, "removeObjectsForKeys:serviceSpecifier:error:", v8, v4, a3);
  }
  else if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSSharedWebCredentialsAppLink removeSettingsReturningError:]", 430, 0);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)removeAllSettingsReturningError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = _LSSWCServiceSettingsClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x1E0C99E60];
    v12[0] = CFSTR("com.apple.LaunchServices.enabled");
    v12[1] = CFSTR("com.apple.LaunchServices.browserSettings");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _LSSWCServiceTypeAppLinks();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "removeObjectsForKeys:serviceType:error:", v8, v9, a3);

  }
  else if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"+[_LSSharedWebCredentialsAppLink removeAllSettingsReturningError:]", 446, 0);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSSharedWebCredentialsAppLink;
  -[LSAppLink encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceDetails, CFSTR("serviceDetails"));

}

- (_LSSharedWebCredentialsAppLink)initWithCoder:(id)a3
{
  id v4;
  _LSSharedWebCredentialsAppLink *v5;
  uint64_t v6;
  _SWCServiceDetails *serviceDetails;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSSharedWebCredentialsAppLink;
  v5 = -[LSAppLink initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", _LSSWCServiceDetailsClass(), CFSTR("serviceDetails"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceDetails = v5->_serviceDetails;
    v5->_serviceDetails = (_SWCServiceDetails *)v6;

  }
  return v5;
}

- (LSBinding)binding
{
  LSBinding *result;

  objc_copyCppObjectAtomic(retstr, &self->_binding, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (_SWCServiceDetails)serviceDetails
{
  return self->_serviceDetails;
}

- (void)setServiceDetails:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDetails, a3);
}

- (void).cxx_destruct
{
  _LSSharedWebCredentialsAppLink *v2;

  v2 = self;
  objc_storeStrong((id *)&self->_serviceDetails, 0);
  v2 = (_LSSharedWebCredentialsAppLink *)((char *)v2 + 32);

}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_DWORD *)self + 12) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
