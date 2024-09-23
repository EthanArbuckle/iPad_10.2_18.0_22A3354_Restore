@implementation FMSongRendition

- (FMSongRendition)initWithSong:(id)a3 andOptions:(id)a4
{
  id v7;
  id v8;
  FMSongRendition *v9;
  FMSongRendition *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMSongRendition;
  v9 = -[FMSongRendition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_song, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_trackA(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("\nTrackA: %@"), v14, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(CFSTR("\nFMTracks:"), v17, (uint64_t)v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_trackB(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v21, v32, (uint64_t)CFSTR("\nTrackB: %@"), v33, v34, v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v20, v36, (uint64_t)v35, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

+ (id)coalesceMixParamsA:(id)a3 withMixParamsB:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  float v58;
  void *v59;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  FMKeyFrame *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  FMKeyFrame *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  FMKeyFrame *v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t k;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t m;
  void *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  float v185;
  float v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  double v199;
  float v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v11 = v6;
  if (!v6)
    goto LABEL_4;
  objc_msgSend_volumeKeyFrames(v6, v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v12, v13, v14, v15, v16) == 1)
  {
    objc_msgSend_volumeKeyFrames(v11, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_value(v26, v27, v28, v29, v30);
    v32 = v31;

    if (v32 == 1.0)
    {
LABEL_4:
      v37 = v5;
LABEL_10:
      v59 = v37;
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (!v5)
  {
LABEL_9:
    v37 = v11;
    goto LABEL_10;
  }
  objc_msgSend_volumeKeyFrames(v5, v33, v34, v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v38, v39, v40, v41, v42) == 1)
  {
    objc_msgSend_volumeKeyFrames(v5, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v47, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_value(v52, v53, v54, v55, v56);
    v58 = v57;

    if (v58 == 1.0)
      goto LABEL_9;
  }
  else
  {

  }
  v59 = (void *)objc_opt_new();
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  v221 = 0u;
  objc_msgSend_volumeKeyFrames(v5, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v218, (uint64_t)v225, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v219;
    do
    {
      for (i = 0; i != v68; ++i)
      {
        if (*(_QWORD *)v219 != v69)
          objc_enumerationMutation(v65);
        v71 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * i);
        v72 = [FMKeyFrame alloc];
        v77 = objc_msgSend_sampleTime(v71, v73, v74, v75, v76);
        LODWORD(v78) = 0;
        v82 = (void *)objc_msgSend_initWithValue_atTime_(v72, v79, v77, v80, v81, v78);
        objc_msgSend_appendVolumeKeyframe_(v59, v83, (uint64_t)v82, v84, v85);

      }
      v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v86, (uint64_t)&v218, (uint64_t)v225, 16);
    }
    while (v68);
  }

  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  objc_msgSend_volumeKeyFrames(v11, v87, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v92, (uint64_t)&v214, (uint64_t)v224, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v215;
    do
    {
      for (j = 0; j != v94; ++j)
      {
        if (*(_QWORD *)v215 != v95)
          objc_enumerationMutation(v91);
        v97 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * j);
        v98 = [FMKeyFrame alloc];
        v103 = objc_msgSend_sampleTime(v97, v99, v100, v101, v102);
        LODWORD(v104) = 0;
        v108 = (void *)objc_msgSend_initWithValue_atTime_(v98, v105, v103, v106, v107, v104);
        objc_msgSend_insertVolumeKeyframe_(v59, v109, (uint64_t)v108, v110, v111);

      }
      v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v112, (uint64_t)&v214, (uint64_t)v224, 16);
    }
    while (v94);
  }

  v113 = (void *)objc_opt_new();
  objc_msgSend_volumeKeyFrames(v59, v114, v115, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v118, v119, v120, v121, v122) != 1)
  {
    v126 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v118, v123, v126, v124, v125);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend_sampleTime(v127, v128, v129, v130, v131);

      objc_msgSend_objectAtIndexedSubscript_(v118, v133, ++v126, v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend_sampleTime(v136, v137, v138, v139, v140);

      v142 = v141 + v132;
      if (v141 + v132 < 0 != __OFADD__(v141, v132))
        ++v142;
      v143 = v142 >> 1;
      v144 = [FMKeyFrame alloc];
      LODWORD(v145) = 0;
      v149 = (void *)objc_msgSend_initWithValue_atTime_(v144, v146, v143, v147, v148, v145);
      objc_msgSend_addObject_(v113, v150, (uint64_t)v149, v151, v152);

    }
    while (v126 < objc_msgSend_count(v118, v153, v154, v155, v156) - 1);
  }
  v205 = v118;
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  v157 = v113;
  v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v158, (uint64_t)&v210, (uint64_t)v223, 16);
  if (v159)
  {
    v163 = v159;
    v164 = *(_QWORD *)v211;
    do
    {
      for (k = 0; k != v163; ++k)
      {
        if (*(_QWORD *)v211 != v164)
          objc_enumerationMutation(v157);
        objc_msgSend_insertVolumeKeyframe_(v59, v160, *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * k), v161, v162);
      }
      v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v157, v160, (uint64_t)&v210, (uint64_t)v223, 16);
    }
    while (v163);
  }

  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  objc_msgSend_volumeKeyFrames(v59, v166, v167, v168, v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v170, v171, (uint64_t)&v206, (uint64_t)v222, 16);
  if (v172)
  {
    v177 = v172;
    v178 = *(_QWORD *)v207;
    do
    {
      for (m = 0; m != v177; ++m)
      {
        if (*(_QWORD *)v207 != v178)
          objc_enumerationMutation(v170);
        v180 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * m);
        v181 = objc_msgSend_sampleTime(v180, v173, v174, v175, v176);
        objc_msgSend_volumeValueAtTime_(v5, v182, v181, v183, v184);
        v186 = v185;
        v191 = objc_msgSend_sampleTime(v180, v187, v188, v189, v190);
        objc_msgSend_volumeValueAtTime_(v11, v192, v191, v193, v194);
        if (fabsf(v186) == INFINITY)
          v200 = 1.0;
        else
          v200 = v186;
        if (fabsf(*(float *)&v199) == INFINITY)
          *(float *)&v199 = 1.0;
        *(float *)&v199 = v200 * *(float *)&v199;
        objc_msgSend_setValue_(v180, v195, v196, v197, v198, v199);
      }
      v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v170, v173, (uint64_t)&v206, (uint64_t)v222, 16);
    }
    while (v177);
  }

  objc_msgSend_removeRedundantVolumeKeyFrames(v59, v201, v202, v203, v204);
