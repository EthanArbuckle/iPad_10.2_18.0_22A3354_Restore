@implementation HUUserListTableManager

- (HUUserListTableManager)initWithTableView:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  HUUserListTableManager *v9;
  HUUserListTableManager *v10;
  CNContactStore *v11;
  CNContactStore *contactStore;
  UITableView *tableView;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  UITableView *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUUserListTableManager;
  v9 = -[HUUserListTableManager init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_allowsEditing = 0;
    v11 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v10->_contactStore;
    v10->_contactStore = v11;

    objc_storeWeak((id *)&v10->_viewController, v8);
    objc_storeStrong((id *)&v10->_tableView, a3);
    tableView = v10->_tableView;
    v14 = objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView registerClass:forCellReuseIdentifier:](tableView, "registerClass:forCellReuseIdentifier:", v14, v16);

    v17 = v10->_tableView;
    v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v18, v20);

    -[UITableView setDelegate:](v10->_tableView, "setDelegate:", v10);
    -[UITableView setDataSource:](v10->_tableView, "setDataSource:", v10);
  }

  return v10;
}

- (void)setHome:(id)a3
{
  HMHome *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  HMHome *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (HMHome *)a3;
  if (self->_home == v5)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      v22 = "-[HUUserListTableManager setHome:]";
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%s Skipping since same as previous home %@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_home, a3);
    -[HUUserListTableManager sortedUsers](self, "sortedUsers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager setUsers:](self, "setUsers:", v6);

    -[HUUserListTableManager sortedInvitations](self, "sortedInvitations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager setInvitations:](self, "setInvitations:", v7);

    -[HUUserListTableManager home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[HUUserListTableManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homeAccessControlForUser:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager setAllowsEditing:](self, "setAllowsEditing:", objc_msgSend(v12, "isAdministrator"));

    -[HUUserListTableManager tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HUUserListTableManager users](self, "users");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      -[HUUserListTableManager users](self, "users");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserListTableManager invitations](self, "invitations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      -[HUUserListTableManager invitations](self, "invitations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136316674;
      v22 = "-[HUUserListTableManager setHome:]";
      v23 = 2112;
      v24 = v5;
      v25 = 2048;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v29 = 2048;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      v33 = 1024;
      v34 = -[HUUserListTableManager allowsEditing](self, "allowsEditing");
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%s Updating to new home %@. users (%ld) %@. invitations (%ld) %@. allowsEditing %{BOOL}d", (uint8_t *)&v21, 0x44u);

    }
  }

}

- (id)sortedUsers
{
  void *v2;
  void *v3;
  void *v4;

  -[HUUserListTableManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_105);
  return v4;
}

uint64_t __37__HUUserListTableManager_sortedUsers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)sortedInvitations
{
  void *v2;
  void *v3;
  void *v4;

  -[HUUserListTableManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outgoingInvitations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_4_0);
  return v4;
}

uint64_t __43__HUUserListTableManager_sortedInvitations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "invitee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invitee");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedStandardCompare:", v8);

  return v9;
}

- (void)_reinvite
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__HUUserListTableManager__reinvite__block_invoke;
  v2[3] = &unk_1E6F53EF0;
  v2[4] = self;
  -[HUUserListTableManager _stopSharingWithCompletion:](self, "_stopSharingWithCompletion:", v2);
}

void __35__HUUserListTableManager__reinvite__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CBA948];
    v5 = a2;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithUser:administrator:remoteAccess:", v5, 0, 1);

    objc_msgSend(*(id *)(a1 + 32), "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__HUUserListTableManager__reinvite__block_invoke_2;
    v9[3] = &unk_1E6F4C708;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "inviteUsersWithInviteInformation:completionHandler:", v8, v9);

  }
}

void __35__HUUserListTableManager__reinvite__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home:didUpdateStateForOutgoingInvitations:", v5, v4);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managerDidSendInvitations:", v4);

}

- (void)_stopSharing
{
  -[HUUserListTableManager _stopSharingWithCompletion:](self, "_stopSharingWithCompletion:", 0);
}

