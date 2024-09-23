@implementation ATXAppFeaturizer

- (ATXAppFeaturizer)initWithDayZeroParameters:(id)a3 dayZeroIntentParameters:(id)a4 feedback:(id)a5 appLaunchHistogramManager:(id)a6 appLaunchSequenceManager:(id)a7 appLaunchLocation:(id)a8 appInstallMontior:(id)a9 mediaApplications:(id)a10 appDailyDose:(id)a11 globalAppScorePredictor:(id)a12 globalSmartSuppression:(id)a13 appInfoManager:(id)a14 magicalMomentsUpdateMonitor:(id)a15 heroAppPredictions:(id)a16 appIconState:(id)a17 appLaunchMicroLocation:(id)a18 notificationManager:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  ATXAppFeaturizer *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v38 = a3;
  v44 = a4;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v37 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = (void *)objc_opt_new();
  v36 = -[ATXAppFeaturizer initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:heroPoiManager:](self, "initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:heroPoiManager:", v38, v44, v43, v42, v41, v40, v39, v37, v24, v25, v26, v27, v28, v29,
          v30,
          v31,
          v32,
          v33);

  return v36;
}

- (ATXAppFeaturizer)initWithDayZeroParameters:(id)a3 dayZeroIntentParameters:(id)a4 feedback:(id)a5 appLaunchHistogramManager:(id)a6 appLaunchSequenceManager:(id)a7 appLaunchLocation:(id)a8 appInstallMontior:(id)a9 mediaApplications:(id)a10 appDailyDose:(id)a11 globalAppScorePredictor:(id)a12 globalSmartSuppression:(id)a13 appInfoManager:(id)a14 magicalMomentsUpdateMonitor:(id)a15 heroAppPredictions:(id)a16 appIconState:(id)a17 appLaunchMicroLocation:(id)a18 notificationManager:(id)a19 heroPoiManager:(id)a20
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  ATXAppFeaturizer *v31;
  ATXAppFeaturizer *v32;
  id v35;
  id v36;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v49 = a4;
  v35 = a5;
  v48 = a5;
  v36 = a6;
  v47 = a6;
  v37 = a7;
  v46 = a7;
  v45 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v41 = a12;
  v40 = a13;
  v39 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v30 = a20;
  v51.receiver = self;
  v51.super_class = (Class)ATXAppFeaturizer;
  v31 = -[ATXAppFeaturizer init](&v51, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_dayZeroParameters, a3);
    objc_storeStrong((id *)&v32->_dayZeroIntentParameters, a4);
    objc_storeStrong((id *)&v32->_feedback, v35);
    objc_storeStrong((id *)&v32->_appLaunchHistogramManager, v36);
    objc_storeStrong((id *)&v32->_appLaunchSequenceManager, v37);
    objc_storeStrong((id *)&v32->_appLaunchLocation, a8);
    objc_storeStrong((id *)&v32->_appInstallMonitor, a9);
    objc_storeStrong((id *)&v32->_mediaApps, a10);
    objc_storeStrong((id *)&v32->_appDailyDose, a11);
    objc_storeStrong((id *)&v32->_globalAppScorePredictor, a12);
    objc_storeStrong((id *)&v32->_globalSmartSuppression, a13);
    objc_storeStrong((id *)&v32->_appInfoManager, a14);
    objc_storeStrong((id *)&v32->_mmPredictionMonitor, a15);
    objc_storeStrong((id *)&v32->_heroPredictionServer, a16);
    objc_storeStrong((id *)&v32->_appIconState, a17);
    objc_storeStrong((id *)&v32->_microLocation, a18);
    objc_storeStrong((id *)&v32->_notificationManager, a19);
    objc_storeStrong((id *)&v32->_heroPoiManager, a20);
  }

  return v32;
}

