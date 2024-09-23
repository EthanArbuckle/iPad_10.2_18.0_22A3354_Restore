@implementation HMDCameraRecordingSession

- (HMDCameraRecordingSession)initWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDCameraRecordingSessionFactory *v25;
  HMDCameraRecordingSession *v26;

  v18 = a10;
  v19 = a9;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(HMDCameraRecordingSessionFactory);
  v26 = -[HMDCameraRecordingSession initWithWorkQueue:camera:hapAccessory:home:localZone:configuredFragmentDuration:timelineManager:homePresenceByPairingIdentity:factory:](self, "initWithWorkQueue:camera:hapAccessory:home:localZone:configuredFragmentDuration:timelineManager:homePresenceByPairingIdentity:factory:", v24, v23, v22, v21, v20, v19, a8, v18, v25);

  return v26;
}

- (HMDCameraRecordingSession)initWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10 factory:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMDCameraRecordingSession *v25;
  HMDCameraRecordingSession *v26;
  uint64_t v27;
  NSUUID *identifier;
  __int128 *v29;
  int64_t v30;
  __int128 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *logIdentifier;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  HMDCameraRecordingSessionVariantFragmentManager *timelapseFragmentManager;
  uint64_t v50;
  HMDCameraRecordingSessionVideoAnalyzer *videoAnalyzer;
  uint64_t v52;
  HMFActivity *sessionActivity;
  HMDCameraSignificantEventFaceClassificationResolver *v54;
  uint64_t v55;
  HMDCameraRecordingSessionSignificantEventManager *significantEventManager;
  HMDCameraRecordingSession *result;
  HMDCameraRecordingSession *v58;
  SEL v59;
  HMDAccessoryMetricVendorDetails *obj;
  void *v61;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTime v71;
  CMTime v72;
  CMTime v73;
  objc_super v74;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a9;
  v67 = v21;
  v66 = a7;
  v65 = a9;
  v64 = a10;
  v23 = a11;
  v63 = v18;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v19)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v20)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v24 = v67;
  if (!v67)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v66)
  {
LABEL_18:
    _HMFPreconditionFailure();
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (a8 <= 0.0 || fabs(a8) < 2.22044605e-16)
    goto LABEL_19;
  if (!v65)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v64)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v23)
  {
LABEL_22:
    v58 = (HMDCameraRecordingSession *)_HMFPreconditionFailure();
    -[HMDCameraRecordingSession dealloc](v58, v59);
    return result;
  }
  v61 = v23;
  v74.receiver = self;
  v74.super_class = (Class)HMDCameraRecordingSession;
  v25 = -[HMDCameraRecordingSession init](&v74, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_workQueue, a3);
    objc_storeStrong((id *)&v26->_camera, a4);
    objc_storeStrong((id *)&v26->_localZone, a7);
    v26->_configuredFragmentDuration = a8;
    objc_storeStrong((id *)&v26->_timelineManager, v22);
    objc_storeStrong((id *)&v26->_homePresenceByPairingIdentity, a10);
    objc_storeStrong((id *)&v26->_factory, a11);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = objc_claimAutoreleasedReturnValue();
    identifier = v26->_identifier;
    v26->_identifier = (NSUUID *)v27;

    v26->_active = 1;
    v29 = (__int128 *)MEMORY[0x24BDC0D40];
    v30 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    v26->_clipStartTime.epoch = v30;
    v31 = *v29;
    *(_OWORD *)&v26->_clipStartTime.value = *v29;
    *(_OWORD *)&v26->_timelapseClipStartTime.value = v31;
    v26->_timelapseClipStartTime.epoch = v30;
    v32 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v20, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@/%@"), v33, v26->_identifier);
    v34 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v26->_logIdentifier;
    v26->_logIdentifier = (NSString *)v34;

    objc_msgSend(v67, "personManagerSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isFaceClassificationEnabled");

    obj = -[HMDAccessoryMetricVendorDetails initWithAccessory:]([HMDAccessoryMetricVendorDetails alloc], "initWithAccessory:", v20);
    v38 = objc_alloc(MEMORY[0x24BE4D1B8]);
    objc_msgSend(v19, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryMetricVendorDetails manufacturer](obj, "manufacturer");
    v41 = v19;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryMetricVendorDetails model](obj, "model");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryMetricVendorDetails firmwareVersion](obj, "firmwareVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v38, "initWithIdentifier:name:manufacturer:model:firmwareVersion:hasBattery:", v39, v40, v42, v43, v44, objc_msgSend(v20, "hasBattery"));

    v19 = v41;
    v24 = v67;

    v46 = objc_alloc_init(MEMORY[0x24BE4D228]);
    objc_msgSend(v46, "setMaxFragmentAnalysisDuration:", 20.0);
    CMTimeMakeWithSeconds(&v73, a8 * 2.5, 1000);
    v72 = v73;
    objc_msgSend(v46, "setMaxFragmentDuration:", &v72);
    objc_msgSend(v46, "setCamera:", v45);
    objc_msgSend(v46, "setTranscode:", v37);
    objc_msgSend(v67, "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setHomeUUID:", v47);

    CMTimeMake(&v71, 1, 1);
    v70 = v71;
    objc_msgSend(v46, "setTimelapseInterval:", &v70);
    CMTimeMakeWithSeconds(&v69, 60.0, 1000);
    v68 = v69;
    objc_msgSend(v46, "setTimelapsePreferredFragmentDuration:", &v68);
    -[HMDCameraRecordingSessionFactory createTimelapseFragmentManagerWithLogIdentifier:](v26->_factory, "createTimelapseFragmentManagerWithLogIdentifier:", v26->_logIdentifier);
    v48 = objc_claimAutoreleasedReturnValue();
    timelapseFragmentManager = v26->_timelapseFragmentManager;
    v26->_timelapseFragmentManager = (HMDCameraRecordingSessionVariantFragmentManager *)v48;

    -[HMDCameraRecordingSessionFactory createVideoAnalyzerWithConfiguration:identifier:](v26->_factory, "createVideoAnalyzerWithConfiguration:identifier:", v46, v26->_identifier);
    v50 = objc_claimAutoreleasedReturnValue();
    videoAnalyzer = v26->_videoAnalyzer;
    v26->_videoAnalyzer = (HMDCameraRecordingSessionVideoAnalyzer *)v50;

    v52 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:parent:options:", CFSTR("Recording Session"), 0, 3);
    sessionActivity = v26->_sessionActivity;
    v26->_sessionActivity = (HMFActivity *)v52;

    v54 = -[HMDCameraSignificantEventFaceClassificationResolver initWithHome:]([HMDCameraSignificantEventFaceClassificationResolver alloc], "initWithHome:", v67);
    -[HMDCameraRecordingSessionFactory createSignificantEventManagerWithWorkQueue:faceClassificationResolver:logIdentifier:](v26->_factory, "createSignificantEventManagerWithWorkQueue:faceClassificationResolver:logIdentifier:", v63, v54, v26->_logIdentifier);
    v55 = objc_claimAutoreleasedReturnValue();
    significantEventManager = v26->_significantEventManager;
    v26->_significantEventManager = (HMDCameraRecordingSessionSignificantEventManager *)v55;

  }
  return v26;
}

