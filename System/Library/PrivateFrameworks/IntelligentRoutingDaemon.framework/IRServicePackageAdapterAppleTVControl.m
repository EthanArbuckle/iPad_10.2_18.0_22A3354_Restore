@implementation IRServicePackageAdapterAppleTVControl

- (IRServicePackageAdapterAppleTVControl)init
{
  IRServicePackageAdapterAppleTVControl *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  IRPolicyInspection *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IRServicePackageAdapterAppleTVControl;
  v2 = -[IRServicePackageAdapterAppleTVControl init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[IRServicePackageAdapterAppleTVControl setInternalContexts:](v2, "setInternalContexts:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BE5B2D8]);
    -[IRServicePackageAdapterAppleTVControl internalContexts](v2, "internalContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE5B258];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE5B258]);

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[IRServicePackageAdapterAppleTVControl setInternalPolicyInspections:](v2, "setInternalPolicyInspections:", v7);

    v8 = -[IRPolicyInspection initWithName:]([IRPolicyInspection alloc], "initWithName:", CFSTR("AppleTVControl"));
    -[IRServicePackageAdapterAppleTVControl internalPolicyInspections](v2, "internalPolicyInspections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  return v2;
}

- (NSDictionary)contexts
{
  void *v2;
  void *v3;

  -[IRServicePackageAdapterAppleTVControl internalContexts](self, "internalContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSDictionary)policyInspections
{
  void *v2;
  void *v3;

  -[IRServicePackageAdapterAppleTVControl internalPolicyInspections](self, "internalPolicyInspections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
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
  IRCandidateClassificationDetectorSameSpace *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v38;
  _BOOL4 v39;
  void *v40;
  _QWORD v41[4];
  id v42;

  v39 = a8;
  v14 = a4;
  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  -[IRServicePackageAdapterAppleTVControl _rules](self, "_rules");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRRuleEngine executeRules:withCandiatesContainer:systemStatus:historyEventsContainer:miloPrediction:nearbyDeviceContainer:date:](IRRuleEngine, "executeRules:withCandiatesContainer:systemStatus:historyEventsContainer:miloPrediction:nearbyDeviceContainer:date:", v20, v19, v14, v18, v17, v16, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = -[IRServicePackageAdapterAppleTVControl _outputRulesToContext:candidatesContainer:fillInspection:](self, "_outputRulesToContext:candidatesContainer:fillInspection:", v21, v19, v39);
  v22 = objc_alloc_init(IRCandidateClassificationDetectorSameSpace);
  objc_msgSend(v19, "candidates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "map:", &__block_literal_global_17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "historyEvents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v14;
  -[IRCandidateClassificationDetectorSameSpace adjustSameSpaceParametersForCandidates:withSystemState:andHistoryEventsAsc:andMiLoPrediction:andNearbyDevicesContainer:andDate:](v22, "adjustSameSpaceParametersForCandidates:withSystemState:andHistoryEventsAsc:andMiLoPrediction:andNearbyDevicesContainer:andDate:", v24, v14, v25, v17, v16, v15);

  -[IRServicePackageAdapterAppleTVControl internalContexts](self, "internalContexts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BE5B258];
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BE5B258]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "candidateResults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_2;
  v41[3] = &unk_2510452B8;
  v42 = v24;
  v30 = v24;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v41);

  v31 = objc_msgSend(v17, "miLoServiceQuality");
  if (!+[IRMiLoProvider isQualityValid:](IRMiLoProvider, "isQualityValid:", v31))
  {
    -[IRServicePackageAdapterAppleTVControl internalContexts](self, "internalContexts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "updateIsBannerClassificationUnavailable:", 1);

  }
  -[IRServicePackageAdapterAppleTVControl internalContexts](self, "internalContexts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", v27);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "appInFocusBundleID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "updateBundleIdentifier:", v36);

  return v38;
}

IRCandidateWrapper *__179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IRCandidateWrapper *v3;

  v2 = a2;
  v3 = -[IRCandidateWrapper initWithCandidate:]([IRCandidateWrapper alloc], "initWithCandidate:", v2);

  return v3;
}

void __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_3;
  v10[3] = &unk_2510441E0;
  v9 = v3;
  v11 = v9;
  objc_msgSend(v4, "firstWhere:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "sameSpaceBasedOnMiLo") & 1) != 0 || objc_msgSend(v5, "sameSpaceBasedOnUWB"))
  {
    objc_msgSend(v9, "setIsLockScreenControl:", 1);
    v6 = objc_msgSend(v9, "classification");
    objc_msgSend(v9, "classificationDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("(Lock Screen Control)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClassification:withDescription:", v6, v8);

  }
}

uint64_t __179__IRServicePackageAdapterAppleTVControl_generateClassificationsWithCandiatesContainer_systemState_historyEventsContainer_miloPrediction_nearbyDeviceContainer_fillInspection_date___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (id)_rules
{
  void *v2;
  IRRuleCandidate *v3;
  IRRuleCandidate *v4;
  IRRuleHistoryPattern *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IRRuleHistoryPattern *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IRRuleHistoryPattern *v17;
  void *v18;
  void *v19;
  IRRuleHistoryPattern *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  IRRuleHistoryPattern *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  IRRuleCandidate *v33;
  void *v34;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v3 = -[IRRuleCandidate initWithAttributeKey:requireAllNodes:]([IRRuleCandidate alloc], "initWithAttributeKey:requireAllNodes:", CFSTR("kIRRuleCandidateActiveRouteKey"), 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("AppleTVControl_Active_route"));

  v4 = -[IRRuleCandidate initWithAttributeKey:requireAllNodes:]([IRRuleCandidate alloc], "initWithAttributeKey:requireAllNodes:", CFSTR("kIRRuleCandidateProximityKey"), 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("AppleTVControl_Proximity"));

  v5 = objc_alloc_init(IRRuleHistoryPattern);
  +[IREventDO atvUserInteractionEvents](IREventDO, "atvUserInteractionEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setEventsToWatch:](v5, "setEventsToWatch:", v6);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v40[0] = CFSTR("kIRRuleHistoryPatternFilterIsSameMilo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setFilters:](v5, "setFilters:", v9);

  +[IRPreferences shared](IRPreferences, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appleTvCtrlRulesContinuityTimeIntervalInSeconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  -[IRRuleHistoryPattern setTimeInterval:](v5, "setTimeInterval:");

  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v5, "setMaxNumberOfEventsInHistory:", 1);
  -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v5, "setMinNumberOfEventsInHistory:", 1);
  -[IRRuleHistoryPattern setThreshold:](v5, "setThreshold:", 1.0);
  -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v5, "setCalculateScoreWithoutPortion:", 1);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("AppleTVControl_Continuity"));
  v12 = objc_alloc_init(IRRuleHistoryPattern);

  +[IREventDO atvUserInteractionEvents](IREventDO, "atvUserInteractionEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setEventsToWatch:](v12, "setEventsToWatch:", v13);

  v14 = (void *)MEMORY[0x24BDBCF20];
  v39 = CFSTR("kIRRuleHistoryPatternFilterIsSameMilo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setFilters:](v12, "setFilters:", v16);

  -[IRRuleHistoryPattern setTimeInterval:](v12, "setTimeInterval:", 2419200.0);
  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v12, "setMaxNumberOfEventsInHistory:", 5);
  -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v12, "setMinNumberOfEventsInHistory:", 2);
  -[IRRuleHistoryPattern setThreshold:](v12, "setThreshold:", 0.6);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("AppleTVControl_Long_term_pattern"));
  v17 = objc_alloc_init(IRRuleHistoryPattern);

  +[IREventDO atvUserInteractionEvents](IREventDO, "atvUserInteractionEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setEventsToWatch:](v17, "setEventsToWatch:", v18);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setFilters:](v17, "setFilters:", v19);

  -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:", 2419200.0);
  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", 0x7FFFFFFFLL);
  -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v17, "setMinNumberOfEventsInHistory:", 1);
  -[IRRuleHistoryPattern setThreshold:](v17, "setThreshold:", 1.0);
  -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v17, "setCalculateScoreWithoutPortion:", 1);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("AppleTVControl_Candidate_been_used"));
  v20 = objc_alloc_init(IRRuleHistoryPattern);

  +[IREventDO atvUserInteractionEvents](IREventDO, "atvUserInteractionEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setEventsToWatch:](v20, "setEventsToWatch:", v21);

  v22 = (void *)MEMORY[0x24BDBCF20];
  v38 = CFSTR("kIRRuleHistoryPatternFilterIsSameLoi");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setFilters:](v20, "setFilters:", v24);

  -[IRRuleHistoryPattern setTimeInterval:](v20, "setTimeInterval:", 2419200.0);
  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v20, "setMaxNumberOfEventsInHistory:", 0x7FFFFFFFLL);
  -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v20, "setMinNumberOfEventsInHistory:", 1);
  -[IRRuleHistoryPattern setThreshold:](v20, "setThreshold:", 2147483650.0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("AppleTVControl_Most_used_in_LOI"));
  v25 = objc_alloc_init(IRRuleHistoryPattern);

  v26 = (void *)MEMORY[0x24BDBCF20];
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setEventsToWatch:](v25, "setEventsToWatch:", v29);

  v30 = (void *)MEMORY[0x24BDBCF20];
  v36 = CFSTR("kIRRuleHistoryPatternFilterIsSameDay");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setFilters:](v25, "setFilters:", v32);

  -[IRRuleHistoryPattern setTimeInterval:](v25, "setTimeInterval:", 86400.0);
  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v25, "setMaxNumberOfEventsInHistory:", 0x7FFFFFFFLL);
  -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v25, "setMinNumberOfEventsInHistory:", 2);
  -[IRRuleHistoryPattern setThreshold:](v25, "setThreshold:", 2.0);
  -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v25, "setCalculateScoreWithoutPortion:", 1);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day"));
  v33 = -[IRRuleCandidate initWithAttributeKey:requireAllNodes:]([IRRuleCandidate alloc], "initWithAttributeKey:requireAllNodes:", CFSTR("kIRRuleCandidateAppleTVControlUserRejectedInLastDayWithoutPickerChoiceKey"), 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v33, CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"));

  v34 = (void *)objc_msgSend(v2, "copy");
  return v34;
}

