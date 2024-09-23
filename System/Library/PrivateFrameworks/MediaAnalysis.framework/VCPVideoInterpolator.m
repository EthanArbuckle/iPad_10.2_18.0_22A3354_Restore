@implementation VCPVideoInterpolator

+ (BOOL)isEnabled
{
  return 0;
}

+ (BOOL)allowMultipleFormats
{
  return 0;
}

+ (int64_t)getFRCQualityMode
{
  return 0;
}

+ (void)sendPreGatedAnalytics
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D20B60];
  v6[0] = CFSTR("FRCGatingStatusField");
  v6[1] = v2;
  v7[0] = &unk_1E6B728D8;
  v7[1] = &unk_1E6B728D8;
  v3 = *MEMORY[0x1E0D20B58];
  v6[2] = CFSTR("FRCGatingCauseField");
  v6[3] = v3;
  v7[2] = &unk_1E6B728F0;
  v7[3] = &unk_1E6B728F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.livePhotoFillingGaps"), v4);

}

- (VCPVideoInterpolator)initWithTimestamps:(id)a3 andIdentifier:(id)a4 andTrack:(id)a5
{
  id v8;
  id v9;
  char *v10;
  VCPVideoInterpolator *v11;
  char v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  char *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  CMTimeEpoch epoch;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  _BYTE *v64;
  uint64_t v66;
  uint64_t i;
  void *v68;
  id v69;
  const __CFDictionary *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  id *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  BOOL v89;
  unint64_t v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  BOOL v95;
  BOOL v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  void *v101;
  void *v102;
  __int128 v103;
  uint64_t v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  void *v112;
  CMTimeEpoch v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  void *v130;
  int v131;
  id *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t j;
  void *v136;
  uint64_t v137;
  float v138;
  float v139;
  void *v140;
  uint64_t v141;
  id v142;
  id v143;
  int v144;
  __int128 *v145;
  char *v146;
  char *v147;
  void *v148;
  id v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  char *v154;
  id obj;
  uint64_t v156;
  id v157;
  id v158;
  _OWORD v159[3];
  _OWORD v160[3];
  _OWORD v161[3];
  __int128 v162;
  uint64_t v163;
  CMTime duration;
  CMTime start;
  _QWORD v166[3];
  _QWORD v167[3];
  id v168;
  CMTime v169;
  CMTime v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _OWORD v175[3];
  __int128 v176;
  __int128 v177;
  __int128 v178;
  id v179;
  objc_super v180;
  CMTime rhs;
  CMTime lhs;
  CMTimeRange buf;
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v151 = a4;
  v9 = a5;
  v180.receiver = self;
  v180.super_class = (Class)VCPVideoInterpolator;
  v153 = v8;
  v10 = -[VCPVideoInterpolator init](&v180, sel_init);
  v154 = v10;
  if (v10)
  {
    v152 = v9;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v150, "fileExistsAtPath:", CFSTR("/tmp/com.apple.mediaanalysisd/")) & 1) != 0)
    {
      v149 = 0;
    }
    else
    {
      v179 = 0;
      v12 = objc_msgSend(v150, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1, 0, &v179);
      v149 = v179;
      if ((v12 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v149, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", (uint8_t *)&buf, 0xCu);

        }
        v11 = 0;
        goto LABEL_37;
      }
    }
    v158 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v157 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MetaAdjusterResults"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getFrameSize:", v9);
    v15 = objc_msgSend(MEMORY[0x1E0D20B80], "getUsageFromSizeWidth:height:", (unint64_t)v13, (unint64_t)v14);
    if (v15 == -1)
    {
      v18 = v10;
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      LOWORD(buf.start.value) = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Video resolution not supported";
LABEL_14:
      _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&buf, 2u);
LABEL_31:
      v62 = 0;
LABEL_34:
      v63 = 0;
      v64 = v18 + 336;
LABEL_35:
      *v64 = 1;
LABEL_36:
      v11 = v63;

LABEL_37:
      v9 = v152;
      goto LABEL_38;
    }
    objc_msgSend(v9, "segments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (unint64_t)objc_msgSend(v16, "count") > 1;

    if (v17)
    {
      v18 = v10;
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      LOWORD(buf.start.value) = 0;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Video with multiple edits not supported";
      goto LABEL_14;
    }
    v10[336] = 0;
    v10[338] = 0;
    v22 = *MEMORY[0x1E0CA2E50];
    v23 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    *(_OWORD *)(v10 + 356) = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)(v10 + 372) = v23;
    v145 = (__int128 *)(v10 + 340);
    *(_OWORD *)(v10 + 340) = v22;
    objc_storeStrong((id *)v10 + 24, a5);
    v24 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = 0;

    v25 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = 0;

    v26 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = 0;

    *((_QWORD *)v10 + 5) = 0;
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@frc-tmp-%@.MOV"), CFSTR("/tmp/com.apple.mediaanalysisd/"), v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v10 + 20);
    *((_QWORD *)v10 + 20) = v30;

    v32 = (void *)MEMORY[0x1E0CB3940];
    NSTemporaryDirectory();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "UUIDString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@frc-tmp-segment-%@.MOV"), v33, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v10 + 21);
    *((_QWORD *)v10 + 21) = v36;

    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("MetaSSResults"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v10 + 29);
    *((_QWORD *)v10 + 29) = v38;

    v10[337] = *((_QWORD *)v10 + 29) != 0;
    v40 = objc_alloc(MEMORY[0x1E0C8AFD0]);
    objc_msgSend(v9, "asset");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "initWithAsset:error:", v41, 0);
    v43 = (void *)*((_QWORD *)v10 + 40);
    *((_QWORD *)v10 + 40) = v42;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)*((_QWORD *)v10 + 41);
    *((_QWORD *)v10 + 41) = v44;

    objc_msgSend(v9, "asset");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      objc_msgSend(v46, "vcp_livePhotoStillDisplayTime");
    else
      memset(&buf, 0, 24);
    epoch = buf.start.epoch;
    *(_OWORD *)(v10 + 88) = *(_OWORD *)&buf.start.value;
    *((_QWORD *)v10 + 13) = epoch;

    v49 = MEMORY[0x1E0CA2E18];
    v50 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *((_OWORD *)v10 + 7) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v10 + 16) = v50;
    v51 = *(_QWORD *)(v49 + 16);
    *(_OWORD *)(v10 + 136) = *(_OWORD *)v49;
    v146 = v10 + 136;
    v147 = v10 + 112;
    *((_QWORD *)v10 + 19) = v51;
    v52 = objc_alloc_init(MEMORY[0x1E0D20B80]);
    v53 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v52;

    v54 = (void *)*((_QWORD *)v10 + 2);
    if (!v54)
      goto LABEL_32;
    if (v10[337])
    {
      objc_msgSend(v54, "setQualityMode:", 4);
      objc_msgSend(*((id *)v10 + 2), "setLowMemoryMode:", 1);
    }
    else
    {
      objc_msgSend(*((id *)v10 + 2), "setQualityMode:", +[VCPVideoInterpolator getFRCQualityMode](VCPVideoInterpolator, "getFRCQualityMode"));
    }
    if (v9)
    {
      objc_msgSend(v9, "preferredTransform");
    }
    else
    {
      v177 = 0u;
      v178 = 0u;
      v176 = 0u;
    }
    v55 = (void *)*((_QWORD *)v10 + 2);
    v175[0] = v176;
    v175[1] = v177;
    v175[2] = v178;
    objc_msgSend(v55, "setPreferredTransform:", v175);
    if (objc_msgSend(*((id *)v10 + 2), "startSessionWithUsage:", v15) == -22000)
    {
      v56 = objc_alloc(MEMORY[0x1E0C8AFD0]);
      objc_msgSend(v9, "asset");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v56, "initWithAsset:error:", v57, 0);
      v59 = (void *)*((_QWORD *)v10 + 22);
      *((_QWORD *)v10 + 22) = v58;

      *((_QWORD *)v10 + 26) = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = (void *)*((_QWORD *)v10 + 27);
      *((_QWORD *)v10 + 27) = v60;

      v18 = v10;
      if (objc_msgSend(v10, "findIntraFrameList:", v9))
        goto LABEL_31;
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      obj = v148;
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v184, 16);
      if (v66)
      {
        v156 = *(_QWORD *)v172;
        do
        {
          for (i = 0; i != v66; ++i)
          {
            if (*(_QWORD *)v172 != v156)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_alloc_init(MEMORY[0x1E0D20B90]);
            objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MetaItemPTSResultsKey"));
            v70 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            CMTimeMakeFromDictionary(&v170, v70);
            v169 = v170;
            objc_msgSend(v69, "setPresentationTimeStamp:", &v169);

            objc_msgSend(v158, "addObject:", v69);
            v71 = objc_alloc_init(MEMORY[0x1E0D20B88]);
            objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MetaOriginalPTSInNanosResults"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setOriginalPTSInNanos:", objc_msgSend(v72, "unsignedIntegerValue"));

            objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MetaPTSInNanosResults"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setPtsInNanos:", objc_msgSend(v73, "unsignedIntegerValue"));

            objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MetaAdjusterRecipeResults"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setSequenceAdjusterRecipe:", objc_msgSend(v74, "unsignedIntegerValue"));

            objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MetaAdjusterDisplacementKey"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setSequenceAdjusterDisplacement:", objc_msgSend(v75, "integerValue"));

            objc_msgSend(v157, "addObject:", v71);
          }
          v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v184, 16);
        }
        while (v66);
      }

      v76 = (void *)*((_QWORD *)v10 + 2);
      v168 = 0;
      objc_msgSend(v76, "selectFrameInsertionPointsFromTimingList:metadataList:withError:", v158, v157, &v168);
      v77 = objc_claimAutoreleasedReturnValue();
      v62 = v168;
      v78 = (void *)*((_QWORD *)v10 + 1);
      *((_QWORD *)v10 + 1) = v77;

      if (objc_msgSend(v62, "code") == -22006)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v79 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
          v63 = v10;
          if (!v79)
          {
LABEL_51:
            v64 = v10 + 336;
            goto LABEL_35;
          }
          objc_msgSend(v62, "localizedDescription");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v80;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FRC gating not passed: %@", (uint8_t *)&buf, 0xCu);

        }
        v63 = v10;
        goto LABEL_51;
      }
      if ((unint64_t)objc_msgSend(*((id *)v10 + 1), "count") >= 2)
      {
        v81 = (id *)v10;
        v82 = objc_msgSend(*((id *)v10 + 1), "count");
        v83 = 0;
        v84 = 0;
        do
        {
          if (v84 >= objc_msgSend(v81[1], "count"))
            break;
          objc_msgSend(v81[1], "objectAtIndexedSubscript:", v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v85;
          if (v85)
            objc_msgSend(v85, "presentationTimeStamp");
          else
            memset(v167, 0, sizeof(v167));
          v87 = objc_msgSend(v81, "isIntraFrame:", v167);
          v88 = objc_msgSend(v86, "numberOfFramesToInsert");
          if (v87)
            v83 = v84;
          v89 = v88 == 0;

          ++v84;
          v81 = (id *)v154;
        }
        while (v89);
        v90 = objc_msgSend(v81[1], "count");
        if (v90 > v83 + 1)
        {
          do
          {
            if (v90 < objc_msgSend(v81[1], "count"))
            {
              objc_msgSend(v81[1], "objectAtIndexedSubscript:", v90);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = v91;
              if (v91)
                objc_msgSend(v91, "presentationTimeStamp");
              else
                memset(v166, 0, sizeof(v166));
              v93 = objc_msgSend(v81, "isIntraFrame:", v166);

              if (v93)
                v82 = v90;
              v81 = (id *)v154;
            }
            objc_msgSend(v81[1], "objectAtIndexedSubscript:", v90 - 2);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend(v94, "numberOfFramesToInsert") == 0;

            v96 = --v90 > v83 + 1 && v95;
            v81 = (id *)v154;
          }
          while (v96);
        }
        objc_msgSend(v81[1], "objectAtIndexedSubscript:", v83);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v97;
        if (v97)
          objc_msgSend(v97, "presentationTimeStamp");
        else
          memset(&buf, 0, 24);
        v99 = *(_OWORD *)&buf.start.value;
        *((_QWORD *)v147 + 2) = buf.start.epoch;
        *(_OWORD *)v147 = v99;

        v18 = v154;
        if (v82 == objc_msgSend(*((id *)v154 + 1), "count"))
        {
          v100 = *MEMORY[0x1E0CA2E30];
          *((_QWORD *)v146 + 2) = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
          *(_OWORD *)v146 = v100;
        }
        else
        {
          objc_msgSend(*((id *)v154 + 1), "objectAtIndexedSubscript:", v82);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v101;
          if (v101)
            objc_msgSend(v101, "presentationTimeStamp");
          else
            memset(&buf, 0, 24);
          v103 = *(_OWORD *)&buf.start.value;
          *((_QWORD *)v146 + 2) = buf.start.epoch;
          *(_OWORD *)v146 = v103;

          v18 = v154;
        }
        if (v82 - v83 < 2)
          goto LABEL_34;
        objc_msgSend(*((id *)v18 + 1), "subarrayWithRange:", v83);
        v104 = objc_claimAutoreleasedReturnValue();
        v105 = (void *)*((_QWORD *)v18 + 1);
        *((_QWORD *)v18 + 1) = v104;

        v106 = *(_OWORD *)v147;
        start.epoch = *((_QWORD *)v147 + 2);
        *(_OWORD *)&start.value = v106;
        v107 = *(_OWORD *)v146;
        lhs.epoch = *((_QWORD *)v146 + 2);
        *(_OWORD *)&lhs.value = v107;
        v108 = *(_OWORD *)v147;
        rhs.epoch = *((_QWORD *)v147 + 2);
        *(_OWORD *)&rhs.value = v108;
        CMTimeSubtract(&duration, &lhs, &rhs);
        CMTimeRangeMake(&buf, &start, &duration);
        v109 = *(_OWORD *)&buf.start.value;
        v110 = *(_OWORD *)&buf.duration.timescale;
        v145[1] = *(_OWORD *)&buf.start.epoch;
        v145[2] = v110;
        *v145 = v109;
        v18 = v154;
        if (v154[337])
        {
          v111 = *(_OWORD *)v147;
          v163 = *((_QWORD *)v147 + 2);
          v162 = v111;
          objc_msgSend(v152, "asset");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "getFramePTSAfter:forAsset:", &v162, v112);
          v113 = buf.start.epoch;
          *(_OWORD *)(v154 + 296) = *(_OWORD *)&buf.start.value;
          *((_QWORD *)v154 + 39) = v113;

          objc_msgSend(v152, "asset");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "findDeltaTrack:", v114);
          v115 = objc_claimAutoreleasedReturnValue();
          v116 = (void *)*((_QWORD *)v154 + 25);
          *((_QWORD *)v154 + 25) = v115;

          v117 = *((_QWORD *)v154 + 25);
          v118 = *v145;
          v119 = v145[2];
          v161[1] = v145[1];
          v161[2] = v119;
          v161[0] = v118;
          objc_msgSend(v154, "createDeltaTrackDecoder:timerange:", v117, v161);
          v120 = objc_claimAutoreleasedReturnValue();
          v121 = (void *)*((_QWORD *)v154 + 31);
          *((_QWORD *)v154 + 31) = v120;

          v122 = objc_msgSend(objc_alloc(MEMORY[0x1E0D08AD0]), "initWithOptionalMetalCommandQueue:useCase:", 0, 0);
          v123 = (void *)*((_QWORD *)v154 + 28);
          *((_QWORD *)v154 + 28) = v122;

          v18 = v154;
          v124 = (void *)*((_QWORD *)v154 + 40);
          v125 = *v145;
          v126 = v145[2];
          v160[1] = v145[1];
          v160[2] = v126;
          v160[0] = v125;
          objc_msgSend(v124, "setTimeRange:", v160);
          if (objc_msgSend(v154, "setupAdditionalAuxTrack"))
            goto LABEL_34;
        }
        v127 = (void *)*((_QWORD *)v18 + 22);
        v128 = *v145;
        v129 = v145[2];
        v159[1] = v145[1];
        v159[2] = v129;
        v159[0] = v128;
        objc_msgSend(v127, "setTimeRange:", v159);
        objc_msgSend(v152, "asset");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_msgSend(v18, "setupLivePhotoInfoOutput:", v130);

        if (!v131)
        {
          v132 = (id *)v154;
          v133 = objc_msgSend(obj, "count");
          v134 = 0;
          for (j = 0; j < objc_msgSend(v132[1], "count") - 1; ++j)
          {
            objc_msgSend(v132[1], "objectAtIndexedSubscript:", j);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_msgSend(v136, "numberOfFramesToInsert");

            v134 += v137;
            v132 = (id *)v154;
          }
          objc_msgSend(v152, "estimatedDataRate");
          v139 = v138;
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v132[20]);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          +[VCPMovieAssetWriter assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:](VCPMovieAssetWriter, "assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:", v140, v152, (uint64_t)fminf((float)(v139 * (float)(v134 + v133)) / (float)v133, 25000000.0), 1, *((unsigned __int8 *)v132 + 337), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          v141 = objc_claimAutoreleasedReturnValue();
          v142 = v132[6];
          v132[6] = (id)v141;

          v143 = v132[6];
          if (v143)
          {
            v18 = v154;
            v144 = objc_msgSend(v143, "dispatchEncoding");
            v63 = v154;
            if (!v144)
              goto LABEL_36;
            goto LABEL_34;
          }
        }
      }
    }
    else
    {
LABEL_32:
      v62 = 0;
    }
    v18 = v154;
    goto LABEL_34;
  }
  v11 = 0;
