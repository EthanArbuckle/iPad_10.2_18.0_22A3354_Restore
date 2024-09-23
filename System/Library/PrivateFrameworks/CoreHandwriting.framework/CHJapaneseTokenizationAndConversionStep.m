@implementation CHJapaneseTokenizationAndConversionStep

- (CHJapaneseTokenizationAndConversionStep)initWithMecabra:(id)a3 wordLanguageModel:(void *)a4 ovsStringChecker:(id)a5 promoteKanaConversion:(BOOL)a6
{
  id v10;
  id v11;
  CHJapaneseTokenizationAndConversionStep *v12;
  CHJapaneseTokenizationAndConversionStep *v13;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHJapaneseTokenizationAndConversionStep;
  v12 = -[CHJapaneseTokenizationAndConversionStep init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mecabraWrapper, a3);
    v13->_mecabraContextRef = (__MecabraContext *)MecabraContextCreateMutable();
    v13->_wordLanguageModel = (void *)LMLanguageModelRetain();
    v13->_promoteKanaConversion = a6;
    objc_storeStrong((id *)&v13->_ovsStringChecker, a5);
  }

  return v13;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t LengthForContextString;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
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
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
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
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  unint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSObject *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
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
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t j;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  BOOL v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  id v253;
  id v254;
  id v255;
  id v256;
  const char *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  unint64_t k;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
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
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  BOOL v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
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
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  unint64_t m;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  unint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  char isEqual;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  id *v446;
  id v448;
  void *v449;
  id v450;
  id *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  id v458;
  void *v459;
  void *v460;
  id CandidateFromContextString;
  id v463;
  void *v464;
  id v465;
  void *v466;
  void *v467;
  void *v468;
  unint64_t v469;
  uint64_t v470;
  _QWORD v471[4];
  id v472;
  id v473;
  id v474;
  id v475;
  id v476;
  id v477;
  CHJapaneseTokenizationAndConversionStep *v478;
  id v479;
  uint64_t *v480;
  _QWORD *v481;
  _QWORD *v482;
  uint8_t *v483;
  _QWORD *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t *v487;
  uint64_t v488;
  uint64_t (*v489)(uint64_t, uint64_t);
  void (*v490)(uint64_t);
  id v491;
  uint8_t buf[8];
  uint8_t *v493;
  uint64_t v494;
  uint64_t (*v495)(uint64_t, uint64_t);
  void (*v496)(uint64_t);
  id v497;
  _QWORD v498[3];
  uint64_t v499;
  _QWORD v500[4];
  _QWORD v501[4];
  _QWORD v502[5];
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  _QWORD v507[4];
  id v508;
  _BYTE v509[128];
  uint64_t v510;

  v510 = *MEMORY[0x1E0C80C00];
  v451 = (id *)a3;
  v448 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHJapaneseTokenizationAndConversionStep is running", buf, 2u);
  }

  objc_msgSend_result(v451, v6, v7, v8, v9, v10);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v507[0] = MEMORY[0x1E0C809B0];
  v507[1] = 3221225472;
  v507[2] = sub_1BE8BFF80;
  v507[3] = &unk_1E77F4928;
  v450 = v16;
  v508 = v450;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v468, v17, (uint64_t)v507, v18, v19, v20);
  objc_msgSend_leftContext(v451, v21, v22, v23, v24, v25);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v449, v26, v27, v28, v29, v30))
  {
    objc_msgSend_mecabra(self->_mecabraWrapper, v31, v32, v33, v34, v35);
    LengthForContextString = MecabraGetLengthForContextString();
    v42 = objc_msgSend_length(v449, v37, v38, v39, v40, v41);
    objc_msgSend_substringFromIndex_(v449, v43, v42 - LengthForContextString, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v47, v48, v49, v50, v51, v52))
    {
      objc_msgSend_mecabra(self->_mecabraWrapper, v53, v54, v55, v56, v57);
      CandidateFromContextString = (id)MecabraCreateCandidateFromContextString();
    }
    else
    {
      CandidateFromContextString = 0;
    }

  }
  else
  {
    CandidateFromContextString = 0;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33, v34, v35);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v59, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v450, v65, (uint64_t)v64, v66, v67, v68);
  v460 = (void *)objc_claimAutoreleasedReturnValue();

  v469 = 0;
  v74 = 0;
  while (1)
  {
    v75 = objc_msgSend_count(v460, v69, v70, v71, v72, v73);
    v80 = 0x1E0C99000;
    v81 = v469;
    if (v469 >= v75)
      break;
    objc_msgSend_objectAtIndexedSubscript_(v460, v76, v469, v77, v78, v79);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v82, v83, (uint64_t)CFSTR("␠"), (uint64_t)CFSTR(" "), v84, v85);
    v466 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend_length(v466, v86, v87, v88, v89, v90))
      goto LABEL_40;
    if (v469)
      v91 = 0;
    else
      v91 = (uint64_t)CandidateFromContextString;
    v92 = (void *)objc_opt_class();
    v98 = objc_msgSend_mecabra(self->_mecabraWrapper, v93, v94, v95, v96, v97);
    objc_msgSend_mecabraTokenizationAndKanaConversionForString_mecabraEngine_contextRef_leftCandidateRef_alternativeCandidateLimit_(v92, v99, (uint64_t)v466, v98, (uint64_t)self->_mecabraContextRef, v91, 2);
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v464, v100, v101, v102, v103, v104))
      goto LABEL_22;
    if (qword_1EF568E88 != -1)
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v105 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
        goto LABEL_21;
