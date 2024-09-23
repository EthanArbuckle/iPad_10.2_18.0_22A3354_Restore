@implementation CHMathUtilities

+ (id)syntaxAllowedSplitsForResult:(id)a3 outSubResultBounds:(void *)a4
{
  id v4;
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
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v65;
  int isEqualToString;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
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
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  int v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  id v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  void *v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  char v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  unint64_t v277;
  BOOL v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  unint64_t v312;
  CGFloat *v313;
  _QWORD *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  unint64_t v319;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  unint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  CGFloat v354;
  CGFloat v355;
  CGFloat v356;
  CGFloat v357;
  unint64_t v358;
  CGFloat *v359;
  CGFloat *v360;
  uint64_t v361;
  unint64_t v362;
  uint64_t v363;
  unint64_t v364;
  char *v365;
  CGFloat *v366;
  uint64_t v367;
  __int128 v368;
  CGFloat *v369;
  uint64_t v370;
  BOOL v371;
  CGFloat *v372;
  uint64_t v373;
  unint64_t v374;
  _BOOL4 IsNull;
  __int128 *v376;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  __int128 v390;
  __int128 v391;
  _QWORD v392[4];
  id v393;
  _QWORD *v394;
  _QWORD *v395;
  _QWORD v396[4];
  _QWORD v397[5];
  id v398;
  CGRect v399;
  CGRect v400;
  CGRect v401;

  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v397[0] = 0;
  v397[1] = v397;
  v397[2] = 0x3032000000;
  v397[3] = sub_1BE7665EC;
  v397[4] = sub_1BE7665FC;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v398 = (id)objc_claimAutoreleasedReturnValue();
  v396[0] = 0;
  v396[1] = v396;
  v396[2] = 0x2020000000;
  v396[3] = 0;
  v392[0] = MEMORY[0x1E0C809B0];
  v392[1] = 3221225472;
  v392[2] = sub_1BE766604;
  v392[3] = &unk_1E77F2048;
  v394 = v396;
  v395 = v397;
  v16 = v10;
  v393 = v16;
  v381 = v4;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v4, v17, (uint64_t)v392, v18, v19, v20);
  if ((unint64_t)objc_msgSend_count(v16, v21, v22, v23, v24, v25) <= 1)
  {
    v31 = v16;
    v32 = v31;
    goto LABEL_86;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v26, v27, v28, v29, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v386 = v16;
  objc_msgSend_objectAtIndexedSubscript_(v16, v34, 0, v35, v36, v37);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  while (v43 < objc_msgSend_count(v386, v38, v39, v40, v41, v42) - 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v386, v44, v43 + 1, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v388, v50, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_properties(v55, v56, v57, v58, v59, v60) & 0x100) != 0)
    {
      objc_msgSend_firstObject(v49, v61, v62, v63, v64, v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v67, v68, v69, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v73, v74, (uint64_t)CFSTR("{"), v75, v76, v77))
      {
        objc_msgSend_lastObject(v49, v78, v79, v80, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v83, v84, v85, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v89, v90, (uint64_t)CFSTR("}"), v91, v92, v93);

      }
      else
      {
        isEqualToString = 0;
      }

    }
    else
    {
      isEqualToString = 0;
    }

    objc_msgSend_lastObject(v388, v94, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v99, v100, v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v105, v106, (uint64_t)CFSTR("\\frac"), v107, v108, v109))
    {
      v115 = objc_msgSend_count(v386, v110, v111, v112, v113, v114);

      if (v43 + 2 >= v115)
      {
        if (isEqualToString)
          goto LABEL_23;
      }
      else
      {
        objc_msgSend_objectAtIndexedSubscript_(v386, v116, v43 + 2, v117, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v49, v121, v122, v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v126, v127, v128, v129, v130, v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v132, v133, (uint64_t)CFSTR("{"), v134, v135, v136))
        {
          objc_msgSend_lastObject(v49, v137, v138, v139, v140, v141);
          v384 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v384, v142, v143, v144, v145, v146);
          v383 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v383, v147, (uint64_t)CFSTR("}"), v148, v149, v150))
          {
            objc_msgSend_firstObject(v120, v151, v152, v153, v154, v155);
            v382 = v120;
            v380 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v380, v156, v157, v158, v159, v160);
            v379 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v379, v161, (uint64_t)CFSTR("{"), v162, v163, v164))
            {
              objc_msgSend_lastObject(v120, v165, v166, v167, v168, v169);
              v378 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_string(v378, v170, v171, v172, v173, v174);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              v180 = objc_msgSend_isEqualToString_(v175, v176, (uint64_t)CFSTR("}"), v177, v178, v179);

            }
            else
            {
              v180 = 0;
            }
            v120 = v382;

          }
          else
          {
            v180 = 0;
          }

          if ((isEqualToString & 1) != 0)
          {
LABEL_23:
            objc_msgSend_addObjectsFromArray_(v388, v116, (uint64_t)v49, v117, v118, v119);
            objc_msgSend_addObject_(v33, v181, (uint64_t)v388, v182, v183, v184);
            v43 += 2;
            goto LABEL_31;
          }
        }
        else
        {
          v180 = 0;

          if ((isEqualToString & 1) != 0)
            goto LABEL_23;
        }
        if (v180)
        {
          objc_msgSend_addObjectsFromArray_(v388, v116, (uint64_t)v49, v117, v118, v119);
          objc_msgSend_objectAtIndexedSubscript_(v386, v190, v43 + 2, v191, v192, v193);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v388, v195, (uint64_t)v194, v196, v197, v198);

          objc_msgSend_addObject_(v33, v199, (uint64_t)v388, v200, v201, v202);
          v43 += 3;
          goto LABEL_31;
        }
      }
    }
    else
    {

      if ((isEqualToString & 1) != 0)
        goto LABEL_23;
    }
    objc_msgSend_addObject_(v33, v116, (uint64_t)v388, v117, v118, v119);
    ++v43;
