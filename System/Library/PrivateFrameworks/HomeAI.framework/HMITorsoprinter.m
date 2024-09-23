@implementation HMITorsoprinter

+ (unint64_t)currentTorsoRequestRevision
{
  return 3737841670;
}

+ (id)currentModelUUID
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMITorsoprinter_currentModelUUID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentModelUUID_onceToken != -1)
    dispatch_once(&currentModelUUID_onceToken, block);
  return (id)currentModelUUID_modelUUID;
}

void __35__HMITorsoprinter_currentModelUUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = +[HMITorsoprinter currentTorsoRequestRevision](HMITorsoprinter, "currentTorsoRequestRevision");
  v3 = (int)HMIVisionRuntimeVersion();
  v4 = (void *)MEMORY[0x220735570]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2048;
    v13 = v2;
    v14 = 2048;
    v15 = v3;
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Torsoprint Version: %ld.%ld", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  HMIModelUUID(v2, v3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)currentModelUUID_modelUUID;
  currentModelUUID_modelUUID = v8;

}

+ (__CVBuffer)createTorsoPixelBufferForTorsoEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  id v7;
  double Size;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGRect v20;
  CGRect v21;

  v7 = a3;
  Size = HMICVPixelBufferGetSize(a4);
  v10 = v9;
  objc_msgSend(v7, "boundingBox");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  HMICGRectPixelFromNormalized(v12, v14, v16, v18, Size, v10);
  v21 = CGRectIntegral(v20);
  return +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a4, 1111970369, 8, a5, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, 128.0, 256.0);
}

- (id)torsoprintForTorsoPixelBuffer:(__CVBuffer *)a3 unrecognizable:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  _BOOL8 v28;
  HMITorsoprinter *v29;
  NSObject *v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;
  float v35;
  float v36;
  void *v37;
  HMITorsoprinter *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMITorsoprint *v42;
  void *v43;
  void *v44;
  void *v45;
  HMITorsoprint *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *context;
  void *v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  id v67;
  _QWORD v68[2];

  v6 = a4;
  v68[1] = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(MEMORY[0x24BDF9B48]);
  v60 = 0;
  v10 = objc_msgSend(v9, "setRevision:error:", +[HMITorsoprinter currentTorsoRequestRevision](HMITorsoprinter, "currentTorsoRequestRevision"), &v60);
  v11 = v60;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF9C10], "observationWithRequestRevision:boundingBox:", 3737841664, 0.0, 0.0, 1.0, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInputDetectedObjectObservations:", v13);

    v14 = objc_alloc(MEMORY[0x24BDF9C28]);
    +[HMIVisionSession sharedInstance](HMIVisionSession, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "vnSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithCVPixelBuffer:options:session:", a3, MEMORY[0x24BDBD1B8], v16);

    v67 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v11;
    v19 = objc_msgSend(v17, "performRequests:error:", v18, &v59);
    v20 = v59;

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v9, "results");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22 == 1)
      {
        objc_msgSend(v9, "results");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "torsoprint");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "confidence");
        v27 = v26;

        v28 = v27 <= 0.5;
        if (v27 <= 0.5)
        {
          context = (void *)MEMORY[0x220735570]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "torsoprint");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "confidence");
            *(_DWORD *)buf = 138543618;
            v62 = v56;
            v63 = 2048;
            v64 = v31;
            _os_log_impl(&dword_219D45000, v30, OS_LOG_TYPE_INFO, "%{public}@Found low quality torso conf: %.4f", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
          v28 = 1;
        }
        +[HMITorsoQuality entropyOfSaturationForBGRAPixelBuffer:](HMITorsoQuality, "entropyOfSaturationForBGRAPixelBuffer:", a3);
        v33 = v32;
        v34 = +[HMITorsoQuality entropyOfLaplacianForBGRAPixelBuffer:](HMITorsoQuality, "entropyOfLaplacianForBGRAPixelBuffer:", a3);
        v36 = v35;
        if (v33 >= -1.988 && v35 >= -1.915)
        {
          v37 = (void *)MEMORY[0x220735570](v34);
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v58 = v37;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v40;
            v63 = 2048;
            v64 = v33;
            v65 = 2048;
            v66 = v36;
            _os_log_impl(&dword_219D45000, v39, OS_LOG_TYPE_INFO, "%{public}@Found low quality torso entropyOfSaturation: %.4f entropyOfLaplacian: %.4f", buf, 0x20u);

            v37 = v58;
          }

          objc_autoreleasePoolPop(v37);
          v28 = 1;
        }
        objc_msgSend(v24, "torsoprint");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          v42 = [HMITorsoprint alloc];
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "torsoprint");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "descriptorData");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[HMITorsoprint initWithUUID:data:lowQuality:unrecognizable:](v42, "initWithUUID:data:lowQuality:unrecognizable:", v43, v45, v28, v6);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1038, CFSTR("torsoprint is nil"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v53;
          if (a5)
            *a5 = objc_retainAutorelease(v53);
          HMIErrorLog(self, v43);
          v46 = 0;
        }

        goto LABEL_29;
      }
      v49 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "results");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", CFSTR("Expected 1 torsoprint, but got %lu torsoprints"), objc_msgSend(v50, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1038, v24);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (a5)
        *a5 = objc_retainAutorelease(v51);
      HMIErrorLog(self, v52);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1038, CFSTR("failed to perform image request"), v20);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v48;
      if (a5)
        *a5 = objc_retainAutorelease(v48);
      HMIErrorLog(self, v24);
    }
    v46 = 0;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1038, CFSTR("Failed to set request revision"), v11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v47;
  if (a5)
    *a5 = objc_retainAutorelease(v47);
  HMIErrorLog(self, v17);
  v46 = 0;
  v20 = v11;
LABEL_30:

  return v46;
}

@end
