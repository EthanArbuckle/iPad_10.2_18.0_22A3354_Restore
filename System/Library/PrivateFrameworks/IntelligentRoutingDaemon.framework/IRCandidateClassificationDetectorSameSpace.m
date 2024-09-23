@implementation IRCandidateClassificationDetectorSameSpace

+ (id)sameSpaceMiLoScoresForCandidate:(id)a3 basedOnMiLoPrediction:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t, _BYTE *);
  void *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v10, "canUse") & 1) != 0)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "miloSameSpaceEventsTimeIntervalSeconds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v12, "dateByAddingTimeInterval:", -v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke;
    v44[3] = &unk_251043A70;
    v45 = v9;
    v18 = v16;
    v46 = v18;
    objc_msgSend(v11, "allWhere:", v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    +[IRPreferences shared](IRPreferences, "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "miloLslIsSameMiloThreshold");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    v28 = v17;
    v29 = 3221225472;
    v30 = __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_2;
    v31 = &unk_251043AC0;
    v33 = &v40;
    v32 = v10;
    v34 = &v36;
    v35 = v23;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", &v28);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v37[3], v28, v29, v30, v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41[3]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRPair pairWithFirst:second:](IRPair, "pairWithFirst:second:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    +[IRPair pairWithFirst:second:](IRPair, "pairWithFirst:second:", &unk_25105EB10, &unk_25105EB10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

uint64_t __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5
    && (objc_msgSend(v3, "date"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEarlierThan:", *(_QWORD *)(a1 + 40)),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(v3, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isUserIntentionEvent");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  +[IRPreferences shared](IRPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "miloSameSpaceEventsNumberOfEventsToWatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  if (v6 >= v9)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v17, "miloPredictionEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predictionId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "predictionId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "scores");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_3;
      v18[3] = &unk_251043A98;
      v19 = v17;
      objc_msgSend(v14, "firstWhere:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        objc_msgSend(v15, "score");
        if (v16 > *(double *)(a1 + 56))
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }

    }
  }

}

uint64_t __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "miloPredictionEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (void)adjustSameSpaceParametersForCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andMiLoPrediction:(id)a6 andNearbyDevicesContainer:(id)a7 andDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v17, "freezeDateNIHomeDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v17, "freezeDateNIHomeDevice");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = v18;
  }

  +[IRPreferences shared](IRPreferences, "shared");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nearbyDeviceMeasurmentExpityTimeSeconds");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  objc_msgSend(v39, "dateByAddingTimeInterval:", -v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __173__IRCandidateClassificationDetectorSameSpace_adjustSameSpaceParametersForCandidates_withSystemState_andHistoryEventsAsc_andMiLoPrediction_andNearbyDevicesContainer_andDate___block_invoke;
  v41[3] = &unk_251043AE8;
  v41[4] = self;
  v25 = v16;
  v42 = v25;
  v26 = v15;
  v43 = v26;
  v27 = v18;
  v44 = v27;
  v28 = v14;
  v45 = v28;
  v29 = v17;
  v46 = v29;
  v30 = v23;
  v47 = v30;
  v31 = v24;
  v48 = v31;
  v49 = &v50;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v41);
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v38 = v25;
    v34 = v28;
    v35 = v26;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51[3]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v40, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v55 = "#detector-same-space, ";
    v56 = 2112;
    v57 = v32;
    v58 = 2112;
    v59 = v36;
    v60 = 2112;
    v61 = v37;
    _os_log_impl(&dword_23FFBA000, v33, OS_LOG_TYPE_INFO, "%s[%@], #sameSpaceCandidates=%@, #totalCandidatesTested=%@", buf, 0x2Au);

    v26 = v35;
    v28 = v34;
    v25 = v38;

  }
  _Block_object_dispose(&v50, 8);

}

