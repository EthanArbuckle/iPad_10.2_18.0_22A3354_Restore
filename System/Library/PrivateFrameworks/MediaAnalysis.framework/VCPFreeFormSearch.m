@implementation VCPFreeFormSearch

+ (float)getMinSimilarity
{
  if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 3)
  {
    +[VCPFreeFormSearch getMinSimilarity]::minSimilarity = 1057803469;
    return 0.55;
  }
  else if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 4)
  {
    +[VCPFreeFormSearch getMinSimilarity]::minSimilarity = 1053609165;
    return 0.4;
  }
  else if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5)
  {
    +[VCPFreeFormSearch getMinSimilarity]::minSimilarity = 1053273620;
    return 0.39;
  }
  else
  {
    return *(float *)&+[VCPFreeFormSearch getMinSimilarity]::minSimilarity;
  }
}

+ (float)getMinSimilarityOneToken
{
  if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 3)
  {
    +[VCPFreeFormSearch getMinSimilarityOneToken]::minSimilarity = 1048576000;
    return 0.25;
  }
  else if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 4)
  {
    +[VCPFreeFormSearch getMinSimilarityOneToken]::minSimilarity = 1036831949;
    return 0.1;
  }
  else if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5)
  {
    +[VCPFreeFormSearch getMinSimilarityOneToken]::minSimilarity = 1035489772;
    return 0.09;
  }
  else
  {
    return *(float *)&+[VCPFreeFormSearch getMinSimilarityOneToken]::minSimilarity;
  }
}

+ (float)getMinSimilarityDiffFor1UP
{
  if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") != 3
    && +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") != 4
    && +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") != 5)
  {
    return *(float *)&+[VCPFreeFormSearch getMinSimilarityDiffFor1UP]::minSimilarityDiff;
  }
  +[VCPFreeFormSearch getMinSimilarityDiffFor1UP]::minSimilarityDiff = 1045220557;
  return 0.2;
}

+ (float)getHighSimilarityThreshold
{
  if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 3)
  {
    +[VCPFreeFormSearch getHighSimilarityThreshold]::threshold = 1059481190;
    return 0.65;
  }
  else if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 4)
  {
    +[VCPFreeFormSearch getHighSimilarityThreshold]::threshold = 1056964608;
    return 0.5;
  }
  else if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5)
  {
    +[VCPFreeFormSearch getHighSimilarityThreshold]::threshold = 1056629064;
    return 0.49;
  }
  else
  {
    return *(float *)&+[VCPFreeFormSearch getHighSimilarityThreshold]::threshold;
  }
}

+ (BOOL)getSearchTesting
{
  return 0;
}

