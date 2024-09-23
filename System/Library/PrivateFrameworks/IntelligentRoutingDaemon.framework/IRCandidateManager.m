@implementation IRCandidateManager

- (IRCandidatesContainerDO)candidatesContainer
{
  return self->_candidatesContainer;
}

- (IRCandidateManager)initWithQueue:(id)a3 contextObserver:(id)a4 avOutputDeviceProvider:(id)a5 rapportDeviceProvider:(id)a6 store:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  IRCandidateManager *v17;
  IRCandidateManager *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)IRCandidateManager;
  v17 = -[IRCandidateManager init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    -[IRCandidateManager setQueue:](v17, "setQueue:", v12);
    -[IRCandidateManager setContextObserver:](v18, "setContextObserver:", v13);
    -[IRCandidateManager setAvOutputDeviceProvider:](v18, "setAvOutputDeviceProvider:", v14);
    -[IRCandidateManager setRapportDeviceProvider:](v18, "setRapportDeviceProvider:", v15);
    -[IRCandidateManager setStore:](v18, "setStore:", v16);
    -[IRCandidateManager synchronizeAndFetchFromDBOnDisk](v18, "synchronizeAndFetchFromDBOnDisk");
    -[IRCandidateManager avOutputDeviceProvider](v18, "avOutputDeviceProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:", v18);

    -[IRCandidateManager rapportDeviceProvider](v18, "rapportDeviceProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:", v18);

  }
  return v18;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IRCandidateManager;
  -[IRCandidateManager dealloc](&v2, sel_dealloc);
}

