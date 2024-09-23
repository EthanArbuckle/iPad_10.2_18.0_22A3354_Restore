@implementation CHRemoveSpacesFromStrongURLsAndEmailsStep

- (CHRemoveSpacesFromStrongURLsAndEmailsStep)initWithPatternFst:(id)a3
{
  id v5;
  CHRemoveSpacesFromStrongURLsAndEmailsStep *v6;
  CHRemoveSpacesFromStrongURLsAndEmailsStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHRemoveSpacesFromStrongURLsAndEmailsStep;
  v6 = -[CHRemoveSpacesFromStrongURLsAndEmailsStep init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_patternFST, a3);

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
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
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
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
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
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
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
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
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unsigned int isString_fullPattern_inNetwork;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  int v203;
  int isCompletePattern;
  const char *v205;
  uint64_t v206;
  int v207;
  uint64_t v208;
  unint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  unint64_t v214;
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
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  id v234;
  id v235;
  const char *v236;
  uint64_t v237;
  id v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  int v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  int v250;
  int v251;
  int v252;
  char v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  id v259;
  uint64_t v260;
  int v261;
  uint64_t v262;
  NSObject *v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  unint64_t v318;
  id v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  void *v326;
  uint64_t v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  double v357;
  double v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  double v364;
  double v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  double v371;
  double v372;
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
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  double v403;
  double v404;
  double v405;
  double v406;
  double v407;
  double v408;
  double v409;
  double v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  const char *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  void *v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  void *v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  void *v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  void *v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  void *v499;
  id v501;
  __CFString *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  unint64_t v508;
  id *v509;
  void *v510;
  unint64_t v511;
  void *v512;
  char v513;
  id v514;
  uint64_t *v515;
  uint64_t v516;
  unint64_t v517;
  id obj;
  NSUInteger range;
  uint64_t v520;
  double v521;
  double v522;
  double v523;
  double v524;
  void *v525;
  unint64_t v526;
  void *v527;
  void *v528;
  void *v529;
  unint64_t v530;
  uint64_t v531;
  unint64_t v532;
  uint64_t v533;
  int v534;
  uint64_t v535;
  _BYTE v536[136];
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  _QWORD v541[4];
  id v542;
  _QWORD v543[16];
  uint8_t v544[128];
  uint8_t buf[4];
  void *v546;
  __int16 v547;
  unint64_t v548;
  __int16 v549;
  int v550;
  __int16 v551;
  int v552;
  uint64_t v553;
  NSRange v554;

  v553 = *MEMORY[0x1E0C80C00];
  v509 = (id *)a3;
  v501 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v515 = (uint64_t *)self;
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromStrongURLsAndEmailsStep is running", buf, 2u);
  }

  objc_msgSend_leftContext(v509, v7, v8, v9, v10, v11);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v503, v12, v13, v14, v15, v16))
  {
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_rangeOfCharacterFromSet_options_(v503, v23, (uint64_t)v22, 4, v24, v25);
    v28 = v27;

    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_substringFromIndex_(v503, v17, v26 + v28, v19, v20, v21);
      v29 = objc_claimAutoreleasedReturnValue();

      v503 = (void *)v29;
    }
  }
  if (objc_msgSend_length(v503, v17, v18, v19, v20, v21))
  {
    objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v503, v36, (uint64_t)v35, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByCharactersInSet_(v40, v47, (uint64_t)v46, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = objc_msgSend_count(v51, v52, v53, v54, v55, v56);
    objc_msgSend_objectAtIndexedSubscript_(v51, v58, v57 - 1, v59, v60, v61);
    v502 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v503 = v40;
  }
  else
  {
    v502 = &stru_1E77F6F28;
  }
  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v30, v31, v32, v33, v34);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v63, (uint64_t)&stru_1E77F6F28, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = *MEMORY[0x1E0C9D628];
  v69 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  v70 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  v71 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v72 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v543[0] = *MEMORY[0x1E0C9D538];
  v543[1] = v72;
  v543[2] = v543[0];
  v543[3] = v72;
  v543[4] = v543[0];
  v543[5] = v72;
  v543[6] = v543[0];
  v543[7] = v72;
  v543[8] = v543[0];
  v543[9] = v72;
  v543[10] = v543[0];
  v543[11] = v72;
  v543[12] = v543[0];
  v543[13] = v72;
  v543[14] = v543[0];
  v543[15] = v72;
  objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v73, (uint64_t)v502, (uint64_t)v62, 0, 0, v67, 0, 0.0, 0.0, 0.0, 0.0, 0, v68, v69, v70, v71, v543);
  v504 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v74, v75, v76, v77, v78);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v79, v80, v81, v82, v83);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  v508 = 0;
  v517 = 0;
  v513 = 0;
  while (1)
  {
    objc_msgSend_result(v509, v84, v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v89, v90, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v508 < objc_msgSend_count(v95, v96, v97, v98, v99, v100);

    if (!v101)
      break;
    objc_msgSend_result(v509, v102, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v107, v108, v109, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v113, v114, v508, v115, v116, v117);
    v510 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v118, v119, v120, v121, v122);
    v507 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v507, v123, (uint64_t)v504, v124, v125, v126);
    objc_msgSend_result(v509, v127, v128, v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v509, v133, v134, v135, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v138, v139, v140, v141, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = objc_msgSend_count(v144, v145, v146, v147, v148, v149);
    v541[0] = MEMORY[0x1E0C809B0];
    v541[1] = 3221225472;
    v541[2] = sub_1BE8B1190;
    v541[3] = &unk_1E77F4928;
    v514 = v507;
    v542 = v514;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v132, v151, (uint64_t)v510, 0, v150, (uint64_t)v541);

    v157 = 0;
    v534 = 0;
    v512 = 0;
    v530 = 0;
    range = 0;
    v526 = 0x7FFFFFFFFFFFFFFFLL;
    while (v157 < objc_msgSend_count(v514, v152, v153, v154, v155, v156))
    {
      objc_msgSend_objectAtIndexedSubscript_(v514, v158, v157, v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v162, v163, v164, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v532 = v157;
      objc_msgSend_lowercaseString(v168, v169, v170, v171, v172, v173);
      v528 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v174, 11, v515[1], 0, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v177, (uint64_t)v528, (uint64_t)v176, v515[1], v178);

      objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v180, 12, v515[1], 0, v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = (void *)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v183, (uint64_t)v528, (uint64_t)v182, v515[1], v184);

      objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v186, 13, v515[1], 0, v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v189, (uint64_t)v528, (uint64_t)v188, v515[1], v190);

      isString_fullPattern_inNetwork = v191 != 0;
      if (!(v179 | v191))
      {

        break;
      }
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v192, (uint64_t)v528, v193, v194, v195);
      *(_QWORD *)v536 = objc_claimAutoreleasedReturnValue();
      v202 = v157;
      if (v157 || !v185)
      {
        if (!v157)
        {
          v203 = 0;
LABEL_28:
          if (!isString_fullPattern_inNetwork)
            goto LABEL_29;
          goto LABEL_19;
        }
        isCompletePattern = objc_msgSend_isCompletePattern((void *)v179, v197, v198, v199, v200, v201);
        isString_fullPattern_inNetwork = 0;
        if (v185)
          v203 = 1;
        else
          v203 = isCompletePattern;
        if ((v203 & 1) == 0)
          goto LABEL_28;
      }
      else
      {
        v203 = 1;
      }
