@implementation CWFSensingHMADataCollector

+ (id)createCWFSensingHMADataCollectorFor:(id)a3 withOptions:(id)a4 andDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  CWFSensingHMADataCollector *v10;
  const char *v11;
  void *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    CWFGetOSLog();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      CWFGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
LABEL_13:
    _os_log_send_and_compose_impl();
LABEL_14:

    v12 = 0;
    goto LABEL_3;
  }
  v10 = [CWFSensingHMADataCollector alloc];
  v12 = (void *)objc_msgSend_initWithAccessory_andOptions_andDelegate_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
  if (!v12)
  {
    CWFGetOSLog();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_3:

  return v12;
}

- (CWFSensingHMADataCollector)initWithAccessory:(id)a3 andOptions:(id)a4 andDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  CWFSensingHMADataCollector *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFSensingHMADataCollector *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  dispatch_queue_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;
  int v67;
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v66.receiver = self;
  v66.super_class = (Class)CWFSensingHMADataCollector;
  v11 = -[CWFSensingHMADataCollector init](&v66, sel_init);
  v15 = v11;
  if (!v11)
    goto LABEL_9;
  objc_msgSend_set_accessory_(v11, v12, (uint64_t)v8, v13, v14);
  objc_msgSend__accessory(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {

    CWFGetOSLog();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      CWFGetOSLog();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = MEMORY[0x1E0C81028];
      v63 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    v71 = 1024;
    v72 = 88;
    goto LABEL_25;
  }
  v21 = dispatch_queue_create("com.apple.wifi.CWFSensingHMADataCollector", 0);
  objc_msgSend_set_serviceQueue_(v15, v22, (uint64_t)v21, v23, v24);

  objc_msgSend__serviceQueue(v15, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {

    CWFGetOSLog();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      CWFGetOSLog();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = MEMORY[0x1E0C81028];
      v64 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    v71 = 1024;
    v72 = 94;
    goto LABEL_25;
  }
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v34, v35, (uint64_t)v15, (uint64_t)sel_handleSensingResult_, (uint64_t)CFSTR("SensingResult"), 0);

  objc_msgSend_set_delegate_(v15, v36, (uint64_t)v10, v37, v38);
  objc_msgSend__delegate(v15, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {

    CWFGetOSLog();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      CWFGetOSLog();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = MEMORY[0x1E0C81028];
      v65 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    v71 = 1024;
    v72 = 103;
LABEL_25:
    _os_log_send_and_compose_impl();
LABEL_26:

    v15 = 0;
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend_set_sensingParams_(v15, v44, (uint64_t)v9, v46, v47);
  }
  else
  {
    objc_msgSend_getSensingParams(v15, v44, v45, v46, v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_sensingParams_(v15, v52, (uint64_t)v51, v53, v54);

  }
  objc_msgSend_set_serviceRegistrationError_(v15, v48, 0, v49, v50);
  objc_msgSend_set_attempt_(v15, v55, 0, v56, v57);
LABEL_9:

  return v15;
}

- (id)currentRoomIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend__accessory(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_room(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueIdentifier(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getSensingParams
{
  CWFSensingParameters *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t matched;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
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
  void *v100;
  const char *v101;
  uint64_t v102;

  v2 = objc_alloc_init(CWFSensingParameters);
  objc_msgSend_setSubmitMetric_(v2, v3, 1, v4, v5);
  objc_msgSend_setScheduleDailyAt_(v2, v6, -2, v7, v8);
  objc_msgSend_setScheduleOnceAfter_(v2, v9, 0, v10, v11);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend_numberOfReports(v2, v18, v19, v20, v21);
  objc_msgSend_numberWithInteger_(v17, v23, v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v27, (uint64_t)v26, (uint64_t)CFSTR("SENSING_PARAMS_NUMBER_OF_REPORTS"), v28);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  matched = objc_msgSend_matchFrameType(v2, v30, v31, v32, v33);
  objc_msgSend_numberWithInt_(v29, v35, matched, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v39, (uint64_t)v38, (uint64_t)CFSTR("SENSING_PARAMS_MATCH_FRAME_TYPE"), v40);

  objc_msgSend_matchMACAddresses(v2, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v46, (uint64_t)v45, (uint64_t)CFSTR("SENSING_PARAMS_MATCH_MAC_ADDRESS"), v47);

  v48 = (void *)MEMORY[0x1E0CB37E8];
  v53 = objc_msgSend_timeout(v2, v49, v50, v51, v52);
  objc_msgSend_numberWithInteger_(v48, v54, v53, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v58, (uint64_t)v57, (uint64_t)CFSTR("SENSING_PARAMS_TIMEOUT"), v59);

  v60 = (void *)MEMORY[0x1E0CB37E8];
  v65 = objc_msgSend_submitMetric(v2, v61, v62, v63, v64);
  objc_msgSend_numberWithBool_(v60, v66, v65, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v70, (uint64_t)v69, (uint64_t)CFSTR("SENSING_PARAMS_SUBMIT_METRIC"), v71);

  v72 = (void *)MEMORY[0x1E0CB37E8];
  v77 = objc_msgSend_scheduleDailyAt(v2, v73, v74, v75, v76);
  objc_msgSend_numberWithInteger_(v72, v78, v77, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v82, (uint64_t)v81, (uint64_t)CFSTR("SENSING_PARAMS_SCHEDULE_DAILY_AT"), v83);

  objc_msgSend_placeLabels(v2, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v89, (uint64_t)v88, (uint64_t)CFSTR("SENSING_PARAMS_PLACE_LABELS"), v90);

  v91 = (void *)MEMORY[0x1E0CB37E8];
  v96 = objc_msgSend_scheduleOnceAfter(v2, v92, v93, v94, v95);
  objc_msgSend_numberWithInteger_(v91, v97, v96, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v101, (uint64_t)v100, (uint64_t)CFSTR("SENSING_PARAMS_SCHEDULE_ONCE_AFTER"), v102);

  return v16;
}

- (void)registerForPrimaryServiceNotificationWith:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  NSObject *v53;
  id v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  int *v64;
  uint64_t v65;
  id v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  CWFSensingHMADataCollector *v71;
  _QWORD block[5];
  id v73;
  _QWORD v74[7];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  dispatch_group_t v88;
  int v89;
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v71 = self;
  objc_msgSend__accessory(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v8, v9, (uint64_t)self, v10, v11);

  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = sub_1B063EAB0;
  v87 = sub_1B063EA20;
  v88 = dispatch_group_create();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend__accessory(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_services(v16, v17, v18, v19, v20);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v79, (uint64_t)v92, 16);
  if (v69)
  {
    v68 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v80 != v68)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        if (objc_msgSend_isPrimaryService(v26, v22, v23, v24, v25, v64, v65))
        {
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          objc_msgSend_characteristics(v26, v22, v23, v24, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v75, (uint64_t)v91, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v76;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v76 != v34)
                  objc_enumerationMutation(v27);
                v36 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                objc_msgSend_properties(v36, v29, v30, v31, v32, v64, v65);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                off_1ECFD69C8();
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_containsObject_(v37, v39, (uint64_t)v38, v40, v41) & 1) != 0)
                {
                  objc_msgSend_properties(v36, v42, v43, v44, v45);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  off_1ECFD69D0();
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend_containsObject_(v46, v48, (uint64_t)v47, v49, v50);

                  if (v51)
                  {
                    CWFGetOSLog();
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v52)
                    {
                      CWFGetOSLog();
                      v53 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v53 = MEMORY[0x1E0C81028];
                      v54 = MEMORY[0x1E0C81028];
                    }

                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                    {
                      v89 = 138543362;
                      v90 = v36;
                      LODWORD(v65) = 12;
                      v64 = &v89;
                      _os_log_send_and_compose_impl();
                    }

                    dispatch_group_enter((dispatch_group_t)v84[5]);
                    v74[0] = MEMORY[0x1E0C809B0];
                    v74[1] = 3221225472;
                    v74[2] = sub_1B06C0180;
                    v74[3] = &unk_1E6134658;
                    v74[4] = v71;
                    v74[5] = v36;
                    v74[6] = &v83;
                    objc_msgSend_enableNotification_completionHandler_(v36, v55, 1, (uint64_t)v74, v56);
                  }
                }
                else
                {

                }
              }
              v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v75, (uint64_t)v91, 16);
            }
            while (v33);
          }

        }
      }
      v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v79, (uint64_t)v92, 16);
    }
    while (v69);
  }

  v57 = v84[5];
  objc_msgSend__serviceQueue(v71, v58, v59, v60, v61);
  v62 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06C02BC;
  block[3] = &unk_1E61338F0;
  block[4] = v71;
  v73 = v66;
  v63 = v66;
  dispatch_group_notify(v57, v62, block);

  _Block_object_dispose(&v83, 8);
}

