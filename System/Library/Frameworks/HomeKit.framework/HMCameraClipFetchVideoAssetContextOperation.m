@implementation HMCameraClipFetchVideoAssetContextOperation

- (HMCameraClipFetchVideoAssetContextOperation)initWithClipManager:(id)a3 clip:(id)a4
{
  id v6;
  id v7;
  HMCameraClipFetchAssetContextOperationDataSource *v8;
  HMCameraClipFetchVideoAssetContextOperation *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMCameraClipFetchAssetContextOperationDataSource);
  v9 = -[HMCameraClipFetchVideoAssetContextOperation initWithClipManager:clip:dataSource:](self, "initWithClipManager:clip:dataSource:", v7, v6, v8);

  return v9;
}

- (HMCameraClipFetchVideoAssetContextOperation)initWithClipManager:(id)a3 clip:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMCameraClipFetchVideoAssetContextOperation *v13;
  HMCameraClipFetchVideoAssetContextOperation *v14;
  void *v15;
  uint64_t v16;
  HMCameraClipFetchVideoAssetContextOperation *v18;
  SEL v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v18 = (HMCameraClipFetchVideoAssetContextOperation *)_HMFPreconditionFailure();
    return (HMCameraClipFetchVideoAssetContextOperation *)-[HMCameraClipFetchVideoAssetContextOperation description](v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)HMCameraClipFetchVideoAssetContextOperation;
  v13 = -[HMFOperation initWithTimeout:](&v20, sel_initWithTimeout_, 0.0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clipManager, a3);
    objc_storeStrong((id *)&v14->_clip, a4);
    objc_storeStrong((id *)&v14->_dataSource, a5);
    objc_msgSend(v10, "videoDataSegments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v14->_videoDataSegmentsRange.location = 0;
    v14->_videoDataSegmentsRange.length = v16;

    v14->_videoSegmentsDownloadBatchSize = 8;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipFetchVideoAssetContextOperation clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" clip: %@"), v4);

  -[HMCameraClipFetchVideoAssetContextOperation clipDestinationFileURL](self, "clipDestinationFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" clipDestinationFileURL: %@"), v5);

  -[HMCameraClipFetchVideoAssetContextOperation hlsPlaylistDestinationFileURL](self, "hlsPlaylistDestinationFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" hlsPlaylistDestinationFileURL: %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  if ((-[HMCameraClipFetchVideoAssetContextOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[HMCameraClipFetchVideoAssetContextOperation fetchVideoAssetContextCompletionBlock](self, "fetchVideoAssetContextCompletionBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMCameraClipFetchVideoAssetContextOperation fetchVideoAssetContextCompletionBlock](self, "fetchVideoAssetContextCompletionBlock");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v4);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipFetchVideoAssetContextOperation;
  -[HMFOperation cancelWithError:](&v7, sel_cancelWithError_, v4);

}

- (void)finishWithVideoAssetContext:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  if (!-[HMFOperation isFinished](self, "isFinished"))
  {
    -[HMCameraClipFetchVideoAssetContextOperation fetchVideoAssetContextCompletionBlock](self, "fetchVideoAssetContextCompletionBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMCameraClipFetchVideoAssetContextOperation fetchVideoAssetContextCompletionBlock](self, "fetchVideoAssetContextCompletionBlock");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v6)[2](v6, v4, 0);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipFetchVideoAssetContextOperation;
  -[HMFOperation finish](&v7, sel_finish);

}

- (void)main
{
  void *v3;
  HMCameraClipFetchVideoAssetContextOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting fetch video asset context operation: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = __Block_byref_object_copy__21055;
  v17 = __Block_byref_object_dispose__21056;
  v18 = 0;
  -[HMCameraClipFetchVideoAssetContextOperation fetchVideoAssetContext](v4, "fetchVideoAssetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke;
  v14[3] = &unk_1E3AB0248;
  v14[4] = v4;
  v14[5] = buf;
  objc_msgSend(v7, "flatMap:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_2;
  v13[3] = &unk_1E3AB0270;
  v13[4] = v4;
  v13[5] = buf;
  objc_msgSend(v9, "flatMap:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_3;
  v12[3] = &unk_1E3AB0298;
  v12[4] = v4;
  v12[5] = buf;
  v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v12);

  _Block_object_dispose(buf, 8);
}

- (id)fetchVideoAssetContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HMCameraClipFetchVideoAssetContextOperation clipManager](self, "clipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipFetchVideoAssetContextOperation clip](self, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchVideoSegmentsAssetContextForClip:completion:", v5, v6);

  return v3;
}

- (void)updateDownloadProgressToPercentageComplete:(unint64_t)a3
{
  void *v5;
  HMCameraClipFetchVideoAssetContextOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating download progress to %lu", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMCameraClipFetchVideoAssetContextOperation downloadProgressHandler](v6, "downloadProgressHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMCameraClipFetchVideoAssetContextOperation downloadProgressHandler](v6, "downloadProgressHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, a3);

  }
}

- (id)videoSegmentsToDownload
{
  void *v3;
  HMCameraClipFetchVideoAssetContextOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  _UNKNOWN **v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  _UNKNOWN **v25;
  HMCameraClipFetchVideoAssetContextOperation *v26;
  id v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  HMCameraClipFetchVideoAssetContextOperation *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipFetchVideoAssetContextOperation clip](v4, "clip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoSegments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v6;
    v48 = 2112;
    v49 = v8;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Determining video segments to download from all video segments: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[HMCameraClipFetchVideoAssetContextOperation clip](v4, "clip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videoSegments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v12)
  {
    v14 = 0;
    goto LABEL_33;
  }
  v13 = v12;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v42;
  v17 = &off_1E3AAB000;
  do
  {
    v18 = 0;
    v38 = v13;
    do
    {
      if (*(_QWORD *)v42 != v16)
        objc_enumerationMutation(obj);
      v19 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v18);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (!v21)
      {
        v40 = v14;
        v25 = v17;
        v26 = v4;
        v27 = v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v24 = v28;

        if (!v24)
        {
          v4 = v26;
          v17 = v25;
          v14 = v40;
          v13 = v38;
          goto LABEL_29;
        }
        v4 = v26;
        v29 = -[HMCameraClipFetchVideoAssetContextOperation videoDataSegmentsRange](v26, "videoDataSegmentsRange");
        if (v15 < v29)
        {
          v17 = v25;
        }
        else
        {
          v17 = v25;
          if (v15 - v29 < v30)
          {
            v13 = v38;
            if (v40)
            {
              objc_msgSend(v9, "addObject:", v40);

            }
            objc_msgSend(v9, "addObject:", v24);
            v14 = 0;
            goto LABEL_28;
          }
        }
        v14 = v40;
        v13 = v38;
LABEL_28:
        ++v15;
        goto LABEL_29;
      }
      v22 = -[HMCameraClipFetchVideoAssetContextOperation videoDataSegmentsRange](v4, "videoDataSegmentsRange");
      if (v15 < v22 || v15 - v22 >= v23)
      {
        v31 = v19;
        v24 = v14;
        v14 = v31;
      }
      else
      {
        objc_msgSend(v9, "addObject:", v21);
        v24 = v14;
        v14 = 0;
      }
LABEL_29:

      ++v18;
    }
    while (v13 != v18);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v13);
LABEL_33:

  v32 = (void *)MEMORY[0x1A1AC1AAC]();
  v33 = v4;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v35;
    v48 = 2112;
    v49 = v9;
    _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Determined video segments to download: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
  v36 = (void *)objc_msgSend(v9, "copy");

  return v36;
}

- (id)downloadVideoAsset:(id)a3
{
  void *v4;
  HMCameraClipFetchVideoAssetContextOperation *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMCameraClipFetchVideoAssetContextOperation *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void (**v32)(void *, void *, void *);
  uint64_t v33;
  void *v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMCameraClipFetchVideoAssetContextOperation *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  HMCameraClipFetchVideoAssetContextOperation *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMCameraClipFetchVideoAssetContextOperation *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id obj;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  HMCameraClipFetchVideoAssetContextOperation *v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[4];
  id v85;
  HMCameraClipFetchVideoAssetContextOperation *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD aBlock[5];
  id v93;
  id v94;
  id v95;
  _QWORD *v96;
  _QWORD v97[4];
  id v98;
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  void *v107;
  uint64_t v108;
  NSRange v109;

  v108 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  if (-[HMCameraClipFetchVideoAssetContextOperation isCancelled](self, "isCancelled"))
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping video data download because we are cancelled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v79);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMCameraClipFetchVideoAssetContextOperation clipDestinationFileURL](self, "clipDestinationFileURL");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v80)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v109.location = -[HMCameraClipFetchVideoAssetContextOperation videoDataSegmentsRange](v11, "videoDataSegmentsRange");
        NSStringFromRange(v109);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMCameraClipFetchVideoAssetContextOperation clip](v11, "clip");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "videoDataSegments");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v101 = v14;
        v102 = 2112;
        v103 = (uint64_t)v15;
        v104 = 2048;
        v105 = objc_msgSend(v17, "count");
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Downloading range of %@ from all %lu video data segments", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMCameraClipFetchVideoAssetContextOperation videoSegmentsToDownload](v11, "videoSegmentsToDownload");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v72, "count"))
      {
        -[HMCameraClipFetchVideoAssetContextOperation dataSource](v11, "dataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = 0;
        objc_msgSend(v18, "createTemporaryDirectoryAppropriateForURL:error:", v80, &v98);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v98;

        v19 = (void *)MEMORY[0x1A1AC1AAC]();
        v81 = v11;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v75)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v72, "count");
            objc_msgSend(v76, "url");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v101 = v22;
            v102 = 2048;
            v103 = v23;
            v104 = 2112;
            v105 = (uint64_t)v24;
            v106 = 2112;
            v107 = v75;
            _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Downloading %lu video segment(s) from %@ to directory at URL %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v19);
          -[HMCameraClipFetchVideoAssetContextOperation dataSource](v81, "dataSource");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "url");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "requiredHTTPHeaders");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dataTaskWithURL:httpHeaderFields:", v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v97[0] = 0;
          v97[1] = v97;
          v97[2] = 0x2020000000;
          v97[3] = 0;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v72, "count"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke;
          aBlock[3] = &unk_1E3AB0310;
          aBlock[4] = v81;
          v71 = v28;
          v93 = v71;
          v96 = v97;
          v31 = v72;
          v94 = v31;
          v69 = v29;
          v95 = v69;
          v32 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          obj = v31;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
          if (v33)
          {
            v34 = 0;
            v77 = v33;
            v78 = *(_QWORD *)v89;
            while (2)
            {
              for (i = 0; i != v77; ++i)
              {
                if (*(_QWORD *)v89 != v78)
                  objc_enumerationMutation(obj);
                v36 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (objc_msgSend(v30, "count"))
                  {
                    if (!v34)
                    {
                      _HMFPreconditionFailure();
                      __break(1u);
                    }
                    v32[2](v32, v30, v34);
                    objc_msgSend(v30, "removeAllObjects");
                  }
                  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "UUIDString");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "URLByAppendingPathComponent:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "URLByAppendingPathExtension:", CFSTR("mp4"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v73, "addObject:", v40);
                  -[HMCameraClipFetchVideoAssetContextOperation dataSource](v81, "dataSource");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "outputStreamToFileAtURL:shouldAppend:", v40, 0);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  v43 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v42, "open"));
                  v44 = v81;
                  HMFGetOSLogHandle();
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v101 = v46;
                    v102 = 2112;
                    v103 = (uint64_t)v42;
                    v104 = 2112;
                    v105 = (uint64_t)v40;
                    v106 = 2112;
                    v107 = v36;
                    _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_INFO, "%{public}@Opened video file output stream %@ at %@ for init segment %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v43);

                  v34 = v42;
                }
                if (!v34)
                {
                  v57 = (void *)MEMORY[0x1A1AC1AAC]();
                  v58 = v81;
                  HMFGetOSLogHandle();
                  v59 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v101 = v60;
                    v102 = 2112;
                    v103 = (uint64_t)v36;
                    _os_log_impl(&dword_19B1B0000, v59, OS_LOG_TYPE_ERROR, "%{public}@Cannot download video segment that exists before any init segment: %@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v57);
                  v61 = (void *)MEMORY[0x1E0D519C0];
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "futureWithError:", v62);
                  v9 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = 0;
                  goto LABEL_49;
                }
                objc_msgSend(v30, "lastObject");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v47;
                if (v47)
                {
                  v49 = objc_msgSend(v47, "byteOffset");
                  v50 = objc_msgSend(v48, "byteLength");
                  if (v50 + v49 != objc_msgSend(v36, "byteOffset"))
                  {
                    v32[2](v32, v30, v34);
                    objc_msgSend(v30, "removeAllObjects");
                  }
                }
                objc_msgSend(v30, "addObject:", v36);
                v51 = objc_msgSend(v30, "count");
                if (v51 >= -[HMCameraClipFetchVideoAssetContextOperation videoSegmentsDownloadBatchSize](v81, "videoSegmentsDownloadBatchSize"))
                {
                  v32[2](v32, v30, v34);
                  objc_msgSend(v30, "removeAllObjects");
                }

              }
              v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
              if (v77)
                continue;
              break;
            }
          }
          else
          {
            v34 = 0;
          }

          v65 = objc_msgSend(v30, "count");
          v66 = MEMORY[0x1E0C809B0];
          if (v65)
            v32[2](v32, v30, v34);
          objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v69);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v84[0] = v66;
          v84[1] = 3221225472;
          v84[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_37;
          v84[3] = &unk_1E3AB0360;
          v85 = v73;
          v86 = v81;
          v87 = v80;
          objc_msgSend(obj, "flatMap:", v84);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v82[0] = v66;
          v82[1] = 3221225472;
          v82[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2_40;
          v82[3] = &unk_1E3AB0388;
          v82[4] = v81;
          v83 = v75;
          objc_msgSend(v67, "addCompletionBlock:", v82);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v62 = v85;
LABEL_49:

          _Block_object_dispose(v97, 8);
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v101 = v63;
            v102 = 2112;
            v103 = (uint64_t)v70;
            _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video files directory: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          v64 = (void *)MEMORY[0x1E0D519C0];
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
          v71 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "futureWithError:", v71);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v53 = (void *)MEMORY[0x1A1AC1AAC]();
        v54 = v11;
        HMFGetOSLogHandle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v56;
          _os_log_impl(&dword_19B1B0000, v55, OS_LOG_TYPE_INFO, "%{public}@Skipping video data download as no video segments need to be downloaded", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v53);
        -[HMCameraClipFetchVideoAssetContextOperation updateDownloadProgressToPercentageComplete:](v54, "updateDownloadProgressToPercentageComplete:", 100);
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v101 = v52;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Skipping video data download because no destination file URL was specified", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      -[HMCameraClipFetchVideoAssetContextOperation updateDownloadProgressToPercentageComplete:](v11, "updateDownloadProgressToPercentageComplete:", 100);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)downloadVideoSegments:(id)a3 forDataTask:(id)a4 andAppendToOutputStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  HMCameraClipFetchVideoAssetContextOperation *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMCameraClipFetchVideoAssetContextOperation isCancelled](self, "isCancelled");
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v16;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping video data download for segments because we are cancelled: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = v9;
    if (v15)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v20;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Downloading video segments: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v8, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "byteOffset");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = v8;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v27, "byteOffset") != v21)
            _HMFPreconditionFailure();
          v28 = objc_msgSend(v27, "byteOffset");
          v21 = objc_msgSend(v27, "byteLength") + v28;
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v24);
    }

    v29 = objc_msgSend(v18, "byteOffset");
    objc_msgSend(v22, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "byteOffset");
    objc_msgSend(v22, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31 - v29 + objc_msgSend(v32, "byteLength");

    v9 = v36;
    objc_msgSend(v36, "downloadDataForByteRange:", v29, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __105__HMCameraClipFetchVideoAssetContextOperation_downloadVideoSegments_forDataTask_andAppendToOutputStream___block_invoke;
    v37[3] = &unk_1E3AB03B0;
    v37[4] = v13;
    v38 = v22;
    v40 = v29;
    v39 = v10;
    objc_msgSend(v34, "flatMap:", v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (id)decryptData:(id)a3
{
  id v4;
  HMCameraClipEncryptedDataContext *v5;
  HMCameraClipDecryptionManager *v6;
  void *v7;
  void *v8;
  HMCameraClipDecryptionManager *v9;
  void *v10;
  HMCameraClipFetchVideoAssetContextOperation *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  HMCameraClipEncryptedDataContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMCameraClipEncryptedDataContext initWithDataRepresentation:]([HMCameraClipEncryptedDataContext alloc], "initWithDataRepresentation:", v4);
  v6 = [HMCameraClipDecryptionManager alloc];
  -[HMCameraClipFetchVideoAssetContextOperation clip](self, "clip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encryptionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMCameraClipDecryptionManager initWithKey:](v6, "initWithKey:", v8);

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v13;
    v19 = 2048;
    v20 = objc_msgSend(v4, "length");
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Decrypting video segment data of length %lu using encrypted data context %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMCameraClipFetchVideoAssetContextOperation dataSource](v11, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataFromEncryptedDataContext:usingDecryptionManager:", v5, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)writeHLSPlaylistForVideoAssetContext:(id)a3
{
  id v4;
  void *v5;
  HMCameraClipFetchVideoAssetContextOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMCameraClipFetchVideoAssetContextOperation *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HMCameraClipFetchVideoAssetContextOperation *v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMCameraClipFetchVideoAssetContextOperation isCancelled](self, "isCancelled"))
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping HLS playlist write because we are cancelled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMCameraClipFetchVideoAssetContextOperation hlsPlaylistDestinationFileURL](self, "hlsPlaylistDestinationFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v16;
        v31 = 2112;
        v32 = v10;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Saving video HLS playlist to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMCameraClipFetchVideoAssetContextOperation dataSource](v13, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hlsPlaylist");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v19 = objc_msgSend(v17, "writeData:toFileURL:error:", v18, v10, &v28);
      v20 = v28;

      if ((v19 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = (void *)MEMORY[0x1A1AC1AAC]();
        v24 = v13;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v26;
          v31 = 2112;
          v32 = v10;
          v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to save video HLS playlist to %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v21;

    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v22;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Skipping HLS playlist write because no destination file URL was specified", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
  }

  return v11;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraClipFetchVideoAssetContextOperation name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipFetchVideoAssetContextOperation clip](self, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_getProperty(self, a2, 312, 1);
}

- (HMCameraClip)clip
{
  return (HMCameraClip *)objc_getProperty(self, a2, 320, 1);
}

- (_NSRange)videoDataSegmentsRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_videoDataSegmentsRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setVideoDataSegmentsRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_videoDataSegmentsRange, &v3, 16, 1, 0);
}

- (unint64_t)videoSegmentsDownloadBatchSize
{
  return self->_videoSegmentsDownloadBatchSize;
}

- (void)setVideoSegmentsDownloadBatchSize:(unint64_t)a3
{
  self->_videoSegmentsDownloadBatchSize = a3;
}

- (NSURL)clipDestinationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 336, 1);
}

