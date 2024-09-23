@implementation VNDetector

void __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  VNAsyncStatus *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  VNAsyncStatus *v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  int32x2_t v37;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E45459B8;
    v10 = v9;
    v29 = v10;
    v37 = vrev64_s32(*(int32x2_t *)(a1 + 120));
    v33 = *(_OWORD *)(a1 + 56);
    v35 = *(_OWORD *)(a1 + 88);
    v36 = *(_OWORD *)(a1 + 104);
    v34 = *(_QWORD *)(a1 + 72);
    v30 = *(id *)(a1 + 32);
    v31 = *(id *)(a1 + 40);
    v32 = *(id *)(a1 + 48);
    v11 = _Block_copy(aBlock);
    v27 = 0;
    v12 = VNExecuteBlock(v11, (uint64_t)&v27);
    v13 = v27;
    v14 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v12, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: finish processing; currentDetector: %@"),
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      (uint64_t)v10);
    kdebug_trace();

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v23);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
}

void __76__VNDetector_runSuccessReportingBlockSynchronously_detector_qosClass_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = VNExecuteBlock(v2, (uint64_t)&obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

void __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  VNAsyncStatus *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  VNAsyncStatus *v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  int v38;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E4545940;
    v38 = *(_DWORD *)(a1 + 116);
    v9 = WeakRetained;
    v31 = v9;
    v10 = *(_OWORD *)(a1 + 96);
    v36 = *(_OWORD *)(a1 + 80);
    v37 = v10;
    v32 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 64);
    v33 = v11;
    v35 = v12;
    v34 = *(id *)(a1 + 48);
    v13 = _Block_copy(aBlock);
    v29 = 0;
    v14 = VNExecuteBlock(v13, (uint64_t)&v29);
    v15 = v29;
    v16 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v14, v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@"),
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      (uint64_t)v9);
    kdebug_trace();

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v25);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
}

BOOL __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: start processing; currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 116), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: finish processing; currentDetector: %@"),
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(_QWORD *)(a1 + 32));
  kdebug_trace();
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
}

BOOL __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  _BOOL8 v13;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "completed") & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
    aBlock[3] = &unk_1E4545990;
    v16 = *(id *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 120);
    v10 = *(_OWORD *)(a1 + 88);
    v22 = *(_OWORD *)(a1 + 104);
    v11 = *(_OWORD *)(a1 + 72);
    v21 = v10;
    v20 = v11;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v12 = _Block_copy(aBlock);
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), 1uLL);
    objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v12, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 124), a2);
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), 1uLL);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;

  }
  else if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "error");
    v13 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v13;
}

uint64_t __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

BOOL __111__VNDetector_processUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  id v21;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v5 = kdebug_trace();
  v6 = (void *)MEMORY[0x1A1B0B060](v5);
  v7 = *(unsigned int *)(a1 + 112);
  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  v10 = *(double *)(a1 + 96);
  v11 = *(double *)(a1 + 104);
  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  objc_msgSend(v12, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v7, v4, v13, &v21, *(_QWORD *)(a1 + 56), v8, v9, v10, v11);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v21;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v14;

  objc_autoreleasePoolPop(v6);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v19 = v18 != 0;
  if (a2 && !v18)
    *a2 = objc_retainAutorelease(v15);

  kdebug_trace();
  return v19;
}