- (VCPFreeFormSearch)init
{
  VCPFreeFormSearch *v2;
  uint64_t v3;
  NSMutableArray *fileNames;
  uint64_t v5;
  NSMutableArray *timeRanges;
  uint64_t v7;
  NSMutableArray *embeddings;
  uint64_t v9;
  NSMutableArray *fileIndices;
  int64_t v11;
  uint64_t v12;
  MADTextEmbeddingThreshold *v13;
  int v14;
  MADTextEmbeddingThreshold *textEmbeddingThreshold;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VCPFreeFormSearch;
  v2 = -[VCPFreeFormSearch init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    fileNames = v2->_fileNames;
    v2->_fileNames = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    timeRanges = v2->_timeRanges;
    v2->_timeRanges = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    embeddings = v2->_embeddings;
    v2->_embeddings = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    fileIndices = v2->_fileIndices;
    v2->_fileIndices = (NSMutableArray *)v9;

    v11 = +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision");
    if ((unint64_t)(v11 - 3) >= 3)
    {
      if (v11 == 2)
        v14 = 768;
      else
        v14 = 512;
      v2->_embeddingDim = v14;
      textEmbeddingThreshold = v2->_textEmbeddingThreshold;
      v2->_textEmbeddingThreshold = 0;

    }
    else
    {
      +[MADTextEmbeddingThreshold createForEmbeddingVersion:](MADTextEmbeddingThreshold, "createForEmbeddingVersion:", +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v2->_textEmbeddingThreshold;
      v2->_textEmbeddingThreshold = (MADTextEmbeddingThreshold *)v12;

      v2->_embeddingDim = 512;
    }
  }
  return v2;
}

- (int)loadEmbeddings:(id)a3
{
  __int128 v4;
  CMTimeValue v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSMutableArray *fileIndices;
  void *v16;
  NSMutableArray *timeRanges;
  CFDictionaryRef v18;
  CMTimeFlags v19;
  int v20;
  int v21;
  uint64_t embeddingDim;
  size_t v23;
  float *v24;
  size_t v25;
  __int16 *v26;
  __int16 *v27;
  uint64_t v28;
  void *v29;
  float *videoEmbedings;
  uint64_t v31;
  uint64_t v32;
  float *v33;
  __int16 *v34;
  __int16 v35;
  int v42;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  CMTimeValue v48;
  uint64_t i;
  id v50;
  id v51;
  unsigned int v52;
  CMTimeRange v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  CMTimeRange range;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  -[VCPFreeFormSearch reset](self, "reset");
  if (v50 && objc_msgSend(v50, "count"))
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v50, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v45)
    {
      v52 = 0;
      v46 = *(_QWORD *)v59;
      *(_QWORD *)&v4 = 138412802;
      v44 = v4;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v59 != v46)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[NSMutableArray addObject:](self->_fileNames, "addObject:", v5, v44);
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v48 = v5;
          objc_msgSend(v50, "objectForKeyedSubscript:", v5);
          v51 = (id)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v6)
          {
            v7 = *(_QWORD *)v55;
            while (2)
            {
              for (j = 0; j != v6; ++j)
              {
                if (*(_QWORD *)v55 != v7)
                  objc_enumerationMutation(v51);
                v9 = *(const __CFDictionary **)(*((_QWORD *)&v54 + 1) + 8 * j);
                memset(&v53, 0, sizeof(v53));
                CMTimeRangeMakeFromDictionary(&v53, v9);
                -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("embeddings"));
                v11 = (void *)objc_claimAutoreleasedReturnValue();

                -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("attributes"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (v13)
                {
                  v14 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
                  if (v14 != (int)objc_msgSend(v13, "intValue"))
                    goto LABEL_26;
                }
                else if (+[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion") != 2)
                {
LABEL_26:
                  if ((int)MediaAnalysisLogLevel() >= 4
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    v19 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
                    v20 = objc_msgSend(v13, "intValue");
                    LODWORD(range.start.value) = v44;
                    *(CMTimeValue *)((char *)&range.start.value + 4) = v48;
                    LOWORD(range.start.flags) = 1024;
                    *(CMTimeFlags *)((char *)&range.start.flags + 2) = v19;
                    WORD1(range.start.epoch) = 1024;
                    HIDWORD(range.start.epoch) = v20;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Video embedding version mismatch skip. Expect %d, Got %d", (uint8_t *)&range, 0x18u);
                  }

                  goto LABEL_30;
                }
                if (self->_embeddingDim != (unint64_t)objc_msgSend(v11, "length") >> 1)
                {
                  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(range.start.value) = 0;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video embedding dimension doesn't match with requirement", (uint8_t *)&range, 2u);
                  }

                  v42 = -50;
                  goto LABEL_56;
                }
                if (v11)
                {
                  fileIndices = self->_fileIndices;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v52);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableArray addObject:](fileIndices, "addObject:", v16);

                  timeRanges = self->_timeRanges;
                  range = v53;
                  v18 = CMTimeRangeCopyAsDictionary(&range, 0);
                  -[NSMutableArray addObject:](timeRanges, "addObject:", v18);

                  -[NSMutableArray addObject:](self->_embeddings, "addObject:", v11);
                }
                else if ((int)MediaAnalysisLogLevel() >= 4
                       && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(range.start.value) = 138412290;
                  *(CMTimeValue *)((char *)&range.start.value + 4) = v48;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Missing embedding for %@", (uint8_t *)&range, 0xCu);
                }

              }
              v6 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
              if (v6)
                continue;
              break;
            }
          }
