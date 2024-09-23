@implementation CWFAutoJoinMetric

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_coreAnalyticsEventPayload(self, v4, v5, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend_addEntriesFromDictionary_(v3, v8, (uint64_t)v12, v10, v11);
  objc_msgSend_optimizedChannelList(self, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("optimized_channel_list"), v15);

  sub_1B06475A8(v3, 0, 1u);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v16, (uint64_t)v19, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)__descriptionForError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v3 = a3;
  objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x1E0CB2D50], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v3, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x1E0CB3388], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, v9, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v22;
  v37 = v31;
  if (v22 || (v36 = v3, v37 = v13, v3))
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = objc_msgSend_code(v36, v32, v33, v34, v35);
    objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)CFSTR("%ld '%@'"), v41, v42, v39, v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.wifi.autojoin");
}

- (NSDictionary)coreAnalyticsEventPayload
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
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
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  unint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
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
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  const char *v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t i;
  void *v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  void *v402;
  const char *v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t j;
  void *v415;
  void *v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  void *v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  void *v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  void *v448;
  const char *v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  void *v454;
  const char *v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  void *v489;
  const char *v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  void *v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  void *v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  void *v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  void *v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  uint64_t v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  void *v556;
  const char *v557;
  uint64_t v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  void *v562;
  const char *v563;
  uint64_t v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  void *v568;
  const char *v569;
  uint64_t v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  void *v574;
  const char *v575;
  uint64_t v576;
  const char *v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  int v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  void *v590;
  void *v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  void *v600;
  const char *v601;
  uint64_t v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  void *v616;
  const char *v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  void *v621;
  const char *v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  void *v628;
  const char *v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  void *v637;
  const char *v638;
  uint64_t v639;
  void *v640;
  const char *v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  void *v645;
  const char *v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  const char *v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  const char *v655;
  uint64_t v656;
  void *v657;
  const char *v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  void *v662;
  const char *v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  void *v671;
  const char *v672;
  uint64_t v673;
  const char *v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  void *v678;
  const char *v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  void *v687;
  const char *v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  void *v692;
  const char *v693;
  uint64_t v694;
  uint64_t v695;
  void *v696;
  const char *v697;
  uint64_t v698;
  void *v699;
  const char *v700;
  uint64_t v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  const char *v705;
  uint64_t v706;
  uint64_t v707;
  void *v708;
  const char *v709;
  uint64_t v710;
  void *v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  void *v725;
  const char *v726;
  uint64_t v727;
  const char *v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  void *v732;
  const char *v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  const char *v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  void *v741;
  const char *v742;
  uint64_t v743;
  uint64_t v744;
  uint64_t v745;
  void *v746;
  const char *v747;
  uint64_t v748;
  uint64_t v749;
  void *v750;
  const char *v751;
  uint64_t v752;
  const char *v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  const char *v758;
  uint64_t v759;
  uint64_t v760;
  uint64_t v761;
  const char *v762;
  const char *v763;
  uint64_t v764;
  uint64_t v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  void *v770;
  const char *v771;
  uint64_t v772;
  const char *v773;
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  int v777;
  const char *v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  void *v782;
  const char *v783;
  uint64_t v784;
  const char *v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  const char *v789;
  uint64_t v790;
  const char *v791;
  uint64_t v792;
  const char *v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  const char *v797;
  uint64_t v798;
  uint64_t v799;
  uint64_t v800;
  const char *v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  const char *v805;
  uint64_t v806;
  uint64_t v807;
  uint64_t v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  const char *v813;
  uint64_t v814;
  uint64_t v815;
  uint64_t v816;
  const char *v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  const char *v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  const char *v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  void *v829;
  uint64_t v830;
  const char *v831;
  uint64_t v832;
  uint64_t v833;
  void *v834;
  const char *v835;
  uint64_t v836;
  const char *v837;
  uint64_t v838;
  uint64_t v839;
  uint64_t v840;
  void *v841;
  const char *v842;
  uint64_t v843;
  uint64_t v844;
  uint64_t v845;
  void *v846;
  void *v847;
  uint64_t v848;
  const char *v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  uint64_t v853;
  const char *v854;
  uint64_t v855;
  uint64_t v856;
  uint64_t v857;
  void *v858;
  const char *v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  uint64_t v863;
  const char *v864;
  uint64_t v865;
  uint64_t v866;
  void *v867;
  const char *v868;
  uint64_t v869;
  const char *v870;
  uint64_t v871;
  uint64_t v872;
  uint64_t v873;
  uint64_t v874;
  const char *v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  void *v879;
  const char *v880;
  uint64_t v881;
  const char *v882;
  uint64_t v883;
  uint64_t v884;
  uint64_t v885;
  const char *v886;
  uint64_t v887;
  const char *v888;
  uint64_t v889;
  const char *v890;
  uint64_t v891;
  uint64_t v892;
  uint64_t v893;
  const char *v894;
  uint64_t v895;
  const char *v896;
  uint64_t v897;
  uint64_t v898;
  uint64_t v899;
  const char *v900;
  uint64_t v901;
  const char *v902;
  uint64_t v903;
  uint64_t v904;
  uint64_t v905;
  const char *v906;
  uint64_t v907;
  const char *v908;
  uint64_t v909;
  uint64_t v910;
  uint64_t v911;
  const char *v912;
  uint64_t v913;
  const char *v914;
  uint64_t v915;
  uint64_t v916;
  uint64_t v917;
  const char *v918;
  uint64_t v919;
  const char *v920;
  uint64_t v921;
  uint64_t v922;
  uint64_t v923;
  void *v924;
  const char *v925;
  uint64_t v926;
  uint64_t v927;
  uint64_t v928;
  const char *v929;
  uint64_t v930;
  const char *v931;
  uint64_t v932;
  uint64_t v933;
  uint64_t v934;
  const char *v935;
  uint64_t v936;
  const char *v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  void *v941;
  const char *v942;
  uint64_t v943;
  uint64_t v944;
  void *v945;
  const char *v946;
  uint64_t v947;
  const char *v948;
  uint64_t v949;
  uint64_t v950;
  uint64_t v951;
  double v952;
  double v953;
  const char *v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  void *v958;
  const char *v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  double v963;
  const char *v964;
  uint64_t v965;
  uint64_t v966;
  void *v967;
  const char *v968;
  uint64_t v969;
  const char *v970;
  uint64_t v971;
  const char *v972;
  uint64_t v973;
  uint64_t v974;
  uint64_t v975;
  const char *v976;
  uint64_t v977;
  const char *v978;
  uint64_t v979;
  const char *v980;
  uint64_t v981;
  uint64_t v982;
  uint64_t v983;
  const char *v984;
  uint64_t v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  uint64_t v989;
  void *v990;
  const char *v991;
  uint64_t v992;
  const char *v993;
  uint64_t v994;
  uint64_t v995;
  uint64_t v996;
  uint64_t v997;
  uint64_t k;
  void *v999;
  const char *v1000;
  uint64_t v1001;
  uint64_t v1002;
  uint64_t v1003;
  void *v1004;
  const char *v1005;
  uint64_t v1006;
  const char *v1007;
  uint64_t v1008;
  uint64_t v1009;
  uint64_t v1010;
  uint64_t v1011;
  uint64_t m;
  void *v1013;
  const char *v1014;
  uint64_t v1015;
  uint64_t v1016;
  uint64_t v1017;
  void *v1018;
  const char *v1019;
  uint64_t v1020;
  const char *v1021;
  uint64_t v1022;
  uint64_t v1023;
  uint64_t v1024;
  uint64_t v1025;
  uint64_t n;
  void *v1027;
  const char *v1028;
  uint64_t v1029;
  uint64_t v1030;
  uint64_t v1031;
  const char *v1032;
  uint64_t v1033;
  uint64_t v1034;
  uint64_t v1035;
  uint64_t v1036;
  const char *v1037;
  uint64_t v1038;
  uint64_t v1039;
  uint64_t v1040;
  void *v1041;
  const char *v1042;
  uint64_t v1043;
  const char *v1044;
  uint64_t v1045;
  uint64_t v1046;
  uint64_t v1047;
  uint64_t v1048;
  uint64_t v1049;
  uint64_t ii;
  void *v1051;
  const char *v1052;
  uint64_t v1053;
  uint64_t v1054;
  uint64_t v1055;
  void *v1056;
  const char *v1057;
  uint64_t v1058;
  uint64_t v1059;
  uint64_t v1060;
  void *v1061;
  const char *v1062;
  uint64_t v1063;
  uint64_t v1064;
  uint64_t v1065;
  void *v1066;
  const char *v1067;
  uint64_t v1068;
  uint64_t v1069;
  uint64_t v1070;
  uint64_t v1071;
  const char *v1072;
  uint64_t v1073;
  uint64_t v1074;
  void *v1075;
  const char *v1076;
  uint64_t v1077;
  void *v1078;
  const char *v1079;
  uint64_t v1080;
  uint64_t v1081;
  uint64_t v1082;
  uint64_t v1083;
  const char *v1084;
  uint64_t v1085;
  uint64_t v1086;
  void *v1087;
  const char *v1088;
  uint64_t v1089;
  void *v1090;
  const char *v1091;
  uint64_t v1092;
  uint64_t v1093;
  uint64_t v1094;
  uint64_t v1095;
  const char *v1096;
  uint64_t v1097;
  uint64_t v1098;
  void *v1099;
  const char *v1100;
  uint64_t v1101;
  const char *v1102;
  uint64_t v1103;
  uint64_t v1104;
  uint64_t v1105;
  void *v1106;
  const char *v1107;
  uint64_t v1108;
  uint64_t v1109;
  uint64_t v1110;
  void *v1111;
  uint64_t v1112;
  const char *v1113;
  uint64_t v1114;
  uint64_t v1115;
  uint64_t v1116;
  void *v1117;
  const char *v1118;
  uint64_t v1119;
  uint64_t v1120;
  uint64_t v1121;
  uint64_t v1122;
  const char *v1123;
  uint64_t v1124;
  uint64_t v1125;
  void *v1126;
  const char *v1127;
  uint64_t v1128;
  const char *v1129;
  const char *v1130;
  uint64_t v1131;
  uint64_t v1132;
  uint64_t v1133;
  uint64_t v1134;
  uint64_t v1135;
  uint64_t v1136;
  uint64_t v1137;
  uint64_t v1138;
  uint64_t v1139;
  uint64_t v1140;
  uint64_t jj;
  void *v1142;
  unsigned int isCaptive;
  const char *v1144;
  uint64_t v1145;
  uint64_t v1146;
  uint64_t v1147;
  const char *v1148;
  uint64_t v1149;
  uint64_t v1150;
  uint64_t v1151;
  void *v1152;
  const char *v1153;
  uint64_t v1154;
  uint64_t v1155;
  uint64_t v1156;
  double v1157;
  double v1158;
  const char *v1159;
  uint64_t v1160;
  uint64_t v1161;
  uint64_t v1162;
  void *v1163;
  const char *v1164;
  uint64_t v1165;
  uint64_t v1166;
  uint64_t v1167;
  double v1168;
  double v1169;
  const char *v1170;
  uint64_t v1171;
  uint64_t v1172;
  uint64_t v1173;
  void *v1174;
  const char *v1175;
  uint64_t v1176;
  uint64_t v1177;
  uint64_t v1178;
  double v1179;
  double v1180;
  const char *v1181;
  uint64_t v1182;
  uint64_t v1183;
  uint64_t v1184;
  void *v1185;
  const char *v1186;
  uint64_t v1187;
  uint64_t v1188;
  uint64_t v1189;
  double v1190;
  double v1191;
  const char *v1192;
  uint64_t v1193;
  uint64_t v1194;
  uint64_t v1195;
  void *v1196;
  const char *v1197;
  uint64_t v1198;
  uint64_t v1199;
  uint64_t v1200;
  double v1201;
  double v1202;
  const char *v1203;
  uint64_t v1204;
  uint64_t v1205;
  uint64_t v1206;
  uint64_t v1207;
  void *v1208;
  const char *v1209;
  uint64_t v1210;
  uint64_t v1211;
  uint64_t v1212;
  double v1213;
  double v1214;
  uint64_t v1215;
  void *v1216;
  const char *v1217;
  uint64_t v1218;
  uint64_t v1219;
  uint64_t v1220;
  void *v1221;
  const char *v1222;
  uint64_t v1223;
  uint64_t v1224;
  uint64_t v1225;
  uint64_t v1226;
  const char *v1227;
  uint64_t v1228;
  uint64_t v1229;
  void *v1230;
  const char *v1231;
  uint64_t v1232;
  const char *v1233;
  uint64_t v1234;
  uint64_t v1235;
  void *v1236;
  const char *v1237;
  uint64_t v1238;
  const char *v1239;
  uint64_t v1240;
  uint64_t v1241;
  void *v1242;
  const char *v1243;
  uint64_t v1244;
  const char *v1245;
  uint64_t v1246;
  uint64_t v1247;
  void *v1248;
  const char *v1249;
  uint64_t v1250;
  const char *v1251;
  uint64_t v1252;
  uint64_t v1253;
  void *v1254;
  const char *v1255;
  uint64_t v1256;
  const char *v1257;
  uint64_t v1258;
  uint64_t v1259;
  void *v1260;
  const char *v1261;
  uint64_t v1262;
  const char *v1263;
  uint64_t v1264;
  uint64_t v1265;
  void *v1266;
  const char *v1267;
  uint64_t v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  void *v1272;
  const char *v1273;
  uint64_t v1274;
  const char *v1275;
  uint64_t v1276;
  uint64_t v1277;
  void *v1278;
  const char *v1279;
  uint64_t v1280;
  const char *v1281;
  uint64_t v1282;
  uint64_t v1283;
  void *v1284;
  const char *v1285;
  uint64_t v1286;
  void *v1287;
  const char *v1288;
  uint64_t v1289;
  uint64_t v1290;
  uint64_t v1291;
  uint64_t v1292;
  const char *v1293;
  uint64_t v1294;
  uint64_t v1295;
  void *v1296;
  const char *v1297;
  uint64_t v1298;
  void *v1299;
  const char *v1300;
  uint64_t v1301;
  uint64_t v1302;
  uint64_t v1303;
  uint64_t v1304;
  const char *v1305;
  uint64_t v1306;
  uint64_t v1307;
  void *v1308;
  const char *v1309;
  uint64_t v1310;
  const char *v1311;
  uint64_t v1312;
  uint64_t v1313;
  uint64_t v1314;
  unint64_t v1315;
  const char *v1316;
  uint64_t v1317;
  uint64_t v1318;
  uint64_t v1319;
  void *v1320;
  const char *v1321;
  uint64_t v1322;
  void *v1323;
  const char *v1324;
  uint64_t v1325;
  uint64_t v1326;
  uint64_t v1327;
  uint64_t v1328;
  const char *v1329;
  uint64_t v1330;
  uint64_t v1331;
  void *v1332;
  const char *v1333;
  uint64_t v1334;
  void *v1335;
  const char *v1336;
  uint64_t v1337;
  uint64_t v1338;
  uint64_t v1339;
  uint64_t v1340;
  const char *v1341;
  uint64_t v1342;
  uint64_t v1343;
  void *v1344;
  const char *v1345;
  uint64_t v1346;
  const char *v1347;
  uint64_t v1348;
  uint64_t v1349;
  uint64_t v1350;
  const char *v1351;
  uint64_t v1352;
  uint64_t v1353;
  uint64_t v1354;
  void *v1355;
  void *v1356;
  const char *v1357;
  uint64_t v1358;
  uint64_t v1359;
  void *v1360;
  const char *v1361;
  uint64_t v1362;
  void *v1363;
  const char *v1364;
  uint64_t v1365;
  uint64_t v1366;
  uint64_t v1367;
  uint64_t v1368;
  const char *v1369;
  uint64_t v1370;
  uint64_t v1371;
  void *v1372;
  const char *v1373;
  uint64_t v1374;
  const char *v1375;
  uint64_t v1376;
  uint64_t v1377;
  uint64_t v1378;
  const char *v1379;
  uint64_t v1380;
  uint64_t v1381;
  uint64_t v1382;
  void *v1383;
  void *v1384;
  const char *v1385;
  uint64_t v1386;
  uint64_t v1387;
  void *v1388;
  const char *v1389;
  uint64_t v1390;
  void *v1391;
  const char *v1392;
  uint64_t v1393;
  uint64_t v1394;
  uint64_t v1395;
  void *v1396;
  const char *v1397;
  uint64_t v1398;
  uint64_t v1399;
  uint64_t v1400;
  uint64_t v1401;
  const char *v1402;
  uint64_t v1403;
  uint64_t v1404;
  void *v1405;
  const char *v1406;
  uint64_t v1407;
  const char *v1408;
  uint64_t v1409;
  uint64_t v1410;
  uint64_t v1411;
  void *v1412;
  const char *v1413;
  uint64_t v1414;
  uint64_t v1415;
  uint64_t v1416;
  const char *v1417;
  uint64_t v1418;
  uint64_t v1419;
  uint64_t v1420;
  void *v1421;
  const char *v1422;
  uint64_t v1423;
  uint64_t v1424;
  uint64_t v1425;
  void *v1426;
  const char *v1427;
  uint64_t v1428;
  uint64_t v1429;
  void *v1430;
  const char *v1431;
  uint64_t v1432;
  const char *v1433;
  uint64_t v1434;
  uint64_t v1435;
  uint64_t v1436;
  void *v1437;
  const char *v1438;
  uint64_t v1439;
  uint64_t v1440;
  uint64_t v1441;
  unsigned int v1442;
  const char *v1443;
  uint64_t v1444;
  uint64_t v1445;
  uint64_t v1446;
  void *v1447;
  const char *v1448;
  uint64_t v1449;
  const char *v1450;
  uint64_t v1451;
  uint64_t v1452;
  uint64_t v1453;
  void *v1454;
  const char *v1455;
  uint64_t v1456;
  uint64_t v1457;
  uint64_t v1458;
  unint64_t v1459;
  const char *v1460;
  uint64_t v1461;
  uint64_t v1462;
  uint64_t v1463;
  void *v1464;
  const char *v1465;
  uint64_t v1466;
  const char *v1467;
  uint64_t v1468;
  uint64_t v1469;
  uint64_t v1470;
  void *v1471;
  const char *v1472;
  uint64_t v1473;
  uint64_t v1474;
  uint64_t v1475;
  void *v1476;
  const char *v1477;
  uint64_t v1478;
  const char *v1479;
  uint64_t v1480;
  uint64_t v1481;
  uint64_t v1482;
  void *v1483;
  const char *v1484;
  uint64_t v1485;
  uint64_t v1486;
  uint64_t v1487;
  void *v1488;
  const char *v1489;
  uint64_t v1490;
  const char *v1491;
  uint64_t v1492;
  uint64_t v1493;
  uint64_t v1494;
  void *v1495;
  const char *v1496;
  uint64_t v1497;
  uint64_t v1498;
  uint64_t v1499;
  void *v1500;
  const char *v1501;
  uint64_t v1502;
  const char *v1503;
  uint64_t v1504;
  uint64_t v1505;
  uint64_t v1506;
  void *v1507;
  void *v1509;
  void *v1510;
  void *v1511;
  void *v1512;
  CWFAutoJoinMetric *v1513;
  void *v1514;
  id obj;
  void *v1516;
  uint64_t v1517;
  uint64_t v1518;
  uint64_t v1519;
  uint64_t v1520;
  uint64_t v1521;
  uint64_t v1522;
  __int128 v1523;
  __int128 v1524;
  __int128 v1525;
  __int128 v1526;
  __int128 v1527;
  __int128 v1528;
  __int128 v1529;
  __int128 v1530;
  __int128 v1531;
  __int128 v1532;
  __int128 v1533;
  __int128 v1534;
  __int128 v1535;
  __int128 v1536;
  __int128 v1537;
  __int128 v1538;
  __int128 v1539;
  __int128 v1540;
  __int128 v1541;
  __int128 v1542;
  __int128 v1543;
  __int128 v1544;
  __int128 v1545;
  __int128 v1546;
  __int128 v1547;
  __int128 v1548;
  __int128 v1549;
  __int128 v1550;
  _BYTE v1551[128];
  _BYTE v1552[128];
  _BYTE v1553[128];
  _BYTE v1554[128];
  _BYTE v1555[128];
  _BYTE v1556[128];
  _BYTE v1557[128];
  uint64_t v1558;

  v1558 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_result(self, v8, v9, v10, v11);
  objc_msgSend_numberWithBool_(v7, v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("result"), v18);

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_wasAborted(self, v20, v21, v22, v23);
  objc_msgSend_numberWithBool_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, (uint64_t)CFSTR("wasAborted"), v30);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_wasCancelled(self, v32, v33, v34, v35);
  objc_msgSend_numberWithBool_(v31, v37, v36, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, (uint64_t)CFSTR("wasCancelled"), v42);

  v43 = (void *)MEMORY[0x1E0CB37E8];
  v48 = objc_msgSend_duration(self, v44, v45, v46, v47);
  objc_msgSend_numberWithUnsignedInteger_(v43, v49, v48, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, (uint64_t)CFSTR("duration"), v54);

  v55 = (void *)MEMORY[0x1E0CB37E8];
  v60 = objc_msgSend_durationFromLinkDownTrigger(self, v56, v57, v58, v59);
  objc_msgSend_numberWithUnsignedInteger_(v55, v61, v60, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, (uint64_t)CFSTR("durationFromLinkDownTrigger"), v66);

  v67 = (void *)MEMORY[0x1E0CB37E8];
  v72 = objc_msgSend_durationFromDisplayOnTrigger(self, v68, v69, v70, v71);
  objc_msgSend_numberWithUnsignedInteger_(v67, v73, v72, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, (uint64_t)CFSTR("durationFromDisplayOnTrigger"), v78);

  v79 = (void *)MEMORY[0x1E0CB37E8];
  v84 = objc_msgSend_durationFromDeviceUnlockTrigger(self, v80, v81, v82, v83);
  objc_msgSend_numberWithUnsignedInteger_(v79, v85, v84, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, (uint64_t)CFSTR("durationFromDeviceUnlockTrigger"), v90);

  v91 = (void *)MEMORY[0x1E0CB37E8];
  v96 = objc_msgSend_durationFromWiFiPowerOnTrigger(self, v92, v93, v94, v95);
  objc_msgSend_numberWithUnsignedInteger_(v91, v97, v96, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v101, (uint64_t)v100, (uint64_t)CFSTR("durationFromWiFiPowerOnTrigger"), v102);

  v107 = objc_msgSend_previousNonRetryAutoJoinTrigger(self, v103, v104, v105, v106);
  sub_1B063D5D0(v107, v108, v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v113, (uint64_t)v112, (uint64_t)CFSTR("previousNonRetryTrigger"), v114);

  v115 = (void *)MEMORY[0x1E0CB37E8];
  v120 = objc_msgSend_durationFromNonRetryAutoJoinTrigger(self, v116, v117, v118, v119);
  objc_msgSend_numberWithUnsignedInteger_(v115, v121, v120, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v125, (uint64_t)v124, (uint64_t)CFSTR("durationFromNonRetryTrigger"), v126);

  objc_msgSend_error(self, v127, v128, v129, v130);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    objc_msgSend_error(self, v131, v132, v133, v134);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(self, v137, (uint64_t)v136, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v141, (uint64_t)v140, (uint64_t)CFSTR("error"), v142);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v131, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("error"), v134);
  }

  v143 = (void *)MEMORY[0x1E0CB37E8];
  v148 = objc_msgSend_wasCancelled(self, v144, v145, v146, v147);
  objc_msgSend_numberWithBool_(v143, v149, v148, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v153, (uint64_t)v152, (uint64_t)CFSTR("wasCancelled"), v154);

  v155 = (void *)MEMORY[0x1E0CB37E8];
  v160 = objc_msgSend_wasAborted(self, v156, v157, v158, v159);
  objc_msgSend_numberWithBool_(v155, v161, v160, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v165, (uint64_t)v164, (uint64_t)CFSTR("wasAborted"), v166);

  objc_msgSend_autoJoinParameters(self, v167, v168, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend_trigger(v171, v172, v173, v174, v175);
  sub_1B063D5D0(v176, v177, v178, v179, v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v182, (uint64_t)v181, (uint64_t)CFSTR("trigger"), v183);

  objc_msgSend_autoJoinParameters(self, v184, v185, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_msgSend_mode(v188, v189, v190, v191, v192);
  sub_1B063F1D4(v193, v194, v195, v196, v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v199, (uint64_t)v198, (uint64_t)CFSTR("mode"), v200);

  objc_msgSend_autoJoinParameters(self, v201, v202, v203, v204);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_targetNetworkProfile(v205, v206, v207, v208, v209);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = MEMORY[0x1E0C9AAB0];
  v214 = MEMORY[0x1E0C9AAA0];
  if (v212)
    objc_msgSend_setObject_forKeyedSubscript_(v6, v210, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("didTargetSpecificNetwork"), v211);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v6, v210, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("didTargetSpecificNetwork"), v211);

  v219 = objc_msgSend_retrySchedule(self, v215, v216, v217, v218);
  sub_1B0642860(v219, v220, v221, v222, v223);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v225, (uint64_t)v224, (uint64_t)CFSTR("retrySchedule"), v226);

  v227 = (void *)MEMORY[0x1E0CB37E8];
  v232 = objc_msgSend_retryScheduleIndex(self, v228, v229, v230, v231);
  objc_msgSend_numberWithUnsignedInteger_(v227, v233, v232, v234, v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v237, (uint64_t)v236, (uint64_t)CFSTR("retryScheduleIndex"), v238);

  v239 = (void *)MEMORY[0x1E0CB37E8];
  v244 = objc_msgSend_didUseLocationOptimizedChannelList(self, v240, v241, v242, v243);
  objc_msgSend_numberWithBool_(v239, v245, v244, v246, v247);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v249, (uint64_t)v248, (uint64_t)CFSTR("didUseLocationOptimizedChannelList"), v250);

  v251 = (void *)MEMORY[0x1E0CB37E8];
  v256 = objc_msgSend_didDetectColocatedNetworkEnvironment(self, v252, v253, v254, v255);
  objc_msgSend_numberWithBool_(v251, v257, v256, v258, v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v261, (uint64_t)v260, (uint64_t)CFSTR("didDetectColocatedNetworkEnvironment"), v262);

  v263 = (void *)MEMORY[0x1E0CB37E8];
  v268 = objc_msgSend_wasAlreadyAssociated(self, v264, v265, v266, v267);
  objc_msgSend_numberWithBool_(v263, v269, v268, v270, v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v273, (uint64_t)v272, (uint64_t)CFSTR("wasAlreadyAssociated"), v274);

  v275 = (void *)MEMORY[0x1E0CB37E8];
  v280 = objc_msgSend_didDeferJoinToDiscoverMorePreferredNetwork(self, v276, v277, v278, v279);
  objc_msgSend_numberWithBool_(v275, v281, v280, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v285, (uint64_t)v284, (uint64_t)CFSTR("didDeferJoinToDiscoverMorePreferredNetwork"), v286);

  v287 = (void *)MEMORY[0x1E0CB37E8];
  v292 = objc_msgSend_didFallbackToJoinLessPreferredNetwork(self, v288, v289, v290, v291);
  objc_msgSend_numberWithBool_(v287, v293, v292, v294, v295);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v297, (uint64_t)v296, (uint64_t)CFSTR("didFallbackToJoinLessPreferredNetwork"), v298);

  objc_msgSend_network(self, v299, v300, v301, v302);
  v1512 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(v1512, v303, v304, v305, v306);
  v307 = objc_claimAutoreleasedReturnValue();
  v1511 = (void *)v307;
  if (v307)
  {
    v312 = (void *)v307;
    objc_msgSend_autoJoinParameters(self, v308, v309, v310, v311);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v313, v314, v315, v316, v317);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v318, v319, v320, v321, v322);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v312, v324, v325, v326, v327);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v323, v329, (uint64_t)v328, v330, v331))
      objc_msgSend_setObject_forKeyedSubscript_(v6, v332, v213, (uint64_t)CFSTR("didJoinTargetNetwork"), v333);
    else
      objc_msgSend_setObject_forKeyedSubscript_(v6, v332, v214, (uint64_t)CFSTR("didJoinTargetNetwork"), v333);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v308, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("didJoinTargetNetwork"), v311);
  }
  v338 = (void *)MEMORY[0x1E0CB37E8];
  v339 = objc_msgSend_scanDuration(self, v334, v335, v336, v337);
  objc_msgSend_numberWithUnsignedInteger_(v338, v340, v339, v341, v342);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v344, (uint64_t)v343, (uint64_t)CFSTR("scanDuration"), v345);

  v346 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scanChannels(self, v347, v348, v349, v350);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v356 = objc_msgSend_count(v351, v352, v353, v354, v355);
  objc_msgSend_numberWithUnsignedInteger_(v346, v357, v356, v358, v359);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v361, (uint64_t)v360, (uint64_t)CFSTR("scanChannelCount"), v362);

  v1549 = 0u;
  v1550 = 0u;
  v1547 = 0u;
  v1548 = 0u;
  objc_msgSend_scanChannels(self, v363, v364, v365, v366);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v369 = objc_msgSend_countByEnumeratingWithState_objects_count_(v367, v368, (uint64_t)&v1547, (uint64_t)v1557, 16);
  if (v369)
  {
    v374 = v369;
    v1521 = 0;
    v375 = 0;
    v376 = 0;
    v377 = *(_QWORD *)v1548;
    do
    {
      for (i = 0; i != v374; ++i)
      {
        if (*(_QWORD *)v1548 != v377)
          objc_enumerationMutation(v367);
        v379 = *(void **)(*((_QWORD *)&v1547 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v379, v370, v371, v372, v373))
        {
          ++v376;
        }
        else if (objc_msgSend_is5GHz(v379, v370, v371, v372, v373))
        {
          ++v375;
        }
        else
        {
          v1521 += objc_msgSend_is6GHz(v379, v370, v371, v372, v373);
        }
      }
      v374 = objc_msgSend_countByEnumeratingWithState_objects_count_(v367, v370, (uint64_t)&v1547, (uint64_t)v1557, 16);
    }
    while (v374);
  }
  else
  {
    v1521 = 0;
    v375 = 0;
    v376 = 0;
  }

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v380, v376, v381, v382);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v384, (uint64_t)v383, (uint64_t)CFSTR("scanChannelCount2GHz"), v385);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v386, v375, v387, v388);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v390, (uint64_t)v389, (uint64_t)CFSTR("scanChannelCount5GHz"), v391);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v392, v1521, v393, v394);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v1514 = v6;
  objc_msgSend_setObject_forKeyedSubscript_(v6, v396, (uint64_t)v395, (uint64_t)CFSTR("scanChannelCount6GHz"), v397);

  v1545 = 0u;
  v1546 = 0u;
  v1543 = 0u;
  v1544 = 0u;
  v1513 = self;
  objc_msgSend_preAssociationScanChannels(self, v398, v399, v400, v401);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v404 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v403, (uint64_t)&v1543, (uint64_t)v1556, 16);
  if (v404)
  {
    v409 = v404;
    v410 = 0;
    v411 = 0;
    v412 = 0;
    v413 = *(_QWORD *)v1544;
    do
    {
      for (j = 0; j != v409; ++j)
      {
        if (*(_QWORD *)v1544 != v413)
          objc_enumerationMutation(v402);
        v415 = *(void **)(*((_QWORD *)&v1543 + 1) + 8 * j);
        if (objc_msgSend_is2GHz(v415, v405, v406, v407, v408))
        {
          ++v412;
        }
        else if (objc_msgSend_is5GHz(v415, v405, v406, v407, v408))
        {
          ++v410;
        }
        else
        {
          v411 += objc_msgSend_is6GHz(v415, v405, v406, v407, v408);
        }
      }
      v409 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v405, (uint64_t)&v1543, (uint64_t)v1556, 16);
    }
    while (v409);
  }
  else
  {
    v410 = 0;
    v411 = 0;
    v412 = 0;
  }

  v416 = (void *)MEMORY[0x1E0CB37E8];
  v421 = objc_msgSend_preAssociationScanDuration(v1513, v417, v418, v419, v420);
  objc_msgSend_numberWithUnsignedInteger_(v416, v422, v421, v423, v424);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v426, (uint64_t)v425, (uint64_t)CFSTR("preAssocScanDuration"), v427);

  v428 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_preAssociationScanChannels(v1513, v429, v430, v431, v432);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  v438 = objc_msgSend_count(v433, v434, v435, v436, v437);
  objc_msgSend_numberWithUnsignedInteger_(v428, v439, v438, v440, v441);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v443, (uint64_t)v442, (uint64_t)CFSTR("preAssocScanChannelCount"), v444);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v445, v412, v446, v447);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v449, (uint64_t)v448, (uint64_t)CFSTR("preAssocScanChannelCount2GHz"), v450);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v451, v410, v452, v453);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v455, (uint64_t)v454, (uint64_t)CFSTR("preAssocScanChannelCount5GHz"), v456);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v457, v411, v458, v459);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v461, (uint64_t)v460, (uint64_t)CFSTR("preAssocScanChannelCount6GHz"), v462);

  v463 = (void *)MEMORY[0x1E0CB37E8];
  v468 = objc_msgSend_followup6GHzScanDuration(v1513, v464, v465, v466, v467);
  objc_msgSend_numberWithUnsignedInteger_(v463, v469, v468, v470, v471);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v473, (uint64_t)v472, (uint64_t)CFSTR("followup6GHzScanDuration"), v474);

  v475 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_followup6GHzScanChannels(v1513, v476, v477, v478, v479);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  v485 = objc_msgSend_count(v480, v481, v482, v483, v484);
  objc_msgSend_numberWithUnsignedInteger_(v475, v486, v485, v487, v488);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v490, (uint64_t)v489, (uint64_t)CFSTR("followup6GHzScanChannelCount"), v491);

  v496 = objc_msgSend_scanDuration(v1513, v492, v493, v494, v495);
  v501 = objc_msgSend_preAssociationScanDuration(v1513, v497, v498, v499, v500) + v496;
  v1519 = v501 + objc_msgSend_followup6GHzScanDuration(v1513, v502, v503, v504, v505);
  objc_msgSend_scanChannels(v1513, v506, v507, v508, v509);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  v515 = objc_msgSend_count(v510, v511, v512, v513, v514);

  objc_msgSend_preAssociationScanChannels(v1513, v516, v517, v518, v519);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  v525 = objc_msgSend_count(v520, v521, v522, v523, v524) + v515;

  objc_msgSend_followup6GHzScanChannels(v1513, v526, v527, v528, v529);
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  v535 = v525 + objc_msgSend_count(v530, v531, v532, v533, v534);

  v536 = v410 + v375;
  objc_msgSend_followup6GHzScanChannels(v1513, v537, v538, v539, v540);
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  v546 = v411 + v1521 + objc_msgSend_count(v541, v542, v543, v544, v545);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v547, v1519, v548, v549);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v551, (uint64_t)v550, (uint64_t)CFSTR("combinedScanDuration"), v552);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v553, v535, v554, v555);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v557, (uint64_t)v556, (uint64_t)CFSTR("combinedScanChannelCount"), v558);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v559, v412 + v376, v560, v561);
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v563, (uint64_t)v562, (uint64_t)CFSTR("combinedScanChannelCount2GHz"), v564);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v565, v536, v566, v567);
  v568 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v569, (uint64_t)v568, (uint64_t)CFSTR("combinedScanChannelCount5GHz"), v570);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v571, v546, v572, v573);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v575, (uint64_t)v574, (uint64_t)CFSTR("combinedScanChannelCount6GHz"), v576);

  v581 = objc_msgSend_didIncludeRemainingNon2GHzChannels(v1513, v577, v578, v579, v580);
  v584 = MEMORY[0x1E0C9AAB0];
  v585 = MEMORY[0x1E0C9AAA0];
  if (v581)
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v582, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("didIncludeRemainingNon2GHzChannels"), v583);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v582, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("didIncludeRemainingNon2GHzChannels"), v583);
  v590 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scanErrors(v1513, v586, v587, v588, v589);
  v591 = (void *)objc_claimAutoreleasedReturnValue();
  v596 = objc_msgSend_count(v591, v592, v593, v594, v595);
  objc_msgSend_numberWithUnsignedInteger_(v590, v597, v596, v598, v599);
  v600 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v601, (uint64_t)v600, (uint64_t)CFSTR("scanErrorCount"), v602);

  objc_msgSend_scanErrors(v1513, v603, v604, v605, v606);
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v607, v608, v609, v610, v611))
  {
    objc_msgSend_scanErrors(v1513, v612, v613, v614, v615);
    v616 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v616, v617, v618, v619, v620);
    v621 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(v1513, v622, (uint64_t)v621, v623, v624);
    v625 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v626, (uint64_t)v625, (uint64_t)CFSTR("lastScanError"), v627);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v612, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("lastScanError"), v615);
  }

  v628 = (void *)MEMORY[0x1E0CB37E8];
  v633 = objc_msgSend_GASQueryDuration(v1513, v629, v630, v631, v632);
  objc_msgSend_numberWithUnsignedInteger_(v628, v634, v633, v635, v636);
  v637 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v638, (uint64_t)v637, (uint64_t)CFSTR("GASQueryDuration"), v639);

  v640 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_GASQueryNetworks(v1513, v641, v642, v643, v644);
  v645 = (void *)objc_claimAutoreleasedReturnValue();
  v650 = objc_msgSend_count(v645, v646, v647, v648, v649);
  objc_msgSend_numberWithUnsignedInteger_(v640, v651, v650, v652, v653);
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v655, (uint64_t)v654, (uint64_t)CFSTR("GASQueryCount"), v656);

  v657 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_GASQueryErrors(v1513, v658, v659, v660, v661);
  v662 = (void *)objc_claimAutoreleasedReturnValue();
  v667 = objc_msgSend_count(v662, v663, v664, v665, v666);
  objc_msgSend_numberWithUnsignedInteger_(v657, v668, v667, v669, v670);
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v672, (uint64_t)v671, (uint64_t)CFSTR("GASQueryErrorCount"), v673);

  objc_msgSend_GASQueryErrors(v1513, v674, v675, v676, v677);
  v678 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v678, v679, v680, v681, v682))
  {
    objc_msgSend_GASQueryErrors(v1513, v683, v684, v685, v686);
    v687 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v687, v688, v689, v690, v691);
    v692 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(v1513, v693, (uint64_t)v692, v694, v695);
    v696 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v697, (uint64_t)v696, (uint64_t)CFSTR("lastGASQueryError"), v698);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v683, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("lastGASQueryError"), v686);
  }

  v699 = (void *)MEMORY[0x1E0CB37E8];
  v704 = objc_msgSend_joinDuration(v1513, v700, v701, v702, v703);
  objc_msgSend_numberWithUnsignedInteger_(v699, v705, v704, v706, v707);
  v708 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v709, (uint64_t)v708, (uint64_t)CFSTR("joinDuration"), v710);

  v711 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_joinErrors(v1513, v712, v713, v714, v715);
  v716 = (void *)objc_claimAutoreleasedReturnValue();
  v721 = objc_msgSend_count(v716, v717, v718, v719, v720);
  objc_msgSend_numberWithUnsignedInteger_(v711, v722, v721, v723, v724);
  v725 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v726, (uint64_t)v725, (uint64_t)CFSTR("joinErrorCount"), v727);

  objc_msgSend_joinErrors(v1513, v728, v729, v730, v731);
  v732 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v732, v733, v734, v735, v736))
  {
    objc_msgSend_joinErrors(v1513, v737, v738, v739, v740);
    v741 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v741, v742, v743, v744, v745);
    v746 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(v1513, v747, (uint64_t)v746, v748, v749);
    v750 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v751, (uint64_t)v750, (uint64_t)CFSTR("lastJoinError"), v752);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v737, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("lastJoinError"), v740);
  }

  if (v1512)
  {
    v757 = objc_msgSend_supportedSecurityTypes(v1512, v753, v754, v755, v756);
    v762 = (const char *)objc_msgSend_WEPSubtype(v1511, v758, v759, v760, v761);
    v767 = objc_msgSend_WAPISubtype(v1511, v763, v764, v765, v766);
    sub_1B06248F4(v757, v762, v767, v768, v769);
    v770 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v771, (uint64_t)v770, (uint64_t)CFSTR("networkSecurityType"), v772);

    v777 = objc_msgSend_supportedPHYModes(v1512, v773, v774, v775, v776);
    sub_1B0625874(v777, v778, v779, v780, v781);
    v782 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v783, (uint64_t)v782, (uint64_t)CFSTR("networkPHYMode"), v784);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v753, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("networkSecurityType"), v756);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v789, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("networkPHYMode"), v790);
  }
  if (objc_msgSend_hiddenState(v1511, v785, v786, v787, v788) == 1)
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v791, v584, (uint64_t)CFSTR("networkIsHidden"), v792);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v791, v585, (uint64_t)CFSTR("networkIsHidden"), v792);
  if ((objc_msgSend_isCaptive(v1511, v793, v794, v795, v796) & 1) != 0
    || objc_msgSend_wasCaptive(v1511, v797, v798, v799, v800))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v797, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("networkIsCaptive"), v800);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v797, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("networkIsCaptive"), v800);
  }
  if ((objc_msgSend_isPasspoint(v1511, v801, v802, v803, v804) & 1) != 0
    || objc_msgSend_isPasspoint(v1512, v805, v806, v807, v808))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v805, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("networkIsPasspoint"), v808);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v805, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("networkIsPasspoint"), v808);
  }
  if ((objc_msgSend_isPersonalHotspot(v1511, v809, v810, v811, v812) & 1) != 0
    || objc_msgSend_isPersonalHotspot(v1512, v813, v814, v815, v816))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v813, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("networkIsPersonalHotspot"), v816);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v813, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("networkIsPersonalHotspot"), v816);
  }
  if ((objc_msgSend_isCarPlay(v1511, v817, v818, v819, v820) & 1) != 0
    || objc_msgSend_supportsCarPlay(v1512, v821, v822, v823, v824))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v821, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("networkIsCarPlay"), v824);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v821, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("networkIsCarPlay"), v824);
  }
  v829 = (void *)MEMORY[0x1E0CB37E8];
  v830 = objc_msgSend_RSSI(v1512, v825, v826, v827, v828);
  objc_msgSend_numberWithInteger_(v829, v831, v830, v832, v833);
  v834 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v835, (uint64_t)v834, (uint64_t)CFSTR("networkRSSI"), v836);

  objc_msgSend_channel(v1512, v837, v838, v839, v840);
  v841 = (void *)objc_claimAutoreleasedReturnValue();
  v1510 = v841;
  if (v841)
  {
    v846 = v841;
    v847 = (void *)MEMORY[0x1E0CB3940];
    v848 = objc_msgSend_channel(v841, v842, v843, v844, v845);
    v853 = objc_msgSend_band(v846, v849, v850, v851, v852);
    sub_1B0642A04(v853, v854, v855, v856, v857);
    v858 = (void *)objc_claimAutoreleasedReturnValue();
    v863 = objc_msgSend_width(v846, v859, v860, v861, v862);
    objc_msgSend_stringWithFormat_(v847, v864, (uint64_t)CFSTR("%ld (%@, %dMHz)"), v865, v866, v848, v858, v863);
    v867 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v868, (uint64_t)v867, (uint64_t)CFSTR("networkChannel"), v869);

    v874 = objc_msgSend_band(v846, v870, v871, v872, v873);
    sub_1B0642A04(v874, v875, v876, v877, v878);
    v879 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v880, (uint64_t)v879, (uint64_t)CFSTR("networkChannelBand"), v881);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v842, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("networkChannel"), v845);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v886, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("networkChannelBand"), v887);
  }
  if (objc_msgSend_was6EDisabled(v1513, v882, v883, v884, v885))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v888, v584, (uint64_t)CFSTR("was6EDisabled"), v889);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v888, v585, (uint64_t)CFSTR("was6EDisabled"), v889);
  if (objc_msgSend_was6EPreferOn(v1513, v890, v891, v892, v893))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v894, v584, (uint64_t)CFSTR("was6EPreferOn"), v895);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v894, v585, (uint64_t)CFSTR("was6EPreferOn"), v895);
  if (objc_msgSend_isWiFi6E(v1512, v896, v897, v898, v899))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v900, v584, (uint64_t)CFSTR("networkIsWiFi6E"), v901);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v900, v585, (uint64_t)CFSTR("networkIsWiFi6E"), v901);
  if (objc_msgSend_wasDiscoveredViaRNR(v1513, v902, v903, v904, v905))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v906, v584, (uint64_t)CFSTR("wasDiscoveredViaRNR"), v907);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v906, v585, (uint64_t)CFSTR("wasDiscoveredViaRNR"), v907);
  if (objc_msgSend_wasDiscoveredViaFILSD(v1513, v908, v909, v910, v911))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v912, v584, (uint64_t)CFSTR("wasDiscoveredViaFILSD"), v913);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v912, v585, (uint64_t)CFSTR("wasDiscoveredViaFILSD"), v913);
  if (objc_msgSend_was6GHzDeprioritized(v1513, v914, v915, v916, v917))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v918, v584, (uint64_t)CFSTR("was6GHzDeprioritized"), v919);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v918, v585, (uint64_t)CFSTR("was6GHzDeprioritized"), v919);
  objc_msgSend_matchingKnownNetworkProfile(v1512, v920, v921, v922, v923);
  v924 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isStandalone6G(v924, v925, v926, v927, v928))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v929, v584, (uint64_t)CFSTR("networkIsSplitSSID6GHz"), v930);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v929, v585, (uint64_t)CFSTR("networkIsSplitSSID6GHz"), v930);

  if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v1511, v931, v932, v933, v934))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v935, v584, (uint64_t)CFSTR("networkIs6GHzOnly"), v936);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v935, v585, (uint64_t)CFSTR("networkIs6GHzOnly"), v936);
  objc_msgSend_BSSID(v1512, v937, v938, v939, v940);
  v941 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v941, v942, 8, v943, v944);
  v945 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v946, (uint64_t)v945, (uint64_t)CFSTR("networkOUI"), v947);

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v948, v949, v950, v951);
  v953 = v952;
  objc_msgSend_lastJoinedAt(v1511, v954, v955, v956, v957);
  v958 = (void *)objc_claimAutoreleasedReturnValue();
  v1509 = v958;
  if (v958)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v958, v959, v960, v961, v962);
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v964, (unint64_t)((v953 - v963) / 86400.0 / 30.4375), v965, v966);
    v967 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v968, (uint64_t)v967, (uint64_t)CFSTR("numberOfMonthsSinceLastJoin"), v969);

    objc_msgSend_setObject_forKeyedSubscript_(v1514, v970, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("networkWasJoinedBefore"), v971);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v959, (uint64_t)&unk_1E615F600, (uint64_t)CFSTR("numberOfMonthsSinceLastJoin"), v962);
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v976, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("networkWasJoinedBefore"), v977);
  }
  if (objc_msgSend_didPerformSeamlessSSIDTransition(v1513, v972, v973, v974, v975))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v978, v584, (uint64_t)CFSTR("didPerformSeamlessSSIDTransition"), v979);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v978, v585, (uint64_t)CFSTR("didPerformSeamlessSSIDTransition"), v979);
  if (objc_msgSend_didTriggerReassoc(v1513, v980, v981, v982, v983))
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v984, v584, (uint64_t)CFSTR("didTriggerReassoc"), v985);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v984, v585, (uint64_t)CFSTR("didTriggerReassoc"), v985);
  v1541 = 0u;
  v1542 = 0u;
  v1539 = 0u;
  v1540 = 0u;
  objc_msgSend_preferredChannelList(v1513, v986, v987, v988, v989);
  v990 = (void *)objc_claimAutoreleasedReturnValue();
  v992 = objc_msgSend_countByEnumeratingWithState_objects_count_(v990, v991, (uint64_t)&v1539, (uint64_t)v1555, 16);
  if (v992)
  {
    v996 = v992;
    v997 = *(_QWORD *)v1540;
    while (2)
    {
      for (k = 0; k != v996; ++k)
      {
        if (*(_QWORD *)v1540 != v997)
          objc_enumerationMutation(v990);
        v999 = *(void **)(*((_QWORD *)&v1539 + 1) + 8 * k);
        if (v999 == v1510
          || v1510 && v999 && objc_msgSend_isEqual_(v999, v993, (uint64_t)v1510, v994, v995))
        {
          objc_msgSend_setObject_forKeyedSubscript_(v1514, v993, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("didJoinPreferredChannel"), v995);
          goto LABEL_124;
        }
      }
      v996 = objc_msgSend_countByEnumeratingWithState_objects_count_(v990, v993, (uint64_t)&v1539, (uint64_t)v1555, 16);
      if (v996)
        continue;
      break;
    }
  }
