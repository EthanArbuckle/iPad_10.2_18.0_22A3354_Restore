@implementation CIFilter(DataAdditions)

+ (id)_dataExtractionOverrrides
{
  if (_dataExtractionOverrrides_onceToken != -1)
    dispatch_once(&_dataExtractionOverrrides_onceToken, &__block_literal_global_16325);
  return (id)_dataExtractionOverrrides_registry;
}

+ (id)extractDataToDictionary:()DataAdditions dataExtractor:options:context:colorSpace:error:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  SEL v22;
  SEL v23;
  void (*v24)(void *, SEL, id, id, id, void *, uint64_t, _QWORD *);
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (!v14)
  {
    NUAssertLogger_16293();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16293();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v65 = (void *)MEMORY[0x1E0CB3978];
        v66 = v64;
        objc_msgSend(v65, "callStackSymbols");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v110 = v64;
        v111 = 2114;
        v112 = v68;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditions) extractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 83, CFSTR("Invalid parameter not satisfying: %s"), v69, v70, v71, v72, (uint64_t)"image != nil");
  }
  if (!v15)
  {
    NUAssertLogger_16293();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "extractor != nil");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16293();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v73 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v74 = (void *)MEMORY[0x1E0CB3978];
        v75 = v73;
        objc_msgSend(v74, "callStackSymbols");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v110 = v73;
        v111 = 2114;
        v112 = v77;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v110 = v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditions) extractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 84, CFSTR("Invalid parameter not satisfying: %s"), v78, v79, v80, v81, (uint64_t)"extractor != nil");
  }
  v18 = v17;
  objc_msgSend(a1, "_dataExtractionOverrrides");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v15);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = NSSelectorFromString(v20);
    if (!v22)
    {
      NUAssertLogger_16293();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad override for %@: cannot find selector %@"), v15, v21);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v44;
        _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_16293();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
      if (v45)
      {
        if (v47)
        {
          v82 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v83 = (void *)MEMORY[0x1E0CB3978];
          v84 = v82;
          objc_msgSend(v83, "callStackSymbols");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "componentsJoinedByString:", CFSTR("\n"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = v82;
          v111 = 2114;
          v112 = v86;
          _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v49;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditions) extractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 91, CFSTR("Bad override for %@: cannot find selector %@"), v87, v88, v89, v90, (uint64_t)v15);
    }
    v23 = v22;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      NUAssertLogger_16293();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad override for %@: not implemented %@"), v15, v21);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v51;
        _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_16293();
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
      if (v52)
      {
        if (v54)
        {
          v91 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v92 = (void *)MEMORY[0x1E0CB3978];
          v93 = v91;
          objc_msgSend(v92, "callStackSymbols");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "componentsJoinedByString:", CFSTR("\n"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = v91;
          v111 = 2114;
          v112 = v95;
          _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v54)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v56;
        _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditions) extractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 92, CFSTR("Bad override for %@: not implemented %@"), v96, v97, v98, v99, (uint64_t)v15);
    }
    v24 = (void (*)(void *, SEL, id, id, id, void *, uint64_t, _QWORD *))objc_msgSend(a1, "methodForSelector:", v23);
    if (!v24)
    {
      NUAssertLogger_16293();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad override for %@: cannot find IMP %@"), v15, v21);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v58;
        _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_16293();
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
      if (v59)
      {
        if (v61)
        {
          v100 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v101 = (void *)MEMORY[0x1E0CB3978];
          v102 = v100;
          objc_msgSend(v101, "callStackSymbols");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "componentsJoinedByString:", CFSTR("\n"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = v100;
          v111 = 2114;
          v112 = v104;
          _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v61)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v110 = v63;
        _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditions) extractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 95, CFSTR("Bad override for %@: cannot find IMP %@"), v105, v106, v107, v108, (uint64_t)v15);
    }
    v24(a1, v23, v14, v15, v16, v18, a7, a8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "extractDataToDictionary:options:context:colorSpace:error:", v14, v16, v18, a7, a8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a8)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("unknown extractor name"), v15);
      v25 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }

  }
  return v25;
}

@end
