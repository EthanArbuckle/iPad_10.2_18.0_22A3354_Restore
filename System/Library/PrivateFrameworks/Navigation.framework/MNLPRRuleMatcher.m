@implementation MNLPRRuleMatcher

- (id)initForVehicle:(id)a3 withRules:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNLPRRuleMatcher;
  -[MNLPRRuleMatcher self](&v14, sel_self);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[1];
    v8[1] = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v8[2];
    v8[2] = v11;

  }
  return v8;
}

- (id)generateMaskedPlateForWaypoints:(id)a3 date:(id)a4 timeZone:(id)a5 error:(id *)a6
{
  NSObject *v9;
  _MNLPRPlate *lastPlate;
  NSDictionary *usedRegions;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t signpost;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  _MNLPRPlateCharacter *v42;
  id v43;
  MNLPRRuleMatcher *v44;
  NSMutableOrderedSet *valueMappings;
  uint64_t v46;
  NSMutableDictionary *fillTypes;
  _MNLPRPlate *v48;
  id v49;
  uint64_t v50;
  GEOLPRVehicle *vehicle;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  os_signpost_id_t v65;
  NSObject *v66;
  NSObject *v67;
  os_signpost_id_t v68;
  NSObject *v69;
  NSObject *v70;
  os_signpost_id_t v71;
  NSObject *v72;
  NSObject *v73;
  os_signpost_id_t v74;
  double v75;
  double v76;
  void *v77;
  NSArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  os_signpost_id_t v85;
  int v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  NSObject *v95;
  os_signpost_id_t v96;
  uint64_t v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  NSObject *v103;
  os_signpost_id_t v104;
  GEOLPRVehicle *v105;
  id *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  NSObject *v112;
  os_signpost_id_t v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t n;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  NSObject *v121;
  os_signpost_id_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  NSObject *v128;
  os_signpost_id_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t jj;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  _BOOL4 v144;
  void *v145;
  void *v146;
  NSObject *v147;
  NSObject *v148;
  os_signpost_id_t v149;
  NSObject *v150;
  NSObject *v151;
  os_signpost_id_t v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t mm;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  _BOOL4 v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  NSObject *v173;
  NSObject *v174;
  os_signpost_id_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t nn;
  NSObject *v179;
  uint64_t v180;
  void *v181;
  __CFString *v182;
  __CFString *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t i1;
  void *v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t i2;
  NSObject *v194;
  NSObject *v195;
  os_signpost_id_t v196;
  int v197;
  int v198;
  int v199;
  void *v200;
  NSObject *v201;
  NSObject *v202;
  os_signpost_id_t v203;
  int v204;
  NSObject *v205;
  NSObject *v206;
  os_signpost_id_t v207;
  NSObject *v208;
  NSObject *v209;
  os_signpost_id_t v210;
  NSObject *v211;
  os_signpost_id_t v212;
  uint64_t v213;
  NSObject *v214;
  NSObject *v215;
  os_signpost_id_t v216;
  int v217;
  int v218;
  int v219;
  void *v220;
  NSObject *v221;
  NSObject *v222;
  os_signpost_id_t v223;
  int v224;
  void *v225;
  NSObject *v226;
  NSObject *v227;
  os_signpost_id_t v228;
  int v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  NSObject *v234;
  NSObject *v235;
  os_signpost_id_t v236;
  uint64_t v237;
  uint64_t i3;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t i4;
  _BYTE *v248;
  NSObject *v249;
  NSObject *v250;
  os_signpost_id_t v251;
  NSObject *v252;
  NSObject *v253;
  os_signpost_id_t v254;
  id v255;
  uint64_t v256;
  char *v257;
  void *v258;
  void *v259;
  id *v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t i5;
  void *v265;
  void *v266;
  id v267;
  int v268;
  id v269;
  void *v270;
  id v271;
  uint64_t v272;
  NSObject *v273;
  NSObject *v274;
  os_signpost_id_t v275;
  NSObject *v276;
  NSObject *v277;
  os_signpost_id_t v278;
  void *v279;
  void *v280;
  void *v281;
  uint64_t v282;
  void *v283;
  unint64_t v284;
  void *v285;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  _QWORD *v289;
  int v290;
  void *v291;
  uint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  id v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  uint64_t v308;
  void *v309;
  id v310;
  void *v311;
  uint64_t v312;
  NSObject *v313;
  NSObject *v314;
  os_signpost_id_t v315;
  void *v316;
  uint64_t v317;
  void *v318;
  NSObject *v319;
  NSObject *v320;
  os_signpost_id_t v321;
  id v322;
  NSObject *v323;
  NSObject *v324;
  os_signpost_id_t v325;
  void *v326;
  NSObject *v327;
  NSObject *v328;
  os_signpost_id_t v329;
  const __CFString *v330;
  NSObject *v331;
  NSObject *v332;
  os_signpost_id_t v333;
  uint64_t v335;
  uint64_t v336;
  unint64_t v337;
  NSObject *v338;
  NSObject *v339;
  os_signpost_id_t v340;
  void *v341;
  void *v342;
  void *v343;
  NSObject *v344;
  NSObject *v345;
  os_signpost_id_t v346;
  void *v347;
  NSObject *v348;
  NSObject *v349;
  os_signpost_id_t v350;
  void *v351;
  void *v352;
  void *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  NSObject *v359;
  NSObject *v360;
  os_signpost_id_t v361;
  NSObject *v362;
  NSObject *v363;
  os_signpost_id_t v364;
  NSObject *v365;
  NSMutableDictionary *v366;
  NSObject *v367;
  NSMutableDictionary *v368;
  NSObject *v369;
  NSMutableDictionary *usedRegionETAs;
  void *v371;
  void *v372;
  id v373;
  void *v374;
  void *v375;
  void *v376;
  uint64_t v377;
  uint64_t v378;
  id v379;
  uint64_t kk;
  void *v381;
  id v382;
  id v383;
  void (**v384)(_QWORD, _QWORD);
  id *p_usedRegions;
  uint64_t v386;
  id v387;
  void *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  id v392;
  uint64_t v393;
  id v394;
  NSObject *v395;
  uint64_t m;
  BOOL v397;
  void *v398;
  char v399;
  id v400;
  void *v401;
  id v402;
  id v403;
  NSObject *v404;
  id v405;
  uint64_t k;
  char *v407;
  void *v408;
  uint64_t v409;
  void *v411;
  id v412;
  id v413;
  id v414;
  id v415;
  char *v416;
  id v417;
  id v418;
  id v419;
  id v420;
  void *v421;
  void *v422;
  uint64_t v423;
  void *v424;
  uint64_t v425;
  void *v426;
  MNLPRRuleMatcher *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  uint64_t v433;
  void *v434;
  id ii;
  id v436;
  id v437;
  id v438;
  id *v439;
  id v440;
  id v441;
  MNLPRRuleMatcher *location;
  id *locationa;
  id *locationb;
  id *locationc;
  char locationd;
  void *v447;
  MNLPRRuleMatcher *obj;
  _QWORD v449[4];
  NSObject *v450;
  objc_super *v451;
  _QWORD v452[4];
  id v453;
  objc_super *v454;
  uint8_t *v455;
  uint64_t *v456;
  uint64_t v457;
  uint64_t *v458;
  uint64_t v459;
  uint64_t v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  _QWORD v485[4];
  id v486;
  id v487;
  id v488;
  id v489;
  _QWORD v490[4];
  id v491;
  MNLPRRuleMatcher *v492;
  uint8_t *v493;
  _QWORD *v494;
  _QWORD v495[5];
  id v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  id v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  _QWORD v542[4];
  id v543;
  MNLPRRuleMatcher *v544;
  id v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  uint8_t v561[4];
  NSMutableDictionary *v562;
  __int16 v563;
  NSObject *v564;
  uint8_t v565[8];
  uint8_t *v566;
  uint64_t v567;
  uint64_t v568;
  _BYTE v569[128];
  _BYTE v570[128];
  _BYTE v571[128];
  _BYTE v572[128];
  _BYTE v573[128];
  uint8_t v574[128];
  uint8_t buf[8];
  uint8_t *v576;
  uint64_t v577;
  uint64_t (*v578)(uint64_t, uint64_t);
  void (*v579)(uint64_t);
  id v580;
  _BYTE v581[128];
  _BYTE v582[128];
  _BYTE v583[128];
  _BYTE v584[128];
  _BYTE v585[128];
  _BYTE v586[128];
  _BYTE v587[128];
  _BYTE v588[128];
  _BYTE v589[128];
  _BYTE v590[128];
  _BYTE v591[128];
  objc_super v592;
  uint64_t v593;
  uint64_t (*v594)(uint64_t, uint64_t);
  void (*v595)(uint64_t);
  id v596;
  _BYTE v597[128];
  _BYTE v598[128];
  _QWORD v599[19];

  v599[16] = *MEMORY[0x1E0C80C00];
  v441 = a3;
  v402 = a4;
  v400 = a5;
  MNGetMNLPRRuleMatcherLog();
  v9 = objc_claimAutoreleasedReturnValue();
  self->_signpost = os_signpost_id_generate(v9);

  v427 = self;
  lastPlate = self->_lastPlate;
  self = (MNLPRRuleMatcher *)((char *)self + 32);
  self->super.isa = 0;

  location = self;
  objc_storeStrong((id *)&self->_vehicle, a4);
  objc_storeStrong((id *)&v427->_lastTimeZone, a5);
  usedRegions = v427->_usedRegions;
  v427->_usedRegions = (NSDictionary *)MEMORY[0x1E0C9AA70];

  v560 = 0u;
  v559 = 0u;
  v558 = 0u;
  v557 = 0u;
  p_usedRegions = (id *)&v427->_usedRegions;
  v12 = v427->_ruleSets;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v557, v599, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v558;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v558 != v14)
        objc_enumerationMutation(v12);
      objc_msgSend(*(id *)(*((_QWORD *)&v557 + 1) + 8 * v15), "licensePlateRegions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") == 0;

      if (!v17)
        break;
      if (v13 == ++v15)
      {
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v557, v599, 16);
        if (!v13)
          goto LABEL_9;
        goto LABEL_3;
      }
    }

    if (objc_msgSend(v441, "count"))
    {
      if (v427->_vehicle)
      {
        MNGetMNLPRRuleMatcherLog();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        signpost = v427->_signpost;
        if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
        {
          LOWORD(v592.receiver) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v27, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "MaskPlate", ", (uint8_t *)&v592, 2u);
        }

        MNGetMNLPRRuleMatcherLog();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        v31 = v427->_signpost;
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "length");
          LODWORD(v592.receiver) = 67109120;
          HIDWORD(v592.receiver) = v33;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v31, "PreparePlate", "length=%d", (uint8_t *)&v592, 8u);

        }
        -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mnlpr_componentsSeparatedByGlyph");
        v381 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v381)
        {
          -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          _mnLPRWrappedError(a6, -101, 0, CFSTR("Empty/unsplittable plate \"%@\"), v54, v55, v56, v57, (uint64_t)v53);

          objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("UnableToSplitString"));
          v52 = 0;
LABEL_366:

          goto LABEL_367;
        }
        v35 = (void *)MEMORY[0x1E0C99DE8];
        -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "arrayWithCapacity:", objc_msgSend(v36, "length"));
        v447 = (void *)objc_claimAutoreleasedReturnValue();

        v556 = 0u;
        v555 = 0u;
        v554 = 0u;
        v553 = 0u;
        v37 = v381;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v553, v598, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v554;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v554 != v39)
                objc_enumerationMutation(v37);
              v41 = *(void **)(*((_QWORD *)&v553 + 1) + 8 * i);
              v42 = [_MNLPRPlateCharacter alloc];
              v43 = v41;
              if (v42)
              {
                v592.receiver = v42;
                v592.super_class = (Class)_MNLPRPlateCharacter;
                v44 = -[MNLPRRuleMatcher init](&v592, sel_init);
                v42 = (_MNLPRPlateCharacter *)v44;
                if (v44)
                {
                  objc_storeStrong((id *)&v44->_lastPlate, v41);
                  valueMappings = v42->_valueMappings;
                  v42->_valueMappings = 0;

                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v46 = objc_claimAutoreleasedReturnValue();
                  fillTypes = v42->_fillTypes;
                  v42->_fillTypes = (NSMutableDictionary *)v46;

                }
              }

              objc_msgSend(v447, "addObject:", v42);
            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v553, v598, 16);
          }
          while (v38);
        }

        if (!objc_msgSend(v447, "count"))
        {
          -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          _mnLPRWrappedError(a6, -5, 0, CFSTR("Failed to generate plate abstraction for license \"%@\"), v59, v60, v61, v62, (uint64_t)v58);

          MNGetMNLPRRuleMatcherLog();
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v63;
          v65 = v427->_signpost;
          if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
          {
            LOWORD(v592.receiver) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v64, OS_SIGNPOST_INTERVAL_END, v65, "PreparePlate", "failed", (uint8_t *)&v592, 2u);
          }

          MNGetMNLPRRuleMatcherLog();
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v66;
          v68 = v427->_signpost;
          if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
          {
            LOWORD(v592.receiver) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v67, OS_SIGNPOST_INTERVAL_END, v68, "MaskPlate", "failed", (uint8_t *)&v592, 2u);
          }

          objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("EmptyLicensePlate"));
          v52 = 0;
