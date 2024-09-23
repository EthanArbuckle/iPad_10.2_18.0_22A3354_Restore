@implementation NUImageUtilities

+ (void)copyPixelsFromImage:(id)a3 rect:(id *)a4 destPtr:(void *)a5 destPtrRowBytes:(int64_t)a6
{
  id v9;
  void *v10;
  int64_t var0;
  BOOL v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  $0AC6E346AE4835514AAA8AC86D8F4844 v20;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v22;
  void *v23;
  $0AC6E346AE4835514AAA8AC86D8F4844 v24;
  NSObject *v25;
  void *v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  $0AC6E346AE4835514AAA8AC86D8F4844 v74;
  $0AC6E346AE4835514AAA8AC86D8F4844 v75;
  int64_t v76;
  void *v77;
  _OWORD v78[2];
  _OWORD v79[2];
  _OWORD v80[2];
  _BYTE buf[32];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v52;
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
      *(_QWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "image != nil";
    v54 = 37;
LABEL_43:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyPixelsFromImage:rect:destPtr:destPtrRowBytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v54, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)v53);
  }
  var0 = a4->var1.var0;
  if (var0)
    v12 = a4->var1.var1 == 0;
  else
    v12 = 1;
  if (v12)
  {
    NUAssertLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelRectIsEmpty(rect)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v35)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v57;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "!NUPixelRectIsEmpty(rect)";
    v54 = 38;
    goto LABEL_43;
  }
  if (!a5)
  {
    NUAssertLogger();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destPtr != nil");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v41)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v60;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v43;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "destPtr != nil";
    v54 = 39;
    goto LABEL_43;
  }
  objc_msgSend(v9, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "bytesPerPixel") * var0;

  if (v14 > a6)
  {
    NUAssertLogger();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v47)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v63;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v49;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])";
    v54 = 40;
    goto LABEL_43;
  }
  objc_msgSend(v10, "layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "imageSize");
  v18 = v17;

  *(_QWORD *)&v19 = v16;
  *((_QWORD *)&v19 + 1) = v18;
  v20 = a4->var0;
  var1 = a4->var1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  *(_OWORD *)&buf[16] = v19;
  v80[0] = v20;
  v80[1] = var1;
  NU::RectT<long>::Intersection((uint64_t)v79, (uint64_t *)buf, (uint64_t *)v80);
  v68 = v79[1];
  v69 = v79[0];
  objc_msgSend(v10, "validRegion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v69;
  v78[1] = v68;
  objc_msgSend(v22, "regionByClippingToRect:", v78);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEmpty") & 1) == 0)
  {
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke;
    v70[3] = &unk_1E5061CC0;
    v72 = v69;
    v73 = v68;
    v71 = v22;
    v24 = a4->var1;
    v74 = a4->var0;
    v75 = v24;
    v76 = a6;
    v77 = a5;
    objc_msgSend(v10, "readBufferRegion:withBlock:", v23, v70);

  }
}

+ (void)copyBuffer:(id)a3 rect:(id *)a4 toBuffer:(id)a5 atPoint:(id)a6
{
  void *v6;
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  int v23;
  int64_t v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  int8x16_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  void *v38;
  void *v39;
  int v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *specific;
  NSObject *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  _BOOL4 v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  _BOOL4 v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  _BOOL4 v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  NSObject *v162;
  void *v163;
  void *v164;
  NSObject *v165;
  _BOOL4 v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  void *v178;
  uint8_t permuteMap[4];
  vImage_Buffer dest;
  uint8_t buf[4];
  void *v182;
  __int16 v183;
  void *v184;
  vImage_Buffer src;
  uint64_t v186;

  var1 = a6.var1;
  var0 = a6.var0;
  v186 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    NUAssertLogger();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcBuffer != nil");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v66;
      _os_log_error_impl(&dword_1A6553000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v69)
      {
        v126 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "componentsJoinedByString:", CFSTR("\n"));
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v126;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v128;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v69)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "componentsJoinedByString:", CFSTR("\n"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v71;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "srcBuffer != nil";
    v130 = 70;
LABEL_121:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyBuffer:rect:toBuffer:atPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v130, CFSTR("Invalid parameter not satisfying: %s"), v158, v159, v160, v161, (uint64_t)v129);
  }
  if (a4->var0.var0 < 0)
  {
    NUAssertLogger();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rect.origin.x >= 0");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v73;
      _os_log_error_impl(&dword_1A6553000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v75 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v74)
    {
      if (v75)
      {
        v131 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "componentsJoinedByString:", CFSTR("\n"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v131;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v133;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v75)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v77;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "rect.origin.x >= 0";
    v130 = 71;
    goto LABEL_121;
  }
  v14 = a4->var1.var0;
  v13 = a4->var0.var0;
  if (v14 + v13 > objc_msgSend(v11, "size"))
  {
    NUAssertLogger();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rect.origin.x + rect.size.width <= srcBuffer.size.width");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v79;
      _os_log_error_impl(&dword_1A6553000, v78, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v80 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v81 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v80)
    {
      if (v81)
      {
        v134 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "componentsJoinedByString:", CFSTR("\n"));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v134;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v136;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v81)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v83;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "rect.origin.x + rect.size.width <= srcBuffer.size.width";
    v130 = 72;
    goto LABEL_121;
  }
  v15 = a4->var0.var1;
  if (v15 < 0)
  {
    NUAssertLogger();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rect.origin.y >= 0");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v85;
      _os_log_error_impl(&dword_1A6553000, v84, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v86 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v87 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v86)
    {
      if (v87)
      {
        v137 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "componentsJoinedByString:", CFSTR("\n"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v137;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v139;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v87)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "componentsJoinedByString:", CFSTR("\n"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v89;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "rect.origin.y >= 0";
    v130 = 73;
    goto LABEL_121;
  }
  v16 = a4->var1.var1;
  objc_msgSend(v11, "size");
  if (v16 + v15 > v17)
  {
    NUAssertLogger();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rect.origin.y + rect.size.height <= srcBuffer.size.height");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v91;
      _os_log_error_impl(&dword_1A6553000, v90, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v93 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v92)
    {
      if (v93)
      {
        v140 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "componentsJoinedByString:", CFSTR("\n"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v140;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v142;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v93)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "componentsJoinedByString:", CFSTR("\n"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v95;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "rect.origin.y + rect.size.height <= srcBuffer.size.height";
    v130 = 74;
    goto LABEL_121;
  }
  if (!v12)
  {
    NUAssertLogger();
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dstBuffer != nil");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v97;
      _os_log_error_impl(&dword_1A6553000, v96, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v99 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v98)
    {
      if (v99)
      {
        v143 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "componentsJoinedByString:", CFSTR("\n"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v143;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v145;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v99)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "componentsJoinedByString:", CFSTR("\n"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v101;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "dstBuffer != nil";
    v130 = 75;
    goto LABEL_121;
  }
  if (var0 < 0)
  {
    NUAssertLogger();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.x >= 0");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v103;
      _os_log_error_impl(&dword_1A6553000, v102, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v104 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v105 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v104)
    {
      if (v105)
      {
        v146 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "componentsJoinedByString:", CFSTR("\n"));
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v146;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v148;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v105)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "componentsJoinedByString:", CFSTR("\n"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v107;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "point.x >= 0";
    v130 = 76;
    goto LABEL_121;
  }
  v18 = a4->var1.var0;
  if (v18 + var0 > objc_msgSend(v12, "size"))
  {
    NUAssertLogger();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.x + rect.size.width <= dstBuffer.size.width");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v109;
      _os_log_error_impl(&dword_1A6553000, v108, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v110 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v111 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v110)
    {
      if (v111)
      {
        v149 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "componentsJoinedByString:", CFSTR("\n"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v149;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v151;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v111)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "componentsJoinedByString:", CFSTR("\n"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v113;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "point.x + rect.size.width <= dstBuffer.size.width";
    v130 = 77;
    goto LABEL_121;
  }
  if (a4->var0.var1 < 0)
  {
    NUAssertLogger();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rect.origin.y >= 0");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v115;
      _os_log_error_impl(&dword_1A6553000, v114, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v116 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v117 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v116)
    {
      if (v117)
      {
        v152 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "componentsJoinedByString:", CFSTR("\n"));
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v152;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v154;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v117)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "componentsJoinedByString:", CFSTR("\n"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v119;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "rect.origin.y >= 0";
    v130 = 78;
    goto LABEL_121;
  }
  v19 = a4->var1.var1;
  objc_msgSend(v12, "size");
  if (v19 + var1 > v20)
  {
    NUAssertLogger();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.y + rect.size.height <= dstBuffer.size.height");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v121;
      _os_log_error_impl(&dword_1A6553000, v120, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v122 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v68 = objc_claimAutoreleasedReturnValue();
    v123 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v122)
    {
      if (v123)
      {
        v155 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "componentsJoinedByString:", CFSTR("\n"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v155;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v157;
        _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v123)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "componentsJoinedByString:", CFSTR("\n"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v125;
      _os_log_error_impl(&dword_1A6553000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    v129 = "point.y + rect.size.height <= dstBuffer.size.height";
    v130 = 79;
    goto LABEL_121;
  }
  objc_msgSend(v11, "format");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "format");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqualToPixelFormat:", v22);

  if (v23)
  {
    v25 = a4->var1.var0;
    v24 = a4->var1.var1;
    objc_msgSend(v11, "format");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "bytesPerPixel");
    v28 = (char *)objc_msgSend(v11, "bytes");
    v29 = objc_msgSend(v11, "rowBytes");
    v30 = (char *)objc_msgSend(v12, "mutableBytes");
    v31 = objc_msgSend(v12, "rowBytes");
    if (v25 && v24)
    {
      v32 = v31;
      v33 = v27 * v25;
      do
      {
        memcpy(v30, v28, v33);
        v28 += v29;
        v30 += v32;
        --v24;
      }
      while (v24);
    }

    goto LABEL_25;
  }
  src.data = (void *)objc_msgSend(v11, "bytesAtPoint:", a4->var0.var0, a4->var0.var1);
  v34.i64[0] = 0xFFFFFFFFLL;
  v34.i64[1] = 0xFFFFFFFFLL;
  v35 = vandq_s8((int8x16_t)a4->var1, v34);
  *(int8x16_t *)&src.height = vextq_s8(v35, v35, 8uLL);
  src.rowBytes = objc_msgSend(v11, "rowBytes");
  dest.data = (void *)objc_msgSend(v12, "mutableBytesAtPoint:", var0, var1);
  v36.i64[0] = 0xFFFFFFFFLL;
  v36.i64[1] = 0xFFFFFFFFLL;
  v37 = vandq_s8((int8x16_t)a4->var1, v36);
  *(int8x16_t *)&dest.height = vextq_s8(v37, v37, 8uLL);
  dest.rowBytes = objc_msgSend(v12, "rowBytes");
  objc_msgSend(v11, "format");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqualToPixelFormat:", v39);
  v41 = v40;
  if (!v40
    || (objc_msgSend(v12, "format"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v21, "isEqualToPixelFormat:", v6) & 1) == 0))
  {
    v177 = v11;
    v178 = v12;
    objc_msgSend(v11, "format");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "isEqualToPixelFormat:", v43))
    {
      objc_msgSend(v178, "format");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqualToPixelFormat:", v45);

      if ((v41 & 1) != 0)
      {

      }
      v11 = v177;
      v12 = v178;
      if ((v46 & 1) != 0)
        goto LABEL_24;
    }
    else
    {

      if ((v41 & 1) != 0)
      {

      }
      v11 = v177;
    }
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v47 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "format");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "format");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("Unsupported pixel format conversion from %@ to %@"), v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v182 = v51;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v53 = (id)_NUAssertLogger;
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (v52)
    {
      if (v54)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v57;
        v183 = 2114;
        v184 = v59;
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
      v182 = v56;
      _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    objc_msgSend(v11, "format");
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "format");
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyBuffer:rect:toBuffer:atPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 110, CFSTR("Unsupported pixel format conversion from %@ to %@"), v61, v62, v63, v64, v60);
  }

LABEL_24:
  *(_DWORD *)permuteMap = 50331906;
  if (vImagePermuteChannels_ARGB8888(&src, &dest, permuteMap, 0))
  {
    NUAssertLogger();
    v162 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to convert image data"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v182 = v163;
      _os_log_error_impl(&dword_1A6553000, v162, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v164 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v165 = objc_claimAutoreleasedReturnValue();
    v166 = os_log_type_enabled(v165, OS_LOG_TYPE_ERROR);
    if (v164)
    {
      if (v166)
      {
        v169 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "componentsJoinedByString:", CFSTR("\n"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v169;
        v183 = 2114;
        v184 = v171;
        _os_log_error_impl(&dword_1A6553000, v165, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v166)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "componentsJoinedByString:", CFSTR("\n"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v182 = v168;
      _os_log_error_impl(&dword_1A6553000, v165, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyBuffer:rect:toBuffer:atPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 106, CFSTR("Failed to convert image data"), v172, v173, v174, v175, v176);
  }
LABEL_25:

}

+ (void)copyPixelsFromImage:(id)a3 atPoint:(id)a4 toBuffer:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "size");
  objc_msgSend(a1, "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v9, &v13, objc_msgSend(v10, "mutableBytes", var0, var1, v11, v12), objc_msgSend(v10, "rowBytes"));

}

+ (void)copyPixelsFromSurfaceImage:(id)a3 rect:(id *)a4 destPtr:(void *)a5 destPtrRowBytes:(int64_t)a6
{
  id v9;
  void *v10;
  int64_t var0;
  BOOL v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v20;
  $0AC6E346AE4835514AAA8AC86D8F4844 v21;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[8];
  $0AC6E346AE4835514AAA8AC86D8F4844 v66;
  $0AC6E346AE4835514AAA8AC86D8F4844 v67;
  int64_t v68;
  void *v69;
  _OWORD v70[2];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v47;
        v73 = 2114;
        v74 = v49;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v50 = "image != nil";
    v51 = 124;
LABEL_41:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyPixelsFromSurfaceImage:rect:destPtr:destPtrRowBytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v51, CFSTR("Invalid parameter not satisfying: %s"), v61, v62, v63, v64, (uint64_t)v50);
  }
  var0 = a4->var1.var0;
  if (var0)
    v12 = a4->var1.var1 == 0;
  else
    v12 = 1;
  if (v12)
  {
    NUAssertLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelRectIsEmpty(rect)");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v32)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v52;
        v73 = 2114;
        v74 = v54;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v34;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v50 = "!NUPixelRectIsEmpty(rect)";
    v51 = 125;
    goto LABEL_41;
  }
  if (!a5)
  {
    NUAssertLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destPtr != nil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v38)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v55;
        v73 = 2114;
        v74 = v57;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v40;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v50 = "destPtr != nil";
    v51 = 126;
    goto LABEL_41;
  }
  objc_msgSend(v9, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "bytesPerPixel") * var0;

  if (v14 > a6)
  {
    NUAssertLogger();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v42;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v43)
    {
      if (v44)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v58;
        v73 = 2114;
        v74 = v60;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v46;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v50 = "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])";
    v51 = 127;
    goto LABEL_41;
  }
  objc_msgSend(v10, "layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "imageSize");
  v18 = v17;

  var1 = a4->var1;
  v70[0] = a4->var0;
  v70[1] = var1;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v70);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __76__NUImageUtilities_copyPixelsFromSurfaceImage_rect_destPtr_destPtrRowBytes___block_invoke;
  v65[3] = &__block_descriptor_112_e28_v24__0___NUBufferTile__8_B16l;
  v65[4] = 0;
  v65[5] = 0;
  v65[6] = v16;
  v65[7] = v18;
  v21 = a4->var1;
  v66 = a4->var0;
  v67 = v21;
  v68 = a6;
  v69 = a5;
  objc_msgSend(v10, "readBufferRegion:withBlock:", v20, v65);

}

+ (void)copyPixelsFromSurfaceImage:(id)a3 atPoint:(id)a4 toBuffer:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "size");
  objc_msgSend(a1, "copyPixelsFromSurfaceImage:rect:destPtr:destPtrRowBytes:", v9, &v13, objc_msgSend(v10, "mutableBytes", var0, var1, v11, v12), objc_msgSend(v10, "rowBytes"));

}

+ (void)copyPixelsToImage:(id)a3 rect:(id *)a4 srcPtr:(const void *)a5 srcPtrRowBytes:(int64_t)a6
{
  id v9;
  void *v10;
  int64_t var0;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v21;
  $0AC6E346AE4835514AAA8AC86D8F4844 v22;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[8];
  $0AC6E346AE4835514AAA8AC86D8F4844 v67;
  $0AC6E346AE4835514AAA8AC86D8F4844 v68;
  int64_t v69;
  const void *v70;
  _OWORD v71[2];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v48;
        v74 = 2114;
        v75 = v50;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v51 = "image != nil";
    v52 = 155;
LABEL_44:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyPixelsToImage:rect:srcPtr:srcPtrRowBytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v52, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)v51);
  }
  var0 = a4->var1.var0;
  if (var0)
    v12 = a4->var1.var1 == 0;
  else
    v12 = 1;
  if (v12)
  {
    NUAssertLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelRectIsEmpty(rect)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v31;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v33)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v53;
        v74 = 2114;
        v75 = v55;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v35;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v51 = "!NUPixelRectIsEmpty(rect)";
    v52 = 156;
    goto LABEL_44;
  }
  if (!a5)
  {
    NUAssertLogger();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcPtr != nil");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v39)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v56;
        v74 = 2114;
        v75 = v58;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v41;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v51 = "srcPtr != nil";
    v52 = 157;
    goto LABEL_44;
  }
  if ((int)a6 >= 0)
    v13 = a6;
  else
    v13 = -(int)a6;
  objc_msgSend(v9, "format");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "bytesPerPixel") * var0;

  if (v15 > v13)
  {
    NUAssertLogger();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "abs((int)srcPtrRowBytes) >= (NUWidth(rect) * [[image format] bytesPerPixel])");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v43;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v45)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v59;
        v74 = 2114;
        v75 = v61;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v47;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v51 = "abs((int)srcPtrRowBytes) >= (NUWidth(rect) * [[image format] bytesPerPixel])";
    v52 = 158;
    goto LABEL_44;
  }
  objc_msgSend(v10, "layout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "imageSize");
  v19 = v18;

  var1 = a4->var1;
  v71[0] = a4->var0;
  v71[1] = var1;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v71);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __65__NUImageUtilities_copyPixelsToImage_rect_srcPtr_srcPtrRowBytes___block_invoke;
  v66[3] = &__block_descriptor_112_e35_v24__0___NUMutableBufferTile__8_B16l;
  v66[4] = 0;
  v66[5] = 0;
  v66[6] = v17;
  v66[7] = v19;
  v22 = a4->var1;
  v67 = a4->var0;
  v68 = v22;
  v69 = a6;
  v70 = a5;
  objc_msgSend(v10, "writeBufferRegion:withBlock:", v21, v66);

}

+ (void)copyPixelsToImage:(id)a3 atPoint:(id)a4 fromBuffer:(id)a5 inRect:(id *)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  uint64_t v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  v12 = a5;
  objc_msgSend(a1, "copyPixelsToImage:rect:srcPtr:srcPtrRowBytes:", v11, &v13, objc_msgSend(v12, "bytesAtPoint:", a6->var0.var0, a6->var0.var1, var0, var1, a6->var1.var0, a6->var1.var1), objc_msgSend(v12, "rowBytes"));

}

+ (void)fillPixelsInImage:(id)a3 rect:(id *)a4 srcPixel:(const void *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v15;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[8];
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v53;
  const void *v54;
  _OWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v36;
        v58 = 2114;
        v59 = v38;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v39 = "image != nil";
    v40 = 185;
LABEL_32:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities fillPixelsInImage:rect:srcPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v40, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)v39);
  }
  if (a4->var1.var0)
    v9 = a4->var1.var1 == 0;
  else
    v9 = 1;
  if (v9)
  {
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelRectIsEmpty(rect)");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v27)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v41;
        v58 = 2114;
        v59 = v43;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v29;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v39 = "!NUPixelRectIsEmpty(rect)";
    v40 = 186;
    goto LABEL_32;
  }
  if (!a5)
  {
    NUAssertLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcPixel != nil");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v31;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v33)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v44;
        v58 = 2114;
        v59 = v46;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v35;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v39 = "srcPixel != nil";
    v40 = 187;
    goto LABEL_32;
  }
  objc_msgSend(v7, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "imageSize");
  v13 = v12;

  var1 = a4->var1;
  v55[0] = a4->var0;
  v55[1] = var1;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v55);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __52__NUImageUtilities_fillPixelsInImage_rect_srcPixel___block_invoke;
  v51[3] = &__block_descriptor_104_e35_v24__0___NUMutableBufferTile__8_B16l;
  v51[4] = 0;
  v51[5] = 0;
  v51[6] = v11;
  v51[7] = v13;
  v16 = a4->var1;
  var0 = a4->var0;
  v53 = v16;
  v54 = a5;
  objc_msgSend(v8, "writeBufferRegion:withBlock:", v15, v51);

}