- (void)dealloc
{
  void *v3;
  HMDCameraRecordingSession *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDCameraRecordingSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating recording session: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraRecordingSession;
  -[HMDCameraRecordingSession dealloc](&v7, sel_dealloc);
}

- (unint64_t)recordingEventTriggers
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSession camera](self, "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recordingEventTriggers");

  return v6;
}

- (unint64_t)currentFragmentNumber
{
  NSObject *v3;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_currentFragmentNumber;
}

- (void)setCurrentFragmentNumber:(unint64_t)a3
{
  NSObject *v5;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_currentFragmentNumber = a3;
}

- (id)activityZones
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSession camera](self, "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)activityZonesIncludedForSignificantEventDetection
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSession camera](self, "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areActivityZonesIncludedForSignificantEventDetection");

  return v6;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraRecordingSession *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSession camera](self, "camera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCameraRecordingSession timelapseFragmentManager](self, "timelapseFragmentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[HMDCameraRecordingSession videoAnalyzer](self, "videoAnalyzer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    objc_msgSend(v5, "personManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmiPersonManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession videoAnalyzer](self, "videoAnalyzer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHomePersonManager:", v9);

    v11 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v5, "users");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_map:", &__block_literal_global_213475);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession videoAnalyzer](self, "videoAnalyzer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExternalPersonManagers:", v14);

    objc_msgSend(v5, "analysisStatePublisher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "analysisStateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession videoAnalyzer](self, "videoAnalyzer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAnalysisStateManager:", v17);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Can't configure recording session because home reference is nil", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)handleFragment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraRecordingSession *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDCameraRecordingSession *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDCameraRecordingSession *v46;
  NSObject *v47;
  void *v48;
  const char *v49;
  void *v50;
  _BYTE buf[24];
  void *v52;
  BOOL v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession cameraVideoInitFragment](self, "cameraVideoInitFragment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (-[HMDCameraRecordingSession _isValidFirstSessionFragment:](self, "_isValidFirstSessionFragment:", v4))
    {
      -[HMDCameraRecordingSession setCameraVideoInitFragment:](self, "setCameraVideoInitFragment:", v4);
      -[HMDCameraRecordingSession _writeFragment:](self, "_writeFragment:", v4);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", &unk_24E971AC8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession camera](self, "camera");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "accessory");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("cameraName"));

      objc_msgSend(v19, "manufacturer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("cameraManufacturer"));

      objc_msgSend(v19, "model");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("cameraModel"));

      -[HMDCameraRecordingSession camera](self, "camera");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "uniqueIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "UUIDString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, CFSTR("uniqueIdentifier"));

      -[HMDCameraRecordingSession camera](self, "camera");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "currentSettings");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "recordingEventTriggers");
      HMCameraSignificantEventTypesAsString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v38, CFSTR("recordingEventTriggers"));

      objc_msgSend(v19, "room");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "name");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("room"));

      -[HMDCameraRecordingSession _writeEvent:](self, "_writeEvent:", v13);
LABEL_9:

LABEL_19:
      goto LABEL_20;
    }
    v45 = (void *)MEMORY[0x227676638]();
    v46 = self;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      v49 = "%{public}@Received invalid first session fragment: %@";
LABEL_17:
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, v49, buf, 0x16u);

    }
