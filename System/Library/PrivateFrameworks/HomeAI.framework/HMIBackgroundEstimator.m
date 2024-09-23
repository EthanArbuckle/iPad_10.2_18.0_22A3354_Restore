@implementation HMIBackgroundEstimator

- (HMIBackgroundEstimator)initWithConfiguration:(id)a3
{
  id v5;
  HMIBackgroundEstimator *v6;
  HMIBackgroundEstimator *v7;
  uint64_t v8;
  NSMutableDictionary *tracks;
  uint64_t v10;
  NSMutableDictionary *inactiveTracks;
  CMTimeEpoch epoch;
  CMTimeEpoch v13;
  CMTimeEpoch v14;
  uint64_t v15;
  NSMutableArray *motionDetections;
  uint64_t v17;
  NSMutableArray *motionTimeStamps;
  CMTimeEpoch v19;
  CMTime v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMIBackgroundEstimator;
  v6 = -[HMIBackgroundEstimator init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_numTracks = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    tracks = v7->_tracks;
    v7->_tracks = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    inactiveTracks = v7->_inactiveTracks;
    v7->_inactiveTracks = (NSMutableDictionary *)v10;

    v7->_minSampleSize = 4;
    CMTimeMakeWithSeconds(&v21, 180.0, 1000);
    epoch = v21.epoch;
    *(_OWORD *)&v7->_backgroundExpireInterval.value = *(_OWORD *)&v21.value;
    v7->_backgroundExpireInterval.epoch = epoch;
    CMTimeMakeWithSeconds(&v21, 7.0, 1000);
    v13 = v21.epoch;
    *(_OWORD *)&v7->_backgroundChangeInterval.value = *(_OWORD *)&v21.value;
    v7->_backgroundChangeInterval.epoch = v13;
    CMTimeMakeWithSeconds(&v21, 30.0, 1000);
    v14 = v21.epoch;
    *(_OWORD *)&v7->_backgroundChangeResetInterval.value = *(_OWORD *)&v21.value;
    v7->_backgroundChangeResetInterval.epoch = v14;
    v7->_assignment = 0;
    v7->_runningMean = 0;
    v7->_runningStd = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    motionDetections = v7->_motionDetections;
    v7->_motionDetections = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    motionTimeStamps = v7->_motionTimeStamps;
    v7->_motionTimeStamps = (NSMutableArray *)v17;

    CMTimeMakeWithSeconds(&v21, 1.0, 1000);
    v19 = v21.epoch;
    *(_OWORD *)&v7->_motionValidInterval.value = *(_OWORD *)&v21.value;
    v7->_motionValidInterval.epoch = v19;
    -[HMIBackgroundEstimator reset](v7, "reset");
  }

  return v7;
}

