@implementation FlexLegacySongRendition

- (FlexLegacySongRendition)initWithSong:(id)a3 segments:(id)a4 withOptions:(id)a5
{
  id v9;
  FlexLegacySongRendition *v10;
  FlexLegacySongRendition *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v84.receiver = self;
  v84.super_class = (Class)FlexLegacySongRendition;
  v10 = -[FMSongRendition initWithSong:andOptions:](&v84, sel_initWithSong_andOptions_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_segments, a4);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v12 = v9;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v80, (uint64_t)v85, 16);
    if (v14)
    {
      v19 = v14;
      v20 = 0;
      v21 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v81 != v21)
            objc_enumerationMutation(v12);
          v20 += objc_msgSend_duration(*(void **)(*((_QWORD *)&v80 + 1) + 8 * i), v15, v16, v17, v18, (_QWORD)v80);
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v80, (uint64_t)v85, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend_setDuration_(v11, v23, v20, v24, v25);
    objc_msgSend_lastObject(v12, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v30;
    if (v30)
    {
      objc_msgSend_url(v30, v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend_setDurationOfSilence_(v11, v37, 0, v39, v40);
        objc_msgSend_setDurationOfMusic_(v11, v41, v20, v42, v43, (_QWORD)v80);
      }
      else
      {
        v49 = objc_msgSend_duration(v35, v37, v38, v39, v40);
        objc_msgSend_setDurationOfSilence_(v11, v50, v49, v51, v52);
        v57 = objc_msgSend_duration(v11, v53, v54, v55, v56);
        v62 = v57 - objc_msgSend_durationOfSilence(v11, v58, v59, v60, v61);
        objc_msgSend_setDurationOfMusic_(v11, v63, v62, v64, v65, (_QWORD)v80);
      }
    }
    else
    {
      objc_msgSend_setDurationOfMusic_(v11, v31, 0, v33, v34);
      objc_msgSend_setDurationOfSilence_(v11, v46, 0, v47, v48);
    }
    v66 = objc_msgSend__durationOfOutroForPlaylist_onlyUsedDuration_(FlexLegacySongRendition, v44, (uint64_t)v12, 1, v45, (_QWORD)v80);
    objc_msgSend_setDurationOfUsedOutro_(v11, v67, v66, v68, v69);
    v72 = objc_msgSend__durationOfOutroForPlaylist_onlyUsedDuration_(FlexLegacySongRendition, v70, (uint64_t)v12, 0, v71);
    objc_msgSend_setDurationOfFullOutro_(v11, v73, v72, v74, v75);
    objc_msgSend__buildTracksFromSegments_(v11, v76, (uint64_t)v12, v77, v78);

  }
  return v11;
}

