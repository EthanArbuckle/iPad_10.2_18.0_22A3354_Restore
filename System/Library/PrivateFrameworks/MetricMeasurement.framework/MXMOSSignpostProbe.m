@implementation MXMOSSignpostProbe

+ (id)probeHostLive
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 0);
}

+ (id)probeHostSystemLogArchiveWithRelativeTimeInterval:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMode:logArchive:startDate:endDate:", 1, 0, v5, v6);

  return v7;
}

+ (id)probeHostSystemLogArchiveWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:logArchive:startDate:endDate:", 1, 0, v7, v6);

  return v8;
}

+ (id)probeHostSystemLogArchiveWithStartDate:(id)a3 endDate:(id)a4 startMachTime:(unint64_t)a5 stopMachTime:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:logArchive:startDate:endDate:startMachTime:stopMachTime:", 1, 0, v11, v10, a5, a6);

  return v12;
}

+ (id)probeWithLogArchivePath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:logArchive:startDate:endDate:", 2, v4, 0, 0);

  return v5;
}

+ (id)probeWithLogArchivePath:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:logArchive:startDate:endDate:", 2, v10, v9, v8);

  return v11;
}

+ (id)probeWithLogArchivePath:(id)a3 startDate:(id)a4 endDate:(id)a5 startMachTime:(unint64_t)a6 stopMachTime:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:logArchive:startDate:endDate:startMachTime:stopMachTime:", 2, v14, v13, v12, a6, a7);

  return v15;
}

- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3
{
  MXMOSSignpostProbe *v4;
  MXMOSSignpostProbe *v5;
  NSURL *logArchivePath;
  SignpostSupportObjectExtractor *v7;
  SignpostSupportObjectExtractor *extractor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MXMOSSignpostProbe;
  v4 = -[MXMProbe init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    logArchivePath = v4->_logArchivePath;
    v4->_logArchivePath = 0;

    v5->_mode = a3;
    v7 = (SignpostSupportObjectExtractor *)objc_alloc_init(MEMORY[0x24BE90690]);
    extractor = v5->_extractor;
    v5->_extractor = v7;

    -[MXMOSSignpostProbe _setupProcessingBlocks](v5, "_setupProcessingBlocks");
  }
  return v5;
}

- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3 logArchive:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  MXMOSSignpostProbe *v14;
  MXMOSSignpostProbe *v15;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[MXMOSSignpostProbe initWithMode:](self, "initWithMode:", a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_logArchivePath, a4);
    objc_storeStrong((id *)&v15->_startDate, a5);
    objc_storeStrong((id *)&v15->_endDate, a6);
  }

  return v15;
}

- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3 logArchive:(id)a4 startDate:(id)a5 endDate:(id)a6 startMachTime:(unint64_t)a7 stopMachTime:(unint64_t)a8
{
  self->_startMachContTime = a7;
  self->_stopMachContTime = a8;
  return -[MXMOSSignpostProbe initWithMode:logArchive:startDate:endDate:](self, "initWithMode:logArchive:startDate:endDate:", a3, a4, a5, a6);
}

- (MXMOSSignpostProbe)initWithLogArchive:(id)a3
{
  return -[MXMOSSignpostProbe initWithMode:logArchive:startDate:endDate:](self, "initWithMode:logArchive:startDate:endDate:", 2, a3, 0, 0);
}

- (MXMOSSignpostProbe)initWithLogArchive:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return -[MXMOSSignpostProbe initWithMode:logArchive:startDate:endDate:](self, "initWithMode:logArchive:startDate:endDate:", 2, a3, a4, a5);
}

- (void)_setupProcessingFilter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MXMProbe filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeFilterWithName:", CFSTR("os_signpost subsystem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXMProbe filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeFilterWithName:", CFSTR("os_signpost category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE906A8]), "initWithSubsystem:category:", v5, v8);
    objc_msgSend(v13, "addObject:", v9);

  }
  if (objc_msgSend(v13, "count"))
  {
    v10 = objc_alloc(MEMORY[0x24BE906B0]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEntries:", v11);

    -[SignpostSupportObjectExtractor setSubsystemCategoryFilter:](self->_extractor, "setSubsystemCategoryFilter:", v12);
  }

}

