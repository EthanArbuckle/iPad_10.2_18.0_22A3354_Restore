@implementation CHGroupOversegmentationMergingStep

- (CHGroupOversegmentationMergingStep)init
{
  CHGroupOversegmentationMergingStep *v2;
  id v3;
  CHUpdateTokenPropertyForUnitConversionStep *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHInsertPrecedingSpaceForUnitsStep *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CHMathPostProcessingManager *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CHMathPostProcessingManager *unitConversionPostProcessor;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CHGroupOversegmentationMergingStep;
  v2 = -[CHGroupOversegmentationMergingStep init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(CHUpdateTokenPropertyForUnitConversionStep);
    objc_msgSend_addObject_(v3, v5, (uint64_t)v4, v6, v7, v8);
    v9 = objc_alloc_init(CHInsertPrecedingSpaceForUnitsStep);
    objc_msgSend_addObject_(v3, v10, (uint64_t)v9, v11, v12, v13);
    v14 = [CHMathPostProcessingManager alloc];
    v19 = objc_msgSend_initWithSequence_(v14, v15, (uint64_t)v3, v16, v17, v18);
    unitConversionPostProcessor = v2->_unitConversionPostProcessor;
    v2->_unitConversionPostProcessor = (CHMathPostProcessingManager *)v19;

  }
  return v2;
}

