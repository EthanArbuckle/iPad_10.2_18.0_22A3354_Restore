@implementation HMIVideoAssetWriter

- (HMIVideoAssetWriter)initWithVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4
{
  __int128 v5;
  uint64_t v6;

  v5 = *MEMORY[0x24BDC0D30];
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D30] + 16);
  return -[HMIVideoAssetWriter initWithVideoFormat:audioFormat:initialFragmentSequenceNumber:preferredOutputSegmentInterval:](self, "initWithVideoFormat:audioFormat:initialFragmentSequenceNumber:preferredOutputSegmentInterval:", a3, a4, 1, &v5);
}

- (HMIVideoAssetWriter)initWithVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4 initialFragmentSequenceNumber:(unint64_t)a5 preferredOutputSegmentInterval:(id *)a6
{
  char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  CFTypeRef v17;
  int64_t var3;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMIVideoAssetWriter *v30;
  void *v31;
  char *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char *v36;
  NSObject *v37;
  void *v38;
  id v40;
  __int128 v41;
  uint64_t v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)HMIVideoAssetWriter;
  v10 = -[HMIVideoAssetWriter init](&v43, sel_init);
  if (!v10)
    goto LABEL_11;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("HMIVideoAssetWriter", v11);
  v13 = (void *)*((_QWORD *)v10 + 7);
  *((_QWORD *)v10 + 7) = v12;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("HMIVideoAssetWriterOutput", v14);
  v16 = (void *)*((_QWORD *)v10 + 8);
  *((_QWORD *)v10 + 8) = v15;

  *((_QWORD *)v10 + 9) = CFRetain(a3);
  if (a4)
    v17 = CFRetain(a4);
  else
    v17 = 0;
  *((_QWORD *)v10 + 10) = v17;
  v10[26] = 1;
  *((_WORD *)v10 + 12) = 1;
  *((_QWORD *)v10 + 1) = 0;
  var3 = a6->var3;
  *((_OWORD *)v10 + 7) = *(_OWORD *)&a6->var0;
  *((_QWORD *)v10 + 16) = var3;
  v19 = MEMORY[0x24BDC0D40];
  v20 = *MEMORY[0x24BDC0D40];
  *(_OWORD *)(v10 + 136) = *MEMORY[0x24BDC0D40];
  v21 = *(_QWORD *)(v19 + 16);
  *((_QWORD *)v10 + 19) = v21;
  *((_OWORD *)v10 + 10) = v20;
  *((_QWORD *)v10 + 22) = v21;
  *(_OWORD *)(v10 + 184) = v20;
  *((_QWORD *)v10 + 25) = v21;
  if (!objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("UTType class is not available."), 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v22 = objc_alloc(MEMORY[0x24BDB2400]);
  objc_msgSend(MEMORY[0x24BDF8240], "typeWithIdentifier:", *MEMORY[0x24BDB1C30]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithContentType:", v23);

  objc_msgSend(v24, "setDelegate:", v10);
  objc_msgSend(v24, "setOutputFileTypeProfile:", *MEMORY[0x24BDB1C38]);
  v41 = *MEMORY[0x24BDC0D30];
  v42 = *(_QWORD *)(MEMORY[0x24BDC0D30] + 16);
  objc_msgSend(v24, "setPreferredOutputSegmentInterval:", &v41);
  objc_msgSend(v24, "setInitialMovieFragmentSequenceNumber:", a5);
  objc_msgSend(v24, "setProducesCombinableFragments:", 1);
  v25 = objc_alloc(MEMORY[0x24BDB2408]);
  v26 = (void *)objc_msgSend(v25, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D50], 0, a3);
  objc_msgSend(v26, "setExpectsMediaDataInRealTime:", 1);
  objc_msgSend(v26, "setMediaTimeScale:", 1000);
  if (!objc_msgSend(v24, "canAddInput:", v26))
  {
    v31 = (void *)MEMORY[0x220735570]();
    v32 = v10;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v34;
      _os_log_impl(&dword_219D45000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot add video input.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    goto LABEL_18;
  }
  objc_msgSend(v24, "addInput:", v26);
  objc_storeStrong((id *)v10 + 12, v26);
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1CF0], 0, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setExpectsMediaDataInRealTime:", 1);
    if (objc_msgSend(v24, "canAddInput:", v27))
    {
      objc_msgSend(v24, "addInput:", v27);
      v28 = (void *)*((_QWORD *)v10 + 13);
      *((_QWORD *)v10 + 13) = v27;

      goto LABEL_10;
    }
    v35 = (void *)MEMORY[0x220735570]();
    v36 = v10;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v38;
      _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot add audio input.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);

