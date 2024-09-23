@implementation UIImageView(HeadphoneDeviceColorFiltering)

- (void)_headphoneApplyFilters:()HeadphoneDeviceColorFiltering pid:darkMode:deviceColor:
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  const __CFString *v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  NSObject *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  _BYTE v45[28];
  __int128 v46;
  int v47;
  __int128 v48;
  int v49;
  uint8_t buf[4];
  __int128 v51;
  int v52;
  float v53;
  __int128 v54;
  int v55;
  float v56;
  _BYTE v57[28];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v51) = a4;
    WORD2(v51) = 1024;
    *(_DWORD *)((char *)&v51 + 6) = a5;
    WORD5(v51) = 1024;
    HIDWORD(v51) = a6;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Headphone Settings UI: Applying filter with pid - %d, darkMode - %d, deviceColor - %d", buf, 0x14u);
  }

  v12 = objc_alloc(MEMORY[0x1E0CD2780]);
  v13 = (void *)objc_msgSend(v12, "initWithType:", *MEMORY[0x1E0CD2BF0]);
  v14 = objc_alloc(MEMORY[0x1E0CD2780]);
  v15 = (void *)objc_msgSend(v14, "initWithType:", *MEMORY[0x1E0CD2B90]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 4);
  v49 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 20);
  v46 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 28);
  v47 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 44);
  *(_OWORD *)v45 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 52);
  *(_OWORD *)&v45[12] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v17 = objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneIsProductOfDifferentColors:", a4);
  if (a5)
  {
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DarkMatrixValue-%d"), a6);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = CFSTR("DarkMatrixValue");
    }
    if (objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneIsProductOfDifferentColors:", a4))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DarkBiasValue-%d"), a6);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("DarkBiasValue");
    }
    objc_msgSend(v10, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    objc_msgSend(v10, "objectForKey:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v25 = v24;

    if (v25 != 0.0 && v22 != 0.0
      || (objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneIsProductOfDifferentColors:", a4) & 1) == 0)
    {
      goto LABEL_25;
    }
    v43 = v13;
    v44 = a1;
    v42 = CFSTR("DarkBiasValue-%d");
    v26 = CFSTR("DarkMatrixValue-%d");
  }
  else
  {
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LightMatrixValue-%d"), a6);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = CFSTR("LightMatrixValue");
    }
    if (objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneIsProductOfDifferentColors:", a4))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LightBiasValue-%d"), a6);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("LightBiasValue");
    }
    objc_msgSend(v10, "objectForKey:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v22 = v28;

    objc_msgSend(v10, "objectForKey:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    v25 = v30;

    if (v25 != 0.0 && v22 != 0.0
      || !objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneIsProductOfDifferentColors:", a4))
    {
      goto LABEL_25;
    }
    v43 = v13;
    v44 = a1;
    v42 = CFSTR("LightBiasValue-%d");
    v26 = CFSTR("LightMatrixValue-%d");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v26, objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneDefaultFiltersID:", a4));
  v31 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v42, objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneDefaultFiltersID:", a4));
  v32 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v22 = v34;

  objc_msgSend(v10, "objectForKey:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  v25 = v36;

  v18 = (__CFString *)v31;
  v19 = (__CFString *)v32;
  v13 = v43;
  a1 = v44;
LABEL_25:
  *(float *)buf = v22;
  v51 = v48;
  v52 = v49;
  v53 = v22;
  v54 = v46;
  v55 = v47;
  v56 = v22;
  *(_OWORD *)v57 = *(_OWORD *)v45;
  *(_OWORD *)&v57[12] = *(_OWORD *)&v45[12];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", buf);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v37, CFSTR("inputColorMatrix"));

  *(float *)&v38 = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v39, CFSTR("inputAmount"));

  objc_msgSend(v16, "addObject:", v13);
  objc_msgSend(v16, "addObject:", v15);
  objc_msgSend(a1, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFilters:", v16);

  sharedBluetoothSettingsLogComponent();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v41, OS_LOG_TYPE_DEFAULT, "Headphone Settings UI: Shader applied successfully", buf, 2u);
  }

}

+ (id)_headphoneGetAssetsDictionary:()HeadphoneDeviceColorFiltering
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  void *v102;
  double v103;
  void *v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  void *v118;
  double v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  double v125;
  void *v126;
  double v127;
  void *v128;
  double v129;
  void *v130;
  double v131;
  void *v132;
  double v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  void *v142;
  double v143;
  void *v144;
  double v145;
  void *v146;
  double v147;
  void *v148;
  double v149;
  void *v150;
  double v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  void *v156;
  double v157;
  void *v158;
  double v159;
  void *v160;
  double v161;
  void *v162;
  const __CFString *v163;
  void *v164;
  double v165;
  void *v166;
  double v167;
  void *v168;
  double v169;
  void *v170;
  double v171;
  void *v172;
  double v173;
  void *v174;
  double v175;
  void *v176;
  double v177;
  void *v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  double v183;
  void *v184;
  double v185;
  void *v186;
  double v187;
  void *v188;
  double v189;
  void *v190;
  double v191;
  void *v192;
  double v193;
  void *v194;
  double v195;
  void *v196;
  double v197;
  void *v198;
  double v199;
  void *v200;
  double v201;
  void *v202;
  double v203;
  void *v204;
  double v205;
  void *v206;
  double v207;
  void *v208;
  double v209;
  void *v210;
  double v211;
  void *v212;
  double v213;
  void *v214;
  double v215;
  void *v216;
  double v217;
  void *v218;
  double v219;
  void *v220;
  double v221;
  void *v222;
  double v223;
  void *v224;
  double v225;
  void *v226;
  double v227;
  void *v228;
  double v229;
  void *v230;
  double v231;
  void *v232;
  double v233;
  void *v234;
  double v235;
  void *v236;
  double v237;
  void *v238;
  double v239;
  void *v240;
  double v241;
  void *v242;
  double v243;
  void *v244;
  double v245;
  void *v246;
  double v247;
  void *v248;
  double v249;
  void *v250;
  double v251;
  void *v252;
  double v253;
  void *v254;
  double v255;
  void *v256;
  double v257;
  void *v258;
  double v259;
  void *v260;
  double v261;
  void *v262;
  double v263;
  void *v264;
  double v265;
  void *v266;
  double v267;
  void *v268;
  double v269;
  void *v270;
  double v271;
  void *v272;
  double v273;
  void *v274;
  double v275;
  void *v276;
  double v277;
  void *v278;
  double v279;
  void *v280;
  double v281;
  void *v282;
  double v283;
  void *v284;
  double v285;
  void *v286;
  double v287;
  void *v288;
  double v289;
  void *v290;
  double v291;
  void *v292;
  double v293;
  void *v294;
  double v295;
  void *v296;
  double v297;
  void *v298;
  double v299;
  void *v300;
  double v301;
  void *v302;
  double v303;
  void *v304;
  double v305;
  void *v306;
  double v307;
  void *v308;
  double v309;
  void *v310;
  double v311;
  void *v312;
  double v313;
  void *v314;
  double v315;
  void *v316;
  double v317;
  void *v318;
  double v319;
  void *v320;
  double v321;
  void *v322;
  double v323;
  void *v324;
  double v325;
  void *v326;
  double v327;
  void *v328;
  double v329;
  void *v330;
  double v331;
  void *v332;
  double v333;
  void *v334;
  double v335;
  void *v336;
  double v337;
  void *v338;
  double v339;
  void *v340;
  double v341;
  void *v342;
  double v343;
  void *v344;
  double v345;
  void *v346;
  double v347;
  void *v348;
  double v349;
  void *v350;
  double v351;
  void *v352;
  double v353;
  void *v354;
  double v355;
  void *v356;
  double v357;
  void *v358;
  double v359;
  void *v360;
  double v361;
  void *v362;
  double v363;
  void *v364;
  double v365;
  void *v366;
  double v367;
  void *v368;
  double v369;
  void *v370;
  double v371;
  void *v372;
  double v373;
  void *v374;
  double v375;
  void *v376;
  double v377;
  void *v378;
  double v379;
  void *v380;
  double v381;
  void *v382;
  double v383;
  void *v384;
  double v385;
  void *v386;
  double v387;
  void *v388;
  double v389;
  void *v390;
  double v391;
  void *v392;
  double v393;
  void *v394;
  double v395;
  void *v396;
  double v397;
  void *v398;
  double v399;
  void *v400;
  double v401;
  void *v402;
  double v403;
  void *v404;
  double v405;
  void *v406;
  double v407;
  void *v408;
  double v409;
  void *v410;
  double v411;
  void *v412;
  double v413;
  void *v414;
  double v415;
  void *v416;
  double v417;
  void *v418;
  double v419;
  void *v420;
  double v421;
  void *v422;
  double v423;
  void *v424;
  double v425;
  void *v426;
  double v427;
  void *v428;
  double v429;
  void *v430;
  double v431;
  void *v432;
  double v433;
  void *v434;
  double v435;
  void *v436;
  double v437;
  void *v438;
  double v439;
  void *v440;
  double v441;
  void *v442;
  double v443;
  void *v444;
  double v445;
  void *v446;
  double v447;
  void *v448;
  double v449;
  void *v450;
  double v451;
  void *v452;
  double v453;
  void *v454;
  double v455;
  void *v456;
  double v457;
  void *v458;
  double v459;
  void *v460;
  double v461;
  void *v462;
  double v463;
  void *v464;
  double v465;
  void *v466;
  double v467;
  void *v468;
  double v469;
  void *v470;
  double v471;
  void *v472;
  double v473;
  void *v474;
  double v475;
  void *v476;
  double v477;
  void *v478;
  double v479;
  void *v480;
  double v481;
  void *v482;
  double v483;
  void *v484;
  double v485;
  void *v486;
  double v487;
  void *v488;
  double v489;
  void *v490;
  double v491;
  void *v492;
  double v493;
  void *v494;
  double v495;
  void *v496;
  double v497;
  void *v498;
  double v499;
  void *v500;
  double v501;
  void *v502;
  double v503;
  void *v504;
  double v505;
  void *v506;
  double v507;
  void *v508;
  double v509;
  void *v510;
  double v511;
  void *v512;
  double v513;
  void *v514;
  double v515;
  void *v516;
  double v517;
  void *v518;
  double v519;
  void *v520;
  double v521;
  void *v522;
  double v523;
  void *v524;
  double v525;
  void *v526;
  double v527;
  void *v528;
  double v529;
  void *v530;
  double v531;
  void *v532;
  double v533;
  void *v534;
  double v535;
  void *v536;
  double v537;
  void *v538;
  double v539;
  void *v540;
  double v541;
  void *v542;
  double v543;
  void *v544;
  double v545;
  void *v546;
  double v547;
  void *v548;
  double v549;
  void *v550;
  double v551;
  void *v552;
  double v553;
  void *v554;
  double v555;
  void *v556;
  double v557;
  void *v558;
  double v559;
  void *v560;
  double v561;
  void *v562;
  double v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  double v570;
  void *v571;
  double v572;
  void *v573;
  double v574;
  void *v575;
  double v576;
  void *v577;
  double v578;
  void *v579;
  double v580;
  void *v581;
  double v582;
  void *v583;
  double v584;
  void *v585;
  double v586;
  void *v587;
  double v588;
  void *v589;
  double v590;
  void *v591;
  double v592;
  void *v593;
  double v594;
  void *v595;
  double v596;
  void *v597;
  double v598;
  void *v599;
  double v600;
  void *v601;
  double v602;
  void *v603;
  double v604;
  void *v605;
  double v606;
  void *v607;
  double v608;
  void *v609;
  double v610;
  void *v611;
  double v612;
  void *v613;
  double v614;
  void *v615;
  double v616;
  void *v617;
  double v618;
  void *v619;
  double v620;
  void *v621;
  double v622;
  void *v623;
  double v624;
  void *v625;
  double v626;
  void *v627;
  double v628;
  void *v629;
  double v630;
  void *v631;
  double v632;
  void *v633;
  double v634;
  void *v635;
  double v636;
  void *v637;
  double v638;
  void *v639;
  double v640;
  void *v641;
  double v642;
  void *v643;
  double v644;
  void *v645;
  double v646;
  void *v647;
  double v648;
  void *v649;
  double v650;
  void *v651;
  double v652;
  void *v653;
  double v654;
  void *v655;
  double v656;
  void *v657;
  double v658;
  void *v659;
  double v660;
  void *v661;
  double v662;
  void *v663;
  double v664;
  void *v665;
  double v666;
  void *v667;
  double v668;
  void *v669;
  double v670;
  void *v671;
  double v672;
  void *v673;
  double v674;
  void *v675;
  double v676;
  void *v677;
  double v678;
  void *v679;
  double v680;
  void *v681;
  double v682;
  void *v683;
  double v684;
  void *v685;
  double v686;
  void *v687;
  double v688;
  void *v689;
  double v690;
  void *v691;
  double v692;
  void *v693;
  double v694;
  void *v695;
  double v696;
  void *v697;
  double v698;
  void *v699;
  double v700;
  void *v701;
  double v702;
  void *v703;
  double v704;
  void *v705;
  void *v706;
  void *v707;
  void *v708;
  void *v709;
  void *v710;
  double v711;
  void *v712;
  void *v713;
  void *v714;
  double v715;
  void *v716;
  double v717;
  void *v718;
  double v719;
  void *v720;
  double v721;
  void *v722;
  double v723;
  void *v724;
  double v725;
  void *v726;
  double v727;
  void *v728;
  double v729;
  void *v730;
  double v731;
  void *v732;
  double v733;
  void *v734;
  double v735;
  void *v736;
  double v737;
  void *v738;
  double v739;
  void *v740;
  double v741;
  void *v742;
  double v743;
  void *v744;
  double v745;
  void *v746;
  void *v747;
  void *v748;
  void *v749;
  void *v750;
  void *v751;
  double v752;
  void *v753;
  double v754;
  void *v755;
  double v756;
  void *v757;
  double v758;
  void *v759;
  double v760;
  void *v761;
  double v762;
  void *v763;
  double v764;
  void *v765;
  double v766;
  void *v767;
  double v768;
  void *v769;
  double v770;
  void *v771;
  double v772;
  void *v773;
  double v774;
  void *v775;
  double v776;
  void *v777;
  double v778;
  void *v779;
  double v780;
  void *v781;
  double v782;
  void *v783;
  double v784;
  void *v785;
  double v786;
  void *v787;
  double v788;
  void *v789;
  double v790;
  void *v791;
  double v792;
  void *v793;
  double v794;
  void *v795;
  double v796;
  void *v797;
  double v798;
  void *v799;
  void *v800;
  void *v801;
  void *v802;
  void *v803;
  void *v804;
  double v805;
  void *v806;
  double v807;
  void *v808;
  double v809;
  void *v810;
  double v811;
  void *v812;
  double v813;
  void *v814;
  double v815;
  void *v816;
  double v817;
  void *v818;
  double v819;
  void *v820;
  double v821;
  void *v822;
  double v823;
  void *v824;
  double v825;
  void *v826;
  double v827;
  void *v828;
  double v829;
  void *v830;
  double v831;
  void *v832;
  double v833;
  void *v834;
  double v835;
  void *v836;
  double v837;
  void *v838;
  double v839;
  void *v840;
  double v841;
  void *v842;
  double v843;
  void *v844;
  double v845;
  void *v846;
  double v847;
  void *v848;
  double v849;
  void *v850;
  double v851;
  void *v852;
  double v853;
  void *v854;
  double v855;
  void *v856;
  double v857;
  void *v858;
  double v859;
  void *v860;
  double v861;
  void *v862;
  double v863;
  void *v864;
  double v865;
  void *v866;
  double v867;
  void *v868;
  double v869;
  void *v870;
  double v871;
  void *v872;
  double v873;
  void *v874;
  double v875;
  void *v876;
  double v877;
  void *v878;
  double v879;
  void *v880;
  double v881;
  void *v882;
  void *v883;
  double v884;
  void *v885;
  void *v886;
  void *v887;
  void *v888;
  void *v889;
  void *v890;
  double v891;
  void *v892;
  double v893;
  void *v894;
  void *v895;
  void *v897;
  void *v898;
  void *v899;
  void *v900;
  void *v901;
  void *v902;
  double v903;
  void *v904;
  double v905;
  void *v906;
  double v907;
  void *v908;
  double v909;
  void *v910;
  double v911;
  void *v912;
  double v913;
  void *v914;
  double v915;
  void *v916;
  double v917;
  void *v918;
  double v919;
  void *v920;
  double v921;
  void *v922;
  double v923;
  void *v924;
  double v925;
  void *v926;
  double v927;
  void *v928;
  double v929;
  void *v930;
  double v931;
  void *v932;
  double v933;
  void *v934;
  double v935;
  void *v936;
  double v937;
  void *v938;
  double v939;
  void *v940;
  void *v941;
  double v942;
  void *v943;
  double v944;
  void *v945;
  double v946;
  void *v947;
  double v948;
  void *v949;
  double v950;
  void *v951;
  double v952;
  void *v953;
  double v954;
  void *v955;
  double v956;
  void *v957;
  double v958;
  void *v959;
  double v960;
  void *v961;
  double v962;
  void *v963;
  double v964;
  void *v965;
  double v966;
  void *v967;
  double v968;
  void *v969;
  double v970;
  void *v971;
  double v972;
  void *v973;
  double v974;
  void *v975;
  double v976;
  void *v977;
  double v978;
  void *v979;
  double v980;
  void *v981;
  double v982;
  void *v983;
  double v984;
  void *v985;
  double v986;
  void *v987;
  double v988;
  void *v989;
  double v990;
  void *v991;
  double v992;
  void *v993;
  double v994;
  void *v995;
  double v996;
  void *v997;
  void *v998;
  double v999;
  void *v1000;
  double v1001;
  void *v1002;
  double v1003;
  void *v1004;
  double v1005;
  void *v1006;
  double v1007;
  void *v1008;
  double v1009;
  void *v1010;
  double v1011;
  void *v1012;
  double v1013;
  void *v1014;
  double v1015;
  void *v1016;
  double v1017;
  void *v1018;
  double v1019;
  void *v1020;
  double v1021;
  void *v1022;
  void *v1023;
  void *v1024;
  void *v1025;
  void *v1026;
  void *v1027;
  double v1028;
  void *v1029;
  double v1030;
  void *v1031;
  double v1032;
  void *v1033;
  double v1034;
  void *v1035;
  double v1036;
  void *v1037;
  double v1038;
  void *v1039;
  double v1040;
  void *v1041;
  double v1042;
  void *v1043;
  double v1044;
  void *v1045;
  double v1046;
  void *v1047;
  double v1048;
  void *v1049;
  double v1050;
  void *v1051;
  double v1052;
  void *v1053;
  double v1054;
  void *v1055;
  double v1056;
  void *v1057;
  void *v1058;
  double v1059;
  void *v1060;
  double v1061;
  void *v1062;
  double v1063;
  void *v1064;
  double v1065;
  void *v1066;
  double v1067;
  void *v1068;
  double v1069;
  void *v1070;
  double v1071;
  void *v1072;
  double v1073;
  void *v1074;
  double v1075;
  void *v1076;
  double v1077;
  void *v1078;
  double v1079;
  void *v1080;
  double v1081;
  void *v1082;
  double v1083;
  void *v1084;
  double v1085;
  void *v1086;
  double v1087;
  void *v1088;
  double v1089;
  void *v1090;
  double v1091;
  void *v1092;
  double v1093;
  void *v1094;
  double v1095;
  void *v1096;
  double v1097;
  void *v1098;
  void *v1099;
  double v1100;
  void *v1101;
  double v1102;
  void *v1103;
  double v1104;
  void *v1105;
  double v1106;
  void *v1107;
  double v1108;
  void *v1109;
  double v1110;
  void *v1111;
  double v1112;
  void *v1113;
  double v1114;
  void *v1115;
  double v1116;
  void *v1117;
  double v1118;
  void *v1119;
  double v1120;
  void *v1121;
  double v1122;
  void *v1123;
  double v1124;
  void *v1125;
  double v1126;
  void *v1127;
  double v1128;
  void *v1129;
  double v1130;
  void *v1131;
  double v1132;
  void *v1133;
  double v1134;
  void *v1135;
  double v1136;
  void *v1137;
  double v1138;
  void *v1139;
  double v1140;
  void *v1141;
  double v1142;
  void *v1143;
  double v1144;
  void *v1145;
  double v1146;
  void *v1147;
  const __CFString *v1148;
  void *v1149;
  void *v1150;
  void *v1151;
  double v1152;
  void *v1153;
  double v1154;
  void *v1155;
  double v1156;
  void *v1157;
  double v1158;
  void *v1159;
  double v1160;
  void *v1161;
  double v1162;
  void *v1163;
  double v1164;
  void *v1165;
  double v1166;
  void *v1167;
  double v1168;
  void *v1169;
  double v1170;
  void *v1171;
  double v1172;
  void *v1173;
  double v1174;
  uint8_t v1175[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1175 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Settings UI: Getting shader dictionary", v1175, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  switch(a3)
  {
    case 8194:
    case 8207:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 85);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v26) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("DarkBiasValue"));

      LODWORD(v28) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("DarkMatrixValue"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v31) = 0.5;
      goto LABEL_21;
    case 8195:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("BudHeight"));

      LODWORD(v43) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("DarkBiasValue-0"));

      LODWORD(v45) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("DarkMatrixValue-0"));

      LODWORD(v47) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("LightBiasValue-0"));

      LODWORD(v49) = 1066359849;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("LightMatrixValue-0"));

      LODWORD(v51) = 1044549468;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, CFSTR("DarkBiasValue-1"));

      LODWORD(v53) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("DarkMatrixValue-1"));

      LODWORD(v55) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("LightBiasValue-1"));

      LODWORD(v57) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("LightMatrixValue-1"));

      LODWORD(v59) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, CFSTR("DarkBiasValue-11"));

      LODWORD(v61) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v62, CFSTR("DarkMatrixValue-11"));

      LODWORD(v63) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("LightBiasValue-11"));

      LODWORD(v65) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v66, CFSTR("LightMatrixValue-11"));

      LODWORD(v67) = 1047233823;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v68, CFSTR("DarkBiasValue-12"));

      LODWORD(v69) = 1061662228;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("DarkMatrixValue-12"));

      LODWORD(v71) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v72, CFSTR("LightBiasValue-12"));

      LODWORD(v73) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v74, CFSTR("LightMatrixValue-12"));

      LODWORD(v75) = 1047233823;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v76, CFSTR("DarkBiasValue-13"));

      LODWORD(v77) = 1061662228;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v78, CFSTR("DarkMatrixValue-13"));

      LODWORD(v79) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, CFSTR("LightBiasValue-13"));

      LODWORD(v81) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("LightMatrixValue-13"));

      LODWORD(v83) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v84, CFSTR("DarkBiasValue-18"));

      LODWORD(v85) = 1059816735;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, CFSTR("DarkMatrixValue-18"));

      LODWORD(v87) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, CFSTR("LightBiasValue-18"));

      LODWORD(v89) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v90, CFSTR("LightMatrixValue-18"));

      LODWORD(v91) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v92, CFSTR("DarkBiasValue-19"));

      LODWORD(v93) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v94, CFSTR("DarkMatrixValue-19"));

      LODWORD(v95) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v96, CFSTR("LightBiasValue-19"));

      LODWORD(v97) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v98, CFSTR("LightMatrixValue-19"));

      LODWORD(v99) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v100, CFSTR("DarkBiasValue-20"));

      LODWORD(v101) = 1060320051;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v102, CFSTR("DarkMatrixValue-20"));

      LODWORD(v103) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v104, CFSTR("LightBiasValue-20"));

      LODWORD(v105) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v106, CFSTR("LightMatrixValue-20"));

      LODWORD(v107) = 1056125747;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v108, CFSTR("DarkBiasValue-21"));

      LODWORD(v109) = 1058977874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v110, CFSTR("DarkMatrixValue-21"));

      LODWORD(v111) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v112, CFSTR("LightBiasValue-21"));

      LODWORD(v113) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v114, CFSTR("LightMatrixValue-21"));

      LODWORD(v115) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v116, CFSTR("DarkBiasValue-23"));

      LODWORD(v117) = 1052266988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v118, CFSTR("DarkMatrixValue-23"));

      LODWORD(v119) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v120, CFSTR("LightBiasValue-23"));

      LODWORD(v121) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v122, CFSTR("LightMatrixValue-23"));

      LODWORD(v123) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v124, CFSTR("DarkBiasValue-32"));

      LODWORD(v125) = 1049582633;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v126, CFSTR("DarkMatrixValue-32"));

      LODWORD(v127) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v128, CFSTR("LightBiasValue-32"));

      LODWORD(v129) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v130, CFSTR("LightMatrixValue-32"));

      LODWORD(v131) = 1052266988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v132, CFSTR("DarkBiasValue-33"));

      LODWORD(v133) = 1059313418;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v134, CFSTR("DarkMatrixValue-33"));

      LODWORD(v135) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v136, CFSTR("LightBiasValue-33"));

      LODWORD(v137) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v138, CFSTR("LightMatrixValue-33"));

      LODWORD(v139) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v140, CFSTR("DarkBiasValue-34"));

      LODWORD(v141) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v142, CFSTR("DarkMatrixValue-34"));

      LODWORD(v143) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v144, CFSTR("LightBiasValue-34"));

      LODWORD(v145) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v146, CFSTR("LightMatrixValue-34"));

      LODWORD(v147) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v148, CFSTR("DarkBiasValue-35"));

      LODWORD(v149) = 1058139013;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v150, CFSTR("DarkMatrixValue-35"));

      LODWORD(v151) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v152, CFSTR("LightBiasValue-35"));

      LODWORD(v153) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v154, CFSTR("LightMatrixValue-35"));

      LODWORD(v155) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v156, CFSTR("DarkBiasValue-37"));

      LODWORD(v157) = 1054280253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v158, CFSTR("DarkMatrixValue-37"));

      LODWORD(v159) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v160, CFSTR("LightBiasValue-37"));

      LODWORD(v161) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-37");
      break;
    case 8197:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v164, CFSTR("BudHeight"));

      LODWORD(v165) = 1049414861;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v166, CFSTR("DarkBiasValue-0"));

      LODWORD(v167) = 1066192077;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v168, CFSTR("DarkMatrixValue-0"));

      LODWORD(v169) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v170, CFSTR("LightBiasValue-0"));

      LODWORD(v171) = 1066359849;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v172, CFSTR("LightMatrixValue-0"));

      LODWORD(v173) = 1056125747;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v174, CFSTR("DarkBiasValue-1"));

      LODWORD(v175) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v176, CFSTR("DarkMatrixValue-1"));

      LODWORD(v177) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v178, CFSTR("LightBiasValue-1"));

      LODWORD(v179) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v180, CFSTR("LightMatrixValue-1"));

      LODWORD(v181) = 1059481190;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v182, CFSTR("DarkBiasValue-3"));

      LODWORD(v183) = 1049582633;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v183);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v184, CFSTR("DarkMatrixValue-3"));

      LODWORD(v185) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v186, CFSTR("LightBiasValue-3"));

      LODWORD(v187) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v188, CFSTR("LightMatrixValue-3"));

      LODWORD(v189) = 1059984507;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v190, CFSTR("DarkBiasValue-5"));

      LODWORD(v191) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v191);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v192, CFSTR("DarkMatrixValue-5"));

      LODWORD(v193) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v193);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v194, CFSTR("LightBiasValue-5"));

      LODWORD(v195) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v196, CFSTR("LightMatrixValue-5"));

      LODWORD(v197) = 1050253722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v198, CFSTR("DarkBiasValue-27"));

      LODWORD(v199) = 1065520988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v200, CFSTR("DarkMatrixValue-27"));

      LODWORD(v201) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v201);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v202, CFSTR("LightBiasValue-27"));

      LODWORD(v203) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v204, CFSTR("LightMatrixValue-27"));

      LODWORD(v205) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v205);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v206, CFSTR("DarkBiasValue-29"));

      LODWORD(v207) = 1035489772;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v207);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v208, CFSTR("DarkMatrixValue-29"));

      LODWORD(v209) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v209);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v210, CFSTR("LightBiasValue-29"));

      LODWORD(v211) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v211);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v212, CFSTR("LightMatrixValue-29"));

      LODWORD(v213) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v214, CFSTR("DarkBiasValue-37"));

      LODWORD(v215) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v216, CFSTR("DarkMatrixValue-37"));

      LODWORD(v217) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v218, CFSTR("LightBiasValue-37"));

      LODWORD(v219) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v219);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v220, CFSTR("LightMatrixValue-37"));

      LODWORD(v221) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v221);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v222, CFSTR("DarkBiasValue-65"));

      LODWORD(v223) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v224, CFSTR("DarkMatrixValue-65"));

      LODWORD(v225) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v225);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v226, CFSTR("LightBiasValue-65"));

      LODWORD(v227) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v228, CFSTR("LightMatrixValue-65"));

      LODWORD(v229) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v229);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v230, CFSTR("DarkBiasValue-73"));

      LODWORD(v231) = 1059816735;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v232, CFSTR("DarkMatrixValue-73"));

      LODWORD(v233) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v234, CFSTR("LightBiasValue-73"));

      LODWORD(v235) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v235);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-73");
      break;
    case 8198:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v236, CFSTR("BudHeight"));

      LODWORD(v237) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v238, CFSTR("DarkBiasValue-0"));

      LODWORD(v239) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v240, CFSTR("DarkMatrixValue-0"));

      LODWORD(v241) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v241);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v242, CFSTR("LightBiasValue-0"));

      LODWORD(v243) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v244, CFSTR("LightMatrixValue-0"));

      LODWORD(v245) = 1058726216;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v246, CFSTR("DarkBiasValue-1"));

      LODWORD(v247) = 1046562734;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v247);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v248, CFSTR("DarkMatrixValue-1"));

      LODWORD(v249) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v249);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v250, CFSTR("LightBiasValue-1"));

      LODWORD(v251) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v252, CFSTR("LightMatrixValue-1"));

      LODWORD(v253) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v253);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v254, CFSTR("DarkBiasValue-6"));

      LODWORD(v255) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v256, CFSTR("DarkMatrixValue-6"));

      LODWORD(v257) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v257);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v258, CFSTR("LightBiasValue-6"));

      LODWORD(v259) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v259);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v260, CFSTR("LightMatrixValue-6"));

      LODWORD(v261) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v261);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v262, CFSTR("DarkBiasValue-7"));

      LODWORD(v263) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v264, CFSTR("DarkMatrixValue-7"));

      LODWORD(v265) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v266, CFSTR("LightBiasValue-7"));

      LODWORD(v267) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v267);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v268, CFSTR("LightMatrixValue-7"));

      LODWORD(v269) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v270, CFSTR("DarkBiasValue-8"));

      LODWORD(v271) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v271);
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v272, CFSTR("DarkMatrixValue-8"));

      LODWORD(v273) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v273);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v274, CFSTR("LightBiasValue-8"));

      LODWORD(v275) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v275);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v276, CFSTR("LightMatrixValue-8"));

      LODWORD(v277) = 1059481190;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v277);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v278, CFSTR("DarkBiasValue-9"));

      LODWORD(v279) = 1045220557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v280, CFSTR("DarkMatrixValue-9"));

      LODWORD(v281) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v281);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v282, CFSTR("LightBiasValue-9"));

      LODWORD(v283) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v284, CFSTR("LightMatrixValue-9"));

      LODWORD(v285) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v285);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v286, CFSTR("DarkBiasValue-14"));

      LODWORD(v287) = 0.75;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v287);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v288, CFSTR("DarkMatrixValue-14"));

      LODWORD(v289) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v289);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v290, CFSTR("LightBiasValue-14"));

      LODWORD(v291) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v291);
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v292, CFSTR("LightMatrixValue-14"));

      LODWORD(v293) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v293);
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v294, CFSTR("DarkBiasValue-15"));

      LODWORD(v295) = 1061494456;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v295);
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v296, CFSTR("DarkMatrixValue-15"));

      LODWORD(v297) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v297);
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v298, CFSTR("LightBiasValue-15"));

      LODWORD(v299) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v299);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v300, CFSTR("LightMatrixValue-15"));

      LODWORD(v301) = 1059145646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v302, CFSTR("DarkBiasValue-18"));

      LODWORD(v303) = 1052938076;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v303);
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v304, CFSTR("DarkMatrixValue-18"));

      LODWORD(v305) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v306, CFSTR("LightBiasValue-18"));

      LODWORD(v307) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v307);
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v308, CFSTR("LightMatrixValue-18"));

      LODWORD(v309) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v309);
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v310, CFSTR("DarkBiasValue-19"));

      LODWORD(v311) = 1059481190;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v311);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v312, CFSTR("DarkMatrixValue-19"));

      LODWORD(v313) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v313);
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v314, CFSTR("LightBiasValue-19"));

      LODWORD(v315) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v315);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v316, CFSTR("LightMatrixValue-19"));

      LODWORD(v317) = 1058810102;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v317);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v318, CFSTR("DarkBiasValue-20"));

      LODWORD(v319) = 1051260355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v319);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v320, CFSTR("DarkMatrixValue-20"));

      LODWORD(v321) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v321);
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v322, CFSTR("LightBiasValue-20"));

      LODWORD(v323) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v323);
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v324, CFSTR("LightMatrixValue-20"));

      LODWORD(v325) = 1058977874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v325);
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v326, CFSTR("DarkBiasValue-21"));

      LODWORD(v327) = 1050924810;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v327);
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v328, CFSTR("DarkMatrixValue-21"));

      LODWORD(v329) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v329);
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v330, CFSTR("LightBiasValue-21"));

      LODWORD(v331) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v331);
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v332, CFSTR("LightMatrixValue-21"));

      LODWORD(v333) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v333);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v334, CFSTR("DarkBiasValue-27"));

      LODWORD(v335) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v335);
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v336, CFSTR("DarkMatrixValue-27"));

      LODWORD(v337) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v337);
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v338, CFSTR("LightBiasValue-27"));

      LODWORD(v339) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v339);
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v340, CFSTR("LightMatrixValue-27"));

      LODWORD(v341) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v341);
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v342, CFSTR("DarkBiasValue-29"));

      LODWORD(v343) = 1062668861;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v343);
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v344, CFSTR("DarkMatrixValue-29"));

      LODWORD(v345) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v345);
      v346 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v346, CFSTR("LightBiasValue-29"));

      LODWORD(v347) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v347);
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v348, CFSTR("LightMatrixValue-29"));

      LODWORD(v349) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v349);
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v350, CFSTR("DarkBiasValue-32"));

      LODWORD(v351) = 1059984507;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v351);
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v352, CFSTR("DarkMatrixValue-32"));

      LODWORD(v353) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v353);
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v354, CFSTR("LightBiasValue-32"));

      LODWORD(v355) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v355);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v356, CFSTR("LightMatrixValue-32"));

      LODWORD(v357) = 1056461292;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v358, CFSTR("DarkBiasValue-33"));

      LODWORD(v359) = 1059648963;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v359);
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v360, CFSTR("DarkMatrixValue-33"));

      LODWORD(v361) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v361);
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v362, CFSTR("LightBiasValue-33"));

      LODWORD(v363) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v363);
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v364, CFSTR("LightMatrixValue-33"));

      LODWORD(v365) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v365);
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v366, CFSTR("DarkBiasValue-34"));

      LODWORD(v367) = 1061326684;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v367);
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v368, CFSTR("DarkMatrixValue-34"));

      LODWORD(v369) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v369);
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v370, CFSTR("LightBiasValue-34"));

      LODWORD(v371) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v371);
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v372, CFSTR("LightMatrixValue-34"));

      LODWORD(v373) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v373);
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v374, CFSTR("DarkBiasValue-35"));

      LODWORD(v375) = 1059648963;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v375);
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v376, CFSTR("DarkMatrixValue-35"));

      LODWORD(v377) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v377);
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v378, CFSTR("LightBiasValue-35"));

      LODWORD(v379) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v379);
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v380, CFSTR("LightMatrixValue-35"));

      LODWORD(v381) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v381);
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v382, CFSTR("DarkBiasValue-37"));

      LODWORD(v383) = 1051092582;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v383);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v384, CFSTR("DarkMatrixValue-37"));

      LODWORD(v385) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v385);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v386, CFSTR("LightBiasValue-37"));

      LODWORD(v387) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v387);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v388, CFSTR("LightMatrixValue-37"));

      LODWORD(v389) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v389);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v390, CFSTR("DarkBiasValue-42"));

      LODWORD(v391) = 1062501089;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v391);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v392, CFSTR("DarkMatrixValue-42"));

      LODWORD(v393) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v393);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v394, CFSTR("LightBiasValue-42"));

      LODWORD(v395) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v395);
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v396, CFSTR("LightMatrixValue-42"));

      LODWORD(v397) = 1054280253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v397);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v398, CFSTR("DarkBiasValue-46"));

      LODWORD(v399) = 1063843267;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v399);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v400, CFSTR("DarkMatrixValue-46"));

      LODWORD(v401) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v401);
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v402, CFSTR("LightBiasValue-46"));

      LODWORD(v403) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v403);
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v404, CFSTR("LightMatrixValue-46"));

      LODWORD(v405) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v405);
      v406 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v406, CFSTR("DarkBiasValue-47"));

      LODWORD(v407) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v407);
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v408, CFSTR("DarkMatrixValue-47"));

      LODWORD(v409) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v409);
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v410, CFSTR("LightBiasValue-47"));

      LODWORD(v411) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v411);
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v412, CFSTR("LightMatrixValue-47"));

      LODWORD(v413) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v413);
      v414 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v414, CFSTR("DarkBiasValue-61"));

      LODWORD(v415) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v415);
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v416, CFSTR("DarkMatrixValue-61"));

      LODWORD(v417) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v417);
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v418, CFSTR("LightBiasValue-61"));

      LODWORD(v419) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v419);
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v420, CFSTR("LightMatrixValue-61"));

      LODWORD(v421) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v421);
      v422 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v422, CFSTR("DarkBiasValue-62"));

      LODWORD(v423) = 1064011039;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v423);
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v424, CFSTR("DarkMatrixValue-62"));

      LODWORD(v425) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v425);
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v426, CFSTR("LightBiasValue-62"));

      LODWORD(v427) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v427);
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v428, CFSTR("LightMatrixValue-62"));

      LODWORD(v429) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v429);
      v430 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v430, CFSTR("DarkBiasValue-63"));

      LODWORD(v431) = 1064011039;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v431);
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v432, CFSTR("DarkMatrixValue-63"));

      LODWORD(v433) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v433);
      v434 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v434, CFSTR("LightBiasValue-63"));

      LODWORD(v435) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v435);
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v436, CFSTR("LightMatrixValue-63"));

      LODWORD(v437) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v437);
      v438 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v438, CFSTR("DarkBiasValue-64"));

      LODWORD(v439) = 1060487823;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v439);
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v440, CFSTR("DarkMatrixValue-64"));

      LODWORD(v441) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v441);
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v442, CFSTR("LightBiasValue-64"));

      LODWORD(v443) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v443);
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v444, CFSTR("LightMatrixValue-64"));

      LODWORD(v445) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v445);
      v446 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v446, CFSTR("DarkBiasValue-91"));

      LODWORD(v447) = 1064011039;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v447);
      v448 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v448, CFSTR("DarkMatrixValue-91"));

      LODWORD(v449) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v449);
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v450, CFSTR("LightBiasValue-91"));

      LODWORD(v451) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v451);
      v452 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v452, CFSTR("LightMatrixValue-91"));

      LODWORD(v453) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v453);
      v454 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v454, CFSTR("DarkBiasValue-92"));

      LODWORD(v455) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v455);
      v456 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v456, CFSTR("DarkMatrixValue-92"));

      LODWORD(v457) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v457);
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v458, CFSTR("LightBiasValue-92"));

      LODWORD(v459) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v459);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-92");
      break;
    case 8201:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v460, CFSTR("BudHeight"));

      LODWORD(v461) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v461);
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v462, CFSTR("DarkBiasValue-0"));

      LODWORD(v463) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v463);
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v464, CFSTR("DarkMatrixValue-0"));

      LODWORD(v465) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v465);
      v466 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v466, CFSTR("LightBiasValue-0"));

      LODWORD(v467) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v467);
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v468, CFSTR("LightMatrixValue-0"));

      LODWORD(v469) = 1057384038;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v469);
      v470 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v470, CFSTR("DarkBiasValue-1"));

      LODWORD(v471) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v471);
      v472 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v472, CFSTR("DarkMatrixValue-1"));

      LODWORD(v473) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v473);
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v474, CFSTR("LightBiasValue-1"));

      LODWORD(v475) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v475);
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v476, CFSTR("LightMatrixValue-1"));

      LODWORD(v477) = 1058474557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v477);
      v478 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v478, CFSTR("DarkBiasValue-2"));

      LODWORD(v479) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v479);
      v480 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v480, CFSTR("DarkMatrixValue-2"));

      LODWORD(v481) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v481);
      v482 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v482, CFSTR("LightBiasValue-2"));

      LODWORD(v483) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v483);
      v484 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v484, CFSTR("LightMatrixValue-2"));

      LODWORD(v485) = 1057467924;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v485);
      v486 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v486, CFSTR("DarkBiasValue-3"));

      LODWORD(v487) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v487);
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v488, CFSTR("DarkMatrixValue-3"));

      LODWORD(v489) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v489);
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v490, CFSTR("LightBiasValue-3"));

      LODWORD(v491) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v491);
      v492 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v492, CFSTR("LightMatrixValue-3"));

      LODWORD(v493) = 1057467924;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v493);
      v494 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v494, CFSTR("DarkBiasValue-24"));

      LODWORD(v495) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v495);
      v496 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v496, CFSTR("DarkMatrixValue-24"));

      LODWORD(v497) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v497);
      v498 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v498, CFSTR("LightBiasValue-24"));

      LODWORD(v499) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v499);
      v500 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v500, CFSTR("LightMatrixValue-24"));

      LODWORD(v501) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v501);
      v502 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v502, CFSTR("DarkBiasValue-25"));

      LODWORD(v503) = 1066024305;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v503);
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v504, CFSTR("DarkMatrixValue-25"));

      LODWORD(v505) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v505);
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v506, CFSTR("LightBiasValue-25"));

      LODWORD(v507) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v507);
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v508, CFSTR("LightMatrixValue-25"));

      LODWORD(v509) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v509);
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v510, CFSTR("DarkBiasValue-37"));

      LODWORD(v511) = 1050589266;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v511);
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v512, CFSTR("DarkMatrixValue-37"));

      LODWORD(v513) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v513);
      v514 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v514, CFSTR("LightBiasValue-37"));

      LODWORD(v515) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v515);
      v516 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v516, CFSTR("LightMatrixValue-37"));

      LODWORD(v517) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v517);
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v518, CFSTR("DarkBiasValue-38"));

      LODWORD(v519) = 1060320051;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v519);
      v520 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v520, CFSTR("DarkMatrixValue-38"));

      LODWORD(v521) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v521);
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v522, CFSTR("LightBiasValue-38"));

      LODWORD(v523) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v523);
      v524 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v524, CFSTR("LightMatrixValue-38"));

      LODWORD(v525) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v525);
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v526, CFSTR("DarkBiasValue-39"));

      LODWORD(v527) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v527);
      v528 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v528, CFSTR("DarkMatrixValue-39"));

      LODWORD(v529) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v529);
      v530 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v530, CFSTR("LightBiasValue-39"));

      LODWORD(v531) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v531);
      v532 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v532, CFSTR("LightMatrixValue-39"));

      LODWORD(v533) = 1057635697;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v533);
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v534, CFSTR("DarkBiasValue-40"));

      LODWORD(v535) = 1058474557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v535);
      v536 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v536, CFSTR("DarkMatrixValue-40"));

      LODWORD(v537) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v537);
      v538 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v538, CFSTR("LightBiasValue-40"));

      LODWORD(v539) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v539);
      v540 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v540, CFSTR("LightMatrixValue-40"));

      LODWORD(v541) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v541);
      v542 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v542, CFSTR("DarkBiasValue-41"));

      LODWORD(v543) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v543);
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v544, CFSTR("DarkMatrixValue-41"));

      LODWORD(v545) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v545);
      v546 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v546, CFSTR("LightBiasValue-41"));

      LODWORD(v547) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v547);
      v548 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v548, CFSTR("LightMatrixValue-41"));

      LODWORD(v549) = 1052938076;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v549);
      v550 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v550, CFSTR("DarkBiasValue-66"));

      LODWORD(v551) = 1059145646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v551);
      v552 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v552, CFSTR("DarkMatrixValue-66"));

      LODWORD(v553) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v553);
      v554 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v554, CFSTR("LightBiasValue-66"));

      LODWORD(v555) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v555);
      v556 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v556, CFSTR("LightMatrixValue-66"));

      LODWORD(v557) = 1051595899;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v557);
      v558 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v558, CFSTR("DarkBiasValue-67"));

      LODWORD(v559) = 1065520988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v559);
      v560 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v560, CFSTR("DarkMatrixValue-67"));

      LODWORD(v561) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v561);
      v562 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v562, CFSTR("LightBiasValue-67"));

      LODWORD(v563) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v563);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-67");
      break;
    case 8202:
      goto LABEL_31;
    case 8203:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 86);
      v564 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v564, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v565 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v565, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 17);
      v566 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v566, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 70);
      v567 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v567, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 33);
      v568 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v568, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 22);
      v569 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v569, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v570) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v570);
      v571 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v571, CFSTR("DarkBiasValue-0"));

      LODWORD(v572) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v572);
      v573 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v573, CFSTR("DarkMatrixValue-0"));

      LODWORD(v574) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v574);
      v575 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v575, CFSTR("LightBiasValue-0"));

      LODWORD(v576) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v576);
      v577 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v577, CFSTR("LightMatrixValue-0"));

      LODWORD(v578) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v578);
      v579 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v579, CFSTR("DarkBiasValue-1"));

      LODWORD(v580) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v580);
      v581 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v581, CFSTR("DarkMatrixValue-1"));

      LODWORD(v582) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v582);
      v583 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v583, CFSTR("LightBiasValue-1"));

      LODWORD(v584) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v584);
      v585 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v585, CFSTR("LightMatrixValue-1"));

      LODWORD(v586) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v586);
      v587 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v587, CFSTR("DarkBiasValue-2"));

      LODWORD(v588) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v588);
      v589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v589, CFSTR("DarkMatrixValue-2"));

      LODWORD(v590) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v590);
      v591 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v591, CFSTR("LightBiasValue-2"));

      LODWORD(v592) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v592);
      v593 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v593, CFSTR("LightMatrixValue-2"));

      LODWORD(v594) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v594);
      v595 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v595, CFSTR("DarkBiasValue-3"));

      LODWORD(v596) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v596);
      v597 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v597, CFSTR("DarkMatrixValue-3"));

      LODWORD(v598) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v598);
      v599 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v599, CFSTR("LightBiasValue-3"));

      LODWORD(v600) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v600);
      v601 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v601, CFSTR("LightMatrixValue-3"));

      LODWORD(v602) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v602);
      v603 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v603, CFSTR("DarkBiasValue-5"));

      LODWORD(v604) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v604);
      v605 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v605, CFSTR("DarkMatrixValue-5"));

      LODWORD(v606) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v606);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v607, CFSTR("LightBiasValue-5"));

      LODWORD(v608) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v608);
      v609 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v609, CFSTR("LightMatrixValue-5"));

      LODWORD(v610) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v610);
      v611 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v611, CFSTR("DarkBiasValue-6"));

      LODWORD(v612) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v612);
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v613, CFSTR("DarkMatrixValue-6"));

      LODWORD(v614) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v614);
      v615 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v615, CFSTR("LightBiasValue-6"));

      LODWORD(v616) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v616);
      v617 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v617, CFSTR("LightMatrixValue-6"));

      LODWORD(v618) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v618);
      v619 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v619, CFSTR("DarkBiasValue-11"));

      LODWORD(v620) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v620);
      v621 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v621, CFSTR("DarkMatrixValue-11"));

      LODWORD(v622) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v622);
      v623 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v623, CFSTR("LightBiasValue-11"));

      LODWORD(v624) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v624);
      v625 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v625, CFSTR("LightMatrixValue-11"));

      LODWORD(v626) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v626);
      v627 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v627, CFSTR("DarkBiasValue-13"));

      LODWORD(v628) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v628);
      v629 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v629, CFSTR("DarkMatrixValue-13"));

      LODWORD(v630) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v630);
      v631 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v631, CFSTR("LightBiasValue-13"));

      LODWORD(v632) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v632);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-13");
      break;
    case 8204:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v633 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v633, CFSTR("BudHeight"));

      LODWORD(v634) = 1058810102;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v634);
      v635 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v635, CFSTR("DarkBiasValue-1"));

      LODWORD(v636) = 1053273620;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v636);
      v637 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v637, CFSTR("DarkMatrixValue-1"));

      LODWORD(v638) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v638);
      v639 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v639, CFSTR("LightBiasValue-1"));

      LODWORD(v640) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v640);
      v641 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v641, CFSTR("LightMatrixValue-1"));

      LODWORD(v642) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v642);
      v643 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v643, CFSTR("DarkBiasValue-60"));

      LODWORD(v644) = 1063172178;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v644);
      v645 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v645, CFSTR("DarkMatrixValue-60"));

      LODWORD(v646) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v646);
      v647 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v647, CFSTR("LightBiasValue-60"));

      LODWORD(v648) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v648);
      v649 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v649, CFSTR("LightMatrixValue-60"));

      LODWORD(v650) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v650);
      v651 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v651, CFSTR("DarkBiasValue-69"));

      LODWORD(v652) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v652);
      v653 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v653, CFSTR("DarkMatrixValue-69"));

      LODWORD(v654) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v654);
      v655 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v655, CFSTR("LightBiasValue-69"));

      LODWORD(v656) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v656);
      v657 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v657, CFSTR("LightMatrixValue-69"));

      LODWORD(v658) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v658);
      v659 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v659, CFSTR("DarkBiasValue-70"));

      LODWORD(v660) = 1063172178;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v660);
      v661 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v661, CFSTR("DarkMatrixValue-70"));

      LODWORD(v662) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v662);
      v663 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v663, CFSTR("LightBiasValue-70"));

      LODWORD(v664) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v664);
      v665 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v665, CFSTR("LightMatrixValue-70"));

      LODWORD(v666) = 1058139013;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v666);
      v667 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v667, CFSTR("DarkBiasValue-71"));

      LODWORD(v668) = 1056125747;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v668);
      v669 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v669, CFSTR("DarkMatrixValue-71"));

      LODWORD(v670) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v670);
      v671 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v671, CFSTR("LightBiasValue-71"));

      LODWORD(v672) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v672);
      v673 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v673, CFSTR("LightMatrixValue-71"));

      LODWORD(v674) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v674);
      v675 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v675, CFSTR("DarkBiasValue-72"));

      LODWORD(v676) = 1061830001;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v676);
      v677 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v677, CFSTR("DarkMatrixValue-72"));

      LODWORD(v678) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v678);
      v679 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v679, CFSTR("LightBiasValue-72"));

      LODWORD(v680) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v680);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-72");
      break;
    case 8205:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v681 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v681, CFSTR("BudHeight"));

      LODWORD(v682) = 1050421494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v682);
      v683 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v683, CFSTR("DarkBiasValue-0"));

      LODWORD(v684) = 1066192077;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v684);
      v685 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v685, CFSTR("DarkMatrixValue-0"));

      LODWORD(v686) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v686);
      v687 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v687, CFSTR("LightBiasValue-0"));

      LODWORD(v688) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v688);
      v689 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v689, CFSTR("LightMatrixValue-0"));

      LODWORD(v690) = 0.375;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v690);
      v691 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v691, CFSTR("DarkBiasValue-1"));

      LODWORD(v692) = 1058810102;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v692);
      v693 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v693, CFSTR("DarkMatrixValue-1"));

      LODWORD(v694) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v694);
      v695 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v695, CFSTR("LightBiasValue-1"));

      LODWORD(v696) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v696);
      v697 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v697, CFSTR("LightMatrixValue-1"));

      LODWORD(v698) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v698);
      v699 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v699, CFSTR("DarkBiasValue-2"));

      LODWORD(v700) = 1060320051;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v700);
      v701 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v701, CFSTR("DarkMatrixValue-2"));

      LODWORD(v702) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v702);
      v703 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v703, CFSTR("LightBiasValue-2"));

      LODWORD(v704) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v704);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-2");
      break;
    case 8206:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 64);
      v705 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v705, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v706 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v706, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 27);
      v707 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v707, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 92);
      v708 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v708, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 59);
      v709 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v709, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 38);
      v710 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v710, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v711) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v711);
      v712 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v712, CFSTR("DarkBiasValue"));

      v40 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v41) = 1065772646;
      goto LABEL_16;
    case 8208:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v714 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v714, CFSTR("BudHeight"));

      LODWORD(v715) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v715);
      v716 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v716, CFSTR("DarkBiasValue-1"));

      LODWORD(v717) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v717);
      v718 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v718, CFSTR("DarkMatrixValue-1"));

      LODWORD(v719) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v719);
      v720 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v720, CFSTR("LightBiasValue-1"));

      LODWORD(v721) = 1068792545;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v721);
      v722 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v722, CFSTR("LightMatrixValue-1"));

      LODWORD(v723) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v723);
      v724 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v724, CFSTR("DarkBiasValue-77"));

      LODWORD(v725) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v725);
      v726 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v726, CFSTR("DarkMatrixValue-77"));

      LODWORD(v727) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v727);
      v728 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v728, CFSTR("LightBiasValue-77"));

      LODWORD(v729) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v729);
      v730 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v730, CFSTR("LightMatrixValue-77"));

      LODWORD(v731) = 1054280253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v731);
      v732 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v732, CFSTR("DarkBiasValue-78"));

      LODWORD(v733) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v733);
      v734 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v734, CFSTR("DarkMatrixValue-78"));

      LODWORD(v735) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v735);
      v736 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v736, CFSTR("LightBiasValue-78"));

      LODWORD(v737) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v737);
      v738 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v738, CFSTR("LightMatrixValue-78"));

      LODWORD(v739) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v739);
      v740 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v740, CFSTR("DarkBiasValue-79"));

      LODWORD(v741) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v741);
      v742 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v742, CFSTR("DarkMatrixValue-79"));

      LODWORD(v743) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v743);
      v744 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v744, CFSTR("LightBiasValue-79"));

      LODWORD(v745) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v745);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-79");
      break;
    case 8209:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 31);
      v746 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v746, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v747 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v747, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
      v748 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v748, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 100);
      v749 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v749, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 49);
      v750 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v750, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
      v751 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v751, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v752) = 1052938076;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v752);
      v753 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v753, CFSTR("DarkBiasValue-0"));

      LODWORD(v754) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v754);
      v755 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v755, CFSTR("DarkMatrixValue-0"));

      LODWORD(v756) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v756);
      v757 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v757, CFSTR("LightBiasValue-0"));

      LODWORD(v758) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v758);
      v759 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v759, CFSTR("LightMatrixValue-0"));

      LODWORD(v760) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v760);
      v761 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v761, CFSTR("DarkBiasValue-1"));

      LODWORD(v762) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v762);
      v763 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v763, CFSTR("DarkMatrixValue-1"));

      LODWORD(v764) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v764);
      v765 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v765, CFSTR("LightBiasValue-1"));

      LODWORD(v766) = 1066527621;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v766);
      v767 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v767, CFSTR("LightMatrixValue-1"));

      LODWORD(v768) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v768);
      v769 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v769, CFSTR("DarkBiasValue-2"));

      LODWORD(v770) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v770);
      v771 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v771, CFSTR("DarkMatrixValue-2"));

      LODWORD(v772) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v772);
      v773 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v773, CFSTR("LightBiasValue-2"));

      LODWORD(v774) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v774);
      v775 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v775, CFSTR("LightMatrixValue-2"));

      LODWORD(v776) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v776);
      v777 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v777, CFSTR("DarkBiasValue-3"));

      LODWORD(v778) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v778);
      v779 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v779, CFSTR("DarkMatrixValue-3"));

      LODWORD(v780) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v780);
      v781 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v781, CFSTR("LightBiasValue-3"));

      LODWORD(v782) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v782);
      v783 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v783, CFSTR("LightMatrixValue-3"));

      LODWORD(v784) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v784);
      v785 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v785, CFSTR("DarkBiasValue-4"));

      LODWORD(v786) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v786);
      v787 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v787, CFSTR("DarkMatrixValue-4"));

      LODWORD(v788) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v788);
      v789 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v789, CFSTR("LightBiasValue-4"));

      LODWORD(v790) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v790);
      v791 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v791, CFSTR("LightMatrixValue-4"));

      LODWORD(v792) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v792);
      v793 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v793, CFSTR("DarkBiasValue-6"));

      LODWORD(v794) = 1064346583;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v794);
      v795 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v795, CFSTR("DarkMatrixValue-6"));

      LODWORD(v796) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v796);
      v797 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v797, CFSTR("LightBiasValue-6"));

      LODWORD(v798) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v798);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-6");
      break;
    case 8210:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 51);
      v799 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v799, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v800 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v800, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 28);
      v801 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v801, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 52);
      v802 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v802, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 50);
      v803 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v803, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 28);
      v804 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v804, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v805) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v805);
      v806 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v806, CFSTR("DarkBiasValue-0"));

      LODWORD(v807) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v807);
      v808 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v808, CFSTR("DarkMatrixValue-0"));

      LODWORD(v809) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v809);
      v810 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v810, CFSTR("LightBiasValue-0"));

      LODWORD(v811) = 1065604874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v811);
      v812 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v812, CFSTR("LightMatrixValue-0"));

      LODWORD(v813) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v813);
      v814 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v814, CFSTR("DarkBiasValue-1"));

      LODWORD(v815) = 0.75;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v815);
      v816 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v816, CFSTR("DarkMatrixValue-1"));

      LODWORD(v817) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v817);
      v818 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v818, CFSTR("LightBiasValue-1"));

      LODWORD(v819) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v819);
      v820 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v820, CFSTR("LightMatrixValue-1"));

      LODWORD(v821) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v821);
      v822 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v822, CFSTR("DarkBiasValue-2"));

      LODWORD(v823) = 1064178811;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v823);
      v824 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v824, CFSTR("DarkMatrixValue-2"));

      LODWORD(v825) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v825);
      v826 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v826, CFSTR("LightBiasValue-2"));

      LODWORD(v827) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v827);
      v828 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v828, CFSTR("LightMatrixValue-2"));

      LODWORD(v829) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v829);
      v830 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v830, CFSTR("DarkBiasValue-3"));

      LODWORD(v831) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v831);
      v832 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v832, CFSTR("DarkMatrixValue-3"));

      LODWORD(v833) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v833);
      v834 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v834, CFSTR("LightBiasValue-3"));

      LODWORD(v835) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v835);
      v836 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v836, CFSTR("LightMatrixValue-3"));

      LODWORD(v837) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v837);
      v838 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v838, CFSTR("DarkBiasValue-4"));

      LODWORD(v839) = 1064178811;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v839);
      v840 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v840, CFSTR("DarkMatrixValue-4"));

      LODWORD(v841) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v841);
      v842 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v842, CFSTR("LightBiasValue-4"));

      LODWORD(v843) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v843);
      v844 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v844, CFSTR("LightMatrixValue-4"));

      LODWORD(v845) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v845);
      v846 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v846, CFSTR("DarkBiasValue-5"));

      LODWORD(v847) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v847);
      v848 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v848, CFSTR("DarkMatrixValue-5"));

      LODWORD(v849) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v849);
      v850 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v850, CFSTR("LightBiasValue-5"));

      LODWORD(v851) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v851);
      v852 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v852, CFSTR("LightMatrixValue-5"));

      LODWORD(v853) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v853);
      v854 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v854, CFSTR("DarkBiasValue-6"));

      LODWORD(v855) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v855);
      v856 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v856, CFSTR("DarkMatrixValue-6"));

      LODWORD(v857) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v857);
      v858 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v858, CFSTR("LightBiasValue-6"));

      LODWORD(v859) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v859);
      v860 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v860, CFSTR("LightMatrixValue-6"));

      LODWORD(v861) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v861);
      v862 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v862, CFSTR("DarkBiasValue-7"));

      LODWORD(v863) = 1062501089;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v863);
      v864 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v864, CFSTR("DarkMatrixValue-7"));

      LODWORD(v865) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v865);
      v866 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v866, CFSTR("LightBiasValue-7"));

      LODWORD(v867) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v867);
      v868 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v868, CFSTR("LightMatrixValue-7"));

      LODWORD(v869) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v869);
      v870 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v870, CFSTR("DarkBiasValue-8"));

      LODWORD(v871) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v871);
      v872 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v872, CFSTR("DarkMatrixValue-8"));

      LODWORD(v873) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v873);
      v874 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v874, CFSTR("LightBiasValue-8"));

      LODWORD(v875) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v875);
      v876 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v876, CFSTR("LightMatrixValue-8"));

      LODWORD(v877) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v877);
      v878 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v878, CFSTR("DarkBiasValue-9"));

      LODWORD(v879) = 1060655596;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v879);
      v880 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v880, CFSTR("DarkMatrixValue-9"));

      LODWORD(v881) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v881);
      v882 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v882, CFSTR("LightBiasValue-9"));

      v883 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v884) = 1.0;
      goto LABEL_26;
    case 8211:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62);
      v885 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v885, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v886 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v886, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 34);
      v887 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v887, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 94);
      v888 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v888, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 74);
      v889 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v889, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 46);
      v890 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v890, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v891) = 1053776937;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v891);
      v892 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v892, CFSTR("DarkBiasValue"));

      LODWORD(v893) = 1066359849;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v893);
      v894 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v894, CFSTR("DarkMatrixValue"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v31) = 1058139013;
      goto LABEL_21;
    case 8212:
    case 8228:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 64);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 102);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 59);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v38) = 1053273620;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("DarkBiasValue"));

      v40 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v41) = 1066443735;