- (BOOL)_outputRulesToContext:(id)a3 candidatesContainer:(id)a4 fillInspection:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  IRContextWrapper *v10;
  void *v11;
  IRContextWrapper *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  IRContextWrapper *v25;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRContextWrapper initWithName:defaultClassification:]([IRContextWrapper alloc], "initWithName:defaultClassification:", CFSTR("AppleTVControl"), 0);
  objc_msgSend(v8, "candidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __98__IRServicePackageAdapterAppleTVControl__outputRulesToContext_candidatesContainer_fillInspection___block_invoke;
  v24[3] = &unk_251044F20;
  v12 = v10;
  v25 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v24);

  -[IRServicePackageAdapterAppleTVControl _evaluateOutputRules:contextWrapper:](self, "_evaluateOutputRules:contextWrapper:", v9, v12);
  -[IRServicePackageAdapterAppleTVControl _classifyContext:](self, "_classifyContext:", v12);
  -[IRContextWrapper context](v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "candidateResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRServicePackageAdapterAppleTVControl internalContexts](self, "internalContexts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE5B258];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE5B258]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "candidateResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "isEqual:", v18);

  if ((v19 & 1) == 0)
  {
    -[IRServicePackageAdapterAppleTVControl internalContexts](self, "internalContexts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, v16);

  }
  if (v5)
  {
    -[IRContextWrapper policyInspection](v12, "policyInspection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRServicePackageAdapterAppleTVControl internalPolicyInspections](self, "internalPolicyInspections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v16);

  }
  return v19 ^ 1;
}