LABEL_19:
      if (objc_msgSend_length(*(void **)v536, v197, v198, v199, v200, v201) > v530)
      {
        v530 = objc_msgSend_length(*(void **)v536, v197, v198, v199, v200, v201);
        goto LABEL_32;
      }
LABEL_29:
      if (!v157 || v526 >= v157)
      {
LABEL_37:
        isString_fullPattern_inNetwork = v517;
        v203 = HIDWORD(v517);
        goto LABEL_38;
      }
      isString_fullPattern_inNetwork = objc_msgSend_isString_fullPattern_inNetwork_(CHPatternNetwork, v197, (uint64_t)v528, 10, v515[1], v201);
      v207 = objc_msgSend_isString_fullPattern_inNetwork_(CHPatternNetwork, v205, (uint64_t)v528, 11, v515[1], v206);
      v203 = v207;
      if ((isString_fullPattern_inNetwork & 1) == 0)
      {
        if (!v207)
          goto LABEL_37;
        if ((v517 & 0x100000000) == 0)
        {
          v203 = 0;
          isString_fullPattern_inNetwork = v517;
          goto LABEL_38;
        }
        if ((v513 & 1) != 0)
        {
          v203 = 1;
          isString_fullPattern_inNetwork = v517;
          goto LABEL_38;
        }
      }
