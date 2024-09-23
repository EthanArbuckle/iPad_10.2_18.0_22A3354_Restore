@implementation HMDHomeAudioAnalysisStereoPairController

- (HMDHomeAudioAnalysisStereoPairController)init
{
  HMDHomeAudioAnalysisStereoPairController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDHomeAudioAnalysisStereoPairController;
  result = -[HMDHomeAudioAnalysisStereoPairController init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)compareOrUpdateRecentAudioAnalysisStereoPairEvent:(id)a3 key:(id)a4 accessory:(id)a5 notificationUUID:(id)a6 window:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *audioAnalysisStereoPairDetectedEventsMap;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  HMDHomeAudioAnalysisStereoPairController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDHomeAudioAnalysisStereoPairController *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDHomeAudioAnalysisStereoPairController *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  HMDHomeAudioAnalysisStereoPairController *v49;
  NSObject *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  os_unfair_lock_t lock;
  id v56;
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v56 = a5;
  v57 = a6;
  v16 = a8;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  audioAnalysisStereoPairDetectedEventsMap = self->_audioAnalysisStereoPairDetectedEventsMap;
  if (!audioAnalysisStereoPairDetectedEventsMap)
  {
    v18 = (NSMutableDictionary *)objc_opt_new();
    v19 = self->_audioAnalysisStereoPairDetectedEventsMap;
    self->_audioAnalysisStereoPairDetectedEventsMap = v18;

    audioAnalysisStereoPairDetectedEventsMap = self->_audioAnalysisStereoPairDetectedEventsMap;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](audioAnalysisStereoPairDetectedEventsMap, "objectForKeyedSubscript:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_msgSend(v14, "state");
    objc_msgSend(v20, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "state");

    if (v21 == v23)
    {
      objc_msgSend(v14, "accessoryIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "event");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "accessoryIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "isEqual:", v26);

      if (v27)
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v31;
          v60 = 2112;
          v61 = v15;
          v62 = 2112;
          v63 = v14;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, sequential event from accessory", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(v20, "accessory");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "notificationUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeAudioAnalysisStereoPairController updateAudioAnalysisStereoPairDetectedEvent:key:accessory:notificationUUID:completion:](v29, "updateAudioAnalysisStereoPairDetectedEvent:key:accessory:notificationUUID:completion:", v14, v15, v32, v33, v16);
        goto LABEL_15;
      }
      objc_msgSend(v14, "dateOfOccurrence");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "event");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "dateOfOccurrence");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceDate:", v45);
      v47 = v46;

      if (v47 < 0.0)
        v47 = -v47;
      v48 = (void *)MEMORY[0x227676638]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v51 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v51;
        v60 = 2112;
        v61 = v52;
        v62 = 2112;
        v63 = v15;
        _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_DEBUG, "%{public}@latency:%@ key:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v48);
      if (v47 < (double)a7)
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v16 + 2))(v16, 0, 0, 0);
        goto LABEL_16;
      }
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v49;
      HMFGetOSLogHandle();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v59 = v53;
        v60 = 2112;
        v61 = v15;
        v62 = 2112;
        v63 = v14;
        v64 = 2112;
        v65 = v54;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, latency:%@", buf, 0x2Au);

      }
    }
    else
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "state"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v59 = v41;
        v60 = 2112;
        v61 = v15;
        v62 = 2112;
        v63 = v14;
        v64 = 2112;
        v65 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, new state:%@", buf, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v38);
    objc_msgSend(v20, "accessory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "notificationUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeAudioAnalysisStereoPairController updateAudioAnalysisStereoPairDetectedEvent:key:accessory:notificationUUID:completion:](v39, "updateAudioAnalysisStereoPairDetectedEvent:key:accessory:notificationUUID:completion:", v14, v15, v32, v33, v16);
LABEL_15:

    goto LABEL_16;
  }
  v34 = (void *)MEMORY[0x227676638]();
  v35 = self;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v37;
    v60 = 2112;
    v61 = v15;
    v62 = 2112;
    v63 = v14;
    _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Adding:%@ event:%@, first known event", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v34);
  -[HMDHomeAudioAnalysisStereoPairController updateAudioAnalysisStereoPairDetectedEvent:key:accessory:notificationUUID:completion:](v35, "updateAudioAnalysisStereoPairDetectedEvent:key:accessory:notificationUUID:completion:", v14, v15, v56, v57, v16);
LABEL_16:

  os_unfair_lock_unlock(lock);
}

- (void)updateAudioAnalysisStereoPairDetectedEvent:(id)a3 key:(id)a4 accessory:(id)a5 notificationUUID:(id)a6 completion:(id)a7
{
  void (**v12)(id, uint64_t, id, id);
  id v13;
  id v14;
  id v15;
  id v16;
  HMAudioAnalysisStereoPairDetectedEvent *v17;

  v12 = (void (**)(id, uint64_t, id, id))a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[HMAudioAnalysisStereoPairDetectedEvent initWithEventBulletin:accessory:notificationUUID:]([HMAudioAnalysisStereoPairDetectedEvent alloc], "initWithEventBulletin:accessory:notificationUUID:", v16, v14, v13);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioAnalysisStereoPairDetectedEventsMap, "setObject:forKeyedSubscript:", v17, v15);
  v12[2](v12, 1, v14, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAnalysisStereoPairDetectedEventsMap, 0);
}

@end
