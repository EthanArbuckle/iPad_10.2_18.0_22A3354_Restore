@implementation VCPSettlingEffectAnalyzer

+ (BOOL)disableVideoQualityGating
{
  return 0;
}

+ (BOOL)disableMetadataIntegrityCheck
{
  return 1;
}

+ (BOOL)disableStillTransitionGating
{
  return 0;
}

+ (BOOL)disableBurstFrameDropGating
{
  return 1;
}

+ (int64_t)getFRCQualityMode
{
  return 0;
}

- (VCPSettlingEffectAnalyzer)initWithTimestamps:(id)a3 andTrack:(id)a4 andRecipe:(id)a5 withOptions:(id)a6
{
  id v10;
  char *v11;
  VCPSettlingEffectAnalyzer *v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
  const __CFDictionary *v36;
  CMTimeEpoch v37;
  void *v38;
  void *v39;
  void *v40;
  CMTimeEpoch epoch;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  const __CFDictionary *v48;
  __int128 *v49;
  CMTimeEpoch v50;
  CMTimeEpoch v51;
  id v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  void *v67;
  void *v68;
  uint64_t v70;
  void *v71;
  const __CFDictionary *v72;
  int32x2_t v73;
  int64x2_t v74;
  void *v75;
  float v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  BOOL v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  id v90;
  const __CFDictionary *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  unint64_t v96;
  NSObject *v97;
  __int128 v98;
  __int128 v99;
  void *v100;
  void *v101;
  BOOL v102;
  void *v103;
  _BOOL4 v104;
  id obj;
  void *v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  CMTime time;
  CMTimeRange range;
  CMTime v115;
  CMTime v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _OWORD v121[3];
  CMTime duration;
  CMTime start;
  _OWORD v124[3];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  id v130;
  objc_super v131;
  CMTime rhs;
  CMTime lhs;
  _BYTE v134[128];
  _QWORD v135[2];
  _QWORD v136[2];
  CMTimeRange buf;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  v10 = a4;
  v111 = a5;
  v112 = a6;
  v131.receiver = self;
  v131.super_class = (Class)VCPSettlingEffectAnalyzer;
  v11 = -[VCPSettlingEffectAnalyzer init](&v131, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v109, "fileExistsAtPath:", CFSTR("/tmp/com.apple.mediaanalysisd/")) & 1) != 0)
    {
      v108 = 0;
    }
    else
    {
      v130 = 0;
      v13 = objc_msgSend(v109, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1, 0, &v130);
      v108 = v130;
      if ((v13 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v108, "description");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v38;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", (uint8_t *)&buf, 0xCu);

        }
        v12 = 0;
        goto LABEL_41;
      }
    }
    v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("MetaAdjusterResults"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getFrameSize:", v10);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v11, "getCleanApertureFrameSize:", v10);
    v19 = v18;
    v21 = v20;
    v22 = objc_msgSend(MEMORY[0x1E0D20B80], "getUsageFromSizeWidth:height:", (unint64_t)v15, (unint64_t)v17);
    if (!v111)
      goto LABEL_39;
    v23 = v22;
    if (v22 == -1)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video resolution not supported", (uint8_t *)&buf, 2u);
      }
      goto LABEL_39;
    }
    v11[360] = 0;
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("UserInitiatedMode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11[320] = objc_msgSend(v24, "BOOLValue");

    v11[321] = 0;
    v11[322] = 0;
    v11[323] = 0;
    v11[324] = 0;
    *((_DWORD *)v11 + 82) = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v11 + 42);
    *((_QWORD *)v11 + 42) = v25;

    objc_msgSend(v10, "nominalFrameRate");
    if (v27 >= 20.0)
      goto LABEL_14;
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Asset has low frame rate", (uint8_t *)&buf, 2u);
    }
    v11[321] = 1;
    if (+[VCPSettlingEffectAnalyzer disableVideoQualityGating](VCPSettlingEffectAnalyzer, "disableVideoQualityGating")|| v11[320])
    {
LABEL_14:
      v11[361] = 0;
      objc_storeStrong((id *)v11 + 21, a4);
      v28 = (void *)*((_QWORD *)v11 + 2);
      *((_QWORD *)v11 + 2) = 0;

      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@frc-tmp-%@.MOV"), CFSTR("/tmp/com.apple.mediaanalysisd/"), v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)*((_QWORD *)v11 + 18);
      *((_QWORD *)v11 + 18) = v32;

      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (v35)
      {
        objc_msgSend(v10, "asset");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
          objc_msgSend(v39, "vcp_livePhotoStillDisplayTime");
        else
          memset(&buf, 0, 24);
        epoch = buf.start.epoch;
        *((_OWORD *)v11 + 6) = *(_OWORD *)&buf.start.value;
        *((_QWORD *)v11 + 14) = epoch;

      }
      else
      {
        objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
        v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&buf.start, v36);
        v37 = buf.start.epoch;
        *((_OWORD *)v11 + 6) = *(_OWORD *)&buf.start.value;
        *((_QWORD *)v11 + 14) = v37;

      }
      v42 = *((_QWORD *)v11 + 14);
      v128 = *((_OWORD *)v11 + 6);
      v129 = v42;
      +[VCPSettlingEffectAnalyzer getFramePTSList:before:withOptions:](VCPSettlingEffectAnalyzer, "getFramePTSList:before:withOptions:", v10, &v128, v112);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)*((_QWORD *)v11 + 23);
      *((_QWORD *)v11 + 23) = v43;

      if (!objc_msgSend(*((id *)v11 + 23), "count"))
        goto LABEL_39;
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("CustomRetimingCurve"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
        objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("CustomRetimingCurve"));
      else
        +[VCPSettlingEffectAnalyzer getRetimingCurve](VCPSettlingEffectAnalyzer, "getRetimingCurve");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)v11 + 24, v46);

      v47 = objc_msgSend(*((id *)v11 + 23), "count");
      if (v47 > objc_msgSend(*((id *)v11 + 24), "count"))
      {
        *((_QWORD *)v11 + 5) = 0;
        objc_msgSend(*((id *)v11 + 23), "objectAtIndexedSubscript:", objc_msgSend(*((id *)v11 + 23), "count") - objc_msgSend(*((id *)v11 + 24), "count"));
        v48 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&buf.start, v48);
        v49 = (__int128 *)(v11 + 48);
        v50 = buf.start.epoch;
        *((_OWORD *)v11 + 3) = *(_OWORD *)&buf.start.value;
        *((_QWORD *)v11 + 8) = v50;

        CMTimeMakeWithSeconds(&buf.start, 0.0333333333, objc_msgSend(v10, "naturalTimeScale"));
        v51 = buf.start.epoch;
        *(_OWORD *)(v11 + 120) = *(_OWORD *)&buf.start.value;
        *((_QWORD *)v11 + 17) = v51;
        v52 = objc_alloc_init(MEMORY[0x1E0D20B80]);
        v53 = (void *)*((_QWORD *)v11 + 1);
        *((_QWORD *)v11 + 1) = v52;

        if (*((_QWORD *)v11 + 1))
        {
          objc_msgSend(*((id *)v11 + 1), "setQualityMode:", +[VCPSettlingEffectAnalyzer getFRCQualityMode](VCPSettlingEffectAnalyzer, "getFRCQualityMode"));
          if (v10)
          {
            objc_msgSend(v10, "preferredTransform");
          }
          else
          {
            v126 = 0u;
            v127 = 0u;
            v125 = 0u;
          }
          v54 = (void *)*((_QWORD *)v11 + 1);
          v124[0] = v125;
          v124[1] = v126;
          v124[2] = v127;
          objc_msgSend(v54, "setPreferredTransform:", v124);
          objc_msgSend(*((id *)v11 + 1), "setUseCase:", 1);
          objc_msgSend(*((id *)v11 + 1), "setGatingLevel:", 2 * v11[320]);
          if (objc_msgSend(*((id *)v11 + 1), "startSessionWithUsage:", v23) == -22000)
          {
            v55 = *v49;
            start.epoch = *((_QWORD *)v11 + 8);
            *(_OWORD *)&start.value = v55;
            v56 = *((_OWORD *)v11 + 6);
            lhs.epoch = *((_QWORD *)v11 + 14);
            *(_OWORD *)&lhs.value = v56;
            v57 = *v49;
            rhs.epoch = *((_QWORD *)v11 + 8);
            *(_OWORD *)&rhs.value = v57;
            CMTimeSubtract(&duration, &lhs, &rhs);
            CMTimeRangeMake(&buf, &start, &duration);
            v59 = *(_OWORD *)&buf.start.epoch;
            v58 = *(_OWORD *)&buf.duration.timescale;
            *(_OWORD *)(v11 + 364) = *(_OWORD *)&buf.start.value;
            *(_OWORD *)(v11 + 380) = v59;
            *(_OWORD *)(v11 + 396) = v58;
            v60 = objc_alloc(MEMORY[0x1E0C8AFD0]);
            objc_msgSend(v10, "asset");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v60, "initWithAsset:error:", v61, 0);
            v63 = (void *)*((_QWORD *)v11 + 19);
            *((_QWORD *)v11 + 19) = v62;

            v64 = (void *)*((_QWORD *)v11 + 19);
            v65 = *(_OWORD *)(v11 + 364);
            v66 = *(_OWORD *)(v11 + 396);
            v121[1] = *(_OWORD *)(v11 + 380);
            v121[2] = v66;
            v121[0] = v65;
            objc_msgSend(v64, "setTimeRange:", v121);
            objc_msgSend(v10, "asset");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v61) = objc_msgSend(v11, "setupLivePhotoInfoOutput:", v67);

            if (!(_DWORD)v61)
            {
              *((_QWORD *)v11 + 22) = 0;
              objc_msgSend(v11, "getPixelBasedHomographies:withCleanApertureSize:", v111, v19, v21);
              v70 = objc_claimAutoreleasedReturnValue();
              v71 = (void *)*((_QWORD *)v11 + 25);
              *((_QWORD *)v11 + 25) = v70;

              objc_msgSend(*((id *)v11 + 25), "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9D0]);
              v72 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v72, (CGRect *)v11 + 7);

              v73 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(*((float64x2_t *)v11 + 15))));
              v74.i64[0] = (int)(v73.i32[0] & 0xFFFFFFFE);
              v74.i64[1] = (int)(v73.i32[1] & 0xFFFFFFFE);
              *((float64x2_t *)v11 + 15) = vcvtq_f64_s64(v74);
              *((_OWORD *)v11 + 16) = *((_OWORD *)v11 + 15);
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *((_QWORD *)v11 + 18));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "estimatedDataRate");
              +[VCPMovieAssetWriter assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:](VCPMovieAssetWriter, "assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:", v75, v10, (uint64_t)v76, 0, *((double *)v11 + 32), *((double *)v11 + 33));
              v77 = objc_claimAutoreleasedReturnValue();
              v78 = (void *)*((_QWORD *)v11 + 3);
              *((_QWORD *)v11 + 3) = v77;

              v79 = (void *)*((_QWORD *)v11 + 3);
              if (v79)
              {
                if (!objc_msgSend(v79, "dispatchEncoding"))
                {
                  v80 = (void *)MEMORY[0x1E0C9DD90];
                  v135[0] = *MEMORY[0x1E0C9DFC0];
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v135[1] = *MEMORY[0x1E0C9DF68];
                  v136[0] = v81;
                  v136[1] = MEMORY[0x1E0C9AAB0];
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "contextWithOptions:", v82);
                  v83 = objc_claimAutoreleasedReturnValue();
                  v84 = (void *)*((_QWORD *)v11 + 26);
                  *((_QWORD *)v11 + 26) = v83;

                  *((_QWORD *)v11 + 27) = 0;
                  v85 = +[VCPSettlingEffectAnalyzer disableBurstFrameDropGating](VCPSettlingEffectAnalyzer, "disableBurstFrameDropGating");
                  v68 = v11;
                  if (!v85)
                  {
                    v119 = 0u;
                    v120 = 0u;
                    v118 = 0u;
                    v117 = 0u;
                    obj = v106;
                    v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
                    if (v86)
                    {
                      v87 = *(_QWORD *)v118;
                      do
                      {
                        for (i = 0; i != v86; ++i)
                        {
                          if (*(_QWORD *)v118 != v87)
                            objc_enumerationMutation(obj);
                          objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
                          v89 = (void *)objc_claimAutoreleasedReturnValue();
                          v90 = objc_alloc_init(MEMORY[0x1E0D20B90]);
                          objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("MetaItemPTSResultsKey"));
                          v91 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                          CMTimeMakeFromDictionary(&v116, v91);
                          v115 = v116;
                          objc_msgSend(v90, "setPresentationTimeStamp:", &v115);

                          objc_msgSend(v107, "addObject:", v90);
                        }
                        v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
                      }
                      while (v86);
                    }

                    v92 = objc_alloc_init(MEMORY[0x1E0D20B78]);
                    v93 = (void *)*((_QWORD *)v11 + 43);
                    *((_QWORD *)v11 + 43) = v92;

                    objc_msgSend(*((id *)v11 + 43), "detectFrameDropsFromFrameTimingList:", v107);
                    v94 = objc_claimAutoreleasedReturnValue();
                    v95 = (void *)*((_QWORD *)v11 + 44);
                    *((_QWORD *)v11 + 44) = v94;

                    v96 = 0;
                    v97 = MEMORY[0x1E0C81028];
                    while (v96 < objc_msgSend(*((id *)v11 + 44), "count"))
                    {
                      v98 = *(_OWORD *)(v11 + 364);
                      v99 = *(_OWORD *)(v11 + 396);
                      *(_OWORD *)&range.start.epoch = *(_OWORD *)(v11 + 380);
                      *(_OWORD *)&range.duration.timescale = v99;
                      *(_OWORD *)&range.start.value = v98;
                      objc_msgSend(*((id *)v11 + 44), "objectAtIndexedSubscript:", v96);
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      v101 = v100;
                      if (v100)
                        objc_msgSend(v100, "presentationTimeStamp");
                      else
                        memset(&time, 0, sizeof(time));
                      v102 = CMTimeRangeContainsTime(&range, &time) == 0;

                      if (!v102)
                      {
                        objc_msgSend(*((id *)v11 + 44), "objectAtIndexedSubscript:", v96);
                        v103 = (void *)objc_claimAutoreleasedReturnValue();
                        v104 = objc_msgSend(v103, "frameIsAtBigGap") > 3;

                        if (v104)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                          {
                            LOWORD(buf.start.value) = 0;
                            _os_log_impl(&dword_1B6C4A000, v97, OS_LOG_TYPE_DEFAULT, "Asset has burst frame drops", (uint8_t *)&buf, 2u);
                          }
                          v11[321] = 1;
                          if (!v11[320])
                            goto LABEL_65;
                        }
                      }
                      ++v96;
                    }
                    goto LABEL_66;
                  }