LABEL_32:
      range = 1;
      v526 = v157;
LABEL_38:
      v208 = 2;
      v517 = __PAIR64__(v203, isString_fullPattern_inNetwork);
      while (1)
      {
        v209 = objc_msgSend_count(v514, v197, v198, v199, v200, v201);
        v214 = v202 + v208 - 1;
        if (v214 >= v209)
          break;
        objc_msgSend_objectAtIndexedSubscript_(v514, v210, v214, v211, v212, v213);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v215, v216, v217, v218, v219, v220);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v221, v222, v223, v224, v225, v226);
        v227 = (void *)objc_claimAutoreleasedReturnValue();

        v230 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v228, (uint64_t)v227, v179, v515[1], v229);
        v233 = objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v231, (uint64_t)v227, v191, v515[1], v232);
        if (!(v230 | v233))
        {

          v191 = 0;
          v179 = (uint64_t)v227;
          goto LABEL_62;
        }
        v234 = (id)v230;

        v235 = (id)v233;
        v238 = (id)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v236, (uint64_t)v227, (uint64_t)v185, v515[1], v237);

        v244 = objc_msgSend_isCompletePattern(v234, v239, v240, v241, v242, v243);
        if (v238)
          v250 = 1;
        else
          v250 = v244;
        if (v235)
        {
          if ((objc_msgSend_containsString_(*(void **)v536, v245, (uint64_t)CFSTR("@"), v247, v248, v249) & 1) != 0
            || objc_msgSend_containsString_(v227, v245, (uint64_t)CFSTR("@"), v247, v248, v249))
          {
            if ((objc_msgSend_containsString_(*(void **)v536, v245, (uint64_t)CFSTR("."), v247, v248, v249) & 1) != 0)
              v251 = 1;
            else
              v251 = objc_msgSend_containsString_(v227, v245, (uint64_t)CFSTR("."), v247, v248, v249);
            v252 = 1;
LABEL_53:
            objc_msgSend_appendString_(*(void **)v536, v245, (uint64_t)v227, v247, v248, v249);
            v534 = v252;
            goto LABEL_54;
          }
          v534 = 0;
        }
        v251 = 0;
        v252 = v534;
        v253 = v250 | v534;
        v534 = 0;
        if ((v253 & 1) != 0)
          goto LABEL_53;
LABEL_54:
        if ((v250 | v251) == 1
          && (v513 |= v238 != 0, objc_msgSend_length(*(void **)v536, v245, v246, v247, v248, v249) > v530))
        {
          v530 = objc_msgSend_length(*(void **)v536, v254, v255, v256, v257, v258);
          v259 = *(id *)v536;

          v512 = v259;
          range = v208;
          v526 = v532;
          HIDWORD(v517) = v250;
        }
        else
        {
          v251 = v517;
        }

        ++v208;
        v191 = (uint64_t)v235;
        v185 = v238;
        v179 = (uint64_t)v234;
        LODWORD(v517) = v251;
        v202 = v532;
      }
      if (!v179)
        goto LABEL_63;