LABEL_20:
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v105, OS_LOG_TYPE_FAULT, "At least one phrase should be returned in Mecabra tokenization and conversion step.", buf, 2u);
      goto LABEL_21;
    }
    v105 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
      goto LABEL_20;
LABEL_21:

LABEL_22:
    v505 = 0u;
    v506 = 0u;
    v503 = 0u;
    v504 = 0u;
    v106 = v464;
    v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v107, (uint64_t)&v503, (uint64_t)v509, 16, v108);
    if (!v114)
      goto LABEL_39;
    v115 = *(_QWORD *)v504;
    do
    {
      for (i = 0; i != v114; ++i)
      {
        if (*(_QWORD *)v504 != v115)
          objc_enumerationMutation(v106);
        v117 = *(void **)(*((_QWORD *)&v503 + 1) + 8 * i);
        if (!objc_msgSend_count(v117, v109, v110, v111, v112, v113))
        {
          if (qword_1EF568E88 == -1)
          {
            v122 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
              goto LABEL_32;
          }
          else
          {
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v122 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
            {
LABEL_32:
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v122, OS_LOG_TYPE_FAULT, "At least one candidate should be returned for each phrase in Mecabra tokenization and conversion step.", buf, 2u);
            }
          }

        }
        objc_msgSend_addObject_(v58, v118, (uint64_t)v117, v119, v120, v121);
        if (v74)
        {
          v74 = 1;
        }
        else
        {
          objc_msgSend_lastObject(v58, v109, v110, v111, v112, v113);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (unint64_t)objc_msgSend_count(v123, v124, v125, v126, v127, v128) > 1;

        }
      }
      v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v109, (uint64_t)&v503, (uint64_t)v509, 16, v113);
    }
    while (v114);
LABEL_39:

