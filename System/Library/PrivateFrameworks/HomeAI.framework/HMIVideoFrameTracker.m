@implementation HMIVideoFrameTracker

- (HMIVideoFrameTracker)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  id v6;
  char *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  HMIMotionDetector *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMIHTMLReport *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  CMTime v30;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HMIVideoFrameTracker;
  v7 = -[HMIVideoAnalyzerProcessingNode initWithConfiguration:workQueue:](&v31, sel_initWithConfiguration_workQueue_, v6, a4);
  if (v7)
  {
    CMTimeMakeWithSeconds(&v30, 2.0, 1000);
    v8 = *(_OWORD *)&v30.value;
    *((_QWORD *)v7 + 18) = v30.epoch;
    *((_OWORD *)v7 + 8) = v8;
    v9 = (void *)*((_QWORD *)v7 + 10);
    *((_QWORD *)v7 + 10) = 0;

    *((_QWORD *)v7 + 9) = 0;
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberPreferenceForKey:defaultValue:", CFSTR("videoFrameTrackerMaxCandidates"), &unk_24DC14918);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v7 + 8) = objc_msgSend(v11, "unsignedIntegerValue");

    v12 = objc_alloc_init(HMIMotionDetector);
    v13 = (void *)*((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = v12;

    CMTimeMakeWithSeconds(&v30, 3.0, 1000);
    v14 = *(_OWORD *)&v30.value;
    *((_QWORD *)v7 + 21) = v30.epoch;
    *(_OWORD *)(v7 + 152) = v14;
    v15 = MEMORY[0x24BDC0D88];
    *((_OWORD *)v7 + 11) = *MEMORY[0x24BDC0D88];
    *((_QWORD *)v7 + 24) = *(_QWORD *)(v15 + 16);
    *((_QWORD *)v7 + 12) = 0;
    CMTimeMake(&v30, 100, 1000);
    v16 = *(_OWORD *)&v30.value;
    *((_QWORD *)v7 + 27) = v30.epoch;
    *(_OWORD *)(v7 + 200) = v16;
    *((_QWORD *)v7 + 13) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (objc_msgSend(v6, "saveAnalyzerResultsToDisk"))
    {
      v17 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v17, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "substringToIndex:", 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("/tmp/TrackerReport-%@-%@.html"), v19, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[HMIHTMLReport initWithTitle:outputPath:]([HMIHTMLReport alloc], "initWithTitle:outputPath:", CFSTR("Tracker"), v24);
      v26 = (void *)*((_QWORD *)v7 + 14);
      *((_QWORD *)v7 + 14) = v25;

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)*((_QWORD *)v7 + 15);
      *((_QWORD *)v7 + 15) = v27;

    }
  }

  return (HMIVideoFrameTracker *)v7;
}

