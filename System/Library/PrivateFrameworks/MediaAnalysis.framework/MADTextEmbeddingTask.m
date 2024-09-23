@implementation MADTextEmbeddingTask

+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void **v29;
  uint64_t *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MADTextEmbeddingResource sharedResource:](MADTextEmbeddingResource, "sharedResource:", objc_msgSend(v5, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateResource:", v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CSUTextEncoder_loadResources", ", buf, 2u);
  }

  objc_msgSend(v6, "textEncoder");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v16 = 0;
    goto LABEL_20;
  }
  v13 = (void *)v12;
  objc_msgSend(v6, "textEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v15 = objc_msgSend(v14, "loadResources:", &v53);
  v16 = v53;

  if ((v15 & 1) == 0)
  {
LABEL_20:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "description");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to prewarm text encoder (%@)", buf, 0xCu);

    }
    if (a4)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2F90];
      v58 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to prewarm text encoder"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v27;
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = &v59;
      v30 = &v58;
      goto LABEL_25;
    }
LABEL_27:
    v33 = 0;
    goto LABEL_28;
  }
  VCPSignPostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_END, v9, "CSUTextEncoder_loadResources", ", buf, 2u);
  }

  if (!objc_msgSend(v5, "computeThreshold"))
    goto LABEL_34;
  VCPSignPostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  VCPSignPostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADTextEmbeddingThreshold_loadResources", ", buf, 2u);
  }

  objc_msgSend(v6, "calibration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "loadResources");

  if (!v24)
  {
    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v20, "MADTextEmbeddingThreshold_loadResources", ", buf, 2u);
    }

LABEL_34:
    v34 = v52;
    objc_msgSend(v52, "reset", v52);
    if (!objc_msgSend(v5, "calibrate") || objc_msgSend(v5, "version") != 3)
    {
      v33 = 1;
      goto LABEL_29;
    }
    +[MADTextEmbeddingCalibrationResource sharedResource](MADTextEmbeddingCalibrationResource, "sharedResource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateResource:", v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    VCPSignPostLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_signpost_id_generate(v39);

    VCPSignPostLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "MADTextEmbeddingCalibration_loadResources", ", buf, 2u);
    }

    objc_msgSend(v27, "instance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "loadResources");

    if (v44)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "description");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v61 = v45;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to prewarm text embedding calibration (%@)", buf, 0xCu);

      }
      if (a4)
      {
        v46 = (void *)MEMORY[0x1E0CB35C8];
        v47 = *MEMORY[0x1E0CB2F90];
        v54 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to prewarm text embedding calibration"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "errorWithDomain:code:userInfo:", v47, -50, v49);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v33 = 0;
    }
    else
    {
      VCPSignPostLog();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_END, v40, "MADTextEmbeddingCalibration_loadResources", ", buf, 2u);
      }

      objc_msgSend(v32, "reset");
      v33 = 1;
    }
    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to prewarm text embedding calibration", buf, 2u);
  }
  if (!a4)
    goto LABEL_27;
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0CB2F90];
  v56 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to prewarm text embedding calibration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v27;
  v28 = (void *)MEMORY[0x1E0C99D80];
  v29 = &v57;
  v30 = &v56;
LABEL_25:
  objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1, v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, -50, v32);
  v33 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_28:
  v34 = v52;
LABEL_29:

  return v33;
}

- (id)embeddingFromMultiArray:(id)a3 version:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "dataType");
  if (v6 == 65552)
  {
    v7 = 1;
    v8 = 1;
    goto LABEL_5;
  }
  if (v6 == 65568)
  {
    v7 = 0;
    v8 = 2;
LABEL_5:
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__22;
    v19 = __Block_byref_object_dispose__22;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__MADTextEmbeddingTask_embeddingFromMultiArray_version___block_invoke;
    v14[3] = &unk_1E6B17A20;
    v14[4] = buf;
    objc_msgSend(v5, "getBytesWithHandler:", v14);
    if (a4 - 1 <= 1)
    {
      +[VCPTextEncoder applyL2Norm:isFP16:](VCPTextEncoder, "applyL2Norm:isFP16:", *((_QWORD *)v16 + 5), v7);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v16 + 5);
      *((_QWORD *)v16 + 5) = v9;

    }
    v11 = objc_alloc(MEMORY[0x1E0D476B8]);
    v12 = (void *)objc_msgSend(v11, "initWithVersion:data:type:", a4, *((_QWORD *)v16 + 5), v8);
    _Block_object_dispose(buf, 8);

    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v5, "dataType");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported embedding data type (%d)", buf, 8u);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

