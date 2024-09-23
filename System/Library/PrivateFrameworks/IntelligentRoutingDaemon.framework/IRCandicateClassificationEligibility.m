@implementation IRCandicateClassificationEligibility

+ (int64_t)classificationEligibilityForCandidate:(id)a3 withHistoryEventsAsc:(id)a4 systemState:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "candidateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandicateClassificationEligibility _generateSettingsStruct:](IRCandicateClassificationEligibility, "_generateSettingsStruct:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__13;
  v36 = __Block_byref_object_dispose__13;
  v37 = (id)objc_opt_new();
  objc_msgSend(v11, "initialStateIsOneTap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
    objc_msgSend((id)v33[5], "setEligibilityState:", 1);
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __111__IRCandicateClassificationEligibility_classificationEligibilityForCandidate_withHistoryEventsAsc_systemState___block_invoke;
  v24[3] = &unk_251045AA0;
  v16 = v10;
  v25 = v16;
  v17 = v9;
  v26 = v17;
  v18 = v14;
  v27 = v18;
  v19 = v8;
  v28 = v19;
  v20 = v15;
  v29 = v20;
  v31 = &v32;
  v21 = v11;
  v30 = v21;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);
  v22 = +[IRCandicateClassificationEligibilityStateMachine _classificationFromEligibility:](IRCandicateClassificationEligibilityStateMachine, "_classificationFromEligibility:", objc_msgSend((id)v33[5], "eligibilityState"));

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __111__IRCandicateClassificationEligibility_classificationEligibilityForCandidate_withHistoryEventsAsc_systemState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v27 = v5;
  objc_msgSend(v5, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6
    && (+[IRRuleHistoryPattern filterHistoryBySimilarApp:withSystemState:](IRRuleHistoryPattern, "filterHistoryBySimilarApp:withSystemState:", v27, *(_QWORD *)(a1 + 40))|| +[IRRuleHistoryPattern filterHistoryByBrokeredDeviceScan:](IRRuleHistoryPattern, "filterHistoryByBrokeredDeviceScan:", v27)))
  {
    objc_msgSend(v27, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[IRCandicateClassificationEligibility _eligibilityTypeFromEvent:](IRCandicateClassificationEligibility, "_eligibilityTypeFromEvent:", v8);

    v10 = *(void **)(a1 + 48);
    objc_msgSend(v27, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11);

    if ((_DWORD)v10)
    {
      v12 = 3;
      while (++a3 < (unint64_t)objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v15);
        v17 = v16;
        +[IRPreferences shared](IRPreferences, "shared");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pickerAutoSelectToPicketChoiceMinInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        if (v17 > v21)
        {

          break;
        }
        objc_msgSend(v13, "candidateIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "candidateIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23);

        if ((v24 & 1) != 0)
        {

        }
        else
        {
          v25 = *(void **)(a1 + 64);
          objc_msgSend(v13, "event");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v25) = objc_msgSend(v25, "isEqual:", v26);

          if ((v25 & 1) != 0)
            goto LABEL_14;
        }
      }
    }
    v12 = v9;
LABEL_14:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "runWithEventType:smSettings:", v12, *(_QWORD *)(a1 + 72));
  }

}

+ (int64_t)_eligibilityTypeFromEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = a3;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqual:", v5) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v3, "isEqual:", v14) & 1) != 0 || (objc_msgSend(v3, "isEqual:", v7) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v3, "isEqual:", v8) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v3, "isEqual:", v9) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v3, "isEqual:", v10) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v3, "isEqual:", v11) & 1) != 0)
    {
      v6 = 6;
    }
    else if (objc_msgSend(v3, "isEqual:", v12))
    {
      v6 = 7;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (id)_generateSettingsStruct:(id)a3
{
  id v3;
  IREligibilitySettings *v4;
  int v5;
  void *v6;
  void *v7;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  v4 = objc_alloc_init(IREligibilitySettings);
  v5 = objc_msgSend(v3, "isFirstPartyDevice");

  +[IRPreferences shared](IRPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "uprankToOneTapEligibilityThreshold1stParty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setUpRankToOneTapThr:](v4, "setUpRankToOneTapThr:", v8);

    +[IRPreferences shared](IRPreferences, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uprankToAutorouteEligibilityThreshold1stParty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setUprankToAutorouteThr:](v4, "setUprankToAutorouteThr:", v10);

    +[IRPreferences shared](IRPreferences, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "downrankToNoneEligibilityThreshold1stParty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setDownrankToNoneThr:](v4, "setDownrankToNoneThr:", v12);

    +[IRPreferences shared](IRPreferences, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setDownrankToNoneWithIgnoringThr:](v4, "setDownrankToNoneWithIgnoringThr:", v14);

    +[IRPreferences shared](IRPreferences, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "downrankToOneTapEligibilityThreshold1stParty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setDownrankToOneTapThr:](v4, "setDownrankToOneTapThr:", v16);

    +[IRPreferences shared](IRPreferences, "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "eligibilityInitStateIsOneTap1stParty");
  }
  else
  {
    objc_msgSend(v6, "uprankToOneTapEligibilityThreshold3rdParty");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setUpRankToOneTapThr:](v4, "setUpRankToOneTapThr:", v18);

    +[IRPreferences shared](IRPreferences, "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uprankToAutorouteEligibilityThreshold3rdParty");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setUprankToAutorouteThr:](v4, "setUprankToAutorouteThr:", v20);

    +[IRPreferences shared](IRPreferences, "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "downrankToNoneEligibilityThreshold3rdParty");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setDownrankToNoneThr:](v4, "setDownrankToNoneThr:", v22);

    +[IRPreferences shared](IRPreferences, "shared");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setDownrankToNoneWithIgnoringThr:](v4, "setDownrankToNoneWithIgnoringThr:", v24);

    +[IRPreferences shared](IRPreferences, "shared");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "downrankToOneTapEligibilityThreshold3rdParty");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IREligibilitySettings setDownrankToOneTapThr:](v4, "setDownrankToOneTapThr:", v26);

    +[IRPreferences shared](IRPreferences, "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "eligibilityInitStateIsOneTap3rdParty");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IREligibilitySettings setInitialStateIsOneTap:](v4, "setInitialStateIsOneTap:", v27);

  +[IRPreferences shared](IRPreferences, "shared");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "brokeredUseScansForEligibilityOfMainDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IREligibilitySettings setUseBrokeredScanForMain:](v4, "setUseBrokeredScanForMain:", objc_msgSend(v29, "BOOLValue"));

  +[IRPreferences shared](IRPreferences, "shared");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "brokeredUseScansForEligibilityOfSecondaryDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[IREligibilitySettings setUseBrokeredScanForSecondary:](v4, "setUseBrokeredScanForSecondary:", objc_msgSend(v31, "BOOLValue"));

  return v4;
}

@end
