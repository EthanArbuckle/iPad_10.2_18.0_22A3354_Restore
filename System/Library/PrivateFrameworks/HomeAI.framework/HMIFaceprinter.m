@implementation HMIFaceprinter

+ (id)currentModelUUID
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMIFaceprinter_currentModelUUID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentModelUUID_onceToken_0 != -1)
    dispatch_once(&currentModelUUID_onceToken_0, block);
  return (id)currentModelUUID_modelUUID_0;
}

void __34__HMIFaceprinter_currentModelUUID__block_invoke(uint64_t a1)
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
  v2 = +[HMIFaceUtilities faceprintDefaultRevision](HMIFaceUtilities, "faceprintDefaultRevision");
  v3 = +[HMIFaceprinter _minorVersionFromVisionVersion:](HMIFaceprinter, "_minorVersionFromVisionVersion:", HMIVisionRuntimeVersion());
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
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Faceprint Version: %ld.%ld", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  HMIModelUUID(v2, v3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)currentModelUUID_modelUUID_0;
  currentModelUUID_modelUUID_0 = v8;

}

- (void)warmStart
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HMIFaceprinter_warmStart__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  if (warmStart_onceToken != -1)
    dispatch_once(&warmStart_onceToken, block);
}

void __27__HMIFaceprinter_warmStart__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x220735570]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_219D45000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Warm starting faceprint model...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  HMIDispatchQueueNameString(*(void **)(a1 + 32), CFSTR("warm_start_faceprint_model"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create(v7, v8);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HMIFaceprinter_warmStart__block_invoke_51;
  block[3] = &unk_24DBE9C90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v9, block);

}

void __27__HMIFaceprinter_warmStart__block_invoke_51(uint64_t a1)
{
  void *v2;
  __CVBuffer *v3;
  __CVBuffer *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 1, 128.0, 128.0);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(a1 + 32);
    v22 = 0;
    objc_msgSend(v5, "createFaceprintForFacePixelBuffer:fastMode:error:", v4, 1, &v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    CVPixelBufferRelease(v4);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v2);
      v10 = v9;

      v11 = (void *)MEMORY[0x220735570]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2048;
        v26 = v10;
        v15 = "%{public}@Warm start of faceprint model took: %f";
        v16 = v13;
        v17 = OS_LOG_TYPE_DEBUG;
LABEL_10:
        _os_log_impl(&dword_219D45000, v16, v17, v15, buf, 0x16u);

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x220735570]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v7;
        v15 = "%{public}@Failed to warm start faceprint model: %@";
        v16 = v13;
        v17 = OS_LOG_TYPE_ERROR;
        goto LABEL_10;
      }
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_12;
  }
  v18 = (void *)MEMORY[0x220735570]();
  v19 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pixel buffer when warm starting faceprint model", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
LABEL_12:

}

- (id)createFaceprintForFacePixelBuffer:(__CVBuffer *)a3 fastMode:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  HMISignpost *v34;
  id v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];

  v6 = a4;
  v38[1] = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc(MEMORY[0x24BDF9C28]);
  +[HMIVisionSession sharedInstance](HMIVisionSession, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vnSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v9, "initWithCVPixelBuffer:options:session:", a3, MEMORY[0x24BDBD1B8], v11);

  v12 = objc_alloc_init(MEMORY[0x24BDF9B38]);
  objc_msgSend(MEMORY[0x24BDF9BB8], "faceObservationWithRequestRevision:unalignedBoundingBox:alignedBoundingBox:", 2, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  v13 = objc_claimAutoreleasedReturnValue();
  v38[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setInputFaceObservations:", v14);
  v36 = 0;
  LOBYTE(v13) = objc_msgSend(v12, "setRevision:error:", +[HMIFaceUtilities faceprintDefaultRevision](HMIFaceUtilities, "faceprintDefaultRevision"), &v36);
  v15 = v36;
  if ((v13 & 1) != 0)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDF9AF8]);
    objc_msgSend(v16, "setInputFaceObservations:", v14);
    v35 = v15;
    v17 = objc_msgSend(v16, "setRevision:error:", +[HMIFaceUtilities faceprintAttributeDefaultRevision](HMIFaceUtilities, "faceprintAttributeDefaultRevision"), &v35);
    v18 = v35;

    if ((v17 & 1) != 0)
    {
      if (v6)
      {
        objc_msgSend(v12, "setDetectionLevel:", 2);
        objc_msgSend(v16, "setDetectionLevel:", 2);
      }
      v34 = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("CreateFaceprint"));
      v37[0] = v12;
      v37[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v18;
      v20 = objc_msgSend(v32, "performRequests:error:", v19, &v33);
      v15 = v33;

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v12, "results");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "results");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0;
        if (v22 && v24)
        {
          objc_msgSend(v22, "faceprint");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setFaceprint:", v26);

          v25 = v24;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1025, v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v30;
        if (a5)
          *a5 = objc_retainAutorelease(v30);
        HMIErrorLog(self, v22);
        v25 = 0;
      }

      __HMISignpostScopeLeave(&v34);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1025, v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (a5)
        *a5 = objc_retainAutorelease(v28);
      HMIErrorLog(self, v29);

      v25 = 0;
      v15 = v18;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1025, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v27;
    if (a5)
      *a5 = objc_retainAutorelease(v27);
    HMIErrorLog(self, v16);
    v25 = 0;
  }

  return v25;
}

