@implementation VCPSoundClassifier300

- (VCPSoundClassifier300)initWithTrackStart:(id *)a3 resultsKey:(id)a4
{
  id v7;
  VCPSoundClassifier300 *v8;
  uint64_t v9;
  NSMutableArray *results;
  __int128 v11;
  VCPSoundClassifier300 *v12;
  objc_super v14;

  v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPSoundClassifier300;
    v8 = -[VCPSoundClassifier300 init](&v14, sel_init);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      results = v8->_results;
      v8->_results = (NSMutableArray *)v9;

      v11 = *(_OWORD *)&a3->var0;
      v8->_trackStart.epoch = a3->var3;
      *(_OWORD *)&v8->_trackStart.value = v11;
      objc_storeStrong((id *)&v8->_resultsKey, a4);
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 classification:(id)a5
{
  id v8;
  CFDictionaryRef v9;
  NSMutableArray *results;
  void *v11;
  void *v12;
  void *v13;
  CMTimeRange v14;
  CMTime end;
  CMTime start;
  CMTimeRange v17;
  CMTime rhs;
  CMTime lhs;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  memset(&v17, 0, sizeof(v17));
  lhs = (CMTime)self->_trackStart;
  rhs = (CMTime)*a3;
  CMTimeAdd(&start, &lhs, &rhs);
  lhs = (CMTime)self->_trackStart;
  rhs = (CMTime)*a4;
  CMTimeAdd(&end, &lhs, &rhs);
  CMTimeRangeFromTimeToTime(&v17, &start, &end);
  if ((v17.start.flags & 1) != 0
    && (v17.duration.flags & 1) != 0
    && !v17.duration.epoch
    && (v17.duration.value & 0x8000000000000000) == 0)
  {
    v14 = v17;
    v9 = CMTimeRangeCopyAsDictionary(&v14, 0);
    results = self->_results;
    v20[0] = CFSTR("start");
    -[__CFDictionary objectForKey:](v9, "objectForKey:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v20[1] = CFSTR("duration");
    -[__CFDictionary objectForKey:](v9, "objectForKey:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = CFSTR("attributes");
    v21[1] = v12;
    v21[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](results, "addObject:", v13);

  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VCPSoundClassifier300 *v18;
  id v19;
  CMTime time;
  CMTime v21;
  CMTime v22;
  __int128 v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime rhs;
  CMTime lhs;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = self;
      v19 = v7;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v19, "classifications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subarrayWithRange:", 0, 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v14, "confidence", v18);
            objc_msgSend(v15, "numberWithDouble:");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v16, v17);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v11);
      }

      memset(v24, 0, sizeof(v24));
      v23 = 0u;
      objc_msgSend(v19, "timeRange");
      *(_OWORD *)&v22.value = v23;
      v22.epoch = *(_QWORD *)&v24[0];
      memset(&v21, 0, sizeof(v21));
      *(_OWORD *)&lhs.value = v23;
      lhs.epoch = *(_QWORD *)&v24[0];
      rhs = *(CMTime *)((char *)v24 + 8);
      CMTimeAdd(&v21, &lhs, &rhs);
      time = v22;
      if (CMTimeGetSeconds(&time) >= 0.0)
        -[VCPSoundClassifier300 addDetectionFromTime:toTime:classification:](v18, "addDetectionFromTime:toTime:classification:", &v22, &v21, v8);

    }
  }

}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  return 0;
}

- (id)results
{
  NSMutableArray *results;
  NSString *resultsKey;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  results = self->_results;
  resultsKey = self->_resultsKey;
  v5[0] = results;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &resultsKey, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsKey, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
