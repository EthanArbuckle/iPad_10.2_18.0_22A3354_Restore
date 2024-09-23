@implementation _NUCIFilterPipelineBuilder

- (_NUCIFilterPipelineBuilder)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_505);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_505);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_505);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUCIFilterPipelineBuilder init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 749, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (_NUCIFilterPipelineBuilder)initWithCIFilterName:(id)a3
{
  id v4;
  void *v5;
  _NUCIFilterPipelineBuilder *v6;
  uint64_t v7;
  NSString *filterName;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4813();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "filterName != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUCIFilterPipelineBuilder initWithCIFilterName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 753, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"filterName != nil");
  }
  v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)_NUCIFilterPipelineBuilder;
  v6 = -[_NUCIFilterPipelineBuilder init](&v26, sel_init);
  v7 = objc_msgSend(v5, "copy");
  filterName = v6->_filterName;
  v6->_filterName = (NSString *)v7;

  return v6;
}

- (id)buildPipeline:(id *)a3
{
  CIFilter *v5;
  CIFilter *filter;
  CIFilter *v7;
  void *v8;
  NUVersion *v9;
  NUIdentifier *v10;
  _NUPipeline *v11;
  _NUPipeline *v12;
  _NUPipeline *v13;

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", self->_filterName);
  v5 = (CIFilter *)objc_claimAutoreleasedReturnValue();
  filter = self->_filter;
  self->_filter = v5;

  v7 = self->_filter;
  if (v7)
  {
    -[CIFilter valueForKey:](v7, "valueForKey:", *MEMORY[0x1E0C9E288]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NUVersion initWithMajor:minor:]([NUVersion alloc], "initWithMajor:minor:", objc_msgSend(v8, "integerValue"), 0);
    v10 = -[NUIdentifier initWithNamespace:name:version:]([NUIdentifier alloc], "initWithNamespace:name:version:", CFSTR("com.apple.CoreImage"), self->_filterName, v9);
    v11 = -[_NUPipeline initWithIdentifier:]([_NUPipeline alloc], "initWithIdentifier:", v10);
    if (-[_NUCIFilterPipelineBuilder buildPipeline:error:](self, "buildPipeline:error:", v11, a3))
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

  }
  else
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Filter not found"), self->_filterName);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (BOOL)buildPipeline:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NUChannel *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  NUChannel *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  NUFilterNode *obja;
  void *v36;
  id v37;
  id v38;
  _NUCIFilterPipelineBuilder *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v30 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CIFilter attributes](self->_filter, "attributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v39 = self;
  -[CIFilter inputKeys](self->_filter, "inputKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v36, "objectForKeyedSubscript:", v9, v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "channelFormatForFilterAttributes:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NUChannel initWithName:format:index:]([NUChannel alloc], "initWithName:format:index:", v9, v11, 0);
        objc_msgSend(v40, "addInputChannel:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "channelType");
        objc_msgSend(v13, "node");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == 1)
          v16 = v38;
        else
          v16 = v37;
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v6);
  }

  obja = -[NUFilterNode initWithFilterName:settings:inputs:]([NUFilterNode alloc], "initWithFilterName:settings:inputs:", v39->_filterName, v37, v38);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[CIFilter outputKeys](v39->_filter, "outputKeys");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v17)
  {
    v18 = v17;
    v33 = *(_QWORD *)v42;
    v19 = *MEMORY[0x1E0C9E298];
    v32 = *MEMORY[0x1E0C9DE68];
    v20 = *MEMORY[0x1E0C9DE98];
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(v31);
        v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        if ((objc_msgSend(v22, "isEqualToString:", v19, v30) & 1) == 0)
        {
          +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unsupported output key"), v22);
          v28 = 0;
          *v30 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        v49 = v32;
        v50 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "channelFormatForFilterAttributes:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[NUChannel initWithName:format:index:]([NUChannel alloc], "initWithName:format:index:", v22, v24, 0);
        objc_msgSend(v40, "addOutputChannel:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "node");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setInputNode:", obja);

      }
      v18 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v18)
        continue;
      break;
    }
  }
  v28 = 1;
LABEL_21:

  return v28;
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
}