- (vector<ATXPredictionItem,)evaluateFeaturesForApps:(ATXAppFeaturizer *)self clipBundleIdsToRank:(SEL)a3 consumerSubType:(id)a4 intent:(id)a5 scoreLogger:(unsigned __int8)a6 context:(id)a7 featureCache:(id)a8
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  id *v21;
  _QWORD *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  ATXApp2VecMapping *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  uint32_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  __CFString *v97;
  NSObject *v98;
  objc_class *v99;
  id v100;
  id v101;
  void *v102;
  unint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t j;
  NSObject *v107;
  void *v108;
  BOOL v109;
  void *v110;
  void *v111;
  BOOL v112;
  void *v113;
  uint64_t v114;
  void *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint32_t v127;
  double v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  double v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
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
  void *v157;
  double v158;
  void *v159;
  void *v160;
  double v161;
  void *v162;
  void *v163;
  double v164;
  void *v165;
  void *v166;
  double v167;
  void *v168;
  void *v169;
  double v170;
  void *v171;
  void *v172;
  double v173;
  void *v174;
  void *v175;
  double v176;
  void *v177;
  void *v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  void *v183;
  double v184;
  void *v185;
  double v186;
  void *v187;
  double v188;
  void *v189;
  double v190;
  void *v191;
  double v192;
  void *v193;
  double v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  unsigned int v207;
  double v208;
  uint64_t v209;
  double v210;
  double v211;
  double v212;
  id v213;
  void *v214;
  void *v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  void *v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  void *v272;
  double v273;
  double v274;
  double v275;
  void *v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  void *v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  double v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  double v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  double v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  double v387;
  double v388;
  double v389;
  double v390;
  double v391;
  double v392;
  double v393;
  double v394;
  double v395;
  double v396;
  double v397;
  double v398;
  double v399;
  double v400;
  double v401;
  double v402;
  double v403;
  double v404;
  double v405;
  double v406;
  double v407;
  double v408;
  double v409;
  double v410;
  double v411;
  double v412;
  double v413;
  double v414;
  double v415;
  double v416;
  double v417;
  double v418;
  double v419;
  double v420;
  double v421;
  double v422;
  double v423;
  double v424;
  double v425;
  double v426;
  double v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  double v433;
  double v434;
  double v435;
  double v436;
  double v437;
  double v438;
  double v439;
  double v440;
  double v441;
  double v442;
  double v443;
  double v444;
  double v445;
  double v446;
  double v447;
  double v448;
  double v449;
  double v450;
  double v451;
  double v452;
  double v453;
  double v454;
  double v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  double v464;
  double v465;
  double v466;
  double v467;
  double v468;
  double v469;
  double v470;
  double v471;
  double v472;
  double v473;
  double v474;
  double v475;
  double v476;
  double v477;
  double v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  double v490;
  double v491;
  double v492;
  double v493;
  double v494;
  double v495;
  double v496;
  double v497;
  double v498;
  double v499;
  double v500;
  double v501;
  double v502;
  double v503;
  double v504;
  double v505;
  float v506;
  double v507;
  double v508;
  void *v509;
  BOOL v510;
  void *v511;
  void *v512;
  double v513;
  double v514;
  void *v515;
  void *v516;
  double v517;
  double v518;
  double v519;
  double v520;
  unint64_t v521;
  NSObject *v522;
  double v523;
  double v524;
  double v525;
  double v526;
  double v527;
  void *v528;
  void *v529;
  double v530;
  double v531;
  double v532;
  double v533;
  double v534;
  NSObject *v535;
  double v536;
  void *v537;
  double v538;
  double v539;
  double v540;
  double v541;
  double v542;
  double v543;
  double v544;
  double v545;
  double v546;
  double v547;
  double v548;
  double v549;
  double v550;
  double v551;
  double v552;
  double v553;
  double v554;
  double v555;
  double v556;
  double v557;
  double v558;
  double v559;
  double v560;
  double v561;
  double v562;
  double v563;
  double v564;
  double v565;
  double v566;
  double v567;
  double v568;
  double v569;
  double v570;
  double v571;
  double v572;
  double v573;
  double v574;
  double v575;
  double v576;
  double v577;
  double v578;
  double v579;
  double v580;
  double v581;
  double v582;
  double v583;
  double v584;
  double v585;
  double v586;
  double v587;
  double v588;
  double v589;
  double v590;
  double v591;
  double v592;
  double v593;
  double v594;
  double v595;
  double v596;
  double v597;
  double v598;
  double v599;
  double v600;
  double v601;
  double v602;
  double v603;
  double v604;
  double v605;
  double v606;
  double v607;
  double v608;
  double v609;
  double v610;
  double v611;
  double v612;
  double v613;
  double v614;
  double v615;
  double v616;
  double v617;
  double v618;
  double v619;
  double v620;
  double v621;
  double v622;
  double v623;
  double v624;
  double v625;
  double v626;
  double v627;
  double v628;
  double v629;
  double v630;
  double v631;
  double v632;
  double v633;
  double v634;
  double v635;
  double v636;
  double v637;
  double v638;
  double v639;
  double v640;
  double v641;
  double v642;
  double v643;
  double v644;
  double v645;
  double v646;
  double v647;
  double v648;
  double v649;
  double v650;
  double v651;
  double v652;
  double v653;
  double v654;
  double v655;
  double v656;
  double v657;
  double v658;
  double v659;
  double v660;
  double v661;
  double v662;
  id v663;
  uint64_t v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  uint64_t v669;
  uint64_t v670;
  void *v671;
  void *v672;
  void *v673;
  uint64_t v674;
  uint64_t v675;
  double v676;
  void *v677;
  void *v678;
  uint64_t v679;
  double v680;
  double v681;
  uint64_t v682;
  double v683;
  double v684;
  uint64_t v685;
  double v686;
  double v687;
  uint64_t v688;
  double v689;
  double v690;
  uint64_t v691;
  double v692;
  double v693;
  uint64_t v694;
  double v695;
  double v696;
  uint64_t v697;
  double v698;
  double v699;
  uint64_t v700;
  double v701;
  double v702;
  uint64_t v703;
  double v704;
  double v705;
  void *v706;
  uint64_t v707;
  double v708;
  double v709;
  uint64_t v710;
  double v711;
  double v712;
  uint64_t v713;
  double v714;
  double v715;
  uint64_t v716;
  double v717;
  double v718;
  uint64_t v719;
  double v720;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  void *v722;
  void *v723;
  void *v724;
  void *v725;
  __CFString *v726;
  id v727;
  id v728;
  void *v729;
  void *v730;
  id v731;
  ATXApp2VecMapping *v732;
  double v733;
  double v734;
  double v735;
  double v736;
  double v737;
  double v738;
  int64_t v739;
  unint64_t v740;
  int v741;
  double v742;
  double v743;
  double v744;
  double v745;
  double v746;
  double v747;
  void *v748;
  void *v749;
  void *v750;
  char v751;
  void *v752;
  void *v753;
  void *v754;
  int v755;
  void *v756;
  void *v757;
  void *v758;
  void *v759;
  void *v760;
  id v761;
  void *v762;
  void *v763;
  unsigned int v764;
  void *v765;
  int v766;
  void *v767;
  int v768;
  void *v769;
  id v770;
  void *v771;
  void *v772;
  void *v773;
  void *v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  void *v779;
  void *v780;
  void *v781;
  void *v782;
  void *v783;
  void *v784;
  void *v785;
  void *v786;
  void *v787;
  void *v788;
  void *v789;
  void *v790;
  void *v791;
  void *v792;
  void *v793;
  void *v794;
  void *v795;
  int context;
  void *contexta;
  void *v798;
  void *v799;
  void *v800;
  void *v801;
  void *v802;
  void *v803;
  void *v804;
  void *v805;
  void *v806;
  void *v807;
  void *v808;
  void *v809;
  void *v810;
  void *v811;
  void *v812;
  void *v813;
  void *v814;
  void *v815;
  void *v816;
  void *v817;
  void *v818;
  void *v819;
  void *v820;
  void *v821;
  void *v822;
  void *v823;
  void *v824;
  void *v825;
  void *v826;
  unsigned int v827;
  void *v828;
  uint64_t v829;
  void *v830;
  void *v831;
  void *v832;
  void *v833;
  int v834;
  void *v835;
  void *v836;
  void *v837;
  void *v838;
  void *v839;
  void *v840;
  void *v841;
  void *v842;
  void *v843;
  void *v844;
  void *v845;
  _QWORD *v846;
  id obj;
  void *v848;
  void *v849;
  void *v850;
  void *v851;
  void *v852;
  void *v853;
  void *v854;
  void *v855;
  id v856;
  void *v857;
  id v858;
  void *v859;
  void *v860;
  void *v861;
  void *v862;
  id *v863;
  void *v864;
  id v865;
  _BYTE v866[3282];
  uint8_t v867;
  char v868[15];
  id v869;
  float v870[822];
  __int128 v871;
  __int128 v872;
  __int128 v873;
  __int128 v874;
  void *__p;
  void *v876;
  uint64_t v877;
  void *v878;
  _BYTE *v879;
  void *v880;
  _BYTE *v881;
  void *v882;
  _BYTE *v883;
  __int128 v884;
  uint64_t v885;
  id v886;
  id v887;
  id v888;
  id v889;
  int v890;
  id v891;
  id v892[413];
  uint64_t v893;
  uint64_t v894;
  _QWORD v895[19];

  MEMORY[0x1E0C80A78](self, a3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v846 = v22;
  v895[16] = *MEMORY[0x1E0C80C00];
  v731 = v23;
  v24 = v19;
  v727 = v15;
  v728 = v13;
  v858 = v11;
  v770 = a10;
  v729 = v24;
  objc_msgSend(v21[1], "recentNotifications");
  v754 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v731, "arrayByAddingObjectsFromArray:", v24);
    v761 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v761 = v731;
  }
  __atxlog_handle_app_prediction();
  v25 = objc_claimAutoreleasedReturnValue();
  v863 = v21;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v17);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v892[0]) = 138412290;
    *(id *)((char *)v892 + 4) = v26;
    _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "Evaluating app features for consumer: %@.", (uint8_t *)v892, 0xCu);

  }
  if (v770)
  {
    objc_msgSend(v770, "itemsForBundleIds:", v761);
    v27 = *((_QWORD *)&v884 + 1);
    v28 = v884;
  }
  else
  {
    v28 = 0;
    v27 = 0;
    v884 = 0uLL;
    v885 = 0;
  }
  if (0xDAB7EC1DD3431B57 * ((v27 - v28) >> 5) == objc_msgSend(v761, "count"))
  {
    __atxlog_handle_app_prediction();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v17);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v892[0]) = 138412290;
      *(id *)((char *)v892 + 4) = v30;
      _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "Found all bundleIds in the feature cache. Using the cached values for consumer: %@.", (uint8_t *)v892, 0xCu);

    }
    *(_OWORD *)v846 = v884;
    v846[2] = v885;
    v885 = 0;
    v884 = 0uLL;
    goto LABEL_132;
  }
  std::vector<ATXPredictionItem>::vector(v846, objc_msgSend(v761, "count"));
  v834 = objc_msgSend(v731, "count");
  v829 = objc_msgSend(v24, "count") + v834;
  v800 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (int)v829);
  v799 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (int)v829);
  v722 = (void *)MEMORY[0x1CAA48B6C]();
  std::vector<double>::vector(&v882, (int)v829);
  std::vector<double>::vector(&v880, (int)v829);
  std::vector<double>::vector(&v878, (int)v829);
  objc_msgSend(v21[2], "putFeedbackScoresForApps:intoScores:confirms:rejects:", v761, v882, v880, v878);
  objc_msgSend(v858, "timeContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v858, "userContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastUnlockDate");
  v752 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21[3], "histogramForLaunchType:", 0);
  v861 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 1);
  v822 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 92);
  v758 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 93);
  v757 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 11);
  v730 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 2);
  v859 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 3);
  v762 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "histogramForLaunchType:", 5);
  v798 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 4);
  v832 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 37);
  v794 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 41);
  v750 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 42);
  v833 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 43);
  v811 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 44);
  v807 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 45);
  v810 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 46);
  v806 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 47);
  v809 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 48);
  v805 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 87);
  v808 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 50);
  v831 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 51);
  v830 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 61);
  v825 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 52);
  v777 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 53);
  v776 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 54);
  v775 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 55);
  v774 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 56);
  v773 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 57);
  v804 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 58);
  v803 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 59);
  v802 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 60);
  v801 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 63);
  v821 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 64);
  v818 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 65);
  v791 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 66);
  v793 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 67);
  v789 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 68);
  v787 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 69);
  v820 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 70);
  v817 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 71);
  v790 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 72);
  v792 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 73);
  v788 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 74);
  v786 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 88);
  v819 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 75);
  v816 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 76);
  v813 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 77);
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 78);
  v785 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 79);
  v781 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 80);
  v779 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 81);
  v815 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 82);
  v812 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 83);
  v782 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 84);
  v784 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 85);
  v780 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 86);
  v778 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 89);
  v814 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21[3], "categoricalHistogramForLaunchType:", 95);
  v772 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v858, "userContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lastAppLaunch");
  v725 = (void *)objc_claimAutoreleasedReturnValue();

  if (v725)
  {
    objc_msgSend(v21[4], "launchSequenceForBundle:");
    v856 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v856 = 0;
  }
  v35 = (void *)MEMORY[0x1E0D80E00];
  objc_msgSend(v858, "locationMotionContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "getMotionStringFromMotionType:", objc_msgSend(v36, "motionType"));
  v795 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v858, "deviceStateContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v827 = objc_msgSend(v37, "onWifi");

  objc_msgSend(v858, "deviceStateContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "wifiSSID");
  v823 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v858, "deviceStateContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v755 = objc_msgSend(v39, "inAirplaneMode");

  objc_msgSend(v861, "entropy");
  v747 = v40;
  objc_msgSend(v859, "entropy");
  v746 = v41;
  objc_msgSend(v859, "entropyForDate:", v32);
  v745 = v42;
  objc_msgSend(v798, "entropy");
  v744 = v43;
  objc_msgSend(v832, "entropy");
  v743 = v44;
  objc_msgSend(v832, "entropyForCategory:", v823);
  v742 = v45;
  objc_msgSend(v858, "locationMotionContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  context = objc_msgSend(v46, "locationEnabled");

  if ((int)v829 < 1)
  {
    v50 = 0.0;
    v49 = 0.0;
    v48 = 0.0;
    v52 = v21;
  }
  else
  {
    v47 = 0;
    v48 = 0.0;
    v49 = 0.0;
    v50 = 0.0;
    v51 = v859;
    v52 = v21;
    do
    {
      objc_msgSend(v761, "objectAtIndexedSubscript:", v47);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v861, "overallLaunchPopularityForBundleId:", v53);
      v55 = v54;
      objc_msgSend(v51, "relativeLaunchPopularityWithBundleId:date:", v53, v32);
      v57 = v56;
      objc_msgSend(v798, "relativeLaunchPopularityWithBundleId:date:", v53, v32);
      v59 = v58;
      objc_msgSend(v832, "relativeLaunchPopularityWithBundleId:category:", v53, v823);
      v61 = v60;

      v48 = v48 + vabdd_f64(v55, v57);
      v49 = v49 + vabdd_f64(v55, v59);
      v50 = v50 + vabdd_f64(v55, v61);
      ++v47;
      v51 = v859;
    }
    while (v829 != v47);
  }
  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("_ATXApp2VecMapping"), CFSTR("dat"), 0);
  v876 = 0;
  __p = 0;
  v877 = 0;
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  if (v723)
  {
    v62 = -[ATXApp2VecMapping initWithPath:]([ATXApp2VecMapping alloc], "initWithPath:", v723);
    std::vector<float>::resize((uint64_t)&__p, -[ATXApp2VecMapping vectorLength](v62, "vectorLength"));
    v63 = (void *)objc_opt_class();
    v64 = __p;
    objc_msgSend(v52[4], "launchSequence");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v732 = v62;
    v741 = objc_msgSend(v63, "_predictNextAppLaunchEmbedding:into:launchSequence:", v62, v64, v65);

  }
  else
  {
    v741 = 0;
    v732 = 0;
  }
  objc_msgSend(v858, "timeContext");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v768 = objc_msgSend(v66, "dayOfWeek");

  objc_msgSend(v858, "timeContext");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v766 = objc_msgSend(v67, "timeOfDay");

  objc_msgSend(v858, "timeContext");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v764 = objc_msgSend(v68, "dateInWeekend");

  +[_ATXActionUtils stringForTimeOfDayAndDayOfWeek:timeZone:](_ATXActionUtils, "stringForTimeOfDayAndDayOfWeek:timeZone:", v32, 0);
  v826 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v858, "locationMotionContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForSpecificGeohash:](_ATXActionUtils, "stringForSpecificGeohash:", objc_msgSend(v69, "geohash"));
  v840 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v858, "locationMotionContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForCoarseGeohash:](_ATXActionUtils, "stringForCoarseGeohash:", objc_msgSend(v70, "coarseGeohash"));
  v842 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v858, "locationMotionContext");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForZoom7Geohash:](_ATXActionUtils, "stringForZoom7Geohash:", objc_msgSend(v71, "largeGeohash"));
  v756 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ATXActionUtils stringForTwoHourTimeWindow:timeZone:](_ATXActionUtils, "stringForTwoHourTimeWindow:timeZone:", v32, 0);
  v838 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForDayOfWeek:timeZone:](_ATXActionUtils, "stringForDayOfWeek:timeZone:", v32, 0);
  v836 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v858, "locationMotionContext");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForCoarseTimePOWLocation:timeZone:coarseGeohash:](_ATXActionUtils, "stringForCoarseTimePOWLocation:timeZone:coarseGeohash:", v32, 0, objc_msgSend(v72, "coarseGeohash"));
  v844 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v858, "locationMotionContext");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForSpecificTimeDOWLocation:timeZone:geohash:](_ATXActionUtils, "stringForSpecificTimeDOWLocation:timeZone:geohash:", v32, 0, objc_msgSend(v73, "geohash"));
  v837 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v863[10], "globalPopularityForBundleIdsGivenTimeDayLocationAndLastApp:context:", v761, v858);
  v753 = (void *)objc_claimAutoreleasedReturnValue();
  v848 = (void *)objc_opt_new();
  v850 = (void *)objc_opt_new();
  v854 = (void *)objc_opt_new();
  v852 = (void *)objc_opt_new();
  v874 = 0u;
  v873 = 0u;
  v872 = 0u;
  v871 = 0u;
  obj = v761;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v871, v895, 16);
  if (v74)
  {
    v75 = *(_QWORD *)v872;
    do
    {
      for (i = 0; i != v74; ++i)
      {
        if (*(_QWORD *)v872 != v75)
          objc_enumerationMutation(obj);
        v77 = *(_QWORD *)(*((_QWORD *)&v871 + 1) + 8 * i);
        v78 = (void *)MEMORY[0x1E0CB37E8];
        v79 = v863[5];
        objc_msgSend(v858, "locationMotionContext");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "currentLOI");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "numberWithInt:", objc_msgSend(v79, "launchCountAtLOI:bundleId:", v81, v77));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v854, "setObject:forKeyedSubscript:", v82, v77);

        v83 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v856, "launchCount:", v77);
        objc_msgSend(v83, "numberWithDouble:");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v852, "setObject:forKeyedSubscript:", v84, v77);

        v85 = (void *)MEMORY[0x1E0CB37E8];
        v894 = v77;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v894, 1);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v87) = 1045220557;
        objc_msgSend(v861, "totalLaunchesForBundleIds:forDate:distanceScale:", v86, v32, v87);
        objc_msgSend(v85, "numberWithDouble:");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v850, "setObject:forKeyedSubscript:", v88, v77);

        v89 = (void *)MEMORY[0x1E0CB37E8];
        v893 = v77;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v893, 1);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v91) = 1.0;
        objc_msgSend(v859, "totalLaunchesForBundleIds:forDate:distanceScale:", v90, v32, v91);
        objc_msgSend(v89, "numberWithDouble:");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v848, "setObject:forKeyedSubscript:", v92, v77);

      }
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v871, v895, 16);
    }
    while (v74);
  }

  +[ATXBlendedLocalAndGlobalScores blendedGlobalAndLocalScoresForGlobalScores:LOITypeLaunches:lastAppLaunches:timeOfDayLaunches:dayOfWeekLaunches:forApps:](ATXBlendedLocalAndGlobalScores, "blendedGlobalAndLocalScoresForGlobalScores:LOITypeLaunches:lastAppLaunches:timeOfDayLaunches:dayOfWeekLaunches:forApps:", v753, v854, v852, v850, v848, obj);
  v824 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v863[10], "globalPopularityForBundleIdsGivenTimeDayAndLocation:context:", obj, v858);
  v749 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = arc4random();
  v740 = objc_msgSend(v863[12], "launchedAppCount");
  objc_msgSend(v863[16], "currentPoiCategory");
  v771 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_opt_new();
  objc_msgSend(v94, "efficientCurrentMode");
  v95 = objc_claimAutoreleasedReturnValue();
  v96 = (void *)v95;
  v97 = CFSTR("Default");
  if (v95)
    v97 = (__CFString *)v95;
  v726 = v97;

  __atxlog_handle_app_prediction();
  v98 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    v99 = (objc_class *)objc_opt_class();
    NSStringFromClass(v99);
    v100 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v892[0]) = 138412546;
    *(id *)((char *)v892 + 4) = v100;
    WORD2(v892[1]) = 2112;
    *(id *)((char *)&v892[1] + 6) = v726;
    _os_log_impl(&dword_1C9A3B000, v98, OS_LOG_TYPE_DEFAULT, "%@ - retrieved current mode of %@ from ATXUnifiedActivityBiomeStream", (uint8_t *)v892, 0x16u);

  }
  v101 = objc_alloc(MEMORY[0x1E0CF8F58]);
  +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v724 = (void *)objc_msgSend(v101, "initWithModeEntityScorerClient:", v102);

  objc_msgSend(v724, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:", *MEMORY[0x1E0D80E70], v726, 0);
  v748 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v829 >= 1)
  {
    v103 = 0;
    v751 = 0;
    v735 = (double)v93 / 4294967300.0;
    v737 = (double)v766;
    v738 = (double)v768;
    v736 = (double)v764;
    v739 = v834;
    v733 = (double)(context ^ 1u);
    v734 = (double)v827;
    while (1)
    {
      contexta = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(obj, "objectAtIndexedSubscript:", v103);
      v828 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v770)
        break;
      objc_msgSend(v770, "itemForBundleId:", v828);
      if (!v892[0])
        goto LABEL_42;
      v104 = *v846;
      if (0xDAB7EC1DD3431B57 * ((uint64_t)(v846[1] - *v846) >> 5) <= v103)
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      objc_storeStrong((id *)(v104 + 3296 * v103), v892[0]);
      memcpy((void *)(v104 + 3296 * v103 + 8), &v892[1], 0xCD2uLL);
LABEL_114:

      objc_autoreleasePoolPop(contexta);
      if (++v103 == v829)
        goto LABEL_115;
    }
    bzero(v892, 0xCE0uLL);