LABEL_18:

    objc_autoreleasePoolPop(v45);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDCameraRecordingSessionErrorDomain"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:didEndWithError:", v46, v13);
    goto LABEL_19;
  }
  -[HMDCameraRecordingSession _writeFragment:](self, "_writeFragment:", v4);
  if (-[HMDCameraRecordingSession isActive](self, "isActive"))
  {
    if (-[HMDCameraRecordingSession _isValidNonFirstSessionFragment:](self, "_isValidNonFirstSessionFragment:", v4))
    {
      v8 = objc_alloc(MEMORY[0x24BE4D268]);
      objc_msgSend(v7, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraRecordingSession currentFragmentNumber](self, "currentFragmentNumber"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithInitializationSegment:separableSegment:sequenceNumbers:", v9, v10, v12);

      -[HMDCameraRecordingSession sessionActivity](self, "sessionActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "markWithFormat:", CFSTR("Analyze fragment %lu"), -[HMDCameraRecordingSession currentFragmentNumber](self, "currentFragmentNumber"));

      -[HMDCameraRecordingSession setCurrentFragmentNumber:](self, "setCurrentFragmentNumber:", -[HMDCameraRecordingSession currentFragmentNumber](self, "currentFragmentNumber") + 1);
      v15 = (void *)MEMORY[0x227676638](-[HMDCameraRecordingSession setPendingFragmentsCount:](self, "setPendingFragmentsCount:", -[HMDCameraRecordingSession pendingFragmentsCount](self, "pendingFragmentsCount") + 1));
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Requesting analysis for fragment: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v19 = objc_alloc_init(MEMORY[0x24BE4D230]);
      objc_msgSend(v19, "setEventTriggers:", -[HMDCameraRecordingSession recordingEventTriggers](v16, "recordingEventTriggers") & 0x1F);
      -[HMDCameraRecordingSession activityZones](v16, "activityZones");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HMDCameraRecordingSession activityZonesIncludedForSignificantEventDetection](v16, "activityZonesIncludedForSignificantEventDetection");
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __hmiActivityZonesFromActivityZones_block_invoke;
      v52 = &__block_descriptor_33_e53___HMICameraActivityZone_16__0__HMCameraActivityZone_8l;
      v53 = v21;
      objc_msgSend(v20, "na_map:", buf);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setActivityZones:", v23);
      -[HMDCameraProfile hapAccessory](v16->_camera, "hapAccessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "personManagerSettings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRecognizeFaces:", objc_msgSend(v26, "isFaceClassificationEnabled"));

      -[HMDCameraRecordingSession videoAnalyzer](v16, "videoAnalyzer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "analyzeFragment:configuration:", v13, v19);

      -[HMDCameraRecordingSession videoAnalyzer](v16, "videoAnalyzer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "flushAsync");

      goto LABEL_9;
    }
    v45 = (void *)MEMORY[0x227676638]();
    v46 = self;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      v49 = "%{public}@Received invalid non-first session fragment: %@";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v41 = (void *)MEMORY[0x227676638]();
  v42 = self;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v44;
    _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Dropping fragment for analysis as session is no longer active", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v41);
  objc_msgSend(v6, "session:didEndWithError:", v42, 0);
LABEL_20:

}

- (void)handleMotionActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v3 = a3;
  v9[2] = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8[0] = CFSTR("type");
  v8[1] = CFSTR("motionActive");
  v9[0] = CFSTR("MotionActive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession _writeEvent:](self, "_writeEvent:", v7);

}

- (void)handleNoMoreFragmentsAvailable
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HMDCameraRecordingSession *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory has no more fragments available for analysis", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingSession setNoMoreFragmentsAvailable:](v5, "setNoMoreFragmentsAvailable:", 1);
  if (!-[HMDCameraRecordingSession pendingFragmentsCount](v5, "pendingFragmentsCount")
    && -[HMDCameraRecordingSession isActive](v5, "isActive"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v5;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Finalizing session because all fragments have been analyzed", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraRecordingSession _endSessionWithError:](v9, "_endSessionWithError:", 0);
  }
}

- (NSDictionary)homePresenceByPairingIdentity
{
  NSObject *v3;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_homePresenceByPairingIdentity;
}

- (void)analyzer:(id)a3 didAnalyzeFragmentWithResult:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__HMDCameraRecordingSession_analyzer_didAnalyzeFragmentWithResult___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)analyzer:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__HMDCameraRecordingSession_analyzer_didFailWithError___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)analyzer:(id)a3 didCreateTimelapseFragment:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCameraRecordingSession_analyzer_didCreateTimelapseFragment___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)_handleFragmentResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double Seconds;
  void *v8;
  double v9;
  double v10;
  void *v11;
  HMDCameraRecordingSession *v12;
  NSObject *v13;
  void *v14;
  Float64 v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDCameraRecordingSession *v21;
  NSObject *v22;
  void *v23;
  double v24;
  HMDCameraRecordingFragmentAnalyzedEvent *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraRecordingFragmentAnalyzedEvent *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  void *v39;
  HMDCameraRecordingSession *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDCameraRecordingSession *v55;
  NSObject *v56;
  _BOOL4 v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  HMDCameraRecordingSession *v80;
  NSObject *v81;
  void *v82;
  double v83;
  uint64_t v84;
  void *v85;
  HMDCameraRecordingSession *v86;
  NSObject *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  unsigned int v100;
  CMTime v101;
  CMTime v102;
  CMTime v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  CMTime v107;
  CMTime v108;
  CMTime v109;
  __int128 v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  CMTime v115;
  CMTime v116;
  CMTimeRange v117;
  CMTime v118;
  CMTime v119;
  CMTime rhs;
  CMTimeRange range;
  CMTime lhs;
  CMTime time;
  char v124;
  _QWORD v125[4];
  _QWORD v126[4];
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  Float64 v130;
  __int16 v131;
  double v132;
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSession setPendingFragmentsCount:](self, "setPendingFragmentsCount:", -[HMDCameraRecordingSession pendingFragmentsCount](self, "pendingFragmentsCount") - 1);
  if (!-[HMDCameraRecordingSession isActive](self, "isActive"))
    goto LABEL_65;
  objc_msgSend(v4, "fragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession clipStartTime](self, "clipStartTime");
  if ((v124 & 1) == 0)
    goto LABEL_10;
  if (v6)
    objc_msgSend(v6, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  CMTimeRangeGetEnd(&lhs, &range);
  -[HMDCameraRecordingSession clipStartTime](self, "clipStartTime");
  CMTimeSubtract(&time, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  -[HMDCameraRecordingSession factory](self, "factory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumClipDuration");
  v10 = v9;

  if (Seconds > v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v6, "timeRange");
      else
        memset(&v117, 0, sizeof(v117));
      CMTimeRangeGetEnd(&v118, &v117);
      -[HMDCameraRecordingSession clipStartTime](v12, "clipStartTime");
      CMTimeSubtract(&v119, &v118, &v116);
      v15 = CMTimeGetSeconds(&v119);
      -[HMDCameraRecordingSession factory](v12, "factory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "maximumClipDuration");
      *(_DWORD *)buf = 138543874;
      v128 = v14;
      v129 = 2048;
      v130 = v15;
      v131 = 2048;
      v132 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Finishing current clip upload because segment would exceed max duration (%.2f > %.2f)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraRecordingSession _finishCurrentClipUploader](v12, "_finishCurrentClipUploader");
    v100 = 1;
  }
  else
  {
LABEL_10:
    v100 = 0;
  }
  objc_msgSend(v4, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "eventTriggers") & 0x1F;

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMCameraSignificantEventTypesAsString();
    v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543618;
    v128 = v23;
    v129 = 2112;
    v130 = v24;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Comparing fragment with recording event triggers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  v25 = [HMDCameraRecordingFragmentAnalyzedEvent alloc];
  -[HMDCameraRecordingSession identifier](v21, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession camera](v21, "camera");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uniqueIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HMDCameraRecordingFragmentAnalyzedEvent initWithSessionID:cameraID:sequenceNumber:](v25, "initWithSessionID:cameraID:sequenceNumber:", v26, v28, objc_msgSend(v6, "sequenceNumber"));

  v99 = v19;
  if (-[HMDCameraRecordingSession _shouldRecordFragmentWithAnalyzerResult:sequenceNumber:recordingEventTriggers:fragmentAnalyzedEvent:](v21, "_shouldRecordFragmentWithAnalyzerResult:sequenceNumber:recordingEventTriggers:fragmentAnalyzedEvent:", v4, objc_msgSend(v6, "sequenceNumber"), v19, v29))
  {
    v30 = (void *)MEMORY[0x24BDD16E0];
    -[HMDCameraRecordingSession factory](v21, "factory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "recordingExtensionDuration");
    objc_msgSend(v30, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession setRemainingRecordingExtensionDuration:](v21, "setRemainingRecordingExtensionDuration:", v32);

  }
  else
  {
    -[HMDCameraRecordingSession remainingRecordingExtensionDuration](v21, "remainingRecordingExtensionDuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v37 = 0;
      goto LABEL_31;
    }
    -[HMDCameraRecordingFragmentAnalyzedEvent setRecordingReason:](v29, "setRecordingReason:", 4);
    -[HMDCameraRecordingSession remainingRecordingExtensionDuration](v21, "remainingRecordingExtensionDuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;
    if (v6)
      objc_msgSend(v6, "duration");
    else
      memset(&v115, 0, sizeof(v115));
    v38 = v36 - CMTimeGetSeconds(&v115);

    v39 = (void *)MEMORY[0x227676638]();
    v40 = v21;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (v38 <= 0.0)
    {
      if (v42)
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingSession remainingRecordingExtensionDuration](v40, "remainingRecordingExtensionDuration");
        v47 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543618;
        v128 = v46;
        v129 = 2112;
        v130 = v47;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Flagging fragment for recording because remaining recording extension duration is %@s. Extension duration will be cleared", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      -[HMDCameraRecordingSession setRemainingRecordingExtensionDuration:](v40, "setRemainingRecordingExtensionDuration:", 0);
    }
    else
    {
      if (v42)
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingSession remainingRecordingExtensionDuration](v40, "remainingRecordingExtensionDuration");
        v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543874;
        v128 = v43;
        v129 = 2112;
        v130 = v44;
        v131 = 2048;
        v132 = v38;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Flagging fragment for recording because remaining recording extension duration is %@s. New extension duration will be %fs", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession setRemainingRecordingExtensionDuration:](v40, "setRemainingRecordingExtensionDuration:", v45);

    }
  }
  v37 = 1;
LABEL_31:
  v126[0] = CFSTR("FragmentResult");
  v125[0] = CFSTR("type");
  v125[1] = CFSTR("shouldRecordFragment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v37);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v48;
  v125[2] = CFSTR("sequenceNumber");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "sequenceNumber"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v49;
  v125[3] = CFSTR("analysisFPS");
  v50 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "outcome");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "analysisFPS");
  objc_msgSend(v50, "numberWithDouble:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v126[3] = v52;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession _writeEvent:](v21, "_writeEvent:", v53);

  v54 = (void *)MEMORY[0x227676638]();
  v55 = v21;
  HMFGetOSLogHandle();
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
  if (!(_DWORD)v37)
  {
    if (v57)
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)&v65 = COERCE_DOUBLE(objc_msgSend(v6, "sequenceNumber"));
      *(_DWORD *)buf = 138543618;
      v128 = v64;
      v129 = 2048;
      v130 = *(double *)&v65;
      _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@Fragment %lu was not flagged for recording", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v54);
    -[HMDCameraRecordingSession _finishCurrentClipUploader](v55, "_finishCurrentClipUploader");
    -[HMDCameraRecordingSession setIntroFragment:](v55, "setIntroFragment:", v6);
    -[HMDCameraRecordingSession setIntroAnalyzerResult:](v55, "setIntroAnalyzerResult:", v4);
    goto LABEL_62;
  }
  if (v57)
  {
    HMFGetLogIdentifier();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v59 = COERCE_DOUBLE(objc_msgSend(v6, "sequenceNumber"));
    *(_DWORD *)buf = 138543618;
    v128 = v58;
    v129 = 2048;
    v130 = *(double *)&v59;
    _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@Fragment %lu was flagged for recording", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v54);
  -[HMDCameraRecordingSession introFragment](v55, "introFragment");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession introAnalyzerResult](v55, "introAnalyzerResult");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession clipUploader](v55, "clipUploader");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = v99;
  if (v62)
  {
    if (v6)
    {
LABEL_36:
      objc_msgSend(v6, "timeRange");
      goto LABEL_50;
    }
  }
  else
  {
    if (v60)
      v66 = v60;
    else
      v66 = v6;
    v67 = v66;
    v97 = v61;
    v98 = v60;
    v96 = v67;
    if (v67)
    {
      objc_msgSend(v67, "timeRange");
    }
    else
    {
      v113 = 0u;
      v114 = 0u;
      v112 = 0u;
    }
    v110 = v112;
    v111 = v113;
    -[HMDCameraRecordingSession setClipStartTime:](v55, "setClipStartTime:", &v110);
    -[HMDCameraRecordingSession timelineManager](v55, "timelineManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession clipStartTime](v55, "clipStartTime");
    objc_msgSend(v68, "creationDateForFragmentAtTimeOffset:", CMTimeGetSeconds(&v109));
    v69 = objc_claimAutoreleasedReturnValue();

    -[HMDCameraRecordingSession factory](v55, "factory");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession configuredFragmentDuration](v55, "configuredFragmentDuration");
    v73 = v72;
    -[HMDCameraRecordingSession localZone](v55, "localZone");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession workQueue](v55, "workQueue");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession logIdentifier](v55, "logIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)v69;
    objc_msgSend(v70, "createUploaderWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:", v71, v69, 0, v74, v75, v76, v73);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession setClipUploader:](v55, "setClipUploader:", v77);

    -[HMDCameraRecordingSession clipUploader](v55, "clipUploader");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setDelegate:", v55);

    v79 = (void *)MEMORY[0x227676638]();
    v80 = v55;
    HMFGetOSLogHandle();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession clipUploader](v80, "clipUploader");
      v83 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543618;
      v128 = v82;
      v129 = 2112;
      v130 = v83;
      _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_INFO, "%{public}@Created new clip uploader: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v79);

    v60 = v98;
    v63 = v99;
    v61 = v97;
    if (v6)
      goto LABEL_36;
  }
  v105 = 0u;
  v106 = 0u;
  v104 = 0u;