LABEL_124:

  v1537 = 0u;
  v1538 = 0u;
  v1535 = 0u;
  v1536 = 0u;
  objc_msgSend_recentChannelList(v1513, v1000, v1001, v1002, v1003);
  v1004 = (void *)objc_claimAutoreleasedReturnValue();
  v1006 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1004, v1005, (uint64_t)&v1535, (uint64_t)v1554, 16);
  if (v1006)
  {
    v1010 = v1006;
    v1011 = *(_QWORD *)v1536;
    while (2)
    {
      for (m = 0; m != v1010; ++m)
      {
        if (*(_QWORD *)v1536 != v1011)
          objc_enumerationMutation(v1004);
        v1013 = *(void **)(*((_QWORD *)&v1535 + 1) + 8 * m);
        if (v1013 == v1510
          || v1510 && v1013 && objc_msgSend_isEqual_(v1013, v1007, (uint64_t)v1510, v1008, v1009))
        {
          objc_msgSend_setObject_forKeyedSubscript_(v1514, v1007, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("didJoinRecentChannel"), v1009);
          goto LABEL_137;
        }
      }
      v1010 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1004, v1007, (uint64_t)&v1535, (uint64_t)v1554, 16);
      if (v1010)
        continue;
      break;
    }
  }
LABEL_137:

  v1533 = 0u;
  v1534 = 0u;
  v1531 = 0u;
  v1532 = 0u;
  objc_msgSend_remainingChannelList(v1513, v1014, v1015, v1016, v1017);
  v1018 = (void *)objc_claimAutoreleasedReturnValue();
  v1020 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1018, v1019, (uint64_t)&v1531, (uint64_t)v1553, 16);
  if (v1020)
  {
    v1024 = v1020;
    v1025 = *(_QWORD *)v1532;
    while (2)
    {
      for (n = 0; n != v1024; ++n)
      {
        if (*(_QWORD *)v1532 != v1025)
          objc_enumerationMutation(v1018);
        v1027 = *(void **)(*((_QWORD *)&v1531 + 1) + 8 * n);
        if (v1027 == v1510
          || v1510 && v1027 && objc_msgSend_isEqual_(v1027, v1021, (uint64_t)v1510, v1022, v1023))
        {
          objc_msgSend_setObject_forKeyedSubscript_(v1514, v1021, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("didJoinRemainingChannel"), v1023);
          goto LABEL_150;
        }
      }
      v1024 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1018, v1021, (uint64_t)&v1531, (uint64_t)v1553, 16);
      if (v1024)
        continue;
      break;
    }
  }
