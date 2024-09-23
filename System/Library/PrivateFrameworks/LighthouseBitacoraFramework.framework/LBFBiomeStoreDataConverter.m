@implementation LBFBiomeStoreDataConverter

+ (id)createTrialIdentifiers:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;

  v3 = a3;
  v8 = v3;
  if (!v3)
    goto LABEL_5;
  v9 = objc_msgSend_identifierType(v3, v4, v5, v6, v7);
  if (v9 != 1)
  {
    if (v9 == 2)
    {
      v10 = objc_alloc(MEMORY[0x24BE0C448]);
      objc_msgSend_trialTaskID(v8, v11, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deploymentID(v8, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend_initWithTrialTaskID_trialDeploymentID_(v10, v21, (uint64_t)v15, (uint64_t)v20, v22);

      v24 = objc_alloc(MEMORY[0x24BE0C440]);
      v27 = objc_msgSend_initWithExperimentIdentifiers_bmltIdentifiers_(v24, v25, 0, (uint64_t)v23, v26);
      goto LABEL_7;
    }
LABEL_5:
    v28 = 0;
    goto LABEL_9;
  }
  v29 = objc_alloc(MEMORY[0x24BE0C450]);
  objc_msgSend_experimentID(v8, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deploymentID(v8, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_treatmentID(v8, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithTrialExperimentID_trialDeploymentID_trialTreatmentID_(v29, v45, (uint64_t)v34, (uint64_t)v39, (uint64_t)v44);

  v46 = objc_alloc(MEMORY[0x24BE0C440]);
  v27 = objc_msgSend_initWithExperimentIdentifiers_bmltIdentifiers_(v46, v47, (uint64_t)v23, 0, v48);
LABEL_7:
  v28 = (void *)v27;

  if (v28)
    objc_msgSend_IsEmptyTrialIdentifiers_(LBFUtils, v49, (uint64_t)v28, v50, v51);
LABEL_9:

  return v28;
}

+ (id)createMLRuntimedEvent:(id)a3 identifiers:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  void *v85;
  void *v86;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = v10;
  v16 = (void *)MEMORY[0x24BDBCE60];
  if (v10)
  {
    v17 = objc_msgSend_intValue(v10, v11, v12, v13, v14);
    objc_msgSend_dateWithTimeIntervalSince1970_(v16, v18, v19, v20, v21, (double)v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateToGMTDate_(LBFUtils, v23, (uint64_t)v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_now(MEMORY[0x24BDBCE60], v11, v12, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_getContextId(LBFContextId, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v9;
  objc_msgSend_createTrialIdentifiers_(a1, v37, (uint64_t)v9, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc(MEMORY[0x24BE0C430]);
  objc_msgSend_scheduled(v8, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend_initWithScheduled_(v41, v47, (uint64_t)v46, v48, v49);

  v51 = objc_alloc(MEMORY[0x24BE0C438]);
  objc_msgSend_succeeded(v8, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorDomain(v8, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorCode(v8, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend_initWithSucceeded_errorDomain_errorCode_(v51, v67, (uint64_t)v56, (uint64_t)v61, (uint64_t)v66);

  switch(objc_msgSend_eventType(v8, v69, v70, v71, v72))
  {
    case 1:
      v73 = objc_alloc(MEMORY[0x24BE0C428]);
      v85 = 0;
      v75 = (uint64_t)v40;
      v76 = (uint64_t)v36;
      v77 = (uint64_t)v26;
      v78 = v50;
      goto LABEL_9;
    case 2:
      v73 = objc_alloc(MEMORY[0x24BE0C428]);
      v85 = 0;
      v75 = (uint64_t)v40;
      v76 = (uint64_t)v36;
      v77 = (uint64_t)v26;
      v78 = 0;
      v79 = v68;
      goto LABEL_10;
    case 3:
      v80 = objc_alloc(MEMORY[0x24BE0C428]);
      v82 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_activityScheduleStatus_taskFetched_taskScheduled_taskCompleted_(v80, v81, (uint64_t)v40, (uint64_t)v36, (uint64_t)v26, 0, 0, v68, 0);
      goto LABEL_11;
    case 4:
      v73 = objc_alloc(MEMORY[0x24BE0C428]);
      v85 = v68;
      v75 = (uint64_t)v40;
      v76 = (uint64_t)v36;
      v77 = (uint64_t)v26;
      v78 = 0;
LABEL_9:
      v79 = 0;
LABEL_10:
      v82 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_activityScheduleStatus_taskFetched_taskScheduled_taskCompleted_(v73, v74, v75, v76, v77, v78, v79, 0, v85);
LABEL_11:
      v83 = (void *)v82;
      if (!v82)
        goto LABEL_12;
      goto LABEL_15;
    default:
LABEL_12:
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
        sub_2403145E0();
      v83 = 0;
LABEL_15:

      return v83;
  }
}

+ (id)createDprivacydEvent:(id)a3 identifiers:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v97;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCE60];
  v11 = a4;
  objc_msgSend_now(v10, v12, v13, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v21 = (void *)MEMORY[0x24BDBCE60];
    v22 = objc_msgSend_intValue(v9, v16, v17, v18, v19);
    objc_msgSend_dateWithTimeIntervalSince1970_(v21, v23, v24, v25, v26, (double)v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dateToGMTDate_(LBFUtils, v28, (uint64_t)v27, v29, v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_getContextId(LBFContextId, v16, v17, v18, v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_createTrialIdentifiers_(a1, v37, (uint64_t)v11, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend_eventPhase(v8, v41, v42, v43, v44);
  if ((v45 - 1) >= 5)
  {
    v94 = (void *)LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403146B8(v94, v8);
    goto LABEL_11;
  }
  v50 = v45;
  v51 = objc_msgSend_aggregateFunction(v8, v46, v47, v48, v49);
  if (v51 >= 4)
  {
    v95 = (void *)LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240314638(v95, v8);
LABEL_11:
    v92 = 0;
    goto LABEL_15;
  }
  v52 = v51;
  v53 = objc_alloc(MEMORY[0x24BE0C410]);
  objc_msgSend_succeeded(v8, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorMessage(v8, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend_initWithPhase_succeeded_errorMessage_(v53, v64, v50, (uint64_t)v58, (uint64_t)v63);

  v97 = objc_alloc(MEMORY[0x24BE0C408]);
  objc_msgSend_eventUUID(v8, v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)MEMORY[0x24BDD16E0];
  v76 = objc_msgSend_errorCode(v8, v72, v73, v74, v75);
  objc_msgSend_numberWithInt_(v71, v77, v76, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)MEMORY[0x24BDD16E0];
  v86 = objc_msgSend_count(v8, v82, v83, v84, v85);
  objc_msgSend_numberWithInt_(v81, v87, v86, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_eventIdentifier_event_aggregateFunction_errorCode_count_(v97, v91, (uint64_t)v40, (uint64_t)v36, (uint64_t)v20, v70, v65, v52, v80, v90);

  if (v92)
  {
    v93 = v92;
  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_24031460C();
  }

LABEL_15:
  return v92;
}

+ (id)createLighthousePluginEvent:(id)a3 identifiers:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  void *v91;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = v10;
  v16 = (void *)MEMORY[0x24BDBCE60];
  if (v10)
  {
    v17 = objc_msgSend_intValue(v10, v11, v12, v13, v14);
    objc_msgSend_dateWithTimeIntervalSince1970_(v16, v18, v19, v20, v21, (double)v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateToGMTDate_(LBFUtils, v23, (uint64_t)v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_now(MEMORY[0x24BDBCE60], v11, v12, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_getContextId(LBFContextId, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_createTrialIdentifiers_(a1, v37, (uint64_t)v9, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc(MEMORY[0x24BE0C420]);
  objc_msgSend_succeeded(v8, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorDomain(v8, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorCode(v8, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend_initWithSucceeded_errorDomain_errorCode_(v41, v57, (uint64_t)v46, (uint64_t)v51, (uint64_t)v56);

  v63 = objc_msgSend_eventType(v8, v59, v60, v61, v62);
  switch(v63)
  {
    case 3:
      v77 = objc_alloc(MEMORY[0x24BE0C418]);
      objc_msgSend_usePrivateUpload(v8, v78, v79, v80, v81);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v58;
      v71 = v77;
      v72 = (uint64_t)v40;
      v73 = (uint64_t)v36;
      v74 = (uint64_t)v26;
      v75 = v70;
      v76 = 0;
      goto LABEL_9;
    case 2:
      v83 = objc_alloc(MEMORY[0x24BE0C418]);
      objc_msgSend_usePrivateUpload(v8, v84, v85, v86, v87);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_usePrivateUpload_performTaskStatus_performTrialTaskStatus_stop_(v83, v88, (uint64_t)v40, (uint64_t)v36, (uint64_t)v26, v70, 0, v58, 0);
LABEL_11:
      v89 = (void *)v82;

      if (v89)
        goto LABEL_15;
      break;
    case 1:
      v64 = objc_alloc(MEMORY[0x24BE0C418]);
      objc_msgSend_usePrivateUpload(v8, v65, v66, v67, v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = 0;
      v71 = v64;
      v72 = (uint64_t)v40;
      v73 = (uint64_t)v36;
      v74 = (uint64_t)v26;
      v75 = v70;
      v76 = v58;
LABEL_9:
      v82 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_usePrivateUpload_performTaskStatus_performTrialTaskStatus_stop_(v71, v69, v72, v73, v74, v75, v76, 0, v91);
      goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
    sub_2403145E0();
  v89 = 0;
LABEL_15:

  return v89;
}

+ (id)createTrialdEvent:(id)a3 identifiers:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  void *v66;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = v10;
  v16 = (void *)MEMORY[0x24BDBCE60];
  if (v10)
  {
    v17 = objc_msgSend_intValue(v10, v11, v12, v13, v14);
    objc_msgSend_dateWithTimeIntervalSince1970_(v16, v18, v19, v20, v21, (double)v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateToGMTDate_(LBFUtils, v23, (uint64_t)v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_now(MEMORY[0x24BDBCE60], v11, v12, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_getContextId(LBFContextId, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_createTrialIdentifiers_(a1, v37, (uint64_t)v9, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_eventType(v8, v41, v42, v43, v44);
  switch(v45)
  {
    case 3:
      v54 = objc_alloc(MEMORY[0x24BE0C458]);
      objc_msgSend_succeeded(v8, v55, v56, v57, v58);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_eventType_eventSucceeded_(v54, v59, (uint64_t)v40, (uint64_t)v36, (uint64_t)v26, 3, v51);
      goto LABEL_10;
    case 2:
      v60 = objc_alloc(MEMORY[0x24BE0C458]);
      objc_msgSend_succeeded(v8, v61, v62, v63, v64);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_eventType_eventSucceeded_(v60, v65, (uint64_t)v40, (uint64_t)v36, (uint64_t)v26, 2, v51);
LABEL_10:
      v66 = (void *)v53;

      if (v66)
        goto LABEL_14;
      break;
    case 1:
      v46 = objc_alloc(MEMORY[0x24BE0C458]);
      objc_msgSend_succeeded(v8, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_initWithTrialIdentifiers_contextID_timestamp_eventType_eventSucceeded_(v46, v52, (uint64_t)v40, (uint64_t)v36, (uint64_t)v26, 1, v51);
      goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
    sub_2403145E0();
  v66 = 0;
LABEL_14:

  return v66;
}

+ (id)serializeBitacoraStateToJson:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift, sel_serializeBitacoraStateToJsonWithProtoData_, a3);
}

+ (id)protoFromTrialIdentifier:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
  objc_msgSend_experimentIdentifiers(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers);
    objc_msgSend_experimentIdentifiers(v3, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialExperimentID_(v14, v25, (uint64_t)v24, v26, v27);

    objc_msgSend_experimentIdentifiers(v3, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialDeploymentID_(v14, v38, (uint64_t)v37, v39, v40);

    objc_msgSend_experimentIdentifiers(v3, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v45, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialTreatmentID_(v14, v51, (uint64_t)v50, v52, v53);

    objc_msgSend_setExperimentIdentifiers_(v4, v54, (uint64_t)v14, v55, v56);
  }
  objc_msgSend_bmltIdentifiers(v3, v10, v11, v12, v13);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v58 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers);
    objc_msgSend_bmltIdentifiers(v3, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialTaskID_(v58, v69, (uint64_t)v68, v70, v71);

    objc_msgSend_bmltIdentifiers(v3, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v76, v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialDeploymentID_(v58, v82, (uint64_t)v81, v83, v84);

    objc_msgSend_setBmltIdentifiers_(v4, v85, (uint64_t)v58, v86, v87);
  }

  return v4;
}

+ (id)protoFromBiomeLighthousePluginEvent:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  LIGHTHOUSE_BITACORA_PROTOEventStatus *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
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
  uint64_t v109;
  LIGHTHOUSE_BITACORA_PROTOEventStatus *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  LIGHTHOUSE_BITACORA_PROTOEventStatus *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEvent);
  objc_msgSend_trialIdentifiers(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protoFromTrialIdentifier_(LBFBiomeStoreDataConverter, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrialIdentifiers_(v4, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_timestamp(v3, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v21, v22, v23, v24, v25);
  objc_msgSend_setTimestamp_(v4, v26, v27, v28, v29);

  objc_msgSend_contextID(v3, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextID_(v4, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_performTaskStatus(v3, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v47 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
    objc_msgSend_setPerformTaskStatus_(v4, v48, (uint64_t)v47, v49, v50);

    objc_msgSend_performTaskStatus(v3, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_succeeded(v55, v56, v57, v58, v59);
    objc_msgSend_performTaskStatus(v4, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSucceeded_(v65, v66, v60, v67, v68);

    objc_msgSend_performTaskStatus(v3, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDomain(v73, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performTaskStatus(v4, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDomain_(v83, v84, (uint64_t)v78, v85, v86);

    objc_msgSend_performTaskStatus(v3, v87, v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend_errorCode(v91, v92, v93, v94, v95);
    objc_msgSend_performTaskStatus(v4, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCode_(v101, v102, v96, v103, v104);

  }
  objc_msgSend_performTrialTaskStatus(v3, v43, v44, v45, v46);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v105)
  {
    v110 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
    objc_msgSend_setPerformTrialTaskStatus_(v4, v111, (uint64_t)v110, v112, v113);

    objc_msgSend_performTrialTaskStatus(v3, v114, v115, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_succeeded(v118, v119, v120, v121, v122);
    objc_msgSend_performTrialTaskStatus(v4, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSucceeded_(v128, v129, v123, v130, v131);

    objc_msgSend_performTrialTaskStatus(v3, v132, v133, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDomain(v136, v137, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performTrialTaskStatus(v4, v142, v143, v144, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDomain_(v146, v147, (uint64_t)v141, v148, v149);

    objc_msgSend_performTrialTaskStatus(v3, v150, v151, v152, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend_errorCode(v154, v155, v156, v157, v158);
    objc_msgSend_performTrialTaskStatus(v4, v160, v161, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCode_(v164, v165, v159, v166, v167);

  }
  objc_msgSend_stop(v3, v106, v107, v108, v109);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    v169 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
    objc_msgSend_setStop_(v4, v170, (uint64_t)v169, v171, v172);

    objc_msgSend_stop(v3, v173, v174, v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend_succeeded(v177, v178, v179, v180, v181);
    objc_msgSend_stop(v4, v183, v184, v185, v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSucceeded_(v187, v188, v182, v189, v190);

    objc_msgSend_stop(v3, v191, v192, v193, v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDomain(v195, v196, v197, v198, v199);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stop(v4, v201, v202, v203, v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDomain_(v205, v206, (uint64_t)v200, v207, v208);

    objc_msgSend_stop(v3, v209, v210, v211, v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_msgSend_errorCode(v213, v214, v215, v216, v217);
    objc_msgSend_stop(v4, v219, v220, v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCode_(v223, v224, v218, v225, v226);

  }
  return v4;
}

+ (id)protoFromBiomeMlruntimedEvent:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  LIGHTHOUSE_BITACORA_PROTOScheduleStatus *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
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
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  LIGHTHOUSE_BITACORA_PROTOTaskEvent *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent);
  objc_msgSend_trialIdentifiers(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protoFromTrialIdentifier_(LBFBiomeStoreDataConverter, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrialIdentifiers_(v4, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_timestamp(v3, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v21, v22, v23, v24, v25);
  objc_msgSend_setTimestamp_(v4, v26, v27, v28, v29);

  objc_msgSend_contextID(v3, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextID_(v4, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_activityScheduleStatus(v3, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v47 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOScheduleStatus);
    objc_msgSend_setActivityScheduleStatus_(v4, v48, (uint64_t)v47, v49, v50);

    objc_msgSend_activityScheduleStatus(v3, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_scheduled(v55, v56, v57, v58, v59);
    objc_msgSend_activityScheduleStatus(v4, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScheduled_(v65, v66, v60, v67, v68);

  }
  objc_msgSend_taskFetched(v3, v43, v44, v45, v46);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    v74 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
    objc_msgSend_setTaskFetched_(v4, v75, (uint64_t)v74, v76, v77);

    objc_msgSend_taskFetched(v3, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend_succeeded(v82, v83, v84, v85, v86);
    objc_msgSend_taskFetched(v4, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSucceeded_(v92, v93, v87, v94, v95);

    objc_msgSend_taskFetched(v3, v96, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDomain(v100, v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_taskFetched(v4, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDomain_(v110, v111, (uint64_t)v105, v112, v113);

    objc_msgSend_taskFetched(v3, v114, v115, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_errorCode(v118, v119, v120, v121, v122);
    objc_msgSend_taskFetched(v4, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCode_(v128, v129, v123, v130, v131);

  }
  objc_msgSend_taskScheduled(v3, v70, v71, v72, v73);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  if (v132)
  {
    v137 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
    objc_msgSend_setTaskScheduled_(v4, v138, (uint64_t)v137, v139, v140);

    objc_msgSend_taskScheduled(v3, v141, v142, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = objc_msgSend_succeeded(v145, v146, v147, v148, v149);
    objc_msgSend_taskScheduled(v4, v151, v152, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSucceeded_(v155, v156, v150, v157, v158);

    objc_msgSend_taskScheduled(v3, v159, v160, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDomain(v163, v164, v165, v166, v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_taskScheduled(v4, v169, v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDomain_(v173, v174, (uint64_t)v168, v175, v176);

    objc_msgSend_taskScheduled(v3, v177, v178, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = objc_msgSend_errorCode(v181, v182, v183, v184, v185);
    objc_msgSend_taskScheduled(v4, v187, v188, v189, v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCode_(v191, v192, v186, v193, v194);

  }
  objc_msgSend_taskCompleted(v3, v133, v134, v135, v136);
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  if (v195)
  {
    v196 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
    objc_msgSend_setTaskCompleted_(v4, v197, (uint64_t)v196, v198, v199);

    objc_msgSend_taskCompleted(v3, v200, v201, v202, v203);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = objc_msgSend_succeeded(v204, v205, v206, v207, v208);
    objc_msgSend_taskCompleted(v4, v210, v211, v212, v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSucceeded_(v214, v215, v209, v216, v217);

    objc_msgSend_taskCompleted(v3, v218, v219, v220, v221);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDomain(v222, v223, v224, v225, v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_taskCompleted(v4, v228, v229, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDomain_(v232, v233, (uint64_t)v227, v234, v235);

    objc_msgSend_taskCompleted(v3, v236, v237, v238, v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = objc_msgSend_errorCode(v240, v241, v242, v243, v244);
    objc_msgSend_taskCompleted(v4, v246, v247, v248, v249);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCode_(v250, v251, v245, v252, v253);

  }
  return v4;
}

+ (id)protoFromBiomeTrialdEvent:(id)a3
{
  id v3;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  v3 = a3;
  v4 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent);
  objc_msgSend_trialIdentifiers(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protoFromTrialIdentifier_(LBFBiomeStoreDataConverter, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrialIdentifiers_(v4, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_timestamp(v3, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v21, v22, v23, v24, v25);
  objc_msgSend_setTimestamp_(v4, v26, v27, v28, v29);

  objc_msgSend_contextID(v3, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextID_(v4, v35, (uint64_t)v34, v36, v37);

  v42 = objc_msgSend_eventType(v3, v38, v39, v40, v41);
  if (v42 - 1 >= 3)
    objc_msgSend_setEventType_(v4, v43, 0, v44, v45);
  else
    objc_msgSend_setEventType_(v4, v43, v42, v44, v45);
  v50 = objc_msgSend_eventSucceeded(v3, v46, v47, v48, v49);
  objc_msgSend_setEventSucceeded_(v4, v51, v50, v52, v53);

  return v4;
}

@end
