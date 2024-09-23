@implementation HMDMPCSessionController

- (HMDMPCSessionController)initWithLogEventSubmitter:(id)a3
{
  id v5;
  HMDMPCSessionController *v6;
  NSOperationQueue *v7;
  NSOperationQueue *speakerGroupCommandOperationQueue;
  NSOperationQueue *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMPCSessionController;
  v6 = -[HMDMPCSessionController init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    -[NSOperationQueue setName:](v7, "setName:", CFSTR("HMDMPCSessionControllerOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v7, "setMaxConcurrentOperationCount:", 5);
    -[NSOperationQueue setQualityOfService:](v7, "setQualityOfService:", 25);
    speakerGroupCommandOperationQueue = v6->_speakerGroupCommandOperationQueue;
    v6->_speakerGroupCommandOperationQueue = v7;
    v9 = v7;

    objc_storeStrong((id *)&v6->_logEventSubmitter, a3);
  }

  return v6;
}

- (void)executeSessionWithSessionData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDMPCSessionControllerExecutionEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  HMDMPCSessionController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDMPCSessionController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDMPCSessionController *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  float v43;
  float v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  id v51;
  __CFString *v52;
  void *v53;
  _BOOL8 v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  __CFString *v62;
  HMDMPCResolveDestinationOperation *v63;
  void *v64;
  void *v65;
  HMDMPCResolveDestinationOperation *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  HMDMPCSessionController *v76;
  id v77;
  void *v78;
  void (**v79)(void *, void *);
  void *v80;
  void *v81;
  HMDMPCSessionController *v82;
  void *v83;
  void *v84;
  __CFString *v85;
  id obj;
  id obja;
  id objb;
  HMDMPCSessionController *val;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  HMDMPCSessionController *v98;
  void (**v99)(void *, void *);
  id v100;
  _QWORD aBlock[4];
  id v102;
  HMDMPCSessionController *v103;
  HMDMPCSessionController *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t v111[4];
  void *v112;
  __int16 v113;
  void *v114;
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  obj = a4;
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("HMDMPCSessionCreation"));
  v82 = self;
  v80 = v6;
  if (self)
  {
    v7 = v6;
    objc_msgSend(v7, "mediaProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_254959);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [HMDMPCSessionControllerExecutionEvent alloc];
    objc_msgSend(v7, "playbackArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackStateNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackVolumeNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMDMediaPlaybackActionEvent initWithIsPlaybackArchivePresent:playbackStateNumber:volumeNumber:sourceNumber:sourceClientName:accessories:](v10, "initWithIsPlaybackArchivePresent:playbackStateNumber:volumeNumber:sourceNumber:sourceClientName:accessories:", v11 != 0, v12, v13, v14, v15, v16);

  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x227676638]();
  val = v82;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v116 = v19;
    v117 = 2112;
    v118 = v78;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Running MPC media session with sessionUUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke;
  aBlock[3] = &unk_24E79C0D0;
  v77 = v84;
  v102 = v77;
  v103 = val;
  v76 = self;
  v104 = v76;
  v75 = obj;
  v105 = v75;
  v79 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v80, "mediaProfiles");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v81 = v20;
  if (v82)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    obja = v81;
    self = (HMDMPCSessionController *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, buf, 16);
    if (self)
    {
      v21 = *(_QWORD *)v107;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v107 != v21)
            objc_enumerationMutation(obja);
          v23 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)v22);
          objc_msgSend(v23, "accessory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24 && objc_msgSend(v24, "providesHashRouteID"))
          {
            objc_msgSend(v25, "hashRouteID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(v83, "addObject:", v26);
            }
            else
            {
              v31 = (void *)MEMORY[0x227676638]();
              v32 = val;
              HMFGetOSLogHandle();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v111 = 138543618;
                v112 = v34;
                v113 = 2112;
                v114 = v23;
                _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil hashed route id for media profile: %@", v111, 0x16u);

              }
              objc_autoreleasePoolPop(v31);
            }

          }
          else
          {
            v27 = (void *)MEMORY[0x227676638]();
            v28 = val;
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v111 = 138543618;
              v112 = v30;
              v113 = 2112;
              v114 = v23;
              _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@No hashed route id for media profile: %@", v111, 0x16u);

            }
            objc_autoreleasePoolPop(v27);
          }

          v22 = (HMDMPCSessionController *)((char *)v22 + 1);
        }
        while (self != v22);
        self = (HMDMPCSessionController *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, buf, 16);
      }
      while (self);
    }

    v35 = (void *)objc_msgSend(v83, "copy");
  }
  else
  {
    v35 = 0;
  }
  v36 = v82 == 0;

  v37 = v35;
  v38 = v80;
  if (!v82)
    goto LABEL_47;
  if (!objc_msgSend(v37, "count"))
    goto LABEL_36;
  objc_msgSend(v38, "playbackStateNumber");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {

    goto LABEL_30;
  }
  objc_msgSend(v38, "playbackVolumeNumber");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (v41)
  {
LABEL_36:
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 8, CFSTR("No action to take or hashed routes"));
    v45 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
