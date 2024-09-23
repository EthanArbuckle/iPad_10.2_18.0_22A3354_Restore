@implementation VCPFaceAnalyzer

- (VCPFaceAnalyzer)initWithContext:(id)a3
{
  id v4;
  VCPFaceAnalyzer *v5;
  VCPFaceMerger *v6;
  float v7;
  uint64_t v8;
  VCPFaceMerger *faceMerger;
  uint64_t v10;
  VCPObjectPool *sessionPool;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPFaceAnalyzer;
  v5 = -[VCPFaceAnalyzer init](&v13, sel_init);
  if (v5)
  {
    v5->_processingVersion = objc_msgSend(v4, "processingVersion");
    v6 = [VCPFaceMerger alloc];
    objc_msgSend(v4, "faceMergeFaceprintDistanceThreshold");
    v8 = -[VCPFaceMerger initWithThreshold:](v6, "initWithThreshold:", v7);
    faceMerger = v5->_faceMerger;
    v5->_faceMerger = (VCPFaceMerger *)v8;

    +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", &__block_literal_global_48);
    v10 = objc_claimAutoreleasedReturnValue();
    sessionPool = v5->_sessionPool;
    v5->_sessionPool = (VCPObjectPool *)v10;

  }
  return v5;
}

id __35__VCPFaceAnalyzer_initWithContext___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0CEE040]);
}

+ (int)_smallFaceWarningThreshold
{
  return 128;
}

+ (double)_forwardCompatibleFaceSigmaThreshold
{
  return -5.0;
}

+ (double)_forwardCompatibleTorsoSigmaThreshold
{
  return -5.0;
}

+ (BOOL)_faceprintFastMode
{
  return 1;
}

- (int)_createBlurRequests:(id *)a3 andExposureRequests:(id *)a4 forFaceObservations:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id obj;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "boundingBox");
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        v35.size.width = 1.0;
        v35.size.height = 1.0;
        v34 = CGRectIntersection(v33, v35);
        x = v34.origin.x;
        y = v34.origin.y;
        width = v34.size.width;
        height = v34.size.height;
        v26 = 0;
        v16 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v26, objc_opt_class(), self->_processingVersion);
        v17 = v26;
        v18 = v17;
        if (v16)
          goto LABEL_12;
        objc_msgSend(v17, "setBlurDeterminationMethod:", 1);
        objc_msgSend(v18, "setMaximumIntermediateSideLength:", 128);
        objc_msgSend(v18, "setRegionOfInterest:", x, y, width, height);
        objc_msgSend(v7, "addObject:", v18);
        v25 = 0;
        v16 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v25, objc_opt_class(), self->_processingVersion);
        v19 = v25;
        v20 = v19;
        if (v16)
        {

LABEL_12:
          goto LABEL_13;
        }
        objc_msgSend(v19, "setRegionOfInterest:", x, y, width, height);
        objc_msgSend(v8, "addObject:", v20);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v9)
        continue;
      break;
    }
  }

  *a3 = objc_retainAutorelease(v7);
  v16 = 0;
  *a4 = objc_retainAutorelease(v8);
LABEL_13:

  return v16;
}

- (void)_checkAnalysisRequests:(id)a3 forTooSmallFaceObservations:(id)a4 withAnalysisResults:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    v11 = *MEMORY[0x1E0CEE3C8];
    v12 = *MEMORY[0x1E0CEE3D0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "warnings", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "BOOLValue"))
          objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ImageTooSmall"));
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v8, "addObjectsFromArray:", v16);

        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (int)_performAnalysis:(id *)a3 withRequestHandler:(id)a4 quickMode:(BOOL)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7
{
  int v11;
  id v12;
  double v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  double v30;
  id v31;
  void *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  NSObject *v35;
  NSObject *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  BOOL v42;
  double v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  id v58;
  unint64_t v59;
  int v60;
  double v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  void *v69;
  float v70;
  float v71;
  float v72;
  void *v73;
  float v74;
  _BOOL4 v75;
  double v76;
  void *v77;
  float v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  BOOL v83;
  void *v84;
  void *v85;
  BOOL v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t j;
  void *v99;
  void *v100;
  void *v101;
  float v102;
  float v103;
  float v104;
  void *v105;
  float v106;
  _BOOL4 v107;
  double v108;
  void *v109;
  float v110;
  void *v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  int processingVersion;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  NSObject *v128;
  uint64_t v130;
  uint64_t v131;
  double v132;
  os_signpost_id_t spid;
  id v134;
  void *v135;
  id v136;
  os_signpost_id_t v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  unint64_t v147;
  unint64_t v148;
  id *v149;
  id v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  double v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  double v171;
  id v172;
  id v173;
  double v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  uint8_t v187[128];
  uint8_t buf[4];
  double v189;
  __int16 v190;
  uint64_t v191;
  __int16 v192;
  uint64_t v193;
  _BYTE v194[128];
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  v156 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = 0;
  v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v186, objc_opt_class(), self->_processingVersion);
  v12 = v186;
  v158 = v12;
  if (!v11)
  {
    LODWORD(v13) = 1064682127;
    objc_msgSend(v12, "setPrecisionRecallThreshold:", v13);
    objc_msgSend(v159, "addObject:", v158);
    if (a5)
    {
      v14 = 0;
      v15 = 0;
      v160 = 0;
    }
    else
    {
      v185 = 0;
      v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v185, objc_opt_class(), self->_processingVersion);
      v29 = v185;
      v160 = v29;
      if (v11)
      {
        v154 = 0;
        v155 = 0;
        goto LABEL_161;
      }
      objc_msgSend(v159, "addObject:", v29);
      if (_os_feature_enabled_impl())
      {
        v184 = 0;
        v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v184, objc_opt_class(), self->_processingVersion);
        v31 = v184;
        v15 = v31;
        if (v11)
        {
          v154 = 0;
          v155 = v31;
          goto LABEL_161;
        }
        objc_msgSend(v159, "addObject:", v31);
      }
      else
      {
        v15 = 0;
      }
      v155 = v15;
      v183 = 0;
      v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v183, objc_opt_class(), self->_processingVersion);
      v44 = v183;
      v14 = v44;
      if (v11)
      {
        v154 = v44;
        goto LABEL_161;
      }
      objc_msgSend(v159, "addObject:", v44);
    }
    v147 = a6;
    v148 = a7;
    v149 = a3;
    v154 = v14;
    v155 = v15;
    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);

    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPFaceAnalyzerImageRequestHandlerPerformDetectionRequests", ", buf, 2u);
    }

    v182 = 0;
    v20 = objc_msgSend(v156, "performRequests:error:", v159, &v182);
    v21 = COERCE_DOUBLE(v182);
    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v17, "VCPFaceAnalyzerImageRequestHandlerPerformDetectionRequests", ", buf, 2u);
    }

    if ((v20 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)&v21, "description");
        v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138412290;
        v189 = v30;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform detector requests - %@", buf, 0xCu);

      }
      v11 = -18;
      goto LABEL_160;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v151 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "results");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "count"))
    {
      objc_msgSend(v160, "results");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v25, "count"))
      {
        objc_msgSend(v155, "results");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v26, "count"))
        {
          objc_msgSend(v154, "results");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "count") == 0;

          if (v57)
          {
            v11 = 0;
            *v149 = objc_retainAutorelease(v151);
LABEL_159:

LABEL_160:
            goto LABEL_161;
          }