- (void)_stopSharingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  id v32;

  v4 = a3;
  -[HUUserListTableManager selectedIndexPath](self, "selectedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUUserListTableManager selectedIndexPath](self, "selectedIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "row");
    -[HUUserListTableManager users](self, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
    {
      -[HUUserListTableManager invitations](self, "invitations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserListTableManager selectedIndexPath](self, "selectedIndexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "row");
      -[HUUserListTableManager users](self, "users");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v18 - objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke_2;
      v27 = &unk_1E6F53F18;
      v13 = &v29;
      v14 = &v28;
      v28 = v20;
      v29 = v4;
      v15 = v20;
      -[HUUserListTableManager _removeInvitation:completion:](self, "_removeInvitation:completion:", v15, &v24);
    }
    else
    {
      -[HUUserListTableManager users](self, "users");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserListTableManager selectedIndexPath](self, "selectedIndexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke;
      v30[3] = &unk_1E6F53F18;
      v13 = &v32;
      v14 = &v31;
      v31 = v12;
      v32 = v4;
      v15 = v12;
      -[HUUserListTableManager _removeUser:completion:](self, "_removeUser:completion:", v15, v30);
    }

    -[HUUserListTableManager setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
  }
  -[HUUserListTableManager viewController](self, "viewController", v24, v25, v26, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "popViewControllerAnimated:", 1);

}

void __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "userID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);

  }
}

void __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "invitee");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);

  }
}

- (void)_removeUser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HUUserListTableManager _didRemoveUser:](self, "_didRemoveUser:", v6);
  -[HUUserListTableManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HUUserListTableManager__removeUser_completion___block_invoke;
  v11[3] = &unk_1E6F53F40;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "removeUserWithoutConfirmation:completionHandler:", v10, v11);

}

void __49__HUUserListTableManager__removeUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12 = v3;
  if (v3)
  {
    objc_msgSend(v4, "_didAddUser:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "managerDidRemoveUser:error:", *(_QWORD *)(a1 + 40), 0);

      }
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v12;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v12);
    v6 = v12;
  }

}

- (void)_removeInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__HUUserListTableManager__removeInvitation_completion___block_invoke;
  v10[3] = &unk_1E6F53F40;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "cancelInviteWithCompletionHandler:", v10);

}

void __55__HUUserListTableManager__removeInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!v10)
    objc_msgSend(*(id *)(a1 + 32), "_didRemoveInvitation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "managerDidCancelInvite:error:", *(_QWORD *)(a1 + 40), v10);

    }
  }
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v10;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
    v9 = v10;
  }

}

- (void)_didAddUser:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[HUUserListTableManager users](self, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v10);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HUUserListTableManager users](self, "users");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addObject:", v10);
    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_14_0);
    -[HUUserListTableManager setUsers:](self, "setUsers:", v7);
    -[HUUserListTableManager users](self, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v10);

    -[HUUserListTableManager _didInsertAtIndex:](self, "_didInsertAtIndex:", v9);
  }

}

uint64_t __38__HUUserListTableManager__didAddUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (void)_didRemoveUser:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HUUserListTableManager users](self, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v8);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HUUserListTableManager users](self, "users");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v8);
    -[HUUserListTableManager setUsers:](self, "setUsers:", v7);
    -[HUUserListTableManager _didRemoveAtIndex:](self, "_didRemoveAtIndex:", v5);

  }
}

- (void)_didRemoveInvitation:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[HUUserListTableManager invitations](self, "invitations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v10);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HUUserListTableManager invitations](self, "invitations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v10);
    -[HUUserListTableManager setInvitations:](self, "setInvitations:", v7);
    -[HUUserListTableManager users](self, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") + v5;

    -[HUUserListTableManager _didRemoveAtIndex:](self, "_didRemoveAtIndex:", v9);
  }

}

- (void)_didInsertAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HUUserListTableManager tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[HUUserListTableManager sectionForPeople](self, "sectionForPeople"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v7, 100);

}

- (void)_didRemoveAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HUUserListTableManager tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[HUUserListTableManager sectionForPeople](self, "sectionForPeople"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 100);

}

- (void)_didReloadAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HUUserListTableManager tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[HUUserListTableManager sectionForPeople](self, "sectionForPeople"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 100);

}

