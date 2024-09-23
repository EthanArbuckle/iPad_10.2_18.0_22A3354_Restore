@implementation AVCapturePhotoOutputReadinessCoordinator

+ (int64_t)_captureReadinessFromReadinessState:(AVCapturePhotoOutputCaptureReadinessState *)a3
{
  int numberOfPhotoCapturesInflight;
  uint64_t v4;
  int64_t v6;

  if (a3->sessionIsRunning)
  {
    numberOfPhotoCapturesInflight = a3->numberOfPhotoCapturesInflight;
    v4 = 1;
    if (numberOfPhotoCapturesInflight > 1)
      v4 = 2;
    if (a3->inflightNonOverlappingCaptureUniqueID < 1 || numberOfPhotoCapturesInflight <= 0)
      v6 = v4;
    else
      v6 = 2;
  }
  else
  {
    numberOfPhotoCapturesInflight = a3->numberOfPhotoCapturesInflight;
    v6 = 2 * (numberOfPhotoCapturesInflight > 0);
  }
  if (a3->inflightUniqueIDWaitingForCapture >= 1 && numberOfPhotoCapturesInflight > 0)
    return 3;
  if (numberOfPhotoCapturesInflight <= 0 || a3->inflightUniqueIDWaitingForProcessing <= 0)
    return v6;
  else
    return 4;
}

- (AVCapturePhotoOutputReadinessCoordinator)initWithPhotoOutput:(AVCapturePhotoOutput *)photoOutput
{
  AVCapturePhotoOutputReadinessCoordinator *v4;
  objc_super v6;

  if (photoOutput)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVCapturePhotoOutputReadinessCoordinator;
    v4 = -[AVCapturePhotoOutputReadinessCoordinator init](&v6, sel_init);
    if (v4)
    {
      v4->_delegateStorage = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E0CF2D58]);
      v4->_trackedPhotoSettingsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[AVCapturePhotoOutput _addReadinessCoordinator:](photoOutput, "_addReadinessCoordinator:", v4);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCapturePhotoOutputReadinessCoordinator;
  -[AVCapturePhotoOutputReadinessCoordinator dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  return (id)-[AVWeakReferencingDelegateStorage delegate](self->_delegateStorage, "delegate");
}

- (void)setDelegate:(id)delegate
{
  -[AVCapturePhotoOutputReadinessCoordinator _setDelegate:queue:](self, "_setDelegate:queue:");
}

- (AVCapturePhotoOutputCaptureReadiness)captureReadiness
{
  return self->_captureReadiness;
}

- (void)startTrackingCaptureRequestUsingPhotoSettings:(AVCapturePhotoSettings *)settings
{
  id v5;
  void *v6;
  _QWORD v7[6];
  const __CFString *v8;

  v8 = 0;
  if (po_photoSettingsAreValid(settings, 0, 0, 0, &v8))
  {
    v5 = (id)-[AVCapturePhotoSettings copy](settings, "copy");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__AVCapturePhotoOutputReadinessCoordinator_startTrackingCaptureRequestUsingPhotoSettings___block_invoke;
    v7[3] = &unk_1E421D7F8;
    v7[4] = self;
    v7[5] = v5;
    -[AVCapturePhotoOutputReadinessCoordinator _invokeDelegateCallbackWithBlock:](self, "_invokeDelegateCallbackWithBlock:", v7);
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

uint64_t __90__AVCapturePhotoOutputReadinessCoordinator_startTrackingCaptureRequestUsingPhotoSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateCaptureReadinessWithDelegate:", a2);
}

- (void)stopTrackingCaptureRequestUsingPhotoSettingsUniqueID:(int64_t)settingsUniqueID
{
  void *v3;
  _QWORD v4[6];

  if (settingsUniqueID <= 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke;
    v4[3] = &unk_1E421D840;
    v4[4] = self;
    v4[5] = settingsUniqueID;
    -[AVCapturePhotoOutputReadinessCoordinator _invokeDelegateCallbackWithBlock:](self, "_invokeDelegateCallbackWithBlock:", v4);
  }
}

uint64_t __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t result;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke_2;
  v8[3] = &__block_descriptor_40_e39_B32__0__AVCapturePhotoSettings_8Q16_B24l;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v8[1] = 3221225472;
  v8[4] = v4;
  v6 = (void *)objc_msgSend(v5, "indexesOfObjectsPassingTest:", v8);
  result = objc_msgSend(v6, "count");
  if (result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectsAtIndexes:", v6);
    return objc_msgSend(*(id *)(a1 + 32), "_updateCaptureReadinessWithDelegate:", a2);
  }
  return result;
}

BOOL __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID") == *(_QWORD *)(a1 + 32);
}

- (id)_queue
{
  return (id)-[AVWeakReferencingDelegateStorage delegateQueue](self->_delegateStorage, "delegateQueue");
}

- (void)_setDelegate:(id)a3 queue:(id)a4
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  id v8;
  _QWORD v9[5];

  delegateStorage = self->_delegateStorage;
  if (a3)
  {
    v8 = (id)-[AVWeakReferencingDelegateStorage delegate](delegateStorage, "delegate");
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_delegateStorage, "setDelegate:queue:", a3, a4);
    if (v8 != a3)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__AVCapturePhotoOutputReadinessCoordinator__setDelegate_queue___block_invoke;
      v9[3] = &unk_1E421D868;
      v9[4] = self;
      -[AVCapturePhotoOutputReadinessCoordinator _invokeDelegateCallbackWithBlock:](self, "_invokeDelegateCallbackWithBlock:", v9);
    }
  }
  else
  {
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:", 0, a4);
  }
}

uint64_t __63__AVCapturePhotoOutputReadinessCoordinator__setDelegate_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "readinessCoordinator:captureReadinessDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

