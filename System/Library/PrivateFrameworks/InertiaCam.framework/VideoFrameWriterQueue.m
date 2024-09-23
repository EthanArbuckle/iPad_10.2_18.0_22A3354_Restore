@implementation VideoFrameWriterQueue

- (VideoFrameWriterQueue)initWithOutputURL:(id)a3 forMovieDimensions:(CGSize)a4 outputTransform:(CGAffineTransform *)a5 startTime:(id *)a6 endTime:(id *)a7
{
  double height;
  double width;
  id v12;
  char *v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _OWORD v42[3];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v48;
  objc_super v49;

  height = a4.height;
  width = a4.width;
  v49.receiver = self;
  v49.super_class = (Class)VideoFrameWriterQueue;
  v12 = a3;
  v13 = -[VideoFrameWriterQueue init](&v49, sel_init);
  v48 = *a6;
  objc_msgSend(v13, "setStartTime:", &v48);
  v47 = *a7;
  objc_msgSend(v13, "setEndTime:", &v47);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
  objc_msgSend(v13, "setFrameArray:", v14);

  *(_QWORD *)(v13 + 140) = 0x500000001;
  v15 = dispatch_queue_create("frame write queue", 0);
  v16 = (void *)*((_QWORD *)v13 + 6);
  *((_QWORD *)v13 + 6) = v15;

  v17 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v18 = (void *)*((_QWORD *)v13 + 5);
  *((_QWORD *)v13 + 5) = v17;

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 1);
  v20 = (void *)*((_QWORD *)v13 + 13);
  *((_QWORD *)v13 + 13) = v19;

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 1);
  v22 = (void *)*((_QWORD *)v13 + 19);
  *((_QWORD *)v13 + 19) = v21;

  v23 = objc_alloc(MEMORY[0x1E0C8B018]);
  v24 = *MEMORY[0x1E0C8A2E8];
  v46 = 0;
  v25 = (void *)objc_msgSend(v23, "initWithURL:fileType:error:", v12, v24, &v46);

  v26 = v46;
  objc_msgSend(v13, "setVideoWriter:", v25);

  if (v26)
    objc_msgSend(v13, "setWriteError:", v26);
  v27 = (void *)MEMORY[0x1E0C99D80];
  v28 = *MEMORY[0x1E0C8AE78];
  v29 = *MEMORY[0x1E0C8AE68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)rint(width));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0C8AF60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)rint(height));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryWithObjectsAndKeys:", v28, v29, v30, v31, v32, *MEMORY[0x1E0C8AEF0], 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWriterInput:", v34);

  v35 = *(_OWORD *)&a5->c;
  v43 = *(_OWORD *)&a5->a;
  v44 = v35;
  v45 = *(_OWORD *)&a5->tx;
  objc_msgSend(v13, "writerInput");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v43;
  v42[1] = v44;
  v42[2] = v45;
  objc_msgSend(v36, "setTransform:", v42);

  v37 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1111970369);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v38, *MEMORY[0x1E0CA9040], 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", *((_QWORD *)v13 + 2), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInputAdaptor:", v40);

  objc_msgSend(*((id *)v13 + 1), "addInput:", *((_QWORD *)v13 + 2));
  return (VideoFrameWriterQueue *)v13;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VideoFrameWriterQueue;
  -[VideoFrameWriterQueue dealloc](&v2, sel_dealloc);
}

- (void)AddAFrame:(id)a3
{
  NSLock *frameArrayLock;
  id v5;

  frameArrayLock = self->frameArrayLock;
  v5 = a3;
  -[NSLock lock](frameArrayLock, "lock");
  -[NSMutableArray addObject:](self->frameArray, "addObject:", v5);

  -[NSLock unlock](self->frameArrayLock, "unlock");
  -[VideoFrameWriterQueue DrainIfAbove:downTo:](self, "DrainIfAbove:downTo:", self->_drainMaximum, self->_drainMinimum);
}

- (unint64_t)FramesInQueue
{
  unint64_t v3;

  -[NSLock lock](self->frameArrayLock, "lock");
  v3 = -[NSMutableArray count](self->frameArray, "count");
  -[NSLock unlock](self->frameArrayLock, "unlock");
  return v3;
}