LABEL_150:

  objc_msgSend_set(MEMORY[0x1E0C99E20], v1028, v1029, v1030, v1031);
  v1516 = (void *)objc_claimAutoreleasedReturnValue();
  v1036 = objc_msgSend_RSSI(v1512, v1032, v1033, v1034, v1035);
  v1527 = 0u;
  v1528 = 0u;
  v1529 = 0u;
  v1530 = 0u;
  objc_msgSend_candidates(v1513, v1037, v1038, v1039, v1040);
  v1041 = (void *)objc_claimAutoreleasedReturnValue();
  v1043 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1041, v1042, (uint64_t)&v1527, (uint64_t)v1552, 16);
  if (v1043)
  {
    v1048 = v1043;
    v1049 = *(_QWORD *)v1528;
    do
    {
      for (ii = 0; ii != v1048; ++ii)
      {
        if (*(_QWORD *)v1528 != v1049)
          objc_enumerationMutation(v1041);
        v1051 = *(void **)(*((_QWORD *)&v1527 + 1) + 8 * ii);
        objc_msgSend_SSID(v1051, v1044, v1045, v1046, v1047);
        v1056 = (void *)objc_claimAutoreleasedReturnValue();
        if (v1056)
          objc_msgSend_addObject_(v1516, v1052, (uint64_t)v1056, v1054, v1055);
        if (v1036 <= objc_msgSend_RSSI(v1051, v1052, v1053, v1054, v1055))
          v1036 = objc_msgSend_RSSI(v1051, v1057, v1058, v1059, v1060);

      }
      v1048 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1041, v1044, (uint64_t)&v1527, (uint64_t)v1552, 16);
    }
    while (v1048);
  }

  v1061 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_candidates(v1513, v1062, v1063, v1064, v1065);
  v1066 = (void *)objc_claimAutoreleasedReturnValue();
  v1071 = objc_msgSend_count(v1066, v1067, v1068, v1069, v1070);
  objc_msgSend_numberWithUnsignedInteger_(v1061, v1072, v1071, v1073, v1074);
  v1075 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1076, (uint64_t)v1075, (uint64_t)CFSTR("candidateBSSCount"), v1077);

  v1078 = (void *)MEMORY[0x1E0CB37E8];
  v1083 = objc_msgSend_count(v1516, v1079, v1080, v1081, v1082);
  objc_msgSend_numberWithUnsignedInteger_(v1078, v1084, v1083, v1085, v1086);
  v1087 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1088, (uint64_t)v1087, (uint64_t)CFSTR("candidateSSIDCount"), v1089);

  v1090 = (void *)MEMORY[0x1E0CB37E8];
  v1095 = objc_msgSend_RSSI(v1512, v1091, v1092, v1093, v1094);
  objc_msgSend_numberWithInteger_(v1090, v1096, v1095 - v1036, v1097, v1098);
  v1099 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1100, (uint64_t)v1099, (uint64_t)CFSTR("bestRSSIDelta"), v1101);

  objc_msgSend_associatedNetwork(v1513, v1102, v1103, v1104, v1105);
  v1106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1106)
  {
    v1111 = (void *)MEMORY[0x1E0CB37E8];
    v1112 = objc_msgSend_RSSI(v1512, v1107, v1108, v1109, v1110);
    objc_msgSend_associatedNetwork(v1513, v1113, v1114, v1115, v1116);
    v1117 = (void *)objc_claimAutoreleasedReturnValue();
    v1122 = objc_msgSend_RSSI(v1117, v1118, v1119, v1120, v1121);
    objc_msgSend_numberWithInteger_(v1111, v1123, v1112 - v1122, v1124, v1125);
    v1126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1127, (uint64_t)v1126, (uint64_t)CFSTR("associatedRSSIDelta"), v1128);

  }
  v1525 = 0u;
  v1526 = 0u;
  v1523 = 0u;
  v1524 = 0u;
  objc_msgSend_knownNetworks(v1513, v1107, v1108, v1109, v1110);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1518 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v1129, (uint64_t)&v1523, (uint64_t)v1551, 16);
  v1134 = 0;
  v1135 = 0;
  v1136 = 0;
  v1137 = 0;
  v1138 = 0;
  v1139 = 0;
  v1140 = 0;
  if (v1518)
  {
    v1520 = 0;
    v1522 = 0;
    v1517 = *(_QWORD *)v1524;
    do
    {
      for (jj = 0; jj != v1518; ++jj)
      {
        if (*(_QWORD *)v1524 != v1517)
          objc_enumerationMutation(obj);
        v1142 = *(void **)(*((_QWORD *)&v1523 + 1) + 8 * jj);
        isCaptive = objc_msgSend_isCaptive(v1142, v1130, v1131, v1132, v1133);
        v1134 += isCaptive;
        v1135 += isCaptive ^ 1;
        if (objc_msgSend_hiddenState(v1142, v1144, v1145, v1146, v1147) == 1)
          ++v1136;
        objc_msgSend_lastJoinedAt(v1142, v1148, v1149, v1150, v1151);
        v1152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v1152, v1153, v1154, v1155, v1156);
        v1158 = v953 - v1157;

        if (v1158 < 604800.0)
          ++v1137;
        objc_msgSend_lastJoinedAt(v1142, v1159, v1160, v1161, v1162);
        v1163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v1163, v1164, v1165, v1166, v1167);
        v1169 = v953 - v1168;

        if (v1169 < 2629800.0)
          ++v1138;
        objc_msgSend_lastJoinedAt(v1142, v1170, v1171, v1172, v1173);
        v1174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v1174, v1175, v1176, v1177, v1178);
        v1180 = v953 - v1179;

        if (v1180 < 7889400.0)
          ++v1139;
        objc_msgSend_lastJoinedAt(v1142, v1181, v1182, v1183, v1184);
        v1185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v1185, v1186, v1187, v1188, v1189);
        v1191 = v953 - v1190;

        if (v1191 < 15778800.0)
          ++v1140;
        objc_msgSend_lastJoinedAt(v1142, v1192, v1193, v1194, v1195);
        v1196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v1196, v1197, v1198, v1199, v1200);
        v1202 = v953 - v1201;

        v1207 = v1520;
        if (v1202 < 31557600.0)
          v1207 = v1520 + 1;
        v1520 = v1207;
        objc_msgSend_lastJoinedAt(v1142, v1203, v1204, v1205, v1206);
        v1208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v1208, v1209, v1210, v1211, v1212);
        v1214 = v953 - v1213;

        v1215 = v1522;
        if (v1214 < 63115200.0)
          v1215 = v1522 + 1;
        v1522 = v1215;
      }
      v1518 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v1130, (uint64_t)&v1523, (uint64_t)v1551, 16);
    }
    while (v1518);
  }
  else
  {
    v1520 = 0;
    v1522 = 0;
  }

  v1216 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_knownNetworks(v1513, v1217, v1218, v1219, v1220);
  v1221 = (void *)objc_claimAutoreleasedReturnValue();
  v1226 = objc_msgSend_count(v1221, v1222, v1223, v1224, v1225);
  objc_msgSend_numberWithUnsignedInteger_(v1216, v1227, v1226, v1228, v1229);
  v1230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1231, (uint64_t)v1230, (uint64_t)CFSTR("knownNetworksCount"), v1232);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1233, v1134, v1234, v1235);
  v1236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1237, (uint64_t)v1236, (uint64_t)CFSTR("captiveKnownNetworksCount"), v1238);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1239, v1135, v1240, v1241);
  v1242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1243, (uint64_t)v1242, (uint64_t)CFSTR("nonCaptiveKnownNetworksCount"), v1244);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1245, v1136, v1246, v1247);
  v1248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1249, (uint64_t)v1248, (uint64_t)CFSTR("hiddenKnownNetworksCount"), v1250);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1251, v1137, v1252, v1253);
  v1254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1255, (uint64_t)v1254, (uint64_t)CFSTR("joinedKnownNetworksCountLastWeek"), v1256);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1257, v1138, v1258, v1259);
  v1260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1261, (uint64_t)v1260, (uint64_t)CFSTR("joinedKnownNetworksCountLastMonth"), v1262);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1263, v1139, v1264, v1265);
  v1266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1267, (uint64_t)v1266, (uint64_t)CFSTR("joinedKnownNetworksCountLast3Months"), v1268);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1269, v1140, v1270, v1271);
  v1272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1273, (uint64_t)v1272, (uint64_t)CFSTR("joinedKnownNetworksCountLast6Months"), v1274);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1275, v1520, v1276, v1277);
  v1278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1279, (uint64_t)v1278, (uint64_t)CFSTR("joinedKnownNetworksCountLastYear"), v1280);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v1281, v1522, v1282, v1283);
  v1284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1285, (uint64_t)v1284, (uint64_t)CFSTR("joinedKnownNetworksCountLast2Years"), v1286);

  v1287 = (void *)MEMORY[0x1E0CB37E8];
  v1292 = objc_msgSend_autoHotspotWasAttempted(v1513, v1288, v1289, v1290, v1291);
  objc_msgSend_numberWithBool_(v1287, v1293, v1292, v1294, v1295);
  v1296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1297, (uint64_t)v1296, (uint64_t)CFSTR("autoHotspotWasAttempted"), v1298);

  v1299 = (void *)MEMORY[0x1E0CB37E8];
  v1304 = objc_msgSend_autoHotspotResult(v1513, v1300, v1301, v1302, v1303);
  objc_msgSend_numberWithBool_(v1299, v1305, v1304, v1306, v1307);
  v1308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1309, (uint64_t)v1308, (uint64_t)CFSTR("autoHotspotResult"), v1310);

  v1315 = objc_msgSend_autoHotspotMode(v1513, v1311, v1312, v1313, v1314);
  sub_1B06427C0(v1315, v1316, v1317, v1318, v1319);
  v1320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1321, (uint64_t)v1320, (uint64_t)CFSTR("autoHotspotMode"), v1322);

  v1323 = (void *)MEMORY[0x1E0CB37E8];
  v1328 = objc_msgSend_autoHotspotWasAborted(v1513, v1324, v1325, v1326, v1327);
  objc_msgSend_numberWithBool_(v1323, v1329, v1328, v1330, v1331);
  v1332 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1333, (uint64_t)v1332, (uint64_t)CFSTR("autoHotspotWasAborted"), v1334);

  v1335 = (void *)MEMORY[0x1E0CB37E8];
  v1340 = objc_msgSend_autoHotspotDuration(v1513, v1336, v1337, v1338, v1339);
  objc_msgSend_numberWithUnsignedInteger_(v1335, v1341, v1340, v1342, v1343);
  v1344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1345, (uint64_t)v1344, (uint64_t)CFSTR("autoHotspotDuration"), v1346);

  objc_msgSend_autoHotspotError(v1513, v1347, v1348, v1349, v1350);
  v1355 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1355)
  {
    objc_msgSend_autoHotspotError(v1513, v1351, v1352, v1353, v1354);
    v1356 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(v1513, v1357, (uint64_t)v1356, v1358, v1359);
    v1360 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1361, (uint64_t)v1360, (uint64_t)CFSTR("autoHotspotError"), v1362);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1351, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("autoHotspotError"), v1354);
  }

  v1363 = (void *)MEMORY[0x1E0CB37E8];
  v1368 = objc_msgSend_autoHotspotBrowseDuration(v1513, v1364, v1365, v1366, v1367);
  objc_msgSend_numberWithUnsignedInteger_(v1363, v1369, v1368, v1370, v1371);
  v1372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1373, (uint64_t)v1372, (uint64_t)CFSTR("autoHotspotBrowseDuration"), v1374);

  objc_msgSend_autoHotspotBrowseError(v1513, v1375, v1376, v1377, v1378);
  v1383 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1383)
  {
    objc_msgSend_autoHotspotBrowseError(v1513, v1379, v1380, v1381, v1382);
    v1384 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(v1513, v1385, (uint64_t)v1384, v1386, v1387);
    v1388 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1389, (uint64_t)v1388, (uint64_t)CFSTR("autoHotspotBrowseError"), v1390);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1379, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("autoHotspotBrowseError"), v1382);
  }

  v1391 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_autoHotspotJoinErrors(v1513, v1392, v1393, v1394, v1395);
  v1396 = (void *)objc_claimAutoreleasedReturnValue();
  v1401 = objc_msgSend_count(v1396, v1397, v1398, v1399, v1400);
  objc_msgSend_numberWithUnsignedInteger_(v1391, v1402, v1401, v1403, v1404);
  v1405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1406, (uint64_t)v1405, (uint64_t)CFSTR("autoHotspotJoinErrorCount"), v1407);

  objc_msgSend_autoHotspotJoinErrors(v1513, v1408, v1409, v1410, v1411);
  v1412 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v1412, v1413, v1414, v1415, v1416))
  {
    objc_msgSend_autoHotspotJoinErrors(v1513, v1417, v1418, v1419, v1420);
    v1421 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v1421, v1422, v1423, v1424, v1425);
    v1426 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(v1513, v1427, (uint64_t)v1426, v1428, v1429);
    v1430 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1431, (uint64_t)v1430, (uint64_t)CFSTR("autoHotspotLastJoinError"), v1432);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1514, v1417, (uint64_t)CFSTR("none"), (uint64_t)CFSTR("autoHotspotLastJoinError"), v1420);
  }

  objc_msgSend_hotspot(v1513, v1433, v1434, v1435, v1436);
  v1437 = (void *)objc_claimAutoreleasedReturnValue();
  v1442 = objc_msgSend_networkType(v1437, v1438, v1439, v1440, v1441);
  sub_1B06428F4(v1442, v1443, v1444, v1445, v1446);
  v1447 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1448, (uint64_t)v1447, (uint64_t)CFSTR("autoHotspotHotspotNetworkType"), v1449);

  objc_msgSend_hotspot(v1513, v1450, v1451, v1452, v1453);
  v1454 = (void *)objc_claimAutoreleasedReturnValue();
  v1459 = objc_msgSend_group(v1454, v1455, v1456, v1457, v1458);
  sub_1B0642958(v1459, v1460, v1461, v1462, v1463);
  v1464 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1465, (uint64_t)v1464, (uint64_t)CFSTR("autoHotspotHotspotDeviceGroup"), v1466);

  objc_msgSend_hotspot(v1513, v1467, v1468, v1469, v1470);
  v1471 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_batteryLife(v1471, v1472, v1473, v1474, v1475);
  v1476 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1477, (uint64_t)v1476, (uint64_t)CFSTR("autoHotspotHotspotBatteryLevel"), v1478);

  objc_msgSend_hotspot(v1513, v1479, v1480, v1481, v1482);
  v1483 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalStrength(v1483, v1484, v1485, v1486, v1487);
  v1488 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1489, (uint64_t)v1488, (uint64_t)CFSTR("autoHotspotHotspotSignalStrength"), v1490);

  objc_msgSend_hotspot(v1513, v1491, v1492, v1493, v1494);
  v1495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_model(v1495, v1496, v1497, v1498, v1499);
  v1500 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v1514, v1501, (uint64_t)v1500, (uint64_t)CFSTR("autoHotspotHotspotDeviceModel"), v1502);

  v1507 = (void *)objc_msgSend_copy(v1514, v1503, v1504, v1505, v1506);
  return (NSDictionary *)v1507;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  CWFAutoJoinMetric *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self;
  objc_msgSend_coreAnalyticsEventPayload(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend_allKeys(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v16, v17, (uint64_t)sel_caseInsensitiveCompare_, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v20;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v59, (uint64_t)v63, 16);
  if (v23)
  {
    v27 = v23;
    v28 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v60 != v28)
          objc_enumerationMutation(v21);
        v30 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_objectForKeyedSubscript_(v11, v24, v30, v25, v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v31, v33, (uint64_t)CFSTR("%@=%@"), v34, v35, v30, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v6, v37, (uint64_t)v36, v38, v39);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v59, (uint64_t)v63, 16);
    }
    while (v27);
  }

  v40 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_optimizedChannelList(v58, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v40, v46, (uint64_t)CFSTR("optimizedChannelList=%@"), v47, v48, v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v50, (uint64_t)v49, v51, v52);

  objc_msgSend_componentsJoinedByString_(v6, v53, (uint64_t)CFSTR(", "), v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v56;
}