- (void)_setupProcessingBlocks
{
  uint64_t v3;
  void *v4;
  SignpostSupportObjectExtractor *extractor;
  SignpostSupportObjectExtractor *v6;
  id v7;
  SignpostSupportObjectExtractor *v8;
  id v9;
  SignpostSupportObjectExtractor *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke;
  aBlock[3] = &unk_24D193310;
  objc_copyWeak(&v22, &location);
  v4 = _Block_copy(aBlock);
  extractor = self->_extractor;
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_2;
  v19[3] = &unk_24D193338;
  objc_copyWeak(&v20, &location);
  -[SignpostSupportObjectExtractor setEmitEventProcessingBlock:](extractor, "setEmitEventProcessingBlock:", v19);
  v6 = self->_extractor;
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_3;
  v16[3] = &unk_24D193360;
  objc_copyWeak(&v18, &location);
  v7 = v4;
  v17 = v7;
  -[SignpostSupportObjectExtractor setIntervalCompletionProcessingBlock:](v6, "setIntervalCompletionProcessingBlock:", v16);
  v8 = self->_extractor;
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_4;
  v13[3] = &unk_24D193388;
  objc_copyWeak(&v15, &location);
  v9 = v7;
  v14 = v9;
  -[SignpostSupportObjectExtractor setAnimationIntervalCompletionProcessingBlock:](v8, "setAnimationIntervalCompletionProcessingBlock:", v13);
  v10 = self->_extractor;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_5;
  v11[3] = &unk_24D1933B0;
  objc_copyWeak(&v12, &location);
  -[SignpostSupportObjectExtractor setProcessingCompletionBlock:](v10, "setProcessingCompletionBlock:", v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  char isKindOfClass;
  uint64_t v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_5;
  objc_msgSend(v3, "beginEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "timeRecordedMachContinuousTime") >= WeakRetained[13])
  {
    objc_msgSend(v3, "endEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "timeRecordedMachContinuousTime");
    v8 = WeakRetained[13];

    if (v7 >= v8)
    {
      objc_msgSend(v3, "endEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "timeRecordedMachContinuousTime") <= WeakRetained[14])
      {
        objc_msgSend(v3, "beginEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "timeRecordedMachContinuousTime");
        v14 = WeakRetained[14];

        if (v13 <= v14)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v16 = WeakRetained[16];
          if ((isKindOfClass & 1) != 0)
            objc_msgSend(WeakRetained, "_buildData:signpostAnimationInterval:", v16, v3);
          else
            objc_msgSend(WeakRetained, "_buildData:signpostInterval:", v16, v3);
          goto LABEL_5;
        }
      }
      else
      {

      }
      v9 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
LABEL_5:
  v9 = 1;
LABEL_6:

  return v9;
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_buildData:attributes:signpostEvent:", WeakRetained[16], 0, v3);

  return 1;
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained || WeakRetained[13] && WeakRetained[14])
  {
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "_buildData:signpostInterval:", WeakRetained[16], v3);
    v6 = 1;
  }

  return v6;
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained || WeakRetained[13] && WeakRetained[14])
  {
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "_buildData:signpostAnimationInterval:", WeakRetained[16], v3);
    v6 = 1;
  }

  return v6;
}

void __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    _MXMGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_214474000, v7, OS_LOG_TYPE_ERROR, "Extractor finished due to an error: '%@'.", (uint8_t *)&v19, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)WeakRetained[16];
    objc_msgSend(WeakRetained, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataMatchingFilter:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v9[16];
    v9[16] = v12;

    v14 = v9[15];
    if (v14)
    {
      dispatch_semaphore_signal(v14);
      _MXMGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v16 = "Extractor finished and we've signaled the sampling caller.";
LABEL_13:
        v17 = v15;
        v18 = OS_LOG_TYPE_DEBUG;
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v9, "_stopUpdates");
      _MXMGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v16 = "Extractor finished and we've manually stopped updates.";
        goto LABEL_13;
      }
    }
  }
  else
  {
    _MXMGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      v16 = "Extractor called processingCompletionBlock but self is nil!";
      v17 = v15;
      v18 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_214474000, v17, v18, v16, (uint8_t *)&v19, 2u);
    }
  }

}

