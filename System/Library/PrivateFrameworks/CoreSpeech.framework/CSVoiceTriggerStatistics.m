@implementation CSVoiceTriggerStatistics

- (CSVoiceTriggerStatistics)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_source_t v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CSVoiceTriggerStatistics;
  v2 = -[CSVoiceTriggerStatistics init](&v18, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVoiceTriggerStatistics queue", 0);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    *((_QWORD *)v2 + 1) = 0;
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_WORD *)v2 + 36) = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v7;

    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 2));
    v10 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v9;

    v11 = *((_QWORD *)v2 + 6);
    v12 = dispatch_time(0, 0x34630B80000);
    dispatch_source_set_timer(v11, v12, 0x34630B80000uLL, 0xDF8476000uLL);
    objc_initWeak(&location, v2);
    v13 = *((_QWORD *)v2 + 6);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __32__CSVoiceTriggerStatistics_init__block_invoke;
    v15[3] = &unk_1E7C27FF0;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (CSVoiceTriggerStatistics *)v2;
}

- (void)increaseFalseFirstPassTriggersPerHour
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSVoiceTriggerStatistics_increaseFalseFirstPassTriggersPerHour__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearFalseFirstPassTriggersPerHour
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSVoiceTriggerStatistics_clearFalseFirstPassTriggersPerHour__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)increaseTriggerCount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSVoiceTriggerStatistics_increaseTriggerCount__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearTriggerCount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSVoiceTriggerStatistics_clearTriggerCount__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)triggerCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__CSVoiceTriggerStatistics_triggerCount__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetPHSRejectCount
{
  self->_consecutivePHSRejects = 0;
}

- (double)getLastPHSRejectTime
{
  return self->_lastPHSReject;
}

- (unint64_t)getPHSRejectCount
{
  return self->_consecutivePHSRejects;
}

- (void)incrementPHSRejectCount
{
  double v3;

  ++self->_consecutivePHSRejects;
  objc_msgSend(MEMORY[0x1E0D19260], "systemUpTime");
  self->_lastPHSReject = v3;
}

- (void)incrementVTRejectCount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CSVoiceTriggerStatistics_incrementVTRejectCount__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)getVTRejectCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CSVoiceTriggerStatistics_getVTRejectCount__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)incrementFirstPassTriggerCount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSVoiceTriggerStatistics_incrementFirstPassTriggerCount__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearFirstPassTriggerCount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSVoiceTriggerStatistics_clearFirstPassTriggerCount__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)firstPassTriggerCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CSVoiceTriggerStatistics_firstPassTriggerCount__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateVTEstimationStatistics:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) == 0)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__CSVoiceTriggerStatistics_updateVTEstimationStatistics___block_invoke;
    v6[3] = &unk_1E7C292A0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

- (void)resetVTEstimationStatistics
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSVoiceTriggerStatistics_resetVTEstimationStatistics__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int)_convertToFirstPassSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19450]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19460]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19458]) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19448]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19478]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19488]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19490]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19480]) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19498]) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19468]) & 1) != 0)
  {
    v4 = 10;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19470]);
  }

  return v4;
}

- (id)getVoiceTriggerStatistics
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22427;
  v10 = __Block_byref_object_dispose__22428;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CSVoiceTriggerStatistics_getVoiceTriggerStatistics__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getVoiceTriggerDailyMetadata
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22427;
  v10 = __Block_byref_object_dispose__22428;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CSVoiceTriggerStatistics_getVoiceTriggerDailyMetadata__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  -[CSVoiceTriggerStatistics increaseTriggerCount](self, "increaseTriggerCount", a3, a4);
  -[CSVoiceTriggerStatistics clearFalseFirstPassTriggersPerHour](self, "clearFalseFirstPassTriggersPerHour");
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  -[CSVoiceTriggerStatistics incrementVTRejectCount](self, "incrementVTRejectCount", a3, a4);
  -[CSVoiceTriggerStatistics increaseFalseFirstPassTriggersPerHour](self, "increaseFalseFirstPassTriggersPerHour");
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  -[CSVoiceTriggerStatistics incrementVTRejectCount](self, "incrementVTRejectCount", a3, a4);
  -[CSVoiceTriggerStatistics increaseFalseFirstPassTriggersPerHour](self, "increaseFalseFirstPassTriggersPerHour");
}

- (unint64_t)consecutivePHSRejects
{
  return self->_consecutivePHSRejects;
}

- (void)setConsecutivePHSRejects:(unint64_t)a3
{
  self->_consecutivePHSRejects = a3;
}

- (double)lastPHSReject
{
  return self->_lastPHSReject;
}