- (id)process:(id)a3 options:(id)a4
{
  void **v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHStrokeGroupingResult *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  double v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  double v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  id v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  __CFString *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  BOOL v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
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
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  id v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  void *v275;
  void *v276;
  BOOL v277;
  id v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  void *v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  int isMathUnitConversionPatternForTextTranscription_locales;
  id v298;
  void **v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void **v305;
  unint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  id v312;
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
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  BOOL v336;
  id v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  id v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  unint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
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
  id v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  void *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  id v426;
  id v427;
  void **v428;
  unint64_t v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  void *v457;
  BOOL v458;
  id v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  void *v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  void *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  double v498;
  double v499;
  double v500;
  double v501;
  CGFloat v502;
  CGFloat v503;
  CGFloat v504;
  CGFloat v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  const char *v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  CGFloat v531;
  CGFloat v532;
  CGFloat v533;
  CGFloat v534;
  double x;
  double y;
  double width;
  double height;
  void **v539;
  void **v540;
  void *v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  void *v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  id v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  unint64_t v563;
  const char *v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  void *v569;
  const char *v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  void *v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  const char *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  CGFloat v585;
  CGFloat v586;
  CGFloat v587;
  CGFloat v588;
  void **v589;
  void **v590;
  void *v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  void *v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  const char *v613;
  uint64_t v614;
  void *v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  id v626;
  const char *v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  void *v635;
  void *v636;
  void *v637;
  const char *v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  const char *v642;
  uint64_t v643;
  uint64_t v644;
  int v645;
  id v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  void *v652;
  _BOOL4 v653;
  CHMathResultWithContext *v654;
  const char *v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  void *v660;
  const char *v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t v665;
  void *v666;
  const char *v667;
  uint64_t v668;
  uint64_t v669;
  void *v670;
  const char *v671;
  uint64_t v672;
  uint64_t v673;
  void *v674;
  CHStrokeGroupRecognitionResult *v675;
  const char *v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  void *v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  void *v687;
  const char *v688;
  uint64_t v689;
  NSObject *v690;
  CHStrokeGroup *v691;
  const char *v692;
  const char *v693;
  uint64_t v694;
  uint64_t v695;
  uint64_t v696;
  void **StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  void **v698;
  void **v699;
  void *v700;
  const char *v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  const char *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  void *v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  unint64_t v715;
  const char *v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  void *v720;
  const char *v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  void *v726;
  const char *v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  void *v731;
  const char *v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  const char *v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  void *v742;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  void *v747;
  const char *v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  uint64_t v752;
  CHBottomUpStrokeGroupingStrategy *v753;
  const char *v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  uint64_t v758;
  void *v759;
  const char *v760;
  uint64_t v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  void *v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  void *v771;
  const char *v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  void *v777;
  const char *v778;
  const char *v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  uint64_t v783;
  void *v784;
  const char *v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  void *v790;
  const char *v791;
  uint64_t v792;
  uint64_t v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  void *v799;
  const char *v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  void **v813;
  void *v814;
  const char *v815;
  uint64_t v816;
  uint64_t v817;
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
  id v828;
  const char *v829;
  uint64_t v830;
  const char *v831;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  uint64_t i;
  void *v838;
  id v839;
  const char *v840;
  uint64_t v841;
  uint64_t v842;
  uint64_t v843;
  id v844;
  void *v845;
  const char *v846;
  uint64_t v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  const char *v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t v855;
  void *v856;
  const char *v857;
  uint64_t v858;
  uint64_t v859;
  uint64_t v860;
  const char *v861;
  uint64_t v862;
  uint64_t j;
  void *v864;
  void *v865;
  const char *v866;
  uint64_t v867;
  uint64_t v868;
  uint64_t v869;
  uint64_t v870;
  uint64_t v871;
  const char *v872;
  uint64_t v873;
  uint64_t v874;
  uint64_t v875;
  void *v876;
  const char *v877;
  uint64_t v878;
  uint64_t v879;
  uint64_t v880;
  uint64_t v881;
  void *v883;
  id v884;
  void *v885;
  void *v886;
  id obj;
  void *isInlineContinuousMode_inlineContinuousModeTargets;
  void *v889;
  uint64_t v890;
  uint64_t v891;
  void *v892;
  id v893;
  void *v894;
  uint64_t v895;
  void **v896;
  id v898;
  id v899;
  void **v900;
  __int128 v901;
  __int128 v902;
  __int128 v903;
  __int128 v904;
  __int128 v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  __int128 v910;
  __int128 v911;
  __int128 v912;
  _BYTE v913[128];
  uint8_t v914[128];
  uint8_t buf[128];
  uint64_t v916;
  CGRect v917;
  CGRect v918;
  CGRect v919;
  CGRect v920;
  CGRect v921;
  CGRect v922;

  v916 = *MEMORY[0x1E0C80C00];
  v5 = (void **)a3;
  v893 = a4;
  v900 = v5;
  v11 = [CHStrokeGroupingResult alloc];
  if (v5)
    v12 = objc_msgSend_copy(v5[6], v6, v7, v8, v9, v10);
  else
    v12 = objc_msgSend_copy(0, v6, v7, v8, v9, v10);
  v15 = (void *)v12;
  v16 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v11, v13, v12, 0, 0, v14);

  v885 = v16;
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v16, v17, 3, 0, v18, v19);
  v892 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v892, v20, v21, v22, v23, v24))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
    v886 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = -1;
    while (v35 < objc_msgSend_count(v892, v30, v31, v32, v33, v34) - 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v892, v37, v35, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v892, v42, v35 + 1, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (sub_1BE80F348((uint64_t)self, v41, v5))
      {
        if ((sub_1BE80F348((uint64_t)self, v46, v5) & 1) != 0)
        {
          objc_msgSend_bounds(v41, v47, v48, v49, v50, v51);
          v53 = v52;
          v55 = v54;
          v57 = v56;
          v59 = v58;
          objc_msgSend_bounds(v46, v60, v61, v62, v63, v64);
          objc_msgSend_horizontalDistanceBetweenRectangle_rectangle_(CHStrokeUtilities, v65, v66, v67, v68, v69, v53, v55, v57, v59, v70, v71, v72, v73);
          v75 = v74;
          objc_msgSend_bounds(v41, v76, v77, v78, v79, v80);
          v82 = v81;
          v84 = v83;
          v86 = v85;
          v88 = v87;
          objc_msgSend_bounds(v46, v89, v90, v91, v92, v93);
          objc_msgSend_verticalDistanceBetweenRectangle_rectangle_(CHStrokeUtilities, v94, v95, v96, v97, v98, v82, v84, v86, v88, v99, v100, v101, v102);
          v104 = v103;
          v105 = (void *)objc_opt_class();
          objc_msgSend_bounds(v41, v106, v107, v108, v109, v110);
          v112 = v111;
          v114 = v113;
          v116 = v115;
          v118 = v117;
          objc_msgSend_bounds(v46, v119, v120, v121, v122, v123);
          objc_msgSend_distanceFromRectangle_toRectangle_(v105, v124, v125, v126, v127, v128, v112, v114, v116, v118, v129, v130, v131, v132);
          v134 = v133;
          objc_msgSend_bounds(v41, v135, v136, v137, v138, v139);
          v141 = v140;
          objc_msgSend_bounds(v46, v142, v143, v144, v145, v146);
          v152 = fmax(v141, v151);
          if (v134 <= v152 + v152 && v75 > 0.0 && v104 < 0.0)
          {
            if (v36 == -1
              || (objc_msgSend_objectAtIndexedSubscript_(v886, v147, v36, v148, v149, v150),
                  v153 = (void *)objc_claimAutoreleasedReturnValue(),
                  v158 = objc_msgSend_containsObject_(v153, v154, (uint64_t)v41, v155, v156, v157),
                  v153,
                  (v158 & 1) == 0))
            {
              objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99DE8], v147, (uint64_t)v41, v148, v149, v150, v46, 0);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v886, v164, (uint64_t)v159, v165, v166, v167);
              ++v36;
            }
            else
            {
              objc_msgSend_objectAtIndexedSubscript_(v886, v147, v36, v148, v149, v150);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v159, v160, (uint64_t)v46, v161, v162, v163);
            }

          }
        }
      }

      ++v35;
    }
    v907 = 0u;
    v908 = 0u;
    v905 = 0u;
    v906 = 0u;
    obj = v886;
    v891 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v168, (uint64_t)&v905, (uint64_t)v914, 16, v169);
    if (v891)
    {
      v890 = *(_QWORD *)v906;
      do
      {
        v895 = 0;
        do
        {
          if (*(_QWORD *)v906 != v890)
            objc_enumerationMutation(obj);
          v899 = *(id *)(*((_QWORD *)&v905 + 1) + 8 * v895);
          v896 = v5;
          if (self)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v170, v171, v172, v173, v174);
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            v911 = 0u;
            v912 = 0u;
            v909 = 0u;
            v910 = 0u;
            v176 = v899;
            v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v177, (uint64_t)&v909, (uint64_t)buf, 16, v178);
            if (!v179)
              goto LABEL_39;
            v180 = *(_QWORD *)v910;
            while (1)
            {
              v181 = 0;
              do
              {
                if (*(_QWORD *)v910 != v180)
                  objc_enumerationMutation(v176);
                if (v5)
                  v182 = v5[7];
                else
                  v182 = 0;
                v183 = *(void **)(*((_QWORD *)&v909 + 1) + 8 * v181);
                v184 = v182;
                v185 = (void *)MEMORY[0x1E0CB37E8];
                v191 = objc_msgSend_uniqueIdentifier(v183, v186, v187, v188, v189, v190);
                objc_msgSend_numberWithInteger_(v185, v192, v191, v193, v194, v195);
                v196 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v184, v197, v196, v198, v199, v200);
                v201 = (void *)objc_claimAutoreleasedReturnValue();

                v202 = &stru_1E77F6F28;
                objc_msgSend_preferredLocale(v201, v203, v204, v205, v206, v207);
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v196) = v208 == 0;

                if ((v196 & 1) != 0)
                {
                  objc_msgSend_mathResult(v201, v209, v210, v211, v212, v213);
                  v231 = (void *)objc_claimAutoreleasedReturnValue();
                  v232 = v231 == 0;

                  if (v232)
                    goto LABEL_35;
                  objc_msgSend_mathResult(v201, v233, v234, v235, v236, v237);
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_preferredTranscription(v214, v238, v239, v240, v241, v242);
                  v220 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v243, (uint64_t)v220, v244, v245, v246);
                  v202 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend_recognitionResultsByLocale(v201, v209, v210, v211, v212, v213);
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_preferredLocale(v201, v215, v216, v217, v218, v219);
                  v220 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v214, v221, (uint64_t)v220, v222, v223, v224);
                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_topTranscription(v225, v226, v227, v228, v229, v230);
                  v202 = (__CFString *)objc_claimAutoreleasedReturnValue();

                }