+ (void)fillPixelsInBuffer:(id)a3 rect:(id *)a4 srcPixel:(const void *)a5
{
  BOOL v7;
  uint64_t v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  _OWORD v49[2];
  uint64_t v50[2];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _OWORD v54[2];
  _BYTE buf[32];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  if (!v48)
  {
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = "buffer != nil";
    v37 = 203;
LABEL_35:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities fillPixelsInBuffer:rect:srcPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v37, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)v36);
  }
  if (a4->var1.var0)
    v7 = a4->var1.var1 == 0;
  else
    v7 = 1;
  if (v7)
  {
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelRectIsEmpty(rect)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v24)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = "!NUPixelRectIsEmpty(rect)";
    v37 = 204;
    goto LABEL_35;
  }
  if (!a5)
  {
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcPixel != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v30)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v43;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = "srcPixel != nil";
    v37 = 205;
    goto LABEL_35;
  }
  v50[0] = 0;
  v50[1] = 0;
  *(_QWORD *)&v51 = objc_msgSend(v48, "size");
  *((_QWORD *)&v51 + 1) = v8;
  var0 = a4->var0;
  var1 = a4->var1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  *(_OWORD *)&buf[16] = v51;
  v54[0] = var0;
  v54[1] = var1;
  NU::RectT<long>::Intersection((uint64_t)&v52, (uint64_t *)buf, (uint64_t *)v54);
  v49[0] = v52;
  v49[1] = v53;
  if ((_QWORD)v53 && *((_QWORD *)&v53 + 1))
  {
    v11 = objc_msgSend(v48, "mutableBytes");
    v12 = objc_msgSend(v48, "rowBytes");
    objc_msgSend(v48, "format");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    nu::fill_rect<NUPixelRect>(v50, v11, v12, (uint64_t *)v49, (unsigned __int8 *)a5, objc_msgSend(v13, "bytesPerPixel"));

  }
}