- (id)validatedImageBufferFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v6 = a3;
  v13 = 0;
  v7 = +[VNValidationUtilities getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:](VNValidationUtilities, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", &v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"), v6, objc_opt_class(), 1, 1, a4);
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VNDetector validateImageBuffer:error:](self, "validateImageBuffer:error:", v10, a4))
      v11 = v10;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)processUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  int v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  id v31;
  _QWORD aBlock[4];
  id v33;
  VNDetector *v34;
  id v35;
  id v36;
  uint64_t *v37;
  unint64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = objc_msgSend((id)objc_opt_class(), "VNClassCode");
  v21 = -[VNDetector signPostAdditionalParameter](self, "signPostAdditionalParameter");
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__14881;
  v49 = __Block_byref_object_dispose__14882;
  v50 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__VNDetector_processUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E4545918;
  v43 = a3;
  v22 = v17;
  v33 = v22;
  v34 = self;
  v44 = v20;
  v37 = &v45;
  v38 = v21;
  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  v23 = v18;
  v35 = v23;
  v24 = v19;
  v36 = v24;
  v25 = _Block_copy(aBlock);
  v31 = 0;
  v26 = VNExecuteBlock(v25, (uint64_t)&v31);
  v27 = v31;
  v28 = v27;
  if ((v26 & 1) != 0)
  {
    v29 = (id)v46[5];
  }
  else
  {
    v29 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v27);
  }

  _Block_object_dispose(&v45, 8);
  return v29;
}

+ (BOOL)runSuccessReportingBlockSynchronously:(id)a3 detector:(id)a4 qosClass:(unsigned int)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v9 = a3;
  v10 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14881;
  v28 = __Block_byref_object_dispose__14882;
  v29 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __76__VNDetector_runSuccessReportingBlockSynchronously_detector_qosClass_error___block_invoke;
  v19 = &unk_1E4545A08;
  v23 = a5;
  v21 = &v30;
  v11 = v9;
  v20 = v11;
  v22 = &v24;
  v12 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a5, 0, &v16);
  objc_msgSend(v10, "synchronizationQueue", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_msgSend(v10, "currentQueueIsSynchronizationQueue") & 1) == 0)
    objc_msgSend(v13, "dispatchSyncByPreservingQueueCapacity:", v12);
  else
    v12[2](v12);
  v14 = *((unsigned __int8 *)v31 + 24);
  if (a6 && !*((_BYTE *)v31 + 24))
    *a6 = objc_retainAutorelease((id)v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14 != 0;
}

- (VNControlledCapacityTasksQueue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (BOOL)currentQueueIsSynchronizationQueue
{
  VNControlledCapacityTasksQueue *synchronizationQueue;

  synchronizationQueue = self->_synchronizationQueue;
  if (synchronizationQueue)
    LOBYTE(synchronizationQueue) = -[VNControlledCapacityTasksQueue currentQueueIsSynchronizationQueue](synchronizationQueue, "currentQueueIsSynchronizationQueue");
  return (char)synchronizationQueue;
}

+ (unsigned)VNClassCode
{
  unsigned int v3;

  v3 = 0;
  +[VNClassRegistrar getClassCode:forClass:error:](VNClassRegistrar, "getClassCode:forClass:error:", &v3, a1, 0);
  return v3;
}

+ (id)detectorWithConfigurationOptions:(id)a3 forSession:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)objc_msgSend(a1, "detectorClassForConfigurationOptions:error:", v8, a5);
  if (v10)
  {
    v11 = (void *)objc_msgSend([v10 alloc], "initWithConfigurationOptions:", v8);
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "completeInitializationForSession:error:", v9, a5))
      {
        v13 = v12;
LABEL_9:

        goto LABEL_10;
      }
    }
    else if (a5)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v13 = 0;
    goto LABEL_9;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (unint64_t)signPostAdditionalParameter
{
  return 0;
}

- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  return 0;
}

