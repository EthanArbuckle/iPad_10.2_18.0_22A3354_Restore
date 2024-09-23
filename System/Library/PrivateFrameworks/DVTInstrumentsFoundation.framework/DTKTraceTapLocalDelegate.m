@implementation DTKTraceTapLocalDelegate

- (unint64_t)_clampBufferSize:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  DTTapStatusMemo *v15;
  id WeakRetained;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("DTKPTapMaxRAMPercentage"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:", CFSTR("DTKPTapMinRAMBytes"));

  v9 = DTGetPhysicalMemorySize();
  if (v9)
  {
    v10 = sBufferConstants;
    v11 = unk_25576D908;
    if ((unint64_t)(v6 - 1) < 0x63)
      v10 = v6;
    v13 = v10 * v9;
    v12 = (((unint64_t)(v10 * v9) >> 2) * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64;
    if (unk_25576D908 <= a3)
      v11 = a3;
    if (v8 > a3)
      v11 = v8;
    if (v11 >= v12 >> 2)
      return v13 / 0x64;
    else
      return v11;
  }
  else
  {
    v15 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2281701376, CFSTR("Device reported 0 MB of physical memory"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "_handleStatusMemo:", v15);

    return 0;
  }
}

- (unint64_t)_triggerCount
{
  return -[NSMutableData length](self->_triggerIDs, "length") >> 2;
}

- (unint64_t)bufferSizeForConfiguration:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  DTTapStatusMemo *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  DTTapStatusMemo *v19;
  void *v20;
  _QWORD v22[7];
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = DTGetCoreCount();
  if (!v5)
  {
    v9 = -[DTTapStatusMemo initWithStatus:notice:]([DTTapStatusMemo alloc], "initWithStatus:notice:", 2281701376, CFSTR("Device reported 0 cores"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "_handleStatusMemo:", v9);
LABEL_19:

    v18 = 0;
    goto LABEL_20;
  }
  v6 = objc_msgSend(v4, "bufferMode");
  if (!v6)
  {
    v7 = 2 * objc_msgSend(v4, "pollingInterval");
    v8 = 1;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    v8 = 0;
    v7 = 1000000000 * qword_25576D910;
    goto LABEL_9;
  }
  if (v6 != 2)
  {
    v19 = [DTTapStatusMemo alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported buffer mode: %lu"), objc_msgSend(v4, "bufferMode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DTTapStatusMemo initWithStatus:notice:](v19, "initWithStatus:notice:", 2281701376, v20);

    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "_handleStatusMemo:", v9);
    goto LABEL_19;
  }
  v7 = objc_msgSend(v4, "windowSize");
  v8 = 0;
LABEL_9:
  v11 = 1000000000;
  v24 = 0;
  v25 = &v24;
  if (v7)
    v11 = v7;
  v26 = 0x2020000000;
  v27 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_222B25BA8;
  v22[3] = &unk_24EB28440;
  v22[4] = self;
  v22[5] = &v24;
  v22[6] = v11;
  v23 = v8;
  objc_msgSend(v4, "enumerateTriggerConfigs:", v22);
  v12 = v25[3];
  if (DTCoreIs64BitCapable())
    v13 = 6;
  else
    v13 = 5;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatForKey:", CFSTR("DTKPTapBufferScalingFactor"));
  v16 = v15;
  v17 = 101 * ((v12 * (unint64_t)v5) << v13) / 0x64;

  if (v16 == 0.0)
    v18 = v17;
  else
    v18 = (unint64_t)(float)(v16 * (float)v17);
  _Block_object_dispose(&v24, 8);
LABEL_20:

  return v18;
}

