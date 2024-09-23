@implementation ADStreamSync

- (int64_t)reset
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_streamsHistory;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "removeAllObjects", (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return 0;
}

- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4 meta:(uint64_t)a5
{
  objc_msgSend(a1, "pushData:streamIndex:timestamp:pose:calibration:meta:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)checkForMatch
{
  void *v3;
  BOOL v4;
  id v5;
  id v7;

  v3 = 0;
  do
  {
    v7 = v3;
    v4 = -[ADStreamSync checkOnceForMatch:](self, "checkOnceForMatch:", &v7);
    v5 = v7;

    v3 = v5;
  }
  while (v4);
  return v5;
}

- (BOOL)checkOnceForMatch:(id *)a3
{
  uint64_t v5;
  unint64_t v6;
  double v7;
  double *matchedTimestampsArray;
  unint64_t v9;
  double *v10;
  double *v11;
  BOOL result;
  double v13;
  double *v14;
  double *v15;
  uint64_t v16;
  double *v17;
  double *v18;
  double v19;
  double v20;
  void *v21;
  double allowedMatchTimeInterval;
  id v23;

  if (-[NSMutableArray count](self->_streamsHistory, "count"))
  {
    v5 = 0;
    while (-[ADStreamSync streamContainsMinimalFrameCount:](self, "streamContainsMinimalFrameCount:", v5))
    {
      if (++v5 >= (unint64_t)-[NSMutableArray count](self->_streamsHistory, "count"))
        goto LABEL_5;
    }
    return 0;
  }
  else
  {
LABEL_5:
    if (-[NSMutableArray count](self->_streamsHistory, "count"))
    {
      v6 = 0;
      while (-[ADStreamSync areOldestMatchingObjectsInAllowedInterval:](self, "areOldestMatchingObjectsInAllowedInterval:", v6))
      {
        -[ADStreamSync oldestAverageTimestampForStream:](self, "oldestAverageTimestampForStream:", v6);
        self->_matchedTimestampsArray[v6++] = v7;
        if (v6 >= -[NSMutableArray count](self->_streamsHistory, "count"))
          goto LABEL_9;
      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectAtIndex:", 0);

      return 1;
    }
    else
    {
LABEL_9:
      matchedTimestampsArray = self->_matchedTimestampsArray;
      v9 = -[NSMutableArray count](self->_streamsHistory, "count");
      if (v9 >= 2)
      {
        v11 = matchedTimestampsArray + 1;
        v13 = matchedTimestampsArray[1];
        if (v13 >= *matchedTimestampsArray)
          v10 = matchedTimestampsArray;
        else
          v10 = matchedTimestampsArray + 1;
        if (v13 < *matchedTimestampsArray)
          v11 = matchedTimestampsArray;
        if (v9 != 2)
        {
          v14 = matchedTimestampsArray + 2;
          if (v13 >= *matchedTimestampsArray)
            v13 = *matchedTimestampsArray;
          v15 = matchedTimestampsArray + 3;
          v16 = 8 * v9 - 24;
          while (1)
          {
            v17 = v14;
            v18 = v15 - 1;
            if (!v16)
              break;
            v20 = *(v15 - 1);
            v19 = *v15;
            if (*v15 >= v20)
            {
              if (v20 < v13)
              {
                v13 = *(v15 - 1);
                v10 = v15 - 1;
              }
              if (v19 >= *v11)
                v11 = matchedTimestampsArray + 3;
            }
            else
            {
              v13 = *v10;
              if (v19 < *v10)
              {
                v13 = *v15;
                v10 = v15;
              }
              if (v20 >= *v11)
                v11 = v15 - 1;
            }
            v14 = v17 + 2;
            v15 += 2;
            v16 -= 16;
            matchedTimestampsArray = v17;
            if (v16 == -8)
              goto LABEL_39;
          }
          if (*v18 >= *v10)
          {
            if (*v18 >= *v11)
              v11 = v15 - 1;
          }
          else
          {
            v10 = v15 - 1;
          }
        }
      }
      else
      {
        v10 = matchedTimestampsArray;
        v11 = matchedTimestampsArray;
      }
LABEL_39:
      allowedMatchTimeInterval = self->_allowedMatchTimeInterval;
      if (*v11 - *v10 >= allowedMatchTimeInterval)
      {
        return -[ADStreamSync dropOldFramesFromStream:belowTimestampThreshold:](self, "dropOldFramesFromStream:belowTimestampThreshold:", ((unint64_t)((char *)v10 - (char *)self->_matchedTimestampsArray) >> 3), *v11 - allowedMatchTimeInterval);
      }
      else
      {
        -[ADStreamSync createAndPopulateMatch](self, "createAndPopulateMatch");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a3 = v23;
      }
    }
  }
  return result;
}

- (BOOL)streamContainsMinimalFrameCount:(unint64_t)a3
{
  void *v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "count") >= self->_aggregationCounts[a3];

  return a3;
}

- (id)pushData:(__n128)a3 streamIndex:(__n128)a4 timestamp:(__n128)a5 pose:(__n128)a6 calibration:(uint64_t)a7 meta:(void *)a8
{
  id v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v25;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v16 = a8;
  v17 = a10;
  v18 = a11;
  v19 = a1;
  objc_sync_enter(v19);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setData:", v16);
  objc_msgSend(v20, "setTimestamp:", a2);
  objc_msgSend(v20, "setPose:", a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0]);
  objc_msgSend(v20, "setMidExposureTimestamp:", a2);
  objc_msgSend(v20, "setCalibration:", v17);
  objc_msgSend(v20, "setMetadata:", v18);
  if (objc_msgSend(v19[1], "count") <= a9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v25 = objc_msgSend(v19[1], "count");
    *(_DWORD *)buf = 134218240;
    v31 = a9;
    v32 = 2048;
    v33 = v25;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADStreamSync error: cannot push to index %lu when number of synced streams is %lu", buf, 0x16u);
  }
  objc_msgSend(v19[1], "objectAtIndexedSubscript:", a9, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *((_QWORD *)v19[2] + a9);
  if (objc_msgSend(v21, "count") >= v22)
    objc_msgSend(v21, "removeObjectAtIndex:", 0);
  objc_msgSend(v21, "addObject:", v20);
  objc_msgSend(v19, "checkForMatch");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v19);
  return v23;
}

- (ADStreamSync)initWithStreamCount:(unint64_t)a3 allowedMatchTimeInterval:(double)a4
{
  NSMutableArray *v6;
  NSMutableArray *streamsHistory;
  uint64_t v8;
  void *v9;
  size_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  self->_allowedMatchTimeInterval = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  streamsHistory = self->_streamsHistory;
  self->_streamsHistory = v6;

  if (a3)
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_opt_new();
      -[NSMutableArray setObject:atIndexedSubscript:](self->_streamsHistory, "setObject:atIndexedSubscript:", v9, v8);

      ++v8;
    }
    while (a3 != v8);
  }
  if (a3 >> 61)
    v10 = -1;
  else
    v10 = 8 * a3;
  v11 = (void *)operator new[]();
  bzero(v11, v10);
  self->_matchedTimestampsArray = (double *)v11;
  v12 = (void *)operator new[]();
  bzero(v12, v10);
  self->_allowedAggregationIntervals = (double *)v12;
  v13 = (void *)operator new[]();
  bzero(v13, v10);
  self->_historySizes = (unint64_t *)v13;
  v14 = (void *)operator new[]();
  bzero(v14, v10);
  self->_aggregationCounts = (unint64_t *)v14;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = a3;
    _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "initialized ADStreamSync for %lu streams", (uint8_t *)&v16, 0xCu);
  }
  return self;
}

