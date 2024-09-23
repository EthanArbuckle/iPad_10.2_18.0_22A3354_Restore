@implementation HMIVideoAnalyzerServer

- (HMIVideoAnalyzerServer)initWithConfiguration:(id)a3 identifier:(id)a4
{
  id v6;
  char *v7;
  void *v8;
  dispatch_qos_class_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  HMIVideoCommandBuffer *v20;
  void *v21;
  void *v22;
  void *v23;
  HMIVideoFrameSelector *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMIVideoFrameTracker *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMIVideoFrameAnalyzer *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMIVideoTemporalEventFilter *v36;
  void *v37;
  HMIVideoFrameIntervalSampler *v38;
  uint64_t v39;
  void *v40;
  HMIVideoFrameIntervalSampler *v41;
  uint64_t v42;
  void *v43;
  HMIVideoEventBuffer *v44;
  void *v45;
  HMIVideoEventBuffer *v46;
  void *v47;
  HMIVideoEventBuffer *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  HMIVideoTimeline *v53;
  void *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  _QWORD v64[4];
  uint64_t v65;
  uint64_t v66;
  char v67[24];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  objc_super v71;

  v6 = a3;
  v71.receiver = self;
  v71.super_class = (Class)HMIVideoAnalyzerServer;
  v7 = -[HMIVideoAnalyzer initWithConfiguration:identifier:](&v71, sel_initWithConfiguration_identifier_, v6, a4);
  if (v7)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "analysisQOS");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, v9, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("HMIVideoAnalyzerServer", v11);
    v13 = (void *)*((_QWORD *)v7 + 19);
    *((_QWORD *)v7 + 19) = v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("HMIVideoAnalyzerServer - Input", v14);
    v16 = (void *)*((_QWORD *)v7 + 18);
    *((_QWORD *)v7 + 18) = v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("HMIVideoAnalyzerServer - Encoder", v17);
    v19 = (void *)*((_QWORD *)v7 + 20);
    *((_QWORD *)v7 + 20) = v18;

    v7[129] = objc_msgSend(v6, "transcode");
    v20 = -[HMIVideoCommandBuffer initWithMaxCapacity:]([HMIVideoCommandBuffer alloc], "initWithMaxCapacity:", 0x800000);
    v21 = (void *)*((_QWORD *)v7 + 25);
    *((_QWORD *)v7 + 25) = v20;

    v22 = (void *)*((_QWORD *)v7 + 25);
    objc_msgSend(v7, "inputQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:queue:", v7, v23);

    v24 = [HMIVideoFrameSelector alloc];
    objc_msgSend(v7, "workQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMIVideoFrameSelector initWithConfiguration:workQueue:](v24, "initWithConfiguration:workQueue:", v6, v25);
    v27 = (void *)*((_QWORD *)v7 + 31);
    *((_QWORD *)v7 + 31) = v26;

    objc_msgSend(*((id *)v7 + 31), "setDelegate:", v7);
    v28 = [HMIVideoFrameTracker alloc];
    objc_msgSend(v7, "workQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HMIVideoFrameTracker initWithConfiguration:workQueue:](v28, "initWithConfiguration:workQueue:", v6, v29);
    v31 = (void *)*((_QWORD *)v7 + 32);
    *((_QWORD *)v7 + 32) = v30;

    objc_msgSend(*((id *)v7 + 32), "setDelegate:", v7);
    v32 = [HMIVideoFrameAnalyzer alloc];
    objc_msgSend(v7, "workQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HMIVideoFrameAnalyzer initWithConfiguration:workQueue:](v32, "initWithConfiguration:workQueue:", v6, v33);
    v35 = (void *)*((_QWORD *)v7 + 33);
    *((_QWORD *)v7 + 33) = v34;

    objc_msgSend(*((id *)v7 + 33), "setDelegate:", v7);
    v36 = objc_alloc_init(HMIVideoTemporalEventFilter);
    v37 = (void *)*((_QWORD *)v7 + 41);
    *((_QWORD *)v7 + 41) = v36;

    if (v6)
    {
      objc_msgSend(v6, "thumbnailInterval");
      if ((v69 & 0x100000000) != 0)
      {
        v38 = [HMIVideoFrameIntervalSampler alloc];
        objc_msgSend(v6, "thumbnailInterval");
        v39 = -[HMIVideoFrameIntervalSampler initWithInterval:](v38, "initWithInterval:", v67);
        v40 = (void *)*((_QWORD *)v7 + 27);
        *((_QWORD *)v7 + 27) = v39;

        objc_msgSend(*((id *)v7 + 27), "setDelegate:", v7);
      }
      objc_msgSend(v6, "timelapseInterval");
      if ((v65 & 0x100000000) != 0)
      {
        v41 = [HMIVideoFrameIntervalSampler alloc];
        objc_msgSend(v6, "timelapseInterval");
        v42 = -[HMIVideoFrameIntervalSampler initWithInterval:](v41, "initWithInterval:", v64);
        v43 = (void *)*((_QWORD *)v7 + 28);
        *((_QWORD *)v7 + 28) = v42;

        objc_msgSend(*((id *)v7 + 28), "setDelegate:", v7);
      }
    }
    else
    {
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v65 = 0;
      v66 = 0;
      v64[3] = 0;
    }
    v44 = -[HMIVideoEventBuffer initWithMaxCapacity:]([HMIVideoEventBuffer alloc], "initWithMaxCapacity:", 1024);
    v45 = (void *)*((_QWORD *)v7 + 36);
    *((_QWORD *)v7 + 36) = v44;

    v46 = -[HMIVideoEventBuffer initWithMaxCapacity:]([HMIVideoEventBuffer alloc], "initWithMaxCapacity:", 1024);
    v47 = (void *)*((_QWORD *)v7 + 37);
    *((_QWORD *)v7 + 37) = v46;

    v48 = -[HMIVideoEventBuffer initWithMaxCapacity:]([HMIVideoEventBuffer alloc], "initWithMaxCapacity:", 64);
    v49 = (void *)*((_QWORD *)v7 + 40);
    *((_QWORD *)v7 + 40) = v48;

    v50 = MEMORY[0x24BDC0D88];
    v51 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)(v7 + 360) = *MEMORY[0x24BDC0D88];
    v52 = *(_QWORD *)(v50 + 16);
    *((_QWORD *)v7 + 47) = v52;
    *((_OWORD *)v7 + 24) = v51;
    *((_QWORD *)v7 + 50) = v52;
    v53 = -[HMIVideoTimeline initWithMaxCapacity:]([HMIVideoTimeline alloc], "initWithMaxCapacity:", 1024);
    v54 = (void *)*((_QWORD *)v7 + 42);
    *((_QWORD *)v7 + 42) = v53;

    objc_msgSend(v6, "analysisFPS");
    *((_QWORD *)v7 + 17) = v55;
    objc_msgSend(v6, "analysisFPS");
    objc_msgSend(*((id *)v7 + 31), "setSampleRate:", v56 * 3.0);
    *((_QWORD *)v7 + 11) = 0;
    *((_QWORD *)v7 + 12) = 0;
    *((_QWORD *)v7 + 13) = 0;
    *((_QWORD *)v7 + 14) = 0;
    *((_QWORD *)v7 + 15) = 0;
    v7[128] = 1;
    v7[130] = 0;
    v7[131] = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)*((_QWORD *)v7 + 43);
    *((_QWORD *)v7 + 43) = v57;

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)*((_QWORD *)v7 + 44);
    *((_QWORD *)v7 + 44) = v59;

    v61 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 12, 30.0);
    v62 = (void *)*((_QWORD *)v7 + 24);
    *((_QWORD *)v7 + 24) = v61;

    objc_msgSend(*((id *)v7 + 24), "setDelegate:", v7);
    objc_msgSend(*((id *)v7 + 24), "resume");
  }

  return (HMIVideoAnalyzerServer *)v7;
}