LABEL_38:

  return v11;
}

- (id)createDeltaTrackDecoder:(id)a3 timerange:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VCPVideoTrackStandardDecoder *v10;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 758670896);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 758674992);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0CA9040];
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPVideoTrackStandardDecoder initWithTrack:timerange:withSettings:applyTransform:]([VCPVideoTrackStandardDecoder alloc], "initWithTrack:timerange:withSettings:applyTransform:", v5, a4, v9, 0);

  return v10;
}

- (id)findDeltaTrack:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A8]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v3)
  {
    v20 = *MEMORY[0x1E0C8A910];
    v21 = *(_QWORD *)v28;
    v18 = *MEMORY[0x1E0C8A9F0];
    v19 = *MEMORY[0x1E0C8AAE8];
    do
    {
      v17 = v3;
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1E0C8B220];
        objc_msgSend(v5, "metadataForFormat:", v20, v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "metadataItemsFromArray:withKey:keySpace:", v7, v19, v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v24 != v11)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "stringValue");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map"));

                if ((v14 & 1) != 0)
                {
                  v15 = v5;

                  goto LABEL_21;
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v10)
                continue;
              break;
            }
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v15 = 0;
    }
    while (v3);
  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

- (id)findStyleInfoTrack:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "formatDescriptions", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "containsObject:", CFSTR("mdta/com.apple.quicktime.smartstyle-info")) & 1) != 0)
          {
            v4 = v7;

            goto LABEL_13;
          }

        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)findLivePhotoInfoOutput:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    v6 = *MEMORY[0x1E0D053E0];
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "formatDescriptions", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "containsObject:", v6) & 1) != 0)
          {
            v4 = v8;

            goto LABEL_13;
          }

        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (int)setupLivePhotoInfoOutput:(id)a3
{
  id v4;
  void *v5;
  AVAssetReaderTrackOutput *v6;
  AVAssetReaderTrackOutput *livePhotoInfoOutput;
  int v8;

  v4 = a3;
  -[VCPVideoInterpolator findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v5, 0);
  v6 = (AVAssetReaderTrackOutput *)objc_claimAutoreleasedReturnValue();
  livePhotoInfoOutput = self->_livePhotoInfoOutput;
  self->_livePhotoInfoOutput = v6;

  if (-[AVAssetReader canAddOutput:](self->_assetReader, "canAddOutput:", self->_livePhotoInfoOutput))
  {
    -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_livePhotoInfoOutput);
    if (-[AVAssetReader startReading](self->_assetReader, "startReading"))
      v8 = 0;
    else
      v8 = -19;
  }
  else
  {
    v8 = -18;
  }

  return v8;
}

- (int)findIntraFrameList:(id)a3
{
  void *v3;
  FourCharCode MediaSubType;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *intraFrameList;
  CFDictionaryRef v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id obj;
  opaqueCMSampleBuffer *sbuf;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTime time;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "formatDescriptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count") == 1)
  {
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v3);
    v5 = objc_alloc(MEMORY[0x1E0C8AFD0]);
    objc_msgSend(v24, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v5, "initWithAsset:error:", v6, 0);

    objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "canAddOutput:") & 1) != 0)
    {
      objc_msgSend(v22, "addOutput:", v25);
      if (objc_msgSend(v22, "startReading"))
      {
        v7 = *MEMORY[0x1E0CA25F8];
        v8 = *MEMORY[0x1E0CA25C8];
        while (1)
        {
          v9 = (opaqueCMSampleBuffer *)objc_msgSend(v25, "copyNextSampleBuffer", v22);
          v10 = v9;
          if (!v9)
            break;
          sbuf = v9;
          if (CMSampleBufferGetNumSamples(v9))
          {
            CMSampleBufferGetSampleAttachmentsArray(v10, 1u);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            obj = v11;
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v31;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v31 != v13)
                    objc_enumerationMutation(obj);
                  v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                  objc_msgSend(v15, "objectForKeyedSubscript:", v7);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v8);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = v17;
                  if (MediaSubType == 1752589105 && v16
                    || MediaSubType != 1752589105 && v17 && !objc_msgSend(v17, "intValue"))
                  {
                    memset(&v29, 0, sizeof(v29));
                    CMSampleBufferGetOutputPresentationTimeStamp(&v29, sbuf);
                    intraFrameList = self->_intraFrameList;
                    time = v29;
                    v20 = CMTimeCopyAsDictionary(&time, 0);
                    -[NSMutableArray addObject:](intraFrameList, "addObject:", v20);

                  }
                }
                v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
              }
              while (v12);
            }

          }
          CFRelease(sbuf);
        }
      }
      else
      {
        LODWORD(v10) = -19;
      }
    }
    else
    {
      LODWORD(v10) = -18;
    }

  }
  else
  {
    LODWORD(v10) = -18;
  }

  return (int)v10;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *previousMetadata;
  opaqueCMSampleBuffer *previousDeltaSample;
  FRCFrameInterpolator *frameInterpolator;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (-[VCPMovieAssetWriter status](self->_assetWriter, "status") == 1)
    -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
  previousMetadata = self->_previousMetadata;
  if (previousMetadata)
  {
    CFRelease(previousMetadata);
    self->_previousMetadata = 0;
  }
  previousDeltaSample = self->_previousDeltaSample;
  if (previousDeltaSample)
  {
    CFRelease(previousDeltaSample);
    self->_previousDeltaSample = 0;
  }
  -[AVAssetReader cancelReading](self->_assetReader, "cancelReading");
  if (self->_processAborted)
  {
    frameInterpolator = self->_frameInterpolator;
    if (frameInterpolator)
      -[FRCFrameInterpolator endSession](frameInterpolator, "endSession");
  }
  if (self->_cancelled)
  {
    v6 = *MEMORY[0x1E0D20B60];
    v15[0] = CFSTR("FRCGatingStatusField");
    v15[1] = v6;
    v16[0] = &unk_1E6B72908;
    v16[1] = &unk_1E6B72908;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FRCFrameInterpolator sessionStatistics](self->_frameInterpolator, "sessionStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D20B60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("FRCGatingStatusField"));

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D20B58]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("FRCGatingCauseField"));

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D20B68]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("FRCLivePhotoBurstDropDurationKeyField"));

    v7 = (void *)objc_msgSend(v9, "copy");
  }
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.livePhotoFillingGaps"), v7);

  v14.receiver = self;
  v14.super_class = (Class)VCPVideoInterpolator;
  -[VCPVideoInterpolator dealloc](&v14, sel_dealloc);
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  void *v9;
  void *v10;
  id *p_previousFrame;
  unint64_t anchorIndex;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  opaqueCMSampleBuffer *i;
  opaqueCMSampleBuffer **p_previousMetadata;
  CMItemCount NumSamples;
  opaqueCMSampleBuffer *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  opaqueCMSampleBuffer *v33;
  void *v34;
  void *v35;
  const __CFData *v36;
  __CVBuffer *v37;
  id v38;
  FRCFrame *v39;
  FRCFrame *previousUnstyledFrame;
  $95D729B680665BEAEFA1D6FCA8238556 *p_stillPTS;
  void *v42;
  void *v43;
  void *v44;
  VCPMovieAssetWriter *assetWriter;
  void *v46;
  void *v47;
  int v48;
  id v49;
  unint64_t v50;
  const __CFData *v51;
  __CVBuffer *v52;
  uint64_t v53;
  __CVBuffer *v54;
  void *v55;
  id v56;
  FRCFrame *v57;
  id v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  VCPMovieAssetWriter *v67;
  uint64_t v68;
  opaqueCMSampleBuffer *previousMetadata;
  VCPMovieAssetWriter *v70;
  CVImageBufferRef ImageBuffer;
  NSDictionary *previousSmartStyleMetadata;
  VCPMovieAssetWriter *v73;
  int32_t v74;
  NSMapTable *auxInputToOutputMap;
  void *v76;
  void *v77;
  opaqueCMSampleBuffer *v78;
  opaqueCMSampleBuffer *v79;
  opaqueCMSampleBuffer *v80;
  opaqueCMSampleBuffer *v81;
  void *v82;
  BOOL v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  opaqueCMSampleBuffer *v88;
  opaqueCMSampleBuffer *previousDeltaSample;
  int64_t var3;
  void *v91;
  void *v92;
  void *v93;
  BOOL v94;
  void *v95;
  void *v96;
  uint64_t j;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t k;
  void *v103;
  void *v104;
  void *v105;
  VCPMovieAssetWriter *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  opaqueCMSampleBuffer *v110;
  void *v111;
  void *v112;
  void *v113;
  CMISmartStyleUtilitiesV1 *smartStyleUtilities;
  NSDictionary *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  VCPMovieAssetWriter *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  VCPMovieAssetWriter *v126;
  NSObject *v127;
  id v128;
  void *v129;
  void *v130;
  int32_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
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
  $95D729B680665BEAEFA1D6FCA8238556 *p_nextAuxSamplePTS;
  id v148;
  void *v149;
  id v150;
  uint64_t v151;
  void *cf;
  char *cfa;
  __CVBuffer *cfb;
  void *v155;
  FRCFrameInterpolator *frameInterpolator;
  FRCFrameInterpolator *v157;
  id v158;
  $95D729B680665BEAEFA1D6FCA8238556 *p_anchorPTS;
  uint64_t v160;
  void *v161;
  CMSampleBufferRef sbuf;
  void *v163;
  void *v164;
  id obj;
  void *v166;
  id v167;
  id v168;
  void *v169;
  _BOOL4 v170;
  void *v171;
  id v172;
  id v173;
  id v174;
  id v175;
  CMTimeRange v176;
  CMTimeRange v177;
  CMTime v178;
  CMTime v179;
  _QWORD v180[3];
  _QWORD v181[3];
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[10];
  CMTime v185;
  CMTime v186;
  CMTime v187;
  CMTime v188;
  CMTime outputPresentationTimeStamp;
  CMTime v190;
  CMTime v191;
  CMTime v192;
  CMTime v193;
  CMTime v194;
  CMTimeRange v195;
  CMTimeRange v196;
  CMTime duration;
  CMTime start;
  _QWORD v199[3];
  _QWORD v200[3];
  _QWORD v201[3];
  _QWORD v202[3];
  uint64_t v203;
  id v204;
  id v205;
  CMTime v206;
  CMTime v207;
  __int128 v208;
  int64_t v209;
  CMTime v210;
  CMTime v211;
  __int128 v212;
  int64_t v213;
  __int128 v214;
  int64_t epoch;
  CMTime rhs;
  CMTime time2;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  _QWORD v222[2];
  _QWORD v223[2];
  _QWORD v224[2];
  _QWORD v225[2];
  _QWORD v226[2];
  _QWORD v227[2];
  _QWORD v228[2];
  CMTimeRange time1;
  uint64_t v230;
  _QWORD v231[4];

  v231[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1BCCA1B2C](self, a2, a3, a4, a5, a6);
  v10 = v9;
  if (self->_processAborted)
  {
    objc_autoreleasePoolPop(v9);
    return 0;
  }
  p_previousFrame = (id *)&self->_previousFrame;
  if (!self->_previousFrame)
  {
    -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "presentationTimeStamp");
    else
      memset(&time1, 0, 24);
    *(_OWORD *)&self->_anchorPTS.value = *(_OWORD *)&time1.start.value;
    self->_anchorPTS.epoch = time1.start.epoch;

    v20 = objc_alloc(MEMORY[0x1E0D20B70]);
    v214 = *(_OWORD *)&self->_anchorPTS.value;
    epoch = self->_anchorPTS.epoch;
    v21 = objc_msgSend(v20, "initWithBuffer:presentationTimeStamp:", a3, &v214);
    v22 = *p_previousFrame;
    *p_previousFrame = (id)v21;

    self->_anchorIndex = 0;
    for (i = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer");
          ;
          i = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer"))
    {
      p_previousMetadata = &self->_previousMetadata;
      self->_previousMetadata = i;
      if (!i)
        goto LABEL_29;
      NumSamples = CMSampleBufferGetNumSamples(i);
      v26 = *p_previousMetadata;
      if (NumSamples)
        break;
      if (v26)
      {
        CFRelease(v26);
        *p_previousMetadata = 0;
      }
    }
    if (!v26)
    {
LABEL_29:
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.start.value) = 0;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Inconsistent number of metadata and video frames";
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    CMSampleBufferGetOutputPresentationTimeStamp(&rhs, v26);
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
    time1.start.epoch = a4->var3;
    time2 = rhs;
    if (CMTimeCompare(&time1.start, &time2))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.start.value) = 0;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Inconsistent live photo info and video frame timestamp";
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (self->_enableStyle)
    {
      v33 = -[VCPVideoTrackDecoder copyNextSampleBuffer](self->_deltaTrackDecoder, "copyNextSampleBuffer");
      self->_previousDeltaSample = v33;
      if (!v33)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        LOWORD(time1.start.value) = 0;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Number of frames inconsistent with delta map samples";
        goto LABEL_32;
      }
      -[NSArray objectAtIndexedSubscript:](self->_smartStyleMetadata, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("attributes"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("MetaSSInfoResults"));
      v36 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v36, 2uLL, 0, 0);

      if (!v27)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        LOWORD(time1.start.value) = 0;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Missing metadata";
        goto LABEL_32;
      }
      v37 = -[VCPVideoInterpolator revertStyle:withMetadata:withDeltaMap:](self, "revertStyle:withMetadata:withDeltaMap:", a3, v27, CMSampleBufferGetImageBuffer(self->_previousDeltaSample));
      if (!v37)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LOWORD(time1.start.value) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to compute unstyled buffer", (uint8_t *)&time1, 2u);
        }
LABEL_34:
        v172 = 0;
        v28 = 0;
        v29 = -18;
