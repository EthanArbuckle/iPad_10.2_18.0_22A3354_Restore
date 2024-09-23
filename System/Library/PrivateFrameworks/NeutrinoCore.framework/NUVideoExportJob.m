@implementation NUVideoExportJob

- (NUVideoExportJob)initWithVideoExportRequest:(id)a3
{
  id v4;
  NUVideoExportJob *v5;
  void *v6;
  NUDigest *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUVideoExportJob;
  v5 = -[NUExportJob initWithExportRequest:](&v9, sel_initWithExportRequest_, v4);
  if (v5)
  {
    objc_msgSend(v4, "composition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob setComposition:](v5, "setComposition:", v6);

    if (objc_msgSend(v4, "computeDigest"))
    {
      v7 = objc_alloc_init(NUDigest);
      -[NUVideoExportJob setDigest:](v5, "setDigest:", v7);

    }
  }

  return v5;
}

- (NUVideoExportJob)initWithExportRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3450);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3450);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3450);
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
  _NUAssertFailHandler((uint64_t)"-[NUVideoExportJob initWithExportRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoExportJob.m", 88, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)result
{
  _NUVideoExportResult *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(_NUVideoExportResult);
  -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUExportResult setDestinationURL:](v3, "setDestinationURL:", v5);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUExportResult setGeometry:](v3, "setGeometry:", v6);

  -[NUVideoExportJob digest](self, "digest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoExportResult setDigest:](v3, "setDigest:", v8);

  return v3;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NUResetOrientationNode *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NUVideoExportJob;
  -[NURenderJob prepareNodeWithPipelineState:error:](&v16, sel_prepareNodeWithPipelineState_error_, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (-[NUVideoExportJob videoExportRequest](self, "videoExportRequest"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "applyOrientationAsMetadata"),
        v7,
        !v8))
  {
LABEL_10:
    v6 = v6;
    v10 = v6;
    goto LABEL_11;
  }
  objc_msgSend(v6, "outputImageGeometry:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "orientation");
    v12 = 6;
    if (v11 != 8)
      v12 = v11;
    if (v11 == 6)
      v13 = 8;
    else
      v13 = v12;
    v14 = -[NUOrientationNode initWithOrientation:input:]([NUResetOrientationNode alloc], "initWithOrientation:input:", v13, v6);

    v6 = v14;
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (BOOL)requiresVideoComposition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob prepareNode](self, "prepareNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v4, "videoProperties:", &v32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v32;
  -[NUVideoExportJob setVideoProperties:](self, "setVideoProperties:", v5);

  -[NUVideoExportJob videoProperties](self, "videoProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_135);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Failed to prepare video properties: %@", buf, 0xCu);
    }
  }
  -[NURenderJob outputVideo](self, "outputVideo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
      if (objc_msgSend(v15, "isEnabled"))
      {
        objc_msgSend(v15, "segments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17 > 1)
          goto LABEL_20;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v12)
          goto LABEL_8;
        break;
      }
    }
  }

  v18 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v3, "destinationURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "typeWithFilenameExtension:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5B0]))
  {
LABEL_20:
    v25 = 1;
    goto LABEL_21;
  }
  if ((objc_msgSend(v3, "applyOrientationAsMetadata") & 1) != 0)
    goto LABEL_19;
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "orientation");

  -[NUVideoExportJob videoProperties](self, "videoProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "orientation");

  v25 = 1;
  if (v22 == 1 && v24 == 1)
  {
LABEL_19:
    v27.receiver = self;
    v27.super_class = (Class)NUVideoExportJob;
    v25 = -[NURenderJob requiresVideoComposition](&v27, sel_requiresVideoComposition);
  }
LABEL_21:

  return v25;
}