LABEL_18:
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "results");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count") == 0;

          if (v28)
          {
            v153 = 0;
          }
          else
          {
            v181 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v181, objc_opt_class(), self->_processingVersion);
            v153 = v181;
            if (v11)
            {
              v145 = 0;
              v146 = 0;
              v142 = 0;
              v143 = 0;
              v144 = 0;
              v150 = 0;
LABEL_158:

              goto LABEL_159;
            }
            if (objc_msgSend((id)objc_opt_class(), "_faceprintFastMode"))
              objc_msgSend(v153, "setDetectionLevel:", 2);
            objc_msgSend(v158, "results");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "setInputFaceObservations:", v32);

            objc_msgSend(v152, "addObject:", v153);
          }
          if (a5)
          {
            v145 = 0;
            v146 = 0;
            v142 = 0;
            v143 = 0;
            v144 = 0;
            v150 = 0;
            goto LABEL_37;
          }
          objc_msgSend(v158, "results");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count") == 0;

          if (v42)
          {
            v45 = 0;
            v46 = 0;
            v47 = 0;
            v48 = 0;
          }
          else
          {
            v180 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v180, objc_opt_class(), self->_processingVersion);
            v150 = v180;
            if (v11)
            {
              v146 = 0;
LABEL_70:
              v145 = 0;
LABEL_71:
              v143 = 0;
LABEL_72:
              v142 = 0;
              v144 = 0;
              goto LABEL_158;
            }
            objc_msgSend(v158, "results");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "setInputFaceObservations:", v55);

            objc_msgSend(v152, "addObject:", v150);
            v179 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v179, objc_opt_class(), self->_processingVersion);
            v146 = v179;
            if (v11)
              goto LABEL_70;
            objc_msgSend(v158, "results");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "setInputFaceObservations:", v90);

            objc_msgSend(v152, "addObject:", v146);
            v178 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v178, objc_opt_class(), self->_processingVersion);
            v145 = v178;
            if (v11)
              goto LABEL_71;
            objc_msgSend(v158, "results");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setInputFaceObservations:", v91);

            objc_msgSend(v152, "addObject:", v145);
            v177 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v177, objc_opt_class(), self->_processingVersion);
            v143 = v177;
            if (v11)
              goto LABEL_72;
            objc_msgSend(v158, "results");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setInputFaceObservations:", v92);

            v47 = v143;
            v46 = v145;
            v45 = v146;
            v48 = v150;
            objc_msgSend(v152, "addObject:", v143);
          }
          objc_msgSend(v160, "results");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = v48;
          v143 = v47;
          v145 = v46;
          v146 = v45;
          v50 = objc_msgSend(v49, "count") == 0;

          if (v50)
          {
            v58 = 0;
            v59 = 0x1E0C99000;
          }
          else
          {
            v176 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v176, objc_opt_class(), self->_processingVersion);
            v144 = v176;
            if (v11)
            {
              v142 = 0;
              goto LABEL_158;
            }
            objc_msgSend(v160, "results");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "setInputDetectedObjectObservations:", v80);

            v58 = v144;
            objc_msgSend(v152, "addObject:", v144);
            v59 = 0x1E0C99000uLL;
          }
          v144 = v58;
          objc_msgSend(*(id *)(v59 + 3560), "array");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "results");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "count") == 0;

          if (!v83)
          {
            objc_msgSend(v154, "results");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObjectsFromArray:", v84);

          }
          objc_msgSend(v155, "results");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "count") == 0;

          if (!v86)
          {
            objc_msgSend(v155, "results");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObjectsFromArray:", v87);

          }
          if (objc_msgSend(v81, "count"))
          {
            v175 = 0;
            v11 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v175, objc_opt_class(), self->_processingVersion);
            v88 = v175;
            if (v11)
            {
              v142 = v88;

              goto LABEL_158;
            }
            v89 = v88;
            objc_msgSend(v88, "setInputDetectedObjectObservations:", v81);
            objc_msgSend(v152, "addObject:", v89);
          }
          else
          {
            v89 = 0;
          }
          v142 = v89;

LABEL_37:
          VCPSignPostLog();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = os_signpost_id_generate(v33);

          VCPSignPostLog();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "VCPFaceAnalyzerImageRequestHandlerPerformAdditionalRequests", ", buf, 2u);
          }

          v174 = v21;
          v37 = objc_msgSend(v156, "performRequests:error:", v152, &v174);
          v140 = COERCE_DOUBLE(*(id *)&v174);

          VCPSignPostLog();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v39, OS_SIGNPOST_INTERVAL_END, v34, "VCPFaceAnalyzerImageRequestHandlerPerformAdditionalRequests", ", buf, 2u);
          }

          if ((v37 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)&v140, "description");
              v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 138412290;
              v189 = v43;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform additional requests - %@", buf, 0xCu);

            }
            v11 = -18;
            goto LABEL_157;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "addObjectsFromArray:", v159);
          objc_msgSend(v138, "addObjectsFromArray:", v152);
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPFaceAnalyzer _checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:](self, "_checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:", v138);
          if (a5)
          {
            v139 = 0;
            v40 = 0;
          }
          else
          {
            VCPSignPostLog();
            v51 = objc_claimAutoreleasedReturnValue();
            spid = os_signpost_id_generate(v51);

            VCPSignPostLog();
            v52 = objc_claimAutoreleasedReturnValue();
            v53 = v52;
            if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v53, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerBlurExposureAnalysis", ", buf, 2u);
            }

            v172 = 0;
            v173 = 0;
            objc_msgSend(v158, "results");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[VCPFaceAnalyzer _createBlurRequests:andExposureRequests:forFaceObservations:](self, "_createBlurRequests:andExposureRequests:forFaceObservations:", &v173, &v172, v54);
            v136 = v173;
            v134 = v172;

            if (v11)
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to create blur/exposure request", buf, 2u);
              }
              v40 = v134;
              goto LABEL_156;
            }
            v171 = v140;
            v60 = objc_msgSend(v156, "performRequests:error:", v136, &v171);
            v61 = COERCE_DOUBLE(*(id *)&v171);

            v141 = v61;
            if (v60)
            {
              -[VCPFaceAnalyzer _checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:](self, "_checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:", v136, v135, v151);
              v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v136, "count"));
              v169 = 0u;
              v170 = 0u;
              v167 = 0u;
              v168 = 0u;
              v63 = v136;
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v167, v194, 16);
              if (v64)
              {
                v65 = *(_QWORD *)v168;
                do
                {
                  for (i = 0; i != v64; ++i)
                  {
                    if (*(_QWORD *)v168 != v65)
                      objc_enumerationMutation(v63);
                    objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * i), "results");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "firstObject");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v68)
                    {
                      objc_msgSend(v68, "blurScore");
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v69, "floatValue");
                      if (v70 < 1.0)
                        v71 = v70;
                      else
                        v71 = 1.0;
                      if (v70 <= 0.0)
                        v72 = 0.0;
                      else
                        v72 = v71;

                      objc_msgSend(v68, "blurScore");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "floatValue");
                      v75 = v72 != v74;

                      if (v75
                        && (int)MediaAnalysisLogLevel() >= 4
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v68, "blurScore");
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v77, "floatValue");
                        *(_DWORD *)buf = 134218496;
                        v189 = v78;
                        v190 = 2048;
                        v191 = 0;
                        v192 = 2048;
                        v193 = 0x3FF0000000000000;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Blur score %f out of bound [%f, %f]", buf, 0x20u);

                      }
                      *(float *)&v76 = v72;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v76);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "addObject:", v79);

                    }
                    else
                    {
                      objc_msgSend(v62, "addObject:", &unk_1E6B71F00);
                    }

                  }
                  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v167, v194, 16);
                }
                while (v64);
              }

              v139 = v62;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v189 = v61;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform blur requests - %@", buf, 0xCu);
              }
              v139 = 0;
            }
            v166 = v141;
            v93 = objc_msgSend(v156, "performRequests:error:", v134, &v166);
            v132 = COERCE_DOUBLE(*(id *)&v166);

            if (v93)
            {
              -[VCPFaceAnalyzer _checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:](self, "_checkAnalysisRequests:forTooSmallFaceObservations:withAnalysisResults:", v134, v135, v151);
              v94 = objc_msgSend(v134, "count");
              v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v94);
              v164 = 0u;
              v165 = 0u;
              v162 = 0u;
              v163 = 0u;
              v95 = v134;
              v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v162, v187, 16);
              if (v96)
              {
                v97 = *(_QWORD *)v163;
                do
                {
                  for (j = 0; j != v96; ++j)
                  {
                    if (*(_QWORD *)v163 != v97)
                      objc_enumerationMutation(v95);
                    objc_msgSend(*(id *)(*((_QWORD *)&v162 + 1) + 8 * j), "results");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "firstObject");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v100)
                    {
                      objc_msgSend(v100, "exposureScore");
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v101, "floatValue");
                      if (v102 < 1.0)
                        v103 = v102;
                      else
                        v103 = 1.0;
                      if (v102 <= 0.0)
                        v104 = 0.0;
                      else
                        v104 = v103;

                      objc_msgSend(v100, "exposureScore");
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v105, "floatValue");
                      v107 = v104 != v106;

                      if (v107
                        && (int)MediaAnalysisLogLevel() >= 4
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v100, "exposureScore");
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v109, "floatValue");
                        *(_DWORD *)buf = 134218496;
                        v189 = v110;
                        v190 = 2048;
                        v191 = 0;
                        v192 = 2048;
                        v193 = 0x3FF0000000000000;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Exposure score %f out of bound [%f, %f]", buf, 0x20u);

                      }
                      *(float *)&v108 = v104;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v108);
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "addObject:", v111);

                    }
                    else
                    {
                      objc_msgSend(v40, "addObject:", &unk_1E6B71F10);
                    }

                  }
                  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v162, v187, 16);
                }
                while (v96);
              }

            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v189 = v132;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform exposure requests - %@", buf, 0xCu);
              }
              v40 = 0;
            }
            VCPSignPostLog();
            v112 = objc_claimAutoreleasedReturnValue();
            v113 = v112;
            if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v113, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerBlurExposureAnalysis", ", buf, 2u);
            }

            v140 = v132;
          }
          VCPSignPostLog();
          v114 = objc_claimAutoreleasedReturnValue();
          v137 = os_signpost_id_generate(v114);

          VCPSignPostLog();
          v115 = objc_claimAutoreleasedReturnValue();
          v116 = v115;
          if (v137 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v116, OS_SIGNPOST_INTERVAL_BEGIN, v137, "VCPFaceAnalyzerVCPFaceCreation", ", buf, 2u);
          }

          if (_os_feature_enabled_impl())
          {
            objc_msgSend(v158, "results");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "results");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "results");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "results");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            processingVersion = self->_processingVersion;
            v161 = 0;
            LODWORD(v131) = processingVersion;
            +[VCPPhotosFace facesFromFaceObservations:humanObservations:animalHeadObservations:animalBodyObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:animalResults:](VCPPhotosFace, "facesFromFaceObservations:humanObservations:animalHeadObservations:animalBodyObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:animalResults:", v117, v118, v119, v120, v147, v148, v138, v139, v40, v135, v131, &v161);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = v161;
            objc_msgSend(v151, "setObject:forKeyedSubscript:", v122, CFSTR("FaceResults"));

            objc_msgSend(v151, "setObject:forKeyedSubscript:", v123, CFSTR("VNAnimalObservationResults"));
          }
          else
          {
            objc_msgSend(v158, "results");
            v123 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "results");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "results");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v130) = self->_processingVersion;
            +[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:](VCPPhotosFace, "facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:", v123, v124, v125, v147, v148, v138, v139, v40, v135, v130);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "setObject:forKeyedSubscript:", v126, CFSTR("FaceResults"));

          }
          VCPSignPostLog();
          v127 = objc_claimAutoreleasedReturnValue();
          v128 = v127;
          if (v137 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v128, OS_SIGNPOST_INTERVAL_END, v137, "VCPFaceAnalyzerVCPFaceCreation", ", buf, 2u);
          }

          v11 = 0;
          *v149 = objc_retainAutorelease(v151);
          v136 = v139;
