@implementation VNRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_cancellationQueue, 0);
  objc_storeStrong((id *)&self->_cancellationSemaphore, 0);
  objc_storeStrong((id *)&self->_canceller, 0);
  objc_storeStrong((id *)&self->_asyncStatus, 0);
  objc_storeStrong((id *)&self->_warningRecorder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setProcessingDevice:(id)a3
{
  VNProcessingDeviceComputeDeviceBridge *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v4 = -[VNProcessingDeviceComputeDeviceBridge initWithProcessingDevice:]([VNProcessingDeviceComputeDeviceBridge alloc], "initWithProcessingDevice:", v9);
  -[VNRequest supportedComputeStageDevicesAndReturnError:](self, "supportedComputeStageDevicesAndReturnError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNProcessingDeviceComputeDeviceBridge computeDevice](v4, "computeDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) != 0)
    -[VNRequestConfiguration setProcessingDevice:](self->_configuration, "setProcessingDevice:", v9);

}

void __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  VNAsyncStatus *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  char v34;

  VNValidatedLog(1, (uint64_t)CFSTR("processFaceBlock: start processing: %@"), a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 96));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_4;
  aBlock[3] = &unk_1E4543F68;
  v33 = *(_DWORD *)(a1 + 136);
  v34 = *(_BYTE *)(a1 + 140);
  v29 = *(id *)(a1 + 64);
  v30 = *(_OWORD *)(a1 + 80);
  v26 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 120);
  v31 = *(_OWORD *)(a1 + 104);
  v32 = v10;
  v11 = *(_QWORD *)(a1 + 48);
  v27 = v9;
  v28 = v11;
  v12 = _Block_copy(aBlock);
  v24 = 0;
  v13 = VNExecuteBlock(v12, (uint64_t)&v24);
  v14 = v24;
  v15 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v13, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  VNValidatedLog(1, (uint64_t)CFSTR("processFaceBlock: finish processing: %@"), v18, v19, v20, v21, v22, v23, *(_QWORD *)(a1 + 96));
  if (!*(_BYTE *)(a1 + 141))
    objc_msgSend(*(id *)(a1 + 56), "dispatchReportBlockCompletion");

}

void __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48));
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48));

}

BOOL __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL8 result;
  id v9;

  if (*(_BYTE *)(a1 + 116))
  {
    if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL))
    {
      if (a2)
      {
        +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = v4;
        result = 0;
        *a2 = v9;
        return result;
      }
      return 0;
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "completed") & 1) == 0)
    {
      if (a2)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "error");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      return 0;
    }
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("VNDetectorProcessOption_InputFaceObservations"));
  objc_msgSend(*(id *)(a1 + 40), "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", *(unsigned int *)(a1 + 112), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a2, 0, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
}

- (void)setModelFileBackingStore:(unint64_t)a3
{
  -[VNRequestConfiguration setModelFileBackingStore:](self->_configuration, "setModelFileBackingStore:", a3);
}

- (void)setIoSurfaceMemoryPoolId:(unint64_t)a3
{
  -[VNRequestConfiguration setMemoryPoolId:](self->_configuration, "setMemoryPoolId:", a3);
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRequest modelFileBackingStore](self, "modelFileBackingStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("VNDetectorInitOption_ModelBackingStore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VNRequest ioSurfaceMemoryPoolId](self, "ioSurfaceMemoryPoolId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("VNDetectorInitOption_MemoryPoolId"));

  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", -[VNRequest frameworkClass](self, "frameworkClass"), a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  -[VNRequest resolvedComputeStageDeviceAssignments](self, "resolvedComputeStageDeviceAssignments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRequest preferBackgroundProcessing](self, "preferBackgroundProcessing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("VNDetectorOption_PreferBackgroundProcessing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRequest modelExecutionPriority](self, "modelExecutionPriority"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorOption_EspressoPlanPriority"));

  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("VNDetectorProcessOption_Session"));
  -[VNRequest cancellerAndReturnError:](self, "cancellerAndReturnError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_Canceller"));

  return v7;
}

- (Class)frameworkClass
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return VNRequestClassFromClientSubclass(v2);
}

- (NSDictionary)resolvedComputeStageDeviceAssignments
{
  return -[VNRequestConfiguration resolvedComputeStageDeviceAssignments](self->_configuration, "resolvedComputeStageDeviceAssignments");
}

- (unint64_t)ioSurfaceMemoryPoolId
{
  return -[VNRequestConfiguration memoryPoolId](self->_configuration, "memoryPoolId");
}

- (BOOL)preferBackgroundProcessing
{
  return -[VNRequestConfiguration preferBackgroundProcessing](self->_configuration, "preferBackgroundProcessing");
}

- (unint64_t)modelFileBackingStore
{
  return -[VNRequestConfiguration modelFileBackingStore](self->_configuration, "modelFileBackingStore");
}

- (id)cancellerAndReturnError:(id *)a3
{
  os_unfair_lock_s *p_cancellationResourcesLock;
  VNCanceller *v6;
  VNCanceller *v7;
  __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;

  p_cancellationResourcesLock = &self->_cancellationResourcesLock;
  os_unfair_lock_lock(&self->_cancellationResourcesLock);
  v6 = self->_canceller;
  os_unfair_lock_unlock(p_cancellationResourcesLock);
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    if (-[VNRequest hasCancellationHook](self, "hasCancellationHook"))
    {
      v8 = CFSTR("cancellation is not currently available");
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ does not support cancellation"), v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (__CFString *)v12;
    }
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)detectionLevel
{
  return -[VNRequestConfiguration detectionLevel](self->_configuration, "detectionLevel");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    ourVisionFrameworkLinkTimeVersion = +[VNFrameworkManager linktimeVersion](VNFrameworkManager, "linktimeVersion");
}

- (VNRequestSpecifier)specifier
{
  return (VNRequestSpecifier *)+[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", -[VNRequest frameworkClass](self, "frameworkClass"), -[VNRequest resolvedRevision](self, "resolvedRevision"), 0);
}

- (BOOL)setRevision:(unint64_t)a3 error:(id *)a4
{
  BOOL result;
  id v8;

  if (a3 < 0xDECAF000)
  {
    -[VNRequest setRevision:](self, "setRevision:", a3);
    if ((objc_msgSend((id)objc_opt_class(), "supportsRevision:", a3) & 1) != 0)
      return 1;
  }
  else
  {
    if (!self)
      return 0;
    -[VNRequest _setResolvedRevision:](self, "_setResolvedRevision:", a3);
    if ((objc_msgSend((id)objc_opt_class(), "supportsPrivateRevision:", a3) & 1) != 0)
      return 1;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v8;
    return result;
  }
  return 0;
}

- (void)setRevision:(NSUInteger)revision
{
  objc_class *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (objc_class *)objc_opt_class();
  v6 = v5;
  if (revision > 0xDECAEFFF
    || -[objc_class supportsPrivateRevision:](v5, "supportsPrivateRevision:", revision))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    NSStringFromClass(v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    VNRequestRevisionString(v6, revision);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ does not support %@"), v9, v8);

  }
  else
  {
    -[VNRequest _setResolvedRevision:](self, "_setResolvedRevision:", -[objc_class resolvedRevisionForRevision:](v6, "resolvedRevisionForRevision:", revision));
  }
}

+ (BOOL)supportsPrivateRevision:(unint64_t)a3
{
  void *v4;

  objc_msgSend(a1, "supportedPrivateRevisions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsIndex:", a3);

  return a3;
}

+ (NSIndexSet)supportedPrivateRevisions
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "privateRevisionsSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "supportedRevisionsAreFilteredBasedOnAvailableComputeDevices"))
  {
    objc_msgSend(a1, "_runtimeAvailableRevisionsOfRevisions:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSIndexSet *)v3;
}

+ (BOOL)supportedRevisionsAreFilteredBasedOnAvailableComputeDevices
{
  return 1;
}

+ (id)_runtimeAvailableRevisionsOfRevisions:(id)a3
{
  id v4;
  _VNRequestRevisionsIntrospectionInstanceCreator *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(_VNRequestRevisionsIntrospectionInstanceCreator);
    v6 = (objc_class *)objc_msgSend(a1, "frameworkClass");
    v17 = 0;
    v7 = -[VNRequestInstanceCreator newRequestInstanceOfClass:withCompletionHandler:revision:error:](v5, "newRequestInstanceOfClass:withCompletionHandler:revision:error:", v6, 0, 0, &v17);
    v8 = v17;
    if (v7)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__VNRequest__runtimeAvailableRevisionsOfRevisions___block_invoke;
      v15[3] = &unk_1E4543E58;
      v16 = v7;
      objc_msgSend(v4, "indexesPassingTest:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      NSStringFromClass(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("Failed to create instance of %@ - %@"), v11, v12);
      +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v13);

      v9 = (void *)objc_msgSend(v4, "copy");
    }

  }
  else
  {
    v9 = (void *)objc_msgSend(v4, "copy");
  }

  return v9;
}