LABEL_42:
    v105 = v828;
    v869 = v105;
    v870[819] = -31337.0;
    LOWORD(v870[820]) = 0;
    for (j = 4; j != 821; ++j)
      v870[j - 2] = -31337.0;
    objc_msgSend(v863[12], "appInfoForBundleId:", v105);
    v835 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_app_prediction();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      v890 = 138412290;
      v891 = v105;
      _os_log_debug_impl(&dword_1C9A3B000, v107, OS_LOG_TYPE_DEBUG, "Setting score inputs for app with BundleId: %@", (uint8_t *)&v890, 0xCu);
    }

    objc_msgSend(v835, "genreId");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108 == 0;

    if (!v109)
    {
      objc_msgSend(v835, "genreId");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v800, "setValue:forKey:", v110, v105);

    }
    objc_msgSend(v835, "app2VecCluster");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v111 == 0;

    if (!v112)
    {
      objc_msgSend(v835, "app2VecCluster");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v799, "setValue:forKey:", v113, v105);

    }
    objc_msgSend(v835, "installDate");
    v114 = objc_claimAutoreleasedReturnValue();
    if ((v114 != 0) | v751 & 1)
    {
      v115 = (void *)v114;
      if (!v114)
        goto LABEL_62;
      objc_msgSend(v858, "timeContext");
      v116 = objc_claimAutoreleasedReturnValue();
      -[NSObject date](v116, "date");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      ATXSetInputAge((uint64_t)&v869, 0, v115, v117);

      v118 = v835;
      v119 = v115;
    }
    else
    {
      if ((objc_msgSend(v105, "hasPrefix:", CFSTR("com.apple")) & 1) != 0)
      {
        v751 = 0;
        v115 = 0;
        goto LABEL_62;
      }
      objc_msgSend(v863[6], "train");
      objc_msgSend(v863[12], "appInfoForBundleId:", v105);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v118, "installDate");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      if (v119)
      {
        objc_msgSend(v858, "timeContext");
        v116 = objc_claimAutoreleasedReturnValue();
        -[NSObject date](v116, "date");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        ATXSetInputAge((uint64_t)&v869, 0, v119, v120);

      }
      else
      {
        __atxlog_handle_app_prediction();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          v890 = 138412290;
          v891 = v105;
        }
        v119 = 0;
      }
      v751 = 1;
    }

    v835 = v118;
    v115 = v119;
