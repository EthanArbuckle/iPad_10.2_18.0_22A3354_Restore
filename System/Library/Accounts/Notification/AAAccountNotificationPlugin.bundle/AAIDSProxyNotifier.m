@implementation AAIDSProxyNotifier

- (void)notifyIDSProxyOfAccount:(id)a3 store:(id)a4 withCommand:(id)a5
{
  MEMORY[0x24BEDD108](self, sel__notifyIDSProxyOfAccount_store_withCommand_, a3, a4, a5);
}

- (void)_notifyIDSProxyOfAccount:(id)a3 store:(id)a4 withCommand:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  char isEqual;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  NSObject *v79;
  _BOOL4 v80;
  const char *v81;
  NSObject *v82;
  uint32_t v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  id v91;
  uint64_t v92;
  AAIDSProxyNotifier *v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  AAIDSProxyNotifier *v98;
  id v99;
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  id v111;
  __int16 v112;
  id v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = objc_msgSend__shouldSendAccountChangeOverIDSProxy_(self, v11, (uint64_t)v8, v12, v13);
  if (v10 && v14)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v10;
      _os_log_impl(&dword_230EA3000, v15, OS_LOG_TYPE_DEFAULT, "Sending the account through the IDS Proxy with changetype: %@", buf, 0xCu);
    }

    v16 = *MEMORY[0x24BDB4300];
    if (objc_msgSend_isEqualToString_(v10, v17, *MEMORY[0x24BDB4300], v18, v19))
    {
      v92 = v16;
      v93 = self;
      v94 = v9;
      objc_msgSend_accountsWithAccountTypeIdentifier_(v9, v20, *MEMORY[0x24BDB4080], v22, v23);
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v106, (uint64_t)v115, 16);
      if (v26)
      {
        v31 = v26;
        v32 = *(_QWORD *)v107;
LABEL_8:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v107 != v32)
            objc_enumerationMutation(v24);
          v34 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v33);
          objc_msgSend_aa_altDSID(v34, v27, v28, v29, v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_aa_altDSID(v8, v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42, v43);

          if ((isEqual & 1) != 0)
            break;
          if (v31 == ++v33)
          {
            v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v106, (uint64_t)v115, 16);
            if (v31)
              goto LABEL_8;
            goto LABEL_14;
          }
        }
        v51 = v34;

        if (v51)
          goto LABEL_31;
      }
      else
      {
LABEL_14:

      }
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v52 = v24;
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v102, (uint64_t)v114, 16);
      if (!v54)
      {
LABEL_29:

LABEL_36:
        _AALogSystem();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v111 = v8;
          _os_log_impl(&dword_230EA3000, v84, OS_LOG_TYPE_DEFAULT, "No AK account matches %@.", buf, 0xCu);
        }
        v9 = v94;
        goto LABEL_43;
      }
      v59 = v54;
      v60 = *(_QWORD *)v103;
      v91 = v10;
LABEL_23:
      v61 = 0;
      while (1)
      {
        if (*(_QWORD *)v103 != v60)
          objc_enumerationMutation(v52);
        v62 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v61);
        objc_msgSend_username(v62, v55, v56, v57, v58, v91);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_username(v8, v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend_isEqual_(v63, v69, (uint64_t)v68, v70, v71);

        if ((v72 & 1) != 0)
          break;
        if (v59 == ++v61)
        {
          v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v102, (uint64_t)v114, 16);
          v10 = v91;
          if (v59)
            goto LABEL_23;
          goto LABEL_29;
        }
      }
      v51 = v62;

      v10 = v91;
      if (!v51)
        goto LABEL_36;