LABEL_365:

          goto LABEL_366;
        }
        v48 = [_MNLPRPlate alloc];
        v49 = v447;
        if (v48
          && (v592.receiver = v48,
              v592.super_class = (Class)_MNLPRPlate,
              (obj = -[MNLPRRuleMatcher init](&v592, sel_init)) != 0))
        {
          v50 = objc_msgSend(v49, "copy");
          vehicle = obj->_vehicle;
          obj->_vehicle = (GEOLPRVehicle *)v50;

        }
        else
        {
          obj = 0;
        }

        objc_storeStrong((id *)&location->super.isa, obj);
        MNGetMNLPRRuleMatcherLog();
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v69;
        v71 = v427->_signpost;
        if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
        {
          LOWORD(v592.receiver) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v70, OS_SIGNPOST_INTERVAL_END, v71, "PreparePlate", "success", (uint8_t *)&v592, 2u);
        }

        MNGetMNLPRRuleMatcherLog();
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = v72;
        v74 = v427->_signpost;
        if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
        {
          LOWORD(v592.receiver) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v73, OS_SIGNPOST_INTERVAL_BEGIN, v74, "FindPlateRegions", ", (uint8_t *)&v592, 2u);
        }

        GEOConfigGetDouble();
        v76 = v75;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v552 = 0u;
        v551 = 0u;
        v550 = 0u;
        v549 = 0u;
        v78 = v427->_ruleSets;
        v79 = -[NSArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v549, v597, 16);
        if (v79)
        {
          v80 = *(_QWORD *)v550;
          do
          {
            for (j = 0; j != v79; ++j)
            {
              if (*(_QWORD *)v550 != v80)
                objc_enumerationMutation(v78);
              objc_msgSend(*(id *)(*((_QWORD *)&v549 + 1) + 8 * j), "plateRegionsContainingLatLngs:inRadius:", v441, v76);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "addObjectsFromArray:", v82);

            }
            v79 = -[NSArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v549, v597, 16);
          }
          while (v79);
        }

        MNGetMNLPRRuleMatcherLog();
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = v83;
        v85 = v427->_signpost;
        if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
        {
          v86 = objc_msgSend(v77, "count");
          LODWORD(v592.receiver) = 67109120;
          HIDWORD(v592.receiver) = v86;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v84, OS_SIGNPOST_INTERVAL_END, v85, "FindPlateRegions", "matched=%d", (uint8_t *)&v592, 8u);
        }

        objc_msgSend(v441, "firstObject");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "coordinate");
        v89 = v88;
        v91 = v90;

        GEOConfigGetDouble();
        v542[0] = MEMORY[0x1E0C809B0];
        v542[1] = 3221225472;
        v542[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke;
        v542[3] = &unk_1E61D2E10;
        v546 = v92;
        v373 = v402;
        v543 = v373;
        v544 = v427;
        v383 = v441;
        v545 = v383;
        v547 = v89;
        v548 = v91;
        v384 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E0E364](v542);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v379 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v387 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(p_usedRegions, v379);
        objc_storeStrong((id *)&v427->_usedRegionETAs, v387);
        v592.receiver = 0;
        v592.super_class = (Class)&v592;
        v593 = 0x3032000000;
        v594 = __Block_byref_object_copy__5;
        v595 = __Block_byref_object_dispose__5;
        v596 = 0;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v434 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        MNGetMNLPRRuleMatcherLog();
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = v94;
        v96 = v427->_signpost;
        if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v96, "FindRules", ", buf, 2u);
        }

        v541 = 0u;
        v540 = 0u;
        v539 = 0u;
        v538 = 0u;
        v382 = v77;
        v97 = objc_msgSend(v382, "countByEnumeratingWithState:objects:count:", &v538, v591, 16);
        if (v97)
        {
          v98 = 0;
          v399 = 0;
          v392 = (id)v97;
          v393 = *(_QWORD *)v539;
          do
          {
            v418 = 0;
            do
            {
              if (*(_QWORD *)v539 != v393)
                objc_enumerationMutation(v382);
              v411 = *(void **)(*((_QWORD *)&v538 + 1) + 8 * (_QWORD)v418);
              objc_msgSend(v411, "plateInfosMatchingVehicle:", v427->_vehicle);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v99, "count"))
              {
                v398 = v99;
                objc_msgSend(v99, "firstObject");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "licensePlateStructure");
                v421 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v421, "supportedNumericCharacterSet");
                v431 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v421, "supportedAlphabeticCharacterSet");
                v428 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v411, "restrictionRegionsContainingLatLngs:inRadius:", v383, v76);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v397 = objc_msgSend(v101, "count") != 0;
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v408 = (void *)objc_claimAutoreleasedReturnValue();
                v537 = 0u;
                v536 = 0u;
                v535 = 0u;
                v534 = 0u;
                v413 = v101;
                v389 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v534, v590, 16);
                if (v389)
                {
                  v391 = *(_QWORD *)v535;
                  while (2)
                  {
                    for (k = 0; k != v389; ++k)
                    {
                      if (*(_QWORD *)v535 != v391)
                        objc_enumerationMutation(v413);
                      v424 = *(void **)(*((_QWORD *)&v534 + 1) + 8 * k);
                      MNGetMNLPRRuleMatcherLog();
                      v102 = objc_claimAutoreleasedReturnValue();
                      v103 = v102;
                      v104 = v427->_signpost;
                      if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v102))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v103, OS_SIGNPOST_INTERVAL_BEGIN, v104, "ExamineRegion", ", buf, 2u);
                      }

                      v105 = v427->_vehicle;
                      v106 = (id *)((char *)v592.super_class + 40);
                      v533 = (id)*((_QWORD *)v592.super_class + 5);
                      objc_msgSend(v424, "plateTypeIndexesMatchingVehicle:error:", v105, &v533);
                      v415 = (id)objc_claimAutoreleasedReturnValue();
                      objc_storeStrong(v106, v533);
                      v107 = (void *)*((_QWORD *)v592.super_class + 5);
                      if (v107)
                      {
                        if (a6)
                          *a6 = objc_retainAutorelease(v107);
                        MNGetMNLPRRuleMatcherLog();
                        v211 = objc_claimAutoreleasedReturnValue();
                        v108 = v211;
                        v212 = v427->_signpost;
                        if (v212 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v211))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v108, OS_SIGNPOST_INTERVAL_END, v212, "MaskPlate", "failed", buf, 2u);
                        }
