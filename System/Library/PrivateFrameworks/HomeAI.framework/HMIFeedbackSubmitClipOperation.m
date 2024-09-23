@implementation HMIFeedbackSubmitClipOperation

- (HMIFeedbackSubmitClipOperation)initWithFeedbackSession:(id)a3 cameraProfileUUID:(id)a4 clipUUID:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMIFeedbackSubmitClipOperation *v12;
  HMIFeedbackSubmitClipOperation *v13;
  uint64_t v14;
  NSMutableArray *temporaryFileURLs;
  NSSet *faceCrops;
  NSData *assetData;
  NSDictionary *serviceResult;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMIFeedbackSubmitClipOperation;
  v12 = -[HMFOperation init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feedbackSession, a3);
    objc_storeStrong((id *)&v13->_cameraProfileUUID, a4);
    objc_storeStrong((id *)&v13->_clipUUID, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    temporaryFileURLs = v13->_temporaryFileURLs;
    v13->_temporaryFileURLs = (NSMutableArray *)v14;

    faceCrops = v13->_faceCrops;
    v13->_faceCrops = 0;

    assetData = v13->_assetData;
    v13->_assetData = 0;

    serviceResult = v13->_serviceResult;
    v13->_serviceResult = 0;

  }
  return v13;
}

- (void)_downloadClipWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMIFeedbackSubmitClipOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMIFeedbackSubmitClipOperation *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  HMIFeedbackSubmitClipOperation *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x220735570]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v14;
    _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Downloading Clip", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMIFeedbackSubmitClipOperation feedbackSession](v12, "feedbackSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homeKitClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cameraProfileWithUUID:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMIFeedbackSubmitClipOperation feedbackSession](v12, "feedbackSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "homeKitClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "homeWithCameraProfileUUID:", v8);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v34 = v9;
      v21 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke;
      v40[3] = &unk_24DBEB998;
      v40[4] = v12;
      v22 = v10;
      v42 = v22;
      v23 = v17;
      v41 = v23;
      v24 = (void *)MEMORY[0x220735744](v40);
      v35[0] = v21;
      v35[1] = 3221225472;
      v35[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_133;
      v35[3] = &unk_24DBEBA08;
      v38 = v22;
      v20 = v20;
      v36 = v20;
      v37 = v12;
      v25 = v24;
      v39 = v25;
      v26 = (void *)MEMORY[0x220735744](v35);
      v27 = (void *)MEMORY[0x220735570]();
      v28 = v12;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = v25;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v30;
        _os_log_impl(&dword_219D45000, v29, OS_LOG_TYPE_INFO, "%{public}@Fetching Clip", buf, 0xCu);

        v25 = v33;
      }

      objc_autoreleasePoolPop(v27);
      objc_msgSend(v23, "clipManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v34;
      objc_msgSend(v31, "fetchClipWithUUID:completion:", v34, v26);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Cannot find home for camera profile."));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v32);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Cannot find camera profile."));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v20);
  }

}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void (*v11)(void);
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v4, "_temporaryFileURLWithUUID:extension:error:", v5, CFSTR("mp4"), &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (!v10)
    {
      v12 = objc_alloc(MEMORY[0x24BDD7558]);
      objc_msgSend(*(id *)(a1 + 40), "clipManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithClipManager:clip:", v13, v3);

      objc_msgSend(v14, "setClipDestinationFileURL:", v6);
      v15 = MEMORY[0x24BDAC760];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_2;
      v17[3] = &unk_24DBEB948;
      v17[4] = *(_QWORD *)(a1 + 32);
      v19 = *(id *)(a1 + 48);
      v18 = v6;
      objc_msgSend(v14, "setFetchVideoAssetContextCompletionBlock:", v17);
      v16[0] = v15;
      v16[1] = 3221225472;
      v16[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_130;
      v16[3] = &unk_24DBEB970;
      v16[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "setDownloadProgressHandler:", v16);
      objc_msgSend(v14, "start");

      goto LABEL_7;
    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v11();
LABEL_7:

}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x220735570]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched Clip videoAssetContext: %@, error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v11 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:suggestion:underlyingError:", 1000, CFSTR("Cannot download clip asset."), CFSTR("Check network connectivity."), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_130(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x220735570]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2048;
    v11 = a2;
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching Clip, progress %lu%%", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:suggestion:underlyingError:", 1000, CFSTR("Cannot download clip for camera profile."), CFSTR("Ensure the clip belongs to the camera profile."), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v14);
LABEL_9:

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "personManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x220735570]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching Face Crops", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v5, "significantEvents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_map:", &__block_literal_global_140);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x220735570]();
    v16 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetched Person UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "personManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_141;
    v22[3] = &unk_24DBEB9E0;
    v22[4] = *(_QWORD *)(a1 + 40);
    v24 = *(id *)(a1 + 56);
    v23 = v5;
    objc_msgSend(v19, "fetchFaceCropsForPersonsWithUUIDs:completion:", v14, v22);

    goto LABEL_9;
  }
  if (v11)
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v21;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Face crops are not available.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_13:

}

