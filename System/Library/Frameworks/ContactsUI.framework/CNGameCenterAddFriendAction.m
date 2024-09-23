@implementation CNGameCenterAddFriendAction

- (CNGameCenterAddFriendAction)initWithContact:(id)a3
{
  CNGameCenterAddFriendAction *v3;
  void *v4;
  uint64_t v5;
  CNSchedulerProvider *schedulerProvider;
  CNGameCenterAddFriendAction *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNGameCenterAddFriendAction;
  v3 = -[CNContactAction initWithContact:](&v9, sel_initWithContact_, a3);
  if (v3)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultSchedulerProvider");
    v5 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v3->_schedulerProvider;
    v3->_schedulerProvider = (CNSchedulerProvider *)v5;

    v7 = v3;
  }

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GAME_CENTER_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performActionWithSender:(id)a3
{
  id v4;

  -[CNContactAction contact](self, "contact", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterAddFriendAction addContactAsFriend:](self, "addContactAsFriend:", v4);

}

- (void)addContactAsFriend:(id)a3
{
  id v4;
  Class v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CNGameCenterAddFriendAction *v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = (Class)getGKDaemonProxyClass[0]();
    objc_msgSend((Class)getGKLocalPlayerClass[0](), "currentLocalPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class proxyForPlayer:](v5, "proxyForPlayer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke;
    v9[3] = &unk_1E2047C78;
    objc_copyWeak(&v13, &location);
    v10 = v4;
    v11 = self;
    v8 = v7;
    v12 = v8;
    -[CNGameCenterAddFriendAction supportsFriendingViaPushWithProxy:completion:](self, "supportsFriendingViaPushWithProxy:completion:", v8, v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  else
  {
    -[CNGameCenterAddFriendAction inviteViaMessages:](self, "inviteViaMessages:", v4);
  }

}

- (void)inviteViaMessages:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CNGameCenterAddFriendAction_inviteViaMessages___block_invoke;
  v5[3] = &unk_1E2047CA0;
  objc_copyWeak(&v6, &location);
  -[CNGameCenterAddFriendAction createInviteFriendViewControllerForContact:completionHandler:](self, "createInviteFriendViewControllerForContact:completionHandler:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)supportsFriendingViaPushWithProxy:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "profileServicePrivate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke;
  v12[3] = &unk_1E2047CF0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "filterForContactIDsSupportingFriendingViaPushFromContactIDs:withCompletion:", v10, v12);

}

- (void)fetchContactAssociationIDWithProxy:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "profileServicePrivate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke;
  v11[3] = &unk_1E2047D18;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "getContactAssociationIDsForContacts:shouldRefresh:completionHandler:", v9, 1, v11);

}

- (void)sendInvitationViaPushToContactAssociationID:(id)a3 withProxy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "friendServicePrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke;
  v12[3] = &unk_1E204F0E8;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "sendFriendInvitationWithPlayerID:contactAssociationID:completion:", 0, v9, v12);

}

- (void)addContactToFriendSuggestionsDenylistWithProxy:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  objc_msgSend(a3, "utilityServicePrivate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke;
  v11[3] = &unk_1E204F0E8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "denyContact:handler:", v9, v11);

}

- (void)createInviteFriendViewControllerForContact:(id)a3 completionHandler:(id)a4
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  Class v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (Class (__cdecl *)())getGKFriendRequestFacilitatorClass[0];
  v7 = a3;
  v8 = v6();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__CNGameCenterAddFriendAction_createInviteFriendViewControllerForContact_completionHandler___block_invoke;
  v11[3] = &unk_1E2047D40;
  v12 = v5;
  v10 = v5;
  -[objc_class makeViewControllerForInviteWithRecipients:chatGUID:resultHandler:](v8, "makeViewControllerForInviteWithRecipients:chatGUID:resultHandler:", v9, 0, v11);

}

- (id)contactPerHandleForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_cn_map:", &__block_literal_global_25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)actionTitleForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    objc_msgSend(v3, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)addFriendsMenuProvider
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke;
  v4[3] = &unk_1E204D1C0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