- (id)generateVideoComposition:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)NUVideoExportJob;
  -[NURenderJob generateVideoComposition:](&v26, sel_generateVideoComposition_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[NUVideoUtilities deepMutableCopyVideoComposition:](NUVideoUtilities, "deepMutableCopyVideoComposition:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUVideoExportJob videoProperties](self, "videoProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHDR");

    if ((v7 & 1) == 0)
    {
      -[NURenderJob composition](self, "composition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("semanticStyle"));

    }
    objc_msgSend(v5, "setCustomVideoCompositorClass:", objc_opt_class());
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "instructions", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[NURenderJob composition](self, "composition");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAdjustmentComposition:", v16);

          -[NURenderJob request](self, "request");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pipelineFilters");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPipelineFilters:", v18);

          -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "colorSpace");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setColorSpace:", v20);

          objc_msgSend(v15, "setRenderJob:", self);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

    v8 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)renderer:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[NURenderJob priority](self, "priority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLow");

  -[NURenderJob device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "lowPriorityRendererWithoutIntermediateCaching:", a3);
  else
    objc_msgSend(v7, "rendererWithoutIntermediateCaching:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)render:(id *)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char flags;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  float v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  BOOL v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  CMVideoCodecType v37;
  uint64_t v38;
  uint64_t v39;
  int32_t v40;
  int32_t v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  FourCharCode MediaSubType;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  float v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  BOOL v103;
  int v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t i;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  BOOL v118;
  uint64_t *v119;
  void *v120;
  void *v121;
  BOOL v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  float v127;
  float v128;
  void *v129;
  void *v130;
  void *v131;
  _BOOL4 v132;
  id *v133;
  uint64_t v134;
  void *v135;
  id v136;
  NSObject *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  BOOL v164;
  void *v165;
  NSObject *v166;
  uint64_t v167;
  id v168;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  _BOOL4 v176;
  void *v177;
  const opaqueCMFormatDescription *v178;
  const AudioStreamBasicDescription *StreamBasicDescription;
  NSObject *v180;
  void *v181;
  void *v182;
  int v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t k;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t m;
  void *v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  CMTimeEpoch v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t ii;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  NSObject *v226;
  int v227;
  CMTimeScale v228;
  uint64_t v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  void *v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t jj;
  void *v239;
  uint64_t v240;
  void *v241;
  _BOOL4 v242;
  NSObject *v243;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  id v257;
  id v258;
  void *v259;
  char v260;
  void *v261;
  void *v262;
  NSObject *v263;
  void *v264;
  void *specific;
  NSObject *v266;
  _BOOL4 v267;
  void *v268;
  void *v269;
  CMTimeValue v270;
  void *v271;
  void *v272;
  id v273;
  void *v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  NSObject *v280;
  void *v281;
  void *v282;
  NSObject *v283;
  _BOOL4 v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  id v289;
  void *v290;
  void *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  id v301;
  id v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  unsigned int v306;
  id v307;
  id v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  void *v312;
  id v313;
  void *v314;
  void *v315;
  void *v316;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  id obj;
  id obja;
  id objb;
  id objc;
  uint64_t v328;
  void *v329;
  uint64_t v330;
  void *n;
  uint64_t v332;
  void *v333;
  void *v334;
  uint64_t v335;
  void *v336;
  void *v337;
  char v338;
  void *v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  id v344;
  id v345;
  CMTimeEpoch v346;
  uint64_t v347;
  unsigned int newTimescale;
  void *newTimescalea;
  id newTimescaleb;
  id newTimescalec;
  id newTimescaled;
  void *newTimescalee;
  int32_t newTimescalef[2];
  void *v355;
  uint64_t v356;
  id v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  _OWORD v382[3];
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  _OWORD v398[3];
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  char v406[32];
  _QWORD v407[13];
  char v408[32];
  id v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  CMTime v418;
  CMTime v419;
  __int128 v420;
  uint64_t v421;
  __int128 v422;
  uint64_t v423;
  __int128 v424;
  uint64_t v425;
  __int128 v426;
  uint64_t v427;
  __int128 v428;
  uint64_t v429;
  __int128 v430;
  uint64_t v431;
  CMTime v432;
  CMTime v433;
  CMTime v434;
  CMTime time2;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  id v441;
  id v442;
  _BYTE v443[128];
  _BYTE v444[128];
  _BYTE v445[128];
  _BYTE v446[128];
  _BYTE v447[128];
  _BYTE v448[128];
  _BYTE v449[128];
  _BYTE v450[128];
  id v451;
  _BYTE v452[128];
  _BYTE v453[128];
  _BYTE v454[128];
  _BYTE v455[128];
  CMTime time;
  CMTime v457;
  _BYTE v458[128];
  CMTime buf;
  uint64_t v460;

  v460 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_3377();
    v263 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v264;
      _os_log_error_impl(&dword_1A6553000, v263, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3377();
    v266 = objc_claimAutoreleasedReturnValue();
    v267 = os_log_type_enabled(v266, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v267)
      {
        v271 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v272 = (void *)MEMORY[0x1E0CB3978];
        v273 = v271;
        objc_msgSend(v272, "callStackSymbols");
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v274, "componentsJoinedByString:", CFSTR("\n"));
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v271;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v275;
        _os_log_error_impl(&dword_1A6553000, v266, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v267)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "componentsJoinedByString:", CFSTR("\n"));
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v269;
      _os_log_error_impl(&dword_1A6553000, v266, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoExportJob.m", 231, CFSTR("Invalid parameter not satisfying: %s"), v276, v277, v278, v279, (uint64_t)"error != nil");
  }
  -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoExportJob videoProperties](self, "videoProperties");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C8AFD0]);
  -[NURenderJob outputVideo](self, "outputVideo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v442 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithAsset:error:", v4, &v442);
  v6 = v442;

  if (!v5)
  {
    -[NURenderJob outputVideo](self, "outputVideo");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to initialize AVAssetReader"), v319, v6);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_133;
  }
  objc_msgSend(v322, "destinationURL");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NUFileTypeFromExtension(v7);
  v316 = (void *)objc_claimAutoreleasedReturnValue();

  v441 = v6;
  v321 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B018]), "initWithURL:fileType:error:", v319, v316, &v441);
  v313 = v441;

  if (!v321)
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to inialize AVAssetWriter for URL"), v319, v313);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_132;
  }
  objc_msgSend(v322, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "setMetadata:", v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&buf, 0, sizeof(buf));
  if (v320)
  {
    objc_msgSend(v320, "livePhotoKeyFrameTime");
    flags = buf.flags;
  }
  else
  {
    flags = 0;
  }
  v440 = 0u;
  v439 = 0u;
  v438 = 0u;
  v437 = 0u;
  -[NURenderJob outputVideo](self, "outputVideo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tracks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v437, v458, 16);
  v338 = flags & 1;
  if (!v13)
  {
    newTimescale = 600;
    v17 = 0.0;
    goto LABEL_41;
  }
  v14 = *(_QWORD *)v438;
  v15 = *MEMORY[0x1E0C8A808];
  v16 = *MEMORY[0x1E0C8A7A8];
  v356 = *MEMORY[0x1E0C8A7A0];
  v341 = *MEMORY[0x1E0C8A7D0];
  newTimescale = 600;
  v17 = 0.0;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v438 != v14)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v437 + 1) + 8 * v18);
      objc_msgSend(v19, "mediaType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v15);

      if (v21)
      {
        objc_msgSend(v355, "addObject:", v19);
        newTimescale = objc_msgSend(v19, "naturalTimeScale");
        objc_msgSend(v19, "estimatedDataRate");
        if (v17 < v22)
          v17 = v22;
      }
      else
      {
        objc_msgSend(v19, "mediaType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v16);

        if (v24)
        {
          objc_msgSend(v340, "addObject:", v19);
          goto LABEL_26;
        }
        objc_msgSend(v19, "mediaType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", v356);

        if (v26)
        {
          objc_msgSend(v339, "addObject:", v19);
          goto LABEL_26;
        }
        objc_msgSend(v19, "mediaType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", v341);

        if (!v28)
        {
LABEL_25:
          objc_msgSend(v337, "addObject:", v19);
          goto LABEL_26;
        }
        v29 = +[NUVideoUtilities isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:](NUVideoUtilities, "isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:", v19);
        if (+[NUVideoUtilities isMetadataTrackWithStillImageTransformInLivePhoto:](NUVideoUtilities, "isMetadataTrackWithStillImageTransformInLivePhoto:", v19))
        {
          v338 = 1;
          goto LABEL_26;
        }
        v338 &= !v29;
        if (+[NUVideoUtilities isMetadataTrackWithLivePhotoInfo:](NUVideoUtilities, "isMetadataTrackWithLivePhotoInfo:", v19))
        {
          -[NURenderJob renderNode](self, "renderNode");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "canPropagateOriginalLivePhotoMetadataTrack");

          if (v31)
            goto LABEL_25;
        }
        else if (+[NUVideoUtilities metadataTrackContainsPortraitVideoData:](NUVideoUtilities, "metadataTrackContainsPortraitVideoData:", v19))
        {
          if (objc_msgSend(v322, "includeCinematicVideoTracks"))
            goto LABEL_25;
        }
        else if (!+[NUVideoUtilities metadataTrackContainsCinematicAudioData:](NUVideoUtilities, "metadataTrackContainsCinematicAudioData:", v19)|| objc_msgSend(v322, "includeCinematicVideoTracks"))
        {
          goto LABEL_25;
        }
      }
LABEL_26:
      ++v18;
    }
    while (v13 != v18);
    v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v437, v458, 16);
    v13 = v32;
  }
  while (v32);