- (VNRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  VNRequestCompletionHandler v4;
  VNRequest *v5;
  VNRequest *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  VNRequestConfiguration *configuration;
  void *v12;
  id v13;
  VNAsyncStatus *v14;
  VNAsyncStatus *asyncStatus;
  VNRequest *v16;
  objc_super v18;

  v4 = completionHandler;
  v18.receiver = self;
  v18.super_class = (Class)VNRequest;
  v5 = -[VNRequest init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    do
    {
      v7 = __ldxr(&-[VNRequest initWithCompletionHandler:]::ourNextSerialNumber);
      v8 = v7 + 1;
    }
    while (__stxr(v8, &-[VNRequest initWithCompletionHandler:]::ourNextSerialNumber));
    v5->_serialNumber = v8;
    v5->_cancellationResourcesLock._os_unfair_lock_opaque = 0;
    v9 = (void *)objc_opt_class();
    v10 = objc_msgSend(v9, "newConfigurationInstance");
    configuration = v6->_configuration;
    v6->_configuration = (VNRequestConfiguration *)v10;

    v12 = _Block_copy(v4);
    v13 = v6->_completionHandler;
    v6->_completionHandler = v12;

    v6->_revision = objc_msgSend(v9, "defaultRevision");
    v14 = objc_alloc_init(VNAsyncStatus);
    asyncStatus = v6->_asyncStatus;
    v6->_asyncStatus = v14;

    v6->_asyncStatusLock._os_unfair_lock_opaque = 0;
    v16 = v6;
  }

  return v6;
}

+ (unint64_t)resolvedRevisionForRevision:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  if (!a3)
  {
    objc_msgSend(a1, "publicRevisionsSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "lastIndex");

    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v4;
  }
  return a3;
}

+ (NSUInteger)defaultRevision
{
  return objc_msgSend(a1, "resolvedRevisionForRevision:", objc_msgSend(a1, "_defaultRevisionForBuildVersion:", ourVisionFrameworkLinkTimeVersion));
}

+ (unint64_t)_defaultRevisionForBuildVersion:(int)a3
{
  id v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD *v8;
  int v9;
  int v10;
  BOOL v11;
  unint64_t v12;

  if (a3 == -1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = (unint64_t *)objc_msgSend(a1, "revisionAvailability");
  if (v6 && (v7 = *v6) != 0)
  {
    v8 = v6 + 4;
    while (1)
    {
      v9 = *((_DWORD *)v8 - 4);
      if (v9 == a3)
        break;
      if (v9 <= a3)
      {
        v10 = *((_DWORD *)v8 - 3);
        if (v10)
          v11 = v10 < a3;
        else
          v11 = 0;
        if (!v11)
          objc_msgSend(v5, "addIndex:", v7);
      }
      v12 = *v8;
      v8 += 4;
      v7 = v12;
      if (!v12)
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    if (objc_msgSend(v5, "count"))
      v7 = objc_msgSend(v5, "lastIndex");
    else
      v7 = 0;
  }

  return v7;
}

BOOL __51__VNRequest__runtimeAvailableRevisionsOfRevisions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(*(id *)(a1 + 32), "_setResolvedRevision:", a2);
  objc_msgSend(*(id *)(a1 + 32), "supportedComputeStageDevicesAndReturnError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setResolvedRevision:(unint64_t)a3
{
  unint64_t revision;

  revision = self->_revision;
  self->_revision = a3;
  if (revision != a3)
  {
    -[VNRequestConfiguration setResolvedRevision:](self->_configuration, "setResolvedRevision:");
    -[VNRequest resolvedRevisionDidChangeFromRevision:](self, "resolvedRevisionDidChangeFromRevision:", revision);
  }
}

- (NSDictionary)supportedComputeStageDevicesAndReturnError:(NSError *)error
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v4 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v10, -[VNRequest resolvedRevision](self, "resolvedRevision"), error);
  v5 = v10;
  if (v4)
  {
    -[objc_class supportedComputeStageDevicesForOptions:error:](v4, "supportedComputeStageDevicesForOptions:error:", v5, error);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;

  }
  else
  {
    v7 = 0;
  }

  return (NSDictionary *)v7;
}

- (unint64_t)resolvedRevision
{
  unint64_t v3;

  v3 = -[VNRequestConfiguration resolvedRevision](self->_configuration, "resolvedRevision");
  if (!v3)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "resolvedRevisionForRevision:", -[VNRequest revision](self, "revision"));
    -[VNRequestConfiguration setResolvedRevision:](self->_configuration, "setResolvedRevision:", v3);
  }
  return v3;
}

- (Class)applicableDetectorClassAndOptions:(id *)a3 forRevision:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  id v10;
  objc_class *v11;
  id v12;
  objc_class *v13;
  id v15;

  -[VNRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a4, 0);
    v15 = v10;
    v11 = +[VNDetector detectorClassAndConfigurationOptions:forDetectorType:options:error:](VNDetector, "detectorClassAndConfigurationOptions:forDetectorType:options:error:", &v15, v9, v10, a5);
    v12 = v15;

    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      v13 = v11;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)newConfigurationInstance
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "configurationClass")), "initWithRequestClass:", objc_msgSend(a1, "frameworkClass"));
}

+ (const)revisionAvailability
{
  return 0;
}

+ (id)privateRevisionsSet
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
}

- (VNProcessingDevice)processingDevice
{
  return -[VNRequestConfiguration processingDevice](self->_configuration, "processingDevice");
}

- (void)setComputeDevice:(id)computeDevice forComputeStage:(VNComputeStage)computeStage
{
  -[VNRequestConfiguration setComputeDevice:forComputeStage:](self->_configuration, "setComputeDevice:forComputeStage:", computeDevice, computeStage);
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(0, self);
}