- (void)flush
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMIVideoAnalyzerProcessingNode workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[HMIVideoAnalyzerProcessingNode workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HMIVideoFrameTracker_flush__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __29__HMIVideoFrameTracker_flush__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x24BDC0D58];
  v4 = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
  objc_msgSend(v2, "_drainCandidateThatExpiredBefore:", &v3);
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)dealloc
{
  opaqueCMSampleBuffer *background;
  void *v4;
  objc_super v5;
  __int128 v6;
  uint64_t v7;

  background = self->_background;
  if (background)
    CFRelease(background);
  CFRelease(self->_resizedSampleBuffers);
  -[HMIVideoFrameTracker report](self, "report");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = *MEMORY[0x24BDC0D58];
    v7 = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
    -[HMIVideoFrameTracker _visualizeTargetsThatExpiredBefore:](self, "_visualizeTargetsThatExpiredBefore:", &v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoFrameTracker;
  -[HMIVideoFrameTracker dealloc](&v5, sel_dealloc);
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  opaqueCMSampleBuffer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  HMIVideoFrameTracker *v18;
  SEL v19;
  opaqueCMSampleBuffer *v20;
  $95D729B680665BEAEFA1D6FCA8238556 expirationInterval;
  CMTime v22;
  CMTime lhs;
  int v24;
  CMTime v25;
  CMTime v26;

  -[HMIVideoAnalyzerProcessingNode workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasPreferenceForKey:", CFSTR("syntheticEvents"));

    if (v10)
    {
      -[HMIVideoFrameTracker _synthesizeMotionDetectionWithTarget:](self, "_synthesizeMotionDetectionWithTarget:", a3);
    }
    else
    {
      memset(&v26, 0, sizeof(v26));
      CMSampleBufferGetPresentationTimeStamp(&v26, a3);
      memset(&v25, 0, sizeof(v25));
      CMSampleBufferGetPresentationTimeStamp(&v25, a4);
      v11 = -[HMIVideoFrameTracker prepareSampleBuffer:](self, "prepareSampleBuffer:", a3);
      v24 = 0;
      -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoFrameTracker _motionDetectionsFromTarget:reference:dynamicConfiguration:motionScore:](self, "_motionDetectionsFromTarget:reference:dynamicConfiguration:motionScore:", v11, a4, v12, &v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMIVideoAnalyzerProcessingNode dynamicConfiguration](self, "dynamicConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoFrameTracker _tracksFromTarget:reference:background:dynamicConfiguration:motionDetections:](self, "_tracksFromTarget:reference:background:dynamicConfiguration:motionDetections:", v11, a4, a3, v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v16) = v24;
      -[HMIVideoFrameTracker _addCandidateForTarget:motionScore:motionDetections:tracks:](self, "_addCandidateForTarget:motionScore:motionDetections:tracks:", a3, v13, v15, v16);
      -[HMIVideoFrameTracker report](self, "report");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        lhs = v26;
        -[HMIVideoFrameTracker _appendTarget:timeStamp:motionDetections:](self, "_appendTarget:timeStamp:motionDetections:", v11, &lhs, v13);
      }
      lhs = v26;
      expirationInterval = self->_expirationInterval;
      CMTimeSubtract(&v22, &lhs, (CMTime *)&expirationInterval);
      -[HMIVideoFrameTracker _drainCandidateThatExpiredBefore:](self, "_drainCandidateThatExpiredBefore:", &v22);
      lhs = v25;
      -[HMIVideoFrameTracker _drainResizedBuffersThatExpiredBefore:](self, "_drainResizedBuffersThatExpiredBefore:", &lhs);
      CFRelease(v11);

    }
  }
  else
  {
    v18 = (HMIVideoFrameTracker *)_HMFPreconditionFailure();
    -[HMIVideoFrameTracker handleSampleBuffer:](v18, v19, v20);
  }
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  $95D729B680665BEAEFA1D6FCA8238556 expirationInterval;
  CMTime lhs;
  CMTime v8;
  CMTime v9;

  -[HMIVideoAnalyzerProcessingNode workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  memset(&v9, 0, sizeof(v9));
  CMSampleBufferGetPresentationTimeStamp(&v9, a3);
  lhs = v9;
  expirationInterval = self->_expirationInterval;
  CMTimeSubtract(&v8, &lhs, (CMTime *)&expirationInterval);
  -[HMIVideoFrameTracker _drainCandidateThatExpiredBefore:](self, "_drainCandidateThatExpiredBefore:", &v8);
}

- (void)handleFrameAnalyzerResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];

  v4 = a3;
  -[HMIVideoAnalyzerProcessingNode workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "presentationTimeStamp");
    else
      memset(v28, 0, sizeof(v28));
    objc_msgSend(v7, "assignForegroundEvents:timeStamp:", v8, v28);

    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v4, "backgroundTimeStamp");
    else
      memset(v27, 0, sizeof(v27));
    objc_msgSend(v11, "assignBackgroundEvents:timeStamp:", v12, v27);

  }
  -[HMIVideoFrameTracker report](self, "report");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "events");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regionOfInterest");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v4, "frame");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      objc_msgSend(v24, "presentationTimeStamp");
    else
      memset(v26, 0, sizeof(v26));
    -[HMIVideoFrameTracker _visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:](self, "_visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:", v14, v15, v26, v17, v19, v21, v23);

  }
}