LABEL_200:

                        v204 = 0;
                        goto LABEL_201;
                      }
                      ((void (**)(_QWORD, void *))v384)[2](v384, v424);
                      v108 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v424, "identifier");
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v387, "setObject:forKeyedSubscript:", v108, v109);

                      v532 = 0u;
                      v531 = 0u;
                      v530 = 0u;
                      v529 = 0u;
                      objc_msgSend(v424, "convertRules");
                      v403 = (id)objc_claimAutoreleasedReturnValue();
                      v386 = objc_msgSend(v403, "countByEnumeratingWithState:objects:count:", &v529, v589, 16);
                      if (v386)
                      {
                        v390 = *(_QWORD *)v530;
                        do
                        {
                          for (m = 0; m != v386; ++m)
                          {
                            if (*(_QWORD *)v530 != v390)
                              objc_enumerationMutation(v403);
                            v110 = *(void **)(*((_QWORD *)&v529 + 1) + 8 * m);
                            MNGetMNLPRRuleMatcherLog();
                            v111 = objc_claimAutoreleasedReturnValue();
                            v112 = v111;
                            v113 = v427->_signpost;
                            if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
                            {
                              *(_WORD *)buf = 0;
                              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v112, OS_SIGNPOST_INTERVAL_BEGIN, v113, "ExamineRule", ", buf, 2u);
                            }

                            if (objc_msgSend(v110, "hasValidDateInterval"))
                            {
                              v528 = 0u;
                              v527 = 0u;
                              v526 = 0u;
                              v525 = 0u;
                              v114 = v108;
                              v115 = -[NSObject countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v525, v588, 16);
                              if (v115)
                              {
                                v116 = *(_QWORD *)v526;
                                while (2)
                                {
                                  for (n = 0; n != v115; ++n)
                                  {
                                    if (*(_QWORD *)v526 != v116)
                                      objc_enumerationMutation(v114);
                                    v118 = *(_QWORD *)(*((_QWORD *)&v525 + 1) + 8 * n);
                                    objc_msgSend(v110, "validDateInterval");
                                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                                    LOBYTE(v118) = objc_msgSend(v119, "containsDate:", v118);

                                    if ((v118 & 1) != 0)
                                    {

                                      goto LABEL_100;
                                    }
                                  }
                                  v115 = -[NSObject countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v525, v588, 16);
                                  if (v115)
                                    continue;
                                  break;
                                }
                              }

                              MNGetMNLPRRuleMatcherLog();
                              v120 = objc_claimAutoreleasedReturnValue();
                              v121 = v120;
                              v122 = v427->_signpost;
                              if (v122 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v121, OS_SIGNPOST_INTERVAL_END, v122, "ExamineRule", "skipped, not valid for date", buf, 2u);
                              }
                            }
                            else
                            {
LABEL_100:
                              objc_msgSend(v424, "definedPlateTypes");
                              v123 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v110, "pickupRulesForPlateTypes:atIndexes:", v123, v415);
                              v401 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v424, "definedPlateTypes");
                              v124 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v110, "mapRulesForPlateTypes:atIndexes:", v124, v415);
                              v125 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v424, "definedPlateTypes");
                              v126 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v110, "fillRulesForPlateTypes:atIndexes:", v126, v415);
                              v388 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v401, "count"));
                              locationa = (id *)objc_claimAutoreleasedReturnValue();
                              MNGetMNLPRRuleMatcherLog();
                              v127 = objc_claimAutoreleasedReturnValue();
                              v128 = v127;
                              v129 = v427->_signpost;
                              if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v128, OS_SIGNPOST_INTERVAL_BEGIN, v129, "ExamineMapRules", ", buf, 2u);
                              }

                              v524 = 0u;
                              v523 = 0u;
                              v522 = 0u;
                              v521 = 0u;
                              v404 = v125;
                              v130 = -[NSObject countByEnumeratingWithState:objects:count:](v404, "countByEnumeratingWithState:objects:count:", &v521, v587, 16);
                              if (v130)
                              {
                                v394 = *(id *)v522;
                                do
                                {
                                  for (ii = 0; ii != (id)v130; ii = (char *)ii + 1)
                                  {
                                    if (*(id *)v522 != v394)
                                      objc_enumerationMutation(v404);
                                    v131 = *(void **)(*((_QWORD *)&v521 + 1) + 8 * (_QWORD)ii);
                                    objc_msgSend(v131, "setMrLicensePlateStructure:", v421);
                                    v520 = 0u;
                                    v519 = 0u;
                                    v518 = 0u;
                                    v517 = 0u;
                                    objc_msgSend(v131, "targetChars");
                                    v132 = (void *)objc_claimAutoreleasedReturnValue();
                                    v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v517, v586, 16);
                                    if (v133)
                                    {
                                      v134 = *(_QWORD *)v518;
                                      while (2)
                                      {
                                        for (jj = 0; jj != v133; ++jj)
                                        {
                                          if (*(_QWORD *)v518 != v134)
                                            objc_enumerationMutation(v132);
                                          v136 = *(void **)(*((_QWORD *)&v517 + 1) + 8 * jj);
                                          v137 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v136, v428, v431);
                                          if (v137 == 0x7FFFFFFFFFFFFFFFLL)
                                          {
                                            _mnLPRWrappedError(a6, -108, 0, CFSTR("unable to locate plate char for map rule target: %@"), v138, v139, v140, v141, (uint64_t)v136);
                                            MNGetMNLPRRuleMatcherLog();
                                            v205 = objc_claimAutoreleasedReturnValue();
                                            v206 = v205;
                                            v207 = v427->_signpost;
                                            if (v207 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v205))
                                            {
                                              *(_WORD *)buf = 0;
                                              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v206, OS_SIGNPOST_INTERVAL_END, v207, "MaskPlate", "failed", buf, 2u);
                                            }

                                            objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("NoCharForTarget"));
                                            v395 = v404;
LABEL_199:

                                            v98 = 1;
                                            goto LABEL_200;
                                          }
                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v137);
                                          v142 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(locationa, "objectForKeyedSubscript:", v142);
                                          v143 = (void *)objc_claimAutoreleasedReturnValue();
                                          v144 = v143 == 0;

                                          if (v144)
                                          {
                                            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                                            v145 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(locationa, "setObject:forKeyedSubscript:", v145, v142);

                                          }
                                          objc_msgSend(locationa, "objectForKeyedSubscript:", v142);
                                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v146, "addObject:", v131);

                                        }
                                        v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v517, v586, 16);
                                        if (v133)
                                          continue;
                                        break;
                                      }
                                    }

                                  }
                                  v130 = -[NSObject countByEnumeratingWithState:objects:count:](v404, "countByEnumeratingWithState:objects:count:", &v521, v587, 16);
                                }
                                while (v130);
                              }

                              MNGetMNLPRRuleMatcherLog();
                              v147 = objc_claimAutoreleasedReturnValue();
                              v148 = v147;
                              v149 = v427->_signpost;
                              if (v149 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v148, OS_SIGNPOST_INTERVAL_END, v149, "ExamineMapRules", ", buf, 2u);
                              }

                              MNGetMNLPRRuleMatcherLog();
                              v150 = objc_claimAutoreleasedReturnValue();
                              v151 = v150;
                              v152 = v427->_signpost;
                              if (v152 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v150))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v151, OS_SIGNPOST_INTERVAL_BEGIN, v152, "ExaminePickupRules", ", buf, 2u);
                              }

                              v516 = 0u;
                              v515 = 0u;
                              v514 = 0u;
                              v513 = 0u;
                              v395 = v401;
                              v153 = v421;
                              v377 = -[NSObject countByEnumeratingWithState:objects:count:](v395, "countByEnumeratingWithState:objects:count:", &v513, v585, 16);
                              if (v377)
                              {
                                v378 = *(_QWORD *)v514;
                                do
                                {
                                  for (kk = 0; kk != v377; ++kk)
                                  {
                                    if (*(_QWORD *)v514 != v378)
                                      objc_enumerationMutation(v395);
                                    v154 = *(void **)(*((_QWORD *)&v513 + 1) + 8 * kk);
                                    objc_msgSend(v154, "setPrLicensePlateStructure:", v153);
                                    v512 = 0u;
                                    v511 = 0u;
                                    v510 = 0u;
                                    v509 = 0u;
                                    objc_msgSend(v154, "pickupChars");
                                    v155 = (void *)objc_claimAutoreleasedReturnValue();
                                    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v509, v584, 16);
                                    if (v156)
                                    {
                                      v436 = *(id *)v510;
                                      v132 = v155;
                                      while (2)
                                      {
                                        v157 = v156;
                                        for (mm = 0; mm != v157; ++mm)
                                        {
                                          if (*(id *)v510 != v436)
                                            objc_enumerationMutation(v155);
                                          v159 = *(void **)(*((_QWORD *)&v509 + 1) + 8 * mm);
                                          v160 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v159, v428, v431);
                                          if (v160 == 0x7FFFFFFFFFFFFFFFLL)
                                          {
                                            _mnLPRWrappedError(a6, -108, 0, CFSTR("unable to locate plate char for pickup rule target: %@"), v161, v162, v163, v164, (uint64_t)v159);
                                            MNGetMNLPRRuleMatcherLog();
                                            v208 = objc_claimAutoreleasedReturnValue();
                                            v209 = v208;
                                            v210 = v427->_signpost;
                                            if (v210 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v208))
                                            {
                                              *(_WORD *)buf = 0;
                                              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v209, OS_SIGNPOST_INTERVAL_END, v210, "MaskPlate", "failed", buf, 2u);
                                            }

                                            objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("NoCharForTarget"));
                                            goto LABEL_199;
                                          }
                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v160);
                                          v165 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(locationa, "objectForKeyedSubscript:", v165);
                                          v166 = (void *)objc_claimAutoreleasedReturnValue();
                                          v167 = v166 == 0;

                                          if (v167)
                                          {
                                            v168 = objc_alloc_init(MEMORY[0x1E0D27118]);
                                            objc_msgSend(v168, "setMrLicensePlateStructure:", v421);
                                            v169 = (void *)objc_msgSend(v159, "copy");
                                            objc_msgSend(v168, "addTargetChar:", v169);

                                            v170 = objc_alloc_init(MEMORY[0x1E0D27128]);
                                            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                                            v171 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v170, "setMappedValues:", v171);

                                            objc_msgSend(v168, "addValueMapping:", v170);
                                            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v168);
                                            v172 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(locationa, "setObject:forKeyedSubscript:", v172, v165);

                                          }
                                          v155 = v132;
                                        }
                                        v156 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v509, v584, 16);
                                        if (v156)
                                          continue;
                                        break;
                                      }
                                    }

                                    v153 = v421;
                                  }
                                  v377 = -[NSObject countByEnumeratingWithState:objects:count:](v395, "countByEnumeratingWithState:objects:count:", &v513, v585, 16);
                                }
                                while (v377);
                              }

                              MNGetMNLPRRuleMatcherLog();
                              v173 = objc_claimAutoreleasedReturnValue();
                              v174 = v173;
                              v175 = v427->_signpost;
                              if (v175 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v173))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v174, OS_SIGNPOST_INTERVAL_END, v175, "ExaminePickupRules", ", buf, 2u);
                              }

                              v508 = 0u;
                              v507 = 0u;
                              v506 = 0u;
                              v505 = 0u;
                              v437 = v388;
                              v176 = objc_msgSend(v437, "countByEnumeratingWithState:objects:count:", &v505, v583, 16);
                              if (v176)
                              {
                                v177 = *(_QWORD *)v506;
                                do
                                {
                                  for (nn = 0; nn != v176; ++nn)
                                  {
                                    if (*(_QWORD *)v506 != v177)
                                      objc_enumerationMutation(v437);
                                    objc_msgSend(*(id *)(*((_QWORD *)&v505 + 1) + 8 * nn), "setFrLicensePlateStructure:", v421);
                                  }
                                  v176 = objc_msgSend(v437, "countByEnumeratingWithState:objects:count:", &v505, v583, 16);
                                }
                                while (v176);
                              }

                              v179 = v395;
                              if (-[NSObject count](v395, "count")
                                || objc_msgSend(locationa, "count")
                                || objc_msgSend(v437, "count"))
                              {
                                objc_msgSend(v424, "identifier");
                                v180 = objc_claimAutoreleasedReturnValue();
                                v181 = (void *)v180;
                                v182 = CFSTR("<unknown>");
                                if (v180)
                                  v182 = (__CFString *)v180;
                                v183 = v182;

                                if (objc_msgSend(v424, "hasName"))
                                {
                                  objc_msgSend(v424, "name");
                                  v371 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[__CFString stringByAppendingFormat:](v183, "stringByAppendingFormat:", CFSTR(":%@"));
                                  v184 = objc_claimAutoreleasedReturnValue();

                                  v183 = (__CFString *)v184;
                                }
                                objc_msgSend(v375, "addObject:", v183);
                                objc_msgSend(v408, "addObject:", v183);

                                v179 = v395;
                              }
                              objc_msgSend(v376, "addObjectsFromArray:", v179);
                              v504 = 0u;
                              v503 = 0u;
                              v502 = 0u;
                              v501 = 0u;
                              objc_msgSend(locationa, "allValues");
                              v185 = (void *)objc_claimAutoreleasedReturnValue();
                              v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v501, v582, 16);
                              if (v186)
                              {
                                v187 = *(_QWORD *)v502;
                                do
                                {
                                  for (i1 = 0; i1 != v186; ++i1)
                                  {
                                    if (*(_QWORD *)v502 != v187)
                                      objc_enumerationMutation(v185);
                                    v189 = *(void **)(*((_QWORD *)&v501 + 1) + 8 * i1);
                                    objc_msgSend(v434, "addObjectsFromArray:", v189);
                                    v500 = 0u;
                                    v499 = 0u;
                                    v498 = 0u;
                                    v497 = 0u;
                                    v190 = v189;
                                    v191 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v497, v581, 16);
                                    if (v191)
                                    {
                                      v192 = *(_QWORD *)v498;
                                      do
                                      {
                                        for (i2 = 0; i2 != v191; ++i2)
                                        {
                                          if (*(_QWORD *)v498 != v192)
                                            objc_enumerationMutation(v190);
                                          objc_msgSend(v93, "setObject:forKey:", v108, *(_QWORD *)(*((_QWORD *)&v497 + 1) + 8 * i2));
                                        }
                                        v191 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v497, v581, 16);
                                      }
                                      while (v191);
                                    }

                                  }
                                  v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v501, v582, 16);
                                }
                                while (v186);
                              }

                              objc_msgSend(v374, "addObjectsFromArray:", v437);
                              MNGetMNLPRRuleMatcherLog();
                              v194 = objc_claimAutoreleasedReturnValue();
                              v195 = v194;
                              v196 = v427->_signpost;
                              if (v196 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v194))
                              {
                                v197 = -[NSObject count](v395, "count");
                                v198 = objc_msgSend(locationa, "count");
                                v199 = objc_msgSend(v437, "count");
                                *(_DWORD *)buf = 67109632;
                                *(_DWORD *)&buf[4] = v197;
                                LOWORD(v576) = 1024;
                                *(_DWORD *)((char *)&v576 + 2) = v198;
                                HIWORD(v576) = 1024;
                                LODWORD(v577) = v199;
                                _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v195, OS_SIGNPOST_INTERVAL_END, v196, "ExamineRule", "pickup=%d, map=%d, fill=%d", buf, 0x14u);
                              }

                              v98 = 1;
                              v121 = v395;
                            }

                          }
                          v386 = objc_msgSend(v403, "countByEnumeratingWithState:objects:count:", &v529, v589, 16);
                        }
                        while (v386);
                      }

                      if (objc_msgSend(v408, "count"))
                      {
                        objc_msgSend(v411, "identifier");
                        v200 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v379, "setObject:forKeyedSubscript:", v408, v200);

                      }
                      MNGetMNLPRRuleMatcherLog();
                      v201 = objc_claimAutoreleasedReturnValue();
                      v202 = v201;
                      v203 = v427->_signpost;
                      if (v203 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v201))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v202, OS_SIGNPOST_INTERVAL_END, v203, "ExamineRegion", ", buf, 2u);
                      }

                    }
                    v204 = 1;
                    v389 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v534, v590, 16);
                    if (v389)
                      continue;
                    break;
                  }
                }
                else
                {
                  v204 = 1;
                }
