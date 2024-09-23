@implementation CHTextToMathResultTransformationStep

- (CHTextToMathResultTransformationStep)initWithAdditionalMathRecognitionBlock:(id)a3
{
  id v4;
  CHTextToMathResultTransformationStep *v5;
  uint64_t v6;
  id additionalMathRecognitionBlock;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *numericalSymbols;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CHTextToMathResultTransformationStep;
  v5 = -[CHTextToMathResultTransformationStep init](&v21, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1C3B81A84](v4);
    additionalMathRecognitionBlock = v5->_additionalMathRecognitionBlock;
    v5->_additionalMathRecognitionBlock = (id)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_componentsSeparatedByString_(CFSTR("0 1 2 3 4 5 6 7 8 9 . , '"), v9, (uint64_t)CFSTR(" "), v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v8, v14, (uint64_t)v13, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    numericalSymbols = v5->_numericalSymbols;
    v5->_numericalSymbols = (NSSet *)v18;

  }
  return v5;
}

- (id)process:(id)a3 options:(id)a4
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
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
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  char isTextTranscriptionUnitConversion_locales;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  __CFString *v116;
  __CFString *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  BOOL v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
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
  int hasSuffix;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  id v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  id v179;
  const char *v180;
  void *v181;
  id v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
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
  CHTokenizedMathResultToken *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  double v223;
  double v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  double v232;
  double v233;
  double v234;
  double v235;
  id v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  CHTokenizedMathResultToken *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  double v259;
  double v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  double v268;
  double v269;
  double v270;
  double v271;
  id v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  int v277;
  CHTokenizedMathResultToken *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  int isEqualToString;
  CHTokenizedMathResultToken *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  double v318;
  double v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  double v327;
  double v328;
  double v329;
  double v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  NSObject *v335;
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
  CHTokenizedMathResultToken *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  double v359;
  double v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  double v368;
  double v369;
  double v370;
  double v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  int v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  NSObject *v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  CHTokenizedMathResultToken *v398;
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
  uint64_t v409;
  double v410;
  double v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  double v419;
  double v420;
  double v421;
  double v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  CHTokenizedMathResultToken *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  CHTokenizedMathResult *v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  void *v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  void *v459;
  CHStrokeGroupRecognitionResult *v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  void *v490;
  const char *v491;
  void *v492;
  void *v493;
  id v494;
  void *v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  void *v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  NSObject *v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  void *v522;
  const char *v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  void *v534;
  uint64_t v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  void *v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  void *v551;
  const char *v552;
  uint64_t v553;
  uint64_t v554;
  int v555;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  id v560;
  id obj;
  id v562;
  void *v563;
  uint64_t v564;
  uint64_t v565;
  void *v566;
  _QWORD *v567;
  id v568;
  uint64_t v569;
  void *v570;
  void *v572;
  id v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  id v578;
  id v579;
  id v580;
  id v581;
  _QWORD v582[4];
  id v583;
  uint8_t v584[128];
  _BYTE buf[24];
  void *v586;
  CHTextToMathResultTransformationStep *v587;
  id v588;
  uint64_t v589;

  v589 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v574 = 0u;
  v575 = 0u;
  v576 = 0u;
  v577 = 0u;
  if (v4)
    v6 = (void *)v4[6];
  else
    v6 = 0;
  obj = v6;
  v565 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v574, (uint64_t)v584, 16, v8);
  if (v565)
  {
    v564 = *(_QWORD *)v575;
    v567 = v5;
    do
    {
      v569 = 0;
      do
      {
        if (*(_QWORD *)v575 != v564)
          objc_enumerationMutation(obj);
        if (v5)
          v9 = (void *)v5[7];
        else
          v9 = 0;
        v10 = *(void **)(*((_QWORD *)&v574 + 1) + 8 * v569);
        v11 = v9;
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v566 = v10;
        v18 = objc_msgSend_uniqueIdentifier(v10, v13, v14, v15, v16, v17);
        objc_msgSend_numberWithInteger_(v12, v19, v18, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v11, v24, (uint64_t)v23, v25, v26, v27);
        v570 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_mathResult(v570, v28, v29, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          goto LABEL_62;
        objc_msgSend_preferredLocale(v570, v34, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39 == 0;

        if (v40)
          goto LABEL_63;
        objc_msgSend_recognitionResultsByLocale(v570, v41, v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_preferredLocale(v570, v47, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v46, v53, (uint64_t)v52, v54, v55, v56);
        v562 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend_topTranscription(v562, v57, v58, v59, v60, v61);
        v563 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedLocales(v570, v62, v63, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        isTextTranscriptionUnitConversion_locales = objc_msgSend_isTextTranscriptionUnitConversion_locales_(CHTokenizedTextResult, v68, (uint64_t)v563, (uint64_t)v67, v69, v70);

        if ((isTextTranscriptionUnitConversion_locales & 1) != 0)
          goto LABEL_13;
        if (objc_msgSend_hasSuffix_(v563, v72, (uint64_t)CFSTR("二"), v74, v75, v76))
        {
          v534 = (void *)MEMORY[0x1E0CB3940];
          v535 = objc_msgSend_length(v563, v529, v530, v531, v532, v533);
          objc_msgSend_substringToIndex_(v563, v536, v535 - 1, v537, v538, v539);
          v540 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v534, v541, (uint64_t)CFSTR("%@="), v542, v543, v544, v540);
          v545 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_orderedLocales(v570, v546, v547, v548, v549, v550);
          v551 = (void *)objc_claimAutoreleasedReturnValue();
          v555 = objc_msgSend_isTextTranscriptionUnitConversion_locales_(CHTokenizedTextResult, v552, (uint64_t)v545, (uint64_t)v551, v553, v554);

          if (v555)
          {
LABEL_13:
            objc_msgSend_inputStrokeIdentifiers(v570, v72, v73, v74, v75, v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v560 = v562;
            v568 = v77;
            if (!self)
            {
              v459 = 0;
LABEL_52:

              v460 = [CHStrokeGroupRecognitionResult alloc];
              objc_msgSend_orderedLocales(v570, v461, v462, v463, v464, v465);
              v466 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recognitionResultsByLocale(v570, v467, v468, v469, v470, v471);
              v472 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorsByLocale(v570, v473, v474, v475, v476, v477);
              v478 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_languageFitnessByLocale(v570, v479, v480, v481, v482, v483);
              v484 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_inputStrokeIdentifiers(v570, v485, v486, v487, v488, v489);
              v490 = (void *)objc_claimAutoreleasedReturnValue();
              v492 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v460, v491, (uint64_t)v466, (uint64_t)v472, (uint64_t)v478, (uint64_t)v484, v459, v490);

              if (v567)
                v493 = (void *)v567[7];
              else
                v493 = 0;
              v494 = v493;
              v495 = (void *)MEMORY[0x1E0CB37E8];
              v501 = objc_msgSend_uniqueIdentifier(v566, v496, v497, v498, v499, v500);
              objc_msgSend_numberWithInteger_(v495, v502, v501, v503, v504, v505);
              v506 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v494, v507, (uint64_t)v492, (uint64_t)v506, v508, v509);

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v510 = (id)qword_1EF568E30;
              if (os_log_type_enabled(v510, OS_LOG_TYPE_DEBUG))
              {
                v516 = objc_msgSend_uniqueIdentifier(v566, v511, v512, v513, v514, v515);
                objc_msgSend_strokeIdentifiers(v566, v517, v518, v519, v520, v521);
                v522 = (void *)objc_claimAutoreleasedReturnValue();
                v528 = objc_msgSend_count(v522, v523, v524, v525, v526, v527);
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v516;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v528;
                _os_log_impl(&dword_1BE607000, v510, OS_LOG_TYPE_DEBUG, "CHTextToMathResultTransformationStep transformed text stroke group %lu with %lu strokes into math.", buf, 0x16u);

              }
              goto LABEL_61;
            }
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v78, v79, v80, v81, v82);
            v572 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v83, v84, v85, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v582[0] = MEMORY[0x1E0C809B0];
            v582[1] = 3221225472;
            v582[2] = sub_1BE8107D0;
            v582[3] = &unk_1E77F4928;
            v573 = v88;
            v583 = v573;
            objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v560, v89, (uint64_t)v582, v90, v91, v92);
            v98 = 0;
            while (2)
            {
              if (v98 >= objc_msgSend_count(v573, v93, v94, v95, v96, v97))
              {
                v450 = [CHTokenizedMathResult alloc];
                *(_QWORD *)buf = v572;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v451, (uint64_t)buf, 1, v452, v453);
                v454 = (void *)objc_claimAutoreleasedReturnValue();
                v459 = (void *)objc_msgSend_initWithBestPathTokens_(v450, v455, (uint64_t)v454, v456, v457, v458);

                goto LABEL_52;
              }
              objc_msgSend_objectAtIndexedSubscript_(v573, v99, v98, v100, v101, v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v104, v105, v106, v107, v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = objc_msgSend_properties(v103, v110, v111, v112, v113, v114);
              v116 = CFSTR("\\");
              if ((v115 & 0x20) == 0)
                v116 = &stru_1E77F6F28;
              v117 = v116;
              objc_msgSend_lastObject(v572, v118, v119, v120, v121, v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v129 = (objc_msgSend_properties(v123, v124, v125, v126, v127, v128) & 0x400000) == 0;

              if (!v129)
              {

                v117 = CFSTR("\\,");
              }
              if (v98 == objc_msgSend_count(v573, v130, v131, v132, v133, v134) - 1)
              {
                objc_msgSend_string(v103, v135, v136, v137, v138, v139);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_hasSuffix_(v140, v141, (uint64_t)CFSTR("="), v142, v143, v144))
                {

                  goto LABEL_24;
                }
                objc_msgSend_string(v103, v145, v146, v147, v148, v149);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                hasSuffix = objc_msgSend_hasSuffix_(v150, v151, (uint64_t)CFSTR("二"), v152, v153, v154);

                if (hasSuffix)
                {
LABEL_24:
                  objc_msgSend_string(v103, v135, v136, v137, v138, v139);
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_isEqualToString_(v156, v157, (uint64_t)CFSTR("="), v158, v159, v160))
                  {

                    goto LABEL_33;
                  }
                  objc_msgSend_string(v103, v161, v162, v163, v164, v165);
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqualToString = objc_msgSend_isEqualToString_(v300, v301, (uint64_t)CFSTR("二"), v302, v303, v304);

                  if (isEqualToString)
                  {
LABEL_33:
                    v306 = [CHTokenizedMathResultToken alloc];
                    objc_msgSend_strokeIndexes(v103, v307, v308, v309, v310, v311);
                    v312 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recognitionScore(v103, v313, v314, v315, v316, v317);
                    v319 = v318;
                    objc_msgSend_originalBounds(v103, v320, v321, v322, v323, v324);
                    v182 = (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v306, v325, (uint64_t)CFSTR("="), (uint64_t)v312, 0x40000, v326, v319, v327, v328, v329, v330);

                    objc_msgSend_addObject_(v109, v331, (uint64_t)v182, v332, v333, v334);
                    v236 = v117;
                    v117 = &stru_1E77F6F28;
                    goto LABEL_48;
                  }
                  v580 = 0;
                  v581 = 0;
                  v377 = sub_1BE8107DC((uint64_t)self, v103, &v581, &v580, 0, CFSTR("="), v568);
                  v182 = v581;
                  v236 = v580;
                  if (v377)
                  {
                    objc_msgSend_addObject_(v109, v378, (uint64_t)v236, v379, v380, v381);
                    objc_msgSend_addObject_(v109, v382, (uint64_t)v182, v383, v384, v385);
                    goto LABEL_48;
                  }
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v386 = (id)qword_1EF568E30;
                  if (os_log_type_enabled(v386, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v98;
                    _os_log_impl(&dword_1BE607000, v386, OS_LOG_TYPE_DEBUG, "CHTextToMathResultTransformationStep failed to split text token at index %lu.", buf, 0xCu);
                  }

                  v387 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend_string(v103, v388, v389, v390, v391, v392);
                  v393 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v387, v394, (uint64_t)CFSTR("\\text{%@}"), v395, v396, v397, v393);
                  v272 = (id)objc_claimAutoreleasedReturnValue();

                  v398 = [CHTokenizedMathResultToken alloc];
                  objc_msgSend_strokeIndexes(v103, v399, v400, v401, v402, v403);
                  v404 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_recognitionScore(v103, v405, v406, v407, v408, v409);
                  v411 = v410;
                  objc_msgSend_originalBounds(v103, v412, v413, v414, v415, v416);
                  v287 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v398, v417, (uint64_t)v272, (uint64_t)v404, 0x800000, v418, v411, v419, v420, v421, v422);

                  objc_msgSend_addObject_(v109, v423, (uint64_t)v287, v424, v425, v426);
                  goto LABEL_46;
                }
              }
              objc_msgSend_string(v103, v135, v136, v137, v138, v139);
              v166 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend_string(MEMORY[0x1E0CB37A0], v167, v168, v169, v170, v171);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              v178 = objc_msgSend_length(v166, v173, v174, v175, v176, v177);
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = sub_1BE8112D8;
              v586 = &unk_1E77F50F0;
              v587 = self;
              v179 = v172;
              v588 = v179;
              objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v166, v180, 0, v178, 2, (uint64_t)buf);
              v181 = v588;
              v182 = v179;

              if (objc_msgSend_length(v182, v183, v184, v185, v186, v187))
              {
                v193 = objc_msgSend_length(v182, v188, v189, v190, v191, v192);
                objc_msgSend_string(v103, v194, v195, v196, v197, v198);
                v199 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v193) = v193 == objc_msgSend_length(v199, v200, v201, v202, v203, v204);

                if ((_DWORD)v193)
                {
                  v205 = [CHTokenizedMathResultToken alloc];
                  objc_msgSend_string(v103, v206, v207, v208, v209, v210);
                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeIndexes(v103, v212, v213, v214, v215, v216);
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_recognitionScore(v103, v218, v219, v220, v221, v222);
                  v224 = v223;
                  objc_msgSend_originalBounds(v103, v225, v226, v227, v228, v229);
                  v236 = (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v205, v230, (uint64_t)v211, (uint64_t)v217, 0x400000, v231, v224, v232, v233, v234, v235);

                  objc_msgSend_addObject_(v109, v237, (uint64_t)v236, v238, v239, v240);
LABEL_48:

                  if (objc_msgSend_length(v117, v427, v428, v429, v430, v431))
                  {
                    v436 = [CHTokenizedMathResultToken alloc];
                    objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v437, v438, v439, v440, v441);
                    v442 = (void *)objc_claimAutoreleasedReturnValue();
                    v445 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v436, v443, (uint64_t)v117, (uint64_t)v442, 0x2000, v444, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

                    objc_msgSend_addObject_(v572, v446, (uint64_t)v445, v447, v448, v449);
                  }
                  objc_msgSend_addObjectsFromArray_(v572, v432, (uint64_t)v109, v433, v434, v435);

                  ++v98;
                  continue;
                }
                v578 = 0;
                v579 = 0;
                v277 = sub_1BE8107DC((uint64_t)self, v103, &v579, &v578, v182, 0, v568);
                v236 = v579;
                v272 = v578;
                if (v277)
                {
                  v278 = [CHTokenizedMathResultToken alloc];
                  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v279, v280, v281, v282, v283);
                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                  v287 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v278, v285, (uint64_t)CFSTR("\\,"), (uint64_t)v284, 0x2000, v286, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

                  objc_msgSend_addObject_(v109, v288, (uint64_t)v236, v289, v290, v291);
                  objc_msgSend_addObject_(v109, v292, (uint64_t)v287, v293, v294, v295);
                  objc_msgSend_addObject_(v109, v296, (uint64_t)v272, v297, v298, v299);
                }
                else
                {
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v335 = (id)qword_1EF568E30;
                  if (os_log_type_enabled(v335, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v98;
                    _os_log_impl(&dword_1BE607000, v335, OS_LOG_TYPE_DEBUG, "CHTextToMathResultTransformationStep failed to split text token at index %lu.", buf, 0xCu);
                  }

                  v336 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend_string(v103, v337, v338, v339, v340, v341);
                  v342 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v336, v343, (uint64_t)CFSTR("\\text{%@}"), v344, v345, v346, v342);
                  v287 = (void *)objc_claimAutoreleasedReturnValue();

                  v347 = [CHTokenizedMathResultToken alloc];
                  objc_msgSend_strokeIndexes(v103, v348, v349, v350, v351, v352);
                  v353 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_recognitionScore(v103, v354, v355, v356, v357, v358);
                  v360 = v359;
                  objc_msgSend_originalBounds(v103, v361, v362, v363, v364, v365);
                  v372 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v347, v366, (uint64_t)v287, (uint64_t)v353, 0x800000, v367, v360, v368, v369, v370, v371);

                  objc_msgSend_addObject_(v109, v373, (uint64_t)v372, v374, v375, v376);
                }