LABEL_35:
                objc_msgSend_addObject_(v175, v233, (uint64_t)v202, v235, v236, v237);

                ++v181;
                v5 = v900;
              }
              while (v179 != v181);
              v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v247, (uint64_t)&v909, (uint64_t)buf, 16, v248);
              v179 = v249;
              if (!v249)
              {
LABEL_39:

                v894 = (void *)objc_msgSend_copy(v175, v250, v251, v252, v253, v254);
                goto LABEL_40;
              }
            }
          }
          v894 = 0;
LABEL_40:

          objc_msgSend_componentsJoinedByString_(v894, v255, (uint64_t)CFSTR(" "), v256, v257, v258);
          v259 = (id)objc_claimAutoreleasedReturnValue();
          v264 = v259;
          if (!self)
          {
            v276 = v259;

            v426 = v893;
            v287 = 0;
            goto LABEL_47;
          }
          if ((objc_msgSend_containsString_(v259, v260, (uint64_t)CFSTR("〒"), v261, v262, v263) & 1) == 0)
          {
            v276 = v264;

LABEL_45:
            v278 = v893;
            objc_msgSend_objectForKey_(v278, v279, (uint64_t)CHMathPostProcessingOptionLocales, v280, v281, v282);
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v287)
            {
              v288 = (void *)MEMORY[0x1E0C99D20];
              objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v283, (uint64_t)CFSTR("en_US"), v284, v285, v286);
              v289 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_arrayWithObject_(v288, v290, (uint64_t)v289, v291, v292, v293);
              v287 = (void *)objc_claimAutoreleasedReturnValue();

            }