- (void)reset
{
  CGSize *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  unsigned __int16 *assignment;
  float *runningMean;
  float *runningStd;

  self->_numImages = 0;
  v3 = (CGSize *)MEMORY[0x24BDBF148];
  self->_imageSize = (CGSize)*MEMORY[0x24BDBF148];
  self->_modelSize = *v3;
  v4 = MEMORY[0x24BDC0D88];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  *(_OWORD *)&self->_foregroundTimeStamp.value = *MEMORY[0x24BDC0D88];
  self->_foregroundTimeStamp.epoch = v5;
  v6 = *(_QWORD *)(v4 + 16);
  *(_OWORD *)&self->_backgroundTimeStamp.value = *(_OWORD *)v4;
  self->_backgroundTimeStamp.epoch = v6;
  v7 = *(_QWORD *)(v4 + 16);
  *(_OWORD *)&self->_backgroundChangeTimeStamp.value = *(_OWORD *)v4;
  self->_backgroundChangeTimeStamp.epoch = v7;
  self->_adjustBrightness = 0;
  -[NSMutableDictionary removeAllObjects](self->_tracks, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_inactiveTracks, "removeAllObjects");
  assignment = self->_assignment;
  if (assignment)
  {
    free(assignment);
    self->_assignment = 0;
  }
  runningMean = self->_runningMean;
  if (runningMean)
  {
    free(runningMean);
    self->_runningMean = 0;
  }
  runningStd = self->_runningStd;
  if (runningStd)
  {
    free(runningStd);
    self->_runningStd = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[HMIBackgroundEstimator reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)HMIBackgroundEstimator;
  -[HMIBackgroundEstimator dealloc](&v3, sel_dealloc);
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  unint64_t v7;
  void *v8;
  HMIBackgroundEstimator *v9;
  NSObject *v10;
  id v11;
  Float64 Seconds;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  __int128 v18;
  int64_t v19;
  __int128 v20;
  int64_t v21;
  __int128 v22;
  int64_t v23;
  __int128 v24;
  int64_t var3;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  Float64 v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (CVPixelBufferGetPixelFormatType(a3) != 875704438 && CVPixelBufferGetPixelFormatType(a3) != 875704422)
    _HMFPreconditionFailure();
  v24 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  if (-[HMIBackgroundEstimator _invalidateBackgroundForPixelBuffer:timeStamp:](self, "_invalidateBackgroundForPixelBuffer:timeStamp:", a3, &v24))
  {
    -[HMIBackgroundEstimator reset](self, "reset");
    v22 = *(_OWORD *)&a4->var0;
    v23 = a4->var3;
    -[HMIBackgroundEstimator setBackgroundChangeTimeStamp:](self, "setBackgroundChangeTimeStamp:", &v22);
  }
  -[HMIBackgroundEstimator _ensureInternalBuffersForPixelBuffer:](self, "_ensureInternalBuffersForPixelBuffer:", a3);
  v7 = -[HMIBackgroundEstimator numImages](self, "numImages");
  if (v7 >= -[HMIBackgroundEstimator minSampleSize](self, "minSampleSize"))
  {
    v20 = *(_OWORD *)&a4->var0;
    v21 = a4->var3;
    -[HMIBackgroundEstimator _predictForegroundFromPixelBuffer:timeStamp:](self, "_predictForegroundFromPixelBuffer:timeStamp:", a3, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *(_OWORD *)&a4->var0;
    v19 = a4->var3;
    if (!-[HMIBackgroundEstimator _updateBackgroundFromPixelBuffer:timeStamp:](self, "_updateBackgroundFromPixelBuffer:timeStamp:", a3, &v18))
    {
      v8 = (void *)MEMORY[0x220735570]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v17 = *a4;
        Seconds = CMTimeGetSeconds((CMTime *)&v17);
        v13 = -[HMIBackgroundEstimator numImages](v9, "numImages");
        v14 = -[HMIBackgroundEstimator minSampleSize](v9, "minSampleSize");
        *(_DWORD *)buf = 138544130;
        v27 = v11;
        v28 = 2048;
        v29 = Seconds;
        v30 = 2048;
        v31 = v13;
        v32 = 2048;
        v33 = v14;
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_ERROR, "%{public}@BackgroundEstimator(PTS:%.2f) Unable to update background model (%lu/%lu)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v8);
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (BOOL)hasNewBackground
{
  unint64_t v3;
  CMTime v5;
  CMTime time1;

  v3 = -[HMIBackgroundEstimator numImages](self, "numImages");
  if (v3 != -[HMIBackgroundEstimator minSampleSize](self, "minSampleSize"))
    return 0;
  -[HMIBackgroundEstimator foregroundTimeStamp](self, "foregroundTimeStamp");
  v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  return CMTimeCompare(&time1, &v5) == 0;
}

- (void)assignBackgroundEvents:(id)a3 timeStamp:(id *)a4
{
  id v6;
  void *v7;
  HMIBackgroundEstimator *v8;
  NSObject *v9;
  id v10;
  Float64 Seconds;
  _QWORD v12[5];
  CMTime time;
  CMTime time2;
  CMTime time1;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  Float64 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMIBackgroundEstimator backgroundTimeStamp](self, "backgroundTimeStamp");
  time2 = *(CMTime *)a4;
  if (!CMTimeCompare(&time1, &time2))
  {
    if (-[HMIBackgroundEstimator assignment](self, "assignment"))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __59__HMIBackgroundEstimator_assignBackgroundEvents_timeStamp___block_invoke;
      v12[3] = &unk_24DBEA558;
      v12[4] = self;
      objc_msgSend(v6, "na_each:", v12);
    }
    else
    {
      v7 = (void *)MEMORY[0x220735570]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[HMIBackgroundEstimator backgroundTimeStamp](v8, "backgroundTimeStamp");
        Seconds = CMTimeGetSeconds(&time);
        *(_DWORD *)buf = 138543618;
        v17 = v10;
        v18 = 2048;
        v19 = Seconds;
        _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Background model assignment is NULL %.2f", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
  }

}

void __59__HMIBackgroundEstimator_assignBackgroundEvents_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = objc_opt_class();
  v4 = v3 != objc_opt_class();
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v5, "assignment");
  objc_msgSend(v7, "boundingBox");
  objc_msgSend(v5, "_setAssignment:greaterThanType:value:boundingBox:scale:", v6, 1, v4);

}

- (void)assignForegroundEvents:(id)a3 timeStamp:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMIBackgroundEstimator *v15;
  NSObject *v16;
  id v17;
  Float64 Seconds;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  HMIBackgroundEstimator *v22;
  __int128 v23;
  int64_t var3;
  CMTime time;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  Float64 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[HMIBackgroundEstimator assignment](self, "assignment"))
  {
    objc_msgSend(v6, "na_filter:", &__block_literal_global_7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIBackgroundEstimator tracks](self, "tracks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_2;
    v20[3] = &unk_24DBEA5E8;
    v23 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v11 = v7;
    v21 = v11;
    v22 = self;
    objc_msgSend(v9, "na_each:", v20);

    -[HMIBackgroundEstimator tracks](self, "tracks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_4;
    v19[3] = &unk_24DBEA610;
    v19[4] = self;
    objc_msgSend(v13, "na_each:", v19);

  }
  else
  {
    v14 = (void *)MEMORY[0x220735570]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[HMIBackgroundEstimator backgroundTimeStamp](v15, "backgroundTimeStamp");
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2048;
      v29 = Seconds;
      _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@Background model assignment is NULL %.2f", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

BOOL __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v18;
  void *v19;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  if (v4 == v5)
  {
    objc_msgSend(v3, "confidence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "value");
    if (v6 > 0.41)
    {
      v7 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  if (v8 == v9
    && (objc_msgSend(v3, "confidence"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "value"),
        v10 > 0.44))
  {

    v7 = 1;
  }
  else
  {
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    if (v11 == v12
      && (objc_msgSend(v3, "confidence"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "value"),
          v13 > 0.42))
    {

      v7 = 1;
    }
    else
    {
      v14 = objc_opt_class();
      if (v14 == objc_opt_class())
      {
        objc_msgSend(v3, "confidence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v7 = v16 > 0.24;

      }
      else
      {
        v7 = 0;
      }
      if (v11 == v12)

    }
    if (v8 == v9)

  }
  if (v4 == v5)
    goto LABEL_18;
LABEL_19:

  return v7;
}

void __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;
  uint64_t v9;

  v3 = a2;
  v8 = *(_OWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "blobAtTimeStamp:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_3;
    v6[3] = &unk_24DBEA5C0;
    v5 = *(void **)(a1 + 32);
    v6[4] = *(_QWORD *)(a1 + 40);
    v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

  }
}

void __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  void *v14;
  id v15;

  v15 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastBlob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundingBox");
  objc_msgSend(v3, "_intersectionOverUnionFromBlob:boundingBox:assignment:", v4, objc_msgSend(*(id *)(a1 + 32), "assignment"), v5, v6, v7, v8);
  v10 = v9;

  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = 0.1;
  if (v11 != v12)
    v13 = 0.5;
  if (v10 > v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "eventClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", objc_opt_class());

  }
}

void __59__HMIBackgroundEstimator_assignForegroundEvents_timeStamp___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "eventClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", objc_opt_class());

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(v5, "assignment");
    objc_msgSend(v8, "lastBlob");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingBox");
    objc_msgSend(v5, "_setAssignment:greaterThanType:value:boundingBox:scale:", v6, 1, 0);

  }
}

- (void)handleMotionDetection:(id)a3 inFrame:(opaqueCMSampleBuffer *)a4
{
  void *v6;
  void *v7;
  CMTime v8;
  _QWORD v9[5];
  CMTime v10;
  CMTime v11;

  +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", a3, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v11, 0, sizeof(v11));
  CMSampleBufferGetPresentationTimeStamp(&v11, a4);
  if (v6)
  {
    objc_msgSend(v6, "motionVectors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__HMIBackgroundEstimator_handleMotionDetection_inFrame___block_invoke;
    v9[3] = &unk_24DBEA638;
    v9[4] = self;
    v10 = v11;
    objc_msgSend(v7, "na_each:", v9);

  }
  v8 = v11;
  -[HMIBackgroundEstimator _expireMotionDetectionsAtTimeStamp:](self, "_expireMotionDetectionsAtTimeStamp:", &v8);

}

void __56__HMIBackgroundEstimator_handleMotionDetection_inFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "motionTimeStamps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 32), "motionDetections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v3, "boundingBox");
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  v13[3] = v11;
  objc_msgSend(v7, "valueWithBytes:objCType:", v13, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

}

- (BOOL)_invalidateBackgroundForPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  void *v7;
  int v8;
  void *v9;
  HMIBackgroundEstimator *v10;
  NSObject *v11;
  id v12;
  Float64 v13;
  Float64 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  HMIBackgroundEstimator *v22;
  NSObject *v23;
  void *v24;
  Float64 v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  HMIBackgroundEstimator *v30;
  NSObject *v31;
  id v32;
  Float64 Seconds;
  Float64 v34;
  void *v35;
  HMIBackgroundEstimator *v36;
  NSObject *v37;
  void *v38;
  Float64 v39;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTime time2;
  CMTime time1;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  Float64 v61;
  __int16 v62;
  Float64 v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  time1 = *(CMTime *)a4;
  -[HMIBackgroundEstimator backgroundTimeStamp](self, "backgroundTimeStamp");
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    v29 = (void *)MEMORY[0x220735570]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v55 = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&v55);
      -[HMIBackgroundEstimator backgroundTimeStamp](v30, "backgroundTimeStamp");
      v34 = CMTimeGetSeconds(&v54);
      *(_DWORD *)buf = 138543874;
      v59 = v32;
      v60 = 2048;
      v61 = Seconds;
      v62 = 2048;
      v63 = v34;
      _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_DEBUG, "%{public}@BackgroundEstimator(PTS:%.2f) Reset background model due to past timestamp %.2f", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    return 1;
  }
  v53 = (CMTime)*a4;
  -[HMIBackgroundEstimator backgroundTimeStamp](self, "backgroundTimeStamp");
  -[HMIBackgroundEstimator backgroundExpireInterval](self, "backgroundExpireInterval");
  CMTimeAdd(&v52, &lhs, &rhs);
  if (CMTimeCompare(&v53, &v52) >= 1)
  {
    -[HMIBackgroundEstimator motionDetections](self, "motionDetections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hmf_isEmpty");

    if (v8)
    {
      v9 = (void *)MEMORY[0x220735570]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        time = (CMTime)*a4;
        v13 = CMTimeGetSeconds(&time);
        -[HMIBackgroundEstimator backgroundTimeStamp](v10, "backgroundTimeStamp");
        v14 = CMTimeGetSeconds(&v48);
        *(_DWORD *)buf = 138543874;
        v59 = v12;
        v60 = 2048;
        v61 = v13;
        v62 = 2048;
        v63 = v14;
        _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_DEBUG, "%{public}@BackgroundEstimator(PTS:%.2f) Reset outdated background model %.2f", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      return 1;
    }
  }
  -[HMIBackgroundEstimator imageSize](self, "imageSize");
  v16 = v15;
  if (v18 != HMICVPixelBufferGetSize(a3) || v16 != v17)
  {
    v35 = (void *)MEMORY[0x220735570]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (CMTime)*a4;
      v39 = CMTimeGetSeconds(&v47);
      *(_DWORD *)buf = 138543618;
      v59 = v38;
      v60 = 2048;
      v61 = v39;
      _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_DEBUG, "%{public}@BackgroundEstimator(PTS:%.2f) Reset background model due to image size change", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    return 1;
  }
  v46 = (CMTime)*a4;
  -[HMIBackgroundEstimator backgroundChangeTimeStamp](self, "backgroundChangeTimeStamp");
  -[HMIBackgroundEstimator backgroundChangeResetInterval](self, "backgroundChangeResetInterval");
  CMTimeAdd(&v45, &v44, &v43);
  if (CMTimeCompare(&v46, &v45) >= 1)
  {
    -[HMIBackgroundEstimator motionDetections](self, "motionDetections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hmf_isEmpty");

    if (v20)
    {
      v21 = (void *)MEMORY[0x220735570]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (CMTime)*a4;
        v25 = CMTimeGetSeconds(&v42);
        *(_DWORD *)buf = 138543618;
        v59 = v24;
        v60 = 2048;
        v61 = v25;
        _os_log_impl(&dword_219D45000, v23, OS_LOG_TYPE_INFO, "%{public}@BackgroundEstimator(PTS:%.2f) Reset background model due to very large foreground object", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      -[HMIBackgroundEstimator backgroundTimeStamp](v22, "backgroundTimeStamp");
      v26 = CMTimeGetSeconds(&v41);
      -[HMIBackgroundEstimator configuration](v22, "configuration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "camera");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMIAnalytics videoPackageAnalyzerDidResetReferenceImageWithInterval:camera:](HMIAnalytics, "videoPackageAnalyzerDidResetReferenceImageWithInterval:camera:", v28, v26);

      return 1;
    }
  }
  return 0;
}

- (BOOL)_updateBackgroundFromPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t i;
  unint64_t v12;
  float *v13;
  float *v14;
  double v15;
  unint64_t v16;
  void *v18;
  HMIBackgroundEstimator *v19;
  NSObject *v20;
  void *v21;
  Float64 Seconds;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  CMTime time;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  Float64 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_runningMean && self->_runningStd)
  {
    v23 = *a4;
    -[HMIBackgroundEstimator setBackgroundTimeStamp:](self, "setBackgroundTimeStamp:", &v23);
    -[HMIBackgroundEstimator modelSize](self, "modelSize");
    v8 = v7;
    -[HMIBackgroundEstimator modelSize](self, "modelSize");
    v10 = malloc_type_malloc(4 * (unint64_t)(v8 * 3.0 * v9), 0x100004052888210uLL);
    for (i = 0; i != 5; ++i)
    {
      -[HMIBackgroundEstimator _copyFromPixelBuffer:toInputBuffer:translateCol:translateRow:](self, "_copyFromPixelBuffer:toInputBuffer:translateCol:translateRow:", a3, v10, kHMIBackgroundEstimatorTranslateCol[i], kHMIBackgroundEstimatorTranslateRow[i]);
      v12 = -[HMIBackgroundEstimator numImages](self, "numImages");
      v13 = -[HMIBackgroundEstimator runningMean](self, "runningMean");
      v14 = -[HMIBackgroundEstimator runningStd](self, "runningStd");
      *(float *)&v15 = (float)(i + 5 * v12) / (float)((float)(i + 5 * v12) + 1.0);
      -[HMIBackgroundEstimator _updateRunningMean:runningSquaredMean:fromInputBuffer:decay:](self, "_updateRunningMean:runningSquaredMean:fromInputBuffer:decay:", v13, v14, v10, v15);
    }
    ++self->_numImages;
    v16 = -[HMIBackgroundEstimator numImages](self, "numImages");
    if (v16 == -[HMIBackgroundEstimator minSampleSize](self, "minSampleSize"))
      -[HMIBackgroundEstimator _updateRunningStd:withAuxBuffer:runningMean:runningSquaredMean:](self, "_updateRunningStd:withAuxBuffer:runningMean:runningSquaredMean:", -[HMIBackgroundEstimator runningStd](self, "runningStd"), v10, -[HMIBackgroundEstimator runningMean](self, "runningMean"), -[HMIBackgroundEstimator runningStd](self, "runningStd"));
    free(v10);
    return 1;
  }
  else
  {
    v18 = (void *)MEMORY[0x220735570]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2048;
      v28 = Seconds;
      _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_ERROR, "%{public}@BackgroundEstimator(PTS:%.2f) Unable to alloc buffer", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    return 0;
  }
}