- (BOOL)WaitForFinish
{
  uint64_t v3;
  uint64_t v4;
  AVAssetWriter *videoWriter;
  void *v6;
  AVAssetWriter *v7;
  id v8;
  BOOL writeSuccess;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  int64_t epoch;

  if (-[NSConditionLock tryLockWhenCondition:](self->_writingDoneLock, "tryLockWhenCondition:", 3))
  {
    -[NSLock lock](self->frameArrayLock, "lock");
    v3 = -[NSMutableArray count](self->frameArray, "count");
    if (v3)
    {
      v4 = v3 - 1;
      do
        -[NSMutableArray removeObjectAtIndex:](self->frameArray, "removeObjectAtIndex:", v4--);
      while (v4 != -1);
    }
    -[NSLock unlock](self->frameArrayLock, "unlock");
  }
  else
  {
    -[NSConditionLock lock](self->_writingDoneLock, "lock");
    -[NSConditionLock unlockWithCondition:](self->_writingDoneLock, "unlockWithCondition:", 2);
    -[NSConditionLock lockWhenCondition:](self->_writingDoneLock, "lockWhenCondition:", 3);
  }
  -[NSConditionLock unlockWithCondition:](self->_writingDoneLock, "unlockWithCondition:", 1);
  -[AVAssetWriterInput markAsFinished](self->writerInput, "markAsFinished");
  videoWriter = self->videoWriter;
  v13 = *(_OWORD *)&self->endTime.value;
  epoch = self->endTime.epoch;
  -[AVAssetWriter endSessionAtSourceTime:](videoWriter, "endSessionAtSourceTime:", &v13);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  v7 = self->videoWriter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D4D70AC0;
  v11[3] = &unk_1E988B328;
  v12 = v6;
  v8 = v6;
  -[AVAssetWriter finishWritingWithCompletionHandler:](v7, "finishWritingWithCompletionHandler:", v11);
  objc_msgSend(v8, "lockWhenCondition:", 1);
  objc_msgSend(v8, "unlock");
  writeSuccess = self->writeSuccess;

  return writeSuccess;
}

- (id)FindFrameWithIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[NSLock lock](self->frameArrayLock, "lock");
  v5 = -[NSMutableArray count](self->frameArray, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->frameArray, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "frameNumber") == a3)
        break;

      if (v6 == ++v7)
        goto LABEL_5;
    }
    -[NSMutableArray removeObjectAtIndex:](self->frameArray, "removeObjectAtIndex:", v7);
  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  -[NSLock unlock](self->frameArrayLock, "unlock");
  return v8;
}

