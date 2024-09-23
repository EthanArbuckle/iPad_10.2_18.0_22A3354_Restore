@implementation HMIVideoTemporalEventFilter

- (HMIVideoTemporalEventFilter)init
{
  HMIVideoTemporalEventFilter *v2;
  uint64_t v3;
  NSMutableArray *stationaryObjects;
  __int128 v5;
  uint64_t v6;
  NSDictionary *targetEventClassRanks;
  CMTime v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoTemporalEventFilter;
  v2 = -[HMIVideoTemporalEventFilter init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    stationaryObjects = v2->_stationaryObjects;
    v2->_stationaryObjects = (NSMutableArray *)v3;

    CMTimeMakeWithSeconds(&v9, 10.0, 1000);
    v5 = *(_OWORD *)&v9.value;
    v2->_timeInterval.epoch = v9.epoch;
    *(_OWORD *)&v2->_timeInterval.value = v5;
    v11[0] = objc_opt_class();
    v12[0] = &unk_24DC14840;
    v11[1] = objc_opt_class();
    v12[1] = &unk_24DC14858;
    v11[2] = objc_opt_class();
    v12[2] = &unk_24DC14870;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    targetEventClassRanks = v2->_targetEventClassRanks;
    v2->_targetEventClassRanks = (NSDictionary *)v6;

  }
  return v2;
}

- (id)applyFilterWithFrameResult:(id)a3 motionDetection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  HMIVideoAnalyzerFrameResult *v29;
  void *v30;
  void *v31;
  HMIVideoAnalyzerFrameResult *v32;
  _QWORD v34[5];
  CMTime v35;
  CMTime lhs;
  CMTime rhs;
  CMTime v38;
  CMTime v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[6];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke;
  v42[3] = &unk_24DBED300;
  v42[4] = self;
  objc_msgSend(v8, "na_filter:", v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "events");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v9;
  v41[1] = 3221225472;
  v41[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_2;
  v41[3] = &unk_24DBED300;
  v41[4] = self;
  objc_msgSend(v12, "na_filter:", v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v9;
  v40[1] = 3221225472;
  v40[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_3;
  v40[3] = &unk_24DBED328;
  v40[4] = self;
  objc_msgSend(v13, "sortedArrayUsingComparator:", v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v39, 0, sizeof(v39));
  objc_msgSend(v6, "frame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "presentationTimeStamp");
  else
    memset(&v39, 0, sizeof(v39));

  memset(&v38, 0, sizeof(v38));
  -[HMIVideoTemporalEventFilter timeInterval](self, "timeInterval");
  lhs = v39;
  CMTimeSubtract(&v38, &lhs, &rhs);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoTemporalEventFilter _filterEvents:stationaryEvents:motionDetection:](self, "_filterEvents:stationaryEvents:motionDetection:", v14, v17, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoTemporalEventFilter stationaryObjects](self, "stationaryObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");
  lhs = v38;
  -[HMIVideoTemporalEventFilter _filterEvents:stationaryEvents:stationaryObjects:expirationPTS:imageSize:](self, "_filterEvents:stationaryEvents:stationaryObjects:expirationPTS:imageSize:", v18, v17, v19, &lhs);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoTemporalEventFilter prevFrameResult](self, "prevFrameResult");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[HMIVideoTemporalEventFilter prevFrameResult](self, "prevFrameResult");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionOfInterest");
    lhs = v38;
    v25 = -[HMIVideoTemporalEventFilter _resetPreviousFrameResult:expirationPTS:regionOfInterest:](self, "_resetPreviousFrameResult:expirationPTS:regionOfInterest:", v24, &lhs);

    if (v25)
      -[HMIVideoTemporalEventFilter setPrevFrameResult:](self, "setPrevFrameResult:", 0);
  }
  -[HMIVideoTemporalEventFilter prevFrameResult](self, "prevFrameResult");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regionOfInterest");
  -[HMIVideoTemporalEventFilter _filterEvents:stationaryEvents:motionDetection:prevFrameResult:regionOfInterest:](self, "_filterEvents:stationaryEvents:motionDetection:prevFrameResult:regionOfInterest:", v21, v17, v7, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "redactedCopy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoTemporalEventFilter setPrevFrameResult:](self, "setPrevFrameResult:", v28);

  v34[0] = v9;
  v34[1] = 3221225472;
  v34[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_4;
  v34[3] = &unk_24DBED350;
  v34[4] = self;
  v35 = v39;
  objc_msgSend(v17, "na_each:", v34);
  v29 = [HMIVideoAnalyzerFrameResult alloc];
  objc_msgSend(v6, "frame");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromArray:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regionOfInterest");
  v32 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v29, "initWithFrame:events:regionOfInterest:", v30, v31);

  return v32;
}

BOOL __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "targetEventClassRanks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

BOOL __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "targetEventClassRanks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

BOOL __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "targetEventClassRanks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "intValue");
  objc_msgSend(*(id *)(a1 + 32), "targetEventClassRanks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();

  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (int)v7 > (int)objc_msgSend(v13, "intValue");

  return v14;
}

void __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  HMIStationaryObject *v6;
  HMIStationaryObject *v7;
  __int128 v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "stationaryObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HMIStationaryObject alloc];
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v7 = -[HMIStationaryObject initWithEvent:time:](v6, "initWithEvent:time:", v4, &v8);

  objc_msgSend(v5, "addObject:", v7);
}

- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 motionDetection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  HMIVideoTemporalEventFilter *v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __78__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection___block_invoke;
    v13[3] = &unk_24DBED378;
    v14 = v9;
    v15 = self;
    v16 = v8;
    objc_msgSend(a3, "na_filter:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v11;
}

uint64_t __78__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_opt_class();
  objc_msgSend(v3, "confidence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  *(float *)&v16 = v15;
  v17 = objc_msgSend(v4, "applyEventTypeAndCheckIfSubBoundingIsStatic:eventClass:confidence:", v13, v6, v8, v10, v12, v16);

  if (v17)
  {
    v18 = objc_opt_class();
    if (v18 == objc_opt_class())
    {
      v19 = (void *)MEMORY[0x220735570]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Add motion-vector stationary event %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    }
  }

  return v17 ^ 1u;
}

- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 stationaryObjects:(id)a5 expirationPTS:(id *)a6 imageSize:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int32_t v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  HMIVideoTemporalEventFilter *v25;
  id v26;
  CGFloat v27;
  CGFloat v28;
  CMTime time2;
  CMTime time1;

  height = a7.height;
  width = a7.width;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if ((objc_msgSend(v15, "hmf_isEmpty") & 1) == 0)
  {
    do
    {
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        objc_msgSend(v16, "time");
      else
        memset(&time1, 0, sizeof(time1));
      time2 = (CMTime)*a6;
      v18 = CMTimeCompare(&time1, &time2);

      if ((v18 & 0x80000000) == 0)
        break;
      objc_msgSend(v15, "hmf_removeFirstObject");
    }
    while (!objc_msgSend(v15, "hmf_isEmpty"));
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke;
  v23[3] = &unk_24DBED3C8;
  v27 = width;
  v28 = height;
  v24 = v15;
  v25 = self;
  v26 = v14;
  v19 = v14;
  v20 = v15;
  objc_msgSend(v13, "na_filter:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

BOOL __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke_2;
  v15[3] = &unk_24DBED3A0;
  v5 = v3;
  v16 = v5;
  v17 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Replace matched stationary event %@ for %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
  }

  return v6 == 0;
}

