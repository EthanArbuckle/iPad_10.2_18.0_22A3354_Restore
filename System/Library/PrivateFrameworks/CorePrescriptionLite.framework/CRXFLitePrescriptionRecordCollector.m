@implementation CRXFLitePrescriptionRecordCollector

- (CRXFLitePrescriptionRecordCollector)initWithTimeout:(double)a3
{
  return -[CRXFLitePrescriptionRecordCollector initWithDeviceModel:timeout:](self, "initWithDeviceModel:timeout:", CFSTR("RealityDevice14,1"), a3);
}

- (CRXFLitePrescriptionRecordCollector)initWithDeviceModel:(id)a3 timeout:(double)a4
{
  id v6;
  CRXFLitePrescriptionRecordCollector *v7;
  os_log_t v8;
  OS_os_log *log;
  CRXFLiteHealthDataProvider *v10;
  CRXFLiteHealthDataProvider *healthDataProvider;
  double v12;
  CRXFCalibrationDataDownloader *v13;
  CRXFCalibrationDataDownloader *calibrationDataDownloader;
  CRXFKeychainAccess *v15;
  CRXFKeychainAccess *keychainAccess;
  uint64_t v17;
  CRXUDispatchQueue *serialQueue;
  uint64_t v19;
  CRXFAppClipCodeTranscoder *accTranscoder;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRXFLitePrescriptionRecordCollector;
  v7 = -[CRXFLitePrescriptionRecordCollector init](&v22, sel_init);
  if (v7)
  {
    v8 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = -[CRXFLiteHealthDataProvider initWithDeviceModel:]([CRXFLiteHealthDataProvider alloc], "initWithDeviceModel:", v6);
    healthDataProvider = v7->_healthDataProvider;
    v7->_healthDataProvider = v10;

    if (a4 >= 2.0)
      v12 = a4 + -1.0;
    else
      v12 = 1.0;
    v13 = -[CRXFCalibrationDataDownloader initWithServer:serverVersion:timeout:]([CRXFCalibrationDataDownloader alloc], "initWithServer:serverVersion:timeout:", 0, 0, v12);
    calibrationDataDownloader = v7->_calibrationDataDownloader;
    v7->_calibrationDataDownloader = v13;

    v15 = -[CRXFKeychainAccess initWithDeviceModel:]([CRXFKeychainAccess alloc], "initWithDeviceModel:", v6);
    keychainAccess = v7->_keychainAccess;
    v7->_keychainAccess = v15;

    +[CRXUDispatchQueue concurrentQueueWithName:](CRXUDispatchQueue, "concurrentQueueWithName:", CFSTR("PrescriptionRecordCollector.SerialQueue"));
    v17 = objc_claimAutoreleasedReturnValue();
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (CRXUDispatchQueue *)v17;

    +[CRXFAppClipCodeTranscoder sharedInstance](CRXFAppClipCodeTranscoder, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    accTranscoder = v7->_accTranscoder;
    v7->_accTranscoder = (CRXFAppClipCodeTranscoder *)v19;

  }
  return v7;
}

- (void)fetchPrescriptionRecordsWithCompletion:(id)a3
{
  CRXUDispatchGroup *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CRXUDispatchQueue *serialQueue;
  CRXFLiteHealthDataProvider *healthDataProvider;
  id v13;
  CRXUDispatchGroup *v14;
  CRXFKeychainAccess *keychainAccess;
  id v16;
  CRXUDispatchGroup *v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  OS_os_log *v27;
  void *v28;
  void *v29;
  void *v30;
  CRXFCalibrationDataDownloader *calibrationDataDownloader;
  void *v32;
  CRXUDispatchQueue *v33;
  CRXFCalibrationDataDownloader *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  OS_os_log *v41;
  void *v42;
  void *v43;
  void *v44;
  CRXFCalibrationDataDownloader *v45;
  void *v46;
  CRXUDispatchQueue *v47;
  CRXUDispatchQueue *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  int v55;
  id obj;
  uint64_t v57;
  CRXUDispatchGroup *v58;
  _QWORD v59[5];
  id v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t *v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD v69[6];
  CRXUDispatchGroup *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  _QWORD v81[6];
  CRXUDispatchGroup *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[5];
  id v96;
  CRXUDispatchGroup *v97;
  _QWORD *v98;
  _QWORD v99[5];
  id v100;
  CRXUDispatchGroup *v101;
  _QWORD *v102;
  _QWORD v103[5];
  _QWORD v104[4];
  _QWORD v105[4];
  _QWORD v106[4];
  _QWORD v107[5];
  id v108;
  _QWORD v109[5];
  id v110;
  uint8_t v111[128];
  uint8_t buf[4];
  const char *v113;
  __int16 v114;
  int v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v52 = a3;
  v4 = -[CRXUDispatchGroup initWithName:]([CRXUDispatchGroup alloc], "initWithName:", CFSTR("PrescriptionRecordCollectorGroup"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x3032000000;
  v109[3] = __Block_byref_object_copy_;
  v109[4] = __Block_byref_object_dispose_;
  v110 = 0;
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x3032000000;
  v107[3] = __Block_byref_object_copy_;
  v107[4] = __Block_byref_object_dispose_;
  v108 = 0;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x2020000000;
  v106[3] = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  v105[3] = 0;
  v104[0] = 0;
  v104[1] = v104;
  v104[2] = 0x2020000000;
  v104[3] = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  serialQueue = self->_serialQueue;
  v103[0] = MEMORY[0x24BDAC760];
  v103[1] = 3221225472;
  v103[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke;
  v103[3] = &unk_250B043B0;
  v103[4] = self;
  -[CRXUDispatchQueue dispatchSync:](serialQueue, "dispatchSync:", v103);
  -[CRXUDispatchGroup enter](v4, "enter");
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:].cold.4();
  healthDataProvider = self->_healthDataProvider;
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_331;
  v99[3] = &unk_250B04428;
  v99[4] = self;
  v13 = v6;
  v100 = v13;
  v102 = v109;
  v14 = v4;
  v101 = v14;
  -[CRXFLiteHealthDataProvider fetchHealthRecordsWithCompletion:](healthDataProvider, "fetchHealthRecordsWithCompletion:", v99);
  -[CRXUDispatchGroup enter](v14, "enter");
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:].cold.3();
  keychainAccess = self->_keychainAccess;
  v95[0] = MEMORY[0x24BDAC760];
  v95[1] = 3221225472;
  v95[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_337;
  v95[3] = &unk_250B04428;
  v95[4] = self;
  v16 = v7;
  v96 = v16;
  v98 = v107;
  v17 = v14;
  v97 = v17;
  -[CRXFKeychainAccess fetchASAKeysWithCompletion:](keychainAccess, "fetchASAKeysWithCompletion:", v95);
  -[CRXUDispatchGroup waitFor:](v17, "waitFor:", 1.0);
  v58 = v17;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_sync_enter(v18);
  objc_msgSend(v53, "addObjectsFromArray:", v18);
  objc_sync_exit(v18);
  v51 = v18;

  v19 = v16;
  objc_sync_enter(v19);
  objc_msgSend(v54, "addObjectsFromArray:", v19);
  objc_sync_exit(v19);
  v50 = v19;

  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v13;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
  v21 = &unk_239FDE000;
  if (v20)
  {
    v22 = 0;
    v23 = *(_QWORD *)v88;
    do
    {
      v24 = 0;
      v25 = v22;
      do
      {
        if (*(_QWORD *)v88 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v24);
        -[CRXUDispatchGroup enter](v58, "enter");
        v27 = self->_log;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25 + v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x24BDD16E0];
          -[CRXFCalibrationDataDownloader timeout](self->_calibrationDataDownloader, "timeout");
          objc_msgSend(v29, "numberWithDouble:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v113 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]";
          v114 = 1024;
          v115 = 385;
          v116 = 2114;
          v117 = v28;
          v118 = 2114;
          v119 = v30;
          _os_log_impl(&dword_239FC4000, (os_log_t)v27, OS_LOG_TYPE_INFO, "%s @%d: Downloading calibration for health record #%{public}@ with timeout %{public}@", buf, 0x26u);

        }
        calibrationDataDownloader = self->_calibrationDataDownloader;
        objc_msgSend(v26, "accPayload");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = self->_serialQueue;
        v81[0] = MEMORY[0x24BDAC760];
        v81[1] = 3221225472;
        v81[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_338;
        v81[3] = &unk_250B04450;
        v83 = v104;
        v84 = v105;
        v85 = v106;
        v86 = v25 + v24;
        v81[4] = self;
        v81[5] = v26;
        v82 = v58;
        v34 = calibrationDataDownloader;
        v21 = (_QWORD *)&unk_239FDE000;
        -[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:](v34, "downloadCalibrationDataForACCPayload:completionQueue:completion:", v32, v33, v81);

        ++v24;
      }
      while (v20 != v24);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
      v22 = v25 + v24;
    }
    while (v20);
    v35 = v25 + v24;
  }
  else
  {
    v35 = 0;
  }

  v92[3] = v35;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:].cold.2();
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  v80[3] = 0;
  if (v54)
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v36 = v54;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
    if (v37)
    {
      v38 = 0;
      v57 = *(_QWORD *)v77;
      v55 = v21[368];
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v77 != v57)
            objc_enumerationMutation(v36);
          v40 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          -[CRXUDispatchGroup enter](v58, "enter");
          v41 = self->_log;
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v38 + i);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)MEMORY[0x24BDD16E0];
            -[CRXFCalibrationDataDownloader timeout](self->_calibrationDataDownloader, "timeout");
            objc_msgSend(v43, "numberWithDouble:");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v55;
            v113 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]";
            v114 = 1024;
            v115 = 426;
            v116 = 2114;
            v117 = v42;
            v118 = 2114;
            v119 = v44;
            _os_log_impl(&dword_239FC4000, (os_log_t)v41, OS_LOG_TYPE_INFO, "%s @%d: Downloading calibration for ASA key #%{public}@ with timeout %{public}@", buf, 0x26u);

          }
          v45 = self->_calibrationDataDownloader;
          objc_msgSend(v40, "privateKey");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = self->_serialQueue;
          v69[0] = MEMORY[0x24BDAC760];
          v69[1] = 3221225472;
          v69[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_340;
          v69[3] = &unk_250B04478;
          v71 = v104;
          v72 = v105;
          v69[4] = self;
          v69[5] = v40;
          v73 = v80;
          v74 = v106;
          v75 = v38 + i;
          v70 = v58;
          -[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:](v45, "downloadCalibrationDataForASAKey:completionQueue:completion:", v46, v47, v69);

        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
        v38 += i;
      }
      while (v37);
    }

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:].cold.1();
  }
  v48 = self->_serialQueue;
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_341;
  v59[3] = &unk_250B044A0;
  v68 = v10;
  v59[4] = self;
  v61 = v105;
  v62 = v104;
  v63 = v109;
  v64 = v107;
  v65 = &v91;
  v66 = v80;
  v67 = v106;
  v49 = v52;
  v60 = v49;
  -[CRXUDispatchGroup notifyOnQueue:withBlock:](v58, "notifyOnQueue:withBlock:", v48, v59);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(v104, 8);
  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v106, 8);
  _Block_object_dispose(v107, 8);

  _Block_object_dispose(v109, 8);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  __int128 v19;

  v5 = a2;
  v6 = a3;
  v14[0] = MEMORY[0x24BDAC760];
  v14[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2;
  v14[3] = &unk_250B04400;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 40);
  v14[1] = 3221225472;
  v15 = v5;
  v16 = v7;
  v17 = v8;
  v18 = v6;
  v13 = *(_OWORD *)(a1 + 48);
  v10 = (id)v13;
  v19 = v13;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v9, "dispatchAsync:", v14);

}