- (BOOL)isEqualToAutoJoinMetric:(id)a3
{
  uint64_t v3;
  void *hotspot;
  void *v5;
  id v7;
  unint64_t duration;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  void *error;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  int v194;
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
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  int v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  int v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
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
  int v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  SFRemoteHotspotDevice *v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  int v475;
  int v476;
  int v477;
  int v478;
  int v479;
  int v480;
  int v481;
  int v482;
  uint64_t v483;
  int v484;
  int v485;
  int v486;
  int v487;
  int v488;
  int v489;
  int v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  int v496;
  int v497;
  uint64_t v498;
  __int128 v499;
  uint64_t v500;
  _BOOL4 v501;
  int v502;
  uint64_t v503;
  _BOOL4 v504;
  _BOOL4 v505;
  _BOOL4 v506;
  _BOOL4 v507;
  _BOOL4 v508;
  _BOOL4 v509;
  _BOOL4 v510;
  _BOOL4 v511;
  _BYTE v512[28];
  uint64_t v513;

  v7 = a3;
  duration = self->_result;
  if ((_DWORD)duration != objc_msgSend_result(v7, v9, v10, v11, v12)
    || (duration = self->_duration, duration != objc_msgSend_duration(v7, v13, v14, v15, v16))
    || (duration = self->_durationFromLinkDownTrigger, duration != objc_msgSend_duration(v7, v17, v18, v19, v20))
    || (duration = self->_durationFromDisplayOnTrigger,
        duration != objc_msgSend_durationFromDisplayOnTrigger(v7, v21, v22, v23, v24))
    || (duration = self->_durationFromDeviceUnlockTrigger,
        duration != objc_msgSend_durationFromDeviceUnlockTrigger(v7, v25, v26, v27, v28))
    || (duration = self->_durationFromWiFiPowerOnTrigger,
        duration != objc_msgSend_durationFromWiFiPowerOnTrigger(v7, v29, v30, v31, v32))
    || (duration = self->_previousNonRetryAutoJoinTrigger,
        duration != objc_msgSend_previousNonRetryAutoJoinTrigger(v7, v33, v34, v35, v36))
    || (duration = self->_durationFromNonRetryAutoJoinTrigger,
        duration != objc_msgSend_durationFromNonRetryAutoJoinTrigger(v7, v37, v38, v39, v40)))
  {
    v502 = 0;
    v513 = 0;
    v499 = 0uLL;
    v500 = 0;
    v497 = 0;
    v59 = 0;
    v60 = 0;
    v495 = 0;
    v493 = 0;
    v492 = 0;
    v491 = 0;
    memset(v512, 0, sizeof(v512));
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v496 = 0;
    v501 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    goto LABEL_15;
  }
  duration = (unint64_t)self->_error;
  objc_msgSend_error(v7, v41, v42, v43, v44);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = duration != (_QWORD)v474;
  if ((void *)duration != v474)
  {
    error = self->_error;
    if (!error)
    {
      v513 = 0;
      v499 = 0uLL;
      v500 = 0;
      v497 = 0;
      v59 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v496 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      goto LABEL_15;
    }
    objc_msgSend_error(v7, v45, v46, v47, v48);
    v51 = objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      v473 = 0;
      v499 = 0uLL;
      v500 = 0;
      v497 = 0;
      v59 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v496 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v513 = 1;
      goto LABEL_15;
    }
    v473 = (void *)v51;
    duration = (unint64_t)self->_error;
    objc_msgSend_error(v7, v52, v53, v54, v55);
    v472 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v56, (uint64_t)v472, v57, v58))
    {
      v500 = 0;
      v497 = 0;
      v59 = 0;
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v496 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v513 = 1;
      *((_QWORD *)&v499 + 1) = 1;
      goto LABEL_15;
    }
  }
  duration = self->_wasCancelled;
  LODWORD(v513) = v49;
  if ((_DWORD)duration != objc_msgSend_wasCancelled(v7, v45, v46, v47, v48)
    || (duration = self->_wasAborted, (_DWORD)duration != objc_msgSend_wasAborted(v7, v71, v72, v73, v74)))
  {
    v500 = 0;
    HIDWORD(v513) = 0;
    v497 = 0;
    v59 = 0;
    *(_QWORD *)&v499 = 0;
    v60 = 0;
    v495 = 0;
    v493 = 0;
    v492 = 0;
    v491 = 0;
    memset(v512, 0, sizeof(v512));
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v496 = 0;
    v498 = 0;
    *((_QWORD *)&v499 + 1) = v49;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    goto LABEL_15;
  }
  duration = (unint64_t)self->_autoJoinParameters;
  objc_msgSend_autoJoinParameters(v7, v75, v76, v77, v78);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = duration != (_QWORD)v471;
  if ((void *)duration != v471)
  {
    error = self->_autoJoinParameters;
    if (!error)
    {
      HIDWORD(v513) = 0;
      v497 = 0;
      v500 = 0x100000000;
      v59 = 0;
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v496 = 0;
      v498 = 0;
      *((_QWORD *)&v499 + 1) = v49;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      goto LABEL_15;
    }
    objc_msgSend_autoJoinParameters(v7, v79, v80, v81, v82);
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v470)
    {
      v470 = 0;
      v497 = 0;
      v500 = 0x100000000;
      v59 = 0;
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v496 = 0;
      v498 = 0;
      *((_QWORD *)&v499 + 1) = v49;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      HIDWORD(v513) = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_autoJoinParameters;
    objc_msgSend_autoJoinParameters(v7, v83, v84, v85, v86);
    v469 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v87, (uint64_t)v469, v88, v89))
    {
      v500 = 0x100000000;
      v59 = 0;
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      *((_QWORD *)&v499 + 1) = v49;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      HIDWORD(v513) = 1;
      v496 = 0;
      v497 = 1;
      goto LABEL_15;
    }
  }
  HIDWORD(v513) = v3;
  duration = self->_retrySchedule;
  if (duration != objc_msgSend_retrySchedule(v7, v79, v80, v81, v82)
    || (duration = self->_retryScheduleIndex, duration != objc_msgSend_retryScheduleIndex(v7, v90, v91, v92, v93)))
  {
    LODWORD(v500) = 0;
    v59 = 0;
    *(_QWORD *)&v499 = 0;
    v60 = 0;
    v495 = 0;
    v493 = 0;
    v492 = 0;
    v491 = 0;
    memset(v512, 0, sizeof(v512));
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v496 = 0;
    v498 = 0;
    *((_QWORD *)&v499 + 1) = v49;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
LABEL_169:
    HIDWORD(v500) = 1;
    v497 = v3;
    goto LABEL_15;
  }
  duration = self->_didUseLocationOptimizedChannelList;
  if ((_DWORD)duration != objc_msgSend_didUseLocationOptimizedChannelList(v7, v94, v95, v96, v97)
    || (duration = self->_didDetectColocatedNetworkEnvironment,
        (_DWORD)duration != objc_msgSend_didDetectColocatedNetworkEnvironment(v7, v98, v99, v100, v101))
    || (duration = self->_wasAlreadyAssociated,
        (_DWORD)duration != objc_msgSend_wasAlreadyAssociated(v7, v102, v103, v104, v105))
    || (duration = self->_didDeferJoinToDiscoverMorePreferredNetwork,
        (_DWORD)duration != objc_msgSend_didDeferJoinToDiscoverMorePreferredNetwork(v7, v106, v107, v108, v109))|| (duration = self->_didFallbackToJoinLessPreferredNetwork, (_DWORD)duration != objc_msgSend_didFallbackToJoinLessPreferredNetwork(v7, v110, v111, v112, v113)))
  {
    LODWORD(v500) = 0;
    v59 = 0;
    *(_QWORD *)&v499 = 0;
    v60 = 0;
    v495 = 0;
    v493 = 0;
    v492 = 0;
    v491 = 0;
    memset(v512, 0, sizeof(v512));
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v496 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    *((_QWORD *)&v499 + 1) = v49;
    goto LABEL_169;
  }
  duration = (unint64_t)self->_preferredChannelList;
  objc_msgSend_preferredChannelList(v7, v114, v115, v116, v117);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v512[24] = duration != (_QWORD)v468;
  if ((void *)duration != v468)
  {
    error = self->_preferredChannelList;
    if (!error)
    {
      v59 = 0;
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, sizeof(v512));
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      goto LABEL_15;
    }
    objc_msgSend_preferredChannelList(v7, v118, v119, v120, v121);
    v467 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v467)
    {
      v467 = 0;
      v59 = 0;
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      memset(v512, 0, 24);
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_DWORD *)&v512[24] = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_preferredChannelList;
    objc_msgSend_preferredChannelList(v7, v122, v123, v124, v125);
    v465 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v126, (uint64_t)v465, v127, v128))
    {
      *(_QWORD *)&v499 = 0;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      memset(v512, 0, 24);
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_DWORD *)&v512[24] = 1;
      v59 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_recentChannelList;
  objc_msgSend_recentChannelList(v7, v118, v119, v120, v121);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v512[20] = duration != (_QWORD)v466;
  if ((void *)duration != v466)
  {
    error = self->_recentChannelList;
    if (!error)
    {
      *(_QWORD *)&v499 = 0x100000000;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      memset(v512, 0, 24);
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      goto LABEL_15;
    }
    objc_msgSend_recentChannelList(v7, v129, v130, v131, v132);
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v464)
    {
      v464 = 0;
      *(_QWORD *)&v499 = 0x100000000;
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, 20);
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_DWORD *)&v512[20] = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_recentChannelList;
    objc_msgSend_recentChannelList(v7, v133, v134, v135, v136);
    v462 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v137, (uint64_t)v462, v138, v139))
    {
      v60 = 0;
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, 20);
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_DWORD *)&v512[20] = 1;
      *(_QWORD *)&v499 = 0x100000001;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_remainingChannelList;
  objc_msgSend_remainingChannelList(v7, v129, v130, v131, v132);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v512[16] = duration != (_QWORD)v463;
  if ((void *)duration != v463)
  {
    error = self->_remainingChannelList;
    if (!error)
    {
      v495 = 0;
      v493 = 0;
      v492 = 0;
      v491 = 0;
      memset(v512, 0, 20);
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      goto LABEL_15;
    }
    objc_msgSend_remainingChannelList(v7, v140, v141, v142, v143);
    v461 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v461)
    {
      v461 = 0;
      v495 = 0;
      *(_QWORD *)&v512[8] = 0;
      v493 = 0;
      v492 = 0;
      *(_QWORD *)v512 = 0;
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      *(_DWORD *)&v512[16] = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_remainingChannelList;
    objc_msgSend_remainingChannelList(v7, v144, v145, v146, v147);
    v459 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v148, (uint64_t)v459, v149, v150))
    {
      v495 = 0x100000000;
      *(_QWORD *)&v512[8] = 0;
      v493 = 0;
      v492 = 0;
      *(_QWORD *)v512 = 0;
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      *(_DWORD *)&v512[16] = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_optimizedChannelList;
  objc_msgSend_optimizedChannelList(v7, v140, v141, v142, v143);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v512[12] = duration != (_QWORD)v460;
  if ((void *)duration != v460)
  {
    error = self->_optimizedChannelList;
    if (!error)
    {
      *(_QWORD *)&v512[8] = 0;
      v493 = 0;
      v492 = 0;
      *(_QWORD *)v512 = 0;
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      goto LABEL_15;
    }
    objc_msgSend_optimizedChannelList(v7, v151, v152, v153, v154);
    v458 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v458)
    {
      v458 = 0;
      v493 = 0;
      *(_QWORD *)&v512[4] = 0;
      v492 = 0;
      v491 = 0;
      *(_DWORD *)v512 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      *(_DWORD *)&v512[12] = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_optimizedChannelList;
    objc_msgSend_optimizedChannelList(v7, v155, v156, v157, v158);
    v457 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v159, (uint64_t)v457, v160, v161))
    {
      HIDWORD(v493) = 0;
      *(_QWORD *)&v512[4] = 0;
      v492 = 0;
      v491 = 0;
      *(_DWORD *)v512 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      *(_DWORD *)&v512[12] = 1;
      v162 = 1;
LABEL_198:
      LODWORD(v493) = v162;
      goto LABEL_15;
    }
  }
  duration = self->_scanDuration;
  if (duration != objc_msgSend_scanDuration(v7, v151, v152, v153, v154))
  {
    HIDWORD(v493) = 0;
    *(_QWORD *)&v512[4] = 0;
    v492 = 0;
    v491 = 0;
    *(_DWORD *)v512 = 0;
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v162 = *(_DWORD *)&v512[12];
    goto LABEL_198;
  }
  duration = (unint64_t)self->_scanChannels;
  objc_msgSend_scanChannels(v7, v163, v164, v165, v166);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v512[8] = duration != (_QWORD)v456;
  if ((void *)duration != v456)
  {
    error = self->_scanChannels;
    if (!error)
    {
      *(_QWORD *)&v512[4] = 0;
      v492 = 0;
      v491 = 0;
      *(_DWORD *)v512 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      goto LABEL_15;
    }
    objc_msgSend_scanChannels(v7, v167, v168, v169, v170);
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v455)
    {
      v455 = 0;
      v492 = 0;
      *(_QWORD *)v512 = 0;
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      *(_DWORD *)&v512[8] = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_scanChannels;
    objc_msgSend_scanChannels(v7, v171, v172, v173, v174);
    v454 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v175, (uint64_t)v454, v176, v177))
    {
      HIDWORD(v492) = 0;
      *(_QWORD *)v512 = 0;
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      *(_DWORD *)&v512[8] = 1;
      v178 = 1;
LABEL_208:
      LODWORD(v492) = v178;
      goto LABEL_15;
    }
  }
  duration = self->_preAssociationScanDuration;
  if (duration != objc_msgSend_preAssociationScanDuration(v7, v167, v168, v169, v170))
  {
    HIDWORD(v492) = 0;
    *(_QWORD *)v512 = 0;
    v491 = 0;
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v178 = *(_DWORD *)&v512[8];
    goto LABEL_208;
  }
  duration = (unint64_t)self->_preAssociationScanChannels;
  objc_msgSend_preAssociationScanChannels(v7, v179, v180, v181, v182);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v512[4] = duration != (_QWORD)v453;
  if ((void *)duration != v453)
  {
    error = self->_preAssociationScanChannels;
    if (!error)
    {
      *(_QWORD *)v512 = 0;
      v491 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      goto LABEL_15;
    }
    objc_msgSend_preAssociationScanChannels(v7, v183, v184, v185, v186);
    v452 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v452)
    {
      v452 = 0;
      v491 = 0;
      *(_QWORD *)v512 = 0x100000000;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_preAssociationScanChannels;
    objc_msgSend_preAssociationScanChannels(v7, v187, v188, v189, v190);
    v451 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v191, (uint64_t)v451, v192, v193))
    {
      HIDWORD(v491) = 0;
      *(_QWORD *)v512 = 0x100000000;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v194 = 1;
LABEL_218:
      LODWORD(v491) = v194;
      goto LABEL_15;
    }
  }
  duration = self->_followup6GHzScanDuration;
  if (duration != objc_msgSend_followup6GHzScanDuration(v7, v183, v184, v185, v186))
  {
    HIDWORD(v491) = 0;
    *(_DWORD *)v512 = 0;
    v490 = 0;
    v489 = 0;
    v511 = 0;
    v487 = 0;
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v194 = *(_DWORD *)&v512[4];
    goto LABEL_218;
  }
  duration = (unint64_t)self->_followup6GHzScanChannels;
  objc_msgSend_followup6GHzScanChannels(v7, v195, v196, v197, v198);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v512 = duration != (_QWORD)v450;
  if ((void *)duration != v450)
  {
    error = self->_followup6GHzScanChannels;
    if (!error)
    {
      *(_DWORD *)v512 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      goto LABEL_15;
    }
    objc_msgSend_followup6GHzScanChannels(v7, v199, v200, v201, v202);
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v449)
    {
      v449 = 0;
      v490 = 0;
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      *(_DWORD *)v512 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_followup6GHzScanChannels;
    objc_msgSend_followup6GHzScanChannels(v7, v203, v204, v205, v206);
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v207, (uint64_t)v448, v208, v209))
    {
      v489 = 0;
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      *(_DWORD *)v512 = 1;
      v490 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_scanErrors;
  objc_msgSend_scanErrors(v7, v199, v200, v201, v202);
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  v511 = duration != (_QWORD)v447;
  if ((void *)duration != v447)
  {
    error = self->_scanErrors;
    if (!error)
    {
      v511 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      goto LABEL_15;
    }
    objc_msgSend_scanErrors(v7, v210, v211, v212, v213);
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v446)
    {
      v446 = 0;
      v487 = 0;
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v511 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_scanErrors;
    objc_msgSend_scanErrors(v7, v214, v215, v216, v217);
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v218, (uint64_t)v445, v219, v220))
    {
      v488 = 0;
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v511 = 1;
      v221 = 1;
LABEL_235:
      v487 = v221;
      goto LABEL_15;
    }
  }
  duration = self->_GASQueryDuration;
  if (duration != objc_msgSend_GASQueryDuration(v7, v210, v211, v212, v213))
  {
    v488 = 0;
    v510 = 0;
    v486 = 0;
    v485 = 0;
    v509 = 0;
    v482 = 0;
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v491 = *(unsigned int *)&v512[4] | 0x100000000;
    v490 = *(_DWORD *)v512;
    v489 = 1;
    v221 = v511;
    goto LABEL_235;
  }
  duration = (unint64_t)self->_GASQueryNetworks;
  objc_msgSend_GASQueryNetworks(v7, v222, v223, v224, v225);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  v510 = duration != (_QWORD)v444;
  if ((void *)duration != v444)
  {
    error = self->_GASQueryNetworks;
    if (!error)
    {
      v510 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      goto LABEL_15;
    }
    objc_msgSend_GASQueryNetworks(v7, v226, v227, v228, v229);
    v443 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v443)
    {
      v443 = 0;
      v486 = 0;
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v510 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_GASQueryNetworks;
    objc_msgSend_GASQueryNetworks(v7, v230, v231, v232, v233);
    v442 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v234, (uint64_t)v442, v235, v236))
    {
      v485 = 0;
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v510 = 1;
      v486 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_GASQueryErrors;
  objc_msgSend_GASQueryErrors(v7, v226, v227, v228, v229);
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v509 = duration != (_QWORD)v441;
  if ((void *)duration != v441)
  {
    error = self->_GASQueryErrors;
    if (!error)
    {
      v509 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      goto LABEL_15;
    }
    objc_msgSend_GASQueryErrors(v7, v237, v238, v239, v240);
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v440)
    {
      v440 = 0;
      v482 = 0;
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v509 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_GASQueryErrors;
    objc_msgSend_GASQueryErrors(v7, v241, v242, v243, v244);
    v439 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v245, (uint64_t)v439, v246, v247))
    {
      v484 = 0;
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v509 = 1;
      v248 = 1;
LABEL_252:
      v482 = v248;
      goto LABEL_15;
    }
  }
  duration = self->_joinDuration;
  if (duration != objc_msgSend_joinDuration(v7, v237, v238, v239, v240))
  {
    v484 = 0;
    v508 = 0;
    v483 = 0;
    v507 = 0;
    v481 = 0;
    v480 = 0;
    v506 = 0;
    v477 = 0;
    v476 = 0;
    v505 = 0;
    v478 = 0;
    v479 = 0;
    v504 = 0;
    v475 = 0;
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v491 = *(unsigned int *)&v512[4] | 0x100000000;
    v490 = *(_DWORD *)v512;
    v489 = 1;
    v487 = v511;
    v488 = 1;
    v486 = v510;
    v485 = 1;
    v248 = v509;
    goto LABEL_252;
  }
  duration = (unint64_t)self->_joinErrors;
  objc_msgSend_joinErrors(v7, v249, v250, v251, v252);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  v508 = duration != (_QWORD)v438;
  if ((void *)duration != v438)
  {
    error = self->_joinErrors;
    if (!error)
    {
      v508 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      goto LABEL_15;
    }
    objc_msgSend_joinErrors(v7, v253, v254, v255, v256);
    v437 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v437)
    {
      v437 = 0;
      v483 = 0;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      v508 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_joinErrors;
    objc_msgSend_joinErrors(v7, v257, v258, v259, v260);
    v436 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v261, (uint64_t)v436, v262, v263))
    {
      v483 = 0x100000000;
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      v508 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_network;
  objc_msgSend_network(v7, v253, v254, v255, v256);
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  v507 = duration != (_QWORD)v435;
  if ((void *)duration != v435)
  {
    error = self->_network;
    if (!error)
    {
      v507 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      goto LABEL_15;
    }
    objc_msgSend_network(v7, v264, v265, v266, v267);
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v434)
    {
      v434 = 0;
      v481 = 0;
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v507 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_network;
    objc_msgSend_network(v7, v268, v269, v270, v271);
    v433 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v272, (uint64_t)v433, v273, v274))
    {
      v480 = 0;
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v507 = 1;
      v481 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_associatedNetwork;
  objc_msgSend_associatedNetwork(v7, v264, v265, v266, v267);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  v506 = duration != (_QWORD)v432;
  if ((void *)duration != v432)
  {
    error = self->_associatedNetwork;
    if (!error)
    {
      v506 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      goto LABEL_15;
    }
    objc_msgSend_associatedNetwork(v7, v275, v276, v277, v278);
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v431)
    {
      v431 = 0;
      v477 = 0;
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v506 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_associatedNetwork;
    objc_msgSend_associatedNetwork(v7, v279, v280, v281, v282);
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v283, (uint64_t)v430, v284, v285))
    {
      v476 = 0;
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v506 = 1;
      v477 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_candidates;
  objc_msgSend_candidates(v7, v275, v276, v277, v278);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v505 = duration != (_QWORD)v429;
  if ((void *)duration != v429)
  {
    error = self->_candidates;
    if (!error)
    {
      v505 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      goto LABEL_15;
    }
    objc_msgSend_candidates(v7, v286, v287, v288, v289);
    v428 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v428)
    {
      v428 = 0;
      v478 = 0;
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v505 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_candidates;
    objc_msgSend_candidates(v7, v290, v291, v292, v293);
    v427 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v294, (uint64_t)v427, v295, v296))
    {
      v479 = 0;
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v500 = 0x100000001;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      v496 = 0;
      v497 = v3;
      *((_QWORD *)&v499 + 1) = v49;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v505 = 1;
      v478 = 1;
      goto LABEL_15;
    }
  }
  duration = (unint64_t)self->_knownNetworks;
  objc_msgSend_knownNetworks(v7, v286, v287, v288, v289);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  v504 = duration != (_QWORD)v426;
  if ((void *)duration != v426)
  {
    error = self->_knownNetworks;
    if (!error)
    {
      v504 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v500 = 0x100000001;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      v496 = 0;
      v497 = v3;
      *((_QWORD *)&v499 + 1) = v49;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      goto LABEL_15;
    }
    objc_msgSend_knownNetworks(v7, v297, v298, v299, v300);
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v425)
    {
      v425 = 0;
      v475 = 0;
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v500 = 0x100000001;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      v496 = 0;
      v497 = v3;
      *((_QWORD *)&v499 + 1) = v49;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v504 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_knownNetworks;
    objc_msgSend_knownNetworks(v7, v301, v302, v303, v304);
    v424 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v305, (uint64_t)v424, v306, v307))
    {
      v494 = 0;
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v500 = 0x100000001;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      v496 = 0;
      v497 = v3;
      *((_QWORD *)&v499 + 1) = v49;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v504 = 1;
      v308 = 1;
LABEL_301:
      v475 = v308;
      goto LABEL_15;
    }
  }
  duration = self->_didTriggerReassoc;
  if ((_DWORD)duration != objc_msgSend_didTriggerReassoc(v7, v297, v298, v299, v300))
    goto LABEL_299;
  duration = self->_didPerformSeamlessSSIDTransition;
  if ((_DWORD)duration != objc_msgSend_didPerformSeamlessSSIDTransition(v7, v309, v310, v311, v312))
    goto LABEL_299;
  duration = self->_wasDiscoveredViaRNR;
  if ((_DWORD)duration != objc_msgSend_wasDiscoveredViaRNR(v7, v313, v314, v315, v316)
    || (duration = self->_wasDiscoveredViaFILSD,
        (_DWORD)duration != objc_msgSend_wasDiscoveredViaFILSD(v7, v317, v318, v319, v320))
    || (duration = self->_was6EDisabled,
        (_DWORD)duration != objc_msgSend_was6EDisabled(v7, v321, v322, v323, v324))
    || (duration = self->_was6EPreferOn,
        (_DWORD)duration != objc_msgSend_was6EPreferOn(v7, v325, v326, v327, v328))
    || (duration = self->_was6GHzDeprioritized,
        (_DWORD)duration != objc_msgSend_was6GHzDeprioritized(v7, v329, v330, v331, v332))
    || (duration = self->_didIncludeRemainingNon2GHzChannels,
        (_DWORD)duration != objc_msgSend_didIncludeRemainingNon2GHzChannels(v7, v333, v334, v335, v336))
    || (duration = self->_autoHotspotWasAttempted,
        (_DWORD)duration != objc_msgSend_autoHotspotWasAttempted(v7, v337, v338, v339, v340))
    || (duration = self->_autoHotspotResult,
        (_DWORD)duration != objc_msgSend_autoHotspotResult(v7, v341, v342, v343, v344)))
  {
LABEL_299:
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v500 = 0x100000001;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    v496 = 0;
    v497 = v3;
    DWORD1(v499) = 1;
    *((_QWORD *)&v499 + 1) = v49;
LABEL_300:
    LODWORD(v499) = *(_DWORD *)&v512[20];
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v491 = *(unsigned int *)&v512[4] | 0x100000000;
    v490 = *(_DWORD *)v512;
    v489 = 1;
    v487 = v511;
    v488 = 1;
    v486 = v510;
    v485 = 1;
    v482 = v509;
    v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    v481 = v507;
    v480 = 1;
    v477 = v506;
    v476 = 1;
    v478 = v505;
    v479 = 1;
    v308 = v504;
    goto LABEL_301;
  }
  duration = self->_autoHotspotWasAborted;
  if ((_DWORD)duration != objc_msgSend_autoHotspotWasAborted(v7, v345, v346, v347, v348)
    || (duration = self->_autoHotspotDuration, duration != objc_msgSend_autoHotspotDuration(v7, v349, v350, v351, v352)))
  {
    v494 = 0;
    v503 = 0;
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    DWORD1(v499) = 1;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    goto LABEL_300;
  }
  duration = (unint64_t)self->_autoHotspotError;
  objc_msgSend_autoHotspotError(v7, v353, v354, v355, v356);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v503) = duration != (_QWORD)v423;
  if ((void *)duration != v423)
  {
    error = self->_autoHotspotError;
    if (!error)
    {
      v503 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      v494 = 1;
      goto LABEL_15;
    }
    objc_msgSend_autoHotspotError(v7, v357, v358, v359, v360);
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v422)
    {
      v422 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      LOBYTE(v503) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      v494 = 1;
      HIDWORD(v503) = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_autoHotspotError;
    objc_msgSend_autoHotspotError(v7, v361, v362, v363, v364);
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v365, (uint64_t)v421, v366, v367))
    {
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      LOBYTE(v503) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v496 = 0;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      v494 = 0x100000001;
      HIDWORD(v503) = 1;
      goto LABEL_15;
    }
  }
  duration = self->_autoHotspotMode;
  if (duration != objc_msgSend_autoHotspotMode(v7, v357, v358, v359, v360)
    || (duration = self->_autoHotspotBrowseDuration,
        duration != objc_msgSend_autoHotspotBrowseDuration(v7, v368, v369, v370, v371)))
  {
    v498 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    LOBYTE(v503) = 0;
    v501 = 0;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v496 = 0;
    v497 = v3;
    v500 = 0x100000001;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v491 = *(unsigned int *)&v512[4] | 0x100000000;
    v490 = *(_DWORD *)v512;
    v489 = 1;
    v487 = v511;
    v488 = 1;
    v486 = v510;
    v485 = 1;
    v482 = v509;
    v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    v481 = v507;
    v480 = 1;
    v477 = v506;
    v476 = 1;
    v478 = v505;
    v479 = 1;
    v475 = v504;
    LODWORD(v494) = 1;
    HIDWORD(v494) = HIDWORD(v503);
    goto LABEL_15;
  }
  duration = (unint64_t)self->_autoHotspotBrowseError;
  objc_msgSend_autoHotspotBrowseError(v7, v372, v373, v374, v375);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v501 = duration != (_QWORD)v420;
  if ((void *)duration != v420)
  {
    error = self->_autoHotspotBrowseError;
    if (!error)
    {
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LOBYTE(v503) = 0;
      v501 = 0;
      v502 = 1;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      goto LABEL_15;
    }
    objc_msgSend_autoHotspotBrowseError(v7, v376, v377, v378, v379);
    v419 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v419)
    {
      v419 = 0;
      v498 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v502 = 1;
      LOBYTE(v503) = 0;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      v501 = 1;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_autoHotspotBrowseError;
    objc_msgSend_autoHotspotBrowseError(v7, v380, v381, v382, v383);
    v418 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v384, (uint64_t)v418, v385, v386))
    {
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v502 = 1;
      LOBYTE(v503) = 0;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v497 = v3;
      v500 = 0x100000001;
      HIDWORD(v498) = 0;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      v501 = 1;
      v387 = 1;
LABEL_323:
      LODWORD(v498) = v387;
      goto LABEL_15;
    }
  }
  duration = self->_autoHotspotJoinDuration;
  if (duration != objc_msgSend_autoHotspotJoinDuration(v7, v376, v377, v378, v379))
  {
    v61 = 0;
    v62 = 0;
    v63 = 0;
    LODWORD(error) = 0;
    v502 = 1;
    LOBYTE(v503) = 0;
    v59 = *(_DWORD *)&v512[24];
    *((_QWORD *)&v499 + 1) = v49;
    v497 = v3;
    v500 = 0x100000001;
    HIDWORD(v498) = 0;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    v60 = 1;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v491 = *(unsigned int *)&v512[4] | 0x100000000;
    v490 = *(_DWORD *)v512;
    v489 = 1;
    v487 = v511;
    v488 = 1;
    v486 = v510;
    v485 = 1;
    v482 = v509;
    v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    v481 = v507;
    v480 = 1;
    v477 = v506;
    v476 = 1;
    v478 = v505;
    v479 = 1;
    v475 = v504;
    LODWORD(v494) = 1;
    HIDWORD(v494) = HIDWORD(v503);
    v496 = 1;
    v387 = v501;
    goto LABEL_323;
  }
  duration = (unint64_t)self->_autoHotspotJoinErrors;
  objc_msgSend_autoHotspotJoinErrors(v7, v388, v389, v390, v391);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v499) = duration != (_QWORD)v417;
  if ((void *)duration != v417)
  {
    error = self->_autoHotspotJoinErrors;
    if (!error)
    {
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v502 = 1;
      LOBYTE(v503) = 0;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      v498 = v501 | 0x100000000;
      goto LABEL_15;
    }
    objc_msgSend_autoHotspotJoinErrors(v7, v392, v393, v394, v395);
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v416)
    {
      v416 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v502 = 1;
      LOBYTE(v503) = 0;
      v59 = *(_DWORD *)&v512[24];
      *((_QWORD *)&v499 + 1) = v49 | 0x100000000;
      v497 = v3;
      v500 = 0x100000001;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      v60 = 1;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      v498 = v501 | 0x100000000;
      goto LABEL_15;
    }
    duration = (unint64_t)self->_autoHotspotJoinErrors;
    objc_msgSend_autoHotspotJoinErrors(v7, v396, v397, v398, v399);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_((void *)duration, v400, v3, v401, v402))
    {
      v62 = 0;
      v63 = 0;
      LODWORD(error) = 0;
      v60 = 1;
      v502 = 1;
      LOBYTE(v503) = 0;
      v59 = *(_DWORD *)&v512[24];
      v497 = HIDWORD(v513);
      v500 = 0x100000001;
      *((_QWORD *)&v499 + 1) = v49 | 0x100000000;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      v498 = v501 | 0x100000000;
      v61 = 1;
      goto LABEL_15;
    }
  }
  hotspot = self->_hotspot;
  objc_msgSend_hotspot(v7, v392, v393, v394, v395);
  v403 = objc_claimAutoreleasedReturnValue();
  if (hotspot == (void *)v403)
  {
    v63 = 0;
    LODWORD(error) = 0;
    v60 = 1;
    v502 = 1;
    v59 = *(_DWORD *)&v512[24];
    v497 = HIDWORD(v513);
    v500 = 0x100000001;
    DWORD2(v499) = v49;
    *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
    LODWORD(v495) = 1;
    HIDWORD(v495) = *(_DWORD *)&v512[16];
    v493 = *(unsigned int *)&v512[12] | 0x100000000;
    v492 = *(unsigned int *)&v512[8] | 0x100000000;
    v491 = *(unsigned int *)&v512[4] | 0x100000000;
    v490 = *(_DWORD *)v512;
    v489 = 1;
    v487 = v511;
    v488 = 1;
    v486 = v510;
    v485 = 1;
    v482 = v509;
    v484 = 1;
    HIDWORD(v483) = v508;
    LODWORD(v483) = 1;
    v481 = v507;
    duration = (unint64_t)hotspot;
    v480 = 1;
    v477 = v506;
    v476 = 1;
    v478 = v505;
    v479 = 1;
    v475 = v504;
    LODWORD(v494) = 1;
    HIDWORD(v494) = HIDWORD(v503);
    v496 = 1;
    v498 = v501 | 0x100000000;
    v61 = HIDWORD(v499);
    v62 = 1;
    LOBYTE(v503) = 1;
  }
  else
  {
    duration = v403;
    error = self->_hotspot;
    if (error)
    {
      objc_msgSend_hotspot(v7, v404, v405, v406, v407);
      hotspot = (void *)objc_claimAutoreleasedReturnValue();
      if (hotspot)
      {
        v412 = self->_hotspot;
        objc_msgSend_hotspot(v7, v408, v409, v410, v411);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 1;
        v502 = 1;
        LOBYTE(v503) = objc_msgSend_isEqual_(v412, v413, (uint64_t)v5, v414, v415);
        v59 = *(_DWORD *)&v512[24];
        v497 = HIDWORD(v513);
        v500 = 0x100000001;
        DWORD2(v499) = v49;
        *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
        LODWORD(v495) = 1;
        HIDWORD(v495) = *(_DWORD *)&v512[16];
        v493 = *(unsigned int *)&v512[12] | 0x100000000;
        v492 = *(unsigned int *)&v512[8] | 0x100000000;
        v491 = *(unsigned int *)&v512[4] | 0x100000000;
        v490 = *(_DWORD *)v512;
        v489 = 1;
        v487 = v511;
        v488 = 1;
        v486 = v510;
        v485 = 1;
        v482 = v509;
        v484 = 1;
        HIDWORD(v483) = v508;
        LODWORD(v483) = 1;
        v481 = v507;
        v480 = 1;
        v477 = v506;
        v476 = 1;
        v478 = v505;
        v479 = 1;
        v475 = v504;
        LODWORD(v494) = 1;
        HIDWORD(v494) = HIDWORD(v503);
        v496 = 1;
        LODWORD(error) = 1;
      }
      else
      {
        LODWORD(error) = 0;
        v60 = 1;
        v502 = 1;
        LOBYTE(v503) = 0;
        v59 = *(_DWORD *)&v512[24];
        v497 = HIDWORD(v513);
        v500 = 0x100000001;
        DWORD2(v499) = v49;
        *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
        LODWORD(v495) = 1;
        HIDWORD(v495) = *(_DWORD *)&v512[16];
        v493 = *(unsigned int *)&v512[12] | 0x100000000;
        v492 = *(unsigned int *)&v512[8] | 0x100000000;
        v491 = *(unsigned int *)&v512[4] | 0x100000000;
        v490 = *(_DWORD *)v512;
        v489 = 1;
        v487 = v511;
        v488 = 1;
        v486 = v510;
        v485 = 1;
        v482 = v509;
        v484 = 1;
        HIDWORD(v483) = v508;
        LODWORD(v483) = 1;
        v481 = v507;
        v480 = 1;
        v477 = v506;
        v476 = 1;
        v478 = v505;
        v479 = 1;
        v475 = v504;
        LODWORD(v494) = 1;
        HIDWORD(v494) = HIDWORD(v503);
        v496 = 1;
      }
      v498 = v501 | 0x100000000;
      v61 = HIDWORD(v499);
      v62 = 1;
      v63 = 1;
    }
    else
    {
      v63 = 0;
      v60 = 1;
      v502 = 1;
      LOBYTE(v503) = 0;
      v59 = *(_DWORD *)&v512[24];
      v497 = HIDWORD(v513);
      v500 = 0x100000001;
      DWORD2(v499) = v49;
      *(_QWORD *)&v499 = *(unsigned int *)&v512[20] | 0x100000000;
      LODWORD(v495) = 1;
      HIDWORD(v495) = *(_DWORD *)&v512[16];
      v493 = *(unsigned int *)&v512[12] | 0x100000000;
      v492 = *(unsigned int *)&v512[8] | 0x100000000;
      v491 = *(unsigned int *)&v512[4] | 0x100000000;
      v490 = *(_DWORD *)v512;
      v489 = 1;
      v487 = v511;
      v488 = 1;
      v486 = v510;
      v485 = 1;
      v482 = v509;
      v484 = 1;
      HIDWORD(v483) = v508;
      LODWORD(v483) = 1;
      v481 = v507;
      v480 = 1;
      v477 = v506;
      v476 = 1;
      v478 = v505;
      v479 = 1;
      v475 = v504;
      LODWORD(v494) = 1;
      HIDWORD(v494) = HIDWORD(v503);
      v496 = 1;
      v498 = v501 | 0x100000000;
      v61 = HIDWORD(v499);
      v62 = 1;
    }
  }
