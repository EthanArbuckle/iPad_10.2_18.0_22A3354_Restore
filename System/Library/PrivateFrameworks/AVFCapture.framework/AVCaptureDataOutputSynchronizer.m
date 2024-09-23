@implementation AVCaptureDataOutputSynchronizer

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureDataOutputSynchronizer)initWithDataOutputs:(NSArray *)dataOutputs
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  AVCaptureDataOutputSynchronizer *v12;
  AVCaptureDataOutputSynchronizer *v13;
  AVCaptureDataOutputSynchronizerInternal *v14;
  NSArray *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t j;
  AVCDOSDataOutputStorage *v22;
  void *v23;
  uint64_t v24;
  AVCaptureDataOutputSynchronizer *v25;
  void *v26;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!dataOutputs)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
LABEL_45:
    v26 = (void *)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v26);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v26);
    return 0;
  }
  if (!-[NSArray count](dataOutputs, "count"))
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    goto LABEL_45;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](dataOutputs, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(dataOutputs);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v23 = (void *)MEMORY[0x1E0C99DA0];
                      v24 = *MEMORY[0x1E0C99778];
                      goto LABEL_45;
                    }
                  }
                }
              }
            }
          }
        }
        v11 = objc_msgSend(v10, "session");
        if (v7)
        {
          if (v11 != v7)
          {
            v23 = (void *)MEMORY[0x1E0C99DA0];
            v24 = *MEMORY[0x1E0C99778];
            goto LABEL_45;
          }
        }
        else
        {
          v7 = v11;
          if (!v11)
          {
            v23 = (void *)MEMORY[0x1E0C99DA0];
            v24 = *MEMORY[0x1E0C99778];
            goto LABEL_45;
          }
        }
        if (!objc_msgSend((id)objc_msgSend(v10, "connections"), "firstObject"))
        {
          v23 = (void *)MEMORY[0x1E0C99DA0];
          v24 = *MEMORY[0x1E0C99778];
          goto LABEL_45;
        }
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE53F148) & 1) == 0)
        {
          v23 = (void *)MEMORY[0x1E0C99DA0];
          v24 = *MEMORY[0x1E0C99778];
          goto LABEL_45;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](dataOutputs, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v6)
        continue;
      break;
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)AVCaptureDataOutputSynchronizer;
  v12 = -[AVCaptureDataOutputSynchronizer init](&v33, sel_init);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = objc_alloc_init(AVCaptureDataOutputSynchronizerInternal);
  v13->_internal = v14;
  if (!v14)
  {

    return 0;
  }
  v13->_internal->delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.dataoutputsynchronizer.queue"), 1);
  v13->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v13);
  v15 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](dataOutputs, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = dataOutputs;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](dataOutputs, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v28 = 0;
    v20 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(dataOutputs);
        v22 = -[AVCDOSDataOutputStorage initWithDataOutput:]([AVCDOSDataOutputStorage alloc], "initWithDataOutput:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
        -[NSArray addObject:](v15, "addObject:", v22);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = 1;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LOBYTE(v28) = 1;
          }
          else
          {
            objc_opt_class();
            HIDWORD(v28) |= objc_opt_isKindOfClass();
          }
        }

      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](dataOutputs, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
    v28 = 0;
  }
  v25 = v13;
  v13->_internal->dataOutputsStorage = v15;
  v13->_internal->dataOutputs = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v16);
  v13->_internal->leaderSynchronizedDataQueueMaxDepth = -[AVCaptureDataOutputSynchronizer _computedLeaderSynchronizedDataQueueMaxDepthForDataOutputs:](v13, "_computedLeaderSynchronizedDataQueueMaxDepthForDataOutputs:", v16);
  v13->_internal->dataOutputsStorageMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  -[AVCaptureDataOutputSynchronizer _assignTimestampAdjustmentQueueToDataOutputStorageWithCommonProvenance](v13, "_assignTimestampAdjustmentQueueToDataOutputStorageWithCommonProvenance");
  v13->_internal->synchronizingVideoAndDepth = v19 & v28 & 1;
  v13->_internal->synchronizingVideoAndVisionData = v19 & BYTE4(v28) & 1;
  return v25;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_internal)
  {
    -[AVCaptureDataOutputSynchronizer setDelegate:queue:](self, "setDelegate:queue:", 0, 0);

    FigSimpleMutexDestroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDataOutputSynchronizer;
  -[AVCaptureDataOutputSynchronizer dealloc](&v3, sel_dealloc);
}