- (id)_buildSampleSetWithData:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 signpostObject:(id)a7
{
  id v11;
  id v12;
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
  void *v32;
  void *v33;
  MXMMutableSampleSet *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MXMMutableSampleSet *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  void *v45;
  MXMMutableSampleSet *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  MXMMutableSampleSet *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  MXMMutableSampleSet *v57;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  _QWORD v66[5];

  v66[4] = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v63 = a4;
  v62 = a5;
  v11 = a6;
  v12 = a7;
  v13 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "name");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost name"), v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v60;
  objc_msgSend(v12, "subsystem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost subsystem"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v15;
  objc_msgSend(v12, "category");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost category"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "signpostId"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMSampleAttribute attributeWithName:numericValue:](MXMSampleAttribute, "attributeWithName:numericValue:", CFSTR("os_signpost identifier"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v13;
  objc_msgSend(v13, "setByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v21, "mutableCopy");

  if (!v11)
  objc_msgSend(v12, "string1Name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v65;
  if (v22)
  {
    objc_msgSend(v12, "string1Name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost telemetry string1 name"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v25);

    objc_msgSend(v12, "string1Value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost telemetry string1 value"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v27);

  }
  objc_msgSend(v12, "string2Name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v12, "string2Name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost telemetry string2 name"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v30);

    objc_msgSend(v12, "string2Value");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost telemetry string2 value"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v32);

  }
  objc_msgSend(v12, "number1Value");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = [MXMMutableSampleSet alloc];
    +[MXMOSSignpostSampleTag telemetryNumber1](MXMOSSignpostSampleTag, "telemetryNumber1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "number1Name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost telemetry number1 name"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setByAddingObject:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MXMSampleSet initWithTag:unit:attributes:](v34, "initWithTag:unit:attributes:", v35, 0, v38);
    objc_msgSend(v64, "appendSet:", v39);

    v23 = v65;
    objc_msgSend(v12, "number1Value");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v42 = v41;
    +[MXMOSSignpostSampleTag telemetryNumber1](MXMOSSignpostSampleTag, "telemetryNumber1");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v64, "appendDoubleValue:tag:timestamp:", v43, objc_msgSend(v12, "startNanoseconds"), v42);

  }
  objc_msgSend(v12, "number2Value");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = [MXMMutableSampleSet alloc];
    +[MXMOSSignpostSampleTag telemetryNumber2](MXMOSSignpostSampleTag, "telemetryNumber2");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "number2Name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMSampleAttribute attributeWithName:stringValue:](MXMSampleAttribute, "attributeWithName:stringValue:", CFSTR("os_signpost telemetry number2 name"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setByAddingObject:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[MXMSampleSet initWithTag:unit:attributes:](v46, "initWithTag:unit:attributes:", v47, 0, v50);
    objc_msgSend(v64, "appendSet:", v51);

    v23 = v65;
    objc_msgSend(v12, "number2Value");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    v54 = v53;
    +[MXMOSSignpostSampleTag telemetryNumber2](MXMOSSignpostSampleTag, "telemetryNumber2");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (id)objc_msgSend(v64, "appendDoubleValue:tag:timestamp:", v55, objc_msgSend(v12, "startNanoseconds"), v54);

  }
  v57 = -[MXMSampleSet initWithTag:unit:attributes:]([MXMMutableSampleSet alloc], "initWithTag:unit:attributes:", v63, v62, v23);

  return v57;
}

- (void)_buildData:(id)a3 attributes:(id)a4 signpostEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v9, "processID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMSampleAttribute attributeWithName:numericValue:](MXMSampleAttribute, "attributeWithName:numericValue:", CFSTR("Process Identifier"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  +[MXMOSSignpostSampleTag timestamp](MXMOSSignpostSampleTag, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "nanoseconds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v17, v14, v15, v13, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "appendDoubleValue:timestamp:", objc_msgSend(v9, "startMachContinuousTime"), (double)(unint64_t)objc_msgSend(v9, "startNanoseconds"));
  objc_msgSend(v17, "appendSet:", v16);

}

