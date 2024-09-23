@implementation VCPLivePhotoKeyFrameAnalyzer

- (VCPLivePhotoKeyFrameAnalyzer)initWithWidth:(int)a3 height:(int)a4
{
  VCPLivePhotoKeyFrameAnalyzer *v6;
  VCPLivePhotoKeyFrameAnalyzer *v7;
  char *v8;
  VCPLivePhotoKeyFrameAnalyzer *v9;
  VCPLivePhotoKeyFrameAnalyzer *v10;
  __int16 v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPLivePhotoKeyFrameAnalyzer;
  v6 = -[VCPLivePhotoKeyFrameAnalyzer init](&v13, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v6->_photoSharpnessReliable = 1;
  v6->_width = a3;
  v6->_height = a4;
  v6->_numOfFrames = 0;
  *(_WORD *)&v6->_petsDominant = 256;
  v8 = (char *)operator new[](a4 * a3, MEMORY[0x1E0DE4E10]);
  v7->_faceHeatMap = v8;
  v9 = v7;
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to allocate memory", (uint8_t *)v12, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:
  v10 = v9;

  return v10;
}

- (void)dealloc
{
  char *faceHeatMap;
  objc_super v4;

  faceHeatMap = self->_faceHeatMap;
  if (faceHeatMap)
    MEMORY[0x1BCCA128C](faceHeatMap, 0x1000C8077774924);
  v4.receiver = self;
  v4.super_class = (Class)VCPLivePhotoKeyFrameAnalyzer;
  -[VCPLivePhotoKeyFrameAnalyzer dealloc](&v4, sel_dealloc);
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)selectKeyFrameRangeWithMotion:(SEL)a3 stillTimestamp:(id)a4 isMetaMotion:(float)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  float v11;
  const __CFDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  float v17;
  uint64_t i;
  const __CFDictionary *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  double Seconds;
  double v25;
  float v26;
  float v27;
  float v28;
  CMTimeEpoch epoch;
  uint64_t v30;
  __int128 v31;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  CMTime v33;
  CMTime start;
  CMTime v35;
  CMTime v36;
  CMTimeRange v37;
  CMTimeRange v38;
  CMTime v39;
  CMTimeRange v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime duration;
  CMTime time;
  CMTimeRange v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CMTimeRange range;
  CMTime v54;
  CMTime v55;
  CMTime rhs;
  CMTime lhs;
  _BYTE v58[128];
  uint64_t v59;

  v6 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v9;
  if (v6)
    v11 = 100.0;
  else
    v11 = 33.333;
  v55 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  memset(&v54, 0, sizeof(v54));
  objc_msgSend(v9, "lastObject");
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeRangeMakeFromDictionary(&range, v12);
  CMTimeRangeGetEnd(&v54, &range);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v50;
    v16 = a5;
    v17 = 0.0;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v13);
        v19 = *(const __CFDictionary **)(*((_QWORD *)&v49 + 1) + 8 * i);
        memset(&v48, 0, sizeof(v48));
        CMTimeRangeMakeFromDictionary(&v48, v19);
        -[__CFDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", CFSTR("quality"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21;

        time = v48.start;
        if (CMTimeGetSeconds(&time) <= v16)
        {
          duration = v48.duration;
          Seconds = CMTimeGetSeconds(&duration);
          v45 = v48.start;
          v25 = v16 - CMTimeGetSeconds(&v45);
          if (v25 >= Seconds)
            v25 = Seconds;
          v26 = v25 * v22;
          if (v11 <= v26)
          {
            v44 = v48.duration;
            v27 = CMTimeGetSeconds(&v44) * (float)(1.0 - (float)(v11 / v26));
            CMTimeMakeWithSeconds(&v42, v27, v48.start.timescale);
            lhs = v48.start;
            rhs = v42;
            CMTimeAdd(&v43, &lhs, &rhs);
            v55 = v43;
            v17 = v11;
          }
          else
          {
            v17 = v17 + v26;
            if (v17 > v11)
            {
              v55 = v48.start;
              v17 = v25 * v22;
            }
          }
          v40 = v48;
          CMTimeRangeGetEnd(&v41, &v40);
          if (CMTimeGetSeconds(&v41) >= v16)
          {
            v38 = v48;
            CMTimeRangeGetEnd(&v39, &v38);
            v28 = CMTimeGetSeconds(&v39) - v16;
            v17 = v22 * v28;
            if ((float)(v22 * v28) >= v11)
            {
              v37 = v48;
              CMTimeRangeGetEnd(&v42, &v37);
              CMTimeMakeWithSeconds(&v36, (float)((float)(1.0 - (float)(v11 / v17)) * v28), v48.start.timescale);
              lhs = v42;
              rhs = v36;
              CMTimeSubtract(&v43, &lhs, &rhs);
              *(_OWORD *)&v54.value = *(_OWORD *)&v43.value;
              epoch = v43.epoch;
              goto LABEL_25;
            }
          }
        }
        else
        {
          v35 = v48.duration;
          v23 = CMTimeGetSeconds(&v35) * v22;
          if (v11 <= v23)
          {
            *(_OWORD *)&v54.value = *(_OWORD *)&v48.start.value;
            epoch = v48.start.epoch;
LABEL_25:
            v54.epoch = epoch;
            goto LABEL_26;
          }
          v17 = v17 + v23;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_26:

  v48.start = v54;
  lhs = v55;
  if (CMTimeCompare(&v48.start, &lhs) < 1)
  {
    v30 = MEMORY[0x1E0CA2E50];
    v31 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&retstr->var0.var3 = v31;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v30 + 32);
  }
  else
  {
    start = v55;
    v33 = v54;
    CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v33);
  }

  return result;
}