+ (void)copyPixelsFromImage:(id)a3 srcRect:(id *)a4 destImage:(id)a5 destOrigin:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;
  $0AC6E346AE4835514AAA8AC86D8F4844 v29;
  int64_t v30;
  int64_t v31;
  id v32;
  _QWORD v33[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 v34;
  $0AC6E346AE4835514AAA8AC86D8F4844 v35;

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a3;
  v12 = a5;
  v13 = a4->var0.var0;
  v14 = a4->var0.var1;
  v35 = a4->var1;
  objc_msgSend(v12, "layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "imageSize");
  v18 = v17;

  v33[0] = var0;
  v33[1] = var1;
  v34 = v35;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__NUImageUtilities_copyPixelsFromImage_srcRect_destImage_destOrigin___block_invoke;
  v21[3] = &unk_1E5061D48;
  v23 = 0;
  v24 = 0;
  v25 = v16;
  v26 = v18;
  v27 = var0;
  v28 = var1;
  v29 = v35;
  v30 = var0 - v13;
  v31 = var1 - v14;
  v32 = a1;
  v20 = v11;
  v22 = v20;
  objc_msgSend(v12, "writeBufferRegion:withBlock:", v19, v21);

}

+ (void)copySurfaceImage:(id)a3 toImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "size");
  v10 = v9;
  if (v8 != objc_msgSend(v7, "size") || v10 != v11)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUPixelSizeEqualToSize(surfaceImage.size, image.size)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        v41 = 2114;
        v42 = v26;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copySurfaceImage:toImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 242, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"NUPixelSizeEqualToSize(surfaceImage.size, image.size)");
  }
  v12 = objc_msgSend(v7, "size");
  v14 = v13;
  v38[0] = 0;
  v38[1] = 0;
  v38[2] = v12;
  v38[3] = v13;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __45__NUImageUtilities_copySurfaceImage_toImage___block_invoke;
  v31[3] = &unk_1E5061D70;
  v33 = a1;
  v16 = v7;
  v32 = v16;
  v34 = 0;
  v35 = 0;
  v36 = v12;
  v37 = v14;
  objc_msgSend(v6, "readBufferRegion:withBlock:", v15, v31);

}