LABEL_40:
                  v12 = v68;

LABEL_41:
                  goto LABEL_42;
                }
              }
            }
          }
        }
LABEL_39:
        v68 = 0;
        v11[360] = 1;
        goto LABEL_40;
      }
      v11[325] = 1;
      v11[360] = 1;
    }
    else
    {
LABEL_65:
      v11[360] = 1;
      *((_QWORD *)v11 + 39) = 4;
    }
LABEL_66:
    v68 = v11;
    goto LABEL_40;
  }
  v12 = 0;
LABEL_42:

  return v12;
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
  -[VCPSettlingEffectAnalyzer findLivePhotoInfoOutput:](self, "findLivePhotoInfoOutput:", v4);
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

- (void)dealloc
{
  opaqueCMSampleBuffer *previousMetadata;
  FRCFrameInterpolator *frameInterpolator;
  objc_super v5;

  if (-[VCPMovieAssetWriter status](self->_assetWriter, "status") == 1)
    -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
  previousMetadata = self->_previousMetadata;
  if (previousMetadata)
  {
    CFRelease(previousMetadata);
    self->_previousMetadata = 0;
  }
  -[AVAssetReader cancelReading](self->_assetReader, "cancelReading");
  if (self->_processAborted)
  {
    frameInterpolator = self->_frameInterpolator;
    if (frameInterpolator)
    {
      if (-[FRCFrameInterpolator state](frameInterpolator, "state") == 2)
        -[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession");
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPSettlingEffectAnalyzer;
  -[VCPSettlingEffectAnalyzer dealloc](&v5, sel_dealloc);
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int v9;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  opaqueCMSampleBuffer *v30;
  CMItemCount NumSamples;
  opaqueCMSampleBuffer *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  const __CFDictionary *v36;
  int64_t var0;
  const __CFDictionary *v38;
  _BOOL4 v39;
  id v40;
  NSObject *v41;
  const char *v42;
  const __CFDictionary *v43;
  int64_t v44;
  double x;
  double y;
  double width;
  double height;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  __CVBuffer *value;
  VCPMovieAssetWriter *assetWriter;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  __CVBuffer *v70;
  unint64_t timingCurveIdx;
  const void **p_buf;
  void *v73;
  int v74;
  id v75;
  CMTimeValue v76;
  FRCFrameInterpolator *frameInterpolator;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  BOOL v82;
  uint64_t v83;
  VCPMovieAssetWriter *v84;
  uint64_t v85;
  opaqueCMSampleBuffer *previousMetadata;
  void *v87;
  float v88;
  NSDictionary *v89;
  NSDictionary *FRCStatistics;
  id v91;
  uint64_t v92;
  id v93;
  int64_t v94;
  opaqueCMSampleBuffer *v95;
  uint64_t v96;
  void *v97;
  VCPMovieAssetWriter *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  opaqueCMSampleBuffer *v102;
  void *v103;
  void *v104;
  int32_t v105;
  opaqueCMSampleBuffer *v106;
  uint64_t v107;
  uint64_t v108;
  $95D729B680665BEAEFA1D6FCA8238556 *p_outputFrameDuration;
  $95D729B680665BEAEFA1D6FCA8238556 *p_anchorPTS;
  id obj;
  void *v112;
  id *location;
  void *context;
  CMTime v115;
  CMTime v116;
  _QWORD v117[3];
  _QWORD v118[3];
  id v119;
  CMTime v120;
  __int128 v121;
  int64_t var3;
  _QWORD v123[3];
  _QWORD v124[3];
  CMTime v125;
  CMTime v126;
  CMTime v127;
  CMTime v128;
  __int128 v129;
  int64_t epoch;
  CFTypeRef cf;
  CMTime rhs;
  CMTime time2;
  uint64_t v134;
  uint64_t v135;
  $95D729B680665BEAEFA1D6FCA8238556 buf;
  uint64_t v137;
  CGRect CleanRect;

  v137 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCA1B2C](self, a2, a3, a4, a5, a6);
  if (self->_processAborted)
  {
LABEL_2:
    v9 = 0;
    goto LABEL_3;
  }
  location = (id *)&self->_previousFrame;
  if (self->_previousFrame)
  {
    v11 = -[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer");
    if (v11)
    {
      v12 = (void *)v11;
      while (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v12))
      {
        CFRelease(v12);
        v12 = (void *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer");
        if (!v12)
          goto LABEL_9;
      }
      v33 = (_QWORD *)MEMORY[0x1E0D3A9E8];
      -[NSDictionary objectForKeyedSubscript:](self->_pixelBasedHomogrphies, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9E8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", self->_frameIdx);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v128, 0, sizeof(v128));
      objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F8]);
      v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v128, v36);

      buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
      time2 = v128;
      if (CMTimeCompare((CMTime *)&buf, &time2))
      {
        self->_metadataIntegrityFailure = 1;
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          var0 = a4->var0;
          LODWORD(buf.value) = 134218240;
          *(int64_t *)((char *)&buf.value + 4) = var0;
          LOWORD(buf.flags) = 2048;
          *(_QWORD *)((char *)&buf.flags + 2) = v128.value;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: %lld vs. %lld", (uint8_t *)&buf, 0x16u);
        }
        buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
        time2 = v128;
        if (CMTimeCompare((CMTime *)&buf, &time2) >= 1)
        {
          buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
          time2 = v128;
          CMTimeSubtract(&rhs, (CMTime *)&buf, &time2);
          CMTimeMake(&v127, 2, 600);
          buf = ($95D729B680665BEAEFA1D6FCA8238556)rhs;
          time2 = v127;
          if (CMTimeCompare((CMTime *)&buf, &time2) > 0)
            goto LABEL_130;
        }
        buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
        time2 = v128;
        if (CMTimeCompare((CMTime *)&buf, &time2) < 0)
        {
          buf = ($95D729B680665BEAEFA1D6FCA8238556)v128;
          time2 = (CMTime)*a4;
          CMTimeSubtract(&v126, (CMTime *)&buf, &time2);
          CMTimeMake(&v125, 2, 600);
          buf = ($95D729B680665BEAEFA1D6FCA8238556)v126;
          time2 = v125;
          if (CMTimeCompare((CMTime *)&buf, &time2) > 0)
            goto LABEL_130;
        }
        if (!+[VCPSettlingEffectAnalyzer disableMetadataIntegrityCheck](VCPSettlingEffectAnalyzer, "disableMetadataIntegrityCheck"))
        {
LABEL_130:
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Live photo info and video frame timestamp difference exceeds threshold", (uint8_t *)&buf, 2u);
          }
          self->_processAborted = 1;
          -[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession");
          -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");

          goto LABEL_2;
        }
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: Relaxing threshold", (uint8_t *)&buf, 2u);
        }
      }
      buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
      time2 = (CMTime)self->_settlingStartPTS;
      if (CMTimeCompare((CMTime *)&buf, &time2) <= 0)
      {
        buf.value = 0;
        x = self->_cleanApertureRect.origin.x;
        y = self->_cleanApertureRect.origin.y;
        width = self->_cleanApertureRect.size.width;
        height = self->_cleanApertureRect.size.height;
        v49 = self->_cropRect.origin.x;
        v50 = self->_cropRect.origin.y;
        v52 = self->_cropRect.size.width;
        v51 = self->_cropRect.size.height;
        -[NSDictionary objectForKeyedSubscript:](self->_pixelBasedHomogrphies, "objectForKeyedSubscript:", *v33);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", self->_frameIdx);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F0]);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        value = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", a3, v55, x, y, width, height, v49, v50, v52, v51);
        time2.value = (CMTimeValue)value;
        if (buf.value)
        {
          CFRelease((CFTypeRef)buf.value);
          value = (__CVBuffer *)time2.value;
        }
        buf.value = (int64_t)value;
        time2.value = 0;
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&time2);

        ++self->_frameIdx;
        if (!buf.value)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(time2.value) = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating stabilized video frame", (uint8_t *)&time2, 2u);
          }
          p_buf = (const void **)&buf;
          goto LABEL_76;
        }
        time2.value = 0;
        assetWriter = self->_assetWriter;
        v58 = objc_msgSend(*location, "buffer");
        if (*location)
          objc_msgSend(*location, "presentationTimeStamp");
        else
          memset(v124, 0, sizeof(v124));
        v9 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](assetWriter, "addPixelBuffer:withTime:withAttachment:", v58, v124, 0);
        if (!v9)
        {
          previousMetadata = self->_previousMetadata;
          if (*location)
            objc_msgSend(*location, "presentationTimeStamp");
          else
            memset(v123, 0, sizeof(v123));
          v9 = -[VCPSettlingEffectAnalyzer createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:](self, "createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:", previousMetadata, v123, 0, &time2);
          if (!v9)
          {
            v9 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", time2.value);
            if (!v9)
            {
              v91 = objc_alloc(MEMORY[0x1E0D20B70]);
              v121 = *(_OWORD *)&a4->var0;
              var3 = a4->var3;
              v92 = objc_msgSend(v91, "initWithBuffer:presentationTimeStamp:", buf.value, &v121);
              v93 = *location;
              *location = (id)v92;

              v94 = a4->var3;
              *(_OWORD *)&self->_anchorPTS.value = *(_OWORD *)&a4->var0;
              self->_anchorPTS.epoch = v94;
              ++self->_anchorIndex;
              CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
              goto LABEL_32;
            }
          }
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
        v112 = 0;
        v40 = 0;
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_framePTSList, "objectAtIndexedSubscript:", -[NSArray count](self->_framePTSList, "count") - 1);
        v38 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v127, v38);
        CMTimeMake(&v126, 2, 600);
        buf = ($95D729B680665BEAEFA1D6FCA8238556)v127;
        time2 = v126;
        CMTimeAdd(&rhs, (CMTime *)&buf, &time2);
        buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
        time2 = rhs;
        v39 = CMTimeCompare((CMTime *)&buf, &time2) < 1;

        if (!v39)
        {
LABEL_32:
          v40 = 0;
          v112 = 0;
LABEL_33:
          v9 = 0;
LABEL_100:

          goto LABEL_3;
        }
        v125.value = 0;
        v59 = self->_cleanApertureRect.origin.x;
        v60 = self->_cleanApertureRect.origin.y;
        v61 = self->_cleanApertureRect.size.width;
        v62 = self->_cleanApertureRect.size.height;
        v63 = self->_cropRect.origin.x;
        v64 = self->_cropRect.origin.y;
        v66 = self->_cropRect.size.width;
        v65 = self->_cropRect.size.height;
        -[NSDictionary objectForKeyedSubscript:](self->_pixelBasedHomogrphies, "objectForKeyedSubscript:", *v33);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectAtIndexedSubscript:", self->_frameIdx);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F0]);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", a3, v69, v59, v60, v61, v62, v63, v64, v66, v65);
        buf.value = (int64_t)v70;
        if (v125.value)
        {
          CFRelease((CFTypeRef)v125.value);
          v70 = (__CVBuffer *)buf.value;
        }
        v125.value = (CMTimeValue)v70;
        buf.value = 0;
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);

        ++self->_frameIdx;
        cf = 0;
        timingCurveIdx = self->_timingCurveIdx;
        if (timingCurveIdx > -[NSArray count](self->_timingCurveList, "count") - 1)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Inconsistency in frame timestamp list and decoded video frames", (uint8_t *)&buf, 2u);
          }
          p_buf = (const void **)&v125;