LABEL_50:
  *(_OWORD *)&v107.value = v104;
  v107.epoch = v105;
  -[HMDCameraRecordingSession clipStartTime](v55, "clipStartTime");
  CMTimeSubtract(&v108, &v107, &v103);
  v84 = -[HMDCameraRecordingSession _notifyForAnalyzerResult:fragment:timeOffsetWithinClip:recordingEventTriggers:](v55, "_notifyForAnalyzerResult:fragment:timeOffsetWithinClip:recordingEventTriggers:", v4, v6, v63, CMTimeGetSeconds(&v108));
  if (v60 && v61)
  {
    v85 = (void *)MEMORY[0x227676638](v84);
    v86 = v55;
    HMFGetOSLogHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)&v89 = COERCE_DOUBLE(objc_msgSend(v60, "sequenceNumber"));
      *(_DWORD *)buf = 138543618;
      v128 = v88;
      v129 = 2048;
      v130 = *(double *)&v89;
      _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_INFO, "%{public}@Uploading intro fragment %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v85);
    objc_msgSend(v61, "fragment");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90;
    if (v90)
      objc_msgSend(v90, "duration");
    else
      memset(&v102, 0, sizeof(v102));
    -[HMDCameraRecordingSession _uploadFragment:withDuration:clipFinalizedBecauseMaxDurationExceeded:](v86, "_uploadFragment:withDuration:clipFinalizedBecauseMaxDurationExceeded:", v60, v100, CMTimeGetSeconds(&v102));

    -[HMDCameraRecordingSession setIntroFragment:](v86, "setIntroFragment:", 0);
    -[HMDCameraRecordingSession setIntroAnalyzerResult:](v86, "setIntroAnalyzerResult:", 0);
  }
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&v101, 0, sizeof(v101));
  -[HMDCameraRecordingSession _uploadFragment:withDuration:clipFinalizedBecauseMaxDurationExceeded:](v55, "_uploadFragment:withDuration:clipFinalizedBecauseMaxDurationExceeded:", v6, v100, CMTimeGetSeconds(&v101));
  -[HMDCameraRecordingSession clipUploader](v55, "clipUploader");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "clipUUID");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingFragmentAnalyzedEvent setClipModelID:](v29, "setClipModelID:", v93);

LABEL_62:
  if (-[HMDCameraRecordingSession _shouldEndSessionAfterFragment:](v55, "_shouldEndSessionAfterFragment:", v6))
    -[HMDCameraRecordingSession _endSessionWithError:](v55, "_endSessionWithError:", 0);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "submitLogEvent:", v29);

LABEL_65:
}

- (void)_uploadFragment:(id)a3 withDuration:(double)a4 clipFinalizedBecauseMaxDurationExceeded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDCameraRecordingSession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  double Seconds;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  CMTime rhs;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime lhs;
  CMTime time;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[HMDCameraRecordingSession analysisVideoInitData](self, "analysisVideoInitData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initializationSegment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (-[HMDCameraRecordingSession factory](self, "factory"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isVideoInitData:combinableWithVideoInitData:", v9, v10),
        v11,
        (v12 & 1) == 0))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v16;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Analysis video init fragment changed from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCameraRecordingSession setAnalysisVideoInitData:](v14, "setAnalysisVideoInitData:", v10);
    -[HMDCameraRecordingSession clipUploader](v14, "clipUploader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "addVideoInitData:", v10);

  }
  if (v8)
  {
    objc_msgSend(v8, "timeRange");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }
  *(_OWORD *)&lhs.value = v25;
  lhs.epoch = v26;
  -[HMDCameraRecordingSession clipStartTime](self, "clipStartTime");
  CMTimeSubtract(&time, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  -[HMDCameraRecordingSession clipUploader](self, "clipUploader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "separableSegment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "addVideoSegmentData:duration:timeOffsetWithinClip:clipFinalizedBecauseMaxDurationExceeded:", v21, v5, a4, Seconds);

  -[HMDCameraRecordingSession timelapseFragmentManager](self, "timelapseFragmentManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFullFragment:", v8);

}

