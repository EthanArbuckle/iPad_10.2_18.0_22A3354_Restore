@implementation HMIFaceDetectorVision

+ (id)detectFacesInPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDF9B78]);
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldUseCPUOnlyForVisionFaceDetection");

  if (v8)
    objc_msgSend(v6, "setUsesCPUOnly:", 1);
  objc_msgSend(v6, "setRevision:", +[HMIFaceDetectorVision defaultRevision](HMIFaceDetectorVision, "defaultRevision"));
  v9 = objc_alloc(MEMORY[0x24BDF9C28]);
  v10 = (void *)objc_msgSend(v9, "initWithCVPixelBuffer:options:", a3, MEMORY[0x24BDBD1B8]);
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v10, "performRequests:error:", v11, &v16);
  v13 = v16;

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v6, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    HMIErrorLogC(v13);
    v14 = 0;
  }

  return v14;
}

+ (id)detectFacesInImageData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDF9B78];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldUseCPUOnlyForVisionFaceDetection");

  if (v9)
    objc_msgSend(v7, "setUsesCPUOnly:", 1);
  objc_msgSend(v7, "setRevision:", +[HMIFaceDetectorVision defaultRevision](HMIFaceDetectorVision, "defaultRevision"));
  v10 = objc_alloc(MEMORY[0x24BDF9C28]);
  +[HMIVisionSession sharedInstance](HMIVisionSession, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vnSession");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithData:options:session:", v6, MEMORY[0x24BDBD1B8], v12);

  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  LOBYTE(v12) = objc_msgSend(v13, "performRequests:error:", v14, &v18);
  v15 = v18;

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v7, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    HMIErrorLogC(v15);
    v16 = 0;
  }

  return v16;
}

+ (unint64_t)defaultRevision
{
  return 3;
}

+ (void)releaseCachedResources
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](a1, a2);
  v4 = a1;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_DEBUG, "%{public}@releaseCachedResources is deprecated and is now a no-op.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

@end
