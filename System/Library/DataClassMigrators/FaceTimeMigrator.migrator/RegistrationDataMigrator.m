@implementation RegistrationDataMigrator

- (id)dataClassName
{
  return CFSTR("facetime-registration");
}

- (BOOL)performMigration
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  NSObject *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t n;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t jj;
  void *v77;
  void *v78;
  int v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *obj;
  id v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[5];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint8_t v147[128];
  uint8_t buf[4];
  NSObject *v149;
  __int16 v150;
  void *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  if (-[DataClassMigrator didRestoreFromBackup](self, "didRestoreFromBackup"))
  {
    CFPreferencesSetAppValue(CFSTR("restoredFromBackup"), &unk_24FE00BF0, CFSTR("com.apple.conference"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.conference"));
  }
  v2 = objc_alloc_init(MEMORY[0x24BDB4398]);
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB40A0]);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB40E0]);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4038]);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB3FE0]);
  v87 = (void *)v3;
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v5;
  v86 = (void *)v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, v5, 0);
  v90 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE508C8], "registration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v149 = v6;
    _os_log_impl(&dword_23028C000, v7, OS_LOG_TYPE_DEFAULT, "Account types to cleanup: %@", buf, 0xCu);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  obj = v6;
  v95 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
  if (v95)
  {
    v93 = *(id *)v138;
    do
    {
      v8 = 0;
      do
      {
        if (*(id *)v138 != v93)
          objc_enumerationMutation(obj);
        v97 = v8;
        v9 = *(NSObject **)(*((_QWORD *)&v137 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BE508C8], "registration");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v149 = v9;
          _os_log_impl(&dword_23028C000, v10, OS_LOG_TYPE_DEFAULT, "  Cleaning up type: %@", buf, 0xCu);
        }

        objc_msgSend(v2, "accountsWithAccountType:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v133 = 0u;
        v134 = 0u;
        v135 = 0u;
        v136 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v134;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v134 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
              objc_msgSend(v18, "username");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "length");

              if (!v20)
              {
                objc_msgSend(MEMORY[0x24BE508C8], "registration");
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v18, "username");
                  v22 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v149 = v22;
                  v150 = 2112;
                  v151 = v18;
                  _os_log_impl(&dword_23028C000, v21, OS_LOG_TYPE_DEFAULT, "  Queueing account with username: %@  (%@)", buf, 0x16u);

                }
                objc_msgSend(v12, "addObject:", v18);
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
          }
          while (v15);
        }

        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v23 = v12;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v130;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v130 != v26)
                objc_enumerationMutation(v23);
              v28 = *(NSObject **)(*((_QWORD *)&v129 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BE508C8], "registration");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v149 = v28;
                _os_log_impl(&dword_23028C000, v29, OS_LOG_TYPE_DEFAULT, "  Deleting account: %@", buf, 0xCu);
              }

              objc_msgSend(v2, "removeAccount:withCompletionHandler:", v28, &unk_24FE00930);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
          }
          while (v25);
        }

        v8 = v97 + 1;
      }
      while (v97 + 1 != v95);
      v95 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
    }
    while (v95);
  }

  objc_msgSend(MEMORY[0x24BE508C8], "registration");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v149 = v90;
    _os_log_impl(&dword_23028C000, v30, OS_LOG_TYPE_DEFAULT, "Account types to delete: %@", buf, 0xCu);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v94 = v90;
  v98 = -[NSObject countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v125, v146, 16);
  if (v98)
  {
    v96 = *(_QWORD *)v126;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v126 != v96)
          objc_enumerationMutation(v94);
        v100 = v31;
        v32 = *(NSObject **)(*((_QWORD *)&v125 + 1) + 8 * v31);
        objc_msgSend(MEMORY[0x24BE508C8], "registration");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v149 = v32;
          _os_log_impl(&dword_23028C000, v33, OS_LOG_TYPE_DEFAULT, "  Deleting type: %@", buf, 0xCu);
        }

        objc_msgSend(v2, "accountsWithAccountType:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v36 = v34;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v121, v145, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v122;
          do
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v122 != v39)
                objc_enumerationMutation(v36);
              v41 = *(NSObject **)(*((_QWORD *)&v121 + 1) + 8 * k);
              objc_msgSend(MEMORY[0x24BE508C8], "registration");
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v149 = v41;
                _os_log_impl(&dword_23028C000, v42, OS_LOG_TYPE_DEFAULT, "  Queued account to delete: %@", buf, 0xCu);
              }

              objc_msgSend(v35, "addObject:", v41);
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v121, v145, 16);
          }
          while (v38);
        }

        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v43 = v35;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v117, v144, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v118;
          do
          {
            for (m = 0; m != v45; ++m)
            {
              if (*(_QWORD *)v118 != v46)
                objc_enumerationMutation(v43);
              v48 = *(NSObject **)(*((_QWORD *)&v117 + 1) + 8 * m);
              objc_msgSend(MEMORY[0x24BE508C8], "registration");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v149 = v48;
                _os_log_impl(&dword_23028C000, v49, OS_LOG_TYPE_DEFAULT, "  Deleting account: %@", buf, 0xCu);
              }

              objc_msgSend(v2, "removeAccount:withCompletionHandler:", v48, &unk_24FE00950);
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v117, v144, 16);
          }
          while (v45);
        }

        v31 = v100 + 1;
      }
      while (v100 + 1 != v98);
      v98 = -[NSObject countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v125, v146, 16);
    }
    while (v98);
  }

  v50 = v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23028C000, v51, OS_LOG_TYPE_DEFAULT, "Didn't get an account type for IDS account, bailing...", buf, 2u);
    }
    goto LABEL_118;
  }
  objc_msgSend(v2, "accountsWithAccountType:", v87);
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v88)
  {
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23028C000, v53, OS_LOG_TYPE_DEFAULT, "Didn't get an account type for Apple ID account", buf, 2u);
    }