LABEL_46:

              }
              else
              {
                v241 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend_string(v103, v188, v189, v190, v191, v192);
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v241, v243, (uint64_t)CFSTR("\\text{%@}"), v244, v245, v246, v242);
                v236 = (id)objc_claimAutoreleasedReturnValue();

                v247 = [CHTokenizedMathResultToken alloc];
                objc_msgSend_strokeIndexes(v103, v248, v249, v250, v251, v252);
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recognitionScore(v103, v254, v255, v256, v257, v258);
                v260 = v259;
                objc_msgSend_originalBounds(v103, v261, v262, v263, v264, v265);
                v272 = (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v247, v266, (uint64_t)v236, (uint64_t)v253, 0x800000, v267, v260, v268, v269, v270, v271);

                objc_msgSend_addObject_(v109, v273, (uint64_t)v272, v274, v275, v276);
              }
              break;
            }

            goto LABEL_48;
          }
        }
LABEL_61:

        v33 = v562;
LABEL_62:

LABEL_63:
        ++v569;
        v5 = v567;
      }
      while (v569 != v565);
      v558 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v556, (uint64_t)&v574, (uint64_t)v584, 16, v557);
      v565 = v558;
    }
    while (v558);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericalSymbols, 0);
  objc_storeStrong(&self->_additionalMathRecognitionBlock, 0);
}

@end