LABEL_62:
    v121 = 0.0;
    if ((uint64_t)v103 >= v739)
    {
      objc_msgSend(v858, "timeContext", 0.0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "date");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "dateByAddingTimeInterval:", -43200.0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v858, "timeContext");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "date");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      ATXSetInputAge((uint64_t)&v869, 0, v124, v126);

      v121 = 1.0;
    }
    ATXSetInput((uint64_t)&v869, 0x301uLL, v121);
    ATXSetInput((uint64_t)&v869, 0x6CuLL, v738);
    ATXSetInput((uint64_t)&v869, 0x6DuLL, v737);
    ATXSetInput((uint64_t)&v869, 0x6EuLL, v736);
    ATXSetInput((uint64_t)&v869, 0x161uLL, v735);
    v127 = arc4random();
    *(float *)&v128 = ATXSetInput((uint64_t)&v869, 0x162uLL, (double)v127 / 4294967300.0);
    objc_msgSend(v858, "ambientLightContext", v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "ambientLightType");

    if ((_DWORD)v130 != 7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "stringValue");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v750, "launchPopularityWithBundleId:category:", v105, v132);
      ATXSetInput((uint64_t)&v869, 0x186uLL, v133);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v130);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "stringValue");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v750, "relativeLaunchPopularityWithBundleId:category:", v105, v135);
      ATXSetInput((uint64_t)&v869, 0x185uLL, v136);

    }
    v137 = ATXDayZeroScore(v105, v863[17], v740);
    *(float *)&v138 = ATXSetInput((uint64_t)&v869, 0x21uLL, v137);
    objc_msgSend(v863[17], "objectForKeyedSubscript:", CFSTR("staticPenalties"), v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKeyedSubscript:", v105);
    v769 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v769, "doubleValue");
    *(float *)&v141 = ATXSetInput((uint64_t)&v869, 0x22uLL, v140);
    +[_ATXFeedbackConstants alphaForBundleId:](_ATXFeedbackConstants, "alphaForBundleId:", v105, v141);
    *(float *)&v143 = ATXSetInput((uint64_t)&v869, 0x166uLL, v142);
    +[_ATXFeedbackConstants betaForBundleId:](_ATXFeedbackConstants, "betaForBundleId:", v105, v143);
    *(float *)&v145 = ATXSetInput((uint64_t)&v869, 0x167uLL, v144);
    objc_msgSend(v854, "objectForKeyedSubscript:", v105, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x16AuLL, v147);

    objc_msgSend(v852, "objectForKeyedSubscript:", v105);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x16BuLL, v149);

    objc_msgSend(v850, "objectForKeyedSubscript:", v105);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x16CuLL, v151);

    objc_msgSend(v848, "objectForKeyedSubscript:", v105);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x16DuLL, v153);

    if (v753)
    {
      objc_msgSend(v753, "objectForKeyedSubscript:", v105);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x168uLL, v155);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("DayOfWeek"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "objectForKeyedSubscript:", v105);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x171uLL, v158);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("LOIType"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "objectForKeyedSubscript:", v105);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x16EuLL, v161);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("LastApp"));
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "objectForKeyedSubscript:", v105);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x16FuLL, v164);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("TimeOfDay"));
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "objectForKeyedSubscript:", v105);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x170uLL, v167);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("DayOfWeek_sampled"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "objectForKeyedSubscript:", v105);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x175uLL, v170);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("LOIType_sampled"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "objectForKeyedSubscript:", v105);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x172uLL, v173);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("LastApp_sampled"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "objectForKeyedSubscript:", v105);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x173uLL, v176);

      objc_msgSend(v824, "objectForKeyedSubscript:", CFSTR("TimeOfDay_sampled"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "objectForKeyedSubscript:", v105);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "doubleValue");
      ATXSetInput((uint64_t)&v869, 0x174uLL, v179);

    }
    objc_msgSend(v749, "objectForKeyedSubscript:", v105);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x169uLL, v181);

    objc_msgSend(v863[11], "fetchContextualAssociationScoresForBundleId:", v105);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("GeohashZoom7"));
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x29BuLL, v184);

    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("GeohashCoarse"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x29CuLL, v186);

    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("GeohashSpecific"));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x29DuLL, v188);

    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("PartOfWeek"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x29EuLL, v190);

    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("CoarseTime"));
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x29FuLL, v192);

    objc_msgSend(v182, "objectForKeyedSubscript:", CFSTR("LOIType"));
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "doubleValue");
    ATXSetInput((uint64_t)&v869, 0x2A0uLL, v194);

    objc_msgSend(v835, "lastLaunch");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v858, "timeContext");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "date");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    ATXSetInputAge((uint64_t)&v869, 2uLL, v195, v197);

    objc_msgSend(v835, "lastSpotlightLaunch");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v858, "timeContext");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "date");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    ATXSetInputAge((uint64_t)&v869, 1uLL, v198, v200);

    objc_msgSend(v835, "averageSecondsBetweenLaunches");
    v759 = (void *)objc_claimAutoreleasedReturnValue();
    if (v759)
    {
      objc_msgSend(v759, "doubleValue");
      *(float *)&v201 = ATXSetInput((uint64_t)&v869, 4uLL, v202);
    }
    objc_msgSend(v835, "medianSecondsBetweenLaunches", v201);
    v760 = (void *)objc_claimAutoreleasedReturnValue();
    if (v760)
    {
      objc_msgSend(v760, "doubleValue");
      *(float *)&v203 = ATXSetInput((uint64_t)&v869, 3uLL, v204);
    }
    if (v752)
    {
      objc_msgSend(v32, "timeIntervalSinceDate:", v752, v203);
      if (v203 >= 0.0)
      {
        HIDWORD(v205) = 1085021696;
        if (v203 >= 3600.0)
          v203 = 3599.0;
        LODWORD(v205) = 1.0;
        objc_msgSend(v730, "relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:", v105, v203, v205);
        *(float *)&v203 = ATXSetInput((uint64_t)&v869, 5uLL, v206);
      }
    }
    v207 = objc_msgSend(v863[13], "appInFolderWithBundleId:", v105, v203);
    if (v207)
      ATXSetInput((uint64_t)&v869, 7uLL, (double)objc_msgSend(v863[13], "folderPageNumberForBundleId:", v105));
    *(float *)&v208 = ATXSetInput((uint64_t)&v869, 6uLL, (double)v207);
    v209 = objc_msgSend(v863[13], "springboardPageNumberForBundleId:", v105, v208);
    v210 = 0.0;
    if (v209 != -1)
      v210 = 1.0;
    ATXSetInput((uint64_t)&v869, 8uLL, v210);
    *(float *)&v211 = ATXSetInput((uint64_t)&v869, 9uLL, (double)v209);
    if (v209 == -1)
      *(float *)&v211 = ATXSetInput((uint64_t)&v869, 9uLL, 0.0);
    *(float *)&v212 = ATXSetInput((uint64_t)&v869, 0xAuLL, (double)objc_msgSend(v863[13], "appOnDockWithBundleId:", v105, v211));
    v213 = v863[5];
    objc_msgSend(v858, "locationMotionContext", v212);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "currentLOI");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "launchProbabilityAtLOI:bundleId:", v215, v105);
    ATXSetInput((uint64_t)&v869, 0x26uLL, v216);

    objc_msgSend(v863[7], "popularityAtCurrentMicroLocationForApp:", v105);
    *(float *)&v218 = ATXSetInput((uint64_t)&v869, 0x27uLL, v217);
    objc_msgSend(v762, "overallLaunchPopularityForBundleId:", v105, v218);
    if (!v755)
      v219 = 0.0;
    ATXSetInput((uint64_t)&v869, 0x3DuLL, v219);
    v220 = 0.0;
    if (v755)
      objc_msgSend(v762, "totalLaunches", 0.0);
    *(float *)&v221 = ATXSetInput((uint64_t)&v869, 0x3EuLL, v220);
    v889 = v105;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v889, 1, v221);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v762, "totalLaunchesForBundleIds:", v222);
    ATXSetInput((uint64_t)&v869, 0x2A4uLL, v223);

    objc_msgSend(v798, "overallLaunchPopularityForBundleId:", v105);
    *(float *)&v225 = ATXSetInput((uint64_t)&v869, 0x3FuLL, v224);
    objc_msgSend(v798, "totalLaunches", v225);
    *(float *)&v227 = ATXSetInput((uint64_t)&v869, 0x40uLL, v226);
    objc_msgSend(v832, "overallLaunchPopularityForBundleId:category:", v105, v823, v227);
    *(float *)&v229 = ATXSetInput((uint64_t)&v869, 0x41uLL, v228);
    objc_msgSend(v832, "totalLaunchesForCategory:", v823, v229);
    *(float *)&v231 = ATXSetInput((uint64_t)&v869, 0x42uLL, v230);
    objc_msgSend(v832, "totalLaunchesForBundleId:category:", v105, v823, v231);
    *(float *)&v233 = ATXSetInput((uint64_t)&v869, 0x2A1uLL, v232);
    objc_msgSend(v832, "totalLaunchesForBundleId:", v105, v233);
    ATXSetInput((uint64_t)&v869, 0x2A2uLL, v234);
    *(float *)&v235 = ATXSetInput((uint64_t)&v869, 0x43uLL, v734);
    objc_msgSend(v794, "overallLaunchPopularityForBundleId:category:", v105, v795, v235);
    *(float *)&v237 = ATXSetInput((uint64_t)&v869, 0x44uLL, v236);
    objc_msgSend(v794, "totalLaunchesForCategory:", v795, v237);
    *(float *)&v239 = ATXSetInput((uint64_t)&v869, 0x45uLL, v238);
    objc_msgSend(v794, "totalLaunchesForBundleId:category:", v105, v795, v239);
    *(float *)&v241 = ATXSetInput((uint64_t)&v869, 0x2A3uLL, v240);
    objc_msgSend(v833, "overallLaunchPopularityForBundleId:category:", v105, v826, v241);
    *(float *)&v243 = ATXSetInput((uint64_t)&v869, 0x61uLL, v242);
    objc_msgSend(v833, "totalLaunchesForBundleId:category:", v105, v826, v243);
    *(float *)&v245 = ATXSetInput((uint64_t)&v869, 0x1FFuLL, v244);
    objc_msgSend(v833, "totalLaunchesForBundleId:", v105, v245);
    *(float *)&v247 = ATXSetInput((uint64_t)&v869, 0x201uLL, v246);
    objc_msgSend(v833, "relativeLaunchPopularityWithBundleId:category:", v105, v826, v247);
    *(float *)&v249 = ATXSetInput((uint64_t)&v869, 0x62uLL, v248);
    objc_msgSend(v833, "launchPopularityWithBundleId:category:", v105, v826, v249);
    *(float *)&v251 = ATXSetInput((uint64_t)&v869, 0x63uLL, v250);
    objc_msgSend(v833, "totalLaunches", v251);
    *(float *)&v253 = ATXSetInput((uint64_t)&v869, 0x64uLL, v252);
    objc_msgSend(v861, "totalLaunches", v253);
    *(float *)&v255 = ATXSetInput((uint64_t)&v869, 0x3BuLL, v254);
    objc_msgSend(v861, "launchPopularityWithBundleId:date:", v105, v32, v255);
    *(float *)&v257 = ATXSetInput((uint64_t)&v869, 0x1AuLL, v256);
    objc_msgSend(v861, "relativeLaunchPopularityWithBundleId:date:", v105, v32, v257);
    ATXSetInput((uint64_t)&v869, 0x1BuLL, v258);
    LODWORD(v259) = 1045220557;
    objc_msgSend(v861, "relativeLaunchPopularityWithBundleId:date:distanceScale:", v105, v32, v259);
    *(float *)&v261 = ATXSetInput((uint64_t)&v869, 0x1CuLL, v260);
    objc_msgSend(v861, "overallLaunchPopularityForBundleId:", v105, v261);
    *(float *)&v263 = ATXSetInput((uint64_t)&v869, 0x1DuLL, v262);
    objc_msgSend(v822, "totalLaunches", v263);
    *(float *)&v265 = ATXSetInput((uint64_t)&v869, 0x3CuLL, v264);
    objc_msgSend(v822, "launchPopularityWithBundleId:date:", v105, v32, v265);
    *(float *)&v267 = ATXSetInput((uint64_t)&v869, 0x1EuLL, v266);
    objc_msgSend(v822, "relativeLaunchPopularityWithBundleId:date:", v105, v32, v267);
    *(float *)&v269 = ATXSetInput((uint64_t)&v869, 0x1FuLL, v268);
    objc_msgSend(v822, "overallLaunchPopularityForBundleId:", v105, v269);
    *(float *)&v271 = ATXSetInput((uint64_t)&v869, 0x20uLL, v270);
    v888 = v105;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v888, 1, v271);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v758, "totalLaunchesForBundleIds:", v272);
    ATXSetInput((uint64_t)&v869, 0x2CCuLL, v273);

    objc_msgSend(v758, "totalLaunches");
    *(float *)&v275 = ATXSetInput((uint64_t)&v869, 0x2CDuLL, v274);
    v887 = v105;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v887, 1, v275);
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v757, "totalLaunchesForBundleIds:", v276);
    ATXSetInput((uint64_t)&v869, 0x2CEuLL, v277);

    objc_msgSend(v757, "totalLaunches");
    *(float *)&v279 = ATXSetInput((uint64_t)&v869, 0x2CFuLL, v278);
    objc_msgSend(v859, "launchPopularityWithBundleId:date:", v105, v32, v279);
    *(float *)&v281 = ATXSetInput((uint64_t)&v869, 0x23uLL, v280);
    objc_msgSend(v859, "relativeLaunchPopularityWithBundleId:date:", v105, v32, v281);
    *(float *)&v283 = ATXSetInput((uint64_t)&v869, 0x24uLL, v282);
    objc_msgSend(v831, "launchCountsForEachCategoryForBundleId:", v105, v283);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v284, "allValues");
    v285 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v830, "launchCountsForEachCategoryForBundleId:", v105);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "allValues");
    v765 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v825, "launchCountsForEachCategoryForBundleId:", v105);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v287, "allValues");
    v767 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v863, "setDistributionBasedScoreInputsForTimeAndDay:forBundleId:withTimeOfDayHistogram:withDayOfWeekHistogram:", &v869, v105, v861, v859);
    objc_msgSend(v863, "setDistributionBasedScoreInputsForItem:withGeoHashResolution:withGeoHashLaunchCounts:", &v869, 0, v285);
    objc_msgSend(v863, "setDistributionBasedScoreInputsForItem:withGeoHashResolution:withGeoHashLaunchCounts:", &v869, 1, v765);
    objc_msgSend(v863, "setDistributionBasedScoreInputsForItem:withGeoHashResolution:withGeoHashLaunchCounts:", &v869, 2, v767);
    *(float *)&v288 = ATXSetInput((uint64_t)&v869, 0x228uLL, (double)+[_ATXActionUtils timeBucketFromZeroToTwentyFour:timeZone:](_ATXActionUtils, "timeBucketFromZeroToTwentyFour:timeZone:", v32, 0));
    objc_msgSend(v861, "entropyForBundleId:", v105, v288);
    ATXSetInput((uint64_t)&v869, 0x1F8uLL, v289);
    LODWORD(v290) = 1.0;
    objc_msgSend(v859, "totalLaunchesForBundleIds:forDate:distanceScale:", obj, v32, v290);
    *(float *)&v292 = ATXSetInput((uint64_t)&v869, 0x1FDuLL, v291);
    v886 = v105;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v886, 1, v292);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v859, "totalLaunchesForBundleIds:", v293);
    ATXSetInput((uint64_t)&v869, 0x1FEuLL, v294);

    objc_msgSend(v833, "totalLaunchesForCategory:", v826);
    *(float *)&v296 = ATXSetInput((uint64_t)&v869, 0x200uLL, v295);
    objc_msgSend(v831, "totalLaunchesForBundleId:category:", v105, v840, v296);
    *(float *)&v298 = ATXSetInput((uint64_t)&v869, 0x1FBuLL, v297);
    objc_msgSend(v831, "totalLaunchesForBundleId:", v105, v298);
    *(float *)&v300 = ATXSetInput((uint64_t)&v869, 0x205uLL, v299);
    objc_msgSend(v831, "totalLaunchesForCategory:", v840, v300);
    *(float *)&v302 = ATXSetInput((uint64_t)&v869, 0x204uLL, v301);
    objc_msgSend(v831, "entropyForBundleId:", v105, v302);
    *(float *)&v304 = ATXSetInput((uint64_t)&v869, 0x1F9uLL, v303);
    objc_msgSend(v830, "totalLaunchesForBundleId:category:", v105, v842, v304);
    *(float *)&v306 = ATXSetInput((uint64_t)&v869, 0x1FCuLL, v305);
    objc_msgSend(v830, "totalLaunchesForBundleId:", v105, v306);
    *(float *)&v308 = ATXSetInput((uint64_t)&v869, 0x203uLL, v307);
    objc_msgSend(v830, "totalLaunchesForCategory:", v842, v308);
    *(float *)&v310 = ATXSetInput((uint64_t)&v869, 0x202uLL, v309);
    objc_msgSend(v830, "entropyForBundleId:", v105, v310);
    *(float *)&v312 = ATXSetInput((uint64_t)&v869, 0x1FAuLL, v311);
    objc_msgSend(v825, "totalLaunchesForBundleId:category:", v105, v756, v312);
    *(float *)&v314 = ATXSetInput((uint64_t)&v869, 0x28CuLL, v313);
    objc_msgSend(v825, "totalLaunchesForBundleId:", v105, v314);
    *(float *)&v316 = ATXSetInput((uint64_t)&v869, 0x28EuLL, v315);
    objc_msgSend(v825, "totalLaunchesForCategory:", v756, v316);
    *(float *)&v318 = ATXSetInput((uint64_t)&v869, 0x28DuLL, v317);
    objc_msgSend(v825, "entropyForBundleId:", v105, v318);
    *(float *)&v320 = ATXSetInput((uint64_t)&v869, 0x299uLL, v319);
    objc_msgSend(v793, "totalLaunchesForBundleId:category:", v105, v836, v320);
    *(float *)&v322 = ATXSetInput((uint64_t)&v869, 0x2A5uLL, v321);
    objc_msgSend(v793, "totalLaunchesForCategory:", v836, v322);
    *(float *)&v324 = ATXSetInput((uint64_t)&v869, 0x2A6uLL, v323);
    objc_msgSend(v793, "totalLaunchesForBundleId:", v105, v324);
    *(float *)&v326 = ATXSetInput((uint64_t)&v869, 0x2A7uLL, v325);
    objc_msgSend(v792, "totalLaunchesForBundleId:category:", v105, v836, v326);
    *(float *)&v328 = ATXSetInput((uint64_t)&v869, 0x2A8uLL, v327);
    objc_msgSend(v792, "totalLaunchesForCategory:", v836, v328);
    *(float *)&v330 = ATXSetInput((uint64_t)&v869, 0x2A9uLL, v329);
    objc_msgSend(v792, "totalLaunchesForBundleId:", v105, v330);
    *(float *)&v332 = ATXSetInput((uint64_t)&v869, 0x2AAuLL, v331);
    objc_msgSend(v791, "totalLaunchesForBundleId:category:", v105, v838, v332);
    *(float *)&v334 = ATXSetInput((uint64_t)&v869, 0x2ABuLL, v333);
    objc_msgSend(v791, "totalLaunchesForCategory:", v838, v334);
    *(float *)&v336 = ATXSetInput((uint64_t)&v869, 0x2ACuLL, v335);
    objc_msgSend(v791, "totalLaunchesForBundleId:", v105, v336);
    *(float *)&v338 = ATXSetInput((uint64_t)&v869, 0x2ADuLL, v337);
    objc_msgSend(v790, "totalLaunchesForBundleId:category:", v105, v838, v338);
    *(float *)&v340 = ATXSetInput((uint64_t)&v869, 0x2AEuLL, v339);
    objc_msgSend(v790, "totalLaunchesForCategory:", v838, v340);
    *(float *)&v342 = ATXSetInput((uint64_t)&v869, 0x2AFuLL, v341);
    objc_msgSend(v790, "totalLaunchesForBundleId:", v105, v342);
    *(float *)&v344 = ATXSetInput((uint64_t)&v869, 0x2B0uLL, v343);
    objc_msgSend(v789, "totalLaunchesForBundleId:category:", v105, v842, v344);
    *(float *)&v346 = ATXSetInput((uint64_t)&v869, 0x2B1uLL, v345);
    objc_msgSend(v789, "totalLaunchesForCategory:", v842, v346);
    *(float *)&v348 = ATXSetInput((uint64_t)&v869, 0x2B2uLL, v347);
    objc_msgSend(v789, "totalLaunchesForBundleId:", v105, v348);
    *(float *)&v350 = ATXSetInput((uint64_t)&v869, 0x2B3uLL, v349);
    objc_msgSend(v788, "totalLaunchesForBundleId:category:", v105, v842, v350);
    *(float *)&v352 = ATXSetInput((uint64_t)&v869, 0x2B4uLL, v351);
    objc_msgSend(v788, "totalLaunchesForCategory:", v842, v352);
    *(float *)&v354 = ATXSetInput((uint64_t)&v869, 0x2B5uLL, v353);
    objc_msgSend(v788, "totalLaunchesForBundleId:", v105, v354);
    *(float *)&v356 = ATXSetInput((uint64_t)&v869, 0x2B6uLL, v355);
    objc_msgSend(v787, "totalLaunchesForBundleId:category:", v105, v840, v356);
    *(float *)&v358 = ATXSetInput((uint64_t)&v869, 0x2B7uLL, v357);
    objc_msgSend(v787, "totalLaunchesForCategory:", v840, v358);
    *(float *)&v360 = ATXSetInput((uint64_t)&v869, 0x2B8uLL, v359);
    objc_msgSend(v787, "totalLaunchesForBundleId:", v105, v360);
    *(float *)&v362 = ATXSetInput((uint64_t)&v869, 0x2B9uLL, v361);
    objc_msgSend(v786, "totalLaunchesForBundleId:category:", v105, v840, v362);
    *(float *)&v364 = ATXSetInput((uint64_t)&v869, 0x2BAuLL, v363);
    objc_msgSend(v786, "totalLaunchesForCategory:", v840, v364);
    *(float *)&v366 = ATXSetInput((uint64_t)&v869, 0x2BBuLL, v365);
    objc_msgSend(v786, "totalLaunchesForBundleId:", v105, v366);
    *(float *)&v368 = ATXSetInput((uint64_t)&v869, 0x2BCuLL, v367);
    objc_msgSend(v821, "totalLaunchesForBundleId:category:", v105, v844, v368);
    *(float *)&v370 = ATXSetInput((uint64_t)&v869, 0x2BDuLL, v369);
    objc_msgSend(v821, "totalLaunchesForCategory:", v844, v370);
    *(float *)&v372 = ATXSetInput((uint64_t)&v869, 0x2BEuLL, v371);
    objc_msgSend(v821, "totalLaunchesForBundleId:", v105, v372);
    *(float *)&v374 = ATXSetInput((uint64_t)&v869, 0x2BFuLL, v373);
    objc_msgSend(v820, "totalLaunchesForBundleId:category:", v105, v844, v374);
    *(float *)&v376 = ATXSetInput((uint64_t)&v869, 0x2C0uLL, v375);
    objc_msgSend(v820, "totalLaunchesForCategory:", v844, v376);
    *(float *)&v378 = ATXSetInput((uint64_t)&v869, 0x2C1uLL, v377);
    objc_msgSend(v820, "totalLaunchesForBundleId:", v105, v378);
    *(float *)&v380 = ATXSetInput((uint64_t)&v869, 0x2C2uLL, v379);
    objc_msgSend(v819, "totalLaunchesForBundleId:category:", v105, v844, v380);
    *(float *)&v382 = ATXSetInput((uint64_t)&v869, 0x2C3uLL, v381);
    objc_msgSend(v819, "totalLaunchesForCategory:", v844, v382);
    *(float *)&v384 = ATXSetInput((uint64_t)&v869, 0x2C4uLL, v383);
    objc_msgSend(v819, "totalLaunchesForBundleId:", v105, v384);
    *(float *)&v386 = ATXSetInput((uint64_t)&v869, 0x2C5uLL, v385);
    objc_msgSend(v818, "totalLaunchesForBundleId:category:", v105, v837, v386);
    *(float *)&v388 = ATXSetInput((uint64_t)&v869, 0x2C6uLL, v387);
    objc_msgSend(v818, "totalLaunchesForCategory:", v837, v388);
    *(float *)&v390 = ATXSetInput((uint64_t)&v869, 0x2C7uLL, v389);
    objc_msgSend(v818, "totalLaunchesForBundleId:", v105, v390);
    *(float *)&v392 = ATXSetInput((uint64_t)&v869, 0x2C8uLL, v391);
    objc_msgSend(v817, "totalLaunchesForBundleId:category:", v105, v837, v392);
    *(float *)&v394 = ATXSetInput((uint64_t)&v869, 0x2C9uLL, v393);
    objc_msgSend(v817, "totalLaunchesForCategory:", v837, v394);
    *(float *)&v396 = ATXSetInput((uint64_t)&v869, 0x2CAuLL, v395);
    objc_msgSend(v817, "totalLaunchesForBundleId:", v105, v396);
    *(float *)&v398 = ATXSetInput((uint64_t)&v869, 0x2CBuLL, v397);
    objc_msgSend(v785, "totalLaunchesForBundleId:category:", v105, v836, v398);
    *(float *)&v400 = ATXSetInput((uint64_t)&v869, 0x2D0uLL, v399);
    objc_msgSend(v785, "totalLaunchesForCategory:", v836, v400);
    *(float *)&v402 = ATXSetInput((uint64_t)&v869, 0x2D1uLL, v401);
    objc_msgSend(v785, "totalLaunchesForBundleId:", v105, v402);
    *(float *)&v404 = ATXSetInput((uint64_t)&v869, 0x2D2uLL, v403);
    objc_msgSend(v784, "totalLaunchesForBundleId:category:", v105, v836, v404);
    *(float *)&v406 = ATXSetInput((uint64_t)&v869, 0x2D3uLL, v405);
    objc_msgSend(v784, "totalLaunchesForCategory:", v836, v406);
    *(float *)&v408 = ATXSetInput((uint64_t)&v869, 0x2D4uLL, v407);
    objc_msgSend(v784, "totalLaunchesForBundleId:", v105, v408);
    *(float *)&v410 = ATXSetInput((uint64_t)&v869, 0x2D5uLL, v409);
    objc_msgSend(v783, "totalLaunchesForBundleId:category:", v105, v838, v410);
    *(float *)&v412 = ATXSetInput((uint64_t)&v869, 0x2D6uLL, v411);
    objc_msgSend(v783, "totalLaunchesForCategory:", v838, v412);
    *(float *)&v414 = ATXSetInput((uint64_t)&v869, 0x2D7uLL, v413);
    objc_msgSend(v783, "totalLaunchesForBundleId:", v105, v414);
    *(float *)&v416 = ATXSetInput((uint64_t)&v869, 0x2D8uLL, v415);
    objc_msgSend(v782, "totalLaunchesForBundleId:category:", v105, v838, v416);
    *(float *)&v418 = ATXSetInput((uint64_t)&v869, 0x2D9uLL, v417);
    objc_msgSend(v782, "totalLaunchesForCategory:", v838, v418);
    *(float *)&v420 = ATXSetInput((uint64_t)&v869, 0x2DAuLL, v419);
    objc_msgSend(v782, "totalLaunchesForBundleId:", v105, v420);
    *(float *)&v422 = ATXSetInput((uint64_t)&v869, 0x2DBuLL, v421);
    objc_msgSend(v781, "totalLaunchesForBundleId:category:", v105, v842, v422);
    *(float *)&v424 = ATXSetInput((uint64_t)&v869, 0x2DCuLL, v423);
    objc_msgSend(v781, "totalLaunchesForCategory:", v842, v424);
    *(float *)&v426 = ATXSetInput((uint64_t)&v869, 0x2DDuLL, v425);
    objc_msgSend(v781, "totalLaunchesForBundleId:", v105, v426);
    *(float *)&v428 = ATXSetInput((uint64_t)&v869, 0x2DEuLL, v427);
    objc_msgSend(v780, "totalLaunchesForBundleId:category:", v105, v842, v428);
    *(float *)&v430 = ATXSetInput((uint64_t)&v869, 0x2DFuLL, v429);
    objc_msgSend(v780, "totalLaunchesForCategory:", v842, v430);
    *(float *)&v432 = ATXSetInput((uint64_t)&v869, 0x2E0uLL, v431);
    objc_msgSend(v780, "totalLaunchesForBundleId:", v105, v432);
    *(float *)&v434 = ATXSetInput((uint64_t)&v869, 0x2E1uLL, v433);
    objc_msgSend(v779, "totalLaunchesForBundleId:category:", v105, v840, v434);
    *(float *)&v436 = ATXSetInput((uint64_t)&v869, 0x2E2uLL, v435);
    objc_msgSend(v779, "totalLaunchesForCategory:", v840, v436);
    *(float *)&v438 = ATXSetInput((uint64_t)&v869, 0x2E3uLL, v437);
    objc_msgSend(v779, "totalLaunchesForBundleId:", v105, v438);
    *(float *)&v440 = ATXSetInput((uint64_t)&v869, 0x2E4uLL, v439);
    objc_msgSend(v778, "totalLaunchesForBundleId:category:", v105, v840, v440);
    *(float *)&v442 = ATXSetInput((uint64_t)&v869, 0x2E5uLL, v441);
    objc_msgSend(v778, "totalLaunchesForCategory:", v840, v442);
    *(float *)&v444 = ATXSetInput((uint64_t)&v869, 0x2E6uLL, v443);
    objc_msgSend(v778, "totalLaunchesForBundleId:", v105, v444);
    *(float *)&v446 = ATXSetInput((uint64_t)&v869, 0x2E7uLL, v445);
    objc_msgSend(v816, "totalLaunchesForBundleId:category:", v105, v844, v446);
    *(float *)&v448 = ATXSetInput((uint64_t)&v869, 0x2E8uLL, v447);
    objc_msgSend(v816, "totalLaunchesForCategory:", v844, v448);
    *(float *)&v450 = ATXSetInput((uint64_t)&v869, 0x2E9uLL, v449);
    objc_msgSend(v816, "totalLaunchesForBundleId:", v105, v450);
    *(float *)&v452 = ATXSetInput((uint64_t)&v869, 0x2EAuLL, v451);
    objc_msgSend(v815, "totalLaunchesForBundleId:category:", v105, v844, v452);
    *(float *)&v454 = ATXSetInput((uint64_t)&v869, 0x2EBuLL, v453);
    objc_msgSend(v815, "totalLaunchesForCategory:", v844, v454);
    *(float *)&v456 = ATXSetInput((uint64_t)&v869, 0x2ECuLL, v455);
    objc_msgSend(v815, "totalLaunchesForBundleId:", v105, v456);
    *(float *)&v458 = ATXSetInput((uint64_t)&v869, 0x2EDuLL, v457);
    objc_msgSend(v814, "totalLaunchesForBundleId:category:", v105, v844, v458);
    *(float *)&v460 = ATXSetInput((uint64_t)&v869, 0x2EEuLL, v459);
    objc_msgSend(v814, "totalLaunchesForCategory:", v844, v460);
    *(float *)&v462 = ATXSetInput((uint64_t)&v869, 0x2EFuLL, v461);
    objc_msgSend(v814, "totalLaunchesForBundleId:", v105, v462);
    *(float *)&v464 = ATXSetInput((uint64_t)&v869, 0x2F0uLL, v463);
    objc_msgSend(v813, "totalLaunchesForBundleId:category:", v105, v837, v464);
    *(float *)&v466 = ATXSetInput((uint64_t)&v869, 0x2F1uLL, v465);
    objc_msgSend(v813, "totalLaunchesForCategory:", v837, v466);
    *(float *)&v468 = ATXSetInput((uint64_t)&v869, 0x2F2uLL, v467);
    objc_msgSend(v813, "totalLaunchesForBundleId:", v105, v468);
    *(float *)&v470 = ATXSetInput((uint64_t)&v869, 0x2F3uLL, v469);
    objc_msgSend(v812, "totalLaunchesForBundleId:category:", v105, v837, v470);
    *(float *)&v472 = ATXSetInput((uint64_t)&v869, 0x2F4uLL, v471);
    objc_msgSend(v812, "totalLaunchesForCategory:", v837, v472);
    *(float *)&v474 = ATXSetInput((uint64_t)&v869, 0x2F5uLL, v473);
    objc_msgSend(v812, "totalLaunchesForBundleId:", v105, v474);
    *(float *)&v476 = ATXSetInput((uint64_t)&v869, 0x2F6uLL, v475);
    objc_msgSend(v821, "totalLaunches", v476);
    *(float *)&v478 = ATXSetInput((uint64_t)&v869, 0x2F7uLL, v477);
    objc_msgSend(v818, "totalLaunches", v478);
    *(float *)&v480 = ATXSetInput((uint64_t)&v869, 0x2F8uLL, v479);
    objc_msgSend(v820, "totalLaunches", v480);
    *(float *)&v482 = ATXSetInput((uint64_t)&v869, 0x2F9uLL, v481);
    objc_msgSend(v817, "totalLaunches", v482);
    *(float *)&v484 = ATXSetInput((uint64_t)&v869, 0x2FAuLL, v483);
    objc_msgSend(v819, "totalLaunches", v484);
    *(float *)&v486 = ATXSetInput((uint64_t)&v869, 0x2FBuLL, v485);
    objc_msgSend(v816, "totalLaunches", v486);
    *(float *)&v488 = ATXSetInput((uint64_t)&v869, 0x2FCuLL, v487);
    objc_msgSend(v813, "totalLaunches", v488);
    *(float *)&v490 = ATXSetInput((uint64_t)&v869, 0x2FDuLL, v489);
    objc_msgSend(v815, "totalLaunches", v490);
    *(float *)&v492 = ATXSetInput((uint64_t)&v869, 0x2FEuLL, v491);
    objc_msgSend(v812, "totalLaunches", v492);
    *(float *)&v494 = ATXSetInput((uint64_t)&v869, 0x2FFuLL, v493);
    objc_msgSend(v814, "totalLaunches", v494);
    *(float *)&v496 = ATXSetInput((uint64_t)&v869, 0x300uLL, v495);
    objc_msgSend(v831, "totalLaunches", v496);
    *(float *)&v498 = ATXSetInput((uint64_t)&v869, 0x207uLL, v497);
    objc_msgSend(v830, "totalLaunches", v498);
    ATXSetInput((uint64_t)&v869, 0x206uLL, v499);
    *(float *)&v500 = ATXSetInput((uint64_t)&v869, 0x208uLL, v733);
    if (v856)
    {
      objc_msgSend(v856, "likelihoodForLaunch:", v105, v500);
      ATXSetInput((uint64_t)&v869, 0x25uLL, v501);
    }
    ATXSetInput((uint64_t)&v869, 0x28uLL, v747);
    ATXSetInput((uint64_t)&v869, 0x29uLL, v746);
    *(float *)&v502 = ATXSetInput((uint64_t)&v869, 0x2AuLL, v745);
    objc_msgSend(v859, "entropyForBundleId:", v105, v502);
    ATXSetInput((uint64_t)&v869, 0x2BuLL, v503);
    ATXSetInput((uint64_t)&v869, 0x2CuLL, v48);
    ATXSetInput((uint64_t)&v869, 0x2DuLL, v744);
    ATXSetInput((uint64_t)&v869, 0x2EuLL, v49);
    ATXSetInput((uint64_t)&v869, 0x2FuLL, v743);
    *(float *)&v504 = ATXSetInput((uint64_t)&v869, 0x30uLL, v742);
    objc_msgSend(v832, "entropyForBundleId:", v105, v504);
    ATXSetInput((uint64_t)&v869, 0x31uLL, v505);
    ATXSetInput((uint64_t)&v869, 0x32uLL, v50);
    ATXSetInput((uint64_t)&v869, 0x33uLL, (double)(int)v829);
    v506 = -1.0;
    if (v741)
      objc_msgSend((id)objc_opt_class(), "_computeL2DistanceFromBundleId:to:app2vecMapping:", v105, __p, v732);
    *(float *)&v507 = ATXSetInput((uint64_t)&v869, 0x34uLL, v506);
    *(float *)&v508 = ATXSetInput((uint64_t)&v869, 0x60uLL, (double)objc_msgSend(v863[8], "appSupportsMedia:", v105, v507));
    objc_msgSend(v754, "objectForKeyedSubscript:", v105, v508);
    v509 = (void *)objc_claimAutoreleasedReturnValue();
    v510 = v509 == 0;

    if (!v510)
    {
      v511 = (void *)objc_opt_class();
      objc_msgSend(v754, "objectForKeyedSubscript:", v105);
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "timeIntervalSinceNow");
      objc_msgSend(v511, "time:toAccuracyInSeconds:", -v513, 0.1);
      ATXSetInput((uint64_t)&v869, 0x4DuLL, v514);

    }
    objc_msgSend(v863[14], "predictionsForBundleId:", v105);
    v515 = (void *)objc_claimAutoreleasedReturnValue();
    if (v515)
    {
      v516 = v515;
      if (objc_msgSend(v515, "predictionSource") == 2)
      {
        objc_msgSend(v516, "confidence");
        *(float *)&v518 = ATXSetInput((uint64_t)&v869, 0x46uLL, v517);
        *(float *)&v519 = ATXSetInput((uint64_t)&v869, 0x47uLL, (double)objc_msgSend(v516, "pmmReason", v518));
        *(float *)&v520 = ATXSetInput((uint64_t)&v869, 0x48uLL, (double)objc_msgSend(v516, "anchorType", v519));
        v521 = objc_msgSend(v516, "predictionIndex", v520);
LABEL_101:
        *(float *)&v523 = ATXSetInput((uint64_t)&v869, 0x4BuLL, (double)v521);
        *(float *)&v524 = ATXSetInput((uint64_t)&v869, 0x4CuLL, (double)(unint64_t)objc_msgSend(v863[14], "mmPredictionCount", v523));
        objc_msgSend(v863[9], "getCurrentDoseForApp:", v105, v524);
        v526 = v525;
        *(float *)&v527 = ATXSetInput((uint64_t)&v869, 0x38uLL, v525);
        objc_msgSend(v863[9], "getDoseForApp:", v105, v527);
        v528 = (void *)objc_claimAutoreleasedReturnValue();
        if (v528)
        {
          v529 = v528;
          objc_msgSend(v528, "movingAverage");
          *(float *)&v531 = ATXSetInput((uint64_t)&v869, 0x37uLL, v530);
          objc_msgSend(v529, "movingError", v531);
          *(float *)&v533 = ATXSetInput((uint64_t)&v869, 0x3AuLL, v532);
          objc_msgSend(v529, "movingAverage", v533);
          ATXSetInput((uint64_t)&v869, 0x39uLL, v534 - v526);
        }
        else
        {
          v529 = 0;
          __atxlog_handle_app_prediction();
          v535 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v535, OS_LOG_TYPE_DEBUG))
          {
            v890 = 138412290;
            v891 = v105;
            _os_log_debug_impl(&dword_1C9A3B000, v535, OS_LOG_TYPE_DEBUG, "[DailyDose]:can not find historical dose for: %@", (uint8_t *)&v890, 0xCu);
          }

        }
        if (v103 >= (v883 - (_BYTE *)v882) >> 3
          || (ATXSetInput((uint64_t)&v869, 0xBuLL, *((double *)v882 + v103)), v103 >= (v881 - (_BYTE *)v880) >> 3)
          || (ATXSetInput((uint64_t)&v869, 0xCuLL, *((double *)v880 + v103)), v103 >= (v879 - (_BYTE *)v878) >> 3))
        {
          std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
        }
        *(float *)&v536 = ATXSetInput((uint64_t)&v869, 0xDuLL, *((double *)v878 + v103));
        objc_msgSend(v863[18], "objectForKeyedSubscript:", CFSTR("appCategories"), v536);
        v537 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v537, "objectForKeyedSubscript:", v105);
        v763 = (void *)objc_claimAutoreleasedReturnValue();

        *(float *)&v538 = ATXSetInput((uint64_t)&v869, 0x84uLL, (double)(int)objc_msgSend(v763, "intValue"));
        objc_msgSend(v811, "totalLaunchesForBundleId:category:", v105, v844, v538);
        *(float *)&v540 = ATXSetInput((uint64_t)&v869, 0x189uLL, v539);
        objc_msgSend(v811, "totalLaunchesForCategory:", v844, v540);
        *(float *)&v542 = ATXSetInput((uint64_t)&v869, 0x18AuLL, v541);
        objc_msgSend(v811, "totalLaunchesForBundleId:", v105, v542);
        *(float *)&v544 = ATXSetInput((uint64_t)&v869, 0x18BuLL, v543);
        objc_msgSend(v811, "totalLaunches", v544);
        *(float *)&v546 = ATXSetInput((uint64_t)&v869, 0x18CuLL, v545);
        objc_msgSend(v810, "totalLaunchesForBundleId:category:", v105, v844, v546);
        *(float *)&v548 = ATXSetInput((uint64_t)&v869, 0x18DuLL, v547);
        objc_msgSend(v810, "totalLaunchesForCategory:", v844, v548);
        *(float *)&v550 = ATXSetInput((uint64_t)&v869, 0x18EuLL, v549);
        objc_msgSend(v810, "totalLaunchesForBundleId:", v105, v550);
        *(float *)&v552 = ATXSetInput((uint64_t)&v869, 0x18FuLL, v551);
        objc_msgSend(v810, "totalLaunches", v552);
        *(float *)&v554 = ATXSetInput((uint64_t)&v869, 0x190uLL, v553);
        objc_msgSend(v809, "totalLaunchesForBundleId:category:", v105, v844, v554);
        *(float *)&v556 = ATXSetInput((uint64_t)&v869, 0x191uLL, v555);
        objc_msgSend(v809, "totalLaunchesForCategory:", v844, v556);
        *(float *)&v558 = ATXSetInput((uint64_t)&v869, 0x192uLL, v557);
        objc_msgSend(v809, "totalLaunchesForBundleId:", v105, v558);
        *(float *)&v560 = ATXSetInput((uint64_t)&v869, 0x193uLL, v559);
        objc_msgSend(v809, "totalLaunches", v560);
        *(float *)&v562 = ATXSetInput((uint64_t)&v869, 0x194uLL, v561);
        objc_msgSend(v808, "totalLaunchesForBundleId:category:", v105, v844, v562);
        *(float *)&v564 = ATXSetInput((uint64_t)&v869, 0x195uLL, v563);
        objc_msgSend(v808, "totalLaunchesForCategory:", v844, v564);
        *(float *)&v566 = ATXSetInput((uint64_t)&v869, 0x196uLL, v565);
        objc_msgSend(v808, "totalLaunchesForBundleId:", v105, v566);
        *(float *)&v568 = ATXSetInput((uint64_t)&v869, 0x197uLL, v567);
        objc_msgSend(v808, "totalLaunches", v568);
        *(float *)&v570 = ATXSetInput((uint64_t)&v869, 0x198uLL, v569);
        objc_msgSend(v807, "totalLaunchesForBundleId:category:", v105, v837, v570);
        *(float *)&v572 = ATXSetInput((uint64_t)&v869, 0x199uLL, v571);
        objc_msgSend(v807, "totalLaunchesForCategory:", v837, v572);
        *(float *)&v574 = ATXSetInput((uint64_t)&v869, 0x19AuLL, v573);
        objc_msgSend(v807, "totalLaunchesForBundleId:", v105, v574);
        *(float *)&v576 = ATXSetInput((uint64_t)&v869, 0x19BuLL, v575);
        objc_msgSend(v807, "totalLaunches", v576);
        *(float *)&v578 = ATXSetInput((uint64_t)&v869, 0x19CuLL, v577);
        objc_msgSend(v806, "totalLaunchesForBundleId:category:", v105, v837, v578);
        *(float *)&v580 = ATXSetInput((uint64_t)&v869, 0x19DuLL, v579);
        objc_msgSend(v806, "totalLaunchesForCategory:", v837, v580);
        *(float *)&v582 = ATXSetInput((uint64_t)&v869, 0x19EuLL, v581);
        objc_msgSend(v806, "totalLaunchesForBundleId:", v105, v582);
        *(float *)&v584 = ATXSetInput((uint64_t)&v869, 0x19FuLL, v583);
        objc_msgSend(v806, "totalLaunches", v584);
        *(float *)&v586 = ATXSetInput((uint64_t)&v869, 0x1A0uLL, v585);
        objc_msgSend(v805, "totalLaunchesForBundleId:category:", v105, v837, v586);
        *(float *)&v588 = ATXSetInput((uint64_t)&v869, 0x1A1uLL, v587);
        objc_msgSend(v805, "totalLaunchesForCategory:", v837, v588);
        *(float *)&v590 = ATXSetInput((uint64_t)&v869, 0x1A2uLL, v589);
        objc_msgSend(v805, "totalLaunchesForBundleId:", v105, v590);
        *(float *)&v592 = ATXSetInput((uint64_t)&v869, 0x1A3uLL, v591);
        objc_msgSend(v805, "totalLaunches", v592);
        *(float *)&v594 = ATXSetInput((uint64_t)&v869, 0x1A4uLL, v593);
        objc_msgSend(v777, "totalLaunchesForBundleId:category:", v105, v838, v594);
        *(float *)&v596 = ATXSetInput((uint64_t)&v869, 0x209uLL, v595);
        objc_msgSend(v777, "totalLaunchesForCategory:", v838, v596);
        *(float *)&v598 = ATXSetInput((uint64_t)&v869, 0x20AuLL, v597);
        objc_msgSend(v777, "totalLaunchesForBundleId:", v105, v598);
        *(float *)&v600 = ATXSetInput((uint64_t)&v869, 0x20BuLL, v599);
        objc_msgSend(v776, "totalLaunchesForBundleId:category:", v105, v838, v600);
        *(float *)&v602 = ATXSetInput((uint64_t)&v869, 0x20CuLL, v601);
        objc_msgSend(v776, "totalLaunchesForCategory:", v838, v602);
        *(float *)&v604 = ATXSetInput((uint64_t)&v869, 0x20DuLL, v603);
        objc_msgSend(v776, "totalLaunchesForBundleId:", v105, v604);
        *(float *)&v606 = ATXSetInput((uint64_t)&v869, 0x20EuLL, v605);
        objc_msgSend(v775, "totalLaunchesForBundleId:category:", v105, v838, v606);
        *(float *)&v608 = ATXSetInput((uint64_t)&v869, 0x20FuLL, v607);
        objc_msgSend(v775, "totalLaunchesForCategory:", v838, v608);
        *(float *)&v610 = ATXSetInput((uint64_t)&v869, 0x210uLL, v609);
        objc_msgSend(v775, "totalLaunchesForBundleId:", v105, v610);
        *(float *)&v612 = ATXSetInput((uint64_t)&v869, 0x211uLL, v611);
        objc_msgSend(v774, "totalLaunchesForBundleId:category:", v105, v836, v612);
        *(float *)&v614 = ATXSetInput((uint64_t)&v869, 0x212uLL, v613);
        objc_msgSend(v774, "totalLaunchesForCategory:", v836, v614);
        *(float *)&v616 = ATXSetInput((uint64_t)&v869, 0x213uLL, v615);
        objc_msgSend(v774, "totalLaunchesForBundleId:", v105, v616);
        *(float *)&v618 = ATXSetInput((uint64_t)&v869, 0x214uLL, v617);
        objc_msgSend(v773, "totalLaunchesForBundleId:category:", v105, v836, v618);
        *(float *)&v620 = ATXSetInput((uint64_t)&v869, 0x215uLL, v619);
        objc_msgSend(v773, "totalLaunchesForCategory:", v836, v620);
        *(float *)&v622 = ATXSetInput((uint64_t)&v869, 0x216uLL, v621);
        objc_msgSend(v773, "totalLaunchesForBundleId:", v105, v622);
        *(float *)&v624 = ATXSetInput((uint64_t)&v869, 0x217uLL, v623);
        objc_msgSend(v804, "totalLaunchesForBundleId:category:", v105, v842, v624);
        *(float *)&v626 = ATXSetInput((uint64_t)&v869, 0x218uLL, v625);
        objc_msgSend(v804, "totalLaunchesForCategory:", v842, v626);
        *(float *)&v628 = ATXSetInput((uint64_t)&v869, 0x219uLL, v627);
        objc_msgSend(v804, "totalLaunchesForBundleId:", v105, v628);
        *(float *)&v630 = ATXSetInput((uint64_t)&v869, 0x21AuLL, v629);
        objc_msgSend(v803, "totalLaunchesForBundleId:category:", v105, v842, v630);
        *(float *)&v632 = ATXSetInput((uint64_t)&v869, 0x21BuLL, v631);
        objc_msgSend(v803, "totalLaunchesForCategory:", v842, v632);
        *(float *)&v634 = ATXSetInput((uint64_t)&v869, 0x21CuLL, v633);
        objc_msgSend(v803, "totalLaunchesForBundleId:", v105, v634);
        *(float *)&v636 = ATXSetInput((uint64_t)&v869, 0x21DuLL, v635);
        objc_msgSend(v802, "totalLaunchesForBundleId:category:", v105, v840, v636);
        *(float *)&v638 = ATXSetInput((uint64_t)&v869, 0x21EuLL, v637);
        objc_msgSend(v802, "totalLaunchesForCategory:", v840, v638);
        *(float *)&v640 = ATXSetInput((uint64_t)&v869, 0x21FuLL, v639);
        objc_msgSend(v802, "totalLaunchesForBundleId:", v105, v640);
        *(float *)&v642 = ATXSetInput((uint64_t)&v869, 0x220uLL, v641);
        objc_msgSend(v801, "totalLaunchesForBundleId:category:", v105, v840, v642);
        *(float *)&v644 = ATXSetInput((uint64_t)&v869, 0x221uLL, v643);
        objc_msgSend(v801, "totalLaunchesForCategory:", v840, v644);
        *(float *)&v646 = ATXSetInput((uint64_t)&v869, 0x222uLL, v645);
        objc_msgSend(v801, "totalLaunchesForBundleId:", v105, v646);
        *(float *)&v648 = ATXSetInput((uint64_t)&v869, 0x223uLL, v647);
        objc_msgSend(v804, "totalLaunches", v648);
        *(float *)&v650 = ATXSetInput((uint64_t)&v869, 0x224uLL, v649);
        objc_msgSend(v802, "totalLaunches", v650);
        *(float *)&v652 = ATXSetInput((uint64_t)&v869, 0x225uLL, v651);
        objc_msgSend(v803, "totalLaunches", v652);
        *(float *)&v654 = ATXSetInput((uint64_t)&v869, 0x226uLL, v653);
        objc_msgSend(v801, "totalLaunches", v654);
        *(float *)&v656 = ATXSetInput((uint64_t)&v869, 0x227uLL, v655);
        objc_msgSend(v772, "launchPopularityWithBundleId:category:", v105, v771, v656);
        *(float *)&v658 = ATXSetInput((uint64_t)&v869, 0x326uLL, v657);
        objc_msgSend(v772, "relativeLaunchPopularityWithBundleId:category:", v105, v771, v658);
        *(float *)&v660 = ATXSetInput((uint64_t)&v869, 0x327uLL, v659);
        objc_msgSend(v772, "totalLaunchesForBundleId:category:", v105, v771, v660);
        *(float *)&v662 = ATXSetInput((uint64_t)&v869, 0x329uLL, v661);
        objc_msgSend(v863, "setModeAffinityScores:appModeEntityScores:", &v869, v748, v662);
        v663 = v869;
        v865 = v663;
        memcpy(v866, v870, sizeof(v866));
        if (v770)
          objc_msgSend(v770, "addItem:forBundleId:", &v865, v105);
        else

        v664 = *v846;
        if (0xDAB7EC1DD3431B57 * ((uint64_t)(v846[1] - *v846) >> 5) <= v103)
          std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
        objc_storeStrong((id *)(v664 + 3296 * v103), v869);
        memcpy((void *)(v664 + 3296 * v103 + 8), v870, 0xCD2uLL);

        goto LABEL_114;
      }
      __atxlog_handle_pmm();
      v522 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v522, OS_LOG_TYPE_ERROR))
        -[ATXAppFeaturizer evaluateFeaturesForApps:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:].cold.1(&v867, v868, v522);

    }
    else
    {
      v516 = 0;
    }
    v521 = 0x7FFFLL;
    goto LABEL_101;
  }