uint64_t __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void **v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  void *v32;
  uint64_t v33;
  id obj;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v1 = a1;
  v48 = *MEMORY[0x24BDAC8D0];
  v2 = (void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_2(v2, v3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *v2;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v38;
      v9 = *MEMORY[0x24BDD4418];
      v10 = *MEMORY[0x24BDD31A0];
      *(_QWORD *)&v6 = 136315650;
      v30 = v6;
      v32 = v4;
      do
      {
        v11 = 0;
        v33 = v7;
        do
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
          objc_msgSend(v12, "metadata", v30);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "crxu_dataForKey:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v12, "metadata");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "crxu_containsKey:", v10);

            if (v16)
            {
              v17 = v10;
              v18 = v8;
              objc_msgSend(v4, "objectForKey:", v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (!v19)
                goto LABEL_15;
              objc_msgSend(v19, "_creationDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "_creationDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "crxu_isBefore:", v22);

              v4 = v32;
              if (v23)
              {
                v24 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  v25 = v24;
                  objc_msgSend(v14, "crxu_asHexString");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v30;
                  v42 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
                  v43 = 1024;
                  v44 = 306;
                  v45 = 2112;
                  v46 = v26;
                  _os_log_debug_impl(&dword_239FC4000, v25, OS_LOG_TYPE_DEBUG, "%s @%d: Discarding health record with duplicate ACC %@", buf, 0x1Cu);

                  v4 = v32;
                }
LABEL_15:
                objc_msgSend(v4, "setObject:forKey:", v12, v14);
              }

              v8 = v18;
              v10 = v17;
              v7 = v33;
            }
          }

          ++v11;
        }
        while (v7 != v11);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v7);
    }

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_334;
    v35[3] = &unk_250B043D8;
    v27 = v4;
    v1 = a1;
    v28 = *(void **)(a1 + 48);
    v35[4] = *(_QWORD *)(a1 + 40);
    v36 = v28;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v35);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
    if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(v1 + 40) + 8), OS_LOG_TYPE_DEBUG))
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_1();
  }
  return objc_msgSend(*(id *)(v1 + 64), "leave");
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_334(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crxu_stringForKey:", *MEMORY[0x24BDD31A0]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dateIssued");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "prescriptionRecordWithEnrollmentName:enrollmentDate:accPayload:", v11, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }

}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_337(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_337_cold_2(v7, v5);
    v8 = *(id *)(a1 + 40);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);
    objc_sync_exit(v8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_337_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 48), "leave");

}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_338(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 56))
  {
    v10 = *(NSObject **)(v9 + 8);
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)MEMORY[0x24BDD16E0];
        v12 = *(_QWORD *)(a1 + 80);
        v13 = v10;
        objc_msgSend(v11, "numberWithUnsignedInteger:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 136315650;
        v19 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
        v20 = 1024;
        v21 = 395;
        v22 = 2114;
        v23 = v14;
        _os_log_impl(&dword_239FC4000, v13, OS_LOG_TYPE_INFO, "%s @%d: Calibration download for health record #%{public}@ completed", (uint8_t *)&v18, 0x1Cu);

      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  + a4;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_338_cold_1(a1, v10);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v7, "leftCalibrationData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightCalibrationData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addLeftCalibrationData:rightCalibrationData:", v16, v17);

  }
  objc_msgSend(*(id *)(a1 + 48), "leave");

}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_340(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 56))
  {
    v10 = *(NSObject **)(v9 + 8);
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)MEMORY[0x24BDD16E0];
        v12 = *(_QWORD *)(a1 + 88);
        v13 = v10;
        objc_msgSend(v11, "numberWithUnsignedInteger:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136315650;
        v23 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
        v24 = 1024;
        v25 = 436;
        v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_239FC4000, v13, OS_LOG_TYPE_INFO, "%s @%d: Calibration download for ASA key #%{public}@ completed", (uint8_t *)&v22, 0x1Cu);

      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  + a4;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v15 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "creationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accPayload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "prescriptionRecordWithEnrollmentName:enrollmentDate:accPayload:", v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v7, "leftCalibrationData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "rightCalibrationData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addLeftCalibrationData:rightCalibrationData:", v20, v21);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v19);
      }

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_340_cold_1(a1, v10);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "leave");

}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_341(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  CRXFLitePrescriptionRecordFetchSummary *v8;
  NSObject *v9;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = 0;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6 - *(double *)(a1 + 104);

  v8 = -[CRXFLitePrescriptionRecordFetchSummary initWithHealthKitError:keychainError:healthRecordCount:asaKeyCount:calibrationDataDownloadFailureCount:meanCalibrationDataDownloadTime:totalFetchTime:]([CRXFLitePrescriptionRecordFetchSummary alloc], "initWithHealthKitError:keychainError:healthRecordCount:asaKeyCount:calibrationDataDownloadFailureCount:meanCalibrationDataDownloadTime:totalFetchTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)/ (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v7);
  +[CRXFLiteAnalytics addRecordFetchEventWithFetchSummary:](CRXFLiteAnalytics, "addRecordFetchEventWithFetchSummary:", v8);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_341_cold_1(v9, v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)prescriptionRecordWithEnrollmentName:(id)a3 enrollmentDate:(id)a4 accPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRXFAppClipCodeTranscoder *accTranscoder;
  void *v12;
  id v13;
  CRXFLiteRXValues *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  double v20;
  double v21;
  CRXFLiteRXValues *v22;
  CRXFLiteRXValues *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  double v29;
  double v30;
  CRXFLiteRXValues *v31;
  CRXFLitePrescriptionRecord *v32;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accTranscoder = self->_accTranscoder;
  v34 = 0;
  -[CRXFAppClipCodeTranscoder decodeAppClipCodeFromData:allowUnsupportedRX:error:](accTranscoder, "decodeAppClipCodeFromData:allowUnsupportedRX:error:", v10, 0, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;
  if (v12)
  {
    v14 = [CRXFLiteRXValues alloc];
    objc_msgSend(v12, "leftDisplaySphere");
    v16 = v15;
    objc_msgSend(v12, "leftDisplayCylinder");
    v18 = v17;
    v19 = objc_msgSend(v12, "leftDisplayAxis");
    LODWORD(v20) = v16;
    LODWORD(v21) = v18;
    v22 = -[CRXFLiteRXValues initWithSphere:cylinder:axis:](v14, "initWithSphere:cylinder:axis:", v19, v20, v21);
    v23 = [CRXFLiteRXValues alloc];
    objc_msgSend(v12, "rightDisplaySphere");
    v25 = v24;
    objc_msgSend(v12, "rightDisplayCylinder");
    v27 = v26;
    v28 = objc_msgSend(v12, "rightDisplayAxis");
    LODWORD(v29) = v25;
    LODWORD(v30) = v27;
    v31 = -[CRXFLiteRXValues initWithSphere:cylinder:axis:](v23, "initWithSphere:cylinder:axis:", v28, v29, v30);
    v32 = -[CRXFLitePrescriptionRecord initWithACCPayload:enrollmentName:enrollmentDate:leftEyeRX:rightEyeRX:]([CRXFLitePrescriptionRecord alloc], "initWithACCPayload:enrollmentName:enrollmentDate:leftEyeRX:rightEyeRX:", v10, v8, v9, v22, v31);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[CRXFLitePrescriptionRecordCollector prescriptionRecordWithEnrollmentName:enrollmentDate:accPayload:].cold.1();
    v32 = 0;
  }

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_accTranscoder, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_keychainAccess, 0);
  objc_storeStrong((id *)&self->_calibrationDataDownloader, 0);
  objc_storeStrong((id *)&self->_healthDataProvider, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_239FC4000, v0, v1, "%s @%d: Done processing ASA keys", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_239FC4000, v0, v1, "%s @%d: Done processing health records", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_239FC4000, v0, v1, "%s @%d: Fetching ASA keys", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_239FC4000, v0, v1, "%s @%d: Fetching health records", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  v3 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke_2";
  v4 = 1024;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_239FC4000, v0, v1, "%s @%d: Failed to fetch health records: %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_2(void **a1, void *a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7[10];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *a1;
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_239FC4000, v4, v6, "%s @%d: Fetched %{public}@ health records", (uint8_t *)v7);

  OUTLINED_FUNCTION_1_2();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_337_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Failed to fetch ASA keys: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_337_cold_2(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7[10];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_239FC4000, v4, v6, "%s @%d: Fetched %{public}@ ASA keys", (uint8_t *)v7);

  OUTLINED_FUNCTION_1_2();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_338_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(_QWORD *)(a1 + 80);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_239FC4000, v6, v7, "%s @%d: Calibration download for health record #%{public}@ failed: %{public}@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_2();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_340_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(_QWORD *)(a1 + 88);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_239FC4000, v6, v7, "%s @%d: Calibration download for ASA key #%{public}@ failed: %{public}@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_2();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_341_cold_1(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7[10];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_239FC4000, v4, v6, "%s @%d: %{public}@ enrollment records collected", (uint8_t *)v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)prescriptionRecordWithEnrollmentName:enrollmentDate:accPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Failed to decode ACC: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