- (NSArray)dataOutputs
{
  return self->_internal->dataOutputs;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateCallbackQueue
{
  void *v7;
  uint64_t v8;

  -[AVCaptureDataOutputSynchronizer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegate"));
  v8 = 0;
  if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", delegate, delegateCallbackQueue, &v8))
  {
    -[AVCaptureDataOutputSynchronizer _overrideDataOutputDelegatesForDelegateCallbackQueue:](self, "_overrideDataOutputDelegatesForDelegateCallbackQueue:", delegateCallbackQueue);
    -[AVCaptureDataOutputSynchronizer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureDataOutputSynchronizer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (id)delegate
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_internal->delegateCallbackHelper, "clientDelegate");
}

- (dispatch_queue_t)delegateCallbackQueue
{
  return (dispatch_queue_t)-[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_internal->delegateCallbackHelper, "clientCallbackQueue");
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7;

  v7 = -[AVCaptureSynchronizedSampleBufferData _initWithSampleBuffer:sampleBufferWasDropped:]([AVCaptureSynchronizedSampleBufferData alloc], "_initWithSampleBuffer:sampleBufferWasDropped:", a4, 0);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v7, a3);

}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7;

  v7 = -[AVCaptureSynchronizedSampleBufferData _initWithSampleBuffer:sampleBufferWasDropped:]([AVCaptureSynchronizedSampleBufferData alloc], "_initWithSampleBuffer:sampleBufferWasDropped:", a4, 1);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v7, a3);

}

- (void)captureOutput:(id)a3 didOutputMetadataObjectCollections:(id)a4 fromConnection:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a4, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = -[AVCaptureSynchronizedMetadataObjectData _initWithMetadataObjectCollection:]([AVCaptureSynchronizedMetadataObjectData alloc], "_initWithMetadataObjectCollection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v12, a3);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
}

uint64_t __99__AVCaptureDataOutputSynchronizer_captureOutput_didOutputMetadataObjectCollections_fromConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  CMTime v5;
  CMTime time1;

  if (!a2)
  {
    memset(&time1, 0, sizeof(time1));
    if (a3)
      goto LABEL_3;
LABEL_5:
    memset(&v5, 0, sizeof(v5));
    return CMTimeCompare(&time1, &v5);
  }
  objc_msgSend(a2, "time");
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a3, "time");
  return CMTimeCompare(&time1, &v5);
}

- (void)depthDataOutput:(id)a3 didOutputDepthData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  AVCaptureSynchronizedDepthData *v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = [AVCaptureSynchronizedDepthData alloc];
  v12 = *a5;
  v11 = -[AVCaptureSynchronizedDepthData _initWithDepthData:timestamp:depthDataWasDropped:droppedReason:](v10, "_initWithDepthData:timestamp:depthDataWasDropped:droppedReason:", a4, &v12, 0, 0);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v11, a3);

}

- (void)depthDataOutput:(id)a3 didDropDepthData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7
{
  AVCaptureSynchronizedDepthData *v12;
  id v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  v12 = [AVCaptureSynchronizedDepthData alloc];
  v14 = *a5;
  v13 = -[AVCaptureSynchronizedDepthData _initWithDepthData:timestamp:depthDataWasDropped:droppedReason:](v12, "_initWithDepthData:timestamp:depthDataWasDropped:droppedReason:", a4, &v14, 1, a7);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v13, a3);

}

- (void)visionDataOutput:(id)a3 didOutputVisionDataPixelBuffer:(__CVBuffer *)a4 timestamp:(id *)a5 connection:(id)a6
{
  AVCaptureSynchronizedVisionData *v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = [AVCaptureSynchronizedVisionData alloc];
  v12 = *a5;
  v11 = -[AVCaptureSynchronizedVisionData _initWithVisionDataPixelBuffer:timestamp:visionDataWasDropped:droppedReason:](v10, "_initWithVisionDataPixelBuffer:timestamp:visionDataWasDropped:droppedReason:", a4, &v12, 0, 0);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v11, a3);

}