- (opaqueCMSampleBuffer)prepareSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  CFIndex v6;
  opaqueCMSampleBuffer *ValueAtIndex;
  __CVBuffer *v8;
  __CVBuffer *v9;
  const void *CopyWithPixelBuffer;
  __CFArray *v11;
  CMTime v13;
  CMTime time2;
  CMTime time1;
  CMTime v16;
  CMTime v17;
  CFRange v18;

  -[HMIVideoAnalyzerProcessingNode workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a3);
  if (CFArrayGetCount(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers")) < 1)
    goto LABEL_6;
  v6 = 0;
  while (1)
  {
    ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers"), v6);
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, ValueAtIndex);
    time1 = v17;
    time2 = v16;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      time1 = v16;
      time2 = (CMTime)self->_approximationInterval;
      CMTimeAdd(&v13, &time1, &time2);
      time1 = v17;
      if (CMTimeCompare(&time1, &v13) < 0)
        break;
    }
    if (++v6 >= CFArrayGetCount(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers")))
      goto LABEL_6;
  }
  CopyWithPixelBuffer = CFRetain(ValueAtIndex);
  if (!CopyWithPixelBuffer)
  {
LABEL_6:
    v8 = +[HMIVideoFrameTracker resizePixelBuffer:](HMIVideoFrameTracker, "resizePixelBuffer:", CMSampleBufferGetImageBuffer(a3));
    if (v8)
    {
      v9 = v8;
      CopyWithPixelBuffer = HMICMSampleBufferCreateCopyWithPixelBuffer(a3, v8);
      CVPixelBufferRelease(v9);
      CFArrayAppendValue(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers"), CopyWithPixelBuffer);
      v11 = -[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers");
      v18.length = CFArrayGetCount(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers"));
      v18.location = 0;
      CFArraySortValues(v11, v18, (CFComparatorFunction)HMICMSampleBufferTimeAscendingComparator, 0);
    }
    else
    {
      return 0;
    }
  }
  return (opaqueCMSampleBuffer *)CopyWithPixelBuffer;
}

+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3
{
  double Size;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  Size = HMICVPixelBufferGetSize(a3);
  v6 = v5;
  v7 = HMIAspectRatioMake((int)Size, (int)v5);
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x900000010) & 1) != 0)
  {
    v8 = 180.0;
LABEL_14:
    v10 = 0x4074000000000000;
    goto LABEL_15;
  }
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x1000000009) & 1) != 0)
  {
    v8 = 320.0;
    v9 = 180.0;
    goto LABEL_16;
  }
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x300000004) & 1) != 0)
  {
    v8 = 240.0;
    goto LABEL_14;
  }
  if ((HMIAspectRatioEqualToAspectRatio(v7, 0x400000003) & 1) == 0)
  {
    if ((HMIAspectRatioEqualToAspectRatio(v7, 0x100000001) & 1) != 0)
    {
      v9 = 240.0;
      v8 = 240.0;
      goto LABEL_16;
    }
    v11 = (void *)MEMORY[0x220735570]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 1024;
      v20 = v7;
      v21 = 1024;
      v22 = HIDWORD(v7);
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unsupported aspect ratio: (%d, %d)", buf, 0x18u);

    }
    objc_autoreleasePoolPop(v11);
    v8 = (double)(int)(float)(320.0 / (float)((float)(int)v7 / (float)SHIDWORD(v7)));
    goto LABEL_14;
  }
  v8 = 320.0;
  v10 = 0x406E000000000000;
LABEL_15:
  v9 = *(double *)&v10;
LABEL_16:
  v14 = Size == v9 && v6 == v8;
  if (v14 && CVPixelBufferGetPixelFormatType(a3) == 875704438)
    return CVPixelBufferRetain(a3);
  v16 = 0;
  return +[HMIVisionUtilities resizePixelBuffer:size:pixelFormat:options:error:](HMIVisionUtilities, "resizePixelBuffer:size:pixelFormat:options:error:", a3, 875704438, 8, &v16, v9, v8);
}