LABEL_15:
  if ((_DWORD)error)
  {
    v64 = v60;
    v65 = v61;
    v66 = v62;
    v67 = v59;
    v68 = v63;

    v69 = v68;
    v59 = v67;
    v62 = v66;
    v61 = v65;
    v60 = v64;
    if (!v69)
      goto LABEL_17;
  }
  else if (!v63)
  {
LABEL_17:
    if (v62)
      goto LABEL_18;
LABEL_22:
    if (!v61)
      goto LABEL_24;
    goto LABEL_23;
  }

  if (!v62)
    goto LABEL_22;
LABEL_18:

  if (v61)
LABEL_23:

LABEL_24:
  if (HIDWORD(v499))

  if (HIDWORD(v498))
  if ((_DWORD)v498)

  if (v501)
  if (v496)

  if (HIDWORD(v494))
  if (HIDWORD(v503))

  if ((_DWORD)v494)
  if (v475)

  if (v504)
  if (v479)

  if (v478)
  if (v505)

  if (v476)
  if (v477)

  if (v506)
  if (v480)

  if (v481)
  if (v507)

  if ((_DWORD)v483)
  if (HIDWORD(v483))

  if (v508)
  if (v484)

  if (v482)
  if (v509)

  if (v485)
  if (v486)

  if (v510)
  if (v488)

  if (v487)
  if (v511)

  if (v489)
  if (v490)

  if (*(_DWORD *)v512)
  if (HIDWORD(v491))

  if ((_DWORD)v491)
  if (*(_DWORD *)&v512[4])

  if (HIDWORD(v492))
  if ((_DWORD)v492)

  if (*(_DWORD *)&v512[8])
  if (HIDWORD(v493))

  if ((_DWORD)v493)
  if (*(_DWORD *)&v512[12])

  if ((_DWORD)v495)
  if (HIDWORD(v495))

  if (*(_DWORD *)&v512[16])
  if (v60)

  if ((_DWORD)v499)
  if (*(_DWORD *)&v512[20])

  if (DWORD1(v499))
  if (v59)

  if (*(_DWORD *)&v512[24])
  if ((_DWORD)v500)

  if (v497)
  if (HIDWORD(v513))

  if (HIDWORD(v500))
  if (DWORD2(v499))

  if ((_DWORD)v513)
  if (v502)

  return v503;
}

