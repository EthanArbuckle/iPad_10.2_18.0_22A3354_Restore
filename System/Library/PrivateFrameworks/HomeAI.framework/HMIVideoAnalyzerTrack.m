@implementation HMIVideoAnalyzerTrack

- (HMIVideoAnalyzerTrack)initWithBlob:(id)a3 trackIndex:(unint64_t)a4
{
  id v6;
  HMIVideoAnalyzerTrack *v7;
  HMIVideoAnalyzerTrack *v8;
  uint64_t v9;
  NSMutableArray *blobs;
  uint64_t v11;
  NSMutableArray *analysisTimeStamps;
  uint64_t v13;
  NSMutableSet *eventClasses;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMIVideoAnalyzerTrack;
  v7 = -[HMIVideoAnalyzerTrack init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_trackIndex = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    blobs = v8->_blobs;
    v8->_blobs = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    analysisTimeStamps = v8->_analysisTimeStamps;
    v8->_analysisTimeStamps = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    eventClasses = v8->_eventClasses;
    v8->_eventClasses = (NSMutableSet *)v13;

    v8->_stationaryBlobIndex = 0;
  }

  return v8;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  Float64 Seconds;
  void *v6;
  void *v7;
  void *v8;
  Float64 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  CMTime v25;
  CMTime time;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  if (v4)
    objc_msgSend(v4, "timeStamp");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "timeStamp");
  else
    memset(&v25, 0, sizeof(v25));
  v9 = CMTimeGetSeconds(&v25);
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "boundingBox");
  HMICGRectDescription(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerTrack eventClasses](self, "eventClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_map:", &__block_literal_global_32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Track:%.2f-%.2f @ %@ (%@)"), *(_QWORD *)&Seconds, *(_QWORD *)&v9, v16, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __41__HMIVideoAnalyzerTrack_shortDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", a2);
}

- (void)appendBlob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int32_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int32_t v23;
  void *v24;
  CMTime v25;
  CMTime v26;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "timeStamp");
  else
    memset(&lhs, 0, sizeof(lhs));
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "timeStamp");
  else
    memset(&rhs, 0, sizeof(rhs));
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTimeMakeWithSeconds(&time2, 3.0, 1000);
  v9 = CMTimeCompare(&time1, &time2);

  if (v9 >= 1)
  {
    -[HMIVideoAnalyzerTrack blobs](self, "blobs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_removeFirstObject");

    if (-[HMIVideoAnalyzerTrack stationaryBlobIndex](self, "stationaryBlobIndex"))
      -[HMIVideoAnalyzerTrack setStationaryBlobIndex:](self, "setStationaryBlobIndex:", -[HMIVideoAnalyzerTrack stationaryBlobIndex](self, "stationaryBlobIndex") - 1);
  }
  objc_msgSend(v5, "boundingBox");
  v11 = -[HMIVideoAnalyzerTrack stationaryIndexToBoundingBox:](self, "stationaryIndexToBoundingBox:");
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v5);

  if (v11 > -[HMIVideoAnalyzerTrack stationaryBlobIndex](self, "stationaryBlobIndex"))
  {
    -[HMIVideoAnalyzerTrack blobs](self, "blobs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v11 < v14)
    {
      while (1)
      {
        -[HMIVideoAnalyzerTrack analysisTimeStamps](self, "analysisTimeStamps", v25.value, *(_QWORD *)&v25.timescale, v25.epoch);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (!v16)
          break;
        -[HMIVideoAnalyzerTrack analysisTimeStamps](self, "analysisTimeStamps");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
          objc_msgSend(v18, "CMTimeValue");
        else
          memset(&v26, 0, sizeof(v26));
        -[HMIVideoAnalyzerTrack blobs](self, "blobs", v25.value, *(_QWORD *)&v25.timescale, v25.epoch, v26.value, *(_QWORD *)&v26.timescale, v26.epoch);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
          objc_msgSend(v21, "timeStamp");
        else
          memset(&v25, 0, sizeof(v25));
        v23 = CMTimeCompare(&v26, &v25);

        if (v23 > 0)
          break;
        -[HMIVideoAnalyzerTrack analysisTimeStamps](self, "analysisTimeStamps");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hmf_removeFirstObject");

      }
      -[HMIVideoAnalyzerTrack setStationaryBlobIndex:](self, "setStationaryBlobIndex:", v11, v25.value, *(_QWORD *)&v25.timescale, v25.epoch);
    }
  }

}

