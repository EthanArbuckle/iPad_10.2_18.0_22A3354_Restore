@implementation HMDCameraClipImporter

- (HMDCameraClipImporter)initWithLocalZone:(id)a3 cameraProfileUUID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCameraClipImporter *v10;
  HMDCameraClipImporter *v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  void *v16;
  uint64_t v17;
  NSString *logIdentifier;
  HMDCameraClipImporter *v20;
  SEL v21;
  id v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v20 = (HMDCameraClipImporter *)_HMFPreconditionFailure();
    return (HMDCameraClipImporter *)-[HMDCameraClipImporter importClipsWithImportData:](v20, v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraClipImporter;
  v10 = -[HMDCameraClipImporter init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_localZone, a3);
    v12 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v11->_logIdentifier;
    v11->_logIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v11->_cameraProfileUUID, a4);
  }

  return v11;
}

- (id)importClipsWithImportData:(id)a3
{
  id v4;
  void *v5;
  HMDCameraClipImporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  HMDCameraClipUploader *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  HMDCameraClipImporter *v53;
  void *v54;
  HMDCameraClipImporter *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  HMDCameraClipImporter *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  void *v79;
  void *v80;
  uint64_t v81;
  HMDCameraClipImporter *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[5];
  id v90;
  void *v91;
  id v92;
  double v93;
  _QWORD v94[5];
  id v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  HMDCameraClipImporter *v104;
  id v105;
  _QWORD v106[4];
  id v107;
  HMDCameraClipImporter *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v75 = v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v115 = v8;
    v116 = 2112;
    v117 = v75;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Importing clips using import data: %@", buf, 0x16u);

    v4 = v75;
  }

  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "na_map:", &__block_literal_global_205492);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE6B628];
  -[HMDCameraClipImporter workQueue](v6, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "schedulerWithDispatchQueue:", v11);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v111;
    v82 = v6;
    v76 = *(_QWORD *)v111;
    do
    {
      v15 = 0;
      v77 = v13;
      do
      {
        if (*(_QWORD *)v111 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v15);
        objc_msgSend(v16, "videoSegments");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isHeader");

        if ((v19 & 1) != 0)
        {
          v20 = [HMDCameraClipUploader alloc];
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "targetFragmentDuration");
          v24 = v23;
          -[HMDCameraClipImporter localZone](v6, "localZone");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraClipImporter workQueue](v6, "workQueue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraClipImporter logIdentifier](v82, "logIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[HMDCameraClipUploader initWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:](v20, "initWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:", v21, v22, 0, v25, v26, v27, v24);

          v6 = v82;
          v29 = (void *)v28;

          objc_msgSend(v16, "posterFrames");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v32 = (void *)MEMORY[0x24BE6B608];
            v106[0] = MEMORY[0x24BDAC760];
            v106[1] = 3221225472;
            v106[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_31;
            v106[3] = &unk_24E7919B0;
            v107 = v31;
            v108 = v82;
            v109 = v29;
            objc_msgSend(v32, "lazyFutureWithBlock:scheduler:", v106, v86);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "addObject:", v33);

          }
          objc_msgSend(v16, "posterFrames");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            v36 = (void *)MEMORY[0x24BE6B608];
            v102[0] = MEMORY[0x24BDAC760];
            v102[1] = 3221225472;
            v102[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_36;
            v102[3] = &unk_24E7919B0;
            v103 = v35;
            v104 = v82;
            v105 = v29;
            objc_msgSend(v36, "lazyFutureWithBlock:scheduler:", v102, v86);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "addObject:", v37);

          }
          v79 = v35;
          v80 = v31;
          v84 = v29;
          v81 = v15;
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          objc_msgSend(v16, "videoSegments");
          v83 = (id)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v99;
            v41 = 0.0;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v99 != v40)
                  objc_enumerationMutation(v83);
                v43 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
                v44 = (void *)MEMORY[0x24BDBCE50];
                objc_msgSend(v43, "resourcePath");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = 0;
                objc_msgSend(v44, "dataWithContentsOfFile:options:error:", v45, 0, &v97);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v97;

                if (v46)
                {
                  v48 = objc_msgSend(v43, "isHeader");
                  v49 = (void *)MEMORY[0x24BE6B608];
                  if (v48)
                  {
                    v94[0] = MEMORY[0x24BDAC760];
                    v94[1] = 3221225472;
                    v94[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_37;
                    v94[3] = &unk_24E7919B0;
                    v94[4] = v6;
                    v95 = v46;
                    v96 = v84;
                    objc_msgSend(v49, "lazyFutureWithBlock:scheduler:", v94, v86);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "addObject:", v50);

                    v51 = v95;
                  }
                  else
                  {
                    v89[0] = MEMORY[0x24BDAC760];
                    v89[1] = 3221225472;
                    v89[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_38;
                    v89[3] = &unk_24E7919D8;
                    v89[4] = v6;
                    v90 = v46;
                    v91 = v43;
                    v92 = v84;
                    v93 = v41;
                    objc_msgSend(v49, "lazyFutureWithBlock:scheduler:", v89, v86);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "addObject:", v59);

                    objc_msgSend(v43, "duration");
                    v41 = v41 + v60;

                    v51 = v90;
                  }

                }
                else
                {
                  v52 = MEMORY[0x227676638]();
                  v53 = v6;
                  v54 = (void *)v52;
                  v55 = v53;
                  HMFGetOSLogHandle();
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "resourcePath");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v115 = v57;
                    v116 = 2112;
                    v117 = v58;
                    v118 = 2112;
                    v119 = v47;
                    _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Could not load data from %@: %@", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v54);
                  v6 = v82;
                }

              }
              v39 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
            }
            while (v39);
          }

          v61 = (void *)MEMORY[0x24BE6B608];
          v87[0] = MEMORY[0x24BDAC760];
          v87[1] = 3221225472;
          v87[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_39;
          v87[3] = &unk_24E7943C8;
          v88 = v84;
          v62 = v84;
          objc_msgSend(v61, "lazyFutureWithBlock:scheduler:", v87, v86);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "addObject:", v63);

          v14 = v76;
          v13 = v77;
          v15 = v81;
        }
        else
        {
          v64 = (void *)MEMORY[0x227676638]();
          v65 = v6;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "videoSegments");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "firstObject");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "resourcePath");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v115 = v67;
            v116 = 2112;
            v117 = v70;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@First fragment in clip %@ is not header, skipping", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v64);
          v6 = v82;
        }
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
    }
    while (v13);
  }

  v71 = (void *)MEMORY[0x24BE6B608];
  v72 = (void *)objc_msgSend(v85, "copy");
  objc_msgSend(v71, "chainFutures:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  return v73;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_31(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDMutableCameraRecordingSessionSignificantEvent *v14;
  void *v15;
  HMDMutableCameraRecordingSessionSignificantEvent *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(a1[4], "resourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[5];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "length");
      objc_msgSend(a1[4], "resourcePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Loaded %lu bytes of hero frame data from %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = [HMDMutableCameraRecordingSessionSignificantEvent alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:](v14, "initWithUUID:", v15);

    -[HMDCameraRecordingSessionSignificantEvent setReason:](v16, "setReason:", 2);
    -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v16, "setConfidenceLevel:", 100);
    -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v16, "setHeroFrameData:", v6);
    objc_msgSend(a1[6], "addNotificationForSignificantEvent:homePresenceByPairingIdentity:", v16, MEMORY[0x24BDBD1B8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completionHandlerAdapter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v18);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "resourcePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = (uint64_t)v21;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not load data from %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
    v16 = (HMDMutableCameraRecordingSessionSignificantEvent *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v16);
  }

}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_36(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDMutableCameraRecordingSessionSignificantEvent *v14;
  void *v15;
  HMDMutableCameraRecordingSessionSignificantEvent *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(a1[4], "resourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[5];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "length");
      objc_msgSend(a1[4], "resourcePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Loaded %lu bytes of hero frame data from %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = [HMDMutableCameraRecordingSessionSignificantEvent alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:](v14, "initWithUUID:", v15);

    -[HMDCameraRecordingSessionSignificantEvent setReason:](v16, "setReason:", 3);
    -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v16, "setConfidenceLevel:", 100);
    -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v16, "setHeroFrameData:", v6);
    objc_msgSend(a1[6], "addNotificationForSignificantEvent:homePresenceByPairingIdentity:", v16, MEMORY[0x24BDBD1B8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completionHandlerAdapter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v18);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "resourcePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = (uint64_t)v21;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not load data from %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
    v16 = (HMDMutableCameraRecordingSessionSignificantEvent *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v16);
  }

}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_37(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Found new video init data: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(a1[6], "addVideoInitData:", a1[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v10);

}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 40), "length");
    objc_msgSend(*(id *)(a1 + 48), "resourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Loaded %lu bytes from %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "duration");
  objc_msgSend(v10, "addVideoSegmentData:duration:timeOffsetWithinClip:clipFinalizedBecauseMaxDurationExceeded:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "addCompletionBlock:", v13);

}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_39(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "finish");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v6, "addCompletionBlock:", v4);
}

id __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[HMDCameraClipImportMetadata initClipData:]([HMDCameraClipImportMetadata alloc], "initClipData:", v2);

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_205620 != -1)
    dispatch_once(&logCategory__hmf_once_t9_205620, &__block_literal_global_41_205621);
  return (id)logCategory__hmf_once_v10_205622;
}

void __36__HMDCameraClipImporter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_205622;
  logCategory__hmf_once_v10_205622 = v0;

}

@end