+ (int64_t)_durationOfOutroForPlaylist:(id)a3 onlyUsedDuration:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;

  v4 = a4;
  v5 = a3;
  objc_msgSend_lastObject(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (!v10)
    goto LABEL_17;
  objc_msgSend_segment(v10, v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if ((unint64_t)objc_msgSend_count(v5, v17, v18, v19, v20) >= 2)
    {
      v69 = objc_msgSend_count(v5, v65, v66, v67, v68);
      objc_msgSend_objectAtIndex_(v5, v70, v69 - 2, v71, v72);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v44, v73, v74, v75, v76);
      v77 = objc_claimAutoreleasedReturnValue();
      if (!v77
        || (v82 = (void *)v77,
            objc_msgSend_segment(v44, v78, v79, v80, v81),
            v83 = (void *)objc_claimAutoreleasedReturnValue(),
            v88 = objc_msgSend_type(v83, v84, v85, v86, v87),
            v83,
            v82,
            v88 != 4))
      {
        v31 = 0;
        goto LABEL_22;
      }
      if (v4)
      {
        v31 = objc_msgSend_duration(v44, v89, v90, v91, v92);
        if ((unint64_t)objc_msgSend_count(v5, v93, v94, v95, v96) < 3)
        {
LABEL_22:

          goto LABEL_23;
        }
        v101 = objc_msgSend_count(v5, v97, v98, v99, v100);
        objc_msgSend_objectAtIndex_(v5, v102, v101 - 3, v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_segment(v105, v106, v107, v108, v109);
        v110 = objc_claimAutoreleasedReturnValue();
        if (v110)
        {
          v115 = (void *)v110;
          objc_msgSend_segment(v105, v111, v112, v113, v114);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = objc_msgSend_type(v116, v117, v118, v119, v120);

          if (v121 == 5)
            v31 += objc_msgSend_duration(v105, v122, v123, v124, v125);
        }
      }
      else
      {
        objc_msgSend_segment(v44, v89, v90, v91, v92);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_sampleCount(v105, v130, v131, v132, v133);
      }

      goto LABEL_22;
    }
LABEL_17:
    v31 = 0;
    goto LABEL_23;
  }
  objc_msgSend_segment(v15, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_type(v21, v22, v23, v24, v25);

  if (v26 != 4)
    goto LABEL_17;
  if (!v4)
  {
    objc_msgSend_segment(v15, v27, v28, v29, v30);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_sampleCount(v44, v126, v127, v128, v129);
    goto LABEL_22;
  }
  v31 = objc_msgSend_duration(v15, v27, v28, v29, v30);
  if ((unint64_t)objc_msgSend_count(v5, v32, v33, v34, v35) >= 2)
  {
    v40 = objc_msgSend_count(v5, v36, v37, v38, v39);
    objc_msgSend_objectAtIndex_(v5, v41, v40 - 2, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v44, v45, v46, v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v54 = (void *)v49;
      objc_msgSend_segment(v44, v50, v51, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend_type(v55, v56, v57, v58, v59);

      if (v60 == 5)
        v31 += objc_msgSend_duration(v44, v61, v62, v63, v64);
    }
    goto LABEL_22;
  }
LABEL_23:

  return v31;
}

- (void)_buildTracksFromSegments:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  float v123;
  FMKeyFrame *v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  FMKeyFrame *v133;
  double v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  FMKeyFrame *v152;
  double v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  FMKeyFrame *v175;
  double v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  FMKeyFrame *v197;
  double v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  FMKeyFrame *v237;
  double v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  FMTrack *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  FMTrack *v297;
  const char *v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  id v311;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  uint64_t v319;
  void *v320;
  char v321;
  uint64_t v322;
  uint64_t v323;

  v3 = a3;
  v307 = (void *)objc_opt_new();
  v318 = v3;
  v8 = objc_msgSend_count(v3, v4, v5, v6, v7);
  v310 = (void *)objc_opt_new();
  v309 = (void *)objc_opt_new();
  v308 = (void *)objc_opt_new();
  v305 = v8 - 1;
  v306 = v8;
  if (v8 >= 1)
  {
    v13 = 0;
    v14 = 0;
    v321 = 1;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v318, v9, v14, v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_new();
      objc_msgSend_setPosition_(v16, v17, v13, v18, v19);
      objc_msgSend_url(v15, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUrl_(v16, v25, (uint64_t)v24, v26, v27);

      v32 = objc_msgSend_offset(v15, v28, v29, v30, v31);
      objc_msgSend_setOffset_(v16, v33, v32, v34, v35);
      v40 = objc_msgSend_duration(v15, v36, v37, v38, v39);
      objc_msgSend_setDuration_(v16, v41, v40, v42, v43);
      v319 = objc_msgSend_duration(v16, v44, v45, v46, v47);
      if (v14)
      {
        objc_msgSend_objectAtIndexedSubscript_(v318, v48, v14 - 1, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = 0;
      }
      if (v14 >= v305)
      {
        v320 = 0;
      }
      else
      {
        objc_msgSend_objectAtIndexedSubscript_(v318, v48, v14 + 1, v50, v51);
        v320 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_segment(v52, v48, v49, v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v15, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v320, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v58, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_barsUsed(v52, v69, v70, v71, v72);
      v315 = v53;
      objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v53, v74, (uint64_t)v68, v73 - 1, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v316 = v63;
      objc_msgSend_name(v63, v77, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_barsUsed(v15, v82, v83, v84, v85);
      v317 = v58;
      objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v58, v87, (uint64_t)v81, v86 - 1, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      v90 = v309;
      if ((v321 & 1) != 0)
      {
        v91 = v307;
      }
      else
      {
        v90 = v308;
        v91 = v310;
      }
      v92 = v90;
      v97 = v91;
      v323 = 0;
      if (v76)
      {
        if (objc_msgSend_fadeIn(v76, v93, v94, v95, v96) >= 1
          && (objc_msgSend_prevented(v76, v93, v94, v95, v96) & 1) == 0)
        {
          objc_msgSend_transitionSegmentName(v76, v93, v94, v95, v96);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v98)
          {
            v99 = objc_msgSend_fadeOut(v76, v93, v94, v95, v96);
            v100 = v76;
            v101 = v97;
            v102 = v52;
            v103 = v15;
            v104 = v99;
            v109 = objc_msgSend_fadeIn(v100, v105, v106, v107, v108);
            v110 = v104;
            v15 = v103;
            v52 = v102;
            v97 = v101;
            v76 = v100;
            objc_msgSend_crossfadeLengthInSamplesForFromSeg_toSeg_fadeOutTimeInMsec_fadeInTimeInMsec_validFadeOutSamples_validFadeInSamples_(FlexSegment, v111, (uint64_t)v315, (uint64_t)v317, v110, v109, 0, &v323);
            objc_msgSend_setFadeInLength_(v16, v112, v323, v113, v114);
          }
        }
      }
      objc_msgSend_lastVolumeKeyFrame(v92, v93, v94, v95, v96);
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v313, v115, v116, v117, v118);
      if (v323 < 1)
      {
        v151 = v13;
        if (v123 != 0.0)
          goto LABEL_26;
      }
      else
      {
        if (v123 != 0.0)
        {
          v124 = [FMKeyFrame alloc];
          LODWORD(v125) = 0;
          v129 = (void *)objc_msgSend_initWithValue_atTime_(v124, v126, v13, v127, v128, v125);
          objc_msgSend_appendVolumeKeyframe_(v92, v130, (uint64_t)v129, v131, v132);

        }
        v133 = [FMKeyFrame alloc];
        LODWORD(v134) = 0;
        v138 = (void *)objc_msgSend_initWithValue_atTime_(v133, v135, v13, v136, v137, v134);
        objc_msgSend_appendVolumeKeyframe_(v92, v139, (uint64_t)v138, v140, v141);

        v142 = v323 + v13;
        if (v142 <= objc_msgSend_duration(self, v143, v144, v145, v146))
          v151 = v323 + v13;
        else
          v151 = objc_msgSend_duration(self, v147, v148, v149, v150);
      }
      v152 = [FMKeyFrame alloc];
      LODWORD(v153) = 1.0;
      v157 = (void *)objc_msgSend_initWithValue_atTime_(v152, v154, v151, v155, v156, v153);
      objc_msgSend_appendVolumeKeyframe_(v92, v158, (uint64_t)v157, v159, v160);

LABEL_26:
      v322 = 0;
      v314 = v15;
      if (!v89)
        goto LABEL_40;
      v311 = v97;
      if (objc_msgSend_fadeOut(v89, v119, v120, v121, v122) < 1)
        goto LABEL_30;
      if ((objc_msgSend_prevented(v89, v161, v162, v163, v164) & 1) != 0)
        goto LABEL_30;
      objc_msgSend_transitionSegmentName(v89, v165, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();

      if (v169)
        goto LABEL_30;
      objc_msgSend_segment(v15, v170, v171, v172, v173);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v211 = objc_msgSend_barsUsed(v15, v207, v208, v209, v210);
      v304 = objc_msgSend_barEndPositionForBarIndex_(v206, v212, v211 - 1, v213, v214);

      v219 = objc_msgSend_fadeOut(v89, v215, v216, v217, v218);
      v224 = objc_msgSend_fadeIn(v89, v220, v221, v222, v223);
      objc_msgSend_crossfadeLengthInSamplesForFromSeg_toSeg_fadeOutTimeInMsec_fadeInTimeInMsec_validFadeOutSamples_validFadeInSamples_(FlexSegment, v225, (uint64_t)v317, (uint64_t)v316, v219, v224, &v322, 0);
      v230 = v322;
      if (v322 < 1)
      {
LABEL_40:
        v174 = 0;
        goto LABEL_41;
      }
      if (v230 + v304 <= objc_msgSend_sampleCount(v317, v226, v227, v228, v229))
      {
        v236 = 0;
        v235 = v322;
      }
      else
      {
        v235 = objc_msgSend_sampleCount(v317, v231, v232, v233, v234) - v304;
        v236 = v322 - v235;
      }
      if (v235 >= 1)
      {
        v249 = objc_msgSend_duration(v16, v231, v232, v233, v234);
        objc_msgSend_setDuration_(v16, v250, v249 + v235, v251, v252);
        objc_msgSend_setFadeOutLength_(v16, v253, v235, v254, v255);
      }
      if (v236 < 1)
      {
LABEL_30:
        v174 = 0;
      }
      else
      {
        if (objc_msgSend_useNextSegmentForFadeOut(v89, v231, v232, v233, v234)
          && (objc_msgSend_sliceable(v317, v256, v257, v258, v259) & 1) == 0
          && v320)
        {
          v174 = (void *)objc_opt_new();
          objc_msgSend_url(v320, v260, v261, v262, v263);
          v264 = v236;
          v265 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setUrl_(v174, v266, (uint64_t)v265, v267, v268);

          v236 = v264;
        }
        else
        {
          v174 = (void *)objc_msgSend_copy(v16, v256, v257, v258, v259);
        }
        objc_msgSend_setOffset_(v174, v269, 0, v270, v271);
        objc_msgSend_setDuration_(v174, v272, v236, v273, v274);
        v279 = objc_msgSend_duration(v16, v275, v276, v277, v278);
        objc_msgSend_setPosition_(v174, v280, v279 + v13, v281, v282);
        objc_msgSend_setFadeOutLength_(v174, v283, v236, v284, v285);
      }
      if (v322 < 1)
      {
        v97 = v311;
LABEL_41:
        v237 = [FMKeyFrame alloc];
        LODWORD(v238) = 1.0;
        v202 = objc_msgSend_initWithValue_atTime_(v237, v239, v319 + v13, v240, v241, v238);
        goto LABEL_42;
      }
      v175 = [FMKeyFrame alloc];
      LODWORD(v176) = 1.0;
      v180 = objc_msgSend_initWithValue_atTime_(v175, v177, v319 + v13, v178, v179, v176);
      v181 = v92;
      v182 = (void *)v180;
      v183 = v181;
      objc_msgSend_appendVolumeKeyframe_(v181, v184, v180, v185, v186);

      v187 = v322 + v319 + v13;
      if (v187 <= objc_msgSend_duration(self, v188, v189, v190, v191))
        v196 = v322 + v319 + v13;
      else
        v196 = objc_msgSend_duration(self, v192, v193, v194, v195);
      v92 = v183;
      v97 = v311;
      v197 = [FMKeyFrame alloc];
      LODWORD(v198) = 0;
      v202 = objc_msgSend_initWithValue_atTime_(v197, v199, v196, v200, v201, v198);
LABEL_42:
      v242 = (void *)v202;
      objc_msgSend_appendVolumeKeyframe_(v92, v203, v202, v204, v205);

      objc_msgSend_addObject_(v97, v243, (uint64_t)v16, v244, v245);
      if (v174)
        objc_msgSend_addObject_(v97, v246, (uint64_t)v174, v247, v248);
      v321 ^= 1u;
      v13 += v319;

      ++v14;
    }
    while (v306 != v14);
  }
  objc_msgSend_removeRedundantVolumeKeyFrames(v309, v9, v10, v11, v12);
  objc_msgSend_removeRedundantVolumeKeyFrames(v308, v286, v287, v288, v289);
  v290 = [FMTrack alloc];
  v293 = (void *)objc_msgSend_initWithClips_mixParameters_(v290, v291, (uint64_t)v307, (uint64_t)v309, v292);
  objc_msgSend_setTrackA_(self, v294, (uint64_t)v293, v295, v296);

  v297 = [FMTrack alloc];
  v300 = (void *)objc_msgSend_initWithClips_mixParameters_(v297, v298, (uint64_t)v310, (uint64_t)v308, v299);
  objc_msgSend_setTrackB_(self, v301, (uint64_t)v300, v302, v303);

}

- (id)_buildOutroFadeoutMixParams
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int32_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int32_t v34;
  CMTimeValue value;
  CMTimeValue v36;
  FMKeyFrame *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  FMKeyFrame *v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  CMTime v56;
  CMTime v57;
  CMTime rhs;
  CMTime lhs;
  CMTime v60;
  CMTime v61;
  _QWORD v62[7];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void *v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  uint64_t v80;

  objc_msgSend_timedMetadataItemsWithIdentifier_(self, a2, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v76 = &v75;
  v77 = 0x3810000000;
  v78 = &unk_20D04E5A7;
  v79 = *MEMORY[0x24BDC0D40];
  v80 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3810000000;
  v72 = &unk_20D04E5A7;
  v73 = v79;
  v74 = v80;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_20D0461D4;
  v67 = sub_20D0461E4;
  v68 = 0;
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = sub_20D0461EC;
  v62[3] = &unk_24C5F0C60;
  v62[4] = &v75;
  v62[5] = &v69;
  v62[6] = &v63;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v5, v6, 2, (uint64_t)v62, v7);
  v12 = (void *)v64[5];
  if (!v12)
    goto LABEL_3;
  memset(&v61, 0, sizeof(v61));
  v13 = objc_msgSend_integerValue(v12, v8, v9, v10, v11);
  objc_msgSend_song(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_sampleRate(v18, v19, v20, v21, v22);
  CMTimeMake(&v61, v13, v23);

  memset(&v60, 0, sizeof(v60));
  lhs = *(CMTime *)(v76 + 4);
  rhs = *(CMTime *)(v70 + 4);
  CMTimeAdd(&v60, &lhs, &rhs);
  lhs = v61;
  rhs = v60;
  if (CMTimeCompare(&lhs, &rhs) < 0)
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend_song(self, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_sampleRate(v29, v30, v31, v32, v33);

    lhs = v61;
    CMTimeConvertScale(&v57, &lhs, v34, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    value = v57.value;
    lhs = v60;
    CMTimeConvertScale(&v56, &lhs, v34, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v36 = v56.value;
    v37 = [FMKeyFrame alloc];
    LODWORD(v38) = 1.0;
    v42 = (void *)objc_msgSend_initWithValue_atTime_(v37, v39, value, v40, v41, v38);
    objc_msgSend_appendVolumeKeyframe_(v24, v43, (uint64_t)v42, v44, v45);

    v46 = [FMKeyFrame alloc];
    LODWORD(v47) = 0;
    v51 = (void *)objc_msgSend_initWithValue_atTime_(v46, v48, v36, v49, v50, v47);
    objc_msgSend_appendVolumeKeyframe_(v24, v52, (uint64_t)v51, v53, v54);

  }
  else
  {
LABEL_3:
    v24 = 0;
  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

  return v24;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (int64_t)durationOfUsedOutro
{
  return self->_durationOfUsedOutro;
}

- (void)setDurationOfUsedOutro:(int64_t)a3
{
  self->_durationOfUsedOutro = a3;
}

- (int64_t)durationOfFullOutro
{
  return self->_durationOfFullOutro;
}

- (void)setDurationOfFullOutro:(int64_t)a3
{
  self->_durationOfFullOutro = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
