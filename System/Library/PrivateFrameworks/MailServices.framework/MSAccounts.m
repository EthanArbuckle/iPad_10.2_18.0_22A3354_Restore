@implementation MSAccounts

+ (BOOL)hasActiveAccounts
{
  MSAccounts *v2;
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = objc_alloc_init(MSAccounts);
  -[MSMailDefaultService setShouldLaunchMobileMail:](v2, "setShouldLaunchMobileMail:", 1);
  v3 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__MSAccounts_hasActiveAccounts__block_invoke;
  v7[3] = &unk_24C385150;
  v9 = &v10;
  v5 = v3;
  v8 = v5;
  -[MSAccounts _listAccountKeys:originatingBundleID:sourceAccountManagement:handler:](v2, "_listAccountKeys:originatingBundleID:sourceAccountManagement:handler:", v4, 0, 1, v7);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __31__MSAccounts_hasActiveAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v5 && objc_msgSend(v6, "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)accountValuesForKeys:(id)a3 completionBlock:(id)a4
{
  objc_msgSend(a1, "accountValuesForKeys:originatingBundleID:sourceAccountManagement:launchMobileMail:completionBlock:", a3, 0, 1, 1, a4);
}

+ (void)accountValuesForKeys:(id)a3 launchMobileMail:(BOOL)a4 completionBlock:(id)a5
{
  objc_msgSend(a1, "accountValuesForKeys:originatingBundleID:sourceAccountManagement:launchMobileMail:completionBlock:", a3, 0, 1, a4, a5);
}

+ (void)accountValuesForKeys:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5 launchMobileMail:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  id v11;
  id v12;
  MSAccounts *v13;
  id v14;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v14 = a3;
  v11 = a4;
  v12 = a7;
  v13 = objc_alloc_init(MSAccounts);
  -[MSMailDefaultService setShouldLaunchMobileMail:](v13, "setShouldLaunchMobileMail:", v8);
  -[MSAccounts _listAccountKeys:originatingBundleID:sourceAccountManagement:handler:](v13, "_listAccountKeys:originatingBundleID:sourceAccountManagement:handler:", v14, v11, v9, v12);

}

- (void)_listAccountKeys:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5 handler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v7 = *(_QWORD *)&a5;
  v21[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x20BD2EA04]();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v20[0] = CFSTR("keys");
  v20[1] = CFSTR("bundleID");
  v21[0] = v10;
  v21[1] = v11;
  v20[2] = CFSTR("sourceAccountManagement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__MSAccounts__listAccountKeys_originatingBundleID_sourceAccountManagement_handler___block_invoke;
  v18[3] = &unk_24C385178;
  v17 = v12;
  v19 = v17;
  -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("ListAccounts"), v16, v18);

  objc_autoreleasePoolPop(v13);
}

void __83__MSAccounts__listAccountKeys_originatingBundleID_sourceAccountManagement_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("accounts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)canSendMail
{
  return objc_msgSend(a1, "canSendMailSourceAccountManagement:", 1);
}

+ (BOOL)canSendMailSourceAccountManagement:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class sharedConnection](getMCProfileConnectionClass(), "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "canSendMail:sourceAccountManagement:", v5, v3);

  return v3;
}