LABEL_76:
          CF<opaqueCMSampleBuffer *>::~CF(p_buf);
          v112 = 0;
          v40 = 0;
          v9 = -18;
          goto LABEL_99;
        }
        memset(&v127, 0, sizeof(v127));
        -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "count");
        buf = self->_outputFrameDuration;
        p_outputFrameDuration = &self->_outputFrameDuration;
        CMTimeMultiply(&v127, (CMTime *)&buf, v74 + 1);

        v75 = objc_alloc(MEMORY[0x1E0D20B70]);
        v76 = v125.value;
        buf = self->_anchorPTS;
        p_anchorPTS = &self->_anchorPTS;
        time2 = v127;
        CMTimeAdd(&v120, (CMTime *)&buf, &time2);
        obj = (id)objc_msgSend(v75, "initWithBuffer:presentationTimeStamp:", v76, &v120);
        frameInterpolator = self->_frameInterpolator;
        v78 = *location;
        -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0;
        -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](frameInterpolator, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v78, obj, v79, &v119);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v119;

        if (objc_msgSend(v40, "code") == -22006
          || (v80 = objc_msgSend(v112, "count"),
              -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx), v81 = (void *)objc_claimAutoreleasedReturnValue(), v82 = v80 == objc_msgSend(v81, "count"), v81, !v82))
        {
          self->_processAborted = 1;
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v40, "localizedDescription");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.value) = 138412290;
            *(int64_t *)((char *)&buf.value + 4) = (int64_t)v87;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "FRC gating not passed: %@", (uint8_t *)&buf, 0xCu);

          }
          -[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession");
          self->_FRCRecommendation = -[FRCFrameInterpolator recommendation](self->_frameInterpolator, "recommendation");
          -[FRCFrameInterpolator sessionConfidence](self->_frameInterpolator, "sessionConfidence");
          self->_FRCConfidence = v88;
          -[FRCFrameInterpolator sessionStatistics](self->_frameInterpolator, "sessionStatistics");
          v89 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          FRCStatistics = self->_FRCStatistics;
          self->_FRCStatistics = v89;

          self->_FRCGatingFailure = 1;
          -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");

          CF<opaqueCMSampleBuffer *>::~CF((const void **)&v125);
          goto LABEL_33;
        }
        v83 = objc_msgSend(v112, "count");
        v84 = self->_assetWriter;
        v85 = objc_msgSend(*location, "buffer");
        if (*location)
          objc_msgSend(*location, "presentationTimeStamp");
        else
          memset(v118, 0, sizeof(v118));
        v9 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](v84, "addPixelBuffer:withTime:withAttachment:", v85, v118, 0);
        if (v9)
          goto LABEL_109;
        v95 = self->_previousMetadata;
        if (*location)
          objc_msgSend(*location, "presentationTimeStamp");
        else
          memset(v117, 0, sizeof(v117));
        v9 = -[VCPSettlingEffectAnalyzer createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:](self, "createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:", v95, v117, 0, &cf);
        if (v9
          || (v9 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", cf)) != 0)
        {
LABEL_109:

          CF<opaqueCMSampleBuffer *>::~CF((const void **)&v125);
          goto LABEL_99;
        }
        v108 = v83;
        if (v83)
        {
          v96 = 0;
          v107 = *MEMORY[0x1E0CA26D0];
          while (1)
          {
            v134 = v107;
            v135 = MEMORY[0x1E0C9AAB0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1, v107);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = self->_assetWriter;
            objc_msgSend(v112, "objectAtIndexedSubscript:", v96);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "buffer");
            *(_OWORD *)&buf.value = *(_OWORD *)&p_outputFrameDuration->value;
            buf.epoch = self->_outputFrameDuration.epoch;
            v101 = v96 + 1;
            CMTimeMultiply(&rhs, (CMTime *)&buf, v96 + 1);
            *(_OWORD *)&buf.value = *(_OWORD *)&p_anchorPTS->value;
            buf.epoch = self->_anchorPTS.epoch;
            time2 = rhs;
            CMTimeAdd(&v116, (CMTime *)&buf, &time2);
            v9 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](v98, "addPixelBuffer:withTime:withAttachment:", v100, &v116, v97);

            if (v9)
              break;
            v102 = self->_previousMetadata;
            *(_OWORD *)&buf.value = *(_OWORD *)&p_outputFrameDuration->value;
            buf.epoch = self->_outputFrameDuration.epoch;
            CMTimeMultiply(&rhs, (CMTime *)&buf, v96 + 1);
            *(_OWORD *)&buf.value = *(_OWORD *)&p_anchorPTS->value;
            buf.epoch = self->_anchorPTS.epoch;
            time2 = rhs;
            CMTimeAdd(&v115, (CMTime *)&buf, &time2);
            v9 = -[VCPSettlingEffectAnalyzer createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:](self, "createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:", v102, &v115, 1, &cf);
            if (v9)
              break;
            v9 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", cf);

            if (v9)
              goto LABEL_109;
            ++v96;
            if (v108 == v101)
              goto LABEL_116;
          }

          goto LABEL_109;
        }
