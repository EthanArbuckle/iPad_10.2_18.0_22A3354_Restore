@implementation GKLocalPlayer(Friends)

- (uint64_t)canSendFriendRequest
{
  return 1;
}

- (void)sendFriendInviteTo:()Friends groupId:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E5A5ED00);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("recipient"));
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("recipientContactIdentifier"));

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fetchFriendCodeInExtensionEnabled");

  if (v12)
  {
    objc_msgSend(a1, "openMessagesWith:recipient:groupId:", v8, v9, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__GKLocalPlayer_Friends__sendFriendInviteTo_groupId___block_invoke;
    v16[3] = &unk_1E59C8B00;
    v17 = v8;
    v18 = a1;
    v19 = v9;
    v20 = v7;
    objc_msgSend(v13, "createFriendRequestWithIdentifier:handler:", v15, v16);

  }
}

- (void)openMessagesWith:()Friends recipient:groupId:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v27);
  v9 = objc_claimAutoreleasedReturnValue();
  v25 = v27;
  v26 = (void *)v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
  v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v11, "setScheme:", CFSTR("sms-private"));
  objc_msgSend(v11, "setPath:", CFSTR("open"));
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("service"), CFSTR("iMessage"));
  v13 = (void *)v12;
  if (v8)
  {
    v29[0] = v12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("groupid"), v8);
    v29[1] = v14;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("chatGUID"), v8);
    v29[2] = v15;
    v16 = objc_alloc(MEMORY[0x1E0CB39D8]);
    v17 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("appBundleID"), *MEMORY[0x1E0D24C90]);
    v29[3] = v17;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("appPayload"), v10);
    v29[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setQueryItems:", v20);

  }
  else
  {
    v28[0] = v12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("recipient"), v7);
    v28[1] = v14;
    v21 = objc_alloc(MEMORY[0x1E0CB39D8]);
    v15 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("appBundleID"), *MEMORY[0x1E0D24C90]);
    v28[2] = v15;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("appPayload"), v10);
    v28[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setQueryItems:", v18);
    v19 = v7;
  }

  objc_msgSend(v11, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  objc_msgSend(v23, "openURL:configuration:completionHandler:", v22, v24, &__block_literal_global_52);

}

- (uint64_t)presentFriendRequestCreatorFromViewController:()Friends error:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  v7 = objc_msgSend(a1, "canSendFriendRequest");
  if ((_DWORD)v7)
  {
    +[GKFriendRequestViewController addFriends:](GKFriendRequestViewController, "addFriends:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 103, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
