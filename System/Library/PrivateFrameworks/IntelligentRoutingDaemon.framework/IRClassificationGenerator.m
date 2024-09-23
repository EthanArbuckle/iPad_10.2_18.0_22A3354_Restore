@implementation IRClassificationGenerator

- (IRClassificationGenerator)init
{
  IRClassificationGenerator *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  IRPolicyInspection *v8;
  void *v9;
  IRCandidateClassificationDetectorFiltered *v10;
  IRCandidateClassificationDetectorSameSpace *v11;
  IRCandidateSelector *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IRClassificationGenerator;
  v2 = -[IRClassificationGenerator init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[IRClassificationGenerator setInternalContexts:](v2, "setInternalContexts:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BE5B2D8]);
    -[IRClassificationGenerator internalContexts](v2, "internalContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE5B260];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE5B260]);

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[IRClassificationGenerator setInternalPolicyInspections:](v2, "setInternalPolicyInspections:", v7);

    v8 = -[IRPolicyInspection initWithName:]([IRPolicyInspection alloc], "initWithName:", CFSTR("Media"));
    -[IRClassificationGenerator internalPolicyInspections](v2, "internalPolicyInspections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

    v10 = objc_alloc_init(IRCandidateClassificationDetectorFiltered);
    -[IRClassificationGenerator setDetectorFiltered:](v2, "setDetectorFiltered:", v10);

    v11 = objc_alloc_init(IRCandidateClassificationDetectorSameSpace);
    -[IRClassificationGenerator setDetectorSameSpace:](v2, "setDetectorSameSpace:", v11);

    v12 = objc_alloc_init(IRCandidateSelector);
    -[IRClassificationGenerator setSelector:](v2, "setSelector:", v12);

  }
  return v2;
}

- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  char v67;
  NSObject *log;
  os_log_t loga;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  int64_t v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  BOOL v90;
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v79 = a8;
  v103 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = a7;
  v81 = v14;
  objc_msgSend(v14, "airplayOrUnknownCandidates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "map:", &__block_literal_global_2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)*MEMORY[0x24BE5B270];
  v80 = v17;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v24 = v18;
    v74 = v16;
    v25 = (void *)MEMORY[0x24BDD16E0];
    v26 = v23;
    objc_msgSend(v81, "candidates");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v92 = "#classification-generator, ";
    v93 = 2112;
    v94 = v22;
    v95 = 2112;
    v96 = v28;
    v97 = 2112;
    v98 = v29;
    _os_log_impl(&dword_23FFBA000, v26, OS_LOG_TYPE_INFO, "%s[%@], #totalCandidates=%@, #validCandidates=%@", buf, 0x2Au);

    v18 = v24;
    v16 = v74;

    v17 = v80;
  }

  -[IRClassificationGenerator detectorSameSpace](self, "detectorSameSpace");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "historyEvents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "adjustSameSpaceParametersForCandidates:withSystemState:andHistoryEventsAsc:andMiLoPrediction:andNearbyDevicesContainer:andDate:", v21, v15, v31, v17, v19, v18);

  -[IRClassificationGenerator detectorFiltered](self, "detectorFiltered");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "adjustFilteredParametersForCandidates:withSystemState:andDate:", v21, v15, v18);

  -[IRClassificationGenerator selector](self, "selector");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "historyEvents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:", v21, v15, v34, v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v72 = v18;
    objc_msgSend(v35, "candidate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "historyEvents");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = +[IRCandicateClassificationEligibility classificationEligibilityForCandidate:withHistoryEventsAsc:systemState:](IRCandicateClassificationEligibility, "classificationEligibilityForCandidate:withHistoryEventsAsc:systemState:", v36, v37, v15);

    v78 = v38;
    objc_msgSend(v35, "setNominatedClassification:", v38);
    if (objc_msgSend(v35, "nominatedClassification") == 2)
    {
      objc_msgSend(v35, "nominatedClassificationDesc");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringByAppendingString:", CFSTR("[Not Eligble]"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setNominatedClassificationDesc:", v40);

    }
    -[IRClassificationGenerator selector](self, "selector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "historyEvents");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v72;
    objc_msgSend(v41, "adjustClassificationForCandidateBasedOnNegativeInputs:withSystemState:andHistoryEventsAsc:andMiloPrediction:andDate:", v35, v15, v42, v17, v72);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      log = v44;
      objc_msgSend(v35, "candidate");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "name");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "candidate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "candidateIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "nominatedClassification");
      IRCandidateClassificationToString();
      v75 = v16;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "nominatedClassificationDesc");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v92 = "#classification-generator, ";
      v93 = 2112;
      v94 = v43;
      v95 = 2112;
      v96 = v66;
      v97 = 2112;
      v98 = v46;
      v99 = 2112;
      v100 = v47;
      v101 = 2112;
      v102 = v48;
      _os_log_impl(&dword_23FFBA000, log, OS_LOG_TYPE_INFO, "%s[%@], SelectedCandidate: name: %@, identifier: %@, classification: %@, desc: %@", buf, 0x3Eu);

      v18 = v72;
      v16 = v75;

    }
  }
  else
  {
    v77 = 0;
    v78 = 0;
  }
  v49 = objc_alloc_init(MEMORY[0x24BE5B2D8]);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __167__IRClassificationGenerator_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_26;
  v82[3] = &unk_251043DD8;
  v82[4] = self;
  v83 = v35;
  v84 = v15;
  v85 = v21;
  v86 = v18;
  v87 = v16;
  v90 = v79;
  v88 = v49;
  v89 = v50;
  loga = v50;
  v51 = v49;
  v76 = v16;
  v73 = v18;
  v71 = v21;
  v52 = v15;
  v53 = v35;
  objc_msgSend(v71, "enumerateObjectsUsingBlock:", v82);
  objc_msgSend(v51, "candidateResults");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRClassificationGenerator internalContexts](self, "internalContexts");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *MEMORY[0x24BE5B260];
  objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x24BE5B260]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "candidateResults");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v54, "isEqual:", v58);

  -[IRClassificationGenerator internalContexts](self, "internalContexts");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v51, v56);

  -[IRClassificationGenerator internalContexts](self, "internalContexts");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKeyedSubscript:", v56);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "appInFocusBundleID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "updateBundleIdentifier:", v62);

  objc_msgSend(v53, "candidate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "candidateIdentifier");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRClassificationGenerator _fillInspectionIfNeeded:withCandidates:selectedCandidate:negativeInputs:stateMachineClassification:](self, "_fillInspectionIfNeeded:withCandidates:selectedCandidate:negativeInputs:stateMachineClassification:", v79, loga, v64, v77, v78);

  return v67 ^ 1;
}

