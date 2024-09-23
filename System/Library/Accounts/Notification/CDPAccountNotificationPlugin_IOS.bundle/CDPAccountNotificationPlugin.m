@implementation CDPAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  int v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v14 = a6;
  if (a4 == 2)
  {
    objc_msgSend_accountType(v10, v12, v13);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_compare_options_(v53, v54, *MEMORY[0x24BDB4080], 4);

    if (v55)
      objc_msgSend__processAppleAcocuntChange_(self, v56, (uint64_t)v10);
    else
      objc_msgSend__processAuthKitAccountChange_oldAccount_(self, v56, (uint64_t)v10, v14);
  }
  else if (a4 == 3 && objc_msgSend__isPrimaryAccount_(self, v12, (uint64_t)v14))
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v57 = 138412290;
      v58 = v14;
      _os_log_impl(&dword_230EED000, v15, OS_LOG_TYPE_DEFAULT, "\"Primary iCloud account deletion detected, clearing follow ups for %@\", (uint8_t *)&v57, 0xCu);
    }

    v16 = objc_alloc_init(MEMORY[0x24BE1A430]);
    objc_msgSend_contextForStateRepair(MEMORY[0x24BE1A428], v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v20, (uint64_t)v19, 0);

    objc_msgSend_contextForOfflinePasscodeChange(MEMORY[0x24BE1A428], v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v24, (uint64_t)v23, 0);

    objc_msgSend_contextForConfirmExistingSecret(MEMORY[0x24BE1A428], v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v28, (uint64_t)v27, 0);

    objc_msgSend_contextForRecoveryKeyRepair(MEMORY[0x24BE1A428], v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v32, (uint64_t)v31, 0);

    objc_msgSend_contextForWalrusCreatePasscodeWithCDPContext_(MEMORY[0x24BE1A428], v33, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v35, (uint64_t)v34, 0);

    objc_msgSend_contextForSOSCompatibilityMode(MEMORY[0x24BE1A428], v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v39, (uint64_t)v38, 0);

    objc_msgSend_contextForRecoveryKeyMismatchHealing(MEMORY[0x24BE1A428], v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v43, (uint64_t)v42, 0);

    objc_msgSend_contextForADPStateHealing(MEMORY[0x24BE1A428], v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clearFollowUpWithContext_error_(v16, v47, (uint64_t)v46, 0);

    _CDPLogSystem();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v57) = 0;
      _os_log_impl(&dword_230EED000, v48, OS_LOG_TYPE_DEFAULT, "\"Primary iCloud account deletion detected, post local walrus state change notification.\", (uint8_t *)&v57, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_CDPWalrusStateChangeDarwinNotification"), 0, 0, 1u);

  }
}

- (BOOL)_isPrimaryAccount:(id)a3
{
  return MEMORY[0x24BEDD108](a3, sel_aa_isAccountClass_, *MEMORY[0x24BE047F0]);
}

- (unint64_t)_calculateCDPSOSCompatibilityTypeWithAccount:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;

  v3 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE0AC98], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hasSOSActiveDeviceForAccount_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_BOOLValue(v8, v9, v10);

  v12 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_isSOSNeededForAccount_(v6, v13, (uint64_t)v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_BOOLValue(v14, v15, v16);

    if (v17)
      v12 |= 2uLL;
  }

  return v12;
}

- (void)_processAuthKitAccountChange:(id)a3 oldAccount:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE1A490]);
  objc_msgSend_sharedInstance(MEMORY[0x24BE0AC98], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_altDSIDForAccount_(v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = objc_msgSend__calculateCDPSOSCompatibilityTypeWithAccount_(self, v14, (uint64_t)v6);
    if (v15 != objc_msgSend__calculateCDPSOSCompatibilityTypeWithAccount_(self, v16, (uint64_t)v7))
      objc_msgSend_setKeyChainSyncCompatibilityState_withAltDSID_(v8, v17, v15, v13);
  }
  else
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_230EEEF58(v18);

  }
}

- (void)_processAppleAcocuntChange:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_accountType(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_compare_options_(v9, v10, *MEMORY[0x24BDB3FD8], 4);

  if (v11)
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_230EEF020(v14);
  }
  else
  {
    objc_msgSend_aa_altDSID(v3, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v15, *MEMORY[0x24BDB42E0], *MEMORY[0x24BDB42C0], *MEMORY[0x24BDB42D0], 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dirtyProperties(v3, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_intersectsSet_(v19, v20, (uint64_t)v16);
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v21 & 1) != 0)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558274;
        v27 = 1752392040;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_230EED000, v23, OS_LOG_TYPE_DEFAULT, "\"Updating keychain sync state in response to dataclass changes for %{mask.hash}@\", buf, 0x16u);
      }

      objc_msgSend_contextForAccountWithAltDSID_(MEMORY[0x24BE1A3F8], v24, (uint64_t)v14);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_synchronizeKeychainSyncForContext_withCompletion_(MEMORY[0x24BE1A440], v25, (uint64_t)v23, &unk_24FFA75F0);
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      sub_230EEEF98((uint64_t)v14, v23);
    }

  }
}

@end