- (BOOL)isEqual:(id)a3
{
  CWFAutoJoinMetric *v4;
  CWFAutoJoinMetric *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAutoJoinMetric;

  v4 = (CWFAutoJoinMetric *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAutoJoinMetric = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAutoJoinMetric = objc_msgSend_isEqualToAutoJoinMetric_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAutoJoinMetric = 0;
  }

  return isEqualToAutoJoinMetric;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int32 v6;
  __int32 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL didFallbackToJoinLessPreferredNetwork;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int8x16_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int8x16_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int8x16_t v78;
  uint16x8_t v79;
  uint16x8_t v80;
  _BOOL8 autoHotspotWasAttempted;
  BOOL autoHotspotResult;
  BOOL autoHotspotWasAborted;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t autoHotspotJoinDuration;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int8x8_t v105;
  int8x16_t v106;
  int8x16_t v107;
  int8x16_t v109;
  int8x16_t v110;
  int8x16_t v111;
  uint64_t v112;
  uint64_t v113;
  int8x16_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  BOOL *p_didPerformSeamlessSSIDTransition;
  uint64_t v122;
  BOOL *p_didTriggerReassoc;
  int8x16_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int8x16_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int8x16_t v132;
  uint64_t v133;
  int8x16_t v134;
  int8x16_t v135;
  uint64_t v136;
  unint64_t duration;
  unint64_t joinDuration;
  int8x16_t v139;
  __int32 v140;
  __int32 v141;
  unint64_t followup6GHzScanDuration;
  int8x16_t v143;
  unint64_t scanDuration;
  int8x16_t v145;

  duration = self->_duration;
  v134 = *(int8x16_t *)&self->_durationFromLinkDownTrigger;
  v6 = v134.i32[0];
  v135 = *(int8x16_t *)&self->_durationFromDeviceUnlockTrigger;
  p_didTriggerReassoc = &self->_didTriggerReassoc;
  p_didPerformSeamlessSSIDTransition = &self->_didPerformSeamlessSSIDTransition;
  LOBYTE(v6) = self->_result;
  v140 = v6;
  v132 = *(int8x16_t *)&self->_previousNonRetryAutoJoinTrigger;
  v136 = objc_msgSend_hash(self->_error, a2, v2, v3, v4);
  v7 = v140;
  BYTE1(v7) = self->_wasCancelled;
  BYTE2(v7) = self->_wasAborted;
  v141 = v7;
  v133 = objc_msgSend_hash(self->_autoJoinParameters, v8, v9, v10, v11);
  LOBYTE(v12) = self->_wasAlreadyAssociated;
  BYTE4(v12) = self->_didUseLocationOptimizedChannelList;
  v113 = v12;
  LOBYTE(v12) = self->_didDetectColocatedNetworkEnvironment;
  BYTE4(v12) = self->_didDeferJoinToDiscoverMorePreferredNetwork;
  v112 = v12;
  didFallbackToJoinLessPreferredNetwork = self->_didFallbackToJoinLessPreferredNetwork;
  v128 = *(int8x16_t *)&self->_retrySchedule;
  v131 = objc_msgSend_hash(self->_preferredChannelList, v14, v15, v16, v17);
  v130 = objc_msgSend_hash(self->_recentChannelList, v18, v19, v20, v21);
  v129 = objc_msgSend_hash(self->_remainingChannelList, v22, v23, v24, v25);
  v127 = objc_msgSend_hash(self->_optimizedChannelList, v26, v27, v28, v29);
  scanDuration = self->_scanDuration;
  v126 = objc_msgSend_hash(self->_scanChannels, v30, v31, v32, v33);
  v34.i64[0] = scanDuration;
  v34.i64[1] = self->_preAssociationScanDuration;
  v145 = v34;
  v125 = objc_msgSend_hash(self->_preAssociationScanChannels, v35, v36, v37, v38);
  followup6GHzScanDuration = self->_followup6GHzScanDuration;
  v122 = objc_msgSend_hash(self->_followup6GHzScanChannels, v39, v40, v41, v42);
  v120 = objc_msgSend_hash(self->_scanErrors, v43, v44, v45, v46);
  v47.i64[0] = followup6GHzScanDuration;
  v47.i64[1] = self->_GASQueryDuration;
  v143 = v47;
  v119 = objc_msgSend_hash(self->_GASQueryNetworks, v48, v49, v50, v51);
  v118 = objc_msgSend_hash(self->_GASQueryErrors, v52, v53, v54, v55);
  joinDuration = self->_joinDuration;
  v117 = objc_msgSend_hash(self->_joinErrors, v56, v57, v58, v59);
  v116 = objc_msgSend_hash(self->_network, v60, v61, v62, v63);
  v115 = objc_msgSend_hash(self->_associatedNetwork, v64, v65, v66, v67);
  v72 = objc_msgSend_hash(self->_candidates, v68, v69, v70, v71);
  v77 = objc_msgSend_hash(self->_knownNetworks, v73, v74, v75, v76);
  v78.i32[0] = v141;
  v78.i8[3] = self->_was6EDisabled;
  v78.i16[2] = *(_WORD *)&self->_was6EPreferOn;
  v78.i8[6] = v113;
  v78.i8[7] = BYTE4(v113);
  v78.i8[8] = v112;
  v78.i8[9] = BYTE4(v112);
  v78.i8[10] = didFallbackToJoinLessPreferredNetwork;
  v78.i8[11] = *p_didPerformSeamlessSSIDTransition;
  v78.i32[3] = *(_DWORD *)p_didTriggerReassoc;
  v79 = vmovl_u8(*(uint8x8_t *)v78.i8);
  v124 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v79.i8);
  v80 = vmovl_u8((uint8x8_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL));
  v114 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v80.i8);
  v111 = (int8x16_t)vmovl_high_u16(v79);
  v110 = (int8x16_t)vmovl_high_u16(v80);
  autoHotspotWasAttempted = self->_autoHotspotWasAttempted;
  autoHotspotResult = self->_autoHotspotResult;
  autoHotspotWasAborted = self->_autoHotspotWasAborted;
  v79.i64[0] = joinDuration;
  v79.i64[1] = self->_autoHotspotDuration;
  v139 = (int8x16_t)v79;
  v88 = objc_msgSend_hash(self->_autoHotspotError, v84, v85, v86, v87);
  v109 = *(int8x16_t *)&self->_autoHotspotMode;
  v93 = objc_msgSend_hash(self->_autoHotspotBrowseError, v89, v90, v91, v92);
  autoHotspotJoinDuration = self->_autoHotspotJoinDuration;
  v99 = objc_msgSend_hash(self->_autoHotspotJoinErrors, v95, v96, v97, v98);
  v104 = objc_msgSend_hash(self->_hotspot, v100, v101, v102, v103);
  v105 = veor_s8(veor_s8(veor_s8(*(int8x8_t *)v124.i8, *(int8x8_t *)v114.i8), veor_s8(*(int8x8_t *)v111.i8, *(int8x8_t *)v110.i8)), veor_s8(veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v124, v124, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v114, v114, 8uLL)), veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v111, v111, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v110, v110, 8uLL))));
  v106.i64[0] = v105.u32[0];
  v106.i64[1] = v105.u32[1];
  v107 = veorq_s8(v106, veorq_s8(veorq_s8(veorq_s8(v134, v145), veorq_s8(v132, v139)), veorq_s8(veorq_s8(v135, v143), veorq_s8(v128, v109))));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v107.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v107, v107, 8uLL)) ^ autoHotspotWasAttempted ^ autoHotspotResult ^ autoHotspotWasAborted ^ duration ^ autoHotspotJoinDuration ^ v104 ^ v99 ^ v93 ^ v88 ^ v77 ^ v72 ^ v115 ^ v116 ^ v117 ^ v118 ^ v119 ^ v120 ^ v122 ^ v125 ^ v126 ^ v127 ^ v129 ^ v130 ^ v131 ^ v133 ^ v136;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinMetric, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setResult_(v11, v12, self->_result, v13, v14);
  objc_msgSend_setDuration_(v11, v15, self->_duration, v16, v17);
  objc_msgSend_setDurationFromLinkDownTrigger_(v11, v18, self->_durationFromLinkDownTrigger, v19, v20);
  objc_msgSend_setDurationFromDisplayOnTrigger_(v11, v21, self->_durationFromDisplayOnTrigger, v22, v23);
  objc_msgSend_setDurationFromDeviceUnlockTrigger_(v11, v24, self->_durationFromDeviceUnlockTrigger, v25, v26);
  objc_msgSend_setDurationFromWiFiPowerOnTrigger_(v11, v27, self->_durationFromWiFiPowerOnTrigger, v28, v29);
  objc_msgSend_setPreviousNonRetryAutoJoinTrigger_(v11, v30, self->_previousNonRetryAutoJoinTrigger, v31, v32);
  objc_msgSend_setDurationFromNonRetryAutoJoinTrigger_(v11, v33, self->_durationFromNonRetryAutoJoinTrigger, v34, v35);
  objc_msgSend_setError_(v11, v36, (uint64_t)self->_error, v37, v38);
  objc_msgSend_setWasCancelled_(v11, v39, self->_wasCancelled, v40, v41);
  objc_msgSend_setWasAborted_(v11, v42, self->_wasAborted, v43, v44);
  objc_msgSend_setAutoJoinParameters_(v11, v45, (uint64_t)self->_autoJoinParameters, v46, v47);
  objc_msgSend_setRetrySchedule_(v11, v48, self->_retrySchedule, v49, v50);
  objc_msgSend_setRetryScheduleIndex_(v11, v51, self->_retryScheduleIndex, v52, v53);
  objc_msgSend_setDidUseLocationOptimizedChannelList_(v11, v54, self->_didUseLocationOptimizedChannelList, v55, v56);
  objc_msgSend_setDidDetectColocatedNetworkEnvironment_(v11, v57, self->_didDetectColocatedNetworkEnvironment, v58, v59);
  objc_msgSend_setWasAlreadyAssociated_(v11, v60, self->_wasAlreadyAssociated, v61, v62);
  objc_msgSend_setDidDeferJoinToDiscoverMorePreferredNetwork_(v11, v63, self->_didDeferJoinToDiscoverMorePreferredNetwork, v64, v65);
  objc_msgSend_setDidFallbackToJoinLessPreferredNetwork_(v11, v66, self->_didFallbackToJoinLessPreferredNetwork, v67, v68);
  objc_msgSend_setPreferredChannelList_(v11, v69, (uint64_t)self->_preferredChannelList, v70, v71);
  objc_msgSend_setRecentChannelList_(v11, v72, (uint64_t)self->_recentChannelList, v73, v74);
  objc_msgSend_setRemainingChannelList_(v11, v75, (uint64_t)self->_remainingChannelList, v76, v77);
  objc_msgSend_setOptimizedChannelList_(v11, v78, (uint64_t)self->_optimizedChannelList, v79, v80);
  objc_msgSend_setScanDuration_(v11, v81, self->_scanDuration, v82, v83);
  objc_msgSend_setScanChannels_(v11, v84, (uint64_t)self->_scanChannels, v85, v86);
  objc_msgSend_setPreAssociationScanDuration_(v11, v87, self->_preAssociationScanDuration, v88, v89);
  objc_msgSend_setPreAssociationScanChannels_(v11, v90, (uint64_t)self->_preAssociationScanChannels, v91, v92);
  objc_msgSend_setFollowup6GHzScanDuration_(v11, v93, self->_followup6GHzScanDuration, v94, v95);
  objc_msgSend_setFollowup6GHzScanChannels_(v11, v96, (uint64_t)self->_followup6GHzScanChannels, v97, v98);
  objc_msgSend_setScanErrors_(v11, v99, (uint64_t)self->_scanErrors, v100, v101);
  objc_msgSend_setGASQueryDuration_(v11, v102, self->_GASQueryDuration, v103, v104);
  objc_msgSend_setGASQueryNetworks_(v11, v105, (uint64_t)self->_GASQueryNetworks, v106, v107);
  objc_msgSend_setGASQueryErrors_(v11, v108, (uint64_t)self->_GASQueryErrors, v109, v110);
  objc_msgSend_setJoinDuration_(v11, v111, self->_joinDuration, v112, v113);
  objc_msgSend_setJoinErrors_(v11, v114, (uint64_t)self->_joinErrors, v115, v116);
  objc_msgSend_setNetwork_(v11, v117, (uint64_t)self->_network, v118, v119);
  objc_msgSend_setAssociatedNetwork_(v11, v120, (uint64_t)self->_associatedNetwork, v121, v122);
  objc_msgSend_setCandidates_(v11, v123, (uint64_t)self->_candidates, v124, v125);
  objc_msgSend_setKnownNetworks_(v11, v126, (uint64_t)self->_knownNetworks, v127, v128);
  objc_msgSend_setDidTriggerReassoc_(v11, v129, self->_didTriggerReassoc, v130, v131);
  objc_msgSend_setDidPerformSeamlessSSIDTransition_(v11, v132, self->_didPerformSeamlessSSIDTransition, v133, v134);
  objc_msgSend_setWasDiscoveredViaRNR_(v11, v135, self->_wasDiscoveredViaRNR, v136, v137);
  objc_msgSend_setWasDiscoveredViaFILSD_(v11, v138, self->_wasDiscoveredViaFILSD, v139, v140);
  objc_msgSend_setWas6EDisabled_(v11, v141, self->_was6EDisabled, v142, v143);
  objc_msgSend_setWas6EPreferOn_(v11, v144, self->_was6EPreferOn, v145, v146);
  objc_msgSend_setWas6GHzDeprioritized_(v11, v147, self->_was6GHzDeprioritized, v148, v149);
  objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(v11, v150, self->_didIncludeRemainingNon2GHzChannels, v151, v152);
  objc_msgSend_setAutoHotspotWasAttempted_(v11, v153, self->_autoHotspotWasAttempted, v154, v155);
  objc_msgSend_setAutoHotspotResult_(v11, v156, self->_autoHotspotResult, v157, v158);
  objc_msgSend_setAutoHotspotWasAborted_(v11, v159, self->_autoHotspotWasAborted, v160, v161);
  objc_msgSend_setAutoHotspotDuration_(v11, v162, self->_autoHotspotDuration, v163, v164);
  objc_msgSend_setAutoHotspotError_(v11, v165, (uint64_t)self->_autoHotspotError, v166, v167);
  objc_msgSend_setAutoHotspotMode_(v11, v168, self->_autoHotspotMode, v169, v170);
  objc_msgSend_setAutoHotspotBrowseDuration_(v11, v171, self->_autoHotspotBrowseDuration, v172, v173);
  objc_msgSend_setAutoHotspotBrowseError_(v11, v174, (uint64_t)self->_autoHotspotBrowseError, v175, v176);
  objc_msgSend_setAutoHotspotJoinDuration_(v11, v177, self->_autoHotspotJoinDuration, v178, v179);
  objc_msgSend_setAutoHotspotJoinErrors_(v11, v180, (uint64_t)self->_autoHotspotJoinErrors, v181, v182);
  objc_msgSend_setHotspot_(v11, v183, (uint64_t)self->_hotspot, v184, v185);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 result;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  id v181;

  result = self->_result;
  v181 = a3;
  objc_msgSend_encodeBool_forKey_(v181, v5, result, (uint64_t)CFSTR("_result"), v6);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v7, self->_duration, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v11, (uint64_t)v10, (uint64_t)CFSTR("_duration"), v12);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v13, self->_durationFromLinkDownTrigger, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v17, (uint64_t)v16, (uint64_t)CFSTR("_durationFromLinkDownTrigger"), v18);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v19, self->_durationFromDisplayOnTrigger, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v23, (uint64_t)v22, (uint64_t)CFSTR("_durationFromDisplayOnTrigger"), v24);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v25, self->_durationFromDeviceUnlockTrigger, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v29, (uint64_t)v28, (uint64_t)CFSTR("_durationFromDeviceUnlockTrigger"), v30);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v31, self->_durationFromWiFiPowerOnTrigger, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v35, (uint64_t)v34, (uint64_t)CFSTR("_durationFromWiFiPowerOnTrigger"), v36);

  objc_msgSend_encodeInteger_forKey_(v181, v37, self->_previousNonRetryAutoJoinTrigger, (uint64_t)CFSTR("_previousNonRetryAutoJoinTrigger"), v38);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v39, self->_durationFromNonRetryAutoJoinTrigger, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v43, (uint64_t)v42, (uint64_t)CFSTR("_durationFromNonRetryAutoJoinTrigger"), v44);

  objc_msgSend_encodeObject_forKey_(v181, v45, (uint64_t)self->_error, (uint64_t)CFSTR("_error"), v46);
  objc_msgSend_encodeBool_forKey_(v181, v47, self->_wasCancelled, (uint64_t)CFSTR("_wasCancelled"), v48);
  objc_msgSend_encodeBool_forKey_(v181, v49, self->_wasAborted, (uint64_t)CFSTR("_wasAborted"), v50);
  objc_msgSend_encodeObject_forKey_(v181, v51, (uint64_t)self->_autoJoinParameters, (uint64_t)CFSTR("_autoJoinParameters"), v52);
  objc_msgSend_encodeInteger_forKey_(v181, v53, self->_retrySchedule, (uint64_t)CFSTR("_retrySchedule"), v54);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v55, self->_retryScheduleIndex, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v59, (uint64_t)v58, (uint64_t)CFSTR("_retryScheduleIndex"), v60);

  objc_msgSend_encodeBool_forKey_(v181, v61, self->_didUseLocationOptimizedChannelList, (uint64_t)CFSTR("_didUseLocationOptimizedChannelList"), v62);
  objc_msgSend_encodeBool_forKey_(v181, v63, self->_didDetectColocatedNetworkEnvironment, (uint64_t)CFSTR("_didDetectColocatedNetworkEnvironment"), v64);
  objc_msgSend_encodeBool_forKey_(v181, v65, self->_wasAlreadyAssociated, (uint64_t)CFSTR("_wasAlreadyAssociated"), v66);
  objc_msgSend_encodeBool_forKey_(v181, v67, self->_didDeferJoinToDiscoverMorePreferredNetwork, (uint64_t)CFSTR("_didDeferJoinToDiscoverMorePreferredNetwork"), v68);
  objc_msgSend_encodeBool_forKey_(v181, v69, self->_didFallbackToJoinLessPreferredNetwork, (uint64_t)CFSTR("_didFallbackToJoinLessPreferredNetwork"), v70);
  objc_msgSend_encodeObject_forKey_(v181, v71, (uint64_t)self->_preferredChannelList, (uint64_t)CFSTR("_preferredChannelList"), v72);
  objc_msgSend_encodeObject_forKey_(v181, v73, (uint64_t)self->_recentChannelList, (uint64_t)CFSTR("_recentChannelList"), v74);
  objc_msgSend_encodeObject_forKey_(v181, v75, (uint64_t)self->_remainingChannelList, (uint64_t)CFSTR("_remainingChannelList"), v76);
  objc_msgSend_encodeObject_forKey_(v181, v77, (uint64_t)self->_optimizedChannelList, (uint64_t)CFSTR("_optimizedChannelList"), v78);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v79, self->_scanDuration, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v83, (uint64_t)v82, (uint64_t)CFSTR("_scanDuration"), v84);

  objc_msgSend_encodeObject_forKey_(v181, v85, (uint64_t)self->_scanChannels, (uint64_t)CFSTR("_scanChannels"), v86);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v87, self->_preAssociationScanDuration, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v91, (uint64_t)v90, (uint64_t)CFSTR("_preAssociationScanDuration"), v92);

  objc_msgSend_encodeObject_forKey_(v181, v93, (uint64_t)self->_preAssociationScanChannels, (uint64_t)CFSTR("_preAssociationScanChannels"), v94);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v95, self->_followup6GHzScanDuration, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v99, (uint64_t)v98, (uint64_t)CFSTR("_followup6GHzScanDuration"), v100);

  objc_msgSend_encodeObject_forKey_(v181, v101, (uint64_t)self->_followup6GHzScanChannels, (uint64_t)CFSTR("_followup6GHzScanChannels"), v102);
  objc_msgSend_encodeObject_forKey_(v181, v103, (uint64_t)self->_scanErrors, (uint64_t)CFSTR("_scanErrors"), v104);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v105, self->_GASQueryDuration, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v109, (uint64_t)v108, (uint64_t)CFSTR("_GASQueryDuration"), v110);

  objc_msgSend_encodeObject_forKey_(v181, v111, (uint64_t)self->_GASQueryNetworks, (uint64_t)CFSTR("_GASQueryNetworks"), v112);
  objc_msgSend_encodeObject_forKey_(v181, v113, (uint64_t)self->_GASQueryErrors, (uint64_t)CFSTR("_GASQueryErrors"), v114);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v115, self->_joinDuration, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v119, (uint64_t)v118, (uint64_t)CFSTR("_joinDuration"), v120);

  objc_msgSend_encodeObject_forKey_(v181, v121, (uint64_t)self->_joinErrors, (uint64_t)CFSTR("_joinErrors"), v122);
  objc_msgSend_encodeObject_forKey_(v181, v123, (uint64_t)self->_network, (uint64_t)CFSTR("_network"), v124);
  objc_msgSend_encodeObject_forKey_(v181, v125, (uint64_t)self->_associatedNetwork, (uint64_t)CFSTR("_associatedNetwork"), v126);
  objc_msgSend_encodeObject_forKey_(v181, v127, (uint64_t)self->_candidates, (uint64_t)CFSTR("_candidates"), v128);
  objc_msgSend_encodeObject_forKey_(v181, v129, (uint64_t)self->_knownNetworks, (uint64_t)CFSTR("_knownNetworks"), v130);
  objc_msgSend_encodeBool_forKey_(v181, v131, self->_didTriggerReassoc, (uint64_t)CFSTR("_didTriggerReassoc"), v132);
  objc_msgSend_encodeBool_forKey_(v181, v133, self->_didPerformSeamlessSSIDTransition, (uint64_t)CFSTR("_didPerformSeamlessSSIDTransition"), v134);
  objc_msgSend_encodeBool_forKey_(v181, v135, self->_wasDiscoveredViaRNR, (uint64_t)CFSTR("_wasDiscoveredViaRNR"), v136);
  objc_msgSend_encodeBool_forKey_(v181, v137, self->_wasDiscoveredViaFILSD, (uint64_t)CFSTR("_wasDiscoveredViaFILSD"), v138);
  objc_msgSend_encodeBool_forKey_(v181, v139, self->_was6EDisabled, (uint64_t)CFSTR("_was6EDisabled"), v140);
  objc_msgSend_encodeBool_forKey_(v181, v141, self->_was6EPreferOn, (uint64_t)CFSTR("_was6EPreferOn"), v142);
  objc_msgSend_encodeBool_forKey_(v181, v143, self->_was6GHzDeprioritized, (uint64_t)CFSTR("_was6GHzDeprioritized"), v144);
  objc_msgSend_encodeBool_forKey_(v181, v145, self->_didIncludeRemainingNon2GHzChannels, (uint64_t)CFSTR("_didIncludeRemainingNon2GHzChannels"), v146);
  objc_msgSend_encodeBool_forKey_(v181, v147, self->_autoHotspotWasAttempted, (uint64_t)CFSTR("_autoHotspotWasAttempted"), v148);
  objc_msgSend_encodeBool_forKey_(v181, v149, self->_autoHotspotResult, (uint64_t)CFSTR("_autoHotspotResult"), v150);
  objc_msgSend_encodeBool_forKey_(v181, v151, self->_autoHotspotWasAborted, (uint64_t)CFSTR("_autoHotspotWasAborted"), v152);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v153, self->_autoHotspotDuration, v154, v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v157, (uint64_t)v156, (uint64_t)CFSTR("_autoHotspotDuration"), v158);

  objc_msgSend_encodeObject_forKey_(v181, v159, (uint64_t)self->_autoHotspotError, (uint64_t)CFSTR("_autoHotspotError"), v160);
  objc_msgSend_encodeInteger_forKey_(v181, v161, self->_autoHotspotMode, (uint64_t)CFSTR("_autoHotspotMode"), v162);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v163, self->_autoHotspotBrowseDuration, v164, v165);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v167, (uint64_t)v166, (uint64_t)CFSTR("_autoHotspotBrowseDuration"), v168);

  objc_msgSend_encodeObject_forKey_(v181, v169, (uint64_t)self->_autoHotspotBrowseError, (uint64_t)CFSTR("_autoHotspotBrowseError"), v170);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v171, self->_autoHotspotJoinDuration, v172, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v181, v175, (uint64_t)v174, (uint64_t)CFSTR("_autoHotspotJoinDuration"), v176);

  objc_msgSend_encodeObject_forKey_(v181, v177, (uint64_t)self->_autoHotspotJoinErrors, (uint64_t)CFSTR("_autoHotspotJoinErrors"), v178);
  objc_msgSend_encodeObject_forKey_(v181, v179, (uint64_t)self->_hotspot, (uint64_t)CFSTR("_hotspot"), v180);

}

