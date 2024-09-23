@implementation IDSAccountNotificationDelegate

- (IDSAccountNotificationDelegate)init
{
  IDSAccountNotificationDelegate *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;
  uint8_t buf[4];
  IDSAccountNotificationDelegate *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)IDSAccountNotificationDelegate;
  v2 = -[IDSAccountNotificationDelegate init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v2;
      _os_log_impl(&dword_230F26000, v3, OS_LOG_TYPE_DEFAULT, "IDSAccountNotificationDelegate loaded { self: %p }", buf, 0xCu);
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.identityservices.idsaccountnotficationdelegate", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_setupRequestPending = 0;
  }
  return v2;
}

- (id)_findExistingIdentityServicesACAccountWithUserName:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BDB40A0];
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB40A0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE508C8], "warning");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_230F28970(v7, v9);
    goto LABEL_18;
  }
  objc_msgSend(v6, "accountsWithAccountType:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (!v10)
  {
LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
  v11 = v10;
  v20 = v6;
  v12 = 0;
  v13 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v9);
      if (!v12)
      {
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "username");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToIgnoringCase:", v5);

        if (v17)
        {
          v12 = v15;
          objc_msgSend(MEMORY[0x24BE508C8], "registration");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl(&dword_230F26000, v18, OS_LOG_TYPE_DEFAULT, "Found matching IDS ACAccount { account: %@ }", buf, 0xCu);
          }

        }
        else
        {
          v12 = 0;
        }
      }
    }
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  }
  while (v11);
  v6 = v20;
LABEL_19:

  return v12;
}

- (void)_iCloudSignInBasedOnAccount:(id)a3 inStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE508C8];
  v8 = a4;
  objc_msgSend(v7, "registration");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_230F26000, v9, OS_LOG_TYPE_DEFAULT, "Signing in iCloud-based IDS services { account: %@ }", buf, 0xCu);
  }

  objc_msgSend(v6, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccountNotificationDelegate _findExistingIdentityServicesACAccountWithUserName:inStore:](self, "_findExistingIdentityServicesACAccountWithUserName:inStore:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self->_setupRequestPending = 0;
    objc_msgSend(v11, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(v11, "credential");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "token");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v11, "accountPropertyForKey:", *MEMORY[0x24BE4F948]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    objc_msgSend(v11, "accountPropertyForKey:", *MEMORY[0x24BE4F950]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    queue = self->_queue;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_230F276A0;
    v27[3] = &unk_24FFB4728;
    v28 = v13;
    v29 = v16;
    v30 = v18;
    v31 = v20;
    v22 = v20;
    v23 = v18;
    v24 = v16;
    v25 = v13;
    dispatch_async(queue, v27);
    self->_setupRequestPending = 0;

  }
  else
  {
    self->_setupRequestPending = 1;
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "username");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      _os_log_impl(&dword_230F26000, v25, OS_LOG_TYPE_DEFAULT, "No existing ACAccount for this username, waiting... { username: %@ }", buf, 0xCu);

    }
  }

}

- (void)_iCloudSignOut
{
  dispatch_async((dispatch_queue_t)self->_queue, &unk_24FFB4768);
}