LABEL_116:
        memset(&v126, 0, sizeof(v126));
        *(_OWORD *)&buf.value = *(_OWORD *)&p_outputFrameDuration->value;
        buf.epoch = self->_outputFrameDuration.epoch;
        CMTimeMultiply(&v126, (CMTime *)&buf, v108 + 1);
        *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
        time2.epoch = self->_anchorPTS.epoch;
        rhs = v126;
        CMTimeAdd((CMTime *)&buf, &time2, &rhs);
        *(_OWORD *)&p_anchorPTS->value = *(_OWORD *)&buf.value;
        self->_anchorPTS.epoch = buf.epoch;
        objc_msgSend(v112, "objectAtIndexedSubscript:", v108 - 1);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v103;
        if (v103)
          objc_msgSend(v103, "presentationTimeStamp");
        else
          memset(&rhs, 0, sizeof(rhs));
        buf = ($95D729B680665BEAEFA1D6FCA8238556)rhs;
        *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
        time2.epoch = self->_anchorPTS.epoch;
        v105 = CMTimeCompare((CMTime *)&buf, &time2);

        if (v105 < 0)
        {
          objc_storeStrong(location, obj);
          v106 = self->_previousMetadata;
          if (v106)
          {
            CFRelease(v106);
            self->_previousMetadata = 0;
          }
          v9 = 0;
          self->_previousMetadata = (opaqueCMSampleBuffer *)v12;
          ++self->_anchorIndex;
          ++self->_timingCurveIdx;
        }
        else
        {
          v9 = -18;
        }

        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v125);
        if (v105 < 0)
          goto LABEL_33;
      }
LABEL_99:
      self->_processAborted = 1;
      CFRelease(v12);
      -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
      goto LABEL_100;
    }