LABEL_156:

LABEL_157:
          v21 = v140;
          goto LABEL_158;
        }

      }
    }

    goto LABEL_18;
  }
  v154 = 0;
  v155 = 0;
  v160 = 0;
LABEL_161:

  return v11;
}

- (id)_existingFacesFromAsset:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _QWORD v62[6];

  v62[3] = *MEMORY[0x1E0C80C00];
  v41 = a3;
  objc_msgSend(v41, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v4;
  objc_msgSend(v4, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v4, "setIncludeTorsoOnlyDetectionData:", 1);
  objc_msgSend(v4, "setIncludedDetectionTypes:", &unk_1E6B76680);
  v5 = *MEMORY[0x1E0CD1B68];
  v62[0] = *MEMORY[0x1E0CD1B70];
  v62[1] = v5;
  v62[2] = *MEMORY[0x1E0CD1B58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v41, v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v38;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v52;
    v10 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        +[VCPPhotosFace faceFromPHFace:copyOption:](VCPPhotosFace, "faceFromPHFace:copyOption:", v12, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v41, "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v14;
          v59 = 2112;
          v60 = v15;
          _os_log_impl(&dword_1B6C4A000, v10, OS_LOG_TYPE_DEFAULT, "[VCPFaceAnalyzer][%@] Failed to create VCPPhotosFace from PHFace %@", buf, 0x16u);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v8);
  }

  objc_msgSend(v7, "valueForKey:", CFSTR("personLocalIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_211);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v41, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %d) OR (verifiedType = %d)"), 1, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v20);

    objc_msgSend(v19, "setMinimumVerifiedFaceCount:", 1);
    if (_os_feature_enabled_impl())
      objc_msgSend(v39, "setIncludedDetectionTypes:", &unk_1E6B76698);
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v40, v19);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "localIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v25);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v22);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v27 = v7;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        objc_msgSend(v31, "personLocalIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 && (!objc_msgSend(v17, "containsObject:", v32) || objc_msgSend(v31, "nameSource") == 6))
          objc_msgSend(v31, "setPersonLocalIdentifier:", 0);
        objc_msgSend(v31, "localIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33 == 0;

        if (!v34)
        {
          objc_msgSend(v31, "localIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, v35);

        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v28);
  }

  return v26;
}

uint64_t __43__VCPFaceAnalyzer__existingFacesFromAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

- (id)_processForwardCompatibleFaces:(id)a3 withExistingFaces:(id)a4 orientedWidth:(unint64_t)a5 orientedHeight:(unint64_t)a6 session:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  BOOL v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  char v39;
  float v40;
  float v41;
  NSObject *v42;
  NSObject *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  char v63;
  id v64;
  double v65;
  float v66;
  float v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v78;
  id v79;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  id v82;
  void *v83;
  double v84;
  void *v85;
  id v86;
  id obj;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  double v91;
  double v92;
  id v93;
  double v94;
  id v95;
  float v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  int v110;
  __int16 v111;
  const __CFString *v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v86 = a4;
  v79 = a7;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("FacesToPersist"));
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
    if (!v9)
      goto LABEL_83;
    v88 = *(_QWORD *)v100;
    while (1)
    {
      v10 = 0;
      v89 = v9;
      do
      {
        if (*(_QWORD *)v100 != v88)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1BCCA1B2C]();
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("[FaceAnalyzer][FC][%@]"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = v16 == 0;

        if ((_DWORD)v14)
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "gist");
            v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412546;
            v104 = v15;
            v105 = 2112;
            v106 = v44;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Skipping new face %@", buf, 0x16u);

          }
        }
        else
        {
          if (objc_msgSend(v11, "detectionType") == 1)
          {
            objc_msgSend(v11, "localIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "objectForKeyedSubscript:", v17);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v90, "imageprintWrapper");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v18, "type"))
            {
              objc_msgSend(v90, "imageprintWrapper");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "version") == 11)
              {
                objc_msgSend(v90, "imageprintWrapper");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "data");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21 == 0;

                if (!v22)
                {
                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v11, "gist");
                    v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)buf = 138412546;
                    v104 = v15;
                    v105 = 2112;
                    v106 = v23;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Processing forward-compabitle face %@", buf, 0x16u);

                  }
                  objc_msgSend(v90, "imageprintWrapper");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "data");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = 0;
                  +[VCPVNImageprintWrapper generateVNImageprintWithType:archiveData:andError:](VCPVNImageprintWrapper, "generateVNImageprintWithType:archiveData:andError:", 0, v25, &v98);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = v98;

                  objc_msgSend(v11, "imageprintWrapper");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "data");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v97 = v26;
                  +[VCPVNImageprintWrapper generateVNImageprintWithType:archiveData:andError:](VCPVNImageprintWrapper, "generateVNImageprintWithType:archiveData:andError:", 0, v28, &v97);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = COERCE_DOUBLE(v97);

                  objc_msgSend(v85, "faceprint");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "faceprint");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v31
                    || (objc_msgSend(v85, "faceprint"),
                        v32 = (void *)objc_claimAutoreleasedReturnValue(),
                        v33 = v32 == 0,
                        v32,
                        v31,
                        v33))
                  {
                    v84 = v29;
                    v82 = v30;
                    goto LABEL_42;
                  }
                  VCPSignPostLog();
                  v34 = objc_claimAutoreleasedReturnValue();
                  spid = os_signpost_id_generate(v34);

                  VCPSignPostLog();
                  v35 = objc_claimAutoreleasedReturnValue();
                  v36 = v35;
                  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v36, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADUpgradeFaceprint", ", buf, 2u);
                  }

                  v96 = 0.0;
                  objc_msgSend(v83, "faceprint");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "faceprint");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = v29;
                  v95 = v30;
                  v39 = VNUpgradeFaceprint();
                  v82 = v95;

                  v84 = COERCE_DOUBLE(*(id *)&v94);
                  if ((v39 & 1) != 0)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 7
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                    {
                      v40 = v96;
                      objc_msgSend(v82, "confidence");
                      *(_DWORD *)buf = 138412802;
                      v104 = v15;
                      v105 = 2048;
                      v106 = v40;
                      v107 = 2048;
                      v108 = v41;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ FC faceprint sigma %.3f and confidence: %.3f", buf, 0x20u);
                    }
                    VCPSignPostLog();
                    v42 = objc_claimAutoreleasedReturnValue();
                    v43 = v42;
                    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v43, OS_SIGNPOST_INTERVAL_END, spid, "MADUpgradeFaceprint", ", buf, 2u);
                    }

