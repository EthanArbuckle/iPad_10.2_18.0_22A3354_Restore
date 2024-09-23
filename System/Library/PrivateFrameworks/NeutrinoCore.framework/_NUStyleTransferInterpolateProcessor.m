@implementation _NUStyleTransferInterpolateProcessor

+ (id)interpolateStyles:(id)a3 weights:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v31;
  void *v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;
  CGRect v76;
  CGRect v77;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    NUAssertLogger_24413();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputStyles.count >= 1");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v45;
        v73 = 2114;
        v74 = v49;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor interpolateStyles:weights:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2585, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"inputStyles.count >= 1");
  }
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    NUAssertLogger_24413();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputStyles.count == weights.count");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E0CB3978];
        v56 = v54;
        objc_msgSend(v55, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v54;
        v73 = 2114;
        v74 = v58;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor interpolateStyles:weights:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2586, CFSTR("Invalid parameter not satisfying: %s"), v59, v60, v61, v62, (uint64_t)"inputStyles.count == weights.count");
  }
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v65;
    while (2)
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v65 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v24), "extent");
        v77.origin.x = v13;
        v77.origin.y = v15;
        v77.size.width = v17;
        v77.size.height = v19;
        if (!CGRectEqualToRect(v76, v77))
        {
          +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Style size must be consistent"), v20);
          v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v28 = v20;
          goto LABEL_16;
        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v22)
        continue;
      break;
    }
  }

  v68[0] = CFSTR("extent");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v13, v15, v17, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = CFSTR("weights");
  v69[0] = v25;
  v69[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = 0;
  objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v20, v26, &v63, v13, v15, v17, v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v63;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to interpolate style"), a1, v28);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v27;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E0C9E098];
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E098];
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[12];
  __int16 v37;
  void *v38;
  uint64_t v39;
  CGRect result;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NUAssertLogger_24413();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing style extent!"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138543362;
      *(_QWORD *)&v36[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v36, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v36 = 138543618;
        *(_QWORD *)&v36[4] = v27;
        v37 = 2114;
        v38 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138543362;
      *(_QWORD *)&v36[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2633, CFSTR("Missing style extent!"), v32, v33, v34, v35, *(uint64_t *)v36);
  }
  v7 = v6;
  objc_msgSend(v6, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "roiForInput:arguments:outputRect:", *(_QWORD *)&a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  double *v21;
  unint64_t v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  NSObject *v42;
  void *v43;
  void *specific;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("extent"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    NUAssertLogger_24413();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing style extent!"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v43;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v46)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E0CB3978];
        v72 = v70;
        objc_msgSend(v71, "callStackSymbols");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v70;
        v114 = 2114;
        v115 = v74;
        _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v48;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2655, CFSTR("Missing style extent!"), v75, v76, v77, v78, v106);
  }
  v12 = (void *)v11;
  v111 = v10;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("weights"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    NUAssertLogger_24413();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing weights!"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v50;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (v51)
    {
      if (v53)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E0CB3978];
        v81 = v79;
        objc_msgSend(v80, "callStackSymbols");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v79;
        v114 = 2114;
        v115 = v83;
        _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v53)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v55;
      _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2658, CFSTR("Missing weights!"), v84, v85, v86, v87, v106);
  }
  v14 = (void *)v13;
  if (!objc_msgSend(v8, "count"))
  {
    NUAssertLogger_24413();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty inputs"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v57;
      _os_log_error_impl(&dword_1A6553000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (v58)
    {
      if (v60)
      {
        v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v89 = (void *)MEMORY[0x1E0CB3978];
        v90 = v88;
        objc_msgSend(v89, "callStackSymbols");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "componentsJoinedByString:", CFSTR("\n"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v88;
        v114 = 2114;
        v115 = v92;
        _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v60)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v62;
      _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2660, CFSTR("Empty inputs"), v93, v94, v95, v96, v106);
  }
  v15 = objc_msgSend(v8, "count");
  if (v15 != objc_msgSend(v14, "count"))
  {
    NUAssertLogger_24413();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Style weights mismatch"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v64;
      _os_log_error_impl(&dword_1A6553000, v63, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (v65)
    {
      if (v67)
      {
        v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v98 = (void *)MEMORY[0x1E0CB3978];
        v99 = v97;
        objc_msgSend(v98, "callStackSymbols");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "componentsJoinedByString:", CFSTR("\n"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v97;
        v114 = 2114;
        v115 = v101;
        _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v67)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v69;
      _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferInterpolateProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2661, CFSTR("Style weights mismatch"), v102, v103, v104, v105, v106);
  }
  v16 = objc_msgSend(v8, "count");
  v109 = v12;
  v110 = v9;
  v107 = v14;
  if (v16)
  {
    v17 = 0;
    v18 = 0.0;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v17, v107, v109, v110);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v18 = v18 + v20;

      ++v17;
    }
    while (v16 != v17);
    v21 = (double *)malloc_type_malloc(8 * v16, 0x100004000313F17uLL);
    v22 = v16 - 1;
    v23 = 1.0;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      v26 = v25 / v18;

      v21[v22] = v26 / v23;
      v23 = v23 - v26;
      --v22;
    }
    while (v22 != -1);
  }
  else
  {
    v21 = (double *)malloc_type_malloc(0, 0x100004000313F17uLL);
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v107);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "metalTexture");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v111;
  objc_msgSend(v111, "metalTexture");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "metalCommandBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUCopyKernel copyFromTexture:toTexture:withCommandBuffer:](NUCopyKernel, "copyFromTexture:toTexture:withCommandBuffer:", v28, v30, v31);

  if (v16 >= 2)
  {
    for (i = 1; i != v16; ++i)
    {
      objc_msgSend(v29, "metalTexture");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "metalTexture");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v21[i];
      objc_msgSend(v29, "metalTexture");
      v37 = v8;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "metalCommandBuffer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v40 = v36;
      +[NUMixKernel mixTexture:withTexture:factor:intoTexture:withCommandBuffer:](NUMixKernel, "mixTexture:withTexture:factor:intoTexture:withCommandBuffer:", v33, v35, v38, v39, v40);

      v29 = v111;
      v8 = v37;

    }
  }
  free(v21);

  return 1;
}

@end