IRCandidateWrapper *__167__IRClassificationGenerator_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IRCandidateWrapper *v3;

  v2 = a2;
  v3 = -[IRCandidateWrapper initWithCandidate:]([IRCandidateWrapper alloc], "initWithCandidate:", v2);

  return v3;
}

void __167__IRClassificationGenerator_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_26(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_createInspectedCandidateFromCandidate:selectedCandidateIdentifier:systemState:allCandidates:andDate:", v5, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "historyEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_adjustAdditionalFieldsForCandidate:selectedCandidateIdentifier:historyEvents:systemState:", v25, v10, v11, *(_QWORD *)(a1 + 48));

  v12 = objc_alloc(MEMORY[0x24BE5B2C8]);
  objc_msgSend(v25, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidateDO candidateFromCandidateDO:](IRCandidateDO, "candidateFromCandidateDO:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v25, "nominatedClassification");
  objc_msgSend(v25, "nominatedClassificationDesc");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortingHint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "isCallToAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");
  v20 = objc_msgSend(v25, "isLockScreenControl");
  LOBYTE(v24) = objc_msgSend(v25, "isConservativeFiltered");
  v21 = (void *)objc_msgSend(v12, "initWithCandidate:classification:classificationDescription:sortingHint:isCallToAction:isLockScreenControl:isConservativeFiltered:", v14, v15, v16, v17, v19, v20, v24);

  objc_msgSend(*(id *)(a1 + 80), "addCandidateResult:", v21);
  if (*(_BYTE *)(a1 + 96))
  {
    v22 = objc_msgSend(v25, "nominatedClassification");
    objc_msgSend(v25, "nominatedClassificationDesc");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClassification:withDescription:", v22, v23);

    objc_msgSend(*(id *)(a1 + 88), "addObject:", v25);
  }

}

