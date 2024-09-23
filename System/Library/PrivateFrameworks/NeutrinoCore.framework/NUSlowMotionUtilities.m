@implementation NUSlowMotionUtilities

+ (id)slowMotionVideoFromAsset:(id)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  id v13;
  const __CFString *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[32];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a6)
  {
    NUAssertLogger_3290();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3290();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUSlowMotionUtilities slowMotionVideoFromAsset:rate:range:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/SlowMotion/NUSlowMotionUtilities.m", 26, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"error != NULL");
  }
  v10 = v9;
  v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&buf[16] = v11;
  v33 = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(MEMORY[0x1E0D75298], "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", v9, buf, 1, 0, 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v33), LODWORD(a4))));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v14 = CFSTR("failed to process slow motion video");
LABEL_7:
    +[NUError unknownError:object:](NUError, "unknownError:object:", v14, v10);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = CFSTR("slow motion asset is not an AVComposition");
    goto LABEL_7;
  }
  v13 = v12;
LABEL_8:

  return v13;
}

+ (id)slowMotionAudioMixFromAsset:(id)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  id v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BYTE buf[32];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a6)
  {
    NUAssertLogger_3290();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3290();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUSlowMotionUtilities slowMotionAudioMixFromAsset:rate:range:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/SlowMotion/NUSlowMotionUtilities.m", 51, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"error != NULL");
  }
  v10 = v9;
  v31 = 0;
  v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&buf[16] = v11;
  v33 = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(MEMORY[0x1E0D75298], "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", v9, buf, 1, &v31, 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v33), LODWORD(a4))));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;
  if (!v13)
  {
    if (v12 == v10)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C8B040]);
    }
    else
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("failed to process slow motion audio"), v10);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

+ (id)timeMapperForAssetDuration:(double)a3 rate:(float)a4 range:(id *)a5 error:(id *)a6
{
  __int128 v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[32];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a6)
  {
    NUAssertLogger_3290();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3290();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUSlowMotionUtilities timeMapperForAssetDuration:rate:range:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/SlowMotion/NUSlowMotionUtilities.m", 77, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  v7 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&buf[16] = v7;
  v29 = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(MEMORY[0x1E0D75298], "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", buf, 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("NUSlowMotionTimeRangeMapper is Nil. Insufficent in length / placement to allow for the desired slow down, the original asset is returned and timing stays the same"), 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