LABEL_30:

          ++v52;
        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v45);
    }

    v21 = -[NSMutableArray count](self->_fileIndices, "count");
    self->_numVideos = v21;
    embeddingDim = self->_embeddingDim;
    if ((int)embeddingDim * v21 < 0)
      v23 = -1;
    else
      v23 = 4 * (int)embeddingDim * v21;
    v24 = (float *)operator new[](v23, MEMORY[0x1E0DE4E10]);
    self->_videoEmbedings = v24;
    if (!v24
      || ((int)embeddingDim < 0 ? (v25 = -1) : (v25 = 2 * embeddingDim),
          (v26 = (__int16 *)operator new[](v25, MEMORY[0x1E0DE4E10])) == 0))
    {
      v42 = -108;
      goto LABEL_56;
    }
    v27 = v26;
    if (v21 >= 1)
    {
      v28 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_embeddings, "objectAtIndexedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        videoEmbedings = self->_videoEmbedings;
        v31 = self->_embeddingDim;
        objc_msgSend(v29, "getBytes:length:", v27, 2 * v31);
        v32 = self->_embeddingDim;
        if ((int)v32 >= 1)
        {
          v33 = &videoEmbedings[(int)v31 * (int)v28];
          v34 = v27;
          do
          {
            v35 = *v34++;
            _H0 = v35;
            __asm { FCVT            S0, H0 }
            *(_DWORD *)v33++ = _S0;
            --v32;
          }
          while (v32);
        }

        ++v28;
      }
      while (v28 < self->_numVideos);
    }
    MEMORY[0x1BCCA128C](v27, 0x1000C80BDFB0063);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(range.start.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No video embedding results", (uint8_t *)&range, 2u);
  }
  v42 = 0;
LABEL_56:

  return v42;
}

- (void)reset
{
  float *inputData;
  float *videoEmbedings;

  -[NSMutableArray removeAllObjects](self->_fileNames, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_timeRanges, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_embeddings, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_fileIndices, "removeAllObjects");
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    self->_inputData = 0;
  }
  videoEmbedings = self->_videoEmbedings;
  if (videoEmbedings)
  {
    MEMORY[0x1BCCA128C](videoEmbedings, 0x1000C8052888210);
    self->_videoEmbedings = 0;
  }
  self->_numVideos = 0;
}

- (void)dealloc
{
  float *inputData;
  float *videoEmbedings;
  objc_super v5;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  videoEmbedings = self->_videoEmbedings;
  if (videoEmbedings)
    MEMORY[0x1BCCA128C](videoEmbedings, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)VCPFreeFormSearch;
  -[VCPFreeFormSearch dealloc](&v5, sel_dealloc);
}

- (id)searchForQuery:(id)a3 matchingScoreOnly:(BOOL)a4 topK:(int)a5
{
  _BOOL4 v5;
  unint64_t v7;
  uint64_t embeddingDim;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  CMTimeScale v17;
  float v18;
  float v19;
  void *v20;
  vDSP_Length *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  VCPFreeFormSearch *v25;
  char *v26;
  uint64_t numVideos;
  vDSP_Length v28;
  size_t v29;
  uint64_t v30;
  float v31;
  float v32;
  float *v33;
  float *v34;
  float v35;
  VCPFreeFormSearch *v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  int v40;
  unint64_t v41;
  unint64_t i;
  VCPFreeFormSearch *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  float v47;
  const __CFDictionary *v48;
  CFDictionaryRef v49;
  CFDictionaryRef v50;
  double v51;
  void *v52;
  void *v53;
  VCPFreeFormSearch *v54;
  uint64_t v55;
  void *v56;
  vDSP_Length *v57;
  NSMutableArray *fileNames;
  void *v59;
  void *v60;
  void *v61;
  const __CFDictionary *v62;
  double v63;
  void *v64;
  void *v65;
  CFDictionaryRef v66;
  CFDictionaryRef v67;
  float v68;
  void *v69;
  uint64_t v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v78[2];
  float *v79;
  const __CFString *v80;
  const __CFString *v81;
  CMTime *p_duration;
  const __CFString *v83;
  const __CFString *v84;
  int v85;
  id v86;
  int v87;
  __CFString *v88;
  vDSP_Length *v89;
  id v90;
  const __CFString *v91;
  __CFString *v92;
  float *v93;
  VCPFreeFormSearch *v94;
  float v95;
  int v96;
  int v97;
  float v98;
  CMTime start;
  __CFString *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[3];
  _QWORD v106[3];
  const __CFString *v107;
  void *v108;
  _QWORD v109[3];
  _QWORD v110[3];
  CMTimeRange buf;
  _QWORD v112[4];

  v85 = a5;
  v5 = a4;
  v112[2] = *MEMORY[0x1E0C80C00];
  v86 = a3;
  v7 = objc_msgSend(v86, "length");
  embeddingDim = self->_embeddingDim;
  v94 = self;
  if (embeddingDim != v7 >> 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v86, "length");
      v17 = v94->_embeddingDim;
      LODWORD(buf.start.value) = 67109376;
      HIDWORD(buf.start.value) = v16 >> 2;
      LOWORD(buf.start.timescale) = 1024;
      *(CMTimeScale *)((char *)&buf.start.timescale + 2) = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Query embedding dimension %d doesn't match with requirement %d", (uint8_t *)&buf, 0xEu);
    }
    goto LABEL_11;
  }
  *(float *)&v97 = 1.0;
  v98 = 0.0;
  v96 = 0;
  if (self->_textEmbeddingThreshold)
  {
    +[VCPTextEncoder convertFloat32ToFloat16:](VCPTextEncoder, "convertFloat32ToFloat16:", v86);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D476B8]);
    v11 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
    v112[0] = &unk_1E6B74D98;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v9, "length") >> 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithVersion:data:type:shape:", v11, v9, 1, v13);

    v15 = -[MADTextEmbeddingThreshold processEmbedding:bias:scale:threshold:](v94->_textEmbeddingThreshold, "processEmbedding:bias:scale:threshold:", v14, &v98, &v97, &v96);
    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.start.value) = 67109120;
        HIDWORD(buf.start.value) = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MD4 Failed to get calibration bias/scale with Error %d", (uint8_t *)&buf, 8u);
      }