- (void)_iCloudModifyBasedOnUsername:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F27748;
  block[3] = &unk_24FFB4790;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (id)_passwordEquivalentTokenFromAccount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_iTunesSignInBasedOnAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE508C8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_230F26000, v5, OS_LOG_TYPE_DEFAULT, "Signing in iTunes-based IDS services { account: %@ }", buf, 0xCu);
  }

  objc_msgSend(v4, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[IDSAccountNotificationDelegate _passwordEquivalentTokenFromAccount:](self, "_passwordEquivalentTokenFromAccount:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_230F278F4;
  v13[3] = &unk_24FFB47B8;
  v14 = v7;
  v15 = v9;
  v11 = v9;
  v12 = v7;
  dispatch_async(queue, v13);

}

- (void)_iTunesSignOut
{
  dispatch_async((dispatch_queue_t)self->_queue, &unk_24FFB47D8);
}

- (void)_gameCenterSignInBasedOnAccount:(id)a3 inStore:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE508C8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_230F26000, v6, OS_LOG_TYPE_DEFAULT, "Signing in GameCenter-based IDS services { account: %@ }", buf, 0xCu);
  }

  objc_msgSend(v5, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[IDSAccountNotificationDelegate _passwordEquivalentTokenFromAccount:](self, "_passwordEquivalentTokenFromAccount:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_230F27A8C;
  v14[3] = &unk_24FFB47B8;
  v15 = v8;
  v16 = v10;
  v12 = v10;
  v13 = v8;
  dispatch_async(queue, v14);

}

- (void)_gameCenterSignOut
{
  dispatch_async((dispatch_queue_t)self->_queue, &unk_24FFB47F8);
}

- (void)_gameCenterModifyBasedOnUsername:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F27B38;
  block[3] = &unk_24FFB4790;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  IDSAccountNotificationDelegate *v10;
  id v11;
  IDSAccountNotificationDelegate *v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  IDSAccountNotificationDelegate *v17;
  void *v18;
  IDSAccountNotificationDelegate *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  const __CFString *v26;
  int v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  IDSAccountNotificationDelegate *v32;
  IDSAccountNotificationDelegate *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  id v41;
  int v42;
  int v43;
  NSObject *v44;
  const __CFString *v45;
  const __CFString *v46;
  id v47;
  int v48;
  int v49;
  void *v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  NSObject *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  void *v60;
  uint64_t v61;
  int v62;
  int v63;
  int v64;
  int v65;
  NSObject *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  int v72;
  int v73;
  uint64_t v74;
  int v75;
  id v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  IDSAccountNotificationDelegate *v80;
  __int16 v81;
  const __CFString *v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  const __CFString *v88;
  __int16 v89;
  const __CFString *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v10 = (IDSAccountNotificationDelegate *)a3;
  v11 = a5;
  v12 = (IDSAccountNotificationDelegate *)a6;
  objc_msgSend(MEMORY[0x24BE508C8], "registration");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[IDSAccountNotificationDelegate account:didChangeWithType:inStore:oldAccount:]";
    v79 = 2048;
    v80 = self;
    _os_log_impl(&dword_230F26000, v13, OS_LOG_TYPE_DEFAULT, "%s invoked { self: %p }", buf, 0x16u);
  }

  v14 = (_QWORD *)MEMORY[0x24BDB3FD8];
  if (a4 == 3)
  {
    -[IDSAccountNotificationDelegate accountType](v12, "accountType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "isEqualToString:", *v14) & 1) != 0)
    {
      v17 = self;
      v18 = v16;
      v76 = v11;
      v19 = v12;
      -[IDSAccountNotificationDelegate accountPropertyForKey:](v12, "accountPropertyForKey:", CFSTR("primaryAccount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");
      v22 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    -[IDSAccountNotificationDelegate accountType](v10, "accountType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "isEqualToString:", *v14) & 1) != 0)
    {
      v17 = self;
      v18 = v16;
      v19 = v12;
      v76 = v11;
      if (a4 == 2)
      {
        -[IDSAccountNotificationDelegate accountPropertyForKey:](v10, "accountPropertyForKey:", CFSTR("primaryAccount"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "BOOLValue");
        v21 = 0;
        v22 = 0;
        goto LABEL_11;
      }
      if (a4 != 1)
      {
        v21 = 0;
        v22 = 0;
        v24 = 0;
        goto LABEL_12;
      }
      -[IDSAccountNotificationDelegate accountPropertyForKey:](v10, "accountPropertyForKey:", CFSTR("primaryAccount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "BOOLValue");
      v21 = 0;
LABEL_10:
      v24 = 0;
LABEL_11:

LABEL_12:
      objc_msgSend(MEMORY[0x24BE508C8], "registration");
      v25 = objc_claimAutoreleasedReturnValue();
      v12 = v19;
      v16 = v18;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if ((a4 - 1) > 3)
          v26 = CFSTR("Unknown");
        else
          v26 = *(&off_24FFB4818 + a4 - 1);
        v29 = CFSTR("NO");
        *(_DWORD *)buf = 138413570;
        v78 = (const char *)v12;
        if (v22)
          v30 = CFSTR("YES");
        else
          v30 = CFSTR("NO");
        if (v21)
          v31 = CFSTR("YES");
        else
          v31 = CFSTR("NO");
        if (v24)
          v29 = CFSTR("YES");
        v79 = 2112;
        v80 = v10;
        v81 = 2112;
        v82 = v26;
        v83 = 2112;
        v84 = v30;
        v85 = 2112;
        v86 = v31;
        v87 = 2112;
        v88 = v29;
        _os_log_impl(&dword_230F26000, v25, OS_LOG_TYPE_DEFAULT, "iCloud account changed { oldAccount: %@, newAccount: %@, changeType: %@, didSignIn: %@, didSignOut: %@, wasModified: %@ }", buf, 0x3Eu);
      }

      if (v22)
      {
        v32 = v17;
        v33 = v10;
        v11 = v76;
LABEL_37:
        -[IDSAccountNotificationDelegate _iCloudSignInBasedOnAccount:inStore:](v32, "_iCloudSignInBasedOnAccount:inStore:", v33, v11);
        goto LABEL_135;
      }
      v11 = v76;
      if (v21)
      {
        -[IDSAccountNotificationDelegate _iCloudSignOut](v17, "_iCloudSignOut");
        goto LABEL_135;
      }
      if (!v24)
        goto LABEL_135;
      -[IDSAccountNotificationDelegate username](v10, "username");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSAccountNotificationDelegate _iCloudModifyBasedOnUsername:](v17, "_iCloudModifyBasedOnUsername:", v40);
LABEL_134:

      goto LABEL_135;
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB4180]))
  {
    v73 = a4 - 1;
    if (a4 == 1)
    {
      v41 = v11;
      v75 = -[IDSAccountNotificationDelegate isActive](v10, "isActive");
    }
    else
    {
      if (a4 == 2)
      {
        if ((-[IDSAccountNotificationDelegate isActive](v12, "isActive") & 1) != 0)
          v27 = 0;
        else
          v27 = -[IDSAccountNotificationDelegate isActive](v10, "isActive");
        v75 = v27;
        v41 = v11;
        if (-[IDSAccountNotificationDelegate isActive](v10, "isActive"))
          v43 = -[IDSAccountNotificationDelegate isAuthenticated](v10, "isAuthenticated");
        else
          v43 = 0;
        v42 = 1;
        goto LABEL_71;
      }
      v41 = v11;
      v75 = 0;
    }
    v42 = 0;
    v43 = 0;
LABEL_71:
    -[IDSAccountNotificationDelegate _passwordEquivalentTokenFromAccount:](self, "_passwordEquivalentTokenFromAccount:", v10);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "length");

    if (!v51)
      v43 = 0;
    if (a4 == 3)
      v52 = -[IDSAccountNotificationDelegate isActive](v12, "isActive");
    else
      v52 = 0;
    v11 = v41;
    if (v42 && -[IDSAccountNotificationDelegate isActive](v12, "isActive"))
      v53 = -[IDSAccountNotificationDelegate isActive](v10, "isActive") ^ 1;
    else
      v53 = 0;
    v54 = v52 | v53;
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      if (v73 > 3)
        v56 = CFSTR("Unknown");
      else
        v56 = *(&off_24FFB4818 + v73);
      *(_DWORD *)buf = 138413826;
      v57 = CFSTR("YES");
      v78 = (const char *)v12;
      v79 = 2112;
      if (v75)
        v58 = CFSTR("YES");
      else
        v58 = CFSTR("NO");
      v80 = v10;
      if (v43)
        v59 = CFSTR("YES");
      else
        v59 = CFSTR("NO");
      v81 = 2112;
      if (!v54)
        v57 = CFSTR("NO");
      v82 = v56;
      v83 = 2112;
      v84 = CFSTR("NO");
      v85 = 2112;
      v86 = v58;
      v87 = 2112;
      v88 = v59;
      v89 = 2112;
      v90 = v57;
      _os_log_impl(&dword_230F26000, v55, OS_LOG_TYPE_DEFAULT, "iTunes account changed { oldAccount: %@, newAccount: %@, changeType: %@, addedMediaTypes: %@, didSignIn: %@, isInGoodStateForRepair: %@, didSignOut: %@ }", buf, 0x48u);
    }

    if ((v75 | v43) == 1)
    {
      -[IDSAccountNotificationDelegate _iTunesSignInBasedOnAccount:](self, "_iTunesSignInBasedOnAccount:", v10);
    }
    else if (v54)
    {
      -[IDSAccountNotificationDelegate _iTunesSignOut](self, "_iTunesSignOut");
    }
    goto LABEL_135;
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB4060]))
  {
    v72 = a4 - 1;
    if (a4 == 1)
    {
      v47 = v11;
      LODWORD(v74) = 0;
      HIDWORD(v74) = -[IDSAccountNotificationDelegate isActive](v10, "isActive");
    }
    else
    {
      if (a4 == 2)
      {
        if ((-[IDSAccountNotificationDelegate isActive](v12, "isActive") & 1) != 0)
          v28 = 0;
        else
          v28 = -[IDSAccountNotificationDelegate isActive](v10, "isActive");
        HIDWORD(v74) = v28;
        v47 = v11;
        if (-[IDSAccountNotificationDelegate isActive](v10, "isActive"))
        {
          v49 = -[IDSAccountNotificationDelegate isAuthenticated](v10, "isAuthenticated");
          LODWORD(v74) = 1;
        }
        else
        {
          LODWORD(v74) = 0;
          v49 = 0;
        }
        v48 = 1;
        goto LABEL_102;
      }
      v47 = v11;
      v74 = 0;
    }
    v48 = 0;
    v49 = 0;
LABEL_102:
    -[IDSAccountNotificationDelegate _passwordEquivalentTokenFromAccount:](self, "_passwordEquivalentTokenFromAccount:", v10);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "length");

    if (v61)
      v62 = v49;
    else
      v62 = 0;
    if (a4 == 3)
      v63 = -[IDSAccountNotificationDelegate isActive](v12, "isActive");
    else
      v63 = 0;
    v11 = v47;
    if (v48 && -[IDSAccountNotificationDelegate isActive](v12, "isActive"))
      v64 = -[IDSAccountNotificationDelegate isActive](v10, "isActive") ^ 1;
    else
      v64 = 0;
    v65 = v63 | v64;
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      if (v72 > 3)
        v67 = CFSTR("Unknown");
      else
        v67 = *(&off_24FFB4818 + v72);
      v68 = CFSTR("NO");
      *(_DWORD *)buf = 138413826;
      v78 = (const char *)v12;
      v79 = 2112;
      if (HIDWORD(v74))
        v69 = CFSTR("YES");
      else
        v69 = CFSTR("NO");
      v80 = v10;
      if (v62)
        v70 = CFSTR("YES");
      else
        v70 = CFSTR("NO");
      v82 = v67;
      if ((_DWORD)v74)
        v71 = CFSTR("YES");
      else
        v71 = CFSTR("NO");
      v81 = 2112;
      if (v65)
        v68 = CFSTR("YES");
      v83 = 2112;
      v84 = v69;
      v85 = 2112;
      v86 = v70;
      v87 = 2112;
      v88 = v71;
      v89 = 2112;
      v90 = v68;
      _os_log_impl(&dword_230F26000, v66, OS_LOG_TYPE_DEFAULT, "GameCenter account changed { oldAccount: %@, newAccount: %@, changeType: %@, didSignIn: %@, isInGoodStateForRepair: %@, wasModified: %@, didSignOut: %@ }", buf, 0x48u);
    }

    if ((HIDWORD(v74) | v62) == 1)
    {
      -[IDSAccountNotificationDelegate _gameCenterSignInBasedOnAccount:inStore:](self, "_gameCenterSignInBasedOnAccount:inStore:", v10, v47);
      goto LABEL_135;
    }
    if (v65)
    {
      -[IDSAccountNotificationDelegate _gameCenterSignOut](self, "_gameCenterSignOut");
      goto LABEL_135;
    }
    if (!(_DWORD)v74)
      goto LABEL_135;
    -[IDSAccountNotificationDelegate username](v10, "username");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSAccountNotificationDelegate _gameCenterModifyBasedOnUsername:](self, "_gameCenterModifyBasedOnUsername:", v40);
    goto LABEL_134;
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB4080]))
  {
    -[IDSAccountNotificationDelegate username](v12, "username");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
    {
      -[IDSAccountNotificationDelegate username](v10, "username");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "length"))
      {
        -[IDSAccountNotificationDelegate username](v12, "username");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSAccountNotificationDelegate username](v10, "username");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqualToString:", v37);

        if ((v38 & 1) != 0)
          goto LABEL_135;
        objc_msgSend(MEMORY[0x24BE508C8], "registration");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v78 = (const char *)v12;
          v79 = 2112;
          v80 = v10;
          _os_log_impl(&dword_230F26000, v39, OS_LOG_TYPE_DEFAULT, "IDMS account username changed { oldAccount: %@, newAccount: %@ }", buf, 0x16u);
        }

        -[IDSAccountNotificationDelegate username](v12, "username");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSAccountNotificationDelegate username](v10, "username");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        IDSUpdateUser();
      }

    }
    goto LABEL_135;
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB40A0]))
  {
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_setupRequestPending)
        v45 = CFSTR("YES");
      else
        v45 = CFSTR("NO");
      if ((a4 - 1) > 3)
        v46 = CFSTR("Unknown");
      else
        v46 = *(&off_24FFB4818 + a4 - 1);
      *(_DWORD *)buf = 138413058;
      v78 = (const char *)v45;
      v79 = 2112;
      v80 = v12;
      v81 = 2112;
      v82 = (const __CFString *)v10;
      v83 = 2112;
      v84 = v46;
      _os_log_impl(&dword_230F26000, v44, OS_LOG_TYPE_DEFAULT, "IDS account changed { requestPending: %@, oldAccount: %@, newAccount: %@, changeType: %@ }", buf, 0x2Au);
    }

    if (self->_setupRequestPending && a4 <= 4 && ((1 << a4) & 0x16) != 0)
    {
      v32 = self;
      v33 = v10;
      goto LABEL_37;
    }
  }
