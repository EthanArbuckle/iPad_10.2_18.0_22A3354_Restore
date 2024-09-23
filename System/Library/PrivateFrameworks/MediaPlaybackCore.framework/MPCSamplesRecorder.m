@implementation MPCSamplesRecorder

- (MPCSamplesRecorder)initWithRecordID:(id)a3 modelID:(id)a4 firstFailureDetector:(id)a5 shouldStoreSamples:(BOOL)a6 delegate:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  MPCSamplesRecorder *v16;
  MPCSamplesRecorder *v17;
  uint64_t v18;
  NSString *recordID;
  uint64_t v20;
  NSString *modelID;
  uint64_t v22;
  NSMutableArray *samples;
  dispatch_queue_t v24;
  OS_dispatch_queue *accessQueue;
  objc_super v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MPCSamplesRecorder;
  v16 = -[MPCSamplesRecorder init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_glitches = 0;
    v18 = objc_msgSend(v12, "copy");
    recordID = v17->_recordID;
    v17->_recordID = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    modelID = v17->_modelID;
    v17->_modelID = (NSString *)v20;

    v17->_mean = 0.0;
    v17->_rms = 0.0;
    *(_OWORD *)&v17->_min = xmmword_210ED9440;
    v17->_k = 0;
    v17->_storingSamples = v8;
    if (v8)
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 500);
      samples = v17->_samples;
      v17->_samples = (NSMutableArray *)v22;

    }
    objc_storeStrong((id *)&v17->_firstFailureDetector, a5);
    objc_storeWeak((id *)&v17->_delegate, v15);
    v24 = dispatch_queue_create("com.apple.MediaPlaybackCore/Suntory.samplesRecorderQueue", 0);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v24;

  }
  return v17;
}

- (void)recordSample:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__MPCSamplesRecorder_recordSample___block_invoke;
  v7[3] = &unk_24CABA1D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (int)numberOfSamples
{
  return self->_k;
}

- (id)description
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2163;
  v10 = __Block_byref_object_dispose__2164;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__MPCSamplesRecorder_description__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dictionaryRepresentation
{
  NSObject *accessQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2163;
  v11 = __Block_byref_object_dispose__2164;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 7);
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__MPCSamplesRecorder_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_24CABAB68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)flushSamplesToCSVDataWithHeader:(BOOL)a3
{
  NSObject *accessQueue;
  id v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!-[MPCSamplesRecorder isStoringSamples](self, "isStoringSamples"))
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2163;
  v14 = __Block_byref_object_dispose__2164;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MPCSamplesRecorder_flushSamplesToCSVDataWithHeader___block_invoke;
  block[3] = &unk_24CAB2020;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(accessQueue, block);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (MPCSamplesRecorderDelegate)delegate
{
  return (MPCSamplesRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)mean
{
  return self->_mean;
}

- (double)rms
{
  return self->_rms;
}

- (int)glitches
{
  return self->_glitches;
}

- (int)thermalLevel
{
  return self->_thermalLevel;
}

- (BOOL)isStoringSamples
{
  return self->_storingSamples;
}

- (NSMutableArray)samples
{
  return self->_samples;
}

- (MPCFirstFailureDetector)firstFailureDetector
{
  return self->_firstFailureDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFailureDetector, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __54__MPCSamplesRecorder_flushSamplesToCSVDataWithHeader___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count"));
  v3 = v2;
  if (*(_BYTE *)(v1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Number,State,Level,Time [ms],Thermal"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  else
  {
    objc_msgSend(v2, "addObject:", &stru_24CABB5D0);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(v1 + 32), "samples");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v22 = v1;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = objc_msgSend(v11, "number");
        v14 = objc_msgSend(v11, "state");
        objc_msgSend(v11, "level");
        v16 = v15;
        objc_msgSend(v11, "time");
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%d,%ld,%3.2f,%3.2f,%d"), v13, v14, v16, v17, objc_msgSend(v11, "thermalLevel"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v7);
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);

    v1 = v22;
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataUsingEncoding:allowLossyConversion:", 134217984, 1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 104), "removeAllObjects");
}

void __46__MPCSamplesRecorder_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (double)*(int *)(v2 + 8);
  objc_msgSend(*(id *)(v2 + 112), "samplingTime");
  v5 = v4 * v3 / 1000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v6, CFSTR("duration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v7, CFSTR("max"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("mean"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqrt(*(double *)(*(_QWORD *)(a1 + 32) + 96)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("sigma"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("MLModel"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 36));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v10, CFSTR("glitches"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v11, CFSTR("thermal"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(int *)(*(_QWORD *)(a1 + 32) + 36) * 3600.0 / v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v12, CFSTR("FPH"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "singleSampleFailure");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "singleSampleFailure");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startTime");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v16, CFSTR("TFSF"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "multiSamplesFailure");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "multiSamplesFailure");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startTime");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v20, CFSTR("TFMF"));

    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "multiSamplesFailure");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "duration");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v22, CFSTR("DFMF"));

  }
}

void __33__MPCSamplesRecorder_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p - RecordID:%@ - ModelID:%@ - mean: %2.5fms - std: %2.5fms - min: %2.5fms - max: %2.5fms - samples: %d - glitches: %d - thermal level: %d>"), v3, v4, *(_QWORD *)(v4 + 56), *(_QWORD *)(v4 + 64), *(_QWORD *)(v4 + 88), sqrt(*(double *)(v4 + 96)), *(_QWORD *)(v4 + 72), *(_QWORD *)(v4 + 80), *(unsigned int *)(v4 + 8), *(unsigned int *)(v4 + 36), *(unsigned int *)(v4 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __35__MPCSamplesRecorder_recordSample___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  int *v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t result;
  double v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isStoringSamples"))
  {
    objc_msgSend(*(id *)(a1 + 32), "samples");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "samples");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 >= 0x191)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "samplesRecorderHasNewSamples:", *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "firstFailureDetector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processSample:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "time");
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
      v23 = 134218240;
      v24 = v10;
      v25 = 1024;
      v26 = v9;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[AP] - Rendering limit exceeded [no audio] - time:%3.2fms - total: %d", (uint8_t *)&v23, 0x12u);
    }

  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 40), "thermalLevel");
  objc_msgSend(*(id *)(a1 + 40), "time");
  v12 = v11;
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(int **)(a1 + 32);
  v14 = 1.0 / (double)v13[2];
  objc_msgSend(v13, "mean");
  v15 = *(_QWORD *)(a1 + 32);
  v17 = v12 - v16;
  v18 = v16 + (v12 - v16) * v14;
  v19 = *(double *)(v15 + 16) + v17 * (v12 - v18);
  *(double *)(v15 + 88) = v18;
  *(double *)(*(_QWORD *)(a1 + 32) + 16) = v19;
  *(double *)(*(_QWORD *)(a1 + 32) + 96) = v14 * v19;
  objc_msgSend(*(id *)(a1 + 32), "min");
  *(double *)(*(_QWORD *)(a1 + 32) + 72) = fmin(v20, v12);
  result = objc_msgSend(*(id *)(a1 + 32), "max");
  *(double *)(*(_QWORD *)(a1 + 32) + 80) = fmax(v22, v12);
  return result;
}

@end