id __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_138(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "faceClassification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "person");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x220735570]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched Face Crops: %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "setFaceCrops:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_stripAudioTrackAndFacesFromAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  HMIFeedbackSubmitClipOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HMIFeedbackVisionProcessor *v21;
  BOOL v22;
  void *v23;
  HMIFeedbackSubmitClipOperation *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(id, _QWORD, void *);
  CMTime v31;
  char v32;
  CMTime v33;
  id v34;
  CMTime buf;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  -[HMIFeedbackSubmitClipOperation _temporaryFileURLWithUUID:extension:error:](self, "_temporaryFileURLWithUUID:extension:error:", v8, CFSTR("mp4"), &v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v34;

  if (v9)
  {
    memset(&v33, 0, sizeof(v33));
    v11 = +[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall");
    v12 = 60.0;
    if (!v11)
      v12 = 20.0;
    CMTimeMakeWithSeconds(&v33, v12, 1000);
    if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
      goto LABEL_5;
    v32 = 0;
    v21 = objc_alloc_init(HMIFeedbackVisionProcessor);
    buf = v33;
    v22 = -[HMIFeedbackVisionProcessor blurFacesFromAssetURL:outputURL:duration:analysisFPS:windowSize:faceDetected:](v21, "blurFacesFromAssetURL:outputURL:duration:analysisFPS:windowSize:faceDetected:", v6, v9, &buf, 5, &v32, COERCE_DOUBLE(__PAIR64__(HIDWORD(v33.value), 15.0)));

    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Unable to blur faces."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v17);
LABEL_19:

      goto LABEL_20;
    }
    if (!v32)
    {
LABEL_5:
      v13 = (void *)MEMORY[0x220735570]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v16;
        _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Use the original video without audio track for upload", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isReadable") & 1) != 0)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke;
        v27[3] = &unk_24DBEBA58;
        v18 = v17;
        v28 = v18;
        v30 = v7;
        v29 = v9;
        v31 = v33;
        v19 = (void *)MEMORY[0x220735744](v27);
        objc_msgSend(v18, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24DC15188, v19);

        v20 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1004, CFSTR("Unable to read the asset from disk."));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v20);
      }

      goto LABEL_19;
    }
    v23 = (void *)MEMORY[0x220735570]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v26;
      _os_log_impl(&dword_219D45000, v25, OS_LOG_TYPE_INFO, "%{public}@Use the face-blurred video for upload", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
  }
  else
  {
    v7[2](v7, 0, v10);
  }
LABEL_20:

}

