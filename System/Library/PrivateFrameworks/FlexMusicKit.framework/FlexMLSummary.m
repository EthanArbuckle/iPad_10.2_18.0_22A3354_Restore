@implementation FlexMLSummary

+ (id)summaryFromSummaries:(id)a3 targetTimeScale:(int)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
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
  void *v59;
  void *v60;
  Float64 Seconds;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  Float64 v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  void *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  Float64 v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  Float64 v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  Float64 v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  void *v153;
  Float64 v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  void (**v167)(_QWORD, _QWORD, _QWORD);
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  Float64 v216;
  void *v217;
  Float64 v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  Float64 v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  id v247;
  const char *v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  double v256;
  float v257;
  uint64_t j;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  float v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  double v269;
  double v270;
  double v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  double v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  FlexMLSummary *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const __CFString *v292;
  uint64_t v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  uint64_t v298;
  uint64_t v300;
  void *v301;
  void *v302;
  id obj;
  void *v304;
  id v305;
  uint64_t v306;
  void *v307;
  uint64_t v308;
  void *v309;
  uint64_t v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  CMTime v315;
  CMTime v316;
  _QWORD v317[4];
  int v318;
  CMTime v319;
  CMTime v320;
  CMTime v321;
  CMTime v322;
  CMTime v323;
  CMTime v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  CMTime time;
  CMTime lhs;
  CMTime rhs;
  CMTime v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  CMTime v341;
  _BYTE v342[128];
  _QWORD v343[3];
  _QWORD v344[3];
  _QWORD v345[4];
  _QWORD v346[4];
  _QWORD v347[2];
  _QWORD v348[2];
  _BYTE v349[128];
  _BYTE v350[128];
  void *v351;
  _BYTE v352[128];
  uint64_t v353;

  v353 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v341 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v10, v11, v12, v13);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v29, v30, v31, v32);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v337 = 0u;
  v338 = 0u;
  v339 = 0u;
  v340 = 0u;
  obj = v4;
  v298 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v337, (uint64_t)v352, 16);
  if (v298)
  {
    v293 = *(_QWORD *)v338;
    v301 = &unk_24C5FAD10;
    v292 = CFSTR("duration");
    v296 = v18;
    v297 = v9;
    v294 = v28;
    v295 = v23;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v338 != v293)
          objc_enumerationMutation(obj);
        v300 = v38;
        v39 = *(void **)(*((_QWORD *)&v337 + 1) + 8 * v38);
        objc_msgSend_lastObject(obj, v34, v35, v36, v37, v292);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v304 = v39;
        if (v39 != v40)
        {
          objc_msgSend_objectForKey_(v9, v41, (uint64_t)CFSTR("loopTimes"), v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            objc_msgSend_objectForKey_(v9, v46, (uint64_t)CFSTR("loopTimes"), v48, v49);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            memset(&v336, 0, sizeof(v336));
            if (v39)
              objc_msgSend_duration(v39, v50, v51, v52, v53);
            else
              memset(&rhs, 0, sizeof(rhs));
            lhs = v341;
            CMTimeAdd(&v336, &lhs, &rhs);
            objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v56, (uint64_t)v54, v57, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (void *)MEMORY[0x24BDD16E0];
            lhs = v336;
            Seconds = CMTimeGetSeconds(&lhs);
            objc_msgSend_numberWithDouble_(v60, v62, v63, v64, v65, Seconds);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v59, v67, (uint64_t)v66, v68, v69);

            objc_msgSend_setObject_forKey_(v9, v70, (uint64_t)v59, (uint64_t)CFSTR("loopTimes"), v71);
            v39 = v304;
          }
          else
          {
            v55 = (void *)MEMORY[0x24BDD16E0];
            if (v39)
              objc_msgSend_duration(v39, v46, v47, v48, v49);
            else
              memset(&time, 0, sizeof(time));
            v72 = CMTimeGetSeconds(&time);
            objc_msgSend_numberWithDouble_(v55, v73, v74, v75, v76, v72);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v351 = v54;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v77, (uint64_t)&v351, 1, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v9, v80, (uint64_t)v79, (uint64_t)CFSTR("loopTimes"), v81);

          }
        }
        v331 = 0u;
        v332 = 0u;
        v329 = 0u;
        v330 = 0u;
        objc_msgSend_segments(v39, v41, v42, v43, v44);
        v305 = (id)objc_claimAutoreleasedReturnValue();
        v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v305, v82, (uint64_t)&v329, (uint64_t)v350, 16);
        if (v308)
        {
          v306 = *(_QWORD *)v330;
          do
          {
            v87 = 0;
            do
            {
              if (*(_QWORD *)v330 != v306)
                objc_enumerationMutation(v305);
              v310 = v87;
              v88 = *(void **)(*((_QWORD *)&v329 + 1) + 8 * v87);
              objc_msgSend_array(MEMORY[0x24BDBCEB8], v83, v84, v85, v86);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v325 = 0u;
              v326 = 0u;
              v327 = 0u;
              v328 = 0u;
              v309 = v88;
              objc_msgSend_gainFunction(v88, v90, v91, v92, v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v325, (uint64_t)v349, 16);
              if (v96)
              {
                v101 = v96;
                v102 = *(_QWORD *)v326;
                do
                {
                  for (i = 0; i != v101; ++i)
                  {
                    if (*(_QWORD *)v326 != v102)
                      objc_enumerationMutation(v94);
                    v104 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * i);
                    v347[0] = CFSTR("gain");
                    v105 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend_gain(v104, v97, v98, v99, v100);
                    objc_msgSend_numberWithFloat_(v105, v106, v107, v108, v109);
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    v348[0] = v114;
                    v347[1] = CFSTR("segmentTime");
                    v115 = (void *)MEMORY[0x24BDD16E0];
                    if (v104)
                      objc_msgSend_segmentTime(v104, v110, v111, v112, v113);
                    else
                      memset(&v324, 0, sizeof(v324));
                    v116 = CMTimeGetSeconds(&v324);
                    objc_msgSend_numberWithDouble_(v115, v117, v118, v119, v120, v116);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    v348[1] = v121;
                    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v122, (uint64_t)v348, (uint64_t)v347, 2);
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v89, v124, (uint64_t)v123, v125, v126);

                  }
                  v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v325, (uint64_t)v349, 16);
                }
                while (v101);
              }

              v345[0] = CFSTR("duration");
              v131 = (void *)MEMORY[0x24BDD16E0];
              if (v309)
                objc_msgSend_duration(v309, v127, v128, v129, v130);
              else
                memset(&v323, 0, sizeof(v323));
              v132 = CMTimeGetSeconds(&v323);
              objc_msgSend_numberWithDouble_(v131, v133, v134, v135, v136, v132);
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              v346[0] = v141;
              v345[1] = CFSTR("trackTime");
              v142 = (void *)MEMORY[0x24BDD16E0];
              if (v309)
                objc_msgSend_trackTime(v309, v137, v138, v139, v140);
              else
                memset(&v322, 0, sizeof(v322));
              v143 = CMTimeGetSeconds(&v322);
              objc_msgSend_numberWithDouble_(v142, v144, v145, v146, v147, v143);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v346[1] = v152;
              v345[2] = CFSTR("summaryTime");
              v153 = (void *)MEMORY[0x24BDD16E0];
              if (v309)
                objc_msgSend_summaryTime(v309, v148, v149, v150, v151);
              else
                memset(&v320, 0, sizeof(v320));
              v336 = v341;
              CMTimeAdd(&v321, &v320, &v336);
              v154 = CMTimeGetSeconds(&v321);
              objc_msgSend_numberWithDouble_(v153, v155, v156, v157, v158, v154);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              v345[3] = CFSTR("gainFunction");
              v346[2] = v159;
              v346[3] = v89;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v160, (uint64_t)v346, (uint64_t)v345, 4);
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v307, v162, (uint64_t)v161, v163, v164);

              v87 = v310 + 1;
            }
            while (v310 + 1 != v308);
            v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v305, v83, (uint64_t)&v329, (uint64_t)v350, 16);
          }
          while (v308);
        }

        v9 = v297;
        objc_msgSend_setObject_forKey_(v297, v165, (uint64_t)v307, (uint64_t)CFSTR("segments"), v166);
        v317[0] = MEMORY[0x24BDAC760];
        v317[1] = 3221225472;
        v317[2] = sub_20D026CA4;
        v317[3] = &unk_24C5F0160;
        v318 = a4;
        v319 = v341;
        v167 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212B9B920](v317);
        objc_msgSend_allBeats(v304, v168, v169, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v296;
        ((void (**)(_QWORD, void *, void *))v167)[2](v167, v296, v172);

        objc_msgSend_allBars(v304, v173, v174, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v295;
        ((void (**)(_QWORD, void *, void *))v167)[2](v167, v295, v177);

        objc_msgSend_videoCues(v304, v178, v179, v180, v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v182, v183, (uint64_t)CFSTR("goodCues"), v184, v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v294;
        ((void (**)(_QWORD, void *, void *))v167)[2](v167, v294, v186);

        objc_msgSend_videoCues(v304, v187, v188, v189, v190);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v191, v192, (uint64_t)CFSTR("greatCues"), v193, v194);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v167)[2](v167, v302, v195);

        v196 = v304;
        objc_msgSend_lastObject(obj, v197, v198, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();

        if (v304 == v201)
        {
          objc_msgSend_videoCues(v304, v202, v203, v204, v205);
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v207, v208, (uint64_t)CFSTR("fadeToBlack"), v209, v210);
          v211 = (void *)objc_claimAutoreleasedReturnValue();

          memset(&v336, 0, sizeof(v336));
          if (v211)
          {
            objc_msgSend_doubleValue(v211, v212, v213, v214, v215);
            CMTimeMakeWithSeconds(&v316, v216, a4);
          }
          else
          {
            v316 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
          }
          lhs = v341;
          CMTimeAdd(&v336, &v316, &lhs);
          v217 = (void *)MEMORY[0x24BDD16E0];
          lhs = v336;
          v218 = CMTimeGetSeconds(&lhs);
          objc_msgSend_numberWithDouble_(v217, v219, v220, v221, v222, v218);
          v206 = objc_claimAutoreleasedReturnValue();

          v196 = v304;
        }
        else
        {
          v206 = (uint64_t)v301;
        }
        objc_msgSend_sortUsingSelector_(v296, v202, (uint64_t)sel_compare_, v204, v205);
        objc_msgSend_sortUsingSelector_(v295, v223, (uint64_t)sel_compare_, v224, v225);
        v343[0] = CFSTR("goodCues");
        v343[1] = CFSTR("greatCues");
        v344[0] = v294;
        v344[1] = v302;
        v343[2] = CFSTR("fadeToBlack");
        v301 = (void *)v206;
        v344[2] = v206;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v226, (uint64_t)v344, (uint64_t)v343, 3);
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v297, v228, (uint64_t)v227, (uint64_t)CFSTR("videoScores"), v229);

        objc_msgSend_setObject_forKey_(v297, v230, (uint64_t)v296, (uint64_t)CFSTR("beatTimes"), v231);
        objc_msgSend_setObject_forKey_(v297, v232, (uint64_t)v295, (uint64_t)CFSTR("barTimes"), v233);
        if (v196)
          objc_msgSend_duration(v196, v234, v235, v236, v237);
        else
          memset(&v315, 0, sizeof(v315));
        v336 = v341;
        CMTimeAdd(&v341, &v336, &v315);
        v238 = (void *)MEMORY[0x24BDD16E0];
        v336 = v341;
        v239 = CMTimeGetSeconds(&v336);
        objc_msgSend_numberWithDouble_(v238, v240, v241, v242, v243, v239);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v297, v245, (uint64_t)v244, (uint64_t)v292, v246);

        v38 = v300 + 1;
      }
      while (v300 + 1 != v298);
      v298 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v337, (uint64_t)v352, 16);
    }
    while (v298);
  }
  else
  {
    v301 = &unk_24C5FAD10;
  }

  v313 = 0u;
  v314 = 0u;
  v311 = 0u;
  v312 = 0u;
  v247 = obj;
  v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v248, (uint64_t)&v311, (uint64_t)v342, 16);
  if (v249)
  {
    v254 = v249;
    v255 = *(_QWORD *)v312;
    v256 = 0.0;
    v257 = 0.0;
    do
    {
      for (j = 0; j != v254; ++j)
      {
        if (*(_QWORD *)v312 != v255)
          objc_enumerationMutation(v247);
        v259 = *(void **)(*((_QWORD *)&v311 + 1) + 8 * j);
        objc_msgSend_peakValue(v259, v250, v251, v252, v253);
        if (v264 > v257)
          v257 = v264;
        objc_msgSend_lkfsValue(v259, v260, v261, v262, v263);
        v270 = v269;
        memset(&v336, 0, sizeof(v336));
        if (v259)
          objc_msgSend_duration(v259, v265, v266, v267, v268);
        lhs = v336;
        v271 = CMTimeGetSeconds(&lhs);
        lhs = v341;
        v256 = v256 + v270 * (v271 / CMTimeGetSeconds(&lhs));
      }
      v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(v247, v250, (uint64_t)&v311, (uint64_t)v342, 16);
    }
    while (v254);
  }
  else
  {
    v256 = 0.0;
    v257 = 0.0;
  }

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v272, v273, v274, v275, v256);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v9, v277, (uint64_t)v276, (uint64_t)CFSTR("lkfs"), v278);

  *(float *)&v279 = v257;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v280, v281, v282, v283, v279);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v9, v285, (uint64_t)v284, (uint64_t)CFSTR("peak"), v286);

  v287 = [FlexMLSummary alloc];
  v290 = (void *)objc_msgSend_initWithDictionary_targetTimeScale_(v287, v288, (uint64_t)v9, a4, v289);

  return v290;
}