BOOL __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  v3 = a2;
  v4 = objc_opt_class();
  objc_msgSend(v3, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingBox");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v3, "event");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingBox");
    v6 = HMICGRectMaxParallelEdgeDistance(v8, v10, v12, v14, v16, v17, v18, v19, *(double *)(a1 + 40), *(double *)(a1 + 48)) < 1.86;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 motionDetection:(id)a5 prevFrameResult:(id)a6 regionOfInterest:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  HMIVideoTemporalEventFilter *v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v17)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_2;
    v20[3] = &unk_24DBED438;
    v21 = v16;
    v25 = x;
    v26 = y;
    v27 = width;
    v28 = height;
    v22 = v17;
    v23 = self;
    v24 = v15;
    objc_msgSend(a3, "na_filter:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a3, "na_filter:", &__block_literal_global_30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

BOOL __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke()
{
  uint64_t v0;

  v0 = objc_opt_class();
  return v0 != objc_opt_class();
}

BOOL __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  float v31;
  void *v32;
  id v33;
  float v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  float v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v3, "boundingBox");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = objc_opt_class();
      objc_msgSend(v3, "confidence");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      *(float *)&v18 = v17;
      objc_msgSend(v6, "scoreForSubBoundingBox:eventClass:confidence:", v15, v8, v10, v12, v14, v18);
      LODWORD(v8) = v19;

      if (*(float *)&v8 <= 15.0)
        goto LABEL_6;
    }
    objc_msgSend(v3, "boundingBox");
    if (HMICGRectMinElementwiseDistance(v20, v21, v22, v23, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88)) < 0.02)
    {
LABEL_6:
      v5 = 0;
    }
    else
    {
      v45 = 0;
      v46 = (float *)&v45;
      v47 = 0x2020000000;
      v48 = 0.0;
      objc_msgSend(*(id *)(a1 + 40), "frame");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "size");
      v26 = v25;

      objc_msgSend(*(id *)(a1 + 40), "frame");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "size");
      v29 = v28;

      if (v26 >= v29)
        v30 = v26;
      else
        v30 = v29;
      v31 = v30;
      v48 = v31;
      objc_msgSend(*(id *)(a1 + 40), "events");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_3;
      v41[3] = &unk_24DBED410;
      v33 = v3;
      v42 = v33;
      v43 = *(id *)(a1 + 40);
      v44 = &v45;
      objc_msgSend(v32, "na_each:", v41);

      v34 = v46[6];
      v5 = v34 >= 1.86;
      if (v34 < 1.86)
      {
        v35 = (void *)MEMORY[0x220735570]();
        v36 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v38 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "shortDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v38;
          v51 = 2112;
          v52 = v39;
          _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Add edge-distance stationary event %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v33);
      }

      _Block_object_dispose(&v45, 8);
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  float v23;
  uint64_t v24;
  float v25;
  id v26;

  v26 = a2;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingBox");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v26, "boundingBox");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v23 = HMICGRectMaxParallelEdgeDistance(v5, v7, v9, v11, v13, v15, v17, v19, v21, v22);

    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(float *)(v24 + 24);
    if (v23 < v25)
      v25 = v23;
    *(float *)(v24 + 24) = v25;
  }

}

- (BOOL)_resetPreviousFrameResult:(id)a3 expirationPTS:(id *)a4 regionOfInterest:(CGRect)a5
{
  id v6;
  void *v7;
  void *v8;
  int32_t v9;
  void *v10;
  char v11;
  char v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  CMTime time1;

  v6 = a3;
  objc_msgSend(v6, "frame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "presentationTimeStamp");
  else
    memset(&time1, 0, sizeof(time1));
  v14 = *a4;
  v9 = CMTimeCompare(&time1, (CMTime *)&v14);

  if (v9 < 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v6, "events");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_29);

    v12 = v11 ^ 1;
  }

  return v12;
}

BOOL __88__HMIVideoTemporalEventFilter__resetPreviousFrameResult_expirationPTS_regionOfInterest___block_invoke()
{
  uint64_t v0;

  v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

- (HMIVideoAnalyzerFrameResult)prevFrameResult
{
  return (HMIVideoAnalyzerFrameResult *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrevFrameResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)stationaryObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_timeInterval, 24, 1, 0);
  return result;
}

- (NSDictionary)targetEventClassRanks
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEventClassRanks, 0);
  objc_storeStrong((id *)&self->_stationaryObjects, 0);
  objc_storeStrong((id *)&self->_prevFrameResult, 0);
}

@end