void __98__IRServicePackageAdapterAppleTVControl__outputRulesToContext_candidatesContainer_fillInspection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRCandidateDO candidateFromCandidateDO:](IRCandidateDO, "candidateFromCandidateDO:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCandidate:logOrderOfExecution:", v3, 0);

}

- (void)_evaluateOutputRules:(id)a3 contextWrapper:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_msgSend(a4, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke;
  v8[3] = &unk_251044F48;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke_2;
  v6[3] = &unk_2510452E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __77__IRServicePackageAdapterAppleTVControl__evaluateOutputRules_contextWrapper___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "candidateResult");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidateIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateRuleOutputWithCandidateIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setEvaluation:forRuleKey:", v9, v6);
}

- (void)_classifyContext:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__IRServicePackageAdapterAppleTVControl__classifyContext___block_invoke;
  v5[3] = &unk_251044F48;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __58__IRServicePackageAdapterAppleTVControl__classifyContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_autoRouteClassificationForCandidate:forClassificationEvaluated:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_oneTapClassificationForCandidate:forClassificationEvaluated:", v13, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isValid"))
    {
      objc_msgSend(v4, "detailedDesc");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClassification:withDescription:", 3, v5);
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "_filteredClassificationForCandidate:forClassificationEvaluated:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isValid"))
    {
      objc_msgSend(v5, "detailedDesc");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = v13;
      v8 = 1;
      v9 = v6;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_topOfListClassificationForCandidate:forClassificationEvaluated:", v13, 2);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString isValid](v6, "isValid"))
      {
        -[__CFString detailedDesc](v6, "detailedDesc");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_reasonsForRejectingAutoRouteOrOneTapClassificationForCandidate:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(":%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setClassification:withDescription:", 2, v12);

LABEL_11:
        goto LABEL_12;
      }
      v9 = CFSTR("No classification rules were satisfied");
      v7 = v13;
      v8 = 0;
    }
    objc_msgSend(v7, "setClassification:withDescription:", v8, v9);
    goto LABEL_11;
  }
  objc_msgSend(v3, "detailedDesc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClassification:withDescription:", 4, v4);