- (unint64_t)stationaryIndexToBoundingBox:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[HMIVideoAnalyzerTrack stationaryBlobIndex](self, "stationaryBlobIndex");
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v8 >= v12)
  {
LABEL_8:
    -[HMIVideoAnalyzerTrack blobs](self, "blobs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v24, "count");

  }
  else
  {
    v13 = v10 - v8;
    while (1)
    {
      -[HMIVideoAnalyzerTrack blobs](self, "blobs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundingBox");
      v20 = HMICGRectMaxElementwiseDistance(v16, v17, v18, v19, x, y, width, height);

      if (v20 < 0.05)
        break;
      v13 = (v13 + 1) >> 1;
      if (v13 <= 2)
        v21 = 2;
      else
        v21 = v13;
      v8 += v21;
      -[HMIVideoAnalyzerTrack blobs](self, "blobs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v8 >= v23)
        goto LABEL_8;
    }
  }
  return v8;
}

- (float)similarityToBlob:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float result;

  objc_msgSend(a3, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingBox");
  HMICGRectIntersectionOverUnion(v5, v7, v9, v11, v14, v15, v16, v17);
  v19 = v18;

  result = 0.0;
  if (v19 > 0.5)
    return v19;
  return result;
}

- (HMIVideoAnalyzerBlob)lastBlob
{
  void *v2;
  void *v3;

  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMIVideoAnalyzerBlob *)v3;
}

- (BOOL)isClassified
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[HMIVideoAnalyzerTrack analysisTimeStamps](self, "analysisTimeStamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 0xE)
  {
    v5 = 1;
  }
  else
  {
    -[HMIVideoAnalyzerTrack eventClasses](self, "eventClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", objc_opt_class()) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[HMIVideoAnalyzerTrack eventClasses](self, "eventClasses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "containsObject:", objc_opt_class());

    }
  }

  return v5;
}

- (BOOL)isLostAtTimeStamp:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  CMTime time2;

  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeStamp");
  else
    memset(&time2, 0, sizeof(time2));
  v9 = *a3;
  v7 = CMTimeCompare((CMTime *)&v9, &time2) > 0;

  return v7;
}

- (BOOL)isExpiredAtTimeStamp:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  CMTime time2;
  CMTime lhs;
  CMTime rhs;
  CMTime time1;

  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeStamp");
  else
    memset(&rhs, 0, sizeof(rhs));
  lhs = (CMTime)*a3;
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTimeMakeWithSeconds(&time2, 3.0, 1000);
  v7 = CMTimeCompare(&time1, &time2) > 0;

  return v7;
}

- (BOOL)isStationaryAtTimeStamp:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  CMTime v13;
  CMTime rhs;
  CMTime v15;
  CMTime time1;
  CMTime time2;

  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "timeStamp");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = (CMTime)*a3;
  if (CMTimeCompare(&time1, &time2))
  {
    v8 = 0;
  }
  else
  {
    -[HMIVideoAnalyzerTrack blobs](self, "blobs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", -[HMIVideoAnalyzerTrack stationaryBlobIndex](self, "stationaryBlobIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "timeStamp");
    else
      memset(&rhs, 0, sizeof(rhs));
    time1 = (CMTime)*a3;
    CMTimeSubtract(&v15, &time1, &rhs);
    CMTimeMakeWithSeconds(&v13, 2.0, 1000);
    v8 = CMTimeCompare(&v15, &v13) > 0;

  }
  return v8;
}

- (id)blobAtTimeStamp:(id *)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int32_t v11;
  void *v12;
  void *v13;
  void *v14;
  int32_t v15;
  CMTime v17;
  CMTime time1;
  CMTime time2;

  -[HMIVideoAnalyzerTrack blobs](self, "blobs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6;
  while (1)
  {
    if ((int)v7 < 1)
      return 0;
    --v7;
    -[HMIVideoAnalyzerTrack blobs](self, "blobs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "timeStamp");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = (CMTime)*a3;
    v11 = CMTimeCompare(&time1, &time2);

    -[HMIVideoAnalyzerTrack blobs](self, "blobs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v11)
      break;
    if (v13)
      objc_msgSend(v13, "timeStamp");
    else
      memset(&v17, 0, sizeof(v17));
    time1 = (CMTime)*a3;
    v15 = CMTimeCompare(&time1, &v17);

    if (v15 >= 1)
      return 0;
  }

  return v14;
}

- (id)createPackageEventAtTimeStamp:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  HMIVideoAnalyzerEventPackage *v8;
  HMIConfidence *v9;
  HMIVideoAnalyzerEventPackage *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v12 = *a3;
  -[HMIVideoAnalyzerTrack blobAtTimeStamp:](self, "blobAtTimeStamp:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMIVideoAnalyzerTrack analysisTimeStamps](self, "analysisTimeStamps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *a3;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = [HMIVideoAnalyzerEventPackage alloc];
    v9 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15290, 1.0);
    objc_msgSend(v5, "boundingBox");
    v10 = -[HMIVideoAnalyzerEventPackage initWithConfidence:boundingBox:](v8, "initWithConfidence:boundingBox:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)trackIndex
{
  return self->_trackIndex;
}

- (NSMutableSet)eventClasses
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)blobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)analysisTimeStamps
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)stationaryBlobIndex
{
  return self->_stationaryBlobIndex;
}

- (void)setStationaryBlobIndex:(unint64_t)a3
{
  self->_stationaryBlobIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisTimeStamps, 0);
  objc_storeStrong((id *)&self->_blobs, 0);
  objc_storeStrong((id *)&self->_eventClasses, 0);
}

@end