- (int)analyzeLivePhotoKeyFrame:(id)a3 irisPhotoOffsetSec:(float)a4 originalIrisPhotoOffsetSec:(float)a5 photoTextureScore:(float)a6 hadFlash:(BOOL)a7 cancel:(id)a8
{
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  BOOL v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  uint64_t i;
  void *v41;
  NSString *v42;
  double width;
  double height;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  float v50;
  uint64_t v51;
  float v52;
  uint64_t v53;
  double v54;
  uint64_t j;
  const __CFDictionary *v56;
  void *v57;
  float v58;
  void *v59;
  void *v60;
  const __CFDictionary *v61;
  void *v62;
  const __CFDictionary *v63;
  const __CFDictionary *v64;
  void *v65;
  double v66;
  CMTimeValue v67;
  int32_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  uint64_t k;
  const __CFDictionary *v74;
  void *v75;
  float v76;
  float v77;
  double v78;
  Float64 v79;
  float v80;
  CMTimeEpoch epoch;
  void *v82;
  CMTimeValue v83;
  CMTimeEpoch v84;
  VCPVideoKeyFrame *v85;
  VCPVideoKeyFrame *v86;
  unint64_t v87;
  BOOL v88;
  int v89;
  float v90;
  float v91;
  void *v92;
  void *v93;
  VCPVideoKeyFrame *v94;
  double v95;
  Float64 v96;
  float v97;
  float v98;
  float v99;
  float v100;
  double v101;
  float v102;
  float v103;
  float v104;
  double v105;
  float v106;
  float v107;
  float v108;
  double v109;
  float v110;
  float v111;
  float v112;
  double v113;
  float v114;
  float v115;
  float v116;
  double v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float photoSharpness;
  float v125;
  float v126;
  double v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  double v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  VCPVideoKeyFrame *v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  int v153;
  double v154;
  double v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  CFDictionaryRef v160;
  double v161;
  void *v162;
  BOOL v163;
  VCPVideoKeyFrame *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  void *v174;
  uint64_t v175;
  CFDictionaryRef v176;
  CFDictionaryRef v177;
  VCPVideoKeyFrame *v178;
  BOOL v180;
  const __CFDictionary *v181;
  CMTimeValue value;
  void *v183;
  double v184;
  CMTimeValue v185;
  float v186;
  float v187;
  void *v188;
  double seconds;
  void *v190;
  void *v191;
  void *v192;
  double v193;
  CMTimeEpoch v194;
  CMTimeValue v195;
  float v196;
  uint64_t v197;
  float v198;
  CMTimeEpoch v199;
  float v200;
  void *v201;
  CMTimeFlags flags;
  float v203;
  int v204;
  VCPVideoKeyFrame *v205;
  __int128 v206;
  float v207;
  CMTimeEpoch v208;
  BOOL v209;
  void *v210;
  VCPVideoKeyFrame *v211;
  id v212;
  double v213;
  void *v214;
  void *v215;
  float v216;
  id obj;
  float v218;
  char v219;
  int v220;
  VCPVideoKeyFrame *v221;
  double v222;
  void *v223;
  _BOOL4 v224;
  float v225;
  void *v226;
  id v227;
  id v228;
  float v229;
  id v230;
  CMTime v231;
  CMTimeRange v232;
  CMTime v233;
  __int128 v234;
  CMTimeEpoch v235;
  CMTime v236;
  CMTimeRange v237;
  CMTime v238;
  CMTime v239;
  CMTime v240;
  CMTime v241;
  CMTimeRange v242;
  CMTime end;
  CMTime start;
  CMTime v245;
  CMTime v246;
  CMTime v247;
  CMTimeRange v248;
  CMTime v249;
  CMTime v250;
  CMTimeRange v251;
  CMTime v252;
  CMTime v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  CMTimeRange v258;
  CMTimeRange v259;
  CMTimeRange v260;
  CMTimeRange range;
  CMTime v262;
  CMTime time;
  CMTimeRange v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  CMTime v273;
  CMTime v274;
  _QWORD v275[5];
  _QWORD v276[5];
  _QWORD v277[4];
  _QWORD v278[4];
  _QWORD v279[2];
  _QWORD v280[2];
  _BYTE v281[128];
  CMTimeValue v282;
  CMTimeScale timescale;
  CMTimeRange v284;
  _BYTE v285[128];
  _BYTE v286[128];
  const __CFString *v287;
  void *v288;
  _QWORD v289[4];
  _QWORD v290[7];
  NSRect v291;

  v224 = a7;
  v290[4] = *MEMORY[0x1E0C80C00];
  v212 = a3;
  v13 = a8;
  v201 = v13;
  v205 = objc_alloc_init(VCPVideoKeyFrame);
  v211 = objc_alloc_init(VCPVideoKeyFrame);
  v200 = vabds_f32(a4, a5);
  if (v200 > 0.03 && (v221 = objc_alloc_init(VCPVideoKeyFrame)) != 0)
  {
    CMTimeMakeWithSeconds(&v274, a5, 600);
    v273 = v274;
    -[VCPVideoKeyFrame setTimestamp:](v221, "setTimestamp:", &v273);
    v219 = 0;
    if (!v13)
      goto LABEL_8;
  }
  else
  {
    v221 = 0;
    v219 = 1;
    if (!v13)
      goto LABEL_8;
  }
  if (((*((uint64_t (**)(id))v13 + 2))(v13) & 1) != 0)
  {
    v14 = -128;
    goto LABEL_164;
  }
LABEL_8:
  objc_msgSend(v212, "vcp_results");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPLivePhotoKeyFrameAnalyzer createFaceHeatMap:imageFaces:](self, "createFaceHeatMap:imageFaces:", v15, v16);

  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("KeyFrameBlurResults"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v17;
  if (!objc_msgSend(v17, "count"))
  {
    v14 = -50;
    goto LABEL_163;
  }
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("attributes"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v190, "objectForKeyedSubscript:", CFSTR("sharpness"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  self->_photoSharpness = v20;

  self->_photoSharpnessReliable = a6 >= 0.2;
  v289[0] = CFSTR("sharpness");
  *(float *)&v21 = self->_photoSharpness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v290[0] = v22;
  v289[1] = CFSTR("texture");
  *(float *)&v23 = a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v290[1] = v24;
  v289[2] = CFSTR("flashFired");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v224);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v290[2] = v25;
  v289[3] = CFSTR("stillTime");
  *(float *)&v26 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v290[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v290, v289, 4);
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C99D20];
  v287 = CFSTR("attributes");
  v288 = v191;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "arrayWithObject:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "vcp_setResult:forKey:", v30, CFSTR("KeyFrameStillResults"));

  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPLivePhotoKeyFrameAnalyzer computeOverallFaceQualityScore:](self, "computeOverallFaceQualityScore:", v31);
  v33 = v32;

  self->_petsDominant = 0;
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("PetsResults"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (!v35)
  {
    v272 = 0u;
    v271 = 0u;
    v270 = 0u;
    v269 = 0u;
    objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("PetsResults"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v269, v286, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v270;
      v39 = 0.0;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v270 != v38)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v269 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("petsBounds"));
          v42 = (NSString *)objc_claimAutoreleasedReturnValue();
          v291 = NSRectFromString(v42);
          width = v291.size.width;
          height = v291.size.height;

          v39 = v39 + width * height;
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v269, v286, 16);
      }
      while (v37);
    }
    else
    {
      v39 = 0.0;
    }

    self->_petsDominant = v39 > 0.5;
  }
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("ExposureResults"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("attributes"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("underExpose"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  v50 = v49;

  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
  v268 = 0u;
  v267 = 0u;
  v266 = 0u;
  v265 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v265, v285, 16);
  v52 = 0.0;
  if (v51)
  {
    v53 = *(_QWORD *)v266;
    v54 = a4;
    while (2)
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v266 != v53)
          objc_enumerationMutation(obj);
        v56 = *(const __CFDictionary **)(*((_QWORD *)&v265 + 1) + 8 * j);
        memset(&v264, 0, sizeof(v264));
        CMTimeRangeMakeFromDictionary(&v264, v56);
        time = v264.start;
        if (CMTimeGetSeconds(&time) <= v54)
        {
          range = v264;
          CMTimeRangeGetEnd(&v262, &range);
          if (CMTimeGetSeconds(&v262) > v54)
          {
            -[__CFDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", CFSTR("quality"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "floatValue");
            v52 = v58;

            goto LABEL_32;
          }
        }
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v265, v285, 16);
      if (v51)
        continue;
      break;
    }
  }
