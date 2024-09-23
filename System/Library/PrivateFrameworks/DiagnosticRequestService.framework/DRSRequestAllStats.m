@implementation DRSRequestAllStats

- (id)terminalRequestProtobufRepresentation
{
  DRSProtoDiagnosticRequestStatsBatch *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  DRSProtoDiagnosticRequestStats *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  DRSProtoDiagnosticRequestOutcomeBucket *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  DRSProtoDiagnosticRequestStatsBatch *v51;
  id obj;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  DRSProtoDiagnosticRequestStatsBatch *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(DRSProtoDiagnosticRequestStatsBatch);
  DRSDeviceMetadata();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v3;
  -[DRSProtoDiagnosticRequestStatsBatch setClientMetadata:](v3, "setClientMetadata:", v4);

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[DRSRequestAllStats perBuildStats](self, "perBuildStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v55 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v96;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v96 != v54)
          objc_enumerationMutation(obj);
        v56 = v7;
        v8 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v7);
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v8, "perTeamIDStats");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = v10;
        v59 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
        if (v59)
        {
          v58 = *(_QWORD *)v92;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v92 != v58)
                objc_enumerationMutation(v57);
              v60 = v11;
              v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v11);
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              v90 = 0u;
              objc_msgSend(v12, "perIssueCategoryStats");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectEnumerator");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v61 = v14;
              v63 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
              if (v63)
              {
                v62 = *(_QWORD *)v88;
                do
                {
                  v15 = 0;
                  do
                  {
                    if (*(_QWORD *)v88 != v62)
                      objc_enumerationMutation(v61);
                    v64 = v15;
                    v16 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v15);
                    v83 = 0u;
                    v84 = 0u;
                    v85 = 0u;
                    v86 = 0u;
                    objc_msgSend(v16, "perIssueDescriptionStats");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectEnumerator");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    v66 = v18;
                    v68 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                    if (v68)
                    {
                      v67 = *(_QWORD *)v84;
                      do
                      {
                        for (i = 0; i != v68; ++i)
                        {
                          if (*(_QWORD *)v84 != v67)
                            objc_enumerationMutation(v66);
                          v20 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                          objc_msgSend(v20, "requests");
                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v21, "firstObject");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v22)
                          {
                            v70 = i;
                            v23 = objc_alloc_init(DRSProtoDiagnosticRequestStats);
                            objc_msgSend(v22, "build");
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DRSProtoDiagnosticRequestStats setBuild:](v23, "setBuild:", v24);

                            objc_msgSend(v22, "teamID");
                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DRSProtoDiagnosticRequestStats setTeamId:](v23, "setTeamId:", v25);

                            objc_msgSend(v22, "issueCategory");
                            v26 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DRSProtoDiagnosticRequestStats setIssueCategory:](v23, "setIssueCategory:", v26);

                            v69 = v22;
                            objc_msgSend(v22, "issueDescription");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DRSProtoDiagnosticRequestStats setIssueDescription:](v23, "setIssueDescription:", v27);

                            v81 = 0u;
                            v82 = 0u;
                            v79 = 0u;
                            v80 = 0u;
                            objc_msgSend(v20, "perOutcomeStats");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v28, "objectEnumerator");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();

                            v73 = v29;
                            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
                            if (v30)
                            {
                              v31 = v30;
                              v32 = *(_QWORD *)v80;
                              v71 = *(_QWORD *)v80;
                              do
                              {
                                v33 = 0;
                                v72 = v31;
                                do
                                {
                                  if (*(_QWORD *)v80 != v32)
                                    objc_enumerationMutation(v73);
                                  v34 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v33);
                                  objc_msgSend(v34, "requests");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v35, "firstObject");
                                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (v36 && objc_msgSend(v36, "requestOutcome"))
                                  {
                                    v74 = v36;
                                    v77 = 0u;
                                    v78 = 0u;
                                    v75 = 0u;
                                    v76 = 0u;
                                    objc_msgSend(v34, "perStateStats");
                                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v37, "objectEnumerator");
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                                    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
                                    if (v39)
                                    {
                                      v40 = v39;
                                      v41 = *(_QWORD *)v76;
                                      do
                                      {
                                        for (j = 0; j != v40; ++j)
                                        {
                                          if (*(_QWORD *)v76 != v41)
                                            objc_enumerationMutation(v38);
                                          v43 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                                          objc_msgSend(v43, "requests");
                                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v44, "firstObject");
                                          v45 = (void *)objc_claimAutoreleasedReturnValue();

                                          if (v45)
                                          {
                                            v46 = objc_alloc_init(DRSProtoDiagnosticRequestOutcomeBucket);
                                            -[DRSProtoDiagnosticRequestOutcomeBucket setCount:](v46, "setCount:", objc_msgSend(v43, "requestCount"));
                                            -[DRSProtoDiagnosticRequestOutcomeBucket setOutcome:](v46, "setOutcome:", objc_msgSend(v45, "requestOutcome"));
                                            -[DRSProtoDiagnosticRequestOutcomeBucket setRequestState:](v46, "setRequestState:", objc_msgSend(v45, "requestState"));
                                            -[DRSProtoDiagnosticRequestStats addOutcomes:](v23, "addOutcomes:", v46);

                                          }
                                        }
                                        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
                                      }
                                      while (v40);
                                    }

                                    v32 = v71;
                                    v31 = v72;
                                    v36 = v74;
                                  }

                                  ++v33;
                                }
                                while (v33 != v31);
                                v31 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
                              }
                              while (v31);
                            }

                            -[DRSProtoDiagnosticRequestStats outcomes](v23, "outcomes");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            v48 = objc_msgSend(v47, "count");

                            if (v48)
                              -[DRSProtoDiagnosticRequestStatsBatch addRequestsResultsStats:](v65, "addRequestsResultsStats:", v23);

                            v22 = v69;
                            i = v70;
                          }

                        }
                        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                      }
                      while (v68);
                    }

                    v15 = v64 + 1;
                  }
                  while (v64 + 1 != v63);
                  v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
                }
                while (v63);
              }

              v11 = v60 + 1;
            }
            while (v60 + 1 != v59);
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
          }
          while (v59);
        }

        v7 = v56 + 1;
      }
      while (v56 + 1 != v55);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    }
    while (v55);
  }

  -[DRSProtoDiagnosticRequestStatsBatch requestsResultsStats](v65, "requestsResultsStats");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "count");

  if (v50)
    v51 = v65;
  else
    v51 = 0;

  return v51;
}