- (void)deallocSync
{
  void *v3;
  id v4;

  -[IRCandidateManager avOutputDeviceProvider](self, "avOutputDeviceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IRCandidateManager rapportDeviceProvider](self, "rapportDeviceProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)updateCandidates:(id)a3 withHistoryEventsContainer:(id)a4
{
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  const void **v10;
  os_log_t *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  IRCandidateManager *v34;
  void *v35;
  void *v36;
  int v37;
  os_log_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  os_log_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  id v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v54 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = v6;
  v60 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (!v60)
  {

    goto LABEL_29;
  }
  v55 = v7;
  v56 = 0;
  v59 = *(_QWORD *)v62;
  v10 = (const void **)MEMORY[0x24BE5B328];
  v11 = (os_log_t *)MEMORY[0x24BE5B270];
  *(_QWORD *)&v9 = 136315906;
  v53 = v9;
  v12 = v8;
  do
  {
    for (i = 0; i != v60; ++i)
    {
      if (*(_QWORD *)v62 != v59)
        objc_enumerationMutation(v12);
      v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      -[IRCandidateManager candidatesContainer](self, "candidatesContainer", v53);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "candidateIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "candidateForCandidateIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[IRCandidateManager _nodesForCandidate:fromExistingCandidate:](self, "_nodesForCandidate:fromExistingCandidate:", v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v14, "copyWithReplacementNodes:", v18);

      objc_msgSend(v17, "lastUsedDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "copyWithReplacementLastUsedDate:", v20);

      objc_msgSend(v17, "firstSeenDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "copyWithReplacementFirstSeenDate:", v22);

      LODWORD(v21) = objc_msgSend(v23, "containsNonAirplayTarget");
      dispatch_get_specific(*v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v21)
      {
        v25 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
        {
          v26 = v25;
          +[IRLogQEUtility getCandidateAsString:](IRLogQEUtility, "getCandidateAsString:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v66 = "#candidate-manager, ";
          v67 = 2112;
          v68 = v24;
          v69 = 2112;
          v70 = v27;
          _os_log_impl(&dword_23FFBA000, v26, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate update error] Candidate is not valid to be updated:\n %@", buf, 0x20u);

        }
LABEL_9:

        goto LABEL_20;
      }
      v28 = (void *)*MEMORY[0x24BE5B280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        +[IRLogQEUtility getCandidateAsString:](IRLogQEUtility, "getCandidateAsString:", v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v66 = "#candidate-manager, ";
        v67 = 2112;
        v68 = v24;
        v69 = 2112;
        v70 = v30;
        _os_log_impl(&dword_23FFBA000, v29, OS_LOG_TYPE_DEFAULT, "%s[%@], Updating candidate:\n %@", buf, 0x20u);

      }
      if (objc_msgSend(v17, "isEqual:", v23))
      {
        objc_msgSend(v23, "lastSeenDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastSeenDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRPreferences shared](IRPreferences, "shared");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "candidateUpdateTimeIntervalSeconds");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "dateByAddingTimeInterval:", (double)(unint64_t)objc_msgSend(v33, "unsignedIntegerValue"));
        v34 = self;
        v35 = v12;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v58, "isEarlierThan:", v36);

        v12 = v35;
        self = v34;

        v11 = (os_log_t *)MEMORY[0x24BE5B270];
        if (v37)
        {
          v10 = (const void **)MEMORY[0x24BE5B328];
          dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v39 = v38;
            objc_msgSend(v17, "lastSeenDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "lastSeenDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v53;
            v66 = "#candidate-manager, ";
            v67 = 2112;
            v68 = v24;
            v69 = 2112;
            v70 = v40;
            v71 = 2112;
            v72 = v41;
            _os_log_impl(&dword_23FFBA000, v39, OS_LOG_TYPE_DEBUG, "%s[%@], Update candidate was requested but not needed, lastSeenDate: %@, currentDate: %@", buf, 0x2Au);

            v11 = (os_log_t *)MEMORY[0x24BE5B270];
            v10 = (const void **)MEMORY[0x24BE5B328];

          }
          goto LABEL_9;
        }
      }
      if (v17)
      {
        objc_msgSend(v55, "addObject:", v17);
      }
      else
      {
        -[IRCandidateManager _lastUsedDateForCandidate:fromHistoryEventsContainer:](self, "_lastUsedDateForCandidate:fromHistoryEventsContainer:", v23, v54);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v23, "copyWithReplacementLastUsedDate:", v42);

        objc_msgSend(v43, "lastSeenDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v43, "copyWithReplacementFirstSeenDate:", v44);

      }
      objc_msgSend(v57, "addObject:", v23);
      v56 = 1;
      v10 = (const void **)MEMORY[0x24BE5B328];
LABEL_20:

    }
    v60 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  }
  while (v60);

  v8 = v12;
  v7 = v55;
  if ((v56 & 1) != 0)
  {
    v45 = v8;
    if (objc_msgSend(v55, "count"))
      -[IRCandidateManager _deleteCandidates:](self, "_deleteCandidates:", v55);
    -[IRCandidateManager _addCandidates:](self, "_addCandidates:", v57);
    -[IRCandidateManager _handleCandidatesCleanup](self, "_handleCandidatesCleanup");
    dispatch_get_specific(*v10);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v48 = (void *)MEMORY[0x24BDD16E0];
      v49 = v47;
      -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "candidates");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v66 = "#candidate-manager, ";
      v67 = 2112;
      v68 = v46;
      v69 = 2112;
      v70 = v52;
      _os_log_impl(&dword_23FFBA000, v49, OS_LOG_TYPE_INFO, "%s[%@], Number of candidates: %@", buf, 0x20u);

    }
    -[IRCandidateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("Update candidate"));
    v8 = v45;
  }
LABEL_29:

}

- (void)deleteBrokerCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allWhere:", &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    -[IRCandidateManager _deleteCandidates:](self, "_deleteCandidates:", v5);
    -[IRCandidateManager _handleCandidatesCleanup](self, "_handleCandidatesCleanup");
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = v7;
      -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "candidates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "#candidate-manager, ";
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_INFO, "%s[%@], Number of candidates: %@", (uint8_t *)&v13, 0x20u);

    }
    -[IRCandidateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("Delete Broker candidates"));
  }

}

BOOL __44__IRCandidateManager_deleteBrokerCandidates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstWhere:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

uint64_t __44__IRCandidateManager_deleteBrokerCandidates__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "avOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "discoveredWithBroker");

  return v3;
}

- (void)deleteCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateForCandidateIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = v4;
  v9 = v8;

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    +[IRLogQEUtility getCandidateAsString:](IRLogQEUtility, "getCandidateAsString:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("YES");
    v17 = 136315906;
    v18 = "#candidate-manager, ";
    if (!v7)
      v15 = CFSTR("NO");
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_DEFAULT, "%s[%@], Deleting candidate:\n %@,\n is known candidate: %@", (uint8_t *)&v17, 0x2Au);

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRCandidateManager _deleteCandidates:](self, "_deleteCandidates:", v16);

    -[IRCandidateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("Delete candidate"));
  }

}

- (void)notifyAddEventForCandidateIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateForCandidateIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v26 = v4;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v6;
    objc_msgSend(v6, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v13, "avOutpuDeviceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "candidates");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = MEMORY[0x24BDAC760];
            v31[1] = 3221225472;
            v31[2] = __59__IRCandidateManager_notifyAddEventForCandidateIdentifier___block_invoke;
            v31[3] = &unk_251043CB8;
            v31[4] = v13;
            objc_msgSend(v16, "allWhere:", v31);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "unionSet:", v17);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithReplacementLastUsedDate:", v18);
          -[IRCandidateManager _updateCandidate:](self, "_updateCandidate:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v21);
    }

    -[IRCandidateManager _handleCandidatesCleanup](self, "_handleCandidatesCleanup");
    v6 = v25;
    v4 = v26;
  }

}

uint64_t __59__IRCandidateManager_notifyAddEventForCandidateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avOutpuDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)provider:(id)a3 didUpdateAVOutputDevices:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRCandidateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke;
  v8[3] = &unk_251044978;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setAvodDevices:", *(_QWORD *)(a1 + 32));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "avodDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_2;
  v10[3] = &unk_251044950;
  v10[4] = v3;
  v10[5] = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "avodDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "#candidate-manager, ";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], Memory: Number of Avod Devices: %@", buf, 0x20u);

  }
  if (*((_BYTE *)v12 + 24))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Avod device updated"));
  _Block_object_dispose(&v11, 8);

}

void __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "candidatesContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_3;
  v7[3] = &unk_251044928;
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_4;
  v22[3] = &unk_2510448D8;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v4, "firstWhere:", v22);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "avOutputDevice"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)),
        v7,
        (v8 & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v10 = (void *)objc_msgSend(v6, "copyWithReplacementAvOutputDevice:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v3, "nodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    v18 = 3221225472;
    v19 = __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_5;
    v20 = &unk_251044900;
    v6 = v10;
    v21 = v6;
    objc_msgSend(v11, "map:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v3, "copyWithReplacementNodes:", v12, v17, v18, v19, v20);

    objc_msgSend(*(id *)(a1 + 40), "_updateCandidate:", v9);
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x24BE5B280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v9, "candidateIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v25 = "#candidate-manager, ";
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_DEFAULT, "%s[%@], Candidate [%@] updated with new avoutput device: %@", buf, 0x2Au);

    }
  }
  else
  {
    v9 = v3;
  }

}

uint64_t __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "avOutpuDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id __56__IRCandidateManager_provider_didUpdateAVOutputDevices___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = v3;
  if (v6)
    v7 = *(void **)(a1 + 32);
  v8 = v7;

  return v8;
}

- (void)provider:(id)a3 didUpdateRapportDevices:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRCandidateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke;
  v8[3] = &unk_251044978;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setRapportDevices:", *(_QWORD *)(a1 + 32));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "rapportDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_2;
  v10[3] = &unk_2510449A0;
  v10[4] = v3;
  v10[5] = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "rapportDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "#candidate-manager, ";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], Memory: Number of Rapport Devices: %@", buf, 0x20u);

  }
  if (*((_BYTE *)v12 + 24))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Raport device updated"));
  _Block_object_dispose(&v11, 8);

}