+ (id)computeDeviceForComputeStage:(id)a3 configurationOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "supportedComputeStageDevicesForOptions:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
    {
      if (!a5)
      {
        v17 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No available compute device for %@"), v8);
      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v13);
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_msgSend(v12, "containsObject:", v14))
        {
          v18 = v14;
LABEL_20:
          v14 = v18;
          v17 = v18;
          goto LABEL_25;
        }
        if (a5)
        {
          +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", v14);
          v17 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
LABEL_24:
        v17 = 0;
        goto LABEL_25;
      }
      v15 = v14;
      objc_msgSend(a1, "computeDeviceForConfiguredProcessingDeviceBridge:computeStage:supportedComputeDevices:error:", v15, v8, v12, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_8:

        v17 = v14;
LABEL_25:

        goto LABEL_26;
      }
      if (objc_msgSend(v12, "containsObject:", v14))
      {
        v16 = v14;
        goto LABEL_8;
      }

    }
    +[VNComputeDeviceUtilities mostPerformantComputeDeviceOfComputeDevices:](VNComputeDeviceUtilities, "mostPerformantComputeDeviceOfComputeDevices:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v18 = v19;
      goto LABEL_20;
    }
    if (a5)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      NSStringFromClass((Class)a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ could not resolve a compute device"), v21);

      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
    goto LABEL_24;
  }
  v17 = 0;
LABEL_28:

  return v17;
}

+ (Class)detectorClassForDetectorType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  +[VNDetector _detectorClassForDetectorType:options:detectorCreationOptions:error:]((uint64_t)a1, a3, a4, 0, (uint64_t)a5);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)fullyPopulatedConfigurationOptionsWithOverridingOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "recordDefaultConfigurationOptionsInDictionary:", v5);
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  objc_msgSend(a1, "fullyPopulateConfigurationOptions:", v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNDetectorInternalOption_ModelComputeDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorInternalOption_ModelComputeDevice"));

  }
  return v5;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E459C9B8, CFSTR("VNDetectorInitOption_ModelBackingStore"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E459C9B8, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E459C9B8, CFSTR("VNDetectorOption_RequestDetectionLevel"));

}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("VNDetectorProcessOption_InputImageBuffers"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("VNDetectorProcessOption_Canceller"));

}

+ (Class)detectorClassForDetectorType:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  if (_detectorTypeToClassDictionary(void)::onceToken != -1)
    dispatch_once(&_detectorTypeToClassDictionary(void)::onceToken, &__block_literal_global_430);
  v6 = (id)_detectorTypeToClassDictionary(void)::ourDetectorTypeToClassLookup;
  v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown detector type '%@'"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v8;
}

+ (BOOL)loadedInstanceWithBoundComputeStageDevices:(id)a3 canBeUsedForRequestedComputeStageDevices:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(a1) = (objc_msgSend(v14, "isEqual:", v12) & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                    && (objc_msgSend(a1, "loadedInstanceWithComputeDevice:boundToComputeStage:canBeUsedForProcessingDeviceBridge:", v12, v11, v14) & 1) != 0;

          v13 = 0;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_16:

  return (v13 | a1) & 1;
}

- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v6 = a4;
  -[objc_class keyForDetectorWithConfigurationOptions:](a3, "keyForDetectorWithConfigurationOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  -[VNDetector configurationOptions](self, "configurationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyForDetectorWithConfigurationOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqual:", v10) & 1) != 0)
  {
    -[VNDetector boundComputeStageDevices](self, "boundComputeStageDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    if (v11)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || (v13 = objc_msgSend((id)objc_opt_class(), "loadedInstanceWithBoundComputeStageDevices:canBeUsedForRequestedComputeStageDevices:", v11, v12), v12, (v13 & 1) == 0))
      {
        v14 = 0;
      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "configurationOptionKeysForDetectorKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", (objc_msgSend(v15, "count") << 6) + 64);
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v15;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "detectorKeyComponentForDetectorConfigurationOptionKey:value:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR(":%@=%@"), v10, v12);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

+ (id)detectorKeyComponentForDetectorConfigurationOptionKey:(id)a3 value:(id)a4
{
  return a4;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *boundComputeStageDevices;
  void *v11;
  void *v12;
  unint64_t v13;
  VNMetalContext *v14;
  VNMetalContext *metalContext;
  BOOL v16;

  -[VNDetector configurationOptions](self, "configurationOptions", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_computeStageDeviceBindingsForConfiguration:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (NSDictionary *)objc_msgSend(v7, "copy");
    boundComputeStageDevices = self->_boundComputeStageDevices;
    self->_boundComputeStageDevices = v9;

    self->_backingStore = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "unsignedIntegerValue");
      if (v13 < 3)
        self->_backingStore = v13;
    }
    v16 = 1;
    if (-[VNDetector needsMetalContext](self, "needsMetalContext"))
    {
      v14 = -[VNDetector newMetalContextForConfigurationOptions:error:](self, "newMetalContextForConfigurationOptions:error:", v6, a4);
      metalContext = self->_metalContext;
      self->_metalContext = v14;

      if (!self->_metalContext)
        v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDictionary)configurationOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)needsMetalContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[VNDetector configurationOptions](self, "configurationOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "computeStageDevicesForConfigurationOptions:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = +[VNComputeDeviceUtilities isGPUComputeDevice:](VNComputeDeviceUtilities, "isGPUComputeDevice:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)computeStageDevicesForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "supportedComputeStageDevicesForOptions:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(a1, "computeDeviceForComputeStage:configurationOptions:error:", v13, v6, a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {

            v15 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }

    v15 = v8;
LABEL_12:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_computeStageDeviceBindingsForConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "computeStagesToBindForConfigurationOptions:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1, "computeDeviceForComputeStage:configurationOptions:error:", v12, v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v14 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v7, "setObject:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = v7;
LABEL_11:

  return v14;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD *v37;
  id v38[5];
  unsigned int v39;
  int v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  _QWORD *v46;
  id v47[5];
  int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];
  id location[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a4;
  v18 = a6;
  v30 = a8;
  objc_initWeak(location, self);
  LODWORD(a8) = objc_msgSend((id)objc_opt_class(), "VNClassCode", v18, v17);
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__14881;
  v60 = __Block_byref_object_dispose__14882;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__14881;
  v54 = __Block_byref_object_dispose__14882;
  v55 = 0;
  v19 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
  block[3] = &unk_1E4545968;
  block[1] = 3221225472;
  objc_copyWeak(v47, location);
  v45 = &v50;
  v48 = (int)a8;
  v49 = a3;
  v47[1] = *(id *)&x;
  v47[2] = *(id *)&y;
  v47[3] = *(id *)&width;
  v47[4] = *(id *)&height;
  v20 = v17;
  v42 = v20;
  v21 = v18;
  v43 = v21;
  v46 = v62;
  v22 = v30;
  v44 = v22;
  v23 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __119__VNDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
  v31[3] = &unk_1E45459E0;
  objc_copyWeak(v38, location);
  v39 = a3;
  v40 = (int)a8;
  v35 = &v50;
  v36 = &v56;
  v38[1] = *(id *)&x;
  v38[2] = *(id *)&y;
  v38[3] = *(id *)&width;
  v38[4] = *(id *)&height;
  v37 = v62;
  v24 = v20;
  v32 = v24;
  v25 = v21;
  v33 = v25;
  v26 = v22;
  v34 = v26;
  v27 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v31);
  v23[2](v23);
  v27[2](v27);
  if (+[VNValidationUtilities validateAsyncStatusResult:error:](VNValidationUtilities, "validateAsyncStatusResult:error:", v51[5], a7))
  {
    v28 = (id)v57[5];
  }
  else
  {
    v28 = 0;
  }

  objc_destroyWeak(v38);
  objc_destroyWeak(v47);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(v62, 8);
  objc_destroyWeak(location);

  return v28;
}

+ (BOOL)loadedInstanceWithComputeDevice:(id)a3 boundToComputeStage:(id)a4 canBeUsedForProcessingDeviceBridge:(id)a5
{
  id v6;
  unint64_t v7;
  void *v8;

  v6 = a5;
  v7 = +[VNComputeDeviceUtilities typeOfComputeDevice:](VNComputeDeviceUtilities, "typeOfComputeDevice:", a3);
  objc_msgSend(v6, "computeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v7 == +[VNComputeDeviceUtilities typeOfComputeDevice:](VNComputeDeviceUtilities, "typeOfComputeDevice:", v8);

  return v7;
}

+ (id)computeDeviceForConfiguredProcessingDeviceBridge:(id)a3 computeStage:(id)a4 supportedComputeDevices:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "computeDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNComputeDeviceUtilities computeDeviceOfComputeDevices:mostCompatibleWithComputeDevice:options:](VNComputeDeviceUtilities, "computeDeviceOfComputeDevices:mostCompatibleWithComputeDevice:options:", v9, v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[VNComputeDeviceUtilities mostPerformantComputeDeviceOfComputeDevices:](VNComputeDeviceUtilities, "mostPerformantComputeDeviceOfComputeDevices:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (a6)
      {
        objc_msgSend(v8, "processingDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForUnsupportedProcessingDevice:](VNError, "errorForUnsupportedProcessingDevice:", v12);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)validateImageBuffer:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];

  v6 = a3;
  v7 = objc_msgSend(v6, "width");
  v8 = objc_msgSend(v6, "height");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__VNDetector_validateImageBuffer_error___block_invoke;
  v10[3] = &unk_1E4548D28;
  v10[4] = self;
  LOBYTE(a4) = +[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", v7, v8, v10, a4);

  return (char)a4;
}

- (VNDetector)initWithConfigurationOptions:(id)a3
{
  id v4;
  VNDetector *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  VNControlledCapacityTasksQueue *synchronizationQueue;
  uint64_t v11;
  NSDictionary *configurationOptions;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNDetector;
  v5 = -[VNDetector init](&v14, sel_init);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    if ((-[objc_class isReentrant](v6, "isReentrant") & 1) == 0)
    {
      +[VNDetectorSyncTasksQueueCache sharedCache](VNDetectorSyncTasksQueueCache, "sharedCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queueWithUniqueAppendix:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      synchronizationQueue = v5->_synchronizationQueue;
      v5->_synchronizationQueue = (VNControlledCapacityTasksQueue *)v9;

    }
    v11 = objc_msgSend(v4, "copy");
    configurationOptions = v5->_configurationOptions;
    v5->_configurationOptions = (NSDictionary *)v11;

    v5->_detectorMultiSessionAccessLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

+ (BOOL)isReentrant
{
  return 0;
}

- (id)boundComputeDeviceForComputeStage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  -[VNDetector boundComputeStageDevices](self, "boundComputeStageDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else if (a4)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ was not bound to a compute device"), v6);
    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSDictionary)boundComputeStageDevices
{
  return self->_boundComputeStageDevices;
}

void __51__VNDetector_configurationOptionKeysForDetectorKey__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("VNDetectorOption_EspressoPlanPriority");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v0);
  v2 = (void *)+[VNDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v1;

}

+ (id)configurationOptionKeysForDetectorKey
{
  if (+[VNDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNDetector configurationOptionKeysForDetectorKey]::onceToken, &__block_literal_global_14955);
  return (id)+[VNDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  return 1;
}

+ (BOOL)areExistingInitializationOptions:(id)a3 compatibleWithOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = sub_1A15A8AF0();
  v5 = sub_1A15A8AF0();
  swift_getObjCClassMetadata();
  v6 = sub_1A13382E4(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)produceObservationsWithRegionOfInterest:(CGRect)a3 detectorProcessingOptions:(NSDictionary *)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  CGFloat *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSDictionary *v20;
  VNDetector *v21;
  uint64_t v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5FFB40);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a5);
  v16 = (CGFloat *)swift_allocObject();
  v16[2] = x;
  v16[3] = y;
  v16[4] = width;
  v16[5] = height;
  *((_QWORD *)v16 + 6) = a4;
  *((_QWORD *)v16 + 7) = v15;
  *((_QWORD *)v16 + 8) = self;
  v17 = sub_1A15A8D48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EE5FFB50;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EE5FFB60;
  v19[5] = v18;
  v20 = a4;
  v21 = self;
  sub_1A1338A9C((uint64_t)v14, (uint64_t)&unk_1EE5FFB70, (uint64_t)v19);
  swift_release();
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "VNClassCode");
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)VNDetector;
  -[VNDetector dealloc](&v3, sel_dealloc);
}

- (BOOL)useGPU
{
  return self->_metalContext != 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ does not implement %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v15);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ does not implement %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v15);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)newMetalContextForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[VNComputeDeviceUtilities metalDeviceForComputeDevice:](VNComputeDeviceUtilities, "metalDeviceForComputeDevice:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)getOptionalCanceller:(id *)a3 inOptions:(id)a4 error:(id *)a5
{
  id v7;

  v7 = a4;
  LOBYTE(a5) = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", a3, objc_opt_class(), CFSTR("VNDetectorProcessOption_Canceller"), v7, a5);

  return (char)a5;
}

- (id)requiredCancellerInOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNDetectorProcessOption_Canceller"), v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)computeDeviceForComputeStage:(id)a3 processingOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  -[VNDetector boundComputeStageDevices](self, "boundComputeStageDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_9:
    -[VNDetector configurationOptions](self, "configurationOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "addEntriesFromDictionary:", v9);
    objc_msgSend((id)objc_opt_class(), "computeDeviceForComputeStage:configurationOptions:error:", v8, v16, a5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(v11, "isEqual:", v13))
  {
LABEL_8:
    v14 = v11;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  if (a5)
  {
    +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", v13);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_10:

  return v14;
}

- (id)computeDeviceOfTypes:(unint64_t)a3 forComputeStage:(id)a4 processingOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a4;
  v11 = a5;
  -[VNDetector computeDeviceForComputeStage:processingOptions:error:](self, "computeDeviceForComputeStage:processingOptions:error:", v10, v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_6;
  if (!+[VNComputeDeviceUtilities computeDevice:isOneTypeOfTypes:](VNComputeDeviceUtilities, "computeDevice:isOneTypeOfTypes:", v12, a3))
  {
    if (a6)
    {
      +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", v12);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  v13 = v12;
LABEL_7:

  return v13;
}

- (void)recordImageCropQuickLookInfoToOptions:(id)a3 cacheKey:(id)a4 imageBuffer:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addPointer:", v7);
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPointer:", v8);
  objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("VNDetectorInternalProcessOption_CacheKeys"));
  objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("VNDetectorInternalProcessOption_ImageBuffers"));

}

- (void)recordImageCropQuickLookInfoFromOptions:(id)a3 toObservation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "objectForKey:", CFSTR("VNDetectorInternalProcessOption_CacheKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestImageBuffersCacheKeys:", v6);
  objc_msgSend(v8, "objectForKey:", CFSTR("VNDetectorInternalProcessOption_ImageBuffers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestImageBuffers:", v7);

}

- (void)recordImageCropQuickLookInfoToOptionsSafe:(id)a3 cacheKey:(id)a4 imageBuffer:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_detectorMultiSessionAccessLock);
  -[VNDetector recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptions:cacheKey:imageBuffer:", v10, v8, v9);
  os_unfair_lock_unlock(&self->_detectorMultiSessionAccessLock);

}

- (void)recordImageCropQuickLookInfoFromOptionsSafe:(id)a3 toObservation:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_detectorMultiSessionAccessLock);
  -[VNDetector recordImageCropQuickLookInfoFromOptions:toObservation:](self, "recordImageCropQuickLookInfoFromOptions:toObservation:", v7, v6);
  os_unfair_lock_unlock(&self->_detectorMultiSessionAccessLock);

}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VNDetector;
  -[VNDetector description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDetector boundComputeStageDevices](self, "boundComputeStageDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __25__VNDetector_description__block_invoke;
    v13 = &unk_1E4545A30;
    v6 = v5;
    v14 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v10);
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" bound to [%@]"), v7, v10, v11, v12, v13);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  return (NSString *)v3;
}