- (unint64_t)generateCoreAnalyticsEvents:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  _BOOL4 v73;
  unint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _QWORD v101[3];
  _QWORD v102[3];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v73 = a3;
  v107 = *MEMORY[0x1E0C80C00];
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[DRSRequestAllStats perBuildStats](self, "perBuildStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v53 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
  if (v53)
  {
    v74 = 0;
    v52 = *(_QWORD *)v96;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v96 != v52)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v54 = v5;
        v7 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v5);
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v7, "perTeamIDStats");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectEnumerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = v9;
        v57 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
        if (v57)
        {
          v56 = *(_QWORD *)v92;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v92 != v56)
              {
                v11 = v10;
                objc_enumerationMutation(v55);
                v10 = v11;
              }
              v58 = v10;
              v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v10);
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              v90 = 0u;
              objc_msgSend(v12, "perIssueCategoryStats");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectEnumerator");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = v14;
              v61 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
              if (v61)
              {
                v60 = *(_QWORD *)v88;
                do
                {
                  v15 = 0;
                  do
                  {
                    if (*(_QWORD *)v88 != v60)
                    {
                      v16 = v15;
                      objc_enumerationMutation(v59);
                      v15 = v16;
                    }
                    v62 = v15;
                    v17 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v15);
                    v83 = 0u;
                    v84 = 0u;
                    v85 = 0u;
                    v86 = 0u;
                    objc_msgSend(v17, "perIssueDescriptionStats");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectEnumerator");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();

                    v63 = v19;
                    v65 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
                    if (v65)
                    {
                      v64 = *(_QWORD *)v84;
                      do
                      {
                        for (i = 0; i != v65; ++i)
                        {
                          if (*(_QWORD *)v84 != v64)
                            objc_enumerationMutation(v63);
                          v67 = i;
                          v21 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                          objc_msgSend(v21, "requests");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v22, "firstObject");
                          v23 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v23)
                          {
                            v101[0] = kTeamIDKey;
                            objc_msgSend(v23, "teamID");
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            v102[0] = v24;
                            v101[1] = kDiagnosticRequestStatsKey_IssueCategory;
                            objc_msgSend(v23, "issueCategory");
                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                            v102[1] = v25;
                            v101[2] = kDiagnosticRequestStatsKey_IssueDescription;
                            v66 = v23;
                            objc_msgSend(v23, "issueDescription");
                            v26 = (void *)objc_claimAutoreleasedReturnValue();
                            v102[2] = v26;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
                            v27 = (void *)objc_claimAutoreleasedReturnValue();

                            v81 = 0u;
                            v82 = 0u;
                            v79 = 0u;
                            v80 = 0u;
                            objc_msgSend(v21, "perOutcomeStats");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v28, "objectEnumerator");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();

                            v70 = v29;
                            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
                            if (v30)
                            {
                              v31 = v30;
                              v32 = *(_QWORD *)v80;
                              v68 = *(_QWORD *)v80;
                              do
                              {
                                v33 = 0;
                                v69 = v31;
                                do
                                {
                                  if (*(_QWORD *)v80 != v32)
                                    objc_enumerationMutation(v70);
                                  v34 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v33);
                                  objc_msgSend(v34, "requests");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v35, "firstObject");
                                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (v36 && objc_msgSend(v36, "requestOutcome"))
                                  {
                                    v71 = v36;
                                    v72 = v33;
                                    v77 = 0u;
                                    v78 = 0u;
                                    v75 = 0u;
                                    v76 = 0u;
                                    objc_msgSend(v34, "perStateStats");
                                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v37, "objectEnumerator");
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                                    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
                                    if (v39)
                                    {
                                      v40 = v39;
                                      v41 = *(_QWORD *)v76;
                                      do
                                      {
                                        for (j = 0; j != v40; ++j)
                                        {
                                          if (*(_QWORD *)v76 != v41)
                                            objc_enumerationMutation(v38);
                                          v43 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                                          objc_msgSend(v43, "requests");
                                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v44, "firstObject");
                                          v45 = (void *)objc_claimAutoreleasedReturnValue();

                                          if (v45 && objc_msgSend(v43, "requestCount"))
                                          {
                                            v46 = (void *)objc_msgSend(v27, "mutableCopy");
                                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v43, "requestCount"));
                                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, kDiagnosticRequestStatsKey_RequestCount);

                                            objc_msgSend(v34, "requestOutcome");
                                            v48 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v46, "setObject:forKeyedSubscript:", v48, kDiagnosticRequestStatsKey_RequestOutcome);

                                            objc_msgSend(v43, "requestState");
                                            v49 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v46, "setObject:forKeyedSubscript:", v49, kDiagnosticRequestStatsKey_RequestState);

                                            if (v73)
                                              DRSCoreAnalyticsSendEvent(kDiagnosticRequestStatsName, v46);
                                            ++v74;

                                          }
                                        }
                                        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
                                      }
                                      while (v40);
                                    }

                                    v32 = v68;
                                    v31 = v69;
                                    v36 = v71;
                                    v33 = v72;
                                  }

                                  ++v33;
                                }
                                while (v33 != v31);
                                v31 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
                              }
                              while (v31);
                            }

                            v23 = v66;
                            i = v67;
                          }

                        }
                        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
                      }
                      while (v65);
                    }

                    v15 = v62 + 1;
                  }
                  while (v62 + 1 != v61);
                  v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
                }
                while (v61);
              }

              v10 = v58 + 1;
            }
            while (v58 + 1 != v57);
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
          }
          while (v57);
        }

        v5 = v54 + 1;
      }
      while (v54 + 1 != v53);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
    }
    while (v53);
  }
  else
  {
    v74 = 0;
  }

  return v74;
}

+ (id)descriptionStringForRequest:(id)a3
{
  return CFSTR("All");
}

+ (id)keyName
{
  return CFSTR("All");
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

- (DRSRequestAllStats)init
{
  return -[DRSRequestStats initWithDescriptionString:](self, "initWithDescriptionString:", CFSTR("All"));
}

+ (id)statsForRequests:(id)a3
{
  id v3;
  DRSRequestAllStats *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DRSRequestAllStats *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(DRSRequestAllStats);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[DRSRequestStats addRequest:](v4, "addRequest:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (-[DRSRequestStats requestCount](v4, "requestCount"))
    v10 = v4;
  else
    v10 = 0;

  return v10;
}

@end