LABEL_11:
      v90 = 0;
      goto LABEL_49;
    }

    self = v94;
  }
  +[VCPFreeFormSearch getMinSimilarity](VCPFreeFormSearch, "getMinSimilarity");
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v90 = (id)objc_claimAutoreleasedReturnValue();
  v20 = (void *)operator new[]();
  v79 = (float *)operator new[]();
  v93 = (float *)operator new[]();
  v21 = (vDSP_Length *)operator new[]();
  v78[1] = v78;
  MEMORY[0x1E0C80A78]((_QWORD *)(4 * self->_numVideos), v21, v22, v23);
  v25 = self;
  v26 = (char *)v78 - ((v24 + 15) & 0x7FFFFFFF0);
  numVideos = v25->_numVideos;
  bzero(v26, 4 * numVideos);
  v95 = 0.0;
  if ((int)numVideos >= 1)
  {
    v28 = 0;
    do
    {
      v21[v28] = v28;
      ++v28;
    }
    while (numVideos != v28);
  }
  v89 = v21;
  v29 = 4 * v94->_embeddingDim;
  bzero(v20, v29);
  objc_msgSend(v86, "getBytes:length:", v20, v29);
  vDSP_mmul(v94->_videoEmbedings, 1, (const float *)v20, 1, v79, 1, v94->_numVideos, 1uLL, v94->_embeddingDim);
  if (v94->_textEmbeddingThreshold)
  {
    v30 = v94->_numVideos;
    if ((int)v30 >= 1)
    {
      v31 = *(float *)&v97;
      v32 = v98;
      v33 = v79;
      v34 = v93;
      do
      {
        v35 = *v33++;
        *v34++ = 1.0 / (float)(expf(-(float)(v32 + (float)(v35 * v31))) + 1.0);
        --v30;
      }
      while (v30);
    }
  }
  else
  {
    vDSP_rmsqv((const float *)v20, 1, &v95, v94->_embeddingDim);
    v36 = v94;
    v37 = v94->_numVideos;
    if ((int)v37 > 0)
    {
      v38 = 0;
      v39 = 0;
      v40 = v94->_embeddingDim;
      do
      {
        vDSP_rmsqv(&v36->_videoEmbedings[v40 * (int)v39], 1, (float *)&v26[v38], v40);
        v40 = v36->_embeddingDim;
        *(float *)&v26[4 * v39] = (float)(v95 * *(float *)&v26[4 * v39]) * (float)v40;
        ++v39;
        v37 = v36->_numVideos;
        v38 += 4;
      }
      while (v39 < v37);
    }
    vDSP_vsdiv(v79, 1, (const float *)v26, v93, 1, v37);
  }
  if (v5)
  {
    v41 = 0;
    LODWORD(i) = 0;
    v92 = CFSTR("start");
    v91 = CFSTR("duration");
    while (1)
    {
      v43 = v94;
      if (-[NSMutableArray count](v94->_fileNames, "count") <= v41)
        break;
      -[NSMutableArray objectAtIndexedSubscript:](v43->_fileNames, "objectAtIndexedSubscript:", v41);
      v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = (int)i; -[NSMutableArray count](v43->_fileIndices, "count") > i; ++i)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v94->_fileIndices, "objectAtIndexedSubscript:", i);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v41 == objc_msgSend(v45, "intValue");

        if (!v46)
          break;
        v47 = v93[i];
        memset(&buf, 0, sizeof(buf));
        -[NSMutableArray objectAtIndexedSubscript:](v94->_timeRanges, "objectAtIndexedSubscript:", i);
        v48 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeRangeMakeFromDictionary(&buf, v48);

        v109[0] = v92;
        start = buf.start;
        v49 = CMTimeCopyAsDictionary(&start, 0);
        v110[0] = v49;
        v109[1] = v91;
        start = buf.duration;
        v50 = CMTimeCopyAsDictionary(&start, 0);
        v110[1] = v50;
        v109[2] = CFSTR("quality");
        *(float *)&v51 = v47;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v110[2] = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 3);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v53);

        v43 = v94;
      }
      objc_msgSend(v90, "setObject:forKeyedSubscript:", v44, v88);

      ++v41;
    }
  }
  else
  {
    vDSP_vsorti(v79, v89, 0, v94->_numVideos, -1);
    v54 = v94;
    if (v85 > 0 || (v85 = v94->_numVideos, v85 >= 1))
    {
      v87 = 0;
      LODWORD(v55) = 0;
      v91 = CFSTR("SimilarityScore");
      v84 = CFSTR("start");
      v83 = CFSTR("duration");
      p_duration = &buf.duration;
      v88 = CFSTR("attributes");
      v80 = CFSTR("SceneResults");
      v81 = CFSTR("Rank");
      while (1)
      {
        if ((int)v55 >= v54->_numVideos)
        {
          v60 = 0;
        }
        else
        {
          v56 = 0;
          v55 = (int)v55;
          v57 = v89;
          while (1)
          {
            fileNames = v54->_fileNames;
            -[NSMutableArray objectAtIndexedSubscript:](v54->_fileIndices, "objectAtIndexedSubscript:", v57[v55]);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray objectAtIndexedSubscript:](fileNames, "objectAtIndexedSubscript:", (int)objc_msgSend(v59, "intValue"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v90, "allKeys");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(fileNames) = objc_msgSend(v61, "containsObject:", v60);

            if ((fileNames & 1) == 0)
              break;
            ++v55;
            v54 = v94;
            v56 = v60;
            v57 = v89;
            if (v55 >= v94->_numVideos)
              goto LABEL_43;
          }
          v54 = v94;
        }
LABEL_43:
        if (-[NSMutableArray count](v54->_timeRanges, "count") == (int)v55 || v93[v89[(int)v55]] <= v19)
          break;
        memset(&buf, 0, sizeof(buf));
        -[NSMutableArray objectAtIndexedSubscript:](v54->_timeRanges, "objectAtIndexedSubscript:");
        v62 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeRangeMakeFromDictionary(&buf, v62);

        v107 = v91;
        *(float *)&v63 = v93[v89[(int)v55]];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v105[0] = v84;
        start = buf.start;
        v66 = CMTimeCopyAsDictionary(&start, 0);
        v106[0] = v66;
        v105[1] = v83;
        start = *p_duration;
        v67 = CMTimeCopyAsDictionary(&start, 0);
        v105[2] = v88;
        v106[1] = v67;
        v106[2] = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
        v92 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v68 = v93[v89[(int)v55]];
        objc_msgSend(v90, "allKeys");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "count");

        v103[0] = v88;
        v101[0] = v81;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = v91;
        v102[0] = v71;
        *(float *)&v72 = v68;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v102[1] = v73;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v103[1] = v80;
        v104[0] = v74;
        v100 = v92;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v104[1] = v75;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setObject:forKeyedSubscript:", v76, v60);

        ++v87;
        v54 = v94;
        if (v87 == v85)
          goto LABEL_48;
      }

    }
  }
LABEL_48:
  MEMORY[0x1BCCA128C](v79, 0x1000C8052888210);
  MEMORY[0x1BCCA128C](v93, 0x1000C8052888210);
  MEMORY[0x1BCCA128C](v89, 0x1000C8000313F17);
LABEL_49:

  return v90;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEmbeddingThreshold, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
  objc_storeStrong((id *)&self->_timeRanges, 0);
  objc_storeStrong((id *)&self->_fileIndices, 0);
  objc_storeStrong((id *)&self->_fileNames, 0);
}

@end