LABEL_35:
        v30 = 1;
        goto LABEL_36;
      }
      objc_storeStrong((id *)&self->_previousSmartStyleMetadata, v27);
      v38 = objc_alloc(MEMORY[0x1E0D20B70]);
      v212 = *(_OWORD *)&self->_anchorPTS.value;
      v213 = self->_anchorPTS.epoch;
      v39 = (FRCFrame *)objc_msgSend(v38, "initWithBuffer:presentationTimeStamp:", v37, &v212);
      previousUnstyledFrame = self->_previousUnstyledFrame;
      self->_previousUnstyledFrame = v39;

      CFRelease(v37);
    }
    else
    {
      v27 = 0;
    }
    v172 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_35;
  }
  anchorIndex = self->_anchorIndex;
  if (anchorIndex + 1 >= -[NSArray count](self->_frameInsertionLists, "count"))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    LOWORD(time1.start.value) = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "FRC number of frames inconsistent with metadata";
    goto LABEL_32;
  }
  v14 = -[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer");
  if (!v14)
  {
LABEL_9:
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    LOWORD(time1.start.value) = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Inconsistent number of metadata and video frames";
LABEL_32:
    _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&time1, 2u);
LABEL_33:
    v27 = 0;
    goto LABEL_34;
  }
  v15 = (void *)v14;
  while (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v15))
  {
    CFRelease(v15);
    v15 = (void *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer");
    if (!v15)
      goto LABEL_9;
  }
  CMSampleBufferGetOutputPresentationTimeStamp(&rhs, (CMSampleBufferRef)v15);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
  time1.start.epoch = a4->var3;
  time2 = rhs;
  if (CMTimeCompare(&time1.start, &time2))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    LOWORD(time1.start.value) = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Inconsistent live photo info and video frame timestamp";
    goto LABEL_32;
  }
  -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
    objc_msgSend(v31, "presentationTimeStamp");
  else
    memset(&rhs, 0, sizeof(rhs));
  p_stillPTS = &self->_stillPTS;
  time1.start = rhs;
  time2 = (CMTime)self->_stillPTS;
  if (CMTimeCompare(&time1.start, &time2) < 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex + 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = v42;
    if (v42)
      objc_msgSend(v42, "presentationTimeStamp");
    else
      memset(&v211, 0, sizeof(v211));
    time1.start = v211;
    *(_OWORD *)&time2.value = *(_OWORD *)&p_stillPTS->value;
    time2.epoch = self->_stillPTS.epoch;
    v170 = CMTimeCompare(&time1.start, &time2) > 0;

    if (v170)
    {
      *(_OWORD *)&time1.start.value = *(_OWORD *)&self->_anchorPTS.value;
      time1.start.epoch = self->_anchorPTS.epoch;
      *(_OWORD *)&time2.value = *(_OWORD *)&p_stillPTS->value;
      time2.epoch = self->_stillPTS.epoch;
      CMTimeAdd(&v211, &time1.start, &time2);
      -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v43)
        objc_msgSend(v43, "presentationTimeStamp");
      else
        memset(&v210, 0, sizeof(v210));
      time1.start = v211;
      time2 = v210;
      CMTimeSubtract(&rhs, &time1.start, &time2);
      *(_OWORD *)&p_stillPTS->value = *(_OWORD *)&rhs.value;
      self->_stillPTS.epoch = rhs.epoch;

      assetWriter = self->_assetWriter;
      v208 = *(_OWORD *)&p_stillPTS->value;
      v209 = self->_stillPTS.epoch;
      -[VCPMovieAssetWriter updateStillPTS:](assetWriter, "updateStillPTS:", &v208);
    }
  }
  else
  {

  }
  -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v46;
  memset(&v211, 0, sizeof(v211));
  v47 = v46;
  if (v46)
    objc_msgSend(v46, "interpolatedFrameDuration");
  else
    memset(&time2, 0, sizeof(time2));
  v48 = objc_msgSend(v47, "numberOfFramesToInsert");
  time1.start = time2;
  CMTimeMultiply(&v211, &time1.start, v48 + 1);
  v49 = objc_alloc(MEMORY[0x1E0D20B70]);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&self->_anchorPTS.value;
  p_anchorPTS = &self->_anchorPTS;
  time1.start.epoch = self->_anchorPTS.epoch;
  time2 = v211;
  CMTimeAdd(&v207, &time1.start, &time2);
  obj = (id)objc_msgSend(v49, "initWithBuffer:presentationTimeStamp:", a3, &v207);
  if (!self->_enableStyle)
  {
    sbuf = 0;
    v27 = 0;
    v172 = 0;
LABEL_80:
    if (objc_msgSend(v171, "numberOfFramesToInsert"))
    {
      frameInterpolator = self->_frameInterpolator;
      v56 = *p_previousFrame;
      -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v205 = 0;
      -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:](frameInterpolator, "interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:", v56, obj, objc_msgSend(v163, "numberOfFramesToInsert"), &v205);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = v205;

      if (self->_enableStyle)
      {
        -[FRCFrameInterpolator pauseGatingForNextPair](self->_frameInterpolator, "pauseGatingForNextPair");
        v157 = self->_frameInterpolator;
        v57 = self->_previousUnstyledFrame;
        -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = v167;
        -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:](v157, "interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:", v57, v172, objc_msgSend(v155, "numberOfFramesToInsert"), &v204);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v204;

        v59 = v58;
      }
      else
      {
        v164 = 0;
        v59 = v167;
      }
      v168 = v59;
      if (objc_msgSend(v59, "code") == -22006)
      {
        self->_processAborted = 1;
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v168, "localizedDescription");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(time1.start.value) = 138412290;
          *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v64;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FRC gating not passed: %@", (uint8_t *)&time1, 0xCu);

        }
        -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
        CFRelease(v15);
        v28 = 0;
        v30 = 1;
        if (self->_enableStyle && sbuf)
        {
          CFRelease(sbuf);
          v28 = 0;
          v29 = 0;
        }
        else
        {
          v29 = 0;
        }
        goto LABEL_132;
      }
      v62 = v164;
      cf = v168;
      v63 = v161;
    }
    else
    {
      v62 = 0;
      v63 = 0;
      cf = 0;
    }
    v164 = v62;
    v151 = objc_msgSend(v63, "count");
    v203 = 0;
    v161 = v63;
    -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65)
      objc_msgSend(v65, "presentationTimeStamp");
    else
      memset(v202, 0, sizeof(v202));
    if (-[VCPVideoInterpolator isIntraFrame:](self, "isIntraFrame:", v202))
    {
      v230 = *MEMORY[0x1E0CA26A8];
      v231[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v231, &v230, 1);
      v158 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v158 = 0;
    }

    v67 = self->_assetWriter;
    v68 = objc_msgSend(*p_previousFrame, "buffer");
    if (*p_previousFrame)
      objc_msgSend(*p_previousFrame, "presentationTimeStamp");
    else
      memset(v201, 0, sizeof(v201));
    v28 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](v67, "addPixelBuffer:withTime:withAttachment:", v68, v201, v158);
    if (v28)
      goto LABEL_127;
    previousMetadata = self->_previousMetadata;
    if (*p_previousFrame)
      objc_msgSend(*p_previousFrame, "presentationTimeStamp");
    else
      memset(v200, 0, sizeof(v200));
    v28 = -[VCPVideoInterpolator updateLivePhotoInfoSample:withTimestamp:withMetadata:isInterpolated:updatedSample:](self, "updateLivePhotoInfoSample:withTimestamp:withMetadata:isInterpolated:updatedSample:", previousMetadata, v200, 0, 0, &v203);
    if (v28)
      goto LABEL_127;
    v28 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", v203);
    if (v28)
      goto LABEL_127;
    if (self->_enableStyle)
    {
      v70 = self->_assetWriter;
      ImageBuffer = CMSampleBufferGetImageBuffer(self->_previousDeltaSample);
      if (*p_previousFrame)
        objc_msgSend(*p_previousFrame, "presentationTimeStamp");
      else
        memset(v199, 0, sizeof(v199));
      v28 = -[VCPMovieAssetWriter addAuxPixelBuffer:withTime:withAttachment:](v70, "addAuxPixelBuffer:withTime:withAttachment:", ImageBuffer, v199, v158);
      if (v28)
        goto LABEL_127;
      memset(&time1, 0, sizeof(time1));
      if (*p_previousFrame)
        objc_msgSend(*p_previousFrame, "presentationTimeStamp");
      else
        memset(&start, 0, sizeof(start));
      CMTimeMake(&duration, 20, 600);
      CMTimeRangeMake(&time1, &start, &duration);
      previousSmartStyleMetadata = self->_previousSmartStyleMetadata;
      v196 = time1;
      -[VCPVideoInterpolator createStyleInforMetadata:timerange:](self, "createStyleInforMetadata:timerange:", previousSmartStyleMetadata, &v196);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = self->_assetWriter;
      v195 = time1;
      v28 = -[VCPMovieAssetWriter addStyleInfoData:timerange:](v73, "addStyleInfoData:timerange:", v144, &v195);
      if (v28)
        goto LABEL_143;
      time2 = (CMTime)self->_previousFrameOrigianlPTS;
      rhs = (CMTime)self->_nextAuxSamplePTS;
      p_nextAuxSamplePTS = &self->_nextAuxSamplePTS;
      v74 = CMTimeCompare(&time2, &rhs);
      auxInputToOutputMap = self->_auxInputToOutputMap;
      if (v74 < 0)
      {
        -[NSMapTable objectForKey:](auxInputToOutputMap, "objectForKey:", CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        while (1)
        {
          v80 = (opaqueCMSampleBuffer *)objc_msgSend(v149, "copyNextSampleBuffer");
          v81 = v80;
          if (!v80)
            goto LABEL_169;
          if (CMSampleBufferGetNumSamples(v80))
            break;
          CFRelease(v81);
        }
        if (*p_previousFrame)
          objc_msgSend(*p_previousFrame, "presentationTimeStamp");
        else
          memset(&v188, 0, sizeof(v188));
        CMSampleBufferSetOutputPresentationTimeStamp(v81, &v188);
        v28 = -[VCPMovieAssetWriter addAdditionalAuxTracks:toTrack:](self->_assetWriter, "addAdditionalAuxTracks:toTrack:", v81, CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail"));
        if (v28)
          goto LABEL_168;
      }
      else
      {
        -[NSMapTable keyEnumerator](auxInputToOutputMap, "keyEnumerator");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0;
        while (2)
        {
          objc_msgSend(v149, "nextObject");
          v169 = (void *)objc_claimAutoreleasedReturnValue();

          if (v169)
          {
            -[NSMapTable objectForKey:](self->_auxInputToOutputMap, "objectForKey:");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            while (1)
            {
              v78 = (opaqueCMSampleBuffer *)objc_msgSend(v77, "copyNextSampleBuffer");
              v79 = v78;
              if (!v78)
                goto LABEL_158;
              if (CMSampleBufferGetNumSamples(v78))
                break;
              CFRelease(v79);
            }
            CMSampleBufferGetDuration(&v193, v79);
            CMSampleBufferGetOutputPresentationTimeStamp(&v192, v79);
            time2 = v193;
            rhs = v192;
            CMTimeAdd(&v194, &time2, &rhs);
            *(_OWORD *)&time2.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
            time2.epoch = self->_nextAuxSamplePTS.epoch;
            rhs = v194;
            if (CMTimeCompare(&time2, &rhs) < 0)
            {
              CMSampleBufferGetDuration(&v191, v79);
              CMSampleBufferGetOutputPresentationTimeStamp(&v190, v79);
              time2 = v191;
              rhs = v190;
              CMTimeAdd(&v210, &time2, &rhs);
            }
            else
            {
              *(_OWORD *)&v210.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
              v210.epoch = self->_nextAuxSamplePTS.epoch;
            }
            *(_OWORD *)&p_nextAuxSamplePTS->value = *(_OWORD *)&v210.value;
            self->_nextAuxSamplePTS.epoch = v210.epoch;
            if (*p_previousFrame)
              objc_msgSend(*p_previousFrame, "presentationTimeStamp");
            else
              memset(&outputPresentationTimeStamp, 0, sizeof(outputPresentationTimeStamp));
            CMSampleBufferSetOutputPresentationTimeStamp(v79, &outputPresentationTimeStamp);
            v28 = -[VCPMovieAssetWriter addAdditionalAuxTracks:toTrack:](self->_assetWriter, "addAdditionalAuxTracks:toTrack:", v79, v169);
            if (!v28)
            {
LABEL_158:

              v76 = v169;
              continue;
            }

LABEL_168:
LABEL_143:

LABEL_127:
            self->_processAborted = 1;
            CFRelease(v15);
            if (sbuf)
              CFRelease(sbuf);
            -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
            v30 = 0;
            goto LABEL_130;
          }
          break;
        }
      }
LABEL_169:

    }
    if (v151)
    {
      v148 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[VCPVideoInterpolator deserializeMetadata:](self, "deserializeMetadata:", self->_previousMetadata);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      if (v146)
      {
        objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("trajectoryHomography"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v82 == 0;

        if (!v83)
        {
          v227[0] = *MEMORY[0x1E0D3A9F8];
          if (*p_previousFrame)
            objc_msgSend(*p_previousFrame, "presentationTimeStamp");
          else
            memset(&v187, 0, sizeof(v187));
          CMTimeToNSDictionary(&v187);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v228[0] = v91;
          v227[1] = *MEMORY[0x1E0D3A9F0];
          objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("trajectoryHomography"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v228[1] = v92;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v228, v227, 2);
          v138 = (void *)objc_claimAutoreleasedReturnValue();

          -[VCPVideoInterpolator deserializeMetadata:](self, "deserializeMetadata:", v15);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          if (v143)
          {
            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("trajectoryHomography"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v93 == 0;

            if (!v94)
            {
              v225[0] = *MEMORY[0x1E0D3A9F8];
              if (obj)
                objc_msgSend(obj, "presentationTimeStamp");
              else
                memset(&v186, 0, sizeof(v186));
              CMTimeToNSDictionary(&v186);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v226[0] = v95;
              v225[1] = *MEMORY[0x1E0D3A9F0];
              objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("trajectoryHomography"));
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v226[1] = v96;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v226, v225, 2);
              v137 = (void *)objc_claimAutoreleasedReturnValue();

              v224[0] = v138;
              v224[1] = v137;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 2);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              for (j = 0; j != v151; ++j)
              {
                objc_msgSend(v161, "objectAtIndexedSubscript:", j);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v98;
                if (v98)
                  objc_msgSend(v98, "presentationTimeStamp");
                else
                  memset(&v185, 0, sizeof(v185));
                CMTimeToNSDictionary(&v185);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v150, "addObject:", v100);

              }
              v101 = *MEMORY[0x1E0D3AA08];
              v222[0] = *MEMORY[0x1E0D3AA00];
              v222[1] = v101;
              v223[0] = MEMORY[0x1E0C9AAB0];
              v223[1] = MEMORY[0x1E0C9AAB0];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v223, v222, 2);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v184[9] = cf;
              ICFillHomographyGaps();
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              v168 = cf;

              if (objc_msgSend(v145, "count") == v151)
              {
                if (*p_previousFrame)
                  objc_msgSend(*p_previousFrame, "presentationTimeStamp");
                else
                  memset(&v184[6], 0, 24);
                if (obj)
                  objc_msgSend(obj, "presentationTimeStamp");
                else
                  memset(&v184[3], 0, 24);
                alInterpolateMetadataForGap();
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v142, "count") == v151)
                {
                  for (k = 0; k != v151; ++k)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v142, "objectAtIndexedSubscript:", k);
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "addEntriesFromDictionary:", v104);

                    objc_msgSend(v145, "objectAtIndexedSubscript:", k);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "addEntriesFromDictionary:", v105);

                    objc_msgSend(v148, "addObject:", v103);
                  }
                  cfa = 0;
                  v134 = *MEMORY[0x1E0CA26D0];
                  do
                  {
                    v220 = v134;
                    v221 = MEMORY[0x1E0C9AAB0];
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    v106 = self->_assetWriter;
                    objc_msgSend(v161, "objectAtIndexedSubscript:", cfa);
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    v107 = objc_msgSend(v139, "buffer");
                    objc_msgSend(v161, "objectAtIndexedSubscript:", cfa);
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    v109 = v108;
                    if (v108)
                      objc_msgSend(v108, "presentationTimeStamp");
                    else
                      memset(v184, 0, 24);
                    v28 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](v106, "addPixelBuffer:withTime:withAttachment:", v107, v184, v141);

                    if (v28)
                      goto LABEL_254;
                    v110 = self->_previousMetadata;
                    objc_msgSend(v161, "objectAtIndexedSubscript:", cfa);
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    v112 = v111;
                    if (v111)
                      objc_msgSend(v111, "presentationTimeStamp");
                    else
                      memset(v183, 0, sizeof(v183));
                    objc_msgSend(v148, "objectAtIndexedSubscript:", cfa);
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = -[VCPVideoInterpolator updateLivePhotoInfoSample:withTimestamp:withMetadata:isInterpolated:updatedSample:](self, "updateLivePhotoInfoSample:withTimestamp:withMetadata:isInterpolated:updatedSample:", v110, v183, v113, 1, &v203);

                    if (v28)
                      goto LABEL_254;
                    v28 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", v203);
                    if (v28)
                      goto LABEL_254;

                    ++cfa;
                  }
                  while ((char *)v151 != cfa);
                  if (!self->_enableStyle)
                  {
                    v30 = 0;
                    v28 = 0;
                    goto LABEL_256;
                  }
                  smartStyleUtilities = self->_smartStyleUtilities;
                  v115 = self->_previousSmartStyleMetadata;
                  if (*p_previousFrame)
                    objc_msgSend(*p_previousFrame, "presentationTimeStamp");
                  else
                    memset(v182, 0, sizeof(v182));
                  if (obj)
                    objc_msgSend(obj, "presentationTimeStamp");
                  else
                    memset(v181, 0, sizeof(v181));
                  -[CMISmartStyleUtilitiesV1 interpolateCoefficientsFromStartFrameMetadataDict:startFrameTime:endFrameMetadataDict:endFrameTime:frameTimesToInterpolate:](smartStyleUtilities, "interpolateCoefficientsFromStartFrameMetadataDict:startFrameTime:endFrameMetadataDict:endFrameTime:frameTimesToInterpolate:", v115, v182, v27, v181, v150);
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v141, "count") == v151)
                  {
                    v160 = 0;
                    while (1)
                    {
                      v218 = v134;
                      v219 = MEMORY[0x1E0C9AAB0];
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
                      v140 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v164, "objectAtIndexedSubscript:", v160);
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      v116 = objc_msgSend(v133, "buffer");
                      objc_msgSend(v161, "objectAtIndexedSubscript:", v160);
                      v132 = (void *)objc_claimAutoreleasedReturnValue();
                      v117 = objc_msgSend(v132, "buffer");
                      objc_msgSend(v141, "objectAtIndexedSubscript:", v160);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      cfb = -[VCPVideoInterpolator calculateDeltaforUnstyledFrame:styledFrame:withCoefficients:](self, "calculateDeltaforUnstyledFrame:styledFrame:withCoefficients:", v116, v117, v118);

                      v119 = self->_assetWriter;
                      objc_msgSend(v161, "objectAtIndexedSubscript:", v160);
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      v121 = v120;
                      if (v120)
                        objc_msgSend(v120, "presentationTimeStamp");
                      else
                        memset(v180, 0, sizeof(v180));
                      v28 = -[VCPMovieAssetWriter addAuxPixelBuffer:withTime:withAttachment:](v119, "addAuxPixelBuffer:withTime:withAttachment:", cfb, v180, v140);

                      if (v28)
                        goto LABEL_252;
                      if (cfb)
                        CFRelease(cfb);
                      memset(&time1, 0, sizeof(time1));
                      objc_msgSend(v161, "objectAtIndexedSubscript:", v160);
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      v123 = v122;
                      if (v122)
                        objc_msgSend(v122, "presentationTimeStamp");
                      else
                        memset(&v179, 0, sizeof(v179));
                      CMTimeMake(&v178, 20, 600);
                      CMTimeRangeMake(&time1, &v179, &v178);

                      objc_msgSend(v141, "objectAtIndexedSubscript:", v160);
                      v124 = (void *)objc_claimAutoreleasedReturnValue();
                      v177 = time1;
                      -[VCPVideoInterpolator createStyleInforMetadata:timerange:](self, "createStyleInforMetadata:timerange:", v124, &v177);
                      v125 = (void *)objc_claimAutoreleasedReturnValue();

                      v126 = self->_assetWriter;
                      v176 = time1;
                      v28 = -[VCPMovieAssetWriter addStyleInfoData:timerange:](v126, "addStyleInfoData:timerange:", v125, &v176);

                      if (v28)
                        goto LABEL_254;
                      if (v151 == ++v160)
                      {
                        v30 = 0;
                        v28 = 0;
                        goto LABEL_255;
                      }
                    }
                  }
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    v127 = MEMORY[0x1E0C81028];
                    v128 = MEMORY[0x1E0C81028];
                    v140 = v127;
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(time1.start.value) = 0;
                      v140 = (void *)MEMORY[0x1E0C81028];
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Missing metadata", (uint8_t *)&time1, 2u);
                    }
                    v28 = -18;
