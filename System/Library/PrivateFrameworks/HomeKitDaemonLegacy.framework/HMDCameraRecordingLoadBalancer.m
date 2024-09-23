@implementation HMDCameraRecordingLoadBalancer

- (HMDCameraRecordingLoadBalancer)initWithHomeManager:(id)a3 resourceUsageMonitor:(id)a4
{
  id v6;
  id v7;
  HMDCameraRecordingLoadBalancer *v8;
  HMDCameraRecordingLoadBalancer *v9;
  uint64_t v10;
  NSMutableDictionary *readyToRecordByCameraUUIDString;
  uint64_t v12;
  NSMutableDictionary *recordingSessionSummariesByCameraUUIDString;
  uint64_t v14;
  NSMutableDictionary *decisionsByCameraUUIDByDeviceUUID;
  uint64_t v16;
  NSMutableDictionary *lastDecisionByCameraUUID;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDCameraRecordingLoadBalancer;
  v8 = -[HMDCameraRecordingLoadBalancer init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_storeStrong((id *)&v9->_systemResourceUsageMonitor, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    readyToRecordByCameraUUIDString = v9->_readyToRecordByCameraUUIDString;
    v9->_readyToRecordByCameraUUIDString = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    recordingSessionSummariesByCameraUUIDString = v9->_recordingSessionSummariesByCameraUUIDString;
    v9->_recordingSessionSummariesByCameraUUIDString = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    decisionsByCameraUUIDByDeviceUUID = v9->_decisionsByCameraUUIDByDeviceUUID;
    v9->_decisionsByCameraUUIDByDeviceUUID = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    lastDecisionByCameraUUID = v9->_lastDecisionByCameraUUID;
    v9->_lastDecisionByCameraUUID = (NSMutableDictionary *)v16;

  }
  return v9;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingLoadBalancer homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleResidentMeshInitialized_, CFSTR("HMDHomeManagerHomeDataLoadedNotification"), v4);

  -[HMDCameraRecordingLoadBalancer systemResourceUsageMonitor](self, "systemResourceUsageMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[HMDCameraRecordingLoadBalancer systemResourceUsageMonitor](self, "systemResourceUsageMonitor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");

}

- (void)recordingDidStartForCameraWithUUID:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[HMDCameraRecordingLoadBalancer homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDCameraRecordingLoadBalancer setNumberOfActiveRecordingSessions:](self, "setNumberOfActiveRecordingSessions:", -[HMDCameraRecordingLoadBalancer numberOfActiveRecordingSessions](self, "numberOfActiveRecordingSessions") + 1);
    v6 = -[HMDCameraRecordingLoadBalancer numberOfActiveRecordingSessions](self, "numberOfActiveRecordingSessions");
    -[HMDCameraRecordingLoadBalancer recordingSessionSummariesByCameraUUIDString](self, "recordingSessionSummariesByCameraUUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], v8);

    -[HMDCameraRecordingLoadBalancer recordingSessionSummariesByCameraUUIDString](self, "recordingSessionSummariesByCameraUUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v4, "residentMesh");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("numberOfActiveRecordingSessions"), v12, 0);

    objc_msgSend(v4, "residentMesh");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("recordingSessionSummaries"), v10, 0);

  }
}

