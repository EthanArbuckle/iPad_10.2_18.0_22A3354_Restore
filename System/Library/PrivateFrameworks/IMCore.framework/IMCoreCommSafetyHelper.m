@implementation IMCoreCommSafetyHelper

+ (id)sharedInstance
{
  if (qword_1ECF12420 != -1)
    dispatch_once(&qword_1ECF12420, &unk_1E471D9B8);
  return (id)qword_1EE65F358;
}

- (void)getOpenChatURLWith:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "childIsYoungAgeGroup");
  v7 = _IMWillLog();
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v5, "parents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    objc_msgSend(v5, "parents", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A20F5C98;
    v15[3] = &unk_1E4722108;
    v9 = &v16;
    v15[4] = self;
    v16 = v4;
    v10 = v4;
    -[IMCoreCommSafetyHelper addressesForParents:completion:](self, "addressesForParents:completion:", v8, v15);

  }
  else
  {
    if (v7)
      _IMAlwaysLog();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A20F5D7C;
    block[3] = &unk_1E471E8B8;
    v9 = &v14;
    block[4] = self;
    v14 = v4;
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)addressesForParents:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  v6 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "contact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          dispatch_group_enter(v6);
          v15 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v13, "contact");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWithObject:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = sub_1A20F6058;
          v27[3] = &unk_1E4722130;
          v27[4] = v13;
          v28 = v7;
          v29 = v6;
          +[IMHandle bestHandlesForContacts:completion:](IMHandle, "bestHandlesForContacts:completion:", v17, v27);

        }
        else
        {
          objc_msgSend(v13, "appleID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v18);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A20F625C;
  block[3] = &unk_1E471E818;
  v24 = v7;
  v25 = v8;
  v26 = v22;
  v19 = v22;
  v20 = v8;
  v21 = v7;
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

}

- (id)_urlFromAddressList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("sms://open"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("service"), *MEMORY[0x1E0D38F68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  IMSharedUtilitiesFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MESSAGE_GROWNUP_BODY"), &stru_1E4725068, CFSTR("CommSafetyLocalizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("body"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("recipients"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  objc_msgSend(v4, "setQueryItems:", v5);
  objc_msgSend(v4, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
