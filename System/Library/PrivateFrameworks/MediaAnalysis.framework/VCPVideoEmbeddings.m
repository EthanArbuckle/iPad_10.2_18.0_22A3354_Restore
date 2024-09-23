@implementation VCPVideoEmbeddings

- (NSArray)embeddingsArray
{
  return (NSArray *)self->_videoEmbeddings;
}

- (VCPVideoEmbeddings)initWithEmbeddingType:(int64_t)a3 version:(id)a4
{
  id v7;
  VCPVideoEmbeddings *v8;
  VCPVideoEmbeddings *v9;
  uint64_t v10;
  NSMutableArray *videoEmbeddings;
  uint64_t v12;
  NSMutableArray *summarizedEmbeddingIds;
  VCPVideoEmbeddings *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VCPVideoEmbeddings;
  v8 = -[VCPVideoEmbeddings init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_embeddingType = a3;
    v8->_embeddingSize = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    videoEmbeddings = v9->_videoEmbeddings;
    v9->_videoEmbeddings = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    summarizedEmbeddingIds = v9->_summarizedEmbeddingIds;
    v9->_summarizedEmbeddingIds = (NSMutableArray *)v12;

    v9->_averageEmbedding = 0;
    v9->_currentEmbedding = 0;
    objc_storeStrong((id *)&v9->_version, a4);
    v14 = v9;
  }

  return v9;
}

- (int)addEmbeddings:(id)a3 startTime:(id *)a4 duration:(id *)a5
{
  id v8;
  void *v9;
  unint64_t embeddingSize;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  float *averageEmbedding;
  float *currentEmbedding;
  NSMutableArray *videoEmbeddings;
  CFDictionaryRef v18;
  CFDictionaryRef v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  embeddingSize = self->_embeddingSize;
  if (embeddingSize && embeddingSize != (unint64_t)objc_msgSend(v8, "length") >> 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.var0) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Embedding sizes don't match, skip calculating embeddings for scene results.", (uint8_t *)&buf, 2u);
    }
    -[NSMutableArray removeAllObjects](self->_videoEmbeddings, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_summarizedEmbeddingIds, "removeAllObjects");
    v14 = -18;
  }
  else
  {
    v11 = objc_msgSend(v9, "length");
    v12 = v11;
    self->_embeddingSize = v11 >> 2;
    if (self->_embeddingType == 2 && v11 >> 2 >= 0x7D1)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = self->_embeddingSize;
        LODWORD(buf.var0) = 67109376;
        HIDWORD(buf.var0) = v13;
        LOWORD(buf.var1) = 1024;
        *(int *)((char *)&buf.var1 + 2) = 2000;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding size %d exceeds max %d", (uint8_t *)&buf, 0xEu);
      }
      v14 = -50;
    }
    else
    {
      averageEmbedding = self->_averageEmbedding;
      if (!averageEmbedding)
      {
        averageEmbedding = (float *)operator new[](v11 & 0xFFFFFFFFFFFFFFFCLL, MEMORY[0x1E0DE4E10]);
        self->_averageEmbedding = averageEmbedding;
      }
      currentEmbedding = self->_currentEmbedding;
      if (!currentEmbedding)
      {
        currentEmbedding = (float *)operator new[](v12 & 0xFFFFFFFFFFFFFFFCLL, MEMORY[0x1E0DE4E10]);
        self->_currentEmbedding = currentEmbedding;
      }
      v14 = -108;
      if (averageEmbedding && currentEmbedding)
      {
        videoEmbeddings = self->_videoEmbeddings;
        v25[0] = CFSTR("start");
        buf = *a4;
        v18 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
        v26[0] = v18;
        v25[1] = CFSTR("duration");
        buf = *a5;
        v19 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
        v26[1] = v19;
        v25[2] = CFSTR("attributes");
        v23 = CFSTR("embeddings");
        v24 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](videoEmbeddings, "addObject:", v21);

        v14 = 0;
      }
    }
  }

  return v14;
}

