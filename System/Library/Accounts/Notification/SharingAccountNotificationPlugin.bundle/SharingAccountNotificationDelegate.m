@implementation SharingAccountNotificationDelegate

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  NSObject *v22;
  const char *v23;
  char v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  const __CFString *v35;
  const __CFString *v36;
  int v37;
  _BYTE v38[14];
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  v10 = v9;
  if (a4 == 3)
    v11 = v9;
  else
    v11 = v8;
  v12 = v11;
  objc_msgSend(v12, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x24BE047F0];
  v16 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  v17 = objc_msgSend(v8, "aa_isAccountClass:", v15);
  sub_230F62700();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v35 = CFSTR("NO");
    v37 = 67110402;
    *(_DWORD *)v38 = a4;
    if (v17)
      v36 = CFSTR("YES");
    else
      v36 = CFSTR("NO");
    if (v16)
      v35 = CFSTR("YES");
    *(_WORD *)&v38[4] = 2112;
    *(_QWORD *)&v38[6] = v14;
    v39 = 2112;
    v40 = v36;
    v41 = 2112;
    v42 = v35;
    v43 = 2112;
    v44 = v10;
    v45 = 2112;
    v46 = v8;
    _os_log_debug_impl(&dword_230F61000, v18, OS_LOG_TYPE_DEBUG, "Account change with parameters (type: %d, identifier: %@, newIsPrimary: %@, oldIsPrimary: %@, old account: %@, account: %@)", (uint8_t *)&v37, 0x3Au);
  }

  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
  {
    if (v8)
      v19 = 1;
    else
      v19 = v10 == 0;
    if (!v19 && a4 == 3)
      v21 = v16;
    else
      v21 = 0;
    if (v21 == 1)
    {
      sub_230F62700();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        objc_msgSend(MEMORY[0x24BE900A0], "appleAccountSignedOut");
        goto LABEL_49;
      }
      v37 = 138412290;
      *(_QWORD *)v38 = v10;
      v23 = "Primary account deleted (old account: %@)";
LABEL_18:
      _os_log_impl(&dword_230F61000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v37, 0xCu);
      goto LABEL_19;
    }
    if (v16)
    {
      if ((v17 & 1) != 0)
      {
        if (!v8 || a4 != 1 || v10)
          goto LABEL_49;
        goto LABEL_36;
      }
      objc_msgSend(v10, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if (a4 == 2 && v31)
      {
        sub_230F62700();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v37 = 138412290;
        *(_QWORD *)v38 = v8;
        v23 = "Primary account demoted to secondary (account: %@)";
        goto LABEL_18;
      }
    }
    else
    {
      if (a4 != 1 || v10 != 0 || v8 == 0)
        v26 = 0;
      else
        v26 = v17;
      if ((v26 & 1) != 0)
      {
LABEL_36:
        sub_230F62700();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_39:

          objc_msgSend(MEMORY[0x24BE900A0], "appleAccountSignedIn");
          goto LABEL_49;
        }
        v37 = 138412290;
        *(_QWORD *)v38 = v8;
        v28 = "Primary account added (account: %@)";
LABEL_38:
        _os_log_impl(&dword_230F61000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v37, 0xCu);
        goto LABEL_39;
      }
      if (v17)
      {
        objc_msgSend(v10, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqualToString:", v33);

        if (a4 == 2)
        {
          if (v34)
          {
            sub_230F62700();
            v27 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              goto LABEL_39;
            v37 = 138412290;
            *(_QWORD *)v38 = v8;
            v28 = "Account promoted to primary (account: %@)";
            goto LABEL_38;
          }
        }
      }
    }
  }
LABEL_49:

}

@end