- (id)processFaceObservations:(id)a3 revision:(unint64_t)a4 regionOfInterest:(CGRect)a5 detectorType:(id)a6 detectorOptions:(id)a7 shouldAlignFaceBBox:(id)a8 shouldRunDetectorBlock:(id)a9 context:(id)a10 error:(id *)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  dispatch_block_t v30;
  void (**v31)(_QWORD);
  id v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  uint64_t v37;
  void *v38;
  VNAsyncStatus *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  VNAsyncStatus *v44;
  void *v45;
  id *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  dispatch_group_t v65;
  id obj;
  uint64_t v67;
  dispatch_qos_class_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t (**v75)(id, void *);
  uint64_t (**v76)(id, _QWORD);
  id v77;
  uint64_t v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  VNRequest *v83;
  id v84;
  id v85;
  id v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  dispatch_qos_class_t v94;
  char v95;
  BOOL v96;
  _QWORD block[5];
  id v98;
  uint64_t v99;
  id v100;
  id v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t v104;
  dispatch_qos_class_t v105;
  BOOL v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD aBlock[4];
  id v124;
  id v125;
  _QWORD *v126;
  _QWORD v127[6];
  int v128;
  uint64_t v129;
  _BYTE v130[128];
  _QWORD v131[4];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v131[1] = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v62 = a6;
  v63 = a7;
  v76 = (uint64_t (**)(id, _QWORD))a8;
  v75 = (uint64_t (**)(id, void *))a9;
  v77 = a10;
  objc_msgSend(v77, "qosClass");
  objc_msgSend(v77, "requestPerformerAndReturnError:", a11);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    objc_msgSend(v77, "imageBufferAndReturnError:", a11);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      v53 = 0;
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v77, "session");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a4);
    objc_msgSend(v73, "addEntriesFromDictionary:", v63);
    v131[0] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setObject:forKeyedSubscript:", v20, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    objc_msgSend(v59, "detectorOfType:configuredWithOptions:error:", v62, v73, a11);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v72)
    {
      v53 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v68 = objc_msgSend(v77, "qosClass");
    v21 = objc_msgSend(v64, "count");
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
    v127[0] = 0;
    v127[1] = v127;
    v127[2] = 0x3812000000;
    v127[3] = __Block_byref_object_copy__5258;
    v127[4] = __Block_byref_object_dispose__5259;
    v127[5] = "";
    v128 = 0;
    -[VNRequest requestTasksQueue](self, "requestTasksQueue");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = dispatch_group_create();
    v69 = objc_opt_class();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke;
    aBlock[3] = &unk_1E4543EF0;
    v126 = v127;
    v57 = v55;
    v124 = v57;
    v58 = v56;
    v125 = v58;
    v79 = _Block_copy(aBlock);
    v70 = objc_msgSend(v64, "count");
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = v64;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
    if (v22)
    {
      v67 = *(_QWORD *)v120;
      do
      {
        v78 = v22;
        for (i = 0; i != v78; ++i)
        {
          if (*(_QWORD *)v120 != v67)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
          v113 = 0;
          v114 = &v113;
          v115 = 0x3032000000;
          v116 = __Block_byref_object_copy__107;
          v117 = __Block_byref_object_dispose__108;
          v118 = 0;
          v107 = 0;
          v108 = &v107;
          v109 = 0x3032000000;
          v110 = __Block_byref_object_copy__107;
          v111 = __Block_byref_object_dispose__108;
          v112 = 0;
          v25 = v76[2](v76, v24);
          v26 = (void *)objc_msgSend(v73, "mutableCopy");
          v27 = MEMORY[0x1E0C809B0];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_109;
          block[3] = &unk_1E4543F40;
          v104 = v69;
          v105 = v68;
          v102 = &v107;
          block[4] = self;
          v98 = v77;
          v99 = v24;
          v28 = v26;
          v100 = v28;
          v103 = &v113;
          v106 = v70 == 1;
          v29 = v71;
          v101 = v29;
          v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v68, 0, block);
          v80[0] = v27;
          v80[1] = 3221225472;
          v80[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_3;
          v80[3] = &unk_1E4543F90;
          v89 = v69;
          v94 = v68;
          v95 = v25;
          v31 = v30;
          v85 = v31;
          v87 = &v113;
          v88 = &v107;
          v32 = v28;
          v81 = v32;
          v33 = v72;
          v90 = x;
          v91 = y;
          v92 = width;
          v93 = height;
          v82 = v33;
          v83 = self;
          v34 = v79;
          v86 = v34;
          v96 = v70 == 1;
          v35 = v29;
          v84 = v35;
          v36 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v68, 0, v80);
          if (v25)
          {
            if (v70 == 1)
              v31[2](v31);
            else
              objc_msgSend(v35, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v65, v31);
          }
          else
          {
            v129 = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v108[5];
            v108[5] = v37;

            v39 = objc_alloc_init(VNAsyncStatus);
            v40 = (void *)v114[5];
            v114[5] = (uint64_t)v39;

          }
          objc_msgSend((id)v108[5], "firstObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v75[2](v75, v41);

          if (v42)
          {
            if (v70 == 1)
              v36[2](v36);
            else
              objc_msgSend(v35, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v65, v36);
          }
          else
          {
            if (v25 && dispatch_block_wait(v31, 0xFFFFFFFFFFFFFFFFLL))
            {
              +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v43);
              v45 = (void *)v114[5];
              v114[5] = (uint64_t)v44;

            }
            (*((void (**)(id, uint64_t, uint64_t))v79 + 2))(v34, v108[5], v114[5]);
          }

          _Block_object_dispose(&v107, 8);
          _Block_object_dispose(&v113, 8);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
      }
      while (v22);
    }

    v46 = a11;
    if (v70 == 1 || (v47 = objc_msgSend(v71, "dispatchGroupWait:error:", v65, a11), v46 = a11, (v47 & 1) != 0))
    {
      if (+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v58, v46))
      {
        v53 = v57;
LABEL_33:

        _Block_object_dispose(v127, 8);
        goto LABEL_34;
      }
    }
    else
    {
      VNValidatedLog(4, (uint64_t)CFSTR("Timed out waiting for processing face observations: %@"), v48, (uint64_t)a11, v49, v50, v51, v52, (uint64_t)obj);
    }
    v53 = 0;
    goto LABEL_33;
  }
  v53 = 0;
LABEL_36:

  return v53;
}

