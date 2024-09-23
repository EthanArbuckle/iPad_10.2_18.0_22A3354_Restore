@implementation FlexMLSongRendition

- (FlexMLSongRendition)initWithSong:(id)a3 options:(id)a4 andSummary:(id)a5 forDuration:(id *)a6
{
  id v11;
  FlexMLSongRendition *v12;
  FlexMLSongRendition *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  int64_t var3;
  objc_super v24;

  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FlexMLSongRendition;
  v12 = -[FMSongRendition initWithSong:andOptions:](&v24, sel_initWithSong_andOptions_, a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_summary, a5);
    v22 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    objc_msgSend__calculateDuration_(v13, v14, (uint64_t)&v22, v15, v16);
    objc_msgSend__buildTracks(v13, v17, v18, v19, v20);
  }

  return v13;
}

- (void)_calculateDuration:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int32_t v12;
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
  CMTimeEpoch v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  CMTime rhs;
  CMTime lhs;
  CMTime v36;
  CMTime v37;
  CMTime time;
  CMTime v39;

  objc_msgSend_song(self, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_sampleRate(v7, v8, v9, v10, v11);

  memset(&v39, 0, sizeof(v39));
  time = *(CMTime *)a3;
  CMTimeConvertScale(&v39, &time, v12, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  memset(&time, 0, sizeof(time));
  objc_msgSend_summary(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v17;
  if (v17)
    objc_msgSend_duration(v17, v18, v19, v20, v21);
  else
    memset(&time, 0, sizeof(time));

  memset(&v37, 0, sizeof(v37));
  v36 = time;
  CMTimeConvertScale(&v37, &v36, v12, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  memset(&v36, 0, sizeof(v36));
  lhs = v39;
  rhs = v37;
  CMTimeSubtract(&v36, &lhs, &rhs);
  lhs = v36;
  v33 = *MEMORY[0x24BDC0D88];
  *(_OWORD *)&rhs.value = *MEMORY[0x24BDC0D88];
  v23 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  rhs.epoch = v23;
  if (CMTimeCompare(&lhs, &rhs) < 0)
  {
    *(_OWORD *)&v36.value = v33;
    v36.epoch = v23;
  }
  objc_msgSend_setDuration_(self, v24, v39.value, v25, v26, v33);
  objc_msgSend_setDurationOfSilence_(self, v27, v36.value, v28, v29);
  objc_msgSend_setDurationOfMusic_(self, v30, v37.value, v31, v32);
}

- (void)_buildTracks
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int32_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  CMTime *v34;
  void *v35;
  uint64_t i;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  FMKeyFrame *v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  int v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  int v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  FMKeyFrame *v143;
  double v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
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
  FMKeyFrame *v161;
  double v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  FlexMLSongRendition *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  FMTrack *v237;
  const char *v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  FMTrack *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  FlexMLSongRendition *v251;
  void *v252;
  void *v253;
  id obj;
  uint64_t v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  uint64_t v260;
  id v261;
  void *v262;
  uint64_t v263;
  char v264;
  CMTime v265;
  CMTime time2;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v270;
  CMTime v271;
  CMTime v272;
  CMTime v273;
  CMTime v274;
  CMTime v275;
  CMTime v276;
  CMTime time;
  CMTime v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  _BYTE v283[128];
  uint64_t v284;

  v284 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_summary(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_song(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_sampleRate(v11, v12, v13, v14, v15);

  v257 = (void *)objc_opt_new();
  v253 = (void *)objc_opt_new();
  v259 = (void *)objc_opt_new();
  v258 = (void *)objc_opt_new();
  objc_msgSend_song(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_song(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioFileURL(v27, v28, v29, v30, v31);
    v256 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v256 = 0;
  }
  v251 = self;
  v252 = v6;
  v281 = 0u;
  v282 = 0u;
  v279 = 0u;
  v280 = 0u;
  objc_msgSend_segments(v6, v23, v24, v25, v26);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v260 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v279, (uint64_t)v283, 16);
  v33 = 0;
  if (v260)
  {
    v255 = *(_QWORD *)v280;
    v264 = 1;
    v34 = (CMTime *)MEMORY[0x24BDC0D88];
    v35 = v253;
    do
    {
      for (i = 0; i != v260; ++i)
      {
        if (*(_QWORD *)v280 != v255)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * i);
        v42 = (void *)objc_opt_new();
        memset(&v278, 0, sizeof(v278));
        if (v37)
          objc_msgSend_summaryTime(v37, v38, v39, v40, v41);
        else
          memset(&time, 0, sizeof(time));
        CMTimeConvertScale(&v278, &time, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        objc_msgSend_setPosition_(v42, v43, v278.value, v44, v45);
        objc_msgSend_setUrl_(v42, v46, (uint64_t)v256, v47, v48);
        memset(&v276, 0, sizeof(v276));
        if (v37)
          objc_msgSend_trackTime(v37, v49, v50, v51, v52);
        else
          memset(&v275, 0, sizeof(v275));
        CMTimeConvertScale(&v276, &v275, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        objc_msgSend_setOffset_(v42, v53, v276.value, v54, v55);
        memset(&v274, 0, sizeof(v274));
        v262 = v33;
        if (v37)
          objc_msgSend_duration(v37, v56, v57, v58, v59);
        else
          memset(&v273, 0, sizeof(v273));
        CMTimeConvertScale(&v274, &v273, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        v263 = (uint64_t)v42;
        objc_msgSend_setDuration_(v42, v60, v274.value, v61, v62);
        v63 = v257;
        if ((v264 & 1) != 0)
        {
          v64 = v259;
        }
        else
        {
          v63 = v35;
          v64 = v258;
        }
        v261 = v63;
        v65 = v64;
        objc_msgSend_gainFunction(v37, v66, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v70;
        if (v70 && objc_msgSend_count(v70, v71, v72, v73, v74))
        {
          objc_msgSend_sortedArrayUsingSelector_(v75, v71, (uint64_t)sel_compare_, v73, v74);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_count(v76, v77, v78, v79, v80) == 1)
          {
            objc_msgSend_firstObject(v76, v81, v82, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_gain(v85, v86, v87, v88, v89);
            v91 = v90;

            v92 = [FMKeyFrame alloc];
            LODWORD(v93) = v91;
            v97 = (void *)objc_msgSend_initWithValue_atTime_(v92, v94, 0, v95, v96, v93);
            objc_msgSend_appendVolumeKeyframe_(v65, v98, (uint64_t)v97, v99, v100);

          }
          if (objc_msgSend_count(v76, v81, v82, v83, v84) != 1)
          {
            v101 = 0;
            do
            {
              memset(&v272, 0, sizeof(v272));
              objc_msgSend_objectAtIndexedSubscript_(v76, v71, v101, v73, v74);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = v102;
              if (v102)
                objc_msgSend_segmentTime(v102, v103, v104, v105, v106);
              else
                memset(&v272, 0, sizeof(v272));

              memset(&v271, 0, sizeof(v271));
              v108 = v101 + 1;
              objc_msgSend_objectAtIndexedSubscript_(v76, v109, v108, v110, v111);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = v112;
              if (v112)
                objc_msgSend_segmentTime(v112, v113, v114, v115, v116);
              else
                memset(&v271, 0, sizeof(v271));

              objc_msgSend_objectAtIndexedSubscript_(v76, v118, v108 - 1, v119, v120);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_gain(v121, v122, v123, v124, v125);
              v127 = v126;

              objc_msgSend_objectAtIndexedSubscript_(v76, v128, v108, v129, v130);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_gain(v131, v132, v133, v134, v135);
              v137 = v136;

              memset(&v270, 0, sizeof(v270));
              if (v37)
                objc_msgSend_summaryTime(v37, v138, v139, v140, v141);
              else
                memset(&lhs, 0, sizeof(lhs));
              rhs = v272;
              CMTimeAdd(&v270, &lhs, &rhs);
              memset(&rhs, 0, sizeof(rhs));
              time1 = v271;
              time2 = v272;
              CMTimeSubtract(&rhs, &time1, &time2);
              v142 = v108 - 1;
              if (v108 == 1)
              {
                time1 = v270;
                time2 = *v34;
                if (CMTimeCompare(&time1, &time2))
                {
                  v143 = [FMKeyFrame alloc];
                  LODWORD(v144) = 0;
                  v148 = (void *)objc_msgSend_initWithValue_atTime_(v143, v145, 0, v146, v147, v144);
                  objc_msgSend_appendVolumeKeyframe_(v65, v149, (uint64_t)v148, v150, v151);

                }
              }
              time1 = rhs;
              time2 = *v34;
              if (CMTimeCompare(&time1, &time2) < 0)
              {
                CMTimeMake(&time1, 1, rhs.timescale);
                rhs = time1;
              }
              memset(&time1, 0, sizeof(time1));
              time2 = v270;
              CMTimeConvertScale(&time1, &time2, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              memset(&time2, 0, sizeof(time2));
              v265 = rhs;
              CMTimeConvertScale(&time2, &v265, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              v152 = [FMKeyFrame alloc];
              LODWORD(v153) = v127;
              v157 = (void *)objc_msgSend_initWithValue_atTime_(v152, v154, time1.value, v155, v156, v153);
              objc_msgSend_appendVolumeKeyframe_(v65, v158, (uint64_t)v157, v159, v160);

              v161 = [FMKeyFrame alloc];
              LODWORD(v162) = v137;
              v166 = (void *)objc_msgSend_initWithValue_atTime_(v161, v163, time2.value + time1.value, v164, v165, v162);
              objc_msgSend_appendVolumeKeyframe_(v65, v167, (uint64_t)v166, v168, v169);

              v101 = v142 + 1;
            }
            while (objc_msgSend_count(v76, v170, v171, v172, v173) - 1 > (unint64_t)(v142 + 1));
          }
          v75 = v76;
          v35 = v253;
        }
        objc_msgSend_addObject_(v261, v71, v263, v73, v74);
        v264 ^= 1u;

        v33 = (void *)v263;
      }
      v260 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v174, (uint64_t)&v279, (uint64_t)v283, 16);
    }
    while (v260);
  }

  objc_msgSend_removeRedundantVolumeKeyFrames(v259, v175, v176, v177, v178);
  objc_msgSend_removeRedundantVolumeKeyFrames(v258, v179, v180, v181, v182);
  if (v33)
  {
    v187 = v251;
    v188 = objc_msgSend_durationOfMusic(v251, v183, v184, v185, v186);
    v193 = objc_msgSend_position(v33, v189, v190, v191, v192);
    v198 = objc_msgSend_duration(v33, v194, v195, v196, v197);
    v203 = objc_msgSend_duration(v33, v199, v200, v201, v202);
    objc_msgSend_setDuration_(v33, v204, v188 - (v193 + v198) + v203, v205, v206);
    v211 = v252;
    if (objc_msgSend_durationOfSilence(v251, v207, v208, v209, v210))
    {
      v212 = (void *)objc_opt_new();
      v217 = objc_msgSend_position(v33, v213, v214, v215, v216);
      v222 = objc_msgSend_duration(v33, v218, v219, v220, v221);
      objc_msgSend_setPosition_(v212, v223, v222 + v217, v224, v225);
      v230 = objc_msgSend_durationOfSilence(v251, v226, v227, v228, v229);
      objc_msgSend_setDuration_(v212, v231, v230, v232, v233);
      objc_msgSend_addObject_(v257, v234, (uint64_t)v212, v235, v236);

    }
  }
  else
  {
    v187 = v251;
    objc_msgSend_durationOfSilence(v251, v183, v184, v185, v186);
    v211 = v252;
  }
  v237 = [FMTrack alloc];
  v240 = (void *)objc_msgSend_initWithClips_mixParameters_(v237, v238, (uint64_t)v257, (uint64_t)v259, v239);
  objc_msgSend_setTrackA_(v187, v241, (uint64_t)v240, v242, v243);

  v244 = [FMTrack alloc];
  v247 = (void *)objc_msgSend_initWithClips_mixParameters_(v244, v245, (uint64_t)v253, (uint64_t)v258, v246);
  objc_msgSend_setTrackB_(v187, v248, (uint64_t)v247, v249, v250);

}

- (id)_buildOutroFadeoutMixParams
{
  return 0;
}

- (FlexMLSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
