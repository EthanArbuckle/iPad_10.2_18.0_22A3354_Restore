@implementation HDSummarySharingDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("HealthSummarySharing.txt");
}

- (void)run
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3E40]), "initWithHealthStore:", v3);
  v5 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42__HDSummarySharingDiagnosticOperation_run__block_invoke;
  v16[3] = &unk_24E0D8910;
  v16[4] = self;
  v18 = &v19;
  v6 = v5;
  v17 = v6;
  objc_msgSend(v4, "fetchAllProfilesWithCompletion:", v16);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting to fetch profiles"));
  -[HDSummarySharingDiagnosticOperation _reportHeaderWithProfileIdentifiers:](self, "_reportHeaderWithProfileIdentifiers:", v20[5]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = (id)v20[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        -[HDSummarySharingDiagnosticOperation _reportDiagnosticsForProfileIdentifier:](self, "_reportDiagnosticsForProfileIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v19, 8);
}

void __42__HDSummarySharingDiagnosticOperation_run__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Error listing profiles: %@"), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reportHeaderWithProfileIdentifiers:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  HDSummarySharingDiagnosticOperation *v25;
  NSObject *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Active invitations:"));
  v5 = dispatch_semaphore_create(0);
  v6 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4018]), "initWithHealthStore:", v6);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __75__HDSummarySharingDiagnosticOperation__reportHeaderWithProfileIdentifiers___block_invoke;
  v23[3] = &unk_24E0D8938;
  v8 = v7;
  v24 = v8;
  v25 = self;
  v9 = v5;
  v26 = v9;
  objc_msgSend(v8, "fetchSharingEntriesWithCompletion:", v23);
  v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting to fetch active invitations"));
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Summary Sharing profiles:"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (!v12)
  {

LABEL_15:
    -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("No Summary Sharing profiles"));
    goto LABEL_16;
  }
  v13 = v12;
  v18 = v6;
  v14 = 0;
  v15 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v20 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if (objc_msgSend(v17, "type") == 2)
      {
        -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@"), v17);
        v14 = 1;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  }
  while (v13);

  v6 = v18;
  if ((v14 & 1) == 0)
    goto LABEL_15;
LABEL_16:
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");

}

intptr_t __75__HDSummarySharingDiagnosticOperation__reportHeaderWithProfileIdentifiers___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("Error fetching active invitations: %@"), a3);
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sharingEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
  {

LABEL_17:
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("There are no active summary sharing invitations"));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      if (!objc_msgSend(v10, "type") && (!objc_msgSend(v10, "status") || objc_msgSend(v10, "status") == 1))
      {
        v11 = *(void **)(a1 + 40);
        _HKSummarySharingEntryToDiagnosticsString(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendString:", v12);

        v7 = 1;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v6);

  if ((v7 & 1) == 0)
    goto LABEL_17;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_reportDiagnosticsForProfileIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("    ****"));
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("    **** %@"), v4);
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("    ****"));
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  if (objc_msgSend(v4, "type") == 1)
  {
    -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
    -[HDSummarySharingDiagnosticOperation _reportInvitationsForPrimaryProfile](self, "_reportInvitationsForPrimaryProfile");
  }
  else
  {
    -[HDSummarySharingDiagnosticOperation _reportProfileInformationForProfileIdentifier:](self, "_reportProfileInformationForProfileIdentifier:", v4);
  }
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  -[HDSummarySharingDiagnosticOperation _reportSharedSummariesForProfileIdentifier:committedTransactions:](self, "_reportSharedSummariesForProfileIdentifier:committedTransactions:", v4, 1);
  -[HDSummarySharingDiagnosticOperation _reportSharedSummariesForProfileIdentifier:committedTransactions:](self, "_reportSharedSummariesForProfileIdentifier:committedTransactions:", v4, 0);
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");

}

- (void)_reportProfileInformationForProfileIdentifier:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  HDSummarySharingDiagnosticOperation *v14;
  NSObject *v15;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3E40]), "initWithHealthStore:", v6);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __85__HDSummarySharingDiagnosticOperation__reportProfileInformationForProfileIdentifier___block_invoke;
  v13 = &unk_24E0D8960;
  v14 = self;
  v8 = v5;
  v15 = v8;
  objc_msgSend(v7, "fetchSharingInformationForProfileIdentifier:completion:", v4, &v10);

  v9 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v8, v9))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting to fetch profile sharing information"), v10, v11, v12, v13, v14);

}

