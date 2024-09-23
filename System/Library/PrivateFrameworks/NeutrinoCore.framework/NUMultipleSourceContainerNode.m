@implementation NUMultipleSourceContainerNode

- (NUMultipleSourceContainerNode)initWithAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = (void *)MEMORY[0x1E0CB3978];
    v15 = v13;
    objc_msgSend(v14, "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E0CB3978];
  v21 = specific;
  v15 = v18;
  objc_msgSend(v20, "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode initWithAssetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 204, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (NUMultipleSourceContainerNode)initWithSourceNodes:(id)a3 assetIdentifier:(id)a4
{
  id v6;
  id v7;
  NUMultipleSourceContainerNode *v8;
  uint64_t v9;
  NSArray *sources;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    NUAssertLogger_6578();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "nodes.count >= 1");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        v43 = 2114;
        v44 = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode initWithSourceNodes:assetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 209, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"nodes.count >= 1");
  }
  v39.receiver = self;
  v39.super_class = (Class)NUMultipleSourceContainerNode;
  v8 = -[NUSourceContainerNode initWithAssetIdentifier:](&v39, sel_initWithAssetIdentifier_, v7);
  v9 = objc_msgSend(v6, "copy");
  sources = v8->_sources;
  v8->_sources = (NSArray *)v9;

  -[NUMultipleSourceContainerNode primarySourceNode](v8, "primarySourceNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
        if (v17 != v11)
          objc_msgSend(v17, "setOriginalNode:", v11);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v14);
  }

  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p>"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("Count:%lu "), -[NSArray count](self->_sources, "count"));
  if (-[NSArray count](self->_sources, "count"))
  {
    v6 = 0;
    do
    {
      if (-[NSArray count](self->_sources, "count") >= 2)
        objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
      -[NSArray objectAtIndexedSubscript:](self->_sources, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("[%lu]=%@"), v6, v8);

      ++v6;
    }
    while (v6 < -[NSArray count](self->_sources, "count"));
  }
  return v3;
}

- (id)primarySourceNode
{
  return -[NSArray objectAtIndexedSubscript:](self->_sources, "objectAtIndexedSubscript:", 0);
}

- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  int64_t v39;
  id v40;
  id v41;
  void *v42;
  NSObject *v44;
  void *v45;
  void *specific;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NUMultipleSourceContainerNode *v60;
  id *v61;
  $0AC6E346AE4835514AAA8AC86D8F4844 *v62;
  NSArray *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *v72;
  __int128 v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    NUAssertLogger_6578();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v84 = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v84 = v51;
        v85 = 2114;
        v86 = v55;
        _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v84 = v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode resolveSourceNodeForPipelineState:foundScale:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 246, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"error != NULL");
  }
  v9 = v8;
  -[NUMultipleSourceContainerNode primarySourceNode](self, "primarySourceNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "load:", a5) && objc_msgSend(v10, "isValid:", a5))
  {
    v11 = objc_msgSend(v9, "mediaComponentType");
    v12 = self->_sources;
    if (-[NSArray count](v12, "count"))
    {
      v70 = objc_msgSend(v9, "scale");
      if (v70 >= 1 && v13 > 0)
      {
        v68 = v13;
        v15 = NUScaleZero;
        v14 = unk_1EE863060;
        v73 = NUScaleOne;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v16 = v12;
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
        if (v17)
        {
          v18 = v17;
          v61 = a5;
          v62 = a4;
          v60 = self;
          v63 = v12;
          v64 = v10;
          v69 = v9;
          v65 = 0;
          v66 = 0;
          v19 = 0;
          v20 = *(_QWORD *)v79;
          v71 = *(_QWORD *)v79;
          v72 = v16;
          do
          {
            v21 = 0;
            v67 = v18;
            do
            {
              if (*(_QWORD *)v79 != v20)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v21);
              v77 = 0;
              v23 = objc_msgSend(v22, "load:", &v77);
              v24 = v77;

              if (v23)
              {
                v76 = 0;
                v25 = objc_msgSend(v22, "isValid:", &v76);
                v19 = v76;

                if (v25)
                {
                  v75 = 0;
                  objc_msgSend(v22, "outputImageGeometry:", &v75);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v75;

                  v28 = v15;
                  if (v26)
                  {
                    v74 = 0;
                    v29 = objc_msgSend(v22, "supportsPipelineState:error:", v69, &v74);
                    v19 = v74;

                    if (!v29)
                      goto LABEL_23;
                    v30 = objc_msgSend(v26, "renderScale");
                    v32 = v31;
                    if (NUScaleCompare(v30, v31, v70, v68) < 0
                      && (NUScaleCompare(v30, v32, v28, v14) & 0x8000000000000000) == 0)
                    {
                      v33 = v22;

                      v28 = v30;
                      v14 = v32;
                      v66 = v33;
                    }
                    if (NUScaleCompare(v30, v32, v70, v68) < 0)
                    {
LABEL_23:
                      v32 = *((_QWORD *)&v73 + 1);
                      v30 = v73;
                    }
                    else
                    {
                      if (NUScaleCompare(v30, v32, v73, *((uint64_t *)&v73 + 1)) <= 0)
                      {
                        v34 = v22;

                        v65 = v34;
                      }
                      else
                      {
                        v32 = *((_QWORD *)&v73 + 1);
                        v30 = v73;
                      }
                      v18 = v67;
                    }
                  }
                  else
                  {
                    v32 = *((_QWORD *)&v73 + 1);
                    v30 = v73;
                    v19 = v27;
                  }

                  *(_QWORD *)&v73 = v30;
                  *((_QWORD *)&v73 + 1) = v32;
                  v15 = v28;
                  v20 = v71;
                  v16 = v72;
                }
              }
              else
              {
                v19 = v24;
              }
              ++v21;
            }
            while (v18 != v21);
            v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
          }
          while (v18);

          v36 = v65;
          v35 = v66;
          v37 = v65;
          v38 = *((_QWORD *)&v73 + 1);
          v39 = v73;
          if (v65 || (v37 = v66, v39 = v15, v38 = v14, v66))
          {
            v40 = v37;
            v62->var0 = v39;
            v62->var1 = v38;
            v41 = v40;
            v9 = v69;
            v12 = v63;
            v10 = v64;
LABEL_38:

            goto LABEL_39;
          }
          v9 = v69;
          v12 = v63;
          v10 = v64;
          self = v60;
          a5 = v61;
        }
        else
        {

          v19 = 0;
        }
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 5, CFSTR("Couldn't find any matching source node"), self, v19);
        v36 = 0;
        v35 = 0;
        v41 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      *a4 = ($0AC6E346AE4835514AAA8AC86D8F4844)NUScaleUnknown;
      -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
      v41 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("No matching source for type"), v42);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v41 = 0;
    }
LABEL_39:

    goto LABEL_40;
  }
  v41 = 0;
LABEL_40:

  return v41;
}

- (id)sourceNodeForPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_6578();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMultipleSourceContainerNode sourceNodeForPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 334, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NUMultipleSourceContainerNode primarySourceNode](self, "primarySourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "load:", a4) && objc_msgSend(v8, "isValid:", a4))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (NSArray)sources
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