- (void)_buildData:(id)a3 signpostInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "beginEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildData:attributes:signpostEvent:](self, "_buildData:attributes:signpostEvent:", v7, 0, v8);

  objc_msgSend(v6, "endEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildData:attributes:signpostEvent:](self, "_buildData:attributes:signpostEvent:", v7, 0, v9);

  +[MXMOSSignpostSampleTag duration](MXMOSSignpostSampleTag, "duration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "nanoseconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v10, v11, 0, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (double)(unint64_t)objc_msgSend(v6, "durationNanoseconds");
  v13 = objc_msgSend(v6, "startMachContinuousTime");

  objc_msgSend(v14, "appendDoubleValue:timestamp:", v13, v12);
  objc_msgSend(v7, "appendSet:", v14);

}

- (void)_buildData:(id)a3 signpostAnimationInterval:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MXMOSSignpostProbe _buildData:signpostInterval:](self, "_buildData:signpostInterval:", v7, v6);
  -[MXMOSSignpostProbe _addAnimationFrameRateToData:fromSignpostAnimationInterval:](self, "_addAnimationFrameRateToData:fromSignpostAnimationInterval:", v7, v6);
  -[MXMOSSignpostProbe _addAnimationFrameCountToData:fromSignpostAnimationInterval:](self, "_addAnimationFrameCountToData:fromSignpostAnimationInterval:", v7, v6);
  -[MXMOSSignpostProbe _addAnimationGlitchTimeRatioToData:fromSignpostAnimationInterval:](self, "_addAnimationGlitchTimeRatioToData:fromSignpostAnimationInterval:", v7, v6);
  -[MXMOSSignpostProbe _addAnimationNumberOfGlitchesToData:fromSignpostAnimationInterval:](self, "_addAnimationNumberOfGlitchesToData:fromSignpostAnimationInterval:", v7, v6);
  -[MXMOSSignpostProbe _addAnimationGlitchesTotalDurationToData:fromSignpostAnimationInterval:](self, "_addAnimationGlitchesTotalDurationToData:fromSignpostAnimationInterval:", v7, v6);

}

- (void)_addAnimationFrameRateToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  +[MXMOSSignpostSampleTag animationFrameRate](MXMOSSignpostSampleTag, "animationFrameRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1908], "framesPerSecond");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v8, v9, 0, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frameRate");
  v11 = v10;
  v12 = objc_msgSend(v6, "startMachContinuousTime");

  objc_msgSend(v13, "appendDoubleValue:timestamp:", v12, v11);
  objc_msgSend(v7, "appendSet:", v13);

}

- (void)_addAnimationFrameCountToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = a3;
  +[MXMOSSignpostSampleTag animationFrameCount](MXMOSSignpostSampleTag, "animationFrameCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitFrame frames](MXMUnitFrame, "frames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v8, v9, 0, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (double)(unint64_t)objc_msgSend(v6, "frameCount");
  v11 = objc_msgSend(v6, "startMachContinuousTime");

  objc_msgSend(v12, "appendDoubleValue:timestamp:", v11, v10);
  objc_msgSend(v7, "appendSet:", v12);

}

- (void)_addAnimationGlitchTimeRatioToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;

  v6 = a4;
  v7 = a3;
  +[MXMOSSignpostSampleTag animationGlitchTimeRatio](MXMOSSignpostSampleTag, "animationGlitchTimeRatio");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitHitch timeRatio](MXMUnitHitch, "timeRatio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v8, v9, 0, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "glitchTimeRatioMsPerS");
  objc_msgSend(v17, "appendDoubleValue:timestamp:", objc_msgSend(v6, "startMachContinuousTime"), v10);
  objc_msgSend(v7, "appendSet:", v17);
  +[MXMOSSignpostSampleTag animationNonFirstFrameGlitchTimeRatioAdjusted](MXMOSSignpostSampleTag, "animationNonFirstFrameGlitchTimeRatioAdjusted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitHitch timeRatio](MXMUnitHitch, "timeRatio");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v11, v12, 0, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nonFirstFrameGlitchTimeRatioAdjustedMsPerS");
  v15 = v14;
  v16 = objc_msgSend(v6, "startMachContinuousTime");

  objc_msgSend(v13, "appendDoubleValue:timestamp:", v16, v15);
  objc_msgSend(v7, "appendSet:", v13);

}

- (void)_addAnimationNumberOfGlitchesToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  id v17;

  v6 = a4;
  v7 = a3;
  +[MXMOSSignpostSampleTag animationNumberOfGlitches](MXMOSSignpostSampleTag, "animationNumberOfGlitches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitHitch hitches](MXMUnitHitch, "hitches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v8, v9, 0, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "glitches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendDoubleValue:timestamp:", objc_msgSend(v6, "startMachContinuousTime"), (double)(unint64_t)objc_msgSend(v10, "count"));

  objc_msgSend(v7, "appendSet:", v17);
  +[MXMOSSignpostSampleTag animationNonFirstFrameNumberOfGlitches](MXMOSSignpostSampleTag, "animationNonFirstFrameNumberOfGlitches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitHitch hitches](MXMUnitHitch, "hitches");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v7, v11, v12, 0, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nonFirstFrameGlitches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (double)(unint64_t)objc_msgSend(v14, "count");
  v16 = objc_msgSend(v6, "startMachContinuousTime");

  objc_msgSend(v13, "appendDoubleValue:timestamp:", v16, v15);
  objc_msgSend(v7, "appendSet:", v13);

}

- (void)_addAnimationGlitchesTotalDurationToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[MXMOSSignpostSampleTag animationGlitchesTotalDuration](MXMOSSignpostSampleTag, "animationGlitchesTotalDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v6, v8, v9, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v7, "glitches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  v13 = 0.0;
  v14 = 0.0;
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v33;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v17), "durationMs");
        v14 = v14 + v18;
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }

  objc_msgSend(v10, "appendDoubleValue:timestamp:", objc_msgSend(v7, "startMachContinuousTime"), v14);
  objc_msgSend(v6, "appendSet:", v10);
  +[MXMOSSignpostSampleTag animationNonFirstFrameGlitchesTotalDuration](MXMOSSignpostSampleTag, "animationNonFirstFrameGlitchesTotalDuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMOSSignpostProbe _buildSampleSetWithData:tag:unit:attributes:signpostObject:](self, "_buildSampleSetWithData:tag:unit:attributes:signpostObject:", v6, v19, v20, 0, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "nonFirstFrameGlitches", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    v13 = 0.0;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v26), "durationMs");
        v13 = v13 + v27;
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v24);
  }

  objc_msgSend(v21, "appendDoubleValue:timestamp:", objc_msgSend(v7, "startMachContinuousTime"), v13);
  objc_msgSend(v6, "appendSet:", v21);

}