LABEL_32:

  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
    v61 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v260, v61);
    if ((v260.start.flags & 1) != 0)
    {
      objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
      v63 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&v259, v63);
      if ((v259.duration.flags & 1) != 0)
      {
        objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
        v227 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v227, "objectAtIndexedSubscript:", 0);
        v64 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeRangeMakeFromDictionary(&v284, v64);
        if (v284.duration.epoch)
        {

        }
        else
        {
          v214 = v62;
          objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "objectAtIndexedSubscript:", 0);
          v181 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeRangeMakeFromDictionary(&v258, v181);
          value = v258.duration.value;

          if (value >= 0)
          {
            objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v184 = a4;
            -[VCPLivePhotoKeyFrameAnalyzer selectKeyFrameRangeWithMotion:stillTimestamp:isMetaMotion:](self, "selectKeyFrameRangeWithMotion:stillTimestamp:isMetaMotion:", v183, 1, v184);
            v264 = v260;

            goto LABEL_40;
          }
        }
      }
      else
      {

      }
    }
    else
    {

    }
  }
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v66 = a4;
  -[VCPLivePhotoKeyFrameAnalyzer selectKeyFrameRangeWithMotion:stillTimestamp:isMetaMotion:](self, "selectKeyFrameRangeWithMotion:stillTimestamp:isMetaMotion:", v65, 0, v66);
  v264 = v260;

LABEL_40:
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("MetaFocusResults"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v282 = *MEMORY[0x1E0CA2E40];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
  v206 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v197 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v208 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
  v67 = *MEMORY[0x1E0CA2E50];
  v68 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 8);
  v69 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 28);
  *(_OWORD *)&v284.start.value = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 12);
  *(_OWORD *)&v284.start.epoch = v69;
  v284.duration.timescale = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 44);
  if (v52 >= 10.0)
    goto LABEL_60;
  v257 = 0u;
  v256 = 0u;
  v255 = 0u;
  v254 = 0u;
  v228 = v188;
  v70 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v254, v281, 16);
  if (!v70)
    goto LABEL_59;
  v71 = *(_QWORD *)v255;
  v72 = a4;
  while (2)
  {
    for (k = 0; k != v70; ++k)
    {
      if (*(_QWORD *)v255 != v71)
        objc_enumerationMutation(v228);
      v74 = *(const __CFDictionary **)(*((_QWORD *)&v254 + 1) + 8 * k);
      memset(&v260, 0, sizeof(v260));
      CMTimeRangeMakeFromDictionary(&v260, v74);
      -[__CFDictionary objectForKeyedSubscript:](v74, "objectForKeyedSubscript:", CFSTR("quality"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "floatValue");
      v77 = v76;

      v253 = v260.start;
      if (CMTimeGetSeconds(&v253) > v72
        || (v251 = v260, CMTimeRangeGetEnd(&v252, &v251), CMTimeGetSeconds(&v252) <= v72))
      {
        v245 = v260.start;
        if (CMTimeGetSeconds(&v245) > v72)
        {
          CMTimeMakeWithSeconds(&start, a4, v68);
          v242 = v260;
          CMTimeRangeGetEnd(&end, &v242);
          CMTimeRangeFromTimeToTime(&v259, &start, &end);
          goto LABEL_57;
        }
      }
      else
      {
        if (v77 > 0.0)
        {
          v282 = v260.start.value;
          flags = v260.start.flags;
          timescale = v260.start.timescale;
          v206 = *(_OWORD *)&v260.start.epoch;
          v197 = *(_QWORD *)&v260.duration.timescale;
          epoch = v260.duration.epoch;
LABEL_58:
          v208 = epoch;
          goto LABEL_59;
        }
        v250 = v260.start;
        v78 = CMTimeGetSeconds(&v250);
        v248 = v260;
        CMTimeRangeGetEnd(&v249, &v248);
        v79 = CMTimeGetSeconds(&v249);
        v80 = v72 - v78;
        *(float *)&v79 = v79 - v72;
        if (v80 < *(float *)&v79)
        {
          v247.value = v67;
          *(_QWORD *)&v247.flags = v284.start.value;
          v247.timescale = v68;
          HIDWORD(v247.epoch) = v284.start.timescale;
          CMTimeMakeWithSeconds(&v246, a4, v68);
          CMTimeRangeFromTimeToTime(&v259, &v247, &v246);
LABEL_57:
          v282 = v259.start.value;
          flags = v259.start.flags;
          timescale = v259.start.timescale;
          v206 = *(_OWORD *)&v259.start.epoch;
          v197 = *(_QWORD *)&v259.duration.timescale;
          epoch = v259.duration.epoch;
          goto LABEL_58;
        }
      }
      v67 = v260.start.value;
      v68 = v260.start.timescale;
      *(_OWORD *)&v284.start.value = *(_OWORD *)&v260.start.flags;
      *(_OWORD *)&v284.start.epoch = *(_OWORD *)((char *)&v260.duration.value + 4);
      v284.duration.timescale = HIDWORD(v260.duration.epoch);
    }
    v70 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v254, v281, 16);
    if (v70)
      continue;
    break;
  }
LABEL_59:

LABEL_60:
  objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("KeyFrameResults"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = *MEMORY[0x1E0CA2E18];
  v222 = *(double *)(MEMORY[0x1E0CA2E18] + 8);
  v84 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v85 = objc_alloc_init(VCPVideoKeyFrame);
  v86 = objc_alloc_init(VCPVideoKeyFrame);
  v87 = 0;
  v203 = fminf(a6 + 0.1, 0.2);
  seconds = a5;
  v213 = a4;
  v88 = (flags & 1) == 0;
  v89 = v224;
  if (v50 >= 0.5)
    v89 = 1;
  v204 = v89;
  if ((v197 & 0x100000000) == 0)
    v88 = 1;
  if (v208)
    v88 = 1;
  v185 = *((_QWORD *)&v206 + 1);
  if (v206 < 0)
    v88 = 1;
  v209 = v88;
  v199 = v206;
  v225 = 0.0;
  v90 = -1.0;
  v194 = v84;
  v195 = v83;
  v91 = -1.0;
  v198 = -1.0;
  v186 = -1.0;
  v187 = -1.0;
  v207 = -1.0;
  v196 = -1.0;
  v193 = v222;
  v218 = a5;
  v216 = a4;
  while (v87 < objc_msgSend(v82, "count", v185))
  {
    objc_msgSend(v82, "objectAtIndexedSubscript:", v87);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("attributes"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPLivePhotoKeyFrameAnalyzer fetchAndComputeScoreForKeyFrame:withResult:](self, "fetchAndComputeScoreForKeyFrame:withResult:", v85, v93);

    if (v85)
    {
      v94 = v221;
      -[VCPVideoKeyFrame timestamp](v85, "timestamp");
    }
    else
    {
      memset(&v241, 0, sizeof(v241));
      v94 = v221;
    }
    v96 = CMTimeGetSeconds(&v241);
    *(float *)&v96 = v96;
    v229 = *(float *)&v96;
    if ((v219 & 1) == 0)
    {
      *(float *)&v96 = v218;
      if (v225 >= v218 || (*(float *)&v95 = v229, v229 < v218))
      {
        *(float *)&v95 = v229;
        if (v229 < v218 && v87 + 1 == objc_msgSend(v82, "count", v96, v95))
        {
          -[VCPVideoKeyFrame copyFrom:](v94, "copyFrom:", v85);
          CMTimeMakeWithSeconds(&v240, seconds, 600);
          v239 = v240;
          -[VCPVideoKeyFrame setTimestamp:](v94, "setTimestamp:", &v239);
        }
      }
      else
      {
        -[VCPVideoKeyFrame score](v86, "score", v96, v95);
        v98 = v97;
        -[VCPVideoKeyFrame score](v85, "score");
        v100 = (float)(v218 - v225) + (float)(v229 - v218);
        *(float *)&v101 = (float)((float)((float)(v218 - v225) * v99) + (float)(v98 * (float)(v229 - v218))) / v100;
        -[VCPVideoKeyFrame setScore:](v94, "setScore:", v101);
        -[VCPVideoKeyFrame sharpness](v86, "sharpness");
        v103 = v102;
        -[VCPVideoKeyFrame sharpness](v85, "sharpness");
        *(float *)&v105 = (float)((float)((float)(v218 - v225) * v104) + (float)(v103 * (float)(v229 - v218))) / v100;
        -[VCPVideoKeyFrame setSharpness:](v94, "setSharpness:", v105);
        -[VCPVideoKeyFrame overallFaceQualityScore](v86, "overallFaceQualityScore");
        v107 = v106;
        -[VCPVideoKeyFrame overallFaceQualityScore](v85, "overallFaceQualityScore");
        *(float *)&v109 = (float)((float)((float)(v218 - v225) * v108) + (float)(v107 * (float)(v229 - v218))) / v100;
        -[VCPVideoKeyFrame setOverallFaceQualityScore:](v94, "setOverallFaceQualityScore:", v109);
        -[VCPVideoKeyFrame contentScore](v86, "contentScore");
        v111 = v110;
        -[VCPVideoKeyFrame contentScore](v85, "contentScore");
        *(float *)&v113 = (float)((float)((float)(v218 - v225) * v112) + (float)(v111 * (float)(v229 - v218))) / v100;
        -[VCPVideoKeyFrame setContentScore:](v94, "setContentScore:", v113);
        -[VCPVideoKeyFrame semanticScore](v86, "semanticScore");
        v115 = v114;
        -[VCPVideoKeyFrame semanticScore](v85, "semanticScore");
        *(float *)&v117 = (float)((float)((float)(v218 - v225) * v116) + (float)(v115 * (float)(v229 - v218))) / v100;
        -[VCPVideoKeyFrame setSemanticScore:](v94, "setSemanticScore:", v117);
      }
    }
    if (v225 >= a4 || (*(float *)&v96 = v229, v229 < a4))
    {
      if (v90 == -1.0 && v87 + 1 == objc_msgSend(v82, "count"))
      {
        *(float *)&v134 = self->_photoSharpness;
        -[VCPLivePhotoKeyFrameAnalyzer computeScoreForPhoto:withRefKeyFrame:](self, "computeScoreForPhoto:withRefKeyFrame:", v85, v134);
        v136 = v135;
        -[VCPVideoKeyFrame score](v85, "score");
        if (v137 >= (float)(v33 + v136))
          v90 = v137;
        else
          v90 = v33 + v136;
      }
      else
      {
        v237 = v264;
        if (v85)
          -[VCPVideoKeyFrame timestamp](v85, "timestamp");
        else
          memset(&v236, 0, sizeof(v236));
        if (CMTimeRangeContainsTime(&v237, &v236))
        {
          if (v209)
            goto LABEL_182;
          -[VCPVideoKeyFrame overallFaceQualityScore](v85, "overallFaceQualityScore");
          if (v141 >= 0.15)
            goto LABEL_182;
          if (v85)
            -[VCPVideoKeyFrame timestamp](v85, "timestamp");
          else
            memset(&v258, 0, 24);
          *(_OWORD *)&v260.start.value = *(_OWORD *)&v258.start.value;
          v260.start.epoch = v258.start.epoch;
          v259.start.value = v282;
          v259.start.timescale = timescale;
          v259.start.flags = flags;
          v259.start.epoch = v199;
          if ((CMTimeCompare(&v260.start, &v259.start) & 0x80000000) == 0)
          {
            if (v85)
            {
              -[VCPVideoKeyFrame timestamp](v85, "timestamp");
            }
            else
            {
              v234 = 0uLL;
              v235 = 0;
            }
            v232.start.value = v282;
            v232.start.timescale = timescale;
            v232.start.flags = flags;
            v232.start.epoch = v199;
            v232.duration.value = v185;
            *(_QWORD *)&v232.duration.timescale = v197;
            v232.duration.epoch = 0;
            CMTimeRangeGetEnd(&v233, &v232);
            *(_OWORD *)&v260.start.value = v234;
            v260.start.epoch = v235;
            v259.start = v233;
            if (CMTimeCompare(&v260.start, &v259.start) < 0)
              goto LABEL_182;
          }
          -[VCPVideoKeyFrame sharpness](v85, "sharpness");
          if (v142 >= 0.8 && self->_photoSharpness <= 0.1)
          {
LABEL_182:
            if (!v204 || (-[VCPVideoKeyFrame exposureScore](v85, "exposureScore"), v143 < 50.0))
            {
              -[VCPVideoKeyFrame textureScore](v85, "textureScore");
              if (v144 >= v203)
              {
                -[VCPVideoKeyFrame score](v85, "score");
                if (v145 > v91)
                {
                  if (v85)
                  {
                    -[VCPVideoKeyFrame timestamp](v85, "timestamp");
                    v83 = v260.start.value;
                    v222 = *(double *)&v260.start.timescale;
                    v84 = v260.start.epoch;
                  }
                  else
                  {
                    v84 = 0;
                    v83 = 0;
                    v222 = 0.0;
                  }
                  -[VCPVideoKeyFrame score](v85, "score");
                  v91 = v146;
                  -[VCPVideoKeyFrame overallFaceQualityScore](v85, "overallFaceQualityScore");
                  v198 = v147;
                  -[VCPVideoKeyFrame semanticScore](v85, "semanticScore");
                  v187 = v148;
                  -[VCPVideoKeyFrame sharpness](v85, "sharpness");
                  v186 = v149;
                  -[VCPVideoKeyFrame copyFrom:](v205, "copyFrom:", v85);
                }
              }
              -[VCPVideoKeyFrame semanticScore](v85, "semanticScore");
              if (v150 > v207)
              {
                if (v85)
                {
                  -[VCPVideoKeyFrame timestamp](v85, "timestamp");
                  v193 = *(double *)&v260.start.timescale;
                  v194 = v260.start.epoch;
                  v195 = v260.start.value;
                }
                else
                {
                  v194 = 0;
                  v195 = 0;
                  v193 = 0.0;
                }
                -[VCPVideoKeyFrame semanticScore](v85, "semanticScore");
                v207 = v151;
                -[VCPVideoKeyFrame overallFaceQualityScore](v85, "overallFaceQualityScore");
                v196 = v152;
                -[VCPVideoKeyFrame copyFrom:](v211, "copyFrom:", v85);
              }
            }
          }
        }
      }
    }
    else
    {
      -[VCPVideoKeyFrame sharpness](v86, "sharpness", v96, v95);
      v119 = v118;
      -[VCPVideoKeyFrame sharpness](v85, "sharpness");
      v120 = (float)(v229 - a4) * 100.0;
      v121 = (float)(a4 - v225) * 100.0;
      v123 = v121 + v120;
      photoSharpness = (float)((float)(v121 * v122) + (float)(v119 * v120)) / (float)(v121 + v120);
      if (self->_photoSharpness >= photoSharpness)
        photoSharpness = self->_photoSharpness;
      self->_photoSharpness = photoSharpness;
      -[VCPLivePhotoKeyFrameAnalyzer computeScoreForPhoto:withRefKeyFrame:](self, "computeScoreForPhoto:withRefKeyFrame:", v86);
      v126 = v125;
      *(float *)&v127 = self->_photoSharpness;
      -[VCPLivePhotoKeyFrameAnalyzer computeScoreForPhoto:withRefKeyFrame:](self, "computeScoreForPhoto:withRefKeyFrame:", v85, v127);
      v128 = v33 + v126;
      v130 = v33 + v129;
      if (self->_photoSharpnessReliable)
      {
        -[VCPVideoKeyFrame score](v86, "score");
        v132 = v131;
        -[VCPVideoKeyFrame score](v85, "score");
      }
      else
      {
        -[VCPVideoKeyFrame semanticScore](v86, "semanticScore");
        v132 = v138;
        -[VCPVideoKeyFrame semanticScore](v85, "semanticScore");
      }
      v139 = (float)((float)(v121 * v133) + (float)(v132 * v120)) / v123;
      if (v139 >= (float)((float)((float)(v121 * v130) + (float)(v128 * v120)) / v123))
        v90 = v139;
      else
        v90 = (float)((float)(v121 * v130) + (float)(v128 * v120)) / v123;
      v238.value = v83;
      *(double *)&v238.timescale = v222;
      v238.epoch = v84;
      a4 = v216;
      if (CMTimeGetSeconds(&v238) == v225)
      {
        CMTimeMakeWithSeconds(&v260.start, v213, SLODWORD(v222));
        v83 = v260.start.value;
        v222 = *(double *)&v260.start.timescale;
        v91 = v90;
        v84 = v260.start.epoch;
      }
    }
    -[VCPVideoKeyFrame score](v85, "score");
    v140 = v85;

    ++v87;
    v225 = v229;
    v85 = v86;
    v86 = v140;
  }
  v231.value = v83;
  *(double *)&v231.timescale = v222;
  v231.epoch = v84;
  if (vabdd_f64(CMTimeGetSeconds(&v231), v213) < 0.200000003)
  {
LABEL_129:
    v153 = 0;
    v83 = *MEMORY[0x1E0CA2E18];
    v222 = *(double *)(MEMORY[0x1E0CA2E18] + 8);
    v91 = -1.0;
    v84 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    goto LABEL_130;
  }
  if (self->_photoSharpnessReliable)
  {
    v153 = 0;
    v163 = v91 >= (float)(v90 + 0.1) && v90 <= 0.7;
    if (!v163 && (float)(v91 - v90) < 0.2)
    {
      if (v90 > v91 || v198 < (float)(v33 + 0.15))
        goto LABEL_129;
      goto LABEL_167;
    }
  }
  else
  {
    if (v187 >= (float)(v90 + -0.01) && (float)(v186 - self->_photoSharpness) > 0.5)
    {
LABEL_167:
      v153 = 0;
      goto LABEL_130;
    }
    v91 = v207;
    v180 = v207 < (float)(v90 + 0.1) || v90 > 0.7;
    v153 = 1;
    if (v180)
    {
      v84 = v194;
      v83 = v195;
      if ((float)(v207 - v90) < 0.2 && (v90 > v207 || v196 < (float)(v33 + 0.15)))
        goto LABEL_129;
    }
    else
    {
      v84 = v194;
      v83 = v195;
    }
    v198 = v196;
    v222 = v193;
  }
LABEL_130:
  v154 = (float)(v90 - v33) + 0.15;
  v155 = (float)(v91 - v198);
  if (v154 > v155)
  {
    if (v33 > 0.7
      || (LODWORD(v154) = 1053609165, *(float *)&v155 = v198, v198 < 0.4)
      && v33 == 0.0
      && (*(float *)&v154 = v198, v198 > 0.0))
    {
      v83 = *MEMORY[0x1E0CA2E18];
      v154 = *(double *)(MEMORY[0x1E0CA2E18] + 8);
      v222 = v154;
      v91 = -1.0;
      v84 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    }
  }
  v220 = v153;
  objc_msgSend(v215, "objectForKeyedSubscript:", v154, v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "objectAtIndexedSubscript:", 0);
  v230 = (id)objc_claimAutoreleasedReturnValue();

  HIDWORD(v159) = HIDWORD(v222);
  if ((BYTE4(v222) & 1) != 0)
  {
    v279[0] = CFSTR("keyFrameTime");
    v260.start.value = v83;
    *(double *)&v260.start.timescale = v222;
    v260.start.epoch = v84;
    v160 = CMTimeCopyAsDictionary(&v260.start, 0);
    v280[0] = v160;
    v279[1] = CFSTR("keyFrameScore");
    *(float *)&v161 = v91;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v280[1] = v162;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v280, v279, 2);
    v226 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v226 = 0;
  }
  v164 = v221;
  if (v230)
  {
    v165 = (void *)MEMORY[0x1E0C99E08];
    v277[0] = CFSTR("start");
    objc_msgSend(v230, "objectForKeyedSubscript:");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v278[0] = v223;
    v277[1] = CFSTR("duration");
    objc_msgSend(v230, "objectForKeyedSubscript:");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v278[1] = v166;
    v277[2] = CFSTR("quality");
    objc_msgSend(v230, "objectForKeyedSubscript:");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v278[2] = v167;
    v277[3] = CFSTR("flags");
    objc_msgSend(v230, "objectForKeyedSubscript:");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v278[3] = v168;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v278, v277, 4);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "dictionaryWithDictionary:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v230, "objectForKeyedSubscript:", CFSTR("attributes"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = (void *)objc_msgSend(v171, "mutableCopy");

    objc_msgSend(v172, "removeObjectForKey:", CFSTR("keyFrameTime"));
    objc_msgSend(v172, "removeObjectForKey:", CFSTR("keyFrameScore"));
    *(float *)&v173 = v200;
    if (v200 <= 0.03 && v226)
      objc_msgSend(v172, "addEntriesFromDictionary:", v226, v173);
    if (v172)
      objc_msgSend(v170, "setObject:forKey:", v172, CFSTR("attributes"), v173);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v170, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "vcp_setResult:forKey:", v174, CFSTR("MovieSummaryResults"));