LABEL_201:

                if (!v204)
                {

                  v52 = 0;
                  goto LABEL_364;
                }
                v399 |= v397;
              }
              else
              {

              }
              v418 = (char *)v418 + 1;
            }
            while (v418 != v392);
            v213 = objc_msgSend(v382, "countByEnumeratingWithState:objects:count:", &v538, v591, 16);
            v392 = (id)v213;
          }
          while (v213);
        }
        else
        {
          v98 = 0;
          v399 = 0;
        }

        MNGetMNLPRRuleMatcherLog();
        v214 = objc_claimAutoreleasedReturnValue();
        v215 = v214;
        v216 = v427->_signpost;
        if (v216 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v214))
        {
          v217 = objc_msgSend(v376, "count");
          v218 = objc_msgSend(v434, "count");
          v219 = objc_msgSend(v374, "count");
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v217;
          LOWORD(v576) = 1024;
          *(_DWORD *)((char *)&v576 + 2) = v218;
          HIWORD(v576) = 1024;
          LODWORD(v577) = v219;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v215, OS_SIGNPOST_INTERVAL_END, v216, "FindRules", "pickup=%d, map=%d, fill=%d", buf, 0x14u);
        }

        *(_QWORD *)buf = 0;
        v576 = buf;
        v577 = 0x3032000000;
        v578 = __Block_byref_object_copy__5;
        v579 = __Block_byref_object_dispose__5;
        v580 = 0;
        v495[0] = 0;
        v495[1] = v495;
        v495[2] = 0x3032000000;
        v495[3] = __Block_byref_object_copy__5;
        v495[4] = __Block_byref_object_dispose__5;
        v496 = 0;
        v490[0] = MEMORY[0x1E0C809B0];
        v490[1] = 3221225472;
        v490[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_154;
        v490[3] = &unk_1E61D2E38;
        v493 = buf;
        v494 = v495;
        v491 = v400;
        v492 = v427;
        v220 = (void *)MEMORY[0x1B5E0E364](v490);
        MNGetMNLPRRuleMatcherLog();
        v221 = objc_claimAutoreleasedReturnValue();
        v222 = v221;
        v223 = v427->_signpost;
        if (v223 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v221))
        {
          v224 = objc_msgSend(v434, "count");
          *(_DWORD *)v565 = 67109120;
          *(_DWORD *)&v565[4] = v224;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v222, OS_SIGNPOST_INTERVAL_BEGIN, v223, "FilterMapRules", "count=%d", v565, 8u);
        }

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v434, "count"));
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        v485[0] = MEMORY[0x1E0C809B0];
        v485[1] = 3221225472;
        v485[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_157;
        v485[3] = &unk_1E61D2E88;
        v486 = v93;
        v487 = v373;
        v412 = v220;
        v489 = v412;
        v414 = v225;
        v488 = v414;
        objc_msgSend(v434, "enumerateObjectsUsingBlock:", v485);
        MNGetMNLPRRuleMatcherLog();
        v226 = objc_claimAutoreleasedReturnValue();
        v227 = v226;
        v228 = v427->_signpost;
        if (v228 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v226))
        {
          v229 = objc_msgSend(v414, "count");
          *(_DWORD *)v565 = 67109120;
          *(_DWORD *)&v565[4] = v229;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v227, OS_SIGNPOST_INTERVAL_END, v228, "FilterMapRules", "count=%d", v565, 8u);
        }

        if (!objc_msgSend(v376, "count") || !objc_msgSend(v414, "count") && !objc_msgSend(v374, "count"))
        {
          if ((v399 & 1) != 0)
          {
            if ((v98 & 1) != 0)
            {
              _mnLPRWrappedError(a6, -11, 0, CFSTR("No pickup or mapping rules available for provided vehicle"), v230, v231, v232, v233, (uint64_t)v371);
              v330 = CFSTR("NoRulesForVehicle");
            }
            else
            {
              _mnLPRWrappedError(a6, -12, 0, CFSTR("No pickup or mapping rules available for provided time interval"), v230, v231, v232, v233, (uint64_t)v371);
              v330 = CFSTR("EmptyRulesForTimeRange");
            }
          }
          else
          {
            _mnLPRWrappedError(a6, -10, 0, CFSTR("No pickup or mapping rules available for provided regions"), v230, v231, v232, v233, (uint64_t)v371);
            v330 = CFSTR("NoRulesForRegion");
          }
          objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, v330);
          MNGetMNLPRRuleMatcherLog();
          v331 = objc_claimAutoreleasedReturnValue();
          v332 = v331;
          v333 = v427->_signpost;
          if (v333 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v331))
          {
            *(_WORD *)v565 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v332, OS_SIGNPOST_INTERVAL_END, v333, "MaskPlate", "failed", v565, 2u);
          }

          v52 = 0;
