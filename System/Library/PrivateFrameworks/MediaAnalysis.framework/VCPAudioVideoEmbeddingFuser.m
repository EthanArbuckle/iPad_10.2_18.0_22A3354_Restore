@implementation VCPAudioVideoEmbeddingFuser

+ (BOOL)supportFusionForVersion:(int)a3
{
  return objc_msgSend((id)objc_opt_class(), "supportsFusionOfVisionEmbeddingVersion:audioEmbeddingVersion:", a3, a3);
}

- (VCPAudioVideoEmbeddingFuser)initWithEmbeddingVersion:(unint64_t)a3
{
  int v3;
  VCPAudioVideoEmbeddingFuser *v4;
  uint64_t v5;
  NSMutableArray *results;
  id v7;
  uint64_t embeddingVersion;
  uint64_t v9;
  id v10;
  SNLanguageAlignedAVFuser *avFuser;
  VCPAudioVideoEmbeddingFuser *v12;
  id v13;
  uint64_t v14;
  VCPAudioVideoEmbeddingFuser *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCPAudioVideoEmbeddingFuser;
  v4 = -[VCPAudioVideoEmbeddingFuser init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    results = v4->_results;
    v4->_results = (NSMutableArray *)v5;

    v4->_embeddingVersion = v3;
    v4->_embeddingDim = 512;
    v7 = objc_alloc(MEMORY[0x1E0CD7580]);
    embeddingVersion = v4->_embeddingVersion;
    v17 = 0;
    v9 = objc_msgSend(v7, "initWithVisionEmbeddingVersion:audioEmbeddingVersion:error:", embeddingVersion, embeddingVersion, &v17);
    v10 = v17;
    avFuser = v4->_avFuser;
    v4->_avFuser = (SNLanguageAlignedAVFuser *)v9;

    v12 = v4;
    if (!v4->_avFuser)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "description");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v20 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  v15 = v12;

  return v15;
}

- (int)loadAudioEmbeddingResults:(id)a3 andVideoEmbeddingResults:(id)a4
{
  NSArray *v6;
  NSArray *v7;
  NSArray *audioEmbeddingResults;
  NSArray *v9;
  NSArray *videoEmbeddingResults;

  v6 = (NSArray *)a3;
  v7 = (NSArray *)a4;
  audioEmbeddingResults = self->_audioEmbeddingResults;
  self->_audioEmbeddingResults = v6;
  v9 = v6;

  videoEmbeddingResults = self->_videoEmbeddingResults;
  self->_videoEmbeddingResults = v7;

  return 0;
}

- (int)fuse:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  float v14;
  const __CFDictionary *v15;
  double Seconds;
  void *v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  SNLanguageAlignedAVFuser *avFuser;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  Float64 v35;
  NSObject *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  CFDictionaryRef v42;
  void *v43;
  void *v44;
  void *v45;
  int embeddingVersion;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  NSArray *obj;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void (**v58)(void);
  void *v59;
  CMTime start;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  CMTime v65;
  CMTime duration;
  CMTime time;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  CMTimeRange v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  CMTime rhs;
  CMTime lhs;
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _BYTE v88[128];
  CMTimeRange v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v58 = (void (**)(void))a3;
  if (!-[NSArray count](self->_videoEmbeddingResults, "count")
    || !-[NSArray count](self->_audioEmbeddingResults, "count"))
  {
    goto LABEL_82;
  }
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = self->_videoEmbeddingResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (!v4)
  {
    v57 = 0;
LABEL_79:

LABEL_80:
    if (v57)
    {
LABEL_81:
      -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
      goto LABEL_83;
    }
LABEL_82:
    v57 = 0;
    goto LABEL_83;
  }
  v5 = 0;
  v57 = 0;
  v56 = *(_QWORD *)v79;
