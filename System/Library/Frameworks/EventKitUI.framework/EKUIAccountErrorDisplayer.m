@implementation EKUIAccountErrorDisplayer

+ (unint64_t)severityForError:(unint64_t)a3
{
  return objc_msgSend(MEMORY[0x1E0D0C238], "severityForError:", a3);
}

+ (unint64_t)moreSevereErrorOfError:(unint64_t)a3 andError:(unint64_t)a4
{
  unint64_t v6;

  v6 = +[EKUIAccountErrorDisplayer severityForError:](EKUIAccountErrorDisplayer, "severityForError:");
  if (+[EKUIAccountErrorDisplayer severityForError:](EKUIAccountErrorDisplayer, "severityForError:", a4) <= v6)
    return a3;
  else
    return a4;
}

+ (void)presentAlertForAccount:(id)a3 error:(unint64_t)a4 usingViewController:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  unint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(v10, "externalID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v74 = v15;
    v75 = 2048;
    v76 = a4;
    _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_DEFAULT, "Presenting an alert for source with external ID %{public}@ with error %lu", buf, 0x16u);

  }
  EventKitUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E601DFA8, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a4)
  {
    case 7uLL:
      v59 = v11;
      v60 = v10;
      objc_msgSend(v10, "calendarsForEntityType:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v20 = v22;
      v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v69 != v26)
              objc_enumerationMutation(v20);
            v28 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            if (objc_msgSend(v28, "lastSyncError") == 7)
              objc_msgSend(v23, "addObject:", v28);
          }
          v25 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        }
        while (v25);
      }

      v29 = v23;
      v30 = objc_msgSend(v29, "count");
      v31 = v30 != 0;
      if (v30)
      {
        EventKitUIBundle();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Insecure connection"), &stru_1E601DFA8, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        EventKitUIBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1E601DFA8, 0);
        v58 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v29, "count") - 1;
        EventKitUIBundle();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if ((_DWORD)v34)
        {
          objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("“%@” and %d other calendars cannot connect with a secure connection. Would you like to continue syncing them anyway?"), &stru_1E601DFA8, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v62, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "localizedStringWithFormat:", v37, v39, v34);
        }
        else
        {
          objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("“%@” cannot connect with a secure connection. Would you like to continue syncing it anyway?"), &stru_1E601DFA8, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v62, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedStringWithFormat:", v37, v39, v57);
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v59;

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__EKUIAccountErrorDisplayer_presentAlertForAccount_error_usingViewController_completion___block_invoke;
        aBlock[3] = &unk_1E601B128;
        v66 = a1;
        v64 = v60;
        v65 = v29;
        v67 = 7;
        v42 = _Block_copy(aBlock);

        v61 = (void *)v58;
      }
      else
      {
        v45 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF84D000, v45, OS_LOG_TYPE_ERROR, "Trying to present an alert for EKAccountErrorInsecureConnectionNotAllowed, but there are no calendars with errors.", buf, 2u);
        }
        v42 = 0;
        v41 = 0;
        v18 = 0;
        v11 = v59;
      }

LABEL_29:
      v43 = v12;

      v44 = v11;
      if (v18 && v41)
        goto LABEL_32;
      goto LABEL_31;
    case 3uLL:
      v60 = v10;
      EventKitUIBundle();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("No internet connection"), &stru_1E601DFA8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("Unable to connect to account.");
LABEL_21:
      objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1E601DFA8, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v42 = 0;
      goto LABEL_29;
    case 2uLL:
      if ((objc_msgSend(a1, "_reauthorizeForAccount:usingViewController:completion:", v10, v11, v12) & 1) != 0)
        goto LABEL_35;
      v60 = v10;
      EventKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Incorrect password"), &stru_1E601DFA8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("Your username or password is incorrect.");
      goto LABEL_21;
  }
  v43 = v12;
  v44 = v11;
  v60 = v10;
  v18 = 0;
  v41 = 0;
  v42 = 0;
  v31 = 0;
LABEL_31:
  EventKitUIBundle();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Unknown Error"), &stru_1E601DFA8, 0);
  v48 = objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("There was an unknown error while updating this account."), &stru_1E601DFA8, 0);
  v50 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v50;
  v18 = (void *)v48;
LABEL_32:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v18, v41, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v61, 0, v42);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addAction:", v52);
  if (v31)
  {
    EventKitUIBundle();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E601DFA8, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v54, 1, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addAction:", v55);

  }
  v11 = v44;
  v56 = v44;
  v12 = v43;
  objc_msgSend(v56, "presentViewController:animated:completion:", v51, 1, v43);

  v10 = v60;
LABEL_35:

}

uint64_t __89__EKUIAccountErrorDisplayer_presentAlertForAccount_error_usingViewController_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "handleContinueSyncingForAccount:calendars:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