LABEL_94:

    goto LABEL_95;
  }
  objc_msgSend(v2, "accountsWithAccountType:");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = v52;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v103 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
    if (v103)
    {
      v99 = *(_QWORD *)v114;
      v101 = v51;
      v91 = v53;
      do
      {
        for (n = 0; n != v103; ++n)
        {
          if (*(_QWORD *)v114 != v99)
            objc_enumerationMutation(v91);
          v55 = *(NSObject **)(*((_QWORD *)&v113 + 1) + 8 * n);
          objc_msgSend(MEMORY[0x24BE508C8], "registration");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v149 = v55;
            _os_log_impl(&dword_23028C000, v56, OS_LOG_TYPE_DEFAULT, "Checking %@", buf, 0xCu);
          }

          -[NSObject username](v55, "username");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v58 = v51;
          v59 = -[NSObject countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
          if (v59)
          {
            v60 = v59;
            v61 = *(_QWORD *)v110;
            while (2)
            {
              for (ii = 0; ii != v60; ++ii)
              {
                if (*(_QWORD *)v110 != v61)
                  objc_enumerationMutation(v58);
                v63 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * ii);
                objc_msgSend(v63, "username");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (IMAreEmailsLogicallyTheSame())
                {
                  objc_msgSend(v63, "accountProperties");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "objectForKey:", CFSTR("profileID"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v66, "length"))
                  {
                    -[NSObject accountProperties](v55, "accountProperties");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "objectForKey:", CFSTR("profileID"));
                    v89 = objc_claimAutoreleasedReturnValue();

                    -[NSObject accountProperties](v55, "accountProperties");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "objectForKey:", CFSTR("dsid"));
                    v69 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v63, "setAccountProperty:forKey:", v89, CFSTR("profileID"));
                    objc_msgSend(v63, "setAccountProperty:forKey:", v69, CFSTR("dsid"));
                    objc_msgSend(MEMORY[0x24BE508C8], "registration");
                    v70 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v149 = v89;
                      _os_log_impl(&dword_23028C000, v70, OS_LOG_TYPE_DEFAULT, "Didn't find a profileID on the account, updating with value from the AppleID account %@", buf, 0xCu);
                    }

                    v108[0] = MEMORY[0x24BDAC760];
                    v108[1] = 3221225472;
                    v108[2] = sub_23028E60C;
                    v108[3] = &unk_24FE00978;
                    v108[4] = v63;
                    objc_msgSend(v2, "saveVerifiedAccount:withCompletionHandler:", v63, v108);

                  }
                  goto LABEL_87;
                }

              }
              v60 = -[NSObject countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
              if (v60)
                continue;
              break;
            }
          }
LABEL_87:

          v51 = v101;
        }
        v53 = v91;
        v103 = -[NSObject countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
      }
      while (v103);
      v50 = v87;
    }
    goto LABEL_94;
  }
LABEL_95:
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB3FD8]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_msgSend(v2, "accountsWithAccountType:", v71);
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v104, v141, 16);
    if (v73)
    {
      v74 = v73;
      v102 = v51;
      v75 = *(_QWORD *)v105;
      while (2)
      {
        for (jj = 0; jj != v74; ++jj)
        {
          if (*(_QWORD *)v105 != v75)
            objc_enumerationMutation(v72);
          v77 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * jj);
          objc_msgSend(v77, "accountPropertyForKey:", CFSTR("primaryAccount"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "BOOLValue");

          if (v79)
          {
            objc_msgSend(v77, "username");
            v80 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE508C8], "registration");
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v149 = v80;
              _os_log_impl(&dword_23028C000, v81, OS_LOG_TYPE_DEFAULT, "Found iCloud account with username %@", buf, 0xCu);
            }

            goto LABEL_108;
          }
        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v104, v141, 16);
        if (v74)
          continue;
        break;
      }
      v80 = 0;
LABEL_108:
      v51 = v102;
    }
    else
    {
      v80 = 0;
    }

    if (-[NSObject length](v80, "length"))
    {
      objc_msgSend(MEMORY[0x24BE508C8], "registration");
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = v80;
        _os_log_impl(&dword_23028C000, v82, OS_LOG_TYPE_DEFAULT, "Kicking sign in with: %@", buf, 0xCu);
      }

      IDSiCloudSignIn();
    }

    v50 = v87;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE508C8], "registration");
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23028C000, v80, OS_LOG_TYPE_DEFAULT, "Didn't get an account type for iCloud account, bailing...", buf, 2u);
    }
  }

LABEL_118:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, CFSTR("FaceTimeRegistrationRestoredFromBackupNotification"), 0, 0, 1uLL);

  return 1;
}

- (float)estimatedDuration
{
  return 1.0;
}

@end
