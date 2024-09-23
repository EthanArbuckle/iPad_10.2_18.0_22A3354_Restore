@implementation CHGrammar

- (CHGrammar)initWithFile:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CHGrammar *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *terminalProductions;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *nonTerminalProductions;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableDictionary *productionsByKey;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CHProductionRule *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char hasPrefix;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  double v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  double v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  CHProductionRule *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  NSMutableSet *nonTerminals;
  NSMutableArray *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t i;
  void *v287;
  NSMutableSet *v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  NSMutableSet *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  NSMutableSet *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  NSMutableSet *terminals;
  NSMutableArray *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t j;
  void *v335;
  NSMutableSet *v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  NSMutableSet *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  id v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t k;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  NSCharacterSet *characterSet;
  void *v390;
  id v391;
  void *v392;
  NSObject *v393;
  void *v394;
  void *v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  id v408;
  _BYTE v409[128];
  void *v410;
  _BYTE v411[128];
  uint8_t v412[128];
  uint8_t buf[4];
  void *v414;
  uint64_t v415;

  v415 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = (CHGrammar *)objc_msgSend_init(self, v6, v7, v8, v9, v10);
  if (v13)
  {
    v408 = 0;
    objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x1E0CB3940], v11, (uint64_t)v5, 4, (uint64_t)&v408, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v408;
    if (v15)
    {
      v16 = v15;
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v17 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v414 = v16;
        _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_ERROR, "Error while reading the grammar file:\n %@", buf, 0xCu);
      }
    }
    else
    {
      v391 = v5;
      objc_storeStrong((id *)&v13->_file, a3);
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      terminalProductions = v13->_terminalProductions;
      v13->_terminalProductions = (NSMutableArray *)v23;

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      nonTerminalProductions = v13->_nonTerminalProductions;
      v13->_nonTerminalProductions = (NSMutableArray *)v30;

      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v32, v33, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      productionsByKey = v13->_productionsByKey;
      v13->_productionsByKey = (NSMutableDictionary *)v37;

      objc_msgSend_set(MEMORY[0x1E0C99E20], v39, v40, v41, v42, v43);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0x1E0CB3000uLL;
      objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v45, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v390 = v14;
      objc_msgSend_componentsSeparatedByCharactersInSet_(v14, v51, (uint64_t)v50, v52, v53, v54);
      v17 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_count(v17, v55, v56, v57, v58, v59))
      {
        v65 = 0;
        v393 = v17;
        objc_msgSend_objectAtIndexedSubscript_(v17, v60, 0, v62, v63, v64);
        while (1)
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v103, v104, v105, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v102, v109, (uint64_t)v108, v110, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_length(v113, v114, v115, v116, v117, v118))
          {
            objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v119, v120, v121, v122, v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByTrimmingCharactersInSet_(v113, v125, (uint64_t)v124, v126, v127, v128);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            hasPrefix = objc_msgSend_hasPrefix_(v129, v130, (uint64_t)CFSTR("//"), v131, v132, v133);

            if ((hasPrefix & 1) == 0)
            {
              objc_msgSend_componentsSeparatedByString_(v113, v135, (uint64_t)CFSTR("->"), v136, v137, v138);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v139, v140, 0, v141, v142, v143);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v145, v146, v147, v148, v149);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByTrimmingCharactersInSet_(v144, v151, (uint64_t)v150, v152, v153, v154);
              v155 = (void *)objc_claimAutoreleasedReturnValue();

              v394 = v139;
              objc_msgSend_objectAtIndexedSubscript_(v139, v156, 1, v157, v158, v159);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v161, v162, v163, v164, v165);
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByTrimmingCharactersInSet_(v160, v167, (uint64_t)v166, v168, v169, v170);
              v171 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_componentsSeparatedByString_(v171, v172, (uint64_t)CFSTR("%|"), v173, v174, v175);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v176, v177, 0, v178, v179, v180);
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v182, v183, v184, v185, v186);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByTrimmingCharactersInSet_(v181, v188, (uint64_t)v187, v189, v190, v191);
              v192 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v193, v194, v195, v196, v197);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              v395 = v192;
              objc_msgSend_componentsSeparatedByCharactersInSet_(v192, v199, (uint64_t)v198, v200, v201, v202);
              v203 = (void *)objc_claimAutoreleasedReturnValue();

              v214 = 1.0;
              if ((unint64_t)objc_msgSend_count(v176, v204, v205, v206, v207, v208) >= 2)
              {
                objc_msgSend_objectAtIndexedSubscript_(v176, v209, 1, v211, v212, v213);
                v215 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_whitespaceCharacterSet(*(void **)(v44 + 1280), v216, v217, v218, v219, v220);
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringByTrimmingCharactersInSet_(v215, v222, (uint64_t)v221, v223, v224, v225);
                v226 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_doubleValue(v226, v227, v228, v229, v230, v231);
                v214 = v232;

                v44 = 0x1E0CB3000;
              }
              if (objc_msgSend_count(v203, v209, v210, v211, v212, v213) == 1)
              {
                v66 = [CHProductionRule alloc];
                objc_msgSend_objectAtIndexedSubscript_(v203, v67, 0, v68, v69, v70);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = objc_msgSend_initWithLeftNode_rightNode_probability_(v66, v72, (uint64_t)v155, (uint64_t)v71, v73, v74, v214);

                objc_msgSend_key(v75, v76, v77, v78, v79, v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v13->_productionsByKey, v82, (uint64_t)v81, v83, v84, v85);
                v86 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v86)
                {
                  objc_msgSend_setObject_forKeyedSubscript_(v13->_productionsByKey, v87, (uint64_t)v75, (uint64_t)v81, v89, v90);
                  objc_msgSend_addObject_(v13->_terminalProductions, v269, (uint64_t)v75, v270, v271, v272);
                }
                objc_msgSend_objectAtIndexedSubscript_(v203, v87, 0, v88, v89, v90);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v392, v92, (uint64_t)v91, v93, v94, v95);

                v17 = v393;
                v96 = v394;
                v44 = 0x1E0CB3000uLL;
              }
              else if (objc_msgSend_count(v203, v233, v234, v235, v236, v237) == 2)
              {
                v238 = [CHProductionRule alloc];
                objc_msgSend_objectAtIndexedSubscript_(v203, v239, 0, v240, v241, v242);
                v243 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v203, v244, 1, v245, v246, v247);
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = objc_msgSend_initWithLeftNode_rightNode1_rightNode2_probability_(v238, v249, (uint64_t)v155, (uint64_t)v243, (uint64_t)v248, v250, v214);

                objc_msgSend_key(v75, v251, v252, v253, v254, v255);
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v13->_productionsByKey, v257, (uint64_t)v256, v258, v259, v260);
                v261 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v261)
                {
                  objc_msgSend_setObject_forKeyedSubscript_(v13->_productionsByKey, v262, (uint64_t)v75, (uint64_t)v256, v263, v264);
                  objc_msgSend_addObject_(v13->_nonTerminalProductions, v265, (uint64_t)v75, v266, v267, v268);
                }

                v17 = v393;
                v96 = v394;
                v44 = 0x1E0CB3000;
              }
              else
              {
                v17 = v393;
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v96 = v394;
                v75 = (id)qword_1EF568E20;
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE607000, v75, OS_LOG_TYPE_ERROR, "Error: Unexpected number of elements on the right side of a production rule.", buf, 2u);
                }
              }

            }
          }

          if (++v65 >= (unint64_t)objc_msgSend_count(v17, v97, v98, v99, v100, v101))
            break;
          objc_msgSend_objectAtIndexedSubscript_(v17, v60, v65, v62, v63, v64);
        }
      }
      objc_msgSend_set(MEMORY[0x1E0C99E20], v60, v61, v62, v63, v64);
      v273 = objc_claimAutoreleasedReturnValue();
      nonTerminals = v13->_nonTerminals;
      v13->_nonTerminals = (NSMutableSet *)v273;

      v406 = 0u;
      v407 = 0u;
      v404 = 0u;
      v405 = 0u;
      v275 = v13->_nonTerminalProductions;
      v278 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v276, (uint64_t)&v404, (uint64_t)v412, 16, v277);
      if (v278)
      {
        v284 = v278;
        v285 = *(_QWORD *)v405;
        do
        {
          for (i = 0; i != v284; ++i)
          {
            if (*(_QWORD *)v405 != v285)
              objc_enumerationMutation(v275);
            v287 = *(void **)(*((_QWORD *)&v404 + 1) + 8 * i);
            v288 = v13->_nonTerminals;
            objc_msgSend_leftNode(v287, v279, v280, v281, v282, v283);
            v289 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v288, v290, (uint64_t)v289, v291, v292, v293);

            v294 = v13->_nonTerminals;
            objc_msgSend_rightNode1(v287, v295, v296, v297, v298, v299);
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v294, v301, (uint64_t)v300, v302, v303, v304);

            v305 = v13->_nonTerminals;
            objc_msgSend_rightNode2(v287, v306, v307, v308, v309, v310);
            v311 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v305, v312, (uint64_t)v311, v313, v314, v315);

          }
          v284 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v279, (uint64_t)&v404, (uint64_t)v412, 16, v283);
        }
        while (v284);
      }

      objc_msgSend_set(MEMORY[0x1E0C99E20], v316, v317, v318, v319, v320);
      v321 = objc_claimAutoreleasedReturnValue();
      terminals = v13->_terminals;
      v13->_terminals = (NSMutableSet *)v321;

      v402 = 0u;
      v403 = 0u;
      v400 = 0u;
      v401 = 0u;
      v323 = v13->_terminalProductions;
      v326 = objc_msgSend_countByEnumeratingWithState_objects_count_(v323, v324, (uint64_t)&v400, (uint64_t)v411, 16, v325);
      v14 = v392;
      if (v326)
      {
        v332 = v326;
        v333 = *(_QWORD *)v401;
        do
        {
          for (j = 0; j != v332; ++j)
          {
            if (*(_QWORD *)v401 != v333)
              objc_enumerationMutation(v323);
            v335 = *(void **)(*((_QWORD *)&v400 + 1) + 8 * j);
            v336 = v13->_nonTerminals;
            objc_msgSend_leftNode(v335, v327, v328, v329, v330, v331);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v336, v338, (uint64_t)v337, v339, v340, v341);

            v342 = v13->_terminals;
            objc_msgSend_rightNode1(v335, v343, v344, v345, v346, v347);
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v342, v349, (uint64_t)v348, v350, v351, v352);

          }
          v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v323, v327, (uint64_t)&v400, (uint64_t)v411, 16, v331);
        }
        while (v332);
      }

      objc_msgSend_string(MEMORY[0x1E0CB37A0], v353, v354, v355, v356, v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v359, (uint64_t)CFSTR("self"), 1, v360, v361);
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      v410 = v362;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v363, (uint64_t)&v410, 1, v364, v365);
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortedArrayUsingDescriptors_(v392, v367, (uint64_t)v366, v368, v369, v370);
      v371 = (void *)objc_claimAutoreleasedReturnValue();

      v398 = 0u;
      v399 = 0u;
      v396 = 0u;
      v397 = 0u;
      v372 = v371;
      v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v372, v373, (uint64_t)&v396, (uint64_t)v409, 16, v374);
      if (v375)
      {
        v380 = v375;
        v381 = *(_QWORD *)v397;
        do
        {
          for (k = 0; k != v380; ++k)
          {
            if (*(_QWORD *)v397 != v381)
              objc_enumerationMutation(v372);
            objc_msgSend_appendString_(v358, v376, *(_QWORD *)(*((_QWORD *)&v396 + 1) + 8 * k), v377, v378, v379);
          }
          v380 = objc_msgSend_countByEnumeratingWithState_objects_count_(v372, v376, (uint64_t)&v396, (uint64_t)v409, 16, v379);
        }
        while (v380);
      }

      objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v383, (uint64_t)v358, v384, v385, v386);
      v387 = objc_claimAutoreleasedReturnValue();
      characterSet = v13->_characterSet;
      v13->_characterSet = (NSCharacterSet *)v387;

      v16 = v390;
      v5 = v391;
    }

  }
  return v13;
}