- (id)_contactForUser:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  char v16;
  NSObject *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C97210]);
    v7 = *MEMORY[0x1E0C966D0];
    v35[0] = *MEMORY[0x1E0C966A8];
    v35[1] = v7;
    v35[2] = *MEMORY[0x1E0C966C0];
    objc_msgSend(MEMORY[0x1E0C97518], "descriptorForRequiredKeysIncludingImage:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v8;
    objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v10);

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__13;
    v29 = __Block_byref_object_dispose__13;
    v30 = 0;
    -[HUUserListTableManager contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __42__HUUserListTableManager__contactForUser___block_invoke;
    v21[3] = &unk_1E6F53FC8;
    v13 = v4;
    v22 = v13;
    v23 = &v25;
    v14 = objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, &v24, v21);
    v15 = v24;

    if (v15)
      v16 = v14;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "userID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v15;
        v33 = 2112;
        v34 = v20;
        _os_log_error_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_ERROR, "Error %@ looking up user: %@", buf, 0x16u);

      }
    }
    v18 = (id)v26[5];

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __42__HUUserListTableManager__contactForUser___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_20_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __42__HUUserListTableManager__contactForUser___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)_displayNameForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUUserListTableManager _contactForUser:](self, "_contactForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "userID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "userID");
    else
      _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementUnknownUser"), CFSTR("HUUserManagementUnknownUser"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_stringForInvitationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  HFLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_monogramForUser:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!_monogramForUser__monogrammer)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", 0, 40.0);
    v6 = (void *)_monogramForUser__monogrammer;
    _monogramForUser__monogrammer = v5;

  }
  -[HUUserListTableManager _contactForUser:](self, "_contactForUser:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend((id)_monogramForUser__monogrammer, "monogramForContact:", v7),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend((id)_monogramForUser__monogrammer, "silhouetteMonogram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_personViewControllerForUser:(id)a3 invitation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUUserListTableManager _contactForUser:](self, "_contactForUser:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsEditing:", 0);
    -[HUUserListTableManager home](self, "home");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager _configurePersonViewController:invitation:isRemovable:](self, "_configurePersonViewController:invitation:isRemovable:", v9, v7, objc_msgSend(v11, "isEqual:", v6) ^ 1);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v6, "userID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C97360]);
    v12 = (void *)MEMORY[0x1E0C97338];
    v13 = *MEMORY[0x1E0C96FF8];
    objc_msgSend(v6, "userID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "labeledValueWithLabel:value:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEmailAddresses:", v16);

    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActions:", objc_msgSend(v9, "actions") & 0xFFFFFFFFFFFFFFDFLL);
    -[HUUserListTableManager home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "owner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager _configurePersonViewController:invitation:isRemovable:](self, "_configurePersonViewController:invitation:isRemovable:", v9, v7, objc_msgSend(v17, "isEqual:", v6) ^ 1);

    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (void)_configurePersonViewController:(id)a3 invitation:(id)a4 isRemovable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  objc_msgSend(v15, "setAllowsActions:", 0);
  if (-[HUUserListTableManager allowsEditing](self, "allowsEditing"))
  {
    objc_msgSend(v15, "setDisplayMode:", 2);
    objc_msgSend(v15, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (objc_msgSend(v8, "invitationState") == 4 || objc_msgSend(v8, "invitationState") == 6)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementInviteAgain"), CFSTR("HUUserManagementInviteAgain"), 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cardTopGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addActionWithTitle:target:selector:inGroup:destructive:", v10, self, sel__reinvite, v11, 1);

      }
      v12 = CFSTR("HUUserManagementCancelInvite");
    }
    else
    {
      if (!v5)
      {
LABEL_10:

        goto LABEL_11;
      }
      v12 = CFSTR("HUUserManagementStopSharing");
    }
    _HULocalizedStringWithDefaultValue(v12, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardTopGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addActionWithTitle:target:selector:inGroup:destructive:", v13, self, sel__stopSharing, v14, 1);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)addPeopleViewControllerDidCancel:(id)a3
{
  void *v4;
  id v5;

  -[HUUserListTableManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUUserListTableManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managerDidDismissWithError:", 0);

  }
}

- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a4;
  -[HUUserListTableManager sortedInvitations](self, "sortedInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserListTableManager setInvitations:](self, "setInvitations:", v5);

  -[HUUserListTableManager tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  -[HUUserListTableManager viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

  -[HUUserListTableManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUUserListTableManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managerDidSendInvitations:", v15);

    -[HUUserListTableManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[HUUserListTableManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "managerDidUpdateUserList");

    }
  }

}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HUUserListTableManager_home_didAddUser___block_invoke;
  v7[3] = &unk_1E6F4C638;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __42__HUUserListTableManager_home_didAddUser___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_didAddUser:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "managerDidUpdateUserList");

    }
  }
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HUUserListTableManager_home_didRemoveUser___block_invoke;
  v7[3] = &unk_1E6F4C638;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __45__HUUserListTableManager_home_didRemoveUser___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_didRemoveUser:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "managerDidUpdateUserList");

    }
  }
}