void __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CMTimeEpoch epoch;
  char v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  CMTimeRange v24;
  CMTime v25;
  CMTimeRange v26;
  id v27;
  CMTime start;
  CMTime duration;
  CMTimeRange v30;
  id v31;

  v2 = *(void **)(a1 + 32);
  v31 = 0;
  v3 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("tracks"), &v31);
  v4 = v31;
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDB25B0], "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDB1D50];
    objc_msgSend(v5, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x24BDB1D50], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaType:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      if (v10)
        objc_msgSend(v10, "duration");
      else
        memset(&duration, 0, sizeof(duration));
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
      v19 = *(_OWORD *)&start.value;
      epoch = start.epoch;
      CMTimeRangeMake(&v30, &start, &duration);
      v27 = v4;
      *(_OWORD *)&start.value = v19;
      start.epoch = epoch;
      v14 = objc_msgSend(v7, "insertTimeRange:ofTrack:atTime:error:", &v30, v9, &start, &v27);
      v15 = v27;

      if ((v14 & 1) != 0)
      {
        v16 = objc_alloc(MEMORY[0x24BDB23A8]);
        v17 = (void *)objc_msgSend(v16, "initWithAsset:presetName:", v5, *MEMORY[0x24BDB19E0]);
        objc_msgSend(v17, "setOutputFileType:", *MEMORY[0x24BDB1C30]);
        objc_msgSend(v17, "setOutputURL:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v17, "setShouldOptimizeForNetworkUse:", 1);
        CMTimeMake(&v25, 0, 1000);
        start = *(CMTime *)(a1 + 56);
        CMTimeRangeMake(&v26, &v25, &start);
        v24 = v26;
        objc_msgSend(v17, "setTimeRange:", &v24);
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke_2;
        v20[3] = &unk_24DBEBA30;
        v21 = v17;
        v23 = *(id *)(a1 + 48);
        v22 = *(id *)(a1 + 40);
        v18 = v17;
        objc_msgSend(v18, "exportAsynchronouslyWithCompletionHandler:", v20);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      v4 = v15;
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Clip doesn't have a video track."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  v3 = *(_QWORD *)(a1 + 48);
  if (v2 == 3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
}

- (id)feedbackRequestURLForClipWithUUID:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  -[HMIFeedbackSubmitClipOperation feedbackServiceURL](self, "feedbackServiceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)feedbackServiceHost
{
  void *v2;
  void *v3;

  -[HMIFeedbackSubmitClipOperation feedbackSession](self, "feedbackSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackServiceHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)feedbackServiceURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMIFeedbackSubmitClipOperation feedbackServiceHost](self, "feedbackServiceHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("https://%@/v2/clip-uuid/"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_base64StringFromData:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "base64EncodedDataWithOptions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);

  return v4;
}

- (id)_temporaryFileURLWithUUID:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  HMIURLForCacheDirectory(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("feedback"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, a5);

    v19 = 0;
    if (v18)
    {
LABEL_4:
      objc_msgSend(v12, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_temporaryFileURLs, "addObject:", v19);

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_uploadPayloadData:(id)a3 uploadURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMIFeedbackSubmitClipOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x220735570]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v14;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Uploading payload data: %@, to URL %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  -[HMIFeedbackSubmitClipOperation _temporaryFileURLWithUUID:extension:error:](v12, "_temporaryFileURLWithUUID:extension:error:", v15, CFSTR("json"), &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;

  if (v16)
  {
    objc_msgSend(v8, "writeToURL:atomically:", v16, 1);
    objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHTTPMethod:", CFSTR("PUT"));
    objc_msgSend(v18, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    -[HMIFeedbackSubmitClipOperation feedbackSession](v12, "feedbackSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __81__HMIFeedbackSubmitClipOperation__uploadPayloadData_uploadURL_completionHandler___block_invoke;
    v25 = &unk_24DBEBA80;
    v26 = v10;
    objc_msgSend(v20, "uploadTaskWithRequest:fromFile:completionHandler:", v18, v16, &v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "resume", v22, v23, v24, v25);
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v17);
  }

}

uint64_t __81__HMIFeedbackSubmitClipOperation__uploadPayloadData_uploadURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_attachEncryptedDataUsingKey:(id)a3 toPayload:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSUInteger v17;
  HMIFeedbackSubmitClipOperation *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id obj;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  HMIFeedbackSubmitClipOperation *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") == 32)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", -[NSData length](self->_assetData, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0;
    NSRandomData();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = v13;
    v59 = v11;
    if (v12)
    {
      v55 = v13;
      v57 = v9;
      v15 = objc_retainAutorelease(v8);
      objc_msgSend(v15, "bytes");
      objc_msgSend(v15, "length");
      v54 = v12;
      v16 = objc_retainAutorelease(v12);
      objc_msgSend(v16, "bytes");
      v65 = v16;
      objc_msgSend(v16, "length");
      -[NSData bytes](self->_assetData, "bytes");
      v17 = -[NSData length](self->_assetData, "length");
      v56 = v10;
      v62 = objc_retainAutorelease(v10);
      v18 = self;
      v19 = objc_msgSend(v62, "mutableBytes");
      v20 = objc_retainAutorelease(v11);
      v49 = objc_msgSend(v20, "mutableBytes");
      v51 = objc_msgSend(v20, "length");
      v66 = v18;
      if (CCCryptorGCMOneshotEncrypt())
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Failed to encrypt data."), v17, v19, v49, v51);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v9 = v57;
        if (a5)
          *a5 = objc_retainAutorelease(v21);
        HMIErrorLog(v66, v22);
        v23 = 0;
      }
      else
      {
        v64 = v15;
        v28 = v16;
        -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v18, "_base64StringFromData:", v16, v17, v19, v49, v51);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v57;
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v29, CFSTR("iv"));

        -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v18, "_base64StringFromData:", v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v30, CFSTR("authTag"));

        -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v18, "_base64StringFromData:", v62);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v31, CFSTR("clip"));

        if (!+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
        {
          v23 = 1;
          v14 = v55;
          v10 = v56;
          v12 = v54;
          goto LABEL_15;
        }
        v53 = v8;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        -[HMIFeedbackSubmitClipOperation faceCrops](v18, "faceCrops");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v32 = v64;
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        if (v61)
        {
          v60 = *(_QWORD *)v68;
          while (2)
          {
            for (i = 0; i != v61; ++i)
            {
              if (*(_QWORD *)v68 != v60)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "dataRepresentation");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v34, "length"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_retainAutorelease(v32);
              objc_msgSend(v37, "bytes");
              objc_msgSend(v37, "length");
              v38 = objc_retainAutorelease(v28);
              objc_msgSend(v38, "bytes");
              objc_msgSend(v38, "length");
              v39 = objc_retainAutorelease(v34);
              objc_msgSend(v39, "bytes");
              v40 = objc_msgSend(v39, "length");
              v41 = objc_retainAutorelease(v35);
              v42 = objc_msgSend(v41, "mutableBytes");
              v43 = objc_retainAutorelease(v36);
              v50 = objc_msgSend(v43, "mutableBytes");
              v52 = objc_msgSend(v43, "length");
              if (CCCryptorGCMOneshotEncrypt())
              {
                objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Failed to encrypt face crop data."), v40, v42, v50, v52);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v47;
                v8 = v53;
                v14 = v55;
                if (a5)
                  *a5 = objc_retainAutorelease(v47);
                HMIErrorLog(v66, v48);

                v23 = 0;
                v10 = v56;
                v9 = v57;
                v12 = v54;
                v22 = v63;
                goto LABEL_14;
              }
              v72[0] = CFSTR("data");
              -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v66, "_base64StringFromData:", v41, v40, v42, v50, v52);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v73[0] = v44;
              v72[1] = CFSTR("authTag");
              -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v66, "_base64StringFromData:", v43);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v73[1] = v45;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v46);

              v32 = v64;
              v28 = v65;
            }
            v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
            if (v61)
              continue;
            break;
          }
        }

        v9 = v57;
        v22 = v63;
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v63, CFSTR("faceCrops"));
        v23 = 1;
        v8 = v53;
      }
      v14 = v55;
      v10 = v56;
      v12 = v54;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Cannot generate initialization vector."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v26;
      if (a5)
        *a5 = objc_retainAutorelease(v26);
      HMIErrorLog(self, v22);
      v23 = 0;
    }
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Invalid key size."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a5)
    *a5 = objc_retainAutorelease(v24);
  HMIErrorLog(self, v25);

  v23 = 0;