LABEL_31:
    if (v43 < objc_msgSend_count(v386, v185, v186, v187, v188, v189))
    {
      objc_msgSend_objectAtIndexedSubscript_(v386, v203, v43, v204, v205, v206);
      v207 = objc_claimAutoreleasedReturnValue();

      v388 = (void *)v207;
    }

  }
  v213 = v386;
  if (v43 == objc_msgSend_count(v386, v44, v45, v46, v47, v48) - 1)
  {
    objc_msgSend_lastObject(v386, v208, v209, v210, v211, v212);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v33, v215, (uint64_t)v214, v216, v217, v218);

    v213 = v386;
  }
  v219 = v33;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v220, v221, v222, v223, v224);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectAtIndexedSubscript_(v219, v225, 0, v226, v227, v228);
  v387 = v219;
  v229 = 0;
  v230 = v388;
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  while (2)
  {
    v389 = v231;
LABEL_37:

    if (v229 < objc_msgSend_count(v387, v232, v233, v234, v235, v236) - 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v387, v237, v229 + 1, v239, v240, v241);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v230, v242, v243, v244, v245, v246) != 1)
        goto LABEL_43;
      objc_msgSend_objectAtIndexedSubscript_(v230, v247, 0, v248, v249, v250);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v251, v252, v253, v254, v255, v256);
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      v267 = objc_msgSend_isEqualToString_(v257, v258, (uint64_t)CFSTR("^"), v259, v260, v261);
      if ((v267 & 1) != 0
        || (objc_msgSend_objectAtIndexedSubscript_(v230, v262, 0, v264, v265, v266),
            v384 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_string(v384, v268, v269, v270, v271, v272),
            v383 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqualToString_(v383, v273, (uint64_t)CFSTR("_"), v274, v275, v276)))
      {
        v277 = objc_msgSend_count(v387, v262, v263, v264, v265, v266);
        v278 = v229 + 2 < v277;
        if ((v267 & 1) != 0)
        {

          if (v229 + 2 >= v277)
            goto LABEL_43;
LABEL_46:
          v231 = v389;
          objc_msgSend_addObjectsFromArray_(v389, v247, (uint64_t)v230, v248, v249, v250);
          objc_msgSend_objectAtIndexedSubscript_(v387, v284, v229 + 2, v285, v286, v287);
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v389, v289, (uint64_t)v288, v290, v291, v292);

          objc_msgSend_addObject_(v32, v293, (uint64_t)v389, v294, v295, v296);
          v229 += 3;
          goto LABEL_47;
        }
      }
      else
      {
        v278 = 0;
      }

      if (v278)
        goto LABEL_46;
LABEL_43:
      v231 = v389;
      objc_msgSend_addObject_(v32, v247, (uint64_t)v389, v248, v249, v250);
      ++v229;