LABEL_135:

}

- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  BOOL v34;
  char v35;
  uint64_t v36;
  void *v38;
  id v39;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB40A0];
  v10 = objc_msgSend(v8, "compare:options:", *MEMORY[0x24BDB40A0], 4);

  if (v10)
  {
    v11 = 1;
    goto LABEL_41;
  }
  v50[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v6, "accountsWithAccountTypeIdentifiers:error:", v12, &v48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v48;

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_230F289E4((uint64_t)v14, v16);
    goto LABEL_37;
  }
  objc_msgSend(v5, "accountProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("profile-id"));
  v16 = objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v13;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v43)
    goto LABEL_34;
  v42 = *(_QWORD *)v45;
  v39 = v14;
  v40 = v6;
  v38 = v13;
  do
  {
    v17 = 0;
    v18 = obj;
    do
    {
      if (*(_QWORD *)v45 != v42)
        objc_enumerationMutation(v18);
      v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
      objc_msgSend(v5, "identifier", v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "length"))
        goto LABEL_14;
      objc_msgSend(v19, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "length"))
      {

LABEL_14:
        goto LABEL_15;
      }
      objc_msgSend(v5, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
      {
        v11 = 1;
LABEL_39:

        v13 = v18;
        v14 = v39;
        v6 = v40;
        goto LABEL_40;
      }
LABEL_15:
      if ((objc_msgSend(v5, "aa_isDuplicateAccount:", v19) & 1) != 0)
        goto LABEL_38;
      objc_msgSend(v19, "accountProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("profile-id"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSObject length](v16, "length")
        && objc_msgSend(v26, "length")
        && -[NSObject isEqualToString:](v16, "isEqualToString:", v26))
      {
        objc_msgSend(v19, "username");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "length"))
        {
          objc_msgSend(v5, "username");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "length"))
          {
            objc_msgSend(v19, "username");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "username");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v29, "isEqualToString:", v30);

          }
          else
          {
            v31 = 0;
          }

        }
        else
        {
          v31 = 0;
        }

        objc_msgSend(v19, "username");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "length"))
        {
          objc_msgSend(v5, "username");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "length") == 0;

        }
        else
        {
          v34 = 0;
        }

        v35 = v31 | v34;
        v18 = obj;
        if ((v35 & 1) != 0)
        {
LABEL_38:
          v11 = 0;
          goto LABEL_39;
        }
      }
      else
      {

      }
      ++v17;
    }
    while (v43 != v17);
    v36 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    v14 = v39;
    v6 = v40;
    v13 = v38;
    v43 = v36;
  }
  while (v36);
LABEL_34:

LABEL_37:
  v11 = 1;
LABEL_40:

LABEL_41:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