void __56__MADTextEmbeddingTask_embeddingFromMultiArray_version___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)processInput:(id)a3 resource:(id)a4 result:(id *)a5 error:(id *)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  BOOL v61;
  NSObject *v62;
  os_signpost_id_t v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  os_signpost_id_t v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  NSObject *v100;
  NSObject *v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  NSObject *v108;
  os_signpost_id_t v109;
  NSObject *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  int v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id *v125;
  void *v126;
  NSObject *v127;
  NSObject *v128;
  void *v129;
  double v130;
  double v131;
  uint64_t v132;
  id v133;
  void *v134;
  void *v135;
  void *v139;
  id v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  uint64_t v150;
  id v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  id v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint8_t v174[128];
  uint8_t buf[4];
  void *v176;
  uint64_t v177;
  void *v178;
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v140 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v139 = v7;
  objc_msgSend(v7, "segments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
  if (!v10)
    goto LABEL_23;
  v11 = v10;
  v12 = *(_QWORD *)v159;
  v142 = *(_QWORD *)v159;
  v147 = v9;
  while (2)
  {
    v13 = 0;
    v144 = v11;
    do
    {
      if (*(_QWORD *)v159 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v13);
      v15 = (void *)MEMORY[0x1BCCA1B2C]();
      if (objc_msgSend(v14, "type") == 1)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0D18900]);
        objc_msgSend(v14, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setString:", v17);

        objc_msgSend(v8, "addObject:", v16);
        goto LABEL_21;
      }
      if (objc_msgSend(v14, "type") != 2)
      {
        if (objc_msgSend(v14, "type") == 3)
        {
          v141 = v15;
          v16 = v14;
          v153 = 0u;
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          objc_msgSend(v16, "tokenIDs");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v154;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v154 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * i);
                v32 = objc_alloc_init(MEMORY[0x1E0D18920]);
                objc_msgSend(v32, "setTokenID:", v31);
                objc_msgSend(v8, "addObject:", v32);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
            }
            while (v28);
          }

          v9 = v147;
          v15 = v141;
          goto LABEL_20;
        }
        v56 = (void *)MEMORY[0x1E0CB35C8];
        v57 = *MEMORY[0x1E0CB2F90];
        v172 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported text input segment type (%d)"), objc_msgSend(v14, "type"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, -18, v59);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "description");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v176 = v60;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        if (!a6)
        {
LABEL_43:

          objc_autoreleasePoolPop(v15);
          v61 = 0;
          goto LABEL_59;
        }
        v16 = v16;
        v19 = *a6;
        *a6 = v16;
LABEL_42:

        goto LABEL_43;
      }
      v18 = v15;
      v16 = v14;
      v19 = objc_alloc_init(MEMORY[0x1E0D18918]);
      objc_msgSend(v140, "entityGallery");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entityUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v140, "tokenEmbeddingType");
      v157 = 0;
      objc_msgSend(v20, "tokenEmbeddingsForTag:client:type:error:", v21, 0, v22, &v157);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v157;
      objc_msgSend(v19, "setEmbedding:", v23);

      objc_msgSend(v19, "embedding");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v145 = *MEMORY[0x1E0CB2F90];
        v177 = *MEMORY[0x1E0CB2D50];
        v49 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "entityUUID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "description");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("Failed to resolve entity %@ (%@)"), v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", v145, -18, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v54, "description");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v176 = v55;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        if (a6)
          objc_storeStrong(a6, v54);

        v15 = v18;
        v9 = v147;
        goto LABEL_42;
      }
      objc_msgSend(v8, "addObject:", v19);

      v15 = v18;
      v9 = v147;
LABEL_20:
      v12 = v142;
      v11 = v144;
LABEL_21:

      objc_autoreleasePoolPop(v15);
      ++v13;
    }
    while (v13 != v11);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
    if (v11)
      continue;
    break;
  }