+ (id)channelFormatForFilterAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NUChannelControlFormat *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __objc2_class *v14;
  NUNumberSetting *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NUNumberSetting *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NUNumberSetting *v24;
  NUNumberSetting *v26;
  NUCompoundSetting *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  NUNumberSetting *v32;
  NUNumberSetting *v33;
  NUNumberSetting *v34;
  NUNumberSetting *v35;
  NSObject *v36;
  int v37;
  id v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DE68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DE08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DE98]) & 1) == 0
    && (v4 || !objc_msgSend(v5, "isEqualToString:", CFSTR("CIImage"))))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = *MEMORY[0x1E0C9DE10];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DE10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("default"));

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DE40]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("identity"));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", v12 == 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("required"));

    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DE78]))
    {
      v14 = NUBoolSetting;
LABEL_7:
      v15 = (NUNumberSetting *)objc_msgSend([v14 alloc], "initWithAttributes:", v7);
LABEL_20:
      v6 = -[NUChannelControlFormat initWithControlType:dataModel:]([NUChannelControlFormat alloc], "initWithControlType:dataModel:", 1, v15);

      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DED8]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DED0]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DE90]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DE70]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEA0]) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DE88]))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DE50]);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = &unk_1E50A3940;
      if (v16)
        v18 = (void *)v16;
      v19 = v18;

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DE48]);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = &unk_1E50A3950;
      if (v20)
        v22 = (void *)v20;
      v23 = v22;

      v24 = -[NUNumberSetting initWithMinimum:maximum:attributes:]([NUNumberSetting alloc], "initWithMinimum:maximum:attributes:", v19, v23, v7);
      goto LABEL_19;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEB8]) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEA8]))
    {
      v26 = [NUNumberSetting alloc];
      v19 = -[NUNumberSetting initWithMinimum:maximum:attributes:](v26, "initWithMinimum:maximum:attributes:", &unk_1E50A24F0, &unk_1E50A2508, MEMORY[0x1E0C9AA70]);
      v27 = [NUCompoundSetting alloc];
      v47[0] = CFSTR("x");
      v47[1] = CFSTR("y");
      v48[0] = v19;
      v48[1] = v19;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = v48;
      v30 = v47;
      v31 = 2;
LABEL_25:
      objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = -[NUCompoundSetting initWithProperties:attributes:](v27, "initWithProperties:attributes:", v23, v7);
LABEL_19:
      v15 = v24;

      goto LABEL_20;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEC0]))
    {
      v32 = [NUNumberSetting alloc];
      v19 = -[NUNumberSetting initWithMinimum:maximum:attributes:](v32, "initWithMinimum:maximum:attributes:", &unk_1E50A24F0, &unk_1E50A2508, MEMORY[0x1E0C9AA70]);
      v27 = [NUCompoundSetting alloc];
      v45[0] = CFSTR("x");
      v45[1] = CFSTR("y");
      v46[0] = v19;
      v46[1] = v19;
      v45[2] = CFSTR("z");
      v46[2] = v19;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = v46;
      v30 = v45;
LABEL_34:
      v31 = 3;
      goto LABEL_25;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEC8]))
    {
      v33 = [NUNumberSetting alloc];
      v19 = -[NUNumberSetting initWithMinimum:maximum:attributes:](v33, "initWithMinimum:maximum:attributes:", &unk_1E50A24F0, &unk_1E50A2508, MEMORY[0x1E0C9AA70]);
      v27 = [NUCompoundSetting alloc];
      v43[0] = CFSTR("x");
      v43[1] = CFSTR("y");
      v44[0] = v19;
      v44[1] = v19;
      v43[2] = CFSTR("w");
      v43[3] = CFSTR("h");
      v44[2] = v19;
      v44[3] = v19;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = v44;
      v30 = v43;
LABEL_30:
      v31 = 4;
      goto LABEL_25;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DE80]) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEB0]))
    {
      v34 = [NUNumberSetting alloc];
      v19 = -[NUNumberSetting initWithMinimum:maximum:attributes:](v34, "initWithMinimum:maximum:attributes:", &unk_1E50A3748, &unk_1E50A3758, MEMORY[0x1E0C9AA70]);
      v27 = [NUCompoundSetting alloc];
      v41[0] = CFSTR("r");
      v41[1] = CFSTR("g");
      v42[0] = v19;
      v42[1] = v19;
      v41[2] = CFSTR("b");
      v42[2] = v19;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = v42;
      v30 = v41;
      goto LABEL_34;
    }
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C9DEE0]))
    {
      if (!v4 && objc_msgSend(v5, "isEqualToString:", CFSTR("CIVector")))
      {
        v35 = [NUNumberSetting alloc];
        v19 = -[NUNumberSetting initWithMinimum:maximum:attributes:](v35, "initWithMinimum:maximum:attributes:", &unk_1E50A3748, &unk_1E50A3758, MEMORY[0x1E0C9AA70]);
        v27 = [NUCompoundSetting alloc];
        v39[0] = CFSTR("r");
        v39[1] = CFSTR("g");
        v40[0] = v19;
        v40[1] = v19;
        v39[2] = CFSTR("b");
        v39[3] = CFSTR("a");
        v40[2] = v19;
        v40[3] = v19;
        v28 = (void *)MEMORY[0x1E0C99D80];
        v29 = v40;
        v30 = v39;
        goto LABEL_30;
      }
      NULogger_5174();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = 138543362;
        v38 = v3;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Unsupported filter attributes: %{public}@", (uint8_t *)&v37, 0xCu);
      }

    }
    v14 = NUOpaqueSetting;
    goto LABEL_7;
  }
  v6 = -[NUChannelMediaFormat initWithMediaType:]([NUChannelMediaFormat alloc], "initWithMediaType:", 1);
LABEL_21:

  return v6;
}

@end