- (void)setLastPHSReject:(double)a3
{
  self->_lastPHSReject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtDailyMetadata, 0);
  objc_storeStrong((id *)&self->_vtEstimationStatistics, 0);
  objc_storeStrong((id *)&self->_hourPowerTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __56__CSVoiceTriggerStatistics_getVoiceTriggerDailyMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 73))
  {
    objc_msgSend(*(id *)(v2 + 64), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 64));
}

void __53__CSVoiceTriggerStatistics_getVoiceTriggerStatistics__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend(*(id *)(v2 + 56), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 56));
}

uint64_t __55__CSVoiceTriggerStatistics_resetVTEstimationStatistics__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 73) = 1;
  return result;
}

void __57__CSVoiceTriggerStatistics_updateVTEstimationStatistics___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  uint64_t v51;
  double v52;
  int v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  int v70;
  int v71;
  double v72;
  void *v73;
  uint64_t v74;
  void *v75;
  __CFString *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  double v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint8_t buf[4];
  const char *v110;
  __int16 v111;
  uint64_t v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend(*(id *)(v2 + 56), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 73))
  {
    objc_msgSend(*(id *)(v2 + 64), "removeAllObjects");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
  }
  if (*(_QWORD *)(a1 + 40) && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count") <= 0xC7)
  {
    v3 = *MEMORY[0x1E0D19698];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19698]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatValue");
      v7 = v6;

    }
    else
    {
      v7 = -998637568;
    }

    v8 = *MEMORY[0x1E0D19778];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19778]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;

    }
    else
    {
      v12 = -998637568;
    }

    v13 = *MEMORY[0x1E0D196F8];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D196F8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16;

    }
    else
    {
      v17 = -998637568;
    }

    v18 = *MEMORY[0x1E0D196E8];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D196E8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

    }
    else
    {
      v22 = -998637568;
    }

    v23 = *MEMORY[0x1E0D19610];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19610]);
    v24 = objc_claimAutoreleasedReturnValue();
    v106 = v8;
    if (v24
      && (v25 = (void *)v24,
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v23),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v26))
    {
      v27 = *MEMORY[0x1E0D19630];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19630]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        v31 = v30;

      }
      else
      {
        v31 = 0.0;
      }

      v33 = *MEMORY[0x1E0D195A8];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D195A8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedIntegerValue");

      }
      else
      {
        v36 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ch%tu"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        v41 = v40;

      }
      else
      {
        v41 = -1000.0;
      }

      v42 = 0.0;
      if (!v36)
        v42 = v31;
      v32 = v41 - v42;

    }
    else
    {
      v32 = -1000.0;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D194C0]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19590]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "integerValue");

    LODWORD(v46) = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
    v51 = objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = CSIsHorseman();
    v97 = v43;
    if (v45)
    {
      if (v53)
      {
        *(float *)&v54 = v32;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
LABEL_37:
          if (objc_msgSend(v43, "count"))
            objc_msgSend(v43, "objectAtIndex:", 0);
          else
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v3);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58)
          {
            objc_msgSend(v57, "objectForKeyedSubscript:", v3);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v59 = &unk_1E7C64420;
          }

          objc_msgSend(v57, "objectForKeyedSubscript:", v106);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60)
          {
            objc_msgSend(v57, "objectForKeyedSubscript:", v106);
            v56 = &unk_1E7C64420;
            v100 = v49;
            v101 = v108;
            v99 = (void *)v51;
            v102 = v47;
            v108 = &unk_1E7C64420;
            v104 = &unk_1E7C64420;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v100 = v49;
            v101 = v108;
            v99 = (void *)v51;
            v102 = v47;
            v108 = &unk_1E7C64420;
            v56 = &unk_1E7C64420;
            v104 = &unk_1E7C64420;
            v49 = &unk_1E7C64420;
          }
          v47 = v59;
          v55 = &unk_1E7C63E00;
LABEL_63:

          goto LABEL_64;
        }
      }
      else
      {
        v103 = &unk_1E7C64420;
        if (v43)
          goto LABEL_37;
      }
      v55 = &unk_1E7C63E00;
      v100 = v49;
      v101 = v108;
      v99 = (void *)v51;
      v102 = v47;
      v108 = &unk_1E7C64420;
      v56 = &unk_1E7C64420;
      v49 = &unk_1E7C64420;
      v104 = &unk_1E7C64420;
      v47 = &unk_1E7C64420;