- (id)dynamicConfigurationForTime:(id *)a3
{
  HMIVideoEventBuffer *dynamicConfigurationBuffer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMIVideoAnalyzerServer *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  CMTime v16;
  CMTimeRange v17;
  CMTime start;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dynamicConfigurationBuffer = self->_dynamicConfigurationBuffer;
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v16 = *(CMTime *)a3;
  CMTimeRangeFromTimeToTime(&v17, &start, &v16);
  -[HMIVideoEventBuffer objectsInTimeRange:includeEnd:](dynamicConfigurationBuffer, "objectsInTimeRange:includeEnd:", &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      start = (CMTime)*a3;
      HMICMTimeDescription(&start);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(start.value) = 138543618;
      *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v12;
      LOWORD(start.flags) = 2112;
      *(_QWORD *)((char *)&start.flags + 2) = v13;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Dynamic configuration is missing for time: %@, using the first instead.", (uint8_t *)&start, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMIVideoEventBuffer firstObject](self->_dynamicConfigurationBuffer, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4
{
  NSString *v6;
  id v7;
  void *v8;
  HMIVideoAnalyzerServer *v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  char *v14;
  void *v15;
  HMIVideoAnalyzerServer *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMIVideoAnalyzerServer *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  NSString *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (NSString *)a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received Message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[NSString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("selector"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[NSString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("arguments"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (char *)NSSelectorFromString(v12);
  if (v14 == sel_flush)
  {
    -[HMIVideoAnalyzerServer flush](v9, "flush");
    if (!v7)
      goto LABEL_28;
    goto LABEL_25;
  }
  if (v14 == sel_flushAsync)
  {
    -[HMIVideoAnalyzerServer flushAsync](v9, "flushAsync");
    if (!v7)
      goto LABEL_28;
    goto LABEL_25;
  }
  if (v14 == sel_finishWithCompletionHandler_)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __69__HMIVideoAnalyzerServer_handleMessageWithOptions_completionHandler___block_invoke;
    v25[3] = &unk_24DBEE4F8;
    v27 = v7;
    v25[4] = v9;
    v26 = v6;
    -[HMIVideoAnalyzerServer finishWithCompletionHandler:](v9, "finishWithCompletionHandler:", v25);

    goto LABEL_28;
  }
  if (v14 == sel_cancel)
  {
    -[HMIVideoAnalyzerServer cancel](v9, "cancel");
    if (!v7)
      goto LABEL_28;
    goto LABEL_25;
  }
  if (v14 == sel_setAnalysisFPS_)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    -[HMIVideoAnalyzerServer setAnalysisFPS:](v9, "setAnalysisFPS:");
    goto LABEL_24;
  }
  if (v14 == sel_setMonitored_)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer setMonitored:](v9, "setMonitored:", objc_msgSend(v19, "BOOLValue"));
    goto LABEL_24;
  }
  if (v14 == sel_handleAssetData_withOptions_completionHandler_)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer handleAssetData:withOptions:completionHandler:](v9, "handleAssetData:withOptions:completionHandler:", v19, v20, 0);

LABEL_24:
    if (!v7)
      goto LABEL_28;
    goto LABEL_25;
  }
  v15 = (void *)MEMORY[0x220735570]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v18;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unknown %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  if (v7)
  {
LABEL_25:
    v21 = (void *)MEMORY[0x220735570]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_219D45000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Sent Message Reply: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
LABEL_28:

}

void __69__HMIVideoAnalyzerServer_handleMessageWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x220735570]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Sent Message Reply: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HMIVideoFragment *v16;
  HMIVideoFragment *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  Float64 Seconds;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMIVideoAnalyzerServer *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  HMIVideoEventEntry *v37;
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentDTS;
  HMIVideoEventEntry *v39;
  void *v40;
  HMIVideoFragment *v41;
  HMIMemoryAVAsset *v42;
  uint64_t v43;
  void *v44;
  _BOOL8 v45;
  HMIVideoAssetReader *v46;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  opaqueCMSampleBuffer *v49;
  opaqueCMSampleBuffer *v50;
  const void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *context;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void (**v62)(id, _QWORD, void *);
  void *v63;
  CMTime rhs;
  CMTime lhs;
  CMTime v66;
  _QWORD v67[4];
  HMIVideoFragment *v68;
  id v69;
  id location;
  _QWORD v71[4];
  id v72;
  id v73;
  CMTime v74;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTime buf;
  void *v81;
  __int16 v82;
  HMIVideoFragment *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v60 = a4;
  v62 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer setLastFragmentReceivedDate:](self, "setLastFragmentReceivedDate:", v8);

  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("configuration"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63)
    _HMFPreconditionFailure();
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPreferenceForKey:", CFSTR("eventTriggers"));

  if (v10)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberPreferenceForKey:", CFSTR("eventTriggers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setEventTriggers:", objc_msgSend(v12, "integerValue"));

  }
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberPreferenceForKey:defaultValue:", CFSTR("fragmentDiskBufferSize"), &unk_24DC14A50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  if (v15)
    -[HMIVideoAnalyzerServer _saveFragmentDataToDisk:diskBufferSize:](self, "_saveFragmentDataToDisk:diskBufferSize:", v61, v15 << 20);
  v16 = -[HMIVideoFragment initWithData:]([HMIVideoFragment alloc], "initWithData:", v61);
  v17 = v16;
  if (v16)
    -[HMIVideoFragment duration](v16, "duration");
  else
    memset(&time1, 0, sizeof(time1));
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v18, "maxFragmentDuration");
  else
    memset(&time2, 0, sizeof(time2));
  v20 = CMTimeCompare(&time1, &time2) > 0;

  if (!v20)
    goto LABEL_27;
  v21 = (void *)MEMORY[0x24BDD17C8];
  if (v17)
    -[HMIVideoFragment duration](v17, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "maxFragmentDuration");
  else
    memset(&v74, 0, sizeof(v74));
  objc_msgSend(v21, "stringWithFormat:", CFSTR("Video fragment duration: %fs is greater than the max fragment duration value: %fs"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v74));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
  {
    -[HMIVideoFragment sanitizedData](v17, "sanitizedData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "base64EncodedDataWithOptions:", 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v59, 4);
    context = (void *)MEMORY[0x220735570]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzer configuration](v27, "configuration");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "camera");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "manufacturer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzer configuration](v27, "configuration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "camera");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "model");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138544386;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v54;
      LOWORD(buf.flags) = 2112;
      *(_QWORD *)((char *)&buf.flags + 2) = v29;
      HIWORD(buf.epoch) = 2112;
      v81 = v32;
      v82 = 2112;
      v83 = v17;
      v84 = 2112;
      v85 = v58;
      _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_ERROR, "%{public}@Camera, Manufacturer: %@, Model: %@, Fragment: %@, Sanitized Fragment Data: %@", (uint8_t *)&buf, 0x34u);

    }
    objc_autoreleasePoolPop(context);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", 4, v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (v62)
      v62[2](v62, 0, v33);
    objc_initWeak((id *)&buf, self);
    -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke;
    v71[3] = &unk_24DBEA030;
    objc_copyWeak(&v73, (id *)&buf);
    v35 = v33;
    v72 = v35;
    objc_msgSend(v34, "handleBlock:", v71);

    objc_destroyWeak(&v73);
    objc_destroyWeak((id *)&buf);

  }
  else
  {
LABEL_27:
    -[HMIVideoAnalyzerServer dynamicConfigurationBuffer](self, "dynamicConfigurationBuffer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = [HMIVideoEventEntry alloc];
    p_currentDTS = &self->_currentDTS;
    buf = (CMTime)self->_currentDTS;
    v39 = -[HMIVideoEventEntry initWithValue:time:](v37, "initWithValue:time:", v63, &buf);
    objc_msgSend(v36, "addObject:", v39);

    objc_initWeak(&location, self);
    -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke_2;
    v67[3] = &unk_24DBEA030;
    objc_copyWeak(&v69, &location);
    v41 = v17;
    v68 = v41;
    objc_msgSend(v40, "handleBlock:", v67);

    v42 = -[HMIMemoryAVAsset initWithData:]([HMIMemoryAVAsset alloc], "initWithData:", v61);
    -[HMIMemoryAVAsset loadValuesSynchronously](v42, "loadValuesSynchronously");
    v43 = -[HMIVideoFragment videoFormatDescription](v41, "videoFormatDescription");
    -[HMIVideoAnalyzer configuration](self, "configuration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "passthroughAudio"))
      v45 = -[HMIVideoFragment audioFormatDescription](v41, "audioFormatDescription") != 0;
    else
      v45 = 0;

    v46 = -[HMIVideoAssetReader initWithAsset:readVideoTrack:readAudioTrack:]([HMIVideoAssetReader alloc], "initWithAsset:readVideoTrack:readAudioTrack:", v42, v43 != 0, v45);
    *(_OWORD *)&buf.value = *(_OWORD *)&p_currentDTS->value;
    buf.epoch = self->_currentDTS.epoch;
    value = *MEMORY[0x24BDC0D40];
    flags = *(_DWORD *)(MEMORY[0x24BDC0D40] + 12);
    timescale = *(_DWORD *)(MEMORY[0x24BDC0D40] + 8);
    epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    while (1)
    {
      v49 = -[HMIVideoAssetReader copyNextSampleBuffer](v46, "copyNextSampleBuffer");
      v50 = v49;
      if (!v49)
        break;
      v66 = buf;
      v51 = (const void *)HMICMSampleBufferCreateCopyWithTimingOffset(v49, &v66);
      if (HMICMSampleBufferIsVideo(v50))
      {
        CMSampleBufferGetDuration(&v66, v50);
        value = v66.value;
        flags = v66.flags;
        timescale = v66.timescale;
        epoch = v66.epoch;
      }
      CFRelease(v50);
      -[HMIVideoAnalyzerServer handleSampleBuffer:errorHandler:](self, "handleSampleBuffer:errorHandler:", v51, 0);
      CFRelease(v51);
    }
    if ((flags & 1) != 0)
    {
      *(_OWORD *)&lhs.value = *(_OWORD *)&p_currentDTS->value;
      lhs.epoch = self->_currentDTS.epoch;
      rhs.value = value;
      rhs.timescale = timescale;
      rhs.flags = flags;
      rhs.epoch = epoch;
      CMTimeAdd(&v66, &lhs, &rhs);
      *(_OWORD *)&p_currentDTS->value = *(_OWORD *)&v66.value;
      self->_currentDTS.epoch = v66.epoch;
      if (-[HMIVideoNode status](v46, "status") == 4)
      {
        -[HMIVideoNode error](v46, "error");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v53);

      }
      if (v62)
        v62[2](v62, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", 4, CFSTR("Fragment had no video samples, fragment is likely corrupted."));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v52);
      if (v62)
        v62[2](v62, 0, v52);

    }
    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);
  }

}