LABEL_16:
      objc_msgSend(v40, "numberWithFloat:", v41);
      v713 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v713, CFSTR("DarkMatrixValue"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v31) = 1057803469;
LABEL_21:
      objc_msgSend(v30, "numberWithFloat:", v31);
      v895 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v895, CFSTR("LightBiasValue"));

      v18 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v19) = 1066695393;
      goto LABEL_22;
    case 8214:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 31);
      v897 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v897, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v898 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v898, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
      v899 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v899, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 100);
      v900 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v900, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 49);
      v901 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v901, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
      v902 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v902, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v903) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v903);
      v904 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v904, CFSTR("DarkBiasValue-0"));

      LODWORD(v905) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v905);
      v906 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v906, CFSTR("DarkMatrixValue-0"));

      LODWORD(v907) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v907);
      v908 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v908, CFSTR("LightBiasValue-0"));

      LODWORD(v909) = 1066527621;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v909);
      v910 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v910, CFSTR("LightMatrixValue-0"));

      LODWORD(v911) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v911);
      v912 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v912, CFSTR("DarkBiasValue-1"));

      LODWORD(v913) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v913);
      v914 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v914, CFSTR("DarkMatrixValue-1"));

      LODWORD(v915) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v915);
      v916 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v916, CFSTR("LightBiasValue-1"));

      LODWORD(v917) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v917);
      v918 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v918, CFSTR("LightMatrixValue-1"));

      LODWORD(v919) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v919);
      v920 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v920, CFSTR("DarkBiasValue-2"));

      LODWORD(v921) = 1063843267;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v921);
      v922 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v922, CFSTR("DarkMatrixValue-2"));

      LODWORD(v923) = 1056360628;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v923);
      v924 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v924, CFSTR("LightBiasValue-2"));

      LODWORD(v925) = 1064766013;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v925);
      v926 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v926, CFSTR("LightMatrixValue-2"));

      LODWORD(v927) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v927);
      v928 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v928, CFSTR("DarkBiasValue-3"));

      LODWORD(v929) = 1064346583;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v929);
      v930 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v930, CFSTR("DarkMatrixValue-3"));

      LODWORD(v931) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v931);
      v932 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v932, CFSTR("LightBiasValue-3"));

      LODWORD(v933) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v933);
      v934 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v934, CFSTR("LightMatrixValue-3"));

      LODWORD(v935) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v935);
      v936 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v936, CFSTR("DarkBiasValue-4"));

      LODWORD(v937) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v937);
      v938 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v938, CFSTR("DarkMatrixValue-4"));

      LODWORD(v939) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v939);
      v940 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v940, CFSTR("LightBiasValue-4"));

      v941 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v942) = 1.0;
      goto LABEL_29;
    case 8215:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v943 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v943, CFSTR("BudHeight"));

      LODWORD(v944) = 1056159302;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v944);
      v945 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v945, CFSTR("DarkBiasValue-1"));

      LODWORD(v946) = 1065269330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v946);
      v947 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v947, CFSTR("DarkMatrixValue-1"));

      LODWORD(v948) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v948);
      v949 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v949, CFSTR("LightBiasValue-1"));

      LODWORD(v950) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v950);
      v951 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v951, CFSTR("LightMatrixValue-1"));

      LODWORD(v952) = 1056226410;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v952);
      v953 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v953, CFSTR("DarkBiasValue-3"));

      LODWORD(v954) = 1064262697;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v954);
      v955 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v955, CFSTR("DarkMatrixValue-3"));

      LODWORD(v956) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v956);
      v957 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v957, CFSTR("LightBiasValue-3"));

      LODWORD(v958) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v958);
      v959 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v959, CFSTR("LightMatrixValue-3"));

      LODWORD(v960) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v960);
      v961 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v961, CFSTR("DarkBiasValue-4"));

      LODWORD(v962) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v962);
      v963 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v963, CFSTR("DarkMatrixValue-4"));

      LODWORD(v964) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v964);
      v965 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v965, CFSTR("LightBiasValue-4"));

      LODWORD(v966) = 1065604874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v966);
      v967 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v967, CFSTR("LightMatrixValue-4"));

      LODWORD(v968) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v968);
      v969 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v969, CFSTR("DarkBiasValue-5"));

      LODWORD(v970) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v970);
      v971 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v971, CFSTR("DarkMatrixValue-5"));

      LODWORD(v972) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v972);
      v973 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v973, CFSTR("LightBiasValue-5"));

      LODWORD(v974) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v974);
      v975 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v975, CFSTR("LightMatrixValue-5"));

      LODWORD(v976) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v976);
      v977 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v977, CFSTR("DarkBiasValue-6"));

      LODWORD(v978) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v978);
      v979 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v979, CFSTR("DarkMatrixValue-6"));

      LODWORD(v980) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v980);
      v981 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v981, CFSTR("LightBiasValue-6"));

      LODWORD(v982) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v982);
      v983 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v983, CFSTR("LightMatrixValue-6"));

      LODWORD(v984) = 1056360628;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v984);
      v985 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v985, CFSTR("DarkBiasValue-7"));

      LODWORD(v986) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v986);
      v987 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v987, CFSTR("DarkMatrixValue-7"));

      LODWORD(v988) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v988);
      v989 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v989, CFSTR("LightBiasValue-7"));

      LODWORD(v990) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v990);
      v991 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v991, CFSTR("LightMatrixValue-7"));

      LODWORD(v992) = 1056427737;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v992);
      v993 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v993, CFSTR("DarkBiasValue-9"));

      LODWORD(v994) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v994);
      v995 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v995, CFSTR("DarkMatrixValue-9"));

      LODWORD(v996) = 1057434370;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v996);
      v997 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v997, CFSTR("LightBiasValue-9"));

      v883 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v884) = 1066317906;