LABEL_41:

  if ((buf.flags & 1) != 0)
  {
    time = buf;
    CMTimeConvertScale(&v457, &time, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    buf = v457;
  }
  objc_msgSend(v322, "outputSettings");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0C8AE68];
  objc_msgSend(v314, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AE68]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (v35)
    +[NUVideoUtilities defaultExportCodecForHDRVideo:](NUVideoUtilities, "defaultExportCodecForHDRVideo:", objc_msgSend(v320, "isHDR"));
  else
    objc_msgSend(v314, "objectForKeyedSubscript:", v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = NUTypeCodeFromString(v36);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v312, "scaledSize");
  v309 = v39;
  v310 = v38;
  if (((v38 | v39) & 1) != 0)
  {
    NUAssertLogger_3377();
    v280 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected even dimensions for the exported video"));
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v457.value) = 138543362;
      *(CMTimeValue *)((char *)&v457.value + 4) = (CMTimeValue)v281;
      _os_log_error_impl(&dword_1A6553000, v280, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v457, 0xCu);

    }
    v282 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3377();
    v283 = objc_claimAutoreleasedReturnValue();
    v284 = os_log_type_enabled(v283, OS_LOG_TYPE_ERROR);
    if (v282)
    {
      if (v284)
      {
        v287 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v288 = (void *)MEMORY[0x1E0CB3978];
        v289 = v287;
        objc_msgSend(v288, "callStackSymbols");
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "componentsJoinedByString:", CFSTR("\n"));
        v291 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v457.value) = 138543618;
        *(CMTimeValue *)((char *)&v457.value + 4) = (CMTimeValue)v287;
        LOWORD(v457.flags) = 2114;
        *(_QWORD *)((char *)&v457.flags + 2) = v291;
        _os_log_error_impl(&dword_1A6553000, v283, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v457, 0x16u);

      }
    }
    else if (v284)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v285, "componentsJoinedByString:", CFSTR("\n"));
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v457.value) = 138543362;
      *(CMTimeValue *)((char *)&v457.value + 4) = (CMTimeValue)v286;
      _os_log_error_impl(&dword_1A6553000, v283, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v457, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoExportJob.m", 338, CFSTR("Expected even dimensions for the exported video"), v292, v293, v294, v295, v296);
  }
  +[NUVideoUtilities bestOutputSettingsPresetForTargetVideoSize:codec:](NUVideoUtilities, "bestOutputSettingsPresetForTargetVideoSize:codec:");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B2D0], "outputSettingsAssistantWithPreset:", v311);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v318)
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Failed to instantiate assistant for preset"), v311);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_131;
  }
  formatDescriptionOut = 0;
  if (v310 <= v309)
    v40 = v309;
  else
    v40 = v310;
  if (v310 >= v309)
    v41 = v309;
  else
    v41 = v310;
  if (!CMVideoFormatDescriptionCreate(0, v37, v40, v41, 0, &formatDescriptionOut))
  {
    objc_msgSend(v318, "setSourceVideoFormat:", formatDescriptionOut);
    CFRelease(formatDescriptionOut);
  }
  objc_msgSend(v355, "firstObject");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v457, 0, sizeof(v457));
  if (v315)
  {
    objc_msgSend(v315, "minFrameDuration");
    if ((v457.flags & 1) != 0)
    {
      time = v457;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time, &time2) >= 1)
      {
        v434 = v457;
        objc_msgSend(v318, "setSourceVideoMinFrameDuration:", &v434);
      }
    }
  }
  objc_msgSend(v315, "nominalFrameRate");
  if (v42 > 0.0)
  {
    objc_msgSend(v315, "nominalFrameRate");
    CMTimeMakeWithSeconds(&v433, 1.0 / v43, objc_msgSend(v315, "naturalTimeScale"));
    v432 = v433;
    objc_msgSend(v318, "setSourceVideoAverageFrameDuration:", &v432);
  }
  objc_msgSend(v315, "formatDescriptions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "setSourceVideoFormat:", objc_msgSend(v44, "firstObject"));

  -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "size");
  v304 = v47;
  v305 = v46;

  if (v320)
  {
    v48 = objc_msgSend(v320, "originalSize");
    v304 = v49;
    v305 = v48;
  }
  v357 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 == 0;

  if (v51)
  {
    objc_msgSend(v315, "formatDescriptions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "firstObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v55);
    v57 = objc_msgSend(v312, "renderScale");
    v59 = v58;
    -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "renderScale");
      v64 = v63;

    }
    else
    {
      v62 = -[NURenderJob renderScale](self, "renderScale");
      v64 = v95;
    }

    if (NUScaleCompare(v57, v59, v62, v64)
      || (objc_msgSend(v322, "bypassOutputSettingsIfNoComposition") & 1) == 0
      && ((objc_msgSend(v314, "objectForKeyedSubscript:", v33),
           (v102 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        ? (v103 = v37 == MediaSubType)
        : (v103 = 1),
          v103 ? (v104 = 0) : (v104 = 1),
          v102,
          v104))
    {
      -[NURenderJob composition](self, "composition");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUVideoUtilities defaultVideoSettingsForAVAssetReaderWithHDR:forAuxiliaryImageType:](NUVideoUtilities, "defaultVideoSettingsForAVAssetReaderWithHDR:forAuxiliaryImageType:", +[NUCompositionUtilities isHDRComposition:](NUCompositionUtilities, "isHDRComposition:", v96), 1);
      newTimescalea = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v318, "videoSettings");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (void *)objc_msgSend(v97, "mutableCopy");

      objc_msgSend(v98, "addEntriesFromDictionary:", v314);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v310);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setObject:forKeyedSubscript:", v99, *MEMORY[0x1E0C8AF60]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v309);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setObject:forKeyedSubscript:", v100, *MEMORY[0x1E0C8AEF0]);

      objc_msgSend(v98, "removeObjectForKey:", *MEMORY[0x1E0C8AF30]);
      if (v320)
      {
        objc_msgSend(v320, "cleanAperture");
        +[NUVideoUtilities cleanApertureVideoSettingsFor:scale:videoSize:](NUVideoUtilities, "cleanApertureVideoSettingsFor:scale:videoSize:", v406, v57, v59, v310, v309);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setObject:forKeyedSubscript:", v101, *MEMORY[0x1E0C8AE40]);

      }
      v344 = v98;

    }
    else
    {
      v344 = 0;
      newTimescalea = 0;
    }
    v405 = 0u;
    v404 = 0u;
    v403 = 0u;
    v402 = 0u;
    -[NURenderJob outputVideo](self, "outputVideo");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = *MEMORY[0x1E0C8A808];
    objc_msgSend(v105, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v334 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v402, v453, 16);
    if (v107)
    {
      v108 = *(_QWORD *)v403;
      do
      {
        for (i = 0; i != v107; ++i)
        {
          if (*(_QWORD *)v403 != v108)
            objc_enumerationMutation(v334);
          v110 = *(void **)(*((_QWORD *)&v402 + 1) + 8 * i);
          v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v110, newTimescalea);
          objc_msgSend(v111, "setAlwaysCopiesSampleData:", 0);
          if ((objc_msgSend(v5, "canAddOutput:", v111) & 1) == 0)
          {
            +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add video track output to asset reader"), v110);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_127;
          }
          objc_msgSend(v5, "addOutput:", v111);

          v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B020]), "initWithMediaType:outputSettings:", v106, v344);
          if (v110)
          {
            objc_msgSend(v110, "preferredTransform");
          }
          else
          {
            v401 = 0u;
            v400 = 0u;
            v399 = 0u;
          }
          v398[0] = v399;
          v398[1] = v400;
          v398[2] = v401;
          objc_msgSend(v112, "setTransform:", v398);
          objc_msgSend(v110, "naturalSize");
          objc_msgSend(v112, "setNaturalSize:");
          objc_msgSend(v112, "setMediaTimeScale:", objc_msgSend(v110, "naturalTimeScale"));
          objc_msgSend(v320, "trackMetadata");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v110, "trackID"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "objectForKeyedSubscript:", v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "setMetadata:", v115);

          if ((objc_msgSend(v321, "canAddInput:", v112) & 1) == 0)
          {
            +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add video track input to asset writer"), v112);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_127:
LABEL_128:
            v303 = 0;
            goto LABEL_129;
          }
          objc_msgSend(v321, "addInput:", v112);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v110, "trackID"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v357, "setObject:forKeyedSubscript:", v112, v116);

        }
        v107 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v402, v453, 16);
      }
      while (v107);
    }

    v303 = 0;
  }
  else
  {
    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      objc_msgSend(v52, "frameDuration");
    }
    else
    {
      v430 = 0uLL;
      v431 = 0;
    }
    v428 = v430;
    v429 = v431;
    objc_msgSend(v318, "setSourceVideoMinFrameDuration:", &v428);

    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65)
    {
      objc_msgSend(v65, "frameDuration");
    }
    else
    {
      v426 = 0uLL;
      v427 = 0;
    }
    v424 = v426;
    v425 = v427;
    objc_msgSend(v318, "setSourceVideoAverageFrameDuration:", &v424);

    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = objc_msgSend(v67, "sourceTrackIDForFrameTiming");

    if (v306)
    {
      -[NURenderJob outputVideo](self, "outputVideo");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "trackWithTrackID:", v306);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        objc_msgSend(v69, "minFrameDuration");
        v420 = v422;
        v421 = v423;
        objc_msgSend(v318, "setSourceVideoMinFrameDuration:", &v420);
        objc_msgSend(v69, "nominalFrameRate");
        CMTimeMakeWithSeconds(&v419, 1.0 / v70, objc_msgSend(v69, "naturalTimeScale"));
        v418 = v419;
        objc_msgSend(v318, "setSourceVideoAverageFrameDuration:", &v418);
      }

    }
    v71 = (void *)objc_opt_new();
    v417 = 0u;
    v416 = 0u;
    v415 = 0u;
    v414 = 0u;
    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "instructions");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v332 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v414, v455, 16);
    if (v332)
    {
      v328 = *(_QWORD *)v415;
      do
      {
        v73 = 0;
        do
        {
          if (*(_QWORD *)v415 != v328)
          {
            v74 = v73;
            objc_enumerationMutation(obj);
            v73 = v74;
          }
          v342 = v73;
          v75 = *(void **)(*((_QWORD *)&v414 + 1) + 8 * v73);
          v410 = 0u;
          v411 = 0u;
          v412 = 0u;
          v413 = 0u;
          objc_msgSend(v75, "requiredSourceTrackIDs");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v410, v454, 16);
          if (v77)
          {
            v78 = *(_QWORD *)v411;
            do
            {
              for (j = 0; j != v77; ++j)
              {
                if (*(_QWORD *)v411 != v78)
                  objc_enumerationMutation(v76);
                v80 = (void *)MEMORY[0x1E0D75130];
                v81 = objc_msgSend(*(id *)(*((_QWORD *)&v410 + 1) + 8 * j), "intValue");
                objc_msgSend(v5, "asset");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "trackWithTrackID:forAsset:", v81, v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v71, "containsObject:", v83) & 1) == 0)
                  objc_msgSend(v71, "addObject:", v83);

              }
              v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v410, v454, 16);
            }
            while (v77);
          }

          v73 = v342 + 1;
        }
        while (v342 + 1 != v332);
        v332 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v414, v455, 16);
      }
      while (v332);
    }

    v333 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B008]), "initWithVideoTracks:videoSettings:", v71, 0);
    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "setVideoComposition:", v84);

    objc_msgSend(v333, "setAlwaysCopiesSampleData:", 0);
    if ((objc_msgSend(v5, "canAddOutput:", v333) & 1) == 0)
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add video composition output to asset reader"), v333);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_128;
    }
    objc_msgSend(v5, "addOutput:", v333);
    objc_msgSend(v318, "videoSettings");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v343 = (void *)objc_msgSend(v85, "mutableCopy");

    objc_msgSend(v343, "addEntriesFromDictionary:", v314);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v310);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v343, "setObject:forKeyedSubscript:", v86, *MEMORY[0x1E0C8AF60]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v309);
    v87 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v343, "setObject:forKeyedSubscript:", v87, *MEMORY[0x1E0C8AEF0]);

    objc_msgSend(v343, "removeObjectForKey:", *MEMORY[0x1E0C8AF30]);
    objc_msgSend(v322, "colorSpace");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v87) = v88 == 0;

    if ((v87 & 1) != 0)
    {
      objc_msgSend(v343, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0C8AEA8]);
    }
    else
    {
      objc_msgSend(v322, "colorSpace");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "cvPixelBufferAttachments");
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = (void *)objc_opt_new();
      objc_msgSend(v90, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v92, *MEMORY[0x1E0C8AE90]);

      objc_msgSend(v90, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v93, *MEMORY[0x1E0C8AF40]);

      objc_msgSend(v90, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v94, *MEMORY[0x1E0C8AF68]);

      objc_msgSend(v343, "setObject:forKeyedSubscript:", v91, *MEMORY[0x1E0C8AEA8]);
    }
    v118 = +[NUGlobalSettings enforceMinimumBitRateForExportedVideos](NUGlobalSettings, "enforceMinimumBitRateForExportedVideos");
    v119 = (uint64_t *)MEMORY[0x1E0C8AEB8];
    if (v118
      || +[NUGlobalSettings enforceMinimumBitRateForCinematicVideos](NUGlobalSettings, "enforceMinimumBitRateForCinematicVideos")&& (-[NURenderJob composition](self, "composition"), v120 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("portraitVideo")), v121 = (void *)objc_claimAutoreleasedReturnValue(), v122 = v121 == 0, v121, v120, !v122))
    {
      v123 = *v119;
      objc_msgSend(v343, "objectForKeyedSubscript:", *v119);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = *MEMORY[0x1E0C8AE20];
      objc_msgSend(v124, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AE20]);
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      if (v126)
      {
        objc_msgSend(v126, "floatValue");
        if (v127 >= v17)
          v128 = v127;
        else
          v128 = v17;
        objc_msgSend(v343, "objectForKeyedSubscript:", v123);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = (void *)objc_msgSend(v129, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v128);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "setObject:forKeyedSubscript:", v131, v125);

        objc_msgSend(v343, "setObject:forKeyedSubscript:", v130, v123);
      }

    }
    v132 = +[NUVideoUtilities videoTrackContainsDolbyVisionMetadata:](NUVideoUtilities, "videoTrackContainsDolbyVisionMetadata:", v315);
    v133 = (id *)MEMORY[0x1E0CED698];
    if (!v132)
      v133 = (id *)MEMORY[0x1E0CED6A0];
    obja = *v133;
    v134 = *v119;
    objc_msgSend(v343, "objectForKeyedSubscript:", *v119);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v329 = (void *)objc_msgSend(v135, "mutableCopy");

    objc_msgSend(v329, "setObject:forKeyedSubscript:", obja, *MEMORY[0x1E0CED008]);
    objc_msgSend(v343, "setObject:forKeyedSubscript:", v329, v134);
    v409 = 0;
    objc_msgSend(v312, "transformWithSourceSpace:destinationSpace:error:", CFSTR("/Image"), CFSTR("/masterSpace"), &v409);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v409;
    if (!v303)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_135);
      v137 = (id)_NULogger;
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(time.value) = 138412290;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v136;
        _os_log_debug_impl(&dword_1A6553000, v137, OS_LOG_TYPE_DEBUG, "can't get mapping from input to output space, %@", (uint8_t *)&time, 0xCu);
      }

    }
    -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (v138)
    {
      -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "renderScale");
      v142 = v141;

    }
    else
    {
      v140 = -[NURenderJob renderScale](self, "renderScale");
      v142 = v143;
    }

    v144 = objc_msgSend(v312, "renderScale");
    v146 = NUScaleDivide(v144, v145, v140, v142);
    if (v320)
    {
      v148 = v146;
      v149 = v147;
      objc_msgSend(v320, "cleanAperture");
      +[NUVideoUtilities cleanApertureVideoSettingsFor:scale:videoSize:](NUVideoUtilities, "cleanApertureVideoSettingsFor:scale:videoSize:", v408, v148, v149, v310, v309);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v343, "setObject:forKeyedSubscript:", v150, *MEMORY[0x1E0C8AE40]);

    }
    v151 = objc_alloc(MEMORY[0x1E0C8B020]);
    v152 = (void *)objc_msgSend(v151, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v343);
    objc_msgSend(v152, "setMediaTimeScale:", newTimescale);
    -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v153, "applyOrientationAsMetadata");

    if (v154)
      v155 = objc_msgSend(v312, "orientation");
    else
      v155 = 1;
    v156 = objc_msgSend(v312, "size");
    +[NUVideoUtilities preferredTransformFromOrientation:size:](NUVideoUtilities, "preferredTransformFromOrientation:size:", v155, v156, v157);
    *(_OWORD *)v407 = *(_OWORD *)&v407[7];
    *(_OWORD *)&v407[2] = *(_OWORD *)&v407[9];
    *(_OWORD *)&v407[4] = *(_OWORD *)&v407[11];
    objc_msgSend(v152, "setTransform:", v407);
    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "renderSize");
    objc_msgSend(v152, "setNaturalSize:");

    if (v306)
    {
      objc_msgSend(v320, "trackMetadata");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v306);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "objectForKeyedSubscript:", v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "setMetadata:", v161);

    }
    if ((objc_msgSend(v321, "canAddInput:", v152) & 1) != 0)
    {
      objc_msgSend(v321, "addInput:", v152);
      v162 = 0;
    }
    else
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add video track input to asset writer"), v152);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v162 = 1;
    }

    if (v162)
      goto LABEL_129;
  }
  -[NURenderJob outputAudioMix](self, "outputAudioMix");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v163 || (v164 = objc_msgSend(v339, "count") == 0, v163, v164))
  {
    v392 = 0u;
    v393 = 0u;
    v390 = 0u;
    v391 = 0u;
    newTimescaleb = v339;
    v184 = objc_msgSend(newTimescaleb, "countByEnumeratingWithState:objects:count:", &v390, v450, 16);
    if (!v184)
      goto LABEL_205;
    v185 = *(_QWORD *)v391;
    v186 = *MEMORY[0x1E0C8A7A0];
    while (1)
    {
      for (k = 0; k != v184; ++k)
      {
        if (*(_QWORD *)v391 != v185)
          objc_enumerationMutation(newTimescaleb);
        v188 = *(void **)(*((_QWORD *)&v390 + 1) + 8 * k);
        v189 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v188, 0);
        objc_msgSend(v189, "setAlwaysCopiesSampleData:", 0);
        if ((objc_msgSend(v5, "canAddOutput:", v189) & 1) == 0)
        {
          +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add audio track output to asset reader"), v5);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_287:

          goto LABEL_129;
        }
        objc_msgSend(v5, "addOutput:", v189);
        v190 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B020]), "initWithMediaType:outputSettings:sourceFormatHint:", v186, 0, SourceFormatHintForTrack(v188));
        objc_msgSend(v190, "setMarksOutputTrackAsEnabled:", objc_msgSend(v188, "isEnabled"));
        if ((objc_msgSend(v321, "canAddInput:", v190) & 1) == 0)
        {
          +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add audio track output to asset writer"), v5);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_287;
        }
        objc_msgSend(v321, "addInput:", v190);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v188, "trackID"));
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v357, "setObject:forKeyedSubscript:", v190, v191);

      }
      v184 = objc_msgSend(newTimescaleb, "countByEnumeratingWithState:objects:count:", &v390, v450, 16);
      if (!v184)
      {
LABEL_205:
        v192 = newTimescaleb;
        goto LABEL_206;
      }
    }
  }
  -[NURenderJob outputVideo](self, "outputVideo");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUVideoUtilities cinematicAudioTrackInAsset:](NUVideoUtilities, "cinematicAudioTrackInAsset:", v165);
  newTimescaleb = (id)objc_claimAutoreleasedReturnValue();

  if (newTimescaleb)
  {
    if ((unint64_t)objc_msgSend(v339, "count") >= 3)
    {
      NULogger();
      v166 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
      {
        v270 = objc_msgSend(v339, "count");
        LODWORD(time.value) = 134217984;
        *(CMTimeValue *)((char *)&time.value + 4) = v270;
        _os_log_error_impl(&dword_1A6553000, v166, OS_LOG_TYPE_ERROR, "Expected 2 audio tracks, got %lu", (uint8_t *)&time, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D75130], "associatedTracksOfTypeForTrack:trackAssociationType:", newTimescaleb, *MEMORY[0x1E0C8AD28]);
    objb = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objb, "firstObject");
    v345 = (id)objc_claimAutoreleasedReturnValue();
    if (!v345)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Expected audio fallback track for track"), newTimescaleb);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_317;
    }
    v396 = 0u;
    v397 = 0u;
    v394 = 0u;
    v395 = 0u;
    v307 = v339;
    v335 = objc_msgSend(v307, "countByEnumeratingWithState:objects:count:", &v394, v452, 16);
    if (!v335)
      goto LABEL_195;
    v330 = *(_QWORD *)v395;
    v301 = (id)*MEMORY[0x1E0C8A7A0];