- (void)_addCandidateForTarget:(opaqueCMSampleBuffer *)a3 motionScore:(float)a4 motionDetections:(id)a5 tracks:(id)a6
{
  id v10;
  id v11;
  HMIVideoFrameTrackerFrameCandidate *v12;
  double v13;
  HMIVideoFrameTrackerFrameCandidate *v14;
  void *v15;
  HMIVideoFrameTracker *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  int v26;
  void *v27;
  __int16 v28;
  HMIVideoFrameTrackerFrameCandidate *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = [HMIVideoFrameTrackerFrameCandidate alloc];
  *(float *)&v13 = a4;
  v14 = -[HMIVideoFrameTrackerFrameCandidate initWithSampleBuffer:score:motionDetections:tracks:](v12, "initWithSampleBuffer:score:motionDetections:tracks:", a3, v10, v11, v13);
  v15 = (void *)MEMORY[0x220735570]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v18;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Adding Candidate: %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  ++v16->_numCandidates;
  -[HMIVideoFrameTracker candidate](v16, "candidate");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_5;
  v20 = (void *)v19;
  -[HMIVideoFrameTracker candidate](v16, "candidate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "score");
  v23 = v22;
  -[HMIVideoFrameTrackerFrameCandidate score](v14, "score");
  v25 = v24;

  if (v23 < v25)
LABEL_5:
    objc_storeStrong((id *)&v16->_candidate, v14);

}

- (void)_drainCandidateThatExpiredBefore:(id *)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  float v8;
  float v9;
  void *v10;
  int32_t v11;
  void *v12;
  HMIVideoFrameTracker *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  HMIVideoFrameTrackerFrameCandidate *candidate;
  CMTime v24;
  CMTime time2;
  CMTime v26;
  CMTime time1;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMIVideoFrameTracker candidate](self, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    memset(&v26, 0, sizeof(v26));
    CMSampleBufferGetPresentationTimeStamp(&v26, (CMSampleBufferRef)objc_msgSend(v5, "sbuf"));
    v7 = -[HMIVideoFrameTracker numCandidates](self, "numCandidates");
    if (v7 >= -[HMIVideoFrameTracker maxCandidates](self, "maxCandidates")
      || (time1 = v26, time2 = (CMTime)*a3, CMTimeCompare(&time1, &time2) < 0))
    {
      objc_msgSend(v6, "score");
      v9 = v8;
      if (v8 <= 0.0)
      {
        objc_msgSend(v6, "tracks");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          time1 = v26;
          time2 = (CMTime)self->_trackAnalysisPTS;
          v11 = CMTimeCompare(&time1, &time2);

          if ((v11 & 0x80000000) == 0)
            goto LABEL_7;
        }
        else
        {

        }
LABEL_12:
        candidate = self->_candidate;
        self->_candidate = 0;

        self->_numCandidates = 0;
        goto LABEL_13;
      }
LABEL_7:
      v12 = (void *)MEMORY[0x220735570]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time1.value) = 138543618;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v15;
        LOWORD(time1.flags) = 2112;
        *(_QWORD *)((char *)&time1.flags + 2) = v6;
        _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Selected: %@", (uint8_t *)&time1, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMIVideoFrameTracker delegate](v13, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "sbuf");
      time1 = v26;
      v18 = -[HMIVideoFrameTracker _backgroundAtTimeStamp:](v13, "_backgroundAtTimeStamp:", &time1);
      objc_msgSend(v6, "motionDetections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tracks");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frameTracker:didTrackFrame:background:motionDetections:tracks:", v13, v17, v18, v19, v20);

      if (v9 <= 0.0)
      {
        time2 = v26;
        v21 = *(_OWORD *)&v13->_trackInterval.value;
        v24.epoch = v13->_trackInterval.epoch;
        *(_OWORD *)&v24.value = v21;
        CMTimeAdd(&time1, &time2, &v24);
        v22 = *(_OWORD *)&time1.value;
        v13->_trackAnalysisPTS.epoch = time1.epoch;
        *(_OWORD *)&v13->_trackAnalysisPTS.value = v22;
      }
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)_drainResizedBuffersThatExpiredBefore:(id *)a3
{
  opaqueCMSampleBuffer *ValueAtIndex;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  CMTime time1;
  CMTime v8;

  if (CFArrayGetCount(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers")) >= 1)
  {
    do
    {
      ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers"), 0);
      memset(&v8, 0, sizeof(v8));
      CMSampleBufferGetPresentationTimeStamp(&v8, ValueAtIndex);
      time1 = v8;
      v6 = *a3;
      if ((CMTimeCompare(&time1, (CMTime *)&v6) & 0x80000000) == 0)
        break;
      CFArrayRemoveValueAtIndex(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers"), 0);
    }
    while (CFArrayGetCount(-[HMIVideoFrameTracker resizedSampleBuffers](self, "resizedSampleBuffers")) > 0);
  }
}

- (void)_synthesizeMotionDetectionWithTarget:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  HMIVideoFrameTracker *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMIMotionDetection *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  HMIMotionDetection *v15;
  HMIMotionDetection *v16;
  double v17;
  HMIMotionDetection *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x220735570](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMICMSampleBufferTinyDescription(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Synthesizing Motion Detections, Target: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = [HMIMotionDetection alloc];
  v11 = *MEMORY[0x24BDBF148];
  v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v13 = MEMORY[0x24BDBD1A8];
  LODWORD(v14) = 2139095040;
  v15 = -[HMIMotionDetection initWithBoundingBox:size:motionVectors:motionScore:motionMode:](v10, "initWithBoundingBox:size:motionVectors:motionScore:motionMode:", MEMORY[0x24BDBD1A8], 2, 0.1, 0.1, 0.8, 0.8, *MEMORY[0x24BDBF148], v12, v14);
  v16 = [HMIMotionDetection alloc];
  LODWORD(v17) = 2139095040;
  v18 = -[HMIMotionDetection initWithBoundingBox:size:motionVectors:motionScore:motionMode:](v16, "initWithBoundingBox:size:motionVectors:motionScore:motionMode:", v13, 1, 0.1, 0.1, 0.8, 0.8, v11, v12, v17, v15);
  v22[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoFrameTracker delegate](v6, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frameTracker:didTrackFrame:background:motionDetections:tracks:", v6, a3, 0, v19, v21);

}

- (id)_motionDetectionsFromTarget:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4 dynamicConfiguration:(id)a5 motionScore:(float *)a6
{
  id v10;
  char v11;
  void *v12;
  void *v13;
  CVImageBufferRef ImageBuffer;
  void *v15;
  void *v16;
  int v17;
  int v19;

  v10 = a5;
  v11 = objc_msgSend(v10, "eventTriggers");
  if ((objc_msgSend(v10, "eventTriggers") & 1) != 0)
  {
    objc_msgSend(v10, "activityZones");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }
  v19 = 0;
  -[HMIVideoFrameTracker motionDetector](self, "motionDetector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  objc_msgSend(v13, "detectWithGlobalMotionScore:referencePixelBuffer:targetPixelBuffer:activityZones:detectorMode:", &v19, ImageBuffer, CMSampleBufferGetImageBuffer(a3), v12, v11 & 1 | 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "motionScore");
  *(_DWORD *)a6 = v17;

  return v15;
}

- (id)_tracksFromTarget:(opaqueCMSampleBuffer *)a3 reference:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 dynamicConfiguration:(id)a6 motionDetections:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMIBackgroundEstimator *v16;
  void *v17;
  HMIBackgroundEstimator *v18;
  void *v19;
  CVImageBufferRef ImageBuffer;
  id v21;
  void *v22;
  void *v23;
  CVImageBufferRef v24;
  void *v25;
  int v26;
  opaqueCMSampleBuffer *background;
  CMTime v29;
  CMTime v30;
  CMTime v31;

  v12 = a7;
  if ((objc_msgSend(a6, "eventTriggers") & 0x10) != 0)
  {
    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = [HMIBackgroundEstimator alloc];
      -[HMIVideoAnalyzerProcessingNode configuration](self, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMIBackgroundEstimator initWithConfiguration:](v16, "initWithConfiguration:", v17);
      -[HMIVideoFrameTracker setBackgroundEstimator:](self, "setBackgroundEstimator:", v18);

      -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      CMSampleBufferGetPresentationTimeStamp(&v31, a4);
      v21 = (id)objc_msgSend(v19, "analyzePixelBuffer:timeStamp:", ImageBuffer, &v31);

    }
    memset(&v30, 0, sizeof(v30));
    CMSampleBufferGetPresentationTimeStamp(&v30, a3);
    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleMotionDetection:inFrame:", v12, a3);

    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CMSampleBufferGetImageBuffer(a3);
    v29 = v30;
    objc_msgSend(v23, "analyzePixelBuffer:timeStamp:", v24, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hasNewBackground");

    if (v26)
    {
      background = self->_background;
      if (background)
        CFRelease(background);
      self->_background = (opaqueCMSampleBuffer *)CFRetain(a5);
    }
  }
  else
  {
    if (-[HMIVideoFrameTracker background](self, "background"))
    {
      CFRelease(self->_background);
      self->_background = 0;
    }
    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[HMIVideoFrameTracker setBackgroundEstimator:](self, "setBackgroundEstimator:", 0);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (opaqueCMSampleBuffer)_backgroundAtTimeStamp:(id *)a3
{
  opaqueCMSampleBuffer *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  CMTime time2;

  result = -[HMIVideoFrameTracker background](self, "background");
  if (result)
  {
    CMSampleBufferGetPresentationTimeStamp(&time2, -[HMIVideoFrameTracker background](self, "background"));
    v6 = *a3;
    if (CMTimeCompare((CMTime *)&v6, &time2) < 1)
      return 0;
    else
      return -[HMIVideoFrameTracker background](self, "background");
  }
  return result;
}

- (void)_appendTarget:(opaqueCMSampleBuffer *)a3 timeStamp:(id *)a4 motionDetections:(id)a5
{
  id v8;
  void *v9;
  HMIVideoFrame *v10;
  CVImageBufferRef ImageBuffer;
  HMIVideoFrame *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29;

  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [HMIVideoFrame alloc];
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v29 = *a4;
  v12 = -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](v10, "initWithPixelBuffer:presentationTimeStamp:", ImageBuffer, &v29);
  objc_msgSend(v9, "addObject:", v12);
  -[HMIVideoFrameTracker motionDetector](self, "motionDetector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFrame size](v12, "size");
  v15 = v14;
  v17 = v16;
  if (v12)
    -[HMIVideoFrame presentationTimeStamp](v12, "presentationTimeStamp");
  else
    memset(v28, 0, sizeof(v28));
  objc_msgSend(v13, "visualizeMotionDetections:frameSize:timeStamp:", v8, v28, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v18);

  -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "visualizeBackgroundMean");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "visualizeBackgroundStd");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

    -[HMIVideoFrameTracker backgroundEstimator](self, "backgroundEstimator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "visualizeForegroundAssignment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v25);

  }
  -[HMIVideoFrameTracker reportBuffer](self, "reportBuffer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v26, "addObject:", v27);

}

- (void)_visualizeTargetsThatExpiredBefore:(id *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBF070];
  v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v11 = *a3;
  -[HMIVideoFrameTracker _visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:](self, "_visualizeTargetEvents:backgroundEvents:regionOfInterest:targetTimeStamp:", v5, v6, &v11, v7, v8, v9, v10);

}

- (void)_visualizeTargetEvents:(id)a3 backgroundEvents:(id)a4 regionOfInterest:(CGRect)a5 targetTimeStamp:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int32_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31;
  CMTime time1;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  -[HMIVideoFrameTracker reportBuffer](self, "reportBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = *MEMORY[0x24BDBF070];
    v18 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v19 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF070] + 24);
    while (1)
    {
      -[HMIVideoFrameTracker reportBuffer](self, "reportBuffer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        objc_msgSend(v23, "presentationTimeStamp");
      else
        memset(&time1, 0, sizeof(time1));
      v31 = *a6;
      v25 = CMTimeCompare(&time1, (CMTime *)&v31);

      if (v25 >= 1)
        break;
      if (v25)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIVideoFrameTracker _visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:](self, "_visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:", v22, v26, v27, v17, v18, v19, v20);

      }
      else
      {
        -[HMIVideoFrameTracker _visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:](self, "_visualizeFrames:targetEvents:backgroundEvents:regionOfInterest:", v22, v13, v14, x, y, width, height);
      }
      -[HMIVideoFrameTracker reportBuffer](self, "reportBuffer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hmf_removeFirstObject");

      -[HMIVideoFrameTracker reportBuffer](self, "reportBuffer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (!v30)
        goto LABEL_13;
    }

  }
LABEL_13:

}