LABEL_5:
  v55 = v4;
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v79 != v56)
      objc_enumerationMutation(obj);
    v7 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v6);
    v58[2]();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddings"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if ((_DWORD)v11 != self->_embeddingVersion)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        embeddingVersion = self->_embeddingVersion;
        LODWORD(v89.start.value) = 67109376;
        HIDWORD(v89.start.value) = embeddingVersion;
        LOWORD(v89.start.timescale) = 1024;
        *(CMTimeScale *)((char *)&v89.start.timescale + 2) = v11;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "EmbeddingFuser - expect embedding version %d, but got %d", (uint8_t *)&v89, 0xEu);
      }

      v57 = -50;
      goto LABEL_79;
    }
    memset(&v77, 0, sizeof(v77));
    CMTimeRangeMakeFromDictionary(&v77, (CFDictionaryRef)v7);
    if ((v77.start.flags & 1) == 0 || (v77.duration.flags & 1) == 0 || v77.duration.epoch || v77.duration.value < 0)
    {

      v57 = -50;
      goto LABEL_81;
    }
    if (!v59)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v20 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v89.start.value) = 0;
          _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_DEFAULT, "EmbeddingFuser - missing video embedding data", (uint8_t *)&v89, 2u);
        }
      }
      goto LABEL_70;
    }
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__25;
    v75 = __Block_byref_object_dispose__25;
    v12 = 0;
    v53 = v59;
    v76 = v53;
    v13 = (int)v5;
    v14 = 0.0;
    while (v13 < (int)-[NSArray count](self->_audioEmbeddingResults, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_audioEmbeddingResults, "objectAtIndexedSubscript:", v13);
      v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&v89, 0, sizeof(v89));
      CMTimeRangeMakeFromDictionary(&v89, v15);
      if ((v89.start.flags & 1) == 0 || (v89.duration.flags & 1) == 0 || v89.duration.epoch || v89.duration.value < 0)
      {

        goto LABEL_41;
      }
      range = v89;
      memset(&v70, 0, sizeof(v70));
      otherRange = v77;
      CMTimeRangeGetIntersection(&v70, &range, &otherRange);
      time = v70.duration;
      if (CMTimeGetSeconds(&time) > v14)
      {
        duration = v70.duration;
        Seconds = CMTimeGetSeconds(&duration);
        -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("attributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("embeddings"));
        v18 = objc_claimAutoreleasedReturnValue();

        v14 = Seconds;
        v12 = (void *)v18;
        v5 = v13;
      }
      lhs = v77.start;
      rhs = v77.duration;
      CMTimeAdd(&v65, &lhs, &rhs);
      lhs = v89.start;
      rhs = v65;
      v19 = CMTimeCompare(&lhs, &rhs) > 0;

      if (v19)
        break;
      ++v13;
    }
    if (!objc_msgSend(v12, "length") || v14 < 1.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        start = v77.start;
        v35 = CMTimeGetSeconds(&start);
        LODWORD(v89.start.value) = 134217984;
        *(Float64 *)((char *)&v89.start.value + 4) = v35;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "EmbeddingFuser - does not find paired audio embedding at time %f", (uint8_t *)&v89, 0xCu);
      }