- (CWFAutoJoinMetric)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CWFAutoJoinMetric *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
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
  NSError *error;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  CWFAutoJoinParameters *autoJoinParameters;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  NSArray *preferredChannelList;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  NSArray *recentChannelList;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  NSArray *remainingChannelList;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  NSArray *optimizedChannelList;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  NSArray *scanChannels;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  NSArray *preAssociationScanChannels;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  NSArray *followup6GHzScanChannels;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  NSArray *scanErrors;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  NSArray *GASQueryNetworks;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  NSArray *GASQueryErrors;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  NSArray *joinErrors;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  CWFScanResult *network;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  CWFScanResult *associatedNetwork;
  void *v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  NSArray *candidates;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  NSArray *knownNetworks;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  const char *v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  NSError *autoHotspotError;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  NSError *autoHotspotBrowseError;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  NSArray *autoHotspotJoinErrors;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  id v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  SFRemoteHotspotDevice *hotspot;
  objc_super v388;
  uint64_t v389;
  uint64_t *v390;
  uint64_t v391;
  uint64_t v392;
  __int128 v393;
  Class (*v394)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v395;
  uint64_t *v396;
  uint64_t v397;

  v397 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v388.receiver = self;
  v388.super_class = (Class)CWFAutoJoinMetric;
  v8 = -[CWFAutoJoinMetric init](&v388, sel_init);
  if (v8)
  {
    v8->_result = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("_result"), v6, v7);
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("_duration"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_duration = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15, v16);

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("_durationFromLinkDownTrigger"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_durationFromLinkDownTrigger = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23, v24);

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("_durationFromDisplayOnTrigger"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_durationFromDisplayOnTrigger = objc_msgSend_unsignedIntegerValue(v28, v29, v30, v31, v32);

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("_durationFromDeviceUnlockTrigger"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_durationFromDeviceUnlockTrigger = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39, v40);

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("_durationFromWiFiPowerOnTrigger"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_durationFromWiFiPowerOnTrigger = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47, v48);

    v8->_previousNonRetryAutoJoinTrigger = objc_msgSend_decodeIntegerForKey_(v4, v49, (uint64_t)CFSTR("_previousNonRetryAutoJoinTrigger"), v50, v51);
    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, (uint64_t)CFSTR("_durationFromNonRetryAutoJoinTrigger"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_durationFromNonRetryAutoJoinTrigger = objc_msgSend_unsignedIntegerValue(v55, v56, v57, v58, v59);

    v60 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, (uint64_t)CFSTR("_error"), v62);
    v63 = objc_claimAutoreleasedReturnValue();
    error = v8->_error;
    v8->_error = (NSError *)v63;

    v8->_wasCancelled = objc_msgSend_decodeBoolForKey_(v4, v65, (uint64_t)CFSTR("_wasCancelled"), v66, v67);
    v8->_wasAborted = objc_msgSend_decodeBoolForKey_(v4, v68, (uint64_t)CFSTR("_wasAborted"), v69, v70);
    v71 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, (uint64_t)CFSTR("_autoJoinParameters"), v73);
    v74 = objc_claimAutoreleasedReturnValue();
    autoJoinParameters = v8->_autoJoinParameters;
    v8->_autoJoinParameters = (CWFAutoJoinParameters *)v74;

    v8->_retrySchedule = objc_msgSend_decodeIntegerForKey_(v4, v76, (uint64_t)CFSTR("_retrySchedule"), v77, v78);
    v79 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, (uint64_t)CFSTR("_retryScheduleIndex"), v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_retryScheduleIndex = objc_msgSend_unsignedIntegerValue(v82, v83, v84, v85, v86);

    v8->_didUseLocationOptimizedChannelList = objc_msgSend_decodeBoolForKey_(v4, v87, (uint64_t)CFSTR("_didUseLocationOptimizedChannelList"), v88, v89);
    v8->_didDetectColocatedNetworkEnvironment = objc_msgSend_decodeBoolForKey_(v4, v90, (uint64_t)CFSTR("_didDetectColocatedNetworkEnvironment"), v91, v92);
    v8->_wasAlreadyAssociated = objc_msgSend_decodeBoolForKey_(v4, v93, (uint64_t)CFSTR("_wasAlreadyAssociated"), v94, v95);
    v8->_didDeferJoinToDiscoverMorePreferredNetwork = objc_msgSend_decodeBoolForKey_(v4, v96, (uint64_t)CFSTR("_didDeferJoinToDiscoverMorePreferredNetwork"), v97, v98);
    v8->_didFallbackToJoinLessPreferredNetwork = objc_msgSend_decodeBoolForKey_(v4, v99, (uint64_t)CFSTR("_didFallbackToJoinLessPreferredNetwork"), v100, v101);
    v102 = (void *)MEMORY[0x1E0C99E60];
    v103 = objc_opt_class();
    v104 = objc_opt_class();
    objc_msgSend_setWithObjects_(v102, v105, v103, v106, v107, v104, 0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v109, (uint64_t)v108, (uint64_t)CFSTR("_preferredChannelList"), v110);
    v111 = objc_claimAutoreleasedReturnValue();
    preferredChannelList = v8->_preferredChannelList;
    v8->_preferredChannelList = (NSArray *)v111;

    v113 = (void *)MEMORY[0x1E0C99E60];
    v114 = objc_opt_class();
    v115 = objc_opt_class();
    objc_msgSend_setWithObjects_(v113, v116, v114, v117, v118, v115, 0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v120, (uint64_t)v119, (uint64_t)CFSTR("_recentChannelList"), v121);
    v122 = objc_claimAutoreleasedReturnValue();
    recentChannelList = v8->_recentChannelList;
    v8->_recentChannelList = (NSArray *)v122;

    v124 = (void *)MEMORY[0x1E0C99E60];
    v125 = objc_opt_class();
    v126 = objc_opt_class();
    objc_msgSend_setWithObjects_(v124, v127, v125, v128, v129, v126, 0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v131, (uint64_t)v130, (uint64_t)CFSTR("_remainingChannelList"), v132);
    v133 = objc_claimAutoreleasedReturnValue();
    remainingChannelList = v8->_remainingChannelList;
    v8->_remainingChannelList = (NSArray *)v133;

    v135 = (void *)MEMORY[0x1E0C99E60];
    v136 = objc_opt_class();
    v137 = objc_opt_class();
    objc_msgSend_setWithObjects_(v135, v138, v136, v139, v140, v137, 0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v142, (uint64_t)v141, (uint64_t)CFSTR("_optimizedChannelList"), v143);
    v144 = objc_claimAutoreleasedReturnValue();
    optimizedChannelList = v8->_optimizedChannelList;
    v8->_optimizedChannelList = (NSArray *)v144;

    v146 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v147, v146, (uint64_t)CFSTR("_scanDuration"), v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_scanDuration = objc_msgSend_unsignedIntegerValue(v149, v150, v151, v152, v153);

    v154 = (void *)MEMORY[0x1E0C99E60];
    v155 = objc_opt_class();
    v156 = objc_opt_class();
    objc_msgSend_setWithObjects_(v154, v157, v155, v158, v159, v156, 0);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v161, (uint64_t)v160, (uint64_t)CFSTR("_scanChannels"), v162);
    v163 = objc_claimAutoreleasedReturnValue();
    scanChannels = v8->_scanChannels;
    v8->_scanChannels = (NSArray *)v163;

    v165 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v165, (uint64_t)CFSTR("_preAssociationScanDuration"), v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_preAssociationScanDuration = objc_msgSend_unsignedIntegerValue(v168, v169, v170, v171, v172);

    v173 = (void *)MEMORY[0x1E0C99E60];
    v174 = objc_opt_class();
    v175 = objc_opt_class();
    objc_msgSend_setWithObjects_(v173, v176, v174, v177, v178, v175, 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v180, (uint64_t)v179, (uint64_t)CFSTR("_preAssociationScanChannels"), v181);
    v182 = objc_claimAutoreleasedReturnValue();
    preAssociationScanChannels = v8->_preAssociationScanChannels;
    v8->_preAssociationScanChannels = (NSArray *)v182;

    v184 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v185, v184, (uint64_t)CFSTR("_followup6GHzScanDuration"), v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_followup6GHzScanDuration = objc_msgSend_unsignedIntegerValue(v187, v188, v189, v190, v191);

    v192 = (void *)MEMORY[0x1E0C99E60];
    v193 = objc_opt_class();
    v194 = objc_opt_class();
    objc_msgSend_setWithObjects_(v192, v195, v193, v196, v197, v194, 0);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v199, (uint64_t)v198, (uint64_t)CFSTR("_followup6GHzScanChannels"), v200);
    v201 = objc_claimAutoreleasedReturnValue();
    followup6GHzScanChannels = v8->_followup6GHzScanChannels;
    v8->_followup6GHzScanChannels = (NSArray *)v201;

    v203 = (void *)MEMORY[0x1E0C99E60];
    v204 = objc_opt_class();
    v205 = objc_opt_class();
    objc_msgSend_setWithObjects_(v203, v206, v204, v207, v208, v205, 0);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v210, (uint64_t)v209, (uint64_t)CFSTR("_scanErrors"), v211);
    v212 = objc_claimAutoreleasedReturnValue();
    scanErrors = v8->_scanErrors;
    v8->_scanErrors = (NSArray *)v212;

    v214 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v215, v214, (uint64_t)CFSTR("_GASQueryDuration"), v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_GASQueryDuration = objc_msgSend_unsignedIntegerValue(v217, v218, v219, v220, v221);

    v222 = (void *)MEMORY[0x1E0C99E60];
    v223 = objc_opt_class();
    v224 = objc_opt_class();
    objc_msgSend_setWithObjects_(v222, v225, v223, v226, v227, v224, 0);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v229, (uint64_t)v228, (uint64_t)CFSTR("_GASQueryNetworks"), v230);
    v231 = objc_claimAutoreleasedReturnValue();
    GASQueryNetworks = v8->_GASQueryNetworks;
    v8->_GASQueryNetworks = (NSArray *)v231;

    v233 = (void *)MEMORY[0x1E0C99E60];
    v234 = objc_opt_class();
    v235 = objc_opt_class();
    objc_msgSend_setWithObjects_(v233, v236, v234, v237, v238, v235, 0);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v240, (uint64_t)v239, (uint64_t)CFSTR("_GASQueryErrors"), v241);
    v242 = objc_claimAutoreleasedReturnValue();
    GASQueryErrors = v8->_GASQueryErrors;
    v8->_GASQueryErrors = (NSArray *)v242;

    v244 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v245, v244, (uint64_t)CFSTR("_joinDuration"), v246);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_joinDuration = objc_msgSend_unsignedIntegerValue(v247, v248, v249, v250, v251);

    v252 = (void *)MEMORY[0x1E0C99E60];
    v253 = objc_opt_class();
    v254 = objc_opt_class();
    objc_msgSend_setWithObjects_(v252, v255, v253, v256, v257, v254, 0);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v259, (uint64_t)v258, (uint64_t)CFSTR("_joinErrors"), v260);
    v261 = objc_claimAutoreleasedReturnValue();
    joinErrors = v8->_joinErrors;
    v8->_joinErrors = (NSArray *)v261;

    v263 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v264, v263, (uint64_t)CFSTR("_network"), v265);
    v266 = objc_claimAutoreleasedReturnValue();
    network = v8->_network;
    v8->_network = (CWFScanResult *)v266;

    v268 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v269, v268, (uint64_t)CFSTR("_associatedNetwork"), v270);
    v271 = objc_claimAutoreleasedReturnValue();
    associatedNetwork = v8->_associatedNetwork;
    v8->_associatedNetwork = (CWFScanResult *)v271;

    v273 = (void *)MEMORY[0x1E0C99E60];
    v274 = objc_opt_class();
    v275 = objc_opt_class();
    objc_msgSend_setWithObjects_(v273, v276, v274, v277, v278, v275, 0);
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v280, (uint64_t)v279, (uint64_t)CFSTR("_candidates"), v281);
    v282 = objc_claimAutoreleasedReturnValue();
    candidates = v8->_candidates;
    v8->_candidates = (NSArray *)v282;

    v284 = (void *)MEMORY[0x1E0C99E60];
    v285 = objc_opt_class();
    v286 = objc_opt_class();
    objc_msgSend_setWithObjects_(v284, v287, v285, v288, v289, v286, 0);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v291, (uint64_t)v290, (uint64_t)CFSTR("_knownNetworks"), v292);
    v293 = objc_claimAutoreleasedReturnValue();
    knownNetworks = v8->_knownNetworks;
    v8->_knownNetworks = (NSArray *)v293;

    v8->_didTriggerReassoc = objc_msgSend_decodeBoolForKey_(v4, v295, (uint64_t)CFSTR("_didTriggerReassoc"), v296, v297);
    v8->_didPerformSeamlessSSIDTransition = objc_msgSend_decodeBoolForKey_(v4, v298, (uint64_t)CFSTR("_didPerformSeamlessSSIDTransition"), v299, v300);
    v8->_wasDiscoveredViaRNR = objc_msgSend_decodeBoolForKey_(v4, v301, (uint64_t)CFSTR("_wasDiscoveredViaRNR"), v302, v303);
    v8->_wasDiscoveredViaFILSD = objc_msgSend_decodeBoolForKey_(v4, v304, (uint64_t)CFSTR("_wasDiscoveredViaFILSD"), v305, v306);
    v8->_was6EDisabled = objc_msgSend_decodeBoolForKey_(v4, v307, (uint64_t)CFSTR("_was6EDisabled"), v308, v309);
    v8->_was6EPreferOn = objc_msgSend_decodeBoolForKey_(v4, v310, (uint64_t)CFSTR("_was6EPreferOn"), v311, v312);
    v8->_was6GHzDeprioritized = objc_msgSend_decodeBoolForKey_(v4, v313, (uint64_t)CFSTR("_was6GHzDeprioritized"), v314, v315);
    v8->_didIncludeRemainingNon2GHzChannels = objc_msgSend_decodeBoolForKey_(v4, v316, (uint64_t)CFSTR("_didIncludeRemainingNon2GHzChannels"), v317, v318);
    v8->_autoHotspotWasAttempted = objc_msgSend_decodeBoolForKey_(v4, v319, (uint64_t)CFSTR("_autoHotspotWasAttempted"), v320, v321);
    v8->_autoHotspotResult = objc_msgSend_decodeBoolForKey_(v4, v322, (uint64_t)CFSTR("_autoHotspotResult"), v323, v324);
    v8->_autoHotspotWasAborted = objc_msgSend_decodeBoolForKey_(v4, v325, (uint64_t)CFSTR("_autoHotspotWasAborted"), v326, v327);
    v328 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v329, v328, (uint64_t)CFSTR("_autoHotspotDuration"), v330);
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_autoHotspotDuration = objc_msgSend_unsignedIntegerValue(v331, v332, v333, v334, v335);

    v336 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v337, v336, (uint64_t)CFSTR("_autoHotspotError"), v338);
    v339 = objc_claimAutoreleasedReturnValue();
    autoHotspotError = v8->_autoHotspotError;
    v8->_autoHotspotError = (NSError *)v339;

    v8->_autoHotspotMode = objc_msgSend_decodeIntegerForKey_(v4, v341, (uint64_t)CFSTR("_autoHotspotMode"), v342, v343);
    v344 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v345, v344, (uint64_t)CFSTR("_autoHotspotBrowseDuration"), v346);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_autoHotspotBrowseDuration = objc_msgSend_unsignedIntegerValue(v347, v348, v349, v350, v351);

    v352 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v353, v352, (uint64_t)CFSTR("_autoHotspotBrowseError"), v354);
    v355 = objc_claimAutoreleasedReturnValue();
    autoHotspotBrowseError = v8->_autoHotspotBrowseError;
    v8->_autoHotspotBrowseError = (NSError *)v355;

    v357 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v358, v357, (uint64_t)CFSTR("_autoHotspotJoinDuration"), v359);
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_autoHotspotJoinDuration = objc_msgSend_unsignedIntegerValue(v360, v361, v362, v363, v364);

    v365 = (void *)MEMORY[0x1E0C99E60];
    v366 = objc_opt_class();
    v367 = objc_opt_class();
    objc_msgSend_setWithObjects_(v365, v368, v366, v369, v370, v367, 0);
    v371 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v372, (uint64_t)v371, (uint64_t)CFSTR("_autoHotspotJoinErrors"), v373);
    v374 = objc_claimAutoreleasedReturnValue();
    autoHotspotJoinErrors = v8->_autoHotspotJoinErrors;
    v8->_autoHotspotJoinErrors = (NSArray *)v374;

    if (!qword_1ECFD6B18)
    {
      v393 = xmmword_1E61355C0;
      v394 = 0;
      qword_1ECFD6B18 = _sl_dlopen();
    }
    if (qword_1ECFD6B18)
    {
      v389 = 0;
      v390 = &v389;
      v391 = 0x2050000000;
      v380 = (void *)qword_1ECFD6B20;
      v392 = qword_1ECFD6B20;
      if (!qword_1ECFD6B20)
      {
        *(_QWORD *)&v393 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v393 + 1) = 3221225472;
        v394 = sub_1B06FD8DC;
        v395 = &unk_1E61329A8;
        v396 = &v389;
        sub_1B06FD8DC((uint64_t)&v393, v376, v377, v378, v379);
        v380 = (void *)v390[3];
      }
      v381 = objc_retainAutorelease(v380);
      _Block_object_dispose(&v389, 8);
      v382 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v383, v382, (uint64_t)CFSTR("_hotspot"), v384);
      v385 = objc_claimAutoreleasedReturnValue();
      hotspot = v8->_hotspot;
      v8->_hotspot = (SFRemoteHotspotDevice *)v385;

    }
  }

  return v8;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)durationFromLinkDownTrigger
{
  return self->_durationFromLinkDownTrigger;
}