LABEL_16:

  return v23;
}

- (BOOL)_attachFaceCrops:(id)a3 toPayload:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)_createPayloadWithServiceResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMIFeedbackSubmitClipOperation _attachEncryptedDataUsingKey:toPayload:error:](self, "_attachEncryptedDataUsingKey:toPayload:error:", v8, v9, a4))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wrappedKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("key"));

    if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("internal"));
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 8, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_submitClipWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMIFeedbackSubmitClipOperation *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x220735570]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v14;
    v36 = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting clipUUID: %@, cameraProfileUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke;
  v32[3] = &unk_24DBEBAA8;
  v32[4] = v12;
  v16 = v10;
  v33 = v16;
  v17 = (void *)MEMORY[0x220735744](v32);
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_192;
  v29[3] = &unk_24DBEBAD0;
  v29[4] = v12;
  v18 = v16;
  v30 = v18;
  v31 = v17;
  v19 = v17;
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_193;
  v24[3] = &unk_24DBEBAF8;
  v24[4] = v12;
  v25 = v8;
  v26 = v9;
  v27 = v18;
  v28 = (id)MEMORY[0x220735744](v29);
  v20 = v28;
  v21 = v9;
  v22 = v8;
  v23 = v18;
  -[HMIFeedbackSubmitClipOperation _requestPreSignedURLWithClipUUID:completionHandler:](v12, "_requestPreSignedURLWithClipUUID:completionHandler:", v21, v24);

}