LABEL_9:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Inconsistent number of metadata and video frames", (uint8_t *)&buf, 2u);
    }
    v9 = -18;
  }
  else
  {
    CMTimeMake((CMTime *)&buf, 0, 600);
    self->_anchorPTS = buf;
    CleanRect = CVImageBufferGetCleanRect(a3);
    v13 = CleanRect.origin.x;
    v14 = CleanRect.origin.y;
    v15 = CleanRect.size.width;
    v16 = CleanRect.size.height;
    self->_cleanApertureRect = CleanRect;
    cf = 0;
    v17 = self->_cropRect.origin.x;
    v18 = self->_cropRect.origin.y;
    v20 = self->_cropRect.size.width;
    v19 = self->_cropRect.size.height;
    v21 = (_QWORD *)MEMORY[0x1E0D3A9E8];
    -[NSDictionary objectForKeyedSubscript:](self->_pixelBasedHomogrphies, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9E8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", self->_frameIdx);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    cf = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", a3, v24, v13, v14, v15, v16, v17, v18, v20, v19);
    buf.value = 0;
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);

    -[NSDictionary objectForKeyedSubscript:](self->_pixelBasedHomogrphies, "objectForKeyedSubscript:", *v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", self->_frameIdx);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    ++self->_frameIdx;
    if (cf)
    {
      v27 = objc_alloc(MEMORY[0x1E0D20B70]);
      v129 = *(_OWORD *)&self->_anchorPTS.value;
      epoch = self->_anchorPTS.epoch;
      v28 = objc_msgSend(v27, "initWithBuffer:presentationTimeStamp:", cf, &v129);
      v29 = *location;
      *location = (id)v28;

      self->_anchorIndex = 0;
      while (1)
      {
        v30 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_livePhotoInfoOutput, "copyNextSampleBuffer");
        self->_previousMetadata = v30;
        if (!v30)
          break;
        NumSamples = CMSampleBufferGetNumSamples(v30);
        v32 = self->_previousMetadata;
        if (NumSamples)
        {
          if (v32)
          {
            memset(&rhs, 0, sizeof(rhs));
            objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9F8]);
            v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            CMTimeMakeFromDictionary(&rhs, v43);

            buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
            time2 = rhs;
            if (CMTimeCompare((CMTime *)&buf, &time2))
            {
              self->_metadataIntegrityFailure = 1;
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v44 = a4->var0;
                LODWORD(buf.value) = 134218240;
                *(int64_t *)((char *)&buf.value + 4) = v44;
                LOWORD(buf.flags) = 2048;
                *(_QWORD *)((char *)&buf.flags + 2) = rhs.value;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: %lld vs. %lld", (uint8_t *)&buf, 0x16u);
              }
              buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
              time2 = rhs;
              if (CMTimeCompare((CMTime *)&buf, &time2) >= 1)
              {
                buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
                time2 = rhs;
                CMTimeSubtract(&v128, (CMTime *)&buf, &time2);
                CMTimeMake(&v127, 2, 600);
                buf = ($95D729B680665BEAEFA1D6FCA8238556)v128;
                time2 = v127;
                if (CMTimeCompare((CMTime *)&buf, &time2) > 0)
                  goto LABEL_131;
              }
              buf = ($95D729B680665BEAEFA1D6FCA8238556)*a4;
              time2 = rhs;
              if (CMTimeCompare((CMTime *)&buf, &time2) < 0)
              {
                buf = ($95D729B680665BEAEFA1D6FCA8238556)rhs;
                time2 = (CMTime)*a4;
                CMTimeSubtract(&v126, (CMTime *)&buf, &time2);
                CMTimeMake(&v125, 2, 600);
                buf = ($95D729B680665BEAEFA1D6FCA8238556)v126;
                time2 = v125;
                if (CMTimeCompare((CMTime *)&buf, &time2) > 0)
                  goto LABEL_131;
              }
              if (!+[VCPSettlingEffectAnalyzer disableMetadataIntegrityCheck](VCPSettlingEffectAnalyzer, "disableMetadataIntegrityCheck"))
              {
LABEL_131:
                if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  LOWORD(buf.value) = 0;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Live photo info and video frame timestamp difference exceeds threshold", (uint8_t *)&buf, 2u);
                }
                self->_processAborted = 1;
                -[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession");
                -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
              }
              else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                LOWORD(buf.value) = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Inconsistent live photo info and video frame timestamp: Relaxing threshold", (uint8_t *)&buf, 2u);
              }
            }
            v9 = 0;
            goto LABEL_54;
          }
          break;
        }
        if (v32)
        {
          CFRelease(v32);
          self->_previousMetadata = 0;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        v41 = MEMORY[0x1E0C81028];
        v42 = "Inconsistent number of metadata and video frames";
        goto LABEL_52;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      v41 = MEMORY[0x1E0C81028];
      v42 = "Error creating stabilized video frame";
LABEL_52:
      _os_log_impl(&dword_1B6C4A000, v41, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&buf, 2u);
    }
    v9 = -18;
LABEL_54:

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
LABEL_3:
  objc_autoreleasePoolPop(context);
  return v9;
}

- (int)createLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3 withTimestamp:(id *)a4 isInterpolated:(BOOL)a5 updatedSample:(opaqueCMSampleBuffer *)a6
{
  OpaqueCMBlockBuffer *DataBuffer;
  const opaqueCMFormatDescription *FormatDescription;
  size_t v12;
  uint64_t v13;
  size_t v14;
  unsigned int v15;
  void *v16;
  char v17;
  OSStatus v18;
  size_t v19;
  _DWORD *v20;
  int v21;
  const __CFAllocator *v22;
  CMBlockBufferRef v23;
  BOOL v24;
  __int128 v25;
  CMTimeEpoch v26;
  __int128 v27;
  CMTimeEpoch var3;
  BOOL v29;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  CMBlockBufferRef theBuffer;
  uint64_t v34;
  char *dataPointerOut;
  size_t totalLengthOut;
  size_t lengthAtOffsetOut;

  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  totalLengthOut = 0;
  lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut);
  if (!dataPointerOut)
    return -18;
  v12 = 0;
  v34 = 0;
  v13 = *MEMORY[0x1E0D053E0];
  while (v12 < totalLengthOut)
  {
    v14 = v12;
    v15 = *(_DWORD *)&dataPointerOut[v12];
    FigMetadataFormatDescriptionGetIdentifierForLocalID();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v13);
    v12 = v14 + bswap32(v15);

    if ((v17 & 1) != 0)
      goto LABEL_8;
  }
  v14 = 0;
LABEL_8:
  FigLivePhotoMetadataComputeSerializationSizeV3();
  v19 = v34 + 8;
  v20 = malloc_type_malloc(v34 + 8, 0xB8D3EC62uLL);
  bzero(v20, v34 + 8);
  *v20 = bswap32(v34 + 8);
  v21 = *(_DWORD *)&dataPointerOut[v14 + 4];
  *((_WORD *)v20 + 25) = 128;
  v20[1] = v21;
  v20[2] = 3;
  *((_WORD *)v20 + 36) = 32;
  *((_BYTE *)v20 + 130) = a5;
  theBuffer = 0;
  v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v18 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20, v19, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, v19, 0, &theBuffer);
  v23 = theBuffer;
  if (v18)
    v24 = 1;
  else
    v24 = theBuffer == 0;
  if (!v24)
  {
    v25 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v25;
    v26 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v27 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v27;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    sampleTimingArray.decodeTimeStamp.epoch = v26;
    sampleTimingArray.presentationTimeStamp.epoch = var3;
    sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
    v18 = CMSampleBufferCreate(v22, theBuffer, 1u, 0, 0, FormatDescription, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, a6);
    v23 = theBuffer;
  }
  if (v18)
    v29 = v23 == 0;
  else
    v29 = 0;
  if (v29)
  {
    free(v20);
  }
  else if (v23)
  {
    CFRelease(v23);
  }
  return v18;
}