- (void)setClipDestinationFileURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSURL)hlsPlaylistDestinationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 344, 1);
}

- (void)setHlsPlaylistDestinationFileURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (id)downloadProgressHandler
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setDownloadProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (id)fetchVideoAssetContextCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setFetchVideoAssetContextCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (HMCameraClipFetchAssetContextOperationDataSource)dataSource
{
  return (HMCameraClipFetchAssetContextOperationDataSource *)objc_getProperty(self, a2, 368, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong(&self->_fetchVideoAssetContextCompletionBlock, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistDestinationFileURL, 0);
  objc_storeStrong((id *)&self->_clipDestinationFileURL, 0);
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
}

id __105__HMCameraClipFetchVideoAssetContextOperation_downloadVideoSegments_forDataTask_andAppendToOutputStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;
  NSRange v68;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping video segment data decryption because we are cancelled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(a1 + 40);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  v50 = *(_QWORD *)v53;
  v47 = 138543874;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v53 != v50)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "byteOffset", v47) - *(_QWORD *)(a1 + 56);
      v16 = objc_msgSend(v14, "byteLength");
      if (v15 + v16 > objc_msgSend(v3, "length"))
      {
        v30 = (void *)MEMORY[0x1A1AC1AAC]();
        v31 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v68.location = v15;
          v68.length = v16;
          NSStringFromRange(v68);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v47;
          v57 = v33;
          v58 = 2112;
          v59 = (uint64_t)v34;
          v60 = 2112;
          v61 = v3;
          _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Expected video segment range %@ in downloaded data %@ was not found.", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
        v35 = (void *)MEMORY[0x1E0D519C0];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "futureWithError:", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      v17 = v3;
      objc_msgSend(v3, "subdataWithRange:", v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "decryptData:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v19)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v36;
          v58 = 2112;
          v59 = (uint64_t)v14;
          _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt video segment: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        v37 = (void *)MEMORY[0x1E0D519C0];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "futureWithError:", v38);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
LABEL_27:
        v3 = v17;

LABEL_28:
        goto LABEL_29;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v19, "length");
        v26 = *(void **)(a1 + 48);
        *(_DWORD *)buf = v47;
        v57 = v24;
        v58 = 2048;
        v59 = v25;
        v60 = 2112;
        v61 = v26;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Appending video segment data of length %lu to output stream: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v27 = *(void **)(a1 + 48);
      v28 = objc_retainAutorelease(v19);
      v29 = objc_msgSend(v27, "write:maxLength:", objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"));
      if (v29 != objc_msgSend(v28, "length"))
      {
        v39 = (void *)MEMORY[0x1A1AC1AAC]();
        v40 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = v39;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v28, "length");
          v43 = *(void **)(a1 + 48);
          objc_msgSend(v43, "streamError");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v57 = v42;
          v58 = 2048;
          v59 = v48;
          v60 = 2112;
          v61 = v43;
          v62 = 2048;
          v63 = v29;
          v64 = 2112;
          v65 = v44;
          _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Expected to append %lu bytes to %@ but only wrote %lu: %@", buf, 0x34u);

          v39 = v51;
        }

        objc_autoreleasePoolPop(v39);
        v45 = (void *)MEMORY[0x1E0D519C0];
        objc_msgSend(*(id *)(a1 + 48), "streamError");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "futureWithError:", v38);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }

      v3 = v17;
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    if (v12)
      continue;
    break;
  }