- (void)recordingDidEndForCameraWithUUID:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  unint64_t v7;
  void *v8;
  HMDCameraRecordingLoadBalancer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  HMDCameraRecordingLoadBalancer *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRecordingLoadBalancer homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if (-[HMDCameraRecordingLoadBalancer numberOfActiveRecordingSessions](self, "numberOfActiveRecordingSessions"))
    {
      -[HMDCameraRecordingLoadBalancer setNumberOfActiveRecordingSessions:](self, "setNumberOfActiveRecordingSessions:", -[HMDCameraRecordingLoadBalancer numberOfActiveRecordingSessions](self, "numberOfActiveRecordingSessions") - 1);
      v7 = -[HMDCameraRecordingLoadBalancer numberOfActiveRecordingSessions](self, "numberOfActiveRecordingSessions");
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v11;
        v29 = 2112;
        v30 = v4;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got recordingDidEndForCamera: %@ with numberOfActiveRecordingSessions == 0", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v7 = 0;
    }
    -[HMDCameraRecordingLoadBalancer recordingSessionSummariesByCameraUUIDString](self, "recordingSessionSummariesByCameraUUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v19;
        v29 = 2112;
        v30 = v4;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Got recordingDidEndForCamera: %@ with no corresponding entry in recordingSessionSummariesByCameraUUIDString", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }
    -[HMDCameraRecordingLoadBalancer recordingSessionSummariesByCameraUUIDString](self, "recordingSessionSummariesByCameraUUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

    -[HMDCameraRecordingLoadBalancer recordingSessionSummariesByCameraUUIDString](self, "recordingSessionSummariesByCameraUUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v5, "residentMesh");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("numberOfActiveRecordingSessions"), v25, 0);

    objc_msgSend(v5, "residentMesh");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("recordingSessionSummaries"), v23, 0);

  }
}

- (BOOL)isReadyToRecordForCameraWithUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraRecordingLoadBalancer readyToRecordByCameraUUIDString](self, "readyToRecordByCameraUUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)setReadyToRecord:(BOOL)a3 forCameraWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDCameraRecordingLoadBalancer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting ready to record to %@ for camera with UUID %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingLoadBalancer readyToRecordByCameraUUIDString](v8, "readyToRecordByCameraUUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  os_unfair_lock_unlock(&v8->_lock);
  -[HMDCameraRecordingLoadBalancer _updateReadyToRecordMetric](v8, "_updateReadyToRecordMetric");

}

- (void)removeDataForCameraWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDCameraRecordingLoadBalancer readyToRecordByCameraUUIDString](self, "readyToRecordByCameraUUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

  -[HMDCameraRecordingLoadBalancer recordingSessionSummariesByCameraUUIDString](self, "recordingSessionSummariesByCameraUUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](self, "decisionsByCameraUUIDByDeviceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HMDCameraRecordingLoadBalancer_removeDataForCameraWithUUID___block_invoke;
  v11[3] = &unk_1E89C09A8;
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "na_each:", v11);

  os_unfair_lock_unlock(&self->_lock);
  -[HMDCameraRecordingLoadBalancer _updateReadyToRecordMetric](self, "_updateReadyToRecordMetric");

}