LABEL_115:

  if (__p)
  {
    v876 = __p;
    operator delete(__p);
  }

  if (v878)
  {
    v879 = v878;
    operator delete(v878);
  }
  if (v880)
  {
    v881 = v880;
    operator delete(v880);
  }
  if (v882)
  {
    v883 = v882;
    operator delete(v882);
  }
  objc_autoreleasePoolPop(v722);
  v665 = (void *)objc_opt_new();
  v841 = v665;
  v864 = (void *)objc_opt_new();
  v862 = (void *)objc_opt_new();
  v860 = (void *)objc_opt_new();
  v857 = (void *)objc_opt_new();
  v855 = (void *)objc_opt_new();
  v853 = (void *)objc_opt_new();
  v851 = (void *)objc_opt_new();
  v849 = (void *)objc_opt_new();
  v845 = (void *)objc_opt_new();
  v843 = (void *)objc_opt_new();
  v666 = (void *)objc_opt_new();
  v667 = (void *)objc_opt_new();
  v668 = (void *)objc_opt_new();
  v839 = (void *)objc_opt_new();
  if ((int)v829 >= 1)
  {
    v669 = 0;
    v670 = 0;
    do
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", v670);
      v671 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v800, "objectForKeyedSubscript:", v671);
      v672 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v665, "addScore:group:", v672, *(float *)(*v846 + v669 + 124));
      objc_msgSend(v864, "addScore:group:", v672, *(float *)(*v846 + v669 + 164));
      objc_msgSend(v862, "addScore:group:", v672, *(float *)(*v846 + v669 + 160));
      objc_msgSend(v860, "addScore:group:", v672, *(float *)(*v846 + v669 + 144));
      objc_msgSend(v857, "addScore:group:", v672, *(float *)(*v846 + v669 + 268));
      objc_msgSend(v855, "addScore:group:", v672, *(float *)(*v846 + v669 + 260));
      objc_msgSend(v853, "addScore:group:", v672, *(float *)(*v846 + v669 + 244));
      objc_msgSend(v851, "addScore:group:", v672, *(float *)(*v846 + v669 + 168));
      objc_msgSend(v849, "addScore:group:", v672, *(float *)(*v846 + v669 + 276));
      objc_msgSend(v799, "objectForKeyedSubscript:", v671);
      v673 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v845, "addScore:group:", v673, *(float *)(*v846 + v669 + 124));
      objc_msgSend(v843, "addScore:group:", v673, *(float *)(*v846 + v669 + 164));
      objc_msgSend(v666, "addScore:group:", v673, *(float *)(*v846 + v669 + 160));
      objc_msgSend(v667, "addScore:group:", v673, *(float *)(*v846 + v669 + 268));
      objc_msgSend(v668, "addScore:group:", v673, *(float *)(*v846 + v669 + 168));
      if (v673)
        objc_msgSend(v839, "addObject:", v673);

      v665 = v841;
      ++v670;
      v669 += 3296;
    }
    while (3296 * v829 != v669);
  }
  v674 = objc_msgSend(v839, "count");
  if ((int)v829 >= 1)
  {
    v675 = 0;
    v676 = (double)v674;
    do
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", v675);
      v677 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v800, "objectForKeyedSubscript:", v677);
      v678 = (void *)objc_claimAutoreleasedReturnValue();
      v679 = *v846;
      objc_msgSend(v665, "getScoreForGroup:", v678);
      *(float *)&v681 = ATXSetInput(v679 + 3296 * v675, 0x51uLL, v680);
      v682 = *v846;
      objc_msgSend(v864, "getScoreForGroup:", v678, v681);
      *(float *)&v684 = ATXSetInput(v682 + 3296 * v675, 0x52uLL, v683);
      v685 = *v846;
      objc_msgSend(v862, "getScoreForGroup:", v678, v684);
      *(float *)&v687 = ATXSetInput(v685 + 3296 * v675, 0x53uLL, v686);
      v688 = *v846;
      objc_msgSend(v860, "getScoreForGroup:", v678, v687);
      *(float *)&v690 = ATXSetInput(v688 + 3296 * v675, 0x54uLL, v689);
      v691 = *v846;
      objc_msgSend(v857, "getScoreForGroup:", v678, v690);
      *(float *)&v693 = ATXSetInput(v691 + 3296 * v675, 0x55uLL, v692);
      v694 = *v846;
      objc_msgSend(v855, "getScoreForGroup:", v678, v693);
      *(float *)&v696 = ATXSetInput(v694 + 3296 * v675, 0x56uLL, v695);
      v697 = *v846;
      objc_msgSend(v853, "getScoreForGroup:", v678, v696);
      *(float *)&v699 = ATXSetInput(v697 + 3296 * v675, 0x57uLL, v698);
      v700 = *v846;
      objc_msgSend(v851, "getScoreForGroup:", v678, v699);
      *(float *)&v702 = ATXSetInput(v700 + 3296 * v675, 0x58uLL, v701);
      v703 = *v846;
      objc_msgSend(v849, "getScoreForGroup:", v678, v702);
      *(float *)&v705 = ATXSetInput(v703 + 3296 * v675, 0x59uLL, v704);
      objc_msgSend(v799, "objectForKeyedSubscript:", v677, v705);
      v706 = (void *)objc_claimAutoreleasedReturnValue();
      v707 = *v846;
      objc_msgSend(v845, "getScoreForGroup:", v706);
      *(float *)&v709 = ATXSetInput(v707 + 3296 * v675, 0x5AuLL, v708);
      v710 = *v846;
      objc_msgSend(v843, "getScoreForGroup:", v706, v709);
      *(float *)&v712 = ATXSetInput(v710 + 3296 * v675, 0x5BuLL, v711);
      v713 = *v846;
      objc_msgSend(v666, "getScoreForGroup:", v706, v712);
      *(float *)&v715 = ATXSetInput(v713 + 3296 * v675, 0x5CuLL, v714);
      v716 = *v846;
      objc_msgSend(v667, "getScoreForGroup:", v706, v715);
      *(float *)&v718 = ATXSetInput(v716 + 3296 * v675, 0x5DuLL, v717);
      v719 = *v846;
      objc_msgSend(v668, "getScoreForGroup:", v706, v718);
      ATXSetInput(v719 + 3296 * v675, 0x5EuLL, v720);
      ATXSetInput(*v846 + 3296 * v675, 0x5FuLL, v676);

      ++v675;
    }
    while (v675 != v829);
  }