LABEL_26:
      objc_msgSend(v883, "numberWithFloat:", v884);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-9");
      break;
    case 8217:
    case 8219:
    case 8222:
    case 8224:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 94);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 74);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 46);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v12) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("DarkBiasValue"));

      LODWORD(v14) = 1065940419;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("DarkMatrixValue"));

      LODWORD(v16) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("LightBiasValue"));

      v18 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v19) = 1065940419;
LABEL_22:
      objc_msgSend(v18, "numberWithFloat:", v19);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue");
      break;
    case 8218:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v998 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v998, CFSTR("BudHeight"));

      LODWORD(v999) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v999);
      v1000 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1000, CFSTR("LightBiasValue-1"));

      LODWORD(v1001) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1001);
      v1002 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1002, CFSTR("LightMatrixValue-1"));

      LODWORD(v1003) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1003);
      v1004 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1004, CFSTR("DarkBiasValue-1"));

      LODWORD(v1005) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1005);
      v1006 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1006, CFSTR("DarkMatrixValue-1"));

      LODWORD(v1007) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1007);
      v1008 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1008, CFSTR("LightBiasValue-2"));

      LODWORD(v1009) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1009);
      v1010 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1010, CFSTR("LightMatrixValue-2"));

      LODWORD(v1011) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1011);
      v1012 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1012, CFSTR("DarkBiasValue-2"));

      LODWORD(v1013) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1013);
      v1014 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1014, CFSTR("DarkMatrixValue-2"));

      LODWORD(v1015) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1015);
      v1016 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1016, CFSTR("LightBiasValue-4"));

      LODWORD(v1017) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1017);
      v1018 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1018, CFSTR("LightMatrixValue-4"));

      LODWORD(v1019) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1019);
      v1020 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1020, CFSTR("DarkBiasValue-4"));

      LODWORD(v1021) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1021);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("DarkMatrixValue-4");
      break;
    case 8221:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 74);
      v1022 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1022, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v1023 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1023, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 17);
      v1024 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1024, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 57);
      v1025 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1025, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 33);
      v1026 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1026, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 22);
      v1027 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1027, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v1028) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1028);
      v1029 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1029, CFSTR("DarkBiasValue-1"));

      LODWORD(v1030) = 1064178811;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1030);
      v1031 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1031, CFSTR("DarkMatrixValue-1"));

      LODWORD(v1032) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1032);
      v1033 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1033, CFSTR("LightBiasValue-1"));

      LODWORD(v1034) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1034);
      v1035 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1035, CFSTR("LightMatrixValue-1"));

      LODWORD(v1036) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1036);
      v1037 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1037, CFSTR("DarkBiasValue-2"));

      LODWORD(v1038) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1038);
      v1039 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1039, CFSTR("DarkMatrixValue-2"));

      LODWORD(v1040) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1040);
      v1041 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1041, CFSTR("LightBiasValue-2"));

      LODWORD(v1042) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1042);
      v1043 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1043, CFSTR("LightMatrixValue-2"));

      LODWORD(v1044) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1044);
      v1045 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1045, CFSTR("DarkBiasValue-3"));

      LODWORD(v1046) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1046);
      v1047 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1047, CFSTR("DarkMatrixValue-3"));

      LODWORD(v1048) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1048);
      v1049 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1049, CFSTR("LightBiasValue-3"));

      LODWORD(v1050) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1050);
      v1051 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1051, CFSTR("LightMatrixValue-3"));

      LODWORD(v1052) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1052);
      v1053 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1053, CFSTR("DarkBiasValue-4"));

      LODWORD(v1054) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1054);
      v1055 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1055, CFSTR("DarkMatrixValue-4"));

      LODWORD(v1056) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1056);
      v1057 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1057, CFSTR("LightBiasValue-4"));

      v941 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v942) = 1065185444;