- (id)loadBalancingDecisionForCamera:(id)a3 deviceFilter:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraRecordingLoadBalancer _loadBalancingDecisionForCamera:deviceFilter:](self, "_loadBalancingDecisionForCamera:deviceFilter:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)handleRecordingSessionForwardingSuccessForDecision:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMDCameraRecordingLoadBalancer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x1D17BA0A0](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v10;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling successful load balancing decision: %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "deviceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
  {
    -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](v8, "decisionsByCameraUUIDByDeviceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](v8, "decisionsByCameraUUIDByDeviceUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

    }
    -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](v8, "decisionsByCameraUUIDByDeviceUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cameraUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v4, v23);

    -[HMDCameraRecordingLoadBalancer lastDecisionByCameraUUID](v8, "lastDecisionByCameraUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cameraUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v4, v25);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)handleRecordingSessionForwardingFailureForDecision:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](self, "decisionsByCameraUUIDByDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](self, "decisionsByCameraUUIDByDeviceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cameraUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

  }
  -[HMDCameraRecordingLoadBalancer lastDecisionByCameraUUID](self, "lastDecisionByCameraUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cameraUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

  os_unfair_lock_unlock(p_lock);
}

- (id)_loadBalancingDecisionForCamera:(id)a3 deviceFilter:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  HMDCameraRecordingLoadBalancer *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
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
  HMDCameraRecordingLoadBalancer *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  HMDCameraRecordingLoadBalancerDecision *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  HMDCameraRecordingLoadBalancerDecision *v53;
  id v55;
  id v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  HMDCameraRecordingLoadBalancer *v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _BYTE *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  int v78;
  _QWORD v79[5];
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD aBlock[4];
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE buf[24];
  void *v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v55 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v66 = self;
  -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](self, "decisionsByCameraUUIDByDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
  if (v59)
  {
    v58 = *(_QWORD *)v93;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v93 != v58)
        {
          v8 = v7;
          objc_enumerationMutation(obj);
          v7 = v8;
        }
        v61 = v7;
        v63 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v7);
        -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](v66, "decisionsByCameraUUIDByDeviceUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v63);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v10, "allKeys");
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
        if (v11)
        {
          v69 = *(_QWORD *)v89;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v89 != v69)
                objc_enumerationMutation(v67);
              v13 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isExpired");

              if (v15)
              {
                v16 = (void *)MEMORY[0x1D17BA0A0]();
                v17 = v66;
                HMFGetOSLogHandle();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "shortDescription");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v19;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v21;
                  _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Expiring cached HMDCameraRecordingLoadBalancerDecision: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v16);
                objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v13);
              }
            }
            v11 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
          }
          while (v11);
        }

        if (!objc_msgSend(v10, "count"))
        {
          -[HMDCameraRecordingLoadBalancer decisionsByCameraUUIDByDeviceUUID](v66, "decisionsByCameraUUIDByDeviceUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, v63);

        }
        v7 = v61 + 1;
      }
      while (v61 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
    }
    while (v59);
  }

  -[HMDCameraRecordingLoadBalancer lastDecisionByCameraUUID](v66, "lastDecisionByCameraUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke;
  aBlock[3] = &unk_1E89C09D0;
  v26 = v56;
  v86 = v26;
  v64 = v25;
  v87 = v64;
  v68 = _Block_copy(aBlock);
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_19;
  v82[3] = &unk_1E89C09F8;
  v27 = v26;
  v83 = v27;
  v62 = v55;
  v84 = v62;
  v28 = _Block_copy(v82);
  objc_msgSend(v27, "hapAccessory");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bridge");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v70 = v30;
  }
  else
  {
    objc_msgSend(v27, "hapAccessory");
    v70 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[HMDCameraRecordingLoadBalancer homeManager](v66, "homeManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "residentMesh");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "cameraRecordingAnalysisNodesForCameraAccessory:", v70);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "mutableCopy");

  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_2;
  v80[3] = &unk_1E89C0A20;
  v60 = v28;
  v81 = v60;
  objc_msgSend(v35, "indexesOfObjectsPassingTest:", v80);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeObjectsAtIndexes:", v65);
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_3;
  v79[3] = &unk_1E89C0A70;
  v79[4] = v66;
  objc_msgSend(v35, "na_map:", v79);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sortedArrayUsingComparator:", v68);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1D17BA0A0]();
  v39 = v66;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uniqueIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "UUIDString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingLoadBalancer _loadBalancingDescriptionFromSortedNodes:](v39, "_loadBalancingDescriptionFromSortedNodes:", v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v43;
    *(_WORD *)&buf[22] = 2112;
    v97 = v44;
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Residents sorted for camera (%@): %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v38);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LODWORD(v97) = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_24;
  v71[3] = &unk_1E89C0A98;
  v73 = buf;
  v45 = v27;
  v72 = v45;
  v74 = &v75;
  objc_msgSend(v37, "na_each:", v71);
  v46 = [HMDCameraRecordingLoadBalancerDecision alloc];
  objc_msgSend(v45, "uniqueIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v37, "count");
  v49 = *(int *)(*(_QWORD *)&buf[8] + 24);
  v50 = *((int *)v76 + 6);
  objc_msgSend(v37, "firstObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[HMDCameraRecordingLoadBalancerDecision initWithCameraUUID:numberOfAvailableDevices:totalNumberOfJobSlots:remainingNumberOfJobSlots:analysisNode:decisionDate:](v46, "initWithCameraUUID:numberOfAvailableDevices:totalNumberOfJobSlots:remainingNumberOfJobSlots:analysisNode:decisionDate:", v47, v48, v49, v50, v51, v52);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(buf, 8);

  return v53;
}

- (id)_loadBalancingDescriptionFromSortedNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_177787);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[\n%@\n]"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("[]");
  }

  return v7;
}