- (void)_uploadTimelapseFragment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraRecordingSession *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  HMDCameraRecordingSession *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  double Seconds;
  double v38;
  void *v39;
  void *v40;
  id v41;
  CMTime rhs;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CMTime lhs;
  CMTime v47;
  __int128 v48;
  _QWORD v49[4];
  CMTime v50;
  CMTime time;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v9;
    v59 = 2112;
    v60 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Uploading timelapse fragment: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingSession timelapseClipUploader](v7, "timelapseClipUploader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (v4)
    {
      objc_msgSend(v4, "timeRange");
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
    }
    v52 = v54;
    v53 = v55;
    -[HMDCameraRecordingSession setTimelapseClipStartTime:](v7, "setTimelapseClipStartTime:", &v52);
    -[HMDCameraRecordingSession timelineManager](v7, "timelineManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession timelapseClipStartTime](v7, "timelapseClipStartTime");
    objc_msgSend(v11, "creationDateForFragmentAtTimeOffset:", CMTimeGetSeconds(&time));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraRecordingSession factory](v7, "factory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession localZone](v7, "localZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession workQueue](v7, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession logIdentifier](v7, "logIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createUploaderWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:", v14, v12, 1, v15, v16, v17, 60.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession setTimelapseClipUploader:](v7, "setTimelapseClipUploader:", v18);

    -[HMDCameraRecordingSession timelapseClipUploader](v7, "timelapseClipUploader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v7);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession timelapseClipUploader](v21, "timelapseClipUploader");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v23;
      v59 = 2112;
      v60 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Created new timelapse clip uploader: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDCameraRecordingSession timelapseClipUploader](v21, "timelapseClipUploader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "createClip");

  }
  -[HMDCameraRecordingSession analysisTimelapseVideoInitData](v7, "analysisTimelapseVideoInitData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initializationSegment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27
    || (-[HMDCameraRecordingSession factory](v7, "factory"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = objc_msgSend(v29, "isVideoInitData:combinableWithVideoInitData:", v27, v28),
        v29,
        (v30 & 1) == 0))
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v7;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v34;
      v59 = 2112;
      v60 = v27;
      v61 = 2112;
      v62 = v28;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Analysis timelapse video init fragment changed from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    -[HMDCameraRecordingSession setAnalysisTimelapseVideoInitData:](v32, "setAnalysisTimelapseVideoInitData:", v28);
    -[HMDCameraRecordingSession timelapseClipUploader](v32, "timelapseClipUploader");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (id)objc_msgSend(v35, "addVideoInitData:", v28);

  }
  if (v4)
  {
    objc_msgSend(v4, "timeRange");
    v50 = *(CMTime *)&v49[1];
    Seconds = CMTimeGetSeconds(&v50);
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    memset(v49, 0, sizeof(v49));
    v48 = 0u;
    *(_OWORD *)&v50.value = *(_OWORD *)&v49[1];
    v50.epoch = 0;
    Seconds = CMTimeGetSeconds(&v50);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
  }
  *(_OWORD *)&lhs.value = v43;
  lhs.epoch = v44;
  -[HMDCameraRecordingSession timelapseClipStartTime](v7, "timelapseClipStartTime");
  CMTimeSubtract(&v47, &lhs, &rhs);
  v38 = CMTimeGetSeconds(&v47);
  -[HMDCameraRecordingSession timelapseClipUploader](v7, "timelapseClipUploader");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "separableSegment");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v39, "addVideoSegmentData:duration:timeOffsetWithinClip:clipFinalizedBecauseMaxDurationExceeded:", v40, 0, Seconds, v38);

}

- (void)_notifyForAnalyzerResult:(id)a3 fragment:(id)a4 timeOffsetWithinClip:(double)a5 recordingEventTriggers:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime time;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDCameraRecordingSession timelineManager](self, "timelineManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "timeRange");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }
  *(_OWORD *)&time.value = v26;
  time.epoch = v27;
  objc_msgSend(v13, "creationDateForFragmentAtTimeOffset:", CMTimeGetSeconds(&time));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSession significantEventManager](self, "significantEventManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "significantEventsForAnalyzerFragmentResult:dateOfOccurrence:timeOffsetWithinClip:recordingEventTriggers:", v10, v14, a6, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[HMDCameraRecordingSession _notifyForSignificantEvent:recordingEventTriggers:fragmentNumber:](self, "_notifyForSignificantEvent:recordingEventTriggers:fragmentNumber:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), a6, objc_msgSend(v11, "sequenceNumber", (_QWORD)v22));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)_notifyForSignificantEvent:(id)a3 recordingEventTriggers:(unint64_t)a4 fragmentNumber:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  unint64_t v18;

  v8 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDCameraRecordingSession clipUploader](self, "clipUploader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession homePresenceByPairingIdentity](self, "homePresenceByPairingIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addNotificationForSignificantEvent:homePresenceByPairingIdentity:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__HMDCameraRecordingSession__notifyForSignificantEvent_recordingEventTriggers_fragmentNumber___block_invoke;
  v15[3] = &unk_24E7937C0;
  v15[4] = self;
  v16 = v8;
  v17 = a4;
  v18 = a5;
  v13 = v8;
  v14 = (id)objc_msgSend(v12, "addSuccessBlock:", v15);

}

- (void)_submitNotificationSuccessMetricWithRecordingEventTriggers:(unint64_t)a3 fragmentNumber:(unint64_t)a4
{
  NSObject *v7;
  HMDCameraRecordingClipNotificationEvent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraRecordingClipNotificationEvent *v13;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = [HMDCameraRecordingClipNotificationEvent alloc];
  -[HMDCameraRecordingSession identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession camera](self, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCameraRecordingClipNotificationEvent initWithSessionID:cameraID:sequenceNumber:recordingEventTriggers:](v8, "initWithSessionID:cameraID:sequenceNumber:recordingEventTriggers:", v9, v11, a4, a3);

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitLogEvent:", v13);

}

- (void)_handleDidFailAnalysisWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638](-[HMDCameraRecordingSession setPendingFragmentsCount:](self, "setPendingFragmentsCount:", -[HMDCameraRecordingSession pendingFragmentsCount](self, "pendingFragmentsCount") - 1));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Analysis failed with error: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDCameraRecordingSessionErrorDomain"), 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession _endSessionWithError:](v7, "_endSessionWithError:", v10);

}

