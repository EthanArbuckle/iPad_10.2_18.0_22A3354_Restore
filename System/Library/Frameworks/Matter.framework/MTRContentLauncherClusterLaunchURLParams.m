@implementation MTRContentLauncherClusterLaunchURLParams

- (MTRContentLauncherClusterLaunchURLParams)init
{
  MTRContentLauncherClusterLaunchURLParams *v2;
  MTRContentLauncherClusterLaunchURLParams *v3;
  NSString *contentURL;
  NSString *displayString;
  MTRContentLauncherClusterBrandingInformationStruct *brandingInformation;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRContentLauncherClusterLaunchURLParams;
  v2 = -[MTRContentLauncherClusterLaunchURLParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    contentURL = v2->_contentURL;
    v2->_contentURL = (NSString *)&stru_2505249E8;

    displayString = v3->_displayString;
    v3->_displayString = 0;

    brandingInformation = v3->_brandingInformation;
    v3->_brandingInformation = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterLaunchURLParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRContentLauncherClusterLaunchURLParams);
  objc_msgSend_contentURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentURL_(v4, v8, (uint64_t)v7);

  objc_msgSend_displayString(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisplayString_(v4, v12, (uint64_t)v11);

  objc_msgSend_brandingInformation(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBrandingInformation_(v4, v16, (uint64_t)v15);

  objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: contentURL:%@; displayString:%@; brandingInformation:%@; >"),
    v5,
    self->_contentURL,
    self->_displayString,
    self->_brandingInformation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(NSString *)contentURL
{
  objc_setProperty_nonatomic_copy(self, a2, contentURL, 8);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(NSString *)displayString
{
  objc_setProperty_nonatomic_copy(self, a2, displayString, 16);
}

- (MTRContentLauncherClusterBrandingInformationStruct)brandingInformation
{
  return self->_brandingInformation;
}

- (void)setBrandingInformation:(MTRContentLauncherClusterBrandingInformationStruct *)brandingInformation
{
  objc_setProperty_nonatomic_copy(self, a2, brandingInformation, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 32);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_brandingInformation, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  id v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  id v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  id v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  id v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  id v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  uint64_t v370;
  id v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  void *v377;
  const char *v378;
  uint64_t v379;
  void *v380;
  const char *v381;
  uint64_t v382;
  void *v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  void *v390;
  const char *v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  void *v402;
  const char *v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  void *v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  const char *v412;
  uint64_t v413;
  void *v414;
  const char *v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  void *v423;
  const char *v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  id v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  void *v456;
  const char *v457;
  uint64_t v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  id v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  void *v474;
  const char *v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  void *v489;
  const char *v490;
  uint64_t v491;
  void *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  const char *v496;
  uint64_t v497;
  void *v498;
  const char *v499;
  uint64_t v500;
  void *v501;
  const char *v502;
  uint64_t v503;
  void *v504;
  const char *v505;
  uint64_t v506;
  void *v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  const char *v511;
  uint64_t v512;
  void *v513;
  const char *v514;
  uint64_t v515;
  void *v516;
  const char *v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  void *v522;
  const char *v523;
  uint64_t v524;
  char v526[64];
  void *v527;
  uint64_t v528;
  uint64_t v529;
  char v530;
  uint64_t v531;
  _QWORD *v532;
  _QWORD v533[2];
  __int128 v534;
  char v535;
  __int128 v536;
  char v537;
  __int128 v538;
  _OWORD v539[6];
  _OWORD v540[2];
  __int128 v541;
  __int128 v542;
  __int128 v543;
  _OWORD v544[6];
  _OWORD v545[2];
  __int128 v546;
  __int128 v547;
  __int128 v548;
  _BYTE v549[88];
  _BYTE v550[24];

  v537 = 0;
  v534 = 0uLL;
  v535 = 0;
  v533[0] = 0;
  v533[1] = 0;
  v532 = v533;
  objc_msgSend_contentURL(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_UTF8String(v7, v8, v9);
  v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v7, v11, 4);
  sub_233CAF22C(v526, v10, v12);

  v534 = *(_OWORD *)v526;
  objc_msgSend_displayString(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v535 = 1;
    v536 = 0uLL;
    objc_msgSend_displayString(self, v16, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend_UTF8String(v18, v19, v20);
    v23 = objc_msgSend_lengthOfBytesUsingEncoding_(v18, v22, 4);
    sub_233CAF22C(v526, v21, v23);

    v536 = *(_OWORD *)v526;
  }
  objc_msgSend_brandingInformation(self, v16, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v537 = 1;
    v538 = 0u;
    memset(v539, 0, sizeof(v539));
    memset(v540, 0, sizeof(v540));
    v541 = 0u;
    v542 = 0u;
    v543 = 0u;
    memset(v544, 0, sizeof(v544));
    memset(v545, 0, sizeof(v545));
    v546 = 0u;
    v547 = 0u;
    v548 = 0u;
    memset(v549, 0, sizeof(v549));
    objc_msgSend_brandingInformation(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_providerName(v27, v28, v29);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend_UTF8String(v30, v31, v32);
    v35 = objc_msgSend_lengthOfBytesUsingEncoding_(v30, v34, 4);
    sub_233CAF22C(v526, v33, v35);

    v538 = *(_OWORD *)v526;
    objc_msgSend_brandingInformation(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_background(v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      LOBYTE(v539[0]) = 1;
      memset((char *)v539 + 8, 0, 80);
      objc_msgSend_brandingInformation(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_background(v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageURL(v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        BYTE8(v539[0]) = 1;
        v539[1] = 0uLL;
        objc_msgSend_brandingInformation(self, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_background(v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageURL(v56, v57, v58);
        v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v62 = objc_msgSend_UTF8String(v59, v60, v61);
        v64 = objc_msgSend_lengthOfBytesUsingEncoding_(v59, v63, 4);
        sub_233CAF22C(v526, v62, v64);

        v539[1] = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v51, v52);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_background(v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_color(v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        LOBYTE(v539[2]) = 1;
        *((_QWORD *)&v539[2] + 1) = 0;
        *(_QWORD *)&v539[3] = 0;
        objc_msgSend_brandingInformation(self, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_background(v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_color(v77, v78, v79);
        v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v83 = objc_msgSend_UTF8String(v80, v81, v82);
        v85 = objc_msgSend_lengthOfBytesUsingEncoding_(v80, v84, 4);
        sub_233CAF22C(v526, v83, v85);

        *(_OWORD *)((char *)&v539[2] + 8) = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v72, v73);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_background(v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_size(v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
      {
        BYTE8(v539[3]) = 1;
        memset(&v539[4], 0, 24);
        objc_msgSend_brandingInformation(self, v42, v43);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_background(v93, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v96, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_width(v99, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v102, v103, v104);
        *(_QWORD *)&v539[4] = v105;

        objc_msgSend_brandingInformation(self, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_background(v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v111, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_height(v114, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v117, v118, v119);
        *((_QWORD *)&v539[4] + 1) = v120;

        objc_msgSend_brandingInformation(self, v121, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_background(v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v126, v127, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_metric(v129, v130, v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v539[5]) = objc_msgSend_unsignedCharValue(v132, v133, v134);

      }
    }
    objc_msgSend_brandingInformation(self, v42, v43);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logo(v135, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (v138)
    {
      BYTE8(v539[5]) = 1;
      memset(v540, 0, sizeof(v540));
      v541 = 0u;
      v542 = 0u;
      v543 = 0u;
      objc_msgSend_brandingInformation(self, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logo(v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageURL(v144, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();

      if (v147)
      {
        LOBYTE(v540[0]) = 1;
        *((_QWORD *)&v540[0] + 1) = 0;
        *(_QWORD *)&v540[1] = 0;
        objc_msgSend_brandingInformation(self, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logo(v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageURL(v153, v154, v155);
        v156 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v159 = objc_msgSend_UTF8String(v156, v157, v158);
        v161 = objc_msgSend_lengthOfBytesUsingEncoding_(v156, v160, 4);
        sub_233CAF22C(v526, v159, v161);

        *(_OWORD *)((char *)v540 + 8) = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v148, v149);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logo(v162, v163, v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_color(v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      if (v168)
      {
        BYTE8(v540[1]) = 1;
        v541 = 0uLL;
        objc_msgSend_brandingInformation(self, v169, v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logo(v171, v172, v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_color(v174, v175, v176);
        v177 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v180 = objc_msgSend_UTF8String(v177, v178, v179);
        v182 = objc_msgSend_lengthOfBytesUsingEncoding_(v177, v181, 4);
        sub_233CAF22C(v526, v180, v182);

        v541 = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v169, v170);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logo(v183, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_size(v186, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();

      if (v189)
      {
        LOBYTE(v542) = 1;
        v543 = 0uLL;
        *((_QWORD *)&v542 + 1) = 0;
        objc_msgSend_brandingInformation(self, v139, v140);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logo(v190, v191, v192);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v193, v194, v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_width(v196, v197, v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v199, v200, v201);
        *((_QWORD *)&v542 + 1) = v202;

        objc_msgSend_brandingInformation(self, v203, v204);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logo(v205, v206, v207);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v208, v209, v210);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_height(v211, v212, v213);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v214, v215, v216);
        *(_QWORD *)&v543 = v217;

        objc_msgSend_brandingInformation(self, v218, v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logo(v220, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v223, v224, v225);
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_metric(v226, v227, v228);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE8(v543) = objc_msgSend_unsignedCharValue(v229, v230, v231);

      }
    }
    objc_msgSend_brandingInformation(self, v139, v140);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_progressBar(v232, v233, v234);
    v235 = (void *)objc_claimAutoreleasedReturnValue();

    if (v235)
    {
      LOBYTE(v544[0]) = 1;
      memset((char *)v544 + 8, 0, 80);
      objc_msgSend_brandingInformation(self, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_progressBar(v238, v239, v240);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageURL(v241, v242, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();

      if (v244)
      {
        BYTE8(v544[0]) = 1;
        v544[1] = 0uLL;
        objc_msgSend_brandingInformation(self, v245, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_progressBar(v247, v248, v249);
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageURL(v250, v251, v252);
        v253 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v256 = objc_msgSend_UTF8String(v253, v254, v255);
        v258 = objc_msgSend_lengthOfBytesUsingEncoding_(v253, v257, 4);
        sub_233CAF22C(v526, v256, v258);

        v544[1] = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v245, v246);
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_progressBar(v259, v260, v261);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_color(v262, v263, v264);
      v265 = (void *)objc_claimAutoreleasedReturnValue();

      if (v265)
      {
        LOBYTE(v544[2]) = 1;
        *((_QWORD *)&v544[2] + 1) = 0;
        *(_QWORD *)&v544[3] = 0;
        objc_msgSend_brandingInformation(self, v266, v267);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_progressBar(v268, v269, v270);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_color(v271, v272, v273);
        v274 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v277 = objc_msgSend_UTF8String(v274, v275, v276);
        v279 = objc_msgSend_lengthOfBytesUsingEncoding_(v274, v278, 4);
        sub_233CAF22C(v526, v277, v279);

        *(_OWORD *)((char *)&v544[2] + 8) = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v266, v267);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_progressBar(v280, v281, v282);
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_size(v283, v284, v285);
      v286 = (void *)objc_claimAutoreleasedReturnValue();

      if (v286)
      {
        BYTE8(v544[3]) = 1;
        memset(&v544[4], 0, 24);
        objc_msgSend_brandingInformation(self, v236, v237);
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_progressBar(v287, v288, v289);
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v290, v291, v292);
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_width(v293, v294, v295);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v296, v297, v298);
        *(_QWORD *)&v544[4] = v299;

        objc_msgSend_brandingInformation(self, v300, v301);
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_progressBar(v302, v303, v304);
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v305, v306, v307);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_height(v308, v309, v310);
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v311, v312, v313);
        *((_QWORD *)&v544[4] + 1) = v314;

        objc_msgSend_brandingInformation(self, v315, v316);
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_progressBar(v317, v318, v319);
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v320, v321, v322);
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_metric(v323, v324, v325);
        v326 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v544[5]) = objc_msgSend_unsignedCharValue(v326, v327, v328);

      }
    }
    objc_msgSend_brandingInformation(self, v236, v237);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_splash(v329, v330, v331);
    v332 = (void *)objc_claimAutoreleasedReturnValue();

    if (v332)
    {
      BYTE8(v544[5]) = 1;
      memset(v545, 0, sizeof(v545));
      v546 = 0u;
      v547 = 0u;
      v548 = 0u;
      objc_msgSend_brandingInformation(self, v333, v334);
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_splash(v335, v336, v337);
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageURL(v338, v339, v340);
      v341 = (void *)objc_claimAutoreleasedReturnValue();

      if (v341)
      {
        LOBYTE(v545[0]) = 1;
        *((_QWORD *)&v545[0] + 1) = 0;
        *(_QWORD *)&v545[1] = 0;
        objc_msgSend_brandingInformation(self, v342, v343);
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_splash(v344, v345, v346);
        v347 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageURL(v347, v348, v349);
        v350 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v353 = objc_msgSend_UTF8String(v350, v351, v352);
        v355 = objc_msgSend_lengthOfBytesUsingEncoding_(v350, v354, 4);
        sub_233CAF22C(v526, v353, v355);

        *(_OWORD *)((char *)v545 + 8) = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v342, v343);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_splash(v356, v357, v358);
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_color(v359, v360, v361);
      v362 = (void *)objc_claimAutoreleasedReturnValue();

      if (v362)
      {
        BYTE8(v545[1]) = 1;
        v546 = 0uLL;
        objc_msgSend_brandingInformation(self, v363, v364);
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_splash(v365, v366, v367);
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_color(v368, v369, v370);
        v371 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v374 = objc_msgSend_UTF8String(v371, v372, v373);
        v376 = objc_msgSend_lengthOfBytesUsingEncoding_(v371, v375, 4);
        sub_233CAF22C(v526, v374, v376);

        v546 = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v363, v364);
      v377 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_splash(v377, v378, v379);
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_size(v380, v381, v382);
      v383 = (void *)objc_claimAutoreleasedReturnValue();

      if (v383)
      {
        LOBYTE(v547) = 1;
        *((_QWORD *)&v547 + 1) = 0;
        v548 = 0uLL;
        objc_msgSend_brandingInformation(self, v333, v334);
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_splash(v384, v385, v386);
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v387, v388, v389);
        v390 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_width(v390, v391, v392);
        v393 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v393, v394, v395);
        *((_QWORD *)&v547 + 1) = v396;

        objc_msgSend_brandingInformation(self, v397, v398);
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_splash(v399, v400, v401);
        v402 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v402, v403, v404);
        v405 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_height(v405, v406, v407);
        v408 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v408, v409, v410);
        *(_QWORD *)&v548 = v411;

        objc_msgSend_brandingInformation(self, v412, v413);
        v414 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_splash(v414, v415, v416);
        v417 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v417, v418, v419);
        v420 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_metric(v420, v421, v422);
        v423 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE8(v548) = objc_msgSend_unsignedCharValue(v423, v424, v425);

      }
    }
    objc_msgSend_brandingInformation(self, v333, v334);
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waterMark(v426, v427, v428);
    v429 = (void *)objc_claimAutoreleasedReturnValue();

    if (v429)
    {
      v549[0] = 1;
      memset(&v549[8], 0, 80);
      objc_msgSend_brandingInformation(self, v430, v431);
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_waterMark(v432, v433, v434);
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageURL(v435, v436, v437);
      v438 = (void *)objc_claimAutoreleasedReturnValue();

      if (v438)
      {
        v549[8] = 1;
        *(_OWORD *)&v549[16] = 0uLL;
        objc_msgSend_brandingInformation(self, v439, v440);
        v441 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_waterMark(v441, v442, v443);
        v444 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageURL(v444, v445, v446);
        v447 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v450 = objc_msgSend_UTF8String(v447, v448, v449);
        v452 = objc_msgSend_lengthOfBytesUsingEncoding_(v447, v451, 4);
        sub_233CAF22C(v526, v450, v452);

        *(_OWORD *)&v549[16] = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v439, v440);
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_waterMark(v453, v454, v455);
      v456 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_color(v456, v457, v458);
      v459 = (void *)objc_claimAutoreleasedReturnValue();

      if (v459)
      {
        v549[32] = 1;
        *(_QWORD *)&v549[40] = 0;
        *(_QWORD *)&v549[48] = 0;
        objc_msgSend_brandingInformation(self, v460, v461);
        v462 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_waterMark(v462, v463, v464);
        v465 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_color(v465, v466, v467);
        v468 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v471 = objc_msgSend_UTF8String(v468, v469, v470);
        v473 = objc_msgSend_lengthOfBytesUsingEncoding_(v468, v472, 4);
        sub_233CAF22C(v526, v471, v473);

        *(_OWORD *)&v549[40] = *(_OWORD *)v526;
      }
      objc_msgSend_brandingInformation(self, v460, v461);
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_waterMark(v474, v475, v476);
      v477 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_size(v477, v478, v479);
      v480 = (void *)objc_claimAutoreleasedReturnValue();

      if (v480)
      {
        v549[56] = 1;
        memset(&v549[64], 0, 24);
        objc_msgSend_brandingInformation(self, v481, v482);
        v483 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_waterMark(v483, v484, v485);
        v486 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v486, v487, v488);
        v489 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_width(v489, v490, v491);
        v492 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v492, v493, v494);
        *(_QWORD *)&v549[64] = v495;

        objc_msgSend_brandingInformation(self, v496, v497);
        v498 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_waterMark(v498, v499, v500);
        v501 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v501, v502, v503);
        v504 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_height(v504, v505, v506);
        v507 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v507, v508, v509);
        *(_QWORD *)&v549[72] = v510;

        objc_msgSend_brandingInformation(self, v511, v512);
        v513 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_waterMark(v513, v514, v515);
        v516 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_size(v516, v517, v518);
        v519 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_metric(v519, v520, v521);
        v522 = (void *)objc_claimAutoreleasedReturnValue();
        v549[80] = objc_msgSend_unsignedCharValue(v522, v523, v524);

      }
    }
  }
  sub_234118674(0x62FuLL, 0, &v531);
  if (v531)
  {
    sub_234106C48((uint64_t)v526);
    v528 = 0;
    v529 = 0;
    v527 = &unk_250504030;
    v530 = 0;
    sub_233CAF098((uint64_t)&v527, &v531, 0);
    sub_234106CA8((uint64_t)v526, (uint64_t)&v527, 0xFFFFFFFF, (uint64_t)v550);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D39BDC((uint64_t)&v534, v526, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v526, &v531, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v531);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v527 = &unk_250504030;
    sub_233CAF128(&v529);
    sub_233CAF128(&v528);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 29159;
  }
  sub_233CAF128(&v531);
  return (ChipError *)sub_233CAF15C((uint64_t)&v532);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 29188;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
