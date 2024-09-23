@implementation HDCloudSyncSharedSummaryPushOperation

- (void)main
{
  HDCloudSyncSharedSummaryPushPrepareOperation *v3;
  void *v4;
  HDCloudSyncSharedSummaryPushPrepareOperation *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = [HDCloudSyncSharedSummaryPushPrepareOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v3, "initWithConfiguration:cloudState:", v4, 0);

  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke;
  v8[3] = &unk_1E6CFBDB8;
  v8[4] = self;
  -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke_184;
  v7[3] = &unk_1E6CFBDE0;
  v7[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v7);
  -[HDCloudSyncOperation start](v5, "start");

}

void __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to prepare for push operation: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

void __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke_184(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  _BYTE buf[24];
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  objc_msgSend(v37, "privateMetadataZone");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(v37, "pendingAndAcceptedParticipants"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v37, "allTransactions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pendingAndAcceptedParticipants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "authorizationIdentifiersByContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "privateMetadataZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    v35 = v9;
    v34 = v10;
    v33 = v11;
    if (v7)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v36, "count");
        _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Starting push for %lu transactions", buf, 0x16u);

      }
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accessibilityAssertion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contextWithAccessibilityAssertion:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setCacheScope:", 1);
      v21 = objc_alloc_init(MEMORY[0x1E0D298C8]);
      v22 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke;
      v39[3] = &unk_1E6CFBE08;
      v39[4] = v7;
      v23 = v15;
      v40 = v23;
      v24 = v16;
      v41 = v24;
      v25 = v14;
      v42 = v25;
      objc_msgSend(v21, "setDidFinish:", v39);
      objc_msgSend(v21, "beginTask");
      objc_msgSend(v7, "profile");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "database");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      *(_QWORD *)buf = v22;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2_195;
      v44 = &unk_1E6CFBE50;
      v45 = v35;
      v46 = v34;
      v47 = v7;
      v48 = v33;
      v28 = v25;
      v49 = v28;
      v50 = v36;
      v29 = v23;
      v51 = v29;
      v30 = v24;
      v52 = v30;
      v31 = v21;
      v53 = v31;
      LOBYTE(v22) = objc_msgSend(v27, "performTransactionWithContext:error:block:inaccessibilityHandler:", v20, &v38, buf, 0);
      v32 = v38;

      objc_msgSend(v31, "finishTask");
      if ((v22 & 1) == 0)
        objc_msgSend(v7, "finishWithSuccess:error:", 0, v32);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
  }

}