LABEL_158:
    v164 = v221;
  }
  else
  {
    v230 = 0;
    if (v200 <= 0.03 && v226)
    {
      v275[0] = CFSTR("start");
      v175 = MEMORY[0x1E0CA2E68];
      *(_OWORD *)&v260.start.value = *MEMORY[0x1E0CA2E68];
      v260.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v176 = CMTimeCopyAsDictionary(&v260.start, 0);
      v276[0] = v176;
      v275[1] = CFSTR("duration");
      *(_OWORD *)&v260.start.value = *(_OWORD *)v175;
      v260.start.epoch = *(_QWORD *)(v175 + 16);
      v177 = CMTimeCopyAsDictionary(&v260.start, 0);
      v276[1] = v177;
      v276[2] = &unk_1E6B71FF0;
      v275[2] = CFSTR("quality");
      v275[3] = CFSTR("flags");
      v275[4] = CFSTR("attributes");
      v276[3] = &unk_1E6B74D80;
      v276[4] = v226;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v276, v275, 5);
      v230 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v230);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "vcp_setResult:forKey:", v170, CFSTR("MovieSummaryResults"));
      goto LABEL_158;
    }
  }
  if (v220)
    v178 = v211;
  else
    v178 = v205;
  *(float *)&v159 = v90;
  *(float *)&v157 = v33;
  *(float *)&v158 = a4;
  -[VCPLivePhotoKeyFrameAnalyzer reportLivePhotoKeyFrameAnalysisResults:selectedKeyFrame:originalStillKeyFrame:stillScore:stillFQScore:stillTimestamp:useSemanticOnly:isKeyFrameSuggested:](self, "reportLivePhotoKeyFrameAnalysisResults:selectedKeyFrame:originalStillKeyFrame:stillScore:stillFQScore:stillTimestamp:useSemanticOnly:isKeyFrameSuggested:", v200 > 0.03, v178, v164, v159, v157, v158);

  v14 = 0;