void __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "candidatesContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_3;
  v7[3] = &unk_251044928;
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_4;
  v49[3] = &unk_2510448D8;
  v50 = *(id *)(a1 + 32);
  objc_msgSend(v4, "firstWhere:", v49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_5;
  objc_msgSend(v3, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v5;
  v47[1] = 3221225472;
  v47[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_5;
  v47[3] = &unk_2510448D8;
  v48 = *(id *)(a1 + 32);
  objc_msgSend(v7, "firstWhere:", v47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_5;
  objc_msgSend(v3, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_6;
  v45[3] = &unk_2510448D8;
  v46 = *(id *)(a1 + 32);
  objc_msgSend(v8, "firstWhere:", v45);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_5;
  objc_msgSend(v3, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_7;
  v43[3] = &unk_2510448D8;
  v44 = *(id *)(a1 + 32);
  objc_msgSend(v9, "firstWhere:", v43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_5:
    objc_msgSend(v6, "rapportDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v11 & 1) != 0)
    {
      v12 = v6;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v36 = a1;
      v12 = (void *)objc_msgSend(v6, "copyWithReplacementRapportDevice:", *(_QWORD *)(a1 + 32));

      v38 = (void *)objc_opt_new();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v35 = v3;
      objc_msgSend(v3, "nodes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v17, "rapportIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "rapportIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqual:", v19);

            objc_msgSend(v17, "avOutpuDeviceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "avOutpuDeviceIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqual:", v22);

            objc_msgSend(v17, "idsIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "idsIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqual:", v25);

            v27 = v12;
            if ((v20 & 1) == 0)
            {
              objc_msgSend(v12, "rapportIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28 == 0;

              if ((v29 & (v23 | v26)) != 0)
                v27 = v12;
              else
                v27 = v17;
            }
            v30 = v27;
            objc_msgSend(v38, "addObject:", v30);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
        }
        while (v14);
      }

      v3 = (id)objc_msgSend(v35, "copyWithReplacementNodes:", v38);
      objc_msgSend(*(id *)(v36 + 40), "_updateCandidate:", v3);
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)*MEMORY[0x24BE5B280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        objc_msgSend(v3, "candidateIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v52 = "#candidate-manager, ";
        v53 = 2112;
        v54 = v31;
        v55 = 2112;
        v56 = v34;
        v57 = 2112;
        v58 = v3;
        _os_log_impl(&dword_23FFBA000, v33, OS_LOG_TYPE_DEFAULT, "%s[%@], Candidate [%@] updated with new rapport device: %@", buf, 0x2Au);

      }
    }
  }
  else
  {
    v12 = 0;
  }

}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "rapportIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rapportEffectiveID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "avOutpuDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "avOutpuDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaRouteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __55__IRCandidateManager_provider_didUpdateRapportDevices___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "idsID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)synchronizeAndFetchFromDBOnDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[IRCandidateManager store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchCandidatesContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager setCandidatesContainer:](self, "setCandidatesContainer:", v4);

  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE5B270];
  v8 = *MEMORY[0x24BE5B270];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x24BDD16E0];
      v10 = v7;
      -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "candidates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "#candidate-manager, ";
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_DEFAULT, "%s[%@], Loading candidates container from store with %@ candidates", (uint8_t *)&v14, 0x20u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v14 = 136315394;
    v15 = "#candidate-manager, ";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate container fetch error] Could not fetch candidates container", (uint8_t *)&v14, 0x16u);
  }

}

- (void)_addCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:](IRCandidatesContainerDO, "candidatesContainerDOWithCandidates:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager setCandidatesContainer:](self, "setCandidatesContainer:", v8);

  -[IRCandidateManager store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "addCandidates:", v4);

  if ((v8 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315650;
      v13 = "#candidate-manager, ";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate Manager add error] Could not add a new candidates: %@", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (void)_updateCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__IRCandidateManager__updateCandidate___block_invoke;
  v13[3] = &unk_2510449C8;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v6, "map:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:](IRCandidatesContainerDO, "candidatesContainerDOWithCandidates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager setCandidatesContainer:](self, "setCandidatesContainer:", v9);

  -[IRCandidateManager store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "updateCandidate:", v7);

  if ((v5 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "#candidate-manager, ";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate Manager update error] Could not update candidate: %@", buf, 0x20u);
    }

  }
}

id __39__IRCandidateManager__updateCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = v3;
  if (v6)
    v7 = *(void **)(a1 + 32);
  v8 = v7;

  return v8;
}

- (void)_deleteCandidates:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__IRCandidateManager__deleteCandidates___block_invoke;
  v13[3] = &unk_251043CB8;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v6, "allWhere:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:](IRCandidatesContainerDO, "candidatesContainerDOWithCandidates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager setCandidatesContainer:](self, "setCandidatesContainer:", v9);

  -[IRCandidateManager store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "deleteCandidates:", v7);

  if ((v5 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "#candidate-manager, ";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate Manager delete error] Could not delete candidates: %@", buf, 0x20u);
    }

  }
}

BOOL __40__IRCandidateManager__deleteCandidates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidateDO candidateForIdentifier:within:](IRCandidateDO, "candidateForIdentifier:within:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == 0;
}

- (void)_didUpdateContextWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRCandidateManager contextObserver](self, "contextObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateContextWithReason:andOverrides:", v4, 0);

}