+ (__CVBuffer)createFacePixelBufferForFaceDetection:(id)a3 pixelBuffer:(__CVBuffer *)a4 roll:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  double Size;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  double Width;
  size_t Height;
  double v41;
  double v42;
  double v43;
  double v44;
  double x;
  double y;
  double v47;
  double v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  double v53;
  float v54;
  _BOOL4 v55;
  _BOOL4 v56;
  double v57;
  double v58;
  __CVBuffer *v59;
  double v60;
  float v61;
  double v62;
  double v63;
  __CVBuffer *v64;
  double v65;
  void *v66;
  id v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  float v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  CGFloat v92;
  __int16 v93;
  double v94;
  uint64_t v95;
  CGRect v96;
  NSRect v97;

  v95 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  Size = HMICVPixelBufferGetSize(a4);
  v13 = v12;
  objc_msgSend(v9, "unalignedBoundingBox");
  HMICGRectFlipCoordinateSpaceNormalized(v14, v15, v16, v17);
  HMICGRectSquareNormalized(v18, v19, v20, v21, Size, v13);
  v26 = HMIExpandFaceRect(v22, v23, v24, v25, 1.76470578);
  HMICGRectPixelFromNormalized(v26, v27, v28, v29, Size, v13);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v10, "floatValue");
  v80 = v37;
  v81 = v35;
  if (fabsf(v38) <= 0.175)
  {

    v44 = v37;
    v43 = v35;
    v42 = v33;
    v41 = v31;
    v10 = &unk_24DC154A0;
  }
  else
  {
    Width = (double)CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    v41 = HMICGRectExpandWithinLimit(v31, v33, v35, v37, Width, (double)Height, 1.4142);
  }
  v96 = CGRectIntegral(*(CGRect *)&v41);
  x = v96.origin.x;
  y = v96.origin.y;
  v47 = v96.size.width;
  v48 = v96.size.height;
  v49 = (void *)MEMORY[0x220735570]();
  v50 = a1;
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v97.origin.x = x;
    v97.origin.y = y;
    v97.size.width = v47;
    v97.size.height = v48;
    NSStringFromRect(v97);
    v53 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)buf = 138544386;
    v86 = v52;
    v87 = 2112;
    v88 = v53;
    v89 = 2048;
    v90 = Size;
    v91 = 2048;
    v92 = v13;
    v93 = 2048;
    v94 = v54 * 57.2957795;
    _os_log_impl(&dword_219D45000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Cropping face %@ from pixel buffer with dimensions: %.1f x %.1f roll: %.02f degrees", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v49);
  v55 = v47 < 256.0;
  v56 = v48 < 256.0;
  if (v55 && v56)
    v57 = v48;
  else
    v57 = 256.0;
  if (v55 && v56)
    v58 = v47;
  else
    v58 = 256.0;
  v84 = 0;
  v59 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a4, 1111970369, 8, &v84, x, y, v47, v48, v58, v57);
  v60 = COERCE_DOUBLE(v84);
  if (v59)
  {
    v61 = v31 - x;
    v63 = v80;
    v62 = v81;
    HMICGRectTransferToNewCoordinate(v31, v33, v81, v80, v58, v57, v61);
    objc_msgSend(v10, "floatValue");
    v83 = v60;
    v64 = +[HMIVisionUtilities transferPixelBuffer:rotationAngle:crop:size:precision:error:](HMIVisionUtilities, "transferPixelBuffer:rotationAngle:crop:size:precision:error:", v59, 0, &v83);
    v65 = COERCE_DOUBLE(*(id *)&v83);

    CVPixelBufferRelease(v59);
    v66 = (void *)MEMORY[0x220735570]();
    v67 = v50;
    HMFGetOSLogHandle();
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v64)
    {
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        *(_DWORD *)buf = 138543618;
        v86 = v70;
        v87 = 2048;
        v88 = v71 * 57.2957795;
        _os_log_impl(&dword_219D45000, v69, OS_LOG_TYPE_DEBUG, "%{public}@Face was rotated by:%.02f degrees", buf, 0x16u);

      }
