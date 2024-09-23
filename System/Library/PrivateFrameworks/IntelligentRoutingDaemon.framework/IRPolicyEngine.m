@implementation IRPolicyEngine

- (NSString)lastEventsString
{
  return self->_lastEventsString;
}

- (NSDictionary)contexts
{
  void *v2;
  void *v3;

  -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setLastEventsString:(id)a3
{
  objc_storeStrong((id *)&self->_lastEventsString, a3);
}

- (IRServicePackageAdapter)servicePackageAdapter
{
  return self->_servicePackageAdapter;
}

- (id)_lastEventsStringFromHistoryContainer:(id)a3 candidatesContainer:(id)a4 miloResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, unint64_t, _BYTE *);
  void *v30;
  id v31;
  id v32;
  id v33;
  IRPolicyEngine *v34;
  id v35;
  id v36;
  uint64_t v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v12 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v12, "setNumberStyle:", 1);
  objc_msgSend(v12, "setMaximumFractionDigits:", 2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "historyEvents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") < 0xF)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v8, "historyEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") - 15;

  }
  objc_msgSend(v8, "historyEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __88__IRPolicyEngine__lastEventsStringFromHistoryContainer_candidatesContainer_miloResults___block_invoke;
  v30 = &unk_251044A90;
  v36 = v13;
  v37 = v16;
  v31 = v11;
  v32 = v12;
  v33 = v10;
  v34 = self;
  v35 = v9;
  v18 = v13;
  v19 = v9;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", 2, &v27);

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Last %@ events"), &unk_25105EC00, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v18, v24, 0, 0);

  objc_msgSend(v23, "build");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (IRPolicyEngine)initWithServicePackage:(int64_t)a3
{
  IRPolicyEngine *v4;
  IRPolicyEngine *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IRPolicyEngine;
  v4 = -[IRPolicyEngine init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[IRPolicyEngine setServicePackage:](v4, "setServicePackage:", a3);
    IRCreateServicePackageAdapter(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyEngine setServicePackageAdapter:](v5, "setServicePackageAdapter:", v6);

    v7 = (void *)objc_opt_new();
    -[IRPolicyEngine setBundlesWithSignificantInteraction:](v5, "setBundlesWithSignificantInteraction:", v7);

  }
  return v5;
}

- (BOOL)updateBundlesWithSignificantInteractionForEvent:(id)a3 candidatesContainer:(id)a4 historyEventsContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && (-[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "shouldConsiderEventForSignificantBundles:", v8),
        v11,
        !v12))
  {
    v17 = 0;
  }
  else
  {
    -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getSignificantBundlesWithCandidates:fromHistory:", v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[IRPolicyEngine bundlesWithSignificantInteraction](self, "bundlesWithSignificantInteraction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v14);

    if ((v16 & 1) == 0)
      -[IRPolicyEngine setBundlesWithSignificantInteraction:](self, "setBundlesWithSignificantInteraction:", v14);
    v17 = v16 ^ 1;

  }
  return v17;
}

- (BOOL)updateContextWithDate:(id)a3 candidatesContainer:(id)a4 historyEventsContainer:(id)a5 systemState:(id)a6 miloProviderLslPredictionResults:(id)a7 nearbyDeviceContainer:(id)a8 fillInspection:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filterHistory:withCandidatesContainer:", v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRPolicyEngine _lastEventsStringFromHistoryContainer:candidatesContainer:miloResults:](self, "_lastEventsStringFromHistoryContainer:candidatesContainer:miloResults:", v22, v19, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyEngine setLastEventsString:](self, "setLastEventsString:", v23);

  -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "generateClassificationsWithCandiatesContainer:systemState:historyEventsContainer:miloPrediction:nearbyDeviceContainer:fillInspection:date:", v19, v17, v22, v16, v15, a9, v20);

  return v25;
}

- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 forCandidateIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldRejectEvent:withHistoryEventsContainer:forCandidateIdentifier:", v10, v9, v8);

  return v12;
}

- (NSDictionary)policyInspections
{
  void *v2;
  void *v3;

  -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "policyInspections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[IRPolicyEngine servicePackageAdapter](self, "servicePackageAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "historyEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "shouldAskForLowLatencyMiLo:historyEventsAsc:", v7, v9);
  return (char)v6;
}

void __88__IRPolicyEngine__lastEventsStringFromHistoryContainer_candidatesContainer_miloResults___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v7 = a2;
  if (*(_QWORD *)(a1 + 80) >= a3)
    *a4 = 1;
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x24BDBCF38];
  v36 = v7;
  objc_msgSend(v7, "systemState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZoneForSecondsFromGMT:", objc_msgSend(v10, "timeZoneSeconds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v11);

  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = *(void **)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  objc_msgSend(v36, "miloPredictionEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predictionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "miloPredictionEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scoreForPredictionId:andLabel:", v16, v18);
  objc_msgSend(v12, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromNumber:", v19);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD17C8];
  v21 = *(void **)(a1 + 32);
  objc_msgSend(v36, "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(*(id *)(a1 + 56), "servicePackage");
  objc_msgSend(v36, "event");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "eventType");
  if (v23)
    IRAppleTVControlEventTypeToString();
  else
    IRMediaEventTypeToString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "event");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "candidateIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(void **)(a1 + 64);
  objc_msgSend(v36, "candidateIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "candidateNameForCandidateIdentifier:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("date: %@, event: %@, appInFocus: %@, candidateIdentifier: %@, candidateName: %@, miloScore: %@"), v22, v24, v26, v27, v30, v35);
  v31 = (void *)v22;
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "addObject:", v32);
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (void)setServicePackage:(int64_t)a3
{
  self->_servicePackage = a3;
}

- (NSSet)bundlesWithSignificantInteraction
{
  return self->_bundlesWithSignificantInteraction;
}

- (void)setBundlesWithSignificantInteraction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setServicePackageAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_servicePackageAdapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicePackageAdapter, 0);
  objc_storeStrong((id *)&self->_lastEventsString, 0);
  objc_storeStrong((id *)&self->_bundlesWithSignificantInteraction, 0);
}

@end