LABEL_17:

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v10;
}

void __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "copy");
  v7 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2;
  v14[3] = &unk_1E3AB02E8;
  v8 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v6;
  v17 = v8;
  v18 = v5;
  v20 = *(_QWORD *)(a1 + 64);
  v19 = *(id *)(a1 + 48);
  v9 = (void *)MEMORY[0x1E0D519E8];
  v10 = v5;
  v11 = v6;
  objc_msgSend(v9, "immediateScheduler", v14[0], 3221225472, __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2, &unk_1E3AB02E8, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lazyFutureWithBlock:scheduler:", v14, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);
}

id __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_37(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(a1[4], "count") == 1)
  {
    objc_msgSend(a1[4], "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = a1[5];
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[6];
      *(_DWORD *)buf = 138543874;
      v42 = v8;
      v43 = 2112;
      v44 = (uint64_t)v4;
      v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Finished downloading clip data. Copying single video file at %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(a1[5], "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtURL:error:", a1[6], 0);

    objc_msgSend(a1[5], "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[6];
    v40 = 0;
    v14 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v12, v13, &v40);
    v15 = v40;

    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = a1[5];
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = a1[6];
        *(_DWORD *)buf = 138544130;
        v42 = v31;
        v43 = 2112;
        v44 = (uint64_t)v32;
        v45 = 2112;
        v46 = v33;
        v47 = 2112;
        v48 = v15;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy video file at %@ to %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v28);
      v34 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "futureWithError:", v35);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1[5];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(a1[4], "count");
      v22 = a1[6];
      *(_DWORD *)buf = 138543874;
      v42 = v20;
      v43 = 2048;
      v44 = v21;
      v45 = 2112;
      v46 = v22;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Finished downloading clip data. Combining %ld video file(s) to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(a1[5], "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a1[4];
    objc_msgSend(a1[5], "underlyingQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createVideoFileCombinerWithVideoFileURLs:queue:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0D519C0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_38;
    v37[3] = &unk_1E3AB0338;
    v38 = v26;
    v39 = a1[6];
    v4 = v26;
    objc_msgSend(v27, "futureWithErrorOnlyHandlerAdapterBlock:", v37);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v38;
  }

  return v16;
}