- (VNControlledCapacityTasksQueue)requestTasksQueue
{
  void *v2;
  void *v3;

  +[VNRequestAsyncTasksQueueCache sharedCache](VNRequestAsyncTasksQueueCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueWithUniqueAppendix:", &stru_1E4549388);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNControlledCapacityTasksQueue *)v3;
}

- (void)setResults:(id)a3
{
  NSArray *results;
  id v5;

  v5 = a3;
  if (v5)
  {
    -[VNRequest setResults:assignedWithOriginatingSpecifier:](self, "setResults:assignedWithOriginatingSpecifier:", v5, -[VNRequest resultsAreAssignedWithOriginatingRequestSpecifier](self, "resultsAreAssignedWithOriginatingRequestSpecifier"));
  }
  else
  {
    results = self->_results;
    self->_results = 0;

  }
}

- (id)warnings
{
  VNWarningRecorder *warningRecorder;
  void *v3;

  warningRecorder = self->_warningRecorder;
  if (warningRecorder)
  {
    -[VNWarningRecorder warnings](warningRecorder, "warnings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v3;
}

- (void)setDetectionLevel:(unint64_t)a3
{
  -[VNRequestConfiguration setDetectionLevel:](self->_configuration, "setDetectionLevel:", a3);
}

- (VNRequest)init
{
  return -[VNRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (id)configuration
{
  return self->_configuration;
}

- (NSUInteger)revision
{
  return self->_revision;
}

void __73__VNRequest_performInContextAsync_asyncDispatchQueue_asyncDispatchGroup___block_invoke(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = objc_opt_class();
    objc_msgSend(WeakRetained, "resolvedRevision");
    VNValidatedLog(1, (uint64_t)CFSTR("performInContextAsync: start processing: %@; revision: %lu"),
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      v3);
    objc_msgSend(&stru_1E4549388, "UTF8String");
    objc_msgSend(a1[4], "qosClass");
    v10 = a1[4];
    v20 = 0;
    v11 = objc_msgSend(WeakRetained, "performInContext:error:", v10, &v20);
    v12 = v20;
    objc_msgSend(WeakRetained, "setAsyncStatus:error:", v11, v12);
    v13 = objc_opt_class();
    objc_msgSend(WeakRetained, "resolvedRevision");
    VNValidatedLog(1, (uint64_t)CFSTR("performInContextAsync: finish processing: %@; revision: %lu"),
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v13);
    objc_msgSend(a1[5], "dispatchReportBlockCompletion");
  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Request should not be nil"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setAsyncStatus:error:", 0, v12);
  }

}

- (BOOL)performInContext:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  objc_class *v9;
  int v10;
  BOOL v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  OS_dispatch_semaphore *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  char v29;
  void *v31;
  void *v32;
  uint64_t v33;
  dispatch_semaphore_t dsema;
  OS_dispatch_queue *queue;
  uint64_t v36;
  CMTimeRange v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime duration;
  CMTime start;
  CMTimeRange v44;
  __int128 v45;
  _OWORD v46[2];
  __int128 v47;
  uint64_t v48;
  id v49;
  _QWORD block[4];
  dispatch_semaphore_t v51;
  VNRequest *v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "serialNumber");
  v8 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v9 = -[VNRequest frameworkClass](self, "frameworkClass");
  v10 = -[objc_class VNClassCode](v9, "VNClassCode");
  kdebug_trace();
  v36 = mach_absolute_time();
  v62 = 0;
  v11 = -[VNRequest cancellationTriggeredAndReturnError:](self, "cancellationTriggeredAndReturnError:", &v62);
  v12 = v62;
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    if ((-[objc_class supportsAnyRevision:](v9, "supportsAnyRevision:", v8) & 1) != 0)
    {
      objc_msgSend(v6, "cachedObservationsAcceptedByRequest:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        kdebug_trace();
        -[VNRequest setResults:assignedWithOriginatingSpecifier:](self, "setResults:assignedWithOriginatingSpecifier:", v14, 0);
        v13 = 1;
      }
      else
      {
        v58 = 0;
        v59 = &v58;
        v60 = 0x2020000000;
        v61 = 0;
        v33 = -[VNRequest hasCancellationHook](self, "hasCancellationHook");
        if ((_DWORD)v33)
        {
          os_unfair_lock_lock(&self->_cancellationResourcesLock);
          queue = self->_cancellationQueue;
          v15 = self->_cancellationSemaphore;
          os_unfair_lock_unlock(&self->_cancellationResourcesLock);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __36__VNRequest_performInContext_error___block_invoke;
          block[3] = &unk_1E4543EA8;
          v54 = &v58;
          v55 = v7;
          dsema = v15;
          v51 = dsema;
          v52 = self;
          v56 = v8;
          v57 = v10;
          v53 = v6;
          dispatch_async((dispatch_queue_t)queue, block);

        }
        else
        {
          dsema = 0;
          queue = 0;
        }
        *((_BYTE *)v59 + 24) = 1;
        v49 = v12;
        v13 = -[VNRequest internalPerformRevision:inContext:error:](self, "internalPerformRevision:inContext:error:", v8, v6, &v49);
        v16 = v49;

        v12 = v16;
        if (v13)
        {
          if ((objc_msgSend((id)objc_opt_class(), "setsTimeRangeOnResults") & 1) == 0)
          {
            objc_msgSend(v6, "imageBufferAndReturnError:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0;
            v47 = 0u;
            v45 = 0u;
            memset(v46, 0, sizeof(v46));
            v31 = v17;
            if (v17)
            {
              objc_msgSend(v17, "timingInfo");
            }
            else
            {
              v18 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
              v46[1] = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
              v47 = v18;
              v48 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
              v19 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
              v45 = *MEMORY[0x1E0CA2E90];
              v46[0] = v19;
            }
            memset(&v44, 0, sizeof(v44));
            if ((BYTE4(v46[1]) & 1) != 0)
            {
              start = *(CMTime *)((char *)v46 + 8);
              *(_OWORD *)&duration.value = v45;
              duration.epoch = *(_QWORD *)&v46[0];
              CMTimeRangeMake(&v44, &start, &duration);
            }
            else
            {
              v20 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
              *(_OWORD *)&v44.start.value = *MEMORY[0x1E0CA2E50];
              *(_OWORD *)&v44.start.epoch = v20;
              *(_OWORD *)&v44.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
            }
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            -[VNRequest results](self, "results", v31, v14);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v39 != v23)
                    objc_enumerationMutation(v21);
                  v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                  v37 = v44;
                  objc_msgSend(v25, "setTimeRange:", &v37);
                }
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v63, 16);
              }
              while (v22);
            }

          }
          objc_msgSend(v6, "recordSequencedObservationsOfRequest:", self);
        }
        else
        {
          -[VNRequest setResults:](self, "setResults:", 0);
        }
        objc_msgSend(v6, "cacheObservationsOfRequest:", self);
        *((_BYTE *)v59 + 24) = 0;
        if ((_DWORD)v33)
        {
          dispatch_semaphore_signal(dsema);
          dispatch_sync((dispatch_queue_t)queue, &__block_literal_global_5314);
        }

        _Block_object_dispose(&v58, 8);
        v14 = 0;
      }
    }
    else
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v8, self);
      v13 = 0;
      v14 = v12;
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  self->_executionNanoseconds = mach_absolute_time() - v36;
  -[VNRequest completionHandler](self, "completionHandler");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
  {
    if (v13)
      v28 = 0;
    else
      v28 = v12;
    (*(void (**)(uint64_t, VNRequest *, id))(v26 + 16))(v26, self, v28);
  }
  if (a4)
    v29 = v13;
  else
    v29 = 1;
  if ((v29 & 1) == 0)
    *a4 = objc_retainAutorelease(v12);
  kdebug_trace();

  return v13;
}

+ (unsigned)VNClassCode
{
  unsigned int v3;

  v3 = 0;
  +[VNClassRegistrar getClassCode:forClass:error:](VNClassRegistrar, "getClassCode:forClass:error:", &v3, a1, 0);
  return v3;
}

- (VNRequestCompletionHandler)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)cancellationTriggeredAndReturnError:(id *)a3
{
  _BOOL4 v5;
  BOOL v6;

  v5 = -[VNRequest cancellationTriggered](self, "cancellationTriggered");
  v6 = v5;
  if (a3 && v5)
  {
    +[VNError errorForCancellationOfRequest:](VNError, "errorForCancellationOfRequest:", self);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)cancellationTriggered
{
  return self->_cancellationTriggered;
}

+ (BOOL)supportsAnyRevision:(unint64_t)a3
{
  if ((objc_msgSend(a1, "supportsRevision:") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "supportsPrivateRevision:", a3);
}

+ (BOOL)supportsRevision:(unint64_t)a3
{
  void *v4;

  objc_msgSend(a1, "supportedRevisions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsIndex:", a3);

  return a3;
}

+ (NSIndexSet)supportedRevisions
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "publicRevisionsSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "supportedRevisionsAreFilteredBasedOnAvailableComputeDevices"))
  {
    objc_msgSend(a1, "_runtimeAvailableRevisionsOfRevisions:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSIndexSet *)v3;
}

+ (id)publicRevisionsSet
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  int v9;
  int v10;
  _QWORD *v11;
  int v12;
  BOOL v13;
  uint64_t v14;

  v2 = objc_msgSend(a1, "frameworkClass");
  os_unfair_lock_lock(&+[VNRequest publicRevisionsSet]::ourLock);
  v3 = (void *)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable;
  if (!+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable;
    +[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable = v4;

    v3 = (void *)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable;
  }
  objc_msgSend(v3, "objectForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (_QWORD *)objc_msgSend((id)objc_opt_self(), "revisionAvailability");
    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v9 = +[VNRuntimeUtilities runTimeVersion](VNRuntimeUtilities, "runTimeVersion");
      if (*v7)
      {
        v10 = v9;
        v11 = v7 + 4;
        do
        {
          if (*((_DWORD *)v11 - 4) <= v10)
          {
            v12 = *((_DWORD *)v11 - 3);
            if (v12)
              v13 = v12 < v10;
            else
              v13 = 0;
            if (!v13)
              objc_msgSend(v8, "addIndex:");
          }
          v14 = *v11;
          v11 += 4;
        }
        while (v14);
      }
    }
    else
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 1);
    }
    v6 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend((id)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable, "setObject:forKey:", v6, v2);
  }
  os_unfair_lock_unlock(&+[VNRequest publicRevisionsSet]::ourLock);
  return v6;
}

