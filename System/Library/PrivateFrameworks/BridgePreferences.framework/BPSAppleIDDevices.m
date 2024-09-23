@implementation BPSAppleIDDevices

+ (void)fetchFamilyMemberForDevice:(id)a3 withCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = *MEMORY[0x24BE6B500];
  v7 = a3;
  objc_msgSend(v7, "valueForProperty:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B508]);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v8 | v9)
  {
    v11 = (void *)objc_opt_class();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__BPSAppleIDDevices_fetchFamilyMemberForDevice_withCompletion___block_invoke;
    v12[3] = &unk_24CBE4E58;
    v13 = v5;
    objc_msgSend(v11, "fetchFamilyMemberForAltDSID:username:withCompletion:", v8, v9, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BPSAppleIDDevicesErrorDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);

  }
}

void __63__BPSAppleIDDevices_fetchFamilyMemberForDevice_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v8)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BPSAppleIDDevicesErrorDomain"), 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

+ (void)fetchFamilyMemberForAltDSID:(id)a3 username:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BE30A88]);
  if (v7)
  {
    v22[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExpectedAltDSIDs:", v11);

  }
  else
  {
    pbb_accountsignin_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21147E000, v12, OS_LOG_TYPE_DEFAULT, "Missing altDSID. Forcing a network fetch", buf, 2u);
    }

    objc_msgSend(v10, "setCachePolicy:", 2);
  }
  pbb_accountsignin_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v13, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest fetch start", buf, 2u);
  }

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__BPSAppleIDDevices_fetchFamilyMemberForAltDSID_username_withCompletion___block_invoke;
  v17[3] = &unk_24CBE4E80;
  v19 = v8;
  v20 = v9;
  v18 = v7;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  objc_msgSend(v10, "startRequestWithCompletionHandler:", v17);

}

void __73__BPSAppleIDDevices_fetchFamilyMemberForAltDSID_username_withCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pbb_accountsignin_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest fetch complete, error: %@", buf, 0xCu);

  }
  if (v6)
  {
    v9 = a1[6];
    v10 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD1398];
    v30 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BPSAppleIDDevicesErrorDomain"), 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);

  }
  else if (a1[4])
  {
    v13 = a1[6];
    objc_msgSend(v5, "memberForAltDSID:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);
LABEL_19:

  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "members", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v19, "appleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "caseInsensitiveCompare:", a1[5]);

          if (!v21)
          {
            (*(void (**)(_QWORD, void *, _QWORD))(a1[6] + 16))(a1[6], v19, 0);
            goto LABEL_19;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v16)
          continue;
        break;
      }
    }

    pbb_accountsignin_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)a1[5];
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_21147E000, v22, OS_LOG_TYPE_DEFAULT, "could not find family-member for account: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }

}

+ (BOOL)isNetworkError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BPSAppleIDDevicesErrorDomain")))
    v5 = objc_msgSend(v3, "code") == 2;
  else
    v5 = 0;

  return v5;
}

@end
