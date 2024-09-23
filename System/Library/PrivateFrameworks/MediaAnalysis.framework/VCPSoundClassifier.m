@implementation VCPSoundClassifier

- (VCPSoundClassifier)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5
{
  id v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  VCPSoundClassifier *v18;
  objc_super v20;

  v9 = a5;
  if (v9)
  {
    v20.receiver = self;
    v20.super_class = (Class)VCPSoundClassifier;
    v10 = -[VCPSoundClassifier init](&v20, sel_init);
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
      v17 = (void *)*((_QWORD *)v10 + 14);
      *((_QWORD *)v10 + 14) = CFSTR("aggregated");

      objc_storeStrong((id *)v10 + 15, a5);
    }
    self = v10;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
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
    && (v18.duration.value & 0x8000000000000000) == 0)
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
  void *v9;
  void *v10;
  double v11;
  float v12;
  Float64 Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 *p_activeStart;
  CMTime v15;
  CMTime time;
  CMTime v17;
  CMTime v18;
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
      v19 = 0u;
      memset(v20, 0, sizeof(v20));
      objc_msgSend(v8, "timeRange");
      *(_OWORD *)&v18.value = v19;
      v18.epoch = *(_QWORD *)&v20[0];
      memset(&v17, 0, sizeof(v17));
      *(_OWORD *)&lhs.value = v19;
      lhs.epoch = *(_QWORD *)&v20[0];
      rhs = *(CMTime *)((char *)v20 + 8);
      CMTimeAdd(&v17, &lhs, &rhs);
      time = v18;
      if (CMTimeGetSeconds(&time) < 0.0)
        goto LABEL_13;
      objc_msgSend(v8, "classificationForIdentifier:", self->_audioQualityAggregated);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_13;
      objc_msgSend(v8, "classificationForIdentifier:", self->_audioQualityAggregated);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "confidence");
      v12 = 1.0 - v11;

      p_activeStart = &self->_activeStart;
      if ((self->_activeStart.flags & 1) != 0)
      {
        *(float *)&Seconds = self->_activeScore;
        if (vabds_f32(*(float *)&Seconds, v12) < 0.001)
        {
          lhs = v18;
          rhs = (CMTime)self->_activeEnd;
          CMTimeSubtract(&v15, &lhs, &rhs);
          Seconds = CMTimeGetSeconds(&v15);
          if (Seconds < 0.5)
          {
            self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
LABEL_13:

            goto LABEL_14;
          }
          *(float *)&Seconds = self->_activeScore;
        }
        -[VCPSoundClassifier addDetectionFromTime:toTime:confidence:](self, "addDetectionFromTime:toTime:confidence:", &self->_activeStart, &self->_activeEnd, Seconds);
        *(_OWORD *)&p_activeStart->value = *(_OWORD *)&v18.value;
        self->_activeStart.epoch = v18.epoch;
        self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
      }
      else
      {
        *(_OWORD *)&p_activeStart->value = *(_OWORD *)&v18.value;
        self->_activeStart.epoch = v18.epoch;
        self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
      }
      self->_activeScore = v12;
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  double v3;
  uint64_t v5;
  int64_t v6;
  __int128 v7;

  if ((self->_activeStart.flags & 1) != 0)
  {
    *(float *)&v3 = self->_activeScore;
    -[VCPSoundClassifier addDetectionFromTime:toTime:confidence:](self, "addDetectionFromTime:toTime:confidence:", &self->_activeStart, &self->_activeEnd, v3);
    v5 = MEMORY[0x1E0CA2E18];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v7 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_activeStart.value = *MEMORY[0x1E0CA2E18];
    self->_activeStart.epoch = v6;
    *(_OWORD *)&self->_activeEnd.value = v7;
    self->_activeEnd.epoch = *(_QWORD *)(v5 + 16);
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
  objc_storeStrong((id *)&self->_audioQualityAggregated, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
