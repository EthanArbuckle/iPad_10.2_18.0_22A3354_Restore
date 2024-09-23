@implementation HMIVideoDecoder

- (HMIVideoDecoder)init
{
  return -[HMIVideoDecoder initWithFrameReordering:](self, "initWithFrameReordering:", 1);
}

- (HMIVideoDecoder)initWithFrameReordering:(BOOL)a3
{
  _BOOL4 v3;
  char *v4;
  HMIVideoDecoder *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HMFWeakObject *weakDecoder;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMIVideoDecoder;
  v4 = -[HMIVideoDecoder init](&v16, sel_init);
  v5 = (HMIVideoDecoder *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 6) = 0;
    *((_QWORD *)v4 + 7) = 0;
    v6 = MEMORY[0x24BDC0D40];
    v7 = *MEMORY[0x24BDC0D40];
    *((_OWORD *)v4 + 5) = *MEMORY[0x24BDC0D40];
    v8 = *(_QWORD *)(v6 + 16);
    *((_QWORD *)v4 + 12) = v8;
    *(_OWORD *)(v4 + 104) = v7;
    *((_QWORD *)v4 + 15) = v8;
    v9 = 3;
    if (!v3)
      v9 = 0;
    *((_QWORD *)v4 + 5) = v9;
    *((_QWORD *)v4 + 1) = 2;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F2B0]), "initWithWeakObject:", v4);
    weakDecoder = v5->_weakDecoder;
    v5->_weakDecoder = (HMFWeakObject *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("HMIVideoDecoderWorkQueue", v12);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v13;

  }
  return v5;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[HMIVideoDecoder handleSampleBuffer:outputFrame:](self, "handleSampleBuffer:outputFrame:", a3, 1);
}

- (BOOL)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 outputFrame:(BOOL)a4
{
  _BOOL4 v4;
  CMFormatDescriptionRef FormatDescription;
  const opaqueCMFormatDescription *v8;
  void *v9;
  int v10;
  void *v11;
  HMIVideoDecoder *v12;
  NSObject *v13;
  void *v14;
  VTDecodeFrameFlags v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  HMIVideoDecoder *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HMIVideoDecoder *v26;
  NSObject *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  CMItemCount reorderBufferSize;
  const CMBufferCallbacks *CallbacksForSampleBuffersSortedByOutputPTS;
  uint64_t v35;
  void *v36;
  CMTime v37;
  CMTime v38;
  CMTime time2;
  char v40;
  CMTime v41;
  CMTime time1;
  void *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  if (-[HMIVideoNode status](self, "status") != 2)
  {
    v19 = MEMORY[0x220735570]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMICMSampleBufferFormattedDescription(a3, 1000);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time1.value) = 138543618;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v22;
      LOWORD(time1.flags) = 2112;
      *(_QWORD *)((char *)&time1.flags + 2) = v23;
      _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_ERROR, "%{public}@Video decoder is not running, ignoring %@", (uint8_t *)&time1, 0x16u);

    }
    v24 = (void *)v19;
    goto LABEL_29;
  }
  if (!CMSampleBufferGetNumSamples(a3))
  {
    v25 = MEMORY[0x220735570]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time1.value) = 138543362;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v28;
      _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_ERROR, "%{public}@Sample buffer has no samples, skipping.", (uint8_t *)&time1, 0xCu);
LABEL_27:

    }
LABEL_28:

    v24 = (void *)v25;