LABEL_18:
    v30 = 0;
    goto LABEL_19;
  }
LABEL_10:
  v29 = (void *)*((_QWORD *)v10 + 6);
  *((_QWORD *)v10 + 6) = v24;

LABEL_11:
  v30 = v10;
LABEL_19:

  return v30;
}

- (void)dealloc
{
  opaqueCMFormatDescription *audioFormat;
  objc_super v4;

  CFRelease(self->_videoFormat);
  audioFormat = self->_audioFormat;
  if (audioFormat)
    CFRelease(audioFormat);
  v4.receiver = self;
  v4.super_class = (Class)HMIVideoAssetWriter;
  -[HMIVideoAssetWriter dealloc](&v4, sel_dealloc);
}

- (void)_startWritingAtStartTime:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMIVideoAssetWriter *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = *a3;
  -[HMIVideoAssetWriter setCurrentFragmentStartTime:](self, "setCurrentFragmentStartTime:", &v21);
  v20 = *a3;
  -[HMIVideoAssetWriter assetWriter](self, "assetWriter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v20;
  objc_msgSend(v5, "setInitialSegmentStartTime:", &v19);

  -[HMIVideoAssetWriter assetWriter](self, "assetWriter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "startWriting");

  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      buf = *a3;
      HMICMTimeDescription((CMTime *)&buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.var0) = 138543618;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v12;
      LOWORD(buf.var2) = 2112;
      *(_QWORD *)((char *)&buf.var2 + 2) = v13;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Started writing at %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v9->super.super._status = 2;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAssetWriter assetWriter](v9, "assetWriter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "status");
      -[HMIVideoAssetWriter assetWriter](v9, "assetWriter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.var0) = 138543874;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v14;
      LOWORD(buf.var2) = 2048;
      *(_QWORD *)((char *)&buf.var2 + 2) = v16;
      HIWORD(buf.var3) = 2112;
      v23 = v18;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to start writing, assetWriter.status: %ld, assetWriter:.error: %@", (uint8_t *)&buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
}

- (void)assetWriter:(id)a3 didOutputSegmentData:(id)a4 segmentType:(int64_t)a5 segmentReport:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HMIVideoAssetWriter *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  _QWORD block[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x220735570]();
  v14 = (void *)MEMORY[0x220735570]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v17;
    v28 = 2048;
    v29 = a5;
    _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_DEBUG, "%{public}@didOutputSegmentData segmentType: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  if (a5 == 2)
  {
    -[HMIVideoAssetWriter delegateQueue](v15, "delegateQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke_2;
    v21[3] = &unk_24DBEE108;
    v21[4] = v15;
    v19 = &v22;
    v22 = v11;
    v23 = v12;
    dispatch_async(v20, v21);

    v18 = v23;
    goto LABEL_7;
  }
  if (a5 == 1)
  {
    -[HMIVideoAssetWriter delegateQueue](v15, "delegateQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke;
    block[3] = &unk_24DBE9C40;
    block[4] = v15;
    v19 = &v25;
    v25 = v11;
    dispatch_async(v18, block);
LABEL_7:

  }
  objc_autoreleasePoolPop(v13);

}

void __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "assetWriter:didOutputInitializationSegment:", v2, v3);

}

void __82__HMIVideoAssetWriter_assetWriter_didOutputSegmentData_segmentType_segmentReport___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v2, "assetWriter:didOutputSeparableSegment:segmentReport:", v3, v4, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "assetWriterDidOutputSeparableSegment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetWriterDidOutputSeparableSegment");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void)_flushAutomatically:(opaqueCMSampleBuffer *)a3
{
  CMTime v5;
  CMTime time2;
  CMTime time1;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime time;
  CMTime lhs;
  CMTime rhs;
  CMTime v14;
  CMTime v15;
  char v16;
  char v17;
  char v18;

  if (HMICMSampleBufferIsVideo(a3))
  {
    -[HMIVideoAssetWriter currentFragmentStartTime](self, "currentFragmentStartTime");
    if ((v18 & 1) != 0)
    {
      -[HMIVideoAssetWriter preferredOutputSegmentInterval](self, "preferredOutputSegmentInterval");
      if ((v17 & 1) == 0
        || (-[HMIVideoAssetWriter preferredOutputSegmentInterval](self, "preferredOutputSegmentInterval"),
            (v16 & 0x10) == 0))
      {
        if (HMICMSampleBufferIsSync(a3))
        {
          memset(&v15, 0, sizeof(v15));
          CMSampleBufferGetPresentationTimeStamp(&v15, a3);
          memset(&v14, 0, sizeof(v14));
          -[HMIVideoAssetWriter currentFragmentStartTime](self, "currentFragmentStartTime");
          lhs = v15;
          CMTimeSubtract(&v14, &lhs, &rhs);
          memset(&lhs, 0, sizeof(lhs));
          -[HMIVideoAssetWriter preferredOutputSegmentInterval](self, "preferredOutputSegmentInterval");
          v9 = v14;
          CMTimeSubtract(&time, &v9, &v10);
          CMTimeAbsoluteValue(&lhs, &time);
          memset(&v9, 0, sizeof(v9));
          -[HMIVideoAssetWriter preferredOutputSegmentInterval](self, "preferredOutputSegmentInterval");
          CMTimeMultiplyByRatio(&v9, &v8, 1, 10);
          time1 = lhs;
          time2 = v9;
          if (CMTimeCompare(&time1, &time2) <= 0)
          {
            -[HMIVideoAssetWriter flushWithCompletionHandler:](self, "flushWithCompletionHandler:", &__block_literal_global_38);
            v5 = v15;
            -[HMIVideoAssetWriter setCurrentFragmentStartTime:](self, "setCurrentFragmentStartTime:", &v5);
          }
        }
      }
    }
  }
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMIVideoAssetWriter _flushAutomatically:](self, "_flushAutomatically:");
  CFRetain(a3);
  -[HMIVideoAssetWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__HMIVideoAssetWriter_handleSampleBuffer___block_invoke;
  v6[3] = &unk_24DBEC5D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __42__HMIVideoAssetWriter_handleSampleBuffer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_appendSampleBuffer:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_removeTrimDurationAttachmentsFromAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  HMIVideoAssetWriter *v4;
  SEL v5;
  opaqueCMSampleBuffer *v6;

  if (HMICMSampleBufferIsAudio(a3))
  {
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x24BDC0D10]);
    CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x24BDC0D08]);
  }
  else
  {
    v4 = (HMIVideoAssetWriter *)_HMFPreconditionFailure();
    -[HMIVideoAssetWriter _ensureFirstAudioSampleBufferHasSufficientPrimingTrim:](v4, v5, v6);
  }
}