- (void)visionDataOutput:(id)a3 didDropVisionDataPixelBufferForTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6
{
  AVCaptureSynchronizedVisionData *v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = [AVCaptureSynchronizedVisionData alloc];
  v12 = *a4;
  v11 = -[AVCaptureSynchronizedVisionData _initWithVisionDataPixelBuffer:timestamp:visionDataWasDropped:droppedReason:](v10, "_initWithVisionDataPixelBuffer:timestamp:visionDataWasDropped:droppedReason:", 0, &v12, 1, a6);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v11, a3);

}

- (void)pointCloudDataOutput:(id)a3 didOutputPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  AVCaptureSynchronizedPointCloudData *v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = [AVCaptureSynchronizedPointCloudData alloc];
  v12 = *a5;
  v11 = -[AVCaptureSynchronizedPointCloudData _initWithPointCloudDataBuffer:timestamp:pointCloudDataWasDropped:droppedReason:](v10, "_initWithPointCloudDataBuffer:timestamp:pointCloudDataWasDropped:droppedReason:", a4, &v12, 0, 0);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v11, a3);

}

- (void)pointCloudDataOutput:(id)a3 didDropPointCloudData:(id)a4 timestamp:(id *)a5 connection:(id)a6 reason:(int64_t)a7
{
  AVCaptureSynchronizedPointCloudData *v12;
  id v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  v12 = [AVCaptureSynchronizedPointCloudData alloc];
  v14 = *a5;
  v13 = -[AVCaptureSynchronizedPointCloudData _initWithPointCloudDataBuffer:timestamp:pointCloudDataWasDropped:droppedReason:](v12, "_initWithPointCloudDataBuffer:timestamp:pointCloudDataWasDropped:droppedReason:", a4, &v14, 1, a7);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v13, a3);

}

- (void)cameraCalibrationDataOutput:(id)a3 didOutputCameraCalibrationData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  AVCaptureSynchronizedCameraCalibrationData *v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = [AVCaptureSynchronizedCameraCalibrationData alloc];
  v12 = *a5;
  v11 = -[AVCaptureSynchronizedCameraCalibrationData _initWithCameraCalibrationData:timestamp:cameraCalibrationDataWasDropped:droppedReason:](v10, "_initWithCameraCalibrationData:timestamp:cameraCalibrationDataWasDropped:droppedReason:", a4, &v12, 0, 0);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v11, a3);

}

- (void)cameraCalibrationDataOutput:(id)a3 didDropCameraCalibrationDataAtTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6
{
  AVCaptureSynchronizedCameraCalibrationData *v10;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = [AVCaptureSynchronizedCameraCalibrationData alloc];
  v12 = *a4;
  v11 = -[AVCaptureSynchronizedCameraCalibrationData _initWithCameraCalibrationData:timestamp:cameraCalibrationDataWasDropped:droppedReason:](v10, "_initWithCameraCalibrationData:timestamp:cameraCalibrationDataWasDropped:droppedReason:", 0, &v12, 1, a6);
  -[AVCaptureDataOutputSynchronizer _appendSynchronizedData:forCaptureOutput:](self, "_appendSynchronizedData:forCaptureOutput:", v11, a3);

}

- (int)_computedLeaderSynchronizedDataQueueMaxDepthForDataOutputs:(id)a3
{
  if (objc_msgSend(a3, "count") == 1)
    return 1;
  else
    return 4;
}

- (void)_assignTimestampAdjustmentQueueToDataOutputStorageWithCommonProvenance
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  NSUInteger v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_internal->dataOutputsStorage, "count");
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  v5 = (void *)v4;
  if (v3)
  {
    v6 = 0;
    v21 = (void *)v4;
    do
    {
      v7 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v6);
      v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "dataOutput"), "connections"), "objectAtIndexedSubscript:", 0), "sourceDevice");
      if (objc_msgSend(v5, "containsObject:", v8))
      {
        ++v6;
      }
      else
      {
        objc_msgSend(v5, "addObject:", v8);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3 - v6);
        objc_msgSend(v9, "addObject:", v7);
        objc_msgSend(v7, "dataOutput");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v6;
        else
          v10 = -1;
        objc_msgSend(v7, "dataOutput");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v6;
        else
          v11 = -1;
        v12 = ++v6;
        if (v6 < v3)
        {
          do
          {
            v13 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v12);
            if (v8 == objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "dataOutput"), "connections"), "objectAtIndexedSubscript:", 0), "sourceDevice"))
            {
              objc_msgSend(v9, "addObject:", v13);
              if (v10 == -1 && (objc_msgSend(v13, "dataOutput"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v10 = v12;
              }
              else if (v11 == -1)
              {
                objc_msgSend(v13, "dataOutput");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v11 = v12;
                else
                  v11 = -1;
              }
            }
            ++v12;
          }
          while (v3 != v12);
        }
        if (v10 == -1)
          v14 = v11;
        else
          v14 = v10;
        if (v14 != -1)
        {
          v15 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:");
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v23;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v23 != v18)
                  objc_enumerationMutation(v9);
                v20 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v19);
                if (v20 != v15)
                  objc_msgSend(v20, "setTimestampAdjustmentsDataQueue:", objc_msgSend(v15, "synchronizedDataQueue"));
                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            }
            while (v17);
          }
        }

        v5 = v21;
      }
    }
    while (v6 != v3);
  }

}