- (void)_endSessionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSession *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2112;
      v23 = v4;
      v11 = "%{public}@Ending session with error: %@";
      v12 = v9;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, buf, v14);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    v11 = "%{public}@Ending session";
    v12 = v9;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingSession setActive:](v7, "setActive:", 0);
  -[HMDCameraRecordingSession _finishCurrentClipUploader](v7, "_finishCurrentClipUploader");
  -[HMDCameraRecordingSession videoAnalyzer](v7, "videoAnalyzer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancel");

  -[HMDCameraRecordingSession videoAnalyzer](v7, "videoAnalyzer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__HMDCameraRecordingSession__endSessionWithError___block_invoke;
  v18[3] = &unk_24E79BCC8;
  v18[4] = v7;
  v19 = v4;
  v17 = v4;
  objc_msgSend(v16, "finishWithCompletionHandler:", v18);

}

- (BOOL)_shouldRecordFragmentWithAnalyzerResult:(id)a3 sequenceNumber:(unint64_t)a4 recordingEventTriggers:(unint64_t)a5 fragmentAnalyzedEvent:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double Seconds;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  HMDCameraRecordingSession *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraRecordingSession *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  HMDCameraRecordingSession *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  BOOL v40;
  void *v41;
  HMDCameraRecordingSession *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  HMDCameraRecordingSession *v49;
  NSObject *v50;
  void *v51;
  CMTime v53;
  CMTime v54;
  CMTime time;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v9, "fragment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  objc_msgSend(v9, "fragment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "timeRange");
  else
    memset(&v53, 0, sizeof(v53));
  v54 = v53;
  v17 = CMTimeGetSeconds(&v54);

  -[HMDCameraRecordingSession timelineManager](self, "timelineManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isDoorbellTriggerActiveAtAnyTimeAfterOffset:forDuration:", v17, Seconds);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v57 = v23;
    v58 = 2112;
    v59 = v24;
    v60 = 2048;
    v61 = v17;
    v62 = 2048;
    v63 = Seconds;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Doorbell is active: %@ for fragment at time offset: %f and duration: %f", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v20);
  if (v19)
  {
    v25 = (void *)MEMORY[0x227676638](objc_msgSend(v10, "setRecordingReason:", 2));
    v26 = v21;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Doorbell event detected, starting recording", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    goto LABEL_25;
  }
  -[HMDCameraRecordingSession timelineManager](v21, "timelineManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isMotionTriggerActiveAtAnyTimeAfterOffset:forDuration:", v17, Seconds);

  v31 = (void *)MEMORY[0x227676638]();
  v32 = v21;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v57 = v34;
    v58 = 2112;
    v59 = v35;
    v60 = 2048;
    v61 = v17;
    v62 = 2048;
    v63 = Seconds;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Motion is active: %@ for fragment at time offset: %f and duration: %f", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(v9, "outcome");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isSuccess");

  if ((v37 & 1) == 0)
  {
    v41 = (void *)MEMORY[0x227676638]();
    v42 = v32;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      HMCameraSignificantEventTypesAsString();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v44;
      v58 = 2112;
      v59 = v45;
      v60 = 2112;
      v61 = *(double *)&v46;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Fragment analysis was skipped, recordingTriggerEvent is %@ and motion is %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v41);
    if (a5)
      v47 = v30;
    else
      v47 = 0;
    if (v47 == 1)
    {
      objc_msgSend(v10, "setRecordingReason:", 3);
LABEL_25:
      v40 = 1;
      goto LABEL_30;
    }
LABEL_29:
    v40 = 0;
    goto LABEL_30;
  }
  -[HMDCameraRecordingSession significantEventManager](v32, "significantEventManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isAnyEventInAnalyzerFragmentResult:includedInRecordingEventTriggers:", v9, a5);

  if (!v39)
  {
    v48 = (void *)MEMORY[0x227676638]();
    v49 = v32;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v51;
      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@No user recording trigger events match any detected significant events", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v48);
    goto LABEL_29;
  }
  v40 = 1;
  objc_msgSend(v10, "setRecordingReason:", 1);
LABEL_30:

  return v40;
}

- (BOOL)_shouldEndSessionAfterFragment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraRecordingSession *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  HMDCameraRecordingSession *v14;
  BOOL v15;
  void *v16;
  const char *v17;
  double Seconds;
  void *v19;
  void *v20;
  double v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  HMDCameraRecordingSession *v29;
  void *v30;
  void *v31;
  double v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  HMDCameraRecordingSession *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  HMDCameraRecordingSession *v51;
  HMDCameraRecordingSession *v52;
  CMTimeRange v53;
  CMTime time;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[HMDCameraRecordingSession noMoreFragmentsAvailable](self, "noMoreFragmentsAvailable")
    || -[HMDCameraRecordingSession pendingFragmentsCount](self, "pendingFragmentsCount"))
  {
    -[HMDCameraRecordingSession remainingRecordingExtensionDuration](self, "remainingRecordingExtensionDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v10;
        v11 = "%{public}@Recording extension active, continue session";
LABEL_6:
        v12 = v9;
        v13 = 12;
LABEL_19:
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);

      }
LABEL_20:
      v15 = 0;
      goto LABEL_21;
    }
    if (v4)
      objc_msgSend(v4, "timeRange");
    else
      memset(&v53, 0, sizeof(v53));
    CMTimeRangeGetEnd(&time, &v53);
    Seconds = CMTimeGetSeconds(&time);
    -[HMDCameraRecordingSession timelineManager](self, "timelineManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession factory](self, "factory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "recordingExtensionDuration");
    v22 = objc_msgSend(v19, "isDoorbellTriggerActiveAtAnyTimeAfterOffset:forDuration:", Seconds, v21);

    if (v22)
    {
      v7 = (void *)MEMORY[0x227676638](v23, v24, v25, v26, v27, v28);
      v29 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v10;
      v57 = 2048;
      v58 = Seconds;
      v11 = "%{public}@Doorbell is active for next fragment at time offset: %f";
LABEL_18:
      v12 = v9;
      v13 = 22;
      goto LABEL_19;
    }
    -[HMDCameraRecordingSession timelineManager](self, "timelineManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession factory](self, "factory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "recordingExtensionDuration");
    v33 = objc_msgSend(v30, "isMotionTriggerActiveAtAnyTimeAfterOffset:forDuration:", Seconds, v32);

    if (v33)
    {
      v7 = (void *)MEMORY[0x227676638](v34, v35, v36, v37, v38, v39);
      v40 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v10;
      v57 = 2048;
      v58 = Seconds;
      v11 = "%{public}@Motion is active for next fragment at time offset: %f";
      goto LABEL_18;
    }
    v42 = _os_feature_enabled_impl();
    if ((_DWORD)v42)
    {
      -[HMDCameraRecordingSession camera](self, "camera");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "hapAccessory");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "hasBattery");

      if ((v50 & 1) == 0)
      {
        v7 = (void *)MEMORY[0x227676638](v42, v43, v44, v45, v46, v47);
        v52 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_20;
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v10;
        v11 = "%{public}@Continuous video analysis is enabled on powered camera, continue session";
        goto LABEL_6;
      }
    }
    v7 = (void *)MEMORY[0x227676638](v42, v43, v44, v45, v46, v47);
    v51 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v15 = 1;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v16;
    v17 = "%{public}@Should end session";
LABEL_26:
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, v17, buf, 0xCu);

    goto LABEL_21;
  }
  v7 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v15 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v16;
    v17 = "%{public}@No more fragment data to process, must end session";
    goto LABEL_26;
  }