- (NSDictionary)contexts
{
  void *v2;
  void *v3;

  -[IRClassificationGenerator internalContexts](self, "internalContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSDictionary)policyInspections
{
  void *v2;
  void *v3;

  -[IRClassificationGenerator internalPolicyInspections](self, "internalPolicyInspections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (id)_createInspectedCandidateFromCandidate:(id)a3 selectedCandidateIdentifier:(id)a4 systemState:(id)a5 allCandidates:(id)a6 andDate:(id)a7
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "isFiltered");
  objc_msgSend(v8, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidateIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  v14 = objc_msgSend(v8, "isSameSpace");
  if (v10)
  {
    objc_msgSend(v8, "setNominatedClassification:", 1);
    v15 = CFSTR("{Filtered}");
  }
  else if (v13)
  {
    objc_msgSend(v8, "nominatedClassificationDesc");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v14)
  {
    objc_msgSend(v8, "setNominatedClassification:", 2);
    v15 = CFSTR("{Same space}");
  }
  else
  {
    v15 = &stru_251046168;
  }
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "sameSpaceBasedOnUWB"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "sameSpaceBasedOnBLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "sameSpaceBasedOnMiLo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "sameSpaceBasedOnBrokeredLOI"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "sameSpaceBasedOnPDRFence"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("{UWB:%@, BLE:%@, MILO:%@, BrokeredInLOI:%@, PDRFence:%@}%@"), v17, v18, v19, v20, v21, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNominatedClassificationDesc:", v22);

  return v8;
}

- (void)_adjustAdditionalFieldsForCandidate:(id)a3 selectedCandidateIdentifier:(id)a4 historyEvents:(id)a5 systemState:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  objc_msgSend(v16, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "candidateIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v12);

  if (v15)
  {
    -[IRClassificationGenerator _setSortingHintForCandidate:](self, "_setSortingHintForCandidate:", v16);
    -[IRClassificationGenerator _setCallToActionForCandidate:withHistoryEventsAsc:andSystemState:](self, "_setCallToActionForCandidate:withHistoryEventsAsc:andSystemState:", v16, v10, v11);
LABEL_4:
    -[IRClassificationGenerator _setLockScreenControlForCandidate:](self, "_setLockScreenControlForCandidate:", v16);
    goto LABEL_5;
  }
  if (objc_msgSend(v16, "isSameSpace"))
    goto LABEL_4;
LABEL_5:
  -[IRClassificationGenerator _setConservativeFilteredForCandidate:andSystemState:](self, "_setConservativeFilteredForCandidate:andSystemState:", v16, v11);

}

- (void)_fillInspectionIfNeeded:(BOOL)a3 withCandidates:(id)a4 selectedCandidate:(id)a5 negativeInputs:(id)a6 stateMachineClassification:(int64_t)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  IRPolicyInspection *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  IRClassificationGenerator *v25;

  v10 = a3;
  v12 = a5;
  if (v10)
  {
    v22 = v12;
    v13 = a6;
    v14 = a4;
    v15 = -[IRPolicyInspection initWithName:]([IRPolicyInspection alloc], "initWithName:", CFSTR("Media"));
    -[IRClassificationGenerator internalPolicyInspections](self, "internalPolicyInspections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BE5B260];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE5B260]);

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __128__IRClassificationGenerator__fillInspectionIfNeeded_withCandidates_selectedCandidate_negativeInputs_stateMachineClassification___block_invoke;
    v23[3] = &unk_251043E00;
    v24 = v22;
    v25 = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v23);

    -[IRClassificationGenerator internalPolicyInspections](self, "internalPolicyInspections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGeneratorNegativeInputs:", v13);

    -[IRClassificationGenerator internalPolicyInspections](self, "internalPolicyInspections");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setStateMachineClassification:", a7);

    v12 = v22;
  }

}

void __128__IRClassificationGenerator__fillInspectionIfNeeded_withCandidates_selectedCandidate_negativeInputs_stateMachineClassification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  IRCandidateInspectionGenerator *v17;
  IRCandidateInspection *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  IRCandidateInspectionGenerator *v23;
  IRCandidateInspection *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v3 = a2;
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  v26 = a1;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "selector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getSelectorReasons");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  v24 = [IRCandidateInspection alloc];
  v23 = [IRCandidateInspectionGenerator alloc];
  objc_msgSend(v3, "candidateResult");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v25, "classification");
  objc_msgSend(v3, "candidateResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classificationDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "sameSpaceBasedOnMiLo");
  v11 = objc_msgSend(v3, "sameSpaceBasedOnBrokeredLOI");
  v12 = objc_msgSend(v3, "sameSpaceBasedOnPDRFence");
  v13 = objc_msgSend(v3, "sameSpaceBasedOnUWB");
  v14 = objc_msgSend(v3, "sameSpaceBasedOnBLE");
  objc_msgSend(v3, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRCandidateDO candidateFromCandidateDO:](IRCandidateDO, "candidateFromCandidateDO:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = v14;
  v17 = -[IRCandidateInspectionGenerator initWithClassification:ClassificationDescription:sameSpaceBasedOnMiLo:sameSpaceBasedOnBrokeredLOI:sameSpaceBasedOnPDRFence:sameSpaceBasedOnUWB:sameSpaceBasedOnBLE:candidateSelectorReasons:forCandidate:](v23, "initWithClassification:ClassificationDescription:sameSpaceBasedOnMiLo:sameSpaceBasedOnBrokeredLOI:sameSpaceBasedOnPDRFence:sameSpaceBasedOnUWB:sameSpaceBasedOnBLE:candidateSelectorReasons:forCandidate:", v22, v9, v10, v11, v12, v13, v21, v27, v16);
  v18 = -[IRCandidateInspection initWithInspectionGenerator:](v24, "initWithInspectionGenerator:", v17);

  objc_msgSend(*(id *)(v26 + 40), "internalPolicyInspections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE5B260]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addCandidate:", v18);

}

- (void)_setSortingHintForCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "setSortingHint:", &unk_25105F008);
  objc_msgSend(v3, "nominatedClassificationDesc");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortingHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("(SH=%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNominatedClassificationDesc:", v5);

}