- (BOOL)validateConfigurationAndReturnError:(id *)a3
{
  VNWarningRecorder *warningRecorder;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  VNCanceller *v9;
  VNCanceller *canceller;
  OS_dispatch_semaphore *v11;
  OS_dispatch_semaphore *cancellationSemaphore;
  id v13;
  const char *v14;
  NSObject *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *cancellationQueue;

  warningRecorder = self->_warningRecorder;
  self->_warningRecorder = 0;

  self->_executionNanoseconds = 0;
  if (-[VNRequest hasCancellationHook](self, "hasCancellationHook"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (objc_class *)objc_opt_class();
    VNRequestRevisionString(v6, -[VNRequest resolvedRevision](self, "resolvedRevision"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("com.apple.%@"), v7);

    os_unfair_lock_lock(&self->_cancellationResourcesLock);
    v9 = objc_alloc_init(VNCanceller);
    canceller = self->_canceller;
    self->_canceller = v9;

    v11 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    cancellationSemaphore = self->_cancellationSemaphore;
    self->_cancellationSemaphore = v11;

    v13 = objc_retainAutorelease(v8);
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (OS_dispatch_queue *)dispatch_queue_create(v14, v15);
    cancellationQueue = self->_cancellationQueue;
    self->_cancellationQueue = v16;

    os_unfair_lock_unlock(&self->_cancellationResourcesLock);
  }
  self->_cancellationTriggered = 0;
  return 1;
}

- (BOOL)hasCancellationHook
{
  return 0;
}

- (void)setResults:(id)a3 assignedWithOriginatingSpecifier:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v4 = a4;
  v9 = a3;
  if (v4)
  {
    -[VNRequest specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "VNObservationsWithOriginatingRequestSpecifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v7;
  }
  else
  {
    v8 = v9;
  }
  v10 = v8;
  -[VNRequest setProcessedResults:](self, "setProcessedResults:");

}

- (void)setProcessedResults:(id)a3
{
  NSArray *v4;
  NSArray *results;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  results = self->_results;
  self->_results = v4;

}

- (NSArray)results
{
  return self->_results;
}

- (void)setAsyncStatus:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  VNAsyncStatus *v6;
  VNAsyncStatus *asyncStatus;
  id v8;

  v4 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_asyncStatusLock);
  v6 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v4, v8);
  asyncStatus = self->_asyncStatus;
  self->_asyncStatus = v6;

  os_unfair_lock_unlock(&self->_asyncStatusLock);
}

- (void)resetAsyncStatus
{
  -[VNRequest setAsyncStatus:error:](self, "setAsyncStatus:error:", 1, 0);
}

- (void)performInContextAsync:(id)a3 asyncDispatchQueue:(id)a4 asyncDispatchGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_qos_class_t v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(&stru_1E4549388, "UTF8String");
  objc_msgSend(v8, "qosClass");
  objc_initWeak(&location, self);
  v11 = objc_msgSend(v8, "qosClass");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __73__VNRequest_performInContextAsync_asyncDispatchQueue_asyncDispatchGroup___block_invoke;
  v18 = &unk_1E4543E80;
  objc_copyWeak(&v21, &location);
  v12 = v8;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, &v15);
  objc_msgSend(v13, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v10, v14, v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (VNAsyncStatus)asyncStatus
{
  os_unfair_lock_s *p_asyncStatusLock;
  void *v4;

  p_asyncStatusLock = &self->_asyncStatusLock;
  os_unfair_lock_lock(&self->_asyncStatusLock);
  v4 = (void *)-[VNAsyncStatus copy](self->_asyncStatus, "copy");
  os_unfair_lock_unlock(p_asyncStatusLock);
  return (VNAsyncStatus *)v4;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 1;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  if (+[VisionCoreRuntimeUtilities item:overridesSelector:](VNRuntimeUtilities, "item:overridesSelector:", self, a2))
  {
    v8 = 1;
  }
  else
  {
    -[VNRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", -[VNRequest resolvedRevision](self, "resolvedRevision"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isEqualToString:", &stru_1E4549388) & 1) != 0)
        v11 = objc_msgSend((id)objc_opt_class(), "warmUpSession:error:", v7, a4);
      else
        v11 = -[VNRequest warmUpApplicableDetectorInSession:error:](self, "warmUpApplicableDetectorInSession:error:", v7, a4);
      v8 = v11;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)warmUpApplicableDetectorInSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v21 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v21, -[VNRequest resolvedRevision](self, "resolvedRevision"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v7)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __53__VNRequest_warmUpApplicableDetectorInSession_error___block_invoke;
    v17 = &unk_1E45461D0;
    v9 = v7;
    v18 = v9;
    v19 = v6;
    v20 = v8;
    v10 = _Block_copy(&v14);
    v11 = (void *)objc_opt_class();
    v12 = objc_msgSend(v11, "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v10, v9, qos_class_self(), a4, v14, v15, v16, v17);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)applicableDetectorAndOptions:(id *)a3 forRevision:(unint64_t)a4 loadedInSession:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v10 = a5;
  -[VNRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a4, v10);
    objc_msgSend(v10, "detectorOfType:configuredWithOptions:error:", v11, v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      v14 = v13;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)setsTimeRangeOnResults
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  objc_class *v5;
  char v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = -[VNRequest frameworkClass](self, "frameworkClass");
  if (v5 == (objc_class *)objc_msgSend(v4, "requestClass"))
  {
    v7 = -[VNRequest resolvedRevision](self, "resolvedRevision");
    v8 = objc_msgSend(v4, "resolvedRevision");
    if (v7 == v8)
      v6 = 1;
    else
      v6 = -[objc_class revision:mayAcceptResultsProducedByRevision:](v5, "revision:mayAcceptResultsProducedByRevision:", v7, v8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)maximumProcessingDimensionOnTheLongSide
{
  return -[VNRequestConfiguration maximumProcessingDimensionOnTheLongSide](self->_configuration, "maximumProcessingDimensionOnTheLongSide");
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = &stru_1E4549388;
  return &stru_1E4549388;
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  return 1;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  -[VNRequest preferredMetalContext](self, "preferredMetalContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%lu:MTL=%@:Det=%lu:MDm=%lu"), v5, v6, v8, -[VNRequest detectionLevel](self, "detectionLevel"), -[VNRequest maximumProcessingDimensionOnTheLongSide](self, "maximumProcessingDimensionOnTheLongSide"));

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = -[VNRequest newDuplicateInstance](self, "newDuplicateInstance", a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "copyStateOfRequest:", self);
  return v5;
}

- (id)newDuplicateInstance
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCompletionHandler:", self->_completionHandler);
}

- (id)newDefaultDetectorOptionsForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", -[VNRequest resolvedRevision](self, "resolvedRevision"), v4);

  return v5;
}