LABEL_176:
    v167 = 0;
    while (1)
    {
      if (*(_QWORD *)v395 != v330)
        objc_enumerationMutation(v307);
      v168 = *(id *)(*((_QWORD *)&v394 + 1) + 8 * v167);
      if (v168 == newTimescaleb || v168 == v345)
      {
        +[NUVideoUtilities assetReaderAudioSettingsForTrackType:](NUVideoUtilities, "assetReaderAudioSettingsForTrackType:", v168 == newTimescaleb);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = objc_alloc(MEMORY[0x1E0C8AFE8]);
        v451 = newTimescaleb;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v451, 1);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = (void *)objc_msgSend(v171, "initWithAudioTracks:audioSettings:", v172, v170);

        -[NURenderJob outputAudioMix](self, "outputAudioMix");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "setAudioMix:", v174);

        objc_msgSend(v173, "setAlwaysCopiesSampleData:", 0);
        if ((objc_msgSend(v5, "canAddOutput:", v173) & 1) == 0)
        {
          +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add audio mix output to asset reader"), v173);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_314:
          *a3 = v262;
          goto LABEL_316;
        }
        objc_msgSend(v5, "addOutput:", v173);
        objc_msgSend(v168, "formatDescriptions");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = objc_msgSend(v175, "count") == 0;

        if (v176)
        {
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Missing format description"), v168);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_314;
        }
        objc_msgSend(v168, "formatDescriptions");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = (const opaqueCMFormatDescription *)objc_msgSend(v177, "firstObject");

        StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v178);
        if (!StreamBasicDescription)
        {
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("ASBD: Invalid format description"), v178);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_314;
        }
        +[NUVideoUtilities assetWriterAudioSettingsForTrackWithSampleRate:isAmbisonic:](NUVideoUtilities, "assetWriterAudioSettingsForTrackWithSampleRate:isAmbisonic:", v168 == newTimescaleb, StreamBasicDescription->mSampleRate);
        v180 = objc_claimAutoreleasedReturnValue();

        v181 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B020]), "initWithMediaType:outputSettings:", v301, v180);
        objc_msgSend(v181, "setMarksOutputTrackAsEnabled:", v168 != newTimescaleb);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v168, "trackID"));
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v357, "setObject:forKeyedSubscript:", v181, v182);

        if ((objc_msgSend(v321, "canAddInput:", v181) & 1) == 0)
        {
          +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add audio track output to asset writer"), v5);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v170 = v180;
LABEL_316:

LABEL_317:
          goto LABEL_318;
        }
        objc_msgSend(v321, "addInput:", v181);

      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_135);
        v180 = (id)_NULogger;
        if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
        {
          v183 = objc_msgSend(v168, "trackID");
          LODWORD(time.value) = 67109120;
          HIDWORD(time.value) = v183;
          _os_log_error_impl(&dword_1A6553000, v180, OS_LOG_TYPE_ERROR, "Unexpected audio track %d, skipping", (uint8_t *)&time, 8u);
        }
      }

      if (v335 == ++v167)
      {
        v335 = objc_msgSend(v307, "countByEnumeratingWithState:objects:count:", &v394, v452, 16);
        if (!v335)
        {
LABEL_195:

          goto LABEL_205;
        }
        goto LABEL_176;
      }
    }
  }
  objc_msgSend(v339, "firstObject");
  objb = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objb, "formatDescriptions");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = objc_msgSend(v245, "firstObject");

  v247 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFE8]), "initWithAudioTracks:audioSettings:", v339, 0);
  -[NURenderJob outputAudioMix](self, "outputAudioMix");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "setAudioMix:", v248);

  objc_msgSend(v247, "setAlwaysCopiesSampleData:", 0);
  if ((objc_msgSend(v5, "canAddOutput:", v247) & 1) == 0)
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add audio mix output to asset reader"), v247);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_317;
  }
  objc_msgSend(v5, "addOutput:", v247);
  objc_msgSend(v318, "setSourceAudioFormat:", v246);
  objc_msgSend(v318, "audioSettings");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v249)
  {
    +[NUVideoUtilities assetWriterAudioSettingsForAudioTrackFormatDescription:](NUVideoUtilities, "assetWriterAudioSettingsForAudioTrackFormatDescription:", v246);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v249)
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot obtain audio settings for track"), objb);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_317;
    }
  }
  v250 = *MEMORY[0x1E0C898E0];
  objc_msgSend(v314, "objectForKeyedSubscript:", *MEMORY[0x1E0C898E0]);
  v251 = (void *)objc_claimAutoreleasedReturnValue();

  v252 = *MEMORY[0x1E0C89970];
  objc_msgSend(v314, "objectForKeyedSubscript:", *MEMORY[0x1E0C89970]);
  v253 = (void *)objc_claimAutoreleasedReturnValue();

  if (v251 != 0 || v253 != 0)
  {
    v254 = (void *)objc_msgSend(v249, "mutableCopy");
    if (v251)
    {
      objc_msgSend(v314, "objectForKeyedSubscript:", v250);
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "setObject:forKeyedSubscript:", v255, v250);

    }
    if (v253)
    {
      objc_msgSend(v314, "objectForKeyedSubscript:", v252);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "setObject:forKeyedSubscript:", v256, v252);

    }
    v257 = v254;

  }
  else
  {
    v257 = v249;
  }
  v258 = objc_alloc(MEMORY[0x1E0C8B020]);
  v259 = (void *)objc_msgSend(v258, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A7A0], v257);
  v260 = objc_msgSend(v321, "canAddInput:", v259);
  if ((v260 & 1) != 0)
  {
    objc_msgSend(v321, "addInput:", v259);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(objb, "trackID"));
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v357, "setObject:forKeyedSubscript:", v259, v261);

  }
  else
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add audio track output to asset writer"), v5);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  if ((v260 & 1) == 0)
  {
LABEL_318:

    goto LABEL_129;
  }
  v192 = 0;