LABEL_47:

            isMathUnitConversionPatternForTextTranscription_locales = objc_msgSend_isMathUnitConversionPatternForTextTranscription_locales_(CHTokenizedMathResult, v294, (uint64_t)v276, (uint64_t)v287, v295, v296);
            if (!isMathUnitConversionPatternForTextTranscription_locales)
              goto LABEL_82;
            v298 = v899;
            v299 = v896;
            v305 = v299;
            if (self)
            {
              if (v900)
              {
                v306 = 0;
                while (v306 < objc_msgSend_count(v298, v300, v301, v302, v303, v304))
                {
                  objc_msgSend_objectAtIndexedSubscript_(v298, v307, v306, v308, v309, v310);
                  v311 = (void *)objc_claimAutoreleasedReturnValue();
                  v312 = v900[7];
                  v313 = (void *)MEMORY[0x1E0CB37E8];
                  v319 = objc_msgSend_uniqueIdentifier(v311, v314, v315, v316, v317, v318);
                  objc_msgSend_numberWithInteger_(v313, v320, v319, v321, v322, v323);
                  v324 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v312, v325, (uint64_t)v324, v326, v327, v328);
                  v329 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_mathResult(v329, v330, v331, v332, v333, v334);
                  v335 = (void *)objc_claimAutoreleasedReturnValue();
                  v336 = v335 == 0;

                  ++v306;
                  if (v336)
                    goto LABEL_53;
                }
              }
              else
              {
                v429 = 0;
                while (v429 < objc_msgSend_count(v298, v300, v301, v302, v303, v304))
                {
                  objc_msgSend_objectAtIndexedSubscript_(v298, v430, v429, v431, v432, v433);
                  v434 = (void *)objc_claimAutoreleasedReturnValue();
                  v435 = (void *)MEMORY[0x1E0CB37E8];
                  v441 = objc_msgSend_uniqueIdentifier(v434, v436, v437, v438, v439, v440);
                  objc_msgSend_numberWithInteger_(v435, v442, v441, v443, v444, v445);
                  v446 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(0, v447, (uint64_t)v446, v448, v449, v450);
                  v451 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_mathResult(v451, v452, v453, v454, v455, v456);
                  v457 = (void *)objc_claimAutoreleasedReturnValue();
                  v458 = v457 == 0;

                  ++v429;
                  if (v458)
                  {
LABEL_53:

                    goto LABEL_54;
                  }
                }
              }

              v459 = v298;
              v305;
              v898 = v893;
              objc_msgSend_set(MEMORY[0x1E0C99E20], v460, v461, v462, v463, v464);
              v381 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v459, v465, v466, v467, v468, v469);
              v470 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstStrokeIdentifier(v470, v471, v472, v473, v474, v475);
              isInlineContinuousMode_inlineContinuousModeTargets = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_lastObject(v459, v476, v477, v478, v479, v480);
              v481 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lastStrokeIdentifier(v481, v482, v483, v484, v485, v486);
              v889 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_firstObject(v459, v487, v488, v489, v490, v491);
              v492 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_bounds(v492, v493, v494, v495, v496, v497);
              v499 = v498;
              v501 = v500;

              v502 = *MEMORY[0x1E0C9D628];
              v503 = *(double *)(MEMORY[0x1E0C9D628] + 8);
              v504 = *(double *)(MEMORY[0x1E0C9D628] + 16);
              v505 = *(double *)(MEMORY[0x1E0C9D628] + 24);
              if (objc_msgSend_count(v459, v506, v507, v508, v509, v510))
              {
                objc_msgSend_objectAtIndexedSubscript_(v459, v511, 0, v512, v513, v514);
                v515 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeIdentifiers(v515, v516, v517, v518, v519, v520);
                v521 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_unionSet_(v381, v522, (uint64_t)v521, v523, v524, v525);

                objc_msgSend_bounds(v515, v526, v527, v528, v529, v530);
                v921.origin.x = v531;
                v921.origin.y = v532;
                v921.size.width = v533;
                v921.size.height = v534;
                v917.origin.x = v502;
                v917.origin.y = v503;
                v917.size.width = v504;
                v917.size.height = v505;
                v918 = CGRectUnion(v917, v921);
                x = v918.origin.x;
                y = v918.origin.y;
                width = v918.size.width;
                height = v918.size.height;
                v539 = v900;
                if (v900)
                  v539 = (void **)v900[7];
                v540 = v539;
                v541 = (void *)MEMORY[0x1E0CB37E8];
                v547 = objc_msgSend_uniqueIdentifier(v515, v542, v543, v544, v545, v546);
                objc_msgSend_numberWithInteger_(v541, v548, v547, v549, v550, v551);
                v552 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v540, v553, (uint64_t)v552, v554, v555, v556);
                v557 = (id)objc_claimAutoreleasedReturnValue();

                if (v557)
                {
                  v563 = 1;
                  while (v563 < objc_msgSend_count(v459, v558, v559, v560, v561, v562))
                  {
                    objc_msgSend_objectAtIndexedSubscript_(v459, v564, v563, v566, v567, v568);
                    v569 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_strokeIdentifiers(v569, v570, v571, v572, v573, v574);
                    v575 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_unionSet_(v381, v576, (uint64_t)v575, v577, v578, v579);

                    objc_msgSend_bounds(v569, v580, v581, v582, v583, v584);
                    v922.origin.x = v585;
                    v922.origin.y = v586;
                    v922.size.width = v587;
                    v922.size.height = v588;
                    v919.origin.x = x;
                    v919.origin.y = y;
                    v919.size.width = width;
                    v919.size.height = height;
                    v920 = CGRectUnion(v919, v922);
                    x = v920.origin.x;
                    y = v920.origin.y;
                    width = v920.size.width;
                    height = v920.size.height;
                    v589 = v900;
                    if (v900)
                      v589 = (void **)v900[7];
                    v590 = v589;
                    v591 = (void *)MEMORY[0x1E0CB37E8];
                    v597 = objc_msgSend_uniqueIdentifier(v569, v592, v593, v594, v595, v596);
                    objc_msgSend_numberWithInteger_(v591, v598, v597, v599, v600, v601);
                    v602 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v590, v603, (uint64_t)v602, v604, v605, v606);
                    v607 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend_mathStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult_(v557, v608, (uint64_t)v607, v609, v610, v611);
                    v612 = objc_claimAutoreleasedReturnValue();

                    ++v563;
                    v557 = (id)v612;
                    if (!v612)
                      goto LABEL_79;
                  }
                  if (self->_unitConversionPostProcessor)
                  {
                    objc_msgSend_mathResult(v557, v564, v565, v566, v567, v568);
                    v615 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_topTranscription(v615, v616, v617, v618, v619, v620);
                    v883 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v621, (uint64_t)v883, v622, v623, v624);
                    v625 = (void *)objc_claimAutoreleasedReturnValue();
                    v626 = v898;
                    objc_msgSend_objectForKey_(v626, v627, (uint64_t)CHMathPostProcessingOptionLocales, v628, v629, v630);
                    v635 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v635)
                    {
                      v636 = (void *)MEMORY[0x1E0C99D20];
                      objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v631, (uint64_t)CFSTR("en_US"), v632, v633, v634);
                      v637 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_arrayWithObject_(v636, v638, (uint64_t)v637, v639, v640, v641);
                      v635 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    v645 = objc_msgSend_isMathUnitConversionPatternForTextTranscription_locales_(CHTokenizedMathResult, v642, (uint64_t)v625, (uint64_t)v635, v643, v644);

                    if (v645)
                    {
                      v646 = v557;
                      v884 = v626;
                      objc_msgSend_mathResult(v646, v647, v648, v649, v650, v651);
                      v652 = (void *)objc_claimAutoreleasedReturnValue();
                      v653 = v652 == 0;

                      if (v653)
                      {
                        if (qword_1EF568E88 != -1)
                          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                        v690 = (id)qword_1EF568E18[0];
                        if (os_log_type_enabled(v690, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1BE607000, v690, OS_LOG_TYPE_ERROR, "can't apply unit conversion postprocessing to strokeGroupRecognitionResult with no mathResult", buf, 2u);
                        }

                        v557 = v646;
                      }
                      else
                      {
                        v654 = [CHMathResultWithContext alloc];
                        objc_msgSend_mathResult(v646, v655, v656, v657, v658, v659);
                        v660 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_set(MEMORY[0x1E0C99E60], v661, v662, v663, v664, v665);
                        v666 = (void *)objc_claimAutoreleasedReturnValue();
                        v670 = (void *)objc_msgSend_initWithResult_declaredVariables_(v654, v667, (uint64_t)v660, (uint64_t)v666, v668, v669);

                        objc_msgSend_process_options_(self->_unitConversionPostProcessor, v671, (uint64_t)v670, (uint64_t)v884, v672, v673);
                        v674 = (void *)objc_claimAutoreleasedReturnValue();

                        v675 = [CHStrokeGroupRecognitionResult alloc];
                        objc_msgSend_result(v674, v676, v677, v678, v679, v680);
                        v681 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_inputStrokeIdentifiers(v646, v682, v683, v684, v685, v686);
                        v687 = (void *)objc_claimAutoreleasedReturnValue();
                        v689 = objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v675, v688, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v681, v687);

                        v557 = (id)v689;
                      }

                    }
                  }
                  v691 = [CHStrokeGroup alloc];
                  StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void **)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v691, v692, (uint64_t)v381, (uint64_t)isInlineContinuousMode_inlineContinuousModeTargets, (uint64_t)v889, 3, CFSTR("CHMathStrokeGroupingStrategy"), x, y, width, height, 1.0, v499, v501);
                  if (v900)
                    objc_msgSend_addObject_(v900[6], v693, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v694, v695, v696);
                  else
                    objc_msgSend_addObject_(0, v693, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v694, v695, v696);
                  v698 = v900;
                  if (v900)
                    v698 = (void **)v900[7];
                  v699 = v698;
                  v700 = (void *)MEMORY[0x1E0CB37E8];
                  v706 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v701, v702, v703, v704, v705);
                  objc_msgSend_numberWithInteger_(v700, v707, v706, v708, v709, v710);
                  v711 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKey_(v699, v712, (uint64_t)v557, (uint64_t)v711, v713, v714);

                  goto LABEL_111;
                }
              }
