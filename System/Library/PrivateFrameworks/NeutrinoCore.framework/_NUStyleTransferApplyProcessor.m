@implementation _NUStyleTransferApplyProcessor

+ (id)applyStyle:(id)a3 toImage:(id)a4 thumbnail:(id)a5 target:(id)a6 deltaMap:(id)a7 colorSpace:(id)a8 configuration:(id)a9 tuningParameters:(id)a10 noiseModel:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v51;
  void *v52;
  void *specific;
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
  NSObject *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v151;
  id v152;
  uint8_t buf[4];
  void *v154;
  __int16 v155;
  void *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  if (!v17)
  {
    NUAssertLogger_24413();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "styleImage != nil");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v52;
      _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v93 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v94 = (void *)MEMORY[0x1E0CB3978];
        v95 = v93;
        objc_msgSend(v94, "callStackSymbols");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "componentsJoinedByString:", CFSTR("\n"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v93;
        v155 = 2114;
        v156 = v97;
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
      v154 = v57;
      _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1724, CFSTR("Invalid parameter not satisfying: %s"), v98, v99, v100, v101, (uint64_t)"styleImage != nil");
  }
  if (!v18)
  {
    NUAssertLogger_24413();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputImage != nil");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v59;
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
        v102 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v103 = (void *)MEMORY[0x1E0CB3978];
        v104 = v102;
        objc_msgSend(v103, "callStackSymbols");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "componentsJoinedByString:", CFSTR("\n"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v102;
        v155 = 2114;
        v156 = v106;
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
      v154 = v64;
      _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1725, CFSTR("Invalid parameter not satisfying: %s"), v107, v108, v109, v110, (uint64_t)"inputImage != nil");
  }
  if (!v19)
  {
    NUAssertLogger_24413();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputThumbnail != nil");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v66;
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
        v111 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v112 = (void *)MEMORY[0x1E0CB3978];
        v113 = v111;
        objc_msgSend(v112, "callStackSymbols");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "componentsJoinedByString:", CFSTR("\n"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v111;
        v155 = 2114;
        v156 = v115;
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
      v154 = v71;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1727, CFSTR("Invalid parameter not satisfying: %s"), v116, v117, v118, v119, (uint64_t)"inputThumbnail != nil");
  }
  if (!v22)
  {
    NUAssertLogger_24413();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorSpace != nil");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v73;
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
        v120 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v121 = (void *)MEMORY[0x1E0CB3978];
        v122 = v120;
        objc_msgSend(v121, "callStackSymbols");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "componentsJoinedByString:", CFSTR("\n"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v120;
        v155 = 2114;
        v156 = v124;
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
      v154 = v78;
      _os_log_error_impl(&dword_1A6553000, v75, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1729, CFSTR("Invalid parameter not satisfying: %s"), v125, v126, v127, v128, (uint64_t)"colorSpace != nil");
  }
  if (!v23)
  {
    NUAssertLogger_24413();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "config != nil");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v80;
      _os_log_error_impl(&dword_1A6553000, v79, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v81 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = os_log_type_enabled(v82, OS_LOG_TYPE_ERROR);
    if (v81)
    {
      if (v83)
      {
        v129 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v130 = (void *)MEMORY[0x1E0CB3978];
        v131 = v129;
        objc_msgSend(v130, "callStackSymbols");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "componentsJoinedByString:", CFSTR("\n"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v129;
        v155 = 2114;
        v156 = v133;
        _os_log_error_impl(&dword_1A6553000, v82, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v83)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "componentsJoinedByString:", CFSTR("\n"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v85;
      _os_log_error_impl(&dword_1A6553000, v82, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1730, CFSTR("Invalid parameter not satisfying: %s"), v134, v135, v136, v137, (uint64_t)"config != nil");
  }
  if (!v24)
  {
    NUAssertLogger_24413();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tuningParams != nil");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v87;
      _os_log_error_impl(&dword_1A6553000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = os_log_type_enabled(v89, OS_LOG_TYPE_ERROR);
    if (v88)
    {
      if (v90)
      {
        v138 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v139 = (void *)MEMORY[0x1E0CB3978];
        v140 = v138;
        objc_msgSend(v139, "callStackSymbols");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "componentsJoinedByString:", CFSTR("\n"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v154 = v138;
        v155 = 2114;
        v156 = v142;
        _os_log_error_impl(&dword_1A6553000, v89, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v90)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "componentsJoinedByString:", CFSTR("\n"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v154 = v92;
      _os_log_error_impl(&dword_1A6553000, v89, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1731, CFSTR("Invalid parameter not satisfying: %s"), v143, v144, v145, v146, (uint64_t)"tuningParams != nil");
  }
  v26 = v25;
  v151 = v20;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v148 = v24;
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, CFSTR("tuning"));
  v149 = v23;
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, CFSTR("config"));
  v147 = v26;
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("noiseModel"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("imageIndex"));

  v30 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v18, "extent");
  objc_msgSend(v30, "vectorWithCGRect:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("imageExtent"));

  objc_msgSend(v18, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v22, "CGColorSpace"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, CFSTR("styleIndex"));

  v34 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v17, "extent");
  objc_msgSend(v34, "vectorWithCGRect:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("styleExtent"));

  objc_msgSend(v27, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, CFSTR("thumbIndex"));

  v37 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend(v19, "extent");
  objc_msgSend(v37, "vectorWithCGRect:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v38, CFSTR("thumbExtent"));

  objc_msgSend(v19, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v22, "CGColorSpace"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v39);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, CFSTR("deltaIndex"));

    v41 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v21, "extent");
    objc_msgSend(v41, "vectorWithCGRect:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v42, CFSTR("deltaExtent"));

    objc_msgSend(v27, "addObject:", v21);
  }
  if (v151)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v43, CFSTR("targetIndex"));

    v44 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v151, "extent");
    objc_msgSend(v44, "vectorWithCGRect:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, CFSTR("targetExtent"));

    objc_msgSend(v151, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v22, "CGColorSpace"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v46);

  }
  objc_msgSend(v18, "extent");
  v152 = 0;
  objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v27, v28, &v152);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v152;
  if (v47)
  {
    objc_msgSend(v47, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v22, "CGColorSpace"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to apply style"), a1, v48);
    v49 = 0;
    *a12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v49;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int *v11;
  int v12;
  void *v13;
  int v14;
  int *v15;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("styleIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7 == a3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("useFloat16"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (int *)MEMORY[0x1E0C9E098];
    if (!v10)
      v11 = (int *)MEMORY[0x1E0C9E090];
    v12 = *v11;

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deltaIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "intValue");
    if (v14 == a3)
      v15 = (int *)MEMORY[0x1E0C9E080];
    else
      v15 = (int *)MEMORY[0x1E0C9E000];
    return *v15;
  }
  return v12;
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
  int v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("styleIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  if (v12 == a3)
  {
    v13 = CFSTR("styleExtent");
LABEL_9:
    objc_msgSend(v10, "objectForKeyedSubscript:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGRectValue");
    x = v23;
    y = v24;
    width = v25;
    height = v26;

    goto LABEL_10;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbIndex"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    if (v17 == a3)
    {
      v13 = CFSTR("thumbExtent");
      goto LABEL_9;
    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("targetIndex"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("targetIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    if (v21 == a3)
    {
      v13 = CFSTR("targetExtent");
      goto LABEL_9;
    }
  }
LABEL_10:

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  NUIOSurface *v30;
  void *v31;
  NUIOSurface *v32;
  void *v33;
  NUIOSurface *v34;
  void *v35;
  NUIOSurface *v36;
  void *v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  void *v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  BOOL v88;
  NSObject *v89;
  const char *v90;
  NSObject *v92;
  void *v93;
  void *specific;
  NSObject *v95;
  _BOOL4 v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  _BOOL4 v103;
  void *v104;
  void *v105;
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
  NSObject *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  _BOOL4 v128;
  void *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  void *v133;
  NSObject *v134;
  _BOOL4 v135;
  void *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  _BOOL4 v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v177;
  CGFloat v178;
  void *v179;
  CGFloat v180;
  CGFloat v181;
  CGFloat v182;
  id v183;
  id v184;
  id v185;
  void *v186;
  _QWORD v187[4];
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  CGFloat v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CGFloat v199;
  CGFloat v200;
  CGFloat v201;
  CGFloat v202;
  CGFloat v203;
  CGFloat v204;
  CGFloat v205;
  CGFloat v206;
  id v207;
  uint8_t buf[4];
  void *v209;
  __int16 v210;
  void *v211;
  uint64_t v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;

  v212 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("imageIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v12, "unsignedIntegerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("styleIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v14, "unsignedIntegerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbIndex"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v17, "unsignedIntegerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  v185 = a1;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deltaIndex"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deltaIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v20, "unsignedIntegerValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("targetIndex"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("targetIndex"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v23, "unsignedIntegerValue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  v186 = v18;
  if (+[NUGlobalSettings debugDumpStyleEngineInputs](NUGlobalSettings, "debugDumpStyleEngineInputs"))
  {
    v183 = v9;
    v179 = v21;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("config"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("usage"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = CFSTR("default");
    if (v26)
      v28 = (__CFString *)v26;
    v29 = v28;

    v30 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", objc_msgSend(v13, "surface"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-inputImage"), v185, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUIOSurface debugDump:](v30, "debugDump:", v31);

    v32 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", objc_msgSend(v15, "surface"));
    v172 = (uint64_t)v185;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-inputStyle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUIOSurface debugDump:](v32, "debugDump:", v33);

    if (v18)
    {
      v34 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", objc_msgSend(v18, "surface"));
      v172 = (uint64_t)v185;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-inputThumbnail"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUIOSurface debugDump:](v34, "debugDump:", v35);

      v18 = v186;
    }
    if (v24)
    {
      v36 = -[NUIOSurface initWithIOSurface:]([NUIOSurface alloc], "initWithIOSurface:", objc_msgSend(v24, "surface"));
      v172 = (uint64_t)v185;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-targetThumbnail"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUIOSurface debugDump:](v36, "debugDump:", v37);

      v18 = v186;
    }

    v21 = v179;
    v9 = v183;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("imageExtent"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "CGRectValue");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v213.origin.x = v40;
  v213.origin.y = v42;
  v213.size.width = v44;
  v213.size.height = v46;
  if (CGRectIsEmpty(v213))
  {
    NUAssertLogger_24413();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing image extent!"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v209 = v93;
      _os_log_error_impl(&dword_1A6553000, v92, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v95 = objc_claimAutoreleasedReturnValue();
    v96 = os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v96)
      {
        v106 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v107 = (void *)MEMORY[0x1E0CB3978];
        v108 = v106;
        objc_msgSend(v107, "callStackSymbols");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "componentsJoinedByString:", CFSTR("\n"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v209 = v106;
        v210 = 2114;
        v211 = v110;
        _os_log_error_impl(&dword_1A6553000, v95, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v96)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "componentsJoinedByString:", CFSTR("\n"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v209 = v98;
      _os_log_error_impl(&dword_1A6553000, v95, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1881, CFSTR("Missing image extent!"), v111, v112, v113, v114, v172);
  }
  v178 = v46;
  v180 = v44;
  v181 = v42;
  v182 = v40;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("styleExtent"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "CGRectValue");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;

  v214.origin.x = v49;
  v214.origin.y = v51;
  v214.size.width = v53;
  v214.size.height = v55;
  if (CGRectIsEmpty(v214))
  {
    NUAssertLogger_24413();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing style extent!"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v209 = v100;
      _os_log_error_impl(&dword_1A6553000, v99, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v101 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = os_log_type_enabled(v102, OS_LOG_TYPE_ERROR);
    if (v101)
    {
      if (v103)
      {
        v115 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v116 = (void *)MEMORY[0x1E0CB3978];
        v117 = v115;
        objc_msgSend(v116, "callStackSymbols");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "componentsJoinedByString:", CFSTR("\n"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v209 = v115;
        v210 = 2114;
        v211 = v119;
        _os_log_error_impl(&dword_1A6553000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v103)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "componentsJoinedByString:", CFSTR("\n"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v209 = v105;
      _os_log_error_impl(&dword_1A6553000, v102, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1884, CFSTR("Missing style extent!"), v120, v121, v122, v123, v172);
  }
  objc_msgSend(v15, "region");
  v223.origin.x = v49;
  v223.origin.y = v51;
  v223.size.width = v53;
  v223.size.height = v55;
  if (!CGRectEqualToRect(v215, v223))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v89 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 138543362;
    v209 = v15;
    v90 = "*** Invalid style input extent: %{public}@";
    goto LABEL_42;
  }
  if (v18)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbExtent"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "CGRectValue");
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;

    v216.origin.x = v58;
    v216.origin.y = v60;
    v216.size.width = v62;
    v216.size.height = v64;
    if (CGRectIsEmpty(v216))
    {
      NUAssertLogger_24413();
      v124 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail extent!"));
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v125;
        _os_log_error_impl(&dword_1A6553000, v124, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v126 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_24413();
      v127 = objc_claimAutoreleasedReturnValue();
      v128 = os_log_type_enabled(v127, OS_LOG_TYPE_ERROR);
      if (v126)
      {
        if (v128)
        {
          v145 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v146 = (void *)MEMORY[0x1E0CB3978];
          v147 = v145;
          objc_msgSend(v146, "callStackSymbols");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "componentsJoinedByString:", CFSTR("\n"));
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v209 = v145;
          v210 = 2114;
          v211 = v149;
          _os_log_error_impl(&dword_1A6553000, v127, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v128)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "componentsJoinedByString:", CFSTR("\n"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v130;
        _os_log_error_impl(&dword_1A6553000, v127, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1893, CFSTR("Missing thumbnail extent!"), v150, v151, v152, v153, v172);
    }
    objc_msgSend(v18, "region");
    v224.origin.x = v58;
    v224.origin.y = v60;
    v224.size.width = v62;
    v224.size.height = v64;
    if (!CGRectEqualToRect(v217, v224))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
      v89 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_DWORD *)buf = 138543362;
      v209 = v18;
      v90 = "*** Invalid thumbnail input extent: %{public}@";
      goto LABEL_42;
    }
  }
  if (v21)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deltaExtent"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "CGRectValue");
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;

    v218.origin.x = v67;
    v218.origin.y = v69;
    v218.size.width = v71;
    v218.size.height = v73;
    if (CGRectIsEmpty(v218))
    {
      NUAssertLogger_24413();
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing delta extent!"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v132;
        _os_log_error_impl(&dword_1A6553000, v131, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v133 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_24413();
      v134 = objc_claimAutoreleasedReturnValue();
      v135 = os_log_type_enabled(v134, OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v135)
        {
          v154 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v155 = (void *)MEMORY[0x1E0CB3978];
          v156 = v154;
          objc_msgSend(v155, "callStackSymbols");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "componentsJoinedByString:", CFSTR("\n"));
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v209 = v154;
          v210 = 2114;
          v211 = v158;
          _os_log_error_impl(&dword_1A6553000, v134, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v135)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "componentsJoinedByString:", CFSTR("\n"));
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v137;
        _os_log_error_impl(&dword_1A6553000, v134, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1903, CFSTR("Missing delta extent!"), v159, v160, v161, v162, v172);
    }
  }
  if (v24)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("targetExtent"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "CGRectValue");
    v76 = v75;
    v78 = v77;
    v80 = v79;
    v82 = v81;

    v219.origin.x = v76;
    v219.origin.y = v78;
    v219.size.width = v80;
    v219.size.height = v82;
    if (CGRectIsEmpty(v219))
    {
      NUAssertLogger_24413();
      v138 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing target extent!"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v139;
        _os_log_error_impl(&dword_1A6553000, v138, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v140 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_24413();
      v141 = objc_claimAutoreleasedReturnValue();
      v142 = os_log_type_enabled(v141, OS_LOG_TYPE_ERROR);
      if (v140)
      {
        if (v142)
        {
          v163 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v164 = (void *)MEMORY[0x1E0CB3978];
          v165 = v163;
          objc_msgSend(v164, "callStackSymbols");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "componentsJoinedByString:", CFSTR("\n"));
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v209 = v163;
          v210 = 2114;
          v211 = v167;
          _os_log_error_impl(&dword_1A6553000, v141, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v142)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "componentsJoinedByString:", CFSTR("\n"));
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v144;
        _os_log_error_impl(&dword_1A6553000, v141, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferApplyProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1909, CFSTR("Missing target extent!"), v168, v169, v170, v171, v172);
    }
    objc_msgSend(v24, "region");
    v225.origin.x = v76;
    v225.origin.y = v78;
    v225.size.width = v80;
    v225.size.height = v82;
    if (!CGRectEqualToRect(v220, v225))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
      v89 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_DWORD *)buf = 138543362;
      v209 = v24;
      v90 = "*** Invalid thumbnail input extent: %{public}@";
LABEL_42:
      _os_log_error_impl(&dword_1A6553000, v89, OS_LOG_TYPE_ERROR, v90, buf, 0xCu);
LABEL_43:
      v88 = 0;
      goto LABEL_44;
    }
  }
  objc_msgSend(v11, "region");
  v226.origin.x = v182;
  v226.origin.y = v181;
  v226.size.width = v180;
  v226.size.height = v178;
  v222 = CGRectIntersection(v221, v226);
  y = v222.origin.y;
  x = v222.origin.x;
  height = v222.size.height;
  width = v222.size.width;
  objc_msgSend(v11, "metalCommandBuffer");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "commandQueue");
  v184 = v9;
  v83 = v24;
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("config"));
  v85 = v21;
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("tuning"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = MEMORY[0x1E0C809B0];
  v187[1] = 3221225472;
  v187[2] = __75___NUStyleTransferApplyProcessor_processWithInputs_arguments_output_error___block_invoke;
  v187[3] = &unk_1E5063DA0;
  v195 = v49;
  v196 = v51;
  v197 = v53;
  v198 = v55;
  v199 = v182;
  v200 = v181;
  v201 = v180;
  v202 = v178;
  v203 = x;
  v204 = y;
  v205 = width;
  v206 = height;
  v188 = v13;
  v189 = v15;
  v190 = v18;
  v191 = v85;
  v192 = v83;
  v193 = v10;
  v194 = v11;
  v207 = v185;
  v88 = +[_NUStyleEngine usingSharedStyleEngineForUsage:withMetalCommandQueue:configuration:tuningParams:perform:](_NUStyleEngine, "usingSharedStyleEngineForUsage:withMetalCommandQueue:configuration:tuningParams:perform:", CFSTR("apply"), v84, v86, v87, v187);

  v21 = v85;
  v24 = v83;
  v9 = v184;

LABEL_44:
  return v88;
}

@end
