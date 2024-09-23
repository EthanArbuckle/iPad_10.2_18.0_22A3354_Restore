@implementation CNUIFamilyMemberControllerShared

+ (id)formattedNameOfFamilyMember:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C97360];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v4, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFamilyName:", v7);
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 1000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)contactViewControllerForContact:(id)a3 fromStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActions:", 127);
  objc_msgSend(v7, "setIgnoresParentalRestrictions:", 1);
  objc_msgSend(MEMORY[0x1E0D13CD0], "propertyKeysContainingSenstiveData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProhibitedPropertyKeys:", v8);

  objc_msgSend(v7, "setContactStore:", v5);
  objc_msgSend(v7, "setDisplayMode:", 2);
  objc_msgSend(v7, "setContact:", v6);

  return v7;
}

+ (id)contactMatchingFamilyMemberContactItem:(id)a3 fetchedFromContactStore:(id)a4 schedulerProvider:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0D13A68];
  v16 = MEMORY[0x1E0C809B0];
  v17 = v8;
  v18 = v7;
  v10 = v7;
  v11 = v8;
  v12 = a5;
  objc_msgSend(v12, "backgroundScheduler", v16, 3221225472, __117__CNUIFamilyMemberControllerShared_contactMatchingFamilyMemberContactItem_fetchedFromContactStore_schedulerProvider___block_invoke, &unk_1E204E3E8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithBlock:scheduler:schedulerProvider:", &v16, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)addContactsOptionsSheetForFamilyMember:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3450];
  v8 = a3;
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CHOOSE_FROM_MY_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke;
  v36[3] = &unk_1E204FFA8;
  v14 = v6;
  v37 = v14;
  v15 = v9;
  v38 = v15;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "actionTitleAddNewContactForFamilyMember:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0DC3448];
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_2;
  v33[3] = &unk_1E204FFA8;
  v19 = v14;
  v34 = v19;
  v20 = v15;
  v35 = v20;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v17, 0, v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_3;
  v30[3] = &unk_1E204FFA8;
  v31 = v19;
  v25 = v20;
  v32 = v25;
  v26 = v19;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 1, v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "addAction:", v16);
  objc_msgSend(v25, "addAction:", v21);
  objc_msgSend(v25, "addAction:", v27);
  v28 = v25;

  return v28;
}

+ (id)addContactsToWhitelistOptionsSheetForFamilyMember:(id)a3 offerChooseFromFamilyMemberContactsOption:(BOOL)a4 delegate:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _BOOL4 v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;

  v35 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0DC3450];
  v9 = a3;
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CHOOSE_FROM_MY_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke;
  v47[3] = &unk_1E204FFA8;
  v14 = v7;
  v48 = v14;
  v15 = v10;
  v49 = v15;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v47);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "actionTitleChooseFromContactsForFamilyMember:", v9);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  v18 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_2;
  v44[3] = &unk_1E204FFA8;
  v19 = v14;
  v45 = v19;
  v20 = v15;
  v46 = v20;
  v37 = (void *)v16;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v16, 0, v44);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionTitleAddNewContactForFamilyMember:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0DC3448];
  v41[0] = v18;
  v41[1] = 3221225472;
  v41[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_3;
  v41[3] = &unk_1E204FFA8;
  v24 = v19;
  v42 = v24;
  v25 = v20;
  v43 = v25;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 0, v41);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_4;
  v38[3] = &unk_1E204FFA8;
  v39 = v24;
  v30 = v25;
  v40 = v30;
  v31 = v24;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "addAction:", v36);
  if (v9 && v35)
    objc_msgSend(v30, "addAction:", v21);
  objc_msgSend(v30, "addAction:", v26);
  objc_msgSend(v30, "addAction:", v32);
  v33 = v30;

  return v33;
}

+ (id)actionTitleAddNewContactForFamilyMember:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(a1, "formattedNameOfFamilyMember:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "length"))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_NEW_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_NEW_CONTACT_FOR_MY_CHILD"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ADD_NEW_LOCAL_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)actionTitleChooseFromContactsForFamilyMember:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(a1, "formattedNameOfFamilyMember:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "length"))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CHOOSE_FROM_YOUR_CHILD"), &stru_1E20507A8, CFSTR("Localized"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CHOOSE_FROM_MY_CHILDS_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CHOOSE_FROM_MY_CHILDS_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (int64_t)contactsUIFetchStatusFromContactsUICoreFetchStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_18AF8BAB0[a3 - 1];
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsToWhitelistOptionsSheetDidSelectAddFromMainContacts:", *(_QWORD *)(a1 + 40));
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsToWhitelistOptionsSheetDidSelectAddFromFamilyMemberContacts:", *(_QWORD *)(a1 + 40));
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsToWhitelistOptionsSheetDidSelectAddNewContact:", *(_QWORD *)(a1 + 40));
}

uint64_t __137__CNUIFamilyMemberControllerShared_addContactsToWhitelistOptionsSheetForFamilyMember_offerChooseFromFamilyMemberContactsOption_delegate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsToWhitelistOptionsSheetDidCancel:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsOptionsSheetViewControllerDidSelectAddFromLocalContacts:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsOptionsSheetViewControllerDidSelectAddNewContact:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__CNUIFamilyMemberControllerShared_addContactsOptionsSheetForFamilyMember_delegate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactsOptionsSheetViewControllerDidCancel:", *(_QWORD *)(a1 + 40));
}

id __117__CNUIFamilyMemberControllerShared_contactMatchingFamilyMemberContactItem_fetchedFromContactStore_schedulerProvider___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v7)
  {
    v9 = v7;
  }
  else if (a2)
  {
    *a2 = objc_retainAutorelease(v8);
  }

  return v7;
}

@end
