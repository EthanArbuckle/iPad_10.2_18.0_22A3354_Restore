@implementation IRCandidateClassificationDetectorFiltered

- (void)adjustFilteredParametersForCandidates:(id)a3 withSystemState:(id)a4 andDate:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v27 = a5;
  obj = v8;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v16, "setIsConservativeFiltered:", -[IRCandidateClassificationDetectorFiltered _isConservativeFilteredCandidate:withSystemState:](self, "_isConservativeFilteredCandidate:withSystemState:", v16, v9));
        +[IRFeatureFlags sharedFeatureFlags](IRFeatureFlags, "sharedFeatureFlags");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isAggressiveFilteringEnabled");

        if (v18)
          v19 = -[IRCandidateClassificationDetectorFiltered _isAggressiveFilteredCandidate:withSystemState:Candidates:andDate:](self, "_isAggressiveFilteredCandidate:withSystemState:Candidates:andDate:", v16, v9, obj, v27);
        else
          v19 = objc_msgSend(v16, "isConservativeFiltered");
        objc_msgSend(v16, "setIsFiltered:", v19);
        v13 += objc_msgSend(v16, "isFiltered");
        v12 += objc_msgSend(v16, "isConservativeFiltered");
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v22 = (void *)MEMORY[0x24BDD16E0];
    v23 = v21;
    objc_msgSend(v22, "numberWithUnsignedInteger:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v34 = "#detector-filtered, ";
    v35 = 2112;
    v36 = v20;
    v37 = 2112;
    v38 = v24;
    v39 = 2112;
    v40 = v25;
    v41 = 2112;
    v42 = v26;
    _os_log_impl(&dword_23FFBA000, v23, OS_LOG_TYPE_INFO, "%s[%@], #filteredCandidates=%@, #conservativeFilteredCandidates=%@, #totalCandidatesTested=%@", buf, 0x34u);

  }
}

- (BOOL)_isConservativeFilteredCandidate:(id)a3 withSystemState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSameICloudWithSystemState:", v6);

  if ((v8 & 1) != 0
    || (objc_msgSend(v5, "candidate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "lastUsedDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "candidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isMac"))
    {

      v11 = 1;
    }
    else
    {
      objc_msgSend(v5, "candidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSameWiFi");

      v11 = v15 ^ 1;
    }
  }

  return v11;
}

- (BOOL)_isAggressiveFilteredCandidate:(id)a3 withSystemState:(id)a4 Candidates:(id)a5 andDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  BOOL v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v43;
  id v44;

  v9 = a3;
  v10 = a4;
  v44 = a5;
  v11 = a6;
  objc_msgSend(v9, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastUsedDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v9, "candidate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastUsedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v16);
    v18 = v17;
    +[IRPreferences shared](IRPreferences, "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeInSecondsWithoutUsageToAggressiveFiltering");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    if (v18 < v22)
    {
LABEL_11:
      LOBYTE(v36) = 0;
      v37 = v44;
      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "candidate", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstSeenDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v9, "candidate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstSeenDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v26);
    v28 = v27;
    +[IRPreferences shared](IRPreferences, "shared");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v28 >= v31;

  }
  else
  {
    v32 = 1;
  }

  objc_msgSend(v9, "candidate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isSameWiFi");

  v35 = objc_msgSend(v10, "locationSemanticUserSpecificPlaceType");
  if (!v32 && v34 && v35 == 1)
    goto LABEL_11;
  objc_msgSend(v9, "candidate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v44;
  if (objc_msgSend(v38, "containsAirplayTarget"))
  {

  }
  else
  {
    objc_msgSend(v9, "candidate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "containsNonAirplayTarget");

    if (!v40)
    {
      LOBYTE(v36) = 0;
      goto LABEL_17;
    }
  }
  v36 = objc_msgSend(v43, "_isCandidateIndirectlyUsed:withCandidates:andDate:", v9, v44, v11) ^ 1;
LABEL_17:

  return v36;
}

- (BOOL)_isCandidateIndirectlyUsed:(id)a3 withCandidates:(id)a4 andDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 >= 2)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v7, "candidate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v16 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v15);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v18, "avOutpuDeviceIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v22[0] = MEMORY[0x24BDAC760];
            v22[1] = 3221225472;
            v22[2] = __95__IRCandidateClassificationDetectorFiltered__isCandidateIndirectlyUsed_withCandidates_andDate___block_invoke;
            v22[3] = &unk_2510441B8;
            v22[4] = v18;
            v23 = v9;
            v20 = objc_msgSend(v8, "containsObjectPassingTest:", v22);

            if ((v20 & 1) != 0)
            {
              LOBYTE(v13) = 1;
              goto LABEL_14;
            }
          }
        }
        v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

BOOL __95__IRCandidateClassificationDetectorFiltered__isCandidateIndirectlyUsed_withCandidates_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL8 v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a2;
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "avOutpuDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avOutpuDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v10))
    {
      objc_msgSend(v3, "candidate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastUsedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        v23 = v12;
        objc_msgSend(v3, "candidate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastUsedDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v21);
        v15 = v14;
        +[IRPreferences shared](IRPreferences, "shared");
        v24 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering");
        v25 = v6;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v15 < v18;

        v6 = v25;
        v11 = v24;

        v12 = v23;
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