LABEL_30:
  objc_msgSend(v38, "playbackVolumeNumber");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(v38, "playbackVolumeNumber");
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v36, "floatValue");
    if (v43 > 100.0)
    {
LABEL_34:

LABEL_35:
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 3, CFSTR("Volume or state invalid"));
      v45 = objc_claimAutoreleasedReturnValue();
LABEL_37:
      v46 = (void *)v45;
      goto LABEL_48;
    }
    objc_msgSend(v38, "playbackVolumeNumber");
    self = (HMDMPCSessionController *)objc_claimAutoreleasedReturnValue();
    -[HMDMPCSessionController floatValue](self, "floatValue");
    if (v44 < -0.00000011921)
    {

      goto LABEL_34;
    }
  }
  objc_msgSend(v38, "playbackStateNumber");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    if (v42)
    {
LABEL_46:

      goto LABEL_47;
    }
    goto LABEL_42;
  }
  objc_msgSend(v38, "playbackStateNumber");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "integerValue") == 1)
  {
    v49 = v42 == 0;

    goto LABEL_45;
  }
  objc_msgSend(v38, "playbackStateNumber");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "integerValue") == 2)
  {
    v49 = v42 == 0;

LABEL_45:
    if (!v49)
      goto LABEL_46;
LABEL_42:

    goto LABEL_47;
  }
  objc_msgSend(v38, "playbackStateNumber");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "integerValue");

  if (v42)
  {

    if (v74 != 3)
      goto LABEL_35;
  }
  else if (v74 != 3)
  {
    goto LABEL_35;
  }
LABEL_47:
  v46 = 0;
LABEL_48:

  if (v46)
  {
    v79[2](v79, v46);
    goto LABEL_67;
  }
  objc_msgSend(v77, "markWithReason:", CFSTR("Find Destination"));
  objc_initWeak((id *)buf, val);
  v94[0] = MEMORY[0x24BDAC760];
  v94[1] = 3221225472;
  v94[2] = __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke_2;
  v94[3] = &unk_24E79C0F8;
  objc_copyWeak(&v100, (id *)buf);
  v95 = v78;
  v99 = v79;
  v96 = v77;
  v51 = v38;
  v97 = v51;
  v98 = v76;
  objb = _Block_copy(v94);
  v52 = CFSTR("com.apple.Music");
  objc_msgSend(v51, "playbackArchive");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = 1;
  }
  else
  {
    objc_msgSend(v51, "playbackStateNumber");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v55, "integerValue") == 1;

  }
  objc_msgSend(v51, "playbackArchive");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56 == 0;

  if (v57)
  {
    v85 = 0;
    v62 = CFSTR("com.apple.Music");
    v61 = 1;
LABEL_58:

    goto LABEL_59;
  }
  objc_msgSend(v51, "playbackArchive");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bundleIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "hasPrefix:", CFSTR("com.apple.Music"));

  if ((v60 & 1) == 0)
  {
    objc_msgSend(v51, "playbackArchive");
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString bundleIdentifier](v62, "bundleIdentifier");
    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v61 = 2;
    goto LABEL_58;
  }
  v61 = 0;
  v85 = CFSTR("com.apple.Music");