- (void)_beginUpdates
{
  MXMMutableSampleData *v4;
  MXMMutableSampleData *data;
  unint64_t mode;
  SignpostSupportObjectExtractor *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  SignpostSupportObjectExtractor *extractor;
  void *v15;
  NSDate *startDate;
  NSDate *endDate;
  NSURL *logArchivePath;
  NSDate *v19;
  NSDate *v20;
  SignpostSupportObjectExtractor *v21;
  NSDate *v22;
  NSDate *v23;
  NSDate *v24;
  NSDate *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  NSURL *v33;
  __int16 v34;
  NSDate *v35;
  __int16 v36;
  NSDate *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)MXMOSSignpostProbe;
  -[MXMProbe _beginUpdates](&v31, sel__beginUpdates);
  +[MXMSampleData data](MXMMutableSampleData, "data");
  v4 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v4;

  -[MXMOSSignpostProbe _setupProcessingFilter](self, "_setupProcessingFilter");
  mode = self->_mode;
  if (mode == 2)
  {
    extractor = self->_extractor;
    -[NSURL absoluteString](self->_logArchivePath, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    endDate = self->_endDate;
    v28 = 0;
    -[SignpostSupportObjectExtractor processLogArchiveWithPath:startDate:endDate:errorOut:](extractor, "processLogArchiveWithPath:startDate:endDate:errorOut:", v15, startDate, endDate, &v28);
    v9 = v28;

    _MXMGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    logArchivePath = self->_logArchivePath;
    v19 = self->_startDate;
    v20 = self->_endDate;
    *(_DWORD *)buf = 138412802;
    v33 = logArchivePath;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = v20;
    v11 = "Began extracting signposts from archive (%@ [nil is the system]) with dates: %@ to %@.";
LABEL_10:
    v12 = v10;
    v13 = 32;
    goto LABEL_11;
  }
  if (mode == 1)
  {
    v21 = self->_extractor;
    v22 = self->_startDate;
    v23 = self->_endDate;
    v29 = 0;
    -[SignpostSupportObjectExtractor processLogArchiveWithPath:startDate:endDate:errorOut:](v21, "processLogArchiveWithPath:startDate:endDate:errorOut:", 0, v22, v23, &v29);
    v9 = v29;
    _MXMGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    v24 = self->_startDate;
    v25 = self->_endDate;
    *(_DWORD *)buf = 138412802;
    v33 = 0;
    v34 = 2112;
    v35 = v24;
    v36 = 2112;
    v37 = v25;
    v11 = "Began extracting signposts from system log archive (%@ [nil is the system]) with dates: %@ to %@.";
    goto LABEL_10;
  }
  if (mode)
    return;
  v7 = self->_extractor;
  -[MXMProbe updateQueue](self, "updateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  -[SignpostSupportObjectExtractor processNotificationsWithIntervalTimeoutInSeconds:shouldCalculateAnimationFramerate:targetQueue:errorOut:](v7, "processNotificationsWithIntervalTimeoutInSeconds:shouldCalculateAnimationFramerate:targetQueue:errorOut:", 60, 0, v8, &v30);
  v9 = v30;

  _MXMGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v11 = "Began extracting signposts with live notification.";
    v12 = v10;
    v13 = 2;
LABEL_11:
    _os_log_impl(&dword_214474000, v12, OS_LOG_TYPE_DEBUG, v11, buf, v13);
  }
LABEL_12:

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMOSSignpostProbe.m"), 463, v27);

  }
}

- (void)_stopUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMOSSignpostProbe;
  -[MXMProbe _stopUpdates](&v3, sel__stopUpdates);
  -[SignpostSupportObjectExtractor stopProcessing](self->_extractor, "stopProcessing");
  -[MXMProbe _handleIncomingData:](self, "_handleIncomingData:", self->_data);
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  OS_dispatch_semaphore *v6;
  OS_dispatch_semaphore *finishedProcessingSema;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  NSObject *v12;
  _BOOL4 v13;
  objc_super v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  finishedProcessingSema = self->_finishedProcessingSema;
  self->_finishedProcessingSema = v6;

  -[MXMOSSignpostProbe _beginUpdates](self, "_beginUpdates");
  _MXMGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = a3;
    _os_log_impl(&dword_214474000, v8, OS_LOG_TYPE_DEBUG, "Created finish process semaphore, now waiting up to %f seconds.", buf, 0xCu);
  }

  v9 = self->_finishedProcessingSema;
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v11 = dispatch_semaphore_wait(v9, v10);
  _MXMGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214474000, v12, OS_LOG_TYPE_DEBUG, "Failed to stop waiting for stop processing semaphore.", buf, 2u);
    }

    -[SignpostSupportObjectExtractor stopProcessing](self->_extractor, "stopProcessing");
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214474000, v12, OS_LOG_TYPE_DEBUG, "Succesfully waited for stop processing semaphore.", buf, 2u);
    }

  }
  v15.receiver = self;
  v15.super_class = (Class)MXMOSSignpostProbe;
  -[MXMProbe _stopUpdates](&v15, sel__stopUpdates);
  return self->_data;
}

- (void)dealloc
{
  SignpostSupportObjectExtractor *extractor;
  objc_super v4;

  -[SignpostSupportObjectExtractor setProcessingCompletionBlock:](self->_extractor, "setProcessingCompletionBlock:", 0);
  -[SignpostSupportObjectExtractor stopProcessing](self->_extractor, "stopProcessing");
  extractor = self->_extractor;
  self->_extractor = 0;

  v4.receiver = self;
  v4.super_class = (Class)MXMOSSignpostProbe;
  -[MXMOSSignpostProbe dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_finishedProcessingSema, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_logArchivePath, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
}

@end