LABEL_40:
    ++v469;
  }
  if (CandidateFromContextString)

  if (v74)
    goto LABEL_48;
  if (objc_msgSend_count(v58, v76, v81, v77, v78, v79))
  {
    *(_QWORD *)buf = 0;
    v493 = buf;
    v494 = 0x2020000000;
    v495 = 0;
    objc_msgSend_transcriptionPaths(v468, v129, v130, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v134, v135, v136, v137, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v468, v141, v142, v143, v144, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v146, v147, v148, v149, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend_length(v152, v153, v154, v155, v156, v157);
    v502[0] = MEMORY[0x1E0C809B0];
    v502[1] = 3221225472;
    v502[2] = sub_1BE8C0068;
    v502[3] = &unk_1E77F46B0;
    v502[4] = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v468, v159, (uint64_t)v140, 0, v158, (uint64_t)v502);

    v80 = 0x1E0C99000uLL;
    v165 = objc_msgSend_count(v58, v160, v161, v162, v163, v164);
    v166 = *((_QWORD *)v493 + 3);
    _Block_object_dispose(buf, 8);
    if (v165 != v166)
    {
LABEL_48:
      objc_msgSend_array(*(void **)(v80 + 3560), v76, v81, v77, v78, v79);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(*(void **)(v80 + 3560), v168, v169, v170, v171, v172);
      v467 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; ; j = v470 + 1)
      {
        objc_msgSend_transcriptionPaths(v468, v173, v174, v175, v176, v177);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        v470 = j;
        v185 = j < objc_msgSend_count(v179, v180, v181, v182, v183, v184);

        if (!v185)
        {
          objc_msgSend_result(v451, v186, v187, v188, v189, v190);
          v441 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v441, v442, (uint64_t)v167, (uint64_t)v467, v443, v444);
          v445 = (void *)objc_claimAutoreleasedReturnValue();
          if (v451)
            objc_storeStrong(v451 + 3, v445);

          break;
        }
        objc_msgSend_transcriptionPaths(v468, v186, v187, v188, v189, v190);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v191, v192, v470, v193, v194, v195);
        v459 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_array(MEMORY[0x1E0C99DE8], v196, v197, v198, v199, v200);
        v457 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v201, v202, v203, v204, v205);
        v456 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v206, v207, v208, v209, v210);
        v455 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v211, v212, v213, v214, v215);
        v453 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v216, v217, v218, v219, v220);
        v452 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v221, v222, v223, v224, v225);
        v454 = (void *)objc_claimAutoreleasedReturnValue();
        v501[0] = 0;
        v501[1] = v501;
        v501[2] = 0x2020000000;
        v501[3] = 0;
        v500[0] = 0;
        v500[1] = v500;
        v500[2] = 0x2020000000;
        v500[3] = 0;
        v498[0] = 0;
        v498[1] = v498;
        v498[2] = 0x2020000000;
        v499 = 0;
        objc_msgSend_objectAtIndexedSubscript_(v58, v226, 0, v227, v228, v229);
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v230, v231, v232, v233, v234, v235);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = objc_msgSend_length(v236, v237, v238, v239, v240, v241);

        v499 = v242;
        *(_QWORD *)buf = 0;
        v493 = buf;
        v494 = 0x3032000000;
        v495 = sub_1BE8A7340;
        v496 = sub_1BE8A7350;
        objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v243, (uint64_t)&stru_1E77F6F28, v244, v245, v246);
        v497 = (id)objc_claimAutoreleasedReturnValue();
        v486 = 0;
        v487 = &v486;
        v488 = 0x3032000000;
        v489 = sub_1BE8A7340;
        v490 = sub_1BE8A7350;
        v491 = 0;
        v252 = objc_msgSend_tokenColumnCount(v468, v247, v248, v249, v250, v251);
        v471[0] = MEMORY[0x1E0C809B0];
        v471[1] = 3221225472;
        v471[2] = sub_1BE8C0080;
        v471[3] = &unk_1E77F6A40;
        v485 = v470;
        v480 = &v486;
        v458 = v455;
        v472 = v458;
        v253 = v454;
        v473 = v253;
        v254 = v452;
        v474 = v254;
        v255 = v457;
        v475 = v255;
        v465 = v453;
        v476 = v465;
        v256 = v456;
        v481 = v500;
        v482 = v498;
        v483 = buf;
        v463 = v256;
        v477 = v256;
        v478 = self;
        v479 = v58;
        v484 = v501;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v468, v257, (uint64_t)v459, 0, v252, (uint64_t)v471);
        if (!v470)
        {
          if (objc_msgSend_count(v458, v258, v259, v260, v261, v262))
          {
            for (k = 0; k < objc_msgSend_count(v253, v263, v264, v265, v266, v267); ++k)
            {
              while (objc_msgSend_count(v254, v269, v270, v271, v272, v273) <= k)
              {
                v279 = (void *)objc_msgSend_mutableCopy(v255, v274, v275, v276, v277, v278);
                objc_msgSend_addObject_(v254, v280, (uint64_t)v279, v281, v282, v283);

              }
              objc_msgSend_objectAtIndexedSubscript_(v253, v274, k, v276, v277, v278);
              v284 = (void *)objc_claimAutoreleasedReturnValue();
              v290 = objc_msgSend_count(v284, v285, v286, v287, v288, v289) == 0;

              if (!v290)
              {
                objc_msgSend_objectAtIndexedSubscript_(v253, v263, k, v265, v266, v267);
                v291 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v254, v292, k, v293, v294, v295);
                v296 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1BE8A313C((uint64_t)CHPostprocessingStep, v291, v465, v296, 0);

              }
            }
            sub_1BE8A313C((uint64_t)CHPostprocessingStep, v458, v465, v255, v463);
          }
          if (!objc_msgSend_count(v463, v263, v264, v265, v266, v267))
          {
            v259 = v487[5];
            if (v259)
              objc_msgSend_addObject_(v463, v258, v259, v260, v261, v262);
          }
        }
        if (self && self->_promoteKanaConversion)
        {
          if (objc_msgSend_count(v255, v258, v259, v260, v261, v262))
          {
            objc_msgSend_addObject_(v167, v297, (uint64_t)v255, v299, v300, v301);
            objc_msgSend_transcriptionPathScores(v468, v302, v303, v304, v305, v306);
            v307 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v307, v308, v470, v309, v310, v311);
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            v318 = (void *)objc_msgSend_copy(v312, v313, v314, v315, v316, v317);
            objc_msgSend_addObject_(v467, v319, (uint64_t)v318, v320, v321, v322);

          }
          if (!objc_msgSend_count(v463, v297, v298, v299, v300, v301)
            || (objc_msgSend_isEqual_(v463, v323, (uint64_t)v255, v325, v326, v327) & 1) != 0)
          {
            goto LABEL_76;
          }
          objc_msgSend_addObject_(v167, v323, (uint64_t)v463, v325, v326, v327);
          objc_msgSend_transcriptionPathScores(v468, v328, v329, v330, v331, v332);
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v333, v334, v470, v335, v336, v337);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          v344 = (void *)objc_msgSend_copy(v338, v339, v340, v341, v342, v343);
          objc_msgSend_addObject_(v467, v345, (uint64_t)v344, v346, v347, v348);
        }
        else
        {
          if (objc_msgSend_count(v463, v258, v259, v260, v261, v262))
          {
            objc_msgSend_addObject_(v167, v349, (uint64_t)v463, v351, v352, v353);
            objc_msgSend_transcriptionPathScores(v468, v354, v355, v356, v357, v358);
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v359, v360, v470, v361, v362, v363);
            v364 = (void *)objc_claimAutoreleasedReturnValue();
            v370 = (void *)objc_msgSend_copy(v364, v365, v366, v367, v368, v369);
            objc_msgSend_addObject_(v467, v371, (uint64_t)v370, v372, v373, v374);

          }
          if (!objc_msgSend_count(v255, v349, v350, v351, v352, v353)
            || (objc_msgSend_isEqual_(v255, v323, (uint64_t)v463, v325, v326, v327) & 1) != 0)
          {
            goto LABEL_76;
          }
          objc_msgSend_addObject_(v167, v323, (uint64_t)v255, v325, v326, v327);
          objc_msgSend_transcriptionPathScores(v468, v375, v376, v377, v378, v379);
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v333, v380, v470, v381, v382, v383);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          v344 = (void *)objc_msgSend_copy(v338, v384, v385, v386, v387, v388);
          objc_msgSend_addObject_(v467, v389, (uint64_t)v344, v390, v391, v392);
        }