- (void)_overrideDataOutputDelegatesForDelegateCallbackQueue:(id)a3
{
  NSArray *dataOutputsStorage;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_internal->dataOutputsStorageMutex, a2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  dataOutputsStorage = self->_internal->dataOutputsStorage;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](dataOutputsStorage, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(dataOutputsStorage);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "dataOutput");
        if (a3)
        {
          objc_msgSend(v11, "setDelegateOverride:delegateOverrideCallbackQueue:", self, objc_msgSend(v10, "delegateOverrideCallbackQueue"));
        }
        else
        {
          v12 = objc_msgSend(v11, "delegateOverrideCallbackQueue");
          if (v12 == objc_msgSend(v10, "delegateOverrideCallbackQueue"))
            objc_msgSend((id)objc_msgSend(v10, "dataOutput"), "setDelegateOverride:delegateOverrideCallbackQueue:", 0, 0);
          objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "removeAllObjects");
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](dataOutputsStorage, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  MEMORY[0x1A1AF12A4](self->_internal->dataOutputsStorageMutex);
}

- (void)_appendSynchronizedData:(id)a3 forCaptureOutput:(id)a4
{
  NSUInteger v7;

  MEMORY[0x1A1AF1298](self->_internal->dataOutputsStorageMutex, a2);
  v7 = -[NSArray indexOfObject:](self->_internal->dataOutputs, "indexOfObject:", a4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v7), "synchronizedDataQueue"), "addObject:", a3);
    -[AVCaptureDataOutputSynchronizer _dispatchRipenedSynchronizedData](self, "_dispatchRipenedSynchronizedData");
  }
  JUMPOUT(0x1A1AF12A4);
}

- (void)_dispatchRipenedSynchronizedData
{
  void *v3;
  void *v4;
  CMTimeEpoch i;
  void *v6;
  void *v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime v11;

  FigSimpleMutexCheckIsLockedOnThisThread();
  -[AVCaptureDataOutputSynchronizer _adjustSynchronizedDataTimestamps](self, "_adjustSynchronizedDataTimestamps");
  v3 = (void *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", 0), "synchronizedDataQueue");
  if (objc_msgSend(v3, "count"))
  {
    memset(&v11, 0, sizeof(v11));
    v4 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    if (v4)
      objc_msgSend(v4, "timestamp");
    else
      memset(&v11, 0, sizeof(v11));
    memset(&v10, 0, sizeof(v10));
    -[AVCaptureDataOutputSynchronizer _earliestFollowerSynchronizedDataQueueTimestamp](self, "_earliestFollowerSynchronizedDataQueueTimestamp");
    *(_OWORD *)&time1.value = 0uLL;
    for (i = 0; ; i = time1.epoch)
    {
      time1.epoch = i;
      v8 = v11;
      if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0)
        break;
      time1 = v10;
      -[AVCaptureDataOutputSynchronizer _dispatchSynchronizedDataWithTimestamp:](self, "_dispatchSynchronizedDataWithTimestamp:", &time1);
      -[AVCaptureDataOutputSynchronizer _earliestFollowerSynchronizedDataQueueTimestamp](self, "_earliestFollowerSynchronizedDataQueueTimestamp");
      v10 = time1;
    }
    time1 = v11;
    if (-[AVCaptureDataOutputSynchronizer _allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:](self, "_allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:", &time1))
    {
      while (1)
      {
        time1 = v11;
        -[AVCaptureDataOutputSynchronizer _dispatchSynchronizedDataWithTimestamp:](self, "_dispatchSynchronizedDataWithTimestamp:", &time1);
        if (!objc_msgSend(v3, "count"))
          break;
        v6 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        if (v6)
          objc_msgSend(v6, "timestamp");
        else
          memset(&time1, 0, sizeof(time1));
        v11 = time1;
        if (!-[AVCaptureDataOutputSynchronizer _allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:](self, "_allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:", &time1))goto LABEL_20;
      }
    }
    else
    {
LABEL_20:
      while (objc_msgSend(v3, "count") > (unint64_t)self->_internal->leaderSynchronizedDataQueueMaxDepth)
      {
        time1 = v11;
        -[AVCaptureDataOutputSynchronizer _dispatchSynchronizedDataWithTimestamp:](self, "_dispatchSynchronizedDataWithTimestamp:", &time1);
        if (!objc_msgSend(v3, "count"))
          break;
        v7 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        if (v7)
          objc_msgSend(v7, "timestamp");
        else
          memset(&time1, 0, sizeof(time1));
        v11 = time1;
      }
    }
  }
}

