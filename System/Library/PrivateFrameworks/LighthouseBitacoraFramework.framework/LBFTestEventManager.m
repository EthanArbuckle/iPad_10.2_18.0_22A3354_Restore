@implementation LBFTestEventManager

- (LBFTestEventManager)init
{
  LBFTestEventManager *v2;
  NSDictionary *v3;
  NSDictionary *syntheticData;
  NSString *readCategory;
  NSDateFormatter *v6;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)LBFTestEventManager;
  v2 = -[LBFTestEventManager init](&v20, sel_init);
  if (v2)
  {
    LBFLoggingUtilsInit();
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    syntheticData = v2->_syntheticData;
    v2->_syntheticData = v3;

    readCategory = v2->_readCategory;
    v2->_readCategory = (NSString *)CFSTR("Unknown");

    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v6;

    v8 = v2->_dateFormatter;
    objc_msgSend_timeZoneWithAbbreviation_(MEMORY[0x24BDBCF38], v9, (uint64_t)CFSTR("UTC"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimeZone_(v8, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_setDateFormat_(v2->_dateFormatter, v16, (uint64_t)CFSTR("YYYY-MM-dd"), v17, v18);
  }
  return v2;
}

+ (id)sharedInstance
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)loadSyntheticJSON:(id)a3 datasetName:(id)a4
{
  NSString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char SyntheticData;
  NSString *datasetName;

  v6 = (NSString *)a4;
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v7, (uint64_t)a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v11, (uint64_t)v10, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SyntheticData = objc_msgSend_loadSyntheticData_(self, v13, (uint64_t)v12, v14, v15);
  datasetName = self->_datasetName;
  self->_datasetName = v6;

  return SyntheticData;
}

- (BOOL)loadSyntheticData:(id)a3
{
  objc_storeStrong((id *)&self->_syntheticData, a3);
  return 1;
}

- (id)ensureBiomeManagerTrial
{
  NSString *readCategory;

  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)CFSTR("Trial");

  return self;
}

- (id)ensureBiomeManagerLighthouse
{
  NSString *readCategory;

  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)CFSTR("Lighthouse");

  return self;
}

- (id)ensureBiomeManagerMLRuntimed
{
  NSString *readCategory;

  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)CFSTR("MLRuntimed");

  return self;
}

- (id)ensureBiomeManagerDprivacyd
{
  NSString *readCategory;

  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)CFSTR("Dprivacyd");

  return self;
}