+ (void)copyTexture:(id)a3 fromRect:(id *)a4 toSurfaceImage:(id)a5 atPoint:(id)a6 withDevice:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 v18;
  NURegion *v19;
  id v20;
  id v21;
  id v22;
  NURegion *v23;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  NURegion *v69;
  id v70;
  id v71;
  int64_t v72;
  int64_t v73;
  $0AC6E346AE4835514AAA8AC86D8F4844 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 v78;
  __int128 v79;
  $0AC6E346AE4835514AAA8AC86D8F4844 v80;
  _BYTE buf[32];
  uint64_t v82;

  var1 = a6.var1;
  var0 = a6.var0;
  v82 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = v14;
  if (!v13)
  {
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v51;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v52 = "image != nil";
    v53 = 253;
LABEL_38:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyTexture:fromRect:toSurfaceImage:atPoint:withDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v53, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)v52);
  }
  if (!v14)
  {
    NUAssertLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v56;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v52 = "device != nil";
    v53 = 254;
    goto LABEL_38;
  }
  if (!v12)
  {
    NUAssertLogger();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcTexture != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v40)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v59;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v42;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v52 = "srcTexture != nil";
    v53 = 255;
    goto LABEL_38;
  }
  objc_msgSend(v12, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metalDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v17)
  {
    NUAssertLogger();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcTexture.device == device.metalDevice");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v46)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v48;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v52 = "srcTexture.device == device.metalDevice";
    v53 = 256;
    goto LABEL_38;
  }
  v18 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = v18;
  v79 = *(_OWORD *)buf;
  v80 = v18;
  v77[0] = var0;
  v77[1] = var1;
  v78 = v18;
  v19 = -[NURegion initWithRect:]([NURegion alloc], "initWithRect:", v77);
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke;
  v67[3] = &unk_1E5061DC0;
  v20 = v13;
  v68 = v20;
  v69 = v19;
  v21 = v15;
  v70 = v21;
  v72 = var0;
  v73 = var1;
  v74 = v80;
  v75 = *(_OWORD *)buf;
  v76 = *(_OWORD *)&buf[16];
  v22 = v12;
  v71 = v22;
  v23 = v19;
  objc_msgSend(v21, "executeMetal:", v67);

}