- (void)_setCallToActionForCandidate:(id)a3 withHistoryEventsAsc:(id)a4 andSystemState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v47 = a5;
  if (((objc_msgSend(v7, "sameSpaceBasedOnUWB") & 1) != 0
     || objc_msgSend(v7, "sameSpaceBasedOnBrokeredLOI"))
    && (objc_msgSend(v7, "isFiltered") & 1) == 0)
  {
    objc_msgSend(v7, "isCallToAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 11);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = (void *)MEMORY[0x24BDBCF20];
      +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v43 = v10;
      obj = v10;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v49;
LABEL_7:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v20);
          objc_msgSend(v7, "candidate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "candidateIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "candidateIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if (v25)
          {
            objc_msgSend(v47, "appInFocusBundleID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "event");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "bundleID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v26, "isEqual:", v28);

            if (v29)
            {
              objc_msgSend(v21, "event");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqual:", v45);

              if (v31)
              {
                ++v18;
                +[IRPreferences shared](IRPreferences, "shared");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "candidateSelectorCallToActionAppearThreshold");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "unsignedIntValue");

                if (v18 > v34)
                {
                  objc_msgSend(v7, "nominatedClassificationDesc");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = v39;
                  v41 = CFSTR("[C2A Exceeded]");
LABEL_20:
                  objc_msgSend(v39, "stringByAppendingString:", v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setNominatedClassificationDesc:", v42);

                  goto LABEL_21;
                }
              }
              else
              {
                objc_msgSend(v21, "event");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v44, "containsObject:", v35);

                if ((v36 & 1) == 0)
                {
                  objc_msgSend(v7, "nominatedClassificationDesc");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = v39;
                  v41 = CFSTR("[C2A interaction]");
                  goto LABEL_20;
                }
              }
            }
          }
          if (v17 == ++v20)
          {
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
            if (v17)
              goto LABEL_7;
            break;
          }
        }
      }

      objc_msgSend(v7, "nominatedClassificationDesc");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringByAppendingString:", CFSTR("(C2A)"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNominatedClassificationDesc:", v38);

      objc_msgSend(v7, "setIsCallToAction:", MEMORY[0x24BDBD1C8]);
LABEL_21:
      v8 = v43;

    }
  }

}

- (void)_setLockScreenControlForCandidate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "sameSpaceBasedOnMiLo") & 1) != 0 || objc_msgSend(v5, "sameSpaceBasedOnUWB"))
  {
    objc_msgSend(v5, "nominatedClassificationDesc");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("(Lock Screen Control)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNominatedClassificationDesc:", v4);

    objc_msgSend(v5, "setIsLockScreenControl:", 1);
  }

}

- (void)_setConservativeFilteredForCandidate:(id)a3 andSystemState:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isConservativeFiltered"))
  {
    objc_msgSend(v6, "nominatedClassificationDesc");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("(Conservative Filtered)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNominatedClassificationDesc:", v5);

  }
}

- (NSMutableDictionary)internalContexts
{
  return self->_internalContexts;
}

- (void)setInternalContexts:(id)a3
{
  objc_storeStrong((id *)&self->_internalContexts, a3);
}

- (NSMutableDictionary)internalPolicyInspections
{
  return self->_internalPolicyInspections;
}

- (void)setInternalPolicyInspections:(id)a3
{
  objc_storeStrong((id *)&self->_internalPolicyInspections, a3);
}

- (IRCandidateClassificationDetectorFiltered)detectorFiltered
{
  return self->_detectorFiltered;
}

- (void)setDetectorFiltered:(id)a3
{
  objc_storeStrong((id *)&self->_detectorFiltered, a3);
}

- (IRCandidateClassificationDetectorSameSpace)detectorSameSpace
{
  return self->_detectorSameSpace;
}

- (void)setDetectorSameSpace:(id)a3
{
  objc_storeStrong((id *)&self->_detectorSameSpace, a3);
}

- (IRCandidateSelector)selector
{
  return self->_selector;
}

- (void)setSelector:(id)a3
{
  objc_storeStrong((id *)&self->_selector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_detectorSameSpace, 0);
  objc_storeStrong((id *)&self->_detectorFiltered, 0);
  objc_storeStrong((id *)&self->_internalPolicyInspections, 0);
  objc_storeStrong((id *)&self->_internalContexts, 0);
}

@end