- (void)home:(id)a3 didUpdateStateForOutgoingInvitations:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HUUserListTableManager_home_didUpdateStateForOutgoingInvitations___block_invoke;
  v7[3] = &unk_1E6F4C638;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __68__HUUserListTableManager_home_didUpdateStateForOutgoingInvitations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "invitations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sortedInvitations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInvitations:", v3);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v11 = objc_msgSend(v2, "indexOfObject:", v10);
        v12 = objc_msgSend(v10, "invitationState");
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v12 != 2)
            continue;
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v13, "invitations");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "indexOfObject:", v10);
          objc_msgSend(*(id *)(a1 + 32), "users");
          v16 = v5;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_didInsertAtIndex:", objc_msgSend(v17, "count") + v15);

          v5 = v16;
        }
        else if (v12 == 3 || objc_msgSend(v10, "invitationState") == 1)
        {
          v18 = *(void **)(a1 + 32);
          objc_msgSend(v18, "users");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_didRemoveAtIndex:", objc_msgSend(v14, "count") + v11);
        }
        else
        {
          v19 = *(void **)(a1 + 32);
          objc_msgSend(v19, "users");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_didReloadAtIndex:", objc_msgSend(v14, "count") + v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v7);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "invitations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        if (objc_msgSend(v2, "indexOfObject:", v24) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = *(void **)(a1 + 32);
          objc_msgSend(v25, "invitations");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "indexOfObject:", v24);
          objc_msgSend(*(id *)(a1 + 32), "users");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_didInsertAtIndex:", objc_msgSend(v28, "count") + v27);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "endUpdates");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "managerDidUpdateUserList");

    }
  }

}

- (int64_t)sectionForPeople
{
  return 0;
}