+ (id)customSignatureForSendingEmailAddress:(id)a3
{
  __CFString *v3;
  MSAccounts *v4;
  const __CFString *v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v4 = objc_alloc_init(MSAccounts);
  -[MSMailDefaultService setShouldLaunchMobileMail:](v4, "setShouldLaunchMobileMail:", 1);
  if (v3)
    v5 = v3;
  else
    v5 = &stru_24C386120;
  v20 = CFSTR("sendingEmailAddress");
  v21[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__MSAccounts_customSignatureForSendingEmailAddress___block_invoke;
  v11[3] = &unk_24C3851A0;
  v12 = v7;
  v13 = &v14;
  v8 = v7;
  -[MSService _callServicesMethod:arguments:callback:](v4, "_callServicesMethod:arguments:callback:", CFSTR("CustomSignature"), v6, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __52__MSAccounts_customSignatureForSendingEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKey:", CFSTR("signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)deleteAccountsWithUniqueIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  MSAccounts *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  int v10;
  BOOL v11;
  _QWORD v13[4];
  dispatch_semaphore_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v6 = objc_alloc_init(MSAccounts);
  -[MSMailDefaultService setShouldLaunchMobileMail:](v6, "setShouldLaunchMobileMail:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v5, CFSTR("accountUniqueIdentifiers"), 0);
  v8 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__MSAccounts_deleteAccountsWithUniqueIdentifiers_error___block_invoke;
  v13[3] = &unk_24C3851C8;
  v16 = &v17;
  v14 = v8;
  v15 = &v23;
  v9 = v8;
  -[MSService _callServicesMethod:arguments:callback:](v6, "_callServicesMethod:arguments:callback:", CFSTR("RemoveAccounts"), v7, v13);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v10 = *((unsigned __int8 *)v24 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __56__MSAccounts_deleteAccountsWithUniqueIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("success"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "BOOLValue");

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)mailboxListingForAccountWithUniqueIdentifier:(id)a3 keys:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  MSAccounts *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  dispatch_semaphore_t v18;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MSAccounts);
  v11 = (void *)MEMORY[0x20BD2EA04](-[MSMailDefaultService setShouldLaunchMobileMail:](v10, "setShouldLaunchMobileMail:", 1));
  v20 = v7;
  v21[0] = CFSTR("accountUniqueIdentifiers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("keys");
  v22[0] = v12;
  v22[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __80__MSAccounts_mailboxListingForAccountWithUniqueIdentifier_keys_completionBlock___block_invoke;
  v17[3] = &unk_24C3851F0;
  v15 = v9;
  v18 = v14;
  v19 = v15;
  v16 = v14;
  -[MSService _callServicesMethod:arguments:callback:](v10, "_callServicesMethod:arguments:callback:", CFSTR("ListMailboxes"), v13, v17);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v11);
}

void __80__MSAccounts_mailboxListingForAccountWithUniqueIdentifier_keys_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("mailboxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (BOOL)setPushStateForMailboxWithPath:(id)a3 account:(id)a4 pushState:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  MSAccounts *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v7 = a5;
  v32[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v11 = objc_alloc_init(MSAccounts);
  v12 = (void *)MEMORY[0x20BD2EA04](-[MSMailDefaultService setShouldLaunchMobileMail:](v11, "setShouldLaunchMobileMail:", 1));
  v30 = v10;
  v31[0] = CFSTR("accountUniqueIdentifiers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v32[1] = v9;
  v31[1] = CFSTR("relativePath");
  v31[2] = CFSTR("pushState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__MSAccounts_setPushStateForMailboxWithPath_account_pushState_error___block_invoke;
  v19[3] = &unk_24C385218;
  v19[4] = &v26;
  v19[5] = &v20;
  -[MSService _callServicesMethod:arguments:callback:](v11, "_callServicesMethod:arguments:callback:", CFSTR("MailboxPushState"), v15, v19);

  objc_autoreleasePoolPop(v12);
  v16 = *((unsigned __int8 *)v27 + 24);
  if (a6 && !*((_BYTE *)v27 + 24))
  {
    *a6 = objc_retainAutorelease((id)v21[5]);
    v16 = *((unsigned __int8 *)v27 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __69__MSAccounts_setPushStateForMailboxWithPath_account_pushState_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("success"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "BOOLValue");

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

+ (id)attachmentCapabilities
{
  MSAccounts *v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v2 = objc_alloc_init(MSAccounts);
  v3 = (void *)MEMORY[0x20BD2EA04](-[MSMailDefaultService setShouldLaunchMobileMail:](v2, "setShouldLaunchMobileMail:", 1));
  v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__MSAccounts_attachmentCapabilities__block_invoke;
  v8[3] = &unk_24C3851A0;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  -[MSService _callServicesMethod:arguments:callback:](v2, "_callServicesMethod:arguments:callback:", CFSTR("AttachmentCapabilities"), MEMORY[0x24BDBD1B8], v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v3);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __36__MSAccounts_attachmentCapabilities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("capabilities"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[16];
  _QWORD v21[17];

  v21[16] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ListAccounts")))
  {
    v20[0] = CFSTR("uniqueID");
    v20[1] = CFSTR("fullUserName");
    v21[0] = CFSTR("6ADE0CAF-7F5B-4251-A792-71ECB04D5617");
    v21[1] = CFSTR("Example User");
    v20[2] = CFSTR("username");
    v20[3] = CFSTR("emailAddresses");
    v21[2] = CFSTR("example");
    v21[3] = &unk_24C38A118;
    v20[4] = CFSTR("emailAddressAndAliases");
    v20[5] = CFSTR("fromEmailAddresses");
    v21[4] = &unk_24C38A130;
    v21[5] = &unk_24C38A148;
    v20[6] = CFSTR("fromEmailAddressesIncludingDisabled");
    v20[7] = CFSTR("defaultAddress");
    v21[6] = &unk_24C38A160;
    v21[7] = &unk_24C38A178;
    v20[8] = CFSTR("isDefaultSendingAccount");
    v20[9] = CFSTR("isActive");
    v21[8] = &unk_24C38A190;
    v21[9] = &unk_24C38A190;
    v20[10] = CFSTR("restrictsRepliesAndForwards");
    v20[11] = CFSTR("sendingRestricted");
    v21[10] = &unk_24C38A1A8;
    v21[11] = &unk_24C38A1A8;
    v20[12] = CFSTR("supportsThreadOperations");
    v20[13] = CFSTR("supportsMailDrop");
    v21[12] = &unk_24C38A190;
    v21[13] = &unk_24C38A190;
    v20[14] = CFSTR("isManaged");
    v20[15] = CFSTR("attachmentCapabilities");
    v21[14] = &unk_24C38A1A8;
    v21[15] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v18 = CFSTR("accounts");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, v13, 0);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CustomSignature")))
    {
      v14.receiver = self;
      v14.super_class = (Class)MSAccounts;
      -[MSService _simulateServicesMethod:arguments:callback:](&v14, sel__simulateServicesMethod_arguments_callback_, v8, v9, v10);
      goto LABEL_7;
    }
    v15 = CFSTR("signature");
    v16 = CFSTR("Sent from my iPhone Simulator");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11, 0);
  }

LABEL_7:
}

@end