- (void)_adjustSynchronizedDataTimestamps
{
  uint64_t i;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  void *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  CMTime *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  CMTime v28;
  CMTime v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CMTime v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime rhs;
  CMTime lhs;
  CMTime v47;
  CMTime v48;
  CMTime v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  CMTime time2;
  CMTime time1;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CMTime v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  FigSimpleMutexCheckIsLockedOnThisThread();
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = self->_internal->dataOutputsStorage;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v69 != v23)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        if (objc_msgSend(v4, "timestampAdjustmentsDataQueue"))
        {
          v25 = i;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v26 = (id)objc_msgSend(v4, "synchronizedDataQueue");
          v5 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          if (!v5)
            goto LABEL_60;
          v6 = v5;
          v27 = *(_QWORD *)v65;
          while (1)
          {
            for (j = 0; j != v6; ++j)
            {
              if (*(_QWORD *)v65 != v27)
                objc_enumerationMutation(v26);
              v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
              if (v8)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "adjustedTimestamp");
                if ((v62 & 0x100000000) != 0)
                  continue;
              }
              else
              {
                v62 = 0;
                v61 = 0;
                v63 = 0;
              }
              v9 = *MEMORY[0x1E0CA2E28];
              v60.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              *(_OWORD *)&v60.value = v9;
              v10 = (void *)objc_msgSend(v4, "timestampAdjustmentsDataQueue");
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
              if (!v11)
                continue;
              v12 = v11;
              v13 = *(_QWORD *)v57;
              while (2)
              {
                for (k = 0; k != v12; ++k)
                {
                  if (*(_QWORD *)v57 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
                  if (v15)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "timestamp");
                    if (v8)
                      goto LABEL_23;
                  }
                  else
                  {
                    memset(&time1, 0, sizeof(time1));
                    if (v8)
                    {
LABEL_23:
                      objc_msgSend(v8, "timestamp");
                      goto LABEL_26;
                    }
                  }
                  memset(&time2, 0, sizeof(time2));
LABEL_26:
                  if (!CMTimeCompare(&time1, &time2))
                  {
                    if (v15)
                    {
                      objc_msgSend(v15, "timestamp");
                    }
                    else
                    {
                      v52 = 0uLL;
                      v53 = 0;
                    }
                    v50 = v52;
                    v51 = v53;
                    v16 = (CMTime *)&v50;
                    goto LABEL_57;
                  }
                  if (v15)
                  {
                    objc_msgSend(v15, "timestamp");
                    if (v8)
                      goto LABEL_29;
                  }
                  else
                  {
                    memset(&v49, 0, sizeof(v49));
                    if (v8)
                    {
LABEL_29:
                      objc_msgSend(v8, "timestamp");
                      goto LABEL_32;
                    }
                  }
                  memset(&v48, 0, sizeof(v48));
LABEL_32:
                  if (CMTimeCompare(&v49, &v48) >= 1)
                  {
                    memset(&v47, 0, sizeof(v47));
                    if (v8)
                      objc_msgSend(v8, "timestamp");
                    else
                      memset(&lhs, 0, sizeof(lhs));
                    rhs = v60;
                    CMTimeSubtract(&v47, &lhs, &rhs);
                    memset(&rhs, 0, sizeof(rhs));
                    if (v15)
                    {
                      objc_msgSend(v15, "timestamp");
                      if (v8)
                        goto LABEL_48;
LABEL_50:
                      memset(&v43, 0, sizeof(v43));
                    }
                    else
                    {
                      memset(&v44, 0, sizeof(v44));
                      if (!v8)
                        goto LABEL_50;
LABEL_48:
                      objc_msgSend(v8, "timestamp");
                    }
                    CMTimeSubtract(&rhs, &v44, &v43);
                    v42 = rhs;
                    v41 = v47;
                    if (CMTimeCompare(&v42, &v41) < 0)
                    {
                      if (v15)
                      {
                        objc_msgSend(v15, "timestamp");
                      }
                      else
                      {
                        v39 = 0uLL;
                        v40 = 0;
                      }
                      v37 = v39;
                      v38 = v40;
                      v16 = (CMTime *)&v37;
                    }
                    else
                    {
                      v36 = v60;
                      v16 = &v36;
                    }
LABEL_57:
                    objc_msgSend(v8, "setAdjustedTimestamp:", v16);
                    goto LABEL_58;
                  }
                  if (v15)
                    objc_msgSend(v15, "timestamp");
                  else
                    memset(&v47, 0, sizeof(v47));
                  v60 = v47;
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
                if (v12)
                  continue;
                break;
              }
LABEL_58:
              ;
            }
            v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            if (!v6)
            {
LABEL_60:
              objc_msgSend(v4, "dataOutput");
              objc_opt_class();
              i = v25;
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count") >= 2)
              {
                v17 = 0;
                do
                {
                  v18 = (void *)objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "objectAtIndexedSubscript:", v17++);
                  if (v17 < objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count"))
                  {
                    v19 = v17;
                    do
                    {
                      v20 = objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "objectAtIndexedSubscript:", v19);
                      if (v18)
                      {
                        v21 = (void *)v20;
                        objc_msgSend(v18, "adjustedTimestamp");
                        if ((v34 & 0x100000000) != 0)
                        {
                          if (v21)
                          {
                            objc_msgSend(v21, "adjustedTimestamp");
                            if ((v31 & 0x100000000) != 0)
                            {
                              objc_msgSend(v18, "adjustedTimestamp");
                              objc_msgSend(v21, "adjustedTimestamp");
                              if (!CMTimeCompare(&v29, &v28))
                              {
                                objc_msgSend(v18, "addSynchronizedData:", v21);
                                objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "removeObjectAtIndex:", v19--);
                              }
                            }
                          }
                          else
                          {
                            v30 = 0;
                            v31 = 0;
                            v32 = 0;
                          }
                        }
                      }
                      else
                      {
                        v33 = 0;
                        v34 = 0;
                        v35 = 0;
                      }
                      ++v19;
                    }
                    while (v19 < objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count"));
                  }
                }
                while (v17 < objc_msgSend((id)objc_msgSend(v4, "synchronizedDataQueue"), "count") - 1);
              }
              break;
            }
          }
        }
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v24);
  }
}