- (int64_t)numberOfDataRows
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[HUUserListTableManager users](self, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[HUUserListTableManager invitations](self, "invitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  return v6;
}

- (BOOL)_indexPathIsInviteUser:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "row");
  return v4 == -[HUUserListTableManager numberOfDataRows](self, "numberOfDataRows");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;

  v5 = -[HUUserListTableManager numberOfDataRows](self, "numberOfDataRows", a3, a4);
  return v5 + -[HUUserListTableManager allowsEditing](self, "allowsEditing");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementUserHeaderTitle"), CFSTR("HUUserManagementUserHeaderTitle"), 1);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementUserFooterTitle"), CFSTR("HUUserManagementUserFooterTitle"), 1);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return !-[HUUserListTableManager _indexPathIsInviteUser:](self, "_indexPathIsInviteUser:", a4)
      && -[HUUserListTableManager allowsEditing](self, "allowsEditing");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "row");
  -[HUUserListTableManager users](self, "users");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[HUUserListTableManager invitations](self, "invitations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") + v10;

  if (v8 >= v12)
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(CFSTR("HUUserManagementInvitePeopleButton"), CFSTR("HUUserManagementInvitePeopleButton"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v23);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v25);

    objc_msgSend(v15, "setUserInteractionEnabled:", -[HUUserListTableManager editing](self, "editing") ^ 1);
    v27 = -[HUUserListTableManager editing](self, "editing") ^ 1;
    objc_msgSend(v15, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEnabled:", v27);

    objc_msgSend(v15, "detailTextLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", 0);

    objc_msgSend(v15, "setAccessoryType:", 0);
  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v6, "row");
    -[HUUserListTableManager users](self, "users");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v16 >= v18)
    {
      v30 = objc_msgSend(v6, "row");
      -[HUUserListTableManager users](self, "users");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v30 - objc_msgSend(v31, "count");

      -[HUUserListTableManager invitations](self, "invitations");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "invitee");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserListTableManager _stringForInvitationState:](self, "_stringForInvitationState:", objc_msgSend(v34, "invitationState"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setInvitationStatusString:", v35);

    }
    else
    {
      -[HUUserListTableManager users](self, "users");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setInvitationStatusString:", 0);
    }
    -[HUUserListTableManager _displayNameForUser:](self, "_displayNameForUser:", v20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDisplayName:", v36);

    objc_msgSend(v20, "userID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
      objc_msgSend(v15, "setSelectionStyle:", 0);

  }
  return v15;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a5;
  v6 = objc_msgSend(v19, "row");
  -[HUUserListTableManager users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 < v8)
  {
    -[HUUserListTableManager users](self, "users");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager _removeUser:completion:](self, "_removeUser:completion:", v10, 0);
LABEL_5:

    goto LABEL_6;
  }
  v11 = objc_msgSend(v19, "row");
  -[HUUserListTableManager users](self, "users");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[HUUserListTableManager invitations](self, "invitations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") + v13;

  if (v11 < v15)
  {
    v16 = objc_msgSend(v19, "row");
    -[HUUserListTableManager users](self, "users");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16 - objc_msgSend(v17, "count");

    -[HUUserListTableManager invitations](self, "invitations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserListTableManager _removeInvitation:completion:](self, "_removeInvitation:completion:", v10, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HUAddPeopleViewController *v16;
  void *v17;
  HUAddPeopleViewController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  -[HUUserListTableManager users](self, "users");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[HUUserListTableManager invitations](self, "invitations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") + v9;

  if (v7 < v11)
  {
    v12 = objc_msgSend(v6, "row");
    -[HUUserListTableManager users](self, "users");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 >= v14)
    {
      v21 = objc_msgSend(v6, "row");
      -[HUUserListTableManager users](self, "users");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21 - objc_msgSend(v22, "count");

      -[HUUserListTableManager invitations](self, "invitations");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "invitee");
      v16 = (HUAddPeopleViewController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUUserListTableManager users](self, "users");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v16 = (HUAddPeopleViewController *)objc_claimAutoreleasedReturnValue();

      v17 = 0;
    }
    -[HUUserListTableManager setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
    -[HUUserListTableManager _personViewControllerForUser:invitation:](self, "_personViewControllerForUser:invitation:", v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[HUUserListTableManager viewController](self, "viewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "navigationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pushViewController:animated:", v20, 1);

    }
    goto LABEL_10;
  }
  if (-[HUUserListTableManager allowsEditing](self, "allowsEditing")
    && -[HUUserListTableManager _indexPathIsInviteUser:](self, "_indexPathIsInviteUser:", v6))
  {
    v18 = [HUAddPeopleViewController alloc];
    -[HUUserListTableManager home](self, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HUAddPeopleViewController initWithHome:viewContext:](v18, "initWithHome:viewContext:", v19, 0);

    -[HUAddPeopleViewController setDelegate:](v16, "setDelegate:", self);
    -[HUUserListTableManager viewController](self, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pushViewController:animated:", v16, 1);
LABEL_10:

  }
  objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)setEditing:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[HUUserListTableManager tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginUpdates");

    -[HUUserListTableManager updateEditingRows](self, "updateEditingRows");
    -[HUUserListTableManager tableView](self, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endUpdates");

  }
}

- (void)updateEditingRows
{
  -[HUUserListTableManager _didReloadAtIndex:](self, "_didReloadAtIndex:", -[HUUserListTableManager numberOfDataRows](self, "numberOfDataRows"));
}

- (HUUserListManagerTableDelegate)delegate
{
  return (HUUserListManagerTableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_storeStrong((id *)&self->_users, a3);
}

- (NSArray)invitations
{
  return self->_invitations;
}

- (void)setInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_invitations, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_invitations, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