LABEL_42:
                    objc_msgSend(v85, "torsoprint");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "torsoprint");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v55
                      || (objc_msgSend(v85, "torsoprint"),
                          v56 = (void *)objc_claimAutoreleasedReturnValue(),
                          v57 = v56 == 0,
                          v56,
                          v55,
                          v57))
                    {
                      v65 = v84;
                      v64 = v54;
                      goto LABEL_56;
                    }
                    VCPSignPostLog();
                    v58 = objc_claimAutoreleasedReturnValue();
                    spida = os_signpost_id_generate(v58);

                    VCPSignPostLog();
                    v59 = objc_claimAutoreleasedReturnValue();
                    v60 = v59;
                    if (spida - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v60, OS_SIGNPOST_INTERVAL_BEGIN, spida, "MADUpgradeTorsoprint", ", buf, 2u);
                    }

                    v96 = 0.0;
                    objc_msgSend(v83, "torsoprint");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "torsoprint");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    v92 = v84;
                    v93 = v54;
                    v63 = VNUpgradeTorsoprint();
                    v64 = v93;

                    v65 = COERCE_DOUBLE(*(id *)&v92);
                    if ((v63 & 1) != 0)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 7
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      {
                        v66 = v96;
                        objc_msgSend(v64, "confidence");
                        *(_DWORD *)buf = 138412802;
                        v104 = v15;
                        v105 = 2048;
                        v106 = v66;
                        v107 = 2048;
                        v108 = v67;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ FC torsoprint sigma %.3f and confidence: %.3f", buf, 0x20u);
                      }
                      VCPSignPostLog();
                      v68 = objc_claimAutoreleasedReturnValue();
                      v69 = v68;
                      if (spida - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v69, OS_SIGNPOST_INTERVAL_END, spida, "MADUpgradeTorsoprint", ", buf, 2u);
                      }

LABEL_56:
                      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDEE8]), "initWithFaceprint:torsoprint:", v82, v64);
                      v91 = v65;
                      objc_msgSend(v70, "serializeStateAndReturnError:", &v91);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      v72 = COERCE_DOUBLE(*(id *)&v91);

                      if (v71)
                      {
                        if ((int)MediaAnalysisLogLevel() >= 7
                          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v11, "gist");
                          v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          *(_DWORD *)buf = 138412546;
                          v104 = v15;
                          v105 = 2112;
                          v106 = v73;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Wrapping forward-compatible faceprint for face %@", buf, 0x16u);

                        }
                        if (_os_feature_enabled_impl())
                          v74 = 14;
                        else
                          v74 = 11;
                        +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, v74, v71);
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v11, "setImageprintWrapper:", v75);

                        objc_msgSend(v11, "setVuObservationID:", 0);
                        if (_os_feature_enabled_impl())
                          v76 = 14;
                        else
                          v76 = 11;
                        objc_msgSend(v11, "setAlgorithmVersion:", v76);
                      }
                      else if ((int)MediaAnalysisLogLevel() >= 3
                             && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v104 = v15;
                        v105 = 2112;
                        v106 = v72;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Unable to serialize forward-compatible faceTorsoprint - %@; ignore",
                          buf,
                          0x16u);
                      }

                      v65 = v72;
                    }
                    else if ((int)MediaAnalysisLogLevel() >= 3
                           && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v104 = v15;
                      v105 = 2112;
                      v106 = v65;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to upgrade torsoprint - %@; skipping",
                        buf,
                        0x16u);
                    }

                    v84 = v65;
                  }
                  else if ((int)MediaAnalysisLogLevel() >= 3
                         && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v104 = v15;
                    v105 = 2112;
                    v106 = v84;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to upgrade faceprint - %@; skipping",
                      buf,
                      0x16u);
                  }

LABEL_73:
                  goto LABEL_74;
                }
LABEL_36:
                if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v11, "gist");
                  v46 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v90, "imageprintWrapper");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(double *)&v48 = COERCE_DOUBLE(objc_msgSend(v47, "type"));
                  objc_msgSend(v90, "imageprintWrapper");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v49, "version");
                  objc_msgSend(v90, "imageprintWrapper");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "data");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413314;
                  v53 = &stru_1E6B1C190;
                  if (!v52)
                    v53 = CFSTR("missing faceprint");
                  v104 = v15;
                  v105 = 2112;
                  v106 = v46;
                  v107 = 2048;
                  v108 = *(double *)&v48;
                  v109 = 1024;
                  v110 = v50;
                  v111 = 2112;
                  v112 = v53;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Skipping data incomplete face %@ %lu %d %@", buf, 0x30u);

                }
                goto LABEL_73;
              }

            }
            goto LABEL_36;
          }
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "gist");
            v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412546;
            v104 = v15;
            v105 = 2112;
            v106 = v45;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Skipping non-human face %@", buf, 0x16u);

          }
        }
LABEL_74:

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v89 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
      if (!v9)
      {
LABEL_83:

        goto LABEL_87;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC] Feature is disabled; skip",
      buf,
      2u);
  }
LABEL_87:

  return v78;
}

