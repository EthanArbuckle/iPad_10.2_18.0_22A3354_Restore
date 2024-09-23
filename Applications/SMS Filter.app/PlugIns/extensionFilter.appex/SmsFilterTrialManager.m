@implementation SmsFilterTrialManager

- (SmsFilterTrialManager)initWithDefaultsDomain:(unsigned int)a3
{
  uint64_t v3;
  SmsFilterTrialManager *v4;
  SmsFilterTrialManager *v5;
  id v6;
  uint64_t v7;
  OS_os_log *log;
  uint64_t v9;
  TRIClient *trialClient;
  NSObject *v11;
  TRIClient *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *smsFilterDirectory;
  objc_super v19;
  _QWORD v20[2];
  uint8_t buf[4];
  TRIClient *v22;

  v3 = *(_QWORD *)&a3;
  v19.receiver = self;
  v19.super_class = (Class)SmsFilterTrialManager;
  v4 = -[SmsFilterTrialManager init](&v19, "init");
  if (!v4)
    -[SmsFilterTrialManager initWithDefaultsDomain:].cold.1();
  v5 = v4;
  v4->_lock._os_unfair_lock_opaque = 0;
  v6 = trialLogHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  log = v5->_log;
  v5->_log = (OS_os_log *)v7;

  v9 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 245));
  trialClient = v5->_trialClient;
  v5->_trialClient = (TRIClient *)v9;

  if (!v5->_trialClient)
    -[SmsFilterTrialManager initWithDefaultsDomain:].cold.2();
  v11 = v5->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v5->_trialClient;
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
  }
  v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%d"), v3);
  v20[0] = CFSTR("/var/mobile/Library/SmsFilter");
  v20[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v14));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
  smsFilterDirectory = v5->_smsFilterDirectory;
  v5->_smsFilterDirectory = (NSString *)v16;

  v5->_namespaceId = v3;
  -[SmsFilterTrialManager loadTrialUpdates](v5, "loadTrialUpdates");

  return v5;
}

- (void)loadTrialUpdates
{
  os_unfair_lock_s *p_lock;
  TRITrackingId *v4;
  TRITrackingId *trialTrackingID;
  NSString *v6;
  NSString *trialNamespaceName;
  NSString *v8;
  NSString *treatmentID;
  NSString *v10;
  NSString *experimentID;
  OS_os_log *log;
  TRITrackingId *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  TRITrackingId *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  NSString *v21;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (TRITrackingId *)-[TRIClient newTrackingId](self->_trialClient, "newTrackingId");
  trialTrackingID = self->_trialTrackingID;
  self->_trialTrackingID = v4;

  v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](TRINamespace, "namespaceNameFromId:", self->_namespaceId));
  trialNamespaceName = self->_trialNamespaceName;
  self->_trialNamespaceName = v6;

  v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[TRIClient treatmentIdWithNamespaceName:](self->_trialClient, "treatmentIdWithNamespaceName:", self->_trialNamespaceName));
  treatmentID = self->_treatmentID;
  self->_treatmentID = v8;

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[TRIClient experimentIdWithNamespaceName:](self->_trialClient, "experimentIdWithNamespaceName:", self->_trialNamespaceName));
  experimentID = self->_experimentID;
  self->_experimentID = v10;

  os_unfair_lock_unlock(p_lock);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_trialTrackingID;
    v15 = self->_experimentID;
    v14 = self->_trialNamespaceName;
    v16 = 138412802;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "loadTrialUpdates: _trialTrackingID = %@, _trialNamespaceName=%@, _experimentID=%@ \n", (uint8_t *)&v16, 0x20u);
  }
}

- (id)loadTrialMainModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  OS_os_log *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial main model", v14, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("trialMainModel")));
  v7 = v6;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileValue")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path")),
        v9,
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v11, v3));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)loadTrialBasicModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  OS_os_log *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial basic model", v14, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("trialBasicModel")));
  v7 = v6;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileValue")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path")),
        v9,
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v11, v3));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)loadTrialSubClassificationModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  OS_os_log *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial sub-classification model", v14, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("subClassModel")));
  v7 = v6;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileValue")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path")),
        v9,
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v11, v3));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)loadTrialModelByDeletingExistingModel:(id)a3
{
  id v4;
  OS_os_log *log;
  void *v6;
  int v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading model from : %@", (uint8_t *)&v8, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v4, 1));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getRegexFileNameWithPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  _BOOL4 v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  OS_os_log *v12;
  id v13;
  OS_os_log *log;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("trialRegexFile")));
  v4 = v3;
  if (!v3)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v15 = log;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to get file from null path", (uint8_t *)&v17, 2u);
    }
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));

  v7 = self->_log;
  v8 = os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      LOWORD(v17) = 0;
      v15 = v7;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    v17 = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "regex file name: %@, %@", (uint8_t *)&v17, 0x16u);
  }
  if ((objc_msgSend(v6, "isAbsolutePath") & 1) == 0)
  {
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathForResource:ofType:", v6, 0));

    v12 = self->_log;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", (uint8_t *)&v17, 0xCu);
    }
    if (v11)
    {
      v13 = v11;

      v6 = v13;
    }

  }