LABEL_29:
    objc_autoreleasePoolPop(v24);
    return 0;
  }
  memset(&v41, 0, sizeof(v41));
  CMSampleBufferGetDecodeTimeStamp(&v41, a3);
  -[HMIVideoDecoder lastSampleBufferDTS](self, "lastSampleBufferDTS");
  if ((v40 & 1) != 0)
  {
    -[HMIVideoDecoder lastSampleBufferDTS](self, "lastSampleBufferDTS");
    time1 = v41;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      v25 = MEMORY[0x220735570]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIVideoDecoder lastSampleBufferDTS](v26, "lastSampleBufferDTS");
        HMICMTimeDescription(&v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        time1 = v41;
        HMICMTimeDescription(&time1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time1.value) = 138543874;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v28;
        LOWORD(time1.flags) = 2112;
        *(_QWORD *)((char *)&time1.flags + 2) = v30;
        HIWORD(time1.epoch) = 2112;
        v43 = v31;
        _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid DTS, expected > %@, got %@, skipping.", (uint8_t *)&time1, 0x20u);

        goto LABEL_27;
      }
      goto LABEL_28;
    }
  }
  v37 = v41;
  -[HMIVideoDecoder setLastSampleBufferDTS:](self, "setLastSampleBufferDTS:", &v37);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!FormatDescription)
  {
    v29 = CFSTR("Format description is missing.");
LABEL_24:
    -[HMIVideoDecoder _failWithDescription:](self, "_failWithDescription:", v29);
    return 0;
  }
  v8 = FormatDescription;
  if (!-[HMIVideoDecoder session](self, "session")
    || VTDecompressionSessionCanAcceptFormatDescription(-[HMIVideoDecoder session](self, "session"), v8))
  {
    goto LABEL_12;
  }
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLPreferenceForKey:defaultValue:", CFSTR("restartDecoderIfFormatChanges"), 0);

  if (!v10)
  {
    v29 = CFSTR("Cannot accept format description.");
    goto LABEL_24;
  }
  v11 = (void *)MEMORY[0x220735570]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time1.value) = 138543362;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v14;
    _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Restarting decoder because format description changed.", (uint8_t *)&time1, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMIVideoDecoder flush](v12, "flush");
  VTDecompressionSessionInvalidate(-[HMIVideoDecoder session](v12, "session"));
  CFRelease(-[HMIVideoDecoder session](v12, "session"));
  -[HMIVideoDecoder _createSessionWithFormatDescription:](v12, "_createSessionWithFormatDescription:", v8);
LABEL_12:
  if (!-[HMIVideoDecoder session](self, "session"))
  {
    reorderBufferSize = self->_reorderBufferSize;
    CallbacksForSampleBuffersSortedByOutputPTS = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    v35 = CMBufferQueueCreate(0, reorderBufferSize, CallbacksForSampleBuffersSortedByOutputPTS, &self->_buffer);
    if ((_DWORD)v35)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create reorder buffer, err: %d."), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoDecoder _failWithDescription:](self, "_failWithDescription:", v36);

      return 0;
    }
    if (-[HMIVideoDecoder _createSessionWithFormatDescription:](self, "_createSessionWithFormatDescription:", v8))
      goto LABEL_13;
    v29 = CFSTR("Cannot create decoder.");
    goto LABEL_24;
  }
LABEL_13:
  if (v4)
    v15 = 1;
  else
    v15 = 3;
  LODWORD(time1.value) = 0;
  v16 = VTDecompressionSessionDecodeFrame(-[HMIVideoDecoder session](self, "session"), a3, v15, 0, (VTDecodeInfoFlags *)&time1);
  v17 = (_DWORD)v16 == 0;
  if ((_DWORD)v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot decode frame, err: %d."), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoDecoder _failWithDescription:](self, "_failWithDescription:", v18);

  }
  return v17;
}

- (void)flush
{
  CMBufferRef v3;

  if (-[HMIVideoDecoder session](self, "session"))
  {
    VTDecompressionSessionWaitForAsynchronousFrames(-[HMIVideoDecoder session](self, "session"));
    while (!CMBufferQueueIsEmpty(-[HMIVideoDecoder buffer](self, "buffer")))
    {
      v3 = CMBufferQueueDequeueAndRetain(-[HMIVideoDecoder buffer](self, "buffer"));
      -[HMIVideoDecoder _evictSampleBuffer:](self, "_evictSampleBuffer:", v3);
      CFRelease(v3);
    }
  }
}