- (void)setDurationFromLinkDownTrigger:(unint64_t)a3
{
  self->_durationFromLinkDownTrigger = a3;
}

- (unint64_t)durationFromDisplayOnTrigger
{
  return self->_durationFromDisplayOnTrigger;
}

- (void)setDurationFromDisplayOnTrigger:(unint64_t)a3
{
  self->_durationFromDisplayOnTrigger = a3;
}

- (unint64_t)durationFromDeviceUnlockTrigger
{
  return self->_durationFromDeviceUnlockTrigger;
}

- (void)setDurationFromDeviceUnlockTrigger:(unint64_t)a3
{
  self->_durationFromDeviceUnlockTrigger = a3;
}

- (unint64_t)durationFromWiFiPowerOnTrigger
{
  return self->_durationFromWiFiPowerOnTrigger;
}

- (void)setDurationFromWiFiPowerOnTrigger:(unint64_t)a3
{
  self->_durationFromWiFiPowerOnTrigger = a3;
}

- (int64_t)previousNonRetryAutoJoinTrigger
{
  return self->_previousNonRetryAutoJoinTrigger;
}

- (void)setPreviousNonRetryAutoJoinTrigger:(int64_t)a3
{
  self->_previousNonRetryAutoJoinTrigger = a3;
}

- (unint64_t)durationFromNonRetryAutoJoinTrigger
{
  return self->_durationFromNonRetryAutoJoinTrigger;
}

- (void)setDurationFromNonRetryAutoJoinTrigger:(unint64_t)a3
{
  self->_durationFromNonRetryAutoJoinTrigger = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)wasCancelled
{
  return self->_wasCancelled;
}

- (void)setWasCancelled:(BOOL)a3
{
  self->_wasCancelled = a3;
}

- (BOOL)wasAborted
{
  return self->_wasAborted;
}

- (void)setWasAborted:(BOOL)a3
{
  self->_wasAborted = a3;
}

- (CWFAutoJoinParameters)autoJoinParameters
{
  return self->_autoJoinParameters;
}

- (void)setAutoJoinParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)retrySchedule
{
  return self->_retrySchedule;
}

- (void)setRetrySchedule:(int64_t)a3
{
  self->_retrySchedule = a3;
}

- (unint64_t)retryScheduleIndex
{
  return self->_retryScheduleIndex;
}

- (void)setRetryScheduleIndex:(unint64_t)a3
{
  self->_retryScheduleIndex = a3;
}

- (BOOL)was6EDisabled
{
  return self->_was6EDisabled;
}

- (void)setWas6EDisabled:(BOOL)a3
{
  self->_was6EDisabled = a3;
}

- (BOOL)was6EPreferOn
{
  return self->_was6EPreferOn;
}

- (void)setWas6EPreferOn:(BOOL)a3
{
  self->_was6EPreferOn = a3;
}

- (BOOL)was6GHzDeprioritized
{
  return self->_was6GHzDeprioritized;
}

- (void)setWas6GHzDeprioritized:(BOOL)a3
{
  self->_was6GHzDeprioritized = a3;
}

- (BOOL)wasAlreadyAssociated
{
  return self->_wasAlreadyAssociated;
}

- (void)setWasAlreadyAssociated:(BOOL)a3
{
  self->_wasAlreadyAssociated = a3;
}

- (BOOL)didUseLocationOptimizedChannelList
{
  return self->_didUseLocationOptimizedChannelList;
}

- (void)setDidUseLocationOptimizedChannelList:(BOOL)a3
{
  self->_didUseLocationOptimizedChannelList = a3;
}

- (BOOL)didDetectColocatedNetworkEnvironment
{
  return self->_didDetectColocatedNetworkEnvironment;
}

- (void)setDidDetectColocatedNetworkEnvironment:(BOOL)a3
{
  self->_didDetectColocatedNetworkEnvironment = a3;
}

- (BOOL)didDeferJoinToDiscoverMorePreferredNetwork
{
  return self->_didDeferJoinToDiscoverMorePreferredNetwork;
}

- (void)setDidDeferJoinToDiscoverMorePreferredNetwork:(BOOL)a3
{
  self->_didDeferJoinToDiscoverMorePreferredNetwork = a3;
}

- (BOOL)didFallbackToJoinLessPreferredNetwork
{
  return self->_didFallbackToJoinLessPreferredNetwork;
}

- (void)setDidFallbackToJoinLessPreferredNetwork:(BOOL)a3
{
  self->_didFallbackToJoinLessPreferredNetwork = a3;
}

- (unint64_t)scanDuration
{
  return self->_scanDuration;
}

- (void)setScanDuration:(unint64_t)a3
{
  self->_scanDuration = a3;
}

- (NSArray)scanChannels
{
  return self->_scanChannels;
}

- (void)setScanChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)preAssociationScanDuration
{
  return self->_preAssociationScanDuration;
}

- (void)setPreAssociationScanDuration:(unint64_t)a3
{
  self->_preAssociationScanDuration = a3;
}

- (NSArray)preAssociationScanChannels
{
  return self->_preAssociationScanChannels;
}

- (void)setPreAssociationScanChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)scanErrors
{
  return self->_scanErrors;
}

- (void)setScanErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unint64_t)GASQueryDuration
{
  return self->_GASQueryDuration;
}

- (void)setGASQueryDuration:(unint64_t)a3
{
  self->_GASQueryDuration = a3;
}

- (NSArray)GASQueryNetworks
{
  return self->_GASQueryNetworks;
}

- (void)setGASQueryNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)GASQueryErrors
{
  return self->_GASQueryErrors;
}

- (void)setGASQueryErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unint64_t)joinDuration
{
  return self->_joinDuration;
}

- (void)setJoinDuration:(unint64_t)a3
{
  self->_joinDuration = a3;
}

- (NSArray)joinErrors
{
  return self->_joinErrors;
}

- (void)setJoinErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (CWFScanResult)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (CWFScanResult)associatedNetwork
{
  return self->_associatedNetwork;
}

- (void)setAssociatedNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)didPerformSeamlessSSIDTransition
{
  return self->_didPerformSeamlessSSIDTransition;
}

- (void)setDidPerformSeamlessSSIDTransition:(BOOL)a3
{
  self->_didPerformSeamlessSSIDTransition = a3;
}

- (BOOL)didTriggerReassoc
{
  return self->_didTriggerReassoc;
}

- (void)setDidTriggerReassoc:(BOOL)a3
{
  self->_didTriggerReassoc = a3;
}

- (NSArray)preferredChannelList
{
  return self->_preferredChannelList;
}

- (void)setPreferredChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)recentChannelList
{
  return self->_recentChannelList;
}

- (void)setRecentChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)remainingChannelList
{
  return self->_remainingChannelList;
}

- (void)setRemainingChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSArray)optimizedChannelList
{
  return self->_optimizedChannelList;
}

- (void)setOptimizedChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)wasDiscoveredViaRNR
{
  return self->_wasDiscoveredViaRNR;
}

- (void)setWasDiscoveredViaRNR:(BOOL)a3
{
  self->_wasDiscoveredViaRNR = a3;
}

- (BOOL)wasDiscoveredViaFILSD
{
  return self->_wasDiscoveredViaFILSD;
}

- (void)setWasDiscoveredViaFILSD:(BOOL)a3
{
  self->_wasDiscoveredViaFILSD = a3;
}

- (unint64_t)followup6GHzScanDuration
{
  return self->_followup6GHzScanDuration;
}

- (void)setFollowup6GHzScanDuration:(unint64_t)a3
{
  self->_followup6GHzScanDuration = a3;
}

- (NSArray)followup6GHzScanChannels
{
  return self->_followup6GHzScanChannels;
}

- (void)setFollowup6GHzScanChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)didIncludeRemainingNon2GHzChannels
{
  return self->_didIncludeRemainingNon2GHzChannels;
}

- (void)setDidIncludeRemainingNon2GHzChannels:(BOOL)a3
{
  self->_didIncludeRemainingNon2GHzChannels = a3;
}

- (BOOL)autoHotspotWasAttempted
{
  return self->_autoHotspotWasAttempted;
}

- (void)setAutoHotspotWasAttempted:(BOOL)a3
{
  self->_autoHotspotWasAttempted = a3;
}

- (BOOL)autoHotspotResult
{
  return self->_autoHotspotResult;
}

- (void)setAutoHotspotResult:(BOOL)a3
{
  self->_autoHotspotResult = a3;
}

- (unint64_t)autoHotspotDuration
{
  return self->_autoHotspotDuration;
}

- (void)setAutoHotspotDuration:(unint64_t)a3
{
  self->_autoHotspotDuration = a3;
}

- (BOOL)autoHotspotWasAborted
{
  return self->_autoHotspotWasAborted;
}

- (void)setAutoHotspotWasAborted:(BOOL)a3
{
  self->_autoHotspotWasAborted = a3;
}

- (NSError)autoHotspotError
{
  return self->_autoHotspotError;
}

- (void)setAutoHotspotError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (int64_t)autoHotspotMode
{
  return self->_autoHotspotMode;
}

- (void)setAutoHotspotMode:(int64_t)a3
{
  self->_autoHotspotMode = a3;
}

- (unint64_t)autoHotspotBrowseDuration
{
  return self->_autoHotspotBrowseDuration;
}

- (void)setAutoHotspotBrowseDuration:(unint64_t)a3
{
  self->_autoHotspotBrowseDuration = a3;
}

- (NSError)autoHotspotBrowseError
{
  return self->_autoHotspotBrowseError;
}

- (void)setAutoHotspotBrowseError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (unint64_t)autoHotspotJoinDuration
{
  return self->_autoHotspotJoinDuration;
}

- (void)setAutoHotspotJoinDuration:(unint64_t)a3
{
  self->_autoHotspotJoinDuration = a3;
}

- (NSArray)autoHotspotJoinErrors
{
  return self->_autoHotspotJoinErrors;
}

- (void)setAutoHotspotJoinErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (SFRemoteHotspotDevice)hotspot
{
  return self->_hotspot;
}

- (void)setHotspot:(id)a3
{
  objc_storeStrong((id *)&self->_hotspot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspot, 0);
  objc_storeStrong((id *)&self->_autoHotspotJoinErrors, 0);
  objc_storeStrong((id *)&self->_autoHotspotBrowseError, 0);
  objc_storeStrong((id *)&self->_autoHotspotError, 0);
  objc_storeStrong((id *)&self->_followup6GHzScanChannels, 0);
  objc_storeStrong((id *)&self->_optimizedChannelList, 0);
  objc_storeStrong((id *)&self->_remainingChannelList, 0);
  objc_storeStrong((id *)&self->_recentChannelList, 0);
  objc_storeStrong((id *)&self->_preferredChannelList, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_associatedNetwork, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_joinErrors, 0);
  objc_storeStrong((id *)&self->_GASQueryErrors, 0);
  objc_storeStrong((id *)&self->_GASQueryNetworks, 0);
  objc_storeStrong((id *)&self->_scanErrors, 0);
  objc_storeStrong((id *)&self->_preAssociationScanChannels, 0);
  objc_storeStrong((id *)&self->_scanChannels, 0);
  objc_storeStrong((id *)&self->_autoJoinParameters, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