LABEL_252:

                    goto LABEL_254;
                  }
                  v28 = -18;
LABEL_254:
                  v30 = 60;
LABEL_255:

                }
                else
                {
                  v28 = 0;
                  v30 = 1;
                }
LABEL_256:

              }
              else
              {
                v28 = 0;
                v30 = 1;
              }

              if (v30)
              {
                if (v30 != 60)
                  goto LABEL_131;
LABEL_187:
                if (!v28)
                {
                  v30 = 0;
                  goto LABEL_131;
                }
                goto LABEL_188;
              }
              memset(&v210, 0, sizeof(v210));
              if (v171)
                objc_msgSend(v171, "interpolatedFrameDuration");
              else
                memset(&time2, 0, sizeof(time2));
              time1.start = time2;
              CMTimeMultiply(&v210, &time1.start, v151 + 1);
              *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
              time2.epoch = self->_anchorPTS.epoch;
              rhs = v210;
              CMTimeAdd(&time1.start, &time2, &rhs);
              *(_OWORD *)&p_anchorPTS->value = *(_OWORD *)&time1.start.value;
              self->_anchorPTS.epoch = time1.start.epoch;
              objc_msgSend(v161, "objectAtIndexedSubscript:", v151 - 1);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = v129;
              if (v129)
                objc_msgSend(v129, "presentationTimeStamp");
              else
                memset(&rhs, 0, sizeof(rhs));
              time1.start = rhs;
              *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
              time2.epoch = self->_anchorPTS.epoch;
              v131 = CMTimeCompare(&time1.start, &time2);

              if (v131 >= 0)
              {
                v28 = -18;
LABEL_188:
                cf = v168;
                goto LABEL_127;
              }
              cf = v168;
LABEL_182:
              ++self->_anchorIndex;
              objc_storeStrong((id *)&self->_previousFrame, obj);
              v88 = self->_previousMetadata;
              if (v88)
              {
                CFRelease(v88);
                self->_previousMetadata = 0;
              }
              self->_previousMetadata = (opaqueCMSampleBuffer *)v15;
              objc_storeStrong((id *)&self->_previousUnstyledFrame, v172);
              previousDeltaSample = self->_previousDeltaSample;
              if (previousDeltaSample)
              {
                CFRelease(previousDeltaSample);
                self->_previousDeltaSample = 0;
              }
              self->_previousDeltaSample = sbuf;
              objc_storeStrong((id *)&self->_previousSmartStyleMetadata, v27);
              var3 = a4->var3;
              *(_OWORD *)&self->_previousFrameOrigianlPTS.value = *(_OWORD *)&a4->var0;
              self->_previousFrameOrigianlPTS.epoch = var3;
              v168 = cf;
              goto LABEL_187;
            }
          }

        }
      }

      v28 = 0;
      v30 = 1;
LABEL_130:
      v168 = cf;
LABEL_131:

      v29 = -18;
LABEL_132:

      goto LABEL_133;
    }
    memset(&v210, 0, sizeof(v210));
    -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex + 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v84;
    if (v84)
      objc_msgSend(v84, "presentationTimeStamp");
    else
      memset(&rhs, 0, sizeof(rhs));
    -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (v86)
      objc_msgSend(v86, "presentationTimeStamp");
    else
      memset(&v194, 0, sizeof(v194));
    time1.start = rhs;
    time2 = v194;
    CMTimeSubtract(&v210, &time1.start, &time2);

    *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
    time2.epoch = self->_anchorPTS.epoch;
    rhs = v210;
    CMTimeAdd(&time1.start, &time2, &rhs);
    v28 = 0;
    *(_OWORD *)&p_anchorPTS->value = *(_OWORD *)&time1.start.value;
    self->_anchorPTS.epoch = time1.start.epoch;
    goto LABEL_182;
  }
  sbuf = -[VCPVideoTrackDecoder copyNextSampleBuffer](self->_deltaTrackDecoder, "copyNextSampleBuffer");
  if (!sbuf)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    LOWORD(time1.start.value) = 0;
    v60 = MEMORY[0x1E0C81028];
    v61 = "Number of frames inconsistent with delta map samples";
    goto LABEL_114;
  }
  v50 = self->_anchorIndex;
  if (v50 + 1 >= -[NSArray count](self->_smartStyleMetadata, "count"))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    LOWORD(time1.start.value) = 0;
    v60 = MEMORY[0x1E0C81028];
    v61 = "Number of frames inconsistent with smart style metadata";
    goto LABEL_114;
  }
  -[NSArray objectAtIndexedSubscript:](self->_smartStyleMetadata, "objectAtIndexedSubscript:", self->_anchorIndex + 1);
  v174 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("attributes"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("MetaSSInfoResults"));
  v51 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v51, 2uLL, 0, 0);

  if (!v27)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    LOWORD(time1.start.value) = 0;
    v60 = MEMORY[0x1E0C81028];
    v61 = "Missing metadata";
LABEL_114:
    _os_log_impl(&dword_1B6C4A000, v60, OS_LOG_TYPE_ERROR, v61, (uint8_t *)&time1, 2u);
LABEL_115:
    v27 = 0;
    goto LABEL_116;
  }
  v52 = -[VCPVideoInterpolator revertStyle:withMetadata:withDeltaMap:](self, "revertStyle:withMetadata:withDeltaMap:", a3, v27, CMSampleBufferGetImageBuffer(sbuf));
  if (v52)
  {
    v175 = objc_alloc(MEMORY[0x1E0D20B70]);
    *(_OWORD *)&time1.start.value = *(_OWORD *)&p_anchorPTS->value;
    time1.start.epoch = self->_anchorPTS.epoch;
    time2 = v211;
    CMTimeAdd(&v206, &time1.start, &time2);
    v53 = objc_msgSend(v175, "initWithBuffer:presentationTimeStamp:", v52, &v206);
    v54 = v52;
    v55 = (void *)v53;
    CFRelease(v54);
    v172 = v55;
    goto LABEL_80;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(time1.start.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to compute unstyled buffer", (uint8_t *)&time1, 2u);
  }
LABEL_116:
  v172 = 0;
  v28 = 0;
  v29 = -18;
  v30 = 1;
LABEL_133:

LABEL_36:
  objc_autoreleasePoolPop(v10);
  if (v30)
    return v29;
  else
    return v28;
}

- (BOOL)isIntraFrame:(id *)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  CMTime v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTime time2;
  CMTime time1;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_intraFrameList;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        CMTimeMakeFromDictionary(&v10, *(CFDictionaryRef *)(*((_QWORD *)&v11 + 1) + 8 * i));
        time1 = v10;
        time2 = (CMTime)*a3;
        if (!CMTimeCompare(&time1, &time2))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)deserializeMetadata:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[16];
  uint64_t v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3B0]), "initWithSampleBuffer:", a3);
  objc_msgSend(v17, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v19 = v5;
    v6 = 0;
    v21 = *(_QWORD *)v27;
    v20 = *MEMORY[0x1E0D053A8];
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "dataType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v20);

        if (v10)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          objc_msgSend(v8, "dataValue");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v22, "bytes");
          objc_msgSend(v22, "length");
          v25 = 0;
          v24 = 0;
          v12 = FigLivePhotoMetadataComputeDeserializationSize();
          if (v12)
          {
            v6 = v12;
            v13 = v22;
          }
          else
          {
            v13 = v22;
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "FigLivePhotoMetadataVersion >= 3 is required", buf, 2u);
            }
            v6 = -50;
          }

          goto LABEL_19;
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v19)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_19:

  if (v6)
    v14 = 0;
  else
    v14 = v4;
  v15 = v14;

  return v15;
}

- (id)createStyleInforMetadata:(id)a3 timerange:(id *)a4
{
  id v5;
  void *v6;
  CFDataRef Data;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  __int128 v10;
  int64_t var3;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  objc_msgSend(v6, "setValue:", Data);

  objc_msgSend(v6, "setIdentifier:", CFSTR("mdta/com.apple.quicktime.smartstyle-info"));
  objc_msgSend(v6, "setDataType:", *MEMORY[0x1E0CA2440]);
  v10 = *(_OWORD *)&a4->var0.var0;
  var3 = a4->var0.var3;
  objc_msgSend(v6, "setTime:", &v10);
  var1 = a4->var1;
  objc_msgSend(v6, "setDuration:", &var1);

  return v6;
}

- (int)updateLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3 withTimestamp:(id *)a4 withMetadata:(id)a5 isInterpolated:(BOOL)a6 updatedSample:(opaqueCMSampleBuffer *)a7
{
  id v10;
  OpaqueCMBlockBuffer *DataBuffer;
  uint64_t *v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  void *v26;
  size_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  __int16 v32;
  size_t v33;
  unsigned int *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unsigned int v44;
  unsigned int v45;
  void *v46;
  void *v47;
  unsigned int v48;
  unsigned int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unsigned int v55;
  unsigned int v56;
  void *v57;
  void *v58;
  unsigned int v59;
  unsigned int v60;
  void *v61;
  void *v62;
  unsigned int v63;
  unsigned int v64;
  void *v65;
  void *v66;
  unsigned int v67;
  unsigned int v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  uint64_t i;
  void *v77;
  unsigned int v78;
  unsigned int v79;
  const __CFAllocator *v80;
  void *v81;
  CMBlockBufferRef v82;
  BOOL v83;
  __int128 v84;
  CMTimeEpoch v85;
  __int128 v86;
  CMTimeEpoch var3;
  BOOL v88;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v90;
  opaqueCMSampleBuffer **v91;
  void *memoryBlock;
  uint64_t v93;
  _BOOL4 v94;
  const opaqueCMFormatDescription *formatDescription;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  CMBlockBufferRef blockBufferOut;
  uint64_t v99;
  char *dataPointerOut;
  size_t totalLengthOut;
  size_t lengthAtOffsetOut[2];

  v94 = a6;
  v10 = a5;
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  formatDescription = CMSampleBufferGetFormatDescription(a3);
  totalLengthOut = 0;
  lengthAtOffsetOut[0] = 0;
  dataPointerOut = 0;
  CMBlockBufferGetDataPointer(DataBuffer, 0, lengthAtOffsetOut, &totalLengthOut, &dataPointerOut);
  v99 = 0;
  if (!dataPointerOut)
  {
    v19 = -18;
    goto LABEL_65;
  }
  v12 = (uint64_t *)MEMORY[0x1E0D053E0];
  v13 = 0;
  if (!totalLengthOut)
  {
LABEL_14:
    v90 = a4;
    v91 = a7;
    blockBufferOut = 0;
    memoryBlock = malloc_type_malloc(v13, 0xAC5BED95uLL);
    bzero(memoryBlock, v13);
    if (totalLengthOut)
    {
      v22 = 0;
      v23 = *v12;
      v93 = v23;
      v24 = (unsigned int *)memoryBlock;
      do
      {
        v25 = *(_DWORD *)&dataPointerOut[v22];
        FigMetadataFormatDescriptionGetIdentifierForLocalID();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = bswap32(v25);
        if (objc_msgSend(v26, "isEqualToString:", v23))
        {
          if (v94)
          {
            *v24 = bswap32(v99 + 8);
            v24[1] = *(_DWORD *)&dataPointerOut[v22 + 4];
            v24[2] = 3;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privET"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privET"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "floatValue");
              v31 = v30;

              v24[3] = v31;
              v32 = 1;
            }
            else
            {
              v32 = 0;
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privAFS"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privAFS"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "longValue");
              v32 |= 2u;

              *((_QWORD *)v24 + 2) = v38;
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privECMVct"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privECMVct"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "count");

              if (v41 == 2)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privECMVct"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "floatValue");
                v45 = v44;

                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privECMVct"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "floatValue");
                v49 = v48;
                v32 |= 4u;

                v24[6] = v45;
                v24[7] = v49;
              }
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "count");

              if (v52 == 2)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "floatValue");
                v56 = v55;

                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "floatValue");
                v60 = v59;
                v32 |= 8u;

                v24[8] = v56;
                v24[9] = v60;
              }
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privTZF"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if (v61)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privTZF"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "floatValue");
              v64 = v63;
              v32 |= 0x10u;

              v24[10] = v64;
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (v65)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privImgG"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "floatValue");
              v68 = v67;
              v32 |= 0x20u;

              v24[11] = v68;
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privAFSt"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privAFSt"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = objc_msgSend(v70, "intValue");
              v32 |= 0x40u;

              *((_BYTE *)v24 + 48) = v71;
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privFM"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            if (v72)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privFM"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend(v73, "intValue");
              v32 |= 0x80u;

              *((_BYTE *)v24 + 49) = v74;
            }
            *((_WORD *)v24 + 25) = v32;
            *(_QWORD *)(v24 + 15) = 0;
            *(_QWORD *)(v24 + 13) = 0;
            v24[17] = 0;
            *((_WORD *)v24 + 36) = 33;
            objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F0]);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v75, "count") != 9)
            {

              v19 = -18;
              v81 = memoryBlock;
LABEL_56:
              v82 = blockBufferOut;
              goto LABEL_57;
            }
            for (i = 0; i != 9; ++i)
            {
              objc_msgSend(v75, "objectAtIndexedSubscript:", i);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "floatValue");
              v79 = v78;

              v24[i + 19] = v79;
            }
            *((_BYTE *)v24 + 130) = 1;

            v23 = v93;
          }
          else
          {
            memcpy(v24, &dataPointerOut[v22], v27);
            v34 = &v24[8 * v24[13]];
            v35 = (uint64_t)&v34[8 * v34[15] + 14 + 8 * v34[14] + 8 * v34[16] + 8 * v34[17]];
            *(_WORD *)(v35 + 16) |= 0x20u;
            *(_BYTE *)(v35 + 74) = 0;
          }
          v33 = v99 + 8;
        }
        else
        {
          memcpy(v24, &dataPointerOut[v22], v27);
          v33 = v27;
        }
        v22 += v27;
        v24 = (unsigned int *)((char *)v24 + v33);

      }
      while (v22 < totalLengthOut);
    }
    v80 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v81 = memoryBlock;
    v19 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], memoryBlock, v13, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, v13, 0, &blockBufferOut);
    v82 = blockBufferOut;
    if (v19)
      v83 = 1;
    else
      v83 = blockBufferOut == 0;
    if (!v83)
    {
      v84 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v84;
      v85 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v86 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v86;
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)&v90->var0;
      var3 = v90->var3;
      sampleTimingArray.decodeTimeStamp.epoch = v85;
      sampleTimingArray.presentationTimeStamp.epoch = var3;
      sampleSizeArray = CMBlockBufferGetDataLength(blockBufferOut);
      v19 = CMSampleBufferCreate(v80, blockBufferOut, 1u, 0, 0, formatDescription, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, v91);
      goto LABEL_56;
    }