void __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v10;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished copying/combining video files", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v20 = 0;
  v13 = objc_msgSend(v11, "removeItemAtURL:error:", v12, &v20);
  v14 = v20;

  if ((v13 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove video files directory at URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

uint64_t __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_38(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "combineToOutputFileURL:completion:", *(_QWORD *)(a1 + 40), a2);
}

void __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  objc_msgSend(v3, "downloadVideoSegments:forDataTask:andAppendToOutputStream:", v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_3;
  v17 = &unk_1E3AB02C0;
  v21 = *(_QWORD *)(a1 + 72);
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v10;
  v20 = *(id *)(a1 + 64);
  objc_msgSend(v8, "addSuccessBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completionHandlerAdapter", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v12);
}

uint64_t __66__HMCameraClipFetchVideoAssetContextOperation_downloadVideoAsset___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "count");
  return objc_msgSend(*(id *)(a1 + 40), "updateDownloadProgressToPercentageComplete:", 100* *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)/ (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"));
}

id __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "downloadVideoAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeHLSPlaylistForVideoAssetContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __51__HMCameraClipFetchVideoAssetContextOperation_main__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "finishWithVideoAssetContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  else
    return objc_msgSend(v3, "cancelWithError:");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_21083 != -1)
    dispatch_once(&logCategory__hmf_once_t31_21083, &__block_literal_global_21084);
  return (id)logCategory__hmf_once_v32_21085;
}

void __58__HMCameraClipFetchVideoAssetContextOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32_21085;
  logCategory__hmf_once_v32_21085 = v0;

}

@end