LABEL_59:
  v63 = [HMDMPCResolveDestinationOperation alloc];
  objc_msgSend(v51, "playbackArchive");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bundleIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[HMDMPCResolveDestinationOperation initWithHashedRouteIDs:mediaApplicationDestination:mediaApplicationIdentifier:forceSingleGroup:completion:](v63, "initWithHashedRouteIDs:mediaApplicationDestination:mediaApplicationIdentifier:forceSingleGroup:completion:", v37, v61, v65, v54, objb);

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[HMDMPCSessionController speakerGroupCommandOperationQueue](val, "speakerGroupCommandOperationQueue");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "operations");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
  if (v69)
  {
    v70 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v91 != v70)
          objc_enumerationMutation(v68);
        -[HMDMPCResolveDestinationOperation addDependency:](v66, "addDependency:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i));
      }
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
    }
    while (v69);
  }

  -[HMDMPCSessionController speakerGroupCommandOperationQueue](val, "speakerGroupCommandOperationQueue");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addOperation:", v66);

  objc_destroyWeak(&v100);
  objc_destroyWeak((id *)buf);
LABEL_67:

}

- (NSOperationQueue)speakerGroupCommandOperationQueue
{
  return self->_speakerGroupCommandOperationQueue;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_speakerGroupCommandOperationQueue, 0);
}

uint64_t __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "markWithReason:", CFSTR("Call completion"));
  objc_msgSend(*(id *)(a1 + 40), "logEventSubmitter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitLogEvent:error:", *(_QWORD *)(a1 + 48), v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __68__HMDMPCSessionController_executeSessionWithSessionData_completion___block_invoke_2(id *a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(void *, HMDMPCSendMRCommandOperation *);
  void *v16;
  void *v17;
  HMDMPCSendMRCommandOperation *v18;
  HMDMRSetEndpointVolumeOperation *v19;
  void *v20;
  HMDMRSetEndpointVolumeOperation *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  HMDMPCSendMRCommandOperation *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *context;
  id v54;
  id v55;
  id *v56;
  id v57;
  id val;
  id from;
  id location[2];
  _BYTE aBlock[24];
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE buf[24];
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75[5];

  v75[2] = *(id *)MEMORY[0x24BDAC8D0];
  v57 = a2;
  val = objc_loadWeakRetained(a1 + 9);
  if (v57)
  {
    objc_msgSend(a1[5], "markWithReason:", CFSTR("Generate MR Command Operations"));
    v56 = a1;
    v3 = a1 + 6;
    objc_msgSend(a1[6], "playbackArchive");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "playbackVolumeNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "playbackStateNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v56[4];
    v54 = v57;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    if (!val)
    {
      v38 = 0;
      goto LABEL_20;
    }
    v11 = (void *)MEMORY[0x24BDBCEB8];
    v12 = v7;
    objc_msgSend(v11, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)aBlock = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock[8] = 3221225472;
    *(_QWORD *)&aBlock[16] = __138__HMDMPCSessionController_generateMRCommandOperationsForDestination_playbackArchive_playbackVolumeNumber_playbackStateNumber_sessionUUID___block_invoke;
    v62 = &unk_24E79C188;
    v14 = v13;
    v63 = v14;
    v15 = (void (**)(void *, HMDMPCSendMRCommandOperation *))_Block_copy(aBlock);
    location[0] = *(id *)MEMORY[0x24BE658C8];
    objc_msgSend(v12, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    location[1] = *(id *)MEMORY[0x24BE658A8];
    *(_QWORD *)&v64 = v16;
    *((_QWORD *)&v64 + 1) = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, location, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v18 = -[HMDMPCSendMRCommandOperation initWithPlaybackArchive:options:destination:]([HMDMPCSendMRCommandOperation alloc], "initWithPlaybackArchive:options:destination:", v8, v17, v54);
      v15[2](v15, v18);

    }
    if (v9)
    {
      v19 = [HMDMRSetEndpointVolumeOperation alloc];
      objc_msgSend(v54, "outputDeviceUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HMDMRSetEndpointVolumeOperation initWithRouteIDs:volume:](v19, "initWithRouteIDs:volume:", v20, v9);

      v15[2](v15, (HMDMPCSendMRCommandOperation *)v21);
    }
    if (!v10)
    {
LABEL_19:
      v38 = (void *)objc_msgSend(v14, "copy", context);

LABEL_20:
      v39 = v56[5];
      v40 = v56[7];
      v41 = v56[8];
      v42 = v38;
      v43 = v40;
      v55 = v39;
      v44 = v41;
      if (val)
      {
        v45 = objc_alloc_init(MEMORY[0x24BE3F148]);
        objc_initWeak(location, v45);
        objc_initWeak(&from, val);
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __112__HMDMPCSessionController_createCompletionOperationForMediaRemoteOperations_executionEvent_activity_completion___block_invoke;
        v69 = &unk_24E79C120;
        objc_copyWeak(&v74, &from);
        objc_copyWeak(v75, location);
        v70 = v55;
        v46 = v42;
        v71 = v46;
        v73 = v44;
        v72 = v43;
        objc_msgSend(v45, "addExecutionBlock:", buf);
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v47 = v46;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, aBlock, 16);
        if (v48)
        {
          v49 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v65 != v49)
                objc_enumerationMutation(v47);
              objc_msgSend(v45, "addDependency:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
            }
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, aBlock, 16);
          }
          while (v48);
        }

        objc_destroyWeak(v75);
        objc_destroyWeak(&v74);
        objc_destroyWeak(&from);
        objc_destroyWeak(location);
      }
      else
      {
        v45 = 0;
      }

      objc_msgSend(v56[5], "markWithReason:", CFSTR("Execute MR Commands"));
      objc_msgSend(val, "speakerGroupCommandOperationQueue");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addOperations:waitUntilFinished:", v42, 0);

      objc_msgSend(val, "speakerGroupCommandOperationQueue");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addOperation:", v45);

      goto LABEL_30;
    }
    v22 = objc_msgSend(v10, "integerValue");
    if ((unint64_t)(v22 - 1) >= 3)
    {
      context = (void *)MEMORY[0x227676638]();
      v32 = val;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v22;
        v35 = (void *)v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unknown HMMediaPlaybackState: %ld", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      v23 = 3;
      if (v8)
        goto LABEL_10;
    }
    else
    {
      v23 = dword_2226A1288[v22 - 1];
      if (v8)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x24BE64D28], "nowPlayingApplicationDestination", context);
        v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v36 = v24;
        v37 = -[HMDMPCSendMRCommandOperation initWithCommand:options:destination:]([HMDMPCSendMRCommandOperation alloc], "initWithCommand:options:destination:", v23, v17, v24);
        v15[2](v15, v37);

        goto LABEL_19;
      }
    }
    v24 = v54;
    goto LABEL_18;
  }
  v25 = a1;
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 2, CFSTR("MPC Session Creation Failed, Unable to resolve destination"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x227676638]();
  v28 = val;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v25[4];
    *(_DWORD *)aBlock = 138543618;
    *(_QWORD *)&aBlock[4] = v30;
    *(_WORD *)&aBlock[12] = 2112;
    *(_QWORD *)&aBlock[14] = v31;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@MPC Session Creation Failed, Unable to resolve destination for sessionUUID: %@", aBlock, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  (*((void (**)(void))v25[8] + 2))();

