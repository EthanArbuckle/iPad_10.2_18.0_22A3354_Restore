@implementation PMSeparationSource

- (id)name
{
  id *v0;

  v0 = (id *)sub_232C137F8();
  if (!v0)
    sub_232C16240();
  return *v0;
}

- (PMSeparationSource)init
{
  PMSeparationSource *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  PMSeparationSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PMSeparationSource;
  v2 = -[PMSeparationSource init](&v7, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = v2;
  }

  return v2;
}

- (id)_passwordsGroupWithGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PMSeparationGroup *v7;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_232C13EC8;
  v9[3] = &unk_2503FDB90;
  v9[4] = self;
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PMSeparationGroup initWithGroup:participants:]([PMSeparationGroup alloc], "initWithGroup:participants:", v4, v6);
  return v7;
}

- (id)_passwordsParticipantWithParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PMSeparationParticipant *v7;

  v4 = a3;
  objc_msgSend(v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMSeparationSource _participantIdentityWithHandle:](self, "_participantIdentityWithHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PMSeparationParticipant initWithParticipant:identity:]([PMSeparationParticipant alloc], "initWithParticipant:identity:", v4, v6);
  return v7;
}

- (id)_participantIdentityWithHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PMSeparationParticipantIdentity *v10;
  void *v11;
  PMSeparationParticipantIdentity *v12;
  PMSeparationParticipantIdentity *v13;
  NSObject *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBACA0];
  v16[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContactsMatchingHandleStrings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](self->_contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, MEMORY[0x24BDBD1A8], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [PMSeparationParticipantIdentity alloc];
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PMSeparationParticipantIdentity initWithContactIdentifier:](v10, "initWithContactIdentifier:", v11);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BE192B0], "isStringPhoneNumber:", v4))
    {
      v13 = -[PMSeparationParticipantIdentity initWithPhoneNumber:]([PMSeparationParticipantIdentity alloc], "initWithPhoneNumber:", v4);
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x24BE19260], "isStringEmailAddress:", v4) & 1) == 0)
      {
        v14 = sub_232C13A10();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_232C162B4();
      }
      v13 = -[PMSeparationParticipantIdentity initWithEmailAddress:]([PMSeparationParticipantIdentity alloc], "initWithEmailAddress:", v4);
    }
    v12 = v13;
  }

  return v12;
}

- (void)_stopSharingWithGroup:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v9 = a3;
  objc_msgSend(v9, "currentUserParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "permissionLevel");

  if (v8 == 2)
    -[PMSeparationSource _removeAllOtherParticipantsFromGroup:completionHandler:](self, "_removeAllOtherParticipantsFromGroup:completionHandler:", v9, v6);
  else
    -[PMSeparationSource _leaveGroup:completionHandler:](self, "_leaveGroup:completionHandler:", v9, v6);

}

- (void)_removeAllOtherParticipantsFromGroup:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, _QWORD);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v7, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    v6[2](v6, 0);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isCurrentUser") & 1) == 0)
            objc_msgSend(v7, "removeParticipant:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84A0]), "initWithUpdatedGroup:", v7);
    objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_232C14368;
    v17[3] = &unk_2503FDBB8;
    v18 = v5;
    v19 = v6;
    objc_msgSend(v16, "updateGroupWithRequest:completion:", v15, v17);

  }
}

- (void)_removeParticipant:(id)a3 fromGroup:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v10, "removeParticipant:", v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84A0]), "initWithUpdatedGroup:", v10);
  objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_232C144F0;
  v16[3] = &unk_2503FDBE0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v12, "updateGroupWithRequest:completion:", v11, v16);

}

- (void)_stopSharingWithGroups:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  PMSeparationSource *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  int v25;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2810000000;
  v24[3] = &unk_232C1773F;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_232C146F4;
  v19[3] = &unk_2503FDC30;
  v11 = v8;
  v20 = v11;
  v21 = self;
  v23 = v24;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
  dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = sub_232C1480C;
  block[3] = &unk_2503FDC58;
  v17 = v12;
  v18 = v7;
  v14 = v7;
  v15 = v12;
  dispatch_group_notify(v11, v13, block);

  _Block_object_dispose(v24, 8);
}

- (void)_stopSharingWithParticipantsMatchingHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_232C149CC;
  v8[3] = &unk_2503FDCA8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PMSeparationSource _groupsAndParticipantsMatchingHandle:completionHandler:](self, "_groupsAndParticipantsMatchingHandle:completionHandler:", a3, v8);

}

- (void)_groupsAndParticipantsMatchingHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_232C14EB4;
  v10[3] = &unk_2503FDCA8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[PMSeparationSource _fetchGroupsExcludingInvitationsWithCompletionHandler:](self, "_fetchGroupsExcludingInvitationsWithCompletionHandler:", v10);

}

- (void)_stopSharingWithParticipant:(id)a3 inGroup:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "currentUserParticipant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "permissionLevel");

  if (v11 == 2)
    -[PMSeparationSource _removeParticipant:fromGroup:completionHandler:](self, "_removeParticipant:fromGroup:completionHandler:", v12, v9, v8);
  else
    -[PMSeparationSource _leaveGroup:completionHandler:](self, "_leaveGroup:completionHandler:", v9, v8);

}

- (void)_leaveGroup:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE8490]), "initWithGroupID:", v7);
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:isForAlreadyExitedGroup:", v7, 0);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_232C153A4;
    v16[3] = &unk_2503FDD20;
    v17 = v5;
    v19 = v6;
    v18 = v7;
    objc_msgSend(v11, "leaveGroupWithRequest:completion:", v8, v16);

    v12 = v17;
  }
  else
  {
    v13 = sub_232C13A10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_232C16534();
    v14 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = CFSTR("Failed to copy contributed items back to My Passwords from group.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain"), 2, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v15);

  }
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_232C13A10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232C12000, v5, OS_LOG_TYPE_INFO, "Fetch shared groups", buf, 2u);
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_232C15564;
    v7[3] = &unk_2503FDCA8;
    v7[4] = self;
    v8 = v4;
    -[PMSeparationSource _fetchGroupsExcludingInvitationsWithCompletionHandler:](self, "_fetchGroupsExcludingInvitationsWithCompletionHandler:", v7);

  }
  else
  {
    v6 = sub_232C13A10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232C12000, v6, OS_LOG_TYPE_INFO, "Ignoring fetch groups request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x24BDBD1A8], 0);
  }

}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  PMSeparationSource *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = sub_232C13A10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_232C12000, v8, OS_LOG_TYPE_INFO, "Stop sharing with group: %@", buf, 0xCu);
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      objc_msgSend(v9, "group");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = sub_232C15918;
      v20[3] = &unk_2503FDD98;
      v21 = v11;
      v22 = self;
      v23 = v7;
      v13 = v11;
      objc_msgSend(v12, "getGroupByGroupID:completion:", v13, v20);

    }
    else
    {
      v15 = sub_232C13A10();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_232C16640();
      v16 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid resource: %@"), v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain"), 1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v19);

    }
  }
  else
  {
    v14 = sub_232C13A10();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232C12000, v14, OS_LOG_TYPE_INFO, "Ignoring stop sharing request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = sub_232C13A10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_232C12000, v8, OS_LOG_TYPE_INFO, "Stop sharing with participant: %@", buf, 0xCu);
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      objc_msgSend(v9, "participant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = sub_232C15D00;
      v19[3] = &unk_2503FDD70;
      v20 = v11;
      v21 = v7;
      v12 = v11;
      -[PMSeparationSource _stopSharingWithParticipantsMatchingHandle:completionHandler:](self, "_stopSharingWithParticipantsMatchingHandle:completionHandler:", v12, v19);

    }
    else
    {
      v14 = sub_232C13A10();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_232C167CC();
      v15 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid participant: %@"), v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v18);

    }
  }
  else
  {
    v13 = sub_232C13A10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232C12000, v13, OS_LOG_TYPE_INFO, "Ignoring stop sharing request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_232C13A10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232C12000, v5, OS_LOG_TYPE_INFO, "Stop all sharing", buf, 2u);
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_232C15E90;
    v7[3] = &unk_2503FDCA8;
    v7[4] = self;
    v8 = v4;
    -[PMSeparationSource _fetchGroupsExcludingInvitationsWithCompletionHandler:](self, "_fetchGroupsExcludingInvitationsWithCompletionHandler:", v7);

  }
  else
  {
    v6 = sub_232C13A10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232C12000, v6, OS_LOG_TYPE_INFO, "Ignoring stop sharing request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_fetchGroupsExcludingInvitationsWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE8488], "all");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_232C1608C;
  v7[3] = &unk_2503FDE28;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "getGroupsWithRequest:completion:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
