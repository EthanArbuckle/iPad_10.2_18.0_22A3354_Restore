@implementation FlexMLSummaryManager

- (FlexMLSummaryManager)initWithSummaryMapping:(id)a3 bundlePath:(id)a4 metadataPath:(id)a5 targetTimeScale:(int)a6
{
  id v10;
  id v11;
  id v12;
  FlexMLSummaryManager *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FlexMLSummaryManager *v18;
  NSArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Float64 v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSArray *allFileNames;
  NSArray *v55;
  NSArray *allDurations;
  NSArray *v57;
  id v59;
  id v60;
  FlexMLSummaryManager *v61;
  id v62;
  id v63;
  id obj;
  CMTime v65;
  CMTime v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v71.receiver = self;
  v71.super_class = (Class)FlexMLSummaryManager;
  v13 = -[FlexMLSummaryManager init](&v71, sel_init);
  v18 = v13;
  if (v13)
  {
    v59 = v12;
    v60 = a4;
    v62 = v11;
    v61 = v13;
    v13->_targetTimeScale = a6;
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v14, v15, v16, v17);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v20, v21, v22, v23);
    v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v63 = v10;
    obj = v10;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v67, (uint64_t)v72, 16);
    if (v26)
    {
      v30 = v26;
      v31 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v68 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend_objectAtIndex_(v33, v27, 0, v28, v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v33, v35, 1, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v66, 0, sizeof(v66));
          objc_msgSend_doubleValue(v34, v39, v40, v41, v42);
          CMTimeMakeWithSeconds(&v66, v43, a6);
          v65 = v66;
          objc_msgSend_valueWithCMTime_(MEMORY[0x24BDD1968], v44, (uint64_t)&v65, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v19, v48, (uint64_t)v38, v49, v50);
          objc_msgSend_addObject_(v24, v51, (uint64_t)v47, v52, v53);

        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v67, (uint64_t)v72, 16);
      }
      while (v30);
    }

    v18 = v61;
    allFileNames = v61->_allFileNames;
    v61->_allFileNames = v19;
    v55 = v19;

    allDurations = v61->_allDurations;
    v61->_allDurations = v24;
    v57 = v24;

    objc_storeStrong((id *)&v61->_rootPath, v60);
    objc_storeStrong((id *)&v61->_metadataPath, a5);

    v11 = v62;
    v10 = v63;
    v12 = v59;
  }

  return v18;
}