- (id)videoEmbeddingsFp16
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *version;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v15;
  void *v17;
  uint8_t buf[8];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v17 = (void *)-[NSMutableArray mutableCopy](self->_videoEmbeddings, "mutableCopy");
  v2 = 0;
  v15 = CFSTR("embeddingVersion");
  while (1)
  {
    if (v2 >= objc_msgSend(v17, "count", v15))
    {
      v12 = v17;
      v13 = v17;
      goto LABEL_12;
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embeddings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPVideoEmbeddings convertToFloat16:](self, "convertToFloat16:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("embeddings"));
    version = self->_version;
    if (version)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", version, v15);
    v19[0] = CFSTR("start");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("start"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = CFSTR("duration");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = CFSTR("attributes");
    v20[1] = v10;
    v20[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:atIndexedSubscript:", v11, v2);

    ++v2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to convert fp32 embedding to fp16", buf, 2u);
  }

  v13 = 0;
  v12 = v17;
LABEL_12:

  return v13;
}

- (void)dealloc
{
  float *averageEmbedding;
  float *currentEmbedding;
  objc_super v5;

  averageEmbedding = self->_averageEmbedding;
  if (averageEmbedding)
    MEMORY[0x1BCCA128C](averageEmbedding, 0x1000C8052888210);
  currentEmbedding = self->_currentEmbedding;
  if (currentEmbedding)
    MEMORY[0x1BCCA128C](currentEmbedding, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoEmbeddings;
  -[VCPVideoEmbeddings dealloc](&v5, sel_dealloc);
}

- (id)getEmbeddingsForRange:(id *)a3 useFP16:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  const __CFDictionary *v10;
  __int128 v11;
  void *v12;
  void *v13;
  float Seconds;
  unint64_t embeddingSize;
  float *currentEmbedding;
  float *averageEmbedding;
  float v18;
  unint64_t v19;
  float *v20;
  unint64_t v21;
  float *v22;
  id v23;
  void *v24;
  _BOOL4 v26;
  NSMutableArray *obj;
  id obja;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v34;
  CMTimeRange v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v26 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  bzero(self->_averageEmbedding, 4 * self->_embeddingSize);
  bzero(self->_currentEmbedding, 4 * self->_embeddingSize);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_videoEmbeddings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v6)
  {

LABEL_23:
    obja = 0;
    goto LABEL_24;
  }
  v7 = *(_QWORD *)v37;
  v8 = 0.0;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v37 != v7)
        objc_enumerationMutation(obj);
      v10 = *(const __CFDictionary **)(*((_QWORD *)&v36 + 1) + 8 * i);
      memset(&v35, 0, sizeof(v35));
      CMTimeRangeMakeFromDictionary(&v35, v10);
      v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&range.start.epoch = v11;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
      memset(&v34, 0, sizeof(v34));
      otherRange = v35;
      CMTimeRangeGetIntersection(&v34, &range, &otherRange);
      if ((v34.start.flags & 1) != 0
        && (v34.duration.flags & 1) != 0
        && !v34.duration.epoch
        && (v34.duration.value & 0x8000000000000000) == 0)
      {
        time1 = v34.duration;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (!CMTimeCompare(&time1, &time2))
          continue;
      }
      -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("attributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("embeddings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "getBytes:length:", self->_currentEmbedding, 4 * self->_embeddingSize);
      time = v34.duration;
      Seconds = CMTimeGetSeconds(&time);
      embeddingSize = self->_embeddingSize;
      if (embeddingSize)
      {
        averageEmbedding = self->_averageEmbedding;
        currentEmbedding = self->_currentEmbedding;
        do
        {
          v18 = *currentEmbedding++;
          *averageEmbedding = *averageEmbedding + (float)(v18 * Seconds);
          ++averageEmbedding;
          --embeddingSize;
        }
        while (embeddingSize);
      }

      v8 = v8 + Seconds;
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v6);

  if (v8 <= 0.0)
    goto LABEL_23;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v19 = self->_embeddingSize;
  v20 = self->_averageEmbedding;
  if (v19)
  {
    v21 = self->_embeddingSize;
    v22 = self->_averageEmbedding;
    do
    {
      *v22 = *v22 / v8;
      ++v22;
      --v21;
    }
    while (v21);
  }
  objc_msgSend(obja, "appendBytes:length:", v20, 4 * v19);
LABEL_24:
  if (v26)
  {
    -[VCPVideoEmbeddings convertToFloat16:](self, "convertToFloat16:", obja);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = obja;
  }
  else
  {
    v24 = obja;
    v23 = obja;
  }

  return v23;
}

- (id)convertToFloat16:(id)a3
{
  id v4;
  int64_t embeddingSize;
  size_t v6;
  const std::nothrow_t *v7;
  int *v8;
  size_t v9;
  _WORD *v10;
  void *v12;
  _WORD *v13;
  unint64_t v14;
  int *v15;
  _WORD *v16;
  int v17;
  __int16 v23[8];

  v4 = a3;
  embeddingSize = self->_embeddingSize;
  if ((unint64_t)embeddingSize >> 62)
    v6 = -1;
  else
    v6 = 4 * embeddingSize;
  v7 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  v8 = (int *)operator new[](v6, MEMORY[0x1E0DE4E10]);
  if (embeddingSize < 0)
    v9 = -1;
  else
    v9 = 2 * embeddingSize;
  v10 = operator new[](v9, v7);
  if (v8)
    _ZF = v10 == 0;
  else
    _ZF = 1;
  if (_ZF)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23[0] = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Embedding conversion error - out of memory", (uint8_t *)v23, 2u);
    }
    v12 = 0;
  }
  else
  {
    v13 = v10;
    objc_msgSend(v4, "getBytes:length:", v8, 4 * embeddingSize);
    v14 = self->_embeddingSize;
    if (v14)
    {
      v15 = v8;
      v16 = v13;
      do
      {
        v17 = *v15++;
        _S0 = v17;
        __asm { FCVT            H0, S0 }
        *v16++ = _S0;
        --v14;
      }
      while (v14);
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendBytes:length:", v13, 2 * self->_embeddingSize);
    MEMORY[0x1BCCA128C](v13, 0x1000C80BDFB0063);
    MEMORY[0x1BCCA128C](v8, 0x1000C8052888210);
  }

  return v12;
}

- (int64_t)embeddingType
{
  return self->_embeddingType;
}

- (unint64_t)embeddingSize
{
  return self->_embeddingSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_summarizedEmbeddingIds, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
}

@end