LABEL_206:

  if (!objc_msgSend(v322, "includeCinematicVideoTracks"))
    goto LABEL_220;
  v388 = 0u;
  v389 = 0u;
  v386 = 0u;
  v387 = 0u;
  newTimescalec = v340;
  v193 = objc_msgSend(newTimescalec, "countByEnumeratingWithState:objects:count:", &v386, v449, 16);
  if (!v193)
    goto LABEL_219;
  v194 = *(_QWORD *)v387;
  do
  {
    for (m = 0; m != v193; ++m)
    {
      if (*(_QWORD *)v387 != v194)
        objc_enumerationMutation(newTimescalec);
      v196 = *(void **)(*((_QWORD *)&v386 + 1) + 8 * m);
      v197 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v196, 0);
      objc_msgSend(v197, "setAlwaysCopiesSampleData:", 0);
      if ((objc_msgSend(v5, "canAddOutput:", v197) & 1) == 0)
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add video track output to asset reader"), v196);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_304;
      }
      objc_msgSend(v5, "addOutput:", v197);

      v198 = objc_alloc(MEMORY[0x1E0C8B020]);
      objc_msgSend(v196, "mediaType");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v200 = (void *)objc_msgSend(v198, "initWithMediaType:outputSettings:", v199, 0);

      if (v196)
      {
        objc_msgSend(v196, "preferredTransform");
      }
      else
      {
        v384 = 0u;
        v385 = 0u;
        v383 = 0u;
      }
      v382[0] = v383;
      v382[1] = v384;
      v382[2] = v385;
      objc_msgSend(v200, "setTransform:", v382);
      objc_msgSend(v196, "naturalSize");
      objc_msgSend(v200, "setNaturalSize:");
      objc_msgSend(v200, "setMediaTimeScale:", objc_msgSend(v196, "naturalTimeScale"));
      if ((objc_msgSend(v321, "canAddInput:", v200) & 1) == 0)
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add video track input to asset writer"), v200);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_304:
LABEL_129:
        v10 = 0;
        goto LABEL_130;
      }
      objc_msgSend(v321, "addInput:", v200);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v196, "trackID"));
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v357, "setObject:forKeyedSubscript:", v200, v201);

    }
    v193 = objc_msgSend(newTimescalec, "countByEnumeratingWithState:objects:count:", &v386, v449, 16);
  }
  while (v193);
