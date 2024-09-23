@implementation AMDJSDebugHandler

+ (id)handleDebugRequest:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  NSObject *v91;
  os_log_type_t v92;
  id v93;
  id v94;
  NSObject *v95;
  os_log_type_t v96;
  id v97;
  NSObject *v98;
  os_log_type_t v99;
  id v100;
  NSObject *v101;
  os_log_type_t v102;
  id v103;
  NSObject *v104;
  os_log_type_t v105;
  id v106;
  NSObject *v107;
  os_log_type_t v108;
  id v109;
  NSObject *v110;
  os_log_type_t v111;
  id v112;
  NSObject *v113;
  os_log_type_t v114;
  id v115;
  NSObject *v116;
  os_log_type_t v117;
  id v118;
  NSObject *v119;
  os_log_type_t v120;
  id v121;
  NSObject *v122;
  os_log_type_t v123;
  id v124;
  NSObject *v125;
  os_log_type_t v126;
  id v127;
  NSObject *v128;
  os_log_type_t v129;
  id v130;
  NSObject *v131;
  os_log_type_t v132;
  id v133;
  NSObject *v134;
  os_log_type_t v135;
  id v136;
  NSObject *v137;
  os_log_type_t v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  id obj;
  uint64_t v149;
  NSObject *v150;
  os_log_type_t v151;
  id v152;
  NSObject *v153;
  os_log_type_t v154;
  id v155;
  NSObject *v156;
  os_log_type_t v157;
  id v158;
  NSObject *v159;
  os_log_type_t v160;
  id v161;
  NSObject *v162;
  os_log_type_t v163;
  id v164;
  NSObject *v165;
  os_log_type_t v166;
  id v167;
  NSObject *log;
  os_log_type_t type;
  id v170;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  int k;
  id v196;
  id v197;
  id v198;
  id v199;
  int j;
  int i;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  id v257;
  id v258;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id v267;
  id v268;
  _QWORD v269[8];
  uint64_t v270;
  id v271;
  _QWORD v272[8];
  uint64_t v273;
  id v274;
  _QWORD __b[8];
  uint64_t v276;
  id v277;
  id v278;
  id v279;
  id v280;
  id v281;
  id v282;
  id v283;
  os_log_type_t v284;
  os_log_t v285;
  id v286;
  id v287;
  os_log_type_t v288;
  os_log_t v289;
  id v290;
  id v291;
  os_log_type_t v292;
  os_log_t v293;
  id v294;
  id v295;
  os_log_type_t v296;
  os_log_t v297;
  id v298;
  id v299;
  os_log_type_t v300;
  os_log_t v301;
  id v302;
  os_log_type_t v303;
  os_log_t v304;
  id v305;
  os_log_type_t v306;
  os_log_t v307;
  id v308;
  os_log_type_t v309;
  os_log_t v310;
  id v311;
  os_log_type_t v312;
  os_log_t v313;
  id v314;
  os_log_type_t v315;
  os_log_t v316;
  id v317;
  os_log_type_t v318;
  os_log_t v319;
  id v320;
  os_log_type_t v321;
  os_log_t v322;
  id v323;
  os_log_type_t v324;
  os_log_t v325;
  id v326;
  os_log_type_t v327;
  os_log_t v328;
  id v329;
  os_log_type_t v330;
  os_log_t v331;
  id v332;
  os_log_type_t v333;
  os_log_t v334;
  id v335;
  char v336;
  os_log_t v337;
  id v338;
  os_log_type_t v339;
  os_log_t v340;
  id v341;
  char v342;
  os_log_t v343;
  id v344;
  os_log_type_t v345;
  os_log_t v346;
  id v347;
  char v348;
  os_log_t v349;
  id v350;
  os_log_type_t v351;
  os_log_t v352;
  id v353;
  char v354;
  os_log_t v355;
  id v356;
  id v357;
  char v358;
  os_log_t v359;
  id v360;
  id v361;
  char v362;
  os_log_t v363;
  id v364;
  id v365;
  _QWORD v366[8];
  uint64_t v367;
  id v368;
  id v369;
  char v370;
  os_log_t v371;
  id v372;
  id v373;
  char v374;
  os_log_t v375;
  id v376;
  id v377;
  char v378;
  os_log_t v379;
  id v380;
  id v381;
  char v382;
  os_log_t v383;
  id v384;
  id v385;
  char v386;
  os_log_t v387;
  id v388;
  id v389;
  char v390;
  os_log_t v391;
  id v392;
  int v393;
  id v394;
  char v395;
  os_log_t oslog;
  id v397;
  id v398;
  id v399;
  id *v400;
  id v401[2];
  id v402;
  id v403;
  const __CFString *v404;
  id v405;
  const __CFString *v406;
  id v407;
  _QWORD v408[2];
  _QWORD v409[2];
  const __CFString *v410;
  id v411;
  _QWORD v412[2];
  _QWORD v413[2];
  id v414;
  id v415;
  const __CFString *v416;
  id v417;
  const __CFString *v418;
  id v419;
  const __CFString *v420;
  id v421;
  const __CFString *v422;
  id v423;
  const __CFString *v424;
  id v425;
  const __CFString *v426;
  id v427;
  const __CFString *v428;
  id v429;
  const __CFString *v430;
  id v431;
  _BYTE v432[128];
  _BYTE v433[128];
  _BYTE v434[128];
  uint8_t v435[16];
  uint8_t v436[16];
  uint8_t v437[16];
  uint8_t v438[16];
  uint8_t v439[16];
  uint8_t v440[16];
  uint8_t v441[16];
  uint8_t v442[16];
  uint8_t v443[16];
  uint8_t v444[16];
  uint8_t v445[16];
  uint8_t v446[16];
  uint8_t v447[16];
  uint8_t v448[16];
  uint8_t v449[16];
  uint8_t v450[16];
  uint8_t v451[16];
  uint8_t v452[16];
  uint8_t v453[16];
  uint8_t v454[16];
  uint8_t v455[16];
  uint8_t v456[16];
  uint8_t v457[16];
  uint8_t v458[16];
  uint8_t v459[16];
  _QWORD v460[2];
  _QWORD v461[2];
  _BYTE v462[128];
  uint8_t v463[16];
  uint8_t v464[16];
  uint8_t v465[16];
  uint8_t v466[16];
  uint8_t v467[16];
  uint8_t v468[16];
  uint8_t v469[24];
  uint64_t v470;

  v470 = *MEMORY[0x1E0C80C00];
  v402 = a1;
  v401[1] = (id)a2;
  v401[0] = 0;
  objc_storeStrong(v401, a3);
  v400 = a4;
  v399 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("event"));
  v398 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_taste_profiles")) & 1) != 0)
  {
    v397 = +[AMDTasteProfile fetchTasteProfile:](AMDTasteProfile, "fetchTasteProfile:", v400);
    if (*v400)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v395 = 1;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        type = v395;
        v170 = (id)objc_msgSend(*v400, "localizedDescription");
        v394 = v170;
        __os_log_helper_16_2_1_8_64((uint64_t)v469, (uint64_t)v394);
        _os_log_impl(&dword_1DC678000, log, type, "Error fetching all the Taste Profiles: %@", v469, 0xCu);

        objc_storeStrong(&v394, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v397, CFSTR("taste_profiles"));
      v393 = 0;
    }
    objc_storeStrong(&v397, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_events")) & 1) != 0)
  {
    v392 = +[AMDAppEvent fetchEvents:](AMDAppEvent, "fetchEvents:", v400);
    if (*v400)
    {
      v391 = (os_log_t)MEMORY[0x1E0C81028];
      v390 = 1;
      if (os_log_type_enabled(v391, OS_LOG_TYPE_INFO))
      {
        v165 = v391;
        v166 = v390;
        v167 = (id)objc_msgSend(*v400, "localizedDescription");
        v389 = v167;
        __os_log_helper_16_2_1_8_64((uint64_t)v468, (uint64_t)v389);
        _os_log_impl(&dword_1DC678000, v165, v166, "Error fetching all the Events: %@", v468, 0xCu);

        objc_storeStrong(&v389, 0);
      }
      objc_storeStrong((id *)&v391, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v392, CFSTR("events"));
      v393 = 0;
    }
    objc_storeStrong(&v392, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_tab_info")) & 1) != 0)
  {
    v388 = +[AMDAppTabInfo fetchAllTabInfo:](AMDAppTabInfo, "fetchAllTabInfo:", v400);
    if (*v400)
    {
      v387 = (os_log_t)MEMORY[0x1E0C81028];
      v386 = 1;
      if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
      {
        v162 = v387;
        v163 = v386;
        v164 = (id)objc_msgSend(*v400, "localizedDescription");
        v385 = v164;
        __os_log_helper_16_2_1_8_64((uint64_t)v467, (uint64_t)v385);
        _os_log_impl(&dword_1DC678000, v162, v163, "Error fetching tab info: %@", v467, 0xCu);

        objc_storeStrong(&v385, 0);
      }
      objc_storeStrong((id *)&v387, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v388, CFSTR("tabInfo"));
      v393 = 0;
    }
    objc_storeStrong(&v388, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_model_urls")) & 1) != 0)
  {
    v384 = +[AMDModel fetchAll:](AMDModel, "fetchAll:", v400);
    if (*v400)
    {
      v383 = (os_log_t)MEMORY[0x1E0C81028];
      v382 = 1;
      if (os_log_type_enabled(v383, OS_LOG_TYPE_INFO))
      {
        v159 = v383;
        v160 = v382;
        v161 = (id)objc_msgSend(*v400, "localizedDescription");
        v381 = v161;
        __os_log_helper_16_2_1_8_64((uint64_t)v466, (uint64_t)v381);
        _os_log_impl(&dword_1DC678000, v159, v160, "Error fetching all the ModelUrls: %@", v466, 0xCu);

        objc_storeStrong(&v381, 0);
      }
      objc_storeStrong((id *)&v383, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v384, CFSTR("ModelUrls"));
      v393 = 0;
    }
    objc_storeStrong(&v384, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_coldstart_urls")) & 1) != 0)
  {
    v380 = +[AMDColdstartURL fetchAll:](AMDColdstartURL, "fetchAll:", v400);
    if (*v400)
    {
      v379 = (os_log_t)MEMORY[0x1E0C81028];
      v378 = 1;
      if (os_log_type_enabled(v379, OS_LOG_TYPE_INFO))
      {
        v156 = v379;
        v157 = v378;
        v158 = (id)objc_msgSend(*v400, "localizedDescription");
        v377 = v158;
        __os_log_helper_16_2_1_8_64((uint64_t)v465, (uint64_t)v377);
        _os_log_impl(&dword_1DC678000, v156, v157, "Error fetching all the ColdstartUrls: %@", v465, 0xCu);

        objc_storeStrong(&v377, 0);
      }
      objc_storeStrong((id *)&v379, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v380, CFSTR("ColdstartUrls"));
      v393 = 0;
    }
    objc_storeStrong(&v380, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_descriptors")) & 1) != 0)
  {
    v376 = +[AMDDescriptor getDescriptorsForDomain:error:](AMDDescriptor, "getDescriptorsForDomain:error:", +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", CFSTR("apps")), v400);
    if (*v400)
    {
      v375 = (os_log_t)MEMORY[0x1E0C81028];
      v374 = 1;
      if (os_log_type_enabled(v375, OS_LOG_TYPE_INFO))
      {
        v153 = v375;
        v154 = v374;
        v155 = (id)objc_msgSend(*v400, "localizedDescription");
        v373 = v155;
        __os_log_helper_16_2_1_8_64((uint64_t)v464, (uint64_t)v373);
        _os_log_impl(&dword_1DC678000, v153, v154, "Error getting descriptors: %@", v464, 0xCu);

        objc_storeStrong(&v373, 0);
      }
      objc_storeStrong((id *)&v375, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v376, CFSTR("descriptors_saved"));
      v393 = 0;
    }
    objc_storeStrong(&v376, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_segments")) & 1) != 0)
  {
    v372 = +[AMDAppSegment getSegmentsDictForAllTreatments:](AMDAppSegment, "getSegmentsDictForAllTreatments:", v400);
    if (*v400)
    {
      v371 = (os_log_t)MEMORY[0x1E0C81028];
      v370 = 1;
      if (os_log_type_enabled(v371, OS_LOG_TYPE_INFO))
      {
        v150 = v371;
        v151 = v370;
        v152 = (id)objc_msgSend(*v400, "localizedDescription");
        v369 = v152;
        __os_log_helper_16_2_1_8_64((uint64_t)v463, (uint64_t)v369);
        _os_log_impl(&dword_1DC678000, v150, v151, "Error fetching the Segments Dict: %@", v463, 0xCu);

        objc_storeStrong(&v369, 0);
      }
      objc_storeStrong((id *)&v371, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      v368 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      memset(v366, 0, sizeof(v366));
      obj = v372;
      v149 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v366, v462, 16);
      if (v149)
      {
        v145 = *(_QWORD *)v366[2];
        v146 = 0;
        v147 = v149;
        while (1)
        {
          v144 = v146;
          if (*(_QWORD *)v366[2] != v145)
            objc_enumerationMutation(obj);
          v367 = *(_QWORD *)(v366[1] + 8 * v146);
          v365 = (id)objc_msgSend(v372, "objectForKey:", v367);
          v140 = v368;
          v460[0] = CFSTR("segmentsData");
          v143 = (id)objc_msgSend(v365, "first");
          v461[0] = v143;
          v460[1] = CFSTR("algoId");
          v142 = (id)objc_msgSend(v365, "second");
          v461[1] = v142;
          v141 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v461, v460, 2);
          objc_msgSend(v140, "setObject:forKey:");

          objc_storeStrong(&v365, 0);
          ++v146;
          if (v144 + 1 >= v147)
          {
            v146 = 0;
            v147 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v366, v462, 16);
            if (!v147)
              break;
          }
        }
      }

      objc_msgSend(v398, "setObject:forKey:", v368, CFSTR("segments"));
      objc_storeStrong(&v368, 0);
      v393 = 0;
    }
    objc_storeStrong(&v372, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("delete_taste_profiles")) & 1) != 0)
  {
    v364 = +[AMDTasteProfile deleteAll:](AMDTasteProfile, "deleteAll:", v400);
    if (*v400)
    {
      v363 = (os_log_t)MEMORY[0x1E0C81028];
      v362 = 1;
      if (os_log_type_enabled(v363, OS_LOG_TYPE_INFO))
      {
        v137 = v363;
        v138 = v362;
        v139 = (id)objc_msgSend(*v400, "localizedDescription");
        v361 = v139;
        __os_log_helper_16_2_1_8_64((uint64_t)v459, (uint64_t)v361);
        _os_log_impl(&dword_1DC678000, v137, v138, "Error clearing the Taste Profile table: %@", v459, 0xCu);

        objc_storeStrong(&v361, 0);
      }
      objc_storeStrong((id *)&v363, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v364, CFSTR("taste_profiles_deleted"));
      v393 = 0;
    }
    objc_storeStrong(&v364, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("delete_events")) & 1) != 0)
  {
    v360 = +[AMDAppEvent deleteAllEvents:](AMDAppEvent, "deleteAllEvents:", v400);
    if (*v400)
    {
      v359 = (os_log_t)MEMORY[0x1E0C81028];
      v358 = 1;
      if (os_log_type_enabled(v359, OS_LOG_TYPE_INFO))
      {
        v134 = v359;
        v135 = v358;
        v136 = (id)objc_msgSend(*v400, "localizedDescription");
        v357 = v136;
        __os_log_helper_16_2_1_8_64((uint64_t)v458, (uint64_t)v357);
        _os_log_impl(&dword_1DC678000, v134, v135, "Error clearing the events table: %@", v458, 0xCu);

        objc_storeStrong(&v357, 0);
      }
      objc_storeStrong((id *)&v359, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v360, CFSTR("events_deleted"));
      v393 = 0;
    }
    objc_storeStrong(&v360, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("clear_core_data")) & 1) != 0)
  {
    v356 = +[AMDAppTabInfo deleteAllTabs:](AMDAppTabInfo, "deleteAllTabs:", v400);
    if (*v400)
    {
      v355 = (os_log_t)MEMORY[0x1E0C81028];
      v354 = 1;
      if (os_log_type_enabled(v355, OS_LOG_TYPE_INFO))
      {
        v131 = v355;
        v132 = v354;
        v133 = (id)objc_msgSend(*v400, "localizedDescription");
        v353 = v133;
        __os_log_helper_16_2_1_8_64((uint64_t)v457, (uint64_t)v353);
        _os_log_impl(&dword_1DC678000, v131, v132, "Error clearing the AppTabInfo table: %@", v457, 0xCu);

        objc_storeStrong(&v353, 0);
      }
      objc_storeStrong((id *)&v355, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      v352 = (os_log_t)MEMORY[0x1E0C81028];
      v351 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v352, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v456, (uint64_t)v356);
        _os_log_impl(&dword_1DC678000, v352, v351, "Deleted %@ tabs", v456, 0xCu);
      }
      objc_storeStrong((id *)&v352, 0);
      objc_msgSend(v398, "setObject:forKey:", v356, CFSTR("tabs_deleted"));
      v350 = +[AMDDescriptor deleteAll:](AMDDescriptor, "deleteAll:", v400);
      if (*v400)
      {
        v349 = (os_log_t)MEMORY[0x1E0C81028];
        v348 = 1;
        if (os_log_type_enabled(v349, OS_LOG_TYPE_INFO))
        {
          v128 = v349;
          v129 = v348;
          v130 = (id)objc_msgSend(*v400, "localizedDescription");
          v347 = v130;
          __os_log_helper_16_2_1_8_64((uint64_t)v455, (uint64_t)v347);
          _os_log_impl(&dword_1DC678000, v128, v129, "Error clearing the descriptors table: %@", v455, 0xCu);

          objc_storeStrong(&v347, 0);
        }
        objc_storeStrong((id *)&v349, 0);
        v403 = 0;
        v393 = 1;
      }
      else
      {
        v346 = (os_log_t)MEMORY[0x1E0C81028];
        v345 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v454, (uint64_t)v350);
          _os_log_impl(&dword_1DC678000, v346, v345, "Deleted %@ descriptors", v454, 0xCu);
        }
        objc_storeStrong((id *)&v346, 0);
        objc_msgSend(v398, "setObject:forKey:", v350, CFSTR("descriptors_deleted"));
        v344 = +[AMDModel deleteAllModelUrls:](AMDModel, "deleteAllModelUrls:", v400);
        if (*v400)
        {
          v343 = (os_log_t)MEMORY[0x1E0C81028];
          v342 = 1;
          if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
          {
            v125 = v343;
            v126 = v342;
            v127 = (id)objc_msgSend(*v400, "localizedDescription");
            v341 = v127;
            __os_log_helper_16_2_1_8_64((uint64_t)v453, (uint64_t)v341);
            _os_log_impl(&dword_1DC678000, v125, v126, "Error clearing the Model Url table: %@", v453, 0xCu);

            objc_storeStrong(&v341, 0);
          }
          objc_storeStrong((id *)&v343, 0);
          v403 = 0;
          v393 = 1;
        }
        else
        {
          v340 = (os_log_t)MEMORY[0x1E0C81028];
          v339 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v340, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v452, (uint64_t)v344);
            _os_log_impl(&dword_1DC678000, v340, v339, "Deleted %@ Model Urs", v452, 0xCu);
          }
          objc_storeStrong((id *)&v340, 0);
          objc_msgSend(v398, "setObject:forKey:", v344, CFSTR("model_urls_deleted"));
          v338 = +[AMDColdstartURL deleteAllColdstartUrls:](AMDColdstartURL, "deleteAllColdstartUrls:", v400);
          if (*v400)
          {
            v337 = (os_log_t)MEMORY[0x1E0C81028];
            v336 = 1;
            if (os_log_type_enabled(v337, OS_LOG_TYPE_INFO))
            {
              v122 = v337;
              v123 = v336;
              v124 = (id)objc_msgSend(*v400, "localizedDescription");
              v335 = v124;
              __os_log_helper_16_2_1_8_64((uint64_t)v451, (uint64_t)v335);
              _os_log_impl(&dword_1DC678000, v122, v123, "Error clearing the Coldstart Url table: %@", v451, 0xCu);

              objc_storeStrong(&v335, 0);
            }
            objc_storeStrong((id *)&v337, 0);
            v403 = 0;
            v393 = 1;
          }
          else
          {
            v334 = (os_log_t)MEMORY[0x1E0C81028];
            v333 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v334, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v450, (uint64_t)v338);
              _os_log_impl(&dword_1DC678000, v334, v333, "Deleted %@ Coldstart Urs", v450, 0xCu);
            }
            objc_storeStrong((id *)&v334, 0);
            objc_msgSend(v398, "setObject:forKey:", v338, CFSTR("coldstart_urls_deleted"));
            v332 = +[AMDUserDataManager deleteAllUserData:](AMDUserDataManager, "deleteAllUserData:", v400);
            if (*v400)
            {
              v331 = (os_log_t)MEMORY[0x1E0C81028];
              v330 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v331, OS_LOG_TYPE_INFO))
              {
                v119 = v331;
                v120 = v330;
                v121 = (id)objc_msgSend(*v400, "localizedDescription");
                v329 = v121;
                __os_log_helper_16_2_1_8_64((uint64_t)v449, (uint64_t)v329);
                _os_log_impl(&dword_1DC678000, v119, v120, "Error clearing the User Data tables: %@", v449, 0xCu);

                objc_storeStrong(&v329, 0);
              }
              objc_storeStrong((id *)&v331, 0);
              v403 = 0;
              v393 = 1;
            }
            else
            {
              v328 = (os_log_t)MEMORY[0x1E0C81028];
              v327 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v328, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v448, (uint64_t)v332);
                _os_log_impl(&dword_1DC678000, v328, v327, "Deleted %@ UserData entries", v448, 0xCu);
              }
              objc_storeStrong((id *)&v328, 0);
              objc_msgSend(v398, "setObject:forKey:", v332, CFSTR("user_data_deleted"));
              v326 = +[AMDWorkflow deleteAllWorkflows:](AMDWorkflow, "deleteAllWorkflows:", v400);
              if (*v400)
              {
                v325 = (os_log_t)MEMORY[0x1E0C81028];
                v324 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v325, OS_LOG_TYPE_INFO))
                {
                  v116 = v325;
                  v117 = v324;
                  v118 = (id)objc_msgSend(*v400, "localizedDescription");
                  v323 = v118;
                  __os_log_helper_16_2_1_8_64((uint64_t)v447, (uint64_t)v323);
                  _os_log_impl(&dword_1DC678000, v116, v117, "Error clearing the Workflow table: %@", v447, 0xCu);

                  objc_storeStrong(&v323, 0);
                }
                objc_storeStrong((id *)&v325, 0);
                v403 = 0;
                v393 = 1;
              }
              else
              {
                v322 = (os_log_t)MEMORY[0x1E0C81028];
                v321 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v322, OS_LOG_TYPE_INFO))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v446, (uint64_t)v326);
                  _os_log_impl(&dword_1DC678000, v322, v321, "Deleted %@ workflow entries", v446, 0xCu);
                }
                objc_storeStrong((id *)&v322, 0);
                objc_msgSend(v398, "setObject:forKey:", v326, CFSTR("workflows_deleted"));
                v320 = +[AMDWorkflowInFlight deleteAllInflightWorkflows:](AMDWorkflowInFlight, "deleteAllInflightWorkflows:", v400);
                if (*v400)
                {
                  v319 = (os_log_t)MEMORY[0x1E0C81028];
                  v318 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled(v319, OS_LOG_TYPE_INFO))
                  {
                    v113 = v319;
                    v114 = v318;
                    v115 = (id)objc_msgSend(*v400, "localizedDescription");
                    v317 = v115;
                    __os_log_helper_16_2_1_8_64((uint64_t)v445, (uint64_t)v317);
                    _os_log_impl(&dword_1DC678000, v113, v114, "Error clearing the Inflight Workflow table: %@", v445, 0xCu);

                    objc_storeStrong(&v317, 0);
                  }
                  objc_storeStrong((id *)&v319, 0);
                  v403 = 0;
                  v393 = 1;
                }
                else
                {
                  v316 = (os_log_t)MEMORY[0x1E0C81028];
                  v315 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled(v316, OS_LOG_TYPE_INFO))
                  {
                    __os_log_helper_16_2_1_8_64((uint64_t)v444, (uint64_t)v320);
                    _os_log_impl(&dword_1DC678000, v316, v315, "Deleted %@ in-flight workflow entries", v444, 0xCu);
                  }
                  objc_storeStrong((id *)&v316, 0);
                  objc_msgSend(v398, "setObject:forKey:", v320, CFSTR("inflight_workflows_deleted"));
                  v314 = +[AMDAppStoreEvent deleteAllEvents:](AMDAppStoreEvent, "deleteAllEvents:", v400);
                  if (*v400)
                  {
                    v313 = (os_log_t)MEMORY[0x1E0C81028];
                    v312 = OS_LOG_TYPE_INFO;
                    if (os_log_type_enabled(v313, OS_LOG_TYPE_INFO))
                    {
                      v110 = v313;
                      v111 = v312;
                      v112 = (id)objc_msgSend(*v400, "localizedDescription");
                      v311 = v112;
                      __os_log_helper_16_2_1_8_64((uint64_t)v443, (uint64_t)v311);
                      _os_log_impl(&dword_1DC678000, v110, v111, "Error clearing the Appstore events table: %@", v443, 0xCu);

                      objc_storeStrong(&v311, 0);
                    }
                    objc_storeStrong((id *)&v313, 0);
                    v403 = 0;
                    v393 = 1;
                  }
                  else
                  {
                    v310 = (os_log_t)MEMORY[0x1E0C81028];
                    v309 = OS_LOG_TYPE_INFO;
                    if (os_log_type_enabled(v310, OS_LOG_TYPE_INFO))
                    {
                      __os_log_helper_16_2_1_8_64((uint64_t)v442, (uint64_t)v320);
                      _os_log_impl(&dword_1DC678000, v310, v309, "Deleted %@ appstore event entries", v442, 0xCu);
                    }
                    objc_storeStrong((id *)&v310, 0);
                    objc_msgSend(v398, "setObject:forKey:", v314, CFSTR("deleted_appstore_events"));
                    v308 = +[AMDKVStore deleteWithPredicate:error:](AMDKVStore, "deleteWithPredicate:error:", 0, v400);
                    if (*v400)
                    {
                      v307 = (os_log_t)MEMORY[0x1E0C81028];
                      v306 = OS_LOG_TYPE_INFO;
                      if (os_log_type_enabled(v307, OS_LOG_TYPE_INFO))
                      {
                        v107 = v307;
                        v108 = v306;
                        v109 = (id)objc_msgSend(*v400, "localizedDescription");
                        v305 = v109;
                        __os_log_helper_16_2_1_8_64((uint64_t)v441, (uint64_t)v305);
                        _os_log_impl(&dword_1DC678000, v107, v108, "Error clearing the KVStore table: %@", v441, 0xCu);

                        objc_storeStrong(&v305, 0);
                      }
                      objc_storeStrong((id *)&v307, 0);
                      v403 = 0;
                      v393 = 1;
                    }
                    else
                    {
                      v304 = (os_log_t)MEMORY[0x1E0C81028];
                      v303 = OS_LOG_TYPE_INFO;
                      if (os_log_type_enabled(v304, OS_LOG_TYPE_INFO))
                      {
                        __os_log_helper_16_2_1_8_64((uint64_t)v440, (uint64_t)v308);
                        _os_log_impl(&dword_1DC678000, v304, v303, "Deleted %@ kv entries", v440, 0xCu);
                      }
                      objc_storeStrong((id *)&v304, 0);
                      objc_msgSend(v398, "setObject:forKey:", v308, CFSTR("deleted_kv_entries"));
                      v393 = 0;
                    }
                    objc_storeStrong(&v308, 0);
                  }
                  objc_storeStrong(&v314, 0);
                }
                objc_storeStrong(&v320, 0);
              }
              objc_storeStrong(&v326, 0);
            }
            objc_storeStrong(&v332, 0);
          }
          objc_storeStrong(&v338, 0);
        }
        objc_storeStrong(&v344, 0);
      }
      objc_storeStrong(&v350, 0);
    }
    objc_storeStrong(&v356, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_workflows")) & 1) != 0)
  {
    v302 = +[AMDWorkflow fetchAllWorkflows:](AMDWorkflow, "fetchAllWorkflows:", v400);
    if (*v400)
    {
      v301 = (os_log_t)MEMORY[0x1E0C81028];
      v300 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v301, OS_LOG_TYPE_INFO))
      {
        v104 = v301;
        v105 = v300;
        v106 = (id)objc_msgSend(*v400, "localizedDescription");
        v299 = v106;
        __os_log_helper_16_2_1_8_64((uint64_t)v439, (uint64_t)v299);
        _os_log_impl(&dword_1DC678000, v104, v105, "Error getting workflows: %@", v439, 0xCu);

        objc_storeStrong(&v299, 0);
      }
      objc_storeStrong((id *)&v301, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v302, CFSTR("workflows_saved"));
      v393 = 0;
    }
    objc_storeStrong(&v302, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_appstore_events")) & 1) != 0)
  {
    v298 = +[AMDAppStoreEvent fetchEvents:](AMDAppStoreEvent, "fetchEvents:", v400);
    if (*v400)
    {
      v297 = (os_log_t)MEMORY[0x1E0C81028];
      v296 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v297, OS_LOG_TYPE_INFO))
      {
        v101 = v297;
        v102 = v296;
        v103 = (id)objc_msgSend(*v400, "localizedDescription");
        v295 = v103;
        __os_log_helper_16_2_1_8_64((uint64_t)v438, (uint64_t)v295);
        _os_log_impl(&dword_1DC678000, v101, v102, "Error getting appstore events: %@", v438, 0xCu);

        objc_storeStrong(&v295, 0);
      }
      objc_storeStrong((id *)&v297, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v298, CFSTR("appstore_events_saved"));
      v393 = 0;
    }
    objc_storeStrong(&v298, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_inflight_workflows")) & 1) != 0)
  {
    v294 = +[AMDWorkflowInFlight fetchAllWorkflows:](AMDWorkflowInFlight, "fetchAllWorkflows:", v400);
    if (*v400)
    {
      v293 = (os_log_t)MEMORY[0x1E0C81028];
      v292 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v293, OS_LOG_TYPE_INFO))
      {
        v98 = v293;
        v99 = v292;
        v100 = (id)objc_msgSend(*v400, "localizedDescription");
        v291 = v100;
        __os_log_helper_16_2_1_8_64((uint64_t)v437, (uint64_t)v291);
        _os_log_impl(&dword_1DC678000, v98, v99, "Error getting inflight workflows: %@", v437, 0xCu);

        objc_storeStrong(&v291, 0);
      }
      objc_storeStrong((id *)&v293, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      objc_msgSend(v398, "setObject:forKey:", v294, CFSTR("inflight_workflows_saved"));
      v393 = 0;
    }
    objc_storeStrong(&v294, 0);
    if (!v393)
      goto LABEL_345;
  }
  else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_arcade_games")) & 1) != 0)
  {
    v290 = +[AMDTasteProfile getPurchasedArcadeGamesSet:](AMDTasteProfile, "getPurchasedArcadeGamesSet:", v400);
    if (*v400)
    {
      v289 = (os_log_t)MEMORY[0x1E0C81028];
      v288 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v289, OS_LOG_TYPE_INFO))
      {
        v95 = v289;
        v96 = v288;
        v97 = (id)objc_msgSend(*v400, "localizedDescription");
        v287 = v97;
        __os_log_helper_16_2_1_8_64((uint64_t)v436, (uint64_t)v287);
        _os_log_impl(&dword_1DC678000, v95, v96, "Error fetching purchased arcade games: %@", v436, 0xCu);

        objc_storeStrong(&v287, 0);
      }
      objc_storeStrong((id *)&v289, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      v94 = (id)objc_msgSend(v290, "allObjects");
      objc_msgSend(v398, "setObject:forKey:");

      v393 = 0;
    }
    objc_storeStrong(&v290, 0);
    if (!v393)
      goto LABEL_345;
  }
  else
  {
    if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_purchased_apps")) & 1) == 0)
    {
      if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_device_storage")) & 1) != 0)
      {
        v282 = 0;
        v280 = 0;
        v89 = +[AMDDeviceStorage queryDeviceStorageWithError:](AMDDeviceStorage, "queryDeviceStorageWithError:", &v280);
        objc_storeStrong(&v282, v280);
        v281 = v89;
        if (v282)
        {
          v87 = v398;
          v88 = (id)objc_msgSend(v282, "localizedDescription");
          objc_msgSend(v87, "setObject:forKey:");

        }
        else
        {
          objc_msgSend(v398, "setObject:forKey:", v281, CFSTR("storage_info"));
        }
        objc_storeStrong(&v281, 0);
        objc_storeStrong(&v282, 0);
      }
      else
      {
        if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_segment_computation")) & 1) != 0)
        {
          v279 = &unk_1EA4D0B28;
          v278 = +[AMDAppSegment assignSegmentsWithParameters:error:](AMDAppSegment, "assignSegmentsWithParameters:error:", v279, v400);
          if (v278)
          {
            v277 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            memset(__b, 0, sizeof(__b));
            v85 = v278;
            v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", __b, v434, 16);
            if (v86)
            {
              v82 = *(_QWORD *)__b[2];
              v83 = 0;
              v84 = v86;
              while (1)
              {
                v81 = v83;
                if (*(_QWORD *)__b[2] != v82)
                  objc_enumerationMutation(v85);
                v276 = *(_QWORD *)(__b[1] + 8 * v83);
                v78 = v277;
                v80 = (id)objc_msgSend(v278, "objectForKey:", v276);
                v79 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v276);
                objc_msgSend(v78, "setObject:forKey:", v80);

                ++v83;
                if (v81 + 1 >= v84)
                {
                  v83 = 0;
                  v84 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", __b, v434, 16);
                  if (!v84)
                    break;
                }
              }
            }

            objc_msgSend(v398, "setObject:forKey:", v277, CFSTR("segmentRefreshSummary"));
            objc_storeStrong(&v277, 0);
          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", CFSTR("Segment Computation Error"), CFSTR("segmentRefreshSummary"));
          }
          objc_storeStrong(&v278, 0);
          objc_storeStrong(&v279, 0);
          goto LABEL_345;
        }
        if ((objc_msgSend(v399, "isEqualToString:", CFSTR("add_taste_profiles")) & 1) != 0)
        {
          v274 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("tasteProfiles"));
          memset(v272, 0, sizeof(v272));
          v76 = v274;
          v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", v272, v433, 16);
          if (v77)
          {
            v73 = *(_QWORD *)v272[2];
            v74 = 0;
            v75 = v77;
            while (1)
            {
              v72 = v74;
              if (*(_QWORD *)v272[2] != v73)
                objc_enumerationMutation(v76);
              v273 = *(_QWORD *)(v272[1] + 8 * v74);
              v271 = (id)objc_msgSend(v274, "objectForKey:", v273);
              memset(v269, 0, sizeof(v269));
              v70 = v271;
              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v269, v432, 16);
              if (v71)
              {
                v67 = *(_QWORD *)v269[2];
                v68 = 0;
                v69 = v71;
                while (1)
                {
                  v66 = v68;
                  if (*(_QWORD *)v269[2] != v67)
                    objc_enumerationMutation(v70);
                  v270 = *(_QWORD *)(v269[1] + 8 * v68);
                  v268 = (id)objc_msgSend(v271, "objectForKey:", v270);
                  v267 = 0;
                  v266 = 0;
                  v4 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v268, v273, v270, &v266);
                  objc_storeStrong(&v267, v266);
                  if (v267)
                  {
                    v403 = v398;
                    v393 = 1;
                  }
                  else
                  {
                    v393 = 0;
                  }
                  objc_storeStrong(&v267, 0);
                  objc_storeStrong(&v268, 0);
                  if (v393)
                    break;
                  ++v68;
                  if (v66 + 1 >= v69)
                  {
                    v68 = 0;
                    v69 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v269, v432, 16);
                    if (!v69)
                      goto LABEL_216;
                  }
                }
              }
              else
              {
LABEL_216:
                v393 = 0;
              }

              if (!v393)
                v393 = 0;
              objc_storeStrong(&v271, 0);
              if (v393)
                break;
              ++v74;
              if (v72 + 1 >= v75)
              {
                v74 = 0;
                v75 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", v272, v433, 16);
                if (!v75)
                  goto LABEL_222;
              }
            }
          }
          else
          {
LABEL_222:
            v393 = 0;
          }

          if (!v393)
          {
            objc_msgSend(v398, "setObject:forKey:", CFSTR("success"), CFSTR("status"));
            v393 = 0;
          }
          objc_storeStrong(&v274, 0);
          if (!v393)
            goto LABEL_345;
          goto LABEL_346;
        }
        if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_biome")) & 1) != 0)
        {
          v65 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v265 = +[AMDBiomeTest test:](AMDBiomeTest, "test:");

          objc_msgSend(v398, "setObject:forKey:", v265, CFSTR("biomeTestStatus"));
          objc_storeStrong(&v265, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_megadome")) & 1) != 0)
        {
          v64 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v264 = +[AMDMegadomeTest testMegadome:](AMDMegadomeTest, "testMegadome:");

          objc_msgSend(v398, "setObject:forKey:", v264, CFSTR("megadomeTestStatus"));
          objc_storeStrong(&v264, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_memory_feature_provider_save")) & 1) != 0)
        {
          v263 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, CFSTR("foo"));
          v262 = 0;
          v261 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v260 = 0;
          v62 = v263;
          v63 = (id)objc_msgSend(v261, "objectForKey:", CFSTR("featureData"));
          v259 = v262;
          objc_msgSend(v62, "storeFeatureData:error:");
          objc_storeStrong(&v262, v259);

          if (v262)
          {
            v430 = CFSTR("failure");
            v61 = (id)objc_msgSend(v262, "localizedDescription");
            v431 = v61;
            v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v431, &v430, 1);
            v6 = v260;
            v260 = v5;

          }
          else
          {
            objc_storeStrong(&v260, CFSTR("saved"));
          }
          objc_msgSend(v398, "setObject:forKey:", v260, CFSTR("memoryFeatureProviderSaveTestStatus"));
          objc_storeStrong(&v260, 0);
          objc_storeStrong(&v261, 0);
          objc_storeStrong(&v262, 0);
          objc_storeStrong(&v263, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_memory_feature_provider_fetch")) & 1) != 0)
        {
          v258 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, CFSTR("bar"));
          v257 = 0;
          v256 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v255 = (id)objc_msgSend(v256, "objectForKey:", CFSTR("featureName"));
          v254 = 0;
          v252 = v257;
          v60 = (id)objc_msgSend(v258, "getFeatureWithName:withColumn:error:", v255, 0, &v252);
          objc_storeStrong(&v257, v252);
          v253 = v60;
          if (v257)
          {
            v428 = CFSTR("failure");
            v59 = (id)objc_msgSend(v257, "localizedDescription");
            v429 = v59;
            v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v429, &v428, 1);
            v8 = v254;
            v254 = v7;

          }
          else
          {
            v426 = CFSTR("featureValue");
            v58 = (id)objc_msgSend(v253, "getValue");
            v427 = v58;
            v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v427, &v426, 1);
            v10 = v254;
            v254 = v9;

          }
          objc_msgSend(v398, "setObject:forKey:", v254, CFSTR("memoryFeatureProviderFetchTestStatus"));
          objc_storeStrong(&v253, 0);
          objc_storeStrong(&v254, 0);
          objc_storeStrong(&v255, 0);
          objc_storeStrong(&v256, 0);
          objc_storeStrong(&v257, 0);
          objc_storeStrong(&v258, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_inference")) & 1) != 0)
        {
          v251 = 0;
          v250 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v248 = v251;
          v57 = (id)objc_msgSend(v402, "testInference:error:", v250, &v248);
          objc_storeStrong(&v251, v248);
          v249 = v57;
          v247 = 0;
          if (v251)
          {
            v424 = CFSTR("failure");
            v56 = (id)objc_msgSend(v251, "localizedDescription");
            v425 = v56;
            v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v425, &v424, 1);
            v12 = v247;
            v247 = v11;

          }
          else
          {
            v422 = CFSTR("inferenceResult");
            v423 = v249;
            v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v423, &v422, 1);
            v14 = v247;
            v247 = v13;

          }
          objc_msgSend(v398, "setObject:forKey:", v247, CFSTR("inferenceTestStatus"));
          objc_storeStrong(&v247, 0);
          objc_storeStrong(&v249, 0);
          objc_storeStrong(&v250, 0);
          objc_storeStrong(&v251, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_SQLite")) & 1) != 0)
        {
          v246 = 0;
          v245 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v243 = v246;
          v55 = +[AMDJSDebugTestSQLite test:error:](AMDJSDebugTestSQLite, "test:error:", v245, &v243);
          objc_storeStrong(&v246, v243);
          v244 = v55;
          v242 = 0;
          if (v246)
          {
            v420 = CFSTR("failure");
            v54 = (id)objc_msgSend(v246, "localizedDescription");
            v421 = v54;
            v15 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v421, &v420, 1);
            v16 = v242;
            v242 = v15;

          }
          else
          {
            v418 = CFSTR("result");
            v419 = v244;
            v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v419, &v418, 1);
            v18 = v242;
            v242 = v17;

          }
          objc_msgSend(v398, "setObject:forKey:", v242, CFSTR("SQLiteTestStatus"));
          objc_storeStrong(&v242, 0);
          objc_storeStrong(&v244, 0);
          objc_storeStrong(&v245, 0);
          objc_storeStrong(&v246, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_modelPath")) & 1) != 0)
        {
          v241 = 0;
          v240 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v239 = (id)objc_msgSend(v240, "objectForKey:", 0x1EA4B9148);
          v238 = (id)objc_msgSend(v240, "objectForKey:", 0x1EA4B8948);
          v237 = (id)objc_msgSend(v240, "objectForKey:", 0x1EA4C1DA8);
          v236 = (id)objc_msgSend(v240, "objectForKey:", 0x1EA4BACA8);
          v234 = v241;
          v53 = +[AMDModel getModelPathForUsecase:inDomain:forModelId:withTreatmentId:error:](AMDModel, "getModelPathForUsecase:inDomain:forModelId:withTreatmentId:error:", v239, v238, v237, v236, &v234);
          objc_storeStrong(&v241, v234);
          v235 = v53;
          if (v53)
            v52 = v235;
          else
            v52 = (id)MEMORY[0x1E0C9AA70];
          objc_msgSend(v398, "setObject:forKey:", v52, CFSTR("modelPathResponse"));
          objc_storeStrong(&v235, 0);
          objc_storeStrong(&v236, 0);
          objc_storeStrong(&v237, 0);
          objc_storeStrong(&v238, 0);
          objc_storeStrong(&v239, 0);
          objc_storeStrong(&v240, 0);
          objc_storeStrong(&v241, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_DR_newDevicePayloadCreation")) & 1) != 0)
        {
          v233 = 0;
          v231 = 0;
          v51 = +[AMDJSDebugDataSync testNewDevicePayloadCreation:](AMDJSDebugDataSync, "testNewDevicePayloadCreation:", &v231);
          objc_storeStrong(&v233, v231);
          v232 = v51;
          objc_msgSend(v398, "setObject:forKey:", v51, CFSTR("drResponse"));
          objc_storeStrong(&v232, 0);
          objc_storeStrong(&v233, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_DR_fullSyncInitiation")) & 1) != 0)
        {
          v230 = 0;
          v228 = 0;
          v50 = +[AMDJSDebugDataSync testfullSyncInitiation:](AMDJSDebugDataSync, "testfullSyncInitiation:", &v228);
          objc_storeStrong(&v230, v228);
          v229 = v50;
          objc_msgSend(v398, "setObject:forKey:", v50, CFSTR("drResponse"));
          objc_storeStrong(&v229, 0);
          objc_storeStrong(&v230, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_DR_fullSyncDataIngestion")) & 1) != 0)
        {
          v227 = 0;
          v225 = 0;
          v49 = +[AMDJSDebugDataSync testfullSyncDataIngestion:](AMDJSDebugDataSync, "testfullSyncDataIngestion:", &v225);
          objc_storeStrong(&v227, v225);
          v226 = v49;
          objc_msgSend(v398, "setObject:forKey:", v49, CFSTR("drResponse"));
          objc_storeStrong(&v226, 0);
          objc_storeStrong(&v227, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_DR_fullSyncRequestCompletion")) & 1) != 0)
        {
          v224 = 0;
          v222 = 0;
          v48 = +[AMDJSDebugDataSync testfullSyncRequestCompletion:](AMDJSDebugDataSync, "testfullSyncRequestCompletion:", &v222);
          objc_storeStrong(&v224, v222);
          v223 = v48;
          objc_msgSend(v398, "setObject:forKey:", v48, CFSTR("drResponse"));
          objc_storeStrong(&v223, 0);
          objc_storeStrong(&v224, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_DR_eventDeltaAlgorithm")) & 1) != 0)
        {
          v221 = 0;
          v219 = 0;
          v47 = +[AMDJSDebugDataSync testEventDeltaAlgorithm:](AMDJSDebugDataSync, "testEventDeltaAlgorithm:", &v219);
          objc_storeStrong(&v221, v219);
          v220 = v47;
          objc_msgSend(v398, "setObject:forKey:", v47, CFSTR("drResponse"));
          objc_storeStrong(&v220, 0);
          objc_storeStrong(&v221, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_device_ID")) & 1) != 0)
        {
          v218 = 0;
          v216 = 0;
          v46 = +[AMDDataSync fetchDeviceID:](AMDDataSync, "fetchDeviceID:", &v216);
          objc_storeStrong(&v218, v216);
          v217 = v46;
          if (v218)
          {
            v44 = v398;
            v45 = (id)objc_msgSend(v218, "localizedDescription");
            objc_msgSend(v44, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v217, CFSTR("drResponse"));
          }
          objc_storeStrong(&v217, 0);
          objc_storeStrong(&v218, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("fetch_kv_store")) & 1) != 0)
        {
          v215 = 0;
          v213 = 0;
          v43 = +[AMDKVStore fetchAllKeyValues:](AMDKVStore, "fetchAllKeyValues:", &v213);
          objc_storeStrong(&v215, v213);
          v214 = v43;
          if (v215)
          {
            v41 = v398;
            v42 = (id)objc_msgSend(v215, "localizedDescription");
            objc_msgSend(v41, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v214, CFSTR("kvResponse"));
          }
          objc_storeStrong(&v214, 0);
          objc_storeStrong(&v215, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("add_pir_call_handle")) & 1) != 0)
        {
          v212 = 0;
          v211 = 0;
          +[AMDKVStore setValue:forKey:error:](AMDKVStore, "setValue:forKey:error:", &unk_1EA4D0B50, CFSTR("test_call_handle"), &v211);
          objc_storeStrong(&v212, v211);
          if (v212)
          {
            v39 = v398;
            v40 = (id)objc_msgSend(v212, "localizedDescription");
            objc_msgSend(v39, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", CFSTR("success"), CFSTR("pirCallHandleAdd"));
          }
          objc_storeStrong(&v212, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_pir")) & 1) != 0)
        {
          v38 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v210 = +[AMDPirTest testPir:](AMDPirTest, "testPir:");

          objc_msgSend(v398, "setObject:forKey:", v210, CFSTR("pirTestStatus"));
          objc_storeStrong(&v210, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_batched_sql_queries")) & 1) != 0)
        {
          v209 = +[AMDJSCustomAggregator runBatchedSQLDescriptorsUsing:error:](AMDJSCustomAggregator, "runBatchedSQLDescriptorsUsing:error:", v401[0], v400);
          objc_msgSend(v398, "setObject:forKey:", v209, CFSTR("aggregationResult"));
          objc_storeStrong(&v209, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_sql_event_truncation")) & 1) != 0)
        {
          v37 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("testPayload"));
          v208 = +[AMDSQLite trimEventsForStreams:error:](AMDSQLite, "trimEventsForStreams:error:");

          if (*v400)
          {
            v36 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v208, CFSTR("eventDeletionSummary"));
          }
          objc_storeStrong(&v208, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_get_version")) & 1) != 0)
        {
          v35 = +[AMDJSRequestHandler getVersion](AMDJSRequestHandler, "getVersion");
          objc_msgSend(v398, "setObject:forKey:");

        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_vector_db_init")) & 1) != 0)
        {
          v207 = &unk_1EA4D0B78;
          v416 = CFSTR("dbConfigArray");
          v415 = v207;
          v34 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v415);
          v417 = v34;
          v206 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v417, &v416, 1);

          v205 = +[AMDVectorDBManager createVectorDBWithCreateDBPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "createVectorDBWithCreateDBPayload:error:", v206, v400);
          if (*v400)
          {
            v33 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v205, CFSTR("response"));
          }
          objc_storeStrong(&v205, 0);
          objc_storeStrong(&v206, 0);
          objc_storeStrong(&v207, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_vector_db_insert")) & 1) != 0)
        {
          v204 = &unk_1EA4D0BA0;
          v203 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v202 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          for (i = 1; i <= 32; ++i)
          {
            v32 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
            objc_msgSend(v202, "addObject:");

          }
          for (j = 1; j <= 5000; ++j)
          {
            v414 = v202;
            v31 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v414, 1);
            v30 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", j);
            v29 = (id)objc_msgSend(v30, "stringValue");
            objc_msgSend(v203, "setObject:forKey:", v31);

          }
          v412[0] = CFSTR("vectorDBConfig");
          v413[0] = v204;
          v412[1] = CFSTR("vectorDict");
          v413[1] = v203;
          v199 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v413, v412, 2);
          v198 = +[AMDVectorDBManager insertVectorsHandlerWithInsertVectorsPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "insertVectorsHandlerWithInsertVectorsPayload:error:", v199, v400);
          if (*v400)
          {
            v28 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v198, CFSTR("response"));
          }
          objc_storeStrong(&v198, 0);
          objc_storeStrong(&v199, 0);
          objc_storeStrong(&v202, 0);
          objc_storeStrong(&v203, 0);
          objc_storeStrong(&v204, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_vector_db_search")) & 1) != 0)
        {
          v197 = &unk_1EA4D0BC8;
          v196 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          for (k = 1; k <= 32; ++k)
          {
            v27 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", k);
            objc_msgSend(v196, "addObject:");

          }
          v410 = CFSTR("queryVector");
          v411 = v196;
          v194 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v411, &v410, 1);
          v408[0] = CFSTR("vectorDBConfig");
          v409[0] = v197;
          v408[1] = CFSTR("queryDict");
          v409[1] = v194;
          v193 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v409, v408, 2);
          v192 = +[AMDVectorDBManager runVectorDBSearchWithSearchPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "runVectorDBSearchWithSearchPayload:error:", v193, v400);
          if (*v400)
          {
            v26 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v192, CFSTR("response"));
          }
          objc_storeStrong(&v192, 0);
          objc_storeStrong(&v193, 0);
          objc_storeStrong(&v194, 0);
          objc_storeStrong(&v196, 0);
          objc_storeStrong(&v197, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_vector_db_delete")) & 1) != 0)
        {
          v191 = &unk_1EA4D0BF0;
          v406 = CFSTR("vectorDBConfig");
          v407 = v191;
          v190 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v407, &v406, 1);
          v189 = +[AMDVectorDBManager clearVectorsHandlerWithClearVectorDBPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "clearVectorsHandlerWithClearVectorDBPayload:error:", v190, v400);
          if (*v400)
          {
            v25 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v189, CFSTR("response"));
          }
          objc_storeStrong(&v189, 0);
          objc_storeStrong(&v190, 0);
          objc_storeStrong(&v191, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_vector_db_file_delete")) & 1) != 0)
        {
          v188 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("vectorDBName"));
          v404 = CFSTR("dbName");
          v405 = v188;
          v187 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v405, &v404, 1);
          v186 = +[AMDVectorDBManager deleteVectorDatabaseWithDeletionPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "deleteVectorDatabaseWithDeletionPayload:error:", v187, v400);
          if (*v400)
          {
            v24 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v186, CFSTR("response"));
          }
          objc_storeStrong(&v186, 0);
          objc_storeStrong(&v187, 0);
          objc_storeStrong(&v188, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_swift_str_to_int")) & 1) != 0)
        {
          v185 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("strValue"));
          v184 = +[AMDSwiftTests strToIntWithStrValue:](_TtC19AppleMediaDiscovery13AMDSwiftTests, "strToIntWithStrValue:", v185);
          objc_msgSend(v398, "setObject:forKey:", v184, CFSTR("result"));
          objc_storeStrong(&v184, 0);
          objc_storeStrong(&v185, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_sql_add_table_schema")) & 1) != 0)
        {
          v183 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("table_name"));
          v182 = (id)objc_msgSend(v401[0], "objectForKey:", CFSTR("table_schema"));
          v181 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
          v180 = (id)objc_msgSend(v181, "getDataSchema");
          v179 = (id)objc_msgSend(v180, "addTable:withSchema:error:", v183, v182, v400);
          if (*v400)
          {
            v23 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v179, CFSTR("schemaAddSummary"));
            v178 = (id)objc_msgSend(v181, "applySchema:error:", v180, v400);
            if (*v400)
            {
              v22 = (id)objc_msgSend(*v400, "localizedDescription");
              objc_msgSend(v398, "setObject:forKey:");

            }
            else
            {
              objc_msgSend(v398, "setObject:forKey:", v178, CFSTR("schemaApplySummary"));
            }
            objc_storeStrong(&v178, 0);
          }
          objc_storeStrong(&v179, 0);
          objc_storeStrong(&v180, 0);
          objc_storeStrong(&v181, 0);
          objc_storeStrong(&v182, 0);
          objc_storeStrong(&v183, 0);
        }
        else if ((objc_msgSend(v399, "isEqualToString:", CFSTR("test_sql_create_indexes")) & 1) != 0)
        {
          v177 = (id)objc_msgSend(v401[0], "objectForKey:", AMD_SQLITE_SCHEMA_INDICES);
          v176 = +[AMDSQLite getSharedInstance](AMDSQLite, "getSharedInstance");
          v175 = (id)objc_msgSend(v176, "getDataSchema");
          v174 = (id)objc_msgSend(v175, "addIndices:error:", v177, v400);
          if (*v400)
          {
            v21 = (id)objc_msgSend(*v400, "localizedDescription");
            objc_msgSend(v398, "setObject:forKey:");

          }
          else
          {
            objc_msgSend(v398, "setObject:forKey:", v174, CFSTR("indexesAddSummary"));
            v173 = (id)objc_msgSend(v176, "applySchema:error:", v175, v400);
            if (*v400)
            {
              v20 = (id)objc_msgSend(*v400, "localizedDescription");
              objc_msgSend(v398, "setObject:forKey:");

            }
            else
            {
              objc_msgSend(v398, "setObject:forKey:", v173, CFSTR("schemaApplySummary"));
            }
            objc_storeStrong(&v173, 0);
          }
          objc_storeStrong(&v174, 0);
          objc_storeStrong(&v175, 0);
          objc_storeStrong(&v176, 0);
          objc_storeStrong(&v177, 0);
        }
        else
        {
          v172 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Action '%@' not found"), v399);
          objc_msgSend(v398, "setObject:forKey:", v172, CFSTR("status"));
          objc_storeStrong(&v172, 0);
        }
      }
LABEL_345:
      v403 = v398;
      v393 = 1;
      goto LABEL_346;
    }
    v286 = +[AMDTasteProfile getPurchasedAppsSet:](AMDTasteProfile, "getPurchasedAppsSet:", v400);
    if (*v400)
    {
      v285 = (os_log_t)MEMORY[0x1E0C81028];
      v284 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v285, OS_LOG_TYPE_INFO))
      {
        v91 = v285;
        v92 = v284;
        v93 = (id)objc_msgSend(*v400, "localizedDescription");
        v283 = v93;
        __os_log_helper_16_2_1_8_64((uint64_t)v435, (uint64_t)v283);
        _os_log_impl(&dword_1DC678000, v91, v92, "Error fetching purchased apps: %@", v435, 0xCu);

        objc_storeStrong(&v283, 0);
      }
      objc_storeStrong((id *)&v285, 0);
      v403 = 0;
      v393 = 1;
    }
    else
    {
      v90 = (id)objc_msgSend(v286, "allObjects");
      objc_msgSend(v398, "setObject:forKey:");

      v393 = 0;
    }
    objc_storeStrong(&v286, 0);
    if (!v393)
      goto LABEL_345;
  }
LABEL_346:
  objc_storeStrong(&v398, 0);
  objc_storeStrong(&v399, 0);
  objc_storeStrong(v401, 0);
  return v403;
}

+ (id)testInference:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  id v36;
  os_log_t v38;
  __CFString *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  os_log_type_t v44;
  os_log_t v45;
  id v46;
  id v47;
  os_log_type_t v48;
  os_log_t oslog;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __CFString *v59;
  id v60;
  __CFString *v61;
  id v62;
  id v63;
  os_log_type_t v64;
  id v65;
  _QWORD v66[8];
  id v67;
  os_log_type_t v68;
  id v69;
  __CFString *v70;
  id v71;
  os_log_type_t v72;
  id v73;
  __CFString *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t v79[15];
  os_log_type_t v80;
  id v81;
  _QWORD v82[8];
  uint64_t v83;
  id v84;
  _QWORD __b[8];
  uint64_t v86;
  id v87;
  id v88;
  uint8_t v89[7];
  os_log_type_t v90;
  id v91;
  os_log_type_t v92;
  id v93;
  __CFString *v94;
  id v95;
  __CFString *v96;
  int64_t v97;
  __CFString *v98;
  id v99;
  id v100;
  int v101;
  os_log_type_t type;
  id v103;
  __CFString *v104;
  id v105;
  id *v106;
  id location[3];
  id v108;
  uint8_t v109[16];
  uint8_t v110[16];
  uint8_t v111[16];
  uint8_t v112[16];
  _BYTE v113[128];
  uint8_t v114[16];
  uint8_t v115[16];
  _BYTE v116[128];
  _BYTE v117[128];
  uint8_t v118[16];
  uint8_t v119[24];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v106 = a4;
  v105 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("inferencePayload"));
  if (v105)
  {
    v100 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4B8948);
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4C2E48);
    v99 = (id)objc_msgSend(v35, "setWithArray:");

    if (v100 && v99)
    {
      v97 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v100);
      if (v97)
      {
        v95 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("inferenceWorkflow"));
        if (v95)
        {
          +[AMDWorkflowInFlight saveWorkflow:forDomain:withCallUUID:error:](AMDWorkflowInFlight, "saveWorkflow:forDomain:withCallUUID:error:", v95, v97, CFSTR("TEST"), v106);
          v91 = MEMORY[0x1E0C81028];
          v90 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_INFO))
          {
            v33 = v91;
            v34 = v90;
            __os_log_helper_16_0_0(v89);
            _os_log_impl(&dword_1DC678000, v33, v34, "Saved the model workflow successfully.", v89, 2u);
          }
          objc_storeStrong(&v91, 0);
          v88 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("tasteProfiles"));
          if (!v88)
            goto LABEL_44;
          v87 = (id)objc_msgSend(v88, "objectForKey:", CFSTR("serverTasteProfiles"));
          if (!v87)
            goto LABEL_28;
          memset(__b, 0, sizeof(__b));
          v31 = v87;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v117, 16);
          if (v32)
          {
            v28 = *(_QWORD *)__b[2];
            v29 = 0;
            v30 = v32;
            while (1)
            {
              v27 = v29;
              if (*(_QWORD *)__b[2] != v28)
                objc_enumerationMutation(v31);
              v86 = *(_QWORD *)(__b[1] + 8 * v29);
              v4 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v86, CFSTR("apps"), 0x1EA4C2548, v106);
              if (*v106)
                break;
              ++v29;
              if (v27 + 1 >= v30)
              {
                v29 = 0;
                v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v117, 16);
                if (!v30)
                  goto LABEL_26;
              }
            }
            v108 = 0;
            v101 = 1;
          }
          else
          {
LABEL_26:
            v101 = 0;
          }

          if (!v101)
          {
LABEL_28:
            v84 = (id)objc_msgSend(v88, "objectForKey:", CFSTR("onDeviceTasteProfiles"));
            if (!v84)
              goto LABEL_39;
            memset(v82, 0, sizeof(v82));
            v25 = v84;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", v82, v116, 16);
            if (v26)
            {
              v22 = *(_QWORD *)v82[2];
              v23 = 0;
              v24 = v26;
              while (1)
              {
                v21 = v23;
                if (*(_QWORD *)v82[2] != v22)
                  objc_enumerationMutation(v25);
                v83 = *(_QWORD *)(v82[1] + 8 * v23);
                v5 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v83, CFSTR("apps"), 0x1EA4C2528, v106);
                if (*v106)
                  break;
                ++v23;
                if (v21 + 1 >= v24)
                {
                  v23 = 0;
                  v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", v82, v116, 16);
                  if (!v24)
                    goto LABEL_37;
                }
              }
              v108 = 0;
              v101 = 1;
            }
            else
            {
LABEL_37:
              v101 = 0;
            }

            if (!v101)
            {
LABEL_39:
              v81 = MEMORY[0x1E0C81028];
              v80 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_INFO))
              {
                v19 = v81;
                v20 = v80;
                __os_log_helper_16_0_0(v79);
                _os_log_impl(&dword_1DC678000, v19, v20, "Saved the model taste profiles successfully.", v79, 2u);
              }
              objc_storeStrong(&v81, 0);
              v101 = 0;
            }
            objc_storeStrong(&v84, 0);
          }
          objc_storeStrong(&v87, 0);
          if (!v101)
          {
LABEL_44:
            v78 = (id)objc_msgSend(v95, "objectForKey:", 0x1EA4B8F88);
            v77 = (id)objc_msgSend(v95, "objectForKey:", 0x1EA4BAC68);
            v76 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", v78, v106);
            if (!*v106 && v76)
              +[AMDModelDownloader deleteModelFromStorage:isVersionChange:error:](AMDModelDownloader, "deleteModelFromStorage:isVersionChange:error:", v76, 0, v106);
            if (v77)
            {
              v75 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", v77, v106);
              if (!*v106 && v75)
                +[AMDModelDownloader deleteModelFromStorage:isVersionChange:error:](AMDModelDownloader, "deleteModelFromStorage:isVersionChange:error:", v75, 0, v106);
              objc_storeStrong(&v75, 0);
            }
            if (*v106)
            {
              v74 = CFSTR("Unable to reset Models table and delete older models");
              v73 = MEMORY[0x1E0C81028];
              v72 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v115, (uint64_t)v74);
                _os_log_error_impl(&dword_1DC678000, (os_log_t)v73, v72, "%@", v115, 0xCu);
              }
              objc_storeStrong(&v73, 0);
              *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v74);
              v108 = 0;
              v101 = 1;
              objc_storeStrong((id *)&v74, 0);
            }
            else
            {
              v6 = +[AMDModel deleteAllModelUrls:](AMDModel, "deleteAllModelUrls:", v106);
              v71 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("modelDownloadPayload"));
              if (v71)
              {
                memset(v66, 0, sizeof(v66));
                v17 = v71;
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v66, v113, 16);
                if (v18)
                {
                  v14 = *(_QWORD *)v66[2];
                  v15 = 0;
                  v16 = v18;
                  while (1)
                  {
                    v13 = v15;
                    if (*(_QWORD *)v66[2] != v14)
                      objc_enumerationMutation(v17);
                    v67 = *(id *)(v66[1] + 8 * v15);
                    v7 = +[AMDModelDownloader processModelDownload:withStorefrontID:error:](AMDModelDownloader, "processModelDownload:withStorefrontID:error:", v67, CFSTR("143441"), v106);
                    if (*v106)
                      break;
                    v65 = MEMORY[0x1E0C81028];
                    v64 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
                    {
                      v10 = v65;
                      v11 = v64;
                      v12 = (id)objc_msgSend(v67, "objectForKey:", CFSTR("modelId"));
                      v63 = v12;
                      __os_log_helper_16_2_1_8_64((uint64_t)v112, (uint64_t)v63);
                      _os_log_error_impl(&dword_1DC678000, v10, v11, "Saved the compiled model %@ successfully", v112, 0xCu);

                      objc_storeStrong(&v63, 0);
                    }
                    objc_storeStrong(&v65, 0);
                    ++v15;
                    if (v13 + 1 >= v16)
                    {
                      v15 = 0;
                      v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v66, v113, 16);
                      if (!v16)
                        goto LABEL_70;
                    }
                  }
                  v108 = 0;
                  v101 = 1;
                }
                else
                {
LABEL_70:
                  v101 = 0;
                }

                if (!v101)
                {
                  v62 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4BB468);
                  if (v62)
                  {
                    v60 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4BB448);
                    if (v60)
                    {
                      v58 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4BB6E8);
                      if (!v58
                        || ((v57 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, v100), objc_msgSend(v57, "storeFeatureData:error:", v58, v106), !*v106)? (v101 = 0): (v108 = 0, v101 = 1), objc_storeStrong(&v57, 0), !v101))
                      {
                        v56 = (id)objc_msgSend(v105, "objectForKey:", CFSTR("auxillaryData"));
                        if (!v56
                          || ((v55 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, v100), objc_msgSend(v55, "storeOutputRemapData:error:", v56, v106), !*v106)? (v101 = 0): (v108 = 0, v101 = 1), objc_storeStrong(&v55, 0), !v101))
                        {
                          v54 = (id)objc_msgSend(v105, "objectForKey:", CFSTR("usecaseId"));
                          v53 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4BACA8);
                          v52 = +[AMDWorkflow getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:](AMDWorkflow, "getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:", v97, v53, v54, v106);
                          if (*v106)
                          {
                            v108 = 0;
                            v101 = 1;
                          }
                          else
                          {
                            v51 = (id)objc_msgSend(v52, "second");
                            if (!v53)
                            {
                              v53 = (id)objc_msgSend(v52, "first");

                            }
                            if (v51 && objc_msgSend(v51, "count"))
                            {
                              v47 = -[AMDUseCaseWorkflow initWithDictionary:]([AMDUseCaseWorkflow alloc], "initWithDictionary:", v51);
                              if ((objc_msgSend(v47, "isValid") & 1) != 0)
                              {
                                v9 = (id)objc_msgSend(v47, "getMaxItemsToDisplay");
                                v43 = (id)objc_msgSend(v47, "getPredictions:forDomain:error:", ((double)objc_msgSend(v9, "unsignedIntValue")* 1.5), v100, v106);

                                v42 = (id)objc_msgSend(v105, "objectForKey:", 0x1EA4C2CC8);
                                if (v42)
                                  objc_storeStrong(&v42, v42);
                                else
                                  objc_storeStrong(&v42, MEMORY[0x1E0C9AA70]);
                                v41 = (id)objc_msgSend(v42, "objectForKey:", v54);
                                if (v41)
                                {
                                  v40 = +[AMDJSInference persist:withUsecase:withConfig:domainName:](AMDJSInference, "persist:withUsecase:withConfig:domainName:", v43, v54, v41, v100);
                                  v108 = v40;
                                  v101 = 1;
                                  objc_storeStrong(&v40, 0);
                                }
                                else if (*v106)
                                {
                                  v108 = 0;
                                  v101 = 1;
                                }
                                else if (v43)
                                {
                                  v108 = v43;
                                  v101 = 1;
                                }
                                else
                                {
                                  v39 = CFSTR("Inference output is nil");
                                  v38 = (os_log_t)MEMORY[0x1E0C81028];
                                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_2_1_8_64((uint64_t)v109, (uint64_t)v39);
                                    _os_log_error_impl(&dword_1DC678000, v38, OS_LOG_TYPE_ERROR, "%@", v109, 0xCu);
                                  }
                                  objc_storeStrong((id *)&v38, 0);
                                  *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v39);
                                  v108 = 0;
                                  v101 = 1;
                                  objc_storeStrong((id *)&v39, 0);
                                }
                                objc_storeStrong(&v41, 0);
                                objc_storeStrong(&v42, 0);
                                objc_storeStrong(&v43, 0);
                              }
                              else
                              {
                                v46 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid workflow for use case %@, treatment %@"), v54, v53);
                                v45 = (os_log_t)MEMORY[0x1E0C81028];
                                v44 = OS_LOG_TYPE_ERROR;
                                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                                {
                                  __os_log_helper_16_2_1_8_64((uint64_t)v110, (uint64_t)v46);
                                  _os_log_error_impl(&dword_1DC678000, v45, v44, "%@", v110, 0xCu);
                                }
                                objc_storeStrong((id *)&v45, 0);
                                *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v46);
                                v108 = 0;
                                v101 = 1;
                                objc_storeStrong(&v46, 0);
                              }
                              objc_storeStrong(&v47, 0);
                            }
                            else
                            {
                              v50 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no workflow for use case %@, treatment %@"), v54, v53);
                              oslog = (os_log_t)MEMORY[0x1E0C81028];
                              v48 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_2_1_8_64((uint64_t)v111, (uint64_t)v50);
                                _os_log_error_impl(&dword_1DC678000, oslog, v48, "%@", v111, 0xCu);
                              }
                              objc_storeStrong((id *)&oslog, 0);
                              *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v50);
                              v108 = 0;
                              v101 = 1;
                              objc_storeStrong(&v50, 0);
                            }
                            objc_storeStrong(&v51, 0);
                          }
                          objc_storeStrong(&v52, 0);
                          objc_storeStrong(&v53, 0);
                          objc_storeStrong(&v54, 0);
                        }
                        objc_storeStrong(&v56, 0);
                      }
                      objc_storeStrong(&v58, 0);
                    }
                    else
                    {
                      v59 = CFSTR("Missing dsId");
                      *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v59);
                      v108 = 0;
                      v101 = 1;
                      objc_storeStrong((id *)&v59, 0);
                    }
                    objc_storeStrong(&v60, 0);
                  }
                  else
                  {
                    v61 = CFSTR("Missing storeFrontId");
                    *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v61);
                    v108 = 0;
                    v101 = 1;
                    objc_storeStrong((id *)&v61, 0);
                  }
                  objc_storeStrong(&v62, 0);
                }
              }
              else
              {
                v70 = CFSTR("Missing model download payload");
                v69 = MEMORY[0x1E0C81028];
                v68 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v114, (uint64_t)v70);
                  _os_log_error_impl(&dword_1DC678000, (os_log_t)v69, v68, "%@", v114, 0xCu);
                }
                objc_storeStrong(&v69, 0);
                *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v70);
                v108 = 0;
                v101 = 1;
                objc_storeStrong((id *)&v70, 0);
              }
              objc_storeStrong(&v71, 0);
            }
            objc_storeStrong(&v76, 0);
            objc_storeStrong(&v77, 0);
            objc_storeStrong(&v78, 0);
          }
          objc_storeStrong(&v88, 0);
        }
        else
        {
          v94 = CFSTR("Missing inference workflow");
          v93 = MEMORY[0x1E0C81028];
          v92 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v118, (uint64_t)v94);
            _os_log_error_impl(&dword_1DC678000, (os_log_t)v93, v92, "%@", v118, 0xCu);
          }
          objc_storeStrong(&v93, 0);
          *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v94);
          v108 = 0;
          v101 = 1;
          objc_storeStrong((id *)&v94, 0);
        }
        objc_storeStrong(&v95, 0);
      }
      else
      {
        v96 = CFSTR("Unknown domain");
        *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v96);
        v108 = 0;
        v101 = 1;
        objc_storeStrong((id *)&v96, 0);
      }
    }
    else
    {
      v98 = CFSTR("Missing domain or use cases");
      *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v98);
      v108 = 0;
      v101 = 1;
      objc_storeStrong((id *)&v98, 0);
    }
    objc_storeStrong(&v99, 0);
    objc_storeStrong(&v100, 0);
  }
  else
  {
    v104 = CFSTR("Missing inference payload");
    v103 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v103, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v119, (uint64_t)v104);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v103, type, "%@", v119, 0xCu);
    }
    objc_storeStrong(&v103, 0);
    *v106 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v104);
    v108 = 0;
    v101 = 1;
    objc_storeStrong((id *)&v104, 0);
  }
  objc_storeStrong(&v105, 0);
  objc_storeStrong(location, 0);
  return v108;
}