- (void)deregisterForPrimaryServiceNotificationWith:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  id v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  CWFSensingHMADataCollector *v58;
  _QWORD block[5];
  id v60;
  _QWORD v61[7];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_group_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = sub_1B063EAB0;
  v74 = sub_1B063EA20;
  v75 = dispatch_group_create();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v58 = self;
  objc_msgSend__accessory(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_services(v8, v9, v10, v11, v12);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v66, (uint64_t)v77, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v67 != v55)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend_isPrimaryService(v18, v14, v15, v16, v17))
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          objc_msgSend_characteristics(v18, v14, v15, v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v62, (uint64_t)v76, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v63 != v26)
                  objc_enumerationMutation(v19);
                v28 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend_properties(v28, v21, v22, v23, v24);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                off_1ECFD69C8();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_containsObject_(v29, v31, (uint64_t)v30, v32, v33) & 1) != 0)
                {
                  objc_msgSend_properties(v28, v34, v35, v36, v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  off_1ECFD69D0();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend_containsObject_(v38, v40, (uint64_t)v39, v41, v42);

                  if (v43)
                  {
                    dispatch_group_enter((dispatch_group_t)v71[5]);
                    v61[0] = MEMORY[0x1E0C809B0];
                    v61[1] = 3221225472;
                    v61[2] = sub_1B06C080C;
                    v61[3] = &unk_1E6134658;
                    v61[4] = v58;
                    v61[5] = v28;
                    v61[6] = &v70;
                    objc_msgSend_enableNotification_completionHandler_(v28, v44, 0, (uint64_t)v61, v45);
                  }
                }
                else
                {

                }
              }
              v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v62, (uint64_t)v76, 16);
            }
            while (v25);
          }

        }
      }
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v66, (uint64_t)v77, 16);
    }
    while (v56);
  }

  v46 = v71[5];
  objc_msgSend__serviceQueue(v58, v47, v48, v49, v50);
  v51 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06C0948;
  block[3] = &unk_1E61338F0;
  block[4] = v58;
  v60 = v53;
  v52 = v53;
  dispatch_group_notify(v46, v51, block);

  _Block_object_dispose(&v70, 8);
}