LABEL_57:
    if (v19)
      v88 = v82 == 0;
    else
      v88 = 0;
    if (v88)
    {
      free(v81);
    }
    else if (v82)
    {
      CFRelease(v82);
    }
    goto LABEL_65;
  }
  v14 = 0;
  v15 = *MEMORY[0x1E0D053E0];
  while (1)
  {
    v16 = *(_DWORD *)&dataPointerOut[v14];
    FigMetadataFormatDescriptionGetIdentifierForLocalID();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = bswap32(v16);
    if (!objc_msgSend(v17, "isEqualToString:", v15))
    {
      v21 = v18;
      goto LABEL_13;
    }
    if (*(_DWORD *)&dataPointerOut[v14 + 8] <= 2u)
      break;
    if (v94)
    {
      v19 = FigLivePhotoMetadataComputeSerializationSizeV3();
      if (v19)
        goto LABEL_64;
      v20 = v99;
      if (v99 != 136)
      {
        v19 = -18;
        goto LABEL_64;
      }
    }
    else
    {
      v20 = (v18 - 8);
      v99 = v20;
    }
    v21 = v20 + 8;
LABEL_13:
    v13 += v21;
    v14 += v18;

    if (v14 >= totalLengthOut)
      goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(sampleTimingArray.duration.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "FigLivePhotoMetadataVersion >= 3 is required", (uint8_t *)&sampleTimingArray, 2u);
  }
  v19 = -50;
LABEL_64:

LABEL_65:
  return v19;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  VCPMovieAssetWriter *assetWriter;
  uint64_t v14;
  FRCFrame *previousFrame;
  opaqueCMSampleBuffer *previousMetadata;
  FRCFrame *v17;
  opaqueCMSampleBuffer *v18;
  FRCFrame *v20;
  NSDictionary *previousSmartStyleMetadata;
  VCPMovieAssetWriter *v22;
  CVImageBufferRef ImageBuffer;
  FRCFrame *v24;
  VCPMovieAssetWriter *v25;
  int32_t v26;
  NSMapTable *auxInputToOutputMap;
  void *v28;
  void *v29;
  void *v30;
  opaqueCMSampleBuffer *v31;
  opaqueCMSampleBuffer *v32;
  $95D729B680665BEAEFA1D6FCA8238556 *v33;
  FRCFrame *v34;
  int v35;
  opaqueCMSampleBuffer *v36;
  opaqueCMSampleBuffer *v37;
  FRCFrame *v38;
  $95D729B680665BEAEFA1D6FCA8238556 *p_nextAuxSamplePTS;
  void *v40;
  CMTime v41;
  CMTime outputPresentationTimeStamp;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  CMTimeRange v49;
  _QWORD v50[3];
  CMTimeRange v51;
  CMTime duration;
  CMTime start;
  CMTimeRange v54;
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  uint64_t v58;
  CMTime time2;
  CMTime time1;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v63 = *MEMORY[0x1E0CA26A0];
  v4 = MEMORY[0x1E0C9AAB0];
  v64[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[NSArray objectAtIndexedSubscript:](self->_frameInsertionLists, "objectAtIndexedSubscript:", self->_anchorIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "presentationTimeStamp");
  else
    memset(v57, 0, sizeof(v57));
  v9 = -[VCPVideoInterpolator isIntraFrame:](self, "isIntraFrame:", v57);

  if (v9)
  {
    v61 = *MEMORY[0x1E0CA26A8];
    v62 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v10);

  }
  if (self->_processAborted)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_18;
  }
  assetWriter = self->_assetWriter;
  v14 = -[FRCFrame buffer](self->_previousFrame, "buffer");
  previousFrame = self->_previousFrame;
  if (previousFrame)
    -[FRCFrame presentationTimeStamp](previousFrame, "presentationTimeStamp");
  else
    memset(v56, 0, sizeof(v56));
  v12 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](assetWriter, "addPixelBuffer:withTime:withAttachment:", v14, v56, v6);
  if (v12)
    goto LABEL_17;
  previousMetadata = self->_previousMetadata;
  v17 = self->_previousFrame;
  if (v17)
    -[FRCFrame presentationTimeStamp](v17, "presentationTimeStamp");
  else
    memset(v55, 0, sizeof(v55));
  v12 = -[VCPVideoInterpolator updateLivePhotoInfoSample:withTimestamp:withMetadata:isInterpolated:updatedSample:](self, "updateLivePhotoInfoSample:withTimestamp:withMetadata:isInterpolated:updatedSample:", previousMetadata, v55, 0, 0, &v58);
  if (v12
    || (v12 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", v58)) != 0)
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (!self->_enableStyle)
  {
    v11 = 0;
    goto LABEL_28;
  }
  memset(&v54, 0, sizeof(v54));
  v20 = self->_previousFrame;
  if (v20)
    -[FRCFrame presentationTimeStamp](v20, "presentationTimeStamp");
  else
    memset(&start, 0, sizeof(start));
  CMTimeMake(&duration, 20, 600);
  CMTimeRangeMake(&v54, &start, &duration);
  previousSmartStyleMetadata = self->_previousSmartStyleMetadata;
  v51 = v54;
  -[VCPVideoInterpolator createStyleInforMetadata:timerange:](self, "createStyleInforMetadata:timerange:", previousSmartStyleMetadata, &v51);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_assetWriter;
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_previousDeltaSample);
  v24 = self->_previousFrame;
  if (v24)
    -[FRCFrame presentationTimeStamp](v24, "presentationTimeStamp");
  else
    memset(v50, 0, sizeof(v50));
  v12 = -[VCPMovieAssetWriter addAuxPixelBuffer:withTime:withAttachment:](v22, "addAuxPixelBuffer:withTime:withAttachment:", ImageBuffer, v50, v6);
  if (v12)
    goto LABEL_18;
  v25 = self->_assetWriter;
  v49 = v54;
  v12 = -[VCPMovieAssetWriter addStyleInfoData:timerange:](v25, "addStyleInfoData:timerange:", v11, &v49);
  if (v12)
    goto LABEL_18;
  time1 = (CMTime)self->_previousFrameOrigianlPTS;
  time2 = (CMTime)self->_nextAuxSamplePTS;
  v26 = CMTimeCompare(&time1, &time2);
  auxInputToOutputMap = self->_auxInputToOutputMap;
  if (v26 < 0)
  {
    -[NSMapTable objectForKey:](auxInputToOutputMap, "objectForKey:", CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v36 = (opaqueCMSampleBuffer *)objc_msgSend(v40, "copyNextSampleBuffer");
      v37 = v36;
      if (!v36)
        goto LABEL_68;
      if (CMSampleBufferGetNumSamples(v36))
      {
        v38 = self->_previousFrame;
        if (v38)
          -[FRCFrame presentationTimeStamp](v38, "presentationTimeStamp");
        else
          memset(&v41, 0, sizeof(v41));
        CMSampleBufferSetOutputPresentationTimeStamp(v37, &v41);
        v12 = -[VCPMovieAssetWriter addAdditionalAuxTracks:toTrack:](self->_assetWriter, "addAdditionalAuxTracks:toTrack:", v37, CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail"));
        if (!v12)
          goto LABEL_68;
        goto LABEL_67;
      }
      CFRelease(v37);
    }
  }
  p_nextAuxSamplePTS = &self->_nextAuxSamplePTS;
  -[NSMapTable keyEnumerator](auxInputToOutputMap, "keyEnumerator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  while (2)
  {
    objc_msgSend(v40, "nextObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
LABEL_68:

LABEL_28:
      if (-[VCPMovieAssetWriter finish](self->_assetWriter, "finish"))
      {
        v12 = -18;
      }
      else
      {
        if (self->_enableStyle)
          v35 = -[VCPVideoInterpolator combineVideoSegmentsWithAssetWriter](self, "combineVideoSegmentsWithAssetWriter");
        else
          v35 = -[VCPVideoInterpolator combineVideoSegments](self, "combineVideoSegments");
        v12 = v35;
        if (!v35)
        {
          if (-[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession") == -22000)
            v12 = 0;
          else
            v12 = -18;
        }
      }
      goto LABEL_18;
    }
    -[NSMapTable objectForKey:](self->_auxInputToOutputMap, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v31 = (opaqueCMSampleBuffer *)objc_msgSend(v30, "copyNextSampleBuffer");
      v32 = v31;
      if (!v31)
        goto LABEL_50;
      if (CMSampleBufferGetNumSamples(v31))
        break;
      CFRelease(v32);
    }
    CMSampleBufferGetDuration(&v46, v32);
    CMSampleBufferGetOutputPresentationTimeStamp(&v45, v32);
    time1 = v46;
    time2 = v45;
    CMTimeAdd(&v47, &time1, &time2);
    *(_OWORD *)&time1.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
    time1.epoch = self->_nextAuxSamplePTS.epoch;
    time2 = v47;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMSampleBufferGetDuration(&v44, v32);
      CMSampleBufferGetOutputPresentationTimeStamp(&v43, v32);
      time1 = v44;
      time2 = v43;
      CMTimeAdd(&v48, &time1, &time2);
      v33 = &self->_nextAuxSamplePTS;
    }
    else
    {
      v33 = &self->_nextAuxSamplePTS;
      *(_OWORD *)&v48.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
      v48.epoch = self->_nextAuxSamplePTS.epoch;
    }
    *(CMTime *)v33 = v48;
    v34 = self->_previousFrame;
    if (v34)
      -[FRCFrame presentationTimeStamp](v34, "presentationTimeStamp");
    else
      memset(&outputPresentationTimeStamp, 0, sizeof(outputPresentationTimeStamp));
    CMSampleBufferSetOutputPresentationTimeStamp(v32, &outputPresentationTimeStamp);
    v12 = -[VCPMovieAssetWriter addAdditionalAuxTracks:toTrack:](self->_assetWriter, "addAdditionalAuxTracks:toTrack:", v32, v29);
    if (!v12)
    {
LABEL_50:

      v28 = v29;
      continue;
    }
    break;
  }

LABEL_67:
LABEL_18:
  v18 = self->_previousMetadata;
  if (v18)
  {
    CFRelease(v18);
    self->_previousMetadata = 0;
  }
  if (v12)
  {
    self->_processAborted = 1;
    if (-[VCPMovieAssetWriter status](self->_assetWriter, "status") == 1)
      -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
  }

  return v12;
}

- (int)combineVideoSegments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;
  __int128 *v33;
  void *v34;
  unint64_t i;
  void *v36;
  unint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  unint64_t k;
  void *v42;
  void *v43;
  char v44;
  AVAssetTrack *originalTrack;
  NSObject *v46;
  const char *v47;
  CMTimeRange *p_buf;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _OWORD v69[3];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CMTimeRange v73;
  CMTimeRange v74;
  CMTimeRange v75;
  CMTimeRange v76;
  __int128 v77;
  uint64_t v78;
  CMTimeRange v79;
  __int128 v80;
  uint64_t v81;
  CMTimeRange v82;
  CMTime duration;
  CMTime start;
  CMTimeRange buf;
  CMTime v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  int64_t v90;
  CMTime v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  int64_t v95;
  __int128 v96;
  int64_t v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  int64_t v103;
  __int128 v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  __int128 v110;
  int64_t v111;
  __int128 v112;
  uint64_t v113;
  CMTime v114;
  __int128 v115;
  int64_t epoch;
  CMTime v117;
  CMTime v118;
  CMTime v119;
  CMTime rhs;

  -[AVAssetTrack asset](self->_originalTrack, "asset");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C8B3C0];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_filePath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B280]), "initWithSettingsFromMovie:options:error:", 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", self->_combinedFilePath);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", self->_combinedFilePath, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", self->_combinedFilePath, 0, 0);

  if ((v11 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating final movie file", (uint8_t *)&buf, 2u);
    }
    v28 = -18;
    goto LABEL_32;
  }
  v12 = objc_alloc(MEMORY[0x1E0C8B1E0]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_combinedFilePath);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithURL:options:", v13, 0);
  objc_msgSend(v6, "setDefaultMediaDataStorage:", v14);

  objc_msgSend(v5, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", v15);

  v16 = *MEMORY[0x1E0C8A808];
  objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCPVideoInterpolator findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v68);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPVideoInterpolator findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v67 || !v65 || !v64)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error getting video or metadata track", (uint8_t *)&buf, 2u);
    }
    v28 = -18;
    goto LABEL_31;
  }
  objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracksWithMediaType:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMutableTracksCopyingSettingsFromTracks:options:", v18, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMetadata:", v19);

  objc_msgSend(v6, "addMutableTracksCopyingSettingsFromTracks:options:", v62, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMutableTracksCopyingSettingsFromTracks:options:", v66, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63 || !objc_msgSend(v63, "count") || !v61 || !objc_msgSend(v61, "count") || !v60 || !objc_msgSend(v60, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating output track", (uint8_t *)&buf, 2u);
    }
    v28 = -18;
    goto LABEL_30;
  }
  v21 = 0;
  v22 = *MEMORY[0x1E0D053E0];
  while (1)
  {
    if (v21 >= objc_msgSend(v66, "count"))
    {
      v21 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v66, "objectAtIndexedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "formatDescriptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", v22);

      if ((v27 & 1) != 0)
        break;
    }

    ++v21;
  }