- (int)finishAnalysisPass:(id *)a3 withStillImageBuffer:(__CVBuffer *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t timingCurveIdx;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __CVBuffer *v17;
  FRCFrameInterpolator *frameInterpolator;
  FRCFrame *previousFrame;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  VCPMovieAssetWriter *assetWriter;
  uint64_t v25;
  FRCFrame *v26;
  opaqueCMSampleBuffer *previousMetadata;
  void *v28;
  float v29;
  NSDictionary *v30;
  NSDictionary *v31;
  opaqueCMSampleBuffer *v33;
  FRCFrame *v34;
  unint64_t v35;
  VCPMovieAssetWriter *v36;
  void *v37;
  uint64_t v38;
  opaqueCMSampleBuffer *v39;
  VCPMovieAssetWriter *v40;
  uint64_t v41;
  opaqueCMSampleBuffer *v42;
  float v43;
  NSDictionary *v44;
  NSDictionary *FRCStatistics;
  uint64_t v46;
  void *v47;
  $95D729B680665BEAEFA1D6FCA8238556 *p_anchorPTS;
  $95D729B680665BEAEFA1D6FCA8238556 *p_outputFrameDuration;
  const __CFDictionary *v50;
  _QWORD v51[3];
  _QWORD v52[3];
  CMTime v53;
  CMTime v54;
  CMTime v55;
  _QWORD v56[3];
  _QWORD v57[3];
  id v58;
  CMTime v59;
  CMTime v60;
  __CVBuffer *v61;
  __CVBuffer *v62;
  uint64_t v63;
  CMTime rhs;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];
  _QWORD v68[3];
  CMTime time;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v62 = 0;
  v63 = 0;
  v61 = 0;
  if (self->_processAborted)
  {
    v50 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
LABEL_3:
    v8 = 0;
LABEL_14:
    previousMetadata = self->_previousMetadata;
    if (previousMetadata)
    {
      CFRelease(previousMetadata);
      self->_previousMetadata = 0;
    }
    if (v8)
    {
      self->_processAborted = 1;
      if (-[VCPMovieAssetWriter status](self->_assetWriter, "status", a3, a4) == 1)
        -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
    }
    goto LABEL_23;
  }
  timingCurveIdx = self->_timingCurveIdx;
  if (timingCurveIdx != -[NSArray count](self->_timingCurveList, "count", a3) - 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(time.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Inconsistency in frame timestamp list and decoded video frames", (uint8_t *)&time, 2u);
    }
    v50 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    goto LABEL_13;
  }
  v61 = -[VCPSettlingEffectAnalyzer scaleStillImage:](self, "scaleStillImage:", a4);
  time.value = 0;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&time);
  v62 = -[VCPSettlingEffectAnalyzer resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:](self, "resamplePixelBuffer:cleanApertureRect:cropRect:homographyArray:", v61, &unk_1E6B75FF0, self->_cleanApertureRect.origin.x, self->_cleanApertureRect.origin.y, self->_cleanApertureRect.size.width, self->_cleanApertureRect.size.height, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  time.value = 0;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&time);
  v11 = *MEMORY[0x1E0CA8D98];
  v12 = *MEMORY[0x1E0CA8E98];
  v67[0] = *MEMORY[0x1E0CA8D68];
  v67[1] = v12;
  v13 = *MEMORY[0x1E0CA8EB0];
  v68[0] = v11;
  v68[1] = v13;
  v67[2] = *MEMORY[0x1E0CA8EE8];
  v68[2] = *MEMORY[0x1E0CA8F10];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
  v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMSetAttachments(v62, v50, 1u);
  -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  time = (CMTime)self->_outputFrameDuration;
  p_outputFrameDuration = &self->_outputFrameDuration;
  CMTimeMultiply(&rhs, &time, v15 + 1);
  v60 = rhs;

  v16 = objc_alloc(MEMORY[0x1E0D20B70]);
  v17 = v62;
  time = (CMTime)self->_anchorPTS;
  p_anchorPTS = &self->_anchorPTS;
  rhs = v60;
  CMTimeAdd(&v59, &time, &rhs);
  v6 = (void *)objc_msgSend(v16, "initWithBuffer:presentationTimeStamp:", v17, &v59);
  frameInterpolator = self->_frameInterpolator;
  previousFrame = self->_previousFrame;
  -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](frameInterpolator, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", previousFrame, v6, v20, &v58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v58;

  if (objc_msgSend(v5, "code") != -22006)
  {
    v21 = objc_msgSend(v7, "count");
    -[NSArray objectAtIndexedSubscript:](self->_timingCurveList, "objectAtIndexedSubscript:", self->_timingCurveIdx);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21 == objc_msgSend(v22, "count");

    if (v23)
    {
      assetWriter = self->_assetWriter;
      v25 = -[FRCFrame buffer](self->_previousFrame, "buffer");
      v26 = self->_previousFrame;
      if (v26)
        -[FRCFrame presentationTimeStamp](v26, "presentationTimeStamp");
      else
        memset(v57, 0, sizeof(v57));
      v8 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](assetWriter, "addPixelBuffer:withTime:withAttachment:", v25, v57, 0);
      if (v8)
        goto LABEL_14;
      v33 = self->_previousMetadata;
      v34 = self->_previousFrame;
      if (v34)
        -[FRCFrame presentationTimeStamp](v34, "presentationTimeStamp");
      else
        memset(v56, 0, sizeof(v56));
      v8 = -[VCPSettlingEffectAnalyzer createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:](self, "createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:", v33, v56, 0, &v63);
      if (v8)
        goto LABEL_14;
      v8 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", v63);
      if (v8)
        goto LABEL_14;
      v35 = 0;
      v46 = *MEMORY[0x1E0CA26D0];
      while (v35 < objc_msgSend(v7, "count", v46))
      {
        v65 = v46;
        v66 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = self->_assetWriter;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "buffer");
        *(_OWORD *)&time.value = *(_OWORD *)&p_outputFrameDuration->value;
        time.epoch = self->_outputFrameDuration.epoch;
        CMTimeMultiply(&v54, &time, v35 + 1);
        *(_OWORD *)&time.value = *(_OWORD *)&p_anchorPTS->value;
        time.epoch = self->_anchorPTS.epoch;
        rhs = v54;
        CMTimeAdd(&v55, &time, &rhs);
        v8 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](v36, "addPixelBuffer:withTime:withAttachment:", v38, &v55, v47);

        if (v8)
          goto LABEL_37;
        v39 = self->_previousMetadata;
        *(_OWORD *)&time.value = *(_OWORD *)&p_outputFrameDuration->value;
        time.epoch = self->_outputFrameDuration.epoch;
        CMTimeMultiply(&v54, &time, v35 + 1);
        *(_OWORD *)&time.value = *(_OWORD *)&p_anchorPTS->value;
        time.epoch = self->_anchorPTS.epoch;
        rhs = v54;
        CMTimeAdd(&v53, &time, &rhs);
        v8 = -[VCPSettlingEffectAnalyzer createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:](self, "createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:", v39, &v53, 1, &v63);
        if (v8)
        {
LABEL_37:

          goto LABEL_14;
        }
        v8 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", v63);

        ++v35;
        if (v8)
          goto LABEL_14;
      }
      v40 = self->_assetWriter;
      v41 = objc_msgSend(v6, "buffer");
      if (v6)
        objc_msgSend(v6, "presentationTimeStamp");
      else
        memset(v52, 0, sizeof(v52));
      v8 = -[VCPMovieAssetWriter addPixelBuffer:withTime:withAttachment:](v40, "addPixelBuffer:withTime:withAttachment:", v41, v52, 0);
      if (v8)
        goto LABEL_14;
      v42 = self->_previousMetadata;
      if (v6)
        objc_msgSend(v6, "presentationTimeStamp");
      else
        memset(v51, 0, sizeof(v51));
      v8 = -[VCPSettlingEffectAnalyzer createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:](self, "createLivePhotoInfoSample:withTimestamp:isInterpolated:updatedSample:", v42, v51, 0, &v63);
      if (v8)
        goto LABEL_14;
      v8 = -[VCPMovieAssetWriter addLivePhotoInfoBuffer:](self->_assetWriter, "addLivePhotoInfoBuffer:", v63);
      if (v8)
        goto LABEL_14;
      if (!-[VCPMovieAssetWriter finish](self->_assetWriter, "finish")
        && -[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession") == -22000)
      {
        self->_FRCRecommendation = -[FRCFrameInterpolator recommendation](self->_frameInterpolator, "recommendation");
        self->_FRCGatingFailure = -[FRCFrameInterpolator gated](self->_frameInterpolator, "gated");
        -[FRCFrameInterpolator sessionConfidence](self->_frameInterpolator, "sessionConfidence");
        self->_FRCConfidence = v43;
        -[FRCFrameInterpolator sessionStatistics](self->_frameInterpolator, "sessionStatistics");
        v44 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        FRCStatistics = self->_FRCStatistics;
        self->_FRCStatistics = v44;

        goto LABEL_3;
      }
LABEL_13:
      v8 = -18;
      goto LABEL_14;
    }
  }
  self->_processAborted = 1;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "localizedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(time.value) = 138412290;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "FRC gating not passed: %@", (uint8_t *)&time, 0xCu);

  }
  -[FRCFrameInterpolator endSession](self->_frameInterpolator, "endSession");
  self->_FRCRecommendation = -[FRCFrameInterpolator recommendation](self->_frameInterpolator, "recommendation");
  -[FRCFrameInterpolator sessionConfidence](self->_frameInterpolator, "sessionConfidence");
  self->_FRCConfidence = v29;
  -[FRCFrameInterpolator sessionStatistics](self->_frameInterpolator, "sessionStatistics");
  v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v31 = self->_FRCStatistics;
  self->_FRCStatistics = v30;

  self->_FRCGatingFailure = 1;
  -[VCPMovieAssetWriter cancel](self->_assetWriter, "cancel");
  v8 = 0;
LABEL_23:

  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v61);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v62);

  return v8;
}