- (id)_getSessionMetadata
{
  void *v3;
  void *v4;
  unsigned int *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  DTKTraceTapConfig *config;
  id v10;
  uint64_t v11;
  uint64_t v12;
  DTTapStatusMemo *v13;
  void *v14;
  DTTapStatusMemo *v15;
  id WeakRetained;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = (void *)objc_opt_new();
  if (self->_triggerIDs)
  {
    v4 = (void *)objc_opt_new();
    v5 = -[NSMutableData mutableBytes](self->_triggerIDs, "mutableBytes");
    if (-[DTKTraceTapLocalDelegate _triggerCount](self, "_triggerCount"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5[v6]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v7);

        ++v6;
      }
      while (v6 < -[DTKTraceTapLocalDelegate _triggerCount](self, "_triggerCount"));
    }
    v8 = (void *)objc_opt_new();
    config = self->_config;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_222B26654;
    v19[3] = &unk_24EB28468;
    v10 = v8;
    v20 = v10;
    -[DTKTraceTapConfig enumerateTriggerConfigs:](config, "enumerateTriggerConfigs:", v19);
    v11 = objc_msgSend(v4, "count");
    if (v11 == objc_msgSend(v10, "count"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("triggerIDs"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("triggerUUIDs"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_actionIDsByTriggerIndex, CFSTR("actionIDs"));
      if (!self->_usesRawKtraceFile)
      {
        v18 = 0;
        if (!authorized_ktrace_file(0, (uint64_t)&v18))
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ktrace"));

      }
    }
    else
    {
      v12 = (unsigned __int16)DTKTraceTapMetadataTriggerMismatchStatusCode | 0x80000000;
      v13 = [DTTapStatusMemo alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The number of trigger IDs (%lu) does not match the number of trigger UUIDs (%lu)"), objc_msgSend(v4, "count"), objc_msgSend(v10, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[DTTapStatusMemo initWithStatus:notice:](v13, "initWithStatus:notice:", v12, v14);

      WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(WeakRetained, "_handleStatusMemo:", v15);

    }
  }
  return v3;
}

- (DTKTraceTapLocalDelegate)initWithConfig:(id)a3
{
  id v5;
  DTKTraceTapLocalDelegate *v6;
  DTKTraceTapLocalDelegate *v7;
  uint64_t v8;
  NSArray *localEventProducers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTKTraceTapLocalDelegate;
  v6 = -[DTKTraceTapLocalDelegate init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    DTKTraceTapLocalEventProducersForConfig(v5);
    v8 = objc_claimAutoreleasedReturnValue();
    localEventProducers = v7->_localEventProducers;
    v7->_localEventProducers = (NSArray *)v8;

    v7->_usesRawKtraceFile = 0;
  }

  return v7;
}

- (id)validateConfig
{
  return 0;
}

- (void)setTap:(id)a3
{
  objc_storeWeak((id *)&self->_tap, a3);
}

- (void)start
{
  DTKPSession **p_session;
  DTTapStatusMemo *v4;
  void *v5;
  id WeakRetained;
  void (**v7)(void *, const __CFString *);
  void *v8;
  void *v9;
  _BOOL4 v10;
  __objc2_class **v11;
  void *v12;
  DTKPSession *v13;
  unint64_t v14;
  const __CFString *v15;
  DTTapStatusMemo *v16;
  void *v17;
  DTTapStatusMemo *v18;
  id v19;
  unint64_t v20;
  DTKTraceTapConfig *config;
  id v22;
  id *v23;
  BOOL v24;
  NSMutableArray *v25;
  NSMutableArray *actionIDsByTriggerIndex;
  NSMutableData *v27;
  NSMutableData *triggerIDs;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  DTTapStatusMemo *v35;
  void *v36;
  void *v37;
  void *v38;
  DTTapStatusMemo *v39;
  id v40;
  void *v41;
  DTTapStatusMemo *v42;
  _QWORD v43[7];
  _QWORD v44[7];
  _QWORD v45[7];
  id to[4];
  id obj;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  DTKTraceTapLocalDelegate *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD aBlock[5];
  uint64_t v81;
  id *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;

  p_session = &self->_session;
  if (self->_session)
  {
    v4 = [DTTapStatusMemo alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Tried to start a tap while it's already running"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[DTTapStatusMemo initWithStatus:notice:](v4, "initWithStatus:notice:", 0x80000000, v5);

    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "_handleStatusMemo:", v42);

    return;
  }
  v81 = 0;
  v82 = (id *)&v81;
  v83 = 0x3032000000;
  v84 = sub_222B26F3C;
  v85 = sub_222B26F4C;
  v86 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B26F54;
  aBlock[3] = &unk_24EB28490;
  aBlock[4] = self;
  v7 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v8 = (void *)objc_opt_new();
  if (v8)
  {
    -[DTKTraceTapConfig providerOptions](self->_config, "providerOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProviderOptions:", v9);

    objc_msgSend(v8, "setCollectionInterval:", -[DTKTraceTapConfig collectionInterval](self->_config, "collectionInterval"));
    v10 = -[DTKTraceTapConfig canUseRawKtraceFile](self->_config, "canUseRawKtraceFile");
    v11 = off_24EB24CB0;
    self->_usesRawKtraceFile = v10;
    if (!v10)
      v11 = off_24EB24CB8;
    v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithConfig:", v8);
    if (v12)
    {
      v13 = -[DTKPSession initWithConfig:andAggregator:]([DTKPSession alloc], "initWithConfig:andAggregator:", v8, v12);
      if (v13)
      {
        -[DTKPSession setRecordingPriority:](v13, "setRecordingPriority:", -[DTKTraceTapConfig recordingPriority](self->_config, "recordingPriority"));
        v14 = -[DTTapConfig bufferMode](self->_config, "bufferMode");
        if (v14 >= 3)
        {
          v16 = [DTTapStatusMemo alloc];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported buffer mode: %lu"), -[DTTapConfig bufferMode](self->_config, "bufferMode"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[DTTapStatusMemo initWithStatus:notice:](v16, "initWithStatus:notice:", 2281701376, v17);

          v19 = objc_loadWeakRetained((id *)&self->_tap);
          objc_msgSend(v19, "_handleStatusMemo:", v18);

        }
        else
        {
          objc_msgSend(v8, "setCollectionMode:", (0x30202u >> (8 * v14)) & 3);
        }
        v20 = -[DTKTraceTapConfig bufferSizeOverride](self->_config, "bufferSizeOverride");
        if (v20)
        {
          if (-[DTKTraceTapConfig bufferSizeOverrideClamping](self->_config, "bufferSizeOverrideClamping"))
            -[DTKTraceTapLocalDelegate _clampBufferSize:](self, "_clampBufferSize:", v20);
        }
        else
        {
          v20 = -[DTKTraceTapLocalDelegate _clampBufferSize:](self, "_clampBufferSize:", -[DTKTraceTapLocalDelegate bufferSizeForConfiguration:](self, "bufferSizeForConfiguration:", self->_config));
          if (!v20)
            goto LABEL_20;
        }
        objc_msgSend(v8, "setBufferSize:", v20);
LABEL_20:
        v74 = 0;
        v75 = &v74;
        v76 = 0x3032000000;
        v77 = sub_222B26F3C;
        v78 = sub_222B26F4C;
        v79 = (id)objc_opt_new();
        v68 = 0;
        v69 = &v68;
        v70 = 0x3032000000;
        v71 = sub_222B26F3C;
        v72 = sub_222B26F4C;
        v73 = (id)objc_opt_new();
        v62 = 0;
        v63 = &v62;
        v64 = 0x3032000000;
        v65 = sub_222B26F3C;
        v66 = sub_222B26F4C;
        v67 = (id)objc_opt_new();
        v58 = 0;
        v59 = &v58;
        v60 = 0x2020000000;
        v61 = 0;
        config = self->_config;
        v50[0] = MEMORY[0x24BDAC760];
        v50[1] = 3221225472;
        v50[2] = sub_222B26FCC;
        v50[3] = &unk_24EB284B8;
        v51 = v8;
        v52 = self;
        v53 = &v62;
        v54 = &v58;
        v55 = &v81;
        v56 = &v68;
        v57 = &v74;
        -[DTKTraceTapConfig enumerateTriggerConfigs:](config, "enumerateTriggerConfigs:", v50);
        if (-[DTTapConfig bufferMode](self->_config, "bufferMode") != 2)
        {
          if (-[DTTapConfig isDeferredDisplay](self->_config, "isDeferredDisplay"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_copyWeak(to, (id *)&self->_tap);
              v22 = v12;
              v48[0] = MEMORY[0x24BDAC760];
              v48[1] = 3221225472;
              v48[2] = sub_222B2756C;
              v48[3] = &unk_24EB284E0;
              objc_copyWeak(&v49, to);
              objc_msgSend(v22, "setCallback:", v48);
              objc_destroyWeak(&v49);

              objc_destroyWeak(to);
            }
          }
        }
        v23 = v82;
        obj = v82[5];
        v24 = -[DTKPSession start:](v13, "start:", &obj);
        objc_storeStrong(v23 + 5, obj);
        if (v24)
        {
          -[NSArray enumerateObjectsUsingBlock:](self->_localEventProducers, "enumerateObjectsUsingBlock:", &unk_24EB276B0);
          if (!self->_usesRawKtraceFile)
            -[DTKTraceTapLocalDelegate _sendStackshot](self, "_sendStackshot");
          v25 = (NSMutableArray *)objc_opt_new();
          actionIDsByTriggerIndex = self->_actionIDsByTriggerIndex;
          self->_actionIDsByTriggerIndex = v25;

          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * *((unsigned int *)v59 + 6));
          v27 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
          triggerIDs = self->_triggerIDs;
          self->_triggerIDs = v27;

          v29 = -[NSMutableData mutableBytes](self->_triggerIDs, "mutableBytes");
          to[0] = 0;
          to[1] = to;
          to[2] = (id)0x2020000000;
          to[3] = 0;
          v30 = objc_msgSend((id)v75[5], "count");
          v31 = MEMORY[0x24BDAC760];
          if (v30)
          {
            v32 = (void *)v75[5];
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = sub_222B275B4;
            v45[3] = &unk_24EB28528;
            v45[5] = to;
            v45[6] = v29;
            v45[4] = self;
            objc_msgSend(v32, "enumerateObjectsUsingBlock:", v45);
          }
          if (objc_msgSend((id)v69[5], "count"))
          {
            v33 = (void *)v69[5];
            v44[0] = v31;
            v44[1] = 3221225472;
            v44[2] = sub_222B27648;
            v44[3] = &unk_24EB28550;
            v44[5] = to;
            v44[6] = v29;
            v44[4] = self;
            objc_msgSend(v33, "enumerateObjectsUsingBlock:", v44);
          }
          if (objc_msgSend((id)v63[5], "count"))
          {
            v34 = (void *)v63[5];
            v43[0] = v31;
            v43[1] = 3221225472;
            v43[2] = sub_222B276DC;
            v43[3] = &unk_24EB28578;
            v43[5] = to;
            v43[6] = v29;
            v43[4] = self;
            objc_msgSend(v34, "enumerateObjectsUsingBlock:", v43);
          }
          _Block_object_dispose(to, 8);
        }
        else
        {
          v35 = [DTTapStatusMemo alloc];
          v36 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v82[5], "localizedDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("Failed to start the recording: %@"), v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[DTTapStatusMemo initWithStatus:notice:](v35, "initWithStatus:notice:", 0x80000000, v38);

          v40 = objc_loadWeakRetained((id *)&self->_tap);
          objc_msgSend(v40, "_handleStatusMemo:", v39);

        }
        objc_storeStrong((id *)p_session, v13);
        -[DTKTraceTapLocalDelegate _getSessionMetadata](self, "_getSessionMetadata");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTTapConfig _runningMetadataChanged:](self->_config, "_runningMetadataChanged:", v41);

        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(&v62, 8);

        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&v74, 8);

        goto LABEL_36;
      }
      v15 = CFSTR("Failed to create a Ktrace session.");
    }
    else
    {
      v15 = CFSTR("Failed to create an aggregator");
    }
    v7[2](v7, v15);
    v13 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v7[2](v7, CFSTR("Failed to create a configuration."));
  v13 = 0;
LABEL_37:

  _Block_object_dispose(&v81, 8);
}

