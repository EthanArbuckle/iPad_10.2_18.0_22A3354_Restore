@implementation CHSpellCorrectionCandidatesStep

- (CHSpellCorrectionCandidatesStep)initWithLocale:(id)a3 spellChecker:(id)a4 staticLexicon:(_LXLexicon *)a5 customLexicon:(_LXLexicon *)a6
{
  id v11;
  id v12;
  CHSpellCorrectionCandidatesStep *v13;
  CHSpellCorrectionCandidatesStep *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHSpellCorrectionCandidatesStep;
  v13 = -[CHSpellCorrectionCandidatesStep init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_locale, a3);
    objc_storeStrong((id *)&v14->_spellChecker, a4);
    v14->_staticLexicon = a5;
    v14->_customLexicon = a6;
  }

  return v14;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
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
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  NSLocale *locale;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  CHSpellChecker *spellChecker;
  void *v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  CHTokenizedTextResultToken *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  double v171;
  double v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  double v178;
  double v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  double v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  double v192;
  double v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  id v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  CHTokenizedTextResultToken *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
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
  double v292;
  double v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  double v299;
  double v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  double v306;
  double v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  double v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
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
  void *v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  id v382;
  const char *v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t k;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  void *v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  unint64_t m;
  void *v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  BOOL v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  id v474;
  const char *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
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
  uint64_t v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  void *v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  void *v505;
  id v507;
  unint64_t i;
  void *v509;
  void *v510;
  id *v511;
  double v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  double v516;
  double v517;
  double v518;
  double v519;
  double v520;
  double v521;
  double v522;
  void *v523;
  id obj;
  void *v525;
  void *v526;
  uint64_t j;
  void *v529;
  _QWORD v530[4];
  id v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  uint8_t buf[8];
  _BYTE v549[128];
  _BYTE v550[128];
  uint64_t v551;

  v551 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v507 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v511 = v5;
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHSpellCorrectionCandidatesStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v17, v18, v19, v20, v21);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25, v26);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v525, v33, (uint64_t)v32, v34, v35, v36);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v525, v43, (uint64_t)v42, v44, v45, v46);

  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v511, v47, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = i < objc_msgSend_tokenColumnCount(v52, v53, v54, v55, v56, v57);

    if (!v58)
      break;
    objc_msgSend_result(v511, v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v511, v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v70, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v76, v77, 0, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v64, v82, (uint64_t)v81, i, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v546 = 0u;
    v547 = 0u;
    v544 = 0u;
    v545 = 0u;
    obj = v85;
    v514 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v544, (uint64_t)v550, 16, v87);
    if (v514)
    {
      v513 = *(_QWORD *)v545;
      do
      {
        for (j = 0; j != v514; ++j)
        {
          if (*(_QWORD *)v545 != v513)
            objc_enumerationMutation(obj);
          v92 = *(void **)(*((_QWORD *)&v544 + 1) + 8 * j);
          objc_msgSend_addObject_(v515, v88, (uint64_t)v92, v89, v90, v91);
          locale = self->_locale;
          objc_msgSend_string(v92, v94, v95, v96, v97, v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_spellCheckingLocaleForRecognitionLocale_string_(CHRecognizerConfiguration, v100, (uint64_t)locale, (uint64_t)v99, v101, v102);
          v526 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_array(MEMORY[0x1E0C99DE8], v103, v104, v105, v106, v107);
          v529 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(obj, v108, v109, v110, v111, v112) == 1
            && (objc_msgSend_properties(v92, v113, v114, v115, v116, v117) & 4) == 0)
          {
            spellChecker = self->_spellChecker;
            objc_msgSend_string(v92, v118, v119, v120, v121, v122);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topCorrectionsForRecognition_contextBeforeToken_contextSeparator_shouldUseErrorModel_forLocale_minScore_(spellChecker, v125, (uint64_t)v124, (uint64_t)&stru_1E77F6F28, (uint64_t)&stru_1E77F6F28, 1, v526, -0.351);
            v126 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_addObjectsFromArray_(v529, v127, (uint64_t)v126, v128, v129, v130);
          }
          v131 = v92;
          v141 = v131;
          if (objc_msgSend_count(v529, v132, v133, v134, v135, v136))
          {
            objc_msgSend_objectAtIndexedSubscript_(v529, v137, 0, v138, v139, v140);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v151 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v143, (uint64_t)v142, (uint64_t)self->_customLexicon, v144, v145);
            if (!(_DWORD)v151)
              v151 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v146, (uint64_t)v142, (uint64_t)self->_staticLexicon, v149, v150);
            v152 = objc_msgSend_properties(v131, v146, v147, v148, v149, v150);
            buf[0] = 0;
            if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v153, (uint64_t)v142, (uint64_t)self->_staticLexicon, (uint64_t)buf, v154) & 1) != 0|| objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v155, (uint64_t)v142, (uint64_t)self->_customLexicon, (uint64_t)buf, v156))
            {
              v157 = 260;
              if (!buf[0])
                v157 = 4;
              v158 = v157 | v152;
            }
            else
            {
              v158 = v152 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v159 = [CHTokenizedTextResultToken alloc];
            objc_msgSend_strokeIndexes(v131, v160, v161, v162, v163, v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_modelScore(v131, v166, v167, v168, v169, v170);
            v172 = v171;
            objc_msgSend_recognitionScore(v131, v173, v174, v175, v176, v177);
            v179 = v178;
            objc_msgSend_combinedScore(v131, v180, v181, v182, v183, v184);
            v186 = v185;
            objc_msgSend_alignmentScore(v131, v187, v188, v189, v190, v191);
            v193 = v192;
            objc_msgSend_recognizerSourceLocale(v131, v194, v195, v196, v197, v198);
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            v520 = v193;
            v522 = v172;
            v205 = objc_msgSend_inputSources(v131, v200, v201, v202, v203, v204);
            v211 = objc_msgSend_substrokeCount(v131, v206, v207, v208, v209, v210);
            objc_msgSend_bounds(v131, v212, v213, v214, v215, v216);
            v516 = v218;
            v518 = v217;
            v220 = v219;
            v222 = v221;
            objc_msgSend_originalBounds(v131, v223, v224, v225, v226, v227);
            v234 = v233;
            v236 = v235;
            v238 = v237;
            v240 = v239;
            if (v92)
            {
              objc_msgSend_principalLines(v131, v228, v229, v230, v231, v232);
            }
            else
            {
              v542 = 0u;
              v543 = 0u;
              v540 = 0u;
              v541 = 0u;
              v538 = 0u;
              v539 = 0u;
              v536 = 0u;
              v537 = 0u;
            }
            v141 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v159, v228, (uint64_t)v142, (uint64_t)v165, v151, v158, v199, v205 | 0x20, v522, v179 * 0.5, v186 * 0.5, v520, v518, v516, v220, v222, v211, v234, v236,
                             v238,
                             v240,
                             &v536);

          }
          objc_msgSend_objectAtIndexedSubscript_(v525, v137, 0, v138, v139, v140);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v241, v242, (uint64_t)v141, v243, v244, v245);

          v246 = v131;
          if ((unint64_t)objc_msgSend_count(v529, v247, v248, v249, v250, v251) >= 2)
          {
            objc_msgSend_objectAtIndexedSubscript_(v529, v252, 1, v253, v254, v255);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            v523 = v92;
            v265 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v257, (uint64_t)v256, (uint64_t)self->_customLexicon, v258, v259);
            if (!(_DWORD)v265)
              v265 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v260, (uint64_t)v256, (uint64_t)self->_staticLexicon, v263, v264);
            v266 = objc_msgSend_properties(v246, v260, v261, v262, v263, v264);
            buf[0] = 0;
            if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v267, (uint64_t)v256, (uint64_t)self->_staticLexicon, (uint64_t)buf, v268) & 1) != 0|| (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v269, (uint64_t)v256, (uint64_t)self->_customLexicon, (uint64_t)buf, v270) & 1) != 0)
            {
              v271 = 260;
              if (!buf[0])
                v271 = 4;
              v272 = v271 | v266;
            }
            else
            {
              v272 = v266 & 0xFFFFFFFFFFFFFEFBLL;
            }
            v273 = [CHTokenizedTextResultToken alloc];
            objc_msgSend_strokeIndexes(v246, v274, v275, v276, v277, v278);
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_modelScore(v246, v280, v281, v282, v283, v284);
            v286 = v285;
            objc_msgSend_recognitionScore(v246, v287, v288, v289, v290, v291);
            v293 = v292;
            objc_msgSend_combinedScore(v246, v294, v295, v296, v297, v298);
            v300 = v299;
            objc_msgSend_alignmentScore(v246, v301, v302, v303, v304, v305);
            v307 = v306;
            objc_msgSend_recognizerSourceLocale(v246, v308, v309, v310, v311, v312);
            v313 = (void *)objc_claimAutoreleasedReturnValue();
            v519 = v307;
            v521 = v286;
            v319 = objc_msgSend_inputSources(v246, v314, v315, v316, v317, v318);
            v325 = objc_msgSend_substrokeCount(v246, v320, v321, v322, v323, v324);
            objc_msgSend_bounds(v246, v326, v327, v328, v329, v330);
            v517 = v331;
            v512 = v332;
            v334 = v333;
            v336 = v335;
            objc_msgSend_originalBounds(v246, v337, v338, v339, v340, v341);
            v348 = v347;
            v350 = v349;
            v352 = v351;
            v354 = v353;
            if (v523)
            {
              objc_msgSend_principalLines(v246, v342, v343, v344, v345, v346);
            }
            else
            {
              v542 = 0u;
              v543 = 0u;
              v540 = 0u;
              v541 = 0u;
              v538 = 0u;
              v539 = 0u;
              v536 = 0u;
              v537 = 0u;
            }
            v355 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v273, v342, (uint64_t)v256, (uint64_t)v279, v265, v272, v313, v319 | 0x20, v521, v293 * 0.5, v300 * 0.5, v519, v334, v517, v512, v336, v325, v348, v350,
                     v352,
                     v354,
                     &v536);

            v246 = (id)v355;
          }
          objc_msgSend_objectAtIndexedSubscript_(v525, v252, 1, v253, v254, v255);
          v356 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v356, v357, (uint64_t)v246, v358, v359, v360);

        }
        v514 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v88, (uint64_t)&v544, (uint64_t)v550, 16, v91);
      }
      while (v514);
    }

  }
  objc_msgSend_addObject_(v509, v59, (uint64_t)v515, v61, v62, v63);
  objc_msgSend_result(v511, v361, v362, v363, v364, v365);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPathScores(v366, v367, v368, v369, v370, v371);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v372, v373, 0, v374, v375, v376);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v510, v378, (uint64_t)v377, v379, v380, v381);

  v534 = 0u;
  v535 = 0u;
  v532 = 0u;
  v533 = 0u;
  v382 = v525;
  v389 = objc_msgSend_countByEnumeratingWithState_objects_count_(v382, v383, (uint64_t)&v532, (uint64_t)v549, 16, v384);
  if (v389)
  {
    v390 = *(_QWORD *)v533;
    do
    {
      for (k = 0; k != v389; ++k)
      {
        if (*(_QWORD *)v533 != v390)
          objc_enumerationMutation(v382);
        v392 = *(void **)(*((_QWORD *)&v532 + 1) + 8 * k);
        if ((objc_msgSend_isEqual_(v392, v385, (uint64_t)v515, v386, v387, v388) & 1) == 0)
        {
          objc_msgSend_addObject_(v509, v385, (uint64_t)v392, v386, v387, v388);
          objc_msgSend_result(v511, v393, v394, v395, v396, v397);
          v398 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transcriptionPathScores(v398, v399, v400, v401, v402, v403);
          v404 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v404, v405, 0, v406, v407, v408);
          v409 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v510, v410, (uint64_t)v409, v411, v412, v413);

        }
      }
      v389 = objc_msgSend_countByEnumeratingWithState_objects_count_(v382, v385, (uint64_t)&v532, (uint64_t)v549, 16, v388);
    }
    while (v389);
  }

  for (m = 1; ; ++m)
  {
    objc_msgSend_result(v511, v414, v415, v416, v417, v418);
    v420 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v420, v421, v422, v423, v424, v425);
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    v432 = m < objc_msgSend_count(v426, v427, v428, v429, v430, v431);

    if (!v432)
      break;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v433, v434, v435, v436, v437);
    v438 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v511, v439, v440, v441, v442, v443);
    v444 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v511, v445, v446, v447, v448, v449);
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v450, v451, v452, v453, v454, v455);
    v456 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v456, v457, m, v458, v459, v460);
    v461 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v511, v462, v463, v464, v465, v466);
    v467 = (void *)objc_claimAutoreleasedReturnValue();
    v473 = objc_msgSend_tokenColumnCount(v467, v468, v469, v470, v471, v472);
    v530[0] = MEMORY[0x1E0C809B0];
    v530[1] = 3221225472;
    v530[2] = sub_1BE8AB27C;
    v530[3] = &unk_1E77F4928;
    v474 = v438;
    v531 = v474;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v444, v475, (uint64_t)v461, 0, v473, (uint64_t)v530);

    objc_msgSend_addObject_(v509, v476, (uint64_t)v474, v477, v478, v479);
    objc_msgSend_result(v511, v480, v481, v482, v483, v484);
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v485, v486, v487, v488, v489, v490);
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v491, v492, m, v493, v494, v495);
    v496 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v510, v497, (uint64_t)v496, v498, v499, v500);

  }
  objc_msgSend_result(v511, v433, v434, v435, v436, v437);
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v501, v502, (uint64_t)v509, (uint64_t)v510, v503, v504);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  if (v511)
    objc_storeStrong(v511 + 3, v505);

  return v511;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
