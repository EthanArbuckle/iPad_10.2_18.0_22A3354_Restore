@implementation CKLLog

+ (id)preparedStreamFromStore:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  const char *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1BE9BB078;
  v17 = sub_1BE9BADF0;
  v18 = 0;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend_setUpgradeConfirmationHandler_(v3, v5, (uint64_t)&unk_1E7833ED0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEB2C044;
  v10[3] = &unk_1E7833EF8;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend_prepareWithCompletionHandler_(v3, v7, (uint64_t)v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)preparedLiveStreamFromLiveStore:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  const char *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1BE9BB078;
  v16 = sub_1BE9BADF0;
  v17 = 0;
  v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEB2C1DC;
  v9[3] = &unk_1E7833F20;
  v11 = &v12;
  v5 = v4;
  v10 = v5;
  objc_msgSend_prepareWithCompletionHandler_(v3, v6, (uint64_t)v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)initInternal
{
  CKLLog *v2;
  uint64_t v3;
  NSMutableArray *streamObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKLLog;
  v2 = -[CKLLog init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    streamObservers = v2->_streamObservers;
    v2->_streamObservers = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)initForHostStream
{
  uint64_t v2;
  uint64_t inited;
  const char *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  inited = objc_msgSend_initInternal(self, a2, v2);
  v6 = (_QWORD *)inited;
  if (inited)
  {
    *(_QWORD *)(inited + 40) = 0;
    objc_msgSend_localStore(MEMORY[0x1E0D44698], v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preparedStreamFromStore_(CKLLog, v8, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v6[6];
    v6[6] = v9;

    objc_msgSend_liveLocalStore(MEMORY[0x1E0D44670], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preparedLiveStreamFromLiveStore_(CKLLog, v14, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v6[7];
    v6[7] = v15;

  }
  return v6;
}

- (CKLLog)initWithArchiveAtURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t inited;
  const char *v8;
  CKLLog *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  OSLogEventStream *logEventStream;

  v4 = a3;
  inited = objc_msgSend_initInternal(self, v5, v6);
  v9 = (CKLLog *)inited;
  if (inited)
  {
    *(_QWORD *)(inited + 40) = 1;
    objc_msgSend_storeWithArchiveURL_(MEMORY[0x1E0D44698], v8, (uint64_t)v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preparedStreamFromStore_(CKLLog, v11, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
    logEventStream = v9->_logEventStream;
    v9->_logEventStream = (OSLogEventStream *)v12;

  }
  return v9;
}

- (void)addStreamObserver:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_streamObservers(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v7, (uint64_t)v4);

}

- (void)streamLogsWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  id completionHandler;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  id v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  id v79;
  void *context;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD aBlock[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  id location;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  context = (void *)MEMORY[0x1C3B83E24]();
  v6 = (void *)objc_msgSend_copy(v79, v4, v5);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  v10 = objc_msgSend_wantsSimulatorLogs(self, v8, v9);
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend_streamObservers(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v93, v97, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v94 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        objc_msgSend_setSimulatorOnly_(v19, v15, v10);
        v22 = objc_msgSend_onlyTestLogs(self, v20, v21);
        objc_msgSend_setOnlyTestLogs_(v19, v23, v22);
        v26 = objc_msgSend_colorOutput(self, v24, v25);
        objc_msgSend_setColorOutput_(v19, v27, v26);
        objc_msgSend_processName(self, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProcessName_(v19, v31, (uint64_t)v30);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v93, v97, 16);
    }
    while (v16);
  }

  objc_initWeak(&location, self);
  objc_msgSend_logEventStream(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x1E0C809B0];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = sub_1BEB2C930;
  v90[3] = &unk_1E7833F48;
  objc_copyWeak(&v91, &location);
  objc_msgSend_setEventHandler_(v34, v36, (uint64_t)v90);

  objc_msgSend_liveStream(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v35;
  v88[1] = 3221225472;
  v88[2] = sub_1BEB2CA58;
  v88[3] = &unk_1E7833F48;
  objc_copyWeak(&v89, &location);
  objc_msgSend_setEventHandler_(v39, v40, (uint64_t)v88);

  aBlock[0] = v35;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB2CB80;
  aBlock[3] = &unk_1E7833F70;
  objc_copyWeak(&v87, &location);
  v41 = _Block_copy(aBlock);
  objc_msgSend_logEventStream(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v35;
  v83[1] = 3221225472;
  v83[2] = sub_1BEB2CCF8;
  v83[3] = &unk_1E7833F98;
  objc_copyWeak(&v85, &location);
  v45 = v41;
  v84 = v45;
  objc_msgSend_setInvalidationHandler_(v44, v46, (uint64_t)v83);

  objc_msgSend_liveStream(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v35;
  v81[1] = 3221225472;
  v81[2] = sub_1BEB2CD84;
  v81[3] = &unk_1E7833FC0;
  v50 = v45;
  v82 = v50;
  objc_msgSend_setInvalidationHandler_(v49, v51, (uint64_t)v81);

  objc_msgSend_absoluteStartDate(self, v52, v53);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    goto LABEL_9;
  objc_msgSend_startTimeOffset(self, v54, v55);
  if (v59 != 0.0)
  {
    objc_msgSend_logEventStream(self, v54, v55);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_source(v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_newestDate(v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimeOffset(self, v67, v68);
    objc_msgSend_dateByAddingTimeInterval_(v66, v69, v70);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
      goto LABEL_9;
  }
  if (objc_msgSend_source(self, v54, v55) != 1)
    goto LABEL_15;
  objc_msgSend_logEventStream(self, v54, v55);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_source(v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oldestDate(v74, v75, v76);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
LABEL_9:
    objc_msgSend_logEventStream(self, v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activateStreamFromDate_(v57, v58, (uint64_t)v56);

  }
  else
  {
LABEL_15:
    objc_msgSend_liveStream(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activate(v56, v77, v78);
  }

  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v91);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(context);

}

- (BOOL)wantsSimulatorLogs
{
  return self->_wantsSimulatorLogs;
}

- (void)setWantsSimulatorLogs:(BOOL)a3
{
  self->_wantsSimulatorLogs = a3;
}

- (BOOL)onlyTestLogs
{
  return self->_onlyTestLogs;
}

- (void)setOnlyTestLogs:(BOOL)a3
{
  self->_onlyTestLogs = a3;
}

- (double)startTimeOffset
{
  return self->_startTimeOffset;
}

- (void)setStartTimeOffset:(double)a3
{
  self->_startTimeOffset = a3;
}

- (NSDate)absoluteStartDate
{
  return self->_absoluteStartDate;
}

- (void)setAbsoluteStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_absoluteStartDate, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (BOOL)colorOutput
{
  return self->_colorOutput;
}

- (void)setColorOutput:(BOOL)a3
{
  self->_colorOutput = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (OSLogEventStream)logEventStream
{
  return self->_logEventStream;
}

- (void)setLogEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_logEventStream, a3);
}

- (OSLogEventLiveStream)liveStream
{
  return self->_liveStream;
}

- (void)setLiveStream:(id)a3
{
  objc_storeStrong((id *)&self->_liveStream, a3);
}

- (NSMutableArray)streamObservers
{
  return self->_streamObservers;
}

- (void)setStreamObservers:(id)a3
{
  objc_storeStrong((id *)&self->_streamObservers, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_streamObservers, 0);
  objc_storeStrong((id *)&self->_liveStream, 0);
  objc_storeStrong((id *)&self->_logEventStream, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_absoluteStartDate, 0);
}

@end
