@implementation VCPAudioEmbeddingGenerator

- (VCPAudioEmbeddingGenerator)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5 version:(int)a6
{
  id v10;
  VCPAudioEmbeddingGenerator *v11;
  uint64_t v12;
  NSMutableArray *results;
  __int128 v14;
  VCPAudioEmbeddingGenerator *v15;
  objc_super v17;

  v10 = a5;
  if (v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)VCPAudioEmbeddingGenerator;
    v11 = -[VCPAudioEmbeddingGenerator init](&v17, sel_init);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = objc_claimAutoreleasedReturnValue();
      results = v11->_results;
      v11->_results = (NSMutableArray *)v12;

      v14 = *(_OWORD *)&a3->var0;
      v11->_trackStart.epoch = a3->var3;
      *(_OWORD *)&v11->_trackStart.value = v14;
      objc_storeStrong((id *)&v11->_resultsKey, a5);
      v11->_version = a6;
    }
    self = v11;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 embedding:(id)a5
{
  id v8;
  CFDictionaryRef v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *results;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  CMTime lhs;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  CMTimeRange range;
  CMTime end;
  CMTime start;
  CMTimeRange v26;
  CMTime rhs;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  memset(&v26, 0, sizeof(v26));
  lhs = (CMTime)self->_trackStart;
  rhs = (CMTime)*a3;
  CMTimeAdd(&start, &lhs, &rhs);
  lhs = (CMTime)self->_trackStart;
  rhs = (CMTime)*a4;
  CMTimeAdd(&end, &lhs, &rhs);
  CMTimeRangeFromTimeToTime(&v26, &start, &end);
  if ((v26.start.flags & 1) != 0
    && (v26.duration.flags & 1) != 0
    && !v26.duration.epoch
    && (v26.duration.value & 0x8000000000000000) == 0)
  {
    range = v26;
    v9 = CMTimeRangeCopyAsDictionary(&range, 0);
    lhs.value = 0;
    *(_QWORD *)&lhs.timescale = &lhs;
    lhs.epoch = 0x3032000000;
    v20 = __Block_byref_object_copy__31;
    v21 = __Block_byref_object_dispose__31;
    v22 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__VCPAudioEmbeddingGenerator_addDetectionFromTime_toTime_embedding___block_invoke;
    v18[3] = &unk_1E6B16828;
    v18[4] = &lhs;
    objc_msgSend(v8, "getBytesWithHandler:", v18);
    if (objc_msgSend(v8, "dataType") == 65568)
    {
      +[VCPTextEncoder convertFloat32ToFloat16:](VCPTextEncoder, "convertFloat32ToFloat16:", *(_QWORD *)(*(_QWORD *)&lhs.timescale + 40));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(*(_QWORD *)&lhs.timescale + 40);
      *(_QWORD *)(*(_QWORD *)&lhs.timescale + 40) = v10;

    }
    if (*(_QWORD *)(*(_QWORD *)&lhs.timescale + 40))
    {
      results = self->_results;
      v30[0] = CFSTR("start");
      -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v13;
      v30[1] = CFSTR("duration");
      -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v14;
      v30[2] = CFSTR("attributes");
      v29[0] = *(_QWORD *)(*(_QWORD *)&lhs.timescale + 40);
      v28[0] = CFSTR("embeddings");
      v28[1] = CFSTR("embeddingVersion");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](results, "addObject:", v17);

    }
    _Block_object_dispose(&lhs, 8);

  }
}

void __68__VCPAudioEmbeddingGenerator_addDetectionFromTime_toTime_embedding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2, a3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  CMTime v10;
  CMTime v11;
  CMTime v12;
  __int128 v13;
  _OWORD v14[2];
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
      memset(v14, 0, sizeof(v14));
      v13 = 0u;
      objc_msgSend(v8, "timeRange");
      *(_OWORD *)&v12.value = v13;
      v12.epoch = *(_QWORD *)&v14[0];
      memset(&v11, 0, sizeof(v11));
      *(_OWORD *)&lhs.value = v13;
      lhs.epoch = *(_QWORD *)&v14[0];
      rhs = *(CMTime *)((char *)v14 + 8);
      CMTimeAdd(&v11, &lhs, &rhs);
      v10 = v12;
      if (CMTimeGetSeconds(&v10) >= 0.0)
      {
        objc_msgSend(v8, "featureVector");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPAudioEmbeddingGenerator addDetectionFromTime:toTime:embedding:](self, "addDetectionFromTime:toTime:embedding:", &v12, &v11, v9);

      }
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