- (void)stop
{
  DTKPSession *session;
  id v4;
  DTTapStatusMemo *v5;
  void *v6;
  void *v7;
  void *v8;
  DTTapStatusMemo *v9;
  id WeakRetained;
  id v11;

  if (self->_session)
  {
    -[NSArray enumerateObjectsUsingBlock:](self->_localEventProducers, "enumerateObjectsUsingBlock:", &unk_24EB28598);
    session = self->_session;
    v11 = 0;
    -[DTKPSession stop:](session, "stop:", &v11);
    v4 = v11;
    if (v4)
    {
      v5 = [DTTapStatusMemo alloc];
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Failed to stop recording session: %@ "), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[DTTapStatusMemo initWithStatus:notice:](v5, "initWithStatus:notice:", 0x80000000, v8);

      WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(WeakRetained, "_handleStatusMemo:", v9);

    }
    self->_stopWasCalled = 1;

  }
}

- (void)pause
{
  id v3;
  DTKPSession *session;
  BOOL v5;
  DTTapStatusMemo *v6;
  void *v7;
  void *v8;
  void *v9;
  DTTapStatusMemo *v10;
  id WeakRetained;
  id v12;

  if (self->_usesRawKtraceFile)
  {
    v3 = 0;
  }
  else
  {
    session = self->_session;
    v12 = 0;
    v5 = -[DTKPSession pause:](session, "pause:", &v12);
    v3 = v12;
    if (!v5)
    {
      v6 = [DTTapStatusMemo alloc];
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Failed to pause recording session: %@ "), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[DTTapStatusMemo initWithStatus:notice:](v6, "initWithStatus:notice:", 0x80000000, v9);

      WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(WeakRetained, "_handleStatusMemo:", v10);

    }
  }
  -[NSArray enumerateObjectsUsingBlock:](self->_localEventProducers, "enumerateObjectsUsingBlock:", &unk_24EB285B8);

}