- (void)_visualizeFrames:(id)a3 targetEvents:(id)a4 backgroundEvents:(id)a5 regionOfInterest:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double);
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, unint64_t, void *, void *, double, double, double, double);
  void *v29;
  id v30;
  HMIVideoFrameTracker *v31;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __88__HMIVideoFrameTracker__visualizeFrames_targetEvents_backgroundEvents_regionOfInterest___block_invoke;
  v29 = &unk_24DBED6C8;
  v30 = v13;
  v31 = self;
  v14 = v13;
  v15 = a5;
  v16 = a4;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))MEMORY[0x220735744](&v26);
  ((void (**)(_QWORD, _QWORD, id, const __CFString *, double, double, double, double))v17)[2](v17, 0, v16, CFSTR("Target"), x, y, width, height);

  ((void (**)(_QWORD, uint64_t, id, const __CFString *, double, double, double, double))v17)[2](v17, 2, v15, CFSTR("Mean"), x, y, width, height);
  objc_msgSend(MEMORY[0x24BDBCF20], "set", v26, v27, v28, v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDBF070];
  v20 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v21 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v22 = *(double *)(MEMORY[0x24BDBF070] + 24);
  ((void (**)(_QWORD, uint64_t, void *, const __CFString *, double, double, double, double))v17)[2](v17, 3, v18, CFSTR("Std"), *MEMORY[0x24BDBF070], v20, v21, v22);

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *, const __CFString *, double, double, double, double))v17)[2](v17, 1, v23, CFSTR("Motion"), v19, v20, v21, v22);

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *, const __CFString *, double, double, double, double))v17)[2](v17, 4, v24, CFSTR("Assign"), v19, v20, v21, v22);

  -[HMIVideoFrameTracker report](self, "report");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendText:", &stru_24DBF1B40);

}