- (void)_updateReadyToRecordMetric
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraRecordingLoadBalancer readyToRecordByCameraUUIDString](self, "readyToRecordByCameraUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  -[HMDCameraRecordingLoadBalancer homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentMesh");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("readyToRecordByCameraUUIDString"), v7, 0);

}

- (unint64_t)_jobSlotsWithSystemResourceUsageLevel:(int64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = 1;
  v5 = MGGetProductType();
  if (v5 <= 2271819420)
  {
    if (v5 <= 1110205731)
    {
      if (v5 != 33245053)
      {
        v6 = 741626682;
        goto LABEL_13;
      }
      if ((unint64_t)a3 >= 4)
        return 3;
      v7 = &unk_1CDB8FB58;
      return v7[a3];
    }
    if (v5 != 1110205732)
    {
      if (v5 != 1114644381)
        return v4;
      goto LABEL_15;
    }
    return a3 != 3;
  }
  if (v5 > 3865897230)
  {
    if (v5 == 3865897231)
    {
LABEL_15:
      if ((unint64_t)a3 >= 4)
        return 4;
      v7 = &unk_1CDB8FB38;
      return v7[a3];
    }
    v6 = 4240173202;
  }
  else
  {
    if (v5 == 2271819421)
      return a3 != 3;
    v6 = 2702125347;
  }
LABEL_13:
  if (v5 == v6)
    return a3 != 3;
  return v4;
}

- (unint64_t)_partialJobSlotsWithSystemResourceUsageLevel:(int64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 1;
  v5 = MGGetProductType();
  if (v5 > 2271819420)
  {
    if (v5 <= 3348380075)
    {
      if (v5 == 2271819421)
        goto LABEL_19;
      v6 = 2702125347;
    }
    else
    {
      if (v5 == 4240173202)
        return a3 != 3;
      if (v5 == 3865897231)
      {
LABEL_23:
        if ((unint64_t)a3 > 3)
          return 3;
        else
          return qword_1CDB8FB58[a3];
      }
      v6 = 3348380076;
    }
    if (v5 != v6)
      return v4;
    return a3 != 3;
  }
  if (v5 <= 1110205731)
  {
    if (v5 != 33245053 && v5 != 741626682)
      return v4;
LABEL_19:
    if (a3 == 3)
      return 1;
    else
      return 2;
  }
  switch(v5)
  {
    case 1110205732:
      goto LABEL_19;
    case 1114644381:
      goto LABEL_23;
    case 1540760353:
      return 2 * (a3 != 3);
  }
  return v4;
}

