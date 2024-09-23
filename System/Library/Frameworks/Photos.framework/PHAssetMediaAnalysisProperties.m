@implementation PHAssetMediaAnalysisProperties

- (PHAssetMediaAnalysisProperties)initWithDefaultValues
{
  NSDate *mediaAnalysisTimeStamp;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGSize v8;
  float v9;
  NSData *colorNormalizationData;
  NSDate *privateEncryptedComputeAnalysisTimestamp;
  PHAssetMediaAnalysisProperties *result;

  self->_mediaAnalysisVersion = 0;
  self->_mediaAnalysisImageVersion = 0;
  mediaAnalysisTimeStamp = self->_mediaAnalysisTimeStamp;
  self->_mediaAnalysisTimeStamp = 0;

  self->_imageCaptionVersion = 0;
  self->_videoCaptionVersion = 0;
  self->_imageEmbeddingVersion = 0;
  self->_videoEmbeddingVersion = 0;
  v4 = MEMORY[0x1E0CA2E40];
  v5 = *MEMORY[0x1E0CA2E40];
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&self->_bestVideoTimeRange.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&self->_bestVideoTimeRange.start.epoch = v6;
  v7 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale = v7;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.value = v5;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch = v6;
  *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale = v7;
  self->_bestKeyFrameTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_bestPlaybackRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_bestPlaybackRect.size = v8;
  self->_blurrinessScore = 0.5;
  self->_exposureScore = 0.5;
  self->_wallpaperScore = 0.5;
  self->_autoplaySuggestionScore = 0.5;
  self->_videoStickerSuggestionScore = *(float *)MEMORY[0x1E0D71FB0];
  self->_videoScore = 0.5;
  self->_activityScore = 0.5;
  objc_msgSend((id)objc_opt_class(), "defaultAudioScore");
  self->_audioScore = v9;
  self->_settlingEffectScore = -1.0;
  self->_faceCount = 0;
  self->_audioClassification = 0;
  self->_probableRotationDirection = 0;
  self->_probableRotationDirectionConfidence = 0.0;
  colorNormalizationData = self->_colorNormalizationData;
  self->_colorNormalizationData = 0;

  self->_syndicationProcessingValue = 0;
  self->_syndicationProcessingVersion = 0;
  self->_localAnalysisStage = 0;
  self->_localAnalysisMajorVersion = 0;
  self->_cloudAnalysisMajorVersion = 0;
  self->_cloudAnalysisStage = 0;
  self->_privateEncryptedComputeAnalysisVersion = 0;
  privateEncryptedComputeAnalysisTimestamp = self->_privateEncryptedComputeAnalysisTimestamp;
  self->_privateEncryptedComputeAnalysisTimestamp = 0;

  return result;
}

- (PHAssetMediaAnalysisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetMediaAnalysisProperties *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSDate *mediaAnalysisTimeStamp;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  int32_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int32_t v29;
  void *v30;
  int64_t v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  int32_t v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  int64_t v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  float v66;
  void *v67;
  float v68;
  void *v69;
  float v70;
  void *v71;
  float v72;
  void *v73;
  float v74;
  void *v75;
  float v76;
  void *v77;
  float v78;
  void *v79;
  float v80;
  void *v81;
  float v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  float v87;
  uint64_t v88;
  NSData *colorNormalizationData;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  NSDate *privateEncryptedComputeAnalysisTimestamp;
  void *v96;
  const __CFString *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  float v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  float v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  float v109;
  const __CFString *v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  void *v124;
  float v125;
  void *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  const __CFString *v130;
  const __CFString *v131;
  const __CFString *v132;
  const __CFString *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  $95D729B680665BEAEFA1D6FCA8238556 *p_bestKeyFrameTime;
  __int128 v143;
  uint64_t v144;
  const __CFString *v145;
  void *v146;
  void *v147;
  const __CFString *v148;
  void *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  void *v153;
  PHAssetMediaAnalysisProperties *v154;
  const __CFString *v156;
  const __CFString *v157;
  const __CFString *v158;
  const __CFString *v159;
  const __CFString *v160;
  const __CFString *v161;
  const __CFString *v162;
  const __CFString *v163;
  const __CFString *v164;
  const __CFString *v165;
  const __CFString *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  const __CFString *v170;
  const __CFString *v171;
  void *v172;
  id v173;
  CMTime v174;
  CMTime v175;
  CMTime duration;
  CMTime start;
  CMTimeRange v178;
  objc_super v179;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v179.receiver = self;
  v179.super_class = (Class)PHAssetMediaAnalysisProperties;
  v10 = -[PHAssetMediaAnalysisProperties init](&v179, sel_init);

  if (!v10)
    goto LABEL_171;
  objc_storeWeak((id *)&v10->super._asset, v9);
  if (v5)
    v11 = CFSTR("mediaAnalysisAttributes.mediaAnalysisTimeStamp");
  else
    v11 = CFSTR("mediaAnalysisTimeStamp");
  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v173 = v9;
  if (!v12)
  {
    if (v5)
      v98 = CFSTR("mediaAnalysisAttributes.blurrinessScore");
    else
      v98 = CFSTR("blurrinessScore");
    -[PHAssetMediaAnalysisProperties initWithDefaultValues](v10, "initWithDefaultValues");
    objc_msgSend(v8, "objectForKeyedSubscript:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
    {
      objc_msgSend(v99, "floatValue");
      v10->_blurrinessScore = v101;
    }
    if (v5)
      v102 = CFSTR("mediaAnalysisAttributes.exposureScore");
    else
      v102 = CFSTR("exposureScore");
    objc_msgSend(v8, "objectForKeyedSubscript:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v103;
    if (v103)
    {
      objc_msgSend(v103, "floatValue");
      v10->_exposureScore = v105;
    }
    if (v5)
      v106 = CFSTR("mediaAnalysisAttributes.wallpaperScore");
    else
      v106 = CFSTR("wallpaperScore");
    objc_msgSend(v8, "objectForKeyedSubscript:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v107;
    if (v107)
    {
      objc_msgSend(v107, "floatValue");
      v10->_wallpaperScore = v109;
    }
    if (v5)
      v110 = CFSTR("mediaAnalysisAttributes.syndicationProcessingValue");
    else
      v110 = CFSTR("syndicationProcessingValue");
    objc_msgSend(v8, "objectForKeyedSubscript:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v111;
    if (v111)
      v10->_syndicationProcessingValue = objc_msgSend(v111, "unsignedShortValue");
    if (v5)
      v113 = CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion");
    else
      v113 = CFSTR("syndicationProcessingVersion");
    objc_msgSend(v8, "objectForKeyedSubscript:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v114;
    if (v114)
      v10->_syndicationProcessingVersion = objc_msgSend(v114, "unsignedLongLongValue");
    v172 = v104;
    if (v5)
      v116 = CFSTR("mediaAnalysisAttributes.colorNormalizationData");
    else
      v116 = CFSTR("colorNormalizationData");
    objc_msgSend(v8, "objectForKeyedSubscript:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (v117)
      objc_storeStrong((id *)&v10->_colorNormalizationData, v117);
    v118 = v100;
    if (v5)
      v119 = CFSTR("mediaAnalysisAttributes.probableRotationDirection");
    else
      v119 = CFSTR("probableRotationDirection");
    objc_msgSend(v8, "objectForKeyedSubscript:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120;
    if (v120)
      v10->_probableRotationDirection = objc_msgSend(v120, "unsignedIntegerValue");
    if (v5)
      v122 = CFSTR("mediaAnalysisAttributes.probableRotationDirectionConfidence");
    else
      v122 = CFSTR("probableRotationDirectionConfidence");
    objc_msgSend(v8, "objectForKeyedSubscript:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v123;
    if (v123)
    {
      objc_msgSend(v123, "floatValue");
      v10->_probableRotationDirectionConfidence = v125;
    }

    if (v5)
      goto LABEL_87;
LABEL_129:
    v97 = CFSTR("mediaAnalysisVersion");
    goto LABEL_130;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  mediaAnalysisTimeStamp = v10->_mediaAnalysisTimeStamp;
  v10->_mediaAnalysisTimeStamp = (NSDate *)v13;

  if (v5)
    v15 = CFSTR("mediaAnalysisAttributes.bestVideoRangeDurationTimeScale");
  else
    v15 = CFSTR("bestVideoRangeDurationTimeScale");
  if (v5)
    v16 = CFSTR("mediaAnalysisAttributes.bestVideoRangeDurationValue");
  else
    v16 = CFSTR("bestVideoRangeDurationValue");
  if (v5)
    v17 = CFSTR("mediaAnalysisAttributes.bestVideoRangeStartTimeScale");
  else
    v17 = CFSTR("bestVideoRangeStartTimeScale");
  if (v5)
    v18 = CFSTR("mediaAnalysisAttributes.bestVideoRangeStartValue");
  else
    v18 = CFSTR("bestVideoRangeStartValue");
  if (v5)
    v19 = CFSTR("mediaAnalysisAttributes.animatedStickerRangeDurationTimeScale");
  else
    v19 = CFSTR("animatedStickerRangeDurationTimeScale");
  if (v5)
    v20 = CFSTR("mediaAnalysisAttributes.animatedStickerRangeDurationValue");
  else
    v20 = CFSTR("animatedStickerRangeDurationValue");
  if (v5)
    v21 = CFSTR("mediaAnalysisAttributes.animatedStickerRangeStartTimeScale");
  else
    v21 = CFSTR("animatedStickerRangeStartTimeScale");
  v22 = CFSTR("animatedStickerRangeStartValue");
  if (v5)
    v22 = CFSTR("mediaAnalysisAttributes.animatedStickerRangeStartValue");
  v166 = v21;
  v168 = v22;
  v23 = CFSTR("mediaAnalysisAttributes.packedBestPlaybackRect");
  if (!v5)
    v23 = CFSTR("packedBestPlaybackRect");
  v170 = v23;
  objc_msgSend(v8, "objectForKeyedSubscript:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "longLongValue");

  CMTimeMake(&start, v31, v29);
  CMTimeMake(&duration, v27, v25);
  CMTimeRangeMake(&v178, &start, &duration);
  v32 = *(_OWORD *)&v178.start.value;
  v33 = *(_OWORD *)&v178.duration.timescale;
  *(_OWORD *)&v10->_bestVideoTimeRange.start.epoch = *(_OWORD *)&v178.start.epoch;
  *(_OWORD *)&v10->_bestVideoTimeRange.duration.timescale = v33;
  *(_OWORD *)&v10->_bestVideoTimeRange.start.value = v32;
  objc_msgSend(v8, "objectForKeyedSubscript:", v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v166);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v38, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v168);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "longLongValue");

  CMTimeMake(&v175, v40, v27);
  CMTimeMake(&v174, v37, v35);
  CMTimeRangeMake(&v178, &v175, &v174);
  v41 = *(_OWORD *)&v178.start.value;
  v42 = *(_OWORD *)&v178.duration.timescale;
  *(_OWORD *)&v10->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&v178.start.epoch;
  *(_OWORD *)&v10->_animatedStickerTimeRange.duration.timescale = v42;
  *(_OWORD *)&v10->_animatedStickerTimeRange.start.value = v41;
  objc_msgSend(v8, "objectForKeyedSubscript:", v170);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "longLongValue");

  if (v44)
    PLSplitToCGRectFromInt64();
  if (v5)
    v45 = CFSTR("mediaAnalysisAttributes.blurrinessScore");
  else
    v45 = CFSTR("blurrinessScore");
  if (v5)
    v46 = CFSTR("mediaAnalysisAttributes.exposureScore");
  else
    v46 = CFSTR("exposureScore");
  if (v5)
    v47 = CFSTR("mediaAnalysisAttributes.wallpaperScore");
  else
    v47 = CFSTR("wallpaperScore");
  if (v5)
    v48 = CFSTR("mediaAnalysisAttributes.autoplaySuggestionScore");
  else
    v48 = CFSTR("autoplaySuggestionScore");
  if (v5)
    v49 = CFSTR("mediaAnalysisAttributes.videoStickerSuggestionScore");
  else
    v49 = CFSTR("videoStickerSuggestionScore");
  if (v5)
    v50 = CFSTR("mediaAnalysisAttributes.videoScore");
  else
    v50 = CFSTR("videoScore");
  if (v5)
    v51 = CFSTR("mediaAnalysisAttributes.activityScore");
  else
    v51 = CFSTR("activityScore");
  v52 = CFSTR("mediaAnalysisAttributes.audioScore");
  if (!v5)
    v52 = CFSTR("audioScore");
  v156 = v52;
  v53 = CFSTR("settlingEffectScore");
  if (v5)
    v53 = CFSTR("mediaAnalysisAttributes.settlingEffectScore");
  v157 = v53;
  if (v5)
    v54 = CFSTR("mediaAnalysisAttributes.faceCount");
  else
    v54 = CFSTR("faceCount");
  v158 = v54;
  if (v5)
    v55 = CFSTR("mediaAnalysisAttributes.audioClassification");
  else
    v55 = CFSTR("audioClassification");
  v56 = CFSTR("probableRotationDirection");
  if (v5)
    v56 = CFSTR("mediaAnalysisAttributes.probableRotationDirection");
  v159 = v55;
  v160 = v56;
  if (v5)
    v57 = CFSTR("mediaAnalysisAttributes.probableRotationDirectionConfidence");
  else
    v57 = CFSTR("probableRotationDirectionConfidence");
  v58 = CFSTR("mediaAnalysisAttributes.colorNormalizationData");
  if (!v5)
    v58 = CFSTR("colorNormalizationData");
  v161 = v57;
  v162 = v58;
  v59 = CFSTR("screenTimeDeviceImageSensitivity");
  if (v5)
    v59 = CFSTR("mediaAnalysisAttributes.screenTimeDeviceImageSensitivity");
  v163 = v59;
  if (v5)
    v60 = CFSTR("mediaAnalysisAttributes.syndicationProcessingValue");
  else
    v60 = CFSTR("syndicationProcessingValue");
  v164 = v60;
  if (v5)
    v61 = CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion");
  else
    v61 = CFSTR("syndicationProcessingVersion");
  v62 = CFSTR("vaAnalysisVersion");
  if (v5)
    v62 = CFSTR("mediaAnalysisAttributes.vaAnalysisVersion");
  v165 = v61;
  v167 = v62;
  if (v5)
    v63 = CFSTR("mediaAnalysisAttributes.vaAnalysisTimestamp");
  else
    v63 = CFSTR("vaAnalysisTimestamp");
  v64 = CFSTR("mediaAnalysisAttributes.vaLocationAnalysisVersion");
  if (!v5)
    v64 = CFSTR("vaLocationAnalysisVersion");
  v169 = v63;
  v171 = v64;
  objc_msgSend(v8, "objectForKeyedSubscript:", v45);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "floatValue");
  v10->_blurrinessScore = v66;

  objc_msgSend(v8, "objectForKeyedSubscript:", v46);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "floatValue");
  v10->_exposureScore = v68;

  objc_msgSend(v8, "objectForKeyedSubscript:", v47);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "floatValue");
  v10->_wallpaperScore = v70;

  objc_msgSend(v8, "objectForKeyedSubscript:", v48);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "floatValue");
  v10->_autoplaySuggestionScore = v72;

  objc_msgSend(v8, "objectForKeyedSubscript:", v49);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "floatValue");
  v10->_videoStickerSuggestionScore = v74;

  objc_msgSend(v8, "objectForKeyedSubscript:", v50);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "floatValue");
  v10->_videoScore = v76;

  objc_msgSend(v8, "objectForKeyedSubscript:", v51);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "floatValue");
  v10->_activityScore = v78;

  objc_msgSend(v8, "objectForKeyedSubscript:", v156);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "floatValue");
  v10->_audioScore = v80;

  objc_msgSend(v8, "objectForKeyedSubscript:", v157);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "floatValue");
  v10->_settlingEffectScore = v82;

  objc_msgSend(v8, "objectForKeyedSubscript:", v158);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_faceCount = objc_msgSend(v83, "unsignedIntegerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v159);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_audioClassification = objc_msgSend(v84, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v160);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_probableRotationDirection = objc_msgSend(v85, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v161);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "floatValue");
  v10->_probableRotationDirectionConfidence = v87;

  objc_msgSend(v8, "objectForKeyedSubscript:", v162);
  v88 = objc_claimAutoreleasedReturnValue();
  colorNormalizationData = v10->_colorNormalizationData;
  v10->_colorNormalizationData = (NSData *)v88;

  objc_msgSend(v8, "objectForKeyedSubscript:", v163);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_screenTimeDeviceImageSensitivity = objc_msgSend(v90, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v164);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_syndicationProcessingValue = objc_msgSend(v91, "unsignedShortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v165);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_syndicationProcessingVersion = objc_msgSend(v92, "unsignedLongLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v167);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_privateEncryptedComputeAnalysisVersion = objc_msgSend(v93, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v169);
  v94 = objc_claimAutoreleasedReturnValue();
  privateEncryptedComputeAnalysisTimestamp = v10->_privateEncryptedComputeAnalysisTimestamp;
  v10->_privateEncryptedComputeAnalysisTimestamp = (NSDate *)v94;

  objc_msgSend(v8, "objectForKeyedSubscript:", v171);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_privateEncryptedComputeLocationAnalysisVersion = objc_msgSend(v96, "integerValue");

  if (!v5)
    goto LABEL_129;
LABEL_87:
  v97 = CFSTR("mediaAnalysisAttributes.mediaAnalysisVersion");
LABEL_130:
  objc_msgSend(v8, "objectForKeyedSubscript:", v97);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_mediaAnalysisVersion = objc_msgSend(v126, "unsignedLongLongValue");

  if (v5)
    v127 = CFSTR("mediaAnalysisAttributes.mediaAnalysisImageVersion");
  else
    v127 = CFSTR("mediaAnalysisImageVersion");
  if (v5)
    v128 = CFSTR("mediaAnalysisAttributes.imageCaptionVersion");
  else
    v128 = CFSTR("imageCaptionVersion");
  if (v5)
    v129 = CFSTR("mediaAnalysisAttributes.videoCaptionVersion");
  else
    v129 = CFSTR("videoCaptionVersion");
  if (v5)
    v130 = CFSTR("mediaAnalysisAttributes.imageEmbeddingVersion");
  else
    v130 = CFSTR("imageEmbeddingVersion");
  if (v5)
    v131 = CFSTR("mediaAnalysisAttributes.videoEmbeddingVersion");
  else
    v131 = CFSTR("videoEmbeddingVersion");
  if (v5)
    v132 = CFSTR("videoKeyFrameTimeScale");
  else
    v132 = CFSTR("asset.videoKeyFrameTimeScale");
  if (v5)
    v133 = CFSTR("videoKeyFrameValue");
  else
    v133 = CFSTR("asset.videoKeyFrameValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", v127);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_mediaAnalysisImageVersion = objc_msgSend(v134, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v128);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_imageCaptionVersion = objc_msgSend(v135, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v129);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_videoCaptionVersion = objc_msgSend(v136, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v130);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_imageEmbeddingVersion = objc_msgSend(v137, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v131);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_videoEmbeddingVersion = objc_msgSend(v138, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", v132);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v133);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v140;
  p_bestKeyFrameTime = &v10->_bestKeyFrameTime;
  if (v140 && v139)
  {
    CMTimeMake(&v178.start, objc_msgSend(v140, "longLongValue"), objc_msgSend(v139, "intValue"));
    v143 = *(_OWORD *)&v178.start.value;
    v10->_bestKeyFrameTime.epoch = v178.start.epoch;
    *(_OWORD *)&p_bestKeyFrameTime->value = v143;
  }
  else
  {
    v144 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&p_bestKeyFrameTime->value = *MEMORY[0x1E0CA2E18];
    v10->_bestKeyFrameTime.epoch = *(_QWORD *)(v144 + 16);
  }
  if (v5)
    v145 = CFSTR("computeSyncAttributes.localAnalysisStage");
  else
    v145 = CFSTR("asset.computeSyncAttributes.localAnalysisStage");
  objc_msgSend(v8, "objectForKeyedSubscript:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v146;
  if (v146)
    v10->_localAnalysisStage = objc_msgSend(v146, "integerValue");
  if (v5)
    v148 = CFSTR("computeSyncAttributes.localAnalysisMajorVersion");
  else
    v148 = CFSTR("asset.computeSyncAttributes.localAnalysisMajorVersion");
  objc_msgSend(v8, "objectForKeyedSubscript:", v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v149;
  if (v149)
    v10->_localAnalysisMajorVersion = objc_msgSend(v149, "integerValue");
  if (v5)
    v151 = CFSTR("computeSyncAttributes.cloudComputeStateVersion");
  else
    v151 = CFSTR("asset.computeSyncAttributes.cloudComputeStateVersion");
  objc_msgSend(v8, "objectForKeyedSubscript:", v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11428]), "initWithString:", v152);
  if (objc_msgSend(v153, "majorVersion"))
  {
    v10->_cloudAnalysisMajorVersion = objc_msgSend(v153, "majorVersion");
    v10->_cloudAnalysisStage = objc_msgSend(v153, "stage");
  }

  v9 = v173;
LABEL_171:
  v154 = v10;

  return v154;
}

- (signed)assetAnalysisStage
{
  return self->_localAnalysisStage;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)bestKeyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- ($C628252E21E0084D991546AFB91829E6)bestVideoTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var1;
  return self;
}

