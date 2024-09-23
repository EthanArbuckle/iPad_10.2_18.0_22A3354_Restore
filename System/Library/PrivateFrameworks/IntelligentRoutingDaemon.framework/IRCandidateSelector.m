@implementation IRCandidateSelector

- (id)selectFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[IRCandidateSelector _candidatesToSelectFrom:](self, "_candidatesToSelectFrom:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") > 1)
  {
    -[IRCandidateSelector _selectBasedOnContinuityFromCandidates:withSystemState:andHistoryEventsAsc:andDate:](self, "_selectBasedOnContinuityFromCandidates:withSystemState:andHistoryEventsAsc:andDate:", v14, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v15 = v16;
      objc_msgSend(v16, "setNominatedClassificationDesc:", CFSTR("{Continuity}"));
      -[IRCandidateSelector setCandidateSelectorReasonRecentlyUsed:](self, "setCandidateSelectorReasonRecentlyUsed:", 1);
    }
    else
    {
      -[IRCandidateSelector _selectBasedOnMostUsedSimilarAppFromCandidates:withSystemState:andHistoryEventsAsc:andDate:](self, "_selectBasedOnMostUsedSimilarAppFromCandidates:withSystemState:andHistoryEventsAsc:andDate:", v14, v11, v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v15 = v17;
        objc_msgSend(v17, "setNominatedClassificationDesc:", CFSTR("{Most used similar app}"));
        -[IRCandidateSelector setCandidateSelectorReasonMostlyUsedSimilarApp:](self, "setCandidateSelectorReasonMostlyUsedSimilarApp:", 1);
      }
      else
      {
        -[IRCandidateSelector _selectBasedOnMostUsedAnyAppFromCandidates:withSystemState:andHistoryEventsAsc:andDate:](self, "_selectBasedOnMostUsedAnyAppFromCandidates:withSystemState:andHistoryEventsAsc:andDate:", v14, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v15 = v18;
          objc_msgSend(v18, "setNominatedClassificationDesc:", CFSTR("{Most used any app}"));
          -[IRCandidateSelector setCandidateSelectorReasonMostlyUsedAnyApp:](self, "setCandidateSelectorReasonMostlyUsedAnyApp:", 1);
        }
        else
        {
          -[IRCandidateSelector _selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates:withSystemState:](self, "_selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates:withSystemState:", v14, v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v15 = v19;
            objc_msgSend(v19, "setNominatedClassificationDesc:", CFSTR("{Nearest used or same iCloud}"));
            -[IRCandidateSelector setCandidateSelectorReasonProximityWithHistoryOrSameICloud:](self, "setCandidateSelectorReasonProximityWithHistoryOrSameICloud:", 1);
          }
          else
          {
            -[IRCandidateSelector _selectBasedOnNearestRangeFromCandidates:](self, "_selectBasedOnNearestRangeFromCandidates:", v10);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v15 = v20;
              objc_msgSend(v20, "setNominatedClassificationDesc:", CFSTR("{Nearest}"));
              -[IRCandidateSelector setCandidateSelectorReasonProximity:](self, "setCandidateSelectorReasonProximity:", 1);
            }
            else
            {
              -[IRCandidateSelector _selectBasedOnMostRecentMainBrokeredDeviceFromCandidates:withSystemState:andHistoryEventsAsc:andDate:](self, "_selectBasedOnMostRecentMainBrokeredDeviceFromCandidates:withSystemState:andHistoryEventsAsc:andDate:", v14, v11, v12, v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v15 = v21;
                objc_msgSend(v21, "setNominatedClassificationDesc:", CFSTR("{Brokered Main Device First Use}"));
                -[IRCandidateSelector setCandidateSelectorReasonBrokeredMainDeviceFirstUse:](self, "setCandidateSelectorReasonBrokeredMainDeviceFirstUse:", 1);
              }
              else
              {
                dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = *MEMORY[0x24BE5B270];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
                {
                  v25 = 136315394;
                  v26 = "#tie-breaker, ";
                  v27 = 2112;
                  v28 = v22;
                  _os_log_impl(&dword_23FFBA000, v23, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Candidate selector error] selectFromCandidates should always select one candidate if we got here", (uint8_t *)&v25, 0x16u);
                }

                v15 = 0;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend(v14, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNominatedClassificationDesc:", CFSTR("{Single}"));
    -[IRCandidateSelector setCandidateSelectorReasonSingle:](self, "setCandidateSelectorReasonSingle:", 1);
  }

  return v15;
}

- (id)getSelectorReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("candidateSelectorReasonRecentlyUsed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonRecentlyUsed](self, "candidateSelectorReasonRecentlyUsed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("candidateSelectorReasonMostlyUsedSimilarApp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonMostlyUsedSimilarApp](self, "candidateSelectorReasonMostlyUsedSimilarApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("candidateSelectorReasonProximityWithHistoryOrSameICloud");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonProximityWithHistoryOrSameICloud](self, "candidateSelectorReasonProximityWithHistoryOrSameICloud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("candidateSelectorReasonProximity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonProximity](self, "candidateSelectorReasonProximity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("candidateSelectorReasonMostlyUsedAnyApp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonMostlyUsedAnyApp](self, "candidateSelectorReasonMostlyUsedAnyApp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("candidateSelectorReasonBrokeredMainDeviceFirstUse");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonBrokeredMainDeviceFirstUse](self, "candidateSelectorReasonBrokeredMainDeviceFirstUse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("candidateSelectorReasonSingle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCandidateSelector candidateSelectorReasonSingle](self, "candidateSelectorReasonSingle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)adjustClassificationForCandidateBasedOnNegativeInputs:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andMiloPrediction:(id)a6 andDate:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  int v18;
  int v19;
  void *v20;
  int v21;
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
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
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
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  int v54;
  int v55;
  _BOOL4 v56;
  int v57;
  _QWORD v58[8];
  _QWORD v59[10];

  v59[8] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  +[IRAirPlaySettings shared](IRAirPlaySettings, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAutoRoutingSettingEnabled");

  +[IRAirPlaySettings shared](IRAirPlaySettings, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isRoutePredictionSettingEnabled");

  LODWORD(v53) = objc_msgSend(v11, "isHeadphonesRoutedOrPredicted");
  if (v11)
    HIDWORD(v53) = objc_msgSend(v11, "isInsideAppInFocusWindow") ^ 1;
  else
    HIDWORD(v53) = 0;
  v57 = objc_msgSend(v12, "isTemporarilyUnavailable", v53);
  v18 = objc_msgSend(v11, "appInFocusWindowScreenUnlockEvent");
  if (objc_msgSend(v12, "canUse"))
    v19 = objc_msgSend(v12, "isInMotion");
  else
    v19 = 0;
  objc_msgSend(v10, "candidate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isBrokeredDevice");

  v56 = +[IRCandidateSelector _isPickerChoiceOverrideActiveAtDate:withSystemState:](IRCandidateSelector, "_isPickerChoiceOverrideActiveAtDate:withSystemState:", v13, v11);
  v22 = (void *)MEMORY[0x24BDBCED8];
  v58[0] = CFSTR("kRuleIsMiLoTemporarilyUnavailable");
  v58[1] = CFSTR("kRuleIsAutoRoutingSettingDisabled");
  v59[0] = MEMORY[0x24BDBD1C0];
  v59[1] = MEMORY[0x24BDBD1C0];
  v58[2] = CFSTR("kRuleIsRoutePredictionSettingDisabled");
  v58[3] = CFSTR("kIsHeadsetConnected");
  v59[2] = MEMORY[0x24BDBD1C0];
  v59[3] = MEMORY[0x24BDBD1C0];
  v58[4] = CFSTR("kIsOutsideAppLaunchWindow");
  v58[5] = CFSTR("kIsAppInFocusWindowScreenLockToUnlock");
  v59[4] = MEMORY[0x24BDBD1C0];
  v59[5] = MEMORY[0x24BDBD1C0];
  v58[6] = CFSTR("kIsBrokeredDevice");
  v58[7] = CFSTR("kIsPickerChoiceOverrideActive");
  v59[6] = MEMORY[0x24BDBD1C0];
  v59[7] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v15 & 1) != 0)
  {
    if (!v18)
      goto LABEL_9;
  }
  else
  {
    if (objc_msgSend(v10, "nominatedClassification") == 4)
      objc_msgSend(v10, "setNominatedClassification:", 3);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("[ARS Disabled]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v26);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kRuleIsAutoRoutingSettingDisabled"));
    if (!v18)
    {
LABEL_9:
      if (!v19)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  if (objc_msgSend(v10, "nominatedClassification") == 4)
    objc_msgSend(v10, "setNominatedClassification:", 3);
  objc_msgSend(v10, "nominatedClassificationDesc");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByAppendingString:", CFSTR("[App Window Unlock To Lock]"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNominatedClassificationDesc:", v28);

  objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kIsAppInFocusWindowScreenLockToUnlock"));
  if (!v19)
  {
LABEL_10:
    if (!v21)
      goto LABEL_31;
LABEL_21:
    if (objc_msgSend(v10, "nominatedClassification") == 4)
      objc_msgSend(v10, "setNominatedClassification:", 3);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingString:", CFSTR("[Brokered Device]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v32);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kIsBrokeredDevice"));
    if (objc_msgSend(v10, "sameSpaceBasedOnMiLo"))
    {
      +[IRPreferences shared](IRPreferences, "shared");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "candidateSelectorAllowSelectByMiLo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "BOOLValue");

    }
    else
    {
      v35 = 0;
    }
    if (objc_msgSend(v10, "sameSpaceBasedOnPDRFence"))
    {
      +[IRPreferences shared](IRPreferences, "shared");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "candidateSelectorAllowSelectByPDRFence");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "BOOLValue");

      if (((v38 | v35) & 1) != 0)
        goto LABEL_31;
    }
    else if ((v35 & 1) != 0)
    {
      goto LABEL_31;
    }
    objc_msgSend(v10, "setNominatedClassification:", 2);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByAppendingString:", CFSTR("[PDR Fence/MiLo Room Detection Disabled]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v40);

    goto LABEL_31;
  }
LABEL_18:
  if (objc_msgSend(v10, "nominatedClassification") == 4)
    objc_msgSend(v10, "setNominatedClassification:", 3);
  objc_msgSend(v10, "nominatedClassificationDesc");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringByAppendingString:", CFSTR("[MiLo In Motion]"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNominatedClassificationDesc:", v30);

  objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kIsMiLoInMotion"));
  if (v21)
    goto LABEL_21;
LABEL_31:
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v10, "setNominatedClassification:", 2);
    objc_msgSend(v10, "setIsCallToAction:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingString:", CFSTR("[RPS Disabled]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v42);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kRuleIsRoutePredictionSettingDisabled"));
  }
  if (v54)
  {
    objc_msgSend(v10, "setNominatedClassification:", 2);
    objc_msgSend(v10, "setIsCallToAction:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringByAppendingString:", CFSTR("[Headset Or AirPods]"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v44);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kIsHeadsetConnected"));
  }
  if (v55)
  {
    objc_msgSend(v10, "setNominatedClassification:", 2);
    objc_msgSend(v10, "setIsCallToAction:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringByAppendingString:", CFSTR("[Outside App Window]"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v46);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kIsOutsideAppLaunchWindow"));
  }
  if (v57)
  {
    objc_msgSend(v10, "setNominatedClassification:", 2);
    objc_msgSend(v10, "setIsCallToAction:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringByAppendingString:", CFSTR("[MiLo Temporarily Unavailable]"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v48);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kRuleIsMiLoTemporarilyUnavailable"));
  }
  if (v56)
  {
    objc_msgSend(v10, "setNominatedClassification:", 2);
    objc_msgSend(v10, "setIsCallToAction:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(v10, "nominatedClassificationDesc");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringByAppendingString:", CFSTR("[Picker Choice Override]"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNominatedClassificationDesc:", v50);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kIsPickerChoiceOverrideActive"));
  }
  v51 = (void *)objc_msgSend(v24, "copy");

  return v51;
}

- (id)_selectBasedOnContinuityFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  IRRuleHistoryPattern *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IRPreferences shared](IRPreferences, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidateSelectorIsContinuityEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v17 = objc_alloc_init(IRRuleHistoryPattern);
    +[IREventDO mediaUserInteractionEvents](IREventDO, "mediaUserInteractionEvents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setEventsToWatch:](v17, "setEventsToWatch:", v18);

    v19 = (void *)MEMORY[0x24BDBCF20];
    v26[0] = CFSTR("kIRRuleHistoryPatternFilterIsSimilarApp");
    v26[1] = CFSTR("kIRRuleHistoryPatternFilterOnlyTestedCandidates");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setFilters:](v17, "setFilters:", v21);

    +[IRPreferences shared](IRPreferences, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mediaRulesContinuityTimeIntervalInSeconds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:");

    -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", 1);
    -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v17, "setMinNumberOfEventsInHistory:", 1);
    -[IRRuleHistoryPattern setThreshold:](v17, "setThreshold:", 1.0);
    -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v17, "setCalculateScoreWithoutPortion:", 1);
    -[IRCandidateSelector _selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:](self, "_selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:", v10, v11, v12, v13, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_selectBasedOnMostUsedSimilarAppFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  IRRuleHistoryPattern *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IRPreferences shared](IRPreferences, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidateSelectorIsMostUsedSimilarAppEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v17 = objc_alloc_init(IRRuleHistoryPattern);
    +[IREventDO mediaUserInteractionEvents](IREventDO, "mediaUserInteractionEvents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setEventsToWatch:](v17, "setEventsToWatch:", v18);

    v19 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = CFSTR("kIRRuleHistoryPatternFilterIsSimilarApp");
    v28[1] = CFSTR("kIRRuleHistoryPatternFilterOnlyTestedCandidates");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setFilters:](v17, "setFilters:", v21);

    +[IRPreferences shared](IRPreferences, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidateSelectorMostUsedSimilarAppTimeIntervalSeconds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:");

    +[IRPreferences shared](IRPreferences, "shared");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", objc_msgSend(v25, "unsignedIntegerValue"));

    -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v17, "setMinNumberOfEventsInHistory:", 1);
    -[IRRuleHistoryPattern setThreshold:](v17, "setThreshold:", 2147483650.0);
    -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v17, "setCalculateScoreWithoutPortion:", 1);
    -[IRCandidateSelector _selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:](self, "_selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:", v10, v11, v12, v13, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_selectBasedOnMostUsedAnyAppFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  IRRuleHistoryPattern *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IRPreferences shared](IRPreferences, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidateSelectorIsMostUsedAnyAppEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v17 = objc_alloc_init(IRRuleHistoryPattern);
    +[IREventDO mediaUserInteractionEvents](IREventDO, "mediaUserInteractionEvents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setEventsToWatch:](v17, "setEventsToWatch:", v18);

    v19 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = CFSTR("kIRRuleHistoryPatternFilterOnlyTestedCandidates");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setFilters:](v17, "setFilters:", v21);

    +[IRPreferences shared](IRPreferences, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidateSelectorMostUsedAnyAppTimeIntervalSeconds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:");

    +[IRPreferences shared](IRPreferences, "shared");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "candidateSelectorMostUsedAnyAppMaximumNumberOfEvents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", objc_msgSend(v25, "unsignedIntegerValue"));

    -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v17, "setMinNumberOfEventsInHistory:", 1);
    -[IRRuleHistoryPattern setThreshold:](v17, "setThreshold:", 2147483650.0);
    -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v17, "setCalculateScoreWithoutPortion:", 1);
    -[IRCandidateSelector _selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:](self, "_selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:", v10, v11, v12, v13, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_selectBasedOnMostRecentMainBrokeredDeviceFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  IRRuleHistoryPattern *v13;
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
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(IRRuleHistoryPattern);
  v14 = (void *)MEMORY[0x24BDBCF20];
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setEventsToWatch:](v13, "setEventsToWatch:", v17);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v28 = CFSTR("kIRRuleHistoryPatternFilterOnlyTestedCandidates");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setFilters:](v13, "setFilters:", v20);

  +[IRPreferences shared](IRPreferences, "shared");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  -[IRRuleHistoryPattern setTimeInterval:](v13, "setTimeInterval:");

  +[IRPreferences shared](IRPreferences, "shared");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v13, "setMaxNumberOfEventsInHistory:", objc_msgSend(v24, "unsignedIntegerValue"));

  -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v13, "setMinNumberOfEventsInHistory:", 1);
  -[IRRuleHistoryPattern setThreshold:](v13, "setThreshold:", 2147483650.0);
  -[IRRuleHistoryPattern setCalculateScoreWithoutPortion:](v13, "setCalculateScoreWithoutPortion:", 1);
  -[IRCandidateSelector _selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:](self, "_selectFromCandidates:withSystemState:andHistoryEventsAsc:andDate:andRule:", v12, v11, v10, v9, v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_selectFromCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6 andRule:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  IRNearbyDeviceContainerDO *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "map:", &__block_literal_global_5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidatesContainerDO candidatesContainerDOWithCandidates:](IRCandidatesContainerDO, "candidatesContainerDOWithCandidates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRHistoryEventsContainerDO historyEventsContainerDOWithHistoryEvents:](IRHistoryEventsContainerDO, "historyEventsContainerDOWithHistoryEvents:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[IRNearbyDeviceContainerDO initWithFreezeDateNIHomeDevice:nearbyDevices:]([IRNearbyDeviceContainerDO alloc], "initWithFreezeDateNIHomeDevice:nearbyDevices:", 0, 0);
  objc_msgSend(v11, "executeRuleWithCandiatesContainer:systemStatus:historyContainer:miloPrediction:nearbyDeviceContainer:date:", v17, v14, v18, 0, v19, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "scoreForCandidates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKeyPath:", CFSTR("@max.self"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_2;
  v28[3] = &unk_2510441B8;
  v29 = v20;
  v30 = v23;
  v24 = v23;
  v25 = v20;
  objc_msgSend(v15, "firstWhere:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "candidate");
}

uint64_t __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scoreForCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_3;
  v10[3] = &unk_251044190;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v5, "keysOfEntriesPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  return v8;
}

uint64_t __97__IRCandidateSelector__selectFromCandidates_withSystemState_andHistoryEventsAsc_andDate_andRule___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "doubleValue");
  if (v5 <= 0.0)
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (id)_selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates:(id)a3 withSystemState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  +[IRPreferences shared](IRPreferences, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10
    && (+[IRPreferences shared](IRPreferences, "shared"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "candidateSelectorAllowSelectByUWB"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "BOOLValue"),
        v12,
        v11,
        v13))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __103__IRCandidateSelector__selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates_withSystemState___block_invoke;
    v17[3] = &unk_2510441E0;
    v18 = v7;
    objc_msgSend(v6, "allWhere:", v17);
    v14 = objc_claimAutoreleasedReturnValue();

    -[IRCandidateSelector _nearestRangeCandidateFromCandidates:](self, "_nearestRangeCandidateFromCandidates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id)v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __103__IRCandidateSelector__selectBasedOnNearestRangeWithHistoryOrSameICloudFromCandidates_withSystemState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "sameSpaceBasedOnUWB"))
  {
    objc_msgSend(v3, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isSameICloudWithSystemState:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "candidate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastUsedDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_selectBasedOnNearestRangeFromCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  +[IRPreferences shared](IRPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateSelectorIsNearestRangeEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7
    && (+[IRPreferences shared](IRPreferences, "shared"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "candidateSelectorAllowSelectByUWB"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "BOOLValue"),
        v9,
        v8,
        v10))
  {
    objc_msgSend(v4, "allWhere:", &__block_literal_global_99);
    v11 = objc_claimAutoreleasedReturnValue();

    -[IRCandidateSelector _nearestRangeCandidateFromCandidates:](self, "_nearestRangeCandidateFromCandidates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __64__IRCandidateSelector__selectBasedOnNearestRangeFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sameSpaceBasedOnUWB");
}

- (id)_nearestRangeCandidateFromCandidates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@min.uwbRange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__IRCandidateSelector__nearestRangeCandidateFromCandidates___block_invoke;
  v11[3] = &unk_2510441E0;
  v12 = v4;
  v5 = v4;
  objc_msgSend(v3, "allWhere:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_103);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __60__IRCandidateSelector__nearestRangeCandidateFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uwbRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __60__IRCandidateSelector__nearestRangeCandidateFromCandidates___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v4, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

- (id)_candidatesToSelectFrom:(id)a3
{
  return (id)objc_msgSend(a3, "allWhere:", &__block_literal_global_104);
}

uint64_t __47__IRCandidateSelector__candidatesToSelectFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;

  v2 = a2;
  if (objc_msgSend(v2, "sameSpaceBasedOnMiLo"))
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "candidateSelectorAllowSelectByMiLo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v2, "sameSpaceBasedOnUWB"))
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateSelectorAllowSelectByUWB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v2, "sameSpaceBasedOnBLE"))
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateSelectorAllowSelectByBLE");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v2, "sameSpaceBasedOnBrokeredLOI"))
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "candidateSelectorAllowSelectByLOI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v2, "sameSpaceBasedOnPDRFence"))
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "candidateSelectorAllowSelectByPDRFence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

  }
  else
  {
    v17 = 0;
  }

  return v5 | v8 | v11 | v14 | v17;
}