LABEL_363:

          _Block_object_dispose(v495, 8);
          _Block_object_dispose(buf, 8);

LABEL_364:
          _Block_object_dispose(&v592, 8);

          goto LABEL_365;
        }
        MNGetMNLPRRuleMatcherLog();
        v234 = objc_claimAutoreleasedReturnValue();
        v235 = v234;
        v236 = v427->_signpost;
        if (v236 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v234))
        {
          *(_WORD *)v565 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v235, OS_SIGNPOST_INTERVAL_BEGIN, v236, "BuildPickupRules", ", v565, 2u);
        }

        v483 = 0u;
        v484 = 0u;
        v481 = 0u;
        v482 = 0u;
        v438 = v376;
        v237 = objc_msgSend(v438, "countByEnumeratingWithState:objects:count:", &v481, v574, 16);
        if (v237)
        {
          locationb = *(id **)v482;
          do
          {
            for (i3 = 0; i3 != v237; ++i3)
            {
              if (*(id **)v482 != locationb)
                objc_enumerationMutation(v438);
              v239 = *(void **)(*((_QWORD *)&v481 + 1) + 8 * i3);
              objc_msgSend(v239, "prLicensePlateStructure");
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v240, "supportedNumericCharacterSet");
              v241 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v239, "prLicensePlateStructure");
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v242, "supportedAlphabeticCharacterSet");
              v243 = (void *)objc_claimAutoreleasedReturnValue();

              v479 = 0u;
              v480 = 0u;
              v477 = 0u;
              v478 = 0u;
              objc_msgSend(v239, "pickupChars");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v477, v573, 16);
              if (v245)
              {
                v246 = *(_QWORD *)v478;
                do
                {
                  for (i4 = 0; i4 != v245; ++i4)
                  {
                    if (*(_QWORD *)v478 != v246)
                      objc_enumerationMutation(v244);
                    -[_MNLPRPlate charMatching:alphabetics:numerics:](obj, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i4), v243, v241);
                    v248 = (_BYTE *)objc_claimAutoreleasedReturnValue();
                    if (v248)
                      v248[24] = 1;

                  }
                  v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v477, v573, 16);
                }
                while (v245);
              }

            }
            v237 = objc_msgSend(v438, "countByEnumeratingWithState:objects:count:", &v481, v574, 16);
          }
          while (v237);
        }

        MNGetMNLPRRuleMatcherLog();
        v249 = objc_claimAutoreleasedReturnValue();
        v250 = v249;
        v251 = v427->_signpost;
        if (v251 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v249))
        {
          *(_WORD *)v565 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v250, OS_SIGNPOST_INTERVAL_END, v251, "BuildPickupRules", ", v565, 2u);
        }

        MNGetMNLPRRuleMatcherLog();
        v252 = objc_claimAutoreleasedReturnValue();
        v253 = v252;
        v254 = v427->_signpost;
        if (v254 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v252))
        {
          *(_WORD *)v565 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v253, OS_SIGNPOST_INTERVAL_BEGIN, v254, "BuildMapRules", ", v565, 2u);
        }

        v475 = 0u;
        v476 = 0u;
        v473 = 0u;
        v474 = 0u;
        v255 = v414;
        v256 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v473, v572, 16);
        if (v256)
        {
          v409 = *(_QWORD *)v474;
          v405 = v255;
          do
          {
            v257 = 0;
            v407 = (char *)v256;
            do
            {
              if (*(_QWORD *)v474 != v409)
                objc_enumerationMutation(v255);
              v416 = v257;
              v422 = *(void **)(*((_QWORD *)&v473 + 1) + 8 * (_QWORD)v257);
              objc_msgSend(v422, "mrLicensePlateStructure");
              v258 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v258, "supportedNumericCharacterSet");
              v432 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v422, "mrLicensePlateStructure");
              v259 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v259, "supportedAlphabeticCharacterSet");
              v429 = (void *)objc_claimAutoreleasedReturnValue();

              v471 = 0u;
              v472 = 0u;
              v469 = 0u;
              v470 = 0u;
              objc_msgSend(v422, "targetChars");
              v419 = (id)objc_claimAutoreleasedReturnValue();
              v439 = (id *)objc_msgSend(v419, "countByEnumeratingWithState:objects:count:", &v469, v571, 16);
              if (v439)
              {
                v425 = *(_QWORD *)v470;
                do
                {
                  for (locationc = 0; locationc != v439; locationc = (id *)((char *)locationc + 1))
                  {
                    if (*(_QWORD *)v470 != v425)
                      objc_enumerationMutation(v419);
                    -[_MNLPRPlate charMatching:alphabetics:numerics:](obj, *(void **)(*((_QWORD *)&v469 + 1) + 8 * (_QWORD)locationc), v429, v432);
                    v260 = (id *)objc_claimAutoreleasedReturnValue();
                    if (v260)
                    {
                      v467 = 0u;
                      v468 = 0u;
                      v465 = 0u;
                      v466 = 0u;
                      objc_msgSend(v422, "valueMappings");
                      v261 = (void *)objc_claimAutoreleasedReturnValue();
                      v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v465, v570, 16);
                      if (v262)
                      {
                        v263 = *(_QWORD *)v466;
                        do
                        {
                          for (i5 = 0; i5 != v262; ++i5)
                          {
                            if (*(_QWORD *)v466 != v263)
                              objc_enumerationMutation(v261);
                            v265 = *(void **)(*((_QWORD *)&v465 + 1) + 8 * i5);
                            if (objc_msgSend(v265, "valuesCount"))
                            {
                              objc_msgSend(v265, "values");
                              v266 = (void *)objc_claimAutoreleasedReturnValue();
                              v267 = v260[4];
                              v268 = objc_msgSend(v266, "containsObject:", v267);

                              if (!v268)
                                continue;
                            }
                            v269 = v265;
                            if (objc_msgSend(v269, "mappedValuesCount"))
                              objc_msgSend(v269, "mappedValues");
                            else
                              objc_msgSend(v269, "values");
                            v270 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v260[1])
                            {
                              objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v270);
                              v271 = (id)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v260[1], "intersectOrderedSet:", v271);
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v270);
                              v272 = objc_claimAutoreleasedReturnValue();
                              v271 = v260[1];
                              v260[1] = (id)v272;
                            }

                          }
                          v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v465, v570, 16);
                        }
                        while (v262);
                      }

                    }
                  }
                  v439 = (id *)objc_msgSend(v419, "countByEnumeratingWithState:objects:count:", &v469, v571, 16);
                }
                while (v439);
              }

              v257 = v416 + 1;
              v255 = v405;
            }
            while (v416 + 1 != v407);
            v256 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v473, v572, 16);
          }
          while (v256);
        }

        MNGetMNLPRRuleMatcherLog();
        v273 = objc_claimAutoreleasedReturnValue();
        v274 = v273;
        v275 = v427->_signpost;
        if (v275 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v273))
        {
          *(_WORD *)v565 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v274, OS_SIGNPOST_INTERVAL_END, v275, "BuildMapRules", ", v565, 2u);
        }

        MNGetMNLPRRuleMatcherLog();
        v276 = objc_claimAutoreleasedReturnValue();
        v277 = v276;
        v278 = v427->_signpost;
        if (v278 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v276))
        {
          *(_WORD *)v565 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v277, OS_SIGNPOST_INTERVAL_BEGIN, v278, "BuildFillRules", ", v565, 2u);
        }

        v463 = 0u;
        v464 = 0u;
        v461 = 0u;
        v462 = 0u;
        v417 = v374;
        v423 = objc_msgSend(v417, "countByEnumeratingWithState:objects:count:", &v461, v569, 16);
        if (v423)
        {
          v420 = *(id *)v462;
          do
          {
            v433 = 0;
            do
            {
              if (*(id *)v462 != v420)
                objc_enumerationMutation(v417);
              v279 = *(void **)(*((_QWORD *)&v461 + 1) + 8 * v433);
              objc_msgSend(v279, "frLicensePlateStructure");
              v280 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v280, "supportedNumericCharacterSet");
              v430 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v279, "frLicensePlateStructure");
              v281 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v281, "supportedAlphabeticCharacterSet");
              v426 = (void *)objc_claimAutoreleasedReturnValue();

              if (obj)
                v282 = -[GEOLPRVehicle count](obj->_vehicle, "count");
              else
                v282 = 0;
              if (objc_msgSend(v279, "hasFromChar"))
              {
                objc_msgSend(v279, "fromChar");
                v283 = (void *)objc_claimAutoreleasedReturnValue();
                v284 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v283, v426, v430);

                if (v284 == 0x7FFFFFFFFFFFFFFFLL)
                  v284 = 0;
              }
              else
              {
                v284 = 0;
              }
              v285 = (void *)(v282 - 1);
              if (objc_msgSend(v279, "hasToChar"))
              {
                objc_msgSend(v279, "toChar");
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                v287 = -[_MNLPRPlate charIndexForTarget:alphabetics:numerics:]((uint64_t)obj, v286, v426, v430);

                if (v287 != 0x7FFFFFFFFFFFFFFFLL)
                  v285 = (void *)v287;
              }
              v440 = v285;
              if (v284 <= (unint64_t)v285)
              {
                while (obj && -[GEOLPRVehicle count](obj->_vehicle, "count") > v284)
                {
                  -[GEOLPRVehicle objectAtIndexedSubscript:](obj->_vehicle, "objectAtIndexedSubscript:", v284);
                  v288 = objc_claimAutoreleasedReturnValue();
                  v289 = (_QWORD *)v288;
                  if (!v288)
                    goto LABEL_312;
                  if (!*(_BYTE *)(v288 + 24))
                  {
                    locationd = 0;
                    goto LABEL_313;
                  }
LABEL_329:

                  if (++v284 > (unint64_t)v440)
                    goto LABEL_304;
                }
                v289 = 0;
LABEL_312:
                locationd = 1;
LABEL_313:
                v290 = objc_msgSend(v279, "fillType");
                switch(v290)
                {
                  case 1:
                    objc_msgSend(v279, "frLicensePlateStructure");
                    v291 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v291, "supportedPlateAlphabetLetters");
                    v294 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v279, "frLicensePlateStructure");
                    v295 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v295, "supportedPlateNumerics");
                    v296 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v294, "stringByAppendingString:", v296);
                    v293 = (void *)objc_claimAutoreleasedReturnValue();

                    break;
                  case 2:
                    objc_msgSend(v279, "frLicensePlateStructure");
                    v291 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v291, "supportedPlateAlphabetLetters");
                    v292 = objc_claimAutoreleasedReturnValue();