- (void)_ensureFirstAudioSampleBufferHasSufficientPrimingTrim:(opaqueCMSampleBuffer *)a3
{
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioStreamBasicDescription *v6;
  const __CFString *v7;
  const __CFDictionary *v8;
  int32_t mSampleRate;
  int64_t v10;
  CMTime *v11;
  void *v12;
  HMIVideoAssetWriter *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  CFDictionaryRef v18;
  CMTime v19;
  CMTime v20;
  CMAttachmentMode attachmentModeOut;
  CMTime v22;
  CMTime time;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!HMICMSampleBufferIsAudio(a3))
    _HMFPreconditionFailure();
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(-[HMIVideoAssetWriter audioFormat](self, "audioFormat"));
  if (StreamBasicDescription)
  {
    v6 = StreamBasicDescription;
    v22 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    attachmentModeOut = 0;
    v7 = (const __CFString *)*MEMORY[0x24BDC0D10];
    v8 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC0D10], &attachmentModeOut);
    if (v8)
      CMTimeMakeFromDictionary(&v22, v8);
    mSampleRate = (int)v6->mSampleRate;
    time = v22;
    CMTimeConvertScale(&v20, &time, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v10 = v6->mFramesPerPacket >> (v6->mFormatID == 1633772389);
    if (v20.value < v10)
    {
      memset(&v19, 0, sizeof(v19));
      v11 = CMTimeMake(&v19, v10, (int)v6->mSampleRate);
      v12 = (void *)MEMORY[0x220735570](v11);
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        time = v22;
        HMICMTimeDescription(&time);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        time = v19;
        HMICMTimeDescription(&time);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 138543874;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
        LOWORD(time.flags) = 2112;
        *(_QWORD *)((char *)&time.flags + 2) = v16;
        HIWORD(time.epoch) = 2112;
        v24 = v17;
        _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@Trying to recover by adjusting trim duration from %@ to the minimum trim duration: %@", (uint8_t *)&time, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      time = v19;
      v18 = CMTimeCopyAsDictionary(&time, 0);
      CMSetAttachment(a3, v7, v18, 1u);
      CFRelease(v18);
    }
  }
}

