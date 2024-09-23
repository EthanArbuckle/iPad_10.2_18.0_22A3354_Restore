@implementation CSDarwinVoiceTriggerEventInfoProvider

- (CSDarwinVoiceTriggerEventInfoProvider)init
{
  CSDarwinVoiceTriggerEventInfoProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *triggerInfos;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSDarwinVoiceTriggerEventInfoProvider;
  v2 = -[CSDarwinVoiceTriggerEventInfoProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSDarwinVoiceTriggerEventInfoProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    triggerInfos = v2->_triggerInfos;
    v2->_triggerInfos = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setRawVoiceTriggerEventInfo:(id)a3 fromDeviceUUID:(id)a4 anchorHostMachTime:(unint64_t)a5 anchorDarwinMachTime:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *queue;
  _QWORD block[4];
  id v14;
  id v15;
  CSDarwinVoiceTriggerEventInfoProvider *v16;
  unint64_t v17;
  unint64_t v18;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __124__CSDarwinVoiceTriggerEventInfoProvider_setRawVoiceTriggerEventInfo_fromDeviceUUID_anchorHostMachTime_anchorDarwinMachTime___block_invoke;
    block[3] = &unk_1E687ED70;
    v14 = v10;
    v17 = a5;
    v18 = a6;
    v15 = v11;
    v16 = self;
    dispatch_async(queue, block);

  }
}

- (id)getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4107;
  v17 = __Block_byref_object_dispose__4108;
  v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__CSDarwinVoiceTriggerEventInfoProvider_getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID___block_invoke;
    block[3] = &unk_1E68811D8;
    block[4] = self;
    v11 = v4;
    v12 = &v13;
    dispatch_async_and_wait(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSMutableDictionary)triggerInfos
{
  return self->_triggerInfos;
}

- (void)setTriggerInfos:(id)a3
{
  objc_storeStrong((id *)&self->_triggerInfos, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggerInfos, 0);
}

void __95__CSDarwinVoiceTriggerEventInfoProvider_getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __124__CSDarwinVoiceTriggerEventInfoProvider_setRawVoiceTriggerEventInfo_fromDeviceUUID_anchorHostMachTime_anchorDarwinMachTime___block_invoke(_QWORD *a1)
{
  id v2;

  +[CSDarwinVoiceTriggerEventInfoProvider voiceTriggerEventInfoWithAdjustedMachTime:deviceUUID:anchorHostMachTime:anchorDarwinMachTime:](CSDarwinVoiceTriggerEventInfoProvider, "voiceTriggerEventInfoWithAdjustedMachTime:deviceUUID:anchorHostMachTime:anchorDarwinMachTime:", a1[4], a1[5], a1[7], a1[8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[6] + 8), "setObject:forKey:", v2, a1[5]);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4120 != -1)
    dispatch_once(&sharedInstance_onceToken_4120, &__block_literal_global_4121);
  return (id)sharedInstance_sharedInstance_4122;
}

+ (id)voiceTriggerEventInfoWithAdjustedMachTime:(id)a3 deviceUUID:(id)a4 anchorHostMachTime:(unint64_t)a5 anchorDarwinMachTime:(unint64_t)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  unint64_t v50;
  void *v51;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  double v57;
  double v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;

  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setObject:forKey:", CFSTR("Darwin"), CFSTR("firstPassTriggerSource"));
  if (!v8)
    goto LABEL_24;
  if (!a5)
    goto LABEL_24;
  if (!a6)
    goto LABEL_24;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredMachTime"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_24;
  v11 = (void *)v10;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerStartMachTime"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_23:

    goto LABEL_24;
  }
  v13 = (void *)v12;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerFireMachTime"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_22:

    goto LABEL_23;
  }
  v15 = (void *)v14;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_21:

    goto LABEL_22;
  }
  v17 = (void *)v16;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerFireSeconds"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_21;
  }
  v19 = (void *)v18;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndSeconds"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredMachTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedLongLongValue");

    v23 = 0.0;
    v24 = 0.0;
    if (v22 < a6)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredMachTime"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (double)(a6 - objc_msgSend(v25, "unsignedLongLongValue"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerStartMachTime"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedLongLongValue");

    if (v27 < a6)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerStartMachTime"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (double)(a6 - objc_msgSend(v28, "unsignedLongLongValue"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedLongLongValue");

    v31 = 0.0;
    v32 = 0.0;
    if (v30 < a6)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (double)(a6 - objc_msgSend(v33, "unsignedLongLongValue"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerFireMachTime"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedLongLongValue");

    if (v35 < a6)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerFireMachTime"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (double)(a6 - objc_msgSend(v36, "unsignedLongLongValue"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerFireMachTime"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "unsignedLongLongValue");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (double)(unint64_t)(v38 - objc_msgSend(v39, "unsignedLongLongValue"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerFireSeconds"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "floatValue");
    v43 = v42;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndSeconds"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "floatValue");
    v46 = v40 / (float)(v43 - v45);

    v47 = v24 / v46;
    +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
    if ((unint64_t)(v47 * v48) >= a5)
    {
      v50 = 0;
    }
    else
    {
      +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
      v50 = a5 - (unint64_t)(v47 * v49);
    }
    v53 = v23 / v46;
    +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
    if ((unint64_t)(v53 * v54) >= a5)
    {
      v56 = 0;
    }
    else
    {
      +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
      v56 = a5 - (unint64_t)(v53 * v55);
    }
    +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
    if ((unint64_t)(v32 / v46 * v57) >= a5)
    {
      v59 = 0;
    }
    else
    {
      +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
      v59 = a5 - (unint64_t)(v32 / v46 * v58);
    }
    v60 = v31 / v46;
    +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
    if ((unint64_t)(v60 * v61) >= a5)
    {
      v63 = 0;
    }
    else
    {
      +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
      v63 = a5 - (unint64_t)(v60 * v62);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v50);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v64, CFSTR("earlyDetectFiredMachTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v65, CFSTR("triggerStartMachTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v59);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v66, CFSTR("triggerEndMachTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v63);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("triggerFireMachTime"));
    goto LABEL_23;
  }
LABEL_24:
  v51 = (void *)objc_msgSend(v9, "copy");

  return v51;
}

void __55__CSDarwinVoiceTriggerEventInfoProvider_sharedInstance__block_invoke()
{
  CSDarwinVoiceTriggerEventInfoProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSDarwinVoiceTriggerEventInfoProvider);
  v1 = (void *)sharedInstance_sharedInstance_4122;
  sharedInstance_sharedInstance_4122 = (uint64_t)v0;

}

@end
