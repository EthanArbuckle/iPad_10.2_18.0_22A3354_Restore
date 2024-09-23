@implementation NURenderPipelineVideoSampleSlice

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  const __CFAllocator *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSDictionary *metadataSamples;
  id v18;
  id v19;
  id obj;
  _QWORD v22[4];
  id v23;
  NURenderPipelineVideoSampleSlice *v24;
  id v25;
  CMTime v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTime time;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[NSDictionary allKeys](self->_videoFrames, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  time = (CMTime)self->_frameTime;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  objc_msgSend(v5, "appendFormat:", CFSTR("[(%@) videoFrames: "), v7);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        __47__NURenderPipelineVideoSampleSlice_description__block_invoke(v8, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_videoFrames, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          objc_msgSend(v14, "frameTime");
        else
          memset(&v26, 0, sizeof(v26));
        time = v26;
        v16 = (__CFString *)CMTimeCopyDescription(v6, &time);
        objc_msgSend(v5, "appendFormat:", CFSTR("%@: %@ "), v13, v16);

        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v9 = v8;
    }
    while (v8);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\tmetadataSamples: "));
  metadataSamples = self->_metadataSamples;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __47__NURenderPipelineVideoSampleSlice_description__block_invoke_2;
  v22[3] = &unk_1E5060968;
  v18 = v5;
  v24 = self;
  v25 = &__block_literal_global_1401;
  v23 = v18;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](metadataSamples, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(v18, "appendString:", CFSTR("]"));
  v19 = v18;

  return v19;
}

- (NURenderPipelineVideoSampleSlice)initWithFrameTime:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((a3->var2 & 1) == 0)
  {
    NUAssertLogger_1305();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(frameTime)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.var0) = 138543362;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.var0) = 138543618;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v11;
        LOWORD(buf.var2) = 2114;
        *(_QWORD *)((char *)&buf.var2 + 2) = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.var0) = 138543362;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 307, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"CMTIME_IS_VALID(frameTime)");
  }
  buf = *a3;
  return -[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:](self, "initWithFrameTime:videoFrames:metadataSamples:", &buf, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
}

- (NURenderPipelineVideoSampleSlice)initWithFrameTime:(id *)a3 videoFrames:(id)a4 metadataSamples:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  objc_super v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((a3->var2 & 1) == 0)
  {
    NUAssertLogger_1305();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(frameTime)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v39;
        v69 = 2114;
        v70 = v43;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 313, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"CMTIME_IS_VALID(frameTime)");
  }
  if (!v8)
  {
    NUAssertLogger_1305();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoFrames != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v48;
        v69 = 2114;
        v70 = v52;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 314, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"videoFrames != nil");
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_1305();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadataSamples != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        v69 = 2114;
        v70 = v61;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 315, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"metadataSamples != nil");
  }
  v66.receiver = self;
  v66.super_class = (Class)NURenderPipelineVideoSampleSlice;
  v11 = -[NURenderPipelineVideoSampleSlice init](&v66, sel_init);
  v12 = objc_msgSend(v8, "copy");
  v13 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v12;

  v14 = objc_msgSend(v10, "copy");
  v15 = (void *)*((_QWORD *)v11 + 2);
  *((_QWORD *)v11 + 2) = v14;

  v16 = *(_OWORD *)&a3->var0;
  *((_QWORD *)v11 + 5) = a3->var3;
  *(_OWORD *)(v11 + 24) = v16;

  return (NURenderPipelineVideoSampleSlice *)v11;
}

- (id)videoFrameFromKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_videoFrames, "objectForKeyedSubscript:", a3);
}

- (id)metadataSampleFromKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_metadataSamples, "objectForKeyedSubscript:", a3);
}

- (BOOL)containsVideoFrameForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NURenderPipelineVideoSampleSlice videoFrameFromKey:](self, "videoFrameFromKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)containsMetadataSampleForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NURenderPipelineVideoSampleSlice metadataSampleFromKey:](self, "metadataSampleFromKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSDictionary)videoFrames
{
  return self->_videoFrames;
}

- (NSDictionary)metadataSamples
{
  return self->_metadataSamples;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataSamples, 0);
  objc_storeStrong((id *)&self->_videoFrames, 0);
}

id __47__NURenderPipelineVideoSampleSlice_description__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "length");
  if (v3 >= 3)
    v4 = 3;
  else
    v4 = v3;
  objc_msgSend(v2, "substringToIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __47__NURenderPipelineVideoSampleSlice_description__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t, id);
  id v6;
  void *v7;
  void *v8;
  const __CFAllocator *v9;
  __CFString *v10;
  CMTime v11;
  CMTime time;

  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = *(void (**)(uint64_t, id))(v4 + 16);
  v6 = a2;
  v5(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 16), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "frameTime");
  else
    memset(&v11, 0, sizeof(v11));
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time = v11;
  v10 = (__CFString *)CMTimeCopyDescription(v9, &time);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@ "), v7, v10);

}

@end