- (BOOL)_allFollowerSynchronizedDataOutputsContainTimestampEqualToOrGreaterThanLeaderTimestamp:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  AVCaptureDataOutputSynchronizerInternal *internal;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  uint64_t i;
  id v14;
  __int128 v16;
  int64_t var3;

  FigSimpleMutexCheckIsLockedOnThisThread();
  v5 = -[NSArray count](self->_internal->dataOutputsStorage, "count");
  v6 = v5;
  internal = self->_internal;
  v8 = internal->synchronizingVideoAndDepth || internal->synchronizingVideoAndVisionData;
  v9 = 0;
  if (v8 && v5 >= 1)
  {
    v10 = 0;
    while (1)
    {
      v11 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v10);
      objc_msgSend(v11, "dataOutput");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend((id)objc_msgSend(v11, "synchronizedDataQueue"), "count"))
          break;
      }
      if (v6 == ++v10)
      {
        v9 = 0;
        goto LABEL_12;
      }
    }
    v9 = (void *)objc_msgSend((id)objc_msgSend(v11, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
  }
LABEL_12:
  if (v6 > 1)
  {
    v12 = 0;
    for (i = 1; i != v6; v12 = i >= v6)
    {
      v14 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", i);
      if (objc_msgSend(v14, "isLive"))
      {
        if (!self->_internal->synchronizingVideoAndDepth
          || (objc_msgSend(v14, "dataOutput"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || !v9
          || objc_msgSend(v9, "hasCorrespondingDepthData"))
        {
          if (!self->_internal->synchronizingVideoAndVisionData
            || (objc_msgSend(v14, "dataOutput"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || !v9
            || objc_msgSend(v9, "hasCorrespondingVisionData"))
          {
            v16 = *(_OWORD *)&a3->var0;
            var3 = a3->var3;
            if (!objc_msgSend(v14, "hasAllExpectedSynchronizedDataForLeaderTimestamp:", &v16))
              break;
          }
        }
      }
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v12;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_earliestFollowerSynchronizedDataQueueTimestamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  CMTime time1;
  CMTime v15;

  FigSimpleMutexCheckIsLockedOnThisThread();
  result = -[NSArray count](self->_internal->dataOutputsStorage, "count");
  if ((uint64_t)result > 1)
  {
    v7 = result;
    v8 = MEMORY[0x1E0CA2E30];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E30];
    retstr->var3 = *(_QWORD *)(v8 + 16);
    v9 = 1;
    while (1)
    {
      v10 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v9);
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "count");
      if (result)
        break;
LABEL_12:
      if (v7 == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)++v9)
        return result;
    }
    v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
    memset(&v15, 0, sizeof(v15));
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "adjustedTimestamp");
      if ((v15.flags & 1) != 0)
        goto LABEL_10;
      objc_msgSend(v12, "timestamp");
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
    }
    v15 = time1;
LABEL_10:
    time1 = v15;
    v13 = *retstr;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, (CMTime *)&v13);
    if ((result & 0x80000000) != 0)
      *(CMTime *)retstr = v15;
    goto LABEL_12;
  }
  v6 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  retstr->var3 = *(_QWORD *)(v6 + 16);
  return result;
}