- (void)dealloc
{
  OpaqueVTDecompressionSession *v3;
  void *v4;
  NSObject *v5;
  id v6;
  objc_super v7;
  _QWORD block[4];
  id v9;
  OpaqueVTDecompressionSession *v10;

  if (-[HMIVideoDecoder buffer](self, "buffer"))
  {
    CFRelease(self->_buffer);
    -[HMIVideoDecoder setBuffer:](self, "setBuffer:", 0);
  }
  if (-[HMIVideoDecoder session](self, "session"))
  {
    v3 = -[HMIVideoDecoder session](self, "session");
    -[HMIVideoDecoder weakDecoder](self, "weakDecoder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoDecoder workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__HMIVideoDecoder_dealloc__block_invoke;
    block[3] = &unk_24DBEC5D0;
    v9 = v4;
    v10 = v3;
    v6 = v4;
    dispatch_async(v5, block);

    -[HMIVideoDecoder setSession:](self, "setSession:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)HMIVideoDecoder;
  -[HMIVideoDecoder dealloc](&v7, sel_dealloc);
}

void __26__HMIVideoDecoder_dealloc__block_invoke(uint64_t a1)
{
  VTDecompressionSessionWaitForAsynchronousFrames(*(VTDecompressionSessionRef *)(a1 + 40));
  VTDecompressionSessionInvalidate(*(VTDecompressionSessionRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (BOOL)_createSessionWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  VTDecompressionOutputCallbackRecord v6;

  -[HMIVideoDecoder weakDecoder](self, "weakDecoder", _decoderDidDecodeFrameCallback);
  v6.decompressionOutputRefCon = (void *)objc_claimAutoreleasedReturnValue();

  return VTDecompressionSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, 0, 0, &v6, &self->_session) == 0;
}

- (void)_evictSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v5;
  void *v6;
  HMIVideoDecoder *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  CMTime v13;
  CMTime time1;
  char v15;
  CMTime v16;
  CMTime time2;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, sizeof(v16));
  CMSampleBufferGetPresentationTimeStamp(&v16, a3);
  v5 = -[HMIVideoDecoder lastSampleBufferPTS](self, "lastSampleBufferPTS");
  if ((v15 & 1) != 0)
  {
    -[HMIVideoDecoder lastSampleBufferPTS](self, "lastSampleBufferPTS");
    time2 = v16;
    v5 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
    if ((v5 & 0x80000000) == 0)
    {
      v6 = (void *)MEMORY[0x220735570](-[HMIVideoDecoder _failWithDescription:](self, "_failWithDescription:", CFSTR("Cannot reorder frames.")));
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time2.value) = 138543618;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v9;
        LOWORD(time2.flags) = 2112;
        *(_QWORD *)((char *)&time2.flags + 2) = a3;
        v10 = "%{public}@Decoded sample is out of PTS order, sample: %@";
LABEL_8:
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&time2, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  if ((v16.flags & 1) == 0)
  {
    v6 = (void *)MEMORY[0x220735570](-[HMIVideoDecoder _failWithDescription:](self, "_failWithDescription:", CFSTR("Decoded sample has an invalid PTS.")));
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time2.value) = 138543618;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v9;
      LOWORD(time2.flags) = 2112;
      *(_QWORD *)((char *)&time2.flags + 2) = a3;
      v10 = "%{public}@Decoded sample has an invalid PTS, sample: %@";
      goto LABEL_8;
    }
LABEL_9:

    objc_autoreleasePoolPop(v6);
    return;
  }
  v11 = (void *)MEMORY[0x220735570](v5);
  -[HMIVideoDecoder delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "decoder:didDecodeSampleBuffer:", self, a3);

  objc_autoreleasePoolPop(v11);
  v13 = v16;
  -[HMIVideoDecoder setLastSampleBufferPTS:](self, "setLastSampleBufferPTS:", &v13);
}

- (void)_didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMItemCount BufferCount;
  CMBufferRef v6;

  if (-[HMIVideoDecoder reorderBufferSize](self, "reorderBufferSize"))
  {
    BufferCount = CMBufferQueueGetBufferCount(self->_buffer);
    if (BufferCount == -[HMIVideoDecoder reorderBufferSize](self, "reorderBufferSize"))
    {
      v6 = CMBufferQueueDequeueAndRetain(self->_buffer);
      -[HMIVideoDecoder _evictSampleBuffer:](self, "_evictSampleBuffer:", v6);
      CFRelease(v6);
    }
    CMBufferQueueEnqueue(self->_buffer, a3);
  }
  else
  {
    -[HMIVideoDecoder _evictSampleBuffer:](self, "_evictSampleBuffer:", a3);
  }
}

- (void)_failWithDescription:(id)a3
{
  id v4;
  void *v5;
  HMIVideoDecoder *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->super.super._status == 4)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Decoder is already in a failed state.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    self->super.super._status = 4;
    objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMIErrorLog(self, v9);
    -[HMIVideoDecoder delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decoder:didFailWithError:", self, v9);

  }
}

- (HMIVideoDecoderDelegate)delegate
{
  return (HMIVideoDecoderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSampleBufferPTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastSampleBufferPTS, 24, 1, 0);
  return result;
}

- (void)setLastSampleBufferPTS:(id *)a3
{
  objc_copyStruct(&self->_lastSampleBufferPTS, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSampleBufferDTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastSampleBufferDTS, 24, 1, 0);
  return result;
}

- (void)setLastSampleBufferDTS:(id *)a3
{
  objc_copyStruct(&self->_lastSampleBufferDTS, a3, 24, 1, 0);
}

- (unint64_t)reorderBufferSize
{
  return self->_reorderBufferSize;
}

- (opaqueCMBufferQueue)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(opaqueCMBufferQueue *)a3
{
  self->_buffer = a3;
}

- (OpaqueVTDecompressionSession)session
{
  return self->_session;
}

- (void)setSession:(OpaqueVTDecompressionSession *)a3
{
  self->_session = a3;
}

- (HMFWeakObject)weakDecoder
{
  return (HMFWeakObject *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_weakDecoder, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