- (id)_predictForegroundFromPixelBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4
{
  double v7;
  double v8;
  double v9;
  void *v10;
  unsigned __int16 *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMIBackgroundEstimator *v18;
  NSObject *v19;
  void *v20;
  Float64 Seconds;
  void *v22;
  __int128 v24;
  int64_t v25;
  __int128 v26;
  int64_t v27;
  __int128 v28;
  int64_t v29;
  __int128 v30;
  int64_t v31;
  __int128 v32;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v34;
  CMTime time;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  Float64 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (self->_runningMean && self->_runningStd && self->_assignment)
  {
    v34 = *a4;
    -[HMIBackgroundEstimator _expireMotionDetectionsAtTimeStamp:](self, "_expireMotionDetectionsAtTimeStamp:", &v34);
    v32 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[HMIBackgroundEstimator setForegroundTimeStamp:](self, "setForegroundTimeStamp:", &v32);
    -[HMIBackgroundEstimator modelSize](self, "modelSize");
    v8 = v7;
    -[HMIBackgroundEstimator modelSize](self, "modelSize");
    v10 = malloc_type_calloc((unint64_t)(v8 * v9), 1uLL, 0x100004077774924uLL);
    -[HMIBackgroundEstimator _foregroundPixelsFromPixelBuffer:attribute:assignment:useChromaOnly:](self, "_foregroundPixelsFromPixelBuffer:attribute:assignment:useChromaOnly:", a3, v10, -[HMIBackgroundEstimator assignment](self, "assignment"), -[HMIBackgroundEstimator adjustBrightness](self, "adjustBrightness"));
    v11 = -[HMIBackgroundEstimator assignment](self, "assignment");
    v30 = *(_OWORD *)&a4->var0;
    v31 = a4->var3;
    -[HMIBackgroundEstimator _blobsFromAssignment:timeStamp:](self, "_blobsFromAssignment:timeStamp:", v11, &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    buf[0] = 0;
    -[HMIBackgroundEstimator _foregroundBlobsFromBlobs:backgroundChanged:](self, "_foregroundBlobsFromBlobs:backgroundChanged:", v12, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIBackgroundEstimator tracks](self, "tracks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIBackgroundEstimator inactiveTracks](self, "inactiveTracks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_OWORD *)&a4->var0;
    v29 = a4->var3;
    -[HMIBackgroundEstimator _updateCurrentTracks:inactiveTracks:blobs:timeStamp:](self, "_updateCurrentTracks:inactiveTracks:blobs:timeStamp:", v14, v15, v13, &v28);

    v26 = *(_OWORD *)&a4->var0;
    v27 = a4->var3;
    LODWORD(v14) = -[HMIBackgroundEstimator _adjustBackgroundAtAttribute:backgroundChanged:timeStamp:](self, "_adjustBackgroundAtAttribute:backgroundChanged:timeStamp:", v10, buf[0], &v26);
    free(v10);
    if ((_DWORD)v14)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMIBackgroundEstimator tracks](self, "tracks");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_OWORD *)&a4->var0;
      v25 = a4->var3;
      -[HMIBackgroundEstimator _stationaryTracks:timeStamp:](self, "_stationaryTracks:timeStamp:", v22, &v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x220735570]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      v38 = 2048;
      v39 = Seconds;
      _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_ERROR, "%{public}@BackgroundEstimator(PTS:%.2f) No background model", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (BOOL)_adjustBackgroundAtAttribute:(const char *)a3 backgroundChanged:(BOOL)a4 timeStamp:(id *)a5
{
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  if (!a4)
  {
    v13 = *a5;
    -[HMIBackgroundEstimator setBackgroundChangeTimeStamp:](self, "setBackgroundChangeTimeStamp:", &v13);
  }
  if (!-[HMIBackgroundEstimator adjustBrightness](self, "adjustBrightness", a3))
  {
    time1 = (CMTime)*a5;
    -[HMIBackgroundEstimator backgroundChangeTimeStamp](self, "backgroundChangeTimeStamp");
    -[HMIBackgroundEstimator backgroundChangeInterval](self, "backgroundChangeInterval");
    CMTimeAdd(&time2, &lhs, &rhs);
    if (CMTimeCompare(&time1, &time2) >= 1)
      -[HMIBackgroundEstimator setAdjustBrightness:](self, "setAdjustBrightness:", 1);
  }
  return a4 & ~-[HMIBackgroundEstimator adjustBrightness](self, "adjustBrightness");
}

- (void)_expireMotionDetectionsAtTimeStamp:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int32_t v9;
  void *v10;
  void *v11;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;

  while (1)
  {
    -[HMIBackgroundEstimator motionTimeStamps](self, "motionTimeStamps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hmf_isEmpty"))
      break;
    time1 = (CMTime)*a3;
    -[HMIBackgroundEstimator motionTimeStamps](self, "motionTimeStamps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "CMTimeValue");
    else
      memset(&lhs, 0, sizeof(lhs));
    -[HMIBackgroundEstimator motionValidInterval](self, "motionValidInterval");
    CMTimeAdd(&time2, &lhs, &rhs);
    v9 = CMTimeCompare(&time1, &time2);

    if (v9 < 1)
      return;
    -[HMIBackgroundEstimator motionTimeStamps](self, "motionTimeStamps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_removeFirstObject");

    -[HMIBackgroundEstimator motionDetections](self, "motionDetections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_removeFirstObject");

  }
}