void __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_notifyDelegateDidFailWithError:", *(_QWORD *)(a1 + 32));

}

void __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_msgSend(*(id *)(a1 + 32), "videoFormatDescription");
    objc_msgSend(v8, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "passthroughAudio"))
      v5 = objc_msgSend(*(id *)(a1 + 32), "audioFormatDescription");
    else
      v5 = 0;
    objc_msgSend(v8, "_prepareForInputVideoFormat:audioFormat:", v3, v5);

    objc_msgSend(v8, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "decodeMode");

    if (v7)
      objc_msgSend(v8, "_ensureDecoderForFragment:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "_ensureEncoder");
    objc_msgSend(v8, "_ensureTimelapseEncoder");
    WeakRetained = v8;
  }

}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 errorHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CMTime v10;
  CMTime v11;

  if (HMICMSampleBufferIsAudio(a3))
  {
    -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleSampleBuffer:", a3);

  }
  else if (CMSampleBufferGetImageBuffer(a3))
  {
    -[HMIVideoAnalyzerServer _handleDecodedSampleBuffer:](self, "_handleDecodedSampleBuffer:", a3);
  }
  else
  {
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetDecodeTimeStamp(&v11, a3);
    self->_currentDTS = ($95D729B680665BEAEFA1D6FCA8238556)v11;
    -[HMIVideoAnalyzerServer timeline](self, "timeline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CMSampleBufferGetPresentationTimeStamp(&v10, a3);
    objc_msgSend(v6, "addDate:atTime:", v7, &v10);

    -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleSampleBuffer:", a3);

  }
}

- (void)flush
{
  id v2;

  -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

- (void)flushAsync
{
  id v2;

  -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushAsync");

}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMIVideoAnalyzerServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Finish Analyzer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIVideoAnalyzerServer commandBuffer](v6, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__HMIVideoAnalyzerServer_finishWithCompletionHandler___block_invoke;
  v11[3] = &unk_24DBEA348;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "handleBlock:", v11);

}

void __54__HMIVideoAnalyzerServer_finishWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "inputQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (objc_msgSend(*(id *)(a1 + 32), "hasFailed"))
  {
    v3 = (void *)MEMORY[0x220735570]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has failed, ignoring finish.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIAnalytics videoAnalyzerDidTerminateWithError:state:](HMIAnalytics, "videoAnalyzerDidTerminateWithError:state:", 0, v7);

    objc_msgSend(*(id *)(a1 + 32), "timelapseAssetWriter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "timelapseEncoder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "flush");

      objc_msgSend(*(id *)(a1 + 32), "timelapseAssetWriter");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishWithCompletionHandler:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
    }
  }
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)_saveFragmentDataToDisk:(id)a3 diskBufferSize:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  id v45;
  _QWORD v47[5];
  id v48;
  id v49;
  unint64_t v50;

  v45 = a3;
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "camera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("Unknown");
  if (v7)
    v9 = (__CFString *)v7;
  v44 = v9;

  v41 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "camera");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "manufacturer");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("UnknownManufacturer");
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "camera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "model");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("UnknownModel");
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "camera");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firmwareVersion");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = CFSTR("UnknownFirmware");
  if (v20)
    v22 = (const __CFString *)v20;
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@_%@_%@"), v12, v17, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingPathComponent:", v44);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, 0);

  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke;
  v47[3] = &unk_24DBEE548;
  v47[4] = self;
  v48 = v26;
  v49 = v45;
  v50 = a4;
  v28 = v45;
  v29 = v26;
  v30 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220735744](v47);
  v31 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v31, "setDateFormat:", CFSTR("YYYY-MM-dd-HH-mm-ss"));
  v32 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerServer startDate](self, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringFromDate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzer identifier](self, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@_%@_%@"), v34, v35, v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "stringByAppendingPathComponent:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringByAppendingPathExtension:", CFSTR("mp4"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v38, 0);
  objc_msgSend(v29, "stringByAppendingPathComponent:", v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringByAppendingPathExtension:", CFSTR("sanitized.mp4"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *, uint64_t))v30)[2](v30, v40, 1);
}

void __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  char v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  char v56;
  id v57;
  uint64_t v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    v48 = a3;
    v50 = v5;
    objc_msgSend(v8, "enumeratorAtPath:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nextObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = 0;
      do
      {
        objc_msgSend(v10, "addObject:", v20);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        objc_msgSend(v22, "attributesOfItemAtPath:error:", v23, &v58);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v24, "fileSize"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v25, v20);

        v21 += objc_msgSend(v24, "fileSize");
        objc_msgSend(v18, "nextObject");
        v26 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v26;
      }
      while (v26);
    }
    else
    {
      v21 = 0;
    }
    v49 = v18;
    v27 = *(_QWORD *)(a1 + 56);
    v28 = (void *)MEMORY[0x220735570]();
    v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = v27 - v21;
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v61 = v32;
      v62 = 2112;
      v63 = v33;
      v64 = 2048;
      v65 = v31 / 0x100000;
      _os_log_impl(&dword_219D45000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Disk buffer size remaining in %@, %ld MB", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v34 = v51;
    if ((objc_msgSend(v10, "hmf_isEmpty") & 1) == 0)
    {
      v52 = v10;
      do
      {
        if (v21 < *(_QWORD *)(a1 + 56))
          break;
        objc_msgSend(v10, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_removeFirstObject");
        objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        objc_msgSend(v37, "removeItemAtPath:error:", v36, &v57);
        v38 = v57;

        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "integerValue");

        v41 = (void *)MEMORY[0x220735570]();
        v42 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v44;
          v62 = 2112;
          v63 = v36;
          v64 = 2112;
          v65 = (uint64_t)v38;
          _os_log_impl(&dword_219D45000, v43, OS_LOG_TYPE_DEBUG, "%{public}@Deleted %@ to free up some space, error: %@", buf, 0x20u);

          v34 = v51;
        }
        v21 -= v40;

        objc_autoreleasePoolPop(v41);
        v10 = v52;
      }
      while (!objc_msgSend(v52, "hmf_isEmpty"));
    }

    v11 = v49;
    v5 = v50;
    a3 = v48;
    goto LABEL_20;
  }
  v59 = 0;
  objc_msgSend(v8, "attributesOfItemAtPath:error:", v5, &v59);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v59;

  v12 = objc_msgSend(v10, "fileSize");
  v13 = *(_QWORD *)(a1 + 56);
  if (v12 <= v13 >> 3)
  {
LABEL_20:

    v45 = *(_QWORD *)(a1 + 48);
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke_294;
    v53[3] = &unk_24DBEE520;
    v46 = v5;
    v56 = a3;
    v47 = *(_QWORD *)(a1 + 32);
    v54 = v46;
    v55 = v47;
    +[HMIVideoFragment fragmentData:handler:](HMIVideoFragment, "fragmentData:handler:", v45, v53);
    v11 = v54;
    goto LABEL_21;
  }
  v14 = (void *)MEMORY[0x220735570]();
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v17;
    v62 = 2112;
    v63 = v5;
    v64 = 2048;
    v65 = v13 >> 23;
    _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Video file %@ size is too large, maximum allowed is (%ld MB), no longer appending fragments.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);

LABEL_21:
}