- (void)copyStateOfRequest:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *results;
  VNWarningRecorder *warningRecorder;
  VNWarningRecorder *v8;
  VNWarningRecorder *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[VNRequest applyConfigurationOfRequest:](self, "applyConfigurationOfRequest:");
  -[VNRequest _setResolvedRevision:](self, "_setResolvedRevision:", objc_msgSend(v11, "revision"));
  objc_msgSend(v11, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  results = self->_results;
  self->_results = v5;

  warningRecorder = self->_warningRecorder;
  if (!warningRecorder)
  {
    v8 = objc_alloc_init(VNWarningRecorder);
    v9 = self->_warningRecorder;
    self->_warningRecorder = v8;

    warningRecorder = self->_warningRecorder;
  }
  objc_msgSend(v11, "warnings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNWarningRecorder setWarnings:](warningRecorder, "setWarnings:", v10);

}

- (void)applyCompatibleComputeStageDeviceAssignmentsOfRequest:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  VNRequestConfiguration *configuration;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "processingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VNRequestConfiguration setProcessingDevice:](self->_configuration, "setProcessingDevice:", v3);
  }
  else
  {
    v15 = 0;
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v17, "computeStageDeviceAssignments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[VNRequest supportedComputeStageDevicesAndReturnError:](self, "supportedComputeStageDevicesAndReturnError:", 0);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v20 != v7)
              objc_enumerationMutation(v5);
            v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v4, "objectForKeyedSubscript:", v9, v15);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                configuration = self->_configuration;
                objc_msgSend(v10, "processingDevice");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[VNRequestConfiguration setProcessingDevice:](configuration, "setProcessingDevice:", v14);

                goto LABEL_19;
              }
              objc_msgSend(v5, "objectForKeyedSubscript:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              +[VNComputeDeviceUtilities computeDeviceOfComputeDevices:mostCompatibleWithComputeDevice:options:](VNComputeDeviceUtilities, "computeDeviceOfComputeDevices:mostCompatibleWithComputeDevice:options:", v11, v10, 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12)
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, v9);

            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v6)
            continue;
          break;
        }
      }

    }
    -[VNRequestConfiguration setComputeStageDeviceAssignments:](self->_configuration, "setComputeStageDeviceAssignments:", v18, v15);
LABEL_19:

    v3 = v15;
  }

}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNRequest *v4;

  v4 = (VNRequest *)a3;
  if (v4 != self)
  {
    self->_revision = -[VNRequest applicableRevisionForDependentRequest:](v4, "applicableRevisionForDependentRequest:", self);
    -[VNRequestConfiguration setResolvedRevision:](self->_configuration, "setResolvedRevision:", 0);
    -[VNRequest applyCompatibleComputeStageDeviceAssignmentsOfRequest:](self, "applyCompatibleComputeStageDeviceAssignmentsOfRequest:", v4);
    -[VNRequestConfiguration setDetectionLevel:](self->_configuration, "setDetectionLevel:", -[VNRequest detectionLevel](v4, "detectionLevel"));
    -[VNRequestConfiguration setMetalContextPriority:](self->_configuration, "setMetalContextPriority:", -[VNRequest metalContextPriority](v4, "metalContextPriority"));
    -[VNRequestConfiguration setModelExecutionPriority:](self->_configuration, "setModelExecutionPriority:", -[VNRequest modelExecutionPriority](v4, "modelExecutionPriority"));
    -[VNRequestConfiguration setPreferBackgroundProcessing:](self->_configuration, "setPreferBackgroundProcessing:", -[VNRequest preferBackgroundProcessing](v4, "preferBackgroundProcessing"));
    -[VNRequestConfiguration setModelFileBackingStore:](self->_configuration, "setModelFileBackingStore:", -[VNRequest modelFileBackingStore](v4, "modelFileBackingStore"));
    -[VNRequestConfiguration setMaximumProcessingDimensionOnTheLongSide:](self->_configuration, "setMaximumProcessingDimensionOnTheLongSide:", -[VNRequest maximumProcessingDimensionOnTheLongSide](v4, "maximumProcessingDimensionOnTheLongSide"));
    -[VNRequestConfiguration setMemoryPoolId:](self->_configuration, "setMemoryPoolId:", -[VNRequest ioSurfaceMemoryPoolId](v4, "ioSurfaceMemoryPoolId"));
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)internalCancelInContext:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[VNRequest cancellerAndReturnError:](self, "cancellerAndReturnError:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "signalCancellation");

  return v5 != 0;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 1;
}

- (void)recordWarning:(id)a3 value:(id)a4
{
  id v6;
  VNWarningRecorder *warningRecorder;
  VNWarningRecorder *v8;
  VNWarningRecorder *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  warningRecorder = self->_warningRecorder;
  if (!warningRecorder)
  {
    v8 = objc_alloc_init(VNWarningRecorder);
    v9 = self->_warningRecorder;
    self->_warningRecorder = v8;

    warningRecorder = self->_warningRecorder;
  }
  -[VNWarningRecorder recordWarning:value:](warningRecorder, "recordWarning:value:", v10, v6);

}