void __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x220735570]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v10;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_INFO, "%{public}@Stripped Audio %@, error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAssetData:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "serviceResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v12, "_createPayloadWithServiceResult:error:", v13, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(*(id *)(a1 + 32), "serviceResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("url"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_uploadPayloadData:uploadURL:completionHandler:", v14, v18, *(_QWORD *)(a1 + 40));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x220735570]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_INFO, "%{public}@Downloaded %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_stripAudioTrackAndFacesFromAsset:completionHandler:", v5, *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setServiceResult:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_downloadClipWithCameraProfileUUID:clipUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch pre-signed URL, error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)_requestPreSignedURLWithClipUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIFeedbackSubmitClipOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  HMIFeedbackSubmitClipOperation *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIFeedbackSubmitClipOperation feedbackServiceHost](v9, "feedbackServiceHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Requesting a pre-signed url from server endpoint:%@, for clipUUID:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIFeedbackSubmitClipOperation feedbackSession](v9, "feedbackSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIFeedbackSubmitClipOperation feedbackRequestURLForClipWithUUID:](v9, "feedbackRequestURLForClipWithUUID:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __85__HMIFeedbackSubmitClipOperation__requestPreSignedURLWithClipUUID_completionHandler___block_invoke;
  v21 = &unk_24DBEBB20;
  v22 = v9;
  v23 = v7;
  v16 = v7;
  objc_msgSend(v14, "dataTaskWithURL:completionHandler:", v15, &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "resume", v18, v19, v20, v21, v22);
}