- (void)_handleCandidatesCleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager candidatesContainer](self, "candidatesContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __46__IRCandidateManager__handleCandidatesCleanup__block_invoke;
  v25 = &unk_2510449F0;
  v7 = v3;
  v26 = v7;
  v8 = v4;
  v27 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v22);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set", v22, v23, v24, v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRPreferences shared](IRPreferences, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberOfUsedCandidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager _oldestCandidatesFrom:forKey:limit:](self, "_oldestCandidatesFrom:forKey:limit:", v7, CFSTR("lastUsedDate"), objc_msgSend(v11, "unsignedIntegerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v12);

  +[IRPreferences shared](IRPreferences, "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberOfSeenCandidates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRCandidateManager _oldestCandidatesFrom:forKey:limit:](self, "_oldestCandidatesFrom:forKey:limit:", v8, CFSTR("lastSeenDate"), objc_msgSend(v14, "unsignedIntegerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v15);

  if (objc_msgSend(v9, "count"))
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = v17;
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v29 = "#candidate-manager, ";
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_INFO, "%s[%@], Candidates cleanup: usedCandidates: %@ seenCandidates: %@", buf, 0x2Au);

    }
    -[IRCandidateManager _deleteCandidates:](self, "_deleteCandidates:", v9);
  }

}

void __46__IRCandidateManager__handleCandidatesCleanup__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "lastUsedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 32;
  if (!v3)
    v4 = 40;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

- (id)_lastUsedDateForCandidate:(id)a3 fromHistoryEventsContainer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  objc_msgSend(v6, "historyEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__IRCandidateManager__lastUsedDateForCandidate_fromHistoryEventsContainer___block_invoke;
  v11[3] = &unk_2510445D0;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __75__IRCandidateManager__lastUsedDateForCandidate_fromHistoryEventsContainer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v12, "date");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

- (id)_nodesForCandidate:(id)a3 fromExistingCandidate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke;
  v14[3] = &unk_251044A68;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  v12 = (void *)objc_msgSend(v10, "copy");
  return v12;
}

void __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "avodDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_2;
  v32[3] = &unk_251044A18;
  v6 = v3;
  v33 = v6;
  objc_msgSend(v4, "firstWhere:", v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_3;
    v30[3] = &unk_2510448D8;
    v31 = v6;
    objc_msgSend(v8, "firstWhere:", v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "avOutputDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "rapportDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_4;
  v28[3] = &unk_251044A40;
  v21 = v6;
  v29 = v21;
  objc_msgSend(v10, "firstWhere:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "rapportDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_5;
    v26[3] = &unk_251044A40;
    v13 = v21;
    v27 = v13;
    objc_msgSend(v12, "firstWhere:", v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "rapportDevices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_6;
      v24[3] = &unk_251044A40;
      v15 = v13;
      v25 = v15;
      objc_msgSend(v14, "firstWhere:", v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "nodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v5;
        v22[1] = 3221225472;
        v22[2] = __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_7;
        v22[3] = &unk_2510448D8;
        v23 = v15;
        objc_msgSend(v16, "firstWhere:", v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "rapportDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v18 = *(void **)(a1 + 48);
  v19 = (void *)objc_msgSend(v21, "copyWithReplacementRapportDevice:", v11);
  v20 = (void *)objc_msgSend(v19, "copyWithReplacementAvOutputDevice:", v7);
  objc_msgSend(v18, "addObject:", v20);

}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "avOutpuDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "rapportEffectiveID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rapportIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "mediaRemoteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "mediaRouteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __63__IRCandidateManager__nodesForCandidate_fromExistingCandidate___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "rapportIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rapportIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)_oldestCandidatesFrom:(id)a3 forKey:(id)a4 limit:(unint64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD17C0];
  v8 = a3;
  objc_msgSend(v7, "sortDescriptorWithKey:ascending:", a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count") <= a5)
    v13 = 0;
  else
    v13 = objc_msgSend(v12, "count") - a5;
  objc_msgSend(v12, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setCandidatesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesContainer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IRPolicyManagerContextObserver)contextObserver
{
  return (IRPolicyManagerContextObserver *)objc_loadWeakRetained((id *)&self->_contextObserver);
}

- (void)setContextObserver:(id)a3
{
  objc_storeWeak((id *)&self->_contextObserver, a3);
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return self->_avOutputDeviceProvider;
}

- (void)setAvOutputDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, a3);
}

- (IRRapportProvider)rapportDeviceProvider
{
  return self->_rapportDeviceProvider;
}

- (void)setRapportDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rapportDeviceProvider, a3);
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSSet)avodDevices
{
  return self->_avodDevices;
}

- (void)setAvodDevices:(id)a3
{
  objc_storeStrong((id *)&self->_avodDevices, a3);
}

- (NSSet)rapportDevices
{
  return self->_rapportDevices;
}

- (void)setRapportDevices:(id)a3
{
  objc_storeStrong((id *)&self->_rapportDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportDevices, 0);
  objc_storeStrong((id *)&self->_avodDevices, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_rapportDeviceProvider, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_contextObserver);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_candidatesContainer, 0);
}

@end