void __173__IRCandidateClassificationDetectorSameSpace_adjustSameSpaceParametersForCandidates_withSystemState_andHistoryEventsAsc_andMiLoPrediction_andNearbyDevicesContainer_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *log;
  void *v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_isSameSpaceForCandidate:basedOnMiLoPrediction:andHistoryEventsAsc:andDate:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_isSameSpaceBrokeredDeviceForCandidate:basedOnSystemState:andHistoryEventsAsc:andDate:", v8, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_isSameSpaceBasedOnPDRFenceForCandidate:basedOnSystemState:", v11, *(_QWORD *)(a1 + 64));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v3, "candidate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "nearbyDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_isSameSpaceForCandidate:basedOnNearbyDevices:andExpiryDate:isUWB:", v14, v15, *(_QWORD *)(a1 + 80), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 32);
  objc_msgSend(v3, "candidate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "nearbyDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_isSameSpaceForCandidate:basedOnNearbyDevices:andExpiryDate:isUWB:", v18, v19, *(_QWORD *)(a1 + 88), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRPreferences shared](IRPreferences, "shared");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "miloRoomDetectionInCustomLOIEnabled");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "BOOLValue") & 1) != 0 || !(_DWORD)v6)
  {

  }
  else
  {
    v23 = objc_msgSend(*(id *)(a1 + 64), "locationSemanticUserSpecificPlaceType");

    if (v23 == 5)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "#detector-same-space, ";
        v38 = 2112;
        v39 = v24;
        _os_log_impl(&dword_23FFBA000, v25, OS_LOG_TYPE_INFO, "%s[%@], MiLo room detection in custom LOI is disabled and LOI is custom, disabling sameSpaceBasedOnMiLo", buf, 0x16u);
      }

      v6 = 0;
    }
  }
  objc_msgSend(v3, "setSameSpaceBasedOnMiLo:", v6);
  objc_msgSend(v3, "setSameSpaceBasedOnBrokeredLOI:", v9);
  objc_msgSend(v3, "setSameSpaceBasedOnUWB:", v16 != 0);
  objc_msgSend(v3, "setSameSpaceBasedOnBLE:", v20 != 0);
  objc_msgSend(v3, "setSameSpaceBasedOnPDRFence:", v12);
  objc_msgSend(v3, "setUwbRange:", v16);
  objc_msgSend(v3, "setBleRange:", v20);
  objc_msgSend(v3, "setIsSameSpace:", objc_msgSend(*(id *)(a1 + 32), "_isSameSpaceCandidate:", v3));
  if (objc_msgSend(v3, "isSameSpace"))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      log = v27;
      objc_msgSend(v3, "candidate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "candidate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "candidateIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136317186;
      v37 = "#detector-same-space, ";
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v28;
      v42 = 2112;
      v43 = v29;
      v44 = 2112;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      v48 = 2112;
      v49 = v32;
      v50 = 2112;
      v51 = v16;
      v52 = 2112;
      v53 = v20;
      _os_log_impl(&dword_23FFBA000, log, OS_LOG_TYPE_INFO, "%s[%@], SameSpaceCandidate: name: %@, identifier: %@, MiLo: %@, BrokeredDeviceInLOI: %@, PDRFence: %@, uwbRange: %@, bleRange: %@", buf, 0x5Cu);

    }
  }

}

- (BOOL)_isSameSpaceCandidate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "sameSpaceBasedOnMiLo") & 1) != 0
    || (objc_msgSend(v3, "sameSpaceBasedOnUWB") & 1) != 0
    || (objc_msgSend(v3, "sameSpaceBasedOnBLE") & 1) != 0
    || (objc_msgSend(v3, "sameSpaceBasedOnBrokeredLOI") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "sameSpaceBasedOnPDRFence");
  }

  return v4;
}