LABEL_31:
      _AALogSystem();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v111 = v51;
        v112 = 2112;
        v113 = v8;
        _os_log_impl(&dword_230EA3000, v73, OS_LOG_TYPE_DEFAULT, "Using AK account %@ as match for account %@", buf, 0x16u);
      }

      v101 = 0;
      objc_msgSend_credentialWithError_(v51, v74, (uint64_t)&v101, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v101;
      _AALogSystem();
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
      if (v77)
      {
        if (v80)
        {
          *(_WORD *)buf = 0;
          v81 = "Successfully fetched AuthKit account credential. This bodes well.";
          v82 = v79;
          v83 = 2;
LABEL_41:
          _os_log_impl(&dword_230EA3000, v82, OS_LOG_TYPE_DEFAULT, v81, buf, v83);
        }
      }
      else if (v80)
      {
        *(_DWORD *)buf = 138412290;
        v111 = v78;
        v81 = "Failed to get AuthKit account credential for transferring to paired device. Error: %@";
        v82 = v79;
        v83 = 12;
        goto LABEL_41;
      }

      v9 = v94;
      objc_msgSend_remoteDeviceProxy(v94, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = MEMORY[0x24BDAC760];
      v95[1] = 3221225472;
      v95[2] = sub_230EA97E8;
      v95[3] = &unk_24FF9D130;
      v96 = v51;
      v97 = v8;
      v98 = v93;
      v99 = v94;
      v100 = v10;
      v84 = v51;
      objc_msgSend_sendCommand_withAccount_completion_(v89, v90, v92, (uint64_t)v84, (uint64_t)v95);

LABEL_43:
      goto LABEL_44;
    }
    if (v8)
    {
      v24 = objc_msgSend_copy(v8, v20, v21, v22, v23);
      objc_msgSend_setDirty_forProperty_(v24, v45, 0, *MEMORY[0x24BDB42B0], v46);
      objc_msgSend_setDirty_forProperty_(v24, v47, 0, *MEMORY[0x24BDB42B8], v48);
      objc_msgSend_notifyRemoteDevicesOfModifiedAccount_withChangeType_(v9, v49, (uint64_t)v24, (uint64_t)v10, v50);
LABEL_44:

    }
  }
  else if ((v14 & 1) == 0)
  {
    _AALogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v111 = v8;
      v112 = 2112;
      v113 = v10;
      _os_log_impl(&dword_230EA3000, v24, OS_LOG_TYPE_DEFAULT, "Not sending data separated account %@ through the IDS Proxy for changetype: %@", buf, 0x16u);
    }
    goto LABEL_44;
  }

}

- (BOOL)_shouldSendAccountChangeOverIDSProxy:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_isDataSeparatedAccount_(MEMORY[0x24BE049E8], a2, (uint64_t)a3, v3, v4) ^ 1;
}

- (id)_saveOptionsForProxiedDeviceAuth
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  id v61;
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE0ACB0]);
  v61 = 0;
  objc_msgSend_anisetteDataWithError_(v2, v3, (uint64_t)&v61, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v61;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v8, OS_LOG_TYPE_DEFAULT, "Creating parameterized Anisette data...", buf, 2u);
    }

    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_machineID(v6, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v16, (uint64_t)v15, *MEMORY[0x24BE04BF8], v17);

    objc_msgSend_oneTimePassword(v6, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v23, (uint64_t)v22, *MEMORY[0x24BE04C00], v24);

    v25 = (void *)MEMORY[0x24BDD16E0];
    v30 = objc_msgSend_routingInfo(v6, v26, v27, v28, v29);
    objc_msgSend_numberWithUnsignedLongLong_(v25, v31, v30, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v35, (uint64_t)v34, *MEMORY[0x24BE04C08], v36);

    objc_msgSend_currentDevice(MEMORY[0x24BE0AD68], v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniqueDeviceIdentifier(v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v47, (uint64_t)v46, *MEMORY[0x24BE04C18], v48);

    objc_msgSend_currentDevice(MEMORY[0x24BE0AD68], v49, v50, v51, v52);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverFriendlyDescription(v8, v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v58, (uint64_t)v57, *MEMORY[0x24BE04C10], v59);

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v63 = v7;
      _os_log_impl(&dword_230EA3000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch Anisette data! Error: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)_showRedirectToBridgeAlertForAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  id v57;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v10, v11, (uint64_t)CFSTR("BRIDGE_LOGIN_ALERT_TITLE"), (uint64_t)&stru_24FF9D690, (uint64_t)CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(v5, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)v12, v19, v20, v17);
  v57 = (id)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = (void *)MEMORY[0x24BDD1488];
  v23 = objc_opt_class();
  objc_msgSend_bundleForClass_(v22, v24, v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v27, v28, (uint64_t)CFSTR("BRIDGE_LOGIN_ALERT_MESSAGE"), (uint64_t)&stru_24FF9D690, (uint64_t)CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(v5, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(v21, v35, (uint64_t)v29, v36, v37, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x24BE04A90];
  v40 = (void *)MEMORY[0x24BDD1488];
  v41 = objc_opt_class();
  objc_msgSend_bundleForClass_(v40, v42, v41, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v45, v46, (uint64_t)CFSTR("BRIDGE_LOGIN_ALERT_CANCEL"), (uint64_t)&stru_24FF9D690, (uint64_t)CFSTR("Localizable"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x24BDD1488];
  v49 = objc_opt_class();
  objc_msgSend_bundleForClass_(v48, v50, v49, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v53, v54, (uint64_t)CFSTR("BRIDGE_LOGIN_ALERT_OK"), (uint64_t)&stru_24FF9D690, (uint64_t)CFSTR("Localizable"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_showUserNotificationWithTitle_message_cancelButtonTitle_otherButtonTitle_withCompletionBlock_(v39, v56, (uint64_t)v57, (uint64_t)v38, (uint64_t)v47, v55, &unk_24FF9D170);

}

@end