LABEL_318:
                    v293 = (void *)v292;
                    break;
                  case 3:
                    objc_msgSend(v279, "frLicensePlateStructure");
                    v291 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v291, "supportedPlateNumerics");
                    v292 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_318;
                  default:
                    v293 = 0;
LABEL_322:
                    if ((locationd & 1) != 0)
                      v297 = 0;
                    else
                      v297 = (void *)v289[5];
                    v298 = v297;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v279, "fillType"));
                    v299 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v298, "objectForKeyedSubscript:", v299);
                    v300 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v300)
                    {
                      v301 = (void *)MEMORY[0x1E0C99E10];
                      objc_msgSend(v300, "mnlpr_componentsSeparatedByGlyph");
                      v302 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v301, "orderedSetWithArray:", v302);
                      v303 = (void *)objc_claimAutoreleasedReturnValue();

                      v304 = (void *)MEMORY[0x1E0C99E40];
                      objc_msgSend(v293, "mnlpr_componentsSeparatedByGlyph");
                      v305 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v304, "orderedSetWithArray:", v305);
                      v306 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v303, "intersectOrderedSet:", v306);
                      objc_msgSend(v303, "array");
                      v307 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v307, "componentsJoinedByString:", &stru_1E61D9090);
                      v308 = objc_claimAutoreleasedReturnValue();

                      v293 = (void *)v308;
                    }
                    if ((locationd & 1) != 0)
                      v309 = 0;
                    else
                      v309 = (void *)v289[5];
                    v310 = v309;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v279, "fillType"));
                    v311 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v310, "setObject:forKeyedSubscript:", v293, v311);

                    goto LABEL_329;
                }

                goto LABEL_322;
              }