void __88__HMIVideoFrameTracker__visualizeFrames_targetEvents_backgroundEvents_regionOfInterest___block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  Float64 Seconds;
  void *v20;
  HMIVideoAnalyzerFrameResult *v21;
  void *v22;
  HMIVideoAnalyzerFrameResult *v23;
  void *v24;
  CMTime time;

  v15 = a3;
  v16 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "count") > a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "presentationTimeStamp");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    objc_msgSend(*(id *)(a1 + 40), "report");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [HMIVideoAnalyzerFrameResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v21, "initWithFrame:events:regionOfInterest:", v22, v15, a5, a6, a7, a8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f %@"), *(_QWORD *)&Seconds, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFrameResult:frameTruth:description:", v23, 0, v24);

  }
}

- (HMIVideoFrameTrackerDelegate)delegate
{
  return (HMIVideoFrameTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMIMotionDetector)motionDetector
{
  return (HMIMotionDetector *)objc_getProperty(self, a2, 56, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expirationInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_expirationInterval, 24, 1, 0);
  return result;
}

- (unint64_t)maxCandidates
{
  return self->_maxCandidates;
}

- (unint64_t)numCandidates
{
  return self->_numCandidates;
}

- (void)setNumCandidates:(unint64_t)a3
{
  self->_numCandidates = a3;
}

- (HMIVideoFrameTrackerFrameCandidate)candidate
{
  return (HMIVideoFrameTrackerFrameCandidate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCandidate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_trackInterval, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackAnalysisPTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_trackAnalysisPTS, 24, 1, 0);
  return result;
}

- (void)setTrackAnalysisPTS:(id *)a3
{
  objc_copyStruct(&self->_trackAnalysisPTS, a3, 24, 1, 0);
}

- (HMIBackgroundEstimator)backgroundEstimator
{
  return (HMIBackgroundEstimator *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBackgroundEstimator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (opaqueCMSampleBuffer)background
{
  return self->_background;
}

- (void)setBackground:(opaqueCMSampleBuffer *)a3
{
  self->_background = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)approximationInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_approximationInterval, 24, 1, 0);
  return result;
}

- (__CFArray)resizedSampleBuffers
{
  return self->_resizedSampleBuffers;
}

- (HMIHTMLReport)report
{
  return (HMIHTMLReport *)objc_getProperty(self, a2, 112, 1);
}

- (NSMutableArray)reportBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportBuffer, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_backgroundEstimator, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