LABEL_26:

      objc_autoreleasePoolPop(v66);
      goto LABEL_27;
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v76;
      v87 = 2112;
      v88 = v65;
      _os_log_impl(&dword_219D45000, v69, OS_LOG_TYPE_ERROR, "%{public}@Error in rotating the face %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v66);
    v60 = v65;
  }
  else
  {
    v72 = (void *)MEMORY[0x220735570]();
    v73 = v50;
    HMFGetOSLogHandle();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v75;
      v87 = 2112;
      v88 = v60;
      _os_log_impl(&dword_219D45000, v74, OS_LOG_TYPE_ERROR, "%{public}@Error pixel buffer type conversion %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v72);
    v63 = v80;
    v62 = v81;
  }
  v82 = v60;
  v64 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a4, 1111970369, 8, &v82, v31, v33, v62, v63, 128.0, 128.0);
  v65 = COERCE_DOUBLE(*(id *)&v82);

  if (!v64)
  {
    v66 = (void *)MEMORY[0x220735570]();
    v77 = v50;
    HMFGetOSLogHandle();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v78;
      v87 = 2112;
      v88 = v65;
      _os_log_impl(&dword_219D45000, v69, OS_LOG_TYPE_ERROR, "%{public}@HMIPrivateErrorCodeCropAndResizeFailed %@", buf, 0x16u);

    }
    v64 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return v64;
}