- (id)valueForWarning:(id)a3
{
  -[VNWarningRecorder valueForWarning:](self->_warningRecorder, "valueForWarning:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cancel
{
  os_unfair_lock_s *p_cancellationResourcesLock;
  OS_dispatch_semaphore *v4;
  VNCanceller *v5;

  p_cancellationResourcesLock = &self->_cancellationResourcesLock;
  os_unfair_lock_lock(&self->_cancellationResourcesLock);
  v5 = self->_canceller;
  v4 = self->_cancellationSemaphore;
  os_unfair_lock_unlock(p_cancellationResourcesLock);
  self->_cancellationTriggered = 1;
  -[VNCanceller signalCancellation](v5, "signalCancellation");
  if (v4)
    dispatch_semaphore_signal((dispatch_semaphore_t)v4);

}

- (void)setPreferBackgroundProcessing:(BOOL)preferBackgroundProcessing
{
  -[VNRequestConfiguration setPreferBackgroundProcessing:](self->_configuration, "setPreferBackgroundProcessing:", preferBackgroundProcessing);
}

- (MTLDevice)preferredMetalContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VNRequest processingDevice](self, "processingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "metalDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VNRequest computeDeviceForComputeStage:](self, "computeDeviceForComputeStage:", CFSTR("VNComputeStageMain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[VNComputeDeviceUtilities metalDeviceForComputeDevice:](VNComputeDeviceUtilities, "metalDeviceForComputeDevice:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return (MTLDevice *)v5;
}

- (void)setPreferredMetalContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[VNRequest preferredMetalContext](self, "preferredMetalContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v8);

    if (v6)
    {

    }
    else if (v8)
    {
      +[VNProcessingDevice deviceForMetalDevice:](VNProcessingDevice, "deviceForMetalDevice:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      -[VNRequestConfiguration setProcessingDevice:](self->_configuration, "setProcessingDevice:", v7);

      goto LABEL_8;
    }
    v8 = 0;
    v7 = 0;
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)usesCPUOnly
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VNRequestConfiguration processingDevice](self->_configuration, "processingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "targetsCPU");
  }
  else
  {
    -[VNRequestConfiguration computeStageDeviceAssignments](self->_configuration, "computeStageDeviceAssignments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v8);
            if (!+[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13))
            {
              v5 = 0;
              goto LABEL_14;
            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            continue;
          break;
        }
      }
      v5 = 1;
LABEL_14:

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)setUsesCPUOnly:(BOOL)usesCPUOnly
{
  uint64_t v4;
  id v5;

  if (usesCPUOnly)
  {
    +[VNProcessingDevice defaultCPUDevice](VNProcessingDevice, "defaultCPUDevice");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[VNRequestConfiguration setProcessingDevice:](self->_configuration, "setProcessingDevice:", v4);

}

- (unint64_t)metalContextPriority
{
  return -[VNRequestConfiguration metalContextPriority](self->_configuration, "metalContextPriority");
}

- (void)setMetalContextPriority:(unint64_t)a3
{
  -[VNRequestConfiguration setMetalContextPriority:](self->_configuration, "setMetalContextPriority:", a3);
}

- (void)setModelExecutionPriority:(unint64_t)a3
{
  -[VNRequestConfiguration setModelExecutionPriority:](self->_configuration, "setModelExecutionPriority:", a3);
}

- (unint64_t)modelExecutionPriority
{
  return -[VNRequestConfiguration modelExecutionPriority](self->_configuration, "modelExecutionPriority");
}

- (void)setMaximumProcessingDimensionOnTheLongSide:(unint64_t)a3
{
  -[VNRequestConfiguration setMaximumProcessingDimensionOnTheLongSide:](self->_configuration, "setMaximumProcessingDimensionOnTheLongSide:", a3);
}

- (BOOL)validateImageBuffer:(id)a3 ofNonZeroWidth:(unint64_t *)a4 andHeight:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD v16[5];

  v10 = a3;
  v11 = v10;
  if (!v10)
  {
    if (a6)
    {
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("imageBuffer"));
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v12 = objc_msgSend(v10, "width");
  v13 = objc_msgSend(v11, "height");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__VNRequest_validateImageBuffer_ofNonZeroWidth_andHeight_error___block_invoke;
  v16[3] = &unk_1E4548D28;
  v16[4] = self;
  if (!+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", v12, v13, v16, a6))goto LABEL_10;
  if (a4)
    *a4 = v12;
  if (a5)
    *a5 = v13;
  v14 = 1;
LABEL_11:

  return v14;
}

- (unint64_t)applicableRevisionForDependentRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = objc_msgSend(v5, "applicableRevisionForDependentRequestOfClass:beingPerformedByRevision:", objc_opt_class(), -[VNRequest resolvedRevision](self, "resolvedRevision"));

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v18.receiver = self;
  v18.super_class = (Class)VNRequest;
  -[VNRequest description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequest specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v5);

  -[VNRequest computeStageDeviceAssignments](self, "computeStageDeviceAssignments");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR(" %@=%@"), v11, v12, (_QWORD)v14);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  if (-[VNRequest preferBackgroundProcessing](self, "preferBackgroundProcessing"))
    objc_msgSend(v6, "appendString:", CFSTR(" preferBackgroundProcessing"));

  return (NSString *)v6;
}

- (unint64_t)executionNanoseconds
{
  return self->_executionNanoseconds;
}

- (double)executionTimeInternal
{
  return (double)-[VNRequest executionNanoseconds](self, "executionNanoseconds") / 1000000000.0;
}

- (id)detectFacesInContext:(id)a3 error:(id *)a4
{
  id v6;
  VNDetectFaceRectanglesRequest *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(VNDetectFaceRectanglesRequest);
  -[VNDetectFaceRectanglesRequest applyConfigurationOfRequest:](v7, "applyConfigurationOfRequest:", self);
  objc_msgSend(v6, "requestPerformerAndReturnError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (v13[0] = v7,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "performDependentRequests:onBehalfOfRequest:inContext:error:", v9, self, v6, a4),
        v9,
        (v10 & 1) != 0))
  {
    -[VNRequest results](v7, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_alignFacesInContext:(id)a3 faces:(id)a4 qosClass:(unsigned int)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v9;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v9 = *(_QWORD *)&a5;
  v28[1] = *MEMORY[0x1E0C80C00];
  v26 = a4;
  v25 = a6;
  objc_msgSend(a3, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  +[VNFaceBBoxAligner supportedComputeStageDevicesForOptions:error:](VNFaceBBoxAligner, "supportedComputeStageDevicesForOptions:error:", v13, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "mutableCopy");
  v27 = CFSTR("VNComputeStageMain");
  objc_msgSend(v14, "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));

  v19 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v12, "detectorOfType:configuredWithOptions:error:", CFSTR("VNFaceBoxAlignerType"), v19, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("VNDetectorProcessOption_InputFaceObservations"));
    objc_msgSend(v20, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v9, v13, self, a7, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      v23 = v21;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)detectFaceLandmarksInContext:(id)a3 faces:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  VNDetectFaceLandmarksRequest *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(VNDetectFaceLandmarksRequest);
  -[VNDetectFaceLandmarksRequest applyConfigurationOfRequest:](v10, "applyConfigurationOfRequest:", self);
  -[VNDetectFaceLandmarksRequest setConstellation:](v10, "setConstellation:", 1);
  objc_msgSend(v8, "requestPerformerAndReturnError:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (-[VNImageBasedRequest setInputFaceObservations:](v10, "setInputFaceObservations:", v9),
        v16[0] = v10,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "performDependentRequests:onBehalfOfRequest:inContext:error:", v12, self, v8, a5),
        v12,
        (v13 & 1) != 0))
  {
    -[VNRequest results](v10, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)categorizeFaceObservations:(id)a3 shouldRunDetectorBlock:(id)a4 facesThatNeedNoProcessing:(id)a5 facesThatNeedProcessing:(id)a6 facesThatNeed2DLandmarks:(id)a7
{
  id v11;
  uint64_t (**v12)(id, void *);
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (uint64_t (**)(id, void *))a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = v12[2](v12, v20);
        v22 = v13;
        if ((v21 & 1) != 0)
        {
          objc_msgSend(v20, "landmarkPoints", (_QWORD)v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 == 0;

          if (v24)
            v22 = v15;
          else
            v22 = v14;
        }
        objc_msgSend(v22, "addObject:", v20, (_QWORD)v25);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

}

- (id)detectorProgressHandler
{
  VNRequest *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  if (!objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EE667A18))
    return 0;
  v3 = self;
  -[VNRequest progressHandler](v3, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, v3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__VNRequest_detectorProgressHandler__block_invoke;
    aBlock[3] = &unk_1E4543FB8;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    v5 = _Block_copy(aBlock);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = 0;
  }
  v7 = _Block_copy(v5);

  return v7;
}

- (id)computeDeviceForComputeStage:(VNComputeStage)computeStage
{
  -[VNRequestConfiguration computeDeviceForComputeStage:](self->_configuration, "computeDeviceForComputeStage:", computeStage);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)computeStageDeviceAssignments
{
  return -[VNRequestConfiguration computeStageDeviceAssignments](self->_configuration, "computeStageDeviceAssignments");
}

- (OS_dispatch_semaphore)cancellationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCancellationSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

void __36__VNRequest_detectorProgressHandler__block_invoke(uint64_t a1, void *a2, double a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);

}

void __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_109(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t (**v14)(void *, id *);
  uint64_t v15;
  id v16;
  VNAsyncStatus *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD aBlock[5];
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  int v32;

  VNValidatedLog(1, (uint64_t)CFSTR("alignFaceBlock: start processing: %@"), a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 88));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_2;
  aBlock[3] = &unk_1E4543F18;
  v32 = *(_DWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v31 = *(_QWORD *)(a1 + 72);
  aBlock[4] = v9;
  aBlock[1] = 3221225472;
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(a1 + 56);
  v28 = v11;
  v29 = v12;
  v30 = v13;
  v14 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
  v26 = 0;
  v15 = v14[2](v14, &v26);
  v16 = v26;
  v17 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v15, v16);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  VNValidatedLog(1, (uint64_t)CFSTR("alignFaceBlock: finish processing: %@"), v20, v21, v22, v23, v24, v25, *(_QWORD *)(a1 + 88));
  if (!*(_BYTE *)(a1 + 100))
    objc_msgSend(*(id *)(a1 + 64), "dispatchReportBlockCompletion");

}

BOOL __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_alignFacesInContext:faces:qosClass:options:error:", v5, v6, *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56), a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
}

NSString *__64__VNRequest_validateImageBuffer_ofNonZeroWidth_andHeight_error___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

void __36__VNRequest_performInContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    kdebug_trace();
    v2 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v13 = 0;
    v4 = objc_msgSend(v2, "internalCancelInContext:error:", v3, &v13);
    v5 = v13;
    v12 = v5;
    if ((v4 & 1) == 0)
      VNValidatedLog(4, (uint64_t)CFSTR("Encountered error cancelling request: %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  }
}

uint64_t __53__VNRequest_warmUpApplicableDetectorInSession_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "warmUpSession:withOptions:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  BOOL v4;
  void *v8;
  void *v9;
  char v10;
  BOOL v12;

  if (a3 == a4)
    return 1;
  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", a1, a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", a1, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "hasModelEquivalencyToRequestSpecifier:", v9);
  v12 = a3 < 0xDECAF000 && a4 < 0xDECAF000;
  v4 = (v10 & 1) != 0 || v12;

  return v4;
}