LABEL_23:

  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateResource:", v140);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  -[MADServiceTextProcessingSubtask request](self, "request");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "version") != 5)
    goto LABEL_44;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v35 = qword_1B6FBEBA0[objc_msgSend(v34, "extendedContextLength")];
    *(_DWORD *)buf = 67109120;
    LODWORD(v176) = v35;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Setting context length: %d", buf, 8u);
  }
  objc_msgSend(v140, "textEncoder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = qword_1B6FBEBA0[objc_msgSend(v34, "extendedContextLength")];
  v152 = 0;
  objc_msgSend(v36, "setContextLength:error:", v37, &v152);
  v38 = v152;

  if (!v38)
  {
LABEL_44:
    VCPSignPostLog();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = os_signpost_id_generate(v62);

    VCPSignPostLog();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      -[MADServiceTextProcessingSubtask signpostPayload](self, "signpostPayload");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v176 = v66;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v65, OS_SIGNPOST_INTERVAL_BEGIN, v63, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);

    }
    objc_msgSend(v140, "textEncoder");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = 0;
    objc_msgSend(v67, "runOnInput:error:", v8, &v151);
    v38 = v151;

    VCPSignPostLog();
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
    {
      -[MADServiceTextProcessingSubtask signpostPayload](self, "signpostPayload");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v176 = v70;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v69, OS_SIGNPOST_INTERVAL_END, v63, "CSUTextEncoder_runOnInput", "%@", buf, 0xCu);

    }
    if (v38)
    {
      v71 = (void *)MEMORY[0x1E0CB35C8];
      v72 = *MEMORY[0x1E0CB2F90];
      v168 = *MEMORY[0x1E0CB2D50];
      v73 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v38, "description");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringWithFormat:", CFSTR("Text encoding failed (%@)"), v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = v75;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "errorWithDomain:code:userInfo:", v72, -18, v76);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_55;
LABEL_53:
      objc_msgSend(v45, "description");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v176 = v46;
      v47 = MEMORY[0x1E0C81028];
      goto LABEL_54;
    }
    objc_msgSend(v140, "textEncoder");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "inferenceOutputs");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "CSUTextEmbedding");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADTextEmbeddingTask embeddingFromMultiArray:version:](self, "embeddingFromMultiArray:version:", v80, objc_msgSend(v34, "version"));
    v38 = (id)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v93 = (void *)MEMORY[0x1E0CB35C8];
      v94 = *MEMORY[0x1E0CB2F90];
      v166 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to extract and normalize embedding"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = v95;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "errorWithDomain:code:userInfo:", v94, -18, v96);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      goto LABEL_53;
    }
    if (objc_msgSend(v34, "computeThreshold"))
    {
      v150 = 0;
      v149 = 0;
      VCPSignPostLog();
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = os_signpost_id_generate(v81);

      VCPSignPostLog();
      v83 = objc_claimAutoreleasedReturnValue();
      v84 = v83;
      if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
      {
        -[MADServiceTextProcessingSubtask signpostPayload](self, "signpostPayload");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v176 = v85;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v84, OS_SIGNPOST_INTERVAL_BEGIN, v82, "MADTextEmbeddingThreshold", "%@", buf, 0xCu);

      }
      objc_msgSend(v140, "calibration");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "processEmbedding:bias:scale:threshold:", v38, (char *)&v150 + 4, &v150, &v149);

      if (v87)
      {
        v88 = (void *)MEMORY[0x1E0CB35C8];
        v89 = *MEMORY[0x1E0CB2F90];
        v90 = v87;
        v164 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Text embedding threshold calibration failed"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = v91;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "errorWithDomain:code:userInfo:", v89, v90, v92);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        objc_msgSend(v45, "description");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v176 = v46;
        v47 = MEMORY[0x1E0C81028];
LABEL_54:
        _os_log_impl(&dword_1B6C4A000, v47, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        goto LABEL_55;
      }
      VCPSignPostLog();
      v100 = objc_claimAutoreleasedReturnValue();
      v101 = v100;
      if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
      {
        -[MADServiceTextProcessingSubtask signpostPayload](self, "signpostPayload");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v176 = v102;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v101, OS_SIGNPOST_INTERVAL_END, v82, "MADTextEmbeddingThreshold", "%@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v140, "calibrationVersion"));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v103) = HIDWORD(v150);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v103);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v104) = v150;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v104);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v105) = v149;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v105);
      v99 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v143 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
    }
    objc_msgSend(v148, "reset");
    v146 = (void *)v99;
    if (objc_msgSend(v34, "calibrate"))
    {
      v135 = v98;
      +[MADTextEmbeddingCalibrationResource sharedResource](MADTextEmbeddingCalibrationResource, "sharedResource");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "activateResource:", v106);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = 0;
      VCPSignPostLog();
      v108 = objc_claimAutoreleasedReturnValue();
      v109 = os_signpost_id_generate(v108);

      VCPSignPostLog();
      v110 = objc_claimAutoreleasedReturnValue();
      v111 = v110;
      if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
      {
        -[MADServiceTextProcessingSubtask signpostPayload](self, "signpostPayload");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v176 = v112;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v111, OS_SIGNPOST_INTERVAL_BEGIN, v109, "MADTextEmbeddingCalibration", "%@", buf, 0xCu);

      }
      objc_msgSend(v106, "instance");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v113, "processEmbedding:mean:standardDeviation:", v38, (char *)&v150 + 4, &v150);

      if (v114)
      {
        v115 = (void *)MEMORY[0x1E0CB35C8];
        v116 = *MEMORY[0x1E0CB2F90];
        v117 = v114;
        v162 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Text embedding calibration failed"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = v118;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "errorWithDomain:code:userInfo:", v116, v117, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v120, "description");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v176 = v121;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
        v122 = v143;
        v123 = v146;
        if (a6)
          objc_storeStrong(a6, v120);

        v61 = 0;
        v124 = v134;
        v98 = v135;
        goto LABEL_94;
      }
      v126 = v106;
      VCPSignPostLog();
      v127 = objc_claimAutoreleasedReturnValue();
      v128 = v127;
      if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
      {
        -[MADServiceTextProcessingSubtask signpostPayload](self, "signpostPayload");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v176 = v129;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v128, OS_SIGNPOST_INTERVAL_END, v109, "MADTextEmbeddingCalibration", "%@", buf, 0xCu);

      }
      objc_msgSend(v134, "reset");

      LODWORD(v130) = HIDWORD(v150);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v130);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v131) = v150;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v131);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      v122 = &unk_1E6B72E90;
      v98 = v135;
      v125 = a5;
    }
    else
    {
      v106 = 0;
      v124 = 0;
      v125 = a5;
      v122 = v143;
    }
    v123 = v146;
    v132 = objc_msgSend(objc_alloc(MEMORY[0x1E0D47790]), "initWithEmbedding:calibrationVersion:mean:standardDeviation:bias:scale:threshold:", v38, v122, v106, v124, v97, v98, v146);
    v133 = *v125;
    *v125 = (id)v132;

    v61 = 1;