LABEL_219:

LABEL_220:
  v380 = 0u;
  v381 = 0u;
  v378 = 0u;
  v379 = 0u;
  newTimescaled = v337;
  v202 = objc_msgSend(newTimescaled, "countByEnumeratingWithState:objects:count:", &v378, v448, 16);
  if (!v202)
    goto LABEL_229;
  v203 = *(_QWORD *)v379;
  while (2)
  {
    v204 = 0;
    while (2)
    {
      if (*(_QWORD *)v379 != v203)
        objc_enumerationMutation(newTimescaled);
      v205 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * v204);
      v206 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v205, 0);
      objc_msgSend(v206, "setAlwaysCopiesSampleData:", 0);
      if ((objc_msgSend(v5, "canAddOutput:", v206) & 1) == 0)
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add track output to asset reader"), v5);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_301:

        goto LABEL_129;
      }
      objc_msgSend(v5, "addOutput:", v206);
      v207 = SourceFormatHintForTrack(v205);
      v208 = objc_alloc(MEMORY[0x1E0C8B020]);
      objc_msgSend(v205, "mediaType");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = (void *)objc_msgSend(v208, "initWithMediaType:outputSettings:sourceFormatHint:", v209, 0, v207);

      if ((objc_msgSend(v321, "canAddInput:", v210) & 1) == 0)
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add track input to asset writer"), v5);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_301;
      }
      objc_msgSend(v321, "addInput:", v210);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v205, "trackID"));
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v357, "setObject:forKeyedSubscript:", v210, v211);

      if (v202 != ++v204)
        continue;
      break;
    }
    v202 = objc_msgSend(newTimescaled, "countByEnumeratingWithState:objects:count:", &v378, v448, 16);
    if (v202)
      continue;
    break;
  }
