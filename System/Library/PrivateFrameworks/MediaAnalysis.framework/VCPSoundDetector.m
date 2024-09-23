@implementation VCPSoundDetector

- (VCPSoundDetector)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5
{
  id v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  VCPSoundDetector *v17;
  objc_super v19;

  v9 = a5;
  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)VCPSoundDetector;
    v10 = -[VCPSoundDetector init](&v19, sel_init);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)v10 + 1);
      *((_QWORD *)v10 + 1) = v11;

      v13 = MEMORY[0x1E0CA2E18];
      v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v15 = *MEMORY[0x1E0CA2E18];
      *((_OWORD *)v10 + 1) = *MEMORY[0x1E0CA2E18];
      *((_QWORD *)v10 + 4) = v14;
      *(_OWORD *)(v10 + 40) = v15;
      *((_QWORD *)v10 + 7) = *(_QWORD *)(v13 + 16);
      *((_DWORD *)v10 + 16) = 0;
      v16 = *(_OWORD *)&a3->var0;
      *((_QWORD *)v10 + 11) = a3->var3;
      *(_OWORD *)(v10 + 72) = v16;
      *((_DWORD *)v10 + 24) = 0;
      *((float *)v10 + 25) = a4;
      *((_DWORD *)v10 + 26) = 2;
      objc_storeStrong((id *)v10 + 14, a5);
    }
    self = v10;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 confidence:(float)a5
{
  CFDictionaryRef v8;
  NSMutableArray *results;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  CMTimeRange v15;
  CMTime end;
  CMTime start;
  CMTimeRange v18;
  CMTime rhs;
  CMTime lhs;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, sizeof(v18));
  lhs = (CMTime)self->_trackStart;
  rhs = (CMTime)*a3;
  CMTimeAdd(&start, &lhs, &rhs);
  lhs = (CMTime)self->_trackStart;
  rhs = (CMTime)*a4;
  CMTimeAdd(&end, &lhs, &rhs);
  CMTimeRangeFromTimeToTime(&v18, &start, &end);
  if ((v18.start.flags & 1) != 0
    && (v18.duration.flags & 1) != 0
    && !v18.duration.epoch
    && (v18.duration.value & 0x8000000000000000) == 0
    && self->_length >= self->_minDetections)
  {
    v15 = v18;
    v8 = CMTimeRangeCopyAsDictionary(&v15, 0);
    results = self->_results;
    v21[0] = CFSTR("start");
    -[__CFDictionary objectForKey:](v8, "objectForKey:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v21[1] = CFSTR("duration");
    -[__CFDictionary objectForKey:](v8, "objectForKey:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    v21[2] = CFSTR("quality");
    *(float *)&v12 = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](results, "addObject:", v14);

  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  Float64 Seconds;
  float activeConfidence;
  uint64_t v13;
  int64_t v14;
  __int128 v15;
  $95D729B680665BEAEFA1D6FCA8238556 v16;
  CMTime v17;
  $95D729B680665BEAEFA1D6FCA8238556 v18;
  __int128 v19;
  _OWORD v20[2];
  CMTime rhs;
  CMTime lhs;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      objc_msgSend(v8, "confidence");
      v10 = v9;
      memset(v20, 0, sizeof(v20));
      v19 = 0u;
      objc_msgSend(v8, "timeRange");
      *(_OWORD *)&v18.value = v19;
      v18.epoch = *(_QWORD *)&v20[0];
      memset(&v17, 0, sizeof(v17));
      *(_OWORD *)&lhs.value = v19;
      lhs.epoch = *(_QWORD *)&v20[0];
      rhs = *(CMTime *)((char *)v20 + 8);
      CMTimeAdd(&v17, &lhs, &rhs);
      v16 = v18;
      Seconds = CMTimeGetSeconds((CMTime *)&v16);
      if (Seconds <= 0.0 || (activeConfidence = v10, self->_threshold >= activeConfidence))
      {
        if ((self->_activeStart.flags & 1) != 0)
        {
          *(float *)&Seconds = self->_activeConfidence;
          -[VCPSoundDetector addDetectionFromTime:toTime:confidence:](self, "addDetectionFromTime:toTime:confidence:", &self->_activeStart, &self->_activeEnd, Seconds);
        }
        v13 = MEMORY[0x1E0CA2E18];
        v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        v15 = *MEMORY[0x1E0CA2E18];
        *(_OWORD *)&self->_activeStart.value = *MEMORY[0x1E0CA2E18];
        self->_activeStart.epoch = v14;
        *(_OWORD *)&self->_activeEnd.value = v15;
        self->_activeEnd.epoch = *(_QWORD *)(v13 + 16);
        self->_length = 0;
        self->_activeConfidence = 0.0;
      }
      else
      {
        if ((self->_activeStart.flags & 1) != 0)
        {
          self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
          if (self->_activeConfidence >= activeConfidence)
            activeConfidence = self->_activeConfidence;
        }
        else
        {
          self->_activeStart = v18;
          self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
        }
        self->_activeConfidence = activeConfidence;
        ++self->_length;
      }

    }
  }

}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  double v3;
  uint64_t v5;
  int64_t v6;
  __int128 v7;

  if ((self->_activeStart.flags & 1) != 0)
  {
    *(float *)&v3 = self->_activeConfidence;
    -[VCPSoundDetector addDetectionFromTime:toTime:confidence:](self, "addDetectionFromTime:toTime:confidence:", &self->_activeStart, &self->_activeEnd, v3);
    v5 = MEMORY[0x1E0CA2E18];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v7 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_activeStart.value = *MEMORY[0x1E0CA2E18];
    self->_activeStart.epoch = v6;
    *(_OWORD *)&self->_activeEnd.value = v7;
    self->_activeEnd.epoch = *(_QWORD *)(v5 + 16);
    self->_activeConfidence = 0.0;
  }
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
