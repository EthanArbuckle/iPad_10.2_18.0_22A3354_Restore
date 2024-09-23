@implementation AKFollowUpSynchronizer

- (BOOL)synchronizeFollowUpsForAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;

  v6 = a3;
  if (!v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_230EC467C(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "primaryiCloudAccount");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AKFollowUpSynchronizer synchronizeFollowUpsForAccount:inStore:error:](self, "synchronizeFollowUpsForAccount:inStore:error:", v6, v17, a4);

  return v18;
}

- (BOOL)synchronizeFollowUpsForAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v18;

  v8 = a3;
  v9 = a4;
  if (-[AKFollowUpSynchronizer shouldSynchronizeForAccount:](self, "shouldSynchronizeForAccount:", v8))
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_230EC46B0(v8, v10);

    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "altDSIDForAccount:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAltDSID:", v13);

    -[AKFollowUpSynchronizer _authController](self, "_authController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v15 = objc_msgSend(v14, "synchronizeFollowUpItemsForContext:error:", v11, &v18);
    v16 = v18;

    if ((v15 & 1) != 0)
    {
      +[AKFollowUpSynchronizer updateSynchronizeTimeForAccount:inStore:](AKFollowUpSynchronizer, "updateSynchronizeTimeForAccount:inStore:", v8, v9);
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v16);
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ak_errorWithCode:", -7064);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_authController
{
  AKAppleIDAuthenticationController *controller;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  controller = self->_controller;
  if (!controller)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x24BE0ACC0]);
    v5 = self->_controller;
    self->_controller = v4;

    -[AKAppleIDAuthenticationController setDelegate:](self->_controller, "setDelegate:", self);
    controller = self->_controller;
  }
  return controller;
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  return 1;
}

- (BOOL)shouldSynchronizeForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  int v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  const __CFString *v31;
  _QWORD v33[5];
  id v34;
  uint8_t v35[4];
  const __CFString *v36;
  __int128 buf;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accountPropertyForKey:", CFSTR("AKFollowUpAccountRefreshTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;

    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_230EC1000, v10, OS_LOG_TYPE_DEFAULT, "Last follow up refresh occured %@ seconds ago", (uint8_t *)&buf, 0xCu);

    }
    if (v9 < 86400.0)
    {
      -[AKFollowUpSynchronizer followupProvider](self, "followupProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (v13)
      {
        v26 = 0;
      }
      else
      {
        _AKLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_230EC1000, v14, OS_LOG_TYPE_DEFAULT, "Checking for sparse follow ups", (uint8_t *)&buf, 2u);
        }

        -[AKFollowUpSynchronizer followupProvider](self, "followupProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v15, "pendingFollowUpItems:", &v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v34;

        if (v17)
        {
          _AKLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_230EC4788(v18, v19, v20, v21, v22, v23, v24, v25);

          v26 = 1;
        }
        else
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v38 = 0x2020000000;
          v39 = 0;
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = sub_230EC3EBC;
          v33[3] = &unk_24FFA17E0;
          v33[4] = &buf;
          objc_msgSend(v16, "enumerateObjectsUsingBlock:", v33);
          v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
          v26 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
          _AKLogSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = CFSTR("NO");
            if (v27)
              v29 = CFSTR("YES");
            *(_DWORD *)v35 = 138412290;
            v36 = v29;
            _os_log_impl(&dword_230EC1000, v28, OS_LOG_TYPE_DEFAULT, "Sparse followup item detected: %@", v35, 0xCu);
          }

          _Block_object_dispose(&buf, 8);
        }

      }
    }
    else
    {
LABEL_13:
      v26 = 1;
    }
    _AKLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = CFSTR("NO");
      if (v26)
        v31 = CFSTR("YES");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_230EC1000, v30, OS_LOG_TYPE_DEFAULT, "Will synchronize followups %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    LOBYTE(v26) = 0;
  }

  return v26;
}

+ (void)updateSynchronizeTimeForAccount:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "updateSynchronizeTimeNoSaveForAccount:", v7);
  v8 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230EC401C;
  v10[3] = &unk_24FFA1808;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "saveAccount:withCompletionHandler:", v7, v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)updateSynchronizeTimeNoSaveForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_230EC1000, v4, OS_LOG_TYPE_DEFAULT, "Updating follow up synchronization for %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountProperty:forKey:", v5, CFSTR("AKFollowUpAccountRefreshTimestamp"));

}

- (AKFollowUpProvider)followupProvider
{
  return self->_followupProvider;
}

- (void)setFollowupProvider:(id)a3
{
  objc_storeStrong((id *)&self->_followupProvider, a3);
}

- (AKAppleIDAuthenticationController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_followupProvider, 0);
}

@end