- (FlexMLSummary)initWithDictionary:(id)a3 targetTimeScale:(int)a4
{
  id v5;
  FlexMLSummary *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  FlexMLSummary *v10;
  $95D729B680665BEAEFA1D6FCA8238556 *p_duration;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  Float64 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  Float64 v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  Float64 v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  Float64 v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  unsigned int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  Float64 v103;
  FlexMLGainValue *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  FlexMLSegment *v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  NSArray *segments;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  float v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSArray *allBeats;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSArray *allBars;
  uint64_t v161;
  NSArray *loopPoints;
  void *v164;
  FlexMLSummary *v165;
  id v166;
  id obj;
  uint64_t v168;
  NSArray *v169;
  uint64_t v170;
  uint64_t v171;
  CMTime v173;
  CMTime v174;
  CMTime v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  CMTime v180;
  CMTime v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  CMTime v186;
  objc_super v187;
  _BYTE v188[128];
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v187.receiver = self;
  v187.super_class = (Class)FlexMLSummary;
  v6 = -[FlexMLSummary init](&v187, sel_init);
  v10 = v6;
  if (v6)
  {
    p_duration = &v6->_duration;
    objc_msgSend_objectForKey_(v5, v7, (uint64_t)CFSTR("duration"), v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    if (v12)
    {
      objc_msgSend_doubleValue(v12, v13, v14, v15, v16);
      CMTimeMakeWithSeconds(&v186, v18, a4);
    }
    else
    {
      v186 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    }
    *(_OWORD *)&p_duration->value = *(_OWORD *)&v186.value;
    v10->_duration.epoch = v186.epoch;

    objc_msgSend_objectForKey_(v5, v19, (uint64_t)CFSTR("segments"), v20, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v165 = v10;
      v166 = v5;
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v22, v23, v24, v25);
      v169 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v182 = 0u;
      v183 = 0u;
      v184 = 0u;
      v185 = 0u;
      v164 = v26;
      obj = v26;
      v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v182, (uint64_t)v189, 16);
      if (v170)
      {
        v168 = *(_QWORD *)v183;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v183 != v168)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * v31);
            memset(&v186, 0, sizeof(v186));
            objc_msgSend_objectForKey_(v32, v28, (uint64_t)CFSTR("duration"), v29, v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v33;
            if (v33)
            {
              objc_msgSend_doubleValue(v33, v34, v35, v36, v37);
              CMTimeMakeWithSeconds(&v186, v39, a4);
            }
            else
            {
              v186 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
            }

            memset(&v181, 0, sizeof(v181));
            objc_msgSend_objectForKey_(v32, v40, (uint64_t)CFSTR("trackTime"), v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v43;
            if (v43)
            {
              objc_msgSend_doubleValue(v43, v44, v45, v46, v47);
              CMTimeMakeWithSeconds(&v181, v49, a4);
            }
            else
            {
              v181 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
            }

            memset(&v180, 0, sizeof(v180));
            objc_msgSend_objectForKey_(v32, v50, (uint64_t)CFSTR("summaryTime"), v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v53;
            v171 = v31;
            if (v53)
            {
              objc_msgSend_doubleValue(v53, v54, v55, v56, v57);
              CMTimeMakeWithSeconds(&v180, v59, a4);
            }
            else
            {
              v180 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
            }

            objc_msgSend_objectForKey_(v32, v60, (uint64_t)CFSTR("gainFunction"), v61, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = (void *)MEMORY[0x24BDBCEB8];
            v69 = objc_msgSend_count(v63, v65, v66, v67, v68);
            objc_msgSend_arrayWithCapacity_(v64, v70, v69, v71, v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v176 = 0u;
            v177 = 0u;
            v178 = 0u;
            v179 = 0u;
            v74 = v63;
            v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v176, (uint64_t)v188, 16);
            if (v76)
            {
              v80 = v76;
              v81 = *(_QWORD *)v177;
              do
              {
                for (i = 0; i != v80; ++i)
                {
                  if (*(_QWORD *)v177 != v81)
                    objc_enumerationMutation(v74);
                  v83 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
                  objc_msgSend_objectForKey_(v83, v77, (uint64_t)CFSTR("gain"), v78, v79);
                  v84 = objc_claimAutoreleasedReturnValue();
                  if (v84)
                  {
                    v85 = (void *)v84;
                    objc_msgSend_objectForKey_(v83, v77, (uint64_t)CFSTR("segmentTime"), v78, v79);
                    v86 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v86)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v83, v77, (uint64_t)CFSTR("gain"), v78, v79);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_floatValue(v87, v88, v89, v90, v91);
                      v93 = v92;

                      memset(&v175, 0, sizeof(v175));
                      objc_msgSend_objectForKeyedSubscript_(v83, v94, (uint64_t)CFSTR("segmentTime"), v95, v96);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      v102 = v97;
                      if (v97)
                      {
                        objc_msgSend_doubleValue(v97, v98, v99, v100, v101);
                        CMTimeMakeWithSeconds(&v175, v103, a4);
                      }
                      else
                      {
                        v175 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
                      }

                      v104 = [FlexMLGainValue alloc];
                      v174 = v175;
                      v108 = (void *)objc_msgSend_initWithGain_segmentTime_(v104, v105, (uint64_t)&v174, v106, v107, COERCE_DOUBLE(__PAIR64__(HIDWORD(v175.value), v93)));
                      objc_msgSend_addObject_(v73, v109, (uint64_t)v108, v110, v111);

                    }
                  }
                }
                v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v176, (uint64_t)v188, 16);
              }
              while (v80);
            }

            v112 = [FlexMLSegment alloc];
            v175 = v186;
            v174 = v181;
            v173 = v180;
            v114 = (void *)objc_msgSend_initWithDuration_trackTime_summaryTime_gainFunction_(v112, v113, (uint64_t)&v175, (uint64_t)&v174, (uint64_t)&v173, v73);
            objc_msgSend_addObject_(v169, v115, (uint64_t)v114, v116, v117);

            v31 = v171 + 1;
          }
          while (v171 + 1 != v170);
          v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v182, (uint64_t)v189, 16);
        }
        while (v170);
      }

      v10 = v165;
      segments = v165->_segments;
      v165->_segments = v169;

      v5 = v166;
      v26 = v164;
    }
    objc_msgSend_objectForKey_(v5, v22, (uint64_t)CFSTR("videoScores"), v24, v25);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_videoCues, v119);
    objc_msgSend_objectForKey_(v5, v120, (uint64_t)CFSTR("lkfs"), v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v123, v124, v125, v126, v127);
    v10->_lkfsValue = v128;

    objc_msgSend_objectForKey_(v5, v129, (uint64_t)CFSTR("peak"), v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v132, v133, v134, v135, v136);
    v10->_peakValue = v137;

    objc_msgSend_objectForKey_(v5, v138, (uint64_t)CFSTR("beatTimes"), v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    if (v141)
    {
      objc_msgSend_objectForKey_(v5, v142, (uint64_t)CFSTR("beatTimes"), v143, v144);
    }
    else
    {
      objc_msgSend_objectForKey_(v119, v142, (uint64_t)CFSTR("beatTimes"), v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v145)
        goto LABEL_41;
      objc_msgSend_objectForKey_(v119, v146, (uint64_t)CFSTR("beatTimes"), v147, v148);
    }
    v149 = objc_claimAutoreleasedReturnValue();
    allBeats = v10->_allBeats;
    v10->_allBeats = (NSArray *)v149;

LABEL_41:
    objc_msgSend_objectForKey_(v5, v146, (uint64_t)CFSTR("barTimes"), v147, v148);
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (v151)
    {
      objc_msgSend_objectForKey_(v5, v152, (uint64_t)CFSTR("barTimes"), v153, v154);
    }
    else
    {
      objc_msgSend_objectForKey_(v119, v152, (uint64_t)CFSTR("barTimes"), v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v155)
      {
LABEL_46:
        objc_msgSend_objectForKey_(v5, v156, (uint64_t)CFSTR("loopTimes"), v157, v158);
        v161 = objc_claimAutoreleasedReturnValue();
        loopPoints = v10->_loopPoints;
        v10->_loopPoints = (NSArray *)v161;

        goto LABEL_47;
      }
      objc_msgSend_objectForKey_(v119, v156, (uint64_t)CFSTR("barTimes"), v157, v158);
    }
    v159 = objc_claimAutoreleasedReturnValue();
    allBars = v10->_allBars;
    v10->_allBars = (NSArray *)v159;

    goto LABEL_46;
  }
LABEL_47:

  return v10;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)videoCues
{
  return self->_videoCues;
}

- (void)setVideoCues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)allBeats
{
  return self->_allBeats;
}

- (NSArray)allBars
{
  return self->_allBars;
}

- (NSArray)loopPoints
{
  return self->_loopPoints;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (double)lkfsValue
{
  return self->_lkfsValue;
}

- (void)setLkfsValue:(double)a3
{
  self->_lkfsValue = a3;
}

- (float)peakValue
{
  return self->_peakValue;
}

- (void)setPeakValue:(float)a3
{
  self->_peakValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopPoints, 0);
  objc_storeStrong((id *)&self->_allBars, 0);
  objc_storeStrong((id *)&self->_allBeats, 0);
  objc_storeStrong((id *)&self->_videoCues, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