- (VNMetalContext)metalContext
{
  return self->_metalContext;
}

- (unint64_t)backingStore
{
  return self->_backingStore;
}

- (void)setSynchronizationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_configurationOptions, 0);
  objc_storeStrong((id *)&self->_boundComputeStageDevices, 0);
}

void __25__VNDetector_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ --> %@"), v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __40__VNDetector_validateImageBuffer_error___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "detectorName");
}

+ (VNControlledCapacityTasksQueue)detectorCropCreationAsyncTasksQueue
{
  void *v2;
  void *v3;

  +[VNDetectorAsyncTasksQueueCache sharedCache](VNDetectorAsyncTasksQueueCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueWithUniqueAppendix:", CFSTR("CropCreation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNControlledCapacityTasksQueue *)v3;
}

+ (VNControlledCapacityTasksQueue)detectorCropProcessingAsyncTasksQueue
{
  void *v2;
  void *v3;

  +[VNDetectorAsyncTasksQueueCache sharedCache](VNDetectorAsyncTasksQueueCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueWithUniqueAppendix:", CFSTR("CropProcessing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNControlledCapacityTasksQueue *)v3;
}

+ (VNControlledCapacityTasksQueue)detectorInternalProcessingAsyncTasksQueue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  +[VNDetectorAsyncTasksQueueCache sharedCache](VNDetectorAsyncTasksQueueCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queueWithUniqueAppendix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "maximumTasksCount") >= 5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "maximumAllowedTasksInTheQueue");
    if (v6 >= 4)
      v7 = 4;
    else
      v7 = v6;
    objc_msgSend(v5, "setMaximumTasksCount:", v7);
  }

  return (VNControlledCapacityTasksQueue *)v5;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 0;
}

