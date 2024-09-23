@implementation SLLastAccountManager

+ (void)_setLastAccount:(id)a3 prefKey:(id)a4 prefAppID:(id)a5
{
  __CFString *v7;
  void *v8;
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  v7 = (__CFString *)a4;
  objc_msgSend(a3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v7, v8, applicationID);

  CFPreferencesAppSynchronize(applicationID);
}

+ (id)_lastAccountOfTypeIdentifier:(id)a3 inStore:(id)a4 updatePrefs:(BOOL)a5 prefKey:(id)a6 prefAppID:(id)a7
{
  uint64_t v7;
  _BOOL4 v10;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  CFPropertyListRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CFPropertyListRef v22;

  v10 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v16 = CFPreferencesCopyAppValue(v14, v15);
  v17 = (void *)v16;
  if (!v16
    || (v22 = v16,
        _SLLog(v7, 7, CFSTR("SLLastAccountManager fetching account with identifier %@")),
        objc_msgSend(v13, "accountWithIdentifier:", v17, v22),
        (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v13, "accountTypeWithAccountTypeIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountsWithAccountType:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        +[SLLastAccountManager _setLastAccount:prefKey:prefAppID:](SLLastAccountManager, "_setLastAccount:prefKey:prefAppID:", v18, v14, v15);
    }
    else
    {
      v18 = 0;
    }

  }
  return v18;
}

+ (id)lastTwitterAccountInAccountStore:(id)a3 updatePrefs:(BOOL)a4
{
  return 0;
}

@end
