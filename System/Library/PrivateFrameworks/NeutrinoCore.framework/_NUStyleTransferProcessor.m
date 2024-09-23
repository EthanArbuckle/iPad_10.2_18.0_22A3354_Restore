@implementation _NUStyleTransferProcessor

+ (id)applyStyleFromInputThumbnail:(id)a3 targetThumbnail:(id)a4 toImage:(id)a5 colorSpace:(id)a6 configuration:(id)a7 tuningParameters:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v47;
  void *v48;
  void *specific;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  id v144;
  _QWORD v145[4];
  _QWORD v146[4];
  _QWORD v147[2];
  uint8_t buf[4];
  void *v149;
  __int16 v150;
  void *v151;
  uint64_t v152;
  CGRect v153;
  CGRect v154;

  v152 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (!v15)
  {
    NUAssertLogger_24413();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputThumbnail != nil");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v48;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v89 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v90 = (void *)MEMORY[0x1E0CB3978];
        v91 = v89;
        objc_msgSend(v90, "callStackSymbols");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "componentsJoinedByString:", CFSTR("\n"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v89;
        v150 = 2114;
        v151 = v93;
        _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v53;
      _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1976, CFSTR("Invalid parameter not satisfying: %s"), v94, v95, v96, v97, (uint64_t)"inputThumbnail != nil");
  }
  if (!v16)
  {
    NUAssertLogger_24413();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "targetThumbnail != nil");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v55;
      _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (v56)
    {
      if (v58)
      {
        v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v99 = (void *)MEMORY[0x1E0CB3978];
        v100 = v98;
        objc_msgSend(v99, "callStackSymbols");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "componentsJoinedByString:", CFSTR("\n"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v98;
        v150 = 2114;
        v151 = v102;
        _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v58)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v60;
      _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1977, CFSTR("Invalid parameter not satisfying: %s"), v103, v104, v105, v106, (uint64_t)"targetThumbnail != nil");
  }
  if (!v17)
  {
    NUAssertLogger_24413();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputImage != nil");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v62;
      _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (v63)
    {
      if (v65)
      {
        v107 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v108 = (void *)MEMORY[0x1E0CB3978];
        v109 = v107;
        objc_msgSend(v108, "callStackSymbols");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "componentsJoinedByString:", CFSTR("\n"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v107;
        v150 = 2114;
        v151 = v111;
        _os_log_error_impl(&dword_1A6553000, v64, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v65)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v67;
      _os_log_error_impl(&dword_1A6553000, v64, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1978, CFSTR("Invalid parameter not satisfying: %s"), v112, v113, v114, v115, (uint64_t)"inputImage != nil");
  }
  if (!v18)
  {
    NUAssertLogger_24413();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorSpace != nil");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v69;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
    if (v70)
    {
      if (v72)
      {
        v116 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v117 = (void *)MEMORY[0x1E0CB3978];
        v118 = v116;
        objc_msgSend(v117, "callStackSymbols");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "componentsJoinedByString:", CFSTR("\n"));
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v116;
        v150 = 2114;
        v151 = v120;
        _os_log_error_impl(&dword_1A6553000, v71, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v72)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v74;
      _os_log_error_impl(&dword_1A6553000, v71, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1979, CFSTR("Invalid parameter not satisfying: %s"), v121, v122, v123, v124, (uint64_t)"colorSpace != nil");
  }
  if (!v19)
  {
    NUAssertLogger_24413();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "config != nil");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v76;
      _os_log_error_impl(&dword_1A6553000, v75, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v77 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (v77)
    {
      if (v79)
      {
        v125 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v126 = (void *)MEMORY[0x1E0CB3978];
        v127 = v125;
        objc_msgSend(v126, "callStackSymbols");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "componentsJoinedByString:", CFSTR("\n"));
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v125;
        v150 = 2114;
        v151 = v129;
        _os_log_error_impl(&dword_1A6553000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v79)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v81;
      _os_log_error_impl(&dword_1A6553000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1980, CFSTR("Invalid parameter not satisfying: %s"), v130, v131, v132, v133, (uint64_t)"config != nil");
  }
  v21 = v20;
  if (!v20)
  {
    NUAssertLogger_24413();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tuningParams != nil");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v83;
      _os_log_error_impl(&dword_1A6553000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v84 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = os_log_type_enabled(v85, OS_LOG_TYPE_ERROR);
    if (v84)
    {
      if (v86)
      {
        v134 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v135 = (void *)MEMORY[0x1E0CB3978];
        v136 = v134;
        objc_msgSend(v135, "callStackSymbols");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "componentsJoinedByString:", CFSTR("\n"));
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v134;
        v150 = 2114;
        v151 = v138;
        _os_log_error_impl(&dword_1A6553000, v85, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v86)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "componentsJoinedByString:", CFSTR("\n"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v88;
      _os_log_error_impl(&dword_1A6553000, v85, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1981, CFSTR("Invalid parameter not satisfying: %s"), v139, v140, v141, v142, (uint64_t)"tuningParams != nil");
  }
  objc_msgSend(v15, "extent");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v16, "extent");
  v154.origin.x = v30;
  v154.origin.y = v31;
  v154.size.width = v32;
  v154.size.height = v33;
  v153.origin.x = v23;
  v153.origin.y = v25;
  v153.size.width = v27;
  v153.size.height = v29;
  if (CGRectEqualToRect(v153, v154))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    objc_msgSend(v15, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v35);

    objc_msgSend(v16, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v36);

    objc_msgSend(v17, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v18, "CGColorSpace"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v37);

    v145[0] = CFSTR("tuning");
    v145[1] = CFSTR("config");
    v146[0] = v21;
    v146[1] = v19;
    v143 = v19;
    v145[2] = CFSTR("thumbExtent");
    v38 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v15, "extent");
    objc_msgSend(v38, "vectorWithCGRect:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v146[2] = v39;
    v145[3] = CFSTR("imageExtent");
    v40 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v17, "extent");
    objc_msgSend(v40, "vectorWithCGRect:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v146[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "extent");
    v144 = 0;
    objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v34, v42, &v144);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v144;
    if (v43)
    {
      objc_msgSend(v43, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v18, "CGColorSpace"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to apply style"), a1, v44);
      v45 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }

    v19 = v143;
  }
  else
  {
    v147[0] = v15;
    v147[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("target size must match thumbnail size"), v34);
    v45 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E0C9E000];
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E080];
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[12];
  __int16 v39;
  void *v40;
  uint64_t v41;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = v10;
  if (a3 <= 1)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbExtent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      NUAssertLogger_24413();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail extent!"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v38 = 138543362;
        *(_QWORD *)&v38[4] = v23;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v38, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_24413();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v30 = (void *)MEMORY[0x1E0CB3978];
          v31 = v29;
          objc_msgSend(v30, "callStackSymbols");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v38 = 138543618;
          *(_QWORD *)&v38[4] = v29;
          v39 = 2114;
          v40 = v33;
          _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v38, 0x16u);

        }
      }
      else if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v38 = 138543362;
        *(_QWORD *)&v38[4] = v28;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v38, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2031, CFSTR("Missing thumbnail extent!"), v34, v35, v36, v37, *(uint64_t *)v38);
    }
    v13 = v12;
    objc_msgSend(v12, "CGRectValue");
    x = v14;
    y = v15;
    width = v16;
    height = v17;

  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
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
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  NSObject *v60;
  const char *v61;
  NSObject *v63;
  void *v64;
  void *specific;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  id v129;
  uint8_t buf[4];
  void *v131;
  __int16 v132;
  void *v133;
  uint64_t v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;

  v134 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count") != 3)
  {
    NUAssertLogger_24413();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputs.count == 3");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v131 = v64;
      _os_log_error_impl(&dword_1A6553000, v63, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v67)
      {
        v77 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v78 = (void *)MEMORY[0x1E0CB3978];
        v79 = v77;
        objc_msgSend(v78, "callStackSymbols");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v77;
        v132 = 2114;
        v133 = v81;
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
      v131 = v69;
      _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2054, CFSTR("Invalid parameter not satisfying: %s"), v82, v83, v84, v85, (uint64_t)"inputs.count == 3");
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbExtent"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    NUAssertLogger_24413();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail extent!"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v131 = v71;
      _os_log_error_impl(&dword_1A6553000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v72 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (v72)
    {
      if (v74)
      {
        v86 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v87 = (void *)MEMORY[0x1E0CB3978];
        v88 = v86;
        objc_msgSend(v87, "callStackSymbols");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "componentsJoinedByString:", CFSTR("\n"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v86;
        v132 = 2114;
        v133 = v90;
        _os_log_error_impl(&dword_1A6553000, v73, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v74)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v131 = v76;
      _os_log_error_impl(&dword_1A6553000, v73, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2065, CFSTR("Missing thumbnail extent!"), v91, v92, v93, v94, v111);
  }
  v16 = (void *)v15;
  objc_msgSend(v12, "region");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v16, "CGRectValue");
  v140.origin.x = v25;
  v140.origin.y = v26;
  v140.size.width = v27;
  v140.size.height = v28;
  v135.origin.x = v18;
  v135.origin.y = v20;
  v135.size.width = v22;
  v135.size.height = v24;
  if (!CGRectEqualToRect(v135, v140))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v60 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 138543362;
    v131 = v16;
    v61 = "*** Invalid thumbnail input extent: %{public}@";
    goto LABEL_17;
  }
  objc_msgSend(v13, "region");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v16, "CGRectValue");
  v141.origin.x = v37;
  v141.origin.y = v38;
  v141.size.width = v39;
  v141.size.height = v40;
  v136.origin.x = v30;
  v136.origin.y = v32;
  v136.size.width = v34;
  v136.size.height = v36;
  if (!CGRectEqualToRect(v136, v141))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v60 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 138543362;
    v131 = v16;
    v61 = "*** Invalid target input extent: %{public}@";
LABEL_17:
    _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, v61, buf, 0xCu);