LABEL_30:
}

void __112__HMDMPCSessionController_createCompletionOperationForMediaRemoteOperations_executionEvent_activity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Pre-Completion"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v34 = v3;
    while (2)
    {
      v8 = WeakRetained;
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v20 = (void *)MEMORY[0x227676638]();
          WeakRetained = v8;
          v21 = v8;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "error");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v40 = v23;
            v41 = 2112;
            v42 = v10;
            v43 = 2112;
            v44 = v24;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@MPC Session Creation Failed at Command (%@) : %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v20);
          v25 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v10, "error");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

          v3 = v34;
          objc_msgSend(v34, "finish");
          goto LABEL_23;
        }
        v12 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        if (v14)
        {
          objc_msgSend(v14, "partialExecutionError");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v27 = (void *)MEMORY[0x227676638]();
            WeakRetained = v8;
            v28 = v8;
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "partialExecutionError");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v40 = v30;
              v41 = 2112;
              v42 = v14;
              v43 = 2112;
              v44 = v31;
              _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@MPC Session Creation Failed at Command (%@) : partial success %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v27);
            objc_msgSend(*(id *)(a1 + 48), "setDidPartiallySucceed:", 1);
            v32 = *(_QWORD *)(a1 + 56);
            objc_msgSend(v14, "partialExecutionError");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v33);

            v3 = v34;
            objc_msgSend(v34, "finish");

LABEL_23:
            goto LABEL_24;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      WeakRetained = v8;
      v3 = v34;
      if (v6)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x227676638]();
  v17 = WeakRetained;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v19;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@MPC Session Created Successfully", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(v3, "finish");
LABEL_24:

}

void __138__HMDMPCSessionController_generateMRCommandOperationsForDestination_playbackArchive_playbackVolumeNumber_playbackStateNumber_sessionUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDependency:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

uint64_t __69__HMDMPCSessionController_createExecutionMetricEventWithSessionData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

@end