LABEL_29:
      objc_msgSend(v941, "numberWithFloat:", v942);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-4");
      break;
    case 8223:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v1058 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1058, CFSTR("BudHeight"));

      LODWORD(v1059) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1059);
      v1060 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1060, CFSTR("DarkBiasValue-21"));

      LODWORD(v1061) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1061);
      v1062 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1062, CFSTR("DarkMatrixValue-21"));

      LODWORD(v1063) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1063);
      v1064 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1064, CFSTR("LightBiasValue-21"));

      LODWORD(v1065) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1065);
      v1066 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1066, CFSTR("LightMatrixValue-21"));

      LODWORD(v1067) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1067);
      v1068 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1068, CFSTR("DarkBiasValue-22"));

      LODWORD(v1069) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1069);
      v1070 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1070, CFSTR("DarkMatrixValue-22"));

      LODWORD(v1071) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1071);
      v1072 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1072, CFSTR("LightBiasValue-22"));

      LODWORD(v1073) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1073);
      v1074 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1074, CFSTR("LightMatrixValue-22"));

      LODWORD(v1075) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1075);
      v1076 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1076, CFSTR("DarkBiasValue-20"));

      LODWORD(v1077) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1077);
      v1078 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1078, CFSTR("DarkMatrixValue-20"));

      LODWORD(v1079) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1079);
      v1080 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1080, CFSTR("LightBiasValue-20"));

      LODWORD(v1081) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1081);
      v1082 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1082, CFSTR("LightMatrixValue-20"));

      LODWORD(v1083) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1083);
      v1084 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1084, CFSTR("DarkBiasValue-19"));

      LODWORD(v1085) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1085);
      v1086 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1086, CFSTR("DarkMatrixValue-19"));

      LODWORD(v1087) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1087);
      v1088 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1088, CFSTR("LightBiasValue-19"));

      LODWORD(v1089) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1089);
      v1090 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1090, CFSTR("LightMatrixValue-19"));

      LODWORD(v1091) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1091);
      v1092 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1092, CFSTR("DarkBiasValue-18"));

      LODWORD(v1093) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1093);
      v1094 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1094, CFSTR("DarkMatrixValue-18"));

      LODWORD(v1095) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1095);
      v1096 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1096, CFSTR("LightBiasValue-18"));

      LODWORD(v1097) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1097);
      v1098 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1098, CFSTR("LightMatrixValue-18"));