LABEL_304:

              ++v433;
            }
            while (v433 != v423);
            v312 = objc_msgSend(v417, "countByEnumeratingWithState:objects:count:", &v461, v569, 16);
            v423 = v312;
          }
          while (v312);
        }

        MNGetMNLPRRuleMatcherLog();
        v313 = objc_claimAutoreleasedReturnValue();
        v314 = v313;
        v315 = v427->_signpost;
        if (v315 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v313))
        {
          *(_WORD *)v565 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v314, OS_SIGNPOST_INTERVAL_END, v315, "BuildFillRules", ", v565, 2u);
        }

        *(_QWORD *)v565 = 0;
        v566 = v565;
        v567 = 0x2020000000;
        v568 = 0;
        v457 = 0;
        v458 = &v457;
        v459 = 0x2020000000;
        v460 = 1;
        v316 = (void *)MEMORY[0x1E0C99DE8];
        if (obj)
          v317 = -[GEOLPRVehicle count](obj->_vehicle, "count");
        else
          v317 = 0;
        objc_msgSend(v316, "arrayWithCapacity:", v317);
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        MNGetMNLPRRuleMatcherLog();
        v319 = objc_claimAutoreleasedReturnValue();
        v320 = v319;
        v321 = v427->_signpost;
        if (v321 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v319))
        {
          *(_WORD *)v561 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v320, OS_SIGNPOST_INTERVAL_BEGIN, v321, "ScoreRules", ", v561, 2u);
        }

        v452[0] = MEMORY[0x1E0C809B0];
        v452[1] = 3221225472;
        v452[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_175;
        v452[3] = &unk_1E61D2EB0;
        v454 = &v592;
        v322 = v318;
        v453 = v322;
        v455 = v565;
        v456 = &v457;
        -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)obj, v452);
        MNGetMNLPRRuleMatcherLog();
        v323 = objc_claimAutoreleasedReturnValue();
        v324 = v323;
        v325 = v427->_signpost;
        if (v325 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v323))
        {
          *(_WORD *)v561 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v324, OS_SIGNPOST_INTERVAL_END, v325, "ScoreRules", ", v561, 2u);
        }

        v326 = (void *)*((_QWORD *)v592.super_class + 5);
        if (v326)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v326);
          MNGetMNLPRRuleMatcherLog();
          v327 = objc_claimAutoreleasedReturnValue();
          v328 = v327;
          v329 = v427->_signpost;
          if (v329 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v327))
          {
            *(_WORD *)v561 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v328, OS_SIGNPOST_INTERVAL_END, v329, "MaskPlate", "failed", v561, 2u);
          }
          v52 = 0;
        }
        else
        {
          v335 = *((_QWORD *)v566 + 3);
          if (obj)
            v336 = -[GEOLPRVehicle count](obj->_vehicle, "count");
          else
            v336 = 0;
          v337 = v458[3];
          if (v335 == v336 || v337 <= 0x3E7)
          {
            v351 = (void *)MEMORY[0x1E0D263E8];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v337);
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v375, "allObjects");
            v353 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v351, "captureHardStopWithScore:digits:cities:", v352, v322, v353);

            if (obj)
              v354 = -[GEOLPRVehicle count](obj->_vehicle, "count");
            else
              v354 = 0;
            objc_msgSend(v322, "componentsJoinedByString:", CFSTR(", "));
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            _mnLPRWrappedError(a6, -105, 0, CFSTR("Plate has %d chars and rules only allow us to mask chars {%@} for %llu permutation"), v355, v356, v357, v358, v354);

            MNGetMNLPRRuleMatcherLog();
            v359 = objc_claimAutoreleasedReturnValue();
            v360 = v359;
            v361 = v427->_signpost;
            if (v361 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v359))
            {
              *(_WORD *)v561 = 0;
              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v360, OS_SIGNPOST_INTERVAL_END, v361, "MaskPlate", "failed", v561, 2u);
            }

            objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("RulesPreventMasking"));
            v52 = 0;
            goto LABEL_403;
          }
          MNGetMNLPRRuleMatcherLog();
          v338 = objc_claimAutoreleasedReturnValue();
          v339 = v338;
          v340 = v427->_signpost;
          if (v340 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v338))
          {
            *(_WORD *)v561 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v339, OS_SIGNPOST_INTERVAL_BEGIN, v340, "ApplyRules", ", v561, 2u);
          }

          v341 = (void *)MEMORY[0x1E0CB37A0];
          -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v341, "stringWithCapacity:", objc_msgSend(v342, "length"));
          v343 = (void *)objc_claimAutoreleasedReturnValue();

          v449[0] = MEMORY[0x1E0C809B0];
          v449[1] = 3221225472;
          v449[2] = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_181;
          v449[3] = &unk_1E61D2ED8;
          v451 = &v592;
          v328 = v343;
          v450 = v328;
          -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)obj, v449);
          MNGetMNLPRRuleMatcherLog();
          v344 = objc_claimAutoreleasedReturnValue();
          v345 = v344;
          v346 = v427->_signpost;
          if (v346 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v344))
          {
            *(_WORD *)v561 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v345, OS_SIGNPOST_INTERVAL_END, v346, "ApplyRules", ", v561, 2u);
          }

          v347 = (void *)*((_QWORD *)v592.super_class + 5);
          if (v347)
          {
            if (a6)
              *a6 = objc_retainAutorelease(v347);
            MNGetMNLPRRuleMatcherLog();
            v348 = objc_claimAutoreleasedReturnValue();
            v349 = v348;
            v350 = v427->_signpost;
            if (v350 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v348))
            {
              *(_WORD *)v561 = 0;
              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v349, OS_SIGNPOST_INTERVAL_END, v350, "MaskPlate", "failed", v561, 2u);
            }

            v52 = 0;
          }
          else
          {
            MNGetMNLPRRuleMatcherLog();
            v362 = objc_claimAutoreleasedReturnValue();
            v363 = v362;
            v364 = v427->_signpost;
            if (v364 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v362))
            {
              *(_WORD *)v561 = 0;
              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v363, OS_SIGNPOST_INTERVAL_END, v364, "MaskPlate", "success", v561, 2u);
            }

            MNGetMNLPRRuleMatcherLog();
            v365 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v365, OS_LOG_TYPE_DEBUG))
            {
              -[GEOLPRVehicle licensePlate](v427->_vehicle, "licensePlate");
              v366 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v561 = 138478083;
              v562 = v366;
              v563 = 2113;
              v564 = v328;
              _os_log_impl(&dword_1B0AD7000, v365, OS_LOG_TYPE_DEBUG, "Masked plate from \"%{private}@\" -> \"%{private}@\", v561, 0x16u);

            }
            MNGetMNLPRRuleMatcherLog();
            v367 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG))
            {
              v368 = (NSMutableDictionary *)*p_usedRegions;
              *(_DWORD *)v561 = 138477827;
              v562 = v368;
              _os_log_impl(&dword_1B0AD7000, v367, OS_LOG_TYPE_DEBUG, "Used regions: %{private}@", v561, 0xCu);
            }

            MNGetMNLPRRuleMatcherLog();
            v369 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v369, OS_LOG_TYPE_DEBUG))
            {
              usedRegionETAs = v427->_usedRegionETAs;
              *(_DWORD *)v561 = 138477827;
              v562 = usedRegionETAs;
              _os_log_impl(&dword_1B0AD7000, v369, OS_LOG_TYPE_DEBUG, "Used region ETAs: %{private}@", v561, 0xCu);
            }

            v52 = -[NSObject copy](v328, "copy");
          }

        }
LABEL_403:

        _Block_object_dispose(&v457, 8);
        _Block_object_dispose(v565, 8);
        goto LABEL_363;
      }
      _mnLPRWrappedError(a6, -4, 0, CFSTR("Empty vehicle \"%@\"), v22, v23, v24, v25, 0);
      objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("EmptyVehicle"));
    }
    else
    {
      _mnLPRWrappedError(a6, -6, 0, CFSTR("No waypoints specified \"%@\"), v22, v23, v24, v25, (uint64_t)v441);
      objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("EmptyRegions"));
    }
  }
  else
  {
LABEL_9:

    _mnLPRWrappedError(a6, -3, 0, CFSTR("Empty rules \"%@\"), v18, v19, v20, v21, (uint64_t)v427->_ruleSets);
    objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("EmptyRules"));
  }
  v52 = 0;
LABEL_367:

  return v52;
}