+ (void)renderImage:(id)a3 toSurface:(id)a4 atPoint:(id)a5 withContext:(id)a6 andColorSpace:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v12;
  id v13;
  id v14;
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  CGAffineTransform v57;
  _QWORD v58[2];
  __int128 v59;
  CGRect buf;
  uint64_t v61;

  var1 = a5.var1;
  var0 = a5.var0;
  v61 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v41;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v43;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v44 = "image != nil";
    v45 = 278;
LABEL_29:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities renderImage:toSurface:atPoint:withContext:andColorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v45, CFSTR("Invalid parameter not satisfying: %s"), v52, v53, v54, v55, (uint64_t)v44);
  }
  if (!v14)
  {
    NUAssertLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v32)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v46;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v48;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v34;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v44 = "context != nil";
    v45 = 279;
    goto LABEL_29;
  }
  if (!v13)
  {
    NUAssertLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "surface != nil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v38)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v49;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v51;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v40;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v44 = "surface != nil";
    v45 = 280;
    goto LABEL_29;
  }
  objc_msgSend(v12, "extent");
  buf.origin.x = v16;
  buf.origin.y = v17;
  buf.size.width = v18;
  buf.size.height = v19;
  NU::RectT<long>::RectT(v58, &buf, 0);
  v56 = v59;
  CGAffineTransformMakeTranslation(&v57, (double)(var0 - v58[0]), (double)(var1 - v58[1]));
  objc_msgSend(v12, "imageByApplyingTransform:", &v57);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "imageByClampingToExtent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "render:toIOSurface:bounds:colorSpace:", v21, objc_msgSend(v13, "IOSurfaceRef"), objc_msgSend(v15, "CGColorSpace"), (double)var0, (double)var1, (double)(uint64_t)v56, (double)*((uint64_t *)&v56 + 1));
}