LABEL_79:

            }
            else
            {

              v427 = v298;
              v428 = v305;
            }
            goto LABEL_80;
          }
          objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v265, (uint64_t)CFSTR("^[0-9]\\s?[0-9]\\s?[0-9]\\s?-\\s?[0-9]\\s?[0-9]\\s?[0-9]\\s?[0-9]$"), 0, 0, v266);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          v273 = objc_msgSend_length(v264, v268, v269, v270, v271, v272);
          objc_msgSend_firstMatchInString_options_range_(v267, v274, (uint64_t)v264, 0, 1, v273 - 1);
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          v276 = v264;
          v277 = v275 == 0;

          if (v277)
            goto LABEL_45;
LABEL_54:
          v337 = v899;
          v896;
          objc_msgSend_set(MEMORY[0x1E0C99E20], v338, v339, v340, v341, v342);
          v898 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v337, v343, v344, v345, v346, v347))
          {
            objc_msgSend_objectAtIndexedSubscript_(v337, v348, 0, v349, v350, v351);
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiers(v352, v353, v354, v355, v356, v357);
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_unionSet_(v898, v359, (uint64_t)v358, v360, v361, v362);

            v363 = v900 ? v900[7] : 0;
            v364 = v363;
            v365 = (void *)MEMORY[0x1E0CB37E8];
            v371 = objc_msgSend_uniqueIdentifier(v352, v366, v367, v368, v369, v370);
            objc_msgSend_numberWithInteger_(v365, v372, v371, v373, v374, v375);
            v376 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v364, v377, (uint64_t)v376, v378, v379, v380);
            v381 = (void *)objc_claimAutoreleasedReturnValue();

            if (v381)
            {
              if (v900)
              {
                v387 = 1;
                while (v387 < objc_msgSend_count(v337, v382, v383, v384, v385, v386))
                {
                  objc_msgSend_objectAtIndexedSubscript_(v337, v388, v387, v389, v390, v391);
                  v392 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeIdentifiers(v392, v393, v394, v395, v396, v397);
                  v398 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_unionSet_(v898, v399, (uint64_t)v398, v400, v401, v402);

                  v403 = v900[7];
                  v404 = (void *)MEMORY[0x1E0CB37E8];
                  v410 = objc_msgSend_uniqueIdentifier(v392, v405, v406, v407, v408, v409);
                  objc_msgSend_numberWithInteger_(v404, v411, v410, v412, v413, v414);
                  v415 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v403, v416, (uint64_t)v415, v417, v418, v419);
                  v420 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult_(v381, v421, (uint64_t)v420, v422, v423, v424);
                  v425 = objc_claimAutoreleasedReturnValue();

                  ++v387;
                  v381 = (void *)v425;
                  if (!v425)
                    goto LABEL_62;
                }
              }
              else
              {
                v715 = 1;
                while (v715 < objc_msgSend_count(v337, v382, v383, v384, v385, v386))
                {
                  objc_msgSend_objectAtIndexedSubscript_(v337, v716, v715, v717, v718, v719);
                  v720 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeIdentifiers(v720, v721, v722, v723, v724, v725);
                  v726 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_unionSet_(v898, v727, (uint64_t)v726, v728, v729, v730);

                  v731 = (void *)MEMORY[0x1E0CB37E8];
                  v737 = objc_msgSend_uniqueIdentifier(v720, v732, v733, v734, v735, v736);
                  objc_msgSend_numberWithInteger_(v731, v738, v737, v739, v740, v741);
                  v742 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(0, v743, (uint64_t)v742, v744, v745, v746);
                  v747 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult_(v381, v748, (uint64_t)v747, v749, v750, v751);
                  v752 = objc_claimAutoreleasedReturnValue();

                  ++v715;
                  v381 = (void *)v752;
                  if (!v752)
                    goto LABEL_62;
                }
              }
              v753 = [CHBottomUpStrokeGroupingStrategy alloc];
              objc_msgSend_groupingManager(self, v754, v755, v756, v757, v758);
              v759 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeProvider(v759, v760, v761, v762, v763, v764);
              v765 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_groupingManager(self, v766, v767, v768, v769, v770);
              v771 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_locales(v771, v772, v773, v774, v775, v776);
              v777 = (void *)objc_claimAutoreleasedReturnValue();
              isInlineContinuousMode_inlineContinuousModeTargets = (void *)objc_msgSend_initWithStrokeProvider_defaultWritingOrientation_locales_isInlineContinuousMode_inlineContinuousModeTargets_(v753, v778, (uint64_t)v765, 1, (uint64_t)v777, 0, 0);

              objc_msgSend_groupingManager(self, v779, v780, v781, v782, v783);
              v784 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeProvider(v784, v785, v786, v787, v788, v789);
              v790 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sortedStrokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v791, (uint64_t)v898, (uint64_t)v790, v792, v793);
              v889 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_firstObject(v337, v794, v795, v796, v797, v798);
              v799 = (void *)objc_claimAutoreleasedReturnValue();
              v805 = objc_msgSend_ancestorIdentifier(v799, v800, v801, v802, v803, v804);
              objc_msgSend_strokeGroupFromStrokes_ancestorIdentifier_(isInlineContinuousMode_inlineContinuousModeTargets, v806, (uint64_t)v889, v805, v807, v808);
              v557 = (id)objc_claimAutoreleasedReturnValue();

              if (v900)
                objc_msgSend_addObject_(v900[6], v809, (uint64_t)v557, v810, v811, v812);
              else
                objc_msgSend_addObject_(0, v809, (uint64_t)v557, v810, v811, v812);
              v813 = v900;
              if (v900)
                v813 = (void **)v900[7];
              StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = v813;
              v814 = (void *)MEMORY[0x1E0CB37E8];
              v820 = objc_msgSend_uniqueIdentifier(v557, v815, v816, v817, v818, v819);
              objc_msgSend_numberWithInteger_(v814, v821, v820, v822, v823, v824);
              v699 = (void **)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v825, (uint64_t)v381, (uint64_t)v699, v826, v827);