LABEL_132:
  v892[0] = &v884;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)v892);

  return result;
}

- (void)setModeAffinityScores:(ATXPredictionItem *)a3 appModeEntityScores:(id)a4
{
  ATXModeEntityScoringFeatures *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3->key);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v6 = [ATXModeEntityScoringFeatures alloc];
    objc_msgSend(v24, "scoreMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "featureVector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXModeEntityScoringFeatures initFromJSON:](v6, "initFromJSON:", v8);

    objc_msgSend(v9, "entitySpecificFeatures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appCategoryScore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    *(float *)&v14 = ATXSetInput((uint64_t)a3, 0x32AuLL, v13);
    objc_msgSend(v9, "posteriorProbability", v14);
    *(float *)&v16 = ATXSetInput((uint64_t)a3, 0x32BuLL, v15);
    objc_msgSend(v9, "classConditionalProbability", v16);
    *(float *)&v18 = ATXSetInput((uint64_t)a3, 0x32CuLL, v17);
    *(float *)&v19 = ATXSetInput((uint64_t)a3, 0x32DuLL, (double)(unint64_t)objc_msgSend(v9, "uniqueOccurrencesInMode", v18));
    *(float *)&v20 = ATXSetInput((uint64_t)a3, 0x32EuLL, (double)(unint64_t)objc_msgSend(v9, "localOccurrences", v19));
    *(float *)&v21 = ATXSetInput((uint64_t)a3, 0x32FuLL, (double)(unint64_t)objc_msgSend(v9, "globalOccurrences", v20));
    objc_msgSend(v24, "scoreMetadata", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "score");
    ATXSetInput((uint64_t)a3, 0x330uLL, v23);

  }
  else
  {
    -[ATXAppFeaturizer setZeroValuesForModeEntityFeatures:](self, "setZeroValuesForModeEntityFeatures:", a3);
  }

}