- (void)handleResidentMeshInitialized:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  os_unfair_lock_lock_with_options();
  v4 = -[HMDCameraRecordingLoadBalancer numberOfActiveRecordingSessions](self, "numberOfActiveRecordingSessions");
  os_unfair_lock_unlock(&self->_lock);
  -[HMDCameraRecordingLoadBalancer homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentMesh");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("numberOfActiveRecordingSessions"), v7, 0);

  -[HMDCameraRecordingLoadBalancer _updateReadyToRecordMetric](self, "_updateReadyToRecordMetric");
  -[HMDCameraRecordingLoadBalancer systemResourceUsageMonitor](self, "systemResourceUsageMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getCurrentSystemResourceUsage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingLoadBalancer systemResourceUsageDidChangeTo:](self, "systemResourceUsageDidChangeTo:", objc_msgSend(v9, "systemResourceUsageLevel"));

}

- (void)systemResourceUsageDidChangeTo:(int64_t)a3
{
  void *v5;
  HMDCameraRecordingLoadBalancer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    systemResourceUsageLevelAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating resource usage to %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraRecordingLoadBalancer homeManager](v6, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "residentMesh");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDCameraRecordingLoadBalancer _jobSlotsWithSystemResourceUsageLevel:](v6, "_jobSlotsWithSystemResourceUsageLevel:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("numberOfFullJobSlots"), v13, 0);

  v14 = -[HMDCameraRecordingLoadBalancer _partialJobSlotsWithSystemResourceUsageLevel:](v6, "_partialJobSlotsWithSystemResourceUsageLevel:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("numberOfPartialJobSlots"), v15, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetricForCurrentDevice:withValue:isUrgent:", CFSTR("systemResourceUsageLevel"), v16, a3 == 3);

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (HMISystemResourceUsageMonitor)systemResourceUsageMonitor
{
  return (HMISystemResourceUsageMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)recordingSessionSummariesByCameraUUIDString
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)readyToRecordByCameraUUIDString
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)decisionsByCameraUUIDByDeviceUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)lastDecisionByCameraUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)numberOfActiveRecordingSessions
{
  return self->_numberOfActiveRecordingSessions;
}