+ (int64_t)alignedRowBytesForWidth:(int64_t)a3 bytesPerPixel:(int64_t)a4
{
  int64_t v4;
  int64_t result;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "width > 0");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v32;
        v49 = 2114;
        v50 = v34;
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
      v48 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 303, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"width > 0");
  }
  v4 = a3 * a4;
  if ((unsigned __int128)(a3 * (__int128)a4) >> 64 != (a3 * a4) >> 63)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v6 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("integer overflow detected"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
      v8 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v11;
        v49 = 2114;
        v50 = v13;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
      v8 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v10;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
    }

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 309, CFSTR("integer overflow detected"), v14, v15, v16, v17, v46);
  }
  result = (v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (result < v4)
  {
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("integer overflow detected"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v39;
        v49 = 2114;
        v50 = v41;
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
      v48 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 316, CFSTR("integer overflow detected"), v42, v43, v44, v45, v46);
  }
  return result;
}

void __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke_2;
  v10[3] = &unk_1E5061D98;
  v6 = *(_OWORD *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = v6;
  v7 = *(_OWORD *)(a1 + 112);
  v15 = *(_OWORD *)(a1 + 96);
  v16 = v7;
  v8 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = v3;
  v9 = v3;
  objc_msgSend(v4, "writeTextureRegion:device:withBlock:", v5, v8, v10);

}

void __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  int64x2_t v11;
  _QWORD v12[3];
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  int64x2_t v19[2];
  _OWORD v20[2];
  _OWORD v21[2];

  v3 = a2;
  v4 = v3;
  v5 = 0uLL;
  v17 = 0u;
  v18 = 0u;
  v6 = 0uLL;
  if (v3)
  {
    objc_msgSend(v3, "frameRect");
    v6 = v17;
    v5 = v18;
  }
  v7 = *(_OWORD *)(a1 + 64);
  v21[0] = *(_OWORD *)(a1 + 48);
  v21[1] = v7;
  v20[0] = v6;
  v20[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)v19, (uint64_t *)v21, (uint64_t *)v20);
  v11 = v19[0];
  v8 = v17;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = vaddq_s64(vsubq_s64(v19[0], *(int64x2_t *)(a1 + 48)), *(int64x2_t *)(a1 + 80));
  v14 = 0;
  v15 = v19[1];
  v16 = 1;
  objc_msgSend(v4, "texture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v11.i64[0] - v8;
  v12[1] = v11.i64[1] - *((_QWORD *)&v8 + 1);
  v12[2] = 0;
  +[NUCopyKernel copyFromTexture:region:toTexture:atPoint:withCommandBuffer:](NUCopyKernel, "copyFromTexture:region:toTexture:atPoint:withCommandBuffer:", v9, &v13, v10, v12, *(_QWORD *)(a1 + 40));

}