LABEL_13:

}

- (id)_reasonsForRejectingAutoRouteOrOneTapClassificationForCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;

  v3 = a3;
  objc_msgSend(v3, "ruleInspections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLean");

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("[Rejection]");
  }
  else
  {
    objc_msgSend(v3, "ruleInspections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "evaluation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLean");

    if (!v12)
    {
      v13 = &stru_251046168;
      goto LABEL_7;
    }
    v8 = CFSTR("[Rejection No Picker]");
  }
  objc_msgSend(&stru_251046168, "stringByAppendingString:", v8);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (id)_autoRoutePositiveRulesClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v5;
  IRServicePackageAdapterClassification *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = objc_alloc_init(IRServicePackageAdapterClassification);
  objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:", a4, CFSTR("AppleTVControl_Continuity"), CFSTR("Positive"));
  objc_msgSend(v5, "ruleInspections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Continuity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "evaluation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasBoolean");

  if (v10)
  {
    objc_msgSend(v5, "ruleInspections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("AppleTVControl_Continuity");
LABEL_5:
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "evaluation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRServicePackageAdapterClassification setIsValid:](v6, "setIsValid:", objc_msgSend(v19, "BOOLean"));

    -[IRServicePackageAdapterClassification setDetailedDesc:](v6, "setDetailedDesc:", v13);
    goto LABEL_6;
  }
  objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:", a4, CFSTR("AppleTVControl_Long_term_pattern"), CFSTR("Positive"));
  objc_msgSend(v5, "ruleInspections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Long_term_pattern"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "evaluation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasBoolean");

  if (v17)
  {
    objc_msgSend(v5, "ruleInspections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("AppleTVControl_Long_term_pattern");
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)_topOfListClassificationPositiveRulesForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v5;
  IRServicePackageAdapterClassification *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = objc_alloc_init(IRServicePackageAdapterClassification);
  objc_msgSend(v5, "ruleInspections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Active_route"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "evaluation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:andReturn:", a4, CFSTR("AppleTVControl_Active_route"), CFSTR("Conditional"), objc_msgSend(v9, "BOOLean"));

  if (v10)
  {
    -[IRServicePackageAdapterClassification setIsValid:](v6, "setIsValid:", 1);
    v11 = CFSTR("AppleTVControl_Active_route");
LABEL_8:
    -[IRServicePackageAdapterClassification setDetailedDesc:](v6, "setDetailedDesc:", v11);
    goto LABEL_9;
  }
  objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:", a4, CFSTR("AppleTVControl_Proximity"), CFSTR("Positive"));
  objc_msgSend(v5, "ruleInspections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Proximity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "evaluation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasBoolean");

  if (v15)
  {
    objc_msgSend(v5, "ruleInspections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v11 = CFSTR("AppleTVControl_Proximity");
LABEL_7:
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "evaluation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRServicePackageAdapterClassification setIsValid:](v6, "setIsValid:", objc_msgSend(v23, "BOOLean"));

    goto LABEL_8;
  }
  objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:", a4, CFSTR("AppleTVControl_Most_used_in_LOI"), CFSTR("Positive"));
  objc_msgSend(v5, "ruleInspections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Most_used_in_LOI"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "evaluation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hasBoolean");

  if (v21)
  {
    objc_msgSend(v5, "ruleInspections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v11 = CFSTR("AppleTVControl_Most_used_in_LOI");
    goto LABEL_7;
  }
LABEL_9:

  return v6;
}

- (id)_autoRouteClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v6;
  IRServicePackageAdapterClassification *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  IRServicePackageAdapterClassification *v16;
  IRServicePackageAdapterClassification *v17;

  v6 = a3;
  v7 = objc_alloc_init(IRServicePackageAdapterClassification);
  objc_msgSend(v6, "logOrderOfExecution:withRuleKey:ruleType:", a4, CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day"), CFSTR("Negative"));
  objc_msgSend(v6, "ruleInspections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "evaluation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLean");

  if (v11)
    goto LABEL_3;
  objc_msgSend(v6, "logOrderOfExecution:withRuleKey:ruleType:", a4, CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"), CFSTR("Negative"));
  objc_msgSend(v6, "ruleInspections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Candidate_was_rejected_in_last_day_no_picker"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "evaluation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLean");

  if (v15)
  {
LABEL_3:
    v16 = v7;
  }
  else
  {
    -[IRServicePackageAdapterAppleTVControl _autoRoutePositiveRulesClassificationForCandidate:forClassificationEvaluated:](self, "_autoRoutePositiveRulesClassificationForCandidate:forClassificationEvaluated:", v6, a4);
    v16 = (IRServicePackageAdapterClassification *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  return v17;
}

- (id)_oneTapClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  return objc_alloc_init(IRServicePackageAdapterClassification);
}

- (id)_topOfListClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v6;
  IRServicePackageAdapterClassification *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = objc_alloc_init(IRServicePackageAdapterClassification);
  -[IRServicePackageAdapterAppleTVControl _autoRoutePositiveRulesClassificationForCandidate:forClassificationEvaluated:](self, "_autoRoutePositiveRulesClassificationForCandidate:forClassificationEvaluated:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isValid") || objc_msgSend(v8, "isValid"))
  {
    v9 = v8;
  }
  else
  {
    -[IRServicePackageAdapterAppleTVControl _topOfListClassificationPositiveRulesForCandidate:forClassificationEvaluated:](self, "_topOfListClassificationPositiveRulesForCandidate:forClassificationEvaluated:", v6, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)_filteredClassificationForCandidate:(id)a3 forClassificationEvaluated:(int64_t)a4
{
  id v5;
  IRServicePackageAdapterClassification *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_alloc_init(IRServicePackageAdapterClassification);
  objc_msgSend(v5, "ruleInspections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("AppleTVControl_Candidate_been_used");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleTVControl_Candidate_been_used"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "evaluation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "logOrderOfExecution:withRuleKey:ruleType:andReturn:", a4, CFSTR("AppleTVControl_Candidate_been_used"), CFSTR("Conditional"), objc_msgSend(v10, "BOOLean"));

  if ((a4 & 1) == 0)
  {
    -[IRServicePackageAdapterClassification setIsValid:](v6, "setIsValid:", 1);
    v8 = CFSTR("Candidate was never used");
  }
  -[IRServicePackageAdapterClassification setDetailedDesc:](v6, "setDetailedDesc:", v8);
  return v6;
}

- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 forCandidateIdentifier:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "historyEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") && objc_msgSend(v6, "isEqual:", v8))
  {
    objc_msgSend(v7, "historyEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)filterHistory:(id)a3 withCandidatesContainer:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  IRHistoryEventsContainerDO *v39;
  void *v40;
  IRHistoryEventsContainerDO *v41;
  id v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v43 = v4;
  objc_msgSend(v4, "historyEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[IREventDO atvUserInteractionEvents](IREventDO, "atvUserInteractionEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compactMap:", &__block_literal_global_72);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "event");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v13, "eventType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v45, "containsObject:", v14);

      if (v15)
      {
        v16 = v10;
        while (v16 < objc_msgSend(v7, "count"))
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "date");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v20);
          v22 = v21;
          +[IRPreferences shared](IRPreferences, "shared");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "appleTvCtrlEventsTimeIntervalThreshold");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v26 = v25;

          if (v22 >= v26)
            break;
          v27 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "objectAtIndexedSubscript:", v16);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "event");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "numberWithLongLong:", objc_msgSend(v29, "eventType"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v45, "containsObject:", v30);

          ++v16;
          if (v31)
          {
            objc_msgSend(v44, "addIndex:", v9);
            break;
          }
        }
      }
      ++v9;
      ++v10;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }
  objc_msgSend(v7, "removeObjectsAtIndexes:", v44);
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v34 = (void *)MEMORY[0x24BDD16E0];
    v35 = v33;
    objc_msgSend(v43, "historyEvents");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v47 = "#service-package-adapter-apple-tv-control, ";
    v48 = 2112;
    v49 = v32;
    v50 = 2112;
    v51 = v37;
    v52 = 2112;
    v53 = v38;
    _os_log_impl(&dword_23FFBA000, v35, OS_LOG_TYPE_INFO, "%s[%@], Number of history events before filtering = %@, after filtering = %@", buf, 0x2Au);

  }
  v39 = [IRHistoryEventsContainerDO alloc];
  v40 = (void *)objc_msgSend(v7, "copy");
  v41 = -[IRHistoryEventsContainerDO initWithHistoryEvents:](v39, "initWithHistoryEvents:", v40);

  return v41;
}

uint64_t __79__IRServicePackageAdapterAppleTVControl_filterHistory_withCandidatesContainer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a2, "eventType"));
}

- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsAsc:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke;
  v17[3] = &unk_251043C90;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v17);

  objc_msgSend(v7, "candidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2;
  v15[3] = &unk_251043CB8;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "firstWhere:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = v13 != 0;

  return (char)v10;
}

void __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;
  +[IRPreferences shared](IRPreferences, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidateLastUsedThrForMiLoLowLatancyPowerOpt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v9 >= v13)
  {
    *a4 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v18, "systemState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isMiLoSupportedLocation") & 1) == 0)
  {
LABEL_5:

LABEL_7:
    v16 = v18;
    goto LABEL_8;
  }
  objc_msgSend(v18, "candidateIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v18;
  if (v15)
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v18, "candidateIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v14);
    goto LABEL_5;
  }
LABEL_8:

}

uint64_t __85__IRServicePackageAdapterAppleTVControl_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)shouldConsiderEventForSignificantBundles:(id)a3
{
  return 0;
}

- (id)getSignificantBundlesWithCandidates:(id)a3 fromHistory:(id)a4
{
  return (id)objc_opt_new();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPolicyInspections, 0);
  objc_storeStrong((id *)&self->_internalContexts, 0);
}

- (id)uiAnalyticsWithEvent:(id)a3 forCandidateIdentifier:(id)a4 systemStateManager:(id)a5 candidatesContainer:(id)a6 inspections:(id)a7 statisticsManager:(id)a8 service:(id)a9 historyEventsContainer:(id)a10
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  __CFString *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  __CFString *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  __CFString *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  __CFString *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD v122[21];
  _QWORD v123[23];

  v123[21] = *MEMORY[0x24BDAC8D0];
  v81 = a3;
  v15 = a4;
  v85 = a5;
  v84 = a6;
  v16 = a7;
  v82 = a8;
  v83 = a9;
  v61 = a10;
  v60 = v16;
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE5B258]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v83, "clientIdentifier");
    v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = &stru_251046168;
  }

  objc_msgSend(v81, "eventType");
  IRAppleTVControlEventTypeToString();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "canUse");

  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v20, "confidence");

  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v21, "confidenceReasonBitmap");

  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scores");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v23, "count");

  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (id)objc_msgSend(v24, "miLoServiceQuality");

  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v25, "miLoServiceQualityReasonBitmap");

  objc_msgSend(v85, "miloProviderLslPredictionResults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predictionTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceNow");
  v29 = v28;

  objc_msgSend(v84, "candidates");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v30, "count");

  v118 = 0;
  v119 = &v118;
  v120 = 0x2020000000;
  v121 = 0;
  v114 = 0;
  v115 = &v114;
  v116 = 0x2020000000;
  v117 = 0;
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v113 = 0;
  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__9;
  v104 = __Block_byref_object_dispose__9;
  v105 = &stru_251046168;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__9;
  v98 = __Block_byref_object_dispose__9;
  v99 = &stru_251046168;
  objc_msgSend(v80, "candidates");
  v31 = objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x24BDAC760];
  v86[1] = 3221225472;
  v86[2] = __198__IRServicePackageAdapterAppleTVControl_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke;
  v86[3] = &unk_2510455F0;
  v88 = &v118;
  v89 = &v114;
  v90 = &v110;
  v91 = &v106;
  v77 = v15;
  v87 = v77;
  v92 = &v100;
  v93 = &v94;
  objc_msgSend((id)v31, "enumerateObjectsUsingBlock:", v86);

  objc_msgSend(v84, "candidateForCandidateIdentifier:", v77);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "nodes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v31) = (unint64_t)objc_msgSend(v32, "count") > 1;

  if ((v31 & 1) != 0)
  {
    v33 = CFSTR("Group");
  }
  else
  {
    objc_msgSend(v66, "nodes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "avOutputDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v66, "nodes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "allObjects");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "avOutputDevice");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      IRAVOutputDeviceTypeToString(objc_msgSend(v41, "deviceType"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v33 = &stru_251046168;
  }
  v68 = (void *)v33;
LABEL_10:
  objc_msgSend(v82, "timeToBannerInMilliSeconds");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(v82, "timeToBannerInMilliSeconds");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v43, "unsignedIntegerValue");

  }
  else
  {
    v58 = 0;
  }

  +[IRPreferences shared](IRPreferences, "shared");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "mobileAssetVersion");
  v45 = objc_claimAutoreleasedReturnValue();

  if (v45)
    v46 = (const __CFString *)v45;
  else
    v46 = &stru_251046168;
  v67 = (__CFString *)v46;
  v122[0] = CFSTR("UI_Event_Client_Identifier");
  v122[1] = CFSTR("UI_Event_Type");
  v123[0] = v78;
  v123[1] = v79;
  v122[2] = CFSTR("UI_Event_Count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1, v58);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v123[2] = v76;
  v122[3] = CFSTR("UI_Event_MiLo_Available");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v123[3] = v75;
  v122[4] = CFSTR("UI_Event_MiLo_Confidence");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v123[4] = v74;
  v122[5] = CFSTR("UI_Event_Milo_Confidence_Reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v123[5] = v72;
  v122[6] = CFSTR("UI_Event_Milo_N_LSL_Items");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v123[6] = v70;
  v122[7] = CFSTR("UI_Event_Milo_Quality");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v64);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v123[7] = v47;
  v122[8] = CFSTR("UI_Event_Milo_Quality_Reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v63);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v123[8] = v48;
  v122[9] = CFSTR("UI_Event_Milo_Time_Since_Prediction");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)fabs(v29));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v123[9] = v49;
  v122[10] = CFSTR("UI_Event_N_MiLo_Models");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v123[10] = v50;
  v122[11] = CFSTR("UI_Event_N_Candidates");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v62);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v123[11] = v51;
  v122[12] = CFSTR("UI_Event_N_Candidates_Classified_AutoRoute");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v119[3]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v123[12] = v52;
  v122[13] = CFSTR("UI_Event_N_Candidates_Classified_OneTap");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v115[3]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v123[13] = v53;
  v122[14] = CFSTR("UI_Event_N_Candidates_Classified_TopOfList");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v111[3]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v123[14] = v54;
  v122[15] = CFSTR("UI_Event_N_Candidates_Classified_Filter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v107[3]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v123[15] = v55;
  v122[16] = CFSTR("UI_Event_Selected_Candidate_Classification");
  v123[16] = v101[5];
  v122[17] = CFSTR("UI_Event_Selected_Candidate_Rule_Reason");
  v123[17] = v95[5];
  v123[18] = v68;
  v122[18] = CFSTR("UI_Event_Selected_Candidate_Type");
  v122[19] = CFSTR("UI_Event_Time_To_Banner_Milli_Seconds");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v59);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v122[20] = CFSTR("UI_Event_Mobile_Asset_Version");
  v123[19] = v56;
  v123[20] = v67;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 21);
  v65 = (id)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v118, 8);

  return v65;
}

void __198__IRServicePackageAdapterAppleTVControl_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(a2, "inspectionServicePackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_14;
  v15 = v3;
  if (objc_msgSend(v3, "classification") == 4)
  {
    v4 = a1[5];
LABEL_10:
    ++*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
    goto LABEL_11;
  }
  if (objc_msgSend(v15, "classification") == 3)
  {
    v4 = a1[6];
    goto LABEL_10;
  }
  if (objc_msgSend(v15, "classification") == 2)
  {
    v4 = a1[7];
    goto LABEL_10;
  }
  if (objc_msgSend(v15, "classification") == 1)
  {
    v4 = a1[8];
    goto LABEL_10;
  }
LABEL_11:
  v5 = (void *)a1[4];
  objc_msgSend(v15, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqual:", v7);

  v3 = v15;
  if ((_DWORD)v5)
  {
    objc_msgSend(v15, "classification");
    IRCandidateClassificationToString();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[9] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v15, "classificationDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[10] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v3 = v15;
    v14 = *(_QWORD *)(a1[10] + 8);
    if (!*(_QWORD *)(v14 + 40))
    {
      *(_QWORD *)(v14 + 40) = &stru_251046168;

      v3 = v15;
    }
  }
LABEL_14:

}

@end
