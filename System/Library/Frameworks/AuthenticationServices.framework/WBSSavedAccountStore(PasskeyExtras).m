@implementation WBSSavedAccountStore(PasskeyExtras)

+ (id)passkeysData
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentials");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_passkeyDataFromWebKitPasskeyData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recentlyDeletedPasskeysData
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentialsWithRPIDAndAccessGroup:rpID:", CFSTR("com.apple.webkit.webauthn-recently-deleted"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_passkeyDataFromWebKitPasskeyData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)_passkeyDataFromWebKitPasskeyData:()PasskeyExtras
{
  return objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_32);
}

+ (id)_displayNameForOriginalContributorParticipantID:()PasskeyExtras inGroupID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[_ASAccountSharingGroupMemberDataManager sharedManager](_ASAccountSharingGroupMemberDataManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayNameForOriginalContributorParticipantID:inGroupID:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)passkeyDataForPasskeyCredentialID:()PasskeyExtras
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentialsWithCredentialID:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_passkeyDataFromWebKitPasskeyData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)deletePasskeyWithIdentifier:()PasskeyExtras
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "canCurrentUserEditSavedAccountsInGroupWithID:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v3, "credentialID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithBase64EncodedString:options:", v8, 0);

    v10 = (void *)MEMORY[0x24BDFA9C0];
    objc_msgSend(v3, "groupID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteLocalAuthenticatorCredentialWithGroupAndID:credential:", v11, v9);

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasskeys();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[WBSSavedAccountStore(PasskeyExtras) deletePasskeyWithIdentifier:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

}

+ (void)updateUserVisibleName:()PasskeyExtras forPasskeyWithIdentifier:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "canCurrentUserEditSavedAccountsInGroupWithID:", v8);

  if ((v9 & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v6, "credentialID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithBase64EncodedString:options:", v11, 0);

      v13 = (void *)MEMORY[0x24BDFA9C0];
      objc_msgSend(v6, "groupID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNameForLocalCredentialWithGroupAndID:credential:name:", v14, v12, v5);

    }
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXPasskeys();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      +[WBSSavedAccountStore(PasskeyExtras) updateUserVisibleName:forPasskeyWithIdentifier:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

+ (id)exportPasskeyCredentialWithID:()PasskeyExtras
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);
    if (objc_msgSend(v4, "length"))
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x24BDFA9C0], "exportLocalAuthenticatorCredentialWithID:error:", v4, &v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (objc_msgSend(v5, "length"))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D08]), "initWithFirst:second:", v4, v5);
      }
      else
      {
        v8 = WBS_LOG_CHANNEL_PREFIXPasskeys();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          +[WBSSavedAccountStore(PasskeyExtras) exportPasskeyCredentialWithID:].cold.1((uint64_t)v4, v8, v6);
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)importPasskeyCredential:()PasskeyExtras
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") && objc_msgSend(v5, "length"))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDFA9C0], "importLocalAuthenticatorCredential:error:", v5, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDFA9D0]))
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == 15)
      {
        v10 = v4;
        goto LABEL_10;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v6, "length"))
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasskeys();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[WBSSavedAccountStore(PasskeyExtras) importPasskeyCredential:].cold.1(v12, v7);
      v11 = 0;
      goto LABEL_14;
    }
    v10 = v6;
LABEL_10:
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

+ (void)deletePasskeyWithIdentifier:()PasskeyExtras .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_20E4D9000, a1, a3, "The user tried to delete a passkey in a group they have read only permission in.", a5, a6, a7, a8, 0);
}

+ (void)updateUserVisibleName:()PasskeyExtras forPasskeyWithIdentifier:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_20E4D9000, a1, a3, "The user tried to change the username for a passkey in a group they have read only permission in.", a5, a6, a7, a8, 0);
}

+ (void)exportPasskeyCredentialWithID:()PasskeyExtras .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_20E4D9000, v5, OS_LOG_TYPE_ERROR, "Failed to export passkey (%{private}@): %@", (uint8_t *)&v7, 0x16u);

}

+ (void)importPasskeyCredential:()PasskeyExtras .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Failed to import passkey: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