void __45__NUImageUtilities_copySurfaceImage_toImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;

  v3 = a2;
  v4 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "frameRect");
    v8 = *((_QWORD *)&v12 + 1);
    v7 = v12;
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v12 = 0u;
    v13 = 0u;
  }
  objc_msgSend(v4, "buffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(a1 + 64);
  v11[0] = *(_OWORD *)(a1 + 48);
  v11[1] = v10;
  objc_msgSend(v5, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v6, v7, v8, v9, v11);

}

void __69__NUImageUtilities_copyPixelsFromImage_srcRect_destImage_destOrigin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  int64x2_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int64x2_t v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  int64x2_t v23;
  __int128 v24;
  int64x2_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v3 = a2;
  v4 = v3;
  v16 = *(_OWORD *)(a1 + 56);
  v18 = *(_OWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "frameRect");
    v6 = v21;
    v5 = v22;
  }
  else
  {
    v5 = 0uLL;
    v21 = 0u;
    v22 = 0u;
    v6 = 0uLL;
  }
  v7 = *(int64x2_t *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 88);
  v27 = v6;
  v28 = v5;
  v25 = v7;
  v26 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v23, (uint64_t *)&v27, v25.i64);
  v27 = v18;
  v28 = v16;
  v25 = v23;
  v26 = v24;
  NU::RectT<long>::Intersection((uint64_t)&v23, (uint64_t *)&v27, v25.i64);
  if ((_QWORD)v24 && *((_QWORD *)&v24 + 1))
  {
    v17 = v24;
    v19 = v23;
    objc_msgSend(v4, "mutableBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "format");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "bytesPerPixel");

    if (v4)
    {
      objc_msgSend(v4, "frameRect");
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    v12 = objc_msgSend(v9, "rowBytes");
    v13 = objc_msgSend(v9, "mutableBytes");
    v14 = *(void **)(a1 + 120);
    v15 = *(_QWORD *)(a1 + 32);
    v20[0] = vsubq_s64(v19, *(int64x2_t *)(a1 + 104));
    v20[1] = v17;
    objc_msgSend(v14, "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v15, v20, v13 + (v19.i64[1] - *((_QWORD *)&v27 + 1)) * v12 + (v19.i64[0] - (_QWORD)v27) * v11, objc_msgSend(v9, "rowBytes"));

  }
}

void __52__NUImageUtilities_fillPixelsInImage_rect_srcPixel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v3 = a2;
  v4 = v3;
  v14 = *(_OWORD *)(a1 + 48);
  v15 = *(_OWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "frameRect");
    v6 = v16;
    v5 = v17;
  }
  else
  {
    v5 = 0uLL;
    v16 = 0u;
    v17 = 0u;
    v6 = 0uLL;
  }
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 80);
  v24 = v6;
  v25 = v5;
  v22 = v7;
  v23 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v20, (uint64_t *)&v24, (uint64_t *)&v22);
  v24 = v15;
  v25 = v14;
  v22 = v20;
  v23 = v21;
  NU::RectT<long>::Intersection((uint64_t)&v20, (uint64_t *)&v24, (uint64_t *)&v22);
  v18 = v20;
  v19 = v21;
  if ((_QWORD)v21 && *((_QWORD *)&v21 + 1))
  {
    objc_msgSend(v4, "mutableBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "frameRect");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    v10 = objc_msgSend(v9, "mutableBytes", v14, v15, v16, v17, v18, v19);
    v11 = objc_msgSend(v9, "rowBytes");
    v12 = *(unsigned __int8 **)(a1 + 96);
    objc_msgSend(v9, "format");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    nu::fill_rect<NUPixelRect>((uint64_t *)&v24, v10, v11, (uint64_t *)&v18, v12, objc_msgSend(v13, "bytesPerPixel"));

  }
}

void __65__NUImageUtilities_copyPixelsToImage_rect_srcPtr_srcPtrRowBytes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v3 = a2;
  v4 = v3;
  v28 = *(_OWORD *)(a1 + 48);
  v30 = *(_OWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "frameRect");
    v6 = v32;
    v5 = v33;
  }
  else
  {
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 80);
  v38 = v6;
  v39 = v5;
  v36 = v7;
  v37 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v34, (uint64_t *)&v38, (uint64_t *)&v36);
  v38 = v30;
  v39 = v28;
  v36 = v34;
  v37 = v35;
  NU::RectT<long>::Intersection((uint64_t)&v34, (uint64_t *)&v38, (uint64_t *)&v36);
  v9 = v35;
  if ((_QWORD)v35)
  {
    v10 = *((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1))
    {
      v29 = v34;
      objc_msgSend(v4, "mutableBuffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v11;
      objc_msgSend(v11, "format");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "bytesPerPixel");

      v14 = *(_QWORD *)(a1 + 96);
      v26 = *(_QWORD *)(a1 + 64);
      v27 = *(_QWORD *)(a1 + 104);
      v25 = *(_QWORD *)(a1 + 72);
      if (v4)
      {
        objc_msgSend(v4, "frameRect");
      }
      else
      {
        v38 = 0u;
        v39 = 0u;
      }
      v24 = objc_msgSend(v11, "rowBytes");
      v15 = objc_msgSend(v11, "mutableBytes");
      v16 = v11;
      v18 = *((_QWORD *)&v38 + 1);
      v17 = v38;
      v19 = *(_QWORD *)(a1 + 96);
      v20 = objc_msgSend(v16, "rowBytes");
      v21 = (char *)(v27 + (*((_QWORD *)&v29 + 1) - v25) * v14 + (v29 - v26) * v13);
      v22 = (char *)(v15 + (*((_QWORD *)&v29 + 1) - v18) * v24 + (v29 - v17) * v13);
      v23 = v9 * v13;
      do
      {
        memcpy(v22, v21, v23);
        v21 += v19;
        v22 += v20;
        --v10;
      }
      while (v10);

    }
  }

}