+ (BOOL)_isPickerChoiceOverrideActiveAtDate:(id)a3 withSystemState:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a3;
    objc_msgSend(a4, "latestPickerChoiceDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    +[IRPreferences shared](IRPreferences, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pickerChoiceOverrideIntervalSeconds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v4 = v9 < v12 && v9 >= 0.0;

  }
  return v4;
}

- (BOOL)candidateSelectorReasonRecentlyUsed
{
  return self->_candidateSelectorReasonRecentlyUsed;
}

- (void)setCandidateSelectorReasonRecentlyUsed:(BOOL)a3
{
  self->_candidateSelectorReasonRecentlyUsed = a3;
}

- (BOOL)candidateSelectorReasonMostlyUsedSimilarApp
{
  return self->_candidateSelectorReasonMostlyUsedSimilarApp;
}

- (void)setCandidateSelectorReasonMostlyUsedSimilarApp:(BOOL)a3
{
  self->_candidateSelectorReasonMostlyUsedSimilarApp = a3;
}

- (BOOL)candidateSelectorReasonProximityWithHistoryOrSameICloud
{
  return self->_candidateSelectorReasonProximityWithHistoryOrSameICloud;
}

- (void)setCandidateSelectorReasonProximityWithHistoryOrSameICloud:(BOOL)a3
{
  self->_candidateSelectorReasonProximityWithHistoryOrSameICloud = a3;
}

- (BOOL)candidateSelectorReasonProximity
{
  return self->_candidateSelectorReasonProximity;
}

- (void)setCandidateSelectorReasonProximity:(BOOL)a3
{
  self->_candidateSelectorReasonProximity = a3;
}

- (BOOL)candidateSelectorReasonMostlyUsedAnyApp
{
  return self->_candidateSelectorReasonMostlyUsedAnyApp;
}

- (void)setCandidateSelectorReasonMostlyUsedAnyApp:(BOOL)a3
{
  self->_candidateSelectorReasonMostlyUsedAnyApp = a3;
}

- (BOOL)candidateSelectorReasonBrokeredMainDeviceFirstUse
{
  return self->_candidateSelectorReasonBrokeredMainDeviceFirstUse;
}

- (void)setCandidateSelectorReasonBrokeredMainDeviceFirstUse:(BOOL)a3
{
  self->_candidateSelectorReasonBrokeredMainDeviceFirstUse = a3;
}

- (BOOL)candidateSelectorReasonSingle
{
  return self->_candidateSelectorReasonSingle;
}

- (void)setCandidateSelectorReasonSingle:(BOOL)a3
{
  self->_candidateSelectorReasonSingle = a3;
}

@end