- (id)_isSameSpaceForCandidate:(id)a3 basedOnNearbyDevices:(id)a4 andExpiryDate:(id)a5 isUWB:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  BOOL v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0x408F400000000000;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v28 = 0;
  objc_msgSend(v9, "nodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke;
  v21[3] = &unk_251043BB8;
  v13 = v10;
  v22 = v13;
  v14 = v11;
  v26 = a6;
  v23 = v14;
  v24 = v27;
  v25 = &v29;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);

  +[IRPreferences shared](IRPreferences, "shared");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceRangeProximityThreshold");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v30[3] <= v18)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_2;
  v18[3] = &unk_251043B10;
  v4 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v17 = v3;
  v20 = v17;
  objc_msgSend(v4, "allWhere:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!*(_BYTE *)(a1 + 64))
  {
    v10 = &__block_literal_global_12;
    goto LABEL_5;
  }
  objc_msgSend(v5, "firstWhere:", &__block_literal_global_0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v10 = &__block_literal_global_10;
LABEL_5:
    objc_msgSend(v6, "firstWhere:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v14)
  {
    objc_msgSend(v14, "range");
    if (v15 <= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "range");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
    }
  }

}

uint64_t __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "measurementDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEarlierThan:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "computedIdsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "computedMediaRemoteIdenfifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mediaRemoteIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "computedMediaRouteIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "mediaRemoteIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "isEqual:", v12);

      }
    }

  }
  return v6;
}

uint64_t __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "proximityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("NIHomeDevice"));

  return v3;
}

BOOL __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "proximityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[IRProximityProvider isUWBProximityType:](IRProximityProvider, "isUWBProximityType:", v2);

  return v3;
}

BOOL __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "proximityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[IRProximityProvider isBLEProximityType:](IRProximityProvider, "isBLEProximityType:", v2);

  return v3;
}

- (BOOL)_isSameSpaceForCandidate:(id)a3 basedOnMiLoPrediction:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  BOOL v25;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_class();
  objc_msgSend(v12, "candidateIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sameSpaceMiLoScoresForCandidate:basedOnMiLoPrediction:andHistoryEventsAsc:andDate:", v14, v11, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "first");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v15, "second");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  if (v21 <= 0.0)
  {
    v25 = 0;
  }
  else
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "miloSameSpaceRatioThreshold");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v18 / v21 > v24;

  }
  return v25;
}

- (BOOL)_isSameSpaceBrokeredDeviceForCandidate:(id)a3 basedOnSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "isBrokeredDevice"))
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loiSameSpaceEventsTimeIntervalSeconds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v12, "dateByAddingTimeInterval:", -v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __132__IRCandidateClassificationDetectorSameSpace__isSameSpaceBrokeredDeviceForCandidate_basedOnSystemState_andHistoryEventsAsc_andDate___block_invoke;
    v21[3] = &unk_251043BE0;
    v22 = v9;
    v23 = v16;
    v24 = v10;
    v17 = v16;
    objc_msgSend(v11, "firstWhere:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 != 0;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __132__IRCandidateClassificationDetectorSameSpace__isSameSpaceBrokeredDeviceForCandidate_basedOnSystemState_andHistoryEventsAsc_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v3 = a2;
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v6)
    goto LABEL_3;
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEarlierThan:", *(_QWORD *)(a1 + 40));

  if ((v8 & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v3, "systemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "locationSemanticUserSpecificPlaceType") != 5)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v12 = objc_msgSend(*(id *)(a1 + 48), "locationSemanticUserSpecificPlaceType");

  if (v12 == 5)
  {
    objc_msgSend(v3, "systemState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locationSemanticLoiIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "locationSemanticLoiIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      objc_msgSend(v3, "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "isUserIntentionEvent");
LABEL_10:

      goto LABEL_4;
    }
  }
LABEL_3:
  v9 = 0;
LABEL_4:

  return v9;
}

- (BOOL)_isSameSpaceBasedOnPDRFenceForCandidate:(id)a3 basedOnSystemState:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if (objc_msgSend(a3, "isBrokeredDevice"))
    v6 = objc_msgSend(v5, "pdrFenceActive");
  else
    v6 = 0;

  return v6;
}

@end