- (int64_t)setStream:(unint64_t)a3 queueSize:(unint64_t)a4
{
  return -[ADStreamSync setStream:queueSize:aggregationCount:allowedAggregationInterval:](self, "setStream:queueSize:aggregationCount:allowedAggregationInterval:", a3, a4, 1, 0.0);
}

- (int64_t)setStream:(unint64_t)a3 queueSize:(unint64_t)a4 aggregationCount:(unint64_t)a5 allowedAggregationInterval:(double)a6
{
  int64_t result;
  uint64_t v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_streamsHistory, "count") <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v12 = -[NSMutableArray count](self->_streamsHistory, "count");
      v13 = 134218240;
      v14 = a3;
      v15 = 2048;
      v16 = v12;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADStreamSync cannot set stream %lu. only %lu streams supported", (uint8_t *)&v13, 0x16u);
    }
    return -22953;
  }
  else
  {
    result = 0;
    self->_allowedAggregationIntervals[a3] = a6;
    self->_historySizes[a3] = a4;
    self->_aggregationCounts[a3] = a5;
  }
  return result;
}

- (void)dealloc
{
  double *matchedTimestampsArray;
  double *allowedAggregationIntervals;
  unint64_t *historySizes;
  unint64_t *aggregationCounts;
  objc_super v7;

  matchedTimestampsArray = self->_matchedTimestampsArray;
  if (matchedTimestampsArray)
    MEMORY[0x23B7F1D4C](matchedTimestampsArray, 0x1000C8000313F17);
  allowedAggregationIntervals = self->_allowedAggregationIntervals;
  if (allowedAggregationIntervals)
    MEMORY[0x23B7F1D4C](allowedAggregationIntervals, 0x1000C8000313F17);
  historySizes = self->_historySizes;
  if (historySizes)
    MEMORY[0x23B7F1D4C](historySizes, 0x1000C8000313F17);
  aggregationCounts = self->_aggregationCounts;
  if (aggregationCounts)
    MEMORY[0x23B7F1D4C](aggregationCounts, 0x1000C8000313F17);
  v7.receiver = self;
  v7.super_class = (Class)ADStreamSync;
  -[ADStreamSync dealloc](&v7, sel_dealloc);
}

- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4 calibration:(uint64_t)a5
{
  objc_msgSend(a1, "pushData:streamIndex:timestamp:pose:calibration:meta:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pushData:(void *)a1 streamIndex:(uint64_t)a2 timestamp:(uint64_t)a3 pose:(uint64_t)a4
{
  objc_msgSend(a1, "pushData:streamIndex:timestamp:pose:calibration:meta:", a3, a4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)oldestAverageTimestampForStream:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  void *v12;
  double v13;

  -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_aggregationCounts[a3];
  v7 = objc_msgSend(v5, "count");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8)
  {
    v9 = 0;
    v10 = 0.0;
    v11 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "midExposureTimestamp");
      v10 = v10 + v13;

      v9 = v11;
    }
    while (v8 > v11++);
  }
  else
  {
    v10 = 0.0;
  }

  return v10 / (double)v8;
}

- (BOOL)areOldestMatchingObjectsInAllowedInterval:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", self->_aggregationCounts[a3] - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "midExposureTimestamp");
  v9 = v8;
  objc_msgSend(v7, "midExposureTimestamp");
  LOBYTE(a3) = v9 - v10 <= self->_allowedAggregationIntervals[a3];

  return a3;
}

- (BOOL)dropOldFramesFromStream:(unint64_t)a3 belowTimestampThreshold:(double)a4
{
  BOOL i;
  void *v8;
  double v9;
  double v10;
  void *v11;

  for (i = 0; ; i = 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
      break;
    -[ADStreamSync oldestAverageTimestampForStream:](self, "oldestAverageTimestampForStream:", a3);
    v10 = v9;

    if (v10 > a4)
      return i;
    -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectAtIndex:", 0);

  }
  return i;
}

- (id)createAndPopulateMatch
{
  void *v3;
  void *v4;
  unint64_t i;
  void *v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setMatchedStreams:", v4);

  for (i = 0; i < -[NSMutableArray count](self->_streamsHistory, "count"); ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_streamsHistory, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_aggregationCounts[i];
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = 1;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

        objc_msgSend(v6, "removeObjectAtIndex:", 0);
      }
      while (v7 > v9++);
    }
    objc_msgSend(v3, "matchedStreams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v8);

  }
  return v3;
}

- (double)allowedMatchTimeInterval
{
  return self->_allowedMatchTimeInterval;
}

- (void)setAllowedMatchTimeInterval:(double)a3
{
  self->_allowedMatchTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamsHistory, 0);
}

@end