+ (void)handleAsyncDebugRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v4;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v5;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v6;
  id v7;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v8;
  id v9;
  _TtC19AppleMediaDiscovery18FitCoreDQueryClass *v10;
  id v11;
  _TtC19AppleMediaDiscovery22SearchToolQueryHandler *v12;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(_QWORD *, void *, void *);
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(_QWORD *, void *, void *);
  void *v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  void (*v29)(_QWORD *, void *);
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(_QWORD *, void *);
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(_QWORD *, void *);
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = 0;
  objc_storeStrong(&v49, a4);
  v48 = 0;
  v47 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("event"));
  if ((objc_msgSend(v47, "isEqualToString:", CFSTR("query_search_tool")) & 1) != 0)
  {
    v12 = objc_alloc_init(_TtC19AppleMediaDiscovery22SearchToolQueryHandler);
    v11 = location[0];
    v40 = MEMORY[0x1E0C809B0];
    v41 = -1073741824;
    v42 = 0;
    v43 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke;
    v44 = &unk_1EA4B5120;
    v46 = v49;
    v45 = v48;
    -[SearchToolQueryHandler querySearchToolWithSearchtoolQueryConfig:completionHandler:](v12, "querySearchToolWithSearchtoolQueryConfig:completionHandler:", v11, &v40);

    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
  }
  else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("filter_fitcored_catalog")) & 1) != 0)
  {
    v10 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    v9 = location[0];
    v33 = MEMORY[0x1E0C809B0];
    v34 = -1073741824;
    v35 = 0;
    v36 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_2;
    v37 = &unk_1EA4B5120;
    v39 = v49;
    v38 = v48;
    -[FitCoreDQueryClass filterFitcoreDCatalogDebugWithCatalogFilterConfig:completionHandler:](v10, "filterFitcoreDCatalogDebugWithCatalogFilterConfig:completionHandler:", v9, &v33);

    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("fetch_workout_info")) & 1) != 0)
  {
    v8 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    v7 = location[0];
    v26 = MEMORY[0x1E0C809B0];
    v27 = -1073741824;
    v28 = 0;
    v29 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_3;
    v30 = &unk_1EA4B5120;
    v32 = v49;
    v31 = v48;
    -[FitCoreDQueryClass queryWorkoutReferencesWithWorkoutQueryConfig:completionHandler:](v8, "queryWorkoutReferencesWithWorkoutQueryConfig:completionHandler:", v7, &v26);

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("fetch_catalog")) & 1) != 0)
  {
    v6 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    v20 = MEMORY[0x1E0C809B0];
    v21 = -1073741824;
    v22 = 0;
    v23 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_4;
    v24 = &unk_1EA4B5148;
    v25 = v49;
    -[FitCoreDQueryClass fetchCatalogMetadataWithCompletionHandler:](v6, "fetchCatalogMetadataWithCompletionHandler:", &v20);

    objc_storeStrong(&v25, 0);
  }
  else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("fetch_bootstrap_catalog")) & 1) != 0)
  {
    v5 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    v4 = location[0];
    v14 = MEMORY[0x1E0C809B0];
    v15 = -1073741824;
    v16 = 0;
    v17 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_387;
    v18 = &unk_1EA4B5148;
    v19 = v49;
    -[FitCoreDQueryClass runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:completionHandler:](v5, "runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:completionHandler:", v4, &v14);

    objc_storeStrong(&v19, 0);
  }
  else
  {
    (*((void (**)(id, void *, id))v49 + 2))(v49, &unk_1EA4D0C18, v48);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *log;
  os_log_type_t type;
  id v7;
  uint8_t v10[15];
  char v11;
  id v12;
  id v13;
  char v14;
  id v15[2];
  id v16;
  id location[2];
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16 = 0;
  objc_storeStrong(&v16, a3);
  v15[1] = a1;
  if (v16)
  {
    v15[0] = MEMORY[0x1E0C81028];
    v14 = 16;
    if (os_log_type_enabled((os_log_t)v15[0], OS_LOG_TYPE_ERROR))
    {
      log = v15[0];
      type = v14;
      v7 = (id)objc_msgSend(v16, "localizedDescription");
      v13 = v7;
      __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v13);
      _os_log_error_impl(&dword_1DC678000, log, type, "Data fetch from fitcored failed with error: %@", v18, 0xCu);

      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(v15, 0);
    (*(void (**)(void))(a1[4] + 16))();
  }
  v12 = MEMORY[0x1E0C81028];
  v11 = 1;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    v3 = v12;
    v4 = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_impl(&dword_1DC678000, v3, v4, "Calling completion handler", v10, 2u);
  }
  objc_storeStrong(&v12, 0);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_387(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

@end