+ (BOOL)getOptionalObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7
{
  return _getObjectFromOptionsDictionary(a3, a6, a5, 0, a4, (uint64_t)a7);
}

+ (BOOL)getRequiredObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7
{
  return _getObjectFromOptionsDictionary(a3, a6, a5, 1, a4, (uint64_t)a7);
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v18;

  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v18;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    *(_QWORD *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  double v18;
  id v20;

  v11 = a4;
  v12 = a5;
  v20 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v20;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  char ObjectFromOptionsDictionary;
  id v13;
  void *v14;
  char v15;
  int v16;
  id v18;

  v9 = a4;
  v10 = a5;
  v18 = 0;
  v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  v13 = v18;
  v14 = v13;
  if (a3)
    v15 = ObjectFromOptionsDictionary;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v13, "floatValue");
    *(_DWORD *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(float)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  char v17;
  float v18;
  id v20;

  v11 = a4;
  v12 = a5;
  v20 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v20;
  v16 = v15;
  if (a3)
    v17 = ObjectFromOptionsDictionary;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
  {
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getOptionalArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  char ObjectFromOptionsDictionary;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v30 = 0;
  v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v30, v12, v11, 0, v13, (uint64_t)a7);
  v15 = v30;
  v16 = v15;
  if ((ObjectFromOptionsDictionary & 1) != 0)
  {
    if (a6)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v17);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a7)
              {
                v22 = objc_alloc(MEMORY[0x1E0CB3940]);
                NSStringFromClass(a6);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("All elements in the %@ array must be of class %@ (%@)"), v11, v23, v17);

                +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v24);
                *a7 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_18;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v18)
            continue;
          break;
        }
      }

    }
    if (a3)
      *a3 = (id)objc_msgSend(v16, "copy");
    v21 = 1;
  }
  else
  {
LABEL_18:
    v21 = 0;
  }

  return v21;
}

+ (NSUInteger)currentRevision
{
  void *v3;
  NSUInteger v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "supportedRevisions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lastIndex");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL || !v4)
  {
    v4 = objc_msgSend(a1, "defaultRevision");
    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      NSStringFromClass((Class)objc_msgSend(a1, "frameworkClass"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ must provide at least one supported revision"), v6);

      +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v7);
      return 0;
    }
  }
  return v4;
}

+ (unint64_t)firstSupportedRevisionInOrderedRevisionList:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  unint64_t *v7;
  unint64_t *v9;
  uint64_t v10;

  v3 = a3;
  if (a3)
  {
    v9 = (unint64_t *)&v10;
    v5 = (void *)MEMORY[0x1A1B0B060](a1, a2);
    objc_msgSend(a1, "allSupportedRevisions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      if ((objc_msgSend(v6, "containsIndex:", v3) & 1) != 0)
        break;
      v7 = v9++;
      v3 = *v7;
    }
    while (*v7);

    objc_autoreleasePoolPop(v5);
  }
  return v3;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  return 0;
}

+ (NSIndexSet)allSupportedRevisions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "supportedRevisions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(a1, "supportedPrivateRevisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndexes:", v5);

  return (NSIndexSet *)v4;
}

+ (const)dependentRequestCompatibility
{
  return 0;
}

+ (const)dependentRequestMappingTable
{
  return 0;
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (a1 == a3)
    return a4;
  v7 = objc_msgSend(a1, "dependentRequestMappingTable");
  if (v7)
  {
    v8 = *(_QWORD *)v7;
    if (*(_QWORD *)v7)
    {
      while (v8 != a4 || *(Class *)(v7 + 8) != a3)
      {
        v9 = *(_QWORD *)(v7 + 24);
        v7 += 24;
        v8 = v9;
        if (!v9)
          goto LABEL_7;
      }
      return *(_QWORD *)(v7 + 16);
    }
  }
LABEL_7:
  v10 = -[objc_class defaultRevision](a3, "defaultRevision");
  v11 = (unint64_t *)objc_msgSend(a1, "dependentRequestCompatibility");
  if (v11)
  {
    v12 = *v11;
    if (*v11)
    {
      v13 = 0;
      v14 = v11 + 2;
      do
      {
        if (v12 == a4 && (Class)*(v14 - 1) == a3)
        {
          v15 = *v14;
          if (*v14 < 0xDECAF000)
          {
            if (v15 == v10)
              return v10;
            if (v15 > v13)
              v13 = *v14;
          }
          else
          {
            v16 = objc_alloc(MEMORY[0x1E0CB3940]);
            VNMethodSignatureStringForObjectAndSelector(a1, sel_dependentRequestCompatibility);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            VNRequestRevisionString((objc_class *)a1, *(v14 - 2));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            VNRequestRevisionString((objc_class *)*(v14 - 1), *v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@ contains an entry for %@ that is dependent on a private revision %@"), v17, v18, v19);

            +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v20);
          }
        }
        v12 = v14[1];
        v14 += 3;
      }
      while (v12);
      if (v13)
        return v13;
    }
  }
  return -[objc_class resolvedRevisionForRevision:](a3, "resolvedRevisionForRevision:", 0);
}

- (id)utilizedResourcesWithError:(id *)a3
{
  void *v4;

  if (a3)
  {
    -[VNRequest specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOperationForRequestSpecifier:](VNError, "errorForInvalidOperationForRequestSpecifier:", v4);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  return 1;
}

- (CGRect)VNImageProcessingSessionRegionOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)VNImageProcessingSessionPrintAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VNRequest VNImageProcessingSessionPrintKeyPath](self, "VNImageProcessingSessionPrintKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VNRequest results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKeyPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a3)
      {
        v8 = 0;
        goto LABEL_10;
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ did not generate a single print"), self);
      +[VNError errorForInvalidOptionWithLocalizedDescription:](VNError, "errorForInvalidOptionWithLocalizedDescription:", v7);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_10:
    goto LABEL_11;
  }
  if (a3)
  {
    -[VNRequest specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOperationForRequestSpecifier:](VNError, "errorForInvalidOperationForRequestSpecifier:", v6);
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)VNImageProcessingSessionPrintKeyPath
{
  return 0;
}

+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7
{
  if (a7)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1, a5, a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[VNRequest specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ does not produce sceneprint data"), v6);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)VNCoreMLTransformerDetectionprintAndReturnError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[VNRequest specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ does not produce detectionprint data"), v6);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