+ (__CVBuffer)createFacePixelBufferForFaceEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 roll:(id)a5 error:(id *)a6
{
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __CVBuffer *v19;

  v9 = a5;
  objc_msgSend(a3, "boundingBox");
  HMICGRectFlipCoordinateSpaceNormalized(v10, v11, v12, v13);
  objc_msgSend(MEMORY[0x24BDF9BB8], "faceObservationWithRequestRevision:unalignedBoundingBox:alignedBoundingBox:", 2, v14, v15, v16, v17, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[HMIFaceprinter createFacePixelBufferForFaceDetection:pixelBuffer:roll:error:](HMIFaceprinter, "createFacePixelBufferForFaceDetection:pixelBuffer:roll:error:", v18, a4, v9, a6);

  return v19;
}

- (__CVBuffer)createFacePixelBufferFromFaceCrop:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __CVBuffer *v8;
  double x;
  double Width;
  double Height;
  double y;
  __CVBuffer *v13;
  double Size;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  HMIFaceprinter *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  double v36;
  double v37;
  __CVBuffer *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  double v56;
  __int16 v57;
  CGFloat v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  NSRect v63;
  CGRect v64;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "dataRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HMIVisionUtilities createPixelBufferFromJPEGData:error:](HMIVisionUtilities, "createPixelBufferFromJPEGData:error:", v7, a4);

  if (v8)
  {
    objc_msgSend(v6, "faceBoundingBox");
    x = 0.0;
    v64.origin.x = 0.0;
    v64.origin.y = 0.0;
    v64.size.width = 1.0;
    v64.size.height = 1.0;
    if (CGRectEqualToRect(v60, v64))
    {
      Width = (double)CVPixelBufferGetWidth(v8);
      Height = (double)CVPixelBufferGetHeight(v8);
      y = 0.0;
    }
    else
    {
      Size = HMICVPixelBufferGetSize(v8);
      v16 = v15;
      objc_msgSend(v6, "faceBoundingBox");
      HMICGRectSquareNormalized(v17, v18, v19, v20, Size, v16);
      v25 = HMIExpandFaceRect(v21, v22, v23, v24, 1.76470578);
      HMICGRectPixelFromNormalized(v25, v26, v27, v28, Size, v16);
      v62 = CGRectIntegral(v61);
      x = v62.origin.x;
      y = v62.origin.y;
      Width = v62.size.width;
      Height = v62.size.height;
      v29 = (void *)MEMORY[0x220735570]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v63.origin.x = x;
        v63.origin.y = y;
        v63.size.width = Width;
        v63.size.height = Height;
        NSStringFromRect(v63);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v52 = v32;
        v53 = 2112;
        v54 = v33;
        v55 = 2048;
        v56 = Size;
        v57 = 2048;
        v58 = v16;
        _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_INFO, "%{public}@Cropping face %@ from face crop with dimensions %.1f x %.1f", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v29);
    }
    v34 = Width < 256.0;
    v35 = Height < 256.0;
    if (v34 && v35)
      v36 = Height;
    else
      v36 = 256.0;
    if (v34 && v35)
      v37 = Width;
    else
      v37 = 256.0;
    v50 = 0;
    v38 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", v8, 1111970369, 0, &v50, x, y, Width, Height, v37, v36);
    v39 = v50;
    CVPixelBufferRelease(v8);
    if (v38)
    {
      v40 = HMICGRectTransferToNewCoordinate(x, y, Width, Height, v37, v36, 0.0);
      v41 = v40;
      v49 = v39;
      LODWORD(v40) = 0;
      v13 = +[HMIVisionUtilities transferPixelBuffer:rotationAngle:crop:size:precision:error:](HMIVisionUtilities, "transferPixelBuffer:rotationAngle:crop:size:precision:error:", v38, 1, &v49, v40, v41, v42, v43, v44, 128.0, 128.0);
      v45 = v49;

      CVBufferRelease(v38);
      v39 = v45;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1021, v39);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (a4)
        *a4 = objc_retainAutorelease(v46);
      HMIErrorLog(self, v47);

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)generateFaceprintForFaceCrop:(id)a3 error:(id *)a4
{
  __CVBuffer *v6;
  __CVBuffer *v7;
  void *v8;

  v6 = -[HMIFaceprinter createFacePixelBufferFromFaceCrop:error:](self, "createFacePixelBufferFromFaceCrop:error:", a3);
  if (v6)
  {
    v7 = v6;
    -[HMIFaceprinter createFaceprintForFacePixelBuffer:fastMode:error:](self, "createFaceprintForFacePixelBuffer:fastMode:error:", v6, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CVBufferRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)updatedFaceprintsForFaceCrops:(id)a3 withExistingFaceprints:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  HMIFaceprinter *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  HMIFaceprinter *v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  HMIFaceprinter *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMIFaceprinter *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  HMIFaceprinter *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMIFaceprint *v57;
  void *v58;
  HMIFaceprinter *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HMIUpdatedFaceprintsResult *v65;
  __int128 v67;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  HMIFaceprint *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id obj;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v87 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_msgSend(v13, "faceCropUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "addObject:", v13);
        objc_msgSend(v13, "faceCropUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v77 = v6;
  v17 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
  v19 = self;
  if (v17)
  {
    v20 = v17;
    v21 = *(_QWORD *)v83;
    v70 = *MEMORY[0x24BDF9DE0];
    *(_QWORD *)&v18 = 138543362;
    v67 = v18;
    v76 = *(_QWORD *)v83;
    v79 = v8;
    do
    {
      v22 = 0;
      v75 = v20;
      do
      {
        if (*(_QWORD *)v83 != v21)
          objc_enumerationMutation(v77);
        v23 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v22);
        objc_msgSend(v23, "UUID", v67);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v25, "na_firstObjectPassingTest:", &__block_literal_global_15);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x220735570]();
          v29 = v19;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
          if (v27)
          {
            if (v31)
            {
              HMFGetLogIdentifier();
              v72 = v27;
              v32 = v20;
              v33 = v21;
              v34 = v19;
              v35 = v25;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v91 = v36;
              v92 = 2112;
              v93 = (uint64_t)v23;
              _os_log_impl(&dword_219D45000, v30, OS_LOG_TYPE_INFO, "%{public}@Using existing faceprint for face crop:%@", buf, 0x16u);

              v25 = v35;
              v19 = v34;
              v21 = v33;
              v20 = v32;
              v27 = v72;
            }

            objc_autoreleasePoolPop(v28);
            objc_msgSend(v74, "addObject:", v27);
            v8 = v79;
            goto LABEL_36;
          }
          if (v31)
          {
            HMFGetLogIdentifier();
            v37 = v25;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v37, "count");
            *(_DWORD *)buf = 138543874;
            v91 = v38;
            v92 = 2048;
            v93 = v39;
            v94 = 2112;
            v95 = v23;
            _os_log_impl(&dword_219D45000, v30, OS_LOG_TYPE_INFO, "%{public}@%lu faceprint(s) exist for face crop:%@ but are not the current version", buf, 0x20u);

            v25 = v37;
          }

          objc_autoreleasePoolPop(v28);
          v26 = objc_msgSend(v69, "unionSet:", v25);
        }
        v80 = v25;
        v40 = (void *)MEMORY[0x220735570](v26);
        v41 = v19;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v91 = v43;
          v92 = 2112;
          v93 = (uint64_t)v23;
          _os_log_impl(&dword_219D45000, v42, OS_LOG_TYPE_INFO, "%{public}@Faceprinting face crop:%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        v81 = 0;
        -[HMIFaceprinter generateFaceprintForFaceCrop:error:](v41, "generateFaceprintForFaceCrop:error:", v23, &v81);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v81;
        if (v44)
        {
          objc_msgSend(v44, "faceAttributes");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "facemaskCategory");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "label");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "identifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", v70);

          if (v49)
          {
            v50 = (void *)MEMORY[0x220735570]();
            v51 = v41;
            HMFGetOSLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v67;
              v91 = v53;
              _os_log_impl(&dword_219D45000, v52, OS_LOG_TYPE_INFO, "%{public}@Face crop has a facemask, creating sentinel faceprint", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v50);
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMIFaceprinter currentModelUUID](HMIFaceprinter, "currentModelUUID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMIFaceprint sentinelFaceprintWithUUID:modelUUID:faceCropUUID:](HMIFaceprint, "sentinelFaceprintWithUUID:modelUUID:faceCropUUID:", v54, v55, v56);
            v57 = (HMIFaceprint *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v73 = [HMIFaceprint alloc];
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "faceprint");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "descriptorData");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMIFaceprinter currentModelUUID](HMIFaceprinter, "currentModelUUID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUID");
            v63 = v46;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v73, "initWithUUID:data:modelUUID:faceCropUUID:", v54, v56, v62, v64);

            v46 = v63;
            v19 = self;
          }

          objc_msgSend(v71, "addObject:", v57);
          v8 = v79;
          v20 = v75;
          v21 = v76;
        }
        else
        {
          v58 = (void *)MEMORY[0x220735570]();
          v59 = v41;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v91 = v61;
            v92 = 2112;
            v93 = (uint64_t)v27;
            _os_log_impl(&dword_219D45000, v60, OS_LOG_TYPE_ERROR, "%{public}@Skipping crop, encountered error faceprinting: %@", buf, 0x16u);

            v21 = v76;
          }

          objc_autoreleasePoolPop(v58);
          v8 = v79;
        }

        v25 = v80;
LABEL_36:

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    }
    while (v20);
  }

  v65 = -[HMIUpdatedFaceprintsResult initWithExistingAtCurrentVersion:createdAtCurrentVersion:existingAtOtherVersions:]([HMIUpdatedFaceprintsResult alloc], "initWithExistingAtCurrentVersion:createdAtCurrentVersion:existingAtOtherVersions:", v74, v71, v69);
  return v65;
}

uint64_t __77__HMIFaceprinter_updatedFaceprintsForFaceCrops_withExistingFaceprints_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "modelUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIFaceprinter currentModelUUID](HMIFaceprinter, "currentModelUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

+ (int64_t)_minorVersionFromVisionVersion:(int)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x220735570](a1, a2);
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544386;
    v11 = v8;
    v12 = 1024;
    v13 = a3 >> 16;
    v14 = 1024;
    v15 = BYTE1(a3);
    v16 = 1024;
    v17 = a3;
    v18 = 1024;
    v19 = a3;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Vision run-time version: %d.%02d.%02d (%d)", (uint8_t *)&v10, 0x24u);

  }
  objc_autoreleasePoolPop(v5);
  return a3;
}

@end