void __85__HDSummarySharingDiagnosticOperation__reportProfileInformationForProfileIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const __CFString *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Creation date: %@"), v10);
  if (v7)
  {
    v9 = CFSTR("Owner participant set");
  }
  else
  {
    if (v8)
      goto LABEL_7;
    v9 = CFSTR("Owner participant not set");
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v9);
LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_reportInvitationsForPrimaryProfile
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  HDSummarySharingDiagnosticOperation *v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[4];
  int v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Sharing Invitations:"));
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2810000000;
  v49[3] = &unk_21CDAAD4F;
  v50 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4018]), "initWithHealthStore:", v6);
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke;
  v41[3] = &unk_24E0D89B0;
  v42 = v7;
  v22 = v6;
  v43 = v22;
  v8 = v5;
  v44 = v8;
  v48 = v49;
  v24 = v3;
  v45 = v24;
  v46 = self;
  v26 = v4;
  v47 = v26;
  v23 = v42;
  objc_msgSend(v42, "fetchSharingEntriesWithCompletion:", v41);
  v9 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v8, v9))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting collect invitations"));
  if (objc_msgSend(v24, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v24;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v10)
    {
      v25 = *(_QWORD *)v38;
      do
      {
        v27 = v10;
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          _HKSummarySharingEntryToDiagnosticsString(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDiagnosticOperation appendString:](self, "appendString:", v13);

          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          objc_msgSend(obj, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v52, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v34 != v16)
                  objc_enumerationMutation(v14);
                -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("  %@"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), v22);
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v52, 16);
            }
            while (v15);
          }

          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v26, "objectForKeyedSubscript:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v51, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v30;
            do
            {
              for (k = 0; k != v19; ++k)
              {
                if (*(_QWORD *)v30 != v20)
                  objc_enumerationMutation(v18);
                -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("  %@ (delete on commit)"), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v51, 16);
            }
            while (v19);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("There are no shared summary invitations in profile"));
  }
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");

  _Block_object_dispose(v49, 8);
}

void __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sharingEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!objc_msgSend(v10, "type"))
          {
            v11 = objc_alloc(MEMORY[0x24BDD3F60]);
            objc_msgSend(v10, "UUID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v11, "initForInvitationUUID:", v12);

            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3F58]), "initWithHealthStore:recipientIdentifier:", *(_QWORD *)(a1 + 40), v13);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v22[0] = v8;
            v22[1] = 3221225472;
            v22[2] = __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_2;
            v22[3] = &unk_24E0D8988;
            v27 = *(_QWORD *)(a1 + 80);
            v23 = *(id *)(a1 + 56);
            v24 = v10;
            v25 = *(_QWORD *)(a1 + 64);
            v26 = *(id *)(a1 + 48);
            objc_msgSend(v14, "fetchSharingAuthorizationsWithCompletion:", v22);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v16[0] = v8;
            v16[1] = 3221225472;
            v16[2] = __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_3;
            v16[3] = &unk_24E0D8988;
            v15 = *(void **)(a1 + 72);
            v21 = *(_QWORD *)(a1 + 80);
            v17 = v15;
            v18 = v10;
            v19 = *(_QWORD *)(a1 + 64);
            v20 = *(id *)(a1 + 48);
            objc_msgSend(v14, "fetchSharingAuthorizationsMarkedForDeletionWithCompletion:", v16);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "appendFormat:", CFSTR("Error fetching sharing entries for primary profile: %@"), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  }
  else
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Error fetching authorizations for sharing entry %@: %@"), v8, v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  }
  else
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Error fetching authorizations marked for deletion for sharing entry %@: %@"), v8, v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

- (void)_reportSharedSummariesForProfileIdentifier:(id)a3 committedTransactions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  dispatch_time_t v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  void *v31;
  __CFString *v32;
  dispatch_group_t group;
  uint64_t v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  __CFString *v45;
  id v46;
  dispatch_group_t v47;
  id v48;
  id v49;
  _QWORD *v50;
  _QWORD v51[4];
  int v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = CFSTR("Uncommitted");
  v35 = v4;
  if (v4)
    v7 = CFSTR("Committed");
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Shared Summary %@ Transactions:"), v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2810000000;
  v51[3] = &unk_21CDAAD4F;
  v52 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  objc_msgSend(v10, "setProfileIdentifier:", v6);
  objc_msgSend(v10, "resume");
  v11 = CFSTR("uncommitted");
  if (v4)
    v11 = CFSTR("committed");
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x24BDD3F48]);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke;
  v44[3] = &unk_24E0D8A00;
  v44[4] = self;
  v32 = v12;
  v45 = v32;
  v30 = v6;
  v46 = v30;
  group = v9;
  v47 = group;
  v50 = v51;
  v14 = v8;
  v48 = v14;
  v15 = v10;
  v49 = v15;
  v16 = objc_msgSend(v13, "initWithCommittedTransactions:handler:", v35, v44);
  objc_msgSend(v15, "executeQuery:", v16);
  v31 = (void *)v16;
  v17 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(group, v17))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting collect transaction list and summaries"));
  if (!objc_msgSend(v14, "count"))
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Found no %@ transactions"), v32);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v19)
  {
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v18);
        v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (v35)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "metadata");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HKSharedSummaryTransactionMetadataKeyDateCommitted"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@ commit date=%@"), v21, v24, v30, v31);

        }
        else
        {
          -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@"), v21);
        }
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v18, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
        v27 = v15;
        if (v26)
        {
          v28 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v37 != v28)
                objc_enumerationMutation(v25);
              -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("  %@"), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
          }
          while (v26);
        }

        v15 = v27;
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  _Block_object_dispose(v51, 8);

}

void __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (!v7)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Error querying for %@ transactions for profile %@: %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v15 = objc_alloc(MEMORY[0x24BDD3F38]);
        v19[0] = v12;
        v19[1] = 3221225472;
        v19[2] = __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke_2;
        v19[3] = &unk_24E0D89D8;
        v24 = *(_QWORD *)(a1 + 80);
        v20 = *(id *)(a1 + 64);
        v21 = v14;
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(id *)(a1 + 56);
        v16 = (void *)objc_msgSend(v15, "initWithTransaction:package:resultsHandler:", v14, 0, v19);
        objc_msgSend(*(id *)(a1 + 72), "executeQuery:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  if (v11)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("Error querying summaries for transaction %@: %@"), v10, v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

@end