LABEL_14:
    v59 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("imageExtent"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "CGRectValue");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  v137.origin.x = v43;
  v137.origin.y = v45;
  v137.size.width = v47;
  v137.size.height = v49;
  if (CGRectIsEmpty(v137))
  {
    NUAssertLogger_24413();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing image extent!"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v131 = v96;
      _os_log_error_impl(&dword_1A6553000, v95, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v98 = objc_claimAutoreleasedReturnValue();
    v99 = os_log_type_enabled(v98, OS_LOG_TYPE_ERROR);
    if (v97)
    {
      if (v99)
      {
        v102 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v103 = (void *)MEMORY[0x1E0CB3978];
        v104 = v102;
        objc_msgSend(v103, "callStackSymbols");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "componentsJoinedByString:", CFSTR("\n"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v102;
        v132 = 2114;
        v133 = v106;
        _os_log_error_impl(&dword_1A6553000, v98, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v99)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "componentsJoinedByString:", CFSTR("\n"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v131 = v101;
      _os_log_error_impl(&dword_1A6553000, v98, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2075, CFSTR("Missing image extent!"), v107, v108, v109, v110, v111);
  }
  objc_msgSend(v11, "region");
  v142.origin.x = v43;
  v142.origin.y = v45;
  v142.size.width = v47;
  v142.size.height = v49;
  v139 = CGRectIntersection(v138, v142);
  x = v139.origin.x;
  y = v139.origin.y;
  width = v139.size.width;
  height = v139.size.height;
  objc_msgSend(v11, "metalCommandBuffer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "commandQueue");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("config"));
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("tuning"));
  v114 = v11;
  v55 = v14;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __70___NUStyleTransferProcessor_processWithInputs_arguments_output_error___block_invoke;
  v115[3] = &unk_1E5063DC8;
  v116 = v16;
  v117 = v12;
  v118 = v13;
  v121 = v43;
  v122 = v45;
  v123 = v47;
  v124 = v49;
  v125 = x;
  v126 = y;
  v127 = width;
  v128 = height;
  v119 = v55;
  v120 = v114;
  v129 = a1;
  v57 = v13;
  v58 = (void *)v54;
  v59 = +[_NUStyleEngine usingSharedStyleEngineForUsage:withMetalCommandQueue:configuration:tuningParams:perform:](_NUStyleEngine, "usingSharedStyleEngineForUsage:withMetalCommandQueue:configuration:tuningParams:perform:", CFSTR("learn&apply"), v112, v54, v56, v115);

  v14 = v55;
  v11 = v114;

  v13 = v57;
LABEL_15:

  return v59;
}

@end
