@implementation CHCyrillicAddAlternativeScriptCandidatesStep

- (CHCyrillicAddAlternativeScriptCandidatesStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4
{
  CHCyrillicAddAlternativeScriptCandidatesStep *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHCyrillicAddAlternativeScriptCandidatesStep;
  result = -[CHCyrillicAddAlternativeScriptCandidatesStep init](&v7, sel_init);
  if (result)
  {
    result->_staticLexicon = a3;
    result->_customLexicon = a4;
  }
  return result;
}

- (id)process:(id)a3 options:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
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
  uint64_t v55;
  BOOL v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
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
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
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
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
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
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
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
  BOOL v192;
  int v193;
  BOOL v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  int v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  void *v222;
  uint64_t v223;
  id v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  CHTokenizedTextResultToken *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  double v264;
  double v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  double v271;
  double v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  double v278;
  double v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  double v285;
  double v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  id v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  CHTokenizedTextResultToken *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  double v378;
  double v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  double v385;
  double v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  double v392;
  double v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  double v399;
  double v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  double v424;
  double v425;
  double v426;
  double v427;
  double v428;
  double v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  id v475;
  const char *v476;
  uint64_t v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t k;
  void *v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  void *v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  unint64_t m;
  void *v513;
  const char *v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  BOOL v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  void *v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  void *v543;
  const char *v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  void *v549;
  const char *v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  void *v554;
  const char *v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  void *v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  id v567;
  const char *v568;
  const char *v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  void *v578;
  const char *v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  void *v584;
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  void *v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  void *v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  id v600;
  void *v601;
  void *v602;
  uint64_t v603;
  unint64_t i;
  uint64_t v605;
  id *v606;
  void *v607;
  double v608;
  double v609;
  double v610;
  double v611;
  id obj;
  void *v613;
  uint64_t j;
  void *v616;
  uint64_t v617;
  double v618;
  double v619;
  uint64_t v620;
  double v621;
  double v622;
  id v623;
  id v624;
  _QWORD v625[4];
  id v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  char v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  _BYTE v648[128];
  _BYTE v649[128];
  _BYTE v650[128];
  uint64_t v651;

  v651 = *MEMORY[0x1E0C80C00];
  v606 = (id *)a3;
  v600 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v601 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v602 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v15, v16, v17, v18, v19);
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
  v613 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v613, v31, (uint64_t)v30, v32, v33, v34);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v613, v41, (uint64_t)v40, v42, v43, v44);

  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v606, v45, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = i < objc_msgSend_tokenColumnCount(v50, v51, v52, v53, v54, v55);

    if (!v56)
      break;
    objc_msgSend_result(v606, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v606, v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v68, v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v74, v75, 0, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v62, v80, (uint64_t)v79, i, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v646 = 0u;
    v647 = 0u;
    v644 = 0u;
    v645 = 0u;
    obj = v83;
    v605 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v644, (uint64_t)v650, 16, v85);
    if (v605)
    {
      v603 = *(_QWORD *)v645;
      do
      {
        for (j = 0; j != v605; ++j)
        {
          if (*(_QWORD *)v645 != v603)
            objc_enumerationMutation(obj);
          v90 = *(void **)(*((_QWORD *)&v644 + 1) + 8 * j);
          objc_msgSend_addObject_(v607, v86, (uint64_t)v90, v87, v88, v89);
          v616 = v90;
          objc_msgSend_string(v90, v91, v92, v93, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v97, v98, v99, v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v620 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v96, v103, (uint64_t)v102, 1, v104, v105);

          objc_msgSend_string(v90, v106, v107, v108, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E0CB3500], v112, v113, v114, v115, v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v617 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v111, v118, (uint64_t)v117, 1, v119, v120);

          v642 = 0u;
          v643 = 0u;
          v640 = 0u;
          v641 = 0u;
          objc_msgSend_result(v606, v121, v122, v123, v124, v125);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tokenColumns(v126, v127, v128, v129, v130, v131);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v132, v133, i, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textTokenRows(v137, v138, v139, v140, v141, v142);
          v623 = (id)objc_claimAutoreleasedReturnValue();

          v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v623, v143, (uint64_t)&v640, (uint64_t)v649, 16, v144);
          if (v150)
          {
            v151 = *(_QWORD *)v641;
LABEL_10:
            v152 = 0;
            while (1)
            {
              if (*(_QWORD *)v641 != v151)
                objc_enumerationMutation(v623);
              v153 = *(void **)(*((_QWORD *)&v640 + 1) + 8 * v152);
              if (objc_msgSend_count(v153, v145, v146, v147, v148, v149) == 1)
              {
                objc_msgSend_objectAtIndexedSubscript_(v153, v145, 0, v147, v148, v149);
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_string(v154, v155, v156, v157, v158, v159);
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v161, v162, v163, v164, v165);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                v170 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v160, v167, (uint64_t)v166, 1, v168, v169);

                objc_msgSend_objectAtIndexedSubscript_(v153, v171, 0, v172, v173, v174);
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_string(v175, v176, v177, v178, v179, v180);
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E0CB3500], v182, v183, v184, v185, v186);
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v181, v188, (uint64_t)v187, 1, v189, v190);
                v192 = v170 > 0;

                v193 = 0;
                v194 = v191 > 0 && v620 > 0;
                if (v194 || v617 > 0 && v192)
                  break;
              }
              if (v150 == ++v152)
              {
                v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v623, v145, (uint64_t)&v640, (uint64_t)v649, 16, v149);
                if (v150)
                  goto LABEL_10;
                goto LABEL_22;
              }
            }
          }
          else
          {
LABEL_22:
            v193 = 1;
          }

          if (objc_msgSend_count(obj, v195, v196, v197, v198, v199) == 1
            && ((objc_msgSend_string(v616, v200, v201, v202, v203, v204),
                 v205 = (void *)objc_claimAutoreleasedReturnValue(),
                 (unint64_t)objc_msgSend_length(v205, v206, v207, v208, v209, v210) < 4)
              ? (v211 = (v620 > 0) ^ (v617 > 0))
              : (v211 = 0),
                v205,
                (v193 & v211) != 0))
          {
            objc_msgSend_string(v616, v212, v213, v214, v215, v216);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            if (v620 < 1)
              objc_msgSend_transformCyrillicToLatin_(CHLanguageUtilities, v217, (uint64_t)v221, v218, v219, v220);
            else
              objc_msgSend_transformLatinToCyrillic_(CHLanguageUtilities, v217, (uint64_t)v221, v218, v219, v220);
            v223 = objc_claimAutoreleasedReturnValue();

            v222 = (void *)v223;
          }
          else
          {
            v222 = 0;
          }
          v224 = v616;
          v624 = v222;
          v234 = v224;
          if (objc_msgSend_count(v222, v225, v226, v227, v228, v229))
          {
            objc_msgSend_objectAtIndexedSubscript_(v222, v230, 0, v231, v232, v233);
            v235 = (void *)objc_claimAutoreleasedReturnValue();
            v244 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v236, (uint64_t)v235, (uint64_t)self->_customLexicon, v237, v238);
            if (!(_DWORD)v244)
              v244 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v239, (uint64_t)v235, (uint64_t)self->_staticLexicon, v242, v243);
            v245 = objc_msgSend_properties(v224, v239, v240, v241, v242, v243);
            v639 = 0;
            if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v246, (uint64_t)v235, (uint64_t)self->_staticLexicon, (uint64_t)&v639, v247) & 1) != 0|| objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v248, (uint64_t)v235, (uint64_t)self->_customLexicon, (uint64_t)&v639, v249))
            {
              v250 = 260;
              if (!v639)
                v250 = 4;
              v251 = v250 | v245;
            }
            else
            {
              v251 = v245 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v252 = [CHTokenizedTextResultToken alloc];
            objc_msgSend_strokeIndexes(v224, v253, v254, v255, v256, v257);
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_modelScore(v224, v259, v260, v261, v262, v263);
            v265 = v264;
            objc_msgSend_recognitionScore(v224, v266, v267, v268, v269, v270);
            v272 = v271;
            objc_msgSend_combinedScore(v224, v273, v274, v275, v276, v277);
            v279 = v278;
            objc_msgSend_alignmentScore(v224, v280, v281, v282, v283, v284);
            v286 = v285;
            objc_msgSend_recognizerSourceLocale(v224, v287, v288, v289, v290, v291);
            v292 = (void *)objc_claimAutoreleasedReturnValue();
            v618 = v286;
            v621 = v265;
            v298 = objc_msgSend_inputSources(v224, v293, v294, v295, v296, v297);
            v304 = objc_msgSend_substrokeCount(v224, v299, v300, v301, v302, v303);
            objc_msgSend_bounds(v224, v305, v306, v307, v308, v309);
            v608 = v311;
            v610 = v310;
            v313 = v312;
            v315 = v314;
            objc_msgSend_originalBounds(v224, v316, v317, v318, v319, v320);
            v327 = v326;
            v329 = v328;
            v331 = v330;
            v333 = v332;
            if (v616)
            {
              objc_msgSend_principalLines(v224, v321, v322, v323, v324, v325);
            }
            else
            {
              v637 = 0u;
              v638 = 0u;
              v635 = 0u;
              v636 = 0u;
              v633 = 0u;
              v634 = 0u;
              v631 = 0u;
              v632 = 0u;
            }
            v234 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v252, v321, (uint64_t)v235, (uint64_t)v258, v244, v251, v292, v298 | 8, v621, v272 * 0.5, v279 * 0.5, v618, v610, v608, v313, v315, v304, v327, v329,
                             v331,
                             v333,
                             &v631);

          }
          objc_msgSend_objectAtIndexedSubscript_(v613, v230, 0, v231, v232, v233);
          v334 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v334, v335, (uint64_t)v234, v336, v337, v338);

          v339 = v224;
          if ((unint64_t)objc_msgSend_count(v624, v340, v341, v342, v343, v344) >= 2)
          {
            objc_msgSend_objectAtIndexedSubscript_(v624, v345, 1, v346, v347, v348);
            v349 = (void *)objc_claimAutoreleasedReturnValue();
            v358 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v350, (uint64_t)v349, (uint64_t)self->_customLexicon, v351, v352);
            if (!(_DWORD)v358)
              v358 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v353, (uint64_t)v349, (uint64_t)self->_staticLexicon, v356, v357);
            v359 = objc_msgSend_properties(v339, v353, v354, v355, v356, v357);
            v639 = 0;
            if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v360, (uint64_t)v349, (uint64_t)self->_staticLexicon, (uint64_t)&v639, v361) & 1) != 0|| (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v362, (uint64_t)v349, (uint64_t)self->_customLexicon, (uint64_t)&v639, v363) & 1) != 0)
            {
              v364 = 260;
              if (!v639)
                v364 = 4;
              v365 = v364 | v359;
            }
            else
            {
              v365 = v359 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v366 = [CHTokenizedTextResultToken alloc];
            objc_msgSend_strokeIndexes(v339, v367, v368, v369, v370, v371);
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_modelScore(v339, v373, v374, v375, v376, v377);
            v379 = v378;
            objc_msgSend_recognitionScore(v339, v380, v381, v382, v383, v384);
            v386 = v385;
            objc_msgSend_combinedScore(v339, v387, v388, v389, v390, v391);
            v393 = v392;
            objc_msgSend_alignmentScore(v339, v394, v395, v396, v397, v398);
            v400 = v399;
            objc_msgSend_recognizerSourceLocale(v339, v401, v402, v403, v404, v405);
            v406 = (void *)objc_claimAutoreleasedReturnValue();
            v619 = v400;
            v622 = v379;
            v412 = objc_msgSend_inputSources(v339, v407, v408, v409, v410, v411);
            v418 = objc_msgSend_substrokeCount(v339, v413, v414, v415, v416, v417);
            objc_msgSend_bounds(v339, v419, v420, v421, v422, v423);
            v609 = v425;
            v611 = v424;
            v427 = v426;
            v429 = v428;
            objc_msgSend_originalBounds(v339, v430, v431, v432, v433, v434);
            v441 = v440;
            v443 = v442;
            v445 = v444;
            v447 = v446;
            if (v616)
            {
              objc_msgSend_principalLines(v339, v435, v436, v437, v438, v439);
            }
            else
            {
              v637 = 0u;
              v638 = 0u;
              v635 = 0u;
              v636 = 0u;
              v633 = 0u;
              v634 = 0u;
              v631 = 0u;
              v632 = 0u;
            }
            v448 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v366, v435, (uint64_t)v349, (uint64_t)v372, v358, v365, v406, v412 | 8, v622, v386 * 0.5, v393 * 0.5, v619, v611, v609, v427, v429, v418, v441, v443,
                     v445,
                     v447,
                     &v631);

            v339 = (id)v448;
          }
          objc_msgSend_objectAtIndexedSubscript_(v613, v345, 1, v346, v347, v348);
          v449 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v449, v450, (uint64_t)v339, v451, v452, v453);

        }
        v605 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v644, (uint64_t)v650, 16, v89);
      }
      while (v605);
    }

  }
  objc_msgSend_addObject_(v601, v57, (uint64_t)v607, v59, v60, v61);
  objc_msgSend_result(v606, v454, v455, v456, v457, v458);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPathScores(v459, v460, v461, v462, v463, v464);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v465, v466, 0, v467, v468, v469);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v602, v471, (uint64_t)v470, v472, v473, v474);

  v629 = 0u;
  v630 = 0u;
  v627 = 0u;
  v628 = 0u;
  v475 = v613;
  v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(v475, v476, (uint64_t)&v627, (uint64_t)v648, 16, v477);
  if (v482)
  {
    v483 = *(_QWORD *)v628;
    do
    {
      for (k = 0; k != v482; ++k)
      {
        if (*(_QWORD *)v628 != v483)
          objc_enumerationMutation(v475);
        v485 = *(void **)(*((_QWORD *)&v627 + 1) + 8 * k);
        if ((objc_msgSend_isEqual_(v485, v478, (uint64_t)v607, v479, v480, v481) & 1) == 0)
        {
          objc_msgSend_addObject_(v601, v478, (uint64_t)v485, v479, v480, v481);
          objc_msgSend_result(v606, v486, v487, v488, v489, v490);
          v491 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transcriptionPathScores(v491, v492, v493, v494, v495, v496);
          v497 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v497, v498, 0, v499, v500, v501);
          v502 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v602, v503, (uint64_t)v502, v504, v505, v506);

        }
      }
      v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(v475, v478, (uint64_t)&v627, (uint64_t)v648, 16, v481);
    }
    while (v482);
  }

  for (m = 1; ; ++m)
  {
    objc_msgSend_result(v606, v507, v508, v509, v510, v511);
    v513 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v513, v514, v515, v516, v517, v518);
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    v525 = m < objc_msgSend_count(v519, v520, v521, v522, v523, v524);

    if (!v525)
      break;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v526, v527, v528, v529, v530);
    v531 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v606, v532, v533, v534, v535, v536);
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v606, v538, v539, v540, v541, v542);
    v543 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v543, v544, v545, v546, v547, v548);
    v549 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v549, v550, m, v551, v552, v553);
    v554 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v606, v555, v556, v557, v558, v559);
    v560 = (void *)objc_claimAutoreleasedReturnValue();
    v566 = objc_msgSend_tokenColumnCount(v560, v561, v562, v563, v564, v565);
    v625[0] = MEMORY[0x1E0C809B0];
    v625[1] = 3221225472;
    v625[2] = sub_1BE8C1E44;
    v625[3] = &unk_1E77F4928;
    v567 = v531;
    v626 = v567;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v537, v568, (uint64_t)v554, 0, v566, (uint64_t)v625);

    objc_msgSend_addObject_(v601, v569, (uint64_t)v567, v570, v571, v572);
    objc_msgSend_result(v606, v573, v574, v575, v576, v577);
    v578 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v578, v579, v580, v581, v582, v583);
    v584 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v584, v585, m, v586, v587, v588);
    v589 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v602, v590, (uint64_t)v589, v591, v592, v593);

  }
  objc_msgSend_result(v606, v526, v527, v528, v529, v530);
  v594 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v594, v595, (uint64_t)v601, (uint64_t)v602, v596, v597);
  v598 = (void *)objc_claimAutoreleasedReturnValue();
  if (v606)
    objc_storeStrong(v606 + 3, v598);

  return v606;
}

@end
