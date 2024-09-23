@implementation CNContactToggleBlockCallerAction

- (BOOL)isContactBlockedPreservingChanges:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  CNContactToggleBlockCallerAction *v8;

  v4 = MEMORY[0x1E0C809B0];
  if (!a3)
    cn_runWithObjectLock();
  v8 = self;
  cn_objectResultWithObjectLock();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue", v4, 3221225472, __70__CNContactToggleBlockCallerAction_isContactBlockedPreservingChanges___block_invoke_2, &unk_1E204FA50, v8);

  return v6;
}

- (id)checkIsContactBlocked
{
  void *v2;
  uint64_t v3;

  -[CNContactToggleBlockCallerAction allNumbersAndEmails](self, "allNumbersAndEmails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_any:", &__block_literal_global_13208);

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  v4 = a3;
  if (-[CNContactToggleBlockCallerAction isContactBlockedPreservingChanges:](self, "isContactBlockedPreservingChanges:", 1))
  {
    -[CNContactToggleBlockCallerAction setContactBlocked:](self, "setContactBlocked:", 0);
    -[CNContactAction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionDidFinish:", self);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_BLOCK_CONTACT_INFO_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPreferredStyle:", 0);
    v9 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_BLOCK_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke;
    v20[3] = &unk_1E204F7F0;
    v20[4] = self;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 2, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke_2;
    v19[3] = &unk_1E204F7F0;
    v19[4] = self;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v17);

    -[CNContactAction delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "action:presentViewController:sender:", self, v5, v4);

  }
}

- (id)allNumbersAndEmails
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke;
  v18[3] = &unk_1E204C980;
  v7 = v3;
  v19 = v7;
  objc_msgSend(v5, "_cn_each:", v18);

  -[CNContactAction contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = 3221225472;
  v15 = __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke_2;
  v16 = &unk_1E204C980;
  v17 = v7;
  v10 = v7;
  objc_msgSend(v9, "_cn_each:", &v13);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
  return v11;
}

- (void)setContactBlocked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  _QWORD v7[4];
  BOOL v8;

  v3 = a3;
  -[CNContactToggleBlockCallerAction allNumbersAndEmails](self, "allNumbersAndEmails");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CNContactToggleBlockCallerAction_setContactBlocked___block_invoke;
  v7[3] = &__block_descriptor_33_e18_v16__0__NSString_8l;
  v8 = v3;
  objc_msgSend(v6, "_cn_each:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactToggleBlockCallerAction setIsBlockedCachedValue:](self, "setIsBlockedCachedValue:", v5);

}

- (NSNumber)isBlockedCachedValue
{
  return self->_isBlockedCachedValue;
}

- (void)setIsBlockedCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isBlockedCachedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isBlockedCachedValue, 0);
}

void __54__CNContactToggleBlockCallerAction_setContactBlocked___block_invoke(uint64_t a1)
{
  uint64_t CMFItemFromString;
  const void *v3;

  CMFItemFromString = CreateCMFItemFromString();
  if (CMFItemFromString)
  {
    v3 = (const void *)CMFItemFromString;
    if (*(_BYTE *)(a1 + 32))
      CMFBlockListAddItemForAllServices();
    else
      CMFBlockListRemoveItemFromAllServices();
    CFRelease(v3);
  }
}

void __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unformattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setContactBlocked:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

void __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWasCanceled:", *(_QWORD *)(a1 + 32));

}

BOOL __57__CNContactToggleBlockCallerAction_checkIsContactBlocked__block_invoke()
{
  uint64_t CMFItemFromString;
  const void *v1;
  _BOOL8 v2;

  CMFItemFromString = CreateCMFItemFromString();
  if (!CMFItemFromString)
    return 0;
  v1 = (const void *)CMFItemFromString;
  v2 = CMFBlockListIsItemBlocked() == 1;
  CFRelease(v1);
  return v2;
}

void __70__CNContactToggleBlockCallerAction_isContactBlockedPreservingChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 80);
  *(_QWORD *)(v1 + 80) = 0;

}

id __70__CNContactToggleBlockCallerAction_isContactBlockedPreservingChanges___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[10];
  if (!v3)
  {
    objc_msgSend(v2, "checkIsContactBlocked");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  return v3;
}

@end