- (void)setNumberOfActiveRecordingSessions:(unint64_t)a3
{
  self->_numberOfActiveRecordingSessions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDecisionByCameraUUID, 0);
  objc_storeStrong((id *)&self->_decisionsByCameraUUIDByDeviceUUID, 0);
  objc_storeStrong((id *)&self->_readyToRecordByCameraUUIDString, 0);
  objc_storeStrong((id *)&self->_recordingSessionSummariesByCameraUUIDString, 0);
  objc_storeStrong((id *)&self->_systemResourceUsageMonitor, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

id __75__HMDCameraRecordingLoadBalancer__loadBalancingDescriptionFromSortedNodes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
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
  void *v18;

  v2 = a2;
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v6, "removeObject:", &stru_1E89C3E38);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "residentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "productInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "productClass");
  HMFProductClassToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("   ([%@] device: %@ / metrics: %@)"), v12, v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  BOOL v64;
  BOOL v65;
  BOOL v66;
  BOOL v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v8, "residentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "residentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "device");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v13;
  objc_msgSend(v13, "device");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmf_numberForKey:", CFSTR("numberOfActiveRecordingSessions"));
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmf_numberForKey:", CFSTR("numberOfActiveRecordingSessions"));
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = &unk_1E8B35220;
  if (v15)
    v19 = (void *)v15;
  else
    v19 = &unk_1E8B35220;
  if (v17)
    v18 = (void *)v17;
  v94 = v18;
  v95 = v19;
  objc_msgSend(v8, "metrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hmf_dictionaryForKey:", CFSTR("recordingSessionSummaries"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hmf_dictionaryForKey:", CFSTR("recordingSessionSummaries"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hmf_numberForKey:", CFSTR("systemResourceUsageLevel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = v23;
  if (v23)
    v90 = objc_msgSend(v23, "integerValue");
  else
    v90 = 0;
  objc_msgSend(v11, "metrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmf_numberForKey:", CFSTR("systemResourceUsageLevel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = v12;
  if (v25)
    v89 = objc_msgSend(v25, "integerValue");
  else
    v89 = 0;
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28 || v90 >= 3)
  {
    if (v31 && v89 < 3)
    {
      v32 = 1;
      goto LABEL_31;
    }
    v88 = v5;
    objc_msgSend(v97, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "hmf_isEqualToUUID:", v34);

    if (v35 && v90 < 3)
    {
      v32 = -1;
LABEL_30:
      v5 = v88;
      goto LABEL_31;
    }
    objc_msgSend(v96, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "hmf_isEqualToUUID:", v37);

    if (v38 && v89 < 3)
    {
      v32 = 1;
      goto LABEL_30;
    }
    objc_msgSend(v8, "metrics");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hmf_numberForKey:", CFSTR("numberOfFullJobSlots"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "metrics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "hmf_numberForKey:", CFSTR("numberOfFullJobSlots"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "metrics");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hmf_numberForKey:", CFSTR("numberOfPartialJobSlots"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "metrics");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "hmf_numberForKey:", CFSTR("numberOfPartialJobSlots"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v88;
    v84 = v44;
    v87 = v46;
    if (v44 && v46)
    {
      v49 = objc_msgSend(v44, "integerValue", v44);
      v50 = v49 - objc_msgSend(v95, "integerValue");
      v51 = objc_msgSend(v46, "integerValue");
      v52 = objc_msgSend(v94, "integerValue");
      if (v28)
        v53 = v50 + 1;
      else
        v53 = v50;
      if (v31)
        v54 = v51 - v52 + 1;
      else
        v54 = v51 - v52;
      if (v53 >= 1 && v53 > v54)
      {
        v32 = -1;
        v39 = v91;
LABEL_44:
        v41 = v97;
LABEL_69:
        v40 = v96;
LABEL_70:
        v63 = v87;
LABEL_71:

        goto LABEL_32;
      }
      v41 = v97;
      if (v54 <= v53 || v54 <= 0)
      {
        if (v53 > 0 || v54 > 0 || !v86 || !v85)
        {
LABEL_72:
          v39 = v91;
          v40 = v96;
          v63 = v87;
          if (v90)
          {
            v64 = !v89 && v90 < 3;
            v65 = v64;
            v32 = -1;
            if (v90 < v89 || v65)
              goto LABEL_71;
          }
          if (v89)
          {
            v66 = !v90 && v89 < 3;
            v67 = v66;
            v32 = 1;
            if (v90 > v89 || v67)
              goto LABEL_71;
          }
          v32 = objc_msgSend(v95, "compare:", v94, v84);
          if (v32)
            goto LABEL_71;
          if ((objc_msgSend(v41, "isCurrentDevice") & 1) != 0)
          {
            v32 = 1;
            goto LABEL_71;
          }
          if ((objc_msgSend(v96, "isCurrentDevice") & 1) != 0)
          {
            v32 = -1;
            goto LABEL_71;
          }
          objc_msgSend(v41, "productInfo");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "productClass");
          objc_msgSend(v96, "productInfo");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "productClass");

          if (v69 == v71)
            goto LABEL_96;
          v41 = v97;
          objc_msgSend(v97, "productInfo");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "productClass");

          if (v77 == 4)
            goto LABEL_102;
          objc_msgSend(v96, "productInfo");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "productClass");

          if (v79 == 4)
          {
            v32 = 1;
            goto LABEL_69;
          }
          objc_msgSend(v97, "productInfo");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "productClass");

          if (v81 == 3)
          {
LABEL_102:
            v32 = -1;
            goto LABEL_69;
          }
          objc_msgSend(v96, "productInfo");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "productClass");

          if (v83 != 3)
          {
LABEL_96:
            objc_msgSend(v96, "version");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v97;
            objc_msgSend(v97, "version");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v72, "compare:", v73);

            v40 = v96;
            v63 = v87;
            if (v32)
              goto LABEL_71;
            objc_msgSend(v97, "identifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "identifier");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v74, "compare:", v75);

            v40 = v96;
            goto LABEL_70;
          }
          v32 = 1;
          goto LABEL_44;
        }
        v58 = objc_msgSend(v86, "integerValue") + v53;
        v59 = objc_msgSend(v85, "integerValue") + v54;
        if (v58 < 1 || v58 <= v59)
        {
          if (v59 <= v58 || v59 < 1)
            goto LABEL_72;
          goto LABEL_67;
        }
LABEL_50:
        v32 = -1;
LABEL_68:
        v39 = v91;
        goto LABEL_69;
      }
    }
    else
    {
      if (v44)
      {
        v55 = objc_msgSend(v44, "integerValue", v44);
        v56 = objc_msgSend(v95, "integerValue");
        if (v28)
          v57 = v55 + 1;
        else
          v57 = v55;
        v41 = v97;
        if (v57 - v56 < 1)
          goto LABEL_72;
        goto LABEL_50;
      }
      v41 = v97;
      if (!v46)
        goto LABEL_72;
      v60 = objc_msgSend(v46, "integerValue", v84);
      v61 = objc_msgSend(v94, "integerValue");
      v62 = v31 ? v60 + 1 : v60;
      if (v62 - v61 <= 0)
        goto LABEL_72;
    }