LABEL_229:

  v376 = 0u;
  v377 = 0u;
  v374 = 0u;
  v375 = 0u;
  -[NURenderJob outputVideo](self, "outputVideo");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "tracks");
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  v299 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v374, v447, 16);
  if (v299)
  {
    v213 = *(_QWORD *)v375;
    v297 = *(_QWORD *)v375;
    do
    {
      v214 = 0;
      do
      {
        if (*(_QWORD *)v375 != v213)
        {
          v215 = v214;
          objc_enumerationMutation(v300);
          v214 = v215;
        }
        v298 = v214;
        v216 = *(void **)(*((_QWORD *)&v374 + 1) + 8 * v214);
        v370 = 0u;
        v371 = 0u;
        v372 = 0u;
        v373 = 0u;
        objc_msgSend(v216, "availableTrackAssociationTypes");
        v302 = (id)objc_claimAutoreleasedReturnValue();
        objc = (id)objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v370, v446, 16);
        if (objc)
        {
          v308 = *(id *)v371;
          do
          {
            for (n = 0; n != objc; n = (char *)n + 1)
            {
              if (*(id *)v371 != v308)
                objc_enumerationMutation(v302);
              v217 = *(_QWORD *)(*((_QWORD *)&v370 + 1) + 8 * (_QWORD)n);
              v366 = 0u;
              v367 = 0u;
              v368 = 0u;
              v369 = 0u;
              v346 = v217;
              objc_msgSend(MEMORY[0x1E0D75130], "associatedTracksOfTypeForTrack:trackAssociationType:", v216);
              newTimescalee = (void *)objc_claimAutoreleasedReturnValue();
              v218 = objc_msgSend(newTimescalee, "countByEnumeratingWithState:objects:count:", &v366, v445, 16);
              if (v218)
              {
                v219 = *(_QWORD *)v367;
                do
                {
                  for (ii = 0; ii != v218; ++ii)
                  {
                    if (*(_QWORD *)v367 != v219)
                      objc_enumerationMutation(newTimescalee);
                    v221 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * ii);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v216, "trackID"));
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v357, "objectForKeyedSubscript:", v222);
                    v223 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v221, "trackID"));
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v357, "objectForKeyedSubscript:", v224);
                    v225 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v223 && v225)
                    {
                      objc_msgSend(v223, "addTrackAssociationWithTrackOfInput:type:", v225, v346);
                    }
                    else
                    {
                      if (_NULogOnceToken != -1)
                        dispatch_once(&_NULogOnceToken, &__block_literal_global_135);
                      v226 = (id)_NULogger;
                      if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
                      {
                        v227 = objc_msgSend(v216, "trackID");
                        v228 = objc_msgSend(v221, "trackID");
                        LODWORD(time.value) = 67109634;
                        HIDWORD(time.value) = v227;
                        LOWORD(time.timescale) = 1024;
                        *(CMTimeScale *)((char *)&time.timescale + 2) = v228;
                        HIWORD(time.flags) = 2112;
                        time.epoch = v346;
                        _os_log_error_impl(&dword_1A6553000, v226, OS_LOG_TYPE_ERROR, "Missing inputs for track association, skipping (%d <- %d: %@)", (uint8_t *)&time, 0x18u);
                      }

                    }
                  }
                  v218 = objc_msgSend(newTimescalee, "countByEnumeratingWithState:objects:count:", &v366, v445, 16);
                }
                while (v218);
              }

            }
            objc = (id)objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v370, v446, 16);
          }
          while (objc);
        }

        v214 = v298 + 1;
        v213 = v297;
      }
      while (v298 + 1 != v299);
      v299 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v374, v447, 16);
      v213 = v297;
    }
    while (v299);
  }

  v364 = 0u;
  v365 = 0u;
  v362 = 0u;
  v363 = 0u;
  objc_msgSend(v320, "trackGroups");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)newTimescalef = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v362, v444, 16);
  if (*(_QWORD *)newTimescalef)
  {
    v347 = *(_QWORD *)v363;
    while (2)
    {
      v229 = 0;
      do
      {
        if (*(_QWORD *)v363 != v347)
          objc_enumerationMutation(v336);
        v230 = *(void **)(*((_QWORD *)&v362 + 1) + 8 * v229);
        v231 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v230, "trackIDs");
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = (void *)objc_msgSend(v231, "initWithCapacity:", objc_msgSend(v232, "count"));

        v360 = 0u;
        v361 = 0u;
        v358 = 0u;
        v359 = 0u;
        objc_msgSend(v230, "trackIDs");
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        v235 = 0;
        v236 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v358, v443, 16);
        if (v236)
        {
          v237 = *(_QWORD *)v359;
          do
          {
            for (jj = 0; jj != v236; ++jj)
            {
              if (*(_QWORD *)v359 != v237)
                objc_enumerationMutation(v234);
              objc_msgSend(v357, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v358 + 1) + 8 * jj));
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              if (v239)
              {
                objc_msgSend(v233, "addObject:", v239);
                if (!v235)
                {
                  if (objc_msgSend(v239, "marksOutputTrackAsEnabled"))
                    v235 = v239;
                  else
                    v235 = 0;
                }
              }

            }
            v236 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v358, v443, 16);
          }
          while (v236);
        }

        v240 = objc_msgSend(v233, "count");
        objc_msgSend(v230, "trackIDs");
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = v240 == objc_msgSend(v241, "count");

        if (v242)
        {
          v243 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B028]), "initWithInputs:defaultInput:", v233, v235);
          if ((objc_msgSend(v321, "canAddInputGroup:", v243) & 1) == 0)
          {
            +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add input group to asset writer"), v243);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_129;
          }
          objc_msgSend(v321, "addInputGroup:", v243);
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_135);
          v243 = (id)_NULogger;
          if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v230, "trackIDs");
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(time.value) = 138543362;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v244;
            _os_log_impl(&dword_1A6553000, v243, OS_LOG_TYPE_DEFAULT, "Missing track group inputs for track group %{public}@, ignored.", (uint8_t *)&time, 0xCu);

          }
        }

        ++v229;
      }
      while (v229 != *(_QWORD *)newTimescalef);
      *(_QWORD *)newTimescalef = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v362, v444, 16);
      if (*(_QWORD *)newTimescalef)
        continue;
      break;
    }
  }

  time = buf;
  v10 = -[NUVideoExportJob writeVideoFrom:toWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:error:](self, "writeVideoFrom:toWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:error:", v5, v321, &time, v338 & 1, v303, a3, (double)v305, (double)v304, (double)v310, (double)v309);