void __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke_294(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "seekToEndOfFile");
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "sanitizedSeperableSegment");
    else
      objc_msgSend(v3, "separableSegment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeData:", v6);

    v7 = (void *)MEMORY[0x220735570](objc_msgSend(v5, "closeFile"));
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v12 = "%{public}@Appending fragment to %@";
LABEL_12:
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "sanitizedData");
    else
      objc_msgSend(v3, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "writeToFile:atomically:", *(_QWORD *)(a1 + 32), 1);

    v7 = (void *)MEMORY[0x220735570]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v14;
      v12 = "%{public}@Saving fragment to %@";
      goto LABEL_12;
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_prepareForInputVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4
{
  void *v7;
  HMIVideoAnalyzerServer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMIVideoAnalyzerServer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!-[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat"))
  {
    self->_inputVideoFormat = a3;
    if (a3)
      CFRetain(a3);
  }
  if (!CMFormatDescriptionEqual(a3, -[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat")))
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Video format should not change.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  if (!-[HMIVideoAnalyzerServer inputAudioFormat](self, "inputAudioFormat"))
  {
    self->_inputAudioFormat = a4;
    if (a4)
      CFRetain(a4);
  }
  if (!CMFormatDescriptionEqual(a4, -[HMIVideoAnalyzerServer inputAudioFormat](self, "inputAudioFormat")))
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Audio format should not change.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[HMIVideoAnalyzerServer _configureAssetWriter](self, "_configureAssetWriter");
}

- (void)_prepareForTimelapseOutputVideoFormat:(opaqueCMFormatDescription *)a3
{
  opaqueCMFormatDescription *timelapseOutputVideoFormat;

  if (!CMFormatDescriptionEqual(a3, -[HMIVideoAnalyzerServer timelapseOutputVideoFormat](self, "timelapseOutputVideoFormat")))
  {
    timelapseOutputVideoFormat = self->_timelapseOutputVideoFormat;
    if (timelapseOutputVideoFormat)
      CFRelease(timelapseOutputVideoFormat);
    self->_timelapseOutputVideoFormat = (opaqueCMFormatDescription *)CFRetain(a3);
    -[HMIVideoAnalyzerServer _configureTimelapseAssetWriter](self, "_configureTimelapseAssetWriter");
  }
}

- (void)dealloc
{
  void *v3;
  HMIVideoAnalyzerServer *v4;
  NSObject *v5;
  void *v6;
  opaqueCMFormatDescription *inputVideoFormat;
  opaqueCMFormatDescription *inputAudioFormat;
  opaqueCMFormatDescription *timelapseOutputVideoFormat;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_DEBUG, "%{public}@-[HMIVideoAnalyzerServer dealloc]", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  inputVideoFormat = v4->_inputVideoFormat;
  if (inputVideoFormat)
    CFRelease(inputVideoFormat);
  inputAudioFormat = v4->_inputAudioFormat;
  if (inputAudioFormat)
    CFRelease(inputAudioFormat);
  timelapseOutputVideoFormat = v4->_timelapseOutputVideoFormat;
  if (timelapseOutputVideoFormat)
    CFRelease(timelapseOutputVideoFormat);
  v10.receiver = v4;
  v10.super_class = (Class)HMIVideoAnalyzerServer;
  -[HMIVideoAnalyzer dealloc](&v10, sel_dealloc);
}

- (void)_configureAssetWriter
{
  void *v3;
  HMIVideoAssetWriter *v4;
  void *v5;
  void *v6;
  HMIVideoAnalyzerServer *v7;
  SEL v8;
  id v9;

  -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    -[HMIVideoAnalyzerServer _configureTimelapseAssetWriter](v7, v8);
  }
  else
  {
    v4 = -[HMIVideoAssetWriter initWithVideoFormat:audioFormat:]([HMIVideoAssetWriter alloc], "initWithVideoFormat:audioFormat:", -[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat"), -[HMIVideoAnalyzerServer inputAudioFormat](self, "inputAudioFormat"));
    -[HMIVideoAnalyzerServer setAssetWriter:](self, "setAssetWriter:", v4);

    -[HMIVideoAnalyzer logIdentifier](self, "logIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLogIdentifier:", v5);

    -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
}

- (void)_configureTimelapseAssetWriter
{
  HMIVideoAssetWriter *v3;
  opaqueCMFormatDescription *v4;
  void *v5;
  void *v6;
  HMIVideoAssetWriter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMIVideoAnalyzerServer *v13;
  SEL v14;
  _QWORD v15[3];

  if (-[HMIVideoAnalyzerServer timelapseOutputVideoFormat](self, "timelapseOutputVideoFormat"))
  {
    v3 = [HMIVideoAssetWriter alloc];
    v4 = -[HMIVideoAnalyzerServer timelapseOutputVideoFormat](self, "timelapseOutputVideoFormat");
    -[HMIVideoAnalyzer configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "timelapsePreferredFragmentDuration");
    else
      memset(v15, 0, sizeof(v15));
    v7 = -[HMIVideoAssetWriter initWithVideoFormat:audioFormat:initialFragmentSequenceNumber:preferredOutputSegmentInterval:](v3, "initWithVideoFormat:audioFormat:initialFragmentSequenceNumber:preferredOutputSegmentInterval:", v4, 0, 1, v15);
    -[HMIVideoAnalyzerServer setTimelapseAssetWriter:](self, "setTimelapseAssetWriter:", v7);

    -[HMIVideoAnalyzerServer timelapseAssetWriter](self, "timelapseAssetWriter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[HMIVideoAnalyzer identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(" Timelapse"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer timelapseAssetWriter](self, "timelapseAssetWriter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLogIdentifier:", v11);

  }
  else
  {
    v13 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    -[HMIVideoAnalyzerServer _configureEncoder](v13, v14);
  }
}

- (void)_configureEncoder
{
  void *v3;
  HMIVideoEncoder *v4;
  CMVideoDimensions Dimensions;
  void *v6;
  HMIVideoEncoder *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMIVideoAnalyzerServer *v16;
  SEL v17;
  id v18;

  if (!self->_encode)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  -[HMIVideoAnalyzerServer encoder](self, "encoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!-[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat"))
  {
LABEL_10:
    v16 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    -[HMIVideoAnalyzerServer _configureTimelapseEncoder](v16, v17);
    return;
  }
  v4 = [HMIVideoEncoder alloc];
  Dimensions = CMVideoFormatDescriptionGetDimensions(-[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat"));
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v7 = -[HMIVideoEncoder initWithDimensions:codecType:useHardwareAcceleration:error:](v4, "initWithDimensions:codecType:useHardwareAcceleration:error:", Dimensions, objc_msgSend(v6, "transcodeCodecType"), 1, &v18);
  v8 = v18;
  -[HMIVideoAnalyzerServer setEncoder:](self, "setEncoder:", v7);

  -[HMIVideoAnalyzerServer encoder](self, "encoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMIVideoAnalyzer logIdentifier](self, "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLogIdentifier:", v10);

    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAverageBitRate:", 1000000);

    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDataRateLimit:", 0x80000, 4);

    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer encoderQueue](self, "encoderQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:queue:", self, v15);

  }
  else
  {
    -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v8);
  }

}

- (void)_configureTimelapseEncoder
{
  void *v3;
  unint64_t Dimensions;
  int32_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  HMIVideoEncoder *v10;
  void *v11;
  HMIVideoEncoder *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t Seconds;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMIVideoAnalyzerServer *v26;
  NSObject *v27;
  void *v28;
  double v29;
  CMTime v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _HMFPreconditionFailure();
LABEL_25:
    _HMFPreconditionFailure();
  }
  if (!-[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat"))
    goto LABEL_25;
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(-[HMIVideoAnalyzerServer inputVideoFormat](self, "inputVideoFormat"));
  v5 = Dimensions;
  v6 = HIDWORD(Dimensions);
  v7 = HMIAspectRatioMake(Dimensions, HIDWORD(Dimensions));
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x900000010) & 1) != 0)
  {
    v8 = 0x1B000000000;
    v9 = 768;
    goto LABEL_10;
  }
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x1000000009) & 1) != 0)
  {
    v8 = 0x30000000000;
LABEL_7:
    v9 = 432;
    goto LABEL_10;
  }
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x300000004) & 1) != 0)
  {
    v8 = 0x1B000000000;
    v9 = 576;
  }
  else
  {
    if ((HMIAspectRatioEqualToAspectRatio(v7, 0x400000003) & 1) != 0)
    {
      v8 = 0x24000000000;
      goto LABEL_7;
    }
    if ((HMIAspectRatioEqualToAspectRatio(v7, 0x100000001) & 1) != 0)
    {
      v8 = 0x1B000000000;
      goto LABEL_7;
    }
    v25 = (void *)MEMORY[0x220735570]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v28;
      v34 = 1024;
      v35 = v7;
      v36 = 1024;
      v37 = HIDWORD(v7);
      _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unsupported aspect ratio: (%d, %d)", buf, 0x18u);

    }
    objc_autoreleasePoolPop(v25);
    v29 = 432.0 / (double)(int)v6;
    v9 = (int)(v29 * (double)v5);
    v8 = (unint64_t)(int)(v29 * (double)(int)v6) << 32;
  }
LABEL_10:
  v10 = [HMIVideoEncoder alloc];
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v12 = -[HMIVideoEncoder initWithDimensions:codecType:useHardwareAcceleration:error:](v10, "initWithDimensions:codecType:useHardwareAcceleration:error:", v9 | v8, objc_msgSend(v11, "timelapseCodecType"), 1, &v31);
  v13 = v31;
  -[HMIVideoAnalyzerServer setTimelapseEncoder:](self, "setTimelapseEncoder:", v12);

  -[HMIVideoAnalyzer logIdentifier](self, "logIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR(" Timelapse"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLogIdentifier:", v15);

  -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAverageBitRate:", 100000);

  -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMIVideoAnalyzer configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "timelapsePreferredFragmentDuration");
    else
      memset(&v30, 0, sizeof(v30));
    Seconds = (uint64_t)CMTimeGetSeconds(&v30);
    -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMaxKeyFrameIntervalDuration:", Seconds);

    -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer encoderQueue](self, "encoderQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:queue:", self, v24);

  }
  else
  {
    -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v13);
  }

}

- (void)buffer:(id)a3 willHandleSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMIVideoAnalyzerServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMIVideoAnalyzerServer inputQueue](self, "inputQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!-[HMIVideoAnalyzerServer hasFailed](self, "hasFailed")
    && !-[HMIVideoAnalyzerServer isCancelled](self, "isCancelled"))
  {
    if (HMICMSampleBufferIsAudio(a4))
    {
      -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleSampleBuffer:", a4);
        goto LABEL_15;
      }
LABEL_17:
      _HMFPreconditionFailure();
    }
    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_17;
      -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleSampleBuffer:", a4);

    }
    -[HMIVideoAnalyzer configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "decodeMode");

    if (v18 == 1 && !HMICMSampleBufferIsSync(a4))
      goto LABEL_16;
    -[HMIVideoAnalyzerServer decoder](self, "decoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleSampleBuffer:outputFrame:", a4, 1);