LABEL_35:
  objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectAtIndexedSubscript:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v68, 0);
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", self->_originalTrack, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v65, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v59, "canAddOutput:", v58) & 1) == 0
    || (objc_msgSend(v59, "addOutput:", v58), !objc_msgSend(v59, "canAddOutput:", v57)))
  {
    v28 = -18;
    goto LABEL_50;
  }
  objc_msgSend(v59, "addOutput:", v57);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v5, 0);
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v67, 0);
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v64, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v54;
  if ((objc_msgSend(v31, "canAddOutput:", v54) & 1) == 0
    || (objc_msgSend(v31, "addOutput:", v54), !objc_msgSend(v31, "canAddOutput:", v55)))
  {
    v28 = -18;
    goto LABEL_49;
  }
  objc_msgSend(v31, "addOutput:", v55);
  if (!objc_msgSend(v59, "startReading") || !objc_msgSend(v31, "startReading"))
  {
    v28 = -19;
    goto LABEL_49;
  }
  v51 = v31;
  v52 = v30;
  v119 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v118 = v119;
  v117 = v119;
  v115 = *(_OWORD *)&self->_startAdjustedPTS.value;
  epoch = self->_startAdjustedPTS.epoch;
  v114 = v119;
  -[VCPVideoInterpolator appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:", v58, v56, &v117, &v115, &v114, &v119);
  v112 = *MEMORY[0x1E0CA2E68];
  v113 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v110 = *(_OWORD *)&self->_startAdjustedPTS.value;
  v111 = self->_startAdjustedPTS.epoch;
  v108 = v112;
  v109 = v113;
  -[VCPVideoInterpolator appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:", v57, v30, &v112, &v110, &v108, &v118);
  v106 = *MEMORY[0x1E0CA2E68];
  v107 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v33 = (__int128 *)MEMORY[0x1E0CA2E30];
  v104 = *MEMORY[0x1E0CA2E30];
  v105 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v102 = *(_OWORD *)&self->_startAdjustedPTS.value;
  v103 = self->_startAdjustedPTS.epoch;
  -[VCPVideoInterpolator appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:", v54, v56, &v106, &v104, &v102, &v119);
  v100 = *MEMORY[0x1E0CA2E68];
  v101 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v98 = *v33;
  v99 = *((_QWORD *)v33 + 2);
  v96 = *(_OWORD *)&self->_startAdjustedPTS.value;
  v97 = self->_startAdjustedPTS.epoch;
  -[VCPVideoInterpolator appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:", v55, v30, &v100, &v98, &v96, &v118);
  v118 = v119;
  v94 = *(_OWORD *)&self->_endAdjustedPTS.value;
  v95 = self->_endAdjustedPTS.epoch;
  v92 = *v33;
  v93 = *((_QWORD *)v33 + 2);
  buf.start = v119;
  rhs = (CMTime)self->_endAdjustedPTS;
  CMTimeSubtract(&v91, &buf.start, &rhs);
  -[VCPVideoInterpolator appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:", v58, v56, &v94, &v92, &v91, &v119);
  v89 = *(_OWORD *)&self->_endAdjustedPTS.value;
  v90 = self->_endAdjustedPTS.epoch;
  v87 = *v33;
  v88 = *((_QWORD *)v33 + 2);
  buf.start = v118;
  rhs = (CMTime)self->_endAdjustedPTS;
  CMTimeSubtract(&v86, &buf.start, &rhs);
  -[VCPVideoInterpolator appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toTrack:startTimeStamp:endTimeStamp:offset:duration:", v57, v30, &v89, &v87, &v86, &v118);
  objc_msgSend(v56, "formatDescriptions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v53, "count") >= 2)
  {
    objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 1; ; ++i)
    {
      if (i >= objc_msgSend(v53, "count"))
        goto LABEL_52;
      objc_msgSend(v53, "objectAtIndexedSubscript:", i);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!CMFormatDescriptionEqual((CMFormatDescriptionRef)v36, (CMFormatDescriptionRef)v34)
        && !+[VCPVideoInterpolator allowMultipleFormats](VCPVideoInterpolator, "allowMultipleFormats"))
      {
        break;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      v46 = MEMORY[0x1E0C81028];
      v47 = "FRC processed video has multiple format descriptions";
      p_buf = &buf;
LABEL_84:
      _os_log_impl(&dword_1B6C4A000, v46, OS_LOG_TYPE_ERROR, v47, (uint8_t *)p_buf, 2u);
    }
LABEL_85:
    v28 = -18;
LABEL_86:
    v31 = v51;
    v30 = v52;
    v32 = (void *)v54;
    goto LABEL_87;
  }
LABEL_52:
  memset(&buf, 0, sizeof(buf));
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  duration = v119;
  CMTimeRangeMake(&buf, &start, &duration);
  for (j = 0; ; ++j)
  {
    if (j >= objc_msgSend(v61, "count"))
    {
      for (k = 0; k < objc_msgSend(v60, "count"); ++k)
      {
        if (v21 != k)
        {
          objc_msgSend(v60, "objectAtIndexedSubscript:", k);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = buf;
          objc_msgSend(v66, "objectAtIndexedSubscript:", k);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = *MEMORY[0x1E0CA2E68];
          v78 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          v44 = objc_msgSend(v42, "insertTimeRange:ofTrack:atTime:copySampleData:error:", &v79, v43, &v77, 1, 0);

          if ((v44 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              LOWORD(rhs.value) = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error inserting metadata tracks", (uint8_t *)&rhs, 2u);
            }

            goto LABEL_85;
          }

        }
      }
      v76 = buf;
      v75 = buf;
      if ((objc_msgSend(v56, "insertMediaTimeRange:intoTimeRange:", &v76, &v75) & 1) != 0)
      {
        v74 = buf;
        v73 = buf;
        if ((objc_msgSend(v52, "insertMediaTimeRange:intoTimeRange:", &v74, &v73) & 1) != 0)
        {
          originalTrack = self->_originalTrack;
          if (originalTrack)
          {
            -[AVAssetTrack preferredTransform](originalTrack, "preferredTransform");
          }
          else
          {
            v71 = 0u;
            v72 = 0u;
            v70 = 0u;
          }
          v69[0] = v70;
          v69[1] = v71;
          v69[2] = v72;
          objc_msgSend(v56, "setPreferredTransform:", v69);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_combinedFilePath);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v6, "writeMovieHeaderToURL:fileType:options:error:", v49, *MEMORY[0x1E0C8A2E8], 0, 0);

          if (v50)
            v28 = 0;
          else
            v28 = -20;
          goto LABEL_86;
        }
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_85;
        LOWORD(rhs.value) = 0;
        v46 = MEMORY[0x1E0C81028];
        v47 = "Error inserting live photo info track";
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_85;
        LOWORD(rhs.value) = 0;
        v46 = MEMORY[0x1E0C81028];
        v47 = "Error inserting video track";
      }
      p_buf = (CMTimeRange *)&rhs;
      goto LABEL_84;
    }
    objc_msgSend(v61, "objectAtIndexedSubscript:", j);
    v38 = objc_claimAutoreleasedReturnValue();
    v82 = buf;
    objc_msgSend(v62, "objectAtIndexedSubscript:", j);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = *MEMORY[0x1E0CA2E68];
    v81 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v40 = (void *)v38;
    LOBYTE(v38) = objc_msgSend((id)v38, "insertTimeRange:ofTrack:atTime:copySampleData:error:", &v82, v39, &v80, 1, 0);

    if ((v38 & 1) == 0)
      break;

  }
  v30 = v52;
  v32 = (void *)v54;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(rhs.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error inserting audio tracks", (uint8_t *)&rhs, 2u);
  }

  v28 = -18;
  v31 = v51;
LABEL_87:

LABEL_49:
LABEL_50:

LABEL_30:
LABEL_31:

LABEL_32:
  return v28;
}

- (int)appendOutput:(id)a3 toTrack:(id)a4 startTimeStamp:(id *)a5 endTimeStamp:(id *)a6 offset:(id *)a7 duration:(id *)a8
{
  opaqueCMSampleBuffer *v13;
  opaqueCMSampleBuffer *v14;
  int32_t v15;
  CMSampleBufferRef v16;
  char v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  CMSampleTimingInfo time1;
  CMTime v25;
  CMTime v26;
  CMSampleBufferRef sampleBufferOut;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v21 = a4;
  while (1)
  {
    while (1)
    {
      v13 = (opaqueCMSampleBuffer *)objc_msgSend(v22, "copyNextSampleBuffer");
      v14 = v13;
      if (!v13)
        goto LABEL_21;
      if (CMSampleBufferGetNumSamples(v13))
      {
        memset(&v30, 0, sizeof(v30));
        CMSampleBufferGetDecodeTimeStamp(&v30, v14);
        memset(&v29, 0, sizeof(v29));
        CMSampleBufferGetPresentationTimeStamp(&v29, v14);
        memset(&v28, 0, sizeof(v28));
        CMSampleBufferGetDuration(&v28, v14);
        time1.duration = v30;
        time2 = (CMTime)*a6;
        v15 = CMTimeCompare(&time1.duration, &time2);
        if ((v15 & 0x80000000) == 0)
        {
          CFRelease(v14);
LABEL_13:
          if ((v15 & 0x80000000) == 0)
            goto LABEL_21;
LABEL_19:
          if (v14)
            CFRelease(v14);
          goto LABEL_21;
        }
        time1.duration = v30;
        time2 = (CMTime)*a5;
        if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0)
          break;
      }
      v16 = v14;
LABEL_11:
      CFRelease(v16);
    }
    sampleBufferOut = 0;
    memset(&v26, 0, sizeof(v26));
    time1.duration = v30;
    time2 = (CMTime)*a7;
    CMTimeAdd(&v26, &time1.duration, &time2);
    memset(&v25, 0, sizeof(v25));
    time1.duration = v29;
    time2 = (CMTime)*a7;
    CMTimeAdd(&v25, &time1.duration, &time2);
    *(_OWORD *)&time1.duration.value = *MEMORY[0x1E0CA2E18];
    time1.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    time1.presentationTimeStamp = v25;
    time1.decodeTimeStamp = v26;
    if (CMSampleBufferCreateCopyWithNewTiming(0, v14, 1, &time1, &sampleBufferOut))
      goto LABEL_13;
    v16 = sampleBufferOut;
    CFRelease(v14);
    lhs = (CMTime)*a8;
    rhs = v28;
    CMTimeAdd(&time2, &lhs, &rhs);
    *(CMTime *)a8 = time2;
    v23 = 0;
    v17 = objc_msgSend(v21, "appendSampleBuffer:decodeTime:presentationTime:error:", v16, 0, 0, &v23);
    v18 = v23;
    v19 = v18;
    if ((v17 & 1) == 0)
      break;

    if (v16)
      goto LABEL_11;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(time2.value) = 138412290;
    *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v19;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error appending sample: %@", (uint8_t *)&time2, 0xCu);
  }

  v14 = v16;
  if (v15 < 0)
    goto LABEL_19;
LABEL_21:

  return 0;
}

- (id)results
{
  NSString *combinedFilePath;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  NSString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("InterpolationResults");
  v10 = CFSTR("attributes");
  combinedFilePath = self->_combinedFilePath;
  v8 = CFSTR("interpolationURL");
  v9 = combinedFilePath;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)getFrameSize:(id)a3
{
  void *v3;
  void *v4;
  CGSize PresentationDimensions;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a3, "formatDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v4, 0, 0);
    width = PresentationDimensions.width;
    height = PresentationDimensions.height;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (__CVBuffer)revertStyle:(__CVBuffer *)a3 withMetadata:(id)a4 withDeltaMap:(__CVBuffer *)a5
{
  id v8;
  CF<__CVPixelBufferPool *> *p_unstyledImagePixelBufferPool;
  __CVPixelBufferPool *value;
  void *v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  _BOOL4 v15;
  __CVBuffer *v16;
  CFTypeRef cf;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  cf = 0;
  p_unstyledImagePixelBufferPool = &self->_unstyledImagePixelBufferPool;
  value = self->_unstyledImagePixelBufferPool.value_;
  if (!value)
  {
    v19[0] = *MEMORY[0x1E0CA9040];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E0CA90E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v19[2] = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = *MEMORY[0x1E0CA8FF0];
    v20[2] = v13;
    v20[3] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (p_unstyledImagePixelBufferPool->value_)
    {
      CFRelease(p_unstyledImagePixelBufferPool->value_);
      p_unstyledImagePixelBufferPool->value_ = 0;
    }
    v15 = CVPixelBufferPoolCreate(0, 0, v14, &self->_unstyledImagePixelBufferPool.value_) == 0;

    if (!v15)
      goto LABEL_9;
    value = p_unstyledImagePixelBufferPool->value_;
  }
  if (!CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], value, (CVPixelBufferRef *)&cf)
    && !-[CMISmartStyleUtilitiesV1 computeOriginalUnstyledPixelBufferFrom:inputDeltaMapPixelBuffer:inputMetadataDict:outputUnstyledPixelBuffer:](self->_smartStyleUtilities, "computeOriginalUnstyledPixelBufferFrom:inputDeltaMapPixelBuffer:inputMetadataDict:outputUnstyledPixelBuffer:", a3, a5, v8, cf))
  {
    CVBufferPropagateAttachments(a3, (CVBufferRef)cf);
    v16 = (__CVBuffer *)cf;
    goto LABEL_10;
  }
  if (cf)
    CFRelease(cf);
LABEL_9:
  v16 = 0;
LABEL_10:

  return v16;
}

- (__CVBuffer)calculateDeltaforUnstyledFrame:(__CVBuffer *)a3 styledFrame:(__CVBuffer *)a4 withCoefficients:(id)a5
{
  id v8;
  CF<__CVPixelBufferPool *> *p_deltaMapPixelBufferPool;
  __CVPixelBufferPool *value;
  void *v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  _BOOL4 v15;
  __CVBuffer *v16;
  CFTypeRef cf;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  cf = 0;
  p_deltaMapPixelBufferPool = &self->_deltaMapPixelBufferPool;
  value = self->_deltaMapPixelBufferPool.value_;
  if (!value)
  {
    v19[0] = *MEMORY[0x1E0CA9040];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E0CA90E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v19[2] = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = *MEMORY[0x1E0CA8FF0];
    v20[2] = v13;
    v20[3] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (p_deltaMapPixelBufferPool->value_)
    {
      CFRelease(p_deltaMapPixelBufferPool->value_);
      p_deltaMapPixelBufferPool->value_ = 0;
    }
    v15 = CVPixelBufferPoolCreate(0, 0, v14, &self->_deltaMapPixelBufferPool.value_) == 0;

    if (!v15)
      goto LABEL_9;
    value = p_deltaMapPixelBufferPool->value_;
  }
  if (!CVPixelBufferPoolCreatePixelBuffer(0, value, (CVPixelBufferRef *)&cf)
    && !-[CMISmartStyleUtilitiesV1 computeDeltaMapForSourcePixelBuffer:targetPixelBuffer:coefficientsDict:outputDeltaMapPixelBuffer:](self->_smartStyleUtilities, "computeDeltaMapForSourcePixelBuffer:targetPixelBuffer:coefficientsDict:outputDeltaMapPixelBuffer:", a3, a4, v8, cf))
  {
    CVBufferPropagateAttachments(a3, (CVBufferRef)cf);
    v16 = (__CVBuffer *)cf;
    goto LABEL_10;
  }
  if (cf)
    CFRelease(cf);
LABEL_9:
  v16 = 0;
LABEL_10:

  return v16;
}

- (id)findLearnedTrack:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v3)
  {
    v25 = *(_QWORD *)v32;
    v24 = *MEMORY[0x1E0C8A910];
    v23 = *MEMORY[0x1E0C8AAE8];
    v22 = *MEMORY[0x1E0C8A9F0];
    do
    {
      v20 = v3;
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1E0C8B220];
        objc_msgSend(v5, "metadataForFormat:", v24);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v5;
        objc_msgSend(v6, "metadataItemsFromArray:withKey:keySpace:", v7, v23, v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v28;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v28 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(v13, "stringValue");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map"));
                objc_msgSend(v13, "stringValue");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail"));

                if (((v15 | v17) & 1) == 0)
                {
                  v18 = v21;

                  goto LABEL_21;
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v10)
                continue;
              break;
            }
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v18 = 0;
    }
    while (v3);
  }
  else
  {
    v18 = 0;
  }
LABEL_21:

  return v18;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)getFramePTSAfter:(SEL)a3 forAsset:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  CMTime *v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v16;
  CMTime v17;
  CMTime time2;
  CMTime time1;

  -[VCPVideoInterpolator findLearnedTrack:](self, "findLearnedTrack:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C8AFD0]);
  objc_msgSend(v7, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAsset:error:", v9, 0);

  objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "canAddOutput:", v11) & 1) != 0
    && (objc_msgSend(v10, "addOutput:", v11), objc_msgSend(v10, "startReading")))
  {
    while (1)
    {
      v12 = (opaqueCMSampleBuffer *)objc_msgSend(v11, "copyNextSampleBuffer");
      v13 = v12;
      if (!v12)
        break;
      if (CMSampleBufferGetNumSamples(v12))
      {
        memset(&v16, 0, sizeof(v16));
        CMSampleBufferGetPresentationTimeStamp(&v16, v13);
        time1 = v16;
        time2 = (CMTime)*a4;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          v17 = v16;
          CFRelease(v13);
          break;
        }
      }
      CFRelease(v13);
    }
    v14 = &v17;
  }
  else
  {
    v14 = (CMTime *)MEMORY[0x1E0CA2E18];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v14->value;
  retstr->var3 = v14->epoch;

  return result;
}

- (int)setupAdditionalAuxTrack
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSMapTable *auxInputToOutputMap;
  void *v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[AVAssetTrack asset](self->_originalTrack, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v5)
  {
    v29 = *(_QWORD *)v38;
    v27 = *MEMORY[0x1E0C8A910];
    v26 = *MEMORY[0x1E0C8AAE8];
    v25 = *MEMORY[0x1E0C8A9F0];
    do
    {
      v6 = 0;
      v28 = v5;
      do
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        objc_msgSend(v7, "formatDescriptions", v25, v26);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v6;
        v9 = v8 == 0;

        if (!v9)
        {
          v10 = (void *)MEMORY[0x1E0C8B220];
          objc_msgSend(v7, "metadataForFormat:", v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "metadataItemsFromArray:withKey:keySpace:", v11, v26, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v30;
          if (v30)
          {
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            v13 = v30;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v34;
              while (2)
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v34 != v15)
                    objc_enumerationMutation(v13);
                  v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                  objc_msgSend(v17, "stringValue");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map"));

                  if ((v19 & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v7, 0);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!-[AVAssetReader canAddOutput:](self->_auxAssetReader, "canAddOutput:", v20))
                    {

                      v23 = -18;
                      goto LABEL_24;
                    }
                    -[AVAssetReader addOutput:](self->_auxAssetReader, "addOutput:", v20);
                    auxInputToOutputMap = self->_auxInputToOutputMap;
                    objc_msgSend(v17, "stringValue");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMapTable setObject:forKey:](auxInputToOutputMap, "setObject:forKey:", v20, v22);

                  }
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
                if (v14)
                  continue;
                break;
              }
            }

            v12 = v30;
          }

        }
        v6 = v32 + 1;
      }
      while (v32 + 1 != v28);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }

  -[AVAssetReader startReading](self->_auxAssetReader, "startReading");
  v23 = 0;
LABEL_24:

  return v23;
}