LABEL_130:

LABEL_131:
LABEL_132:

  v6 = v313;
LABEL_133:

  return v10;
}

- (BOOL)writeVideoFrom:(id)a3 toWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 error:(id *)a10
{
  double height;
  double width;
  double v13;
  double v14;
  _BOOL8 v15;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29;

  height = a9.height;
  width = a9.width;
  v13 = a8.height;
  v14 = a8.width;
  v15 = a6;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sourceVideoTrackWindowsForTrackIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count") != 0;

  -[NUVideoExportJob setShouldKeepLastFrameRenderNode:](self, "setShouldKeepLastFrameRenderNode:", v25);
  -[NUVideoExportJob videoExportRequest](self, "videoExportRequest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "progress");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *a5;
  LOBYTE(v15) = +[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:](NUVideoUtilities, "readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:", v22, v21, &v29, v15, v20, v27, v14, v13, width, height, a10);

  -[NUVideoExportJob setLastFrameRenderNode:](self, "setLastFrameRenderNode:", 0);
  return v15;
}

- (id)renderNodeWithPipelineState:(id)a3 error:(id *)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUVideoExportJob;
  -[NURenderJob renderNodeWithPipelineState:error:](&v7, sel_renderNodeWithPipelineState_error_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NUVideoExportJob shouldKeepLastFrameRenderNode](self, "shouldKeepLastFrameRenderNode"))
    -[NUVideoExportJob setLastFrameRenderNode:](self, "setLastFrameRenderNode:", v5);
  return v5;
}

- (BOOL)renderVideoFrames:(id)a3 videoMetadataSamples:(id)a4 videoSampleSlices:(id)a5 intoPixelBuffer:(__CVBuffer *)a6 time:(id *)a7 colorSpace:(id)a8 playbackDirection:(int64_t)a9 error:(id *)a10
{
  _BOOL4 v12;
  void *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NUVideoExportJob;
  v15 = *a7;
  v12 = -[NURenderJob renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:](&v16, sel_renderVideoFrames_videoMetadataSamples_videoSampleSlices_intoPixelBuffer_time_colorSpace_playbackDirection_error_, a3, a4, a5, a6, &v15, a8, a9, a10);
  if (v12)
  {
    -[NUVideoExportJob digest](self, "digest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[NUVideoExportJob updateDigestWithRenderedFrame:](self, "updateDigestWithRenderedFrame:", a6);
  }
  return v12;
}

- (void)updateDigestWithRenderedFrame:(__CVBuffer *)a3
{
  void *v5;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v9;
  size_t v10;
  char *BaseAddressOfPlane;
  char *i;
  void *v13;
  void *v14;
  size_t v15;

  -[NUVideoExportJob digest](self, "digest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    v15 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
    v9 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
    v10 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a3, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    for (i = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL); HeightOfPlane; --HeightOfPlane)
    {
      -[NUVideoExportJob digest](self, "digest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addBytes:length:", BaseAddressOfPlane, WidthOfPlane);

      BaseAddressOfPlane += BytesPerRowOfPlane;
    }
    for (; v9; --v9)
    {
      -[NUVideoExportJob digest](self, "digest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addBytes:length:", i, 2 * v15);

      i += v10;
    }
    CVPixelBufferUnlockBaseAddress(a3, 0);
  }
}

- (NUVideoProperties)videoProperties
{
  return self->_videoProperties;
}

- (void)setVideoProperties:(id)a3
{
  objc_storeStrong((id *)&self->_videoProperties, a3);
}

- (NUDigest)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
  objc_storeStrong((id *)&self->_digest, a3);
}

- (BOOL)shouldKeepLastFrameRenderNode
{
  return self->_shouldKeepLastFrameRenderNode;
}

- (void)setShouldKeepLastFrameRenderNode:(BOOL)a3
{
  self->_shouldKeepLastFrameRenderNode = a3;
}

- (NURenderNode)lastFrameRenderNode
{
  return self->_lastFrameRenderNode;
}

- (void)setLastFrameRenderNode:(id)a3
{
  objc_storeStrong((id *)&self->_lastFrameRenderNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFrameRenderNode, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_videoProperties, 0);
}

@end