LABEL_68:
      v89 = v77;
      v42 = CMTimeRangeCopyAsDictionary(&v89, 0);
      v43 = (void *)-[__CFDictionary mutableCopy](v42, "mutableCopy");

      v85[0] = v72[5];
      v84[0] = CFSTR("embeddings");
      v84[1] = CFSTR("embeddingVersion");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("attributes"));

      -[NSMutableArray addObject:](self->_results, "addObject:", v43);
      v34 = 0;
      goto LABEL_69;
    }
    if (objc_msgSend(v53, "length") != 2 * self->_embeddingDim)
    {
      if ((int)MediaAnalysisLogLevel() >= 3
        && (v36 = MEMORY[0x1E0C81028], os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)))
      {
        v37 = objc_msgSend(v53, "length");
        LODWORD(v89.start.value) = 67109120;
        HIDWORD(v89.start.value) = v37;
        v34 = 8;
        _os_log_impl(&dword_1B6C4A000, v36, OS_LOG_TYPE_ERROR, "EmbeddingFuser unexpected embedding data length %d", (uint8_t *)&v89, 8u);
      }
      else
      {
LABEL_41:
        v34 = 8;
      }
      v57 = -50;
      goto LABEL_69;
    }
    v21 = objc_alloc(MEMORY[0x1E0C9E970]);
    v22 = objc_msgSend(objc_retainAutorelease(v53), "bytes");
    v87[0] = &unk_1E6B74240;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_embeddingDim);
    v23 = v5;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v52 = (void *)objc_msgSend(v21, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v22, v24, 65552, &unk_1E6B76500, 0, &v64);
    v25 = v64;

    v5 = v23;
    if (!v25 && v52)
    {
      v48 = objc_alloc(MEMORY[0x1E0C9E970]);
      v51 = objc_retainAutorelease(v12);
      v26 = objc_msgSend(v51, "bytes");
      v86[0] = &unk_1E6B74240;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v51, "length") >> 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v86[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      v49 = (void *)objc_msgSend(v48, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v26, v28, 65552, &unk_1E6B76518, 0, &v63);
      v29 = v63;

      if (v29 || !v49)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v29, "description");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v89.start.value) = 138412290;
          *(CMTimeValue *)((char *)&v89.start.value + 4) = (CMTimeValue)v39;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "EmbeddingFuser failed to create video embedding %@", (uint8_t *)&v89, 0xCu);

        }
        v34 = 1;
      }
      else
      {
        avFuser = self->_avFuser;
        v62 = 0;
        -[SNLanguageAlignedAVFuser fuseVisionEmbedding:audioEmbedding:error:](avFuser, "fuseVisionEmbedding:audioEmbedding:error:", v52, v49, &v62);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v62;
        if (v29 || !v31)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v29, "description");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v89.start.value) = 138412290;
            *(CMTimeValue *)((char *)&v89.start.value + 4) = (CMTimeValue)v40;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v89, 0xCu);

          }
          v34 = 8;
          v57 = 1;
        }
        else
        {
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __36__VCPAudioVideoEmbeddingFuser_fuse___block_invoke;
          v61[3] = &unk_1E6B16828;
          v61[4] = &v71;
          objc_msgSend(v31, "getBytesWithHandler:", v61);
          if (objc_msgSend(v31, "dataType") == 65568)
          {
            +[VCPTextEncoder convertFloat32ToFloat16:](VCPTextEncoder, "convertFloat32ToFloat16:", v72[5]);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v72[5];
            v72[5] = v32;

          }
          if (objc_msgSend((id)v72[5], "length") == 2 * self->_embeddingDim)
          {
            v34 = 0;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v41 = objc_msgSend(v31, "count");
              LODWORD(v89.start.value) = 67109120;
              HIDWORD(v89.start.value) = v41;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "EmbeddingFuser unexpected fusion embedding size %d", (uint8_t *)&v89, 8u);
            }
            v34 = 1;
          }
        }

      }
      if (v34)
      {
        v12 = v51;
        goto LABEL_69;
      }
      goto LABEL_68;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v25, "description");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v89.start.value) = 138412290;
      *(CMTimeValue *)((char *)&v89.start.value + 4) = (CMTimeValue)v38;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "EmbeddingFuser failed to create video embedding %@", (uint8_t *)&v89, 0xCu);

    }
    v34 = 1;
LABEL_69:

    _Block_object_dispose(&v71, 8);
    if (v34)
      break;
LABEL_70:

    if (++v6 == v55)
    {
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      if (v4)
        goto LABEL_5;
      goto LABEL_79;
    }
  }

  if (v34 == 8)
    goto LABEL_80;
  v57 = -18;
LABEL_83:

  return v57;
}

void __36__VCPAudioVideoEmbeddingFuser_fuse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (id)results
{
  NSMutableArray *results;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  results = self->_results;
  v4 = CFSTR("AudioFusedVideoEmbeddingResults");
  v5[0] = results;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avFuser, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_videoEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_audioEmbeddingResults, 0);
}

@end