LABEL_31:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v1099 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1099, CFSTR("BudHeight"));

      LODWORD(v1100) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1100);
      v1101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1101, CFSTR("DarkBiasValue-0"));

      LODWORD(v1102) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1102);
      v1103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1103, CFSTR("DarkMatrixValue-0"));

      LODWORD(v1104) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1104);
      v1105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1105, CFSTR("LightBiasValue-0"));

      LODWORD(v1106) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1106);
      v1107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1107, CFSTR("LightMatrixValue-0"));

      LODWORD(v1108) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1108);
      v1109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1109, CFSTR("DarkBiasValue-2"));

      LODWORD(v1110) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1110);
      v1111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1111, CFSTR("DarkMatrixValue-2"));

      LODWORD(v1112) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1112);
      v1113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1113, CFSTR("LightBiasValue-2"));

      LODWORD(v1114) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1114);
      v1115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1115, CFSTR("LightMatrixValue-2"));

      LODWORD(v1116) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1116);
      v1117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1117, CFSTR("DarkBiasValue-3"));

      LODWORD(v1118) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1118);
      v1119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1119, CFSTR("DarkMatrixValue-3"));

      LODWORD(v1120) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1120);
      v1121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1121, CFSTR("LightBiasValue-3"));

      LODWORD(v1122) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1122);
      v1123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1123, CFSTR("LightMatrixValue-3"));

      LODWORD(v1124) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1124);
      v1125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1125, CFSTR("DarkBiasValue-15"));

      LODWORD(v1126) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1126);
      v1127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1127, CFSTR("DarkMatrixValue-15"));

      LODWORD(v1128) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1128);
      v1129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1129, CFSTR("LightBiasValue-15"));

      LODWORD(v1130) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1130);
      v1131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1131, CFSTR("LightMatrixValue-15"));

      LODWORD(v1132) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1132);
      v1133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1133, CFSTR("DarkBiasValue-16"));

      LODWORD(v1134) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1134);
      v1135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1135, CFSTR("DarkMatrixValue-16"));

      LODWORD(v1136) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1136);
      v1137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1137, CFSTR("LightBiasValue-16"));

      LODWORD(v1138) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1138);
      v1139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1139, CFSTR("LightMatrixValue-16"));

      LODWORD(v1140) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1140);
      v1141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1141, CFSTR("DarkBiasValue-17"));

      LODWORD(v1142) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1142);
      v1143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1143, CFSTR("DarkMatrixValue-17"));

      LODWORD(v1144) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1144);
      v1145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1145, CFSTR("LightBiasValue-17"));

      LODWORD(v1146) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1146);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("LightMatrixValue-17");
      break;
    case 8229:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v1147 = (void *)objc_claimAutoreleasedReturnValue();
      v1148 = CFSTR("BudHeight");
      goto LABEL_34;
    case 8230:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 48);
      v1149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1149, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
      v1150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1150, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v1151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1151, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v1147 = (void *)objc_claimAutoreleasedReturnValue();
      v1148 = CFSTR("UnifiedSpacingBudsCase");