LABEL_15:

    goto LABEL_16;
  }
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v11;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has failed or was cancelled, ignoring sample buffer.", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
LABEL_16:

}

- (void)bufferWillFlush:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMIVideoAnalyzerServer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMIVideoAnalyzerServer inputQueue](self, "inputQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMIVideoAnalyzerServer hasFailed](self, "hasFailed")
    || -[HMIVideoAnalyzerServer isCancelled](self, "isCancelled"))
  {
    v6 = (void *)MEMORY[0x220735570]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v9;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has failed or was cancelled, ignoring flush.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    -[HMIVideoAnalyzerServer decoder](self, "decoder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flush");

    -[HMIVideoAnalyzerServer frameSelector](self, "frameSelector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "flush");

    -[HMIVideoAnalyzerServer frameTracker](self, "frameTracker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flush");

    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flush");

    -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "flush");

    -[HMIVideoAnalyzerServer frameAnalyzer](self, "frameAnalyzer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "flush");

    -[HMIVideoAnalyzerServer _ensureEncoder](self, "_ensureEncoder");
  }

}

- (void)_ensureDecoderForFragment:(id)a3
{
  void *v4;
  HMIVideoDecoder *v5;
  HMIVideoDecoder *decoder;
  void *v7;
  id v8;

  v8 = a3;
  -[HMIVideoAnalyzerServer decoder](self, "decoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[HMIVideoDecoder initWithFrameReordering:]([HMIVideoDecoder alloc], "initWithFrameReordering:", objc_msgSend(v8, "frameReorderingRequired"));
    decoder = self->_decoder;
    self->_decoder = v5;

    -[HMIVideoAnalyzer logIdentifier](self, "logIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoDecoder setLogIdentifier:](self->_decoder, "setLogIdentifier:", v7);

    -[HMIVideoDecoder setDelegate:](self->_decoder, "setDelegate:", self);
  }

}

- (void)_ensureEncoder
{
  void *v3;

  if (-[HMIVideoAnalyzerServer encode](self, "encode"))
  {
    -[HMIVideoAnalyzerServer encoder](self, "encoder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[HMIVideoAnalyzerServer _configureEncoder](self, "_configureEncoder");
  }
  else
  {
    -[HMIVideoAnalyzerServer setEncoder:](self, "setEncoder:", 0);
  }
}

- (void)_ensureTimelapseEncoder
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMIVideoAnalyzer configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "timelapseInterval");

      if ((v6 & 1) != 0)
        -[HMIVideoAnalyzerServer _configureTimelapseEncoder](self, "_configureTimelapseEncoder");
    }
    else
    {

    }
  }
}

- (void)decoder:(id)a3 didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[HMIVideoAnalyzerServer workQueue](self, "workQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMIVideoAnalyzerServer_decoder_didDecodeSampleBuffer___block_invoke;
  v7[3] = &unk_24DBEC5D0;
  v7[4] = self;
  v7[5] = a4;
  dispatch_sync(v6, v7);

}

uint64_t __56__HMIVideoAnalyzerServer_decoder_didDecodeSampleBuffer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDecodedSampleBuffer:", *(_QWORD *)(a1 + 40));
}

- (void)encoder:(id)a3 didEncodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMIVideoAnalyzerServer *v13;
  SEL v14;
  opaqueCMSampleBuffer *v15;
  id v16;

  v16 = a3;
  -[HMIVideoAnalyzerServer encoder](self, "encoder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v16)
  {
    -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    _HMFPreconditionFailure();
  }
  else
  {
    -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v16;
    if (v7 != v16)
    {
LABEL_8:

      return;
    }
    -[HMIVideoAnalyzerServer _prepareForTimelapseOutputVideoFormat:](self, "_prepareForTimelapseOutputVideoFormat:", CMSampleBufferGetFormatDescription(a4));
    -[HMIVideoAnalyzerServer timelapseAssetWriter](self, "timelapseAssetWriter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMIVideoAnalyzerServer timelapseAssetWriter](self, "timelapseAssetWriter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = v10;
      objc_msgSend(v10, "handleSampleBuffer:", a4);

      v8 = v16;
      goto LABEL_8;
    }
  }
  v13 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
  -[HMIVideoAnalyzerServer _handleDecodedSampleBuffer:](v13, v14, v15);
}

- (void)_handleDecodedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime v10;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef sampleBufferOut;
  CMTime v13;

  -[HMIVideoAnalyzerServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  memset(&v13, 0, sizeof(v13));
  CMSampleBufferGetDuration(&v13, a3);
  sampleBufferOut = 0;
  if ((v13.flags & 1) == 0)
  {
    memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
    CMSampleBufferGetDecodeTimeStamp(&sampleTimingArray.decodeTimeStamp, a3);
    CMSampleBufferGetPresentationTimeStamp(&v10, a3);
    sampleTimingArray.presentationTimeStamp = v10;
    CMTimeMake(&v10, 1, 30);
    sampleTimingArray.duration = v10;
    CMSampleBufferCreateCopyWithNewTiming(0, a3, 1, &sampleTimingArray, &sampleBufferOut);
    a3 = sampleBufferOut;
  }
  self->_numDecodedSamples += CMSampleBufferGetNumSamples(a3);
  memset(&sampleTimingArray, 0, 24);
  CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.duration, a3);
  *(_OWORD *)&self->_currentPTS.value = *(_OWORD *)&sampleTimingArray.duration.value;
  self->_currentPTS.epoch = sampleTimingArray.duration.epoch;
  -[HMIVideoAnalyzerServer encoder](self, "encoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleSampleBuffer:", a3);

  -[HMIVideoAnalyzerServer frameSelector](self, "frameSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleSampleBuffer:", a3);

  -[HMIVideoAnalyzerServer frameThumbnailSampler](self, "frameThumbnailSampler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleSampleBuffer:", a3);

  -[HMIVideoAnalyzerServer frameTimelapseSampler](self, "frameTimelapseSampler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleSampleBuffer:", a3);

  if (sampleBufferOut)
    CFRelease(sampleBufferOut);
}

- (opaqueCMSampleBuffer)frameSelector:(id)a3 prepareFrame:(opaqueCMSampleBuffer *)a4
{
  void *v5;
  opaqueCMSampleBuffer *v6;

  -[HMIVideoAnalyzerServer frameTracker](self, "frameTracker", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (opaqueCMSampleBuffer *)objc_msgSend(v5, "prepareSampleBuffer:", a4);

  return v6;
}

- (void)frameSelector:(id)a3 didSelectFrame:(opaqueCMSampleBuffer *)a4 reference:(opaqueCMSampleBuffer *)a5
{
  void *v8;
  void *v9;
  void *v10;
  CMTime v11;

  CMSampleBufferGetPresentationTimeStamp(&v11, a4);
  -[HMIVideoAnalyzerServer dynamicConfigurationForTime:](self, "dynamicConfigurationForTime:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer frameTracker](self, "frameTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDynamicConfiguration:", v8);

  -[HMIVideoAnalyzerServer frameTracker](self, "frameTracker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleSampleBuffer:reference:", a4, a5);

}

- (void)frameSelector:(id)a3 didSkipFrame:(opaqueCMSampleBuffer *)a4
{
  id v5;

  -[HMIVideoAnalyzerServer frameTracker](self, "frameTracker", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSampleBuffer:", a4);

}

- (void)frameTracker:(id)a3 didTrackFrame:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 motionDetections:(id)a6 tracks:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CMTime v16;

  v11 = a7;
  v12 = a6;
  CMSampleBufferGetPresentationTimeStamp(&v16, a4);
  -[HMIVideoAnalyzerServer dynamicConfigurationForTime:](self, "dynamicConfigurationForTime:", &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer frameAnalyzer](self, "frameAnalyzer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDynamicConfiguration:", v13);

  -[HMIVideoAnalyzerServer frameAnalyzer](self, "frameAnalyzer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleSampleBuffer:background:motionDetections:tracks:", a4, a5, v12, v11);

}

- (id)_filterFrameResult:(id)a3 dynamicConfiguration:(id)a4 motionDetections:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  HMIVideoAnalyzerResultActivityZoneFilter *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11;
  v30 = __Block_byref_object_dispose__11;
  v11 = v8;
  v31 = v11;
  v12 = [HMIVideoAnalyzerResultActivityZoneFilter alloc];
  objc_msgSend(v9, "activityZones");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMIVideoAnalyzerResultActivityZoneFilter initWithActivityZones:motionDetections:](v12, "initWithActivityZones:motionDetections:", v13, v10);
  v32[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __83__HMIVideoAnalyzerServer__filterFrameResult_dynamicConfiguration_motionDetections___block_invoke;
  v25[3] = &unk_24DBEE570;
  v25[4] = &v26;
  objc_msgSend(v15, "na_each:", v25);
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v16, "hasPreferenceForKey:", CFSTR("syntheticEvents"));

  if ((v14 & 1) == 0)
  {
    -[HMIVideoAnalyzer configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "enableTemporalEventFiltering");

    if (v18)
    {
      +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", v10, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerServer temporalEventFilter](self, "temporalEventFilter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "applyFilterWithFrameResult:motionDetection:", v27[5], v19);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v27[5];
      v27[5] = v21;

    }
  }
  v23 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v23;
}