- (id)results
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("settlingEffectVideoQualityGatingFailure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_videoQualityGatingFailure);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  v24[1] = CFSTR("settlingEffectMetadataIntegrityFailure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_metadataIntegrityFailure);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  v24[2] = CFSTR("settlingEffectFRCGatingFailure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_FRCGatingFailure);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v5;
  v24[3] = CFSTR("settlingEffectStillTransitionGatingFailure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stillTransitionGatingFailure);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  v24[4] = CFSTR("settlingEffectMinSettlingDurationThresholdFailure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_minSettlingDurationThresholdFailure);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!self->_processAborted)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_filePath, CFSTR("settlingEffectURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_FRCRecommendation);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("FRCRecommendation"));

  *(float *)&v12 = self->_FRCConfidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("FRCConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userInitiatedMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("FRCUserInitiatedMode"));

  if (-[NSDictionary count](self->_FRCStatistics, "count"))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_FRCStatistics, CFSTR("FRCStatistics"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("settlingEffectStatus"));
  v22 = CFSTR("SettlingEffectResults");
  v19 = CFSTR("attributes");
  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)getPixelBasedHomographies:(id)a3 withCleanApertureSize:(CGSize)a4
{
  id v4;
  VCPProtoMovieStabilizationRecipe *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[VCPProtoMovieStabilizationRecipe initWithData:]([VCPProtoMovieStabilizationRecipe alloc], "initWithData:", v4);
  -[VCPProtoMovieStabilizationRecipe exportToLegacyDictionary](v5, "exportToLegacyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCreateCorrectionHomographiesWithNewImageCoordinates();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getFramePTSList:(id)a3 before:(id *)a4 withOptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  CFDictionaryRef v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  char v24;
  void *v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime time2;
  CMTime time1;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C8AFD0]);
  objc_msgSend(v7, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAsset:error:", v10, 0);

  objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "canAddOutput:", v12) & 1) == 0
    || (objc_msgSend(v11, "addOutput:", v12), !objc_msgSend(v11, "startReading")))
  {
    v19 = 0;
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v13 = 0;
  while (1)
  {
    v14 = (opaqueCMSampleBuffer *)objc_msgSend(v12, "copyNextSampleBuffer", v25);
    v15 = v14;
    if (!v14)
      break;
    if (CMSampleBufferGetNumSamples(v14))
    {
      memset(&v28, 0, sizeof(v28));
      CMSampleBufferGetPresentationTimeStamp(&v28, v15);
      time1 = v28;
      time2 = (CMTime)*a4;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        CMTimeMake(&v26, 2, 600);
        time1 = v28;
        time2 = v26;
        CMTimeAdd(&v27, &time1, &time2);
        time1 = v27;
        time2 = (CMTime)*a4;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          time1 = v28;
          v16 = CMTimeCopyAsDictionary(&time1, 0);
          objc_msgSend(v25, "addObject:", v16);

        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        time1 = v28;
        time2 = (CMTime)*a4;
        v18 = CMTimeCompare(&time1, &time2) == 0;

        v13 |= v18;
      }
    }
    CFRelease(v15);
  }
  objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count"))
    goto LABEL_13;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (v23 == 0) | v13;

  if ((v24 & 1) != 0)
  {
    v20 = v19;
  }
  else
  {
    objc_msgSend(v19, "subarrayWithRange:", 0, objc_msgSend(v19, "count") - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v20;
  }
LABEL_14:
  v21 = v20;

  return v21;
}

uint64_t __64__VCPSettlingEffectAnalyzer_getFramePTSList_before_withOptions___block_invoke(uint64_t a1, const __CFDictionary *a2, void *a3)
{
  const __CFDictionary *v4;
  uint64_t v5;
  CMTime v7;
  CMTime v8;
  CMTime time2;
  CMTime time1;

  v4 = a3;
  CMTimeMakeFromDictionary(&v8, a2);
  CMTimeMakeFromDictionary(&v7, v4);
  time1 = v8;
  time2 = v7;
  if (CMTimeCompare(&time1, &time2) > 0)
    v5 = 1;
  else
    v5 = -1;

  return v5;
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

- (CGSize)getCleanApertureFrameSize:(id)a3
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

    PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v4, 0, 1u);
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

- (__CVBuffer)resamplePixelBuffer:(__CVBuffer *)a3 cleanApertureRect:(CGRect)a4 cropRect:(CGRect)a5 homographyArray:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int32 v18;
  void *v19;
  __int32 v20;
  void *v21;
  __int32 v22;
  void *v23;
  __int32 v24;
  void *v25;
  __int32 v26;
  void *v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  __int32 v31;
  uint64_t v32;
  int32x4_t v33;
  float32x4_t v34;
  int32x4_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double MinX;
  double MaxY;
  double MaxX;
  double v43;
  double v44;
  double MinY;
  double v46;
  double v47;
  float v48;
  float v49;
  int32x4_t v50;
  float32x2_t v51;
  void *v52;
  float v53;
  float v54;
  int32x4_t v55;
  void *v56;
  float v57;
  float v58;
  int32x4_t v59;
  float32x2_t v60;
  void *v61;
  float v62;
  float v63;
  int32x4_t v64;
  float32x2_t v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  VCPPoolBasedPixelBufferCreator *bufferCreator;
  VCPPoolBasedPixelBufferCreator *v77;
  VCPPoolBasedPixelBufferCreator *v78;
  __CVBuffer *v79;
  __int32 v81;
  __int32 v82;
  __int32 v83;
  __int32 v84;
  __int32 v85;
  CGFloat x;
  CGFloat y;
  double height;
  double width;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  CGAffineTransform v101;
  CGAffineTransform v102;
  __int128 v103;
  __int128 v104;
  int32x4_t v105;
  CVBufferRef destinationBuffer[2];
  __int128 v107;
  float32x4_t v108;
  _QWORD v109[4];
  _QWORD v110[6];
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  height = a5.size.height;
  width = a5.size.width;
  x = a5.origin.x;
  y = a5.origin.y;
  v6 = a4.size.height;
  v7 = a4.size.width;
  v8 = a4.origin.y;
  v9 = a4.origin.x;
  v110[4] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v98.i64[0] = v12;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v95.i64[0] = v14;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v92.i64[0] = v16;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v85 = v18;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v84 = v20;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v83 = v22;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v82 = v24;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v81 = v26;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v28 = v98;
  v28.i32[1] = v85;
  v28.i32[2] = v82;
  v99 = v28;
  v29 = v95;
  v29.i32[1] = v84;
  v29.i32[2] = v81;
  v96 = v29;
  v30 = v92;
  v30.i32[1] = v83;
  v30.i32[2] = v31;
  v93 = v30;

  v32 = 0;
  *(float *)v33.i32 = v6;
  v34.i32[0] = 0;
  v34.i32[1] = v33.i32[0];
  v34.i32[2] = 1.0;
  v35 = vzip1q_s32((int32x4_t)xmmword_1B6FBC930, v33);
  v35.i32[3] = 0;
  v103 = xmmword_1B6FBC940;
  v104 = xmmword_1B6FBC950;
  v105 = v35;
  do
  {
    *(float32x4_t *)&destinationBuffer[v32] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(__int128 *)((char *)&v103 + v32 * 8))), v96, *(float32x2_t *)((char *)&v103 + v32 * 8), 1), v93, *(float32x4_t *)((char *)&v103 + v32 * 8), 2);
    v32 += 2;
  }
  while (v32 != 6);
  v36 = 0;
  v103 = *(_OWORD *)destinationBuffer;
  v104 = v107;
  v105 = (int32x4_t)v108;
  do
  {
    *(float32x4_t *)&destinationBuffer[v36] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B6FBC940, COERCE_FLOAT(*(__int128 *)((char *)&v103 + v36 * 8))), (float32x4_t)xmmword_1B6FBC950, *(float32x2_t *)((char *)&v103 + v36 * 8), 1), v34, *(float32x4_t *)((char *)&v103 + v36 * 8), 2);
    v36 += 2;
  }
  while (v36 != 6);
  v100 = (float32x4_t)v107;
  v94 = *(float32x4_t *)destinationBuffer;
  v97 = v108;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageByCroppingToRect:", v9, v8, v7, v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v102, -v9, -v8);
  objc_msgSend(v38, "imageByApplyingTransform:", &v102);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "extent");
  MinX = CGRectGetMinX(v111);
  objc_msgSend(v39, "extent");
  MaxY = CGRectGetMaxY(v112);
  objc_msgSend(v39, "extent");
  MaxX = CGRectGetMaxX(v113);
  objc_msgSend(v39, "extent");
  v43 = CGRectGetMaxY(v114);
  objc_msgSend(v39, "extent");
  v44 = CGRectGetMinX(v115);
  objc_msgSend(v39, "extent");
  MinY = CGRectGetMinY(v116);
  objc_msgSend(v39, "extent");
  v46 = CGRectGetMaxX(v117);
  objc_msgSend(v39, "extent");
  v47 = CGRectGetMinY(v118);
  v48 = MinX;
  v49 = MaxY;
  v50 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v48), v100, v49));
  v51 = vdiv_f32(*(float32x2_t *)v50.i8, (float32x2_t)vdup_laneq_s32(v50, 2));
  v109[0] = CFSTR("inputTopLeft");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v51.f32[0], v51.f32[1]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v43;
  v54 = MaxX;
  v55 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v54), v100, v53));
  *(float32x2_t *)v55.i8 = vdiv_f32(*(float32x2_t *)v55.i8, (float32x2_t)vdup_laneq_s32(v55, 2));
  v110[0] = v52;
  v109[1] = CFSTR("inputTopRight");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(float *)v55.i32, *(float *)&v55.i32[1]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v44;
  v58 = MinY;
  v59 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v57), v100, v58));
  v60 = vdiv_f32(*(float32x2_t *)v59.i8, (float32x2_t)vdup_laneq_s32(v59, 2));
  v110[1] = v56;
  v109[2] = CFSTR("inputBottomLeft");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v60.f32[0], v60.f32[1]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v46;
  v63 = v47;
  v64 = (int32x4_t)vaddq_f32(v97, vmlaq_n_f32(vmulq_n_f32(v94, v62), v100, v63));
  v65 = vdiv_f32(*(float32x2_t *)v64.i8, (float32x2_t)vdup_laneq_s32(v64, 2));
  v110[2] = v61;
  v109[3] = CFSTR("inputBottomRight");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v65.f32[0], v65.f32[1]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v66;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPerspectiveTransform"), v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v119.origin.x = x;
  v119.origin.y = y;
  v119.size.height = height;
  v119.size.width = width;
  v69 = CGRectGetMinX(v119);
  objc_msgSend(v39, "extent");
  v70 = CGRectGetMinX(v120);
  objc_msgSend(v39, "extent");
  v71 = CGRectGetMaxY(v121);
  v122.origin.x = x;
  v122.origin.y = y;
  v122.size.height = height;
  v122.size.width = width;
  v72 = v69 - v70;
  v73 = v71 - CGRectGetMaxY(v122);
  objc_msgSend(v68, "imageByCroppingToRect:", v72, v73, width, height);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v101, -v72, -v73);
  objc_msgSend(v74, "imageByApplyingTransform:", &v101);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  bufferCreator = self->_bufferCreator;
  if (!bufferCreator)
  {
    v77 = -[VCPPoolBasedPixelBufferCreator initWithBufferWidth:bufferHeight:andPixelFormat:]([VCPPoolBasedPixelBufferCreator alloc], "initWithBufferWidth:bufferHeight:andPixelFormat:", (uint64_t)width, (uint64_t)height, CVPixelBufferGetPixelFormatType(a3));
    v78 = self->_bufferCreator;
    self->_bufferCreator = v77;

    bufferCreator = self->_bufferCreator;
  }
  destinationBuffer[0] = 0;
  if (!-[VCPPoolBasedPixelBufferCreator createPixelBuffer:](bufferCreator, "createPixelBuffer:", destinationBuffer))
  {
    -[CIContext render:toCVPixelBuffer:](self->_context, "render:toCVPixelBuffer:", v75, destinationBuffer[0]);
    CVBufferPropagateAttachments(a3, destinationBuffer[0]);
    CVBufferRemoveAttachment(destinationBuffer[0], (CFStringRef)*MEMORY[0x1E0CA8D50]);
  }
  v79 = destinationBuffer[0];

  return v79;
}