LABEL_34:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1147, v1148);

      LODWORD(v1152) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1152);
      v1153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1153, CFSTR("LightBiasValue-0"));

      LODWORD(v1154) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1154);
      v1155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1155, CFSTR("LightMatrixValue-0"));

      LODWORD(v1156) = 1057635697;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1156);
      v1157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1157, CFSTR("DarkBiasValue-0"));

      LODWORD(v1158) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1158);
      v1159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1159, CFSTR("DarkMatrixValue-0"));

      LODWORD(v1160) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1160);
      v1161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1161, CFSTR("LightBiasValue-1"));

      LODWORD(v1162) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1162);
      v1163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1163, CFSTR("LightMatrixValue-1"));

      LODWORD(v1164) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1164);
      v1165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1165, CFSTR("DarkBiasValue-1"));

      LODWORD(v1166) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1166);
      v1167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1167, CFSTR("DarkMatrixValue-1"));

      LODWORD(v1168) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1168);
      v1169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1169, CFSTR("LightBiasValue-2"));

      LODWORD(v1170) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1170);
      v1171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1171, CFSTR("LightMatrixValue-2"));

      LODWORD(v1172) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1172);
      v1173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v1173, CFSTR("DarkBiasValue-2"));

      LODWORD(v1174) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1174);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("DarkMatrixValue-2");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("BudHeight");
      break;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v162, v163);

  return v5;
}

+ (uint64_t)_headphoneIsProductOfDifferentColors:()HeadphoneDeviceColorFiltering
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "isProductOfDifferentColors Battery Status: Input pid - %d", (uint8_t *)v6, 8u);
  }

  return ((a3 - 8195) < 0x24) & (0xC1498E7CDuLL >> (a3 - 3));
}

+ (BOOL)_headphoneDefaultFiltersID:()HeadphoneDeviceColorFiltering
{
  return ((a3 - 8204) & 0xFFFFFFFB) == 0;
}

@end