- (NSSet)nonTerminals
{
  return (NSSet *)self->_nonTerminals;
}

- (id)terminalst
{
  return self->_terminals;
}

- (id)terminalProductions
{
  return self->_terminalProductions;
}

- (id)nonTerminalProductions
{
  return self->_nonTerminalProductions;
}

- (id)getProductionRuleByKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (id)objc_msgSend_valueForKey_(self->_productionsByKey, a2, (uint64_t)a3, v3, v4, v5);
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  objc_super v59;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v59.receiver = self;
  v59.super_class = (Class)CHGrammar;
  -[CHGrammar description](&v59, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_terminals(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
  objc_msgSend_nonTerminals(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);
  objc_msgSend_terminalProductions(self, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_count(v34, v35, v36, v37, v38, v39);
  objc_msgSend_nonTerminalProductions(self, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);
  objc_msgSend_stringWithFormat_(v3, v53, (uint64_t)CFSTR("%@: terminals=%lu, non-terminals=%lu, rules=%lu"), v54, v55, v56, v4, v16, v28, v52 + v40);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (NSSet)terminals
{
  return &self->_terminals->super;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (NSString)file
{
  return self->_file;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_nonTerminals, 0);
  objc_storeStrong((id *)&self->_terminals, 0);
  objc_storeStrong((id *)&self->_productionsByKey, 0);
  objc_storeStrong((id *)&self->_nonTerminalProductions, 0);
  objc_storeStrong((id *)&self->_terminalProductions, 0);
}

@end