void __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke(uint64_t a1)
{
  HDCloudSyncSharedSummaryPushPruningOperation *v2;
  void *v3;
  HDCloudSyncSharedSummaryPushPruningOperation *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = [HDCloudSyncSharedSummaryPushPruningOperation alloc];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDCloudSyncSharedSummaryPushPruningOperation initWithConfiguration:allRecordsToSave:participantZoneIDsToPush:existingTransactionRecordsByZoneID:](v2, "initWithConfiguration:allRecordsToSave:participantZoneIDsToPush:existingTransactionRecordsByZoneID:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2;
  v7[3] = &unk_1E6CE77A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  -[HDCloudSyncOperation setOnError:](v4, "setOnError:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_192;
  v6[3] = &unk_1E6CE7778;
  v6[4] = *(_QWORD *)(a1 + 32);
  -[HDCloudSyncOperation setOnSuccess:](v4, "setOnSuccess:", v6);
  -[HDCloudSyncOperation start](v4, "start");

}

void __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to prune %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

uint64_t __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2_195(uint64_t a1)
{
  uint64_t v1;
  os_log_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  os_log_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  os_log_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  os_log_t v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  os_log_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  void *v91;
  id v92;
  os_log_t v93;
  NSObject *v94;
  void *v95;
  void *v96;
  os_log_t *v97;
  void *v98;
  uint64_t v99;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id obj;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133[5];
  id v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  _QWORD v140[4];
  id v141;
  void *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint8_t v147[128];
  uint8_t v148[4];
  void *v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  void *v153;
  __int16 v154;
  id v155;
  _BYTE buf[24];
  void *v157;
  id v158;
  uint64_t v159;

  v1 = a1;
  v159 = *MEMORY[0x1E0C80C00];
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = *(id *)(a1 + 32);
  v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
  if (v115)
  {
    v2 = (os_log_t *)MEMORY[0x1E0CB5370];
    v114 = *(_QWORD *)v130;
    v111 = v1;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v130 != v114)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v3);
        v5 = *(void **)(v1 + 40);
        objc_msgSend(v4, "contactIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v9 = *(id *)(v1 + 48);
          v8 = *(void **)(v1 + 56);
          v10 = v4;
          if (v9)
          {
            v11 = v8;
            v12 = objc_opt_class();
            v133[0] = 0;
            objc_msgSend(v11, "recordsForClass:error:", v12, v133);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v133[0];
            v15 = v14;
            if (v13)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __87__HDCloudSyncSharedSummaryPushOperation__authorizationRecordForParticipant_zone_error___block_invoke;
              v157 = &unk_1E6CEA418;
              v16 = v10;
              v158 = v16;
              objc_msgSend(v13, "hk_firstObjectPassingTest:", buf);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                v19 = v17;
                v9 = 0;
              }
              else
              {
                v123 = v10;
                v27 = v7;
                v28 = (void *)MEMORY[0x1E0CB35C8];
                objc_msgSend(v16, "UUID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "hk_error:format:", 720, CFSTR("Authorization Record for participant with UUID %@ not found"), v29);
                v30 = (id)objc_claimAutoreleasedReturnValue();
                v9 = v30;
                if (v30)
                  v31 = objc_retainAutorelease(v30);

                v7 = v27;
                v18 = 0;
                v10 = v123;
              }

              v26 = v158;
            }
            else
            {
              v25 = v14;
              if (v25)
              {
                v9 = objc_retainAutorelease(v25);
                v18 = 0;
                v26 = v9;
              }
              else
              {
                v9 = 0;
                v26 = 0;
                v18 = 0;
              }
            }

          }
          else
          {
            v18 = 0;
          }

          v32 = v9;
          v33 = v32;
          if (v18)
          {
            v112 = v32;
            v113 = v3;
            v116 = v7;
            v34 = (void *)MEMORY[0x1E0C95098];
            objc_msgSend(*(id *)(v1 + 48), "configuration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "repository");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "syncCircleIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = v10;
            objc_msgSend(v10, "UUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = *(void **)(v1 + 48);
            v128 = 0;
            v41 = v39;
            if (v40)
            {
              objc_msgSend(v40, "configuration");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "repository");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "primaryCKContainer");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "containerIdentifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              +[HDCloudSyncZoneIdentifier identifierForZone:container:scope:](HDCloudSyncZoneIdentifier, "identifierForZone:container:scope:", v41, v45, 2);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v40, "configuration");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "cachedCloudState");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __77__HDCloudSyncSharedSummaryPushOperation__participantZoneForIdentifier_error___block_invoke;
              v157 = &unk_1E6CEBA48;
              v49 = v46;
              v158 = v49;
              objc_msgSend(v48, "zonesByIdentifierWithError:filter:", &v128, buf);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                objc_msgSend(v50, "objectForKeyedSubscript:", v49);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = v51;
                v3 = v113;
                v7 = v116;
                if (v51)
                {
                  v53 = v51;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 724, CFSTR("Zone not found for participant ZoneID %@"), v41);
                  v58 = (id)objc_claimAutoreleasedReturnValue();
                  v59 = v58;
                  if (v58)
                    v128 = objc_retainAutorelease(v58);

                }
                v1 = v111;

              }
              else
              {
                v52 = 0;
                v3 = v113;
                v7 = v116;
                v1 = v111;
              }

            }
            else
            {
              v52 = 0;
              v3 = v113;
              v7 = v116;
            }

            v60 = v128;
            if (v52)
            {
              v61 = objc_opt_class();
              v127 = 0;
              objc_msgSend(v52, "recordsForClass:error:", v61, &v127);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = v127;
              if (v62)
              {
                v102 = v52;
                v104 = v18;
                v105 = v62;
                objc_msgSend(v62, "hk_map:", &__block_literal_global_129);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v1 + 64), "objectForKeyedSubscript:", v41);
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                v106 = v60;
                if (v64)
                {
                  objc_msgSend(*(id *)(v1 + 64), "objectForKeyedSubscript:", v41);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "addObjectsFromArray:", v63);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v63);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v1 + 64), "setObject:forKeyedSubscript:", v65, v41);
                }
                v74 = (void *)MEMORY[0x1E0C809B0];
                v75 = v41;

                v122 = *(void **)(v1 + 48);
                v76 = *(void **)(v1 + 80);
                v77 = *(void **)(v1 + 88);
                v78 = *(void **)(v1 + 96);
                v79 = *(id *)(v1 + 72);
                v126 = v63;
                v103 = v75;
                v80 = v75;
                v81 = v79;
                v82 = v80;
                v125 = v124;
                v120 = v116;
                v119 = v76;
                v118 = v77;
                v83 = v78;
                if (v122)
                {
                  objc_msgSend(v122, "configuration");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "repository");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "cloudSyncShimProvider");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "sharedSummariesShim");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v83, "beginTask");
                  v143 = 0u;
                  v144 = 0u;
                  v145 = 0u;
                  v146 = 0u;
                  v101 = v81;
                  v121 = v81;
                  v87 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
                  if (v87)
                  {
                    v88 = v87;
                    v89 = *(_QWORD *)v144;
                    do
                    {
                      for (i = 0; i != v88; ++i)
                      {
                        if (*(_QWORD *)v144 != v89)
                          objc_enumerationMutation(v121);
                        v91 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
                        v140[0] = v74;
                        v140[1] = 3221225472;
                        v140[2] = __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke;
                        v140[3] = &unk_1E6CFBE78;
                        v92 = v82;
                        v141 = v92;
                        v142 = v91;
                        if (objc_msgSend(v126, "hk_containsObjectPassingTest:", v140))
                        {
                          _HKInitializeLogging();
                          v93 = *v2;
                          if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
                          {
                            v94 = v93;
                            objc_msgSend(v91, "UUID");
                            v95 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v95, "UUIDString");
                            v96 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v125, "contactIdentifier");
                            v97 = v2;
                            v98 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v148 = 138544131;
                            v149 = v122;
                            v150 = 2114;
                            v151 = v96;
                            v152 = 2113;
                            v153 = v98;
                            v154 = 2114;
                            v155 = v82;
                            _os_log_impl(&dword_1B7802000, v94, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] The transaction %{public}@ for participant %{private}@ has already been pushed to zone %{public}@. Skipping...", v148, 0x2Au);

                            v2 = v97;
                            v74 = (void *)MEMORY[0x1E0C809B0];

                          }
                        }
                        else
                        {
                          objc_msgSend(v83, "beginTask");
                          v133[0] = v74;
                          v133[1] = (id)3221225472;
                          v133[2] = __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_202;
                          v133[3] = &unk_1E6CFBEC8;
                          v133[4] = v122;
                          v134 = v92;
                          v135 = v91;
                          v136 = v119;
                          v137 = v118;
                          v138 = v125;
                          v139 = v83;
                          objc_msgSend(v117, "summariesFromTransaction:authorizationIdentifiers:completion:", v91, v120, v133);

                        }
                      }
                      v88 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v143, buf, 16);
                    }
                    while (v88);
                  }

                  objc_msgSend(v83, "finishTask");
                  v1 = v111;
                  v3 = v113;
                  v81 = v101;
                }

                v7 = v116;
                v41 = v103;
                v18 = v104;
                v52 = v102;
                v62 = v105;
                v60 = v106;
              }
              else
              {
                _HKInitializeLogging();
                v70 = *v2;
                if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
                {
                  v108 = v60;
                  v71 = *(_QWORD *)(v1 + 48);
                  v72 = v70;
                  objc_msgSend(v52, "zoneIdentifier");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v71;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v73;
                  *(_WORD *)&buf[22] = 2114;
                  v60 = v108;
                  v157 = v109;
                  _os_log_error_impl(&dword_1B7802000, v72, OS_LOG_TYPE_ERROR, "%{public}@ [summary-sharing] Failed to get transaction records for %{public}@, %{public}@", buf, 0x20u);

                  v62 = 0;
                }
              }

            }
            else
            {
              _HKInitializeLogging();
              v66 = *v2;
              if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
              {
                v107 = v60;
                v67 = *(_QWORD *)(v1 + 48);
                v68 = v66;
                objc_msgSend(v124, "contactIdentifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                *(_QWORD *)&buf[4] = v67;
                v60 = v107;
                *(_WORD *)&buf[12] = 2113;
                *(_QWORD *)&buf[14] = v69;
                *(_WORD *)&buf[22] = 2113;
                v157 = v107;
                _os_log_error_impl(&dword_1B7802000, v68, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Unable to find zone for participant %{private}@. Error %{private}@", buf, 0x20u);

              }
            }

            v33 = v112;
          }
          else
          {
            _HKInitializeLogging();
            v54 = *v2;
            if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
            {
              v55 = *(_QWORD *)(v1 + 48);
              v56 = v54;
              objc_msgSend(v10, "contactIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543875;
              *(_QWORD *)&buf[4] = v55;
              *(_WORD *)&buf[12] = 2113;
              *(_QWORD *)&buf[14] = v57;
              *(_WORD *)&buf[22] = 2114;
              v157 = v33;
              _os_log_error_impl(&dword_1B7802000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Unable to find authorization record for participant %{private}@. Error %{public}@", buf, 0x20u);

            }
          }

        }
        else
        {
          _HKInitializeLogging();
          v20 = *v2;
          if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
          {
            v21 = *(_QWORD *)(v1 + 48);
            v22 = v20;
            objc_msgSend(v4, "contactIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "UUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2113;
            *(_QWORD *)&buf[14] = v23;
            *(_WORD *)&buf[22] = 2114;
            v157 = v24;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [summary-sharing] No authorization identifiers found for participant %{private}@ with UUID %{public}@", buf, 0x20u);

          }
        }

        ++v3;
      }
      while (v3 != v115);
      v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
      v115 = v99;
    }
    while (v99);
  }

  return 1;
}