void __85__HMIFeedbackSubmitClipOperation__requestPreSignedURLWithClipUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v44 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, &v44);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v44;
    if (!v14)
    {
      v22 = (void *)MEMORY[0x220735570]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v25;
        v47 = 2112;
        v48 = v15;
        _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode server response, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
    v16 = v8;
    v17 = objc_msgSend(v16, "statusCode");
    switch(v17)
    {
      case 500:
        v26 = (void *)MEMORY[0x220735570]();
        v27 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = v26;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v29;
          v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result due to internal server error, serverResponse: %@", buf, 0x16u);

          v26 = v42;
        }

        objc_autoreleasePoolPop(v26);
        v30 = (void *)MEMORY[0x24BDD1540];
        v31 = CFSTR("Status Code:500, Error: Internal server error");
        v32 = 1049;
        break;
      case 404:
        v33 = (void *)MEMORY[0x220735570]();
        v34 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = v33;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v36;
          v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_219D45000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result, resource is not found, serverResponse: %@", buf, 0x16u);

          v33 = v42;
        }

        objc_autoreleasePoolPop(v33);
        v30 = (void *)MEMORY[0x24BDD1540];
        v31 = CFSTR("Status Code:400, Error: Resource not found on server error");
        v32 = 1050;
        break;
      case 200:
        v18 = (void *)MEMORY[0x220735570]();
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = v18;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v21;
          v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_INFO, "%{public}@Service result: %@", buf, 0x16u);

          v18 = v43;
        }

        objc_autoreleasePoolPop(v18);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_25;
      default:
        v37 = (void *)MEMORY[0x220735570]();
        v38 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = v37;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v40;
          v47 = 2112;
          v48 = v14;
          _os_log_impl(&dword_219D45000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result due to server error, serverResponse: %@", buf, 0x16u);

          v37 = v42;
        }

        objc_autoreleasePoolPop(v37);
        v30 = (void *)MEMORY[0x24BDD1540];
        v31 = CFSTR("Unkown server error");
        v32 = 1000;
        break;
    }
    objc_msgSend(v30, "hmiPrivateErrorWithCode:description:", v32, v31, v42);
    v41 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v15 = (id)v41;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v10 = (void *)MEMORY[0x220735570]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v13;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result from server, error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_27:

}

- (void)_removeTemporaryFiles
{
  NSMutableArray *temporaryFileURLs;
  _QWORD v3[5];

  temporaryFileURLs = self->_temporaryFileURLs;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__HMIFeedbackSubmitClipOperation__removeTemporaryFiles__block_invoke;
  v3[3] = &unk_24DBEBB48;
  v3[4] = self;
  -[NSMutableArray na_each:](temporaryFileURLs, "na_each:", v3);
}

void __55__HMIFeedbackSubmitClipOperation__removeTemporaryFiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x220735570]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v7;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Deleting Temporary File %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v12 = objc_msgSend(v11, "removeItemAtURL:error:", v3, &v18);
    v13 = v18;

    if ((v12 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x220735570]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v17;
        v21 = 2112;
        v22 = v3;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_INFO, "%{public}@Deleted Temporary File %@, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
}

- (void)main
{
  NSUUID *cameraProfileUUID;
  NSUUID *clipUUID;
  _QWORD v4[5];

  cameraProfileUUID = self->_cameraProfileUUID;
  clipUUID = self->_clipUUID;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__HMIFeedbackSubmitClipOperation_main__block_invoke;
  v4[3] = &unk_24DBE9E78;
  v4[4] = self;
  -[HMIFeedbackSubmitClipOperation _submitClipWithCameraProfileUUID:clipUUID:completionHandler:](self, "_submitClipWithCameraProfileUUID:clipUUID:completionHandler:", cameraProfileUUID, clipUUID, v4);
}

void __38__HMIFeedbackSubmitClipOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removeTemporaryFiles");
  v3 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v3, "cancelWithError:", v4);
  else
    objc_msgSend(v3, "finish");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1)
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_203);
  return (id)logCategory__hmf_once_v32;
}

void __45__HMIFeedbackSubmitClipOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;

}

- (HMIFeedbackSession)feedbackSession
{
  return (HMIFeedbackSession *)objc_getProperty(self, a2, 312, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (NSMutableArray)temporaryFileURLs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 336, 1);
}

- (NSSet)faceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 344, 1);
}

- (void)setFaceCrops:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSData)assetData
{
  return (NSData *)objc_getProperty(self, a2, 352, 1);
}

- (void)setAssetData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSDictionary)serviceResult
{
  return (NSDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setServiceResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceResult, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_faceCrops, 0);
  objc_storeStrong((id *)&self->_temporaryFileURLs, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_feedbackSession, 0);
}

@end
