id sub_230EC8BF0(void *a1, const char *a2)
{
  void *v2;
  id v3;

  objc_msgSend_objectForKeyedSubscript_(a1, a2, (uint64_t)CFSTR("lastAuthenticated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t sub_230EC8C50(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_setObject_forKeyedSubscript_(a1, a2, a3, CFSTR("lastAuthenticated"));
}

void sub_230EC904C(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  int isActive;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  Class v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v6, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = v8;
    v55 = 2114;
    v56 = v9;
    _os_log_impl(&dword_230EC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing the change.", (uint8_t *)&v53, 0x16u);

  }
  v11 = *(_DWORD *)(a1 + 64);
  switch(v11)
  {
    case 3:
      objc_msgSend__processAccountDeletion_inStore_(*(void **)(a1 + 32), v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      break;
    case 2:
      objc_msgSend__processAccountModification_oldAccount_inStore_(*(void **)(a1 + 32), v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      break;
    case 1:
      objc_msgSend__processAccountAddition_inStore_(*(void **)(a1 + 32), v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
  }
  objc_msgSend__processAccountFlagsForAccount_oldAccount_(*(void **)(a1 + 32), v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  objc_msgSend__processPrivacyAcknowledgementForAccount_oldAccount_(*(void **)(a1 + 32), v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v13 = *(void **)(a1 + 40);
  if (!v13)
    v13 = *(void **)(a1 + 56);
  v14 = v13;
  if (objc_msgSend_ams_isiTunesAccount(v14, v15, v16))
  {
    v19 = (void *)objc_opt_class();
    objc_msgSend__postAccountsChangedNotificationsIfNeededForAccount_oldAccount_changeType_(v19, v20, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
    isActive = objc_msgSend_isActive(*(void **)(a1 + 56), v21, v22);
    if (isActive != objc_msgSend_isActive(*(void **)(a1 + 40), v24, v25))
    {
      v26 = (void *)objc_opt_class();
      objc_msgSend__postActiveAccountChangedNotification(v26, v27, v28);
      objc_msgSend_registerTokensIfNeeded(MEMORY[0x24BE08378], v29, v30);
      objc_msgSend_accountActiveStatusDidChangeWithAccount_(_TtC28AMSAccountNotificationPlugin34AccountActiveStatusChangeResponder, v31, *(_QWORD *)(a1 + 40));
    }
    v32 = (void *)objc_opt_class();
    objc_msgSend__postStorefontChangedNotificationIfNeededForAccount_oldAccount_store_(v32, v33, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    if (*(_DWORD *)(a1 + 64) != 3)
    {
      v34 = (void *)objc_opt_class();
      objc_msgSend__updateLocalAccountStorefrontIfNeededForAccount_store_(v34, v35, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      if (*(_DWORD *)(a1 + 64) == 2)
      {
        v36 = (void *)objc_opt_class();
        objc_msgSend__postEligibilityOverrideNotificationIfNeededForAccount_oldAccount_(v36, v37, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
      }
    }
    v38 = NSClassFromString(CFSTR("AMSAccountsChangedObservable"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_performSelector_withObject_(v38, v39, (uint64_t)sel__processChangedAccount_, v14);
    }
    else
    {
      objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v39, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_OSLogObject(v43, v41, v42);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_opt_class();
        AMSLogKey();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138543618;
        v54 = v45;
        v55 = 2114;
        v56 = v46;
        _os_log_impl(&dword_230EC7000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to notify AMSAccountsChangedObservables of the change.", (uint8_t *)&v53, 0x16u);

      }
    }
  }
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v17, v18);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v49, v47, v48);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = objc_opt_class();
    AMSLogKey();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = v51;
    v55 = 2114;
    v56 = v52;
    _os_log_impl(&dword_230EC7000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished processing account:didChange:.", (uint8_t *)&v53, 0x16u);

  }
}

uint64_t sub_230EC9D54(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t isDuplicate;

  v3 = a2;
  if ((objc_msgSend_isActive(v3, v4, v5) & 1) != 0)
    isDuplicate = 0;
  else
    isDuplicate = objc_msgSend_ams_isDuplicate_(*(void **)(a1 + 32), v6, (uint64_t)v3);

  return isDuplicate;
}

void sub_230ECA1CC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend_isActive(v5, v6, v7) & 1) == 0
    && objc_msgSend_ams_isDuplicate_(*(void **)(a1 + 32), v8, (uint64_t)v5))
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v13, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      _os_log_impl(&dword_230EC7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found a non-active account that is a duplicate of the account we’re trying to save. Ignoring. account = %{public}@ | existingAccount = %{public}@", (uint8_t *)&v20, 0x2Au);

    }
    objc_msgSend_removeObjectAtIndex_(*(void **)(a1 + 48), v19, a3);
  }

}

void sub_230ECAA44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const __CFString *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = sub_230ECAE78;
  v46[3] = &unk_24FFA2BC0;
  v6 = v3;
  v47 = v6;
  objc_msgSend_ams_firstObjectPassingTest_(v4, v7, (uint64_t)v46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  v41 = v5;
  v42 = 3221225472;
  v43 = sub_230ECAE84;
  v44 = &unk_24FFA2BC0;
  v10 = v6;
  v45 = v10;
  objc_msgSend_ams_firstObjectPassingTest_(v9, v11, (uint64_t)&v41);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend_containsObject_(*(void **)(a1 + 48), v12, (uint64_t)v8, v41, v42, v43, v44) & 1) != 0
    || v14 && (objc_msgSend_containsObject_(*(void **)(a1 + 48), v12, (uint64_t)v14) & 1) != 0)
  {
    goto LABEL_33;
  }
  v15 = 0x24BE08000uLL;
  if (!v8)
  {
    objc_msgSend_sharedAccountsOversizeConfig(MEMORY[0x24BE081D8], v12, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v26, v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v20, v26, v27, v41, v42, v43, v44);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v28 = objc_opt_class();
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v28;
    v15 = 0x24BE08000uLL;
    v50 = 2114;
    v51 = v23;
    v52 = 2114;
    v53 = v24;
    _os_log_impl(&dword_230EC7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cookie ADDED. cookie = %{public}@", buf, 0x20u);
    goto LABEL_15;
  }
  if ((objc_msgSend_isEqual_(v8, v12, (uint64_t)v14) & 1) != 0)
    goto LABEL_17;
  objc_msgSend_sharedAccountsOversizeConfig(MEMORY[0x24BE081D8], v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v20, v18, v19, v41, v42, v43, v44);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_opt_class();
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v49 = v22;
    v15 = 0x24BE08000;
    v50 = 2114;
    v51 = v23;
    v52 = 2114;
    v53 = v24;
    v54 = 2114;
    v55 = v25;
    _os_log_impl(&dword_230EC7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cookie MODIFIED. oldCookie = %{public}@ | newCookie = %{public}@", buf, 0x2Au);

LABEL_15:
  }
LABEL_16:

LABEL_17:
  if ((objc_msgSend_ams_isExpired(v14, v16, v17, v41, v42, v43, v44) & 1) != 0
    || objc_msgSend_ams_isDeleted(v14, v29, v30))
  {
    if ((objc_msgSend_ams_isDeleted(v14, v29, v30) & 1) != 0)
    {
      v33 = CFSTR("DELETED");
    }
    else if (objc_msgSend_ams_isExpired(v14, v31, v32))
    {
      v33 = CFSTR("EXPIRED");
    }
    else
    {
      v33 = CFSTR("UNKNOWN");
    }
    objc_msgSend_sharedAccountsOversizeConfig(*(void **)(v15 + 472), v31, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend_sharedConfig(*(void **)(v15 + 472), v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v36, v34, v35);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_opt_class();
      AMSLogKey();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v38;
      v50 = 2114;
      v51 = v39;
      v52 = 2114;
      v53 = v33;
      v54 = 2114;
      v55 = v40;
      _os_log_impl(&dword_230EC7000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cookie DELETED. reason = %{public}@ | cookie = %{public}@", buf, 0x2Au);

    }
  }
  if (v8)
    objc_msgSend_addObject_(*(void **)(a1 + 48), v29, (uint64_t)v8);
  if (v14)
    objc_msgSend_addObject_(*(void **)(a1 + 48), v29, (uint64_t)v14);
LABEL_33:

}

uint64_t sub_230ECAE78(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a2, sel_ams_isEquivalent_, *(_QWORD *)(a1 + 32));
}

uint64_t sub_230ECAE84(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a2, sel_ams_isEquivalent_, *(_QWORD *)(a1 + 32));
}

void sub_230ECAF3C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v6, (uint64_t)CFSTR("cookies")) & 1) == 0)
  {
    objc_msgSend_sharedAccountsOversizeConfig(MEMORY[0x24BE081D8], v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v11, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_first(v5, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_second(v5, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544386;
      v24 = v13;
      v25 = 2114;
      v26 = v14;
      v27 = 2114;
      v28 = v4;
      v29 = 2114;
      v30 = v18;
      v31 = 2114;
      v32 = v22;
      _os_log_impl(&dword_230EC7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@: value = %{public}@ | oldValue = %{public}@", (uint8_t *)&v23, 0x34u);

    }
  }

}

id sub_230ECB270(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  const char *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD15A8];
  v3 = a2;
  v4 = [v2 alloc];
  v6 = (void *)objc_msgSend_initWithProperties_(v4, v5, (uint64_t)v3);

  return v6;
}

void sub_230ECB2B4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v3 = (objc_class *)MEMORY[0x24BDD15A8];
  v4 = a2;
  v5 = [v3 alloc];
  v7 = (void *)objc_msgSend_initWithProperties_(v5, v6, (uint64_t)v4);

  v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_230ECB368;
  v12[3] = &unk_24FFA2BC0;
  v13 = v7;
  v9 = v7;
  objc_msgSend_ams_removeObjectsPassingTest_(v8, v10, (uint64_t)v12);
  objc_msgSend_addObject_(*(void **)(a1 + 32), v11, (uint64_t)v9);

}

uint64_t sub_230ECB368(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a2, sel_ams_isEquivalent_, *(_QWORD *)(a1 + 32));
}