- (int)_refineAnalysis:(id *)a3 requestHandler:(id)a4 forAsset:(id)a5 resource:(id)a6 isBestResource:(BOOL)a7 orientedWidth:(unint64_t)a8 orientedHeight:(unint64_t)a9
{
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  VCPFaceMerger *faceMerger;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  NSObject *v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int v43;
  double v44;
  double v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  BOOL v52;
  BOOL v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  id v64;
  int v66;
  void *v67;
  os_signpost_id_t spid;
  void *v69;
  void *v70;
  unint64_t v71;
  _BOOL4 v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v78;
  id obj;
  id v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  const __CFString *v86;
  void *v87;
  uint8_t buf[4];
  unint64_t v89;
  __int16 v90;
  unint64_t v91;
  __int16 v92;
  int v93;
  __int16 v94;
  int v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  _BYTE v104[128];
  uint64_t v105;

  v72 = a7;
  v105 = *MEMORY[0x1E0C80C00];
  v75 = a4;
  v78 = a5;
  v73 = a6;
  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  VCPSignPostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  spid = v13;
  v71 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPFaceAnalyzerVerifyAndMergeFaces", ", buf, 2u);
  }

  v80 = (id)objc_msgSend(*a3, "mutableCopy");
  objc_msgSend(v80, "removeObjectForKey:", CFSTR("FaceResults"));
  objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPFaceAnalyzer _existingFacesFromAsset:](self, "_existingFacesFromAsset:", v78);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "count"))
  {
    -[VCPFaceAnalyzer _existingFacesFromAsset:](self, "_existingFacesFromAsset:", v78);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    faceMerger = self->_faceMerger;
    objc_msgSend(v74, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPFaceMerger mergeExistingFaces:andDetectedFaces:withRequestHandler:orientedWidth:orientedHeight:assetWidth:assetHeight:](faceMerger, "mergeExistingFaces:andDetectedFaces:withRequestHandler:orientedWidth:orientedHeight:assetWidth:assetHeight:", v17, v76, v75, a8, a9, objc_msgSend(v78, "pixelWidth"), objc_msgSend(v78, "pixelHeight"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_os_feature_enabled_impl() & 1) == 0 && objc_msgSend(v73, "type") == 102 && !v72)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v89 = a8;
        v90 = 2048;
        v91 = a9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC] Start processing resource %lu x %lu", buf, 0x16u);
      }
      objc_msgSend(v75, "session");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPFaceAnalyzer _processForwardCompatibleFaces:withExistingFaces:orientedWidth:orientedHeight:session:](self, "_processForwardCompatibleFaces:withExistingFaces:orientedWidth:orientedHeight:session:", v18, v69, a8, a9, v19);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v80, "objectForKeyedSubscript:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v20, "BOOLValue");

      objc_msgSend(v80, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ImageTooSmall"));
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v78, "localIdentifier");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        v23 = CFSTR("NO");
        if (v66)
          v23 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v89 = v21;
        v90 = 2112;
        v91 = (unint64_t)v23;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Vision image-too-small decision: %@", buf, 0x16u);

      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("FacesToPersist"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v83;
        if (a8 >= a9)
          v26 = a9;
        else
          v26 = a8;
        v27 = (double)v26;
        v28 = MEMORY[0x1E0C81028];
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v83 != v25)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            v31 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v30, "localIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "detectionType");
            v34 = CFSTR("Pet");
            if (v33 == 1)
              v34 = CFSTR("Human");
            objc_msgSend(v31, "stringWithFormat:", CFSTR("[FaceAnalyzer][FC][SmallFace][%@][%@]"), v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v30, "imageprintWrapper");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "version");
              *(_DWORD *)buf = 138412546;
              v89 = (unint64_t)v35;
              v90 = 1024;
              LODWORD(v91) = v37;
              _os_log_impl(&dword_1B6C4A000, v28, OS_LOG_TYPE_DEBUG, "%@ Face faceprint version %d", buf, 0x12u);

            }
            objc_msgSend(v30, "size");
            v39 = v38;
            objc_msgSend(v30, "bodyWidth");
            v41 = v40;
            objc_msgSend(v30, "bodyHeight");
            if (v41 >= v42)
              v41 = v42;
            v43 = objc_msgSend((id)objc_opt_class(), "_smallFaceWarningThreshold");
            v44 = v39 * v27;
            v45 = v41 * v27;
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v30, "size");
              v47 = v46;
              objc_msgSend(v30, "bodyWidth");
              v49 = v48;
              objc_msgSend(v30, "bodyHeight");
              *(_DWORD *)buf = 138414082;
              v89 = (unint64_t)v35;
              v90 = 2048;
              v91 = v47;
              v92 = 1024;
              v93 = (int)v44;
              v94 = 1024;
              v95 = v43;
              v96 = 2048;
              v97 = v49;
              v98 = 2048;
              v99 = v50;
              v100 = 1024;
              v101 = (int)v45;
              v102 = 1024;
              v103 = v43;
              _os_log_impl(&dword_1B6C4A000, v28, OS_LOG_TYPE_DEBUG, "%@ face-%.3f|%dpx(%dpx), torso-%.3fx%.3f|%dpx(%dpx)", buf, 0x42u);
            }
            v51 = (double)v43;
            v52 = v44 != 0.0 && v44 < v51;
            if (v52 || (v45 != 0.0 ? (v53 = v45 < v51) : (v53 = 0), v53))
            {
              objc_msgSend(v80, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ImageTooSmall"));
              if (_os_feature_enabled_impl())
                v54 = 14;
              else
                v54 = 11;
              objc_msgSend(v30, "setAlgorithmVersion:", v54);
            }

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
        }
        while (v24);
      }

      objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("ImageTooSmall"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "BOOLValue");

      if (v56)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v78, "localIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v89 = (unint64_t)v57;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Resource size is too small", buf, 0xCu);

        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v78, "localIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v89 = (unint64_t)v58;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Resource size is good", buf, 0xCu);

      }
      objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("ImageTooSmall"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "BOOLValue");

      if (v66 != v60
        && (int)MediaAnalysisLogLevel() >= 7
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v78, "localIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v89 = (unint64_t)v61;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][FC][SmallFace][asset-%@] Invert decision", buf, 0xCu);

      }
      v18 = v67;
    }
    if (v18)
      objc_msgSend(v80, "setObject:forKeyedSubscript:", v18, CFSTR("FaceResults"));

  }
  else if (v76)
  {
    v86 = CFSTR("FacesToPersist");
    v87 = v76;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setObject:forKeyedSubscript:");

  }
  VCPSignPostLog();
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v63, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerVerifyAndMergeFaces", ", buf, 2u);
  }

  if (v72)
    objc_msgSend(v80, "removeObjectForKey:", CFSTR("ImageTooSmall"));
  v64 = objc_retainAutorelease(v80);
  *a3 = v64;

  return 0;
}

+ (BOOL)_downsampleBeforeFaceProcessing
{
  return 1;
}

- (int)_loadImageRequestHandler:(id *)a3 orientation:(unsigned int *)a4 bufferWidth:(int *)a5 bufferHeight:(int *)a6 withResource:(id)a7 resourceURL:(id)a8 andAsset:(id)a9
{
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  int Width;
  int Height;
  void *v37;
  signed int v38;
  signed int v39;
  signed int v40;
  unsigned int v41;
  signed int v42;
  void *v43;
  void *v45;
  os_signpost_id_t spid;
  void *spida;
  id v48;
  id v49;
  id v50;
  CVPixelBufferRef pixelBuffer;
  unsigned int v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  unsigned int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v49 = a7;
  v48 = a8;
  v50 = a9;
  *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  VCPSignPostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);

  VCPSignPostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPFaceProcessingFastPathDecodeAsset", ", buf, 2u);
  }

  if (!objc_msgSend((id)objc_opt_class(), "_downsampleBeforeFaceProcessing")
    || (objc_msgSend(v50, "vcp_isPano") & 1) != 0)
  {
    v19 = 0;
    goto LABEL_13;
  }
  v38 = objc_msgSend(v49, "pixelWidth");
  v39 = objc_msgSend(v49, "pixelHeight");
  v40 = v39;
  if (v38 && v39)
    goto LABEL_49;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v50, "localIdentifier");
    spida = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v49, "type");
    *(_DWORD *)buf = 138413058;
    v54 = spida;
    v55 = 1024;
    v56 = v41;
    v57 = 1024;
    v58 = v38;
    v59 = 1024;
    v60 = v40;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer][%@] Resource (%d) has invalid dimensions (%dx%d); falling back to asset",
      buf,
      0x1Eu);

  }
  v38 = objc_msgSend(v50, "pixelWidth");
  v42 = objc_msgSend(v50, "pixelHeight");
  v40 = v42;
  if (v38)
  {
    if (v42)
    {
LABEL_49:
      v19 = objc_msgSend(v50, "vcp_targetMajorDimensionForImageWithWidth:height:andMinPreferredMinorDimension:", v38, v40, 1210);
LABEL_13:
      v52 = 0;
      +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      pixelBuffer = (CVPixelBufferRef)objc_msgSend(v20, "pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:", 875704422, v19, v48, 0, &v52);

      VCPSignPostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v16, "VCPFaceProcessingFastPathDecodeAsset", ", buf, 2u);
      }

      if (pixelBuffer)
      {
        if (v52 - 9 > 0xFFFFFFF7)
        {
          VCPSignPostLog();
          v26 = objc_claimAutoreleasedReturnValue();
          spid = os_signpost_id_generate(v26);

          VCPSignPostLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerLoadImageRequestHandler", ", buf, 2u);
          }

          v29 = objc_alloc(MEMORY[0x1E0CEDF70]);
          v30 = v52;
          -[VCPObjectPool getObject](self->_sessionPool, "getObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "object");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *a3 = (id)objc_msgSend(v29, "initWithCVPixelBuffer:orientation:options:session:", pixelBuffer, v30, MEMORY[0x1E0C9AA70], v32);

          VCPSignPostLog();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerLoadImageRequestHandler", ", buf, 2u);
          }

          if (*a3)
          {
            Width = CVPixelBufferGetWidth(pixelBuffer);
            Height = CVPixelBufferGetHeight(pixelBuffer);
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v50, "localIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v54 = v37;
              v55 = 1024;
              v56 = Width;
              v57 = 1024;
              v58 = Height;
              v59 = 1024;
              v60 = v52;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][%@] Loaded local resource (%dx%d orientation:%d)", buf, 0x1Eu);

            }
            if (a4)
              *a4 = v52;
            if (a5)
              *a5 = Width;
            v24 = 0;
            if (a6)
              *a6 = Height;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v50, "localIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v54 = v43;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to create VNImageRequestHandler", buf, 0xCu);

            }
            v24 = -18;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v50, "localIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v54 = v23;
            v55 = 1024;
            v56 = v52;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to decode orientation (%d)", buf, 0x12u);

          }
          v24 = -50;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v50, "localIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v25;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to decode image", buf, 0xCu);

        }
        v24 = -23802;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
      goto LABEL_55;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v50, "localIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v54 = v45;
    v55 = 1024;
    v56 = v38;
    v57 = 1024;
    v58 = v40;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Invalid dimensions (%dx%d)", buf, 0x18u);

  }
  v24 = -23802;
LABEL_55:

  return v24;
}