- (void)handleSensingResult:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int isEqual;
  void *v28;
  NSObject *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;

  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("CWF_ACCESSORY_UUID"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__accessory(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueIdentifier(v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v13, v24, (uint64_t)v23, v25, v26);

  if (isEqual)
  {
    CWFGetOSLog();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v30 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userInfo(v4, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)CFSTR("WiFiInterfaceReturn"), v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(v4, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v44, v45, (uint64_t)CFSTR("SensingResult"), v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
  }

}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CWFSensingHMADataCollector *v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = v10;
  if (v8 && v9 && v10)
  {
    objc_msgSend__serviceQueue(self, v11, v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1B06C0C54;
    v17[3] = &unk_1E6134210;
    v18 = v9;
    v19 = v15;
    v20 = self;
    v21 = v8;
    dispatch_async(v16, v17);

  }
}

- (NSDictionary)_sensingParams
{
  return self->__sensingParams;
}

- (void)set_sensingParams:(id)a3
{
  objc_storeStrong((id *)&self->__sensingParams, a3);
}

- (HMAccessory)_accessory
{
  return self->__accessory;
}

- (void)set_accessory:(id)a3
{
  objc_storeStrong((id *)&self->__accessory, a3);
}

- (NSError)_serviceRegistrationError
{
  return self->__serviceRegistrationError;
}

- (void)set_serviceRegistrationError:(id)a3
{
  objc_storeStrong((id *)&self->__serviceRegistrationError, a3);
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (CWFSensingHMADataCollectorDelegate)_delegate
{
  return self->__delegate;
}

- (void)set_delegate:(id)a3
{
  objc_storeStrong((id *)&self->__delegate, a3);
}

- (int64_t)_attempt
{
  return self->__attempt;
}

- (void)set_attempt:(int64_t)a3
{
  self->__attempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delegate, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__serviceRegistrationError, 0);
  objc_storeStrong((id *)&self->__accessory, 0);
  objc_storeStrong((id *)&self->__sensingParams, 0);
}

@end