uint64_t sub_230ECB374(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t isDeleted;

  v2 = a2;
  if ((objc_msgSend_ams_isExpired(v2, v3, v4) & 1) != 0)
    isDeleted = 1;
  else
    isDeleted = objc_msgSend_ams_isDeleted(v2, v5, v6);

  return isDeleted;
}

void sub_230ECCA78(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  id v5;

  objc_msgSend_ams_sharedAccountStore(MEMORY[0x24BDB4398], a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAccount_withCompletionHandler_(v5, v4, *(_QWORD *)(a1 + 32), &unk_24FFA2CF8);

}

void sub_230ECCB58(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  id v5;
  id v6;

  objc_msgSend_ams_sharedAccountStore(MEMORY[0x24BDB4398], a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend_ams_saveAccount_(v6, v4, *(_QWORD *)(a1 + 32));

}

void sub_230ECD68C(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v5, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_230EC7000, v6, OS_LOG_TYPE_DEFAULT, "AMSAccountNotificationPlugin: [%{public}@] Successfully authenticated the iCloud account with iTunes.", (uint8_t *)&v8, 0xCu);

  }
}

void sub_230ECD770(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v7, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_230EC7000, v8, OS_LOG_TYPE_ERROR, "AMSAccountNotificationPlugin: [%{public}@] Failed to authenticate the iCloud account with iTunes. error = %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

id sub_230ECD888()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)qword_255EAAEF0;
  v6 = qword_255EAAEF0;
  if (!qword_255EAAEF0)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = sub_230ED18A8;
    v2[3] = &unk_24FFA2EA0;
    v2[4] = &v3;
    sub_230ED18A8((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    sub_230ED64D0();
  return *v0;
}

void sub_230ECD928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230ECD940(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v5, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_230EC7000, v6, OS_LOG_TYPE_DEFAULT, "AMSAccountNotificationPlugin: [%{public}@] Apple ID GDPR acknowledgement recorded.", (uint8_t *)&v8, 0xCu);

  }
}

void sub_230ECDA24(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v7, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_230EC7000, v8, OS_LOG_TYPE_ERROR, "AMSAccountNotificationPlugin: [%{public}@] Failed to recording Apple ID GDPR acknowledgement.. error = %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

void sub_230ECE994(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_230ECE9B4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend_domain(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BE07D20]))
  {
    v10 = objc_msgSend_code(v3, v8, v9);

    if (v10 == 7)
      goto LABEL_10;
  }
  else
  {

  }
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v15, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v18 = (void *)objc_opt_class();
    v19 = v18;
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v18;
    v23 = 2114;
    v24 = v20;
    _os_log_impl(&dword_230EC7000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove follow-ups after signing out of an account.", (uint8_t *)&v21, 0x16u);

  }