- (void)_dispatchSynchronizedDataWithTimestamp:(id *)a3
{
  AVWeakReference *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *v13;
  _QWORD block[7];
  CMTime rhs;
  CMTime time2;
  CMTime time1;
  CMTime v18;

  FigSimpleMutexCheckIsLockedOnThisThread();
  v5 = self->_internal->weakReference;
  v6 = -[AVCaptureSynchronizedDataCollection _initWithPossibleDataOutputs:]([AVCaptureSynchronizedDataCollection alloc], "_initWithPossibleDataOutputs:", self->_internal->dataOutputs);
  v7 = -[NSArray count](self->_internal->dataOutputsStorage, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v10 = -[NSArray objectAtIndexedSubscript:](self->_internal->dataOutputsStorage, "objectAtIndexedSubscript:", v9);
      if (objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "count"))
        break;
LABEL_12:
      if (v8 == ++v9)
        goto LABEL_13;
    }
    v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
    v12 = v11;
    memset(&v18, 0, sizeof(v18));
    if (v11)
    {
      objc_msgSend(v11, "adjustedTimestamp");
      if ((v18.flags & 1) != 0)
        goto LABEL_9;
      objc_msgSend(v12, "timestamp");
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
    }
    v18 = time1;
LABEL_9:
    time1 = (CMTime)*a3;
    time2 = v18;
    if (CMTimeCompare(&time1, &time2))
    {
      memset(&time1, 0, sizeof(time1));
      time2 = (CMTime)*a3;
      rhs = v18;
      CMTimeSubtract(&time1, &time2, &rhs);
    }
    else
    {
      objc_msgSend(v6, "_setSynchronizedData:forCaptureOutput:", v12, objc_msgSend(v10, "dataOutput"));
      objc_msgSend((id)objc_msgSend(v10, "synchronizedDataQueue"), "removeObjectAtIndex:", 0);
    }
    goto LABEL_12;
  }
LABEL_13:
  v13 = -[AVCaptureDataOutputDelegateCallbackHelper activeCallbackQueue](self->_internal->delegateCallbackHelper, "activeCallbackQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AVCaptureDataOutputSynchronizer__dispatchSynchronizedDataWithTimestamp___block_invoke;
  block[3] = &unk_1E4216898;
  block[4] = v5;
  block[5] = self;
  block[6] = v6;
  dispatch_async((dispatch_queue_t)v13, block);

}

void __74__AVCaptureDataOutputSynchronizer__dispatchSynchronizedDataWithTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1A1AF16C4]();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v3)
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 8), "activeDelegate"), "dataOutputSynchronizer:didOutputSynchronizedDataCollection:", v3, *(_QWORD *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

@end