LABEL_76:
        for (m = 0; m < objc_msgSend_count(v254, v323, v324, v325, v326, v327); ++m)
        {
          objc_msgSend_objectAtIndexedSubscript_(v254, v394, m, v395, v396, v397);
          v398 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v398, v399, v400, v401, v402, v403))
          {
            v409 = 0;
            while (v409 < objc_msgSend_count(v167, v404, v405, v406, v407, v408))
            {
              objc_msgSend_objectAtIndexedSubscript_(v167, v410, v409, v411, v412, v413);
              v414 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v398, v415, (uint64_t)v414, v416, v417, v418);

              ++v409;
              if ((isEqual & 1) != 0)
                goto LABEL_84;
            }
            objc_msgSend_addObject_(v167, v410, (uint64_t)v398, v411, v412, v413);
            objc_msgSend_transcriptionPathScores(v468, v420, v421, v422, v423, v424);
            v425 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v425, v426, v470, v427, v428, v429);
            v430 = (void *)objc_claimAutoreleasedReturnValue();
            v436 = (void *)objc_msgSend_copy(v430, v431, v432, v433, v434, v435);
            objc_msgSend_addObject_(v467, v437, (uint64_t)v436, v438, v439, v440);

          }
LABEL_84:

        }
        _Block_object_dispose(&v486, 8);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v498, 8);
        _Block_object_dispose(v500, 8);
        _Block_object_dispose(v501, 8);

      }
    }
  }
  v446 = v451;

  return v446;
}

- (void)dealloc
{
  CHMecabraWrapper *mecabraWrapper;
  objc_super v4;

  if (self->_mecabraContextRef)
  {
    MecabraContextRelease();
    self->_mecabraContextRef = 0;
  }
  if (self->_wordLanguageModel)
    LMLanguageModelRelease();
  mecabraWrapper = self->_mecabraWrapper;
  self->_mecabraWrapper = 0;

  v4.receiver = self;
  v4.super_class = (Class)CHJapaneseTokenizationAndConversionStep;
  -[CHJapaneseTokenizationAndConversionStep dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
