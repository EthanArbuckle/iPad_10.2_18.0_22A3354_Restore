@implementation ARFaceTrackingInternalTechnique

- (ARFaceTrackingInternalTechnique)initWithOptions:(id)a3
{
  return -[ARFaceTrackingInternalTechnique initWithMaximumNumberOfTrackedFaces:options:](self, "initWithMaximumNumberOfTrackedFaces:options:", 1, a3);
}

- (ARFaceTrackingInternalTechnique)initWithMaximumNumberOfTrackedFaces:(int64_t)a3 options:(id)a4
{
  id v6;
  ARFaceTrackingInternalTechnique *v7;
  ARFaceTrackingInternalTechnique *v8;
  ARFaceTrackingManager *v9;
  ARFaceTrackingManager *faceTrackingManger;
  uint64_t v11;
  OS_dispatch_queue *processDataQueue;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *detectionSemaphore;
  ARFaceTrackingInternalTechnique *v15;
  objc_super v17;

  v6 = a4;
  if (+[ARFaceTrackingManager isSupported](ARFaceTrackingManager, "isSupported"))
  {
    v17.receiver = self;
    v17.super_class = (Class)ARFaceTrackingInternalTechnique;
    v7 = -[ARImageBasedTechnique init](&v17, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_maximumNumberOfTrackedFaces = a3;
      v9 = -[ARFaceTrackingManager initWithMaximumNumberOfTrackedFaces:options:]([ARFaceTrackingManager alloc], "initWithMaximumNumberOfTrackedFaces:options:", a3, v6);
      faceTrackingManger = v8->_faceTrackingManger;
      v8->_faceTrackingManger = v9;

      if (!v8->_faceTrackingManger)
      {
        v15 = 0;
        self = v8;
        goto LABEL_7;
      }
      ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.technique.faceTracking");
      v11 = objc_claimAutoreleasedReturnValue();
      processDataQueue = v8->_processDataQueue;
      v8->_processDataQueue = (OS_dispatch_queue *)v11;

      v13 = dispatch_semaphore_create(1);
      detectionSemaphore = v8->_detectionSemaphore;
      v8->_detectionSemaphore = (OS_dispatch_semaphore *)v13;

    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }
LABEL_7:

  return v15;
}

+ (BOOL)isSupported
{
  return +[ARFaceTrackingManager isSupported](ARFaceTrackingManager, "isSupported");
}

- (ARFaceTrackingInternalTechnique)init
{
  return -[ARFaceTrackingInternalTechnique initWithOptions:](self, "initWithOptions:", 0);
}

- (unint64_t)requiredSensorDataTypes
{
  return 49;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ARFaceTrackingInternalTechnique;
    v5 = -[ARImageBasedTechnique processData:](&v8, sel_processData_, v4);
    -[ARFaceTrackingInternalTechnique _enqueueImageForFaceTrackingNonBlocking:](self, "_enqueueImageForFaceTrackingNonBlocking:", v4);
    if (self->_deterministicMode)
      dispatch_sync((dispatch_queue_t)self->_processDataQueue, &__block_literal_global_22);
  }
  else
  {
    v6 = v4;
  }

  return v4;
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (int64_t)captureBehavior
{
  return 0;
}

- (void)_enqueueImageForFaceTrackingNonBlocking:(id)a3
{
  id v4;
  OS_dispatch_semaphore *v5;
  NSObject *processDataQueue;
  _QWORD v7[4];
  id v8;
  OS_dispatch_semaphore *v9;
  id v10;
  id location;

  v4 = a3;
  v5 = self->_detectionSemaphore;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v5, 0))
  {
    objc_initWeak(&location, self);
    processDataQueue = self->_processDataQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__ARFaceTrackingInternalTechnique__enqueueImageForFaceTrackingNonBlocking___block_invoke;
    v7[3] = &unk_1E6672D40;
    objc_copyWeak(&v10, &location);
    v8 = v4;
    v9 = v5;
    dispatch_async(processDataQueue, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

intptr_t __75__ARFaceTrackingInternalTechnique__enqueueImageForFaceTrackingNonBlocking___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_processImageDataInBackgound:", *(_QWORD *)(a1 + 32));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_processImageDataInBackgound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processDataQueue);
  -[ARFaceTrackingManager processData:](self->_faceTrackingManger, "processData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v6);

}

- (void)prepare:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARFaceTrackingInternalTechnique;
  -[ARTechnique prepare:](&v5, sel_prepare_);
  self->_deterministicMode = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingInternalTechnique;
  if (-[ARTechnique isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARFaceTrackingInternalTechnique maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces");
    v7 = v6 == objc_msgSend(v5, "maximumNumberOfTrackedFaces");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDataQueue, 0);
  objc_storeStrong((id *)&self->_faceTrackingManger, 0);
  objc_storeStrong((id *)&self->_detectionSemaphore, 0);
}

@end