- (void)setZeroValuesForModeEntityFeatures:(ATXPredictionItem *)a3
{
  ATXSetInput((uint64_t)a3, 0x32AuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32BuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32CuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32DuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32EuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x32FuLL, 0.0);
  ATXSetInput((uint64_t)a3, 0x330uLL, 0.0);
}

- (void)setDistributionBasedScoreInputsForTimeAndDay:(ATXPredictionItem *)a3 forBundleId:(id)a4 withTimeOfDayHistogram:(id)a5 withDayOfWeekHistogram:(id)a6
{
  id v10;
  id v11;
  unsigned int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t i;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v29 = a6;
  v12 = objc_msgSend(v11, "bucketCount");
  if (v12 <= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppFeaturizer.mm"), 964, CFSTR("Number of aggregated time buckets should be greater than 0"));

  }
  v13 = 0;
  v14 = 0;
  v15 = v12 >> 3;
  while (v14 != v15)
  {
    v16 = (void *)MEMORY[0x1CAA48B6C]();
    v17 = 0;
    v18 = 0.0;
    do
    {
      v32[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unsmoothedLaunchesForBundleIds:forLocalTime:", v19, (unsigned __int16)(v13 + v17));
      v21 = v20;

      v18 = v18 + v21;
      ++v17;
    }
    while (v17 != 8);
    ATXSetInput((uint64_t)a3, +[_ATXScoreTypes mappingForTimeOfDayDistributionSignals:forScoreInputCategory:](_ATXScoreTypes, "mappingForTimeOfDayDistributionSignals:forScoreInputCategory:", v14, 0), v18);
    v13 += 8;
    objc_autoreleasePoolPop(v16);
    ++v14;
  }
  for (i = 0; i != 7; ++i)
  {
    v23 = (void *)MEMORY[0x1CAA48B6C]();
    v24 = +[_ATXScoreTypes mappingForDayOfWeekDistributionSignals:forScoreInputCategory:](_ATXScoreTypes, "mappingForDayOfWeekDistributionSignals:forScoreInputCategory:", i, 0);
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "unsmoothedLaunchesForBundleIds:forLocalTime:", v25, (unsigned __int16)i);
    v27 = v26;

    ATXSetInput((uint64_t)a3, v24, v27);
    objc_autoreleasePoolPop(v23);
  }

}