- (__CVBuffer)scaleStillImage:(__CVBuffer *)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  CGFloat Height;
  void *v12;
  const __CFDictionary *v13;
  OSType PixelFormatType;
  __CVBuffer *v15;
  CVBufferRef destinationBuffer;
  CGAffineTransform v18;
  uint64_t v19;
  _QWORD v20[2];
  CGRect v21;
  CGRect v22;

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPSettlingEffectAnalyzer getFrameSize:](self, "getFrameSize:", self->_originalTrack);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "extent");
  Width = CGRectGetWidth(v21);
  objc_msgSend(v5, "extent");
  Height = CGRectGetHeight(v22);
  CGAffineTransformMakeScale(&v18, v7 / Width, v9 / Height);
  objc_msgSend(v5, "imageByApplyingTransform:", &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  destinationBuffer = 0;
  v19 = *MEMORY[0x1E0CA8FF0];
  v20[0] = MEMORY[0x1E0C9AA70];
  v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v7, (unint64_t)v9, PixelFormatType, v13, &destinationBuffer);
  -[CIContext render:toCVPixelBuffer:](self->_context, "render:toCVPixelBuffer:", v12, destinationBuffer);
  CVBufferPropagateAttachments(a3, destinationBuffer);
  CVBufferRemoveAttachment(destinationBuffer, (CFStringRef)*MEMORY[0x1E0CA8D50]);
  v15 = destinationBuffer;

  return v15;
}

+ (id)getRetimingCurve
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "addObject:", &unk_1E6B76008);
  objc_msgSend(v2, "addObject:", &unk_1E6B76020);
  objc_msgSend(v2, "addObject:", &unk_1E6B76038);
  objc_msgSend(v2, "addObject:", &unk_1E6B76050);
  objc_msgSend(v2, "addObject:", &unk_1E6B76068);
  objc_msgSend(v2, "addObject:", &unk_1E6B76080);
  objc_msgSend(v2, "addObject:", &unk_1E6B76098);
  objc_msgSend(v2, "addObject:", &unk_1E6B760B0);
  objc_msgSend(v2, "addObject:", &unk_1E6B760C8);
  objc_msgSend(v2, "addObject:", &unk_1E6B760E0);
  objc_msgSend(v2, "addObject:", &unk_1E6B760F8);
  objc_msgSend(v2, "addObject:", &unk_1E6B76110);
  objc_msgSend(v2, "addObject:", &unk_1E6B76128);
  return v2;
}

+ ($C7CBA4C8288BA02ADCCB8E56B4665FF4)getSettlingEffectTimeRange:(SEL)a3 withOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  const __CFDictionary *v16;
  uint64_t v17;
  __int128 v18;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  CMTime duration;
  CMTime start;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime rhs;
  CMTime lhs;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LivePhotoKeyFrameTimestamp"));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&lhs, v10);
  }
  else
  {
    objc_msgSend(v7, "asset");
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11)
      -[__CFDictionary vcp_livePhotoStillDisplayTime](v11, "vcp_livePhotoStillDisplayTime");
    else
      memset(&lhs, 0, sizeof(lhs));
  }
  v23 = lhs;

  v22 = v23;
  +[VCPSettlingEffectAnalyzer getFramePTSList:before:withOptions:](VCPSettlingEffectAnalyzer, "getFramePTSList:before:withOptions:", v7, &v22, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CustomRetimingCurve"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CustomRetimingCurve"));
  else
    +[VCPSettlingEffectAnalyzer getRetimingCurve](VCPSettlingEffectAnalyzer, "getRetimingCurve");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v15 = objc_msgSend(v12, "count");
    if (v15 <= objc_msgSend(v14, "count"))
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    else
      objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - objc_msgSend(v14, "count"));
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&lhs, v16);
    v24 = lhs;

    start = v24;
    lhs = v23;
    rhs = v24;
    CMTimeSubtract(&duration, &lhs, &rhs);
    CMTimeRangeMake((CMTimeRange *)retstr, &start, &duration);
  }
  else
  {
    v17 = MEMORY[0x1E0CA2E40];
    v18 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v18;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v17 + 32);
  }

  return result;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)adjustedTimeRange
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;

  objc_copyStruct(retstr, &self->_cancelled + 3, 48, 1, 0);
  return result;
}

- (BOOL)processAborted
{
  return self->_processAborted;
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
  objc_storeStrong((id *)&self->_burstDropsList, 0);
  objc_storeStrong((id *)&self->_frameDropDetector, 0);
  objc_storeStrong((id *)&self->_FRCStatistics, 0);
  objc_storeStrong((id *)&self->_bufferCreator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pixelBasedHomogrphies, 0);
  objc_storeStrong((id *)&self->_timingCurveList, 0);
  objc_storeStrong((id *)&self->_framePTSList, 0);
  objc_storeStrong((id *)&self->_originalTrack, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_previousFrame, 0);
  objc_storeStrong((id *)&self->_frameInterpolator, 0);
}

@end