- (id)trialIdentifiersFromJSON:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  LBFTrialIdentifiers *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  LBFTrialIdentifiers *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("bmltIdentifiers"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("trialDeploymentID"), v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v12 = 0;
    }
    v13 = [LBFTrialIdentifiers alloc];
    objc_msgSend_objectForKey_(v11, v14, (uint64_t)CFSTR("trialTaskID"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_intValue(v12, v18, v19, v20, v21);
    v25 = (void *)objc_msgSend_initWithBMLTTaskID_deploymentID_(v13, v23, (uint64_t)v17, v22, v24);

  }
  else
  {
    v25 = 0;
  }
  objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("experimentIdentifiers"), v9, v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v26;
  if (v26)
  {
    objc_msgSend_objectForKey_(v26, v27, (uint64_t)CFSTR("trialDeploymentID"), v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v31 = 0;
    }
    v32 = [LBFTrialIdentifiers alloc];
    objc_msgSend_objectForKey_(v30, v33, (uint64_t)CFSTR("trialExperimentID"), v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_intValue(v31, v37, v38, v39, v40);
    objc_msgSend_objectForKey_(v30, v42, (uint64_t)CFSTR("trialTreatmentID"), v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_initWithExperimentID_deploymentID_treatmentID_(v32, v46, (uint64_t)v36, v41, (uint64_t)v45);

    v25 = (void *)v47;
  }

  return v25;
}

- (id)lighthouseEventFromDict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  LBFLighthouseEvent *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  LBFLighthouseEvent *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  LBFLighthouseEvent *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("performTrialTaskStatus"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("succeeded"), v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_BOOLValue(v12, v13, v14, v15, v16);

    objc_msgSend_objectForKey_(v11, v18, (uint64_t)CFSTR("usePrivateUpload"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [LBFLighthouseEvent alloc];
    v24 = (void *)objc_msgSend_initWithPerformTrialTaskStatus_error_usePrivateUpload_(v22, v23, v17, 0, v21 != 0);
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("performTaskStatus"), v9, v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25;
  if (v25)
  {
    objc_msgSend_objectForKey_(v25, v26, (uint64_t)CFSTR("succeeded"), v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_BOOLValue(v30, v31, v32, v33, v34);

    v36 = [LBFLighthouseEvent alloc];
    v39 = objc_msgSend_initWithPerformTaskStatus_error_(v36, v37, v35, 0, v38);

    v24 = (void *)v39;
  }
  objc_msgSend_objectForKey_(v3, v26, (uint64_t)CFSTR("stop"), v27, v28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v40;
  if (v40)
  {
    objc_msgSend_objectForKey_(v40, v41, (uint64_t)CFSTR("succeeded"), v42, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

    v51 = [LBFLighthouseEvent alloc];
    v54 = objc_msgSend_initWithStop_error_(v51, v52, v50, 0, v53);

    v24 = (void *)v54;
  }

  return v24;
}

- (id)mlRuntimedEventFromDict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LBFMLRuntimedEvent *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  LBFMLRuntimedEvent *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  LBFMLRuntimedEvent *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  LBFMLRuntimedEvent *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("taskCompleted"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("succeeded"), v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_BOOLValue(v12, v13, v14, v15, v16);

    v18 = [LBFMLRuntimedEvent alloc];
    v21 = (void *)objc_msgSend_initWithTaskCompleted_error_(v18, v19, v17, 0, v20);
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("taskFetched"), v9, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v22;
  if (v22)
  {
    objc_msgSend_objectForKey_(v22, v23, (uint64_t)CFSTR("succeeded"), v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31);

    v33 = [LBFMLRuntimedEvent alloc];
    v36 = objc_msgSend_initWithTaskFetched_error_(v33, v34, v32, 0, v35);

    v21 = (void *)v36;
  }
  objc_msgSend_objectForKey_(v3, v23, (uint64_t)CFSTR("taskScheduled"), v24, v25);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v37;
  if (v37)
  {
    objc_msgSend_objectForKey_(v37, v38, (uint64_t)CFSTR("succeeded"), v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_BOOLValue(v42, v43, v44, v45, v46);

    v48 = [LBFMLRuntimedEvent alloc];
    v51 = objc_msgSend_initWithTaskScheduled_error_(v48, v49, v47, 0, v50);

    v21 = (void *)v51;
  }
  objc_msgSend_objectForKey_(v3, v38, (uint64_t)CFSTR("activityScheduleStatus"), v39, v40);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v52;
  if (v52)
  {
    objc_msgSend_objectForKey_(v52, v53, (uint64_t)CFSTR("scheduled"), v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_BOOLValue(v57, v58, v59, v60, v61);

    v63 = [LBFMLRuntimedEvent alloc];
    v67 = objc_msgSend_initWithScheduleStatus_(v63, v64, v62, v65, v66);

    v21 = (void *)v67;
  }

  return v21;
}

- (id)dprivacydEventFromDict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  LBFDprivacydEvent *v30;
  const char *v31;
  void *v32;

  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("event"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("phase"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(&unk_25109E388, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_intValue(v15, v16, v17, v18, v19);

  objc_msgSend_objectForKeyedSubscript_(v3, v21, (uint64_t)CFSTR("event"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)CFSTR("succeeded"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 != 0;

  v30 = [LBFDprivacydEvent alloc];
  v32 = (void *)objc_msgSend_initWithEventPhase_eventUUID_succeeded_error_(v30, v31, v20, 0, v29, 0);

  return v32;
}

- (id)trialEventFromDict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  LBFTrialEvent *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  LBFTrialEvent *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  LBFTrialEvent *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("eventType"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("eventSucceeded"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_BOOLValue(v11, v12, v13, v14, v15);
  if (objc_msgSend_isEqualToString_(v7, v17, (uint64_t)CFSTR("Allocation"), v18, v19))
  {
    v23 = [LBFTrialEvent alloc];
    v27 = (void *)objc_msgSend_initWithAllocation_(v23, v24, v16, v25, v26);
  }
  else
  {
    v27 = 0;
  }
  if (objc_msgSend_isEqualToString_(v7, v20, (uint64_t)CFSTR("Activation"), v21, v22))
  {
    v31 = [LBFTrialEvent alloc];
    v35 = objc_msgSend_initWithActivation_(v31, v32, v16, v33, v34);

    v27 = (void *)v35;
  }
  if (objc_msgSend_isEqualToString_(v7, v28, (uint64_t)CFSTR("Deactivation"), v29, v30))
  {
    v36 = [LBFTrialEvent alloc];
    v40 = objc_msgSend_initWithDeactivation_(v36, v37, v16, v38, v39);

    v27 = (void *)v40;
  }

  return v27;
}

- (id)generateOutcomeDict
{
  id v3;
  NSDictionary *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = self->_syntheticData;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_objectForKey_(self->_syntheticData, v7, v13, v8, v9, (_QWORD)v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("outcome"), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v18, v19, v20, v21, v22))
          objc_msgSend_setObject_forKey_(v3, v23, (uint64_t)v18, v13, v24);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v10);
  }

  v29 = (void *)objc_msgSend_copy(v3, v25, v26, v27, v28);
  return v29;
}

- (BOOL)generateEventStore
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  int isEqualToString;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  NSDictionary *v198;
  NSDictionary *eventStore;
  NSDictionary *obj;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _QWORD v224[4];
  _QWORD v225[4];
  _BYTE v226[128];
  _BYTE v227[128];
  uint64_t v228;

  v228 = *MEMORY[0x24BDAC8D0];
  v214 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v213 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v212 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v211 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = objc_alloc(MEMORY[0x24BDBCE48]);
  v7 = objc_msgSend_initWithCalendarIdentifier_(v3, v4, *MEMORY[0x24BDBCA18], v5, v6);
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v203 = (void *)v7;
  objc_msgSend_setCalendar_(v8, v9, v7, v10, v11);
  objc_msgSend_setHour_(v8, v12, 0, v13, v14);
  objc_msgSend_setMinute_(v8, v15, 0, v16, v17);
  objc_msgSend_setSecond_(v8, v18, 0, v19, v20);
  objc_msgSend_timeZoneWithName_(MEMORY[0x24BDBCF38], v21, (uint64_t)CFSTR("GMT"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = v8;
  objc_msgSend_setTimeZone_(v8, v25, (uint64_t)v24, v26, v27);

  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  obj = self->_syntheticData;
  v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v220, (uint64_t)v227, 16);
  if (v205)
  {
    v204 = *(_QWORD *)v221;
    do
    {
      for (i = 0; i != v205; ++i)
      {
        if (*(_QWORD *)v221 != v204)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
        objc_msgSend_objectForKey_(self->_syntheticData, v29, (uint64_t)v33, v30, v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v34, v35, (uint64_t)CFSTR("events"), v36, v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v209 = v34;
          v210 = i;
          objc_msgSend_componentsSeparatedByString_(v33, v38, (uint64_t)CFSTR("-"), v39, v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v42, v43, 0, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend_intValue(v46, v47, v48, v49, v50);
          objc_msgSend_setYear_(v202, v52, v51, v53, v54);

          objc_msgSend_objectAtIndex_(v42, v55, 1, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_intValue(v58, v59, v60, v61, v62);
          objc_msgSend_setMonth_(v202, v64, v63, v65, v66);

          v207 = v42;
          objc_msgSend_objectAtIndex_(v42, v67, 2, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend_intValue(v70, v71, v72, v73, v74);
          objc_msgSend_setDay_(v202, v76, v75, v77, v78);

          objc_msgSend_dateFromComponents_(v203, v79, (uint64_t)v202, v80, v81);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSince1970(v206, v82, v83, v84, v85);
          v87 = v86;
          v216 = 0u;
          v217 = 0u;
          v218 = 0u;
          v219 = 0u;
          v208 = v41;
          v215 = v41;
          v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v88, (uint64_t)&v216, (uint64_t)v226, 16);
          if (v89)
          {
            v93 = v89;
            v94 = *(_QWORD *)v217;
            do
            {
              for (j = 0; j != v93; ++j)
              {
                if (*(_QWORD *)v217 != v94)
                  objc_enumerationMutation(v215);
                v96 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * j);
                v87 = v87 + 2.0;
                objc_msgSend_objectForKey_(v96, v90, (uint64_t)CFSTR("trialIdentifiers"), v91, v92);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_trialIdentifiersFromJSON_(self, v98, (uint64_t)v97, v99, v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_objectForKey_(v96, v102, (uint64_t)CFSTR("category"), v103, v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToString = objc_msgSend_isEqualToString_(v105, v106, (uint64_t)CFSTR("Trial"), v107, v108);

                if (isEqualToString)
                {
                  objc_msgSend_trialEventFromDict_(self, v110, (uint64_t)v96, v111, v112);
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v114, (int)v87, v115, v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_createTrialdEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v118, (uint64_t)v113, (uint64_t)v101, (uint64_t)v117);
                  v119 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v214, v120, (uint64_t)v119, v121, v122);
                }
                objc_msgSend_objectForKey_(v96, v110, (uint64_t)CFSTR("category"), v111, v112);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = objc_msgSend_isEqualToString_(v123, v124, (uint64_t)CFSTR("MLRuntimed"), v125, v126);

                if (v127)
                {
                  objc_msgSend_mlRuntimedEventFromDict_(self, v128, (uint64_t)v96, v129, v130);
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v132, (int)v87, v133, v134);
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_createMLRuntimedEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v136, (uint64_t)v131, (uint64_t)v101, (uint64_t)v135);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v213, v138, (uint64_t)v137, v139, v140);
                }
                objc_msgSend_objectForKey_(v96, v128, (uint64_t)CFSTR("category"), v129, v130);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                v145 = objc_msgSend_isEqualToString_(v141, v142, (uint64_t)CFSTR("Lighthouse"), v143, v144);

                if (v145)
                {
                  objc_msgSend_lighthouseEventFromDict_(self, v146, (uint64_t)v96, v147, v148);
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v150, (int)v87, v151, v152);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_createLighthousePluginEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v154, (uint64_t)v149, (uint64_t)v101, (uint64_t)v153);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v212, v156, (uint64_t)v155, v157, v158);
                }
                objc_msgSend_objectForKey_(v96, v146, (uint64_t)CFSTR("category"), v147, v148);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                v163 = objc_msgSend_isEqualToString_(v159, v160, (uint64_t)CFSTR("Dprivacyd"), v161, v162);

                if (v163)
                {
                  objc_msgSend_dprivacydEventFromDict_(self, v164, (uint64_t)v96, v165, v166);
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v168, (int)v87, v169, v170);
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_createDprivacydEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v172, (uint64_t)v167, (uint64_t)v101, (uint64_t)v171);
                  v173 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v211, v174, (uint64_t)v173, v175, v176);
                }

              }
              v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v90, (uint64_t)&v216, (uint64_t)v226, 16);
            }
            while (v93);
          }

          v34 = v209;
          i = v210;
          v41 = v208;
        }

      }
      v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v220, (uint64_t)v227, 16);
    }
    while (v205);
  }

  v224[0] = CFSTR("Trial");
  v181 = (void *)objc_msgSend_copy(v214, v177, v178, v179, v180);
  v225[0] = v181;
  v224[1] = CFSTR("MLRuntimed");
  v186 = (void *)objc_msgSend_copy(v213, v182, v183, v184, v185);
  v225[1] = v186;
  v224[2] = CFSTR("Lighthouse");
  v191 = (void *)objc_msgSend_copy(v212, v187, v188, v189, v190);
  v225[2] = v191;
  v224[3] = CFSTR("Dprivacyd");
  v196 = (void *)objc_msgSend_copy(v211, v192, v193, v194, v195);
  v225[3] = v196;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v197, (uint64_t)v225, (uint64_t)v224, 4);
  v198 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  eventStore = self->_eventStore;
  self->_eventStore = v198;

  return 1;
}