- (int)combineVideoSegmentsWithAssetWriter
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  CMTime *v90;
  $95D729B680665BEAEFA1D6FCA8238556 *p_startAdjustedPTS;
  __int128 v92;
  void *jj;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  __int128 *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  $95D729B680665BEAEFA1D6FCA8238556 *p_endAdjustedPTS;
  void *kk;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *mm;
  uint64_t v118;
  dispatch_semaphore_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  id v130;
  id v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  id obj;
  id v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  _QWORD v162[4];
  dispatch_semaphore_t v163;
  CMTime v164;
  __int128 v165;
  uint64_t v166;
  __int128 v167;
  int64_t v168;
  CMTime v169;
  __int128 v170;
  uint64_t v171;
  __int128 v172;
  int64_t v173;
  CMTime v174;
  __int128 v175;
  uint64_t v176;
  __int128 v177;
  int64_t v178;
  CMTime v179;
  __int128 v180;
  uint64_t v181;
  __int128 v182;
  int64_t v183;
  CMTime v184;
  __int128 v185;
  uint64_t v186;
  __int128 v187;
  int64_t v188;
  CMTime v189;
  __int128 v190;
  uint64_t v191;
  __int128 v192;
  int64_t v193;
  __int128 v194;
  int64_t v195;
  __int128 v196;
  uint64_t v197;
  __int128 v198;
  CMTimeEpoch v199;
  __int128 v200;
  int64_t v201;
  __int128 v202;
  uint64_t v203;
  __int128 v204;
  CMTimeEpoch v205;
  __int128 v206;
  int64_t v207;
  __int128 v208;
  uint64_t v209;
  __int128 v210;
  CMTimeEpoch v211;
  __int128 v212;
  int64_t v213;
  __int128 v214;
  uint64_t v215;
  __int128 v216;
  CMTimeEpoch v217;
  __int128 v218;
  int64_t v219;
  __int128 v220;
  uint64_t v221;
  __int128 v222;
  CMTimeEpoch v223;
  CMTime v224;
  __int128 v225;
  int64_t v226;
  __int128 v227;
  uint64_t v228;
  __int128 v229;
  CMTimeEpoch v230;
  __int128 v231;
  CMTimeEpoch v232;
  __int128 v233;
  int64_t v234;
  __int128 v235;
  CMTimeEpoch v236;
  __int128 v237;
  CMTimeEpoch v238;
  __int128 v239;
  int64_t v240;
  __int128 v241;
  CMTimeEpoch v242;
  __int128 v243;
  CMTimeEpoch v244;
  __int128 v245;
  int64_t v246;
  __int128 v247;
  CMTimeEpoch v248;
  __int128 v249;
  CMTimeEpoch v250;
  __int128 v251;
  int64_t v252;
  __int128 v253;
  CMTimeEpoch v254;
  __int128 v255;
  CMTimeEpoch v256;
  __int128 v257;
  int64_t v258;
  __int128 v259;
  CMTimeEpoch v260;
  CMTime v261;
  __int128 v262;
  int64_t epoch;
  CMTime v264;
  CMTime v265;
  CMTime v266;
  CMTime v267;
  CMTime v268;
  CMTime v269;
  CMTime v270;
  __int128 v271;
  uint64_t v272;
  _OWORD v273[3];
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  id v305;
  CMTime rhs;
  _BYTE v307[128];
  uint64_t v308;
  void *v309;
  _BYTE v310[128];
  _BYTE v311[128];
  _BYTE v312[128];
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  CMTime buf;
  uint64_t v317;

  v317 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", self->_combinedFilePath);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", self->_combinedFilePath, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAssetTrack asset](self->_originalTrack, "asset");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C8B3C0];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_filePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetWithURL:", v6);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C8B018];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_combinedFilePath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C8A2E8];
  v305 = 0;
  objc_msgSend(v7, "assetWriterWithURL:fileType:error:", v8, v9, &v305);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v305;

  v10 = v160;
  if (v160)
  {
    v11 = (void *)*MEMORY[0x1E0C8A808];
    -[VCPVideoInterpolator addInputMediaType:toWriter:forTrack:](self, "addInputMediaType:toWriter:forTrack:", *MEMORY[0x1E0C8A808], v160, self->_originalTrack);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    if (v148)
    {
      v136 = v11;
      v12 = *MEMORY[0x1E0C8A7A8];
      objc_msgSend(v155, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A8]);
      v304 = 0u;
      v303 = 0u;
      v302 = 0u;
      v301 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v301, v315, 16);
      if (v13)
      {
        v156 = *(_QWORD *)v302;
        v144 = *MEMORY[0x1E0C8A910];
        v142 = (id)*MEMORY[0x1E0C8AAE8];
        v138 = *MEMORY[0x1E0C8A9F0];
        do
        {
          v14 = 0;
          v146 = v13;
          do
          {
            if (*(_QWORD *)v302 != v156)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * v14);
            objc_msgSend(v15, "formatDescriptions");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16 == 0;

            if (!v17)
            {
              v18 = (void *)MEMORY[0x1E0C8B220];
              objc_msgSend(v15, "metadataForFormat:", v144);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "metadataItemsFromArray:withKey:keySpace:", v19, v142, v138);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                v300 = 0u;
                v299 = 0u;
                v298 = 0u;
                v297 = 0u;
                v21 = v20;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v297, v314, 16);
                if (v22)
                {
                  v23 = *(_QWORD *)v298;
                  while (2)
                  {
                    for (i = 0; i != v22; ++i)
                    {
                      if (*(_QWORD *)v298 != v23)
                        objc_enumerationMutation(v21);
                      v25 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * i);
                      -[VCPVideoInterpolator addInputMediaType:toWriter:forTrack:](self, "addInputMediaType:toWriter:forTrack:", v12, v160, v15);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v26)
                      {
                        if ((int)MediaAnalysisLogLevel() >= 3
                          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        {
                          LOWORD(buf.value) = 0;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
                        }

                        v102 = -18;
                        v103 = obj;
                        goto LABEL_120;
                      }
                      objc_msgSend(v26, "setMarksOutputTrackAsEnabled:", objc_msgSend(v15, "isEnabled"));
                      objc_msgSend(v25, "stringValue");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v159, "setObject:forKey:", v26, v27);

                    }
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v297, v314, 16);
                    if (v22)
                      continue;
                    break;
                  }
                }

              }
            }
            ++v14;
          }
          while (v14 != v146);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v301, v315, 16);
        }
        while (v13);
      }

      -[VCPVideoInterpolator findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v154);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = *MEMORY[0x1E0C8A7D0];
      -[VCPVideoInterpolator addInputMediaType:toWriter:forTrack:](self, "addInputMediaType:toWriter:forTrack:");
      v147 = objc_claimAutoreleasedReturnValue();

      if (v147)
      {
        -[VCPVideoInterpolator findStyleInfoTrack:](self, "findStyleInfoTrack:", v154);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPVideoInterpolator addInputMediaType:toWriter:forTrack:](self, "addInputMediaType:toWriter:forTrack:", v139, v160, v29);
        v145 = (void *)objc_claimAutoreleasedReturnValue();

        if (v145)
        {
          v157 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v154, 0);
          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", self->_originalTrack, 0);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "addOutput:", v129);
          -[AVAssetTrack asset](self->_originalTrack, "asset");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "tracksWithMediaType:", v12);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v296 = 0u;
          v295 = 0u;
          v294 = 0u;
          v293 = 0u;
          v143 = v31;
          v32 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v293, v313, 16);
          if (v32)
          {
            v33 = *(_QWORD *)v294;
            v134 = *MEMORY[0x1E0C8A910];
            v132 = *MEMORY[0x1E0C8AAE8];
            v130 = (id)*MEMORY[0x1E0C8A9F0];
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v294 != v33)
                  objc_enumerationMutation(v143);
                v35 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * j);
                objc_msgSend(v35, "formatDescriptions");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v36 == 0;

                if (!v37)
                {
                  v38 = (void *)MEMORY[0x1E0C8B220];
                  objc_msgSend(v35, "metadataForFormat:", v134);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "metadataItemsFromArray:withKey:keySpace:", v39, v132, v130);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v40)
                  {
                    v292 = 0u;
                    v291 = 0u;
                    v290 = 0u;
                    v289 = 0u;
                    v150 = v40;
                    v41 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v289, v312, 16);
                    if (v41)
                    {
                      v42 = *(_QWORD *)v290;
                      while (2)
                      {
                        for (k = 0; k != v41; ++k)
                        {
                          if (*(_QWORD *)v290 != v42)
                            objc_enumerationMutation(v150);
                          v44 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * k);
                          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v35, 0);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((objc_msgSend(v157, "canAddOutput:", v45) & 1) == 0)
                          {
                            v102 = -18;
                            v133 = v150;
                            v135 = v143;
                            goto LABEL_112;
                          }
                          objc_msgSend(v157, "addOutput:", v45);
                          objc_msgSend(v44, "stringValue");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v158, "setObject:forKey:", v45, v46);

                        }
                        v41 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v289, v312, 16);
                        if (v41)
                          continue;
                        break;
                      }
                    }

                  }
                }
              }
              v32 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v293, v313, 16);
            }
            while (v32);
          }

          v47 = (void *)MEMORY[0x1E0C8B000];
          -[VCPVideoInterpolator findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v154);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "assetReaderTrackOutputWithTrack:outputSettings:", v48, 0);
          v135 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v157, "canAddOutput:", v135) & 1) != 0)
          {
            objc_msgSend(v157, "addOutput:", v135);
            v49 = (void *)MEMORY[0x1E0C8B000];
            -[VCPVideoInterpolator findStyleInfoTrack:](self, "findStyleInfoTrack:", v154);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "assetReaderTrackOutputWithTrack:outputSettings:", v50, 0);
            v133 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v157, "canAddOutput:", v133) & 1) != 0)
            {
              objc_msgSend(v157, "addOutput:", v133);
              v150 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v155, 0);
              v51 = (void *)MEMORY[0x1E0C8B000];
              objc_msgSend(v155, "tracksWithMediaType:", v136);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "firstObject");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "assetReaderTrackOutputWithTrack:outputSettings:", v53, 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v150, "addOutput:", v45);
              v288 = 0u;
              v287 = 0u;
              v286 = 0u;
              v285 = 0u;
              v131 = obj;
              v54 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v285, v311, 16);
              if (v54)
              {
                v127 = *(_QWORD *)v286;
                v125 = (id)*MEMORY[0x1E0C8A910];
                v123 = *MEMORY[0x1E0C8AAE8];
                v121 = *MEMORY[0x1E0C8A9F0];
                do
                {
                  for (m = 0; m != v54; ++m)
                  {
                    if (*(_QWORD *)v286 != v127)
                      objc_enumerationMutation(v131);
                    v56 = *(void **)(*((_QWORD *)&v285 + 1) + 8 * m);
                    objc_msgSend(v56, "formatDescriptions", v121);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = v57 == 0;

                    if (!v58)
                    {
                      v59 = (void *)MEMORY[0x1E0C8B220];
                      objc_msgSend(v56, "metadataForFormat:", v125);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v59, "metadataItemsFromArray:withKey:keySpace:", v60, v123, v121);
                      v61 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v61)
                      {
                        v284 = 0u;
                        v283 = 0u;
                        v282 = 0u;
                        v281 = 0u;
                        v137 = v61;
                        v62 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v281, v310, 16);
                        if (v62)
                        {
                          v63 = *(_QWORD *)v282;
                          while (2)
                          {
                            for (n = 0; n != v62; ++n)
                            {
                              if (*(_QWORD *)v282 != v63)
                                objc_enumerationMutation(v137);
                              v65 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * n);
                              objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v56, 0);
                              v66 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((objc_msgSend(v150, "canAddOutput:") & 1) == 0)
                              {
                                v102 = -18;
                                v128 = (uint64_t)v137;
                                goto LABEL_127;
                              }
                              objc_msgSend(v150, "addOutput:", v66);
                              objc_msgSend(v65, "stringValue");
                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v153, "setObject:forKey:", v66, v67);

                            }
                            v62 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v281, v310, 16);
                            if (v62)
                              continue;
                            break;
                          }
                        }

                      }
                    }
                  }
                  v54 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v285, v311, 16);
                }
                while (v54);
              }

              v68 = (void *)MEMORY[0x1E0C8B000];
              -[VCPVideoInterpolator findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v155);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "assetReaderTrackOutputWithTrack:outputSettings:", v69, 0);
              v131 = (id)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v150, "canAddOutput:", v131) & 1) != 0)
              {
                objc_msgSend(v150, "addOutput:", v131);
                v70 = (void *)MEMORY[0x1E0C8B000];
                -[VCPVideoInterpolator findStyleInfoTrack:](self, "findStyleInfoTrack:", v155);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "assetReaderTrackOutputWithTrack:outputSettings:", v71, 0);
                v128 = objc_claimAutoreleasedReturnValue();

                v72 = (void *)v128;
                if ((objc_msgSend(v150, "canAddOutput:", v128) & 1) != 0)
                {
                  objc_msgSend(v150, "addOutput:", v128);
                  v73 = objc_alloc(MEMORY[0x1E0C8B020]);
                  v74 = *MEMORY[0x1E0C8A7A0];
                  v137 = (id)objc_msgSend(v73, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A7A0], 0);
                  objc_msgSend(v137, "setExpectsMediaDataInRealTime:", 1);
                  if ((objc_msgSend(v160, "canAddInput:", v137) & 1) != 0)
                  {
                    objc_msgSend(v160, "addInput:", v137);
                    v308 = *MEMORY[0x1E0C898E0];
                    v309 = &unk_1E6B72920;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v309, &v308, 1);
                    v75 = objc_claimAutoreleasedReturnValue();
                    v76 = (void *)MEMORY[0x1E0C8B000];
                    objc_msgSend(v155, "tracksWithMediaType:", v74);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "firstObject");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = (void *)v75;
                    objc_msgSend(v76, "assetReaderTrackOutputWithTrack:outputSettings:", v78, v75);
                    v122 = objc_claimAutoreleasedReturnValue();

                    v79 = (void *)v122;
                    if ((objc_msgSend(v150, "canAddOutput:", v122) & 1) != 0)
                    {
                      objc_msgSend(v150, "addOutput:", v122);
                      objc_msgSend(v151, "setObject:forKey:", v122, v137);
                      objc_msgSend(v155, "tracksWithMediaType:", v139);
                      v280 = 0u;
                      v279 = 0u;
                      v278 = 0u;
                      v277 = 0u;
                      v126 = (id)objc_claimAutoreleasedReturnValue();
                      v80 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v277, v307, 16);
                      if (v80)
                      {
                        v81 = *(_QWORD *)v278;
                        v124 = *MEMORY[0x1E0D053E0];
                        while (2)
                        {
                          for (ii = 0; ii != v80; ++ii)
                          {
                            if (*(_QWORD *)v278 != v81)
                              objc_enumerationMutation(v126);
                            v83 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * ii);
                            objc_msgSend(v83, "formatDescriptions", v122);
                            v84 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v84, "firstObject");
                            v85 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v85)
                            {
                              CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v85);
                              v86 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((objc_msgSend(v86, "containsObject:", CFSTR("mdta/com.apple.quicktime.smartstyle-info")) & 1) == 0&& (objc_msgSend(v86, "containsObject:", v124) & 1) == 0)
                              {
                                objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v83, 0);
                                v87 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((objc_msgSend(v150, "canAddOutput:", v87) & 1) == 0)
                                  goto LABEL_156;
                                objc_msgSend(v150, "addOutput:", v87);
                                v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B020]), "initWithMediaType:outputSettings:sourceFormatHint:", v139, 0, 0);
                                if (v83)
                                {
                                  objc_msgSend(v83, "preferredTransform");
                                }
                                else
                                {
                                  v276 = 0u;
                                  v275 = 0u;
                                  v274 = 0u;
                                }
                                v273[0] = v274;
                                v273[1] = v275;
                                v273[2] = v276;
                                objc_msgSend(v88, "setTransform:", v273);
                                objc_msgSend(v83, "metadata");
                                v89 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v88, "setMetadata:", v89);

                                if ((objc_msgSend(v160, "canAddInput:", v88) & 1) == 0)
                                {

LABEL_156:
                                  v102 = -18;
                                  goto LABEL_157;
                                }
                                objc_msgSend(v160, "addInput:", v88);
                                objc_msgSend(v151, "setObject:forKey:", v87, v88);

                              }
                            }
                          }
                          v80 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v277, v307, 16);
                          if (v80)
                            continue;
                          break;
                        }
                      }

                      objc_msgSend(v160, "startWriting");
                      v90 = (CMTime *)MEMORY[0x1E0CA2E68];
                      v271 = *MEMORY[0x1E0CA2E68];
                      v272 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
                      objc_msgSend(v160, "startSessionAtSourceTime:", &v271);
                      objc_msgSend(v157, "startReading");
                      objc_msgSend(v150, "startReading");
                      v270 = *v90;
                      v269 = v270;
                      v268 = v270;
                      v267 = *v90;
                      v266 = *v90;
                      v265 = *v90;
                      v264 = v265;
                      p_startAdjustedPTS = &self->_startAdjustedPTS;
                      v92 = *(_OWORD *)&self->_startAdjustedPTS.value;
                      epoch = self->_startAdjustedPTS.epoch;
                      v262 = v92;
                      v261 = v265;
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v129, v148, &v264, &v262, &v261, &v270);
                      objc_msgSend(v158, "keyEnumerator");
                      v140 = (void *)objc_claimAutoreleasedReturnValue();
                      for (jj = 0; ; jj = v94)
                      {
                        objc_msgSend(v140, "nextObject", v122);
                        v94 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v94)
                          break;
                        if (objc_msgSend(v94, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail")))
                        {
                          objc_msgSend(v158, "objectForKey:", v94);
                          v95 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v94);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          v259 = *(_OWORD *)&v90->value;
                          v260 = v90->epoch;
                          v257 = *(_OWORD *)&p_startAdjustedPTS->value;
                          v258 = self->_startAdjustedPTS.epoch;
                          v255 = v259;
                          v256 = v260;
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v95, v96, &v259, &v257, &v255, &v266);

                        }
                        else if (objc_msgSend(v94, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map")))
                        {
                          objc_msgSend(v158, "objectForKey:", v94);
                          v97 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v94);
                          v98 = (void *)objc_claimAutoreleasedReturnValue();
                          v253 = *(_OWORD *)&v90->value;
                          v254 = v90->epoch;
                          v251 = *(_OWORD *)&p_startAdjustedPTS->value;
                          v252 = self->_startAdjustedPTS.epoch;
                          v249 = v253;
                          v250 = v254;
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v97, v98, &v253, &v251, &v249, &v268);

                        }
                        else
                        {
                          buf = *v90;
                          objc_msgSend(v158, "objectForKey:", v94);
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v94);
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          v247 = *(_OWORD *)&v90->value;
                          v248 = v90->epoch;
                          v245 = *(_OWORD *)&p_startAdjustedPTS->value;
                          v246 = self->_startAdjustedPTS.epoch;
                          v243 = v247;
                          v244 = v248;
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v99, v100, &v247, &v245, &v243, &buf);

                          v267 = buf;
                        }
                      }
                      v241 = *(_OWORD *)&v90->value;
                      v242 = v90->epoch;
                      v239 = *(_OWORD *)&p_startAdjustedPTS->value;
                      v240 = self->_startAdjustedPTS.epoch;
                      v237 = v241;
                      v238 = v242;
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v135, v147, &v241, &v239, &v237, &v269);
                      v235 = *(_OWORD *)&v90->value;
                      v236 = v90->epoch;
                      v233 = *(_OWORD *)&p_startAdjustedPTS->value;
                      v234 = self->_startAdjustedPTS.epoch;
                      v231 = v235;
                      v232 = v236;
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v133, v145, &v235, &v233, &v231, &v265);
                      v229 = *(_OWORD *)&v90->value;
                      v230 = v90->epoch;
                      v105 = (__int128 *)MEMORY[0x1E0CA2E30];
                      v227 = *MEMORY[0x1E0CA2E30];
                      v228 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
                      v225 = *(_OWORD *)&p_startAdjustedPTS->value;
                      v226 = self->_startAdjustedPTS.epoch;
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v45, v148, &v229, &v227, &v225, &v270);
                      objc_msgSend(v153, "keyEnumerator");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();

                      v107 = 0;
                      v224 = *v90;
                      while (1)
                      {
                        objc_msgSend(v106, "nextObject");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v108)
                          break;
                        if (objc_msgSend(v108, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail")))
                        {
                          objc_msgSend(v153, "objectForKey:", v108);
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v108);
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          v222 = *(_OWORD *)&v90->value;
                          v223 = v90->epoch;
                          v220 = *v105;
                          v221 = *((_QWORD *)v105 + 2);
                          v218 = *(_OWORD *)&p_startAdjustedPTS->value;
                          v219 = self->_startAdjustedPTS.epoch;
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v109, v110, &v222, &v220, &v218, &v266);
                        }
                        else if (objc_msgSend(v108, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map")))
                        {
                          objc_msgSend(v153, "objectForKey:", v108);
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v108);
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          v216 = *(_OWORD *)&v90->value;
                          v217 = v90->epoch;
                          v214 = *v105;
                          v215 = *((_QWORD *)v105 + 2);
                          v212 = *(_OWORD *)&p_startAdjustedPTS->value;
                          v213 = self->_startAdjustedPTS.epoch;
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v109, v110, &v216, &v214, &v212, &v268);
                        }
                        else
                        {
                          v224 = v267;
                          objc_msgSend(v153, "objectForKey:", v108);
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v108);
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          v210 = *(_OWORD *)&v90->value;
                          v211 = v90->epoch;
                          v208 = *v105;
                          v209 = *((_QWORD *)v105 + 2);
                          v206 = *(_OWORD *)&p_startAdjustedPTS->value;
                          v207 = self->_startAdjustedPTS.epoch;
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v109, v110, &v210, &v208, &v206, &v224);
                        }

                        v107 = v108;
                      }
                      v267 = v224;
                      v204 = *(_OWORD *)&v90->value;
                      v205 = v90->epoch;
                      v202 = *v105;
                      v203 = *((_QWORD *)v105 + 2);
                      v201 = self->_startAdjustedPTS.epoch;
                      v200 = *(_OWORD *)&p_startAdjustedPTS->value;
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v131, v147, &v204, &v202, &v200, &v269);
                      v198 = *(_OWORD *)&v90->value;
                      v199 = v90->epoch;
                      v196 = *v105;
                      v197 = *((_QWORD *)v105 + 2);
                      v194 = *(_OWORD *)&p_startAdjustedPTS->value;
                      v195 = self->_startAdjustedPTS.epoch;
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v128, v145, &v198, &v196, &v194, &v265);
                      *(_OWORD *)&v265.value = *(_OWORD *)&v270.value;
                      *(_OWORD *)&v269.value = *(_OWORD *)&v270.value;
                      *(_OWORD *)&v268.value = *(_OWORD *)&v270.value;
                      *(_OWORD *)&v267.value = *(_OWORD *)&v270.value;
                      *(_OWORD *)&v266.value = *(_OWORD *)&v270.value;
                      p_endAdjustedPTS = &self->_endAdjustedPTS;
                      v192 = *(_OWORD *)&self->_endAdjustedPTS.value;
                      v190 = *v105;
                      v265.epoch = v270.epoch;
                      v269.epoch = v270.epoch;
                      v268.epoch = v270.epoch;
                      v267.epoch = v270.epoch;
                      v266.epoch = v270.epoch;
                      v193 = self->_endAdjustedPTS.epoch;
                      v191 = *((_QWORD *)v105 + 2);
                      buf = v270;
                      rhs = (CMTime)self->_endAdjustedPTS;
                      CMTimeSubtract(&v189, &buf, &rhs);
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v129, v148, &v192, &v190, &v189, &v270);
                      objc_msgSend(v158, "keyEnumerator");
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      for (kk = 0; ; kk = v113)
                      {

                        objc_msgSend(v141, "nextObject");
                        v113 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v113)
                          break;
                        if (objc_msgSend(v113, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail")))
                        {
                          objc_msgSend(v158, "objectForKey:", v113);
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v113);
                          v114 = (void *)objc_claimAutoreleasedReturnValue();
                          v187 = *(_OWORD *)&p_endAdjustedPTS->value;
                          v188 = self->_endAdjustedPTS.epoch;
                          v185 = *v105;
                          v186 = *((_QWORD *)v105 + 2);
                          buf = v266;
                          *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
                          rhs.epoch = self->_endAdjustedPTS.epoch;
                          CMTimeSubtract(&v184, &buf, &rhs);
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v106, v114, &v187, &v185, &v184, &v266);
                        }
                        else if (objc_msgSend(v113, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map")))
                        {
                          objc_msgSend(v158, "objectForKey:", v113);
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v113);
                          v114 = (void *)objc_claimAutoreleasedReturnValue();
                          v182 = *(_OWORD *)&p_endAdjustedPTS->value;
                          v183 = self->_endAdjustedPTS.epoch;
                          v180 = *v105;
                          v181 = *((_QWORD *)v105 + 2);
                          buf = v268;
                          *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
                          rhs.epoch = self->_endAdjustedPTS.epoch;
                          CMTimeSubtract(&v179, &buf, &rhs);
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v106, v114, &v182, &v180, &v179, &v268);
                        }
                        else
                        {
                          v224 = v267;
                          objc_msgSend(v158, "objectForKey:", v113);
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v159, "objectForKey:", v113);
                          v114 = (void *)objc_claimAutoreleasedReturnValue();
                          v177 = *(_OWORD *)&p_endAdjustedPTS->value;
                          v178 = self->_endAdjustedPTS.epoch;
                          v175 = *v105;
                          v176 = *((_QWORD *)v105 + 2);
                          buf = v267;
                          *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
                          rhs.epoch = self->_endAdjustedPTS.epoch;
                          CMTimeSubtract(&v174, &buf, &rhs);
                          -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v106, v114, &v177, &v175, &v174, &v224);
                        }

                      }
                      v172 = *(_OWORD *)&p_endAdjustedPTS->value;
                      v173 = self->_endAdjustedPTS.epoch;
                      v170 = *v105;
                      v171 = *((_QWORD *)v105 + 2);
                      buf = v269;
                      *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
                      rhs.epoch = self->_endAdjustedPTS.epoch;
                      v115 = v141;
                      CMTimeSubtract(&v169, &buf, &rhs);
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v135, v147, &v172, &v170, &v169, &v269);
                      v167 = *(_OWORD *)&p_endAdjustedPTS->value;
                      v168 = self->_endAdjustedPTS.epoch;
                      v165 = *v105;
                      v166 = *((_QWORD *)v105 + 2);
                      buf = v265;
                      *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
                      rhs.epoch = self->_endAdjustedPTS.epoch;
                      CMTimeSubtract(&v164, &buf, &rhs);
                      -[VCPVideoInterpolator appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:](self, "appendOutput:toWriterInput:startTimeStamp:endTimeStamp:offset:duration:", v133, v145, &v167, &v165, &v164, &v265);
                      objc_msgSend(v151, "keyEnumerator");
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      for (mm = 0; ; mm = (void *)v118)
                      {

                        objc_msgSend(v116, "nextObject");
                        v118 = objc_claimAutoreleasedReturnValue();

                        if (!v118)
                          break;
                        objc_msgSend(v151, "objectForKey:", v118);
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        -[VCPVideoInterpolator appendOutput:toWriterInput:](self, "appendOutput:toWriterInput:", v115, v118);
                      }
                      v119 = dispatch_semaphore_create(0);
                      v162[0] = MEMORY[0x1E0C809B0];
                      v162[1] = 3221225472;
                      v162[2] = __59__VCPVideoInterpolator_combineVideoSegmentsWithAssetWriter__block_invoke;
                      v162[3] = &unk_1E6B15468;
                      v163 = v119;
                      v120 = v119;
                      objc_msgSend(v160, "finishWritingWithCompletionHandler:", v162);
                      dispatch_semaphore_wait(v120, 0xFFFFFFFFFFFFFFFFLL);

                      v102 = 0;
