@implementation CNContactPickerServiceViewController

- (CNContactPickerServiceViewController)init
{
  CNContactPickerServiceViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerServiceViewController;
  v2 = -[CNContactPickerContentViewController init](&v4, sel_init);
  -[CNContactPickerContentViewController setDelegate:](v2, "setDelegate:", v2);
  return v2;
}

- (id)_filteredContact:(id)a3 withKeys:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (_filteredContact_withKeys__cn_once_token_1 != -1)
    dispatch_once(&_filteredContact_withKeys__cn_once_token_1, &__block_literal_global_23720);
  v7 = (id)_filteredContact_withKeys__cn_once_object_1;
  v8 = v7;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)objc_msgSend(v5, "copyWithPropertyKeys:", v8);

  return v9;
}

- (id)_filteredProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerServiceViewController _filteredContact:withKeys:](self, "_filteredContact:withKeys:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C97280];
  objc_msgSend(v4, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "contactPropertyWithContact:propertyKey:identifier:", v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)pickerDidSelectAddNewContact
{
  id v3;

  -[CNContactPickerServiceViewController _logPrivacyAccountingAccessEvent](self, "_logPrivacyAccountingAccessEvent");
  -[CNContactPickerServiceViewController extensionContext](self, "extensionContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerDidSelectAddNewContact");

}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = v6;
  v8 = v7;
  v9 = v14;
  v10 = v8;
  if (!-[CNContactPickerContentViewController clientHasContactsAccess](self, "clientHasContactsAccess"))
  {
    if (v14)
    {
      -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v14;
      if (v11)
      {
        -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactPickerServiceViewController _filteredContact:withKeys:](self, "_filteredContact:withKeys:", v14, v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v8)
        goto LABEL_6;
    }
    else
    {
      v9 = 0;
      if (v8)
      {
LABEL_6:
        -[CNContactPickerServiceViewController _filteredProperty:](self, "_filteredProperty:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    v10 = 0;
  }
LABEL_9:
  -[CNContactPickerServiceViewController _logPrivacyAccountingAccessEvent](self, "_logPrivacyAccountingAccessEvent");
  -[CNContactPickerServiceViewController extensionContext](self, "extensionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pickerDidSelectContact:property:", v9, v10);

}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = v9;
  v11 = v8;
  if (-[CNContactPickerContentViewController clientHasContactsAccess](self, "clientHasContactsAccess"))
    goto LABEL_23;
  if (v8)
  {
    -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v8;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v33;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17);
            -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactPickerServiceViewController _filteredContact:withKeys:](self, "_filteredContact:withKeys:", v18, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "addObject:", v20);
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v15);
      }

    }
    if (v9)
      goto LABEL_13;
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  v11 = 0;
  if (!v9)
    goto LABEL_22;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        -[CNContactPickerServiceViewController _filteredProperty:](self, "_filteredProperty:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v25), (_QWORD)v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

LABEL_23:
  -[CNContactPickerServiceViewController _logPrivacyAccountingAccessEvent](self, "_logPrivacyAccountingAccessEvent", (_QWORD)v28);
  -[CNContactPickerServiceViewController extensionContext](self, "extensionContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pickerDidSelectContacts:properties:", v11, v10);

}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = v8;
  if (!-[CNContactPickerContentViewController clientHasContactsAccess](self, "clientHasContactsAccess"))
  {
    if (v8)
    {
      -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v8;
      if (v5)
      {
        -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactPickerServiceViewController _filteredContact:withKeys:](self, "_filteredContact:withKeys:", v8, v6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v4 = 0;
    }
  }
  -[CNContactPickerServiceViewController _logPrivacyAccountingAccessEvent](self, "_logPrivacyAccountingAccessEvent");
  -[CNContactPickerServiceViewController extensionContext](self, "extensionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerDidCompleteWithNewContact:", v4);

}

- (void)pickerDidCancel
{
  id v2;

  -[CNContactPickerServiceViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerDidCancel");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerServiceViewController;
  -[CNContactPickerServiceViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNContactPickerServiceViewController _logPrivateAccessEventForContactPickerUsage](self, "_logPrivateAccessEventForContactPickerUsage");
}

- (BOOL)shouldRecordPrivateAccessToAggregator
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "authorizationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isFullAccessGranted");
  -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 186, 5, CFSTR("%@ is %@ for full access:"), v7, v8, v9, v10, (uint64_t)v6);

  return v3 ^ 1;
}

- (void)_logPrivateAccessEventForContactPickerUsage
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 9);

  if (v5
    && -[CNContactPickerServiceViewController shouldRecordPrivateAccessToAggregator](self, "shouldRecordPrivateAccessToAggregator"))
  {
    -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPrivateAccessAggregator recordAccessForBundleIdentifier:](CNPrivateAccessAggregator, "recordAccessForBundleIdentifier:", v8);

    }
  }
}

- (void)_logPrivacyAccountingAccessEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  -[CNContactPickerServiceViewController extensionContext](self, "extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_extensionHostAuditToken");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }

  v6[0] = v7;
  v6[1] = v8;
  objc_msgSend(MEMORY[0x1E0D13990], "auditToken:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13B50]), "initWithAuditToken:assumedIdentity:", v4, 0);
  objc_msgSend(v5, "logContactPickerAccessEvent");

}

void __66__CNContactPickerServiceViewController__filteredContact_withKeys___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[27];

  v15[26] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966D0];
  v15[0] = *MEMORY[0x1E0C96790];
  v15[1] = v0;
  v1 = *MEMORY[0x1E0C966C0];
  v15[2] = *MEMORY[0x1E0C96780];
  v15[3] = v1;
  v2 = *MEMORY[0x1E0C96798];
  v15[4] = *MEMORY[0x1E0C96820];
  v15[5] = v2;
  v3 = *MEMORY[0x1E0C967D8];
  v15[6] = *MEMORY[0x1E0C967A0];
  v15[7] = v3;
  v4 = *MEMORY[0x1E0C967D0];
  v15[8] = *MEMORY[0x1E0C967E0];
  v15[9] = v4;
  v5 = *MEMORY[0x1E0C967B8];
  v15[10] = *MEMORY[0x1E0C966B0];
  v15[11] = v5;
  v6 = *MEMORY[0x1E0C96698];
  v15[12] = *MEMORY[0x1E0C967E8];
  v15[13] = v6;
  v7 = *MEMORY[0x1E0C96810];
  v15[14] = *MEMORY[0x1E0C96758];
  v15[15] = v7;
  v8 = *MEMORY[0x1E0C96708];
  v15[16] = *MEMORY[0x1E0C96808];
  v15[17] = v8;
  v9 = *MEMORY[0x1E0C96700];
  v15[18] = *MEMORY[0x1E0C96890];
  v15[19] = v9;
  v10 = *MEMORY[0x1E0C96768];
  v15[20] = *MEMORY[0x1E0C96898];
  v15[21] = v10;
  v11 = *MEMORY[0x1E0C966C8];
  v15[22] = *MEMORY[0x1E0C96688];
  v15[23] = v11;
  v12 = *MEMORY[0x1E0C96828];
  v15[24] = *MEMORY[0x1E0C96830];
  v15[25] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 26);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_filteredContact_withKeys__cn_once_object_1;
  _filteredContact_withKeys__cn_once_object_1 = v13;

}

@end