- (void)setDistributionBasedScoreInputsForItem:(ATXPredictionItem *)a3 withGeoHashResolution:(unint64_t)a4 withGeoHashLaunchCounts:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  int *v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if ((uint64_t)a4 <= 1)
  {
    if (a4)
    {
      if (a4 != 1)
        goto LABEL_14;
      *(float *)&v10 = ATXSetInput((uint64_t)a3, 0x1F7uLL, (double)(unint64_t)objc_msgSend(v7, "count"));
      v12 = &kATXAppNumberOfScoreInputsForCoarseGeoHash;
    }
    else
    {
      *(float *)&v10 = ATXSetInput((uint64_t)a3, 0x1F6uLL, (double)(unint64_t)objc_msgSend(v7, "count"));
      v12 = &kATXAppNumberOfScoreInputsForSpecificGeoHash;
    }
    goto LABEL_13;
  }
  if (a4 == 2)
  {
    *(float *)&v10 = ATXSetInput((uint64_t)a3, 0x29AuLL, (double)(unint64_t)objc_msgSend(v7, "count"));
    v12 = &kATXAppNumberOfScoreInputsForZoom7GeoHash;
LABEL_13:
    v11 = *v12;
LABEL_14:
    v14 = 0;
    v15 = v11;
    while (1)
    {
      v16 = objc_msgSend(v9, "count", v10);
      v17 = v16 >= v15 ? v15 : v16;
      if (v14 >= v17)
        break;
      v18 = (void *)MEMORY[0x1CAA48B6C]();
      v19 = +[_ATXScoreTypes mappingForTopRankedGeoHashSignalsWithResolution:withRank:forScoreInputCategory:](_ATXScoreTypes, "mappingForTopRankedGeoHashSignalsWithResolution:withRank:forScoreInputCategory:", a4, v14, 0);
      objc_msgSend(v9, "objectAtIndex:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      ATXSetInput((uint64_t)a3, v19, v21);

      objc_autoreleasePoolPop(v18);
      ++v14;
    }
    goto LABEL_10;
  }
  if (a4 != 0xFFFFFFFF)
    goto LABEL_14;
  __atxlog_handle_app_prediction();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ATXAppFeaturizer setDistributionBasedScoreInputsForItem:withGeoHashResolution:withGeoHashLaunchCounts:].cold.1(v13);

LABEL_10:
}

+ (float)_computeL2DistanceFromBundleId:(id)a3 to:(const float *)a4 app2vecMapping:(id)a5
{
  id v6;
  id v7;
  size_t v8;
  char *v9;
  float v10;
  float v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = 4 * objc_msgSend(v7, "vectorLength");
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(v7, "getVectorForBundleIdWithGenreBackup:into:", v6, v9) & 1) == 0)
    bzero(v9, v8);
  catlas_saxpby_NEWLAPACK();
  cblas_snrm2_NEWLAPACK();
  v11 = v10;

  return v11;
}

+ (BOOL)_predictNextAppLaunchEmbedding:(id)a3 into:(float *)a4 launchSequence:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  void *v12;
  unint64_t v13;
  int v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  void *__p;
  _BYTE *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "vectorLength");
  std::vector<float>::vector(&__p, 4 * v9);
  v10 = 0;
  *(_QWORD *)&v11 = 138412546;
  v18 = v11;
  while (objc_msgSend(v8, "count", v18) > v10)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (v10 - objc_msgSend(v8, "count") + 4) * v9;
    if (v13 >= (v20 - (_BYTE *)__p) >> 2)
      std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
    v14 = objc_msgSend(v7, "getVectorForBundleIdWithGenreBackup:into:", v12, (char *)__p + 4 * v13);

    __atxlog_handle_app_prediction();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v18;
      v22 = v16;
      v23 = 1024;
      v24 = v14;
      _os_log_debug_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEBUG, "Embeddings found for %@: %i", buf, 0x12u);

    }
    ++v10;
  }
  if (+[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::onceToken != -1)
    dispatch_once(&+[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::onceToken, &__block_literal_global_198);
  objc_msgSend((id)+[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::nn, "forInputs:computeOutputLayer:", __p, a4);
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }

  return 1;
}

void __71__ATXAppFeaturizer__predictNextAppLaunchEmbedding_into_launchSequence___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  _ATXNeuralNetwork *v3;
  NSObject *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("_ATXAppLaunchSequenceModel"), CFSTR("dat"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v5 = 0;
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v0, 1, &v5);
    v2 = v5;
    if (v1)
    {
      v3 = -[_ATXNeuralNetwork initWithData:]([_ATXNeuralNetwork alloc], "initWithData:", v1);
      v4 = +[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::nn;
      +[ATXAppFeaturizer _predictNextAppLaunchEmbedding:into:launchSequence:]::nn = (uint64_t)v3;
    }
    else
    {
      __atxlog_handle_app_prediction();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __71__ATXAppFeaturizer__predictNextAppLaunchEmbedding_into_launchSequence___block_invoke_cold_1((uint64_t)v0, (uint64_t)v2, v4);
    }

  }
}

+ (double)time:(double)a3 toAccuracyInSeconds:(double)a4
{
  void *v9;

  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAppFeaturizer.mm"), 1069, CFSTR("Accuracy must be greater than 0"));

  }
  return (double)(uint64_t)(a3 / a4) * a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayZeroIntentParameters, 0);
  objc_storeStrong((id *)&self->_dayZeroParameters, 0);
  objc_storeStrong((id *)&self->_heroPoiManager, 0);
  objc_storeStrong((id *)&self->_heroPredictionServer, 0);
  objc_storeStrong((id *)&self->_mmPredictionMonitor, 0);
  objc_storeStrong((id *)&self->_appIconState, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_globalSmartSuppression, 0);
  objc_storeStrong((id *)&self->_globalAppScorePredictor, 0);
  objc_storeStrong((id *)&self->_appDailyDose, 0);
  objc_storeStrong((id *)&self->_mediaApps, 0);
  objc_storeStrong((id *)&self->_microLocation, 0);
  objc_storeStrong((id *)&self->_appInstallMonitor, 0);
  objc_storeStrong((id *)&self->_appLaunchLocation, 0);
  objc_storeStrong((id *)&self->_appLaunchSequenceManager, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

- (void)evaluateFeaturesForApps:(os_log_t)log clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "MagicalMoment with unknown source. This shouldn't happen.", buf, 2u);
}

- (void)setDistributionBasedScoreInputsForItem:(os_log_t)log withGeoHashResolution:withGeoHashLaunchCounts:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = 0xFFFFFFFFLL;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Unknown GeoHash Resolution: %ld", (uint8_t *)&v1, 0xCu);
}

void __71__ATXAppFeaturizer__predictNextAppLaunchEmbedding_into_launchSequence___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Could not read neural network from %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