id __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(WeakRetained, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contactPerHandleForContact:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_26;
  v12[3] = &unk_1E2047D68;
  v12[4] = WeakRetained;
  v12[5] = &v13;
  objc_msgSend(v9, "_cn_each:", v12);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v14[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionTitleForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v6 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_2;
    v15 = &unk_1E20504A8;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v3;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v4, v7, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v8, v12, v13, v14, v15, v16);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

uint64_t __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactAsFriend:", *(_QWORD *)(a1 + 40));
}

id __58__CNGameCenterAddFriendAction_contactPerHandleForContact___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0C97360];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setEmailAddresses:", v5);
  return v4;
}

id __58__CNGameCenterAddFriendAction_contactPerHandleForContact___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0C97360];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPhoneNumbers:", v5);
  return v4;
}

uint64_t __92__CNGameCenterAddFriendAction_createInviteFriendViewControllerForContact_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke_2;
  v8[3] = &unk_1E204F9B0;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "performBlock:", v8);

}

uint64_t __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke_2;
  v8[3] = &unk_1E204F9B0;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "performBlock:", v8);

}

uint64_t __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke_2;
  v13[3] = &unk_1E204F9B0;
  v11 = *(id *)(a1 + 40);
  v14 = v8;
  v15 = v11;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

uint64_t __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke_2;
  v10[3] = &unk_1E2047CC8;
  v11 = *(id *)(a1 + 40);
  v12 = v7;
  objc_msgSend(v9, "performBlock:", v10);

}

uint64_t __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __49__CNGameCenterAddFriendAction_inviteViaMessages___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 1) != 0)
      objc_msgSend(v6, "action:presentViewController:modalPresentationStyle:sender:", WeakRetained, v8, objc_msgSend(v8, "modalPresentationStyle"), WeakRetained);
    else
      objc_msgSend(v6, "action:presentViewController:sender:", WeakRetained, v8, WeakRetained);

  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_2;
    v9[3] = &unk_1E2047C50;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v10 = v5;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v3, "fetchContactAssociationIDWithProxy:completion:", v4, v9);

    objc_destroyWeak(&v13);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "inviteViaMessages:", *(_QWORD *)(a1 + 32));

  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_11;
    v11[3] = &unk_1E2047C28;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v12 = v6;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v4, "sendInvitationViaPushToContactAssociationID:withProxy:completion:", v3, v5, v11);

    objc_destroyWeak(&v15);
  }
  else
  {
    +[CNGameCenterAddFriendAction os_log](CNGameCenterAddFriendAction, "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "CNGameCenterAddFriendAction: Unable to fetch CAID for contact. Attempting to send via Messages.", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "inviteViaMessages:", *(_QWORD *)(a1 + 32));

  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[CNGameCenterAddFriendAction os_log](CNGameCenterAddFriendAction, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "CNGameCenterAddFriendAction: Unable to send friend invitation via push. Attempting to send via Messages. %@", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "inviteViaMessages:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_12;
    v9[3] = &unk_1E2047C00;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    objc_msgSend(v6, "addContactToFriendSuggestionsDenylistWithProxy:completion:", v7, v9);
    objc_destroyWeak(&v10);
  }

}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject delegate](WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionDidFinish:", WeakRetained);

    +[CNGameCenterAddFriendAction os_log](CNGameCenterAddFriendAction, "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_INFO, "CNGameCenterAddFriendAction: Sent via push.", (uint8_t *)&v7, 2u);
    }
    goto LABEL_6;
  }
  +[CNGameCenterAddFriendAction os_log](CNGameCenterAddFriendAction, "os_log");
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_error_impl(&dword_18AC56000, WeakRetained, OS_LOG_TYPE_ERROR, "CNGameCenterAddFriendAction: Unable to add contact to friend suggestions denylist. %@", (uint8_t *)&v7, 0xCu);
LABEL_6:

  }
}

+ (id)os_log
{
  if (os_log_cn_once_token_4 != -1)
    dispatch_once(&os_log_cn_once_token_4, &__block_literal_global_627);
  return (id)os_log_cn_once_object_4;
}

void __37__CNGameCenterAddFriendAction_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNGameCenterAddFriendAction");
  v1 = (void *)os_log_cn_once_object_4;
  os_log_cn_once_object_4 = (uint64_t)v0;

}

@end