LABEL_67:
    v32 = 1;
    goto LABEL_68;
  }
  v32 = -1;
LABEL_31:
  v39 = v91;
  v40 = v96;
  v41 = v97;
LABEL_32:

  return v32;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readyToRecordByCameraUUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "BOOLValue"))
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "residentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10) ^ 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

HMDCameraRecordingAnalysisNode *__79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraRecordingAnalysisNode *v28;
  void *v29;
  HMDCameraRecordingAnalysisNode *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decisionsByCameraUUIDByDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmf_dictionaryForKey:", CFSTR("recordingSessionSummaries"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA70];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_4;
  v32[3] = &unk_1E89C0A48;
  v15 = v13;
  v33 = v15;
  v16 = v14;
  v34 = v16;
  v35 = &v36;
  objc_msgSend(v8, "na_each:", v32);
  objc_msgSend(v3, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("numberOfActiveRecordingSessions"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &unk_1E8B35220;
  if (v18)
    v20 = (void *)v18;
  v21 = v20;

  v22 = (void *)MEMORY[0x1E0CB37E8];
  v23 = objc_msgSend(v21, "intValue");
  objc_msgSend(v22, "numberWithInt:", (*((_DWORD *)v37 + 6) + v23));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, CFSTR("numberOfActiveRecordingSessions"));
  v27 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("recordingSessionSummaries"));

  v28 = [HMDCameraRecordingAnalysisNode alloc];
  objc_msgSend(v3, "residentDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HMDCameraRecordingAnalysisNode initWithResidentDevice:metrics:](v28, "initWithResidentDevice:metrics:", v29, v26);

  _Block_object_dispose(&v36, 8);
  return v30;
}

void __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v3 = a2;
  objc_msgSend(v3, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("numberOfActiveRecordingSessions"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &unk_1E8B35220;
  v21 = v7;

  objc_msgSend(v3, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_numberForKey:", CFSTR("numberOfFullJobSlots"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &unk_1E8B35220;
  v12 = v11;

  v13 = objc_msgSend(v12, "integerValue");
  v14 = v13 - objc_msgSend(v21, "integerValue");
  LODWORD(v13) = objc_msgSend(v12, "integerValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v13;
  objc_msgSend(v3, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "hmf_dictionaryForKey:", CFSTR("recordingSessionSummaries"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v14 + 1;
  else
    v20 = v14;
  if (v20 >= 1)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v20;

}

void __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v9 = v3;
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)a1[5];
    objc_msgSend(v9, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], v8);

    ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

uint64_t __62__HMDCameraRecordingLoadBalancer_removeDataForCameraWithUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_177828 != -1)
    dispatch_once(&logCategory__hmf_once_t19_177828, &__block_literal_global_44_177829);
  return (id)logCategory__hmf_once_v20_177830;
}

void __45__HMDCameraRecordingLoadBalancer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_177830;
  logCategory__hmf_once_v20_177830 = v0;

}

@end