- (int)analyzeAsset:(id)a3 withResource:(id)a4 resourceURL:(id)a5 isBestResource:(BOOL)a6 quickMode:(BOOL)a7 results:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  int v16;
  id v17;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  int v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v9 = a7;
  v10 = a6;
  v55 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  *a8 = 0;
  v46 = 0;
  v45 = 0;
  v44 = 0;
  v16 = -[VCPFaceAnalyzer _loadImageRequestHandler:orientation:bufferWidth:bufferHeight:withResource:resourceURL:andAsset:](self, "_loadImageRequestHandler:orientation:bufferWidth:bufferHeight:withResource:resourceURL:andAsset:", &v44, (char *)&v46 + 4, &v46, &v45, v15, a5, v14);
  v17 = v44;
  if (!v16)
  {
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPFaceAnalyzerPerformAnalysis", ", buf, 2u);
    }

    v16 = -[VCPFaceAnalyzer _performAnalysis:withRequestHandler:quickMode:sourceWidth:sourceHeight:](self, "_performAnalysis:withRequestHandler:quickMode:sourceWidth:sourceHeight:", a8, v17, v9, objc_msgSend(v14, "pixelWidth"), objc_msgSend(v14, "pixelHeight"));
    if (v16)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v23;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to analyze resource", buf, 0xCu);

      }
    }
    else
    {
      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_END, v20, "VCPFaceAnalyzerPerformAnalysis", ", buf, 2u);
      }

      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_generate(v26);

      VCPSignPostLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VCPFaceAnalyzerRefineAnalysis", ", buf, 2u);
      }

      objc_msgSend(*a8, "objectForKeyedSubscript:", CFSTR("FaceResults"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v30, "count");

      v31 = v45;
      if (HIDWORD(v46) <= 4)
        v32 = v46;
      else
        v32 = v45;
      if (HIDWORD(v46) > 4)
        v31 = v46;
      v16 = -[VCPFaceAnalyzer _refineAnalysis:requestHandler:forAsset:resource:isBestResource:orientedWidth:orientedHeight:](self, "_refineAnalysis:requestHandler:forAsset:resource:isBestResource:orientedWidth:orientedHeight:", a8, v17, v14, v15, v10, v32, v31);
      if (v16)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "localIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v33;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Failed to refine analysis", buf, 0xCu);

        }
      }
      else
      {
        VCPSignPostLog();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, v27, "VCPFaceAnalyzerRefineAnalysis", ", buf, 2u);
        }

        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "localIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*a8, "objectForKeyedSubscript:", CFSTR("FaceResults"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("FacesToPersist"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");
          objc_msgSend(*a8, "objectForKeyedSubscript:", CFSTR("FaceResults"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("FacesToDelete"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");
          *(_DWORD *)buf = 138413058;
          v48 = v42;
          v49 = 2048;
          v50 = v43;
          v51 = 2048;
          v52 = v38;
          v53 = 2048;
          v54 = v41;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][%@] Face refine completed: detected %lu | persist: %lu | delete: %lu", buf, 0x2Au);

        }
        v16 = 0;
      }
    }
  }

  return v16;
}

- (int)quickAnalyzeAsset:(id)a3 results:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[VCPFaceUtils preferredResourcesForFaceProcessingWithAsset:](VCPFaceUtils, "preferredResourcesForFaceProcessingWithAsset:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPFaceUtils resourceForFaceProcessing:allowStreaming:](VCPFaceUtils, "resourceForFaceProcessing:allowStreaming:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "path"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "fileExistsAtPath:", v11),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = -[VCPFaceAnalyzer analyzeAsset:withResource:resourceURL:isBestResource:quickMode:results:](self, "analyzeAsset:withResource:resourceURL:isBestResource:quickMode:results:", v6, v8, v9, +[VCPFaceUtils isBestResourceForFaceProcessing:fromResources:](VCPFaceUtils, "isBestResourceForFaceProcessing:fromResources:", v8, v7), 1, a4);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Missing local resource %@", (uint8_t *)&v16, 0x16u);

    }
    v13 = -18;
  }

  return v13;
}

- (int)quickAnalyzeCVPixelBuffer:(__CVBuffer *)a3 results:(id *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int Width;
  int Height;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  _DWORD v27[2];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v27[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPFaceAnalyzerLoadImageRequestHandlerPixelBuffer", ", (uint8_t *)v27, 2u);
  }

  v11 = objc_alloc(MEMORY[0x1E0CEDF70]);
  -[VCPObjectPool getObject](self->_sessionPool, "getObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithCVPixelBuffer:options:session:", a3, MEMORY[0x1E0C9AA70], v13);

  VCPSignPostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v27[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v8, "VCPFaceAnalyzerLoadImageRequestHandlerPixelBuffer", ", (uint8_t *)v27, 2u);
  }

  if (v14)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v27[0] = 67109376;
      v27[1] = Width;
      v28 = 1024;
      v29 = Height;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer][PixelBuffer] Loaded pixelBuffer(%d x %d)", (uint8_t *)v27, 0xEu);
    }
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v27[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPFaceAnalyzerPerformAnalysisPixelBuffer", ", (uint8_t *)v27, 2u);
    }

    v23 = -[VCPFaceAnalyzer _performAnalysis:withRequestHandler:quickMode:sourceWidth:sourceHeight:](self, "_performAnalysis:withRequestHandler:quickMode:sourceWidth:sourceHeight:", a4, v14, 1, Width, Height);
    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27[0]) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][PixelBuffer] Failed to analyze resource", (uint8_t *)v27, 2u);
      }
    }
    else
    {
      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        LOWORD(v27[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_END, v20, "VCPFaceAnalyzerPerformAnalysisPixelBuffer", ", (uint8_t *)v27, 2u);
      }

      v23 = 0;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][PixelBuffer] Failed to create VNImageRequestHandler", (uint8_t *)v27, 2u);
    }
    v23 = -18;
  }

  return v23;
}