LABEL_157:

                      v79 = (void *)v122;
                    }
                    else
                    {
                      v102 = -18;
                    }

LABEL_127:
                  }
                  else
                  {
                    v102 = -18;
                  }

                  v72 = (void *)v128;
                }
                else
                {
                  v102 = -18;
                }

              }
              else
              {
                v102 = -18;
              }

LABEL_112:
            }
            else
            {
              v102 = -18;
            }

          }
          else
          {
            v102 = -18;
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
          }
          v102 = -18;
        }

        v103 = (void *)v147;
      }
      else
      {
        v103 = 0;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
        }
        v102 = -18;
      }
LABEL_120:

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
      }
      v102 = -18;
    }

    goto LABEL_122;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v152, "description");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v101;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create asset writer (%@)", (uint8_t *)&buf, 0xCu);

    v102 = -18;
LABEL_122:
    v10 = v160;
    goto LABEL_123;
  }
  v102 = -18;
LABEL_123:

  return v102;
}

intptr_t __59__VCPVideoInterpolator_combineVideoSegmentsWithAssetWriter__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)addInputMediaType:(id)a3 toWriter:(id)a4 forTrack:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((id)*MEMORY[0x1E0C8A7A8] == v7)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B020]), "initWithMediaType:outputSettings:sourceFormatHint:", v7, 0, 0);
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C8B020]);
    objc_msgSend(v9, "formatDescriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithMediaType:outputSettings:sourceFormatHint:", v7, 0, v12);

    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "preferredTransform");
      goto LABEL_6;
    }
  }
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
LABEL_6:
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  objc_msgSend(v13, "setTransform:", v16);
  objc_msgSend(v9, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMetadata:", v14);

  if (objc_msgSend(v8, "canAddInput:", v13))
    objc_msgSend(v8, "addInput:", v13);

  return v13;
}

- (int)appendOutput:(id)a3 toWriterInput:(id)a4 startTimeStamp:(id *)a5 endTimeStamp:(id *)a6 offset:(id *)a7 duration:(id *)a8
{
  id v13;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  CMSampleBufferRef v16;
  id v18;
  CMSampleTimingInfo time1;
  CMTime v20;
  CMTime v21;
  CMSampleBufferRef sampleBufferOut;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;

  v13 = a3;
  v18 = a4;
  while (1)
  {
    v14 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "copyNextSampleBuffer");
    v15 = v14;
    if (!v14)
      break;
    if (CMSampleBufferGetNumSamples(v14))
    {
      memset(&v25, 0, sizeof(v25));
      CMSampleBufferGetDecodeTimeStamp(&v25, v15);
      memset(&v24, 0, sizeof(v24));
      CMSampleBufferGetPresentationTimeStamp(&v24, v15);
      memset(&v23, 0, sizeof(v23));
      CMSampleBufferGetDuration(&v23, v15);
      time1.duration = v25;
      time2 = (CMTime)*a6;
      if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0)
      {
        CFRelease(v15);
        break;
      }
      time1.duration = v25;
      time2 = (CMTime)*a5;
      if (CMTimeCompare(&time1.duration, &time2) < 0)
      {
        v16 = v15;
      }
      else
      {
        sampleBufferOut = 0;
        memset(&v21, 0, sizeof(v21));
        time1.duration = v25;
        time2 = (CMTime)*a7;
        CMTimeAdd(&v21, &time1.duration, &time2);
        memset(&v20, 0, sizeof(v20));
        time1.duration = v24;
        time2 = (CMTime)*a7;
        CMTimeAdd(&v20, &time1.duration, &time2);
        *(_OWORD *)&time1.duration.value = *MEMORY[0x1E0CA2E18];
        time1.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        time1.presentationTimeStamp = v20;
        time1.decodeTimeStamp = v21;
        CMSampleBufferCreateCopyWithNewTiming(0, v15, 1, &time1, &sampleBufferOut);
        v16 = sampleBufferOut;
        CFRelease(v15);
        lhs = (CMTime)*a8;
        rhs = v23;
        CMTimeAdd(&time2, &lhs, &rhs);
        *(CMTime *)a8 = time2;
        if (!v16 || (objc_msgSend(v18, "appendSampleBuffer:", v16) & 1) == 0)
          break;
      }
      v15 = v16;
    }
    CFRelease(v15);
  }

  return 0;
}

- (int)appendOutput:(id)a3 toWriterInput:(id)a4
{
  id v5;
  id v6;
  const void *v7;

  v5 = a3;
  v6 = a4;
  while (objc_msgSend(v6, "isReadyForMoreMediaData"))
  {
    v7 = (const void *)objc_msgSend(v5, "copyNextSampleBuffer");
    if (!v7)
      break;
    if ((objc_msgSend(v6, "appendSampleBuffer:", v7) & 1) == 0)
    {
      CFRelease(v7);
      break;
    }
    CFRelease(v7);
  }

  return 0;
}

- (BOOL)processAborted
{
  return self->_processAborted;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)adjustedTimeRange
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;

  objc_copyStruct(retstr, &self->_cancelled + 2, 48, 1, 0);
  return result;
}

- (BOOL)enableStyle
{
  return self->_enableStyle;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxInputToOutputMap, 0);
  objc_storeStrong((id *)&self->_auxAssetReader, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_unstyledImagePixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_deltaMapPixelBufferPool.value_);
  objc_storeStrong((id *)&self->_deltaTrackDecoder, 0);
  objc_storeStrong((id *)&self->_previousSmartStyleMetadata, 0);
  objc_storeStrong((id *)&self->_smartStyleMetadata, 0);
  objc_storeStrong((id *)&self->_smartStyleUtilities, 0);
  objc_storeStrong((id *)&self->_intraFrameList, 0);
  objc_storeStrong((id *)&self->_deltaTrack, 0);
  objc_storeStrong((id *)&self->_originalTrack, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_combinedFilePath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_previousUnstyledFrame, 0);
  objc_storeStrong((id *)&self->_previousFrame, 0);
  objc_storeStrong((id *)&self->_frameInterpolator, 0);
  objc_storeStrong((id *)&self->_frameInsertionLists, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 33) = 0;
  return self;
}

@end