LABEL_47:
      if (v229 < objc_msgSend_count(v387, v279, v280, v281, v282, v283))
      {
        objc_msgSend_objectAtIndexedSubscript_(v387, v297, v229, v298, v299, v300);
        v301 = objc_claimAutoreleasedReturnValue();

        v231 = (void *)v301;
        continue;
      }
      goto LABEL_37;
    }
    break;
  }
  if (v229 == objc_msgSend_count(v387, v237, v238, v239, v240, v241) - 1)
  {
    objc_msgSend_lastObject(v387, v302, v303, v304, v305, v306);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v32, v308, (uint64_t)v307, v309, v310, v311);

  }
  v312 = 0;
  v313 = (CGFloat *)MEMORY[0x1E0C9D628];
  while (2)
  {
    if (v312 < objc_msgSend_count(v32, v302, v303, v304, v305, v306))
    {
      v319 = 0;
      x = *v313;
      y = v313[1];
      width = v313[2];
      height = v313[3];
      while (1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v32, v315, v312, v316, v317, v318);
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        v330 = objc_msgSend_count(v324, v325, v326, v327, v328, v329);

        if (v319 >= v330)
          break;
        objc_msgSend_objectAtIndexedSubscript_(v32, v302, v312, v304, v305, v306);
        v331 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v331, v332, v319, v333, v334, v335);
        v336 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeIndexes(v336, v337, v338, v339, v340, v341);
        v342 = (void *)objc_claimAutoreleasedReturnValue();
        v348 = objc_msgSend_count(v342, v343, v344, v345, v346, v347);

        if (v348)
        {
          objc_msgSend_bounds(v336, v349, v350, v351, v352, v353);
          v401.origin.x = v354;
          v401.origin.y = v355;
          v401.size.width = v356;
          v401.size.height = v357;
          v399.origin.x = x;
          v399.origin.y = y;
          v399.size.width = width;
          v399.size.height = height;
          v400 = CGRectUnion(v399, v401);
          x = v400.origin.x;
          y = v400.origin.y;
          width = v400.size.width;
          height = v400.size.height;
        }

        ++v319;
      }
      v359 = (CGFloat *)*((_QWORD *)a4 + 1);
      v358 = *((_QWORD *)a4 + 2);
      if ((unint64_t)v359 < v358)
      {
        *v359 = x;
        v359[1] = y;
        v314 = v359 + 4;
        v359[2] = width;
        v359[3] = height;
        goto LABEL_53;
      }
      v360 = *(CGFloat **)a4;
      v361 = ((uint64_t)v359 - *(_QWORD *)a4) >> 5;
      v362 = v361 + 1;
      if ((unint64_t)(v361 + 1) >> 59)
        sub_1BE61F930();
      v363 = v358 - (_QWORD)v360;
      if (v363 >> 4 > v362)
        v362 = v363 >> 4;
      if ((unint64_t)v363 >= 0x7FFFFFFFFFFFFFE0)
        v364 = 0x7FFFFFFFFFFFFFFLL;
      else
        v364 = v362;
      if (v364)
      {
        if (v364 >> 59)
          sub_1BE61F100();
        v365 = (char *)operator new(32 * v364);
        v366 = (CGFloat *)&v365[32 * v361];
        *v366 = x;
        v366[1] = y;
        v366[2] = width;
        v366[3] = height;
        v367 = (uint64_t)v366;
        if (v359 == v360)
        {
LABEL_75:
          v314 = v366 + 4;
          *(_QWORD *)a4 = v367;
          *((_QWORD *)a4 + 1) = v366 + 4;
          *((_QWORD *)a4 + 2) = &v365[32 * v364];
          if (v359)
            goto LABEL_76;
          goto LABEL_53;
        }
      }
      else
      {
        v365 = 0;
        v366 = (CGFloat *)(32 * v361);
        *v366 = x;
        v366[1] = y;
        v366[2] = width;
        v366[3] = height;
        v367 = 32 * v361;
        if (v359 == v360)
          goto LABEL_75;
      }
      do
      {
        v368 = *((_OWORD *)v359 - 1);
        *(_OWORD *)(v367 - 32) = *((_OWORD *)v359 - 2);
        *(_OWORD *)(v367 - 16) = v368;
        v367 -= 32;
        v359 -= 4;
      }
      while (v359 != v360);
      v359 = *(CGFloat **)a4;
      v314 = v366 + 4;
      *(_QWORD *)a4 = v367;
      *((_QWORD *)a4 + 1) = v366 + 4;
      *((_QWORD *)a4 + 2) = &v365[32 * v364];
      if (v359)
LABEL_76:
        operator delete(v359);
LABEL_53:
      *((_QWORD *)a4 + 1) = v314;
      ++v312;
      continue;
    }
    break;
  }
  v369 = *(CGFloat **)a4;
  v370 = *((_QWORD *)a4 + 1);
  v371 = v370 == *(_QWORD *)a4;
  if (v370 == *(_QWORD *)a4)
    v372 = v313;
  else
    v372 = *(CGFloat **)a4;
  v390 = *(_OWORD *)v372;
  v391 = *((_OWORD *)v372 + 1);
  if (!v371)
  {
    v373 = 0;
    v374 = 0;
    do
    {
      while (1)
      {
        IsNull = CGRectIsNull(*(CGRect *)&v369[v373]);
        v369 = *(CGFloat **)a4;
        v376 = (__int128 *)(*(_QWORD *)a4 + v373 * 8);
        if (IsNull)
          break;
        v390 = *v376;
        v391 = v376[1];
        ++v374;
        v373 += 4;
        if (v374 >= (uint64_t)(*((_QWORD *)a4 + 1) - (_QWORD)v369) >> 5)
          goto LABEL_85;
      }
      *v376 = v390;
      v376[1] = v391;
      v369 = *(CGFloat **)a4;
      ++v374;
      v373 += 4;
    }
    while (v374 < (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5);
  }
LABEL_85:

  v31 = v387;
LABEL_86:

  _Block_object_dispose(v396, 8);
  _Block_object_dispose(v397, 8);

  return v32;
}

@end