- (int)updateMissingFaceprintForFaces:(id)a3 withAsset:(id)a4
{
  id v6;
  objc_class *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  char v40;
  int v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  char v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  double v62;
  void *v63;
  void *v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  uint64_t v70;
  double v71;
  float v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  double v85;
  id v87;
  uint64_t v88;
  os_signpost_id_t spid;
  id v90;
  id v91;
  void *v92;
  void *v93;
  VCPFaceAnalyzer *v94;
  id v95;
  void *v96;
  id obj;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *context;
  void *type;
  void *v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  id v122;
  uint8_t buf[4];
  double v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  double v128;
  __int16 v129;
  double v130;
  __int16 v131;
  double v132;
  __int16 v133;
  double v134;
  __int16 v135;
  double v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v95 = a4;
  v96 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = VCPMAGetRevisionForVisionModel(v7, self->_processingVersion);
    v94 = self;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v117 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          objc_msgSend(v13, "imageprintWrapper");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            objc_msgSend(v13, "centerX");
            v17 = v16;
            objc_msgSend(v13, "centerY");
            v19 = v18;
            objc_msgSend(v13, "size");
            +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v17, v19, v20, (double)objc_msgSend(v13, "sourceWidth"), (double)objc_msgSend(v13, "sourceHeight"));
            v22 = v21;
            v24 = v23;
            v26 = v25;
            v28 = v27;
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "centerX");
              v30 = v29;
              objc_msgSend(v13, "centerY");
              v32 = v31;
              objc_msgSend(v13, "size");
              *(_DWORD *)buf = 134219520;
              v124 = v30;
              v125 = 2048;
              v126 = v32;
              v127 = 2048;
              v128 = v33;
              v129 = 2048;
              v130 = v22;
              v131 = 2048;
              v132 = v24;
              v133 = 2048;
              v134 = v26;
              v135 = 2048;
              v136 = v28;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] face (center-x:%.2f, center-y:%.2f, size:%.2f) -> boundingBox (x:%.2f, y:%.2f, width:%.2f, height:%.2f)", buf, 0x48u);
            }
            objc_msgSend(MEMORY[0x1E0CEDEE0], "observationWithRequestRevision:boundingBox:", v8, v22, v24, v26, v28);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              objc_msgSend(v13, "localIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "setObject:forKeyedSubscript:", v34, v35);

            }
            else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "gist");
              v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 138412290;
              v124 = v36;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Failed to generate VNFaceObservation from face %@", buf, 0xCu);

            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
      }
      while (v10);
    }

    if (!objc_msgSend(v103, "count"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] All faces contain valid faceprint", buf, 2u);
      }
      v41 = 0;
      goto LABEL_104;
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v37 = COERCE_DOUBLE(objc_msgSend(v103, "count"));
      *(_DWORD *)buf = 134217984;
      v124 = v37;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer] Updating %lu faces with missing faceprint", buf, 0xCu);
    }
    +[VCPFaceUtils resourceForFaceProcessingWithAsset:allowStreaming:](VCPFaceUtils, "resourceForFaceProcessingWithAsset:allowStreaming:", v95, 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "privateFileURL");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v92
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v93, "path"),
          v39 = (void *)objc_claimAutoreleasedReturnValue(),
          v40 = objc_msgSend(v38, "fileExistsAtPath:", v39),
          v39,
          v38,
          (v40 & 1) == 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v95, "localIdentifier");
        v42 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138412546;
        v124 = v42;
        v125 = 2112;
        v126 = (uint64_t)v92;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Missing local resource %@", buf, 0x16u);

      }
      v41 = -18;
      goto LABEL_103;
    }
    v115 = 0;
    v41 = -[VCPFaceAnalyzer _loadImageRequestHandler:orientation:bufferWidth:bufferHeight:withResource:resourceURL:andAsset:](v94, "_loadImageRequestHandler:orientation:bufferWidth:bufferHeight:withResource:resourceURL:andAsset:", &v115, 0, 0, 0, v92, v93, v95);
    v91 = v115;
    if (v41)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to create VNImageRequestHandler for face quality analysis", buf, 2u);
      }
      goto LABEL_102;
    }
    v88 = mach_absolute_time();
    VCPSignPostLog();
    v43 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v43);

    VCPSignPostLog();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v45, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerFillMissingFaceprint", ", buf, 2u);
    }

    v46 = objc_alloc_init(MEMORY[0x1E0CEDE28]);
    v114 = v46;
    v41 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v114, objc_opt_class(), v94->_processingVersion);
    v90 = v114;

    if (v41)
    {
LABEL_101:

LABEL_102:
LABEL_103:

LABEL_104:
      goto LABEL_105;
    }
    objc_msgSend(v103, "allValues");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setInputFaceObservations:", v47);

    v122 = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0;
    v49 = objc_msgSend(v91, "performRequests:error:", v48, &v113);
    v87 = v113;

    if ((v49 & 1) != 0)
    {
      objc_msgSend(v90, "results");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      obj = v9;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
      if (v50)
      {
        v99 = *(_QWORD *)v110;
        do
        {
          v100 = v50;
          for (j = 0; j != v100; ++j)
          {
            if (*(_QWORD *)v110 != v99)
              objc_enumerationMutation(obj);
            type = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
            context = (void *)MEMORY[0x1BCCA1B2C]();
            objc_msgSend(type, "localIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "objectForKeyedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
            {
              v107 = 0u;
              v108 = 0u;
              v105 = 0u;
              v106 = 0u;
              v54 = v98;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
              if (v55)
              {
                v56 = *(_QWORD *)v106;
                while (2)
                {
                  for (k = 0; k != v55; ++k)
                  {
                    if (*(_QWORD *)v106 != v56)
                      objc_enumerationMutation(v54);
                    v58 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
                    objc_msgSend(v53, "uuid");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "uuid");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    v61 = objc_msgSend(v59, "isEqual:", v60);

                    if (v61)
                    {
                      objc_msgSend(v58, "faceprint");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      v64 = v63;
                      if (v63)
                      {
                        objc_msgSend(v63, "confidence");
                        v66 = v65;
                        if (_os_feature_enabled_impl())
                          v67 = 0.2;
                        else
                          v67 = 0.9;
                        if (v66 >= v67)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 7
                            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                          {
                            objc_msgSend(v64, "confidence");
                            v74 = v73;
                            objc_msgSend(v58, "description");
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v58, "faceJunkinessIndex");
                            *(_DWORD *)buf = 134218498;
                            v124 = v74;
                            v125 = 2112;
                            v126 = (uint64_t)v75;
                            v127 = 2048;
                            v128 = v76;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] Accepting faceprint with confidence: %.3f %@ - junkinessIndex: %.3f", buf, 0x20u);

                          }
                          v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDEE8]), "initWithFaceprint:torsoprint:", v64, 0);
                          v104 = 0;
                          objc_msgSend(v77, "serializeStateAndReturnError:", &v104);
                          v78 = (void *)objc_claimAutoreleasedReturnValue();
                          v79 = COERCE_DOUBLE(v104);
                          if (v78)
                          {
                            if ((int)MediaAnalysisLogLevel() >= 6
                              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                            {
                              objc_msgSend(type, "gist");
                              v80 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                              *(_DWORD *)buf = 138412290;
                              v124 = v80;
                              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer] Update faceprint for face %@", buf, 0xCu);

                            }
                            +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, v94->_processingVersion, v78);
                            v81 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(type, "setImageprintWrapper:", v81);

                            objc_msgSend(type, "setVuObservationID:", 0);
                          }
                          else if ((int)MediaAnalysisLogLevel() >= 3
                                 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v124 = v79;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Unable to serialize faceTorsoprint - %@", buf, 0xCu);
                          }

                        }
                        else if ((int)MediaAnalysisLogLevel() >= 6
                               && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(v64, "confidence");
                          v69 = v68;
                          if (_os_feature_enabled_impl())
                            v70 = 0x3FC99999A0000000;
                          else
                            v70 = 0x3FECCCCCC0000000;
                          objc_msgSend(v58, "description");
                          v71 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          objc_msgSend(v58, "faceJunkinessIndex");
                          *(_DWORD *)buf = 134218754;
                          v124 = v69;
                          v125 = 2048;
                          v126 = v70;
                          v127 = 2112;
                          v128 = v71;
                          v129 = 2048;
                          v130 = v72;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer] faceprint.confidence is too low (%.3f < %.3f) %@ - junkinessIndex: %.3f", buf, 0x2Au);

                        }
                      }
                      else if ((int)MediaAnalysisLogLevel() >= 3
                             && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v124 = *(double *)&v58;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] No valid faceprint from observation %@", buf, 0xCu);
                      }

                      goto LABEL_87;
                    }
                  }
                  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
                  if (v55)
                    continue;
                  break;
                }
              }

              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(type, "gist");
                v62 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                *(_DWORD *)buf = 138412290;
                v124 = v62;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FaceAnalyzer] Failed to get faceprint for face %@", buf, 0xCu);

              }
            }
LABEL_87:

            objc_autoreleasePoolPop(context);
          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
        }
        while (v50);
      }

      VCPSignPostLog();
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = v82;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v83, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerFillMissingFaceprint", ", buf, 2u);
      }

      if (v88)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }

      v41 = 0;
    }
    else
    {
      v84 = v87;
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v41 = -18;
        goto LABEL_100;
      }
      objc_msgSend(v87, "description");
      v85 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      v124 = v85;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Faceprint VNImageRequestHandler::performRequests: %@", buf, 0xCu);

      v41 = -18;
    }
    v84 = v87;
LABEL_100:

    goto LABEL_101;
  }
  v41 = 0;
LABEL_105:

  return v41;
}