LABEL_11:

  return v59;
}

- (id)avCompositionWithAudioMix:(id *)a3 includeShortenedOutroFadeOut:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  char v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  dispatch_semaphore_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  dispatch_time_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int64_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  int64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unsigned int v167;
  unsigned int v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  int v173;
  double v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  int64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unsigned int v193;
  unsigned int v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  int v199;
  double v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  void *v210;
  id v211;
  void *v213;
  char v214;
  void *v215;
  FMSongRendition *v216;
  void *v217;
  int32_t timescale;
  uint64_t v219;
  id obj;
  uint64_t v221;
  CMTime v222;
  CMTime v223;
  CMTimeRange v224;
  CMTime v225;
  CMTime v226;
  CMTime v227;
  CMTime duration;
  CMTime start;
  CMTimeRange v230;
  _QWORD v231[4];
  NSObject *v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  CMTimeRange buf;
  uint64_t v238;
  uint64_t v239;
  _BYTE v240[128];
  uint64_t v241;

  v5 = a4;
  v241 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_composition(MEMORY[0x24BDB25B0], a2, (uint64_t)a3, a4, v4);
  v211 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_song(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  timescale = objc_msgSend_sampleRate(v11, v12, v13, v14, v15);

  if (v5
    && (objc_msgSend_options(self, v16, v17, v18, v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("OutroCanBeShortened"), v22, v23),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend_BOOLValue(v24, v25, v26, v27, v28),
        v24,
        v20,
        v29))
  {
    objc_msgSend__buildOutroFadeoutMixParams(self, v16, v17, v18, v19);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v210 = 0;
  }
  v213 = 0;
  v30 = 1;
  v31 = *MEMORY[0x24BDB1CF0];
  v221 = *MEMORY[0x24BDB21C0];
  v219 = *MEMORY[0x24BDB1CF0];
  v216 = self;
  do
  {
    v32 = v30;
    if ((v30 & 1) != 0)
      objc_msgSend_trackA(self, v16, v17, v18, v19);
    else
      objc_msgSend_trackB(self, v16, v17, v18, v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
      goto LABEL_43;
    v214 = v32;
    objc_msgSend_addMutableTrackWithMediaType_preferredTrackID_(v211, v33, v31, 0, v34);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    v215 = v35;
    objc_msgSend_clips(v35, v36, v37, v38, v39);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v233, (uint64_t)v240, 16);
    if (!v41)
      goto LABEL_27;
    v42 = v41;
    v43 = *(_QWORD *)v234;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v234 != v43)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * i);
        v46 = (void *)MEMORY[0x212B9B7A0]();
        objc_msgSend_url(v45, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v56 = (void *)MEMORY[0x24BDB26C8];
          objc_msgSend_url(v45, v52, v53, v54, v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v238 = v221;
          v239 = MEMORY[0x24BDBD1C8];
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v58, (uint64_t)&v239, (uint64_t)&v238, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_URLAssetWithURL_options_(v56, v60, (uint64_t)v57, (uint64_t)v59, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = dispatch_semaphore_create(0);
          v231[0] = MEMORY[0x24BDAC760];
          v231[1] = 3221225472;
          v231[2] = sub_20D01BE00;
          v231[3] = &unk_24C5EFCC8;
          v64 = v63;
          v232 = v64;
          objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(v62, v65, (uint64_t)&unk_24C5FACC8, (uint64_t)v231, v66);
          v67 = dispatch_time(0, 20000000000);
          if (dispatch_semaphore_wait(v64, v67))
          {
            FlexLogForCategory(0);
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_url(v45, v72, v73, v74, v75);
              v76 = objc_claimAutoreleasedReturnValue();
              LODWORD(buf.start.value) = 138412290;
              *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v76;
              _os_log_impl(&dword_20D016000, v71, OS_LOG_TYPE_DEFAULT, "Timed out waiting for tracks to load for asset: \"%@\", (uint8_t *)&buf, 0xCu);
              goto LABEL_23;
            }
          }
          else
          {
            objc_msgSend_tracksWithMediaType_(v62, v68, v31, v69, v70);
            v71 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v71, v77, v78, v79, v80))
            {
              objc_msgSend_tracksWithMediaType_(v62, v81, v31, v82, v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndex_(v84, v85, 0, v86, v87);
              v76 = objc_claimAutoreleasedReturnValue();

              v92 = objc_msgSend_offset(v45, v88, v89, v90, v91);
              CMTimeMake(&start, v92, timescale);
              v97 = objc_msgSend_duration(v45, v93, v94, v95, v96);
              CMTimeMake(&duration, v97, timescale);
              CMTimeRangeMake(&v230, &start, &duration);
              v102 = objc_msgSend_position(v45, v98, v99, v100, v101);
              v31 = v219;
              CMTimeMake(&v227, v102, timescale);
              objc_msgSend_insertTimeRange_ofTrack_atTime_error_(v217, v103, (uint64_t)&v230, (uint64_t)v76, (uint64_t)&v227, 0);
            }
            else
            {
              FlexLogForCategory(0);
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend_url(v45, v104, v105, v106, v107);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf.start.value) = 138412290;
                *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v108;
                _os_log_impl(&dword_20D016000, v76, OS_LOG_TYPE_DEFAULT, "0 audio tracks found in asset: \"%@\", (uint8_t *)&buf, 0xCu);

                v31 = v219;
              }
            }
LABEL_23:

          }
        }
        objc_autoreleasePoolPop(v46);
      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v233, (uint64_t)v240, 16);
    }
    while (v42);
