@implementation MMCSOperationMetric

- (id)newRangeWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v7;
  MMCSOperationStateTimeRange *v8;

  v7 = a4;
  v8 = -[MMCSOperationStateTimeRange initWithOperationState:startDate:duration:]([MMCSOperationStateTimeRange alloc], "initWithOperationState:startDate:duration:", a3, v7, a5);

  return v8;
}

- (MMCSOperationMetric)initWithDate:(id)a3
{
  id v4;
  MMCSOperationMetric *v5;
  MMCSOperationMetric *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *totalBytesByChunkProfile;
  NSMutableDictionary *v9;
  NSMutableDictionary *chunkCountByChunkProfile;
  NSMutableDictionary *v11;
  NSMutableDictionary *fileCountByChunkProfile;
  NSMutableSet *v13;
  NSMutableSet *requestUUIDs;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MMCSOperationMetric;
  v5 = -[MMCSOperationMetric init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MMCSOperationMetric setStartDate:](v5, "setStartDate:", v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    totalBytesByChunkProfile = v6->_totalBytesByChunkProfile;
    v6->_totalBytesByChunkProfile = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    chunkCountByChunkProfile = v6->_chunkCountByChunkProfile;
    v6->_chunkCountByChunkProfile = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fileCountByChunkProfile = v6->_fileCountByChunkProfile;
    v6->_fileCountByChunkProfile = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requestUUIDs = v6->_requestUUIDs;
    v6->_requestUUIDs = v13;

  }
  if (!v6->_totalBytesByChunkProfile
    || !v6->_chunkCountByChunkProfile
    || !v6->_fileCountByChunkProfile
    || !v6->_requestUUIDs)
  {

    v6 = 0;
  }

  return v6;
}

- (void)addRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MMCSOperationMetric ranges](self, "ranges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MMCSOperationMetric setRanges:](self, "setRanges:", v6);

  }
  -[MMCSOperationMetric ranges](self, "ranges");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)rangesCompleted
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MMCSOperationMetric ranges](self, "ranges", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "queueing");
        v8 = v8 + v11;
        objc_msgSend(v10, "executing");
        v7 = v7 + v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }

  -[MMCSOperationMetric setQueueing:](self, "setQueueing:", v8);
  -[MMCSOperationMetric setExecuting:](self, "setExecuting:", v7);
}

- (NSArray)rangesCopy
{
  void *v2;
  void *v3;

  -[MMCSOperationMetric ranges](self, "ranges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)describeRanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MMCSOperationMetric ranges](self, "ranges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0.0;
    do
    {
      v10 = v7;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "absoluteStart");
        if (v11 > v9)
        {
          objc_msgSend(v3, "appendString:", CFSTR(" "));
          objc_msgSend(v7, "absoluteStart");
          +[MMCSOperationStateTimeRange descriptionWithOperationState:absoluteStart:duration:](MMCSOperationStateTimeRange, "descriptionWithOperationState:absoluteStart:duration:", 2, v9, v12 - v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v13);

        }
        objc_msgSend(v3, "appendString:", CFSTR(" "));
        objc_msgSend(v7, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v14);

      }
      else
      {
        -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
        v16 = v15;
        objc_msgSend(v7, "absoluteStart");
        if (v16 < v17)
        {
          -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
          v19 = v18;
          objc_msgSend(v7, "absoluteStart");
          v21 = v20;
          -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
          +[MMCSOperationStateTimeRange descriptionWithOperationState:absoluteStart:duration:](MMCSOperationStateTimeRange, "descriptionWithOperationState:absoluteStart:duration:", 2, v19, v21 - v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v23);

          objc_msgSend(v3, "appendString:", CFSTR(" "));
        }
        objc_msgSend(v7, "description");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v24);

        objc_msgSend(v7, "absoluteStop");
        v9 = v25;
      }
      ++v8;
    }
    while (v6 != v8);
    if (v7)
    {
      -[MMCSOperationMetric absoluteStop](self, "absoluteStop");
      v27 = v26;
      objc_msgSend(v7, "absoluteStop");
      if (v27 > v28)
      {
        objc_msgSend(v3, "appendString:", CFSTR(" "));
        objc_msgSend(v7, "absoluteStop");
        v30 = v29;
        -[MMCSOperationMetric absoluteStop](self, "absoluteStop");
        v32 = v31;
        objc_msgSend(v7, "absoluteStop");
        +[MMCSOperationStateTimeRange descriptionWithOperationState:absoluteStart:duration:](MMCSOperationStateTimeRange, "descriptionWithOperationState:absoluteStart:duration:", 2, v30, v32 - v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v34);

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v3;
}

- (NSString)description
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
  v5 = v4;
  mmcs_operation_metric_reference_time();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("start %0.3lf duration %0.3lf queueing %0.3lf executing %0.3lf bytesUp %llu bytesDown %llu connections %llu(%llu) uuidSetCount %llu"), v5 - v6, *(_QWORD *)&self->_duration, *(_QWORD *)&self->_queueing, *(_QWORD *)&self->_executing, self->_bytesUploaded, self->_bytesDownloaded, self->_connections, self->_connectionsCreated, -[NSMutableSet count](self->_requestUUIDs, "count"));
}

- (double)absoluteStart
{
  void *v2;
  double v3;
  double v4;

  -[MMCSOperationMetric startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (double)other
{
  return self->_duration - self->_executing - self->_queueing;
}

- (int64_t)compareStartTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
  v6 = v5;
  objc_msgSend(v4, "absoluteStart");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (int64_t)compareExecutingStartTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
  v6 = v5;
  objc_msgSend(v4, "absoluteStart");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (double)absoluteStop
{
  double v3;
  double v4;
  double v5;

  -[MMCSOperationMetric absoluteStart](self, "absoluteStart");
  v4 = v3;
  -[MMCSOperationMetric duration](self, "duration");
  return v4 + v5;
}

- (double)queueing
{
  return self->_queueing;
}

- (void)setQueueing:(double)a3
{
  self->_queueing = a3;
}

- (double)executing
{
  return self->_executing;
}

- (void)setExecuting:(double)a3
{
  self->_executing = a3;
}

- (unint64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(unint64_t)a3
{
  self->_bytesUploaded = a3;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (unint64_t)connections
{
  return self->_connections;
}

- (void)setConnections:(unint64_t)a3
{
  self->_connections = a3;
}

- (unint64_t)connectionsCreated
{
  return self->_connectionsCreated;
}

- (void)setConnectionsCreated:(unint64_t)a3
{
  self->_connectionsCreated = a3;
}

- (unint64_t)bytesFulfilledByPeers
{
  return self->_bytesFulfilledByPeers;
}

- (void)setBytesFulfilledByPeers:(unint64_t)a3
{
  self->_bytesFulfilledByPeers = a3;
}

- (unint64_t)bytesFulfilledLocally
{
  return self->_bytesFulfilledLocally;
}

- (void)setBytesFulfilledLocally:(unint64_t)a3
{
  self->_bytesFulfilledLocally = a3;
}

- (unint64_t)bytesResumed
{
  return self->_bytesResumed;
}

- (void)setBytesResumed:(unint64_t)a3
{
  self->_bytesResumed = a3;
}

- (NSMutableDictionary)totalBytesByChunkProfile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)chunkCountByChunkProfile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)fileCountByChunkProfile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableSet)requestUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
  objc_storeStrong((id *)&self->_ranges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, 0);
}

@end