- (void)FrameRequestCallback
{
  void *v3;
  char v4;
  void *v5;
  AVAssetWriterInputPixelBufferAdaptor *inputAdaptor;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _BYTE v14[24];

  v3 = (void *)MEMORY[0x1D8268CC4](self, a2);
  if (-[AVAssetWriterInput isReadyForMoreMediaData](self->writerInput, "isReadyForMoreMediaData"))
  {
    v4 = 0;
    while (!-[VideoFrameWriterQueue canceled](self, "canceled") && (v4 & 1) == 0)
    {
      -[VideoFrameWriterQueue FindFrameWithIndex:](self, "FindFrameWithIndex:", -[VideoFrameWriterQueue nextFrameIndex](self, "nextFrameIndex"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_6:
        inputAdaptor = self->inputAdaptor;
        v7 = objc_msgSend(v5, "pixelBuffer");
        objc_msgSend(v5, "frameTime");
        LOBYTE(inputAdaptor) = -[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](inputAdaptor, "appendPixelBuffer:withPresentationTime:", v7, v14);
        WeakRetained = objc_loadWeakRetained((id *)&self->frameWriterUpdateCallback);
        objc_msgSend(WeakRetained, "updateCallbackForFrameIndex:withPixelBuffer:", -[VideoFrameWriterQueue nextFrameIndex](self, "nextFrameIndex"), objc_msgSend(v5, "pixelBuffer"));

        -[VideoFrameWriterQueue setNextFrameIndex:](self, "setNextFrameIndex:", -[VideoFrameWriterQueue nextFrameIndex](self, "nextFrameIndex") + 1);
        objc_msgSend(v5, "DeallocPixBuffer");

        if ((inputAdaptor & 1) == 0)
        {
          self->writeSuccess = 0;
          NSLog(CFSTR("failed to append pixel buffer\n"));
          -[AVAssetWriter error](self->videoWriter, "error");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            NSLog(CFSTR("error code:%d\n"), objc_msgSend(v11, "code"));
            objc_msgSend(v12, "description");
            v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            NSLog(CFSTR("error description:%s\n"), objc_msgSend(v13, "UTF8String"));

            -[VideoFrameWriterQueue setWriteError:](self, "setWriteError:", v12);
          }
          -[NSConditionLock lock](self->_writingDoneLock, "lock");
          -[NSConditionLock unlockWithCondition:](self->_writingDoneLock, "unlockWithCondition:", 3);

          break;
        }
        if (-[NSConditionLock tryLockWhenCondition:](self->_drainConditionLock, "tryLockWhenCondition:", 1))
        {
          if (-[VideoFrameWriterQueue FramesInQueue](self, "FramesInQueue") <= self->_drainTarget)
            v9 = 2;
          else
            v9 = 1;
          -[NSConditionLock unlockWithCondition:](self->_drainConditionLock, "unlockWithCondition:", v9);
        }
      }
      else
      {
        while (!-[VideoFrameWriterQueue canceled](self, "canceled"))
        {
          if (-[NSConditionLock tryLockWhenCondition:](self->_writingDoneLock, "tryLockWhenCondition:", 2))
          {
            self->_doneQueueing = 1;
            -[NSConditionLock unlockWithCondition:](self->_writingDoneLock, "unlockWithCondition:", 2);
          }
          if (self->_doneQueueing && !-[VideoFrameWriterQueue FramesInQueue](self, "FramesInQueue"))
          {
            -[NSConditionLock lock](self->_writingDoneLock, "lock");
            -[NSConditionLock unlockWithCondition:](self->_writingDoneLock, "unlockWithCondition:", 3);
            v4 = 1;
            goto LABEL_20;
          }
          objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.1);
          -[VideoFrameWriterQueue FindFrameWithIndex:](self, "FindFrameWithIndex:", -[VideoFrameWriterQueue nextFrameIndex](self, "nextFrameIndex"));
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v5 = (void *)v10;
            goto LABEL_6;
          }
        }
      }
      v4 = 0;
LABEL_20:
      if (!-[AVAssetWriterInput isReadyForMoreMediaData](self->writerInput, "isReadyForMoreMediaData"))
        break;
    }
  }
  if (self->canceled && -[NSConditionLock tryLockWhenCondition:](self->_writingDoneLock, "tryLockWhenCondition:", 2))
  {
    self->_doneQueueing = 1;
    -[NSConditionLock unlockWithCondition:](self->_writingDoneLock, "unlockWithCondition:", 3);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)StartWatchingForFrames
{
  AVAssetWriter *videoWriter;
  AVAssetWriterInput *writerInput;
  OS_dispatch_queue *frameWriteQueue;
  _QWORD v6[5];
  $95D729B680665BEAEFA1D6FCA8238556 startTime;

  self->nextFrameIndex = 0;
  -[AVAssetWriter startWriting](self->videoWriter, "startWriting");
  videoWriter = self->videoWriter;
  startTime = self->startTime;
  -[AVAssetWriter startSessionAtSourceTime:](videoWriter, "startSessionAtSourceTime:", &startTime);
  self->writeSuccess = 1;
  writerInput = self->writerInput;
  frameWriteQueue = self->frameWriteQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D4D70EE4;
  v6[3] = &unk_1E988B328;
  v6[4] = self;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](writerInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", frameWriteQueue, v6);
}