LABEL_111:

              v903 = 0u;
              v904 = 0u;
              v901 = 0u;
              v902 = 0u;
              v828 = v899;
              v835 = objc_msgSend_countByEnumeratingWithState_objects_count_(v828, v829, (uint64_t)&v901, (uint64_t)v913, 16, v830);
              if (v835)
              {
                v836 = *(_QWORD *)v902;
                if (v900)
                {
                  do
                  {
                    for (i = 0; i != v835; ++i)
                    {
                      if (*(_QWORD *)v902 != v836)
                        objc_enumerationMutation(v828);
                      v838 = *(void **)(*((_QWORD *)&v901 + 1) + 8 * i);
                      v839 = v900[6];
                      objc_msgSend_removeObject_(v839, v840, (uint64_t)v838, v841, v842, v843);

                      v844 = v900[7];
                      v845 = (void *)MEMORY[0x1E0CB37E8];
                      v851 = objc_msgSend_uniqueIdentifier(v838, v846, v847, v848, v849, v850);
                      objc_msgSend_numberWithInteger_(v845, v852, v851, v853, v854, v855);
                      v856 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_removeObjectForKey_(v844, v857, (uint64_t)v856, v858, v859, v860);

                    }
                    v835 = objc_msgSend_countByEnumeratingWithState_objects_count_(v828, v861, (uint64_t)&v901, (uint64_t)v913, 16, v862);
                  }
                  while (v835);
                }
                else
                {
                  do
                  {
                    for (j = 0; j != v835; ++j)
                    {
                      if (*(_QWORD *)v902 != v836)
                        objc_enumerationMutation(v828);
                      v864 = *(void **)(*((_QWORD *)&v901 + 1) + 8 * j);
                      objc_msgSend_removeObject_(0, v831, (uint64_t)v864, v832, v833, v834);
                      v865 = (void *)MEMORY[0x1E0CB37E8];
                      v871 = objc_msgSend_uniqueIdentifier(v864, v866, v867, v868, v869, v870);
                      objc_msgSend_numberWithInteger_(v865, v872, v871, v873, v874, v875);
                      v876 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_removeObjectForKey_(0, v877, (uint64_t)v876, v878, v879, v880);

                    }
                    v835 = objc_msgSend_countByEnumeratingWithState_objects_count_(v828, v831, (uint64_t)&v901, (uint64_t)v913, 16, v834);
                  }
                  while (v835);
                }
              }
              goto LABEL_81;
            }
          }
LABEL_62:

LABEL_80:
LABEL_81:

LABEL_82:
          ++v895;
          v5 = v900;
        }
        while (v895 != v891);
        v881 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v613, (uint64_t)&v905, (uint64_t)v914, 16, v614);
        v891 = v881;
      }
      while (v881);
    }

  }
  return v900;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConversionPostProcessor, 0);
}

@end
