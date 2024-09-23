@implementation BRCCoreAnalyticsReporter

+ (void)uploadMetricsReport:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  char v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[7];
  _QWORD v56[9];

  v56[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[BRCAnalyticsReporter isTelemetryReportingEnabled](BRCAnalyticsReporter, "isTelemetryReportingEnabled"))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBlacklistedFromFolderSharing") ^ 1;

    objc_msgSend(v4, "syncUpErrorsByMangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dictionaryForErrorsByZone:wantPrivateZone:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v8;
    v51 = objc_msgSend(a1, "uploadSyncErrorsAsIndividualEvents:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v8, CFSTR("syncUp"), v9, CFSTR("shared"), 1, v6, v10, v11);

    objc_msgSend(v4, "syncUpErrorsByMangledID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dictionaryForErrorsByZone:wantPrivateZone:", v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v13;
    v49 = objc_msgSend(a1, "uploadSyncErrorsAsIndividualEvents:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v13, CFSTR("syncUp"), v14, CFSTR("private"), 1, v6, v15, v16);

    objc_msgSend(v4, "syncDownErrorsByMangledID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dictionaryForErrorsByZone:wantPrivateZone:", v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v18;
    v48 = objc_msgSend(a1, "uploadSyncErrorsAsIndividualEvents:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v18, CFSTR("syncDown"), v19, CFSTR("shared"), 1, v6, v20, v21);

    objc_msgSend(v4, "syncUpErrorsByMangledID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dictionaryForErrorsByZone:wantPrivateZone:", v22, 1);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v23;
    v27 = objc_msgSend(a1, "uploadSyncErrorsAsIndividualEvents:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v23, CFSTR("syncDown"), v24, CFSTR("private"), 1, v6, v25, v26);

    objc_msgSend(v4, "uploadFailures");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(a1, "uploadLoadErrorsAsIndividualEvents:syncType:totalItemsCount:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v28, CFSTR("upload"), v29, 0, v6, v30, v31);

    objc_msgSend(v4, "downloadFailures");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(a1, "uploadLoadErrorsAsIndividualEvents:syncType:totalItemsCount:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v33, CFSTR("download"), v34, 0, v6, v35, v36);

    objc_msgSend(v4, "syncUpFailures");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v4, "clientTruthTotalItemsCount");
    objc_msgSend(v4, "dsid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampNumber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(a1, "uploadLoadErrorsAsIndividualEvents:syncType:totalItemsCount:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:", v38, CFSTR("itemSyncUp"), v39, 0, v6, v40, v41);

    if ((v51 & 1) == 0
      && (v49 & 1) == 0
      && (v48 & 1) == 0
      && (v27 & 1) == 0
      && (v32 & 1) == 0
      && (v37 & 1) == 0
      && (v42 & 1) == 0)
    {
      v55[0] = CFSTR("ErrorName");
      v55[1] = CFSTR("ErrorCount");
      v56[0] = CFSTR("success");
      v56[1] = &unk_1E87D7A60;
      v56[2] = CFSTR("success");
      v55[2] = CFSTR("SyncType");
      v55[3] = CFSTR("TotalItemsCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientTruthTotalItemsCount"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v56[3] = v43;
      v55[4] = CFSTR("FolderSharingEnabled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v56[4] = v44;
      v55[5] = CFSTR("DSID");
      objc_msgSend(v4, "dsid");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v56[5] = v45;
      v55[6] = CFSTR("RampNumber");
      objc_msgSend(v4, "rampNumber");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v56[6] = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 7);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "sendTelemetryEvent:withReport:", CFSTR("com.apple.iCloudDrive.syncStatus"), v47);
    }

  }
}

+ (id)dictionaryForErrorsByZone:(id)a3 wantPrivateZone:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__BRCCoreAnalyticsReporter_dictionaryForErrorsByZone_wantPrivateZone___block_invoke;
  v9[3] = &unk_1E87682F0;
  v11 = a4;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __70__BRCCoreAnalyticsReporter_dictionaryForErrorsByZone_wantPrivateZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (*(unsigned __int8 *)(a1 + 40) == objc_msgSend(a2, "isPrivate"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intValue") + 1;

    }
    else
    {
      v7 = 1;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

+ (id)telemetryDictionaryToUploadForError:(id)a3 errorMessage:(id)a4 count:(id)a5 syncType:(id)a6 totalItemsCount:(id)a7 zoneType:(id)a8 zoneCountsOnly:(BOOL)a9 isFolderSharingEnabled:(BOOL)a10 dsid:(id)a11 rampNumber:(id)a12 lastFailureDate:(id)a13 pcsState:(id)a14
{
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v41 = a4;
  v37 = a8;
  v40 = a11;
  v39 = a13;
  v38 = a14;
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = a12;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  objc_msgSend(v24, "domain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB37E8];
  v27 = objc_msgSend(v24, "code");

  objc_msgSend(v26, "numberWithInteger:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@;%@"), v25, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("FolderSharingEnabled"));

  objc_msgSend(v30, "setObject:forKey:", v29, CFSTR("ErrorName"));
  if (a9)
    v32 = CFSTR("ZoneErrorCount");
  else
    v32 = CFSTR("ErrorCount");
  objc_msgSend(v30, "setObject:forKey:", v23, v32);

  objc_msgSend(v30, "setObject:forKey:", v22, CFSTR("SyncType"));
  objc_msgSend(v30, "setObject:forKey:", v21, CFSTR("TotalItemsCount"));

  if (v37)
    objc_msgSend(v30, "setObject:forKey:", v37, CFSTR("ZoneType"));
  objc_msgSend(v30, "setObject:forKey:", v40, CFSTR("DSID"));
  objc_msgSend(v30, "setObject:forKey:", v20, CFSTR("RampNumber"));

  if (v39)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v39, "timeIntervalSinceReferenceDate");
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%f"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v35, CFSTR("LastErrorTimestamp"));

  }
  if (v38)
    objc_msgSend(v30, "setObject:forKey:", v38, CFSTR("ChainedFiles"));
  if (v41)
    objc_msgSend(v30, "setObject:forKey:", v41, CFSTR("ErrorMessage"));

  return v30;
}

+ (BOOL)uploadSyncErrorsAsIndividualEvents:(id)a3 syncType:(id)a4 totalItemsCount:(unint64_t)a5 zoneType:(id)a6 zoneCountsOnly:(BOOL)a7 isFolderSharingEnabled:(BOOL)a8 dsid:(id)a9 rampNumber:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  id v32;
  unint64_t v33;
  BOOL v34;
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __151__BRCCoreAnalyticsReporter_uploadSyncErrorsAsIndividualEvents_syncType_totalItemsCount_zoneType_zoneCountsOnly_isFolderSharingEnabled_dsid_rampNumber___block_invoke;
  v26[3] = &unk_1E8768318;
  v32 = a1;
  v21 = v17;
  v27 = v21;
  v33 = a5;
  v22 = v18;
  v28 = v22;
  v34 = a7;
  v35 = a8;
  v23 = v19;
  v29 = v23;
  v24 = v20;
  v30 = v24;
  v31 = &v36;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v26);
  LOBYTE(v17) = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  return (char)v17;
}

void __151__BRCCoreAnalyticsReporter_uploadSyncErrorsAsIndividualEvents_syncType_totalItemsCount_zoneType_zoneCountsOnly_isFolderSharingEnabled_dsid_rampNumber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(void **)(a1 + 72);
  v20 = v7;
  objc_msgSend(v7, "brc_cloudKitErrorMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_WORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = objc_msgSend(v6, "isPCSChained");

  v15 = CFSTR("unchained");
  if (v14)
    v15 = CFSTR("chain sent");
  LOWORD(v17) = v10;
  objc_msgSend(v19, "telemetryDictionaryToUploadForError:errorMessage:count:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:lastFailureDate:pcsState:", v20, v8, v5, v18, v9, v12, v17, v11, v13, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "sendTelemetryEvent:withReport:", CFSTR("com.apple.iCloudDrive.syncStatus"), v16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

}

+ (BOOL)uploadLoadErrorsAsIndividualEvents:(id)a3 syncType:(id)a4 totalItemsCount:(unint64_t)a5 zoneCountsOnly:(BOOL)a6 isFolderSharingEnabled:(BOOL)a7 dsid:(id)a8 rampNumber:(id)a9
{
  id v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  const __CFString *v39;
  void *v40;
  uint64_t v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v61;
  id v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v63 = a4;
  v62 = a8;
  v61 = a9;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v11;
  v45 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  v12 = 0;
  if (v45)
  {
    v44 = *(_QWORD *)v74;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v74 != v44)
          objc_enumerationMutation(obj);
        v46 = v13;
        v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v13);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v64 = v14;
        objc_msgSend(v14, "shareDBErrorCountByPCSAndEDPState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = v16;
        v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (v51)
        {
          v49 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v70 != v49)
                objc_enumerationMutation(v47);
              v18 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_msgSend(v64, "error");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "error");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "brc_cloudKitErrorMessage");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "shareDBErrorCountByPCSAndEDPState");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "lastFailureDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "left");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "intValue") - 1;
              v26 = CFSTR("unknown");
              if (v25 <= 3)
                v26 = off_1E8768338[v25];
              BYTE1(v42) = a7;
              LOBYTE(v42) = a6;
              objc_msgSend(a1, "telemetryDictionaryToUploadForError:errorMessage:count:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:lastFailureDate:pcsState:", v55, v19, v21, v63, v22, CFSTR("shared"), v42, v62, v61, v23, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(a1, "sendTelemetryEvent:withReport:", CFSTR("com.apple.iCloudDrive.syncStatus"), v27);
            }
            v51 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          }
          while (v51);
          v12 = 1;
        }

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v64, "privateDBErrorCountByPCSAndEDPState");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = v29;
        v52 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        if (v52)
        {
          v50 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v52; ++j)
            {
              if (*(_QWORD *)v66 != v50)
                objc_enumerationMutation(v48);
              v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
              objc_msgSend(v64, "error");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "error");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "brc_cloudKitErrorMessage");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "privateDBErrorCountByPCSAndEDPState");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "lastFailureDate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "left");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "intValue") - 1;
              v39 = CFSTR("unknown");
              if (v38 <= 3)
                v39 = off_1E8768338[v38];
              BYTE1(v42) = a7;
              LOBYTE(v42) = a6;
              objc_msgSend(a1, "telemetryDictionaryToUploadForError:errorMessage:count:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:lastFailureDate:pcsState:", v56, v32, v34, v63, v35, CFSTR("private"), v42, v62, v61, v36, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(a1, "sendTelemetryEvent:withReport:", CFSTR("com.apple.iCloudDrive.syncStatus"), v40);
            }
            v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          }
          while (v52);
          v12 = 1;
        }

        v13 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v45);
  }

  return v12 & 1;
}

