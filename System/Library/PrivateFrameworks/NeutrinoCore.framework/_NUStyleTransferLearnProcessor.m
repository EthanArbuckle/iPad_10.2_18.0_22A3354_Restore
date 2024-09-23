@implementation _NUStyleTransferLearnProcessor

+ (id)learnStyleFromInputThumbnail:(id)a3 targetThumbnail:(id)a4 colorSpace:(id)a5 configuration:(id)a6 tuningParameters:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v44;
  void *v45;
  void *specific;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
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
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id *v124;
  id v125;
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[2];
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;
  CGRect v134;
  CGRect v135;

  v133 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v14)
  {
    NUAssertLogger_24413();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputThumbnail != nil");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E0CB3978];
        v81 = v79;
        objc_msgSend(v80, "callStackSymbols");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v130 = v79;
        v131 = 2114;
        v132 = v83;
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
      v130 = v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1584, CFSTR("Invalid parameter not satisfying: %s"), v84, v85, v86, v87, (uint64_t)"inputThumbnail != nil");
  }
  if (!v15)
  {
    NUAssertLogger_24413();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "targetThumbnail != nil");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v52;
      _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (v53)
    {
      if (v55)
      {
        v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v89 = (void *)MEMORY[0x1E0CB3978];
        v90 = v88;
        objc_msgSend(v89, "callStackSymbols");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "componentsJoinedByString:", CFSTR("\n"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v130 = v88;
        v131 = 2114;
        v132 = v92;
        _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v57;
      _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1585, CFSTR("Invalid parameter not satisfying: %s"), v93, v94, v95, v96, (uint64_t)"targetThumbnail != nil");
  }
  if (!v16)
  {
    NUAssertLogger_24413();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorSpace != nil");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v59;
      _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (v60)
    {
      if (v62)
      {
        v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v98 = (void *)MEMORY[0x1E0CB3978];
        v99 = v97;
        objc_msgSend(v98, "callStackSymbols");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "componentsJoinedByString:", CFSTR("\n"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v130 = v97;
        v131 = 2114;
        v132 = v101;
        _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v64;
      _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1586, CFSTR("Invalid parameter not satisfying: %s"), v102, v103, v104, v105, (uint64_t)"colorSpace != nil");
  }
  if (!v17)
  {
    NUAssertLogger_24413();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "config != nil");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v66;
      _os_log_error_impl(&dword_1A6553000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v67)
    {
      if (v69)
      {
        v106 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v107 = (void *)MEMORY[0x1E0CB3978];
        v108 = v106;
        objc_msgSend(v107, "callStackSymbols");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "componentsJoinedByString:", CFSTR("\n"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v130 = v106;
        v131 = 2114;
        v132 = v110;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v69)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "componentsJoinedByString:", CFSTR("\n"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v71;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1587, CFSTR("Invalid parameter not satisfying: %s"), v111, v112, v113, v114, (uint64_t)"config != nil");
  }
  v19 = v18;
  if (!v18)
  {
    NUAssertLogger_24413();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tuningParams != nil");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v73;
      _os_log_error_impl(&dword_1A6553000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = os_log_type_enabled(v75, OS_LOG_TYPE_ERROR);
    if (v74)
    {
      if (v76)
      {
        v115 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v116 = (void *)MEMORY[0x1E0CB3978];
        v117 = v115;
        objc_msgSend(v116, "callStackSymbols");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "componentsJoinedByString:", CFSTR("\n"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v130 = v115;
        v131 = 2114;
        v132 = v119;
        _os_log_error_impl(&dword_1A6553000, v75, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v76)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "componentsJoinedByString:", CFSTR("\n"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v130 = v78;
      _os_log_error_impl(&dword_1A6553000, v75, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1588, CFSTR("Invalid parameter not satisfying: %s"), v120, v121, v122, v123, (uint64_t)"tuningParams != nil");
  }
  objc_msgSend(v14, "extent");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v15, "extent");
  v135.origin.x = v28;
  v135.origin.y = v29;
  v135.size.width = v30;
  v135.size.height = v31;
  v134.origin.x = v21;
  v134.origin.y = v23;
  v134.size.width = v25;
  v134.size.height = v27;
  if (CGRectEqualToRect(v134, v135))
  {
    v124 = a8;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(v14, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v16, "CGColorSpace"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v33);

    objc_msgSend(v15, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v16, "CGColorSpace"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v34);

    v126[0] = CFSTR("tuning");
    v126[1] = CFSTR("config");
    v127[0] = v19;
    v127[1] = v17;
    v126[2] = CFSTR("thumbExtent");
    v35 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v14, "extent");
    objc_msgSend(v35, "vectorWithCGRect:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v127[2] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    +[_NUStyleEngineConfiguration coefficientTextureSizeForConfigurationDictionary:](_NUStyleEngineConfiguration, "coefficientTextureSizeForConfigurationDictionary:", v17);
    v125 = 0;
    objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v32, v37, &v125, 0.0, 0.0, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v125;
    if (v40)
    {
      v42 = v40;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to generate style image"), a1, v41);
      *v124 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v128[0] = v14;
    v128[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("target size must match thumbnail size"), v32);
    v40 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v40;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E0C9E000];
}

+ (int)outputFormatWithArguments:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  int *v6;
  int v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("useFloat16"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (int *)MEMORY[0x1E0C9E098];
  if (!v5)
    v6 = (int *)MEMORY[0x1E0C9E090];
  v7 = *v6;

  return v7;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 0;
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("thumbExtent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NUAssertLogger_24413();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail extent!"));
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
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1649, CFSTR("Missing thumbnail extent!"), v32, v33, v34, v35, *(uint64_t *)v36);
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
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("thumbExtent"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NUAssertLogger_24413();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail extent!"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
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
        v29 = v17;
        v30 = 2114;
        v31 = v21;
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
      v29 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor roiTileArrayForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1656, CFSTR("Missing thumbnail extent!"), v22, v23, v24, v25, v26);
  }
  v7 = (void *)v6;
  v27 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  NUIOSurface *v18;
  void *v19;
  NUIOSurface *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  NSObject *v53;
  const char *v54;
  NSObject *v56;
  void *v57;
  void *specific;
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
  id v88;
  id v89;
  void *v90;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  id v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  uint64_t v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v101 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") != 2)
  {
    NUAssertLogger_24413();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputs.count == 2");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v98 = v57;
      _os_log_error_impl(&dword_1A6553000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v60)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E0CB3978];
        v72 = v70;
        objc_msgSend(v71, "callStackSymbols");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v98 = v70;
        v99 = 2114;
        v100 = v74;
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
      v98 = v62;
      _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1662, CFSTR("Invalid parameter not satisfying: %s"), v75, v76, v77, v78, (uint64_t)"inputs.count == 2");
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[NUGlobalSettings debugDumpStyleEngineInputs](NUGlobalSettings, "debugDumpStyleEngineInputs"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("config"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("usage"));
    v14 = objc_claimAutoreleasedReturnValue();
    v89 = v10;
    v15 = (void *)v14;
    v16 = CFSTR("default");
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    v18 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", objc_msgSend(v11, "surface"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-inputThumbnail"), a1, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUIOSurface debugDump:](v18, "debugDump:", v19);

    v20 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", objc_msgSend(v12, "surface"));
    v88 = a1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-targetThumbnail"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUIOSurface debugDump:](v20, "debugDump:", v21);
    v10 = v89;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("thumbExtent"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    NUAssertLogger_24413();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail extent!"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v98 = v64;
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
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E0CB3978];
        v81 = v79;
        objc_msgSend(v80, "callStackSymbols");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v98 = v79;
        v99 = 2114;
        v100 = v83;
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
      v98 = v69;
      _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferLearnProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1677, CFSTR("Missing thumbnail extent!"), v84, v85, v86, v87, (uint64_t)v88);
  }
  v23 = (void *)v22;
  objc_msgSend(v11, "region");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v23, "CGRectValue");
  v104.origin.x = v32;
  v104.origin.y = v33;
  v104.size.width = v34;
  v104.size.height = v35;
  v102.origin.x = v25;
  v102.origin.y = v27;
  v102.size.width = v29;
  v102.size.height = v31;
  if (!CGRectEqualToRect(v102, v104))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v53 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138543362;
    v98 = v23;
    v54 = "*** Invalid thumbnail input extent: %{public}@";
    goto LABEL_20;
  }
  objc_msgSend(v12, "region");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  objc_msgSend(v23, "CGRectValue");
  v105.origin.x = v44;
  v105.origin.y = v45;
  v105.size.width = v46;
  v105.size.height = v47;
  v103.origin.x = v37;
  v103.origin.y = v39;
  v103.size.width = v41;
  v103.size.height = v43;
  if (!CGRectEqualToRect(v103, v105))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v53 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138543362;
    v98 = v23;
    v54 = "*** Invalid target input extent: %{public}@";
LABEL_20:
    _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);
LABEL_17:
    v52 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v10, "metalCommandBuffer");
  v90 = v10;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commandQueue");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("config"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tuning"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __75___NUStyleTransferLearnProcessor_processWithInputs_arguments_output_error___block_invoke;
  v92[3] = &unk_1E5063D78;
  v93 = v90;
  v94 = v11;
  v95 = v12;
  v96 = a1;
  v52 = +[_NUStyleEngine usingSharedStyleEngineForUsage:withMetalCommandQueue:configuration:tuningParams:perform:](_NUStyleEngine, "usingSharedStyleEngineForUsage:withMetalCommandQueue:configuration:tuningParams:perform:", CFSTR("learn"), v49, v50, v51, v92);

  v10 = v90;
LABEL_18:

  return v52;
}

@end