void __83__HMIVideoAnalyzerServer__filterFrameResult_dynamicConfiguration_motionDetections___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "applyWithFrameResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)frameAnalyzer:(id)a3 didAnalyzeFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  HMIVideoAnalyzerFrameResult *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  HMIVideoAnalyzerFrameResult *v39;
  id v40;
  _QWORD v41[3];

  v6 = a3;
  v7 = a4;
  ++self->_numDidAnalyzeFrames;
  -[HMIVideoAnalyzerServer frameTracker](self, "frameTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFrameAnalyzerResult:", v7);

  objc_msgSend(v7, "frame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "presentationTimeStamp");
  else
    memset(v41, 0, sizeof(v41));
  -[HMIVideoAnalyzerServer dynamicConfigurationForTime:](self, "dynamicConfigurationForTime:", v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minFrameScale");
  v15 = v14;
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minFrameQuality");
  v40 = 0;
  objc_msgSend(v12, "compressedFrameWithScale:quality:error:", &v40, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v40;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__11;
  v38 = __Block_byref_object_dispose__11;
  v20 = [HMIVideoAnalyzerFrameResult alloc];
  objc_msgSend(v7, "events");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regionOfInterest");
  v39 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v20, "initWithFrame:events:regionOfInterest:", v18, v21);

  v22 = v35[5];
  objc_msgSend(v7, "motionDetections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer _filterFrameResult:dynamicConfiguration:motionDetections:](self, "_filterFrameResult:dynamicConfiguration:motionDetections:", v22, v11, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v35[5];
  v35[5] = v24;

  objc_msgSend(v7, "events");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __56__HMIVideoAnalyzerServer_frameAnalyzer_didAnalyzeFrame___block_invoke;
  v31[3] = &unk_24DBED410;
  v31[4] = self;
  v27 = v7;
  v32 = v27;
  v33 = &v34;
  objc_msgSend(v26, "na_each:", v31);

  objc_msgSend((id)v35[5], "events");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    -[HMIVideoAnalyzerServer frameAnalyzerFrameResultBuffer](self, "frameAnalyzerFrameResultBuffer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v35[5]);

    -[HMIVideoAnalyzerServer _notifyDelegateDidAnalyzeFrameWithResult:](self, "_notifyDelegateDidAnalyzeFrameWithResult:", v35[5]);
  }

  _Block_object_dispose(&v34, 8);
}

void __56__HMIVideoAnalyzerServer_frameAnalyzer_didAnalyzeFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  Float64 Seconds;
  void *v12;
  Float64 v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  CMTime v18;
  CMTime time;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  Float64 v23;
  __int16 v24;
  Float64 v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "frame");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "presentationTimeStamp");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      v12 = *(void **)(a1 + 40);
      if (v12)
        objc_msgSend(v12, "backgroundTimeStamp");
      else
        memset(&v18, 0, sizeof(v18));
      v13 = CMTimeGetSeconds(&v18);
      objc_msgSend(v3, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "events");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v3);
      *(_DWORD *)buf = 138544386;
      v17 = CFSTR("Filtered");
      v21 = v8;
      v22 = 2048;
      if (v16)
        v17 = &stru_24DBF1B40;
      v23 = Seconds;
      v24 = 2048;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@AnalyzerEvents(PTS:%.2f/%.2f): %@ %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)frameAnalyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4
{
  -[HMIVideoAnalyzerServer _notifyDelegateDidProduceAnalysisStateUpdate:](self, "_notifyDelegateDidProduceAnalysisStateUpdate:", a4);
}

- (void)frameSampler:(id)a3 didSampleFrame:(opaqueCMSampleBuffer *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  __CVBuffer *ImageBuffer;
  double Size;
  double v14;
  double v15;
  double v16;
  void *v17;
  HMIVideoFrame *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v6 = a3;
  -[HMIVideoAnalyzerServer frameTimelapseSampler](self, "frameTimelapseSampler");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleSampleBuffer:", a4);

  }
  else
  {
    -[HMIVideoAnalyzerServer frameThumbnailSampler](self, "frameThumbnailSampler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerServer analysisFPS](self, "analysisFPS");
      v11 = objc_msgSend(v10, "shouldGenerateThumbnailForAnalysisFPS:");

      if (v11)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a4);
        Size = HMICVPixelBufferGetSize(ImageBuffer);
        v15 = 1.0;
        if (v14 > 0.0)
        {
          v16 = v14;
          -[HMIVideoAnalyzer configuration](self, "configuration", Size);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (double)(unint64_t)objc_msgSend(v17, "thumbnailHeight") / v16;

        }
        v18 = -[HMIVideoFrame initWithSampleBuffer:]([HMIVideoFrame alloc], "initWithSampleBuffer:", a4);
        v21 = 0;
        -[HMIVideoFrame compressedFrameWithScale:quality:error:](v18, "compressedFrameWithScale:quality:error:", &v21, v15, 1.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMIVideoAnalyzerServer thumbnailBuffer](self, "thumbnailBuffer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v19);

      }
    }
    else
    {

    }
  }

}

- (void)assetWriter:(id)a3 didOutputInitializationSegment:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAnalyzerServer assetWriter](self, "assetWriter");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[HMIVideoAnalyzerServer setInitializationSegment:](self, "setInitializationSegment:", v6);
  }
  else
  {
    -[HMIVideoAnalyzerServer timelapseAssetWriter](self, "timelapseAssetWriter");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[HMIVideoAnalyzerServer setTimelapseInitializationSegment:](self, "setTimelapseInitializationSegment:", v6);
  }

}

- (void)assetWriter:(id)a3 didOutputSeparableSegment:(id)a4 segmentReport:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMIVideoAnalyzerServer *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMIVideoFragment *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMIVideoAnalyzerServer *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMIVideoAnalyzerServer *v39;
  NSObject *v40;
  void *v41;
  HMIVideoEventBuffer *thumbnailBuffer;
  void *v43;
  HMIVideoFragment *v44;
  void *v45;
  HMIVideoFragment *v46;
  void *v47;
  HMIVideoAnalyzerResultOutcome *v48;
  HMIVideoAnalyzerResultOutcome *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const __CFString *v54;
  HMIVideoFragment *v55;
  void *v56;
  HMIVideoAnalyzerResultOutcome *v57;
  uint64_t v58;
  HMIVideoAnalyzerFragmentResult *v59;
  void *v60;
  HMIVideoAnalyzerFragmentResult *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  CMTime duration;
  CMTime start;
  CMTimeRange v69;
  CMTimeRange buf;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v65 = a5;
  objc_msgSend(v65, "trackReports");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_336);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v69, 0, sizeof(v69));
  objc_msgSend(v11, "firstVideoSampleInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "presentationTimeStamp");
    if (v11)
    {
LABEL_3:
      objc_msgSend(v11, "duration");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&start, 0, sizeof(start));
    if (v11)
      goto LABEL_3;
  }
  memset(&duration, 0, sizeof(duration));