LABEL_62:

LABEL_63:
      if (v185)

      if (v191)
      v157 = v532 + 1;
    }
    v260 = 0x7FFFFFFFFFFFFFFFLL;
    if (((v517 | BYTE4(v517)) & (v517 | ~BYTE4(v517) | ((uint64_t)v530 > 3)) & 1) != 0)
      v260 = v526;
    *(_QWORD *)v536 = v260;
    if (!(BYTE4(v517) & 1 | ((v517 & 1) == 0)))
    {
      v261 = objc_msgSend_containsString_(v512, v158, (uint64_t)CFSTR("@"), v159, v160, v161);
      v262 = *(_QWORD *)v536;
      if (!v261)
        v262 = 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)v536 = v262;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v263 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG))
    {
      v554.location = *(_QWORD *)v536;
      v554.length = range;
      NSStringFromRange(v554);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v546 = v264;
      v547 = 2048;
      v548 = v530;
      v549 = 1024;
      v550 = v517 & 1;
      v551 = 1024;
      v552 = BYTE4(v517) & 1;
      _os_log_impl(&dword_1BE607000, v263, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromStrongURLsStep range: %@ stringLength: %li isEmail: %i isUrl: %i", buf, 0x22u);

    }
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v265, v266, v267, v268, v269);
    v527 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v270, v271, v272, v273, v274);
    v529 = (void *)objc_claimAutoreleasedReturnValue();
    v511 = 0;
    v280 = 1;
