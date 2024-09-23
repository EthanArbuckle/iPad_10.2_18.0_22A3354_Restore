@implementation MTRChannelClusterProgramGuideResponseParams

- (MTRChannelClusterProgramGuideResponseParams)init
{
  MTRChannelClusterProgramGuideResponseParams *v2;
  uint64_t v3;
  MTRChannelClusterChannelPagingStruct *paging;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *programList;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRChannelClusterProgramGuideResponseParams;
  v2 = -[MTRChannelClusterProgramGuideResponseParams init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    paging = v2->_paging;
    v2->_paging = (MTRChannelClusterChannelPagingStruct *)v3;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    programList = v2->_programList;
    v2->_programList = (NSArray *)v7;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterProgramGuideResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRChannelClusterProgramGuideResponseParams);
  objc_msgSend_paging(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPaging_(v4, v8, (uint64_t)v7);

  objc_msgSend_programList(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgramList_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: paging:%@; programList:%@; >"),
    v5,
    self->_paging,
    self->_programList);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRChannelClusterProgramGuideResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRChannelClusterProgramGuideResponseParams *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  char *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  MTRChannelClusterProgramGuideResponseParams *v31;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[72];
  uint64_t v38;
  objc_super v39;
  uint64_t v40;
  void *v41;
  __int128 buf;
  uint64_t v43;
  char v44;
  _BYTE v45[88];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTRChannelClusterProgramGuideResponseParams;
  v8 = -[MTRChannelClusterProgramGuideResponseParams init](&v39, sel_init);
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1284, 5, a4);
  if (v38)
  {
    sub_234104468((uint64_t)v37);
    sub_234104498((uint64_t)v37, *(_QWORD *)(v38 + 8), *(_QWORD *)(v38 + 24));
    v35 = 0uLL;
    v36 = 0;
    sub_234105EE4((uint64_t)v37, 256, &v35);
    if (!(_DWORD)v35)
    {
      LOBYTE(buf) = 0;
      v44 = 0;
      sub_234104468((uint64_t)v45);
      v45[72] = 0;
      sub_234104498(v9, 0, 0);
      sub_233D35534((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
      v35 = v33;
      v36 = v34;
      if (!(_DWORD)v33)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v10, (uint64_t)&buf);
        v35 = v33;
        v36 = v34;
        if (!(_DWORD)v33)
        {
          v31 = v8;
          goto LABEL_14;
        }
      }
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    buf = v35;
    v43 = v36;
    v12 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("Command payload decoding failed: %s"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_retainAutorelease(v14);
      v19 = objc_msgSend_UTF8String(v16, v17, v18);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v22 = objc_retainAutorelease(v14);
      objc_msgSend_UTF8String(v22, v23, v24);
      sub_2341147D0(0, 1);
    }
    if (a4)
    {
      v40 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_2505249E8, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)&v41, &v40, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v30, (uint64_t)CFSTR("MTRErrorDomain"), 13, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v31 = 0;
LABEL_14:
  sub_233CAF128(&v38);
LABEL_16:

  return v31;
}

- (MTRChannelClusterChannelPagingStruct)paging
{
  return self->_paging;
}

- (void)setPaging:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)programList
{
  return self->_programList;
}

- (void)setProgramList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programList, 0);
  objc_storeStrong((id *)&self->_paging, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _BYTE *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  _BYTE *v20;
  _BYTE *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  _BYTE *v36;
  const char *v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  ChipError *result;
  __int128 *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  _BYTE *v69;
  const char *v70;
  uint64_t v71;
  _BYTE *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  _BYTE *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  _BYTE *v110;
  _BYTE *v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  _BYTE *v126;
  const char *v127;
  uint64_t v128;
  _BYTE *v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  const char *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  _BYTE *v157;
  const char *v158;
  uint64_t v159;
  _BYTE *v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  const char *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  unint64_t v187;
  unint64_t v188;
  ChipError *v189;
  const char *v190;
  unint64_t v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  id v195;
  const char *v196;
  void *v197;
  const char *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  void *v202;
  const char *v203;
  const char *v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  const char *v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  const char *v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t v220;
  id v221;
  const char *v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t *v238;
  uint64_t v239;
  uint64_t v240;
  id v241;
  const char *v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t *v258;
  uint64_t v259;
  uint64_t v260;
  id v261;
  const char *v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t *v278;
  uint64_t v279;
  uint64_t v280;
  id v281;
  const char *v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
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
  void *v298;
  _BYTE *v299;
  const char *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  const char *v306;
  const char *v307;
  void *v308;
  const char *v309;
  const char *v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  id v315;
  const char *v316;
  void *v317;
  const char *v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t *v323;
  uint64_t v324;
  uint64_t v325;
  id v326;
  const char *v327;
  void *v328;
  const char *v329;
  const char *v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t *v334;
  uint64_t v335;
  uint64_t v336;
  id v337;
  const char *v338;
  void *v339;
  const char *v340;
  const char *v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  void *v345;
  _BYTE *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  id v350;
  const char *v351;
  const char *v352;
  void *v353;
  const char *v354;
  _BYTE *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  id v359;
  const char *v360;
  const char *v361;
  void *v362;
  const char *v363;
  uint64_t *v364;
  uint64_t v365;
  uint64_t v366;
  id v367;
  const char *v368;
  void *v369;
  const char *v370;
  const char *v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t *v375;
  uint64_t v376;
  uint64_t v377;
  id v378;
  const char *v379;
  void *v380;
  const char *v381;
  const char *v382;
  uint64_t v383;
  void *v384;
  const char *v385;
  uint64_t *v386;
  uint64_t v387;
  uint64_t v388;
  id v389;
  const char *v390;
  void *v391;
  const char *v392;
  const char *v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t *v397;
  uint64_t v398;
  uint64_t v399;
  id v400;
  const char *v401;
  void *v402;
  const char *v403;
  const char *v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t *v408;
  uint64_t v409;
  uint64_t v410;
  id v411;
  const char *v412;
  void *v413;
  const char *v414;
  const char *v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  void *v419;
  _BYTE *v420;
  const char *v421;
  void *v422;
  const char *v423;
  const char *v424;
  void *v425;
  const char *v426;
  _BYTE *v427;
  uint64_t v428;
  uint64_t v429;
  id v430;
  const char *v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  const char *v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  void *v442;
  _BYTE *v443;
  uint64_t v444;
  uint64_t v445;
  id v446;
  const char *v447;
  void *v448;
  const char *v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  const char *v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  void *v458;
  const char *v459;
  void *v460;
  _BYTE *v461;
  const char *v462;
  void *v463;
  uint64_t v464;
  uint64_t v465;
  id v466;
  const char *v467;
  void *v468;
  const char *v469;
  const char *v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t *v474;
  uint64_t v475;
  uint64_t v476;
  id v477;
  const char *v478;
  void *v479;
  const char *v480;
  const char *v481;
  uint64_t v482;
  void *v483;
  const char *v484;
  const char *v485;
  _BYTE *v486;
  const char *v487;
  void *v488;
  uint64_t v489;
  uint64_t v490;
  id v491;
  const char *v492;
  void *v493;
  const char *v494;
  const char *v495;
  uint64_t v496;
  void *v497;
  __int128 v498;
  id v499;
  const char *v500;
  void *v501;
  const char *v502;
  const char *v503;
  uint64_t v504;
  void *v505;
  const char *v506;
  const char *v507;
  _BYTE *v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  id v512;
  const char *v513;
  void *v514;
  const char *v515;
  const char *v516;
  uint64_t v517;
  void *v518;
  __int128 v519;
  id v520;
  const char *v521;
  void *v522;
  const char *v523;
  const char *v524;
  uint64_t v525;
  void *v526;
  const char *v527;
  const char *v528;
  __int128 *v529;
  __int128 *v530;
  __int128 *v531;
  __int128 *v532;
  uint64_t *v533;
  void *v534;
  uint64_t v535;
  uint64_t v536;
  __int128 v537;
  uint64_t v538;
  __int128 v539;
  uint64_t v540;
  _QWORD v541[2];
  unsigned __int16 v542;
  unsigned __int16 v543;
  _BYTE v544[24];
  _BYTE v545[24];
  _BYTE v546[24];
  _BYTE v547[24];
  _BYTE v548[8];
  unsigned int v549;
  unsigned int v550;
  uint64_t v551;
  uint64_t v552;
  _BYTE v553[24];
  _BYTE v554[24];
  _BYTE v555[88];
  _BYTE v556[88];
  _BYTE v557[24];
  _BYTE v558[24];
  _BYTE v559[24];
  _BYTE v560[24];
  _BYTE v561[24];
  _BYTE v562[8];
  _BYTE v563[48];
  _BYTE v564[88];
  _BYTE v565[88];
  _BYTE v566[88];
  __int128 v567;
  uint64_t v568;
  unsigned __int8 v569;
  char v570;

  v7 = (void *)objc_opt_new();
  objc_msgSend_setPaging_(self, v8, (uint64_t)v7);

  if (!*(_BYTE *)a4 || !sub_233C25EA4(a4)[56])
  {
    objc_msgSend_paging(self, v9, v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreviousToken_(v31, v32, 0);
LABEL_22:

    goto LABEL_23;
  }
  v11 = (void *)objc_opt_new();
  objc_msgSend_paging(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousToken_(v14, v15, (uint64_t)v11);

  v16 = sub_233C25EA4(a4);
  if (!v16[56])
    goto LABEL_199;
  if (*v16)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    v20 = sub_233C25EA4(a4);
    if (!v20[56])
      goto LABEL_199;
    v21 = sub_233C05D98(v20);
    objc_msgSend_numberWithUnsignedShort_(v19, v22, *(unsigned __int16 *)v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_paging(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousToken(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLimit_(v29, v30, (uint64_t)v23);

  }
  else
  {
    objc_msgSend_paging(self, v17, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousToken(v23, v33, v34);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLimit_(v26, v35, 0);
  }

  v36 = sub_233C25EA4(a4);
  if (!v36[56])
    goto LABEL_199;
  if (v36[8])
  {
    v39 = sub_233C25EA4(a4);
    if (!v39[56])
      goto LABEL_199;
    v40 = (uint64_t *)sub_233C05DB8(v39 + 8);
    v41 = *v40;
    v42 = v40[1];
    v43 = objc_alloc(MEMORY[0x24BDD17C8]);
    v45 = (void *)objc_msgSend_initWithBytes_length_encoding_(v43, v44, v41, v42, 4);
    objc_msgSend_paging(self, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousToken(v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAfter_(v51, v52, (uint64_t)v45);

    objc_msgSend_paging(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousToken(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_after(v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
    {
      v63 = &xmmword_2504EEE08;
LABEL_43:
      *(_OWORD *)&retstr->mError = *v63;
      *(_QWORD *)&retstr->mLine = *((_QWORD *)v63 + 2);
      return result;
    }
  }
  else
  {
    objc_msgSend_paging(self, v37, v38);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousToken(v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAfter_(v67, v68, 0);

  }
  v69 = sub_233C25EA4(a4);
  if (!v69[56])
    goto LABEL_199;
  if (!v69[32])
  {
    objc_msgSend_paging(self, v70, v71);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousToken(v31, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBefore_(v99, v100, 0);

    goto LABEL_22;
  }
  v72 = sub_233C25EA4(a4);
  if (!v72[56])
    goto LABEL_199;
  v73 = (uint64_t *)sub_233C05DB8(v72 + 32);
  v74 = *v73;
  v75 = v73[1];
  v76 = objc_alloc(MEMORY[0x24BDD17C8]);
  v78 = (void *)objc_msgSend_initWithBytes_length_encoding_(v76, v77, v74, v75, 4);
  objc_msgSend_paging(self, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_previousToken(v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBefore_(v84, v85, (uint64_t)v78);

  objc_msgSend_paging(self, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_previousToken(v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_before(v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v94)
  {
    v63 = &xmmword_2504EEE20;
    goto LABEL_43;
  }
LABEL_23:
  if (!*((_BYTE *)a4 + 72) || !sub_233C25EA4((_BYTE *)a4 + 72)[56])
  {
    objc_msgSend_paging(self, v95, v96);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNextToken_(v121, v122, 0);
LABEL_45:

    goto LABEL_46;
  }
  v101 = (void *)objc_opt_new();
  objc_msgSend_paging(self, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNextToken_(v104, v105, (uint64_t)v101);

  v106 = sub_233C25EA4((_BYTE *)a4 + 72);
  if (!v106[56])
    goto LABEL_199;
  if (*v106)
  {
    v109 = (void *)MEMORY[0x24BDD16E0];
    v110 = sub_233C25EA4((_BYTE *)a4 + 72);
    if (!v110[56])
      goto LABEL_199;
    v111 = sub_233C05D98(v110);
    objc_msgSend_numberWithUnsignedShort_(v109, v112, *(unsigned __int16 *)v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_paging(self, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextToken(v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLimit_(v119, v120, (uint64_t)v113);

  }
  else
  {
    objc_msgSend_paging(self, v107, v108);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextToken(v113, v123, v124);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLimit_(v116, v125, 0);
  }

  v126 = sub_233C25EA4((_BYTE *)a4 + 72);
  if (!v126[56])
    goto LABEL_199;
  if (v126[8])
  {
    v129 = sub_233C25EA4((_BYTE *)a4 + 72);
    if (!v129[56])
      goto LABEL_199;
    v130 = (uint64_t *)sub_233C05DB8(v129 + 8);
    v131 = *v130;
    v132 = v130[1];
    v133 = objc_alloc(MEMORY[0x24BDD17C8]);
    v135 = (void *)objc_msgSend_initWithBytes_length_encoding_(v133, v134, v131, v132, 4);
    objc_msgSend_paging(self, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextToken(v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAfter_(v141, v142, (uint64_t)v135);

    objc_msgSend_paging(self, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextToken(v145, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_after(v148, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v151)
    {
      v63 = &xmmword_2504EEE38;
      goto LABEL_43;
    }
  }
  else
  {
    objc_msgSend_paging(self, v127, v128);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextToken(v152, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAfter_(v155, v156, 0);

  }
  v157 = sub_233C25EA4((_BYTE *)a4 + 72);
  if (!v157[56])
LABEL_199:
    sub_233CAF304();
  if (!v157[32])
  {
    objc_msgSend_paging(self, v158, v159);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextToken(v121, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBefore_(v185, v186, 0);

    goto LABEL_45;
  }
  v160 = sub_233C25EA4((_BYTE *)a4 + 72);
  if (!v160[56])
    goto LABEL_199;
  v161 = (uint64_t *)sub_233C05DB8(v160 + 32);
  v162 = *v161;
  v163 = v161[1];
  v164 = objc_alloc(MEMORY[0x24BDD17C8]);
  v166 = (void *)objc_msgSend_initWithBytes_length_encoding_(v164, v165, v162, v163, 4);
  objc_msgSend_paging(self, v167, v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextToken(v169, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBefore_(v172, v173, (uint64_t)v166);

  objc_msgSend_paging(self, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextToken(v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_before(v179, v180, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v182)
  {
    v63 = &xmmword_2504EEE50;
    goto LABEL_43;
  }
LABEL_46:
  v534 = (void *)objc_opt_new();
  LOBYTE(v535) = *((_BYTE *)a4 + 216);
  if ((_BYTE)v535)
    BYTE1(v535) = *((_BYTE *)a4 + 217);
  sub_233CB1138((uint64_t)v541, (uint64_t)a4 + 144, (unsigned __int8 *)&v535);
  v533 = &v538;
  v187 = 0x2504EC000uLL;
  v188 = 0x24BDD1000uLL;
  v189 = retstr;
  while (sub_233CB1200((uint64_t)v541))
  {
    v191 = v187;
    v192 = (void *)objc_opt_new();
    v193 = v541[0];
    v194 = v541[1];
    v195 = objc_alloc(MEMORY[0x24BDD17C8]);
    v197 = (void *)objc_msgSend_initWithBytes_length_encoding_(v195, v196, v193, v194, 4);
    objc_msgSend_setIdentifier_(v192, v198, (uint64_t)v197);

    objc_msgSend_identifier(v192, v199, v200);
    v201 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v201)
    {
      v532 = &xmmword_2504EEE68;
      goto LABEL_196;
    }
    v202 = (void *)objc_opt_new();
    objc_msgSend_setChannel_(v192, v203, (uint64_t)v202);

    objc_msgSend_numberWithUnsignedShort_(*(void **)(v188 + 1760), v204, v542);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_channel(v192, v206, v207);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMajorNumber_(v208, v209, (uint64_t)v205);

    objc_msgSend_numberWithUnsignedShort_(*(void **)(v188 + 1760), v210, v543);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_channel(v192, v212, v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMinorNumber_(v214, v215, (uint64_t)v211);

    if (v544[0])
    {
      v218 = (uint64_t *)sub_233C05DB8(v544);
      v219 = *v218;
      v220 = v218[1];
      v221 = objc_alloc(MEMORY[0x24BDD17C8]);
      v223 = (void *)objc_msgSend_initWithBytes_length_encoding_(v221, v222, v219, v220, 4);
      objc_msgSend_channel(v192, v224, v225);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v226, v227, (uint64_t)v223);

      objc_msgSend_channel(v192, v228, v229);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v230, v231, v232);
      v233 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v233)
      {
        v532 = &xmmword_2504EEE80;
LABEL_196:
        *(_OWORD *)&retstr->mError = *v532;
        *(_QWORD *)&retstr->mLine = *((_QWORD *)v532 + 2);
        goto LABEL_197;
      }
    }
    else
    {
      objc_msgSend_channel(v192, v216, v217);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v236, v237, 0);

    }
    if (v545[0])
    {
      v238 = (uint64_t *)sub_233C05DB8(v545);
      v239 = *v238;
      v240 = v238[1];
      v241 = objc_alloc(MEMORY[0x24BDD17C8]);
      v243 = (void *)objc_msgSend_initWithBytes_length_encoding_(v241, v242, v239, v240, 4);
      objc_msgSend_channel(v192, v244, v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCallSign_(v246, v247, (uint64_t)v243);

      objc_msgSend_channel(v192, v248, v249);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_callSign(v250, v251, v252);
      v253 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v253)
      {
        v532 = &xmmword_2504EEE98;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_channel(v192, v234, v235);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCallSign_(v256, v257, 0);

    }
    if (v546[0])
    {
      v258 = (uint64_t *)sub_233C05DB8(v546);
      v259 = *v258;
      v260 = v258[1];
      v261 = objc_alloc(MEMORY[0x24BDD17C8]);
      v263 = (void *)objc_msgSend_initWithBytes_length_encoding_(v261, v262, v259, v260, 4);
      objc_msgSend_channel(v192, v264, v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAffiliateCallSign_(v266, v267, (uint64_t)v263);

      objc_msgSend_channel(v192, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_affiliateCallSign(v270, v271, v272);
      v273 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v273)
      {
        v532 = &xmmword_2504EEEB0;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_channel(v192, v254, v255);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAffiliateCallSign_(v276, v277, 0);

    }
    if (v547[0])
    {
      v278 = (uint64_t *)sub_233C05DB8(v547);
      v279 = *v278;
      v280 = v278[1];
      v281 = objc_alloc(MEMORY[0x24BDD17C8]);
      v283 = (void *)objc_msgSend_initWithBytes_length_encoding_(v281, v282, v279, v280, 4);
      objc_msgSend_channel(v192, v284, v285);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIdentifier_(v286, v287, (uint64_t)v283);

      objc_msgSend_channel(v192, v288, v289);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v290, v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v293)
      {
        v532 = &xmmword_2504EEEC8;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_channel(v192, v274, v275);
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIdentifier_(v296, v297, 0);

    }
    if (v548[0])
    {
      v298 = *(void **)(v188 + 1760);
      v299 = sub_233C27DCC(v548);
      objc_msgSend_numberWithUnsignedChar_(v298, v300, *v299);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_channel(v192, v302, v303);
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setType_(v304, v305, (uint64_t)v301);

    }
    else
    {
      objc_msgSend_channel(v192, v294, v295);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setType_(v301, v306, 0);
    }

    objc_msgSend_numberWithUnsignedInt_(*(void **)(v188 + 1760), v307, v549);
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStartTime_(v192, v309, (uint64_t)v308);

    objc_msgSend_numberWithUnsignedInt_(*(void **)(v188 + 1760), v310, v550);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEndTime_(v192, v312, (uint64_t)v311);

    v313 = v551;
    v314 = v552;
    v315 = objc_alloc(MEMORY[0x24BDD17C8]);
    v317 = (void *)objc_msgSend_initWithBytes_length_encoding_(v315, v316, v313, v314, 4);
    objc_msgSend_setTitle_(v192, v318, (uint64_t)v317);

    objc_msgSend_title(v192, v319, v320);
    v321 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v321)
    {
      v532 = &xmmword_2504EEEE0;
      goto LABEL_196;
    }
    if (v553[0])
    {
      v323 = (uint64_t *)sub_233C05DB8(v553);
      v324 = *v323;
      v325 = v323[1];
      v326 = objc_alloc(MEMORY[0x24BDD17C8]);
      v328 = (void *)objc_msgSend_initWithBytes_length_encoding_(v326, v327, v324, v325, 4);
      objc_msgSend_setSubtitle_(v192, v329, (uint64_t)v328);

      objc_msgSend_subtitle(v192, v330, v331);
      v332 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v332)
      {
        v532 = &xmmword_2504EEEF8;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setSubtitle_(v192, v322, 0);
    }
    if (v554[0])
    {
      v334 = (uint64_t *)sub_233C05DB8(v554);
      v335 = *v334;
      v336 = v334[1];
      v337 = objc_alloc(MEMORY[0x24BDD17C8]);
      v339 = (void *)objc_msgSend_initWithBytes_length_encoding_(v337, v338, v335, v336, 4);
      objc_msgSend_setDescriptionString_(v192, v340, (uint64_t)v339);

      objc_msgSend_descriptionString(v192, v341, v342);
      v343 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v343)
      {
        v532 = &xmmword_2504EEF10;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setDescriptionString_(v192, v333, 0);
    }
    if (v555[0])
    {
      v345 = (void *)objc_opt_new();
      v346 = sub_233C25EA4(v555);
      v569 = v346[72];
      if (v569)
        v570 = v346[73];
      sub_233CB15CC((uint64_t)&v535, (uint64_t)v346, &v569);
      while (sub_233CB1638((uint64_t)&v535))
      {
        v349 = v535;
        v348 = v536;
        v350 = objc_alloc(MEMORY[0x24BDD17C8]);
        v353 = (void *)objc_msgSend_initWithBytes_length_encoding_(v350, v351, v349, v348, 4);
        if (!v353)
        {
          v529 = &xmmword_2504EEF28;
          goto LABEL_179;
        }
        objc_msgSend_addObject_(v345, v352, (uint64_t)v353);

        retstr = v189;
      }
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      if ((_DWORD)v537 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
        v188 = 0x24BDD1000;
      }
      else
      {
        *(_OWORD *)&retstr->mError = v537;
        *(_QWORD *)&retstr->mLine = v538;
        v188 = 0x24BDD1000;
        if (retstr->mError)
          goto LABEL_180;
      }
      objc_msgSend_setAudioLanguages_(v192, v347, (uint64_t)v345, v533);

    }
    else
    {
      objc_msgSend_setAudioLanguages_(v192, v344, 0);
    }
    if (v556[0])
    {
      v345 = (void *)objc_opt_new();
      v355 = sub_233C25EA4(v556);
      v569 = v355[72];
      if (v569)
        v570 = v355[73];
      sub_233CB15CC((uint64_t)&v535, (uint64_t)v355, &v569);
      while (sub_233CB1638((uint64_t)&v535))
      {
        v358 = v535;
        v357 = v536;
        v359 = objc_alloc(MEMORY[0x24BDD17C8]);
        v362 = (void *)objc_msgSend_initWithBytes_length_encoding_(v359, v360, v358, v357, 4);
        if (!v362)
        {
          v529 = &xmmword_2504EEF40;
LABEL_179:
          *(_OWORD *)&v189->mError = *v529;
          *(_QWORD *)&v189->mLine = *((_QWORD *)v529 + 2);
LABEL_180:

          goto LABEL_197;
        }
        objc_msgSend_addObject_(v345, v361, (uint64_t)v362);

        retstr = v189;
      }
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      if ((_DWORD)v537 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
        v188 = 0x24BDD1000;
      }
      else
      {
        *(_OWORD *)&retstr->mError = v537;
        *(_QWORD *)&retstr->mLine = v538;
        v188 = 0x24BDD1000uLL;
        if (retstr->mError)
          goto LABEL_180;
      }
      objc_msgSend_setRatings_(v192, v356, (uint64_t)v345, v533);

    }
    else
    {
      objc_msgSend_setRatings_(v192, v354, 0);
    }
    if (v557[0])
    {
      v364 = (uint64_t *)sub_233C05DB8(v557);
      v365 = *v364;
      v366 = v364[1];
      v367 = objc_alloc(MEMORY[0x24BDD17C8]);
      v369 = (void *)objc_msgSend_initWithBytes_length_encoding_(v367, v368, v365, v366, 4);
      objc_msgSend_setThumbnailUrl_(v192, v370, (uint64_t)v369);

      objc_msgSend_thumbnailUrl(v192, v371, v372);
      v373 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v373)
      {
        v532 = &xmmword_2504EEF58;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setThumbnailUrl_(v192, v363, 0);
    }
    if (v558[0])
    {
      v375 = (uint64_t *)sub_233C05DB8(v558);
      v376 = *v375;
      v377 = v375[1];
      v378 = objc_alloc(MEMORY[0x24BDD17C8]);
      v380 = (void *)objc_msgSend_initWithBytes_length_encoding_(v378, v379, v376, v377, 4);
      objc_msgSend_setPosterArtUrl_(v192, v381, (uint64_t)v380);

      objc_msgSend_posterArtUrl(v192, v382, v383);
      v384 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v384)
      {
        v532 = &xmmword_2504EEF70;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setPosterArtUrl_(v192, v374, 0);
    }
    if (v559[0])
    {
      v386 = (uint64_t *)sub_233C05DB8(v559);
      v387 = *v386;
      v388 = v386[1];
      v389 = objc_alloc(MEMORY[0x24BDD17C8]);
      v391 = (void *)objc_msgSend_initWithBytes_length_encoding_(v389, v390, v387, v388, 4);
      objc_msgSend_setDvbiUrl_(v192, v392, (uint64_t)v391);

      objc_msgSend_dvbiUrl(v192, v393, v394);
      v395 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v395)
      {
        v532 = &xmmword_2504EEF88;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setDvbiUrl_(v192, v385, 0);
    }
    if (v560[0])
    {
      v397 = (uint64_t *)sub_233C05DB8(v560);
      v398 = *v397;
      v399 = v397[1];
      v400 = objc_alloc(MEMORY[0x24BDD17C8]);
      v402 = (void *)objc_msgSend_initWithBytes_length_encoding_(v400, v401, v398, v399, 4);
      objc_msgSend_setReleaseDate_(v192, v403, (uint64_t)v402);

      objc_msgSend_releaseDate(v192, v404, v405);
      v406 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v406)
      {
        v532 = &xmmword_2504EEFA0;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setReleaseDate_(v192, v396, 0);
    }
    if (v561[0])
    {
      v408 = (uint64_t *)sub_233C05DB8(v561);
      v409 = *v408;
      v410 = v408[1];
      v411 = objc_alloc(MEMORY[0x24BDD17C8]);
      v413 = (void *)objc_msgSend_initWithBytes_length_encoding_(v411, v412, v409, v410, 4);
      objc_msgSend_setParentalGuidanceText_(v192, v414, (uint64_t)v413);

      objc_msgSend_parentalGuidanceText(v192, v415, v416);
      v417 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v417)
      {
        v532 = &xmmword_2504EEFB8;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setParentalGuidanceText_(v192, v407, 0);
    }
    if (v562[0])
    {
      v419 = *(void **)(v188 + 1760);
      v420 = sub_233C20E2C(v562);
      objc_msgSend_numberWithUnsignedInt_(v419, v421, *(unsigned int *)v420);
      v422 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRecordingFlag_(v192, v423, (uint64_t)v422);

    }
    else
    {
      objc_msgSend_setRecordingFlag_(v192, v418, 0);
    }
    if (v563[0] && sub_233C25EA4(v563)[32])
    {
      v425 = (void *)objc_opt_new();
      objc_msgSend_setSeriesInfo_(v192, v426, (uint64_t)v425);

      v427 = sub_233C25EA4(v563);
      if (!v427[32])
        goto LABEL_200;
      v428 = *(_QWORD *)v427;
      v429 = *((_QWORD *)v427 + 1);
      v430 = objc_alloc(MEMORY[0x24BDD17C8]);
      v432 = (void *)objc_msgSend_initWithBytes_length_encoding_(v430, v431, v428, v429, 4);
      objc_msgSend_seriesInfo(v192, v433, v434);
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSeason_(v435, v436, (uint64_t)v432);

      objc_msgSend_seriesInfo(v192, v437, v438);
      v439 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_season(v439, v440, v441);
      v442 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v442)
      {
        v532 = &xmmword_2504EEFD0;
        goto LABEL_196;
      }
      v443 = sub_233C25EA4(v563);
      if (!v443[32])
LABEL_200:
        sub_233CAF304();
      v444 = *((_QWORD *)v443 + 2);
      v445 = *((_QWORD *)v443 + 3);
      v446 = objc_alloc(MEMORY[0x24BDD17C8]);
      v448 = (void *)objc_msgSend_initWithBytes_length_encoding_(v446, v447, v444, v445, 4);
      objc_msgSend_seriesInfo(v192, v449, v450);
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEpisode_(v451, v452, (uint64_t)v448);

      objc_msgSend_seriesInfo(v192, v453, v454);
      v455 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_episode(v455, v456, v457);
      v458 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v458)
      {
        v532 = &xmmword_2504EEFE8;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setSeriesInfo_(v192, v424, 0, v533);
    }
    if (v564[0])
    {
      v460 = (void *)objc_opt_new();
      v461 = sub_233C25EA4(v564);
      v569 = v461[72];
      if (v569)
        v570 = v461[73];
      sub_233CB16DC((uint64_t)&v535, (uint64_t)v461, &v569);
      while (sub_233CB1750((uint64_t)&v535))
      {
        v463 = (void *)objc_opt_new();
        v464 = v535;
        v465 = v536;
        v466 = objc_alloc(MEMORY[0x24BDD17C8]);
        v468 = (void *)objc_msgSend_initWithBytes_length_encoding_(v466, v467, v464, v465, 4);
        objc_msgSend_setCategory_(v463, v469, (uint64_t)v468);

        objc_msgSend_category(v463, v470, v471);
        v472 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v472)
        {
          v530 = &xmmword_2504EF000;
          goto LABEL_191;
        }
        if ((_BYTE)v537)
        {
          v474 = (uint64_t *)sub_233C05DB8(&v537);
          v475 = *v474;
          v476 = v474[1];
          v477 = objc_alloc(MEMORY[0x24BDD17C8]);
          v479 = (void *)objc_msgSend_initWithBytes_length_encoding_(v477, v478, v475, v476, 4);
          objc_msgSend_setSubCategory_(v463, v480, (uint64_t)v479);

          objc_msgSend_subCategory(v463, v481, v482);
          v483 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v483)
          {
            v530 = &xmmword_2504EF018;
            goto LABEL_191;
          }
        }
        else
        {
          objc_msgSend_setSubCategory_(v463, v473, 0);
        }
        objc_msgSend_addObject_(v460, v484, (uint64_t)v463, v533);

      }
      *(_QWORD *)&v189->mError = 0;
      v189->mFile = 0;
      *(_QWORD *)&v189->mLine = 0;
      if ((_DWORD)v539 == 33)
      {
        v189->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v189->mLine = 147;
      }
      else
      {
        *(_OWORD *)&v189->mError = v539;
        *(_QWORD *)&v189->mLine = v540;
        if (v189->mError)
          goto LABEL_192;
      }
      objc_msgSend_setCategoryList_(v192, v462, (uint64_t)v460, v533);

      retstr = v189;
    }
    else
    {
      objc_msgSend_setCategoryList_(v192, v459, 0);
    }
    if (v565[0])
    {
      v460 = (void *)objc_opt_new();
      v486 = sub_233C25EA4(v565);
      v569 = v486[72];
      if (v569)
        v570 = v486[73];
      sub_233CB17F8((uint64_t)&v535, (uint64_t)v486, &v569);
      while (sub_233CB186C((uint64_t)&v535))
      {
        v488 = (void *)objc_opt_new();
        v490 = v535;
        v489 = v536;
        v491 = objc_alloc(MEMORY[0x24BDD17C8]);
        v493 = (void *)objc_msgSend_initWithBytes_length_encoding_(v491, v492, v490, v489, 4);
        objc_msgSend_setName_(v488, v494, (uint64_t)v493);

        objc_msgSend_name(v488, v495, v496);
        v497 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v497)
        {
          v531 = &xmmword_2504EF030;
LABEL_184:
          *(_OWORD *)&v189->mError = *v531;
          *(_QWORD *)&v189->mLine = *((_QWORD *)v531 + 2);

          goto LABEL_192;
        }
        v498 = v537;
        v499 = objc_alloc(MEMORY[0x24BDD17C8]);
        v501 = (void *)objc_msgSend_initWithBytes_length_encoding_(v499, v500, v498, *((_QWORD *)&v498 + 1), 4);
        objc_msgSend_setRole_(v488, v502, (uint64_t)v501);

        objc_msgSend_role(v488, v503, v504);
        v505 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v505)
        {
          v531 = &xmmword_2504EF048;
          goto LABEL_184;
        }
        objc_msgSend_addObject_(v460, v506, (uint64_t)v488);

      }
      *(_QWORD *)&v189->mError = 0;
      v189->mFile = 0;
      *(_QWORD *)&v189->mLine = 0;
      if ((_DWORD)v538 == 33)
      {
        v189->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v189->mLine = 147;
        v188 = 0x24BDD1000;
      }
      else
      {
        *(_OWORD *)&v189->mError = *(_OWORD *)v533;
        *(_QWORD *)&v189->mLine = v533[2];
        v188 = 0x24BDD1000;
        if (v189->mError)
          goto LABEL_192;
      }
      objc_msgSend_setCastList_(v192, v487, (uint64_t)v460, v533);

      retstr = v189;
    }
    else
    {
      objc_msgSend_setCastList_(v192, v485, 0);
    }
    if (v566[0])
    {
      v460 = (void *)objc_opt_new();
      v508 = sub_233C25EA4(v566);
      v569 = v508[72];
      if (v569)
        v570 = v508[73];
      sub_233CB17F8((uint64_t)&v535, (uint64_t)v508, &v569);
      while (sub_233CB186C((uint64_t)&v535))
      {
        v463 = (void *)objc_opt_new();
        v511 = v535;
        v510 = v536;
        v512 = objc_alloc(MEMORY[0x24BDD17C8]);
        v514 = (void *)objc_msgSend_initWithBytes_length_encoding_(v512, v513, v511, v510, 4);
        objc_msgSend_setName_(v463, v515, (uint64_t)v514);

        objc_msgSend_name(v463, v516, v517);
        v518 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v518)
        {
          v530 = &xmmword_2504EF060;
          goto LABEL_191;
        }
        v519 = v537;
        v520 = objc_alloc(MEMORY[0x24BDD17C8]);
        v522 = (void *)objc_msgSend_initWithBytes_length_encoding_(v520, v521, v519, *((_QWORD *)&v519 + 1), 4);
        objc_msgSend_setRole_(v463, v523, (uint64_t)v522);

        objc_msgSend_role(v463, v524, v525);
        v526 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v526)
        {
          v530 = &xmmword_2504EF078;
LABEL_191:
          *(_OWORD *)&v189->mError = *v530;
          *(_QWORD *)&v189->mLine = *((_QWORD *)v530 + 2);

LABEL_192:
LABEL_197:

LABEL_198:
          return result;
        }
        objc_msgSend_addObject_(v460, v527, (uint64_t)v463);

        v188 = 0x24BDD1000;
      }
      *(_QWORD *)&v189->mError = 0;
      v189->mFile = 0;
      *(_QWORD *)&v189->mLine = 0;
      if ((_DWORD)v538 == 33)
      {
        v189->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v189->mLine = 147;
      }
      else
      {
        *(_OWORD *)&v189->mError = *(_OWORD *)v533;
        *(_QWORD *)&v189->mLine = v533[2];
        if (v189->mError)
          goto LABEL_192;
      }
      objc_msgSend_setExternalIDList_(v192, v509, (uint64_t)v460, v533);

      retstr = v189;
    }
    else
    {
      objc_msgSend_setExternalIDList_(v192, v507, 0);
    }
    objc_msgSend_addObject_(v534, v528, (uint64_t)v192, v533);

    v187 = v191;
  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v567 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v567;
    *(_QWORD *)&retstr->mLine = v568;
    if (retstr->mError)
      goto LABEL_198;
  }
  objc_msgSend_setProgramList_(self, v190, (uint64_t)v534, v533);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 26630;
  return result;
}

@end