LABEL_10:

}

void sub_230ECEB28(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, v23, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        objc_msgSend_identifier(v11, v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_account(v11, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend_clearFollowUpWithIdentifier_account_(v12, v17, (uint64_t)v13, v16);

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, v23, 16);
    }
    while (v8);
  }

}

void sub_230ECED60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230ECF220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230ECF798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230ED1874(uint64_t a1)
{
  id v2;

  v2 = (id)AMSSetLogKey();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void *sub_230ED18A8(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_255EAAEF8)
  {
    v2 = (void *)qword_255EAAEF8;
  }
  else
  {
    qword_255EAAEF8 = _sl_dlopen();
    v2 = (void *)qword_255EAAEF8;
    if (!qword_255EAAEF8)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "OBPrivacyAppleIDIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_255EAAEF0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_230ED1998(uint64_t a1)
{
  Class result;

  if (!qword_255EAAF08)
  {
    qword_255EAAF08 = _sl_dlopen();
    if (!qword_255EAAF08)
    {
      abort_report_np();
LABEL_6:
      sub_230ED64F0();
    }
  }
  result = objc_getClass("RadioModel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_255EAAF00 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_230ED1A8C(uint64_t a1)
{
  Class result;

  if (!qword_255EAAF18)
  {
    qword_255EAAF18 = _sl_dlopen();
    if (!qword_255EAAF18)
    {
      abort_report_np();
LABEL_6:
      sub_230ED6514();
    }
  }
  result = objc_getClass("SSVSubscriptionStatusCoordinator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_255EAAF10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_230ED1B80(uint64_t a1)
{
  Class result;

  if (!qword_255EAAF28)
  {
    qword_255EAAF28 = _sl_dlopen();
    if (!qword_255EAAF28)
    {
      abort_report_np();
LABEL_6:
      sub_230ED6538();
    }
  }
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_255EAAF20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_230ED1C74(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  id v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend_ams_isLocalAccount(v4, v5, v6))
  {
    v9 = (void *)MEMORY[0x24BE08078];
    AMSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_promiseWithError_(v9, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_sharedPrivacyConfig(MEMORY[0x24BE081D8], v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v15, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ams_privacyAcknowledgement(v4, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v59 = v17;
      v60 = 2114;
      v61 = v18;
      v62 = 2114;
      v63 = v19;
      v64 = 2114;
      v65 = v22;
      _os_log_impl(&dword_230EC7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing privacy acknowledgement. account = %{public}@ | privacyAcknowledgement = %{public}@", buf, 0x2Au);

    }
    objc_msgSend_ams_bagForProcessInfo_(MEMORY[0x24BE08050], v23, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x24BE083F8]);
    v26 = (void *)objc_msgSend_initWithBag_(v24, v25, (uint64_t)v53);
    objc_msgSend_setAccount_(v26, v27, (uint64_t)v4);
    objc_msgSend_setDialogOptions_(v26, v28, 1);
    AMSLogKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLogUUID_(v26, v30, (uint64_t)v29);

    v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_deviceGUID(MEMORY[0x24BE08118], v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_setNullableObject_forKey_(v31, v35, (uint64_t)v34, *MEMORY[0x24BE07FD8]);

    objc_msgSend_ams_privacyAcknowledgement(v4, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_setNullableObject_forKey_(v31, v39, (uint64_t)v38, CFSTR("privacyAcknowledgement"));

    objc_msgSend_URLForKey_(v53, v40, (uint64_t)CFSTR("privacyAcknowledgementUrl"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestWithMethod_bagURL_parameters_(v26, v42, 4, v41, v31);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_thenWithBlock_(v43, v44, (uint64_t)&unk_24FFA2F68);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogKey();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, a1);
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = sub_230ED2088;
    v54[3] = &unk_24FFA2F90;
    v47 = v46;
    v55 = v47;
    objc_copyWeak(&v57, (id *)buf);
    v56 = v4;
    objc_msgSend_thenWithBlock_(v45, v48, (uint64_t)v54);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binaryPromiseAdapter(v49, v50, v51);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);

  }
  return v12;
}

void sub_230ED2008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_230ED202C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BE08410];
  v3 = a2;
  objc_msgSend_defaultSession(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataTaskPromiseWithRequest_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_230ED2088(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id WeakRetained;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  int v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id)AMSSetLogKey();
  objc_msgSend_object(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend_sharedPrivacyConfig(MEMORY[0x24BE081D8], v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v11;
  if (v8)
  {
    if (!v11)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v14, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v17;
      v49 = 2114;
      v50 = v18;
      _os_log_impl(&dword_230EC7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the privacy acknowledgement.", (uint8_t *)&v47, 0x16u);

    }
    if (objc_msgSend_ams_mergePrivacyAcknowledgement_(*(void **)(a1 + 40), v19, (uint64_t)v8))
    {
      objc_msgSend_sharedPrivacyConfig(MEMORY[0x24BE081D8], v20, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_OSLogObject(v24, v22, v23);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_loadWeakRetained((id *)(a1 + 48));
        v27 = objc_opt_class();
        AMSLogKey();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v27;
        v49 = 2114;
        v50 = v28;
        _os_log_impl(&dword_230EC7000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server sent updated privacy acknowledgement.", (uint8_t *)&v47, 0x16u);

      }
      objc_msgSend_ams_setDisablePrivacyAcknowledgementSync_(*(void **)(a1 + 40), v29, 1);
      objc_msgSend_ams_sharedAccountStore(MEMORY[0x24BDB4398], v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend_ams_saveAccount_verifyCredentials_(v32, v33, *(_QWORD *)(a1 + 40), 0);

    }
    objc_msgSend_promiseWithResult_(MEMORY[0x24BE08340], v20, MEMORY[0x24BDBD1C8]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v11)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v14, v12, v13);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_loadWeakRetained((id *)(a1 + 48));
      v38 = objc_opt_class();
      AMSLogKey();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_object(v3, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543874;
      v48 = v38;
      v49 = 2114;
      v50 = v39;
      v51 = 2114;
      v52 = v42;
      _os_log_impl(&dword_230EC7000, v36, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", (uint8_t *)&v47, 0x20u);

    }
    v43 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_promiseWithError_(v43, v45, (uint64_t)v44);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v35;
}

uint64_t sub_230ED242C()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BE08050], sel_bagForProfile_profileVersion_processInfo_, CFSTR("Accounts"));
}

void sub_230ED255C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230ED2638(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_230ED2654(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int isLocalAccount;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  char v46;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  char v58;
  id v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  char v70;
  id v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  id v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  void *v113;
  id v115;
  id v116;
  id v117;
  id v118;
  uint8_t buf[4];
  uint64_t v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (id)AMSSetLogKey();
  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v9, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v120 = v11;
    v121 = 2114;
    v122 = v12;
    _os_log_impl(&dword_230EC7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Running the logout task.", buf, 0x16u);

  }
  objc_msgSend_ams_bagForProcessInfo_(MEMORY[0x24BE08050], v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_account(*(void **)(a1 + 40), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isLocalAccount = objc_msgSend_ams_isLocalAccount(v18, v19, v20);

  if (isLocalAccount)
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v22, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v26, v24, v25);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(*(void **)(a1 + 40), v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v120 = v28;
      v121 = 2114;
      v122 = v29;
      v123 = 2114;
      v124 = v33;
      _os_log_impl(&dword_230EC7000, v27, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Preventing attempted logout of local account. account = %{public}@", buf, 0x20u);

    }
    AMSError();
    v34 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  v118 = 0;
  v34 = objc_msgSend__revokeMusicKitUserTokensWithError_(WeakRetained, v22, (uint64_t)&v118);
  v37 = v118;
  if ((v34 & 1) == 0)
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v35, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v40, v38, v39);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = objc_opt_class();
      AMSLogKey();
      v113 = v14;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v120 = v42;
      v121 = 2114;
      v122 = v43;
      v123 = 2114;
      v124 = v44;
      _os_log_impl(&dword_230EC7000, v41, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error revoking user music token. error = %{public}@", buf, 0x20u);

    }
    objc_msgSend_ams_addNullableObject_(v15, v45, (uint64_t)v37);

    v37 = 0;
  }
  v117 = v37;
  v46 = objc_msgSend__disableAutomaticDownloadKindsWithError_(WeakRetained, v35, (uint64_t)&v117, v113);
  v47 = v117;

  if ((v46 & 1) == 0)
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v48, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v52, v50, v51);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = objc_opt_class();
      AMSLogKey();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v120 = v54;
      v121 = 2114;
      v122 = v55;
      v123 = 2114;
      v124 = v56;
      _os_log_impl(&dword_230EC7000, v53, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error disabling automatic download kinds. error = %{public}@", buf, 0x20u);

    }
    objc_msgSend_ams_addNullableObject_(v15, v57, (uint64_t)v47);

    v34 = 0;
    v47 = 0;
  }
  v116 = v47;
  v58 = objc_msgSend__disableBookkeeperWithBag_error_(WeakRetained, v48, (uint64_t)v14, &v116);
  v59 = v116;

  if ((v58 & 1) == 0)
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v60, v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v64)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v64, v62, v63);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = objc_opt_class();
      AMSLogKey();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v120 = v66;
      v121 = 2114;
      v122 = v67;
      v123 = 2114;
      v124 = v68;
      _os_log_impl(&dword_230EC7000, v65, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error disabling bookkeeper. error = %{public}@", buf, 0x20u);

    }
    objc_msgSend_ams_addNullableObject_(v15, v69, (uint64_t)v59);

    v34 = 0;
    v59 = 0;
  }
  v115 = v59;
  v70 = objc_msgSend__sendLogoutRequestWithBag_error_(WeakRetained, v60, (uint64_t)v14, &v115);
  v71 = v115;

  if ((v70 & 1) == 0)
  {
    objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v72, v73);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v76)
    {
      objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_OSLogObject(v76, v74, v75);
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      v78 = objc_opt_class();
      AMSLogKey();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v120 = v78;
      v121 = 2114;
      v122 = v79;
      v123 = 2114;
      v124 = v80;
      _os_log_impl(&dword_230EC7000, v77, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error sending logout request. error = %{public}@", buf, 0x20u);

    }
    objc_msgSend_ams_addNullableObject_(v15, v81, (uint64_t)v71);

    v34 = 0;
    v71 = 0;
  }
  if ((unint64_t)objc_msgSend_count(v15, v72, v73) >= 2)
  {
    AMSErrorWithMultipleUnderlyingErrors();
    v84 = objc_claimAutoreleasedReturnValue();
LABEL_39:
    v86 = (void *)v84;

    v71 = v86;
    goto LABEL_40;
  }
  if (objc_msgSend_count(v15, v82, v83) == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v15, v85, 0);
    v84 = objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
LABEL_40:
  v87 = objc_retainAutorelease(v71);
  *a2 = v87;
  v88 = (void *)objc_opt_class();
  objc_msgSend_account(WeakRetained, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__resetServerDataCacheForAccountWithDSID_(v88, v95, (uint64_t)v94);

  v96 = (void *)objc_opt_class();
  objc_msgSend_account(WeakRetained, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_accountID(v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__performDaemonSignOutTasksForAccountWithID_(v96, v103, (uint64_t)v102);

  objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x24BE081D8], v104, v105);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v108)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v108, v106, v107);
  v109 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v110 = objc_opt_class();
    AMSLogKey();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v120 = v110;
    v121 = 2114;
    v122 = v111;
    _os_log_impl(&dword_230EC7000, v109, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Finished running the logout task.", buf, 0x16u);

  }
LABEL_45:

  return v34;
}

Class sub_230ED3A14(uint64_t a1)
{
  Class result;

  if (!qword_255EAAF38)
  {
    qword_255EAAF38 = _sl_dlopen();
    if (!qword_255EAAF38)
    {
      abort_report_np();
LABEL_6:
      sub_230ED655C();
    }
  }
  result = objc_getClass("ICCloudServiceStatusMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_255EAAF30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_230ED3CA8(uint64_t a1, const char *a2, uint64_t a3)
{
  char *v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  int isLocalAccount;
  const char *v9;
  uint64_t v10;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  AMSSyncAccountFlagsResult *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  char isEqualToDictionary;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  id v123;
  NSObject *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  NSObject *log;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  char *v134;
  void *v135;
  id v136;
  id v137;
  uint8_t buf[4];
  uint64_t v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  void *v145;
  uint64_t v146;

  v3 = (char *)a2;
  v146 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_account(*(void **)(a1 + 32), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isLocalAccount = objc_msgSend_ams_isLocalAccount(v5, v6, v7);

  if (isLocalAccount)
  {
    AMSError();
    *(_QWORD *)v3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  objc_msgSend_sharedAccountsConfig(MEMORY[0x24BE081D8], v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_OSLogObject(v14, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_opt_class();
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(*(void **)(a1 + 32), v18, v19);
    v134 = v3;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(*(void **)(a1 + 32), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_accountFlags(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v139 = v16;
    v140 = 2114;
    v141 = v17;
    v142 = 2114;
    v143 = v21;
    v144 = 2114;
    v145 = v28;
    _os_log_impl(&dword_230EC7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

    v3 = v134;
  }

  v29 = objc_alloc(MEMORY[0x24BE083F8]);
  objc_msgSend_bag(*(void **)(a1 + 32), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_initWithBag_(v29, v33, (uint64_t)v32);

  objc_msgSend_account(*(void **)(a1 + 32), v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccount_(v34, v38, (uint64_t)v37);

  objc_msgSend_setRequestEncoding_(v34, v39, 3);
  AMSLogKey();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLogUUID_(v34, v41, (uint64_t)v40);

  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_account(*(void **)(a1 + 32), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_accountFlags(v45, v46, v47);
  v48 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v48;
  if (v48)
    objc_msgSend_setObject_forKeyedSubscript_(v42, v49, v48, CFSTR("accountFlags"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v42, v49, MEMORY[0x24BDBD1B8], CFSTR("accountFlags"));

  objc_msgSend_deviceGUID(MEMORY[0x24BE08118], v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_setNullableObject_forKey_(v42, v54, (uint64_t)v53, *MEMORY[0x24BE07FD8]);

  objc_msgSend_bag(*(void **)(a1 + 32), v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForKey_(v57, v58, (uint64_t)CFSTR("account-flags"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
    objc_msgSend_requestWithMethod_bagURL_parameters_(v34, v60, 2, v59, 0);
  else
    objc_msgSend_requestWithMethod_bagURL_parameters_(v34, v60, 4, v59, v42);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0;
  objc_msgSend_resultWithError_(v61, v62, (uint64_t)&v137);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v137;
  if (v64)
  {
    v67 = v64;
    v68 = 0;
  }
  else
  {
    v133 = v59;
    objc_msgSend_defaultSession(MEMORY[0x24BE08410], v65, v66);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (uint64_t)v63;
    v71 = v69;
    v135 = (void *)v70;
    objc_msgSend_dataTaskPromiseWithRequest_(v69, v72, v70);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0;
    objc_msgSend_resultWithError_(v73, v74, (uint64_t)&v136);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v136;

    if (!v67)
    {
      v132 = v68;
      objc_msgSend_object(v68, v75, v76);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v77 = v79;
      else
        v77 = 0;
      v63 = v135;

      objc_msgSend_ams_accountFlags(v77, v80, v81);
      v82 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedAccountsConfig(MEMORY[0x24BE081D8], v83, v84);
      v85 = objc_claimAutoreleasedReturnValue();
      v88 = (void *)v85;
      if (v82)
      {
        if (!v85)
        {
          objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_OSLogObject(v88, v86, v87);
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          v90 = objc_opt_class();
          AMSLogKey();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v139 = v90;
          v140 = 2114;
          v141 = v91;
          _os_log_impl(&dword_230EC7000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);

        }
        v92 = [AMSSyncAccountFlagsResult alloc];
        v78 = (void *)objc_msgSend_initWithAccountFlags_(v92, v93, v82);
        objc_msgSend_account(*(void **)(a1 + 32), v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ams_accountFlags(v96, v97, v98);
        v99 = objc_claimAutoreleasedReturnValue();
        v100 = (void *)v82;
        v101 = (void *)v99;
        v130 = v100;
        isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v100, v102, v99);

        v68 = v132;
        v59 = v133;
        if ((isEqualToDictionary & 1) == 0)
        {
          objc_msgSend_sharedAccountsConfig(MEMORY[0x24BE081D8], v104, v105);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v108)
          {
            objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_OSLogObject(v108, v106, v107);
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            log = v109;
            v110 = objc_opt_class();
            AMSLogKey();
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v139 = v110;
            v109 = log;
            v140 = 2114;
            v141 = v111;
            _os_log_impl(&dword_230EC7000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

            v68 = v132;
          }

          objc_msgSend_account(*(void **)(a1 + 32), v112, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ams_setAccountFlags_(v114, v115, (uint64_t)v130);

          objc_msgSend_ams_sharedAccountStore(MEMORY[0x24BDB4398], v116, v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_account(*(void **)(a1 + 32), v119, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = (id)objc_msgSend_ams_saveAccount_verifyCredentials_(v118, v122, (uint64_t)v121, 0);

        }
        v63 = v135;
      }
      else
      {
        if (!v85)
        {
          objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_OSLogObject(v88, v86, v87);
        v124 = objc_claimAutoreleasedReturnValue();
        v68 = v132;
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          v131 = objc_opt_class();
          AMSLogKey();
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_object(v132, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v139 = v131;
          v140 = 2114;
          v141 = v125;
          v142 = 2114;
          v143 = v128;
          _os_log_impl(&dword_230EC7000, v124, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

          v63 = v135;
        }

        AMSError();
        v78 = 0;
        *(_QWORD *)v3 = (id)objc_claimAutoreleasedReturnValue();
        v59 = v133;
      }
      goto LABEL_18;
    }
    v63 = v135;
  }
  v77 = objc_retainAutorelease(v67);
  v78 = 0;
  *(_QWORD *)v3 = v77;
LABEL_18:

  return v78;
}

id sub_230ED44B4(void *a1, const char *a2)
{
  void *v2;
  id v3;

  objc_msgSend_objectForKeyedSubscript_(a1, a2, (uint64_t)CFSTR("accountFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t sub_230ED4514()
{
  uint64_t v0;

  v0 = sub_230ED661C();
  sub_230ED4F6C(v0, qword_255EAADE8);
  sub_230ED4E6C(v0, (uint64_t)qword_255EAADE8);
  return sub_230ED65EC();
}

void sub_230ED455C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v2 = v1;
  v15 = a1;
  sub_230ED65A4();
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_230ED661C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255EAADE0 != -1)
    swift_once();
  v9 = sub_230ED4E6C(v5, (uint64_t)qword_255EAADE8);
  v16 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_230ED4E84(&qword_255EAAE30);
  sub_230ED65E0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230ED7130;
  v10 = (id)AMSSetLogKeyIfNeeded();
  sub_230ED6634();

  type metadata accessor for AccountActiveStatusChangeResponder();
  v17 = v2;
  sub_230ED65D4();
  swift_bridgeObjectRelease();
  sub_230ED6598();
  sub_230ED658C();
  v11 = v15;
  if (v15)
  {
    *((_QWORD *)&v19 + 1) = sub_230ED4F34(0, &qword_255EAAE40);
    *(_QWORD *)&v18 = v11;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  v12 = v11;
  sub_230ED6580();
  sub_230ED4EC4((uint64_t)&v18);
  sub_230ED658C();
  MEMORY[0x2348C6FE0](v4);
  sub_230ED6610();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v5);
  if (v11)
  {
    v13 = v12;
    if (objc_msgSend(v13, sel_isActive))
      sub_230ED47E4(v13);

  }
  sub_230ED4A88();
}

void sub_230ED47E4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD aBlock[6];

  v3 = sub_230ED661C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend((id)objc_opt_self(), sel_didSetUpServerDataCache) & 1) != 0
    || (v7 = objc_msgSend(a1, sel_ams_DSID), v7, !v7))
  {
    if (qword_255EAADE0 != -1)
      swift_once();
    v12 = sub_230ED4E6C(v3, (uint64_t)qword_255EAADE8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v12, v3);
    sub_230ED4E84(&qword_255EAAE30);
    sub_230ED65E0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_230ED7130;
    v13 = (id)AMSSetLogKeyIfNeeded();
    sub_230ED6634();

    type metadata accessor for AccountActiveStatusChangeResponder();
    sub_230ED65D4();
    swift_bridgeObjectRelease();
    sub_230ED65BC();
    sub_230ED65F8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083A0]), sel_init);
    v9 = objc_msgSend(v8, sel_setUpCacheForAccount_, a1);

    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v1;
    aBlock[4] = sub_230ED4F14;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_230ED4D9C;
    aBlock[3] = &unk_24FFA3108;
    v11 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_addFinishBlock_, v11);
    _Block_release(v11);

  }
}

void sub_230ED4A88()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083E0]), sel_initWithCachePolicy_, 0);

}

id sub_230ED4B1C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v14[2];
  id v15;
  void *v16;

  v5 = sub_230ED661C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    return objc_msgSend((id)objc_opt_self(), sel_setDidSetUpServerDataCache_, 1);
  v16 = a2;
  v9 = a2;
  sub_230ED4E84(&qword_255EAAE48);
  sub_230ED4F34(0, &qword_255EAAE50);
  if ((swift_dynamicCast() & 1) == 0)
    return objc_msgSend((id)objc_opt_self(), sel_setDidSetUpServerDataCache_, 1);
  v10 = v15;
  if (objc_msgSend(v15, sel_code) != (id)107 && objc_msgSend(v10, sel_code) != (id)2)
  {

    return objc_msgSend((id)objc_opt_self(), sel_setDidSetUpServerDataCache_, 1);
  }
  v14[1] = a3;
  if (qword_255EAADE0 != -1)
    swift_once();
  v11 = sub_230ED4E6C(v5, (uint64_t)qword_255EAADE8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
  sub_230ED4E84(&qword_255EAAE30);
  sub_230ED65E0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230ED7130;
  v12 = (id)AMSSetLogKeyIfNeeded();
  sub_230ED6634();

  type metadata accessor for AccountActiveStatusChangeResponder();
  sub_230ED65D4();
  swift_bridgeObjectRelease();
  sub_230ED65BC();
  sub_230ED65F8();
  swift_bridgeObjectRelease();

  return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_230ED4D6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountActiveStatusChangeResponder();
  return objc_msgSendSuper2(&v2, sel_init);
}

void sub_230ED4D9C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id sub_230ED4E1C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountActiveStatusChangeResponder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AccountActiveStatusChangeResponder()
{
  return objc_opt_self();
}

uint64_t sub_230ED4E6C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_230ED4E84(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348C7568]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230ED4EC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_230ED4E84(&qword_255EAAE38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230ED4F04()
{
  return swift_deallocObject();
}

id sub_230ED4F14(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_230ED4B1C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_230ED4F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_230ED4F2C()
{
  return swift_release();
}

uint64_t sub_230ED4F34(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t *sub_230ED4F6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_230ED4FAC()
{
  uint64_t v0;

  v0 = sub_230ED661C();
  sub_230ED4F6C(v0, qword_255EAAE58);
  sub_230ED4E6C(v0, (uint64_t)qword_255EAAE58);
  return sub_230ED65EC();
}

void sub_230ED4FF4(void *a1)
{
  sub_230ED5010(a1);
  sub_230ED5214();
  sub_230ED4A88();
}

void sub_230ED5010(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __n128 *v13;
  id v14;
  uint64_t v15;

  v4 = sub_230ED661C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230ED4E84(&qword_255EAAEA8);
  MEMORY[0x24BDAC7A8]();
  sub_230ED645C();
  v8 = objc_msgSend(a1, sel_ams_DSID);
  if (v8)
  {
    v9 = v8;
    v10 = sub_230ED6664();
    sub_230ED6060(v2, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v1;
    v11[5] = v9;
    sub_230ED5A2C(v2, (uint64_t)&unk_255EAAEB8, (uint64_t)v11);
    swift_release();
  }
  else
  {
    if (qword_255EAAE00 != -1)
      swift_once();
    v12 = sub_230ED4E6C(v4, (uint64_t)qword_255EAAE58);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
    sub_230ED4E84(&qword_255EAAE30);
    sub_230ED6444();
    v13 = (__n128 *)swift_allocObject();
    v14 = (id)sub_230ED6480(v13, (__n128)xmmword_230ED7130);
    sub_230ED6634();
    sub_230ED6474();
    type metadata accessor for AccountStorefrontChangeResponder();
    sub_230ED64C4();
    swift_bridgeObjectRelease();
    sub_230ED6498();
    sub_230ED6604();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_230ED63E4();
}

void sub_230ED5214()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v1 = sub_230ED661C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_230ED645C();
  v3 = objc_msgSend((id)objc_opt_self(), sel_createBagForSubProfile);
  if (v3)
  {
    v9 = v3;
    if (qword_255EAAE00 != -1)
      swift_once();
    v4 = sub_230ED4E6C(v1, (uint64_t)qword_255EAAE58);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v4, v1);
    sub_230ED4E84(&qword_255EAAE30);
    sub_230ED6444();
    *(_OWORD *)(sub_230ED648C() + 16) = xmmword_230ED7130;
    v5 = (id)AMSSetLogKeyIfNeeded();
    sub_230ED6634();

    type metadata accessor for AccountStorefrontChangeResponder();
    sub_230ED65D4();
    swift_bridgeObjectRelease();
    sub_230ED6498();
    sub_230ED6610();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08188]), sel_init);
    objc_msgSend(v6, sel_setOrigin_, *MEMORY[0x24BE07D08]);
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08148]), sel_initWithBag_, v9);
    v8 = objc_msgSend(v7, sel_syncWithRequest_, v6);

  }
  sub_230ED63E4();
}

uint64_t sub_230ED5464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[15] = a4;
  v5[16] = a5;
  v6 = sub_230ED661C();
  v5[17] = v6;
  v5[18] = *(_QWORD *)(v6 - 8);
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_230ED54C4()
{
  _QWORD *v0;
  id v1;
  _QWORD *v2;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE083A0]), sel_init);
  v0[5] = sub_230ED6268();
  v0[6] = &off_24FFA3130;
  v0[2] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[20] = v2;
  *v2 = v0;
  v2[1] = sub_230ED554C;
  return sub_230ED5904(v0[16], (uint64_t)(v0 + 2));
}

uint64_t sub_230ED554C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_230ED62A4(v2 + 16);
  sub_230ED64A0();
  return swift_task_switch();
}

uint64_t sub_230ED55B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 *v5;
  id v6;

  if (qword_255EAAE00 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = sub_230ED4E6C(v3, (uint64_t)qword_255EAAE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  sub_230ED4E84(&qword_255EAAE30);
  sub_230ED6444();
  v5 = (__n128 *)swift_allocObject();
  v6 = (id)sub_230ED6480(v5, (__n128)xmmword_230ED7130);
  sub_230ED6634();
  sub_230ED6474();
  type metadata accessor for AccountStorefrontChangeResponder();
  sub_230ED64C4();
  swift_bridgeObjectRelease();
  sub_230ED6498();
  sub_230ED6610();
  swift_bridgeObjectRelease();
  sub_230ED641C();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230ED56FC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  sub_230ED62A4(v0 + 16);
  if (qword_255EAAE00 != -1)
    swift_once();
  v1 = *(void **)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = sub_230ED4E6C(v4, (uint64_t)qword_255EAAE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  sub_230ED4E84(&qword_255EAAE30);
  sub_230ED6444();
  *(_OWORD *)(sub_230ED648C() + 16) = xmmword_230ED7130;
  v6 = (id)AMSSetLogKeyIfNeeded();
  sub_230ED6634();

  type metadata accessor for AccountStorefrontChangeResponder();
  sub_230ED65D4();
  swift_bridgeObjectRelease();
  sub_230ED6670();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_230ED667C();
  sub_230ED6640();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 56) = 0xD000000000000016;
  *(_QWORD *)(v0 + 64) = 0x8000000230ED7C80;
  sub_230ED65C8();
  sub_230ED62C4(v0 + 56, &qword_255EAAE38);
  sub_230ED6604();
  swift_bridgeObjectRelease();

  sub_230ED641C();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230ED5904(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return sub_230ED6380();
}

uint64_t sub_230ED5914()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  sub_230ED6300(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
  v1 = (_QWORD *)sub_230ED6430();
  *(_QWORD *)(v0 + 32) = v1;
  v2 = sub_230ED63C4(v1, (uint64_t)sub_230ED5960);
  return sub_230ED639C(v2, v3, v4, v5);
}

uint64_t sub_230ED5960()
{
  uint64_t v0;
  uint64_t v1;

  sub_230ED6358();
  if (v0)
    return sub_230ED634C(*(uint64_t (**)(void))(v1 + 8));
  sub_230ED64A0();
  return sub_230ED6374();
}

uint64_t sub_230ED59AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  sub_230ED6300(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
  v1 = (_QWORD *)sub_230ED6430();
  *(_QWORD *)(v0 + 40) = v1;
  v2 = sub_230ED63C4(v1, (uint64_t)sub_230ED59F8);
  return sub_230ED639C(v2, v3, v4, v5);
}

uint64_t sub_230ED59F8()
{
  uint64_t v0;

  sub_230ED6358();
  return sub_230ED634C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_230ED5A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_230ED6664();
  if (sub_230ED613C(a1, 1, v6) == 1)
  {
    sub_230ED62C4(a1, &qword_255EAAEA8);
  }
  else
  {
    sub_230ED6658();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_230ED664C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

id sub_230ED5B70()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountStorefrontChangeResponder();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_230ED5BC0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountStorefrontChangeResponder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_230ED5BF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return sub_230ED6380();
}

uint64_t sub_230ED5C00()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v0 + 136) = objc_msgSend(*(id *)(v0 + 128), sel_setUpCacheForAccountDSID_, *(_QWORD *)(v0 + 120));
  *(_QWORD *)(v0 + 56) = v0 + 152;
  v1 = sub_230ED644C((uint64_t)sub_230ED5C98);
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v2 = (_QWORD *)(v0 + 80);
  v2[1] = 0x40000000;
  v2[2] = sub_230ED5D84;
  v2[3] = &unk_24FFA3198;
  v2[4] = v1;
  sub_230ED64AC(v1, sel_resultWithCompletion_);
  return sub_230ED638C();
}

uint64_t sub_230ED5C98()
{
  sub_230ED63FC();
  sub_230ED64A0();
  return sub_230ED6374();
}

uint64_t sub_230ED5CD4()
{
  void *v0;
  uint64_t v1;

  sub_230ED64B8();
  if ((v0 & 1) == 0)
  {
    sub_230ED6628();
    (id)sub_230ED63AC();

    swift_willThrow();
  }
  return sub_230ED6368(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_230ED5D4C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return sub_230ED6368(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_230ED5D84(uint64_t a1, char a2, void *a3)
{
  if (a3)
    return sub_230ED5DC0(*(_QWORD *)(a1 + 32), (uint64_t)a3);
  else
    return sub_230ED5E10(*(_QWORD *)(a1 + 32), a2);
}

uint64_t sub_230ED5DC0(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  sub_230ED4E84(&qword_255EAAE48);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_230ED5E10(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_230ED5E20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return sub_230ED6380();
}

uint64_t sub_230ED5E30()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v0 + 136) = objc_msgSend(*(id *)(v0 + 128), sel_tearDownCacheForAccountDSID_, *(_QWORD *)(v0 + 120));
  *(_QWORD *)(v0 + 56) = v0 + 152;
  v1 = sub_230ED644C((uint64_t)sub_230ED5EC8);
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v2 = (_QWORD *)(v0 + 80);
  v2[1] = 0x40000000;
  v2[2] = sub_230ED5D84;
  v2[3] = &unk_24FFA31B0;
  v2[4] = v1;
  sub_230ED64AC(v1, sel_resultWithCompletion_);
  return sub_230ED638C();
}

uint64_t sub_230ED5EC8()
{
  sub_230ED63FC();
  sub_230ED64A0();
  return sub_230ED6374();
}

uint64_t sub_230ED5F04()
{
  void *v0;
  uint64_t v1;

  sub_230ED64B8();
  if ((v0 & 1) == 0)
  {
    sub_230ED6628();
    (id)sub_230ED63AC();

    swift_willThrow();
  }
  return sub_230ED6368(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_230ED5F7C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_230ED6324;
  return sub_230ED5E20(a1);
}

uint64_t sub_230ED5FCC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_230ED601C;
  return sub_230ED5BF0(a1);
}

uint64_t sub_230ED601C()
{
  uint64_t v0;

  sub_230ED632C();
  return sub_230ED634C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for AccountStorefrontChangeResponder()
{
  return objc_opt_self();
}

uint64_t sub_230ED6060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_230ED606C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_230ED6098(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_230ED6110;
  return sub_230ED5464(a1, v4, v5, v7, v6);
}

uint64_t sub_230ED6110()
{
  uint64_t v0;

  sub_230ED632C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230ED613C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_230ED6148(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_230ED61AC;
  return v6(a1);
}

uint64_t sub_230ED61AC()
{
  uint64_t v0;

  sub_230ED632C();
  return sub_230ED634C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_230ED61D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230ED61F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_230ED601C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255EAAEC0 + dword_255EAAEC0))(a1, v4);
}

unint64_t sub_230ED6268()
{
  unint64_t result;

  result = qword_255EAAED0;
  if (!qword_255EAAED0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_255EAAED0);
  }
  return result;
}

uint64_t sub_230ED62A4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_230ED62C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_230ED4E84(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_230ED6300(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_230ED632C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_230ED634C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_230ED6358()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_230ED6368(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_230ED6374()
{
  return swift_task_switch();
}

uint64_t sub_230ED6380()
{
  return swift_task_switch();
}

uint64_t sub_230ED638C()
{
  return swift_continuation_await();
}

uint64_t sub_230ED639C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_230ED63AC()
{
  return AMSError();
}

uint64_t sub_230ED63C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 16);
}

void sub_230ED63FC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v2 = *v0;
  v3 = (uint64_t *)(v1 - 8);
  *v3 = *v0;
  *v3 = *v0;
  *(_QWORD *)(v2 + 144) = *(_QWORD *)(v2 + 48);
}

uint64_t sub_230ED641C()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[18] + 8))(v0[19], v0[17]);
}

uint64_t sub_230ED6430()
{
  return swift_task_alloc();
}

uint64_t sub_230ED6444()
{
  return sub_230ED65E0();
}

uint64_t sub_230ED644C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = a1;
  return swift_continuation_init();
}

void sub_230ED6474()
{
  void *v0;

}

uint64_t sub_230ED6480(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return AMSSetLogKeyIfNeeded();
}

uint64_t sub_230ED648C()
{
  return swift_allocObject();
}

uint64_t sub_230ED6498()
{
  return sub_230ED65BC();
}

id sub_230ED64AC(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void sub_230ED64B8()
{
  uint64_t v0;

}

uint64_t sub_230ED64C4()
{
  return sub_230ED65D4();
}

void sub_230ED64D0()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  sub_230ED64F0(v0);
}

void sub_230ED64F0()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_230ED6514(v0);
}

void sub_230ED6514()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_230ED6538(v0);
}

void sub_230ED6538()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_230ED655C(v0);
}

void sub_230ED655C()
{
  abort_report_np();
  sub_230ED6580();
}

uint64_t sub_230ED6580()
{
  return MEMORY[0x24BE07A70]();
}

uint64_t sub_230ED658C()
{
  return MEMORY[0x24BE07A88]();
}

uint64_t sub_230ED6598()
{
  return MEMORY[0x24BE07A90]();
}

uint64_t sub_230ED65A4()
{
  return MEMORY[0x24BE07A98]();
}

uint64_t sub_230ED65B0()
{
  return MEMORY[0x24BE07AA0]();
}

uint64_t sub_230ED65BC()
{
  return MEMORY[0x24BE07AA8]();
}

uint64_t sub_230ED65C8()
{
  return MEMORY[0x24BE07AB0]();
}

uint64_t sub_230ED65D4()
{
  return MEMORY[0x24BE07AB8]();
}

uint64_t sub_230ED65E0()
{
  return MEMORY[0x24BE07AC8]();
}

uint64_t sub_230ED65EC()
{
  return MEMORY[0x24BE07BE8]();
}

uint64_t sub_230ED65F8()
{
  return MEMORY[0x24BE07BF0]();
}

uint64_t sub_230ED6604()
{
  return MEMORY[0x24BE07C00]();
}

uint64_t sub_230ED6610()
{
  return MEMORY[0x24BE07C18]();
}

uint64_t sub_230ED661C()
{
  return MEMORY[0x24BE07C40]();
}

uint64_t sub_230ED6628()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230ED6634()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230ED6640()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_230ED664C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_230ED6658()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_230ED6664()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_230ED6670()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_230ED667C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t AMSError()
{
  return MEMORY[0x24BE07D18]();
}

uint64_t AMSErrorWithMultipleUnderlyingErrors()
{
  return MEMORY[0x24BE07D58]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x24BE07DF0]();
}

uint64_t AMSLogKey()
{
  return MEMORY[0x24BE07E08]();
}

uint64_t AMSLogableError()
{
  return MEMORY[0x24BE07E10]();
}

uint64_t AMSSetLogKey()
{
  return MEMORY[0x24BE07FE0]();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return MEMORY[0x24BE07FE8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