- (void)_photoOutputDidUpdateCaptureReadinessState:(AVCapturePhotoOutputCaptureReadinessState *)a3
{
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;
  __int128 v6;
  int64_t inflightUniqueIDWaitingForProcessing;

  v4[1] = 3221225472;
  v3 = *(_OWORD *)&a3->inflightNonOverlappingCaptureUniqueID;
  v5 = *(_OWORD *)&a3->sessionIsRunning;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke;
  v4[3] = &unk_1E421D8B0;
  v4[4] = self;
  v6 = v3;
  inflightUniqueIDWaitingForProcessing = a3->inflightUniqueIDWaitingForProcessing;
  -[AVCapturePhotoOutputReadinessCoordinator _invokeDelegateCallbackWithBlock:](self, "_invokeDelegateCallbackWithBlock:", v4);
}

uint64_t __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 56);
  *(_QWORD *)(v4 + 56) = *(_QWORD *)(a1 + 72);
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke_2;
  v12[3] = &__block_descriptor_72_e39_B32__0__AVCapturePhotoSettings_8Q16_B24l;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v14 = v9;
  v13 = v8;
  v10 = (void *)objc_msgSend(v7, "indexesOfObjectsPassingTest:", v12);
  if (objc_msgSend(v10, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectsAtIndexes:", v10);
  return objc_msgSend(*(id *)(a1 + 32), "_updateCaptureReadinessWithDelegate:", a2);
}

BOOL __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID") <= *(_QWORD *)(a1 + 40);
}

+ (BOOL)_isOverlappingCaptureSupportedForPhotoSettings:(id)a3 autoDeferredPhotoDeliveryEnabled:(BOOL)a4 responsiveCaptureEnabled:(BOOL)a5
{
  BOOL result;
  int v9;
  int v10;

  if (!a3)
    return 0;
  if (objc_msgSend(a3, "digitalFlashMode") > 0 || objc_msgSend(a3, "flashMode") == 1)
    return 0;
  v9 = objc_msgSend(a3, "maxPhotoDimensions");
  v10 = ((unint64_t)objc_msgSend(a3, "maxPhotoDimensions") >> 32) * v9;
  result = v10 < 48000000;
  if (!a4 && !a5 && v10 <= 47999999)
    return objc_msgSend(a3, "photoQualityPrioritization") != 3;
  return result;
}

- (void)_invokeDelegateCallbackWithBlock:(id)a3
{
  uint64_t v5;

  if (pthread_main_np())
    v5 = MEMORY[0x1E0C80D38];
  else
    v5 = 0;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:](self->_delegateStorage, "invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:", a3, v5);
}

- (void)_updateCaptureReadinessWithDelegate:(id)a3
{
  BOOL autoDeferredPhotoDeliveryEnabled;
  BOOL responsiveCaptureEnabled;
  int numberOfPhotoCapturesInflight;
  __int128 v7;
  NSMutableArray *trackedPhotoSettingsArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  int64_t latestCaptureUniqueID;
  char v19;
  BOOL sessionIsRunning;
  int v21;
  int64_t inflightNonOverlappingCaptureUniqueID;
  _BYTE v23[4];
  int v24;
  int64_t v25;
  int64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  autoDeferredPhotoDeliveryEnabled = self->_captureReadinessState.autoDeferredPhotoDeliveryEnabled;
  responsiveCaptureEnabled = self->_captureReadinessState.responsiveCaptureEnabled;
  v19 = *(&self->_captureReadinessState.responsiveCaptureEnabled + 1);
  sessionIsRunning = self->_captureReadinessState.sessionIsRunning;
  numberOfPhotoCapturesInflight = self->_captureReadinessState.numberOfPhotoCapturesInflight;
  latestCaptureUniqueID = self->_captureReadinessState.latestCaptureUniqueID;
  inflightNonOverlappingCaptureUniqueID = self->_captureReadinessState.inflightNonOverlappingCaptureUniqueID;
  v7 = *(_OWORD *)&self->_captureReadinessState.inflightUniqueIDWaitingForCapture;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = v7;
  trackedPhotoSettingsArray = self->_trackedPhotoSettingsArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](trackedPhotoSettingsArray, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v21 = numberOfPhotoCapturesInflight;
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(trackedPhotoSettingsArray);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "_isOverlappingCaptureSupportedForPhotoSettings:autoDeferredPhotoDeliveryEnabled:responsiveCaptureEnabled:", v13, autoDeferredPhotoDeliveryEnabled, responsiveCaptureEnabled) & 1) == 0)inflightNonOverlappingCaptureUniqueID = objc_msgSend(v13, "uniqueID");
      }
      numberOfPhotoCapturesInflight = v21 + v10;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](trackedPhotoSettingsArray, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }
  v14 = (void *)objc_opt_class();
  v23[0] = sessionIsRunning;
  v23[1] = autoDeferredPhotoDeliveryEnabled;
  v23[2] = responsiveCaptureEnabled;
  v23[3] = v19;
  v24 = numberOfPhotoCapturesInflight;
  v25 = latestCaptureUniqueID;
  v26 = inflightNonOverlappingCaptureUniqueID;
  v27 = v32;
  v15 = objc_msgSend(v14, "_captureReadinessFromReadinessState:", v23);
  if (v15 != self->_captureReadiness)
  {
    v16 = v15;
    -[AVCapturePhotoOutputReadinessCoordinator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("captureReadiness"));
    self->_captureReadiness = v16;
    -[AVCapturePhotoOutputReadinessCoordinator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("captureReadiness"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a3, "readinessCoordinator:captureReadinessDidChange:", self, v16);
  }
}

@end