LABEL_6:
  CMTimeRangeMake(&v69, &start, &duration);

  objc_msgSend(v11, "firstVideoSampleInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "offset");
  v16 = objc_msgSend(v14, "length");
  -[HMIVideoAnalyzerServer timelapseAssetWriter](self, "timelapseAssetWriter");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v66 = v8;
  if (v17 != v8)
  {
    v63 = v15;
    v18 = (void *)MEMORY[0x220735570]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v64 = v9;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      buf = v69;
      HMICMTimeRangeDescription(&buf);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerServer frameAnalyzerFrameResultBuffer](v19, "frameAnalyzerFrameResultBuffer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerServer thumbnailBuffer](v19, "thumbnailBuffer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138544130;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v21;
      LOWORD(buf.start.flags) = 2112;
      *(_QWORD *)((char *)&buf.start.flags + 2) = v22;
      HIWORD(buf.start.epoch) = 2112;
      buf.duration.value = (CMTimeValue)v23;
      LOWORD(buf.duration.timescale) = 2112;
      *(_QWORD *)((char *)&buf.duration.timescale + 2) = v24;
      _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Bundling Fragment Result, timeRange: %@, frames: [%@], thumbnails [%@]", (uint8_t *)&buf, 0x2Au);

      v9 = v64;
    }

    objc_autoreleasePoolPop(v18);
    -[HMIVideoAnalyzerServer frameAnalyzerFrameResultBuffer](v19, "frameAnalyzerFrameResultBuffer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v69;
    objc_msgSend(v25, "extractObjectsInTimeRange:", &buf);
    v26 = (HMIVideoFragment *)objc_claimAutoreleasedReturnValue();

    -[HMIVideoAnalyzerServer frameAnalyzerFrameResultBuffer](v19, "frameAnalyzerFrameResultBuffer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      v29 = (void *)MEMORY[0x220735570]();
      v30 = v19;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIVideoAnalyzerServer frameAnalyzerFrameResultBuffer](v30, "frameAnalyzerFrameResultBuffer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v32;
        LOWORD(buf.start.flags) = 2112;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v33;
        _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_ERROR, "%{public}@Analyzer frame result buffer should be empty. %@", (uint8_t *)&buf, 0x16u);

        v9 = v64;
      }

      objc_autoreleasePoolPop(v29);
      -[HMIVideoAnalyzerServer frameAnalyzerFrameResultBuffer](v30, "frameAnalyzerFrameResultBuffer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "removeAllObjects");

    }
    -[HMIVideoAnalyzerServer thumbnailBuffer](v19, "thumbnailBuffer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v69;
    objc_msgSend(v35, "extractObjectsInTimeRange:", &buf);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMIVideoAnalyzerServer thumbnailBuffer](v19, "thumbnailBuffer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      v38 = (void *)MEMORY[0x220735570]();
      v39 = v19;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        thumbnailBuffer = v39->_thumbnailBuffer;
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v41;
        LOWORD(buf.start.flags) = 2112;
        *(_QWORD *)((char *)&buf.start.flags + 2) = thumbnailBuffer;
        _os_log_impl(&dword_219D45000, v40, OS_LOG_TYPE_ERROR, "%{public}@Thumbnail buffer should be empty. %@", (uint8_t *)&buf, 0x16u);

        v9 = v64;
      }

      objc_autoreleasePoolPop(v38);
      -[HMIVideoAnalyzerServer thumbnailBuffer](v39, "thumbnailBuffer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeAllObjects");

    }
    v44 = [HMIVideoFragment alloc];
    -[HMIVideoAnalyzerServer initializationSegment](v19, "initializationSegment");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v69;
    v46 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](v44, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", v45, v9, &buf, v63, v16);

    *(_OWORD *)&buf.start.value = *(_OWORD *)&v69.start.value;
    buf.start.epoch = v69.start.epoch;
    -[HMIVideoAnalyzerServer dynamicConfigurationForTime:](v19, "dynamicConfigurationForTime:", &buf);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = [HMIVideoAnalyzerResultOutcome alloc];
    -[HMIVideoAnalyzerServer analysisFPS](v19, "analysisFPS");
    v49 = -[HMIVideoAnalyzerResultOutcome initWithCode:analysisFPS:message:](v48, "initWithCode:analysisFPS:message:", 1, 0);
    -[HMIVideoAnalyzer configuration](v19, "configuration");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "decodeMode");

    if (v51)
    {
      -[HMIVideoAnalyzer configuration](v19, "configuration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "decodeMode");

      if (v53 != 1)
      {
LABEL_23:
        v59 = [HMIVideoAnalyzerFragmentResult alloc];
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[HMIVideoAnalyzerFragmentResult initWithFragment:events:frameResults:thumbnails:configuration:outcome:](v59, "initWithFragment:events:frameResults:thumbnails:configuration:outcome:", v46, v60, v26, v62, v47, v49);

        -[HMIVideoAnalyzerServer _notifyDelegateDidAnalyzeFragmentWithResult:](v19, "_notifyDelegateDidAnalyzeFragmentWithResult:", v61);
        ++v19->_numDidAnalyzeFragments;

        v9 = v64;
        goto LABEL_24;
      }
      v54 = CFSTR("Analyzer is in partial bypass mode, only IFrames are decoded.");
    }
    else
    {
      v54 = CFSTR("Analyzer is in full bypass mode.");
    }
    v57 = [HMIVideoAnalyzerResultOutcome alloc];
    -[HMIVideoAnalyzerServer analysisFPS](v19, "analysisFPS");
    v58 = -[HMIVideoAnalyzerResultOutcome initWithCode:analysisFPS:message:](v57, "initWithCode:analysisFPS:message:", 0, v54);

    v49 = (HMIVideoAnalyzerResultOutcome *)v58;
    goto LABEL_23;
  }
  v55 = [HMIVideoFragment alloc];
  -[HMIVideoAnalyzerServer timelapseInitializationSegment](self, "timelapseInitializationSegment");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  buf = v69;
  v26 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](v55, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", v56, v9, &buf, v15, v16);

  -[HMIVideoAnalyzerServer _notifyDelegateDidCreateTimelapseFragment:](self, "_notifyDelegateDidCreateTimelapseFragment:", v26);
  ++self->_numDidCreateTimelapseFragments;
LABEL_24:

}

uint64_t __78__HMIVideoAnalyzerServer_assetWriter_didOutputSeparableSegment_segmentReport___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "mediaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB1D50]);

  return v3;
}

- (void)assetWriter:(id)a3 didFailWithError:(id)a4
{
  -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", a4);
}

- (void)decoder:(id)a3 didFailWithError:(id)a4
{
  -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", a4);
}

- (void)encoder:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMIVideoAnalyzerServer *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMIVideoAnalyzerServer timelapseEncoder](self, "timelapseEncoder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Timelapse encoder failed, ignoring: error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMIVideoAnalyzerServer setTimelapseEncoder:](v10, "setTimelapseEncoder:", 0);
  }
  else
  {
    -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v7);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  double v6;
  id v7;

  v4 = a3;
  -[HMIVideoAnalyzerServer watchdogTimer](self, "watchdogTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMIVideoAnalyzerServer timeSinceLastFragmentWasReceived](self, "timeSinceLastFragmentWasReceived");
    if (v6 > 60.0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, CFSTR("Analyzer has not received fragments from client in a long time."));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerServer _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v7);

    }
  }
}

- (void)_notifyDelegateDidAnalyzeFragmentWithResult:(id)a3
{
  id v4;
  void *v5;
  HMIVideoAnalyzerServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fragment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outcome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxConfidenceEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Generated Fragment: %@ Outcome: %@ Max Confidence Events: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIVideoAnalyzerServer state](v6, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIAnalytics videoAnalyzerDidAnalyzeFragmentWithResult:state:](HMIAnalytics, "videoAnalyzerDidAnalyzeFragmentWithResult:state:", v4, v12);

  -[HMIVideoAnalyzer delegate](v6, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "analyzer:didAnalyzeFragmentWithResult:", v6, v4);
  v15 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer _produceResult:withArguments:](v6, "_produceResult:withArguments:", sel_analyzer_didAnalyzeFragmentWithResult_, v14);

}

- (void)_notifyDelegateDidAnalyzeFrameWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMIVideoAnalyzer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "analyzer:didAnalyzeFrameWithResult:", self, v4);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer _produceResult:withArguments:](self, "_produceResult:withArguments:", sel_analyzer_didAnalyzeFrameWithResult_, v6);

}

- (void)_notifyDelegateDidCreateTimelapseFragment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMIVideoAnalyzerServer state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIAnalytics videoAnalyzerDidCreateTimelapseFragment:state:](HMIAnalytics, "videoAnalyzerDidCreateTimelapseFragment:state:", v4, v5);

  -[HMIVideoAnalyzer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "analyzer:didCreateTimelapseFragment:", self, v4);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer _produceResult:withArguments:](self, "_produceResult:withArguments:", sel_analyzer_didCreateTimelapseFragment_, v7);

}

- (void)_notifyDelegateDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  HMIVideoAnalyzerServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMIVideoAnalyzerServer *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Analyzer Failed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMIVideoAnalyzerServer hasFailed](v6, "hasFailed"))
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Analyzer is already in a failed state.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    -[HMIVideoAnalyzerServer state](v6, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIAnalytics videoAnalyzerDidTerminateWithError:state:](HMIAnalytics, "videoAnalyzerDidTerminateWithError:state:", v4, v13);

    -[HMIVideoAnalyzerServer setHasFailed:](v6, "setHasFailed:", 1);
    -[HMIVideoAnalyzer delegate](v6, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "analyzer:didFailWithError:", v6, v4);
    v16 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerServer _produceResult:withArguments:](v6, "_produceResult:withArguments:", sel_analyzer_didFailWithError_, v15);

  }
}

- (void)_notifyDelegateDidProduceAnalysisStateUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMIVideoAnalyzer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "analyzer:didProduceAnalysisStateUpdate:", self, v4);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerServer _produceResult:withArguments:](self, "_produceResult:withArguments:", sel_analyzer_didProduceAnalysisStateUpdate_, v6);

}

- (void)_produceResult:(SEL)a3 withArguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMIVideoAnalyzerServer *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMIVideoAnalyzer delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_2550D12C0))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20[0] = CFSTR("selector");
    NSStringFromSelector(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("arguments");
    v21[0] = v10;
    v21[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x220735570]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Sending Result: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v9, "analyzer:didProduceResult:", v13, v11);

  }
}