- (void)unpause
{
  id v3;
  DTKPSession *session;
  BOOL v5;
  DTTapStatusMemo *v6;
  void *v7;
  void *v8;
  void *v9;
  DTTapStatusMemo *v10;
  id WeakRetained;
  id v12;

  if (self->_usesRawKtraceFile)
  {
    v3 = 0;
  }
  else
  {
    session = self->_session;
    v12 = 0;
    v5 = -[DTKPSession resume:](session, "resume:", &v12);
    v3 = v12;
    if (!v5)
    {
      v6 = [DTTapStatusMemo alloc];
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Failed to resume recording session: %@ "), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[DTTapStatusMemo initWithStatus:notice:](v6, "initWithStatus:notice:", 0x80000000, v9);

      WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      objc_msgSend(WeakRetained, "_handleStatusMemo:", v10);

    }
  }
  -[NSArray enumerateObjectsUsingBlock:](self->_localEventProducers, "enumerateObjectsUsingBlock:", &unk_24EB285D8);

}

- (BOOL)canFetchWhileArchiving
{
  return 0;
}

- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4
{
  void (**v6)(id, void *, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  DTKPSession *session;
  void *v11;
  _BOOL8 v13;
  DTTapHeartbeatMemo *v14;
  uint64_t v15;

  v6 = (void (**)(id, void *, uint64_t))a4;
  if (a3 == 2)
    v7 = mach_absolute_time();
  else
    v7 = 0;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setTapVersion:", 0x10000);
  objc_msgSend(v8, "setIsSession:", 1);
  objc_msgSend(v8, "setTriggerCount:", -[DTKTraceTapLocalDelegate _triggerCount](self, "_triggerCount"));
  v9 = (void *)-[NSMutableData copy](self->_triggerIDs, "copy");
  objc_msgSend(v8, "setTriggerIDs:", v9);

  objc_msgSend(v8, "setIsRawKtraceFile:", self->_usesRawKtraceFile);
  session = self->_session;
  v15 = 0;
  -[DTKPSession swapOutCurrentDatastream:](session, "swapOutCurrentDatastream:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasData") & 1) != 0)
  {
    objc_msgSend(v8, "setDatastream:", v11);
    objc_msgSend(v8, "setSupportsPeek:", 1);
    v13 = a3 == 1 && self->_stopWasCalled;
    objc_msgSend(v8, "setFinalMemo:", v13);
    v6[2](v6, v8, 1);
  }
  else
  {
    v14 = -[DTTapHeartbeatMemo initWithTimestamp:]([DTTapHeartbeatMemo alloc], "initWithTimestamp:", v7);
    v6[2](v6, v14, 1);

  }
}

- (void)_sendStackshot
{
  int v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  v9 = 0;
  v3 = authorized_stackshot_collect(0, &v9);
  v4 = v9;
  if (!v3)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setIsSession:", 0);
    objc_msgSend(v5, "setSupportsPeek:", 0);
    objc_msgSend(v5, "setStackshot:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "memoHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "handleMemo:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEventProducers, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_actionIDsByTriggerIndex, 0);
  objc_storeStrong((id *)&self->_triggerIDs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_tap);
}

@end