- (double)averageGranularityBetweenSummaries
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  _QWORD v11[7];
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = (int *)&v12;
  v14 = 0x2020000000;
  v15 = 1;
  objc_msgSend_allDurations(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_20D0214D4;
  v11[3] = &unk_24C5EFF98;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v7, 2, (uint64_t)v11, v8);

  v9 = v17[3] / (double)v13[6];
  v17[3] = v9;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)summaryForDuration:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double Seconds;
  Float64 v33;
  double v34;
  double v35;
  Float64 v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  Float64 v44;
  BOOL v45;
  char v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  CMTime v71;
  CMTime v72;
  CMTime rhs;
  CMTime time2;
  CMTime time1;
  CMTime v76[2];

  objc_msgSend_allDurations(self, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v76[1], 0, sizeof(CMTime));
  if (v12)
    objc_msgSend_CMTimeValue(v12, v13, v14, v15, v16);
  objc_msgSend_allDurations(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v76, 0, 24);
  if (v22)
    objc_msgSend_CMTimeValue(v22, v23, v24, v25, v26);
  time1 = (CMTime)*a3;
  time2 = v76[1];
  if (CMTimeCompare(&time1, &time2) < 1)
  {
    time1 = (CMTime)*a3;
    objc_msgSend__summaryForDuration_(self, v27, (uint64_t)&time1, v29, v30);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    time1 = (CMTime)*a3;
    time2 = v76[0];
    Seconds = CMTimeGetSeconds(&time2);
    time2 = v76[1];
    v33 = CMTimeGetSeconds(&time2);
    time2 = (CMTime)*a3;
    v34 = Seconds / v33;
    v35 = CMTimeGetSeconds(&time2);
    time2 = v76[1];
    v36 = CMTimeGetSeconds(&time2);
    v37 = v35 / v36 - (double)(int)llround(v35 / v36);
    objc_msgSend_averageGranularityBetweenSummaries(self, v38, v39, v40, v41);
    v43 = v42;
    time2 = v76[1];
    v44 = CMTimeGetSeconds(&time2);
    v45 = v37 == 0.0;
    if (v37 <= v43 / v44)
      v45 = 1;
    v46 = v37 >= v34 || v45;
    if ((v46 & 1) == 0)
    {
      time2 = time1;
      rhs = v76[0];
      CMTimeSubtract(&time1, &time2, &rhs);
    }
    time2 = time1;
    rhs = v76[0];
    if (CMTimeCompare(&time2, &rhs) >= 1)
    {
      do
      {
        time2 = time1;
        objc_msgSend__summaryForDuration_(self, v47, (uint64_t)&time2, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v31, v52, (uint64_t)v51, v53, v54);
        if (v51)
          objc_msgSend_duration(v51, v55, v56, v57, v58);
        else
          memset(&v72, 0, sizeof(v72));
        rhs = time1;
        CMTimeSubtract(&time2, &rhs, &v72);
        time1 = time2;

        time2 = time1;
        rhs = v76[0];
      }
      while (CMTimeCompare(&time2, &rhs) > 0);
    }
    if ((v46 & 1) == 0)
    {
      memset(&time2, 0, sizeof(time2));
      rhs = v76[0];
      v71 = time1;
      CMTimeAdd(&time2, &rhs, &v71);
      rhs = time2;
      objc_msgSend__summaryForDuration_(self, v59, (uint64_t)&rhs, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v31, v63, (uint64_t)v62, v64, v65);

    }
    v66 = objc_msgSend_targetTimeScale(self, v47, v48, v49, v50);
    objc_msgSend_summaryFromSummaries_targetTimeScale_(FlexMLSummary, v67, (uint64_t)v31, v66, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v69;
}

- (id)_summaryForDuration:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int32_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  FlexMLSummary *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  Float64 v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int32_t v108;
  double Seconds;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int32_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v176;
  void *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t j;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  int v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  double v214;
  Float64 v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  int32_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  double v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  FlexMLSummary *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  id v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  void *v284;
  CMTime *v285;
  void *v286;
  void *v287;
  id obj;
  id obja;
  FlexMLSummaryManager *v290;
  CMTime v291;
  CMTime v292;
  CMTime v293;
  CMTime v294;
  CMTime v295;
  CMTime v296;
  CMTime v297;
  CMTime time;
  CMTimeRange time1;
  CMTime duration;
  CMTimeRange v301;
  CMTime rhs;
  CMTime lhs;
  CMTime start;
  __int128 v305;
  CMTimeEpoch v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  CMTime time2;
  _BYTE v320[128];
  _BYTE v321[128];
  CMTimeValue value;
  CMTimeScale timescale;
  _BYTE v324[128];
  uint64_t v325;

  v325 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_allDurations(self, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v7, v8, v9, v10, v11);

  if (v12)
  {
    v17 = -1;
    while (1)
    {
      objc_msgSend_allDurations(self, v13, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v18, v19, v17 + 1, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v301, 0, 24);
      if (v22)
        objc_msgSend_CMTimeValue(v22, v23, v24, v25, v26);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v301.start.value;
      time1.start.epoch = v301.start.epoch;
      time2 = (CMTime)*a3;
      if (!CMTimeCompare(&time1.start, &time2))
      {

        v34 = v17 + 1;
        goto LABEL_12;
      }
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v301.start.value;
      time1.start.epoch = v301.start.epoch;
      time2 = (CMTime)*a3;
      v27 = CMTimeCompare(&time1.start, &time2);

      if ((v27 & 0x80000000) == 0)
        break;
      objc_msgSend_allDurations(self, v13, v14, v15, v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

      v34 = v17 + 1;
      v35 = v17 + 2;
      ++v17;
      if (v35 >= v33)
        goto LABEL_12;
    }
    v34 = v17;
  }
  else
  {
    v34 = -1;
  }
LABEL_12:
  v36 = v34 & ~(v34 >> 63);
  objc_msgSend_rootPath(self, v13, v14, v15, v16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v37, v38, (uint64_t)CFSTR("Summaries"), v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allFileNames(self, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v46, v47, v36, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v41, v51, (uint64_t)v50, v52, v53);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x24BDBCED8], v54, (uint64_t)v276, v55, v56);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = [FlexMLSummary alloc];
  v63 = objc_msgSend_targetTimeScale(self, v59, v60, v61, v62);
  v275 = v57;
  v277 = (void *)objc_msgSend_initWithDictionary_targetTimeScale_(v58, v64, v57, v63, v65);
  v66 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend_metadataPath(self, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithContentsOfFile_(v66, v72, (uint64_t)v71, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v75, v76, (uint64_t)CFSTR("songBeats"), v77, v78);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v272 = v75;
    v273 = v50;
    v274 = v41;
    v285 = (CMTime *)a3;
    v290 = self;
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v79, v80, v81, v82);
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v84, v85, v86, v87);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    v315 = 0u;
    v316 = 0u;
    v317 = 0u;
    v318 = 0u;
    v271 = v83;
    obj = v83;
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v88, (uint64_t)&v315, (uint64_t)v324, 16);
    if (v89)
    {
      v93 = v89;
      v94 = *(_QWORD *)v316;
      do
      {
        for (i = 0; i != v93; ++i)
        {
          if (*(_QWORD *)v316 != v94)
            objc_enumerationMutation(obj);
          v96 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v96, v90, (uint64_t)CFSTR("time"), v91, v92, v271);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v301, 0, 24);
          objc_msgSend_doubleValue(v97, v98, v99, v100, v101);
          v103 = v102;
          v108 = objc_msgSend_targetTimeScale(v290, v104, v105, v106, v107);
          CMTimeMakeWithSeconds(&v301.start, v103, v108);
          *(_OWORD *)&time1.start.value = *(_OWORD *)&v301.start.value;
          time1.start.epoch = v301.start.epoch;
          Seconds = CMTimeGetSeconds(&time1.start);
          objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v110, v111, v112, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v283, v115, (uint64_t)v114, v116, v117);

          objc_msgSend_objectForKey_(v96, v118, (uint64_t)CFSTR("bar"), v119, v120);
          v121 = objc_claimAutoreleasedReturnValue();
          if (v121)
          {
            v125 = (void *)v121;
            objc_msgSend_objectForKeyedSubscript_(v96, v122, (uint64_t)CFSTR("bar"), v123, v124);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = objc_msgSend_BOOLValue(v126, v127, v128, v129, v130);

            if (v131)
            {
              objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v132, v133, v134, v135, Seconds);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v287, v137, (uint64_t)v136, v138, v139);

            }
          }

        }
        v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v90, (uint64_t)&v315, (uint64_t)v324, 16);
      }
      while (v93);
    }

    objc_msgSend_sortUsingSelector_(v283, v140, (uint64_t)sel_compare_, v141, v142);
    objc_msgSend_sortUsingSelector_(v287, v143, (uint64_t)sel_compare_, v144, v145);
    objc_msgSend_orderedSet(MEMORY[0x24BDBCEE0], v146, v147, v148, v149);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedSet(MEMORY[0x24BDBCEE0], v150, v151, v152, v153);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = MEMORY[0x24BDC0D40];
    value = *MEMORY[0x24BDC0D40];
    timescale = *(_DWORD *)(MEMORY[0x24BDC0D40] + 8);
    memset(&time2, 0, sizeof(time2));
    v159 = objc_msgSend_targetTimeScale(v290, v155, v156, v157, v158);
    CMTimeMake(&time2, 1, v159);
    objc_msgSend_segments(v277, v160, v161, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v311 = 0u;
    v312 = 0u;
    v313 = 0u;
    v314 = 0u;
    objc_msgSend_segments(v277, v165, v166, v167, v168);
    v278 = (id)objc_claimAutoreleasedReturnValue();
    v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v278, v169, (uint64_t)&v311, (uint64_t)v321, 16);
    if (v281)
    {
      flags = *(_DWORD *)(v154 + 12);
      epoch = *(_QWORD *)(v154 + 16);
      v279 = *(_QWORD *)v312;
      v280 = v164;
      do
      {
        v176 = 0;
        do
        {
          if (*(_QWORD *)v312 != v279)
            objc_enumerationMutation(v278);
          v177 = *(void **)(*((_QWORD *)&v311 + 1) + 8 * v176);
          objc_msgSend_lastObject(v164, v170, v171, v172, v173, v271);
          v178 = (void *)objc_claimAutoreleasedReturnValue();

          v282 = v176;
          if (v177 == v178)
          {
            v186 = 0;
          }
          else
          {
            v182 = objc_msgSend_indexOfObject_(v164, v179, (uint64_t)v177, v180, v181);
            objc_msgSend_objectAtIndexedSubscript_(v164, v183, v182 + 1, v184, v185);
            v186 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v309 = 0u;
          v310 = 0u;
          v307 = 0u;
          v308 = 0u;
          obja = v283;
          v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v187, (uint64_t)&v307, (uint64_t)v320, 16);
          if (v188)
          {
            v193 = v188;
            v194 = *(_QWORD *)v308;
            do
            {
              for (j = 0; j != v193; ++j)
              {
                if (*(_QWORD *)v308 != v194)
                  objc_enumerationMutation(obja);
                v196 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * j);
                v305 = 0uLL;
                v306 = 0;
                if (v177)
                {
                  objc_msgSend_trackTime(v177, v189, v190, v191, v192);
                  memset(&start, 0, sizeof(start));
                  objc_msgSend_duration(v177, v197, v198, v199, v200);
                  if (v186)
                  {
                    objc_msgSend_summaryTime(v186, v201, v202, v203, v204);
                    objc_msgSend_summaryTime(v177, v205, v206, v207, v208);
LABEL_41:
                    CMTimeSubtract(&v301.start, &lhs, &rhs);
                    v209 = 0;
                    start = v301.start;
                    goto LABEL_43;
                  }
                }
                else
                {
                  memset(&start, 0, sizeof(start));
                  if (v186)
                  {
                    objc_msgSend_summaryTime(v186, v189, v190, v191, v192);
                    memset(&rhs, 0, sizeof(rhs));
                    goto LABEL_41;
                  }
                }
                v209 = 1;
LABEL_43:
                memset(&v301, 0, sizeof(v301));
                *(_OWORD *)&time1.start.value = v305;
                time1.start.epoch = v306;
                duration = start;
                CMTimeRangeMake(&v301, &time1.start, &duration);
                memset(&duration, 0, sizeof(duration));
                objc_msgSend_doubleValue(v196, v210, v211, v212, v213);
                v215 = v214;
                v220 = objc_msgSend_targetTimeScale(v290, v216, v217, v218, v219);
                CMTimeMakeWithSeconds(&duration, v215, v220);
                time1 = v301;
                time = duration;
                if (!CMTimeRangeContainsTime(&time1, &time))
                {
                  memset(&time, 0, sizeof(time));
                  time1.start = duration;
                  v297 = time2;
                  CMTimeAdd(&time, &time1.start, &v297);
                  time1 = v301;
                  v297 = time;
                  if (!CMTimeRangeContainsTime(&time1, &v297))
                    continue;
                  duration = time;
                }
                memset(&time1, 0, 24);
                if (v177)
                {
                  objc_msgSend_trackTime(v177, v189, v190, v191, v192);
                  objc_msgSend_summaryTime(v177, v221, v222, v223, v224);
                }
                else
                {
                  memset(&v296, 0, sizeof(v296));
                  memset(&v295, 0, sizeof(v295));
                }
                CMTimeSubtract(&time1.start, &v296, &v295);
                memset(&time, 0, sizeof(time));
                v297 = duration;
                v294 = time1.start;
                CMTimeSubtract(&time, &v297, &v294);
                if ((flags & 1) == 0)
                  goto LABEL_67;
                v297.value = value;
                v297.timescale = timescale;
                v297.flags = flags;
                v297.epoch = epoch;
                v294 = time2;
                CMTimeSubtract(&v293, &v297, &v294);
                v297 = time;
                if (CMTimeCompare(&v297, &v293))
                {
                  v297.value = value;
                  v297.timescale = timescale;
                  v297.flags = flags;
                  v297.epoch = epoch;
                  v294 = time2;
                  CMTimeAdd(&v292, &v297, &v294);
                  v297 = time;
                  if (CMTimeCompare(&v297, &v292))
                  {
LABEL_67:
                    if (!v209
                      || (v297 = *v285,
                          v294 = time2,
                          CMTimeSubtract(&v291, &v297, &v294),
                          v297 = time,
                          CMTimeCompare(&v297, &v291))
                      && (v297 = time, v294 = *v285, CMTimeCompare(&v297, &v294)))
                    {
                      v297 = time;
                      v225 = CMTimeGetSeconds(&v297);
                      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v226, v227, v228, v229);
                      v230 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v286, v231, (uint64_t)v230, v232, v233);

                      if (objc_msgSend_containsObject_(v287, v234, (uint64_t)v196, v235, v236))
                      {
                        objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v189, v190, v191, v192, v225);
                        v237 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_addObject_(v284, v238, (uint64_t)v237, v239, v240);

                      }
                      value = time.value;
                      flags = time.flags;
                      timescale = time.timescale;
                      epoch = time.epoch;
                    }
                  }
                }
              }
              v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v189, (uint64_t)&v307, (uint64_t)v320, 16);
            }
            while (v193);
          }

          v176 = v282 + 1;
          v164 = v280;
        }
        while (v282 + 1 != v281);
        v281 = objc_msgSend_countByEnumeratingWithState_objects_count_(v278, v170, (uint64_t)&v311, (uint64_t)v321, 16);
      }
      while (v281);
    }

    objc_msgSend_array(v286, v241, v242, v243, v244);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(v284, v246, v247, v248, v249);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = (void *)v275;
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v252, v275, v253, v254);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v255, v256, (uint64_t)v245, (uint64_t)CFSTR("beatTimes"), v257);
    objc_msgSend_setObject_forKey_(v255, v258, (uint64_t)v250, (uint64_t)CFSTR("barTimes"), v259);
    v260 = [FlexMLSummary alloc];
    v265 = objc_msgSend_targetTimeScale(v290, v261, v262, v263, v264);
    v268 = objc_msgSend_initWithDictionary_targetTimeScale_(v260, v266, (uint64_t)v255, v265, v267);

    v269 = (void *)v268;
    v50 = v273;
    v41 = v274;
    v83 = v271;
    v75 = v272;
  }
  else
  {
    v251 = (void *)v275;
    v269 = v277;
  }

  return v269;
}

- (NSArray)allFileNames
{
  return self->_allFileNames;
}

- (NSArray)allDurations
{
  return self->_allDurations;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (NSString)metadataPath
{
  return self->_metadataPath;
}

- (int)targetTimeScale
{
  return self->_targetTimeScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_allDurations, 0);
  objc_storeStrong((id *)&self->_allFileNames, 0);
}

@end