- (int)analyzeFaceQuality:(id *)a3 withAsset:(id)a4 andCancelBlock:(id)a5
{
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  id v51;
  char v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  id v78;
  uint64_t v79;
  os_signpost_id_t spid;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  uint64_t (**v92)(void);
  unint64_t i;
  id v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  _BYTE v107[128];
  id v108;
  const __CFString *v109;
  uint64_t v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  double v118;
  __int16 v119;
  double v120;
  __int16 v121;
  double v122;
  __int16 v123;
  double v124;
  const __CFString *v125;
  uint64_t v126;
  _QWORD v127[5];

  v127[2] = *MEMORY[0x1E0C80C00];
  v95 = a4;
  v92 = (uint64_t (**)(void))a5;
  v6 = (objc_class *)objc_opt_class();
  v7 = (void *)VCPMAGetRevisionForVisionModel(v6, self->_processingVersion);
  v8 = (void *)objc_opt_class();
  if ((VCPMAVNRequestSupportRevision(v8, v7) & 1) != 0
    && (v88 = (void *)VCPMAGetRevisionForMediaAnalysisType(0x1000000000),
        v9 = (void *)objc_opt_class(),
        (VCPMAVNRequestSupportRevision(v9, v88) & 1) != 0))
  {
    if ((objc_msgSend(v95, "vcp_quickFaceClassificationDone") & 1) != 0)
    {
      objc_msgSend(v95, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "librarySpecificFetchOptions");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *MEMORY[0x1E0CD1B68];
      v127[0] = *MEMORY[0x1E0CD1B70];
      v127[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFetchPropertySets:", v12);

      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v95, v86);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v96, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v14 = MEMORY[0x1E0C81028];
        while (v13 < objc_msgSend(v96, "count"))
        {
          objc_msgSend(v96, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "centerX");
          v17 = v16;
          objc_msgSend(v15, "centerY");
          v19 = v18;
          objc_msgSend(v15, "size");
          +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v17, v19, v20, (double)objc_msgSend(v15, "sourceWidth"), (double)objc_msgSend(v15, "sourceHeight"));
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "centerX");
            v30 = v29;
            objc_msgSend(v15, "centerY");
            v32 = v31;
            objc_msgSend(v15, "size");
            *(_DWORD *)buf = 134219520;
            v112 = v30;
            v113 = 2048;
            v114 = v32;
            v115 = 2048;
            v116 = v33;
            v117 = 2048;
            v118 = v22;
            v119 = 2048;
            v120 = v24;
            v121 = 2048;
            v122 = v26;
            v123 = 2048;
            v124 = v28;
            _os_log_impl(&dword_1B6C4A000, v14, OS_LOG_TYPE_DEBUG, "[FaceAnalyzer] face (center-x:%.2f, center-y:%.2f, size:%.2f) -> boundingBox (x:%.2f, y:%.2f, width:%.2f, height:%.2f)", buf, 0x48u);
          }
          objc_msgSend(MEMORY[0x1E0CEDEE0], "observationWithRequestRevision:boundingBox:", v7, v22, v24, v26, v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v15, "localIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "setObject:forKeyedSubscript:", v34, v35);

          }
          ++v13;
        }
        if (objc_msgSend(v91, "count"))
        {
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v39 = objc_msgSend(v91, "count");
            *(_DWORD *)buf = 134217984;
            v112 = v39;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer] Analyzing %lu face observations for face quality", buf, 0xCu);
          }
          +[VCPFaceUtils resourceForFaceProcessingWithAsset:allowStreaming:](VCPFaceUtils, "resourceForFaceProcessingWithAsset:allowStreaming:", v95, 0);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "privateFileURL");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85
            && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                v40 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v87, "path"),
                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                v42 = objc_msgSend(v40, "fileExistsAtPath:", v41),
                v41,
                v40,
                (v42 & 1) != 0))
          {
            v103 = 0;
            v36 = -[VCPFaceAnalyzer _loadImageRequestHandler:orientation:bufferWidth:bufferHeight:withResource:resourceURL:andAsset:](self, "_loadImageRequestHandler:orientation:bufferWidth:bufferHeight:withResource:resourceURL:andAsset:", &v103, 0, 0, 0, v85, v87, v95);
            v43 = v103;
            if (v36)
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to create VNImageRequestHandler for face quality analysis", buf, 2u);
              }
            }
            else if (v92 && (v92[2]() & 1) != 0)
            {
              v36 = -128;
            }
            else
            {
              v82 = v43;
              v79 = mach_absolute_time();
              VCPSignPostLog();
              v48 = objc_claimAutoreleasedReturnValue();
              spid = os_signpost_id_generate(v48);

              VCPSignPostLog();
              v49 = objc_claimAutoreleasedReturnValue();
              v50 = v49;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v50, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPFaceAnalyzerFaceQuality", ", buf, 2u);
              }

              v51 = objc_alloc_init(MEMORY[0x1E0CEDE68]);
              v102 = 0;
              v81 = v51;
              v52 = objc_msgSend(v51, "setRevision:error:", v88, &v102);
              v53 = v102;
              if ((v52 & 1) != 0)
              {
                objc_msgSend(v51, "setMetalContextPriority:", 1);
                objc_msgSend(v51, "setPreferBackgroundProcessing:", 1);
                if (DeviceHasANE())
                {
                  objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setProcessingDevice:", v54);

                }
                objc_msgSend(v91, "allValues");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setInputFaceObservations:", v55);

                v108 = v51;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = v53;
                v57 = objc_msgSend(v82, "performRequests:error:", v56, &v101);
                v78 = v101;

                if ((v57 & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "results");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  for (i = 0; i < objc_msgSend(v96, "count"); ++i)
                  {
                    v58 = (void *)MEMORY[0x1BCCA1B2C]();
                    objc_msgSend(v96, "objectAtIndexedSubscript:", i);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "localIdentifier");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "objectForKeyedSubscript:", v59);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v60)
                    {
                      v99 = 0u;
                      v100 = 0u;
                      v97 = 0u;
                      v98 = 0u;
                      v61 = v84;
                      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
                      if (v62)
                      {
                        v63 = *(_QWORD *)v98;
                        while (2)
                        {
                          for (j = 0; j != v62; ++j)
                          {
                            if (*(_QWORD *)v98 != v63)
                              objc_enumerationMutation(v61);
                            v65 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
                            objc_msgSend(v60, "uuid");
                            v66 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v65, "uuid");
                            v67 = (void *)objc_claimAutoreleasedReturnValue();
                            v68 = objc_msgSend(v66, "isEqual:", v67);

                            if (v68)
                            {
                              objc_msgSend(v65, "faceCaptureQuality");
                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                              v70 = v69 == 0;

                              if (v70)
                              {
                                if ((int)MediaAnalysisLogLevel() >= 3
                                  && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                                {
                                  objc_msgSend(v95, "localIdentifier");
                                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v89, "localIdentifier");
                                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138412546;
                                  v112 = (uint64_t)v73;
                                  v113 = 2112;
                                  v114 = (uint64_t)v74;
                                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@][%@] No valid Face Quality score; skipping",
                                    buf,
                                    0x16u);

                                }
                              }
                              else
                              {
                                objc_msgSend(v65, "faceCaptureQuality");
                                v71 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v89, "localIdentifier");
                                v72 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v83, "setObject:forKeyedSubscript:", v71, v72);

                              }
                              goto LABEL_68;
                            }
                          }
                          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
                          if (v62)
                            continue;
                          break;
                        }
                      }
LABEL_68:

                    }
                    objc_autoreleasePoolPop(v58);
                  }
                  VCPSignPostLog();
                  v75 = objc_claimAutoreleasedReturnValue();
                  v76 = v75;
                  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v76, OS_SIGNPOST_INTERVAL_END, spid, "VCPFaceAnalyzerFaceQuality", ", buf, 2u);
                  }

                  if (v79)
                  {
                    mach_absolute_time();
                    VCPPerformance_LogMeasurement();
                  }
                  v104 = v83;
                  v105 = CFSTR("FaceQualityResults");
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  v106 = v77;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
                  *a3 = (id)objc_claimAutoreleasedReturnValue();

                  v36 = 0;
                  v53 = v78;
                  v51 = v81;
                }
                else
                {
                  v51 = v81;
                  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v112 = (uint64_t)v78;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to perform Face Quality request - %@", buf, 0xCu);
                  }
                  v36 = -18;
                  v53 = v78;
                }
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v112 = (uint64_t)v88;
                  v113 = 2112;
                  v114 = (uint64_t)v53;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer] Failed to set Face Quality revision (%lu) - %@", buf, 0x16u);
                }
                v36 = -18;
              }

              v43 = v82;
            }

          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v95, "localIdentifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v112 = (uint64_t)v45;
              v113 = 2112;
              v114 = (uint64_t)v85;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FaceAnalyzer][%@] Missing local resource %@", buf, 0x16u);

            }
            v36 = -18;
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v95, "localIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v96, "count");
            *(_DWORD *)buf = 138412546;
            v112 = (uint64_t)v46;
            v113 = 2048;
            v114 = v47;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer][%@] No valid face observations from %lu faces; skip face quality analysis",
              buf,
              0x16u);

          }
          v109 = CFSTR("FaceQualityResults");
          v110 = MEMORY[0x1E0C9AA60];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
          v36 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v95, "localIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v112 = (uint64_t)v44;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer][%@] No face detected; skip face quality analysis",
            buf,
            0xCu);

        }
        v125 = CFSTR("FaceQualityResults");
        v126 = MEMORY[0x1E0C9AA60];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v36 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v95, "localIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v112 = (uint64_t)v38;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FaceAnalyzer][%@] No face detected; skip face quality analysis",
          buf,
          0xCu);

      }
      v36 = 0;
    }
  }
  else
  {
    v36 = -50;
  }

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionPool, 0);
  objc_storeStrong((id *)&self->_faceMerger, 0);
}

@end