LABEL_27:

    if (!a3)
      goto LABEL_41;
    v35 = v215;
    objc_msgSend_mixParameters(v215, v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {
      v119 = (uint64_t)v213;
      if (!v213)
      {
        objc_msgSend_array(MEMORY[0x24BDBCEB8], v115, v116, v117, v118);
        v119 = objc_claimAutoreleasedReturnValue();
      }
      v213 = (void *)v119;
      objc_msgSend_audioMixInputParametersWithTrack_(MEMORY[0x24BDB25A8], v115, (uint64_t)v217, v117, v118, v210);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mixParameters(v215, v121, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_coalesceMixParamsA_withMixParamsB_(FMSongRendition, v126, (uint64_t)v125, (uint64_t)v210, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_volumeKeyFrames(v128, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = objc_msgSend_count(v133, v134, v135, v136, v137);
      v142 = v138 - 1;
      if (v138 >= 1)
      {
        v143 = v138;
        v144 = 0;
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(v133, v139, v144, v140, v141);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          if (v144 < v142
            && (objc_msgSend_objectAtIndexedSubscript_(v133, v145, v144 + 1, v147, v148),
                (v150 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v151 = (void *)v150;
            memset(&buf, 0, sizeof(buf));
            v152 = objc_msgSend_sampleTime(v149, v145, v146, v147, v148);
            CMTimeMake(&v226, v152, timescale);
            v157 = objc_msgSend_sampleTime(v151, v153, v154, v155, v156);
            v162 = objc_msgSend_sampleTime(v149, v158, v159, v160, v161);
            CMTimeMake(&v225, v157 - v162, timescale);
            CMTimeRangeMake(&buf, &v226, &v225);
            objc_msgSend_value(v149, v163, v164, v165, v166);
            v168 = v167;
            objc_msgSend_value(v151, v169, v170, v171, v172);
            LODWORD(v174) = v173;
            v224 = buf;
            objc_msgSend_setVolumeRampFromStartVolume_toEndVolume_timeRange_(v120, v175, (uint64_t)&v224, v176, v177, COERCE_DOUBLE(__PAIR64__(buf.duration.flags, v168)), v174);

            ++v144;
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            v178 = objc_msgSend_sampleTime(v149, v145, v146, v147, v148);
            CMTimeMake(&v223, v178, timescale);
            v183 = objc_msgSend_duration(v216, v179, v180, v181, v182);
            v188 = objc_msgSend_sampleTime(v149, v184, v185, v186, v187);
            CMTimeMake(&v222, v183 - v188, timescale);
            CMTimeRangeMake(&buf, &v223, &v222);
            if (buf.duration.value >= 1)
            {
              objc_msgSend_value(v149, v189, v190, v191, v192);
              v194 = v193;
              objc_msgSend_value(v149, v195, v196, v197, v198);
              LODWORD(v200) = v199;
              v224 = buf;
              objc_msgSend_setVolumeRampFromStartVolume_toEndVolume_timeRange_(v120, v201, (uint64_t)&v224, v202, v203, COERCE_DOUBLE(__PAIR64__(buf.duration.flags, v194)), v200);
            }
            ++v144;
          }
          v31 = v219;

        }
        while (v144 != v143);
      }
      objc_msgSend_addObject_(v213, v139, (uint64_t)v120, v140, v141);

LABEL_41:
      v35 = v215;
    }

    self = v216;
    v32 = v214;
LABEL_43:

    v30 = 0;
  }
  while ((v32 & 1) != 0);
  if (a3)
  {
    if (v213)
    {
      objc_msgSend_audioMix(MEMORY[0x24BDB25A0], v16, v17, v18, v19);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInputParameters_(v204, v205, (uint64_t)v213, v206, v207);
    }
    else
    {
      v204 = 0;
    }
    v208 = objc_retainAutorelease(v204);
    *a3 = v208;

  }
  return v211;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend_song(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timedMetadataItemsWithIdentifier_forRendition_(v9, v10, (uint64_t)v4, (uint64_t)self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)_maxPeakAndLoudness:(double *)a3 missingPeakValueCount:(int *)a4 missingLoudnessCount:(int *)a5
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;

  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend_timedMetadataItemsWithIdentifier_(self, a2, (uint64_t)CFSTR("FMTimedMetadataIdentifierSegment"), (uint64_t)a4, (uint64_t)a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_20D01C050;
  v16[3] = &unk_24C5EFCF0;
  v16[4] = &v33;
  v16[5] = &v21;
  v16[6] = &v29;
  v16[7] = &v25;
  v16[8] = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v9, (uint64_t)v16, v10, v11);
  if (a3)
  {
    v12 = v26[3];
    if (v12 <= 0.0)
      v13 = -INFINITY;
    else
      v13 = v30[3] / v12;
    v30[3] = v13;
    *a3 = v13;
  }
  if (a4)
    *a4 = *((_DWORD *)v22 + 6);
  if (a5)
    *a5 = *((_DWORD *)v18 + 6);
  v14 = v34[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  return v14;
}

- (id)_buildOutroFadeoutMixParams
{
  return 0;
}

- (FMTrack)trackA
{
  return self->_trackA;
}

- (void)setTrackA:(id)a3
{
  objc_storeStrong((id *)&self->_trackA, a3);
}

- (FMTrack)trackB
{
  return self->_trackB;
}

- (void)setTrackB:(id)a3
{
  objc_storeStrong((id *)&self->_trackB, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (int64_t)durationOfSilence
{
  return self->_durationOfSilence;
}

- (void)setDurationOfSilence:(int64_t)a3
{
  self->_durationOfSilence = a3;
}

- (int64_t)durationOfMusic
{
  return self->_durationOfMusic;
}

- (void)setDurationOfMusic:(int64_t)a3
{
  self->_durationOfMusic = a3;
}

- (FlexSongProtocol)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
  objc_storeStrong((id *)&self->_song, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_trackB, 0);
  objc_storeStrong((id *)&self->_trackA, 0);
}

@end
