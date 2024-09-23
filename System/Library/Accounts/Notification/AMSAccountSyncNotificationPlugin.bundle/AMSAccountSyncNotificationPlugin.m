id sub_230EE0374(void *a1, const char *a2)
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

uint64_t sub_230EE03D4(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_setObject_forKeyedSubscript_(a1, a2, a3, CFSTR("lastAuthenticated"));
}

void sub_230EE05E4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t shouldConsiderAccountActive;
  const char *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccountsSyncPluginConfig(MEMORY[0x24BE081D8], a2, a3);
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
    v10 = *(_DWORD *)(a1 + 64);
    AMSHashIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    v26 = 1024;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_230EDF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing a change. changeType = %u | account = %{public}@", (uint8_t *)&v22, 0x26u);

  }
  v13 = *(_DWORD *)(a1 + 64);
  switch(v13)
  {
    case 3:
      objc_msgSend__synciTunesAccountDeletion_inStore_(*(void **)(a1 + 32), v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      break;
    case 2:
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 56);
      v18 = (void *)objc_opt_class();
      shouldConsiderAccountActive = objc_msgSend__shouldConsiderAccountActive_(v18, v19, *(_QWORD *)(a1 + 40));
      objc_msgSend__synciTunesAccountModification_oldAccount_inStore_allowAccountRepair_(v14, v21, v15, v16, v17, shouldConsiderAccountActive);
      break;
    case 1:
      objc_msgSend__synciTunesAccountAddition_inStore_allowAccountRepair_(*(void **)(a1 + 32), v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);
      break;
  }
}

void sub_230EE0C4C(uint64_t a1, const char *a2, uint64_t a3)
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
  objc_msgSend_sharedAccountsSyncPluginConfig(MEMORY[0x24BE081D8], a2, a3);
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
    _os_log_impl(&dword_230EDF000, v6, OS_LOG_TYPE_DEFAULT, "AMSAccountSyncNotificationPlugin: [%{public}@] Successfully sent the remote device command.", (uint8_t *)&v8, 0xCu);

  }
}

void sub_230EE0D30(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  const char *v7;
  int hasDomain_code;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BDB4200];
  if ((!objc_msgSend_ams_hasDomain_code_(v3, v5, *MEMORY[0x24BDB4200], 5)
     || (objc_msgSend_isEqualToString_(*(void **)(a1 + 32), v6, *MEMORY[0x24BDB4300]) & 1) == 0)
    && (!objc_msgSend_ams_hasDomain_code_(v3, v6, v4, 6)
     || (objc_msgSend_isEqualToString_(*(void **)(a1 + 32), v7, *MEMORY[0x24BDB4330]) & 1) == 0))
  {
    hasDomain_code = objc_msgSend_ams_hasDomain_code_(v3, v7, *MEMORY[0x24BE4F9D0], 7);
    objc_msgSend_sharedAccountsSyncPluginConfig(MEMORY[0x24BE081D8], v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v11;
    if (hasDomain_code)
    {
      if (!v11)
      {
        objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_OSLogObject(v14, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_230EDF000, v15, OS_LOG_TYPE_INFO, "AMSAccountSyncNotificationPlugin: [%{public}@] The phone isn't paired to a watch.", (uint8_t *)&v18, 0xCu);
    }
    else
    {
      if (!v11)
      {
        objc_msgSend_sharedConfig(MEMORY[0x24BE081D8], v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_OSLogObject(v14, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_230EDF000, v15, OS_LOG_TYPE_ERROR, "AMSAccountSyncNotificationPlugin: [%{public}@] Failed to send the remote device command. error = %{public}@", (uint8_t *)&v18, 0x16u);

    }
LABEL_15:

  }
}

uint64_t sub_230EE0F40(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_finishWithSuccess_error_, a2);
}

uint64_t sub_230EE1FB8(uint64_t a1)
{
  id v2;

  v2 = (id)AMSSetLogKey();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_230EE1FEC()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BE08050], sel_bagForProfile_profileVersion_processInfo_, CFSTR("Accounts"));
}

id sub_230EE21AC(uint64_t a1, const char *a2, uint64_t a3)
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
    _os_log_impl(&dword_230EDF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

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
          _os_log_impl(&dword_230EDF000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);

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
            _os_log_impl(&dword_230EDF000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

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
          _os_log_impl(&dword_230EDF000, v124, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

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

uint64_t AMSError()
{
  return MEMORY[0x24BE07D18]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

