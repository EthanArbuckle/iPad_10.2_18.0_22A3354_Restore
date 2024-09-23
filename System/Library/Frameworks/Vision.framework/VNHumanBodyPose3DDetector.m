@implementation VNHumanBodyPose3DDetector

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  VNSupportedImageSize *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", 1111970369, 288, 192, 1, 1, 0);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!AltruisticBodyPoseKitLibraryCore(char **)::frameworkLibrary)
  {
    v13 = xmmword_1E4545BF0;
    v14 = 0;
    AltruisticBodyPoseKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (AltruisticBodyPoseKitLibraryCore(char **)::frameworkLibrary)
  {
    +[VNComputeDeviceUtilities allNeuralEngineComputeDevices](VNComputeDeviceUtilities, "allNeuralEngineComputeDevices", CFSTR("VNComputeStageMain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities computeDevicesOfTypes:](VNComputeDeviceUtilities, "computeDevicesOfTypes:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VNHumanBodyPose3DDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __66__VNHumanBodyPose3DDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNHumanBodyPose3DDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  objc_super v9[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9[0].receiver = self;
  v9[0].super_class = (Class)VNHumanBodyPose3DDetector;
  if (!-[objc_super completeInitializationForSession:error:](v9, sel_completeInitializationForSession_error_, v6, a4))
    goto LABEL_8;
  if (!AltruisticBodyPoseKitLibraryCore(char **)::frameworkLibrary)
  {
    v9[1] = (objc_super)xmmword_1E4545BF0;
    v10 = 0;
    AltruisticBodyPoseKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (!AltruisticBodyPoseKitLibraryCore(char **)::frameworkLibrary)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNDetectHumanBodyPose3DRequest is unavailable on this device."));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (int64_t)_abpkOrientationFromExifOrientation:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return qword_1A15E41E0[a3 - 1];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __CVBuffer *v25;
  id v26;
  void *v27;
  __int128 *v28;
  __int128 v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  BOOL v36;
  __int128 v37;
  id v38;
  double *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  int v44;
  int v45;
  size_t BytesPerRow;
  int v47;
  int v48;
  char *BaseAddress;
  char *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  id v55;
  id v56;
  CVPixelBufferRef pixelBuffer;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61[2];
  CGRect v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "width");
    v20 = objc_msgSend(v18, "height");
    v62.origin.x = x * (double)v19;
    v62.size.width = width * (double)v19;
    v62.origin.y = y * (double)v20;
    v62.size.height = height * (double)v20;
    v63 = CGRectIntegral(v62);
    v21 = v63.origin.x;
    v22 = v63.origin.y;
    v23 = v63.size.width;
    v24 = v63.size.height;
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_RequiresDepth"));
    v61[0] = 0;
    v25 = (__CVBuffer *)objc_msgSend(v18, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", 580, 1111970369, v16, a8, v61, v21, v22, v23, v24);
    v26 = v61[0];
    *a7 = v25;
    if (!v25)
    {
      v36 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v27 = (void *)CVBufferCopyAttachment(v25, CFSTR("VNDepthRepresentationAttachment"), 0);
    v28 = (__int128 *)MEMORY[0x1E0C83FE8];
    v29 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v58 = *MEMORY[0x1E0C83FE8];
    v59 = v29;
    v60 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    v56 = v27;
    if (v27)
    {
      objc_msgSend(v27, "cameraIntrinsics");
      DWORD2(v58) = v30;
      DWORD2(v59) = v31;
      *(_QWORD *)&v58 = v32;
      *(_QWORD *)&v59 = v33;
      DWORD2(v60) = v34;
      *(_QWORD *)&v60 = v35;
    }
    else if ((objc_msgSend(v18, "getCameraIntrinsicsAvailable:", &v58) & 1) == 0)
    {
      v37 = v28[1];
      v58 = *v28;
      v59 = v37;
      v60 = v28[2];
    }
    v38 = objc_alloc((Class)getABPKCameraParamsClass());
    v39 = (double *)MEMORY[0x1E0C83FF0];
    v40 = (void *)objc_msgSend(v38, "initWithIntrinsics:andExtrinsics:andDistortion:andInputResolution:", *(double *)&v58, *(double *)&v59, *(double *)&v60, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48), 0.0, (double)(unint64_t)objc_msgSend(v18, "width"), (double)(unint64_t)objc_msgSend(v18, "height"));
    if (!v40)
    {
      v36 = 0;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v40, "setDeviceOrientation:", -[VNHumanBodyPose3DDetector _abpkOrientationFromExifOrientation:](self, "_abpkOrientationFromExifOrientation:", objc_msgSend(v18, "orientation")));
    v41 = objc_alloc_init((Class)getABPKInputClass());
    if (v41)
    {
      objc_msgSend(v41, "setTimestamp:", CFAbsoluteTimeGetCurrent());
      objc_msgSend(v41, "setVioPose:", *v39, v39[2], v39[4], v39[6]);
      objc_msgSend(v41, "setIsVioPoseValid:", 1);
      objc_msgSend(v41, "setCameraParams:", v40);
      objc_msgSend(v41, "setImage:", *a7);
      if (v56 && objc_msgSend(v56, "absoluteAccuracy"))
      {
        v42 = objc_retainAutorelease(v56);
        objc_msgSend(v41, "setDepthMap:", objc_msgSend(v42, "depthBuffer"));
        v43 = objc_retainAutorelease(v42);
        v44 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v43, "depthBuffer"));
        v45 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(objc_retainAutorelease(v43), "depthBuffer"));
        pixelBuffer = 0;
        if (VNCVPixelBufferCreateUsingIOSurface(v44, v45, 0x66646570u, 0, &pixelBuffer))
        {
          if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create depth confidence buffer "));
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_19;
        }
        CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        v55 = v26;
        BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
        v47 = CVPixelBufferGetWidth(pixelBuffer);
        v48 = CVPixelBufferGetHeight(pixelBuffer);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (v48 >= 1)
        {
          v50 = BaseAddress;
          v51 = v48;
          v52 = 0;
          v53 = v51;
          do
          {
            if (v47 >= 1)
              memset_pattern16(&v50[v52 >> 30], &unk_1A15FB810, 4 * v47);
            v52 += BytesPerRow >> 2 << 32;
            --v53;
          }
          while (v53);
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        objc_msgSend(v41, "setDepthConfidenceBuffer:", pixelBuffer);
        objc_msgSend(v41, "setIsDepthDataValid:", 1);
        v26 = v55;
      }
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v16, v26, v18);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v40, CFSTR("VNHumanBodyPose3DDetectorInternalProcessOption_ABPKCameraParams"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v41, CFSTR("VNHumanBodyPose3DDetectorInternalProcessOption_ABPKInput"));
      v36 = 1;
      goto LABEL_27;
    }
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create HumanBodyPose3D pipeline input "));
      v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
LABEL_19:
    v36 = 0;
    goto LABEL_27;
  }
  v36 = 0;
LABEL_30:

  return v36;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  VNHumanBodyPose3DObservation *v31;
  double v33;
  double v34;
  double v35;
  void *v36;
  VNHumanBody3DOutput *v37;
  VNHumanBody3DOutput *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v13 = a5;
  v14 = a7;
  v41 = a9;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v15 = (void *)getABPKOutputClass(void)::softClass;
  v47 = getABPKOutputClass(void)::softClass;
  if (!getABPKOutputClass(void)::softClass)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = ___ZL18getABPKOutputClassv_block_invoke;
    v43[3] = &unk_1E4548FA8;
    v43[4] = &v44;
    ___ZL18getABPKOutputClassv_block_invoke((uint64_t)v43);
    v15 = (void *)v45[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v44, 8);
  v17 = objc_alloc_init(v16);
  if (v17)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNHumanBodyPose3DDetectorProcessOption_ABPKPipeline"), v13, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bodyPosePipeline");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", getABPKInputClass(), CFSTR("VNHumanBodyPose3DDetectorInternalProcessOption_ABPKInput"), v13, a8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "runABPKAlgorithmWithInputData:andGetOutput:", v20, v17);
      CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v20, "depthConfidenceBuffer"));
      objc_msgSend(v20, "setDepthConfidenceBuffer:", 0);
      v21 = objc_msgSend(v17, "algorithmReturnCode");
      if (v21)
      {
        if (v21 == -6660)
        {
          if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to run HumanBodyPose3D pipeline"));
            v22 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }
        }
        else
        {
          v22 = v42;
        }
        v23 = v41;
      }
      else
      {
        +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v40 = v24;
          +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", getABPKCameraParamsClass(), CFSTR("VNHumanBodyPose3DDetectorInternalProcessOption_ABPKCameraParams"), v13, a8);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = [VNHumanBody3DOutput alloc];
          objc_msgSend(v17, "liftingSkeletonABPK");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "cameraParams");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "intrinsics");
          v34 = v27;
          v35 = v26;
          v33 = v28;
          objc_msgSend(v36, "inputRes");
          v38 = -[VNHumanBody3DOutput initWithSkeleton:intrinsics:inputSize:](v37, "initWithSkeleton:intrinsics:inputSize:", v39, v35, v34, v33, v29, v30);

          v31 = -[VNRecognizedPoints3DObservation initWithOriginatingRequestSpecifier:keypointsReturningObject:]([VNHumanBodyPose3DObservation alloc], "initWithOriginatingRequestSpecifier:keypointsReturningObject:", v40, v38);
          if (v31)
          {
            -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v13, v31);
            objc_msgSend(v42, "addObject:", v31);
            v22 = v42;
          }
          else if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create observation"));
            v22 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }

          v24 = v40;
          v23 = v41;
        }
        else
        {
          v22 = 0;
          v23 = v41;
        }

      }
    }
    else
    {
      v22 = 0;
      v23 = v41;
    }

  }
  else
  {
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to create HumanBodyPose3D output "));
      v22 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v23 = v41;
  }

  return v22;
}

@end