- (id)readData:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_timeIntervalSince1970(v6, v9, v10, v11, v12);
  v14 = v13;
  objc_msgSend_timeIntervalSince1970(v7, v15, v16, v17, v18);
  v20 = v19;
  objc_msgSend_objectForKey_(self->_eventStore, v21, (uint64_t)self->_readCategory, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v26)
  {
    v31 = v26;
    v32 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v24);
        v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_timestamp(v34, v27, v28, v29, v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSince1970(v35, v36, v37, v38, v39);
        v41 = v40;

        if (v41 > v14 && v41 < v20)
          objc_msgSend_addObject_(v8, v27, (uint64_t)v34, v29, v30);
      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v31);
  }
  v43 = (void *)objc_msgSend_copy(v8, v27, v28, v29, v30);

  return v43;
}

- (BOOL)validateOutcomes:(id)a3 withAggregatedStates:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  int v86;
  const char *v87;
  BOOL v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id obj;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v101 = a3;
  v5 = a4;
  NSLog(CFSTR("Starting outcome validation."));
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v6 = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v122, (uint64_t)v129, 16);
  if (v8)
  {
    v9 = 1;
    v10 = *(_QWORD *)v123;
    v96 = v6;
    v91 = *(_QWORD *)v123;
    do
    {
      v11 = 0;
      v90 = v8;
      do
      {
        if (*(_QWORD *)v123 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v11);
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        obj = v12;
        v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v118, (uint64_t)v128, 16);
        if (v94)
        {
          v17 = *(_QWORD *)v119;
          v92 = *(_QWORD *)v119;
          v93 = v11;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v119 != v17)
                objc_enumerationMutation(obj);
              v95 = v18;
              v108 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v18);
              objc_msgSend_objectForKey_(obj, v14, v108, v15, v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = 0u;
              v115 = 0u;
              v116 = 0u;
              v117 = 0u;
              v20 = v19;
              v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v114, (uint64_t)v127, 16);
              if (v100)
              {
                v98 = v20;
                v99 = *(_QWORD *)v115;
                while (2)
                {
                  for (i = 0; i != v100; ++i)
                  {
                    if (*(_QWORD *)v115 != v99)
                      objc_enumerationMutation(v20);
                    v26 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
                    objc_msgSend_objectForKey_(v20, v22, v26, v23, v24);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_getDictionaryRepresentation(v27, v28, v29, v30, v31);
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKey_(v109, v32, (uint64_t)CFSTR("timestamp"), v33, v34);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend_longLongValue(v35, v36, v37, v38, v39);
                    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x24BDBCE60], v41, v42, v43, v44, (double)(v40 / 1000 - 86400));
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringFromDate_(self->_dateFormatter, v45, (uint64_t)v106, v46, v47);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKey_(v101, v48, (uint64_t)v105, v49, v50);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKey_(v51, v52, v108, v53, v54);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKey_(v55, v56, v26, v57, v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();

                    v112 = 0u;
                    v113 = 0u;
                    v110 = 0u;
                    v111 = 0u;
                    v60 = v59;
                    v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v110, (uint64_t)v126, 16);
                    if (v62)
                    {
                      v66 = v62;
                      v102 = v35;
                      v103 = v27;
                      v104 = i;
                      v67 = *(_QWORD *)v111;
                      while (2)
                      {
                        v68 = 0;
                        v69 = v9;
                        do
                        {
                          if (*(_QWORD *)v111 != v67)
                            objc_enumerationMutation(v60);
                          v70 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v68);
                          objc_msgSend_objectForKey_(v60, v63, v70, v64, v65);
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectForKey_(v109, v72, v70, v73, v74);
                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                          NSLog(&stru_251095C88.isa);
                          NSLog(CFSTR("%@ - Test Case #%d - Exp ID: %@ - Dep ID: %@"), self->_datasetName, v69 + v68, v108, v26);
                          NSLog(CFSTR("Key: %@ -> Expected: %@"), v70, v71);
                          NSLog(CFSTR("Actual Value: %@"), v75);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            && !objc_msgSend_isEqualToString_(v71, v76, (uint64_t)v75, v78, v79)
                            || (objc_msgSend_null(MEMORY[0x24BDBCEF8], v76, v77, v78, v79),
                                v80 = (void *)objc_claimAutoreleasedReturnValue(),
                                v80,
                                v71 == v80)
                            && (objc_msgSend_null(MEMORY[0x24BDBCEF8], v81, v82, v83, v84),
                                v85 = (void *)objc_claimAutoreleasedReturnValue(),
                                v85,
                                v75 != v85))
                          {

                            v86 = 0;
                            v9 = (v69 + v68);
                            goto LABEL_29;
                          }

                          ++v68;
                        }
                        while (v66 != v68);
                        v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v110, (uint64_t)v126, 16);
                        v9 = (v69 + v68);
                        if (v66)
                          continue;
                        break;
                      }
                      v9 = (v69 + v68);
                      v86 = 1;