- (void)DrainIfAbove:(unsigned int)a3 downTo:(unsigned int)a4
{
  id v6;

  if (-[VideoFrameWriterQueue FramesInQueue](self, "FramesInQueue") > a3)
  {
    -[NSConditionLock lock](self->_drainConditionLock, "lock");
    self->_drainTarget = a4;
    -[NSConditionLock unlockWithCondition:](self->_drainConditionLock, "unlockWithCondition:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSConditionLock lockWhenCondition:beforeDate:](self->_drainConditionLock, "lockWhenCondition:beforeDate:", 2))
    {
      -[NSConditionLock unlockWithCondition:](self->_drainConditionLock, "unlockWithCondition:", 0);
    }

  }
}

- (AVAssetWriterInputPixelBufferAdaptor)inputAdaptor
{
  return self->inputAdaptor;
}

- (void)setInputAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->inputAdaptor, a3);
}

- (AVAssetWriter)videoWriter
{
  return self->videoWriter;
}

- (void)setVideoWriter:(id)a3
{
  objc_storeStrong((id *)&self->videoWriter, a3);
}

- (AVAssetWriterInput)writerInput
{
  return self->writerInput;
}

- (void)setWriterInput:(id)a3
{
  objc_storeStrong((id *)&self->writerInput, a3);
}

- (NSMutableArray)frameArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFrameArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSLock)frameArrayLock
{
  return self->frameArrayLock;
}

- (void)setFrameArrayLock:(id)a3
{
  objc_storeStrong((id *)&self->frameArrayLock, a3);
}

- (OS_dispatch_queue)frameWriteQueue
{
  return self->frameWriteQueue;
}

- (void)setFrameWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->frameWriteQueue, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->startTime, 24, 1, 0);
  return result;
}

- (void)setStartTime:(id *)a3
{
  objc_copyStruct(&self->startTime, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->endTime, 24, 1, 0);
  return result;
}

- (void)setEndTime:(id *)a3
{
  objc_copyStruct(&self->endTime, a3, 24, 1, 0);
}

- (NSError)writeError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWriteError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)writeSuccess
{
  return self->writeSuccess;
}

- (void)setWriteSuccess:(BOOL)a3
{
  self->writeSuccess = a3;
}

- (unint64_t)nextFrameIndex
{
  return self->nextFrameIndex;
}

- (void)setNextFrameIndex:(unint64_t)a3
{
  self->nextFrameIndex = a3;
}

- (BOOL)canceled
{
  return self->canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->canceled = a3;
}

- (VideoFrameWriterProgressRecipient)frameWriterUpdateCallback
{
  return (VideoFrameWriterProgressRecipient *)objc_loadWeakRetained((id *)&self->frameWriterUpdateCallback);
}

- (void)setFrameWriterUpdateCallback:(id)a3
{
  objc_storeWeak((id *)&self->frameWriterUpdateCallback, a3);
}

- (BOOL)doneQueueing
{
  return self->_doneQueueing;
}

- (void)setDoneQueueing:(BOOL)a3
{
  self->_doneQueueing = a3;
}

- (NSConditionLock)drainConditionLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDrainConditionLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (unsigned)drainMaximum
{
  return self->_drainMaximum;
}

- (void)setDrainMaximum:(unsigned int)a3
{
  self->_drainMaximum = a3;
}

- (unsigned)drainMinimum
{
  return self->_drainMinimum;
}

- (void)setDrainMinimum:(unsigned int)a3
{
  self->_drainMinimum = a3;
}

- (unint64_t)drainTarget
{
  return self->_drainTarget;
}

- (void)setDrainTarget:(unint64_t)a3
{
  self->_drainTarget = a3;
}

- (NSConditionLock)writingDoneLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWritingDoneLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->frameWriterUpdateCallback);
  objc_storeStrong((id *)&self->_drainConditionLock, 0);
  objc_storeStrong((id *)&self->writeError, 0);
  objc_storeStrong((id *)&self->_writingDoneLock, 0);
  objc_storeStrong((id *)&self->frameWriteQueue, 0);
  objc_storeStrong((id *)&self->frameArrayLock, 0);
  objc_storeStrong((id *)&self->frameArray, 0);
  objc_storeStrong((id *)&self->inputAdaptor, 0);
  objc_storeStrong((id *)&self->writerInput, 0);
  objc_storeStrong((id *)&self->videoWriter, 0);
}

@end