id __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_198(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  void *v21;
  int v22;

  v3 = a2;
  objc_msgSend(v3, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v11)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v22 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v21 = v8;
      v16 = v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "isEqualToString:", v17);

      v12 = v16;
      v8 = v21;

      v7 = v22;
    }
    else
    {
      v18 = 0;
    }

  }
  return v7 & v18;
}

void __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_202(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  HDCloudSyncSharedSummaryTransactionRecord *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *log;
  void *v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2)
  {
    if (objc_msgSend(v9, "count"))
    {
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_2;
      v51[3] = &unk_1E6CFBEA0;
      v12 = *(void **)(a1 + 40);
      v51[4] = *(_QWORD *)(a1 + 32);
      v52 = v12;
      objc_msgSend(v9, "hk_map:", v51);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(void **)(a1 + 48);
        v16 = v13;
        objc_msgSend(v15, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v55 = v14;
        v56 = 2114;
        v57 = v17;
        v58 = 2114;
        v59 = v18;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Adding transaction to push with UUID %{public}@ to participant zone %{public}@", buf, 0x20u);

      }
      v49 = v11;
      v19 = *(void **)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(id *)(a1 + 48);
      if (v20)
      {
        v22 = (void *)MEMORY[0x1E0CB36F8];
        v23 = v19;
        v24 = v10;
        objc_msgSend(v21, "metadata");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        objc_msgSend(v22, "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, &v53);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v53;

        if (!v26)
        {
          _HKInitializeLogging();
          v27 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            log = v27;
            objc_msgSend(v21, "UUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "UUIDString");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v55 = v20;
            v56 = 2114;
            v57 = v50;
            v58 = 2114;
            v59 = v46;
            _os_log_error_impl(&dword_1B7802000, log, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Error archiving metadata %{public}@ for transaction %{public}@.", buf, 0x20u);

          }
        }
        v28 = [HDCloudSyncSharedSummaryTransactionRecord alloc];
        objc_msgSend(v21, "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sourceDeviceIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HDCloudSyncSharedSummaryTransactionRecord initInZone:UUID:sourceDeviceIdentifier:summaryIdentifiers:metadata:](v28, "initInZone:UUID:sourceDeviceIdentifier:summaryIdentifiers:metadata:", v23, v29, v30, v24, v26);

        objc_msgSend(v31, "record");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = 0;
      }

      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v48);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v32);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 40));

      v11 = v49;
    }
    else
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(_QWORD *)(a1 + 32);
        v36 = *(void **)(a1 + 48);
        v37 = v34;
        objc_msgSend(v36, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "UUIDString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "contactIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v55 = v35;
        v56 = 2114;
        v57 = v39;
        v58 = 2113;
        v59 = v40;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] No summary records to add for transaction %{public}@ and participant %{private}@", buf, 0x20u);

      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v33 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(void **)(a1 + 72);
      v43 = v33;
      objc_msgSend(v42, "contactIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v55 = v41;
      v56 = 2114;
      v57 = v11;
      v58 = 2113;
      v59 = v44;
      _os_log_error_impl(&dword_1B7802000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Error %{public}@ enumerating summary records for participant %{private}@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 80), "finishTask");

}

id __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  HDCloudSyncSharedSummaryRecord *v18;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(id *)(a1 + 40);
    v4 = a2;
    v18 = [HDCloudSyncSharedSummaryRecord alloc];
    objc_msgSend(v4, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "package");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compatibilityVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authorizationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summaryData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[HDCloudSyncSharedSummaryRecord initInZone:UUID:package:name:version:compatibilityVersion:objectTypes:authorizationIdentifiers:summaryData:](v18, "initInZone:UUID:package:name:version:compatibilityVersion:objectTypes:authorizationIdentifiers:summaryData:", v3, v16, v15, v5, v6, v7, v8, v10, v11);
    objc_msgSend(v12, "record");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

uint64_t __87__HDCloudSyncSharedSummaryPushOperation__authorizationRecordForParticipant_zone_error___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v14;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authorizationRecordIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "authorizationRecordIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "authorizationRecordIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v17 = v4;
      v12 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v13);

      v8 = v12;
      v4 = v17;

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

uint64_t __77__HDCloudSyncSharedSummaryPushOperation__participantZoneForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

@end