LABEL_17:

  return v6;
}

- (double)loadTrialTransThreshold
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("transThreshold")));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trans Threshold value is %lf", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialPromoThreshold
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("promoThreshold")));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Promo Threshold value is %lf", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (int64_t)loadTrialModelTransitionTimer
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  id v6;
  int v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialFactor:](self, "trialFactor:", CFSTR("transitionTimer")));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      v8 = 134217984;
      v9 = objc_msgSend(v3, "longValue");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Minimum retry timer for model transition %lld", (uint8_t *)&v8, 0xCu);

    }
    v6 = objc_msgSend(v3, "longValue");
  }
  else
  {
    v6 = 0;
  }

  return (int64_t)v6;
}

- (id)trialFactor:(id)a3
{
  return -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
}

- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  OS_os_log *log;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  OS_os_log *v19;
  unsigned __int8 v20;
  id v21;
  OS_os_log *v22;
  OS_os_log *v23;
  id v24;
  void *v25;
  unsigned int v26;
  id v27;
  id v28;
  OS_os_log *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  OS_os_log *v43;
  OS_os_log *v44;
  id v45;
  NSString *v46;
  unsigned __int8 v47;
  void *v48;
  void *v49;
  void *v50;
  OS_os_log *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  OS_os_log *v58;
  OS_os_log *v59;
  NSString *v60;
  unsigned __int8 v61;
  OS_os_log *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  char v84;
  NSString *smsFilterDirectory;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];

  v4 = a4;
  v6 = a3;
  v7 = (void *)os_transaction_create("com.apple.smsFilter.trialmanager.loadmodel");
  if (v6)
  {
    v75 = v7;
    if ((objc_msgSend(v6, "isAbsolutePath") & 1) == 0)
    {
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", v6, 0));

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = (uint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", buf, 0xCu);
      }
      if (v10)
      {
        v12 = v10;

        v6 = v12;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("c")));

    v84 = 0;
    v94[0] = self->_smsFilterDirectory;
    v94[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v94, 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v16));

    if (v4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
      v19 = self->_log;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = (uint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "Removing existing files from %@", buf, 0xCu);
      }
      v83 = 0;
      v20 = objc_msgSend(v13, "removeItemAtPath:error:", v18, &v83);
      v21 = v83;
      if ((v20 & 1) == 0)
      {
        v22 = self->_log;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v87 = (uint64_t)v18;
          v88 = 2112;
          v89 = v21;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v21 = 0;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
    v26 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v25, &v84);

    if (v26)
    {
      v82 = v21;
      v27 = (id)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v17, &v82));
      v28 = v82;

      if (v28)
      {
        v29 = self->_log;
        if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v87 = (uint64_t)v17;
          v88 = 2112;
          v89 = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
        }
        v24 = 0;
      }
      else
      {
        v27 = v27;
        v24 = v27;
      }
      goto LABEL_57;
    }
    v73 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "temporaryDirectory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "path"));
    v93[0] = v31;
    v32 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v32, "UUIDString"));
    v93[1] = v33;
    v74 = v13;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 2));
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v34));

    v13 = v74;
    v81 = v21;
    LOBYTE(v32) = objc_msgSend(v74, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, &v81);
    v28 = v81;

    if ((v32 & 1) == 0)
    {
      v43 = self->_log;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v87 = (uint64_t)v27;
        v88 = 2112;
        v89 = v28;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
      }
      v24 = 0;
      v7 = v75;
      v15 = v73;
      goto LABEL_57;
    }
    v92[0] = v27;
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v92[1] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 2));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v36));

    v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));
    v80 = v28;
    LOBYTE(v35) = objc_msgSend(v74, "copyItemAtPath:toPath:error:", v6, v39, &v80);
    v40 = v80;

    if ((v35 & 1) != 0)
    {

      v15 = v73;
      if ((objc_msgSend(v74, "fileExistsAtPath:isDirectory:", self->_smsFilterDirectory, &v84) & 1) != 0)
      {
        v41 = 0;
        v42 = v38;
LABEL_35:

        smsFilterDirectory = self->_smsFilterDirectory;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &smsFilterDirectory, 1));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v48));

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions"));
        v78 = 0;
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[MLCompiler compileSpecificationAtURL:toURL:options:error:](MLCompiler, "compileSpecificationAtURL:toURL:options:error:", v42, v49, v50, &v78));
        v45 = v78;

        v72 = v49;
        if (v45)
        {
          v51 = self->_log;
          if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v87 = (uint64_t)v42;
            v88 = 2112;
            v89 = v45;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v51, OS_LOG_TYPE_DEFAULT, "Failed to compile model: %@ -- %@", buf, 0x16u);
          }
          v24 = 0;
          v52 = (uint64_t)v17;
          v13 = v74;
          v7 = v75;
        }
        else
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "path"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastPathComponent"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringByDeletingPathExtension"));

          v70 = v55;
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByAppendingPathExtension:", CFSTR("mlmodelc")));
          v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "URLByAppendingPathComponent:"));

          v77 = 0;
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v52, &v77));
          v57 = v77;
          if (v57)
          {
            v45 = v57;
            v58 = self->_log;
            v13 = v74;
            v7 = v75;
            if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v87 = v52;
              v88 = 2112;
              v89 = v45;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v58, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
            }
            v24 = 0;
          }
          else
          {
            v76 = 0;
            v13 = v74;
            v61 = objc_msgSend(v74, "removeItemAtPath:error:", v27, &v76);
            v45 = v76;
            if ((v61 & 1) == 0)
            {
              v62 = self->_log;
              if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v87 = (uint64_t)v27;
                v88 = 2112;
                v89 = v45;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)v62, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
              }
            }
            v63 = self->_log;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              v64 = v63;
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "modelDescription"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "metadata"));
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", MLModelVersionStringKey));
              *(_DWORD *)buf = 138412546;
              v87 = (uint64_t)v56;
              v88 = 2112;
              v89 = v67;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "trial_model = %@ with version:%@\n", buf, 0x16u);

              v15 = v73;
              v13 = v74;
            }
            v24 = v56;
            v7 = v75;
          }

        }
        v17 = (void *)v52;
        goto LABEL_56;
      }
      v13 = v74;
      v46 = self->_smsFilterDirectory;
      v79 = 0;
      v47 = objc_msgSend(v74, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v46, 1, 0, &v79);
      v41 = v79;
      v42 = v38;
      if ((v47 & 1) != 0)
        goto LABEL_35;
      v59 = self->_log;
      if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = self->_smsFilterDirectory;
        *(_DWORD *)buf = 138412546;
        v87 = (uint64_t)v60;
        v88 = 2112;
        v45 = v41;
        v89 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v59, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
        v24 = 0;
        v7 = v75;
        goto LABEL_56;
      }
      v24 = 0;
      v7 = v75;
    }
    else
    {
      v41 = v40;
      v44 = self->_log;
      v7 = v75;
      v15 = v73;
      if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v87 = (uint64_t)v6;
        v88 = 2112;
        v42 = v38;
        v89 = v38;
        v90 = 2112;
        v45 = v41;
        v91 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "Failed to copy model from %@ to %@ -- %@", buf, 0x20u);
        v24 = 0;
        v13 = v74;
LABEL_56:

        v28 = v45;
LABEL_57:

        goto LABEL_58;
      }
      v24 = 0;
      v13 = v74;
      v42 = v38;
    }
    v45 = v41;
    goto LABEL_56;
  }
  v23 = self->_log;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Failed to load model from null path", buf, 2u);
  }
  v24 = 0;
LABEL_58:

  return v24;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (void)setTrialNamespaceName:(id)a3
{
  objc_storeStrong((id *)&self->_trialNamespaceName, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTrialTrackingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unsigned)namespaceId
{
  return self->_namespaceId;
}

- (void)setNamespaceId:(unsigned int)a3
{
  self->_namespaceId = a3;
}

- (NSString)smsFilterDirectory
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSmsFilterDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smsFilterDirectory, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (void)initWithDefaultsDomain:.cold.1()
{
  __assert_rtn("-[SmsFilterTrialManager initWithDefaultsDomain:]", "SFETrialManager.m", 44, "self");
}

- (void)initWithDefaultsDomain:.cold.2()
{
  __assert_rtn("-[SmsFilterTrialManager initWithDefaultsDomain:]", "SFETrialManager.m", 49, "_trialClient");
}

@end