+ (void)handleContinueSyncingForAccount:(id)a3 calendars:(id)a4 error:(unint64_t)a5
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  _QWORD v35[4];
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v39;
    *(_QWORD *)&v8 = 138412802;
    v31 = v8;
    v32 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      v33 = v9;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        objc_msgSend(v12, "subcalAccountID", v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "accountWithIdentifier:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SubCalInsecureConnectionApproved"));
            -[NSObject setAuthenticated:](v15, "setAuthenticated:", 1);
            v16 = (void *)kEKUILogHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v16;
              objc_msgSend(v12, "title");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "calendarIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "externalID");
              v20 = v6;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v43 = v13;
              v44 = 2112;
              v45 = v18;
              v46 = 2114;
              v47 = v19;
              v48 = 2112;
              v49 = v21;
              _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_DEFAULT, "Allowing insecure connections for account %{public}@ for subscribed calendar (title = %@; calendarIdenti"
                "fier = %{public}@; externalID = %@)",
                buf,
                0x2Au);

              v6 = v20;
              v9 = v33;

              v10 = v32;
            }
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __77__EKUIAccountErrorDisplayer_handleContinueSyncingForAccount_calendars_error___block_invoke;
            v35[3] = &unk_1E601A8A0;
            v36 = v13;
            v37 = v12;
            objc_msgSend(v6, "saveAccount:withCompletionHandler:", v15, v35);

          }
          else
          {
            v26 = (void *)kEKUILogHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
            {
              v27 = v26;
              objc_msgSend(v12, "title");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "calendarIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "externalID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v43 = v13;
              v44 = 2112;
              v45 = v28;
              v46 = 2114;
              v47 = v29;
              v48 = 2112;
              v49 = v30;
              _os_log_impl(&dword_1AF84D000, v27, OS_LOG_TYPE_ERROR, "Unable to find account for subscribed calendar (accountID = %{public}@; title = %@; calendarIdentifier ="
                " %{public}@; externalId = %@)",
                buf,
                0x2Au);

              v10 = v32;
              v9 = v33;
            }
          }
        }
        else
        {
          v22 = (void *)kEKUILogHandle;
          if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
            goto LABEL_16;
          v15 = v22;
          objc_msgSend(v12, "title");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "calendarIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "externalID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v31;
          v43 = v23;
          v44 = 2114;
          v45 = v24;
          v46 = 2112;
          v47 = v25;
          _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "Trying to allow insecure syncing for a calendar without a subcal account ID. (title = %@; calendarIdentifier"
            " = %{public}@; externalId = %@)",
            buf,
            0x20u);

          v9 = v33;
        }

LABEL_16:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0D0CD30], "temporarilyIgnoreInsecureConnectionErrorsForCalendars:", obj);
}

void __77__EKUIAccountErrorDisplayer_handleContinueSyncingForAccount_calendars_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)kEKUILogHandle;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v9 = v6;
      objc_msgSend(v7, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "calendarIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "externalID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v13 = "Successfully updated account %{public}@ to allow insecure connections for subscribed calendar (title = %@; c"
            "alendarIdentifier = %{public}@; externalID = %@)";
      v14 = v9;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 42;
LABEL_6:
      _os_log_impl(&dword_1AF84D000, v14, v15, v13, (uint8_t *)&v19, v16);

    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v9 = v6;
    objc_msgSend(v17, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "calendarIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "externalID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544386;
    v20 = v18;
    v21 = 2112;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v5;
    v13 = "Unable to update account %{public}@ to allow insecure connections for subscribed calendar (title = %@; calenda"
          "rIdentifier = %{public}@; externalID = %@). Error = %@";
    v14 = v9;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 52;
    goto LABEL_6;
  }

}

+ (BOOL)_reauthorizeForAccount:(id)a3 usingViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v8, "externalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)kEKUILogHandle;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v8, "externalID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v16;
      _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_DEFAULT, "Renewing credentials for sourceAccount with ID: %{public}@", buf, 0xCu);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke;
    v20[3] = &unk_1E601B178;
    v21 = v8;
    v24 = a1;
    v22 = v9;
    v23 = v10;
    objc_msgSend(v11, "renewCredentialsForAccount:completion:", v13, v20);

  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v17 = v14;
    objc_msgSend(v8, "externalID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v18;
    _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "Can't renew credentials for sourceAccount because no ACAccount could be found with ID: %{public}@", buf, 0xCu);

  }
  return v13 != 0;
}

void __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id *v10;
  _QWORD v11[6];
  _QWORD v12[7];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "externalID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v9;
    v15 = 2048;
    v16 = a2;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_DEFAULT, "Finished renewing credentials for account with ID %{public}@. Result=%li, error=%@", buf, 0x20u);

  }
  if (!a2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_2;
    v11[3] = &unk_1E601B150;
    v11[4] = *(id *)(a1 + 32);
    v10 = (id *)v11;
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_42;
    v12[3] = &unk_1E6019380;
    v12[6] = *(_QWORD *)(a1 + 56);
    v12[4] = *(id *)(a1 + 40);
    v10 = (id *)v12;
LABEL_7:
    v10[5] = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "presentAlertForAccount:error:usingViewController:completion:", 0, 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(MEMORY[0x1E0D0CD30], "temporarilyIgnoreInvalidCredentialsErrorForSource:", *(_QWORD *)(a1 + 32));
  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_3;
  block[3] = &unk_1E6018688;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshSource:userRequested:", *(_QWORD *)(a1 + 32), 1);

}

+ (void)presentAlertForOfflineErrorUsingViewController:(id)a3
{
  objc_msgSend(a1, "presentAlertForAccount:error:usingViewController:completion:", 0, 3, a3, &__block_literal_global_41);
}

+ (BOOL)errorIsActionable:(unint64_t)a3
{
  return a3 == 2 || a3 == 7;
}

@end