- ($C628252E21E0084D991546AFB91829E6)animatedStickerTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[5].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var1.var1;
  return self;
}

- (CGRect)bestPlaybackRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bestPlaybackRect.origin.x;
  y = self->_bestPlaybackRect.origin.y;
  width = self->_bestPlaybackRect.size.width;
  height = self->_bestPlaybackRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDate)mediaAnalysisTimeStamp
{
  return self->_mediaAnalysisTimeStamp;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (signed)imageCaptionVersion
{
  return self->_imageCaptionVersion;
}

- (signed)videoCaptionVersion
{
  return self->_videoCaptionVersion;
}

- (signed)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (signed)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (float)blurrinessScore
{
  return self->_blurrinessScore;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (float)wallpaperScore
{
  return self->_wallpaperScore;
}

- (float)autoplaySuggestionScore
{
  return self->_autoplaySuggestionScore;
}

- (float)videoStickerSuggestionScore
{
  return self->_videoStickerSuggestionScore;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (float)activityScore
{
  return self->_activityScore;
}

- (float)audioScore
{
  return self->_audioScore;
}

- (float)settlingEffectScore
{
  return self->_settlingEffectScore;
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (signed)probableRotationDirection
{
  return self->_probableRotationDirection;
}

- (float)probableRotationDirectionConfidence
{
  return self->_probableRotationDirectionConfidence;
}

- (NSData)colorNormalizationData
{
  return self->_colorNormalizationData;
}

- (signed)screenTimeDeviceImageSensitivity
{
  return self->_screenTimeDeviceImageSensitivity;
}

- (unsigned)syndicationProcessingValue
{
  return self->_syndicationProcessingValue;
}

- (unint64_t)syndicationProcessingVersion
{
  return self->_syndicationProcessingVersion;
}

- (signed)privateEncryptedComputeAnalysisVersion
{
  return self->_privateEncryptedComputeAnalysisVersion;
}

- (NSDate)privateEncryptedComputeAnalysisTimestamp
{
  return self->_privateEncryptedComputeAnalysisTimestamp;
}

- (signed)privateEncryptedComputeLocationAnalysisVersion
{
  return self->_privateEncryptedComputeLocationAnalysisVersion;
}

- (signed)localAnalysisMajorVersion
{
  return self->_localAnalysisMajorVersion;
}

- (signed)localAnalysisStage
{
  return self->_localAnalysisStage;
}

- (signed)cloudAnalysisMajorVersion
{
  return self->_cloudAnalysisMajorVersion;
}

- (signed)cloudAnalysisStage
{
  return self->_cloudAnalysisStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEncryptedComputeAnalysisTimestamp, 0);
  objc_storeStrong((id *)&self->_colorNormalizationData, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisTimeStamp, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetMediaAnalysis");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("mediaAnalysisAttributes");
}

+ (id)keyPathToPrimaryObject
{
  return CFSTR("asset");
}

+ (id)entityName
{
  return CFSTR("MediaAnalysisAssetAttributes");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_59;
}

+ (id)additionalPropertiesToFetchOnPrimaryObject
{
  pl_dispatch_once();
  return (id)additionalPropertiesToFetchOnPrimaryObject_pl_once_object_60;
}

+ (float)defaultAudioScore
{
  return 0.5;
}

void __76__PHAssetMediaAnalysisProperties_additionalPropertiesToFetchOnPrimaryObject__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("videoKeyFrameTimeScale");
  v3[1] = CFSTR("videoKeyFrameValue");
  v3[2] = CFSTR("computeSyncAttributes.localAnalysisStage");
  v3[3] = CFSTR("computeSyncAttributes.localAnalysisMajorVersion");
  v3[4] = CFSTR("computeSyncAttributes.cloudComputeStateVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)additionalPropertiesToFetchOnPrimaryObject_pl_once_object_60;
  additionalPropertiesToFetchOnPrimaryObject_pl_once_object_60 = v1;

}

void __51__PHAssetMediaAnalysisProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[37];

  v3[36] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("mediaAnalysisTimeStamp");
  v3[1] = CFSTR("mediaAnalysisVersion");
  v3[2] = CFSTR("mediaAnalysisImageVersion");
  v3[3] = CFSTR("imageCaptionVersion");
  v3[4] = CFSTR("videoCaptionVersion");
  v3[5] = CFSTR("imageEmbeddingVersion");
  v3[6] = CFSTR("videoEmbeddingVersion");
  v3[7] = CFSTR("bestVideoRangeDurationTimeScale");
  v3[8] = CFSTR("bestVideoRangeDurationValue");
  v3[9] = CFSTR("bestVideoRangeStartTimeScale");
  v3[10] = CFSTR("bestVideoRangeStartValue");
  v3[11] = CFSTR("animatedStickerRangeDurationTimeScale");
  v3[12] = CFSTR("animatedStickerRangeDurationValue");
  v3[13] = CFSTR("animatedStickerRangeStartTimeScale");
  v3[14] = CFSTR("animatedStickerRangeStartValue");
  v3[15] = CFSTR("packedBestPlaybackRect");
  v3[16] = CFSTR("blurrinessScore");
  v3[17] = CFSTR("exposureScore");
  v3[18] = CFSTR("wallpaperScore");
  v3[19] = CFSTR("autoplaySuggestionScore");
  v3[20] = CFSTR("videoStickerSuggestionScore");
  v3[21] = CFSTR("videoScore");
  v3[22] = CFSTR("activityScore");
  v3[23] = CFSTR("audioScore");
  v3[24] = CFSTR("settlingEffectScore");
  v3[25] = CFSTR("faceCount");
  v3[26] = CFSTR("audioClassification");
  v3[27] = CFSTR("probableRotationDirection");
  v3[28] = CFSTR("probableRotationDirectionConfidence");
  v3[29] = CFSTR("colorNormalizationData");
  v3[30] = CFSTR("screenTimeDeviceImageSensitivity");
  v3[31] = CFSTR("syndicationProcessingValue");
  v3[32] = CFSTR("syndicationProcessingVersion");
  v3[33] = CFSTR("vaAnalysisVersion");
  v3[34] = CFSTR("vaAnalysisTimestamp");
  v3[35] = CFSTR("vaLocationAnalysisVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 36);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_59;
  propertiesToFetch_pl_once_object_59 = v1;

}

@end