LABEL_81:
    if (v511 < objc_msgSend_length(v510, v275, v276, v277, v278, v279))
    {
      v285 = objc_msgSend_indexAtPosition_(v510, v281, v511, v282, v283, v284);
      objc_msgSend_result(v509, v286, v287, v288, v289, v290);
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v291, v292, v293, v294, v295, v296);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v297, v298, v511, v299, v300, v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTokenRows(v302, v303, v304, v305, v306, v307);
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v308, v309, v285, v310, v311, v312);
      v313 = (void *)objc_claimAutoreleasedReturnValue();

      v539 = 0u;
      v540 = 0u;
      v537 = 0u;
      v538 = 0u;
      obj = v313;
      v316 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v314, (uint64_t)&v537, (uint64_t)v544, 16, v315);
      if (!v316)
      {
        v439 = v280;
        goto LABEL_105;
      }
      v531 = *(_QWORD *)v538;
      while (1)
      {
        v317 = 0;
        v533 = v316;
        v535 = v280;
        v516 = v316 + v280;
        v520 = v280 - *(_QWORD *)v536;
        do
        {
          if (*(_QWORD *)v538 != v531)
            objc_enumerationMutation(obj);
          v318 = v535 + v317;
          v319 = *(id *)(*((_QWORD *)&v537 + 1) + 8 * v317);
          v325 = v319;
          v326 = v319;
          if (*(_QWORD *)v536 <= (unint64_t)(v535 + v317))
          {
            v326 = v319;
            if (v520 + v317 < range)
            {
              v327 = objc_msgSend_properties(v319, v320, v321, v322, v323, v324);
              v333 = v327 | 0x40;
              if ((v517 & 0x100000000) != 0)
              {
                if (v318 <= *(_QWORD *)v536)
                  goto LABEL_94;
LABEL_93:
                v333 = v327 & 0xFFFFFFFFFFFFFF9FLL | 0x40;
              }
              else if ((v517 & (v318 > *(_QWORD *)v536)) == 1)
              {
                goto LABEL_93;
              }
LABEL_94:
              objc_msgSend_string(v325, v328, v329, v330, v331, v332);
              v525 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lowercaseString(v525, v334, v335, v336, v337, v338);
              v339 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIndexes(v325, v340, v341, v342, v343, v344);
              v345 = (void *)objc_claimAutoreleasedReturnValue();
              v351 = objc_msgSend_wordID(v325, v346, v347, v348, v349, v350);
              objc_msgSend_modelScore(v325, v352, v353, v354, v355, v356);
              v358 = v357;
              objc_msgSend_recognitionScore(v325, v359, v360, v361, v362, v363);
              v365 = v364;
              objc_msgSend_combinedScore(v325, v366, v367, v368, v369, v370);
              v372 = v371;
              objc_msgSend_alignmentScore(v325, v373, v374, v375, v376, v377);
              v379 = v378;
              objc_msgSend_recognizerSourceLocale(v325, v380, v381, v382, v383, v384);
              v385 = (void *)objc_claimAutoreleasedReturnValue();
              v521 = v379;
              v522 = v372;
              v523 = v365;
              v524 = v358;
              v391 = objc_msgSend_inputSources(v325, v386, v387, v388, v389, v390);
              v397 = objc_msgSend_substrokeCount(v325, v392, v393, v394, v395, v396);
              objc_msgSend_bounds(v325, v398, v399, v400, v401, v402);
              v404 = v403;
              v406 = v405;
              v408 = v407;
              v410 = v409;
              objc_msgSend_originalBounds(v325, v411, v412, v413, v414, v415);
              v422 = v421;
              v424 = v423;
              v426 = v425;
              v428 = v427;
              if (v325)
                objc_msgSend_principalLines(v325, v416, v417, v418, v419, v420);
              else
                memset(&v536[8], 0, 128);
              objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v416, (uint64_t)v339, (uint64_t)v345, v351, v333, v385, v391 | 0x200, v524, v523, v522, v521, v404, v406, v408, v410, v397, v422, v424,
                v426,
                v428,
                &v536[8],
                v501);
              v326 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          if (objc_msgSend_isTopOriginal(v325, v320, v321, v322, v323, v324))
            objc_msgSend_addObject_(v527, v429, (uint64_t)v325, v430, v431, v432);
          else
            objc_msgSend_addObject_(v527, v429, (uint64_t)v326, v430, v431, v432);
          objc_msgSend_addObject_(v529, v433, (uint64_t)v326, v434, v435, v436);

          ++v317;
        }
        while (v533 != v317);
        v316 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v437, (uint64_t)&v537, (uint64_t)v544, 16, v438);
        v439 = v516;
        v280 = v516;
        if (!v316)
        {
LABEL_105:
          v280 = v439;

          ++v511;
          goto LABEL_81;
        }
      }
    }
    objc_msgSend_addObject_(v505, v281, (uint64_t)v529, v282, v283, v284);
    objc_msgSend_result(v509, v440, v441, v442, v443, v444);
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v445, v446, v447, v448, v449, v450);
    v451 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v451, v452, v508, v453, v454, v455);
    v456 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v506, v457, (uint64_t)v456, v458, v459, v460);

    if ((objc_msgSend_modifiesOriginalTokens(v515, v461, v462, v463, v464, v465) & 1) == 0
      && (objc_msgSend_isEqualToArray_(v527, v466, (uint64_t)v529, v467, v468, v469) & 1) == 0)
    {
      objc_msgSend_addObject_(v505, v470, (uint64_t)v527, v471, v472, v473);
      objc_msgSend_result(v509, v474, v475, v476, v477, v478);
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v479, v480, v481, v482, v483, v484);
      v485 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v485, v486, v508, v487, v488, v489);
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v506, v491, (uint64_t)v490, v492, v493, v494);

    }
    ++v508;
  }
  objc_msgSend_result(v509, v102, v103, v104, v105, v106);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v495, v496, (uint64_t)v505, (uint64_t)v506, v497, v498);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  if (v509)
    objc_storeStrong(v509 + 3, v499);

  return v509;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternFST, 0);
}

@end