- (id)_foregroundBlobsFromBlobs:(id)a3 backgroundChanged:(BOOL *)a4
{
  id v5;
  __int128 v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;

  v5 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x5012000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v11[5] = &unk_219EC7149;
  v6 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v12 = *MEMORY[0x24BDBF070];
  v13 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__HMIBackgroundEstimator__foregroundBlobsFromBlobs_backgroundChanged___block_invoke;
  v10[3] = &unk_24DBEA660;
  v10[4] = v11;
  objc_msgSend(v5, "na_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  *a4 = v8 < objc_msgSend(v5, "count");
  _Block_object_dispose(v11, 8);

  return v7;
}

BOOL __70__HMIBackgroundEstimator__foregroundBlobsFromBlobs_backgroundChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;
  CGRect v19;
  CGRect v20;

  v3 = a2;
  v4 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = v4[6];
  v6 = v4[7];
  v7 = v4[8];
  v8 = v4[9];
  objc_msgSend(v3, "boundingBox");
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  v19.origin.x = v5;
  v19.origin.y = v6;
  v19.size.width = v7;
  v19.size.height = v8;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = CGRectUnion(v19, v20);
  objc_msgSend(v3, "boundingBox");
  v17 = HMICGRectArea(v13, v14, v15, v16) < 0.600000024;

  return v17;
}

- (void)_updateCurrentTracks:(id)a3 inactiveTracks:(id)a4 blobs:(id)a5 timeStamp:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;

  v10 = a3;
  v32 = a4;
  v31 = a5;
  v33 = v10;
  objc_msgSend(v10, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke;
  v50[3] = &unk_24DBEA6B0;
  v13 = v27;
  v51 = v13;
  v14 = v11;
  v52 = v14;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v50);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v31, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v12;
  v45[1] = 3221225472;
  v45[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_3;
  v45[3] = &unk_24DBEA6D8;
  v17 = v30;
  v46 = v17;
  v18 = v15;
  v47 = v18;
  v19 = v28;
  v48 = v19;
  v20 = v13;
  v49 = v20;
  objc_msgSend(v16, "na_each:", v45);

  v40[0] = v12;
  v40[1] = 3221225472;
  v40[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_4;
  v40[3] = &unk_24DBEA700;
  v21 = v19;
  v41 = v21;
  v44 = *a6;
  v22 = v32;
  v42 = v22;
  v23 = v33;
  v43 = v23;
  objc_msgSend(v17, "enumerateIndexesUsingBlock:", v40);
  v37[0] = v12;
  v37[1] = 3221225472;
  v37[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_5;
  v37[3] = &unk_24DBEA728;
  v37[4] = self;
  v29 = v23;
  v38 = v29;
  v24 = v20;
  v39 = v24;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v37);
  objc_msgSend(v22, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  v34[1] = 3221225472;
  v34[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_6;
  v34[3] = &unk_24DBEA750;
  v36 = *a6;
  v26 = v22;
  v35 = v26;
  objc_msgSend(v25, "na_each:", v34);

}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_2;
  v8[3] = &unk_24DBEA688;
  v9 = v5;
  v6 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = a3;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  float v5;
  float v6;
  void *v7;
  HMIPairwiseMatch *v8;
  double v9;
  HMIPairwiseMatch *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "similarityToBlob:");
  v6 = v5;
  if (v5 > 0.0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = [HMIPairwiseMatch alloc];
    *(float *)&v9 = v6;
    v10 = -[HMIPairwiseMatch initWithFirstIndex:secondIndex:score:](v8, "initWithFirstIndex:secondIndex:score:", *(_QWORD *)(a1 + 48), a3, v9);
    objc_msgSend(v7, "addObject:", v10);

  }
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_3(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(a1[4], "containsIndex:", objc_msgSend(v5, "firstIndex"))
    && objc_msgSend(a1[5], "containsIndex:", objc_msgSend(v5, "secondIndex")))
  {
    objc_msgSend(a1[6], "objectAtIndexedSubscript:", objc_msgSend(v5, "firstIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "objectAtIndexedSubscript:", objc_msgSend(v5, "secondIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendBlob:", v4);

    objc_msgSend(a1[4], "removeIndex:", objc_msgSend(v5, "firstIndex"));
    objc_msgSend(a1[5], "removeIndex:", objc_msgSend(v5, "secondIndex"));
  }

}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 72);
  v5 = objc_msgSend(v4, "isLostAtTimeStamp:", &v15);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "trackIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v10);

    v11 = *(void **)(a1 + 48);
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "trackIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v14);

  }
}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  HMIVideoAnalyzerTrack *v6;
  HMIVideoAnalyzerTrack *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "numTracks");
  objc_msgSend(v4, "setNumTracks:", v5 + 1);
  v6 = [HMIVideoAnalyzerTrack alloc];
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[HMIVideoAnalyzerTrack initWithBlob:trackIndex:](v6, "initWithBlob:trackIndex:");
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

void __78__HMIBackgroundEstimator__updateCurrentTracks_inactiveTracks_blobs_timeStamp___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v3 = a2;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  if (objc_msgSend(v3, "isExpiredAtTimeStamp:", &v6))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "trackIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v5);

  }
}

- (id)_stationaryTracks:(id)a3 timeStamp:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a3, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke;
  v14[3] = &__block_descriptor_56_e31_B16__0__HMIVideoAnalyzerTrack_8l;
  v15 = *a4;
  objc_msgSend(v8, "na_filter:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_2;
  v13[3] = &unk_24DBEA7C0;
  v13[4] = self;
  objc_msgSend(v10, "na_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;

  v3 = a2;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v3, "isStationaryAtTimeStamp:", &v6))
    v4 = objc_msgSend(v3, "isClassified") ^ 1;
  else
    v4 = 0;

  return v4;
}

uint64_t __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "motionDetections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_3;
  v8[3] = &unk_24DBEA798;
  v5 = v3;
  v9 = v5;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __54__HMIBackgroundEstimator__stationaryTracks_timeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL8 v17;
  CGRect v19;
  CGRect v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lastBlob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "rectValue");
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v17 = CGRectIntersectsRect(v19, v20);

  return v17;
}

- (void)_ensureInternalBuffersForPixelBuffer:(__CVBuffer *)a3
{
  size_t v5;
  size_t v6;
  CGFloat v7;
  unsigned __int16 *v8;

  if (!self->_runningMean || !self->_runningStd || !self->_assignment)
  {
    v5 = (CVPixelBufferGetWidth(a3) + 1) >> 1;
    v6 = (CVPixelBufferGetHeight(a3) + 1) >> 1;
    self->_imageSize.width = HMICVPixelBufferGetSize(a3);
    self->_imageSize.height = v7;
    self->_modelSize.width = (double)v5;
    self->_modelSize.height = (double)v6;
    self->_runningMean = (float *)malloc_type_calloc(3 * v6 * v5, 4uLL, 0x100004052888210uLL);
    self->_runningStd = (float *)malloc_type_calloc(3 * v6 * v5, 4uLL, 0x100004052888210uLL);
    v8 = (unsigned __int16 *)malloc_type_malloc(2 * v6 * v5, 0x1000040BDFB0063uLL);
    self->_assignment = v8;
    memset(v8, 2, 2 * v6 * v5);
  }
}