- (id)state
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  int64_t numDecodedSamples;
  int64_t numDidAnalyzeFrames;
  int64_t numDidAnalyzeFragments;
  int64_t numDidAnalyzePackages;
  int64_t numDidCreateTimelapseFragments;
  void *v20;
  double v21;
  double v22;
  BOOL v23;
  void *v24;
  HMIVideoAnalyzerState *v25;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  HMIVideoAnalyzerState *v32;
  void *v33;
  _BYTE v34[24];
  $95D729B680665BEAEFA1D6FCA8238556 currentPTS;

  currentPTS = self->_currentPTS;
  -[HMIVideoAnalyzerServer dynamicConfigurationForTime:](self, "dynamicConfigurationForTime:", &currentPTS);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = [HMIVideoAnalyzerState alloc];
  -[HMIVideoAnalyzer configuration](self, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzer identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HMIVideoAnalyzerServer monitored](self, "monitored");
  -[HMIVideoAnalyzerServer analysisFPS](self, "analysisFPS");
  v4 = v3;
  -[HMIVideoAnalyzerServer timeSinceAnalyzerStarted](self, "timeSinceAnalyzerStarted");
  v6 = v5;
  -[HMIVideoAnalyzerServer timeSinceLastFragmentWasReceived](self, "timeSinceLastFragmentWasReceived");
  v8 = v7;
  -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fillRatio");
  v11 = v10;
  -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v12, "size");
  -[HMIVideoAnalyzerServer delay](self, "delay");
  v14 = v13;
  -[HMIVideoAnalyzerServer currentPTS](self, "currentPTS");
  numDecodedSamples = self->_numDecodedSamples;
  numDidAnalyzeFrames = self->_numDidAnalyzeFrames;
  numDidAnalyzeFragments = self->_numDidAnalyzeFragments;
  numDidAnalyzePackages = self->_numDidAnalyzePackages;
  numDidCreateTimelapseFragments = self->_numDidCreateTimelapseFragments;
  -[HMIVideoAnalyzerServer frameAnalyzer](self, "frameAnalyzer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "averageAnalysisTime");
  v22 = v21;
  v23 = -[HMIVideoAnalyzerServer encode](self, "encode");
  -[HMIVideoAnalyzerServer encoder](self, "encoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v27) = v24 != 0;
  LOBYTE(v27) = v23;
  v25 = -[HMIVideoAnalyzerState initWithConfiguration:dynamicConfiguration:identifier:monitored:analysisFPS:timeSinceAnalyzerStarted:timeSinceLastFragmentWasReceived:bufferFillRatio:bufferSize:delay:currentPTS:numDecodedSamples:numDidAnalyzeFrames:numDidAnalyzeFragments:numDidAnalyzePackages:numDidCreateTimelapseFragments:averageAnalysisTime:encode:encoder:](v32, "initWithConfiguration:dynamicConfiguration:identifier:monitored:analysisFPS:timeSinceAnalyzerStarted:timeSinceLastFragmentWasReceived:bufferFillRatio:bufferSize:delay:currentPTS:numDecodedSamples:numDidAnalyzeFrames:numDidAnalyzeFragments:numDidAnalyzePackages:numDidCreateTimelapseFragments:averageAnalysisTime:encode:encoder:", v31, v33, v30, v29, v28, v34, v4, v6, v8, v11, v14, v22, numDecodedSamples, numDidAnalyzeFrames, numDidAnalyzeFragments,
          numDidAnalyzePackages,
          numDidCreateTimelapseFragments,
          v27);

  return v25;
}

- (double)timeSinceAnalyzerStarted
{
  void *v2;
  double v3;
  double v4;

  -[HMIVideoAnalyzerServer startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;

  return v4;
}

- (double)timeSinceLastFragmentWasReceived
{
  void *v2;
  double v3;
  double v4;

  -[HMIVideoAnalyzerServer lastFragmentReceivedDate](self, "lastFragmentReceivedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;

  return v4;
}

- (double)delay
{
  void *v2;
  double v3;
  double v4;

  -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delay");
  v4 = v3;

  return v4;
}

- (void)setAnalysisFPS:(double)a3
{
  void *v5;
  HMIVideoAnalyzerServer *v6;
  NSObject *v7;
  void *v8;
  double analysisFPS;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_analysisFPS != a3)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      analysisFPS = self->_analysisFPS;
      v11 = 138543874;
      v12 = v8;
      v13 = 2048;
      v14 = analysisFPS;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@analysisFPS changing from: %f to: %f", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }
  self->_analysisFPS = a3;
  -[HMIVideoAnalyzerServer frameSelector](self, "frameSelector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSampleRate:", a3 * 3.0);

}

- (unint64_t)status
{
  void *v4;
  int v5;

  if (-[HMIVideoAnalyzerServer hasFailed](self, "hasFailed"))
    return 3;
  if (-[HMIVideoAnalyzerServer isCancelled](self, "isCancelled"))
    return 2;
  -[HMIVideoAnalyzerServer commandBuffer](self, "commandBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmpty");

  return v5 ^ 1u;
}

- (BOOL)monitored
{
  return self->_monitored;
}

- (void)setMonitored:(BOOL)a3
{
  self->_monitored = a3;
}

- (BOOL)encode
{
  return self->_encode;
}

- (void)setEncode:(BOOL)a3
{
  self->_encode = a3;
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (OS_dispatch_queue)inputQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_queue)encoderQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (opaqueCMFormatDescription)inputVideoFormat
{
  return self->_inputVideoFormat;
}

- (void)setInputVideoFormat:(opaqueCMFormatDescription *)a3
{
  self->_inputVideoFormat = a3;
}

- (opaqueCMFormatDescription)inputAudioFormat
{
  return self->_inputAudioFormat;
}

- (void)setInputAudioFormat:(opaqueCMFormatDescription *)a3
{
  self->_inputAudioFormat = a3;
}

- (opaqueCMFormatDescription)timelapseOutputVideoFormat
{
  return self->_timelapseOutputVideoFormat;
}

- (void)setTimelapseOutputVideoFormat:(opaqueCMFormatDescription *)a3
{
  self->_timelapseOutputVideoFormat = a3;
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 192, 1);
}

- (HMIVideoCommandBuffer)commandBuffer
{
  return (HMIVideoCommandBuffer *)objc_getProperty(self, a2, 200, 1);
}

- (HMIVideoDecoder)decoder
{
  return (HMIVideoDecoder *)objc_getProperty(self, a2, 208, 1);
}

- (HMIVideoFrameSampler)frameThumbnailSampler
{
  return (HMIVideoFrameSampler *)objc_getProperty(self, a2, 216, 1);
}

- (HMIVideoFrameSampler)frameTimelapseSampler
{
  return (HMIVideoFrameSampler *)objc_getProperty(self, a2, 224, 1);
}

- (HMIVideoEncoder)encoder
{
  return (HMIVideoEncoder *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEncoder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (HMIVideoEncoder)timelapseEncoder
{
  return (HMIVideoEncoder *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTimelapseEncoder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (HMIVideoFrameSelector)frameSelector
{
  return (HMIVideoFrameSelector *)objc_getProperty(self, a2, 248, 1);
}

- (HMIVideoFrameTracker)frameTracker
{
  return (HMIVideoFrameTracker *)objc_getProperty(self, a2, 256, 1);
}

- (HMIVideoFrameAnalyzer)frameAnalyzer
{
  return (HMIVideoFrameAnalyzer *)objc_getProperty(self, a2, 264, 1);
}

- (HMIVideoAssetWriter)assetWriter
{
  return (HMIVideoAssetWriter *)objc_getProperty(self, a2, 272, 1);
}

- (void)setAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (HMIVideoAssetWriter)timelapseAssetWriter
{
  return (HMIVideoAssetWriter *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTimelapseAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_currentPTS, 24, 1, 0);
  return result;
}

- (void)setCurrentPTS:(id *)a3
{
  objc_copyStruct(&self->_currentPTS, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentDTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_currentDTS, 24, 1, 0);
  return result;
}

- (void)setCurrentDTS:(id *)a3
{
  objc_copyStruct(&self->_currentDTS, a3, 24, 1, 0);
}

- (HMIVideoEventBuffer)frameAnalyzerFrameResultBuffer
{
  return (HMIVideoEventBuffer *)objc_getProperty(self, a2, 288, 1);
}

- (HMIVideoEventBuffer)thumbnailBuffer
{
  return (HMIVideoEventBuffer *)objc_getProperty(self, a2, 296, 1);
}

- (NSData)initializationSegment
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setInitializationSegment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSData)timelapseInitializationSegment
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTimelapseInitializationSegment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (HMIVideoEventBuffer)dynamicConfigurationBuffer
{
  return (HMIVideoEventBuffer *)objc_getProperty(self, a2, 320, 1);
}

- (HMIVideoTemporalEventFilter)temporalEventFilter
{
  return (HMIVideoTemporalEventFilter *)objc_getProperty(self, a2, 328, 1);
}

- (HMIVideoTimeline)timeline
{
  return (HMIVideoTimeline *)objc_getProperty(self, a2, 336, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (NSDate)lastFragmentReceivedDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLastFragmentReceivedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFragmentReceivedDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_temporalEventFilter, 0);
  objc_storeStrong((id *)&self->_dynamicConfigurationBuffer, 0);
  objc_storeStrong((id *)&self->_timelapseInitializationSegment, 0);
  objc_storeStrong((id *)&self->_initializationSegment, 0);
  objc_storeStrong((id *)&self->_thumbnailBuffer, 0);
  objc_storeStrong((id *)&self->_frameAnalyzerFrameResultBuffer, 0);
  objc_storeStrong((id *)&self->_timelapseAssetWriter, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_frameAnalyzer, 0);
  objc_storeStrong((id *)&self->_frameTracker, 0);
  objc_storeStrong((id *)&self->_frameSelector, 0);
  objc_storeStrong((id *)&self->_timelapseEncoder, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_frameTimelapseSampler, 0);
  objc_storeStrong((id *)&self->_frameThumbnailSampler, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_encoderQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
}

@end