LABEL_21:

  objc_autoreleasePoolPop(v7);
  return v15;
}

- (BOOL)_createSessionDirectory
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraRecordingSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDCameraRecordingSession *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSession sessionDirectoryPath](self, "sessionDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("HKSV"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSession identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession setSessionDirectoryPath:](self, "setSessionDirectoryPath:", v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSession sessionDirectoryPath](v12, "sessionDirectoryPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Writing session data to directory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSession sessionDirectoryPath](v12, "sessionDirectoryPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v5 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v25);
  v18 = v25;

  if ((v5 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession sessionDirectoryPath](v20, "sessionDirectoryPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at path: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }

  return v5;
}

- (void)_writeFragment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  HMDCameraRecordingSession *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  char v25;
  HMDCameraRecordingSession *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferenceForKey:", CFSTR("writeAllReceivedVideoFragmentsToDisk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8 && -[HMDCameraRecordingSession _createSessionDirectory](self, "_createSessionDirectory"))
  {
    -[HMDCameraRecordingSession identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("mp4"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraRecordingSession sessionDirectoryPath](self, "sessionDirectoryPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "seekToEndOfFile");
      objc_msgSend(v4, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v17 = objc_msgSend(v15, "writeData:error:", v16, &v28);
      v18 = v28;

      if ((v17 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v22;
          v31 = 2112;
          v32 = v13;
          v33 = 2112;
          v34 = v18;
          v23 = "%{public}@Failed to append fragment data to file at path: %@ error: %@";
LABEL_10:
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x20u);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v4, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v25 = objc_msgSend(v24, "writeToFile:options:error:", v13, 0, &v27);
      v18 = v27;

      if ((v25 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v22;
          v31 = 2112;
          v32 = v13;
          v33 = 2112;
          v34 = v18;
          v23 = "%{public}@Failed to write fragment data to file at path: %@ error: %@";
          goto LABEL_10;
        }
LABEL_11:

        objc_autoreleasePoolPop(v19);
      }
    }

  }
}

- (BOOL)_shouldWriteSessionLogToDisk
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v7;

  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("writeSessionLogToDisk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = _os_feature_enabled_impl();
    if (v5)
      v6 = 0;
    else
      v6 = v7;
  }

  return v6;
}

- (void)_writeEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  HMDCameraRecordingSession *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  void *v27;
  HMDCameraRecordingSession *v28;
  NSObject *v29;
  void *v30;
  char v31;
  HMDCameraRecordingSession *v32;
  void *context;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDCameraRecordingSession _shouldWriteSessionLogToDisk](self, "_shouldWriteSessionLogToDisk")
    && -[HMDCameraRecordingSession _createSessionDirectory](self, "_createSessionDirectory"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD15D0]);
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

    objc_msgSend(v6, "setFormatOptions:", objc_msgSend(v6, "formatOptions") | 0x800);
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("date"));

    v38 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v8, 0, &v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v38;
    if (!v11)
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v30;
        v41 = 2112;
        v42 = v4;
        v43 = 2112;
        v44 = v12;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize log event: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      goto LABEL_17;
    }
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendData:", v14);

    -[HMDCameraRecordingSession identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathExtension:", CFSTR("jsonl"));
    v17 = objc_claimAutoreleasedReturnValue();

    -[HMDCameraRecordingSession sessionDirectoryPath](self, "sessionDirectoryPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v17;
    objc_msgSend(v18, "stringByAppendingPathComponent:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "seekToEndOfFile");
      v37 = 0;
      v22 = objc_msgSend(v21, "writeData:error:", v13, &v37);
      v35 = v37;

      if ((v22 & 1) == 0)
      {
        context = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v25;
          v41 = 2112;
          v42 = v19;
          v43 = 2112;
          v44 = v35;
          v26 = "%{public}@Failed to append log event to file at path: %@ error: %@";
LABEL_14:
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, v26, buf, 0x20u);

          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else
    {
      v36 = v12;
      v31 = objc_msgSend(v13, "writeToFile:options:error:", v19, 0, &v36);
      v35 = v36;

      if ((v31 & 1) == 0)
      {
        context = (void *)MEMORY[0x227676638]();
        v32 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v25;
          v41 = 2112;
          v42 = v19;
          v43 = 2112;
          v44 = v35;
          v26 = "%{public}@Failed to write log event to file at path: %@ error: %@";
          goto LABEL_14;
        }
LABEL_15:

        objc_autoreleasePoolPop(context);
      }
    }

    v12 = v35;
LABEL_17:

  }
}

- (BOOL)_isValidFirstSessionFragment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "isInitial"))
  {
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("mediaInitialization"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isValidNonFirstSessionFragment:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((objc_msgSend(v4, "isInitial") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", CFSTR("mediaFragment"));

  }
  return v6;
}

- (void)_finishCurrentClipUploader
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCameraRecordingSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSession clipUploader](self, "clipUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession clipUploader](v6, "clipUploader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Finishing clip uploader: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDCameraRecordingSession clipUploader](v6, "clipUploader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "finish");

    -[HMDCameraRecordingSession setClipUploader:](v6, "setClipUploader:", 0);
    v13 = *MEMORY[0x24BDC0D40];
    v14 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    -[HMDCameraRecordingSession setClipStartTime:](v6, "setClipStartTime:", &v13);
    -[HMDCameraRecordingSession setAnalysisVideoInitData:](v6, "setAnalysisVideoInitData:", 0);
    -[HMDCameraRecordingSession setRemainingRecordingExtensionDuration:](v6, "setRemainingRecordingExtensionDuration:", 0);
    -[HMDCameraRecordingSession significantEventManager](v6, "significantEventManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetState");

  }
}

- (void)_finishCurrentTimelapseClipUploader
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCameraRecordingSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSession timelapseClipUploader](self, "timelapseClipUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSession timelapseClipUploader](v6, "timelapseClipUploader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Finishing timelapse clip uploader: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDCameraRecordingSession timelapseClipUploader](v6, "timelapseClipUploader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "finish");

    -[HMDCameraRecordingSession setTimelapseClipUploader:](v6, "setTimelapseClipUploader:", 0);
    v12 = *MEMORY[0x24BDC0D40];
    v13 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    -[HMDCameraRecordingSession setTimelapseClipStartTime:](v6, "setTimelapseClipStartTime:", &v12);
    -[HMDCameraRecordingSession setAnalysisTimelapseVideoInitData:](v6, "setAnalysisTimelapseVideoInitData:", 0);
  }
}

- (void)uploaderDidFailUpload:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  HMDCameraRecordingSession *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  HMDCameraRecordingSession *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSession clipUploader](self, "clipUploader");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Current clip uploader did fail upload", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDCameraRecordingSession _finishCurrentClipUploader](v15, "_finishCurrentClipUploader");
  }
  else
  {
    -[HMDCameraRecordingSession timelapseClipUploader](self, "timelapseClipUploader");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7 == v4)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Timelapse clip uploader did fail upload", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDCameraRecordingSession _finishCurrentTimelapseClipUploader](v9, "_finishCurrentTimelapseClipUploader");
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Previous clip uploader did fail upload", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v13 = (id)objc_msgSend(v4, "finish");
    }
  }

}