void __76__NUImageUtilities_copyPixelsFromSurfaceImage_rect_destPtr_destPtrRowBytes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v3 = a2;
  v4 = v3;
  v29 = *(_OWORD *)(a1 + 48);
  v31 = *(_OWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "contentRect");
    v6 = v33;
    v5 = v34;
  }
  else
  {
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 80);
  v39 = v6;
  v40 = v5;
  v37 = v7;
  v38 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v35, (uint64_t *)&v39, (uint64_t *)&v37);
  v39 = v31;
  v40 = v29;
  v37 = v35;
  v38 = v36;
  NU::RectT<long>::Intersection((uint64_t)&v35, (uint64_t *)&v39, (uint64_t *)&v37);
  v9 = v36;
  if ((_QWORD)v36)
  {
    v10 = *((_QWORD *)&v36 + 1);
    if (*((_QWORD *)&v36 + 1))
    {
      v30 = v35;
      v28 = v4;
      objc_msgSend(v4, "buffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v11;
      objc_msgSend(v11, "format");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "bytesPerPixel");

      v27 = v9;
      if (v4)
      {
        objc_msgSend(v4, "frameRect");
      }
      else
      {
        v39 = 0u;
        v40 = 0u;
      }
      v26 = objc_msgSend(v11, "rowBytes");
      v25 = objc_msgSend(v11, "bytes");
      v14 = v11;
      v15 = *((_QWORD *)&v39 + 1);
      v16 = v39;
      v18 = *(_QWORD *)(a1 + 96);
      v17 = *(_QWORD *)(a1 + 104);
      v20 = *(_QWORD *)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 72);
      v21 = objc_msgSend(v14, "rowBytes");
      v22 = (char *)(v17 + (*((_QWORD *)&v30 + 1) - v19) * v18 + (v30 - v20) * v13);
      v23 = (char *)(v25 + (*((_QWORD *)&v30 + 1) - v15) * v26 + (v30 - v16) * v13);
      v24 = *(_QWORD *)(a1 + 96);
      do
      {
        memcpy(v22, v23, v27 * v13);
        v23 += v21;
        v22 += v24;
        --v10;
      }
      while (v10);

      v4 = v28;
    }
  }

}

void __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  _OWORD v24[2];
  _OWORD v25[2];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contentRect");
    v5 = v21;
    v6 = v22;
  }
  else
  {
    v6 = 0uLL;
    v22 = 0u;
    v21 = 0u;
    v5 = 0uLL;
  }
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 56);
  v25[0] = v5;
  v25[1] = v6;
  v24[0] = v7;
  v24[1] = v8;
  NU::RectT<long>::Intersection((uint64_t)v23, (uint64_t *)v25, (uint64_t *)v24);
  v9 = *(void **)(a1 + 32);
  v20[0] = v23[0];
  v20[1] = v23[1];
  objc_msgSend(v9, "regionByClippingToRect:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke_2;
  v14[3] = &unk_1E5061C98;
  v11 = v4;
  v15 = v11;
  v12 = *(_OWORD *)(a1 + 88);
  v16 = *(_OWORD *)(a1 + 72);
  v17 = v12;
  v13 = *(_QWORD *)(a1 + 112);
  v18 = *(_QWORD *)(a1 + 104);
  v19 = v13;
  objc_msgSend(v10, "enumerateRects:", v14);

}

void __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;

  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bytesPerPixel");

  v7 = *(void **)(a1 + 32);
  v23 = v6;
  if (v7)
    objc_msgSend(v7, "frameRect");
  else
    v24 = 0u;
  v22 = objc_msgSend(v4, "rowBytes");
  v21 = objc_msgSend(v4, "bytes");
  v8 = *a2;
  v9 = a2[1];
  v19 = *(_QWORD *)(a1 + 80);
  v20 = *(_QWORD *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 40);
  v12 = a2[2];
  v11 = a2[3];
  v13 = objc_msgSend(v4, "rowBytes");
  if (v12 && v11)
  {
    v14 = v13;
    v15 = (char *)(v21 + (v9 - *((_QWORD *)&v24 + 1)) * v22 + (v8 - v24) * v6);
    v16 = (char *)(v19 + (v9 - v10) * v20 + (v8 - v18) * v6);
    v17 = *(_QWORD *)(a1 + 72);
    do
    {
      memcpy(v16, v15, v12 * v23);
      v15 += v14;
      v16 += v17;
      --v11;
    }
    while (v11);
  }

}

@end