LABEL_29:
                      v20 = v98;
                      v27 = v103;
                      i = v104;
                      v35 = v102;
                    }
                    else
                    {
                      v86 = 1;
                    }

                    if (!v86)
                    {

                      v88 = 0;
                      v6 = v96;
                      goto LABEL_41;
                    }
                  }
                  v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v114, (uint64_t)v127, 16);
                  if (v100)
                    continue;
                  break;
                }
              }

              v18 = v95 + 1;
              v6 = v96;
              v17 = v92;
              v11 = v93;
            }
            while (v95 + 1 != v94);
            v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v118, (uint64_t)v128, 16);
          }
          while (v94);
        }

        ++v11;
        v10 = v91;
      }
      while (v11 != v90);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v87, (uint64_t)&v122, (uint64_t)v129, 16);
      v10 = v91;
      v88 = 1;
    }
    while (v8);
  }
  else
  {
    v88 = 1;
  }
LABEL_41:

  return v88;
}

- (NSDictionary)syntheticData
{
  return self->_syntheticData;
}

- (void)setSyntheticData:(id)a3
{
  objc_storeStrong((id *)&self->_syntheticData, a3);
}

- (NSString)readCategory
{
  return self->_readCategory;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (NSDictionary)eventStore
{
  return self->_eventStore;
}

- (NSString)datasetName
{
  return self->_datasetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetName, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_readCategory, 0);
  objc_storeStrong((id *)&self->_syntheticData, 0);
}

@end