- (void)_appendSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  void *v6;
  HMIVideoAssetWriter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  HMIVideoAssetWriter *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMIVideoAssetWriter *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMIVideoAssetWriter *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMIVideoAssetWriter *v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  HMIVideoAssetWriter *v46;
  NSObject *v47;
  id v48;
  Float64 Seconds;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  char v53;
  char v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  uint8_t v60[4];
  id v61;
  __int16 v62;
  Float64 v63;
  CMTime buf;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  -[HMIVideoAssetWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->super.super._status == 4)
  {
    v6 = (void *)MEMORY[0x220735570]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMICMSampleBufferFormattedDescription(a3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543618;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
      LOWORD(buf.flags) = 2112;
      *(_QWORD *)((char *)&buf.flags + 2) = v10;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Asset writer has failed fatally, ignoring %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    return;
  }
  memset(&v59, 0, sizeof(v59));
  CMSampleBufferGetPresentationTimeStamp(&v59, a3);
  -[HMIVideoAssetWriter assetWriter](self, "assetWriter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "status") == 0;

  if (v12)
  {
    buf = v59;
    -[HMIVideoAssetWriter _startWritingAtStartTime:](self, "_startWritingAtStartTime:", &buf);
    self->_dropSamplesUntilSync = 1;
    self->_dropTrimDurationAttachments = 0;
    -[HMIVideoAssetWriter assetWriter](self, "assetWriter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    objc_msgSend(v21, "startSessionAtSourceTime:", &buf);

LABEL_11:
    if (HMICMSampleBufferIsVideo(a3))
    {
      -[HMIVideoAssetWriter videoInput](self, "videoInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!HMICMSampleBufferIsAudio(a3))
        goto LABEL_20;
      -[HMIVideoAssetWriter audioInput](self, "audioInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "isReadyForMoreMediaData"))
      {
        objc_msgSend(v23, "mediaType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDB1D50]);

        if (!v25)
        {
LABEL_30:
          if (HMICMSampleBufferIsAudio(a3))
          {
            if (self->_dropTrimDurationAttachments)
            {
              -[HMIVideoAssetWriter _removeTrimDurationAttachmentsFromAudioSampleBuffer:](self, "_removeTrimDurationAttachmentsFromAudioSampleBuffer:", a3);
            }
            else
            {
              self->_dropTrimDurationAttachments = 1;
              if (-[HMIVideoAssetWriter allowRecoveryFromInsufficientAudioTrim](self, "allowRecoveryFromInsufficientAudioTrim"))
              {
                -[HMIVideoAssetWriter _ensureFirstAudioSampleBufferHasSufficientPrimingTrim:](self, "_ensureFirstAudioSampleBufferHasSufficientPrimingTrim:", a3);
              }
            }
          }
          if ((objc_msgSend(v23, "appendSampleBuffer:", a3) & 1) != 0)
          {
            if (HMICMSampleBufferIsVideo(a3))
            {
              CMSampleBufferGetPresentationTimeStamp(&v58, a3);
              v57 = v58;
              -[HMIVideoAssetWriter setLastVideoPresentationTimeStamp:](self, "setLastVideoPresentationTimeStamp:", &v57);
            }
            else if (HMICMSampleBufferIsAudio(a3))
            {
              CMSampleBufferGetPresentationTimeStamp(&v56, a3);
              v55 = v56;
              -[HMIVideoAssetWriter setLastAudioPresentationTimeStamp:](self, "setLastAudioPresentationTimeStamp:", &v55);
            }
            -[HMIVideoAssetWriter lastVideoPresentationTimeStamp](self, "lastVideoPresentationTimeStamp");
            if ((v54 & 1) != 0)
            {
              -[HMIVideoAssetWriter lastAudioPresentationTimeStamp](self, "lastAudioPresentationTimeStamp");
              if ((v53 & 1) != 0)
              {
                memset(&buf, 0, sizeof(buf));
                -[HMIVideoAssetWriter lastVideoPresentationTimeStamp](self, "lastVideoPresentationTimeStamp");
                -[HMIVideoAssetWriter lastAudioPresentationTimeStamp](self, "lastAudioPresentationTimeStamp");
                CMTimeSubtract(&buf, &lhs, &rhs);
                time = buf;
                if (fabs(CMTimeGetSeconds(&time)) > 1.0)
                {
                  v45 = (void *)MEMORY[0x220735570]();
                  v46 = self;
                  HMFGetOSLogHandle();
                  v47 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    v48 = (id)objc_claimAutoreleasedReturnValue();
                    time = buf;
                    Seconds = CMTimeGetSeconds(&time);
                    *(_DWORD *)v60 = 138543618;
                    v61 = v48;
                    v62 = 2048;
                    v63 = Seconds;
                    _os_log_impl(&dword_219D45000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Video / Audio Drift (video is ahead by) %+4.3f", v60, 0x16u);

                  }
                  objc_autoreleasePoolPop(v45);
                }
              }
            }
          }
          else
          {
            v38 = (void *)MEMORY[0x220735570]();
            v39 = self;
            HMFGetOSLogHandle();
            v40 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v41 = (id)objc_claimAutoreleasedReturnValue();
              HMICMSampleBufferFormattedDescription(a3, 0);
              v42 = (id)objc_claimAutoreleasedReturnValue();
              -[HMIVideoAssetWriter assetWriter](v39, "assetWriter");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "error");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf.value) = 138543874;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v41;
              LOWORD(buf.flags) = 2112;
              *(_QWORD *)((char *)&buf.flags + 2) = v42;
              HIWORD(buf.epoch) = 2112;
              v65 = v44;
              _os_log_impl(&dword_219D45000, v40, OS_LOG_TYPE_ERROR, "%{public}@Dropped    %@ because of input error %@", (uint8_t *)&buf, 0x20u);

            }
            objc_autoreleasePoolPop(v38);
          }
          goto LABEL_49;
        }
        if (HMICMSampleBufferIsSync(a3))
        {
          self->_dropSamplesUntilSync = 0;
          goto LABEL_30;
        }
        if (!self->_dropSamplesUntilSync)
          goto LABEL_30;
        v31 = (void *)MEMORY[0x220735570]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          HMICMSampleBufferFormattedDescription(a3, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138543618;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v36;
          LOWORD(buf.flags) = 2112;
          *(_QWORD *)((char *)&buf.flags + 2) = v37;
          _os_log_impl(&dword_219D45000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Dropped    %@ because asset writer is waiting for a sync sample.", (uint8_t *)&buf, 0x16u);

        }
      }
      else
      {
        v31 = (void *)MEMORY[0x220735570]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          HMICMSampleBufferFormattedDescription(a3, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138543874;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
          LOWORD(buf.flags) = 2112;
          *(_QWORD *)((char *)&buf.flags + 2) = v35;
          HIWORD(buf.epoch) = 2112;
          v65 = v23;
          _os_log_impl(&dword_219D45000, v33, OS_LOG_TYPE_ERROR, "%{public}@Dropped    %@ because an input %@ is not ready for more media data.", (uint8_t *)&buf, 0x20u);

        }
      }

      objc_autoreleasePoolPop(v31);
LABEL_49:

      return;
    }
LABEL_20:
    v26 = (void *)MEMORY[0x220735570]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HMICMSampleBufferFormattedDescription(a3, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543618;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
      LOWORD(buf.flags) = 2112;
      *(_QWORD *)((char *)&buf.flags + 2) = v30;
      _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_ERROR, "%{public}@Dropped   %@ because an input for the media type was not found.", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v23 = 0;
    goto LABEL_49;
  }
  -[HMIVideoAssetWriter assetWriter](self, "assetWriter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "status") == 3;

  if (!v14)
    goto LABEL_11;
  v15 = (void *)MEMORY[0x220735570]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAssetWriter assetWriter](v16, "assetWriter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138543618;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v18;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v20;
    _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to asset writer, error %@", (uint8_t *)&buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMIVideoAssetWriter _failWithDescription:](v16, "_failWithDescription:", CFSTR("Underlying asset writer has failed."));
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMIVideoAssetWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DBEA348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  intptr_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  intptr_t (*v27)(uint64_t);
  void *v28;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    v2 = (void *)MEMORY[0x220735570]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v5;
      v6 = "%{public}@Asset writer has failed fatally, ignoring flush.";
      v7 = v4;
      v8 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_219D45000, v7, v8, v6, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "dropSamplesUntilSync"))
  {
    v2 = (void *)MEMORY[0x220735570]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v5;
      v6 = "%{public}@We don't have anything to flush, ignoring flush.";
      v7 = v4;
      v8 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  v9 = dispatch_semaphore_create(0);
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke_17;
  v28 = &unk_24DBEE150;
  v30 = *(id *)(a1 + 40);
  v10 = v9;
  v29 = v10;
  objc_msgSend(*(id *)(a1 + 32), "setAssetWriterDidOutputSeparableSegment:", &v25);
  objc_msgSend(*(id *)(a1 + 32), "assetWriter", v25, v26, v27, v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flushSegment");

  v12 = dispatch_time(0, 2000000000);
  v13 = dispatch_semaphore_wait(v10, v12);
  v14 = (void *)MEMORY[0x220735570](v13);
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetWriter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "status");
    objc_msgSend(*(id *)(a1 + 32), "assetWriter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v17;
    v33 = 2048;
    v34 = v19;
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_INFO, "%{public}@Finished waiting for flushSegment, assetWriter.status: %ld, assetWriter.error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(*(id *)(a1 + 32), "assetWriter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "status");

  v24 = *(void **)(a1 + 32);
  if (v23 == 3)
    objc_msgSend(v24, "_failWithDescription:", CFSTR("Failed to flush segment."));
  else
    objc_msgSend(v24, "setDropSamplesUntilSync:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAssetWriterDidOutputSeparableSegment:", 0);

}

intptr_t __50__HMIVideoAssetWriter_flushWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)flush
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__HMIVideoAssetWriter_flush__block_invoke;
  v6[3] = &unk_24DBE9E78;
  v7 = v3;
  v4 = v3;
  -[HMIVideoAssetWriter flushWithCompletionHandler:](self, "flushWithCompletionHandler:", v6);
  v5 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v4, v5);

}

intptr_t __28__HMIVideoAssetWriter_flush__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_failWithDescription:(id)a3
{
  void *v4;
  id v5;

  self->super.super._status = 4;
  objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  HMIErrorLog(self, v5);
  -[HMIVideoAssetWriter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetWriter:didFailWithError:", self, v5);

}

- (HMIVideoAssetWriterDelegate)delegate
{
  return (HMIVideoAssetWriterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (opaqueCMFormatDescription)videoFormat
{
  return self->_videoFormat;
}

- (opaqueCMFormatDescription)audioFormat
{
  return self->_audioFormat;
}

- (BOOL)dropSamplesUntilSync
{
  return self->_dropSamplesUntilSync;
}

- (void)setDropSamplesUntilSync:(BOOL)a3
{
  self->_dropSamplesUntilSync = a3;
}

- (BOOL)dropTrimDurationAttachments
{
  return self->_dropTrimDurationAttachments;
}

- (void)setDropTrimDurationAttachments:(BOOL)a3
{
  self->_dropTrimDurationAttachments = a3;
}

- (BOOL)allowRecoveryFromInsufficientAudioTrim
{
  return self->_allowRecoveryFromInsufficientAudioTrim;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredOutputSegmentInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_preferredOutputSegmentInterval, 24, 1, 0);
  return result;
}

- (void)setPreferredOutputSegmentInterval:(id *)a3
{
  objc_copyStruct(&self->_preferredOutputSegmentInterval, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentFragmentStartTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_currentFragmentStartTime, 24, 1, 0);
  return result;
}

- (void)setCurrentFragmentStartTime:(id *)a3
{
  objc_copyStruct(&self->_currentFragmentStartTime, a3, 24, 1, 0);
}

- (id)assetWriterDidOutputSeparableSegment
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setAssetWriterDidOutputSeparableSegment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (AVAssetWriterInput)videoInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 96, 1);
}

- (AVAssetWriterInput)audioInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 104, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastVideoPresentationTimeStamp, 24, 1, 0);
  return result;
}

- (void)setLastVideoPresentationTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_lastVideoPresentationTimeStamp, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudioPresentationTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastAudioPresentationTimeStamp, 24, 1, 0);
  return result;
}

- (void)setLastAudioPresentationTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_lastAudioPresentationTimeStamp, a3, 24, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong(&self->_assetWriterDidOutputSeparableSegment, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