LABEL_64:
      v107 = v47;
      v62 = *MEMORY[0x1E0D19660];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v49;
      if (v63)
      {
        v64 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v62);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v64, "_convertToFirstPassSource:", v65);

      }
      else
      {
        v66 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = *MEMORY[0x1E0D196E0];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D196E0]);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "floatValue");
        v71 = v70;

      }
      else
      {
        v71 = -998637568;
      }

      if (CSIsIOS())
      {
        LODWORD(v72) = v71;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v73 = 0;
      }
      v74 = *MEMORY[0x1E0D195D8];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D195D8]);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v74);
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v76 = &stru_1E7C296E8;
      }

      v77 = *MEMORY[0x1E0D19668];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19668]);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (v78)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "floatValue");
        v81 = v80;

      }
      else
      {
        v81 = 1182400512;
      }

      LODWORD(v82) = v81;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_alloc(MEMORY[0x1E0D022F8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v56;
      v87 = (void *)objc_msgSend(v84, "initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:", v85, v104, v103, v98, v107, v102, v105, v100, 0, v55, 0, v73, v83, v76,
                      v56,
                      v99,
                      v108,
                      v101);

      BiomeLibrary();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "Siri");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "VoiceTriggerStatistics");
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v90, "source");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "sendEvent:", v87);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v95 = v94;
        objc_msgSend(v93, "timeIntervalSinceDate:", v92);
        *(_DWORD *)buf = 136315394;
        v110 = "-[CSVoiceTriggerStatistics updateVTEstimationStatistics:]_block_invoke";
        v111 = 2050;
        v112 = v96;
        _os_log_impl(&dword_1C2614000, v95, OS_LOG_TYPE_DEFAULT, "%s BMSource sentEvent elapsed time = %{public}lf", buf, 0x16u);

      }
      return;
    }
    if (v53)
    {
      *(float *)&v54 = v32;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
LABEL_41:
        if ((unint64_t)objc_msgSend(v43, "count") > 1)
          objc_msgSend(v43, "objectAtIndex:", 1);
        else
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", v3);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          objc_msgSend(v57, "objectForKeyedSubscript:", v3);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v102 = &unk_1E7C64420;
        }
        v56 = (void *)v51;

        objc_msgSend(v57, "objectForKeyedSubscript:", v106);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          objc_msgSend(v57, "objectForKeyedSubscript:", v106);
          v55 = &unk_1E7C63DE8;
          v99 = &unk_1E7C64420;
          v100 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = &unk_1E7C63DE8;
          v99 = &unk_1E7C64420;
          v100 = &unk_1E7C64420;
        }
        v101 = &unk_1E7C64420;
        v103 = &unk_1E7C64420;
        goto LABEL_63;
      }
    }
    else
    {
      v104 = &unk_1E7C64420;
      if (v43)
        goto LABEL_41;
    }
    v55 = &unk_1E7C63DE8;
    v99 = &unk_1E7C64420;
    v100 = &unk_1E7C64420;
    v101 = &unk_1E7C64420;
    v102 = &unk_1E7C64420;
    v103 = &unk_1E7C64420;
    v56 = (void *)v51;
    goto LABEL_64;
  }
}

uint64_t __49__CSVoiceTriggerStatistics_firstPassTriggerCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __54__CSVoiceTriggerStatistics_clearFirstPassTriggerCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

uint64_t __58__CSVoiceTriggerStatistics_incrementFirstPassTriggerCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __44__CSVoiceTriggerStatistics_getVTRejectCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __50__CSVoiceTriggerStatistics_incrementVTRejectCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __40__CSVoiceTriggerStatistics_triggerCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __45__CSVoiceTriggerStatistics_clearTriggerCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

uint64_t __48__CSVoiceTriggerStatistics_increaseTriggerCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

uint64_t __62__CSVoiceTriggerStatistics_clearFalseFirstPassTriggersPerHour__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

void __65__CSVoiceTriggerStatistics_increaseFalseFirstPassTriggersPerHour__block_invoke(uint64_t a1)
{
  void *v2;

  if (++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) >= 0x12CuLL)
  {
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "submitSiriPowerIssueReport:", *MEMORY[0x1E0D19308]);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
}

void __32__CSVoiceTriggerStatistics_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerStatistics init]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Hour power timer fired", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearFalseFirstPassTriggersPerHour");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22451 != -1)
    dispatch_once(&sharedInstance_onceToken_22451, &__block_literal_global_22452);
  return (id)sharedInstance_sharedInstance_22453;
}

void __42__CSVoiceTriggerStatistics_sharedInstance__block_invoke()
{
  CSVoiceTriggerStatistics *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerStatistics);
  v1 = (void *)sharedInstance_sharedInstance_22453;
  sharedInstance_sharedInstance_22453 = (uint64_t)v0;

}

@end