- (void)_copyFromPixelBuffer:(__CVBuffer *)a3 toInputBuffer:(float *)a4 translateCol:(int)a5 translateRow:(int)a6
{
  double v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *BaseAddressOfPlane;
  char *v19;
  uint64_t v20;
  vDSP_Length v21;
  float *v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  int v30;
  char *v31;
  int v32;
  size_t v33;
  CVPixelBufferRef pixelBuffer;
  uint64_t v35;
  size_t BytesPerRowOfPlane;

  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v12 = (unint64_t)v11;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v14 = (unint64_t)v13;
  v15 = (unint64_t)v13 * v12;
  v16 = a5 & ~(a5 >> 31);
  v17 = -a5 & ~(-a5 >> 31);
  if (a5)
    memcpy(a4, self->_runningMean, 12 * v15);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  pixelBuffer = a3;
  v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  if (v16 <= v17)
    v20 = -a5 & ~(-a5 >> 31);
  else
    v20 = a5 & ~(a5 >> 31);
  if (v14)
  {
    v21 = v12 - v20;
    v22 = &a4[v16];
    v23 = v15;
    v24 = v14 - 1;
    v25 = v17;
    v26 = &v19[2 * v17];
    v35 = 2 * v23;
    v27 = 4 * v12;
    v28 = v23;
    v29 = BaseAddressOfPlane;
    v30 = -a6;
    v31 = &v29[2 * v25];
    do
    {
      if (v30 >= v24)
        v32 = v24;
      else
        v32 = v30;
      v33 = BytesPerRowOfPlane * (v32 & ~(v32 >> 31));
      vDSP_vfltu8((const unsigned __int8 *)&v31[2 * v33], 2, v22, 1, v21);
      vDSP_vfltu8((const unsigned __int8 *)&v26[v33], 2, &v22[v28], 1, v21);
      vDSP_vfltu8((const unsigned __int8 *)&v26[v33 + 1], 2, &v22[v35], 1, v21);
      v22 = (float *)((char *)v22 + v27);
      ++v30;
      --v14;
    }
    while (v14);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
}

- (void)_copyFromOutputBuffer:(const float *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  size_t BytesPerRowOfPlane;
  unsigned __int8 *BaseAddressOfPlane;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unint64_t v15;
  unint64_t v16;
  HMIBackgroundEstimator *v17;
  SEL v18;
  id v19;
  unsigned __int16 *v20;
  CVPixelBufferRef pixelBuffer;
  uint64_t v22;
  CGRect v23;

  if (CVPixelBufferGetPixelFormatType(a4) == 875704422)
  {
    -[HMIBackgroundEstimator modelSize](self, "modelSize");
    v8 = v7;
    -[HMIBackgroundEstimator modelSize](self, "modelSize");
    v10 = (unint64_t)v9;
    CVPixelBufferLockBaseAddress(a4, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    pixelBuffer = a4;
    v13 = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 1uLL);
    if (v10)
    {
      v14 = v13;
      v15 = v10 * (unint64_t)v8;
      v22 = 2 * v15;
      v16 = v15;
      do
      {
        vDSP_vfixru8(a3, 1, BaseAddressOfPlane, 2, (unint64_t)v8);
        vDSP_vfixru8(a3, 1, BaseAddressOfPlane + 1, 2, (unint64_t)v8);
        vDSP_vfixru8(a3, 1, &BaseAddressOfPlane[BytesPerRowOfPlane], 2, (unint64_t)v8);
        vDSP_vfixru8(a3, 1, &BaseAddressOfPlane[BytesPerRowOfPlane + 1], 2, (unint64_t)v8);
        vDSP_vfixru8(&a3[v16], 1, v14, 2, (unint64_t)v8);
        vDSP_vfixru8(&a3[v22], 1, v14 + 1, 2, (unint64_t)v8);
        v14 += BytesPerRowOfPlane;
        a3 += (unint64_t)v8;
        BaseAddressOfPlane += 2 * BytesPerRowOfPlane;
        --v10;
      }
      while (v10);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
  else
  {
    v17 = (HMIBackgroundEstimator *)_HMFPreconditionFailure();
    -[HMIBackgroundEstimator _intersectionOverUnionFromBlob:boundingBox:assignment:](v17, v18, v19, v23, v20);
  }
}

- (float)_intersectionOverUnionFromBlob:(id)a3 boundingBox:(CGRect)a4 assignment:(unsigned __int16 *)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat MinX;
  int v17;
  int v18;
  double v19;
  double v20;
  CGFloat MinY;
  double v22;
  int v23;
  double v24;
  double v25;
  double v26;
  CGFloat MaxY;
  int v28;
  double v29;
  int v30;
  int v31;
  uint64_t v32;
  float v33;
  float v34;
  int v35;
  double v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  int64_t v44;
  unsigned __int16 *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  double v55;
  double v56;
  int v57;
  double v58;
  unint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v13 = v12;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v15 = v14;
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  MinX = CGRectGetMinX(v60);
  v17 = (int)v13;
  v18 = (int)v13 - 1;
  v19 = MinX * (double)(int)v13;
  v20 = (double)v18;
  if (v19 > (double)v18)
    v19 = (double)v18;
  v56 = v19;
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  MinY = CGRectGetMinY(v61);
  v22 = (double)(int)v15;
  v23 = (int)v15 - 1;
  v24 = MinY * v22;
  v25 = (double)v23;
  if (v24 > (double)v23)
    v24 = (double)v23;
  v58 = v24;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v26 = CGRectGetMaxX(v62) * (double)v17;
  if (v26 > v20)
    v26 = v20;
  v55 = v26;
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  MaxY = CGRectGetMaxY(v63);
  v28 = (int)fmax(v58, 0.0);
  v29 = MaxY * v22;
  if (v29 > v25)
    v29 = v25;
  v30 = (int)fmax(v29, 0.0);
  v31 = v30 - v28;
  if (v30 < v28)
    v31 = v30 - v28 + 3;
  LODWORD(v32) = v31 >> 2;
  if ((int)v32 <= 1)
    v32 = 1;
  else
    v32 = v32;
  v59 = v32;
  v33 = 0.0;
  v34 = 0.0;
  if ((int)(v28 + (v32 >> 1)) < v30)
  {
    v35 = (int)fmax(v56, 0.0);
    v36 = fmax(v55, 0.0);
    v37 = (int)v36 - v35;
    if ((int)v36 < v35)
      v37 += 3;
    v38 = v37 >> 2;
    if (v38 <= 1)
      v39 = 1;
    else
      v39 = v38;
    v40 = (int)(v35 + (v39 >> 1));
    v57 = (int)v36;
    v41 = (int)v36;
    v42 = (v59 >> 1) + v28;
    v43 = v17;
    v44 = v30;
    v45 = &a5[v42 * v43];
    v46 = 2 * v43 * v59;
    do
    {
      v47 = v40;
      if ((int)v40 < v57)
      {
        do
        {
          v48 = v45[v47];
          if (v48 == objc_msgSend(v11, "blobID"))
            v33 = v33 + 1.0;
          v34 = v34 + 1.0;
          v47 += v39;
        }
        while (v47 < v41);
      }
      v42 += v59;
      v45 = (unsigned __int16 *)((char *)v45 + v46);
    }
    while (v42 < v44);
  }
  objc_msgSend(v11, "blobArea");
  v49 = width * height;
  v50 = (float)(v33 * v49) / v34;
  v52 = (float)(v51 + v49) - v50;
  if (v52 < 0.000000001)
    v52 = 0.000000001;
  v53 = v50 / v52;

  return v53;
}

- (void)_setAssignment:(unsigned __int16 *)a3 greaterThanType:(unsigned __int16)a4 value:(unsigned __int16)a5 boundingBox:(CGRect)a6 scale:(float)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned int v13;
  HMIBackgroundEstimator *v15;
  double v16;
  double v17;
  float v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double MaxX;
  double v26;
  int v27;
  float v28;
  double v29;
  int v30;
  double v31;
  double v32;
  int v33;
  double v34;
  int v35;
  uint64_t v36;
  int v37;
  unsigned __int16 *v38;
  uint64_t v39;
  int v40;
  unsigned __int16 *v41;
  double MinX;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4;
  v15 = self;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v45 = v16;
  -[HMIBackgroundEstimator modelSize](v15, "modelSize");
  LODWORD(v15) = (int)v17;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v44 = CGRectGetWidth(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v43 = a7;
  v18 = CGRectGetHeight(v47) * a7;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinX = CGRectGetMinX(v48);
  v19 = (_DWORD)v15 - 1;
  v20 = (double)(int)v15;
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v21 = v18;
  v22 = (CGRectGetMinY(v49) - v18) * (double)(int)v15;
  v23 = (double)((int)v15 - 1);
  if (v22 > v23)
    v22 = (double)v19;
  v24 = (int)fmax(v22, 0.0);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  MaxX = CGRectGetMaxX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  v26 = (CGRectGetMaxY(v51) + v21) * v20;
  if (v26 > v23)
    v26 = (double)v19;
  v27 = (int)fmax(v26, 0.0);
  if (v24 <= v27)
  {
    v28 = v44 * v43;
    v29 = v28;
    v30 = (int)v45;
    v31 = (MaxX + v29) * (double)(int)v45;
    v32 = (double)((int)v45 - 1);
    if (v31 > v32)
      v31 = (double)(v30 - 1);
    v33 = (int)fmax(v31, 0.0);
    v34 = (MinX - v29) * (double)v30;
    if (v34 > v32)
      v34 = (double)(v30 - 1);
    v35 = (int)fmax(v34, 0.0);
    v36 = v24;
    v37 = v27 + 1;
    v38 = &a3[v35 + v24 * (uint64_t)v30];
    v39 = 2 * v30;
    do
    {
      v40 = v33 - v35 + 1;
      v41 = v38;
      if (v35 <= v33)
      {
        do
        {
          if (*v41 > v13)
            *v41 = a5;
          ++v41;
          --v40;
        }
        while (v40);
      }
      ++v36;
      v38 = (unsigned __int16 *)((char *)v38 + v39);
    }
    while (v37 != (_DWORD)v36);
  }
}

- (void)_updateRunningMean:(float *)a3 runningSquaredMean:(float *)a4 fromInputBuffer:(const float *)a5 decay:(float)a6
{
  double v11;
  double v12;
  double v13;
  vDSP_Length __N;
  float v15;
  float __D;
  float __B;

  __B = a6;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v12 = v11;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  __D = 1.0 - a6;
  if ((float)(1.0 - a6) != 0.0)
  {
    __N = (unint64_t)(v12 * 3.0 * v13);
    vDSP_vsmsma(a3, 1, &__B, a5, 1, &__D, a3, 1, __N);
    v15 = __B / __D;
    vDSP_vsmul(a4, 1, &v15, a4, 1, __N);
    vDSP_vma(a5, 1, a5, 1, a4, 1, a4, 1, __N);
    vDSP_vsmul(a4, 1, &__D, a4, 1, __N);
  }
}

- (void)_updateRunningStd:(float *)a3 withAuxBuffer:(float *)a4 runningMean:(const float *)a5 runningSquaredMean:(const float *)a6
{
  double v11;
  double v12;
  double v13;
  unint64_t __N;
  int v15;
  float v16;
  float __D;
  float __B;

  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v12 = v11 * 3.0;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  __N = (unint64_t)(v12 * v13);
  vDSP_vsq(a5, 1, a4, 1, __N);
  __D = -1.0;
  __B = 1.0;
  vDSP_vsmsma(a6, 1, &__B, a4, 1, &__D, a3, 1, __N);
  v16 = 0.0;
  vDSP_vthr(a3, 1, &v16, a3, 1, __N);
  v15 = __N;
  vvsqrtf(a3, a3, &v15);
}

- (void)_correctRunningMeanBrightnessAtAttribute:(const char *)a3
{
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  char v9;
  float *runningMean;
  float v11;
  float *v12;
  float v13;
  double v14;
  double v15;
  double v16;

  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v6 = v5;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  if ((unint64_t)(v6 * v7))
  {
    v8 = 0;
    do
    {
      v9 = a3[v8];
      if ((v9 & 1) != 0)
      {
        runningMean = self->_runningMean;
        v11 = runningMean[v8] + 15.0;
        if (v11 > 255.0)
          v11 = 255.0;
        runningMean[v8] = fmaxf(v11, 0.0);
        v9 = a3[v8];
      }
      if ((v9 & 2) != 0)
      {
        v12 = self->_runningMean;
        v13 = v12[v8] + -15.0;
        if (v13 > 255.0)
          v13 = 255.0;
        v12[v8] = fmaxf(v13, 0.0);
      }
      ++v8;
      -[HMIBackgroundEstimator modelSize](self, "modelSize");
      v15 = v14;
      -[HMIBackgroundEstimator modelSize](self, "modelSize");
    }
    while (v8 < (unint64_t)(v15 * v16));
  }
}

- (void)_foregroundPixelsFromPixelBuffer:(__CVBuffer *)a3 attribute:(char *)a4 assignment:(unsigned __int16 *)a5 useChromaOnly:(BOOL)a6
{
  _BOOL4 v6;
  size_t BytesPerRowOfPlane;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  _BYTE *BaseAddressOfPlane;
  _BYTE *v19;
  float v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float *runningMean;
  float *runningStd;
  unint64_t v27;
  unint64_t v28;
  float v29;
  char v30;
  unint64_t v31;
  float v32;
  float v33;
  float v34;
  float v35;
  unsigned __int16 v36;

  v6 = a6;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v13 = v12;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v15 = v14;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v17 = (unint64_t)(v15 * v16);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v19 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  if (v17)
  {
    v21 = 0;
    v22 = (unint64_t)v13;
    v23 = v17;
    v24 = 2 * v17;
    do
    {
      if (a5[v21] >= 2u)
      {
        if (v6)
        {
          runningMean = self->_runningMean;
          runningStd = self->_runningStd;
          v27 = v21 / v22 * BytesPerRowOfPlane;
          v28 = v21 % v22;
LABEL_13:
          v31 = v27 + 2 * v28;
          LOBYTE(v20) = v19[v31];
          v32 = (float)LODWORD(v20) - runningMean[v23 + v21];
          if (v32 < 0.0)
            v32 = -v32;
          v33 = runningStd[v23 + v21];
          v20 = v32 + (float)(v33 * -2.0);
          LOBYTE(v33) = v19[v31 + 1];
          v34 = (float)LODWORD(v33) - runningMean[v24 + v21];
          if (v34 < 0.0)
            v34 = -v34;
          v35 = v34 + (float)(runningStd[v24 + v21] * -2.0);
          if (v20 < v35)
            v20 = v35;
          if (v20 <= 6.0)
            v36 = 3;
          else
            v36 = 2;
          a5[v21] = v36;
          goto LABEL_23;
        }
        v27 = v21 / v22 * BytesPerRowOfPlane;
        v28 = v21 % v22;
        LOBYTE(v20) = BaseAddressOfPlane[2 * v27 + 2 * (v21 % v22)];
        runningMean = self->_runningMean;
        v20 = (float)LODWORD(v20) - runningMean[v21];
        v29 = -v20;
        if (v20 >= 0.0)
          v29 = v20;
        runningStd = self->_runningStd;
        if ((float)(v29 + (float)(runningStd[v21] * -2.0)) <= 15.0)
          goto LABEL_13;
        a5[v21] = 2;
        if (v20 > 0.0)
          v30 = 1;
        else
          v30 = 2;
        a4[v21] = v30;
      }
LABEL_23:
      ++v21;
    }
    while (v17 != v21);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
}

- (void)_foregroundDifferencesFromPixelBuffer:(__CVBuffer *)a3 differences:(float *)a4
{
  size_t BytesPerRowOfPlane;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  _BYTE *BaseAddressOfPlane;
  _BYTE *v15;
  float v16;
  unint64_t v17;
  float *runningMean;
  float *runningStd;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;

  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v9 = v8;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v11 = v10;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v13 = (unint64_t)(v11 * v12);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v15 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  if (v13)
  {
    v17 = 0;
    runningMean = self->_runningMean;
    runningStd = self->_runningStd;
    v20 = (unint64_t)v9;
    do
    {
      v21 = v17 / v20 * BytesPerRowOfPlane;
      v22 = v21 + 2 * (v17 % v20);
      LOBYTE(v16) = BaseAddressOfPlane[2 * v21 + 2 * (v17 % v20)];
      v23 = (float)LODWORD(v16) - runningMean[v17];
      if (v23 < 0.0)
        v23 = -v23;
      v24 = runningStd[v17];
      v25 = v23 + (float)(v24 * -2.0);
      LOBYTE(v24) = v15[v22];
      v26 = (float)LODWORD(v24) - runningMean[v13 + v17];
      if (v26 < 0.0)
        v26 = -v26;
      v27 = runningStd[v13 + v17];
      v28 = v26 + (float)(v27 * -2.0);
      LOBYTE(v27) = v15[v22 + 1];
      v29 = (float)LODWORD(v27) - runningMean[2 * v13 + v17];
      if (v29 < 0.0)
        v29 = -v29;
      v30 = v29 + (float)(runningStd[2 * v13 + v17] * -2.0);
      v31 = v25 + -15.0;
      if (v31 < 0.0)
        v31 = 0.0;
      a4[v17] = v31;
      v32 = v28 + -6.0;
      if ((float)(v28 + -6.0) < 0.0)
        v32 = 0.0;
      a4[v13 + v17] = v32;
      v16 = v30 + -6.0;
      if ((float)(v30 + -6.0) < 0.0)
        v16 = 0.0;
      a4[2 * v13 + v17++] = v16;
    }
    while (v13 != v17);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
}

- (id)_blobsFromAssignment:(unsigned __int16 *)a3 timeStamp:(id *)a4
{
  HMIBackgroundEstimator *v5;
  unsigned __int8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  __n128 *v16;
  uint64_t v17;
  __n128 *v18;
  __n128 *v19;
  __n128 *v20;
  __n128 *v21;
  double *v22;
  double v23;
  double v24;
  double *v25;
  double *v26;
  int v27;
  int v28;
  int v29;
  __n128 *v30;
  __n128 *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  __n128 *v37;
  __n128 *v38;
  __n128 *v39;
  __n128 *v40;
  double *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __n128 *v56;
  _BYTE *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  HMIVideoAnalyzerBlob *v62;
  double v63;
  HMIVideoAnalyzerBlob *v64;
  void *v65;
  void *v76;
  uint64_t v78;
  __int128 v79;
  int64_t var3;
  __n128 v81;
  __n128 v82;
  void *__p;
  __n128 *v84;
  __n128 *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;

  v5 = self;
  v102 = *MEMORY[0x24BDAC8D0];
  if ((v6 & 1) == 0
  {
    __asm { FMOV            V1.2D, #-1.0 }
    v86 = _Q1;
    v87 = xmmword_219E9CFB0;
    v88 = xmmword_219E9CFC0;
    v89 = xmmword_219E9CFD0;
    v90 = xmmword_219E9CFE0;
    v91 = xmmword_219E9CFF0;
    __asm { FMOV            V1.2D, #1.0 }
    v92 = xmmword_219E9D000;
    v93 = _Q1;
    __asm { FMOV            V0.2D, #-3.0 }
    v94 = _Q0;
    v95 = xmmword_219E9D010;
    v96 = xmmword_219E9D020;
    v97 = xmmword_219E9D030;
    v98 = xmmword_219E9D040;
    v99 = xmmword_219E9D050;
    __asm { FMOV            V1.2D, #3.0 }
    v100 = xmmword_219E9D060;
    v101 = _Q1;
    std::vector<CGPoint>::vector[abi:ne180100](&-[HMIBackgroundEstimator _blobsFromAssignment:timeStamp:]::neighbors, &v86, 0x10uLL);
    v5 = self;
  }
  -[HMIBackgroundEstimator modelSize](v5, "modelSize");
  v8 = v7;
  -[HMIBackgroundEstimator modelSize](v5, "modelSize");
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)v8;
  v12 = (int)v10;
  v13 = ((int)v10 * (int)v8);
  if ((int)v13 >= 1)
  {
    v14 = 0;
    v15 = 5;
    do
    {
      if (a3[v14] == 2)
      {
        __p = 0;
        v84 = 0;
        v85 = 0;
        v87 = 0u;
        v88 = 0u;
        v86 = 0u;
        v82.n128_f64[0] = (double)((int)v14 % v11);
        v82.n128_f64[1] = (double)((int)v14 / v11);
        v16 = (__n128 *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v85, 1uLL);
        *v16 = v82;
        v19 = (__n128 *)__p;
        v18 = v84;
        v20 = v16;
        if (v84 != __p)
        {
          do
          {
            v20[-1] = v18[-1];
            --v20;
            --v18;
          }
          while (v18 != v19);
          v18 = (__n128 *)__p;
        }
        v21 = v16 + 1;
        __p = v20;
        v84 = v16 + 1;
        v85 = &v16[v17];
        if (v18)
          operator delete(v18);
        v84 = v21;
        std::deque<CGPoint>::push_back(&v86, &v82);
        v78 = v14;
        a3[(int)v82.n128_f64[0] + (int)v82.n128_f64[1] * v11] = 4;
        while (*((_QWORD *)&v88 + 1))
        {
          v22 = (double *)(*(_QWORD *)(*((_QWORD *)&v86 + 1) + (((unint64_t)v88 >> 5) & 0x7FFFFFFFFFFFFF8))
                         + 16 * v88);
          v23 = *v22;
          v24 = v22[1];
          *(_QWORD *)&v88 = v88 + 1;
          --*((_QWORD *)&v88 + 1);
          if ((unint64_t)v88 >= 0x200)
          {
            operator delete(**((void ***)&v86 + 1));
            *((_QWORD *)&v86 + 1) += 8;
            *(_QWORD *)&v88 = v88 - 256;
          }
          a3[(int)v23 + (int)v24 * v11] = v15;
          v26 = (double *)-[HMIBackgroundEstimator _blobsFromAssignment:timeStamp:]::neighbors;
          v25 = *(double **)algn_2550B96F0;
          while (v26 != v25)
          {
            v27 = (int)(v23 + (double)(int)*v26);
            if ((v27 & 0x80000000) == 0 && v27 < v11)
            {
              v28 = (int)(v24 + (double)(int)v26[1]);
              if ((v28 & 0x80000000) == 0 && v28 < v12)
              {
                v29 = v27 + v28 * v11;
                if (a3[v29] == 2)
                {
                  v81.n128_f64[0] = (double)v27;
                  v81.n128_f64[1] = (double)v28;
                  v30 = v84;
                  if (v84 >= v85)
                  {
                    v32 = ((char *)v84 - (_BYTE *)__p) >> 4;
                    v33 = v32 + 1;
                    if ((unint64_t)(v32 + 1) >> 60)
                      std::vector<int>::__throw_length_error[abi:ne180100]();
                    v34 = (char *)v85 - (_BYTE *)__p;
                    if (((char *)v85 - (_BYTE *)__p) >> 3 > v33)
                      v33 = v34 >> 3;
                    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
                      v35 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v35 = v33;
                    if (v35)
                      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v85, v35);
                    else
                      v36 = 0;
                    v37 = (__n128 *)&v36[16 * v32];
                    *v37 = v81;
                    v39 = (__n128 *)__p;
                    v38 = v84;
                    v40 = v37;
                    if (v84 != __p)
                    {
                      do
                      {
                        v40[-1] = v38[-1];
                        --v40;
                        --v38;
                      }
                      while (v38 != v39);
                      v38 = (__n128 *)__p;
                    }
                    v31 = v37 + 1;
                    __p = v40;
                    v84 = v37 + 1;
                    v85 = (__n128 *)&v36[16 * v35];
                    if (v38)
                      operator delete(v38);
                  }
                  else
                  {
                    *v84 = v81;
                    v31 = v30 + 1;
                  }
                  v84 = v31;
                  std::deque<CGPoint>::push_back(&v86, &v81);
                  a3[v29] = 4;
                }
              }
            }
            v26 += 2;
          }
        }
        v41 = (double *)__p;
        if ((unint64_t)((char *)v84 - (_BYTE *)__p) >= 0x90)
        {
          if (__p == v84)
          {
            v43 = 0;
            v42 = 0;
            v44 = v12 - 1;
            v45 = v11 - 1;
          }
          else
          {
            v42 = 0;
            v43 = 0;
            v44 = v12 - 1;
            v45 = v11 - 1;
            do
            {
              v46 = *v41;
              v47 = v41[1];
              v41 += 2;
              if (v42 <= (int)v46)
                v42 = (int)v46;
              if (v43 <= (int)v47)
                v43 = (int)v47;
              if (v45 >= (int)v46)
                v45 = (int)v46;
              if (v44 >= (int)v47)
                v44 = (int)v47;
            }
            while (v41 != (double *)v84);
          }
          HMICGRectNormalizedFromPixel(v11, v12, (double)v45, (double)v44, (double)(v42 - v45 + 1), (double)(v43 - v44 + 1));
          v49 = v48;
          v51 = v50;
          v53 = v52;
          v55 = v54;
          v57 = __p;
          v56 = v84;
          -[HMIBackgroundEstimator modelSize](self, "modelSize");
          v59 = v58;
          -[HMIBackgroundEstimator modelSize](self, "modelSize");
          v61 = v60;
          v62 = [HMIVideoAnalyzerBlob alloc];
          *(float *)&v63 = (float)(unint64_t)(((char *)v56 - v57) >> 4) / (v59 * v61);
          v79 = *(_OWORD *)&a4->var0;
          var3 = a4->var3;
          v64 = -[HMIVideoAnalyzerBlob initWithBoundingBox:timeStamp:blobArea:blobID:](v62, "initWithBoundingBox:timeStamp:blobArea:blobID:", &v79, v15, v49, v51, v53, v55, v63);
          objc_msgSend(v76, "addObject:", v64);

        }
        std::deque<CGPoint>::~deque[abi:ne180100](&v86);
        v14 = v78;
        if (__p)
        {
          v84 = (__n128 *)__p;
          operator delete(__p);
        }
        ++v15;
        v13 = (v12 * v11);
      }
      ++v14;
    }
    while (v14 != v13);
  }
  v65 = (void *)objc_msgSend(v76, "copy");

  return v65;
}

- (id)visualizeBackgroundMean
{
  return -[HMIBackgroundEstimator _exportInternalStateForPixelBuffer:exportMode:](self, "_exportInternalStateForPixelBuffer:exportMode:", 0, 0);
}

- (id)visualizeBackgroundStd
{
  return -[HMIBackgroundEstimator _exportInternalStateForPixelBuffer:exportMode:](self, "_exportInternalStateForPixelBuffer:exportMode:", 0, 1);
}

- (id)visualizeForegroundDiffForPixelBuffer:(__CVBuffer *)a3
{
  return -[HMIBackgroundEstimator _exportInternalStateForPixelBuffer:exportMode:](self, "_exportInternalStateForPixelBuffer:exportMode:", a3, 2);
}

- (id)visualizeForegroundAssignment
{
  return -[HMIBackgroundEstimator _exportInternalStateForPixelBuffer:exportMode:](self, "_exportInternalStateForPixelBuffer:exportMode:", 0, 3);
}

- (id)_exportInternalStateForPixelBuffer:(__CVBuffer *)a3 exportMode:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __CVBuffer *v14;
  HMIVideoFrame *v15;
  HMIVideoFrame *v16;
  unint64_t v17;
  float *v18;
  float *v19;
  float *v20;
  uint64_t i;
  float __A;
  __int128 v24;
  uint64_t v25;
  CMTime time2;
  CMTime time1;
  __int128 v28;
  uint64_t v29;

  v28 = 0uLL;
  v29 = 0;
  -[HMIBackgroundEstimator foregroundTimeStamp](self, "foregroundTimeStamp");
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  if (CMTimeCompare(&time1, &time2))
    -[HMIBackgroundEstimator foregroundTimeStamp](self, "foregroundTimeStamp");
  else
    -[HMIBackgroundEstimator backgroundTimeStamp](self, "backgroundTimeStamp");
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v8 = v7;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v10 = v9;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v12 = v11 + v11;
  -[HMIBackgroundEstimator modelSize](self, "modelSize");
  v14 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 875704422, 0, (double)(unint64_t)v12, (double)(unint64_t)(v13 + v13));
  if (v14)
  {
    v15 = [HMIVideoFrame alloc];
    v24 = v28;
    v25 = v29;
    v16 = -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](v15, "initWithPixelBuffer:presentationTimeStamp:", v14, &v24);
    CVPixelBufferRelease(v14);
  }
  else
  {
    v16 = 0;
  }
  if (-[HMIBackgroundEstimator runningMean](self, "runningMean")
    && -[HMIBackgroundEstimator runningStd](self, "runningStd")
    && -[HMIBackgroundEstimator assignment](self, "assignment"))
  {
    v17 = (unint64_t)(v8 * v10);
    switch(a4)
    {
      case 0uLL:
        v18 = -[HMIBackgroundEstimator runningMean](self, "runningMean");
        goto LABEL_15;
      case 1uLL:
        v18 = -[HMIBackgroundEstimator runningStd](self, "runningStd");
LABEL_15:
        v20 = v18;
        v19 = 0;
        break;
      case 2uLL:
        v19 = (float *)malloc_type_calloc(3 * v17, 4uLL, 0x100004052888210uLL);
        -[HMIBackgroundEstimator _foregroundDifferencesFromPixelBuffer:differences:](self, "_foregroundDifferencesFromPixelBuffer:differences:", a3, v19);
        v20 = v19;
        break;
      case 3uLL:
        v19 = (float *)malloc_type_calloc(3 * v17, 4uLL, 0x100004052888210uLL);
        __A = 128.0;
        vDSP_vfill(&__A, &v19[v17], 1, 2 * v17);
        if (v17)
        {
          for (i = 0; i != v17; ++i)
          {
            if (-[HMIBackgroundEstimator assignment](self, "assignment")[2 * i] >= 5u)
              v19[i] = 255.0;
            if (-[HMIBackgroundEstimator assignment](self, "assignment")[2 * i] == 1)
              v19[2 * v17 + i] = 255.0;
            if (!-[HMIBackgroundEstimator assignment](self, "assignment")[2 * i])
              v19[v17 + i] = 255.0;
          }
        }
        v20 = v19;
        break;
      default:
        v19 = 0;
        v20 = 0;
        break;
    }
    -[HMIBackgroundEstimator _copyFromOutputBuffer:toPixelBuffer:](self, "_copyFromOutputBuffer:toPixelBuffer:", v20, v14);
    if (v19)
      free(v19);
  }
  return v16;
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)tracks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)inactiveTracks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)minSampleSize
{
  return self->_minSampleSize;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundExpireInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundExpireInterval, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundChangeInterval, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeResetInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundChangeResetInterval, 24, 1, 0);
  return result;
}

- (unsigned)assignment
{
  return self->_assignment;
}

- (void)setAssignment:(unsigned __int16 *)a3
{
  self->_assignment = a3;
}

- (float)runningMean
{
  return self->_runningMean;
}

- (void)setRunningMean:(float *)a3
{
  self->_runningMean = a3;
}

- (float)runningStd
{
  return self->_runningStd;
}

- (void)setRunningStd:(float *)a3
{
  self->_runningStd = a3;
}

- (unint64_t)numImages
{
  return self->_numImages;
}

- (void)setNumImages:(unint64_t)a3
{
  self->_numImages = a3;
}

- (unint64_t)numTracks
{
  return self->_numTracks;
}

- (void)setNumTracks:(unint64_t)a3
{
  self->_numTracks = a3;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (CGSize)modelSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_modelSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setModelSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_modelSize, &v3, 16, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)foregroundTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_foregroundTimeStamp, 24, 1, 0);
  return result;
}

- (void)setForegroundTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_foregroundTimeStamp, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundTimeStamp, 24, 1, 0);
  return result;
}

- (void)setBackgroundTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_backgroundTimeStamp, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundChangeTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundChangeTimeStamp, 24, 1, 0);
  return result;
}

- (void)setBackgroundChangeTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_backgroundChangeTimeStamp, a3, 24, 1, 0);
}

- (BOOL)adjustBrightness
{
  return self->_adjustBrightness;
}

- (void)setAdjustBrightness:(BOOL)a3
{
  self->_adjustBrightness = a3;
}

- (NSMutableArray)motionDetections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)motionTimeStamps
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)motionValidInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_motionValidInterval, 24, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionTimeStamps, 0);
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_inactiveTracks, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
