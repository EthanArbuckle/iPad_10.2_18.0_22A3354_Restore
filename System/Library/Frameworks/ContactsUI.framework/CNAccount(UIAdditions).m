@implementation CNAccount(UIAdditions)

+ (uint64_t)_cnui_requestRefreshWithUserAction:()UIAdditions
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD aBlock[6];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CNAccount_UIAdditions___cnui_requestRefreshWithUserAction___block_invoke;
  aBlock[3] = &unk_1E204DED8;
  aBlock[4] = &v12;
  aBlock[5] = a1;
  v11 = a3;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (a3)
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
  else
  {
    v6 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(9, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v6, v7, v5);

  }
  v8 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v8;
}

+ (void)_cnui_canRequestRefreshWithCompletion:()UIAdditions
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = dispatch_time(0, 100000000);
  dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CNAccount_UIAdditions___cnui_canRequestRefreshWithCompletion___block_invoke;
  v8[3] = &unk_1E204DEB0;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  dispatch_after(v5, v6, v8);

}

+ (uint64_t)_cnui_accountStore
{
  return objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
}

- (id)_cnui_displayName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "externalIdentifierString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_class();
  if (v1)
  {
    objc_msgSend(v2, "_cnui_accountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountWithIdentifier:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_cnui_displayNameForACAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "_cnui_displayNameForLocal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_cnui_displayNameForLocal
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "model");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_cnui_displayNameForACAccount:()UIAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accountDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "accountType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountTypeDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        CNContactsUIBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_SOURCE_STRING"), &stru_1E20507A8, CFSTR("Localized"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    objc_msgSend(a1, "_cnui_displayNameForLocal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (uint64_t)_cnui_isFacebookACAccount:()UIAdditions
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F088]);

  return v5;
}

@end