id __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  _BYTE v39[128];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(double *)(a1 + 56) >= 1.0)
  {
    MNGetMNLPRRuleMatcherLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CalculateRoughETAs", ", buf, 2u);
    }

    objc_msgSend(v3, "mapRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = *(id *)(a1 + 48);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v15), "coordinate");
          if (objc_msgSend(v9, "containsCoordinate:"))
          {
            GEOCalculateDistance();
            objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", v16 / *(double *)(a1 + 56));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v13);
    }

    objc_msgSend(v9, "intersectionsOnPolyline:", *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v22), "coordinate");
          GEOCalculateDistance();
          objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", v23 / *(double *)(a1 + 56));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v20);
    }
    MNGetMNLPRRuleMatcherLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "CalculateRoughETAs", "success", buf, 2u);
    }

    objc_msgSend(v10, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_154(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D48]);
      v7 = objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      v8 = *(_QWORD *)(a1[7] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v10 = (void *)a1[4];
      if (v10)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "timeZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToTimeZone:", v11);

        if ((v12 & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setTimeZone:", a1[4]);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "timeZone");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[5];
      v15 = *(void **)(v14 + 48);
      *(_QWORD *)(v14 + 48) = v13;

      v5 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    }
    objc_msgSend(v5, "components:fromDate:", 528, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1[6] + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v16 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v4, v3);
  }
  v20 = v4;

  return v20;
}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    MNGetMNLPRRuleMatcherLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138478083;
      v24 = v3;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_FAULT, "Did not find a rough ETA for rule %{private}@ using %{public}@ instead", buf, 0x16u);
    }

    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(v3, "valueMappings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_158;
  v18 = &unk_1E61D2E60;
  v10 = v5;
  v19 = v10;
  v21 = *(id *)(a1 + 56);
  v11 = v4;
  v20 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v15);

  if (objc_msgSend(v11, "count", v15, v16, v17, v18))
  {
    v12 = objc_msgSend(v3, "valueMappingsCount");
    if (v12 > objc_msgSend(v11, "count"))
    {
      v13 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(v13, "valueMappings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectsAtIndexes:", v11);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_158(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v26;
  id obj;
  char v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  if (!objc_msgSend(v30, "timeConditionsCount"))
    goto LABEL_42;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = *(id *)(a1 + 32);
  v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v31)
  {

LABEL_41:
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3, v26);
    goto LABEL_42;
  }
  v26 = a3;
  obj = v5;
  v28 = 0;
  v29 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v37 != v29)
        objc_enumerationMutation(obj);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v30, "timeConditions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            if (objc_msgSend(v13, "dayOfWeeksCount", v26) || objc_msgSend(v13, "dayOfMonthsCount"))
            {
              if (!objc_msgSend(v13, "dayOfWeeksCount"))
                goto LABEL_45;
              v14 = objc_msgSend(v7, "weekday");
              v15 = objc_msgSend(v13, "dayOfWeeks");
              v16 = objc_msgSend(v13, "dayOfWeeksCount");
              if (v16)
              {
                v17 = 0;
                do
                  v18 = *(_DWORD *)(v15 + 4 * v17++);
                while (v17 < v16 && v18 != v14);
                if (v18 == v14)
                {
LABEL_45:
                  if (!objc_msgSend(v13, "dayOfMonthsCount"))
                    goto LABEL_35;
                  v20 = objc_msgSend(v7, "day");
                  v21 = objc_msgSend(v13, "dayOfMonths");
                  v22 = objc_msgSend(v13, "dayOfMonthsCount");
                  if (v22)
                  {
                    v23 = 0;
                    do
                      v24 = *(_DWORD *)(v21 + 4 * v23++);
                    while (v23 < v22 && v24 != v20);
                    if (v24 == v20)
                    {
LABEL_35:
                      v28 = 1;
                      goto LABEL_36;
                    }
                  }
                }
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_36:

    }
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v31);

  a3 = v26;
  if ((v28 & 1) == 0)
    goto LABEL_41;
LABEL_42:

}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_175(_QWORD *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id obj;

  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  v7 = -[_MNLPRPlateCharacter validReplacementCount:](a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  *a4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
  if (v7 > 1)
  {
    v10 = v7;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v10 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) *= v10;
}

void __72__MNLPRRuleMatcher_generateMaskedPlateForWaypoints_date_timeZone_error___block_invoke_181(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id obj;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  obj = v10;
  if (a2)
  {
    -[_MNLPRPlateCharacter _validReplacements:](a2, &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12)
    {
      if (v12 == 1)
        objc_msgSend(v11, "firstObject");
      else
        objc_msgSend(v11, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v11, "count")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    v8 = obj;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(v9, v8);
  v14 = *(_QWORD *)(a1 + 40);
  if (v13 && !*(_QWORD *)(*(_QWORD *)(v14 + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v13);
    v14 = *(_QWORD *)(a1 + 40);
  }
  *a4 = *(_QWORD *)(*(_QWORD *)(v14 + 8) + 40) != 0;

}

- (id)debug_jsonDescriptionOfLastPlate
{
  _MNLPRPlate *lastPlate;
  void *v4;
  _MNLPRPlate *v5;
  uint64_t v6;
  void *v7;
  _MNLPRPlate *v8;
  uint64_t v9;
  id v10;
  _MNLPRPlate *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *usedRegions;
  NSMutableDictionary *usedRegionETAs;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[7];
  _QWORD v37[7];
  _QWORD v38[5];
  _QWORD v39[6];

  v39[5] = *MEMORY[0x1E0C80C00];
  lastPlate = self->_lastPlate;
  if (lastPlate && -[NSArray count](lastPlate->_chars, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    v5 = self->_lastPlate;
    if (v5)
      v6 = -[NSArray count](v5->_chars, "count");
    else
      v6 = 0;
    objc_msgSend(v4, "arrayWithCapacity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lastPlate;
    v9 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke;
    v34[3] = &unk_1E61D2F00;
    v10 = v7;
    v35 = v10;
    -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)v8, v34);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v11 = self->_lastPlate;
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke_2;
    v25[3] = &unk_1E61D2F28;
    v25[4] = &v30;
    v25[5] = &v26;
    -[_MNLPRPlate enumerateCharsUsingBlock:]((uint64_t)v11, v25);
    v12 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v12, "setTimeZone:", self->_lastTimeZone);
    objc_msgSend(v12, "stringFromDate:", self->_lastDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTimeZone name](self->_lastTimeZone, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v10;
    v36[0] = CFSTR("values");
    v36[1] = CFSTR("permutations");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v15;
    v36[2] = CFSTR("unmaskableValues");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31[3]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v16;
    v36[3] = CFSTR("date");
    v17 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37[3] = v17;
    v36[4] = CFSTR("timeZone");
    v18 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    usedRegions = self->_usedRegions;
    usedRegionETAs = self->_usedRegionETAs;
    v37[4] = v18;
    v37[5] = usedRegions;
    v36[5] = CFSTR("usedRegions");
    v36[6] = CFSTR("usedRegionETAs");
    v37[6] = usedRegionETAs;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)

    if (!v13)
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    v22 = v35;
  }
  else
  {
    v38[0] = CFSTR("values");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v39[0] = v10;
    v39[1] = &unk_1E620F080;
    v38[1] = CFSTR("permutations");
    v38[2] = CFSTR("unmaskableValues");
    v39[2] = &unk_1E620F098;
    v38[3] = CFSTR("date");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v22;
    v38[4] = CFSTR("timeZone");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

void __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (uint64_t)v2;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  if (v2)
    v5 = (void *)v2[5];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (v3)
    v8 = *(void **)(v3 + 40);
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "intValue");
        if ((v14 - 1) >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_1E61D2F48[(int)v14 - 1];
        }
        objc_msgSend(v7, "addObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v11);
  }

  v26 = *(void **)(a1 + 32);
  v33[0] = CFSTR("glyph");
  if (v3)
    v16 = *(void **)(v3 + 32);
  else
    v16 = 0;
  v28 = v16;
  v34[0] = v28;
  v33[1] = CFSTR("isPickup");
  if (v3)
    v17 = *(_BYTE *)(v3 + 24) != 0;
  else
    v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  v33[2] = CFSTR("mappings");
  -[_MNLPRPlateCharacter valueMappings]((id *)v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    -[_MNLPRPlateCharacter valueMappings]((id *)v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v20;
  v33[3] = CFSTR("fills");
  v21 = objc_msgSend(v7, "count");
  v22 = v7;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[3] = v22;
  v33[4] = CFSTR("replacements");
  -[_MNLPRPlateCharacter _validReplacements:](v3, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v25);

  if (!v23)
  if (!v21)

}

unint64_t __52__MNLPRRuleMatcher_debug_jsonDescriptionOfLastPlate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v4;

  result = -[_MNLPRPlateCharacter validReplacementCount:](a2, 0);
  if (result > 1)
  {
    v4 = result;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) *= v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedRegionETAs, 0);
  objc_storeStrong((id *)&self->_usedRegions, 0);
  objc_storeStrong((id *)&self->_lastTimeZone, 0);
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_lastPlate, 0);
  objc_storeStrong((id *)&self->_ruleSets, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