+ (void)newAppTelemetryMetricEvent:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (+[BRCAnalyticsReporter isTelemetryReportingEnabled](BRCAnalyticsReporter, "isTelemetryReportingEnabled"))
  {
    v4 = (void *)objc_opt_new();
    switch(objc_msgSend(v19, "telemetrySchema"))
    {
      case 2u:
        if (objc_msgSend(v19, "hasMagnitudeInt"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v19, "magnitudeInt"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("mismatchCount"));

        }
        v6 = 0;
        v7 = CFSTR("com.apple.iCloudDrive.appTelemetry.folderSharingCountMismatch");
        break;
      case 3u:
        if (objc_msgSend(v19, "hasMagnitudeInt"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v19, "magnitudeInt"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numberOfZonesOutOfSync"));

        }
        v6 = 0;
        v7 = CFSTR("com.apple.iCloudDrive.appTelemetry.missingPush");
        break;
      case 4u:
        if (objc_msgSend(v19, "hasMagnitudeBool"))
        {
          if (objc_msgSend(v19, "magnitudeBool"))
            v9 = CFSTR("true");
          else
            v9 = CFSTR("false");
          objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("permanentlyInconsistent"));
        }
        v6 = 0;
        v7 = CFSTR("com.apple.iCloudDrive.appTelemetry.permanentlyInconsistent");
        break;
      case 5u:
        if (objc_msgSend(v19, "hasMagnitudeInt"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v19, "magnitudeInt"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("eventCount"));

        }
        v6 = 0;
        v7 = CFSTR("com.apple.iCloudDrive.appTelemetry.droppedEvent");
        break;
      case 6u:
        if (objc_msgSend(v19, "hasMagnitudeInt"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v19, "magnitudeInt"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("data"));

        }
        v6 = 0;
        v7 = CFSTR("com.apple.iCloudDrive.appTelemetry.testEvent");
        break;
      case 7u:
        if (objc_msgSend(v19, "hasMagnitudeBool"))
        {
          if (objc_msgSend(v19, "magnitudeBool"))
            v12 = CFSTR("true");
          else
            v12 = CFSTR("false");
          objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("sharedAliasInSharedFolder"));
        }
        v6 = 0;
        v7 = CFSTR("com.apple.iCloudDrive.appTelemetry.shareAliasInSharedFolder");
        break;
      default:
        v7 = 0;
        v6 = 1;
        break;
    }
    if (objc_msgSend(v19, "hasInvestigation"))
    {
      objc_msgSend(v19, "investigation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasZoneName");

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v19, "investigation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "zoneName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v15, "initWithData:encoding:", v17, 4);

        objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("zoneName"));
      }
    }
    if ((v6 & 1) == 0)
      objc_msgSend(a1, "sendTelemetryEvent:withReport:", v7, v4);

  }
}

+ (void)sendTelemetryEvent:(id)a3 withReport:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  AnalyticsIsEventUsed();
  v8 = v5;
  v7 = v5;
  AnalyticsSendEventLazy();

}

id __58__BRCCoreAnalyticsReporter_sendTelemetryEvent_withReport___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