+ (Class)detectorClassAndConfigurationOptions:(id *)a3 forDetectorType:(id)a4 options:(id)a5 error:(id *)a6
{
  +[VNDetector _detectorClassForDetectorType:options:detectorCreationOptions:error:]((uint64_t)a1, a4, a5, a3, (uint64_t)a6);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)detectorName
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  int v8;
  id v9;
  int v10;
  id v11;
  id v13;
  id v14;

  NSStringFromClass((Class)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("VN")) & 1) != 0)
  {
    objc_msgSend(v2, "substringFromIndex:", 2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v3, "length") + 5);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    while ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
    {
      v14 = 0;
      v8 = objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", v4, &v14);
      v9 = v14;
      if (v8)
        objc_msgSend(v5, "appendString:", v9);
      v13 = v9;
      v10 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v4, &v13);
      v11 = v13;

      if (v10)
      {
        if ((v7 & 1) != 0)
          objc_msgSend(v5, "appendString:", CFSTR(" "));
        objc_msgSend(v5, "appendString:", v11);
        v7 = 1;
      }

    }
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

+ (id)supportedImageSizeSetForEspressoModelAtPath:(id)a3 inputImageBlobName:(id)a4 analysisPixelFormatType:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6;
  VNSupportedImageSize *v7;
  VNSupportedImageSize *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v6 = *(_QWORD *)&a5;
  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = 0;
  if (!+[VNEspressoHelpers getWidth:height:ofBlobNamed:forNetworkModelFileWithPath:error:](VNEspressoHelpers, "getWidth:height:ofBlobNamed:forNetworkModelFileWithPath:error:", &v12, &v11, a4, a3, a6))return 0;
  v7 = [VNSupportedImageSize alloc];
  v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:](v7, "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", v6, v12, v11, 1, 0, 0);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_detectorClassForDetectorType:(void *)a3 options:(_QWORD *)a4 detectorCreationOptions:(uint64_t)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a2;
  v9 = a3;
  v10 = (void *)objc_msgSend((id)objc_opt_self(), "detectorClassForDetectorType:error:", v8, a5);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "fullyPopulatedConfigurationOptionsWithOverridingOptions:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "detectorClassForConfigurationOptions:error:", v12, a5);
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      v14 = v13;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