LABEL_163:

LABEL_164:
  return v14;
}

- (int)reportLivePhotoKeyFrameAnalysisResults:(BOOL)a3 selectedKeyFrame:(id)a4 originalStillKeyFrame:(id)a5 stillScore:(float)a6 stillFQScore:(float)a7 stillTimestamp:(float)a8 useSemanticOnly:(BOOL)a9 isKeyFrameSuggested:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v16;
  id v18;
  id v19;
  void *v20;
  void *v21;
  float v22;
  int v23;
  float v24;
  float v25;
  char v26;
  float v27;
  float v28;
  float v29;
  char v31;
  const __CFString *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  float v40;
  char v41;
  float v42;
  float v43;
  double v44;
  int v45;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CMTime v57;
  CMTime time;

  v10 = a10;
  v11 = a9;
  v16 = a3;
  v18 = a4;
  v19 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if (v10)
    {
      if (v11)
        objc_msgSend(v18, "semanticScore");
      else
        objc_msgSend(v18, "score");
      v24 = v22;
      objc_msgSend(v18, "overallFaceQualityScore");
      v26 = (float)(v25 - a7) >= 0.15;
      objc_msgSend(v18, "overallFaceQualityScore");
      if ((float)(v24 - v27) >= (float)((float)(a6 - a7) + 0.2)
        || (objc_msgSend(v18, "overallFaceQualityScore"), a6 <= 0.7)
        && (float)(v24 - v28) >= (float)((float)(a6 - a7) + 0.1))
      {
        objc_msgSend(v18, "sharpness");
        if ((float)(v29 - self->_photoSharpness) <= 0.35 || v11)
          v31 = 4;
        else
          v31 = 2;
        v26 |= v31;
      }
      if (v16)
        v32 = CFSTR("UserAlgo");
      else
        v32 = CFSTR("NoUserAlgo");
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v32, CFSTR("KeyFrameIsSuggested"));
      *(float *)&v33 = v24 - a6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("KeyFrameScoreDifference"));

      v35 = (void *)MEMORY[0x1E0CB37E8];
      if (v18)
        objc_msgSend(v18, "timestamp");
      else
        memset(&time, 0, sizeof(time));
      objc_msgSend(v35, "numberWithDouble:", CMTimeGetSeconds(&time) - a8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v36, CFSTR("KeyFrameTimestampOffset"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26 & 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v37, CFSTR("KeyFrameIsFaceQualityDominant"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26 & 4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v38, CFSTR("KeyFrameIsSemanticDominant"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26 & 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v39, CFSTR("KeyFrameIsSharpnessDominant"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("NoAlgo"), CFSTR("KeyFrameIsSuggested"));
    }
    if (v16)
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("UserOrig"), CFSTR("KeyFrameIsSuggestedEdit"));
      if (v11 || !self->_photoSharpnessReliable)
      {
        objc_msgSend(v19, "semanticScore");
        v41 = 1;
      }
      else
      {
        objc_msgSend(v19, "score");
        v41 = 0;
      }
      v42 = a6 - v40;
      if (v42 < 0.0)
        v43 = -1.0;
      else
        v43 = 1.0;
      objc_msgSend(v19, "overallFaceQualityScore");
      v45 = (float)((float)(a7 - *(float *)&v44) * v43) >= 0.15;
      if ((v41 & 1) == 0)
      {
        objc_msgSend(v19, "sharpness");
        if ((float)(v43 * (float)(*(float *)&v44 - self->_photoSharpness)) > 0.35)
          v45 |= 2u;
      }
      v47 = fabsf(v42) >= 0.1 && v45 == 0;
      *(float *)&v44 = v42;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v48, CFSTR("KeyFrameScoreDifferenceEdit"));

      v49 = (void *)MEMORY[0x1E0CB37E8];
      if (v19)
        objc_msgSend(v19, "timestamp");
      else
        memset(&v57, 0, sizeof(v57));
      objc_msgSend(v49, "numberWithDouble:", a8 - CMTimeGetSeconds(&v57));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v50, CFSTR("KeyFrameTimestampOffsetEdit"));

      if (v47)
        v51 = 4;
      else
        v51 = v45;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51 & 1, v57.value, *(_QWORD *)&v57.timescale, v57.epoch, time.value, *(_QWORD *)&time.timescale, time.epoch);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v52, CFSTR("KeyFrameIsFaceQualityDominantEdit"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51 & 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v53, CFSTR("KeyFrameIsSemanticDominantEdit"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51 & 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v54, CFSTR("KeyFrameIsSharpnessDominantEdit"));

    }
    else
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("NoUserAlgo"), CFSTR("KeyFrameIsSuggestedEdit"));
    }
    +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.livephotokeyframeresults"), v21);

    v23 = 0;
  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (void)fetchAndComputeScoreForKeyFrame:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  CMTime v36;
  CMTime v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("frameQualityScore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v6, "setQualityScoreForLivePhoto:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("visualPleasingScore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v6, "setVisualPleasingScore:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("exposureScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(v6, "setExposureScore:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("penaltyScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(v6, "setPenaltyScore:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("textureScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v6, "setTextureScore:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sharpnessScore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v6, "setSharpness:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  CMTimeMakeWithSeconds(&v37, v15, 600);
  v36 = v37;
  objc_msgSend(v6, "setTimestamp:", &v36);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPLivePhotoKeyFrameAnalyzer computeOverallFaceQualityScore:](self, "computeOverallFaceQualityScore:", v16);
  objc_msgSend(v6, "setOverallFaceQualityScore:");

  if (self->_petsDominant)
  {
    objc_msgSend(v6, "sharpness");
    if (v17 <= 0.7)
    {
      objc_msgSend(v6, "sharpness");
      if (v18 > self->_photoSharpness)
      {
        objc_msgSend(v6, "setSharpness:");
        objc_msgSend(v6, "qualityScoreForLivePhoto");
        if (self->_photoSharpness < *(float *)&v19)
          *(float *)&v19 = self->_photoSharpness;
        objc_msgSend(v6, "setQualityScoreForLivePhoto:", v19);
      }
    }
  }
  objc_msgSend(v6, "qualityScoreForLivePhoto");
  v20 = 0.0;
  v21 = 0.0;
  if (v22 > 0.0)
  {
    objc_msgSend(v6, "qualityScoreForLivePhoto");
    if (v23 >= 0.3)
    {
      objc_msgSend(v6, "qualityScoreForLivePhoto");
      v25 = v24;
      objc_msgSend(v6, "visualPleasingScore");
      v27 = v26;
      objc_msgSend(v6, "penaltyScore");
      v20 = (float)((float)((float)((float)(v25 * 0.1) + 0.0) + (float)(v27 * 0.25)) / 0.35) * v28;
    }
    objc_msgSend(v6, "penaltyScore");
    v30 = v29;
    objc_msgSend(v6, "visualPleasingScore");
    v21 = v30 * v31;
  }
  objc_msgSend(v6, "overallFaceQualityScore");
  v33 = 1.0;
  if (v20 < 1.0)
    v33 = v20;
  if (v20 <= 0.0)
    v33 = 0.0;
  *(float *)&v32 = *(float *)&v32 + v33;
  objc_msgSend(v6, "setScore:", v32);
  objc_msgSend(v6, "overallFaceQualityScore");
  v35 = 1.0;
  if (v21 < 1.0)
    v35 = v21;
  if (v21 <= 0.0)
    v35 = 0.0;
  *(float *)&v34 = v35 + *(float *)&v34;
  objc_msgSend(v6, "setSemanticScore:", v34);

}

- (float)computeScoreForPhoto:(float)a3 withRefKeyFrame:(id)a4
{
  id v6;
  void *v7;
  double v8;
  float v10;
  double v11;
  float v12;
  float v13;
  float v14;

  v6 = a4;
  v7 = v6;
  LODWORD(v8) = 0;
  if (a3 >= 0.0)
    *(float *)&v8 = a3;
  if (self->_photoSharpnessReliable && a3 < 1.0)
    v10 = *(float *)&v8;
  else
    v10 = 1.0;
  objc_msgSend(v6, "sharpness", v8);
  if (*(float *)&v11 <= 0.0)
  {
    LODWORD(v11) = 0;
    if (v10 <= 0.0)
      goto LABEL_17;
    goto LABEL_14;
  }
  objc_msgSend(v7, "qualityScoreForLivePhoto");
  v12 = *(float *)&v11;
  LODWORD(v11) = 0;
  if (v10 > 0.0 && v12 != 0.0)
  {
LABEL_14:
    if (self->_photoSharpnessReliable)
    {
      objc_msgSend(v7, "visualPleasingScore", v11);
      *(float *)&v11 = (float)((float)((float)(v10 * 0.1) + 0.0) + (float)(*(float *)&v11 * 0.25)) / 0.35;
    }
    else
    {
      objc_msgSend(v7, "visualPleasingScore", v11);
    }
  }
LABEL_17:
  v13 = 1.0;
  if (*(float *)&v11 < 1.0)
    v13 = *(float *)&v11;
  if (*(float *)&v11 <= 0.0)
    v14 = 0.0;
  else
    v14 = v13;

  return v14;
}

- (float)computeOverallFaceQualityScore:(id)a3
{
  id v4;
  float v5;
  unint64_t v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  NSString *v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  float v17;
  float v18;
  float v19;
  double v20;
  float v21;
  float v22;
  NSRect v24;

  v4 = a3;
  v5 = 0.0;
  if (!self->_ignoreFace)
  {
    v6 = 0;
    v7 = 0.0;
    v8 = 0.0;
    while (v6 < objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("attributes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("faceBounds"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = NSRectFromString(v11);
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
      objc_msgSend(v10, "objectForKey:", CFSTR("faceQuality"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      -[VCPLivePhotoKeyFrameAnalyzer getFaceHeat:](self, "getFaceHeat:", x, y, width, height);
      if (height >= width)
        v20 = height;
      else
        v20 = width;
      v21 = v20;
      v22 = v19 * v21;
      v8 = v8 + (float)(v18 * v22);
      v7 = v7 + v22;

      ++v6;
    }
    if (v7 <= 0.0)
      v5 = 0.0;
    else
      v5 = v8 / v7;
  }

  return v5;
}

- (void)createFaceHeatMap:(id)a3 imageFaces:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  bzero(self->_faceHeatMap, self->_height * (uint64_t)self->_width);
  v7 = objc_msgSend(v13, "count");
  self->_numOfFrames = v7 + 1;
  if (v7 >= 255)
    v8 = (v7 + 1) / 0xFFu + 1;
  else
    v8 = 1;
  v9 = 0;
  self->_numOfFrames = 0;
  while (v9 < objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FaceResults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VCPLivePhotoKeyFrameAnalyzer updateFaceHeatMap:](self, "updateFaceHeatMap:", v12);
    ++self->_numOfFrames;

    v9 += v8;
  }
  -[VCPLivePhotoKeyFrameAnalyzer updateFaceHeatMap:](self, "updateFaceHeatMap:", v6);
  ++self->_numOfFrames;

}

- (void)updateFaceHeatMap:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSString *v9;
  int width;
  int height;
  int v12;
  double v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  NSRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "objectForKey:", CFSTR("attributes"), (_QWORD)v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("faceBounds"));
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        v31 = NSRectFromString(v9);
        if (v31.size.height >= 0.0700000003 || v31.size.width >= 0.0700000003)
          self->_ignoreFace = 0;
        width = self->_width;
        height = self->_height;
        v12 = width - 1;
        v13 = (double)width;
        v14 = vcvtmd_s64_f64(v31.origin.x * (double)width);
        if (v14 >= v12)
          v15 = v12;
        else
          v15 = v14;
        v16 = vcvtmd_s64_f64((v31.origin.x + v31.size.width) * v13);
        if (v14 <= 0)
          v17 = 0;
        else
          v17 = v15;
        if (v16 < v12)
          v12 = v16;
        if (v16 <= 0)
          v12 = 0;
        v18 = height - 1;
        v19 = (double)height;
        v20 = vcvtmd_s64_f64(v31.origin.y * (double)height);
        if (v20 >= v18)
          v21 = v18;
        else
          v21 = v20;
        v22 = vcvtmd_s64_f64((v31.origin.y + v31.size.height) * v19);
        if (v20 <= 0)
          v23 = 0;
        else
          v23 = v21;
        if (v22 < v18)
          v18 = v22;
        if (v22 <= 0)
          v18 = 0;
        if (v17 < v12)
        {
          do
          {
            v24 = v23;
            if (v23 < v18)
            {
              do
                ++self->_faceHeatMap[v17 + self->_width * v24++];
              while (v18 != v24);
            }
            ++v17;
          }
          while (v17 != v12);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

}

- (float)getFaceHeat:(CGRect)a3
{
  double y;
  int height;
  int v5;
  double v6;
  double v7;
  double v8;
  int v9;
  unsigned __int8 v10;
  double v11;
  double v12;
  double v13;
  uint64_t width;
  int v15;
  double x;
  double v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned int v24;
  float v25;
  float v26;
  BOOL v27;
  float result;

  if (a3.origin.y < 1.0)
    y = a3.origin.y;
  else
    y = 1.0;
  if (a3.origin.y <= 0.0)
    y = 0.0;
  height = self->_height;
  v5 = (int)(y * (double)height);
  v6 = a3.origin.y + a3.size.height;
  if (v6 < 1.0)
    v7 = v6;
  else
    v7 = 1.0;
  if (v6 <= 0.0)
    v8 = 0.0;
  else
    v8 = v7;
  v9 = (int)(v8 * (double)height);
  if (v5 >= v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = a3.origin.x + a3.size.width;
    if (a3.origin.x + a3.size.width < 1.0)
      v12 = a3.origin.x + a3.size.width;
    else
      v12 = 1.0;
    if (v11 <= 0.0)
      v13 = 0.0;
    else
      v13 = v12;
    width = self->_width;
    v15 = (int)(v13 * (double)(int)width);
    if (a3.origin.x < 1.0)
      x = a3.origin.x;
    else
      x = 1.0;
    if (a3.origin.x <= 0.0)
      v17 = 0.0;
    else
      v17 = x;
    v18 = (int)(v17 * (double)(int)width);
    v19 = v5;
    v20 = v18 + (int)width * (uint64_t)v5;
    do
    {
      if (v18 < v15)
      {
        v21 = &self->_faceHeatMap[v20];
        v22 = v15 - (uint64_t)v18;
        do
        {
          v24 = *v21++;
          v23 = v24;
          if (v10 <= v24)
            v10 = v23;
          --v22;
        }
        while (v22);
      }
      ++v19;
      v20 += width;
    }
    while (v19 != v9);
  }
  v25 = (float)v10 / (float)self->_numOfFrames;
  v26 = 1.0;
  if (v25 < 1.0)
    v26 = (float)v10 / (float)self->_numOfFrames;
  v27 = v25 > 0.0;
  result = 0.0;
  if (v27)
    return v26;
  return result;
}

@end