- (void)variantFragmentManager:(id)a3 didSelectVariantFragment:(id)a4 overlapsFullFragment:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDCameraRecordingSession *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDCameraRecordingSession workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (a5)
  {
LABEL_4:
    -[HMDCameraRecordingSession _uploadTimelapseFragment:](self, "_uploadTimelapseFragment:", v9);
    if (!-[HMDCameraRecordingSession isActive](self, "isActive"))
      -[HMDCameraRecordingSession _finishCurrentTimelapseClipUploader](self, "_finishCurrentTimelapseClipUploader");
    goto LABEL_9;
  }
  -[HMDCameraRecordingSession timelapseClipUploader](self, "timelapseClipUploader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "placeholderCopy");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
    goto LABEL_4;
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v16;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping upload for placeholder fragment because the timelapse clip uploader is not created yet, fragment: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
LABEL_9:

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraRecordingSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraRecordingSession timelineManager](self, "timelineManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Timeline Manager"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (double)configuredFragmentDuration
{
  return self->_configuredFragmentDuration;
}

- (HMDCameraRecordingSessionTimelineManager)timelineManager
{
  return (HMDCameraRecordingSessionTimelineManager *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraRecordingSessionDelegate)delegate
{
  return (HMDCameraRecordingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCameraProfile)camera
{
  return (HMDCameraProfile *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraRecordingSessionFactory)factory
{
  return (HMDCameraRecordingSessionFactory *)objc_getProperty(self, a2, 96, 1);
}

- (HMDCameraRecordingSessionVideoAnalyzer)videoAnalyzer
{
  return (HMDCameraRecordingSessionVideoAnalyzer *)objc_getProperty(self, a2, 104, 1);
}

- (HMFActivity)sessionActivity
{
  return (HMFActivity *)objc_getProperty(self, a2, 112, 1);
}

- (HMDCameraRecordingSessionSignificantEventManager)significantEventManager
{
  return (HMDCameraRecordingSessionSignificantEventManager *)objc_getProperty(self, a2, 120, 1);
}

- (HMDCameraRecordingSessionVariantFragmentManager)timelapseFragmentManager
{
  return (HMDCameraRecordingSessionVariantFragmentManager *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)noMoreFragmentsAvailable
{
  return self->_noMoreFragmentsAvailable;
}

- (void)setNoMoreFragmentsAvailable:(BOOL)a3
{
  self->_noMoreFragmentsAvailable = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unint64_t)pendingFragmentsCount
{
  return self->_pendingFragmentsCount;
}

- (void)setPendingFragmentsCount:(unint64_t)a3
{
  self->_pendingFragmentsCount = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)clipStartTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_clipStartTime, 24, 1, 0);
  return result;
}

- (void)setClipStartTime:(id *)a3
{
  objc_copyStruct(&self->_clipStartTime, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapseClipStartTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_timelapseClipStartTime, 24, 1, 0);
  return result;
}

- (void)setTimelapseClipStartTime:(id *)a3
{
  objc_copyStruct(&self->_timelapseClipStartTime, a3, 24, 1, 0);
}

- (HMDCameraClipUploader)clipUploader
{
  return (HMDCameraClipUploader *)objc_getProperty(self, a2, 144, 1);
}

- (void)setClipUploader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (HMDCameraClipUploader)timelapseClipUploader
{
  return (HMDCameraClipUploader *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTimelapseClipUploader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (HMDDataStreamFragment)cameraVideoInitFragment
{
  return (HMDDataStreamFragment *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCameraVideoInitFragment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (HMIVideoFragment)introFragment
{
  return (HMIVideoFragment *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIntroFragment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (HMIVideoAnalyzerFragmentResult)introAnalyzerResult
{
  return (HMIVideoAnalyzerFragmentResult *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIntroAnalyzerResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSData)analysisVideoInitData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAnalysisVideoInitData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)analysisTimelapseVideoInitData
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAnalysisTimelapseVideoInitData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSNumber)remainingRecordingExtensionDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRemainingRecordingExtensionDuration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSString)sessionDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSessionDirectoryPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDirectoryPath, 0);
  objc_storeStrong((id *)&self->_remainingRecordingExtensionDuration, 0);
  objc_storeStrong((id *)&self->_analysisTimelapseVideoInitData, 0);
  objc_storeStrong((id *)&self->_analysisVideoInitData, 0);
  objc_storeStrong((id *)&self->_introAnalyzerResult, 0);
  objc_storeStrong((id *)&self->_introFragment, 0);
  objc_storeStrong((id *)&self->_cameraVideoInitFragment, 0);
  objc_storeStrong((id *)&self->_timelapseClipUploader, 0);
  objc_storeStrong((id *)&self->_clipUploader, 0);
  objc_storeStrong((id *)&self->_timelapseFragmentManager, 0);
  objc_storeStrong((id *)&self->_significantEventManager, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_videoAnalyzer, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timelineManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_homePresenceByPairingIdentity, 0);
}

void __50__HMDCameraRecordingSession__endSessionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HMDCameraRecordingSession__endSessionWithError___block_invoke_2;
  block[3] = &unk_24E79BBD0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __50__HMDCameraRecordingSession__endSessionWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      v21 = 138543618;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video analyzer finished with error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
  }
  objc_msgSend(*(id *)(a1 + 40), "timelapseFragmentManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "expectsVariantFragment");

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Timelapse clip uploader is still expecting a timelapse fragment", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timelapseClipUploader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Finishing timelapse clip uploader: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(*(id *)(a1 + 40), "timelapseClipUploader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "finish");

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "session:didEndWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __94__HMDCameraRecordingSession__notifyForSignificantEvent_recordingEventTriggers_fragmentNumber___block_invoke(uint64_t a1)
{
  HMDHomePresenceRemote *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDHomePresenceRemote *v10;

  v2 = [HMDHomePresenceRemote alloc];
  objc_msgSend(*(id *)(a1 + 32), "homePresenceByPairingIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHomePresenceRemote initWithPresenceByPairingIdentity:](v2, "initWithPresenceByPairingIdentity:", v3);

  objc_msgSend(*(id *)(a1 + 32), "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraBulletinNotificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleSignificantEvent:cameraProfile:homePresence:", v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 32), "_submitNotificationSuccessMetricWithRecordingEventTriggers:fragmentNumber:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __65__HMDCameraRecordingSession_analyzer_didCreateTimelapseFragment___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Timelapse fragment was created: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "timelapseFragmentManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleVariantFragment:", *(_QWORD *)(a1 + 40));

}

uint64_t __55__HMDCameraRecordingSession_analyzer_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFailAnalysisWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __67__HMDCameraRecordingSession_analyzer_didAnalyzeFragmentWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fragment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Fragment was analyzed: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleFragmentResult:", *(_QWORD *)(a1 + 40));
}

id __38__HMDCameraRecordingSession_configure__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "photosPersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmiPersonManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t52 != -1)
    dispatch_once(&logCategory__hmf_once_t52, &__block_literal_global_102_213512);
  return (id)logCategory__hmf_once_v53;
}

void __40__HMDCameraRecordingSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v53;
  logCategory__hmf_once_v53 = v0;

}

@end
