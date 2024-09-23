@implementation IRHistoryManager

- (IRHistoryEventsContainerDO)historyEventsContainer
{
  return self->_historyEventsContainer;
}

- (IRHistoryManager)initWithStore:(id)a3 miloFeedback:(id)a4
{
  id v6;
  id v7;
  IRHistoryManager *v8;
  IRHistoryManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRHistoryManager;
  v8 = -[IRHistoryManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IRHistoryManager setStore:](v8, "setStore:", v6);
    -[IRHistoryManager setMiloFeedback:](v9, "setMiloFeedback:", v7);
    -[IRHistoryManager synchronizeAndFetchFromDBOnDisk](v9, "synchronizeAndFetchFromDBOnDisk");
  }

  return v9;
}

- (void)addEvent:(id)a3 forCandidateIdentifier:(id)a4 withSystemState:(id)a5 andMiloPrediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
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
  unint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  IRHistoryEventsContainerDO *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  LODWORD(a6) = objc_msgSend(v10, "isUserIntentionEvent");
  v14 = a6 & ~objc_msgSend(v12, "isContinuityDisplay");
  -[IRHistoryManager lastMiLoLabel](self, "lastMiLoLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryManager _labelMiLoIfNeeded:lastMiLoLabel:shouldLabelEventWithMilo:](self, "_labelMiLoIfNeeded:lastMiLoLabel:shouldLabelEventWithMilo:", v13, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryManager setLastMiLoLabel:](self, "setLastMiLoLabel:", v16);

  v54 = v13;
  if ((_DWORD)v14 == 1 && objc_msgSend(v13, "canLabel"))
  {
    objc_msgSend(v13, "predictionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predictionId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRMiLoPredictionEventDO miLoPredictionEventDOWithLabel:predictionId:](IRMiLoPredictionEventDO, "miLoPredictionEventDOWithLabel:predictionId:", v17, v18);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[IRMiLoPredictionEventDO miLoPredictionEventDOWithLabel:predictionId:](IRMiLoPredictionEventDO, "miLoPredictionEventDOWithLabel:predictionId:", 0, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)*MEMORY[0x24BE5B278];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B278], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    objc_msgSend(v10, "name");
    v55 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE5B2E0], "eventTypeStringEventDO:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE5B2E0], "eventSubTypeStringEventDO:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316930;
    v59 = "#history-manager, ";
    v60 = 2112;
    v61 = v19;
    v62 = 2112;
    v63 = v22;
    v64 = 2112;
    v65 = v23;
    v66 = 2112;
    v67 = v24;
    v68 = 2112;
    v69 = v11;
    v70 = 2112;
    v71 = v25;
    v72 = 2112;
    v73 = v26;
    _os_log_impl(&dword_23FFBA000, v21, OS_LOG_TYPE_DEFAULT, "%s[%@], Adding event (%@) type:%@, subtype:%@ to candidate:%@, miloLabel:%@, shouldLabelEventWithMilo:%@", buf, 0x52u);

    v12 = v55;
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  IRAVInitialRouteSharingPolicyForBundleIdentifier(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v11;
  +[IRHistoryEventDO historyEventDOWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:](IRHistoryEventDO, "historyEventDOWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", v27, v11, v10, v57, v12, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDBCEB8];
  -[IRHistoryManager historyEventsContainer](self, "historyEventsContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "historyEvents");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "arrayWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "addObject:", v30);
  v35 = objc_msgSend(v34, "count");
  +[IRPreferences shared](IRPreferences, "shared");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "numberOfHistoryEventsInCache");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "unsignedIntValue");

  if (v35 > v38)
    objc_msgSend(v34, "removeObjectAtIndex:", 0);
  v39 = -[IRHistoryEventsContainerDO initWithHistoryEvents:]([IRHistoryEventsContainerDO alloc], "initWithHistoryEvents:", v34);
  -[IRHistoryManager setHistoryEventsContainer:](self, "setHistoryEventsContainer:", v39);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
  {
    v42 = (void *)MEMORY[0x24BDD16E0];
    v43 = v41;
    -[IRHistoryManager historyEventsContainer](self, "historyEventsContainer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "historyEvents");
    v45 = v12;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v46, "count"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v59 = "#history-manager, ";
    v60 = 2112;
    v61 = v40;
    v62 = 2112;
    v63 = v47;
    _os_log_impl(&dword_23FFBA000, v43, OS_LOG_TYPE_DEBUG, "%s[%@], Memory: Number of History events: %@", buf, 0x20u);

    v12 = v45;
  }

  -[IRHistoryManager store](self, "store");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRPreferences shared](IRPreferences, "shared");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "numberOfEventsToSaveInDisk");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v48, "addHistoryEvent:withLimit:", v30, objc_msgSend(v50, "unsignedIntegerValue"));

  if ((v51 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "#history-manager, ";
      v60 = 2112;
      v61 = v52;
      _os_log_impl(&dword_23FFBA000, v53, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - History manager save event error] Could not save new history event", buf, 0x16u);
    }

  }
}

- (id)_labelMiLoIfNeeded:(id)a3 lastMiLoLabel:(id)a4 shouldLabelEventWithMilo:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[IRHistoryManager miloFeedback](self, "miloFeedback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v11;
  if (v5)
  {
    v12 = v11;
    if (objc_msgSend(v8, "canLabel"))
    {
      objc_msgSend(v8, "predictionId");
      v13 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v8, "predictionId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v11);

        v12 = v11;
        if ((v16 & 1) == 0)
        {
          objc_msgSend(v8, "predictionId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v12);
          objc_msgSend(v10, "labelPredictionUuid:withEventUuid:", v17, v17);

        }
      }
    }
  }

  return v12;
}

- (void)synchronizeAndFetchFromDBOnDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[IRHistoryManager store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRPreferences shared](IRPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfHistoryEventsInCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchHistoryEventsContainerWithLimit:", objc_msgSend(v5, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRHistoryManager setHistoryEventsContainer:](self, "setHistoryEventsContainer:", v6);

  -[IRHistoryManager historyEventsContainer](self, "historyEventsContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE5B270];
  v10 = *MEMORY[0x24BE5B270];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = v9;
      -[IRHistoryManager historyEventsContainer](self, "historyEventsContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "historyEvents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "#history-manager, ";
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_DEFAULT, "%s[%@], Loading history Events container from store with %@ events", (uint8_t *)&v16, 0x20u);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "#history-manager, ";
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - History manager fetch events error] Could not fetch history events container", (uint8_t *)&v16, 0x16u);
  }

}

- (IRMiLoFeedbackProvider)miloFeedback
{
  return (IRMiLoFeedbackProvider *)objc_loadWeakRetained((id *)&self->_miloFeedback);
}

- (void)setMiloFeedback:(id)a3
{
  objc_storeWeak((id *)&self->_miloFeedback, a3);
}

- (void)setHistoryEventsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_historyEventsContainer, a3);
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSString)lastMiLoLabel
{
  return self->_lastMiLoLabel;
}

- (void)setLastMiLoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastMiLoLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMiLoLabel, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_historyEventsContainer, 0);
  objc_destroyWeak((id *)&self->_miloFeedback);
}

@end