LABEL_94:

    goto LABEL_58;
  }
  v39 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2F90];
  v170 = *MEMORY[0x1E0CB2D50];
  v41 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v38, "description");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("Failed to set context length (%@)"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, -18, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v45, "description");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v176 = v46;
    v47 = MEMORY[0x1E0C81028];
    goto LABEL_54;
  }
LABEL_55:
  if (a6)
    objc_storeStrong(a6, v45);

  v61 = 0;
LABEL_58:

  v9 = v148;
LABEL_59:

  return v61;
}

- (int)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  uint8_t buf[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MADTextEmbeddingTask running...", buf, 2u);
  }
  -[MADServiceTextProcessingSubtask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "calibrate") && objc_msgSend(v3, "version") != 3)
  {
    -[MADServiceTextProcessingSubtask request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calibration only supported for MD3"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v5;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = (void **)v36;
    v21 = &v35;
LABEL_27:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, -18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v23);

    goto LABEL_28;
  }
  if (objc_msgSend(v3, "computeThreshold")
    && objc_msgSend(v3, "version") != 3
    && objc_msgSend(v3, "version") != 4
    && objc_msgSend(v3, "version") != 5)
  {
    -[MADServiceTextProcessingSubtask request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Threshold calibration only supported for MD3/MD4/MD5"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v5;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v34;
    v21 = &v33;
    goto LABEL_27;
  }
  +[MADTextEmbeddingResource sharedResource:](MADTextEmbeddingResource, "sharedResource:", objc_msgSend(v3, "version", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MADServiceTextProcessingSubtask asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1BCCA1B2C]();
        v26 = 0;
        *(_QWORD *)buf = 0;
        v14 = -[MADTextEmbeddingTask processInput:resource:result:error:](self, "processInput:resource:result:error:", v12, v4, &v26, buf);
        if (v14)
        {
          objc_msgSend(v5, "addObject:", v26);
        }
        else
        {
          -[MADServiceTextProcessingSubtask request](self, "request");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setError:", *(_QWORD *)buf);

        }
        objc_autoreleasePoolPop(v13);
        if (!v14)
        {

          goto LABEL_25;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[MADServiceTextProcessingSubtask request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setResults:", v5);

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MADTextEmbeddingTask complete", buf, 2u);
  }
LABEL_25:
  v3 = v25;
LABEL_28:

  return 0;
}

@end
