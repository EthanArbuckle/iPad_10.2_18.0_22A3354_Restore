@implementation CHTopDownStrokeGroupingStrategy

- (CHTopDownStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 locale:(id)a4 textInputTargets:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHTopDownStrokeGroupingStrategy *v11;
  objc_class *v12;
  uint64_t v13;
  NSString *strategyIdentifier;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CHTopDownStrokeGroupingStrategy;
  v11 = -[CHStrokeGroupingStrategy initWithStrokeProvider:](&v24, sel_initWithStrokeProvider_, v8);
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    strategyIdentifier = v11->_strategyIdentifier;
    v11->_strategyIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v11->_textInputTargets, a5);
    v11->_minimumDrawingSize = 16.0;
    v11->_transitionTimeWeight = 0.1;
    v11->_transitionTimeUpperBound = 1.0;
    v11->_verticalDistanceWeight = 1.2;
    v11->_backTransitionWeight = 0.2;
    v11->_backTransitionUpperBound = 3.0;
    v11->_horizontalDistanceBarrier = 1.2;
    v11->_horizontalDistanceWeight = 3.0;
    v11->_aspectRatioWeight = 0.1;
    v11->_writingDirectionWeight = 0.2;
    v11->_writingDirectionUpperBound = 3.0;
    v11->_writingDirectionMinCoeff = 0.025;
    v11->_targetFitnessWeight = 0.8;
    v11->_minLineHeightScore = 0.2;
    v11->_minArcLengthScore = 0.2;
    v11->_arcLengthDiffScoreCoeff = 1.6;
    v11->_expectedSubstrokesPerLine = 5.0;
    v11->_minSubstrokesForSplit = 6.0;
    v11->_reorderStrokes = 1;
    v11->_splitCostThreshold = 0.6;
    if (objc_msgSend_shouldAdjustGroupingForLocale_(CHRecognizerConfiguration, v15, (uint64_t)v9, v16, v17, v18))
    {
      v11->_targetFitnessWeight = 1.0;
      v11->_splitCostThreshold = 0.8;
      v11->_reorderStrokes = 0;
    }
    v11->_writingOrientation = objc_msgSend_writingOrientationForLocale_(CHRecognizerConfiguration, v19, (uint64_t)v9, v20, v21, v22);
  }

  return v11;
}

- (id)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
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
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CHTopDownStrokeSplit *v81;
  const char *v82;
  void *v83;
  NSArray *textInputTargets;
  id v85;
  NSArray *v86;
  id v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
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
  double v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  double v126;
  double v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double transitionTimeUpperBound;
  double v152;
  double v153;
  double MinY;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  double MaxY;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  double v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  double v178;
  double MaxX;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  double MinX;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  double v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
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
  double v221;
  double backTransitionUpperBound;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  _BOOL4 v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  double v235;
  double v236;
  void *v237;
  double v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  double v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  double v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  double v277;
  double writingDirectionMinCoeff;
  double writingDirectionUpperBound;
  CGFloat v280;
  CGFloat v281;
  CGFloat v282;
  CGFloat v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  CGFloat v290;
  CGFloat v291;
  CGFloat v292;
  CGFloat v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  double v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  double v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  BOOL v318;
  double v319;
  CGFloat v320;
  double v321;
  CGFloat v322;
  double v323;
  CGFloat v324;
  double v325;
  CGFloat v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  CGFloat v332;
  CGFloat v333;
  CGFloat v334;
  CGFloat v335;
  double height;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  double v342;
  CGFloat v343;
  double v344;
  CGFloat v345;
  double v346;
  CGFloat v347;
  double v348;
  CGFloat v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  CGFloat v355;
  CGFloat v356;
  CGFloat v357;
  CGFloat v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  double v375;
  double v376;
  double v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  double v383;
  double v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  double v390;
  double v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  double v397;
  double v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  double v404;
  double v405;
  double v406;
  double v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  double v413;
  double v414;
  double v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  double v421;
  double v422;
  double v423;
  double v424;
  double v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  double v431;
  double v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  double v438;
  double v439;
  double v440;
  double v441;
  double v442;
  double v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  double v449;
  double v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  double v456;
  double v457;
  double v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  double v464;
  double v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  double v471;
  double targetFitnessWeight;
  double v473;
  double v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  double v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  double v491;
  double v492;
  double v493;
  double v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  double v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  double v511;
  double v512;
  double v513;
  double v514;
  double minLineHeightScore;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  const char *v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  const char *v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  void *v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  void *v539;
  double v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  void *v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  double v570;
  double arcLengthDiffScoreCoeff;
  double v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  double v578;
  uint64_t v579;
  double v580;
  double v581;
  double minArcLengthScore;
  double v583;
  double v584;
  NSObject *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
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
  uint64_t v602;
  void *v603;
  const char *v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  id v616;
  double v617;
  double splitCostThreshold;
  NSObject *v619;
  const char *v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  const char *v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  void *v637;
  const char *v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  double v644;
  id v645;
  id v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  void *v652;
  const char *v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  _BOOL4 v658;
  const char *v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  void *v664;
  const char *v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  void *v670;
  const char *v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  double v676;
  double v677;
  const char *v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  double v687;
  double v688;
  void *v689;
  const char *v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  const char *v694;
  uint64_t v695;
  uint64_t v696;
  uint64_t v697;
  double v698;
  void *v699;
  const char *v700;
  uint64_t v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  _BOOL4 v705;
  const char *v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  void *v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  uint64_t v716;
  const char *v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  double v727;
  double v728;
  const char *v729;
  uint64_t v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  const char *v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  uint64_t v738;
  double v739;
  const char *v740;
  uint64_t v741;
  uint64_t v742;
  uint64_t v743;
  uint64_t v744;
  double v745;
  NSObject *v746;
  const char *v747;
  uint64_t v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  void *v752;
  CHStrokeGroupingResult *v753;
  const char *v754;
  uint64_t v755;
  void *v756;
  void *v757;
  __CFString *v758;
  void *v759;
  id v760;
  int v761;
  double v762;
  double v763;
  double v764;
  double v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  const char *v771;
  uint64_t v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  double v776;
  uint64_t v777;
  double v778;
  void *v779;
  const char *v780;
  uint64_t v781;
  uint64_t v782;
  uint64_t v783;
  uint64_t v784;
  BOOL v785;
  const char *v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  uint64_t v790;
  void *v791;
  const char *v792;
  uint64_t v793;
  uint64_t v794;
  uint64_t v795;
  void *v796;
  const char *v797;
  uint64_t v798;
  uint64_t v799;
  uint64_t v800;
  uint64_t v801;
  void *v802;
  const char *v803;
  uint64_t v804;
  uint64_t v805;
  uint64_t v806;
  void *v807;
  const char *v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  double v813;
  double v814;
  void *v815;
  const char *v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  double v820;
  const char *v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  uint64_t v825;
  void *v826;
  const char *v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  uint64_t v831;
  void *v832;
  const char *v833;
  uint64_t v834;
  uint64_t v835;
  void *v836;
  const char *v837;
  uint64_t v838;
  uint64_t v839;
  uint64_t v840;
  uint64_t v841;
  const char *v842;
  uint64_t v843;
  uint64_t v844;
  uint64_t v845;
  uint64_t v846;
  void *v847;
  const char *v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  BOOL v853;
  void *v854;
  const char *v855;
  uint64_t v856;
  uint64_t v857;
  uint64_t v858;
  uint64_t v859;
  void *v860;
  const char *v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  uint64_t v865;
  void *v866;
  double v867;
  const char *v868;
  void *v869;
  const char *v870;
  uint64_t v871;
  uint64_t v872;
  uint64_t v873;
  uint64_t v874;
  void *v875;
  const char *v876;
  uint64_t v877;
  uint64_t v878;
  uint64_t v879;
  uint64_t v880;
  void *v881;
  const char *v882;
  void *v883;
  const char *v884;
  uint64_t v885;
  uint64_t v886;
  double v887;
  double v888;
  void *v889;
  const char *v890;
  uint64_t v891;
  uint64_t v892;
  const char *v893;
  uint64_t v894;
  uint64_t v895;
  uint64_t v896;
  double v897;
  __CFString *v898;
  void *v899;
  const char *v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  uint64_t v904;
  void *v905;
  void *v906;
  const char *v907;
  uint64_t v908;
  uint64_t v909;
  uint64_t v910;
  uint64_t v911;
  void *v912;
  void *v913;
  const char *v914;
  uint64_t v915;
  uint64_t v916;
  uint64_t v917;
  const char *v918;
  uint64_t v919;
  uint64_t v920;
  uint64_t v921;
  const char *v922;
  uint64_t v923;
  uint64_t v924;
  uint64_t v925;
  uint64_t v926;
  void *v927;
  const char *v928;
  uint64_t v929;
  uint64_t v930;
  uint64_t v931;
  uint64_t v932;
  void *v933;
  void *v934;
  const char *v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  uint64_t v939;
  void *v940;
  void *v941;
  const char *v942;
  uint64_t v943;
  uint64_t v944;
  uint64_t v945;
  const char *v946;
  uint64_t v947;
  uint64_t v948;
  uint64_t v949;
  NSObject *v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  uint64_t v954;
  uint64_t v955;
  void *v956;
  const char *v957;
  uint64_t v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t v961;
  void *v962;
  const char *v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t v966;
  const char *v967;
  uint64_t v968;
  uint64_t v969;
  uint64_t v970;
  CHStrokeGroupingResult *v971;
  const char *v972;
  uint64_t v973;
  void *v975;
  void *v976;
  const char *v977;
  uint64_t v978;
  uint64_t v979;
  uint64_t v980;
  uint64_t v981;
  uint64_t v982;
  const char *v983;
  uint64_t v984;
  uint64_t v985;
  uint64_t v986;
  id v987;
  id v988;
  id v989;
  id v990;
  void *v991;
  void *v992;
  void *v993;
  void *v994;
  id v995;
  void *v996;
  id v997;
  void *v998;
  double v999;
  double v1000;
  double v1001;
  double v1002;
  double v1003;
  double writingDirectionWeight;
  double v1005;
  double horizontalDistanceBarrier;
  double horizontalDistanceWeight;
  double backTransitionWeight;
  double v1009;
  double v1010;
  double verticalDistanceWeight;
  double v1012;
  double transitionTimeWeight;
  double v1014;
  double v1015;
  void *v1016;
  double v1017;
  double v1018;
  double v1019;
  double minimumDrawingSize;
  void *v1021;
  double v1022;
  double v1023;
  double v1024[5];
  double v1025;
  double *v1026;
  uint64_t v1027;
  __n128 (*v1028)(__n128 *, __n128 *);
  void (*v1029)(uint64_t);
  void *v1030;
  void *__p;
  void *v1032;
  uint64_t v1033;
  double v1034[5];
  _BYTE buf[24];
  __n128 (*v1036)(__n128 *, __n128 *);
  _BYTE v1037[32];
  double v1038;
  __int16 v1039;
  double v1040;
  __int16 v1041;
  double v1042;
  __int16 v1043;
  double v1044;
  __int16 v1045;
  double v1046;
  __int16 v1047;
  double v1048;
  __int16 v1049;
  double v1050;
  __int16 v1051;
  double v1052;
  __int16 v1053;
  double v1054;
  uint64_t v1055;
  CGRect v1056;
  CGRect v1057;
  CGRect v1058;
  CGRect v1059;
  CGRect v1060;
  CGRect v1061;
  CGRect v1062;
  CGRect v1063;
  CGRect v1064;
  CGRect v1065;
  CGRect v1066;
  CGRect v1067;
  CGRect v1068;
  CGRect v1069;
  CGRect v1070;
  CGRect v1071;
  CGRect v1072;
  CGRect v1073;
  CGRect v1074;
  CGRect v1075;

  v1055 = *MEMORY[0x1E0C80C00];
  v995 = a3;
  v989 = a4;
  v990 = a5;
  v987 = a6;
  v997 = a7;
  v988 = a8;
  objc_msgSend_strokeProvider(self, v14, v15, v16, v17, v18);
  v992 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v992)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }

  }
  objc_msgSend_set(MEMORY[0x1E0C99E20], v19, v20, v21, v22, v23);
  v993 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v25, v26, v27, v28, v29);
  v994 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v995, v30, v31, v32, v33, v34);
  v991 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v35 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_strategyIdentifier(self, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_count(v989, v42, v43, v44, v45, v46);
    v53 = objc_msgSend_count(v990, v48, v49, v50, v51, v52);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2048;
    v1036 = (__n128 (*)(__n128 *, __n128 *))v53;
    _os_log_impl(&dword_1BE607000, v35, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);

  }
  objc_msgSend_orderedStrokes(v992, v54, v55, v56, v57, v58);
  v1016 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v1016, v59, v60, v61, v62, v63))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v746 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v746, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_strategyIdentifier(self, v747, v748, v749, v750, v751);
      v752 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v752;
      _os_log_impl(&dword_1BE607000, v746, OS_LOG_TYPE_ERROR, "Stroke Grouping with strategy %@ triggered with 0 strokes in the stroke provider.", buf, 0xCu);

    }
    v753 = [CHStrokeGroupingResult alloc];
    v756 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v753, v754, (uint64_t)v993, (uint64_t)v994, (uint64_t)v991, v755);
    goto LABEL_155;
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v64, v65, v66, v67, v68);
  v996 = (void *)objc_claimAutoreleasedReturnValue();
  v998 = 0;
  v74 = 0;
  v75 = -1.79769313e308;
  while (v74 < objc_msgSend_count(v1016, v69, v70, v71, v72, v73) - 1)
  {
    v1015 = v75;
    v81 = [CHTopDownStrokeSplit alloc];
    v83 = (void *)objc_msgSend_initWithStrokes_substrokesByStrokeIdentifier_splitIndex_writingOrientation_(v81, v82, (uint64_t)v1016, (uint64_t)v997, v74, self->_writingOrientation);
    textInputTargets = self->_textInputTargets;
    v85 = v83;
    v86 = textInputTargets;
    v87 = v996;
    objc_msgSend_groupBounds1(v85, v88, v89, v90, v91, v92);
    v94 = v93;
    objc_msgSend_groupBounds2(v85, v95, v96, v97, v98, v99);
    if (v94 <= v105)
      objc_msgSend_groupBounds2(v85, v100, v101, v102, v103, v104);
    else
      objc_msgSend_groupBounds1(v85, v100, v101, v102, v103, v104);
    minimumDrawingSize = self->_minimumDrawingSize;
    if (v111 > minimumDrawingSize)
    {
      objc_msgSend_groupBounds1(v85, v106, v107, v108, v109, v110);
      v113 = v112;
      objc_msgSend_groupBounds2(v85, v114, v115, v116, v117, v118);
      if (v113 <= v124)
        objc_msgSend_groupBounds2(v85, v119, v120, v121, v122, v123);
      else
        objc_msgSend_groupBounds1(v85, v119, v120, v121, v122, v123);
      minimumDrawingSize = v125;
    }
    objc_msgSend_groupBounds1(v85, v106, v107, v108, v109, v110);
    v127 = v126;
    objc_msgSend_groupBounds2(v85, v128, v129, v130, v131, v132);
    if (v127 <= v138)
      objc_msgSend_groupBounds2(v85, v133, v134, v135, v136, v137);
    else
      objc_msgSend_groupBounds1(v85, v133, v134, v135, v136, v137);
    v145 = v144;
    objc_msgSend_transitionTime(v85, v139, v140, v141, v142, v143);
    transitionTimeUpperBound = self->_transitionTimeUpperBound;
    if (v152 < transitionTimeUpperBound)
    {
      objc_msgSend_transitionTime(v85, v146, v147, v148, v149, v150);
      transitionTimeUpperBound = v153;
    }
    transitionTimeWeight = self->_transitionTimeWeight;
    v1014 = transitionTimeUpperBound;
    objc_msgSend_groupBounds2(v85, v146, v147, v148, v149, v150);
    MinY = CGRectGetMinY(v1056);
    objc_msgSend_groupBounds1(v85, v155, v156, v157, v158, v159);
    MaxY = CGRectGetMaxY(v1057);
    objc_msgSend_groupBounds1(v85, v161, v162, v163, v164, v165);
    v166 = CGRectGetMinY(v1058);
    objc_msgSend_groupBounds2(v85, v167, v168, v169, v170, v171);
    v177 = v166 - CGRectGetMaxY(v1059);
    if (MinY - MaxY <= v177)
      v178 = v177;
    else
      v178 = MinY - MaxY;
    verticalDistanceWeight = self->_verticalDistanceWeight;
    v1012 = v178;
    if (self->_writingOrientation == 2)
    {
      objc_msgSend_groupBounds2(v85, v172, v173, v174, v175, v176);
      MaxX = CGRectGetMaxX(v1060);
      objc_msgSend_groupBounds1(v85, v180, v181, v182, v183, v184);
      MinX = CGRectGetMinX(v1061);
      objc_msgSend_groupBounds1(v85, v186, v187, v188, v189, v190);
      v191 = CGRectGetMinX(v1062);
      objc_msgSend_groupBounds2(v85, v192, v193, v194, v195, v196);
    }
    else
    {
      objc_msgSend_groupBounds1(v85, v172, v173, v174, v175, v176);
      MaxX = CGRectGetMaxX(v1063);
      objc_msgSend_groupBounds2(v85, v201, v202, v203, v204, v205);
      MinX = CGRectGetMinX(v1064);
      objc_msgSend_groupBounds2(v85, v206, v207, v208, v209, v210);
      v191 = CGRectGetMinX(v1065);
      objc_msgSend_groupBounds1(v85, v211, v212, v213, v214, v215);
    }
    v221 = v191 - CGRectGetMaxX(*(CGRect *)&v197);
    backTransitionUpperBound = self->_backTransitionUpperBound;
    v1002 = (MaxX - MinX) / minimumDrawingSize;
    if (v1002 < backTransitionUpperBound)
      backTransitionUpperBound = (MaxX - MinX) / minimumDrawingSize;
    v1009 = backTransitionUpperBound;
    v1010 = v221;
    horizontalDistanceBarrier = self->_horizontalDistanceBarrier;
    horizontalDistanceWeight = self->_horizontalDistanceWeight;
    backTransitionWeight = self->_backTransitionWeight;
    objc_msgSend_orderedStrokes(v85, v216, v217, v218, v219, v220);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v229 = (unint64_t)objc_msgSend_count(v223, v224, v225, v226, v227, v228) > 2;

    v235 = 0.0;
    v236 = 0.0;
    if (v229)
    {
      objc_msgSend_orderedStrokes(v85, v230, v231, v232, v233, v234);
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = sub_1BE788A98(v237);

      objc_msgSend_orderedStrokesGroup1(v85, v239, v240, v241, v242, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = sub_1BE788A98(v244);

      objc_msgSend_orderedStrokesGroup2(v85, v246, v247, v248, v249, v250);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = sub_1BE788A98(v251);

      objc_msgSend_orderedStrokes(v85, v253, v254, v255, v256, v257);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = objc_msgSend_count(v258, v259, v260, v261, v262, v263);

      objc_msgSend_orderedStrokes(v85, v265, v266, v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      v276 = objc_msgSend_count(v270, v271, v272, v273, v274, v275);

      v236 = v238
           / (double)(unint64_t)(v264 - 1)
           / ((v245 + v252) / (double)(unint64_t)(v276 - 2) + 0.000001)
           + -1.0;
    }
    v1000 = v145 / minimumDrawingSize;
    v1001 = v236;
    v277 = fmax(v145 / minimumDrawingSize + -1.0, 0.0);
    if (v277 <= self->_writingDirectionMinCoeff)
      writingDirectionMinCoeff = self->_writingDirectionMinCoeff;
    else
      writingDirectionMinCoeff = v277;
    writingDirectionUpperBound = self->_writingDirectionUpperBound;
    if (v236 < writingDirectionUpperBound)
      writingDirectionUpperBound = v236;
    v1003 = writingDirectionUpperBound;
    writingDirectionWeight = self->_writingDirectionWeight;
    v1005 = writingDirectionMinCoeff;
    if (v86)
    {
      *(_QWORD *)buf = 0;
      v1025 = 0.0;
      objc_msgSend_groupBounds1(v85, v230, v231, v232, v233, v234);
      sub_1BE788C40(v86, (double *)buf, &v1025, v280, v281, v282, v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v1034[0] = 0.0;
      v1024[0] = 0.0;
      objc_msgSend_groupBounds2(v85, v285, v286, v287, v288, v289);
      sub_1BE788C40(v86, v1034, v1024, v290, v291, v292, v293);
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v300 = v294;
      if (!v284 || !v294)
        goto LABEL_66;
      objc_msgSend_frame(v294, v295, v296, v297, v298, v299);
      v301 = CGRectGetMinY(v1066);
      objc_msgSend_frame(v284, v302, v303, v304, v305, v306);
      if (v301 >= CGRectGetMaxY(v1067))
      {
        v318 = 1;
        if (v284 != v300)
          goto LABEL_49;
      }
      else
      {
        objc_msgSend_frame(v284, v307, v308, v309, v310, v311);
        v312 = CGRectGetMinY(v1068);
        objc_msgSend_frame(v300, v313, v314, v315, v316, v317);
        v318 = v312 >= CGRectGetMaxY(v1069);
        if (v284 == v300)
          goto LABEL_53;
LABEL_49:
        if (v318)
        {
          objc_msgSend_groupBounds1(v85, v307, v308, v309, v310, v311);
          v320 = v319;
          v322 = v321;
          v324 = v323;
          v326 = v325;
          objc_msgSend_frame(v300, v327, v328, v329, v330, v331);
          v1074.origin.x = v332;
          v1074.origin.y = v333;
          v1074.size.width = v334;
          v1074.size.height = v335;
          v1070.origin.x = v320;
          v1070.origin.y = v322;
          v1070.size.width = v324;
          v1070.size.height = v326;
          v1071 = CGRectIntersection(v1070, v1074);
          height = v1071.size.height;
          objc_msgSend_groupBounds2(v85, v337, v338, v339, v340, v341, v1071.origin.x, v1071.origin.y, v1071.size.width);
          v343 = v342;
          v345 = v344;
          v347 = v346;
          v349 = v348;
          objc_msgSend_frame(v284, v350, v351, v352, v353, v354);
          v1075.origin.x = v355;
          v1075.origin.y = v356;
          v1075.size.width = v357;
          v1075.size.height = v358;
          v1072.origin.x = v343;
          v1072.origin.y = v345;
          v1072.size.width = v347;
          v1072.size.height = v349;
          v1073 = CGRectIntersection(v1072, v1075);
          v364 = v1073.size.height;
          v365 = *(double *)buf;
          v366 = v1034[0];
          if (*(double *)buf > 0.0 && v1034[0] > 0.0)
          {
            objc_msgSend_frame(v284, v359, v360, v361, v362, v363, v1073.origin.x, v1073.origin.y, v1073.size.width);
            v368 = v367;
            v1018 = v364;
            v369 = height;
            objc_msgSend_groupBounds1(v85, v370, v371, v372, v373, v374);
            v376 = v375;
            v377 = v1034[0];
            objc_msgSend_frame(v300, v378, v379, v380, v381, v382);
            v384 = v383;
            objc_msgSend_groupBounds2(v85, v385, v386, v387, v388, v389);
            v391 = v390;
            objc_msgSend_frame(v300, v392, v393, v394, v395, v396);
            v398 = v397;
            objc_msgSend_frame(v284, v399, v400, v401, v402, v403);
            v235 = (v365 * v365 / (v368 * v376 + 0.000001) + v377 * v377 / (v384 * v391 + 0.000001))
                 * ((1.0 - v369 / v398)
                  * (1.0 - v1018 / v404));
LABEL_66:

            goto LABEL_67;
          }
          if (*(double *)buf <= 0.0)
          {
            v235 = 0.0;
            if (v1034[0] <= 0.0)
              goto LABEL_66;
            objc_msgSend_frame(v300, v359, v360, v361, v362, v363, v1073.origin.x, v1073.origin.y, v1073.size.width);
            v458 = v457;
            objc_msgSend_groupBounds2(v85, v459, v460, v461, v462, v463);
            v465 = v464;
            objc_msgSend_frame(v284, v466, v467, v468, v469, v470);
            v421 = v366 * v366 / (v458 * v465 + 0.000001);
            v439 = v364 / v471;
          }
          else
          {
            objc_msgSend_frame(v284, v359, v360, v361, v362, v363, v1073.origin.x, v1073.origin.y, v1073.size.width);
            v425 = v424;
            objc_msgSend_groupBounds1(v85, v426, v427, v428, v429, v430);
            v432 = v431;
            objc_msgSend_frame(v300, v433, v434, v435, v436, v437);
            v421 = v365 * v365 / (v425 * v432 + 0.000001);
            v439 = height / v438;
          }
          v423 = 1.0 - v439;
          goto LABEL_65;
        }
      }
LABEL_53:
      v405 = *(double *)buf;
      if (*(double *)buf > 0.0 && v1034[0] > 0.0)
      {
        v235 = 0.0;
        goto LABEL_66;
      }
      if (*(double *)buf <= 0.0)
      {
        v235 = 0.0;
        if (v1034[0] <= 0.0)
          goto LABEL_66;
        v440 = v1025;
        objc_msgSend_frame(v284, v307, v308, v309, v310, v311, v1034[0]);
        v442 = v441;
        v443 = v1034[0];
        objc_msgSend_frame(v300, v444, v445, v446, v447, v448);
        v450 = v449;
        objc_msgSend_groupBounds2(v85, v451, v452, v453, v454, v455);
        v421 = v440 / (v442 + 0.000001);
        v423 = v443 * v443 / (v450 * v456 + 0.000001);
      }
      else
      {
        objc_msgSend_frame(v284, v307, v308, v309, v310, v311, v1034[0]);
        v407 = v406;
        objc_msgSend_groupBounds1(v85, v408, v409, v410, v411, v412);
        v414 = v413;
        v415 = v1024[0];
        objc_msgSend_frame(v300, v416, v417, v418, v419, v420);
        v421 = v405 * v405 / (v407 * v414 + 0.000001);
        v423 = v415 / (v422 + 0.000001);
      }
LABEL_65:
      v235 = v421 * v423;
      goto LABEL_66;
    }
LABEL_67:
    targetFitnessWeight = self->_targetFitnessWeight;
    objc_msgSend_groupBounds1(v85, v230, v231, v232, v233, v234);
    v474 = v473;
    objc_msgSend_groupBounds2(v85, v475, v476, v477, v478, v479);
    if (v474 >= v485)
      objc_msgSend_groupBounds2(v85, v480, v481, v482, v483, v484);
    else
      objc_msgSend_groupBounds1(v85, v480, v481, v482, v483, v484);
    v492 = v491;
    objc_msgSend_groupBounds1(v85, v486, v487, v488, v489, v490);
    v494 = v493;
    objc_msgSend_groupBounds2(v85, v495, v496, v497, v498, v499);
    if (v494 <= v505)
      objc_msgSend_groupBounds2(v85, v500, v501, v502, v503, v504);
    else
      objc_msgSend_groupBounds1(v85, v500, v501, v502, v503, v504);
    v512 = v492 / (v511 + 0.000001);
    v513 = fmin(v492 / minimumDrawingSize, 1.0);
    if (v512 >= v513)
      v514 = v513;
    else
      v514 = v492 / (v511 + 0.000001);
    if (v514 <= self->_minLineHeightScore)
      minLineHeightScore = self->_minLineHeightScore;
    else
      minLineHeightScore = v514;
    v516 = objc_msgSend_substrokeCount1(v85, v506, v507, v508, v509, v510);
    v1019 = 1.0;
    if ((double)(objc_msgSend_substrokeCount2(v85, v517, v518, v519, v520, v521) + v516) / self->_minSubstrokesForSplit < 1.0)
    {
      v527 = objc_msgSend_substrokeCount1(v85, v522, v523, v524, v525, v526);
      v1019 = (double)(objc_msgSend_substrokeCount2(v85, v528, v529, v530, v531, v532) + v527)
            / self->_minSubstrokesForSplit;
    }
    objc_msgSend_strokeGroup1(v85, v522, v523, v524, v525, v526);
    v533 = (void *)objc_claimAutoreleasedReturnValue();
    v1017 = sub_1BE788F14(v533, v87);

    objc_msgSend_strokeGroup2(v85, v534, v535, v536, v537, v538);
    v539 = (void *)objc_claimAutoreleasedReturnValue();
    v540 = sub_1BE788F14(v539, v87);

    v546 = objc_msgSend_substrokeCount1(v85, v541, v542, v543, v544, v545);
    v552 = objc_msgSend_substrokeCount2(v85, v547, v548, v549, v550, v551);
    objc_msgSend_strokeGroup2(v85, v553, v554, v555, v556, v557);
    v558 = (void *)objc_claimAutoreleasedReturnValue();
    v564 = objc_msgSend_count(v558, v559, v560, v561, v562, v563);

    v999 = v513;
    v570 = v235;
    arcLengthDiffScoreCoeff = self->_arcLengthDiffScoreCoeff;
    if (minimumDrawingSize * 0.5 <= self->_minimumDrawingSize)
      v572 = self->_minimumDrawingSize;
    else
      v572 = minimumDrawingSize * 0.5;
    v578 = 1.0;
    if (self->_expectedSubstrokesPerLine > (double)objc_msgSend_substrokeCount1(v85, v565, v566, v567, v568, v569))
      v578 = fmin(v1017 / v572, 1.0);
    v579 = objc_msgSend_substrokeCount2(v85, v573, v574, v575, v576, v577);
    v580 = 1.0;
    if (self->_expectedSubstrokesPerLine > (double)v579)
      v580 = fmin(v540 / v572, 1.0);
    v581 = v578 * v580;
    if (v581 <= self->_minArcLengthScore)
      minArcLengthScore = self->_minArcLengthScore;
    else
      minArcLengthScore = v581;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v583 = sqrt(minLineHeightScore);
    v584 = fmin(v540/ (double)v552/ (v1017 / (double)v546 + 0.000001)* (v540/ (double)(unint64_t)v564/ (v540 / (double)v552 + 0.000001))* arcLengthDiffScoreCoeff, 1.0);
    v75 = (v1014 * transitionTimeWeight
         + 0.0
         + v1012 / minimumDrawingSize * verticalDistanceWeight
         + v1009 * backTransitionWeight
         + fmax(v1010 / minimumDrawingSize - horizontalDistanceBarrier, 0.0) * horizontalDistanceWeight
         + v1003 * fmin(v1005, 1.0) * writingDirectionWeight
         + v570 * targetFitnessWeight)
        * (v583
         * v1019
         * v584
         * minArcLengthScore);
    v585 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v585, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_strokeGroup1(v85, v586, v587, v588, v589, v590);
      v591 = (void *)objc_claimAutoreleasedReturnValue();
      v597 = objc_msgSend_count(v591, v592, v593, v594, v595, v596);
      objc_msgSend_strokeGroup2(v85, v598, v599, v600, v601, v602);
      v603 = (void *)objc_claimAutoreleasedReturnValue();
      v609 = objc_msgSend_count(v603, v604, v605, v606, v607, v608);
      objc_msgSend_transitionTime(v85, v610, v611, v612, v613, v614);
      *(_DWORD *)buf = 134221568;
      *(_QWORD *)&buf[4] = v597;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v609;
      *(_WORD *)&buf[22] = 2048;
      v1036 = *(__n128 (**)(__n128 *, __n128 *))&v75;
      *(_WORD *)v1037 = 2048;
      *(_QWORD *)&v1037[2] = v615;
      *(_WORD *)&v1037[10] = 2048;
      *(double *)&v1037[12] = v1012 / minimumDrawingSize;
      *(_WORD *)&v1037[20] = 2048;
      *(double *)&v1037[22] = v1010 / minimumDrawingSize;
      *(_WORD *)&v1037[30] = 2048;
      v1038 = v1002;
      v1039 = 2048;
      v1040 = v1000;
      v1041 = 2048;
      v1042 = v1001;
      v1043 = 2048;
      v1044 = v570;
      v1045 = 2048;
      v1046 = v512;
      v1047 = 2048;
      v1048 = v999;
      v1049 = 2048;
      v1050 = v1019;
      v1051 = 2048;
      v1052 = v584;
      v1053 = 2048;
      v1054 = minArcLengthScore;
      _os_log_impl(&dword_1BE607000, v585, OS_LOG_TYPE_DEBUG, "SPLIT %lu/%lu: TS=%.3f, TT=%.3f, VD=%.3f, HD=%.3f, BT=%.3f, AR=%.3f, WD=%.3f, TF=%.3f, HS=%.3f, MH=%.3f, SC=%.3f, ALD=%.3f, AL=%.3f", buf, 0x98u);

    }
    if (v75 <= v1015)
    {
      v75 = v1015;
    }
    else
    {
      v616 = v85;

      v998 = v616;
    }

    ++v74;
  }
  v617 = v75;
  splitCostThreshold = self->_splitCostThreshold;
  if (!v998)
  {
    if (v617 > splitCostThreshold)
      goto LABEL_147;
    objc_msgSend_writingDirectionOrderedStrokes_substrokesByStrokeIdentifier_writingOrientation_(CHTopDownStrokeSplit, v76, (uint64_t)v1016, (uint64_t)v997, self->_writingOrientation, v80);
    v757 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_153;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v619 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v619, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_strokeGroup1(v998, v620, v621, v622, v623, v624);
    v625 = (void *)objc_claimAutoreleasedReturnValue();
    v631 = objc_msgSend_count(v625, v626, v627, v628, v629, v630);
    objc_msgSend_strokeGroup2(v998, v632, v633, v634, v635, v636);
    v637 = (void *)objc_claimAutoreleasedReturnValue();
    v643 = objc_msgSend_count(v637, v638, v639, v640, v641, v642);
    v644 = self->_splitCostThreshold;
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = v631;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v643;
    *(_WORD *)&buf[22] = 2048;
    v1036 = *(__n128 (**)(__n128 *, __n128 *))&v617;
    *(_WORD *)v1037 = 2048;
    *(double *)&v1037[2] = v644;
    _os_log_impl(&dword_1BE607000, v619, OS_LOG_TYPE_DEBUG, "Best split (%lu/%lu) has score %.3f, splitting threshold is %.3f", buf, 0x2Au);

  }
  if (v617 <= splitCostThreshold)
  {
    v758 = CFSTR("Low split score");
LABEL_148:
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v950 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v950, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v758;
      _os_log_impl(&dword_1BE607000, v950, OS_LOG_TYPE_DEBUG, "Best split not acceptable: %@", buf, 0xCu);
    }

    objc_msgSend_orderedStrokes(v998, v951, v952, v953, v954, v955);
    v757 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_153:
    v913 = v757;
    sub_1BE78815C(self, v757);
    v956 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroups(v995, v957, v958, v959, v960, v961);
    v962 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BE7882C8(self, v1016, v956, v962, 1);
    v941 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v993, v963, (uint64_t)v941, v964, v965, v966);
    objc_msgSend_addObject_(v994, v967, (uint64_t)v941, v968, v969, v970);
    goto LABEL_154;
  }
  v645 = v998;
  v646 = v996;
  objc_msgSend_strokeGroup2(v645, v647, v648, v649, v650, v651);
  v652 = (void *)objc_claimAutoreleasedReturnValue();
  v658 = objc_msgSend_count(v652, v653, v654, v655, v656, v657) == 1;

  if (!v658)
    goto LABEL_109;
  objc_msgSend_strokeGroup2(v645, v659, v660, v661, v662, v663);
  v664 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v664, v665, v666, v667, v668, v669);
  v670 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_endTimestamp(v670, v671, v672, v673, v674, v675);
  v677 = v676;
  objc_msgSend_startTimestamp(v670, v678, v679, v680, v681, v682);
  v688 = v677 - v687;
  if (v688 <= 0.2)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v683, (uint64_t)CFSTR("Second group with single too short stroke (time interval = %.3f, threshold = %.3f)."), v684, v685, v686, *(_QWORD *)&v688, 0x3FC999999999999ALL);
    v759 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_123:
    v760 = v759;

    goto LABEL_124;
  }
  v689 = (void *)objc_opt_class();
  objc_msgSend_arcLengthForStroke_(v689, v690, (uint64_t)v670, v691, v692, v693);
  if (v698 <= 15.0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v694, (uint64_t)CFSTR("Second group with single too short stroke (arc length = %.3f, threshold = %.3f)."), v695, v696, v697, *(_QWORD *)&v698, 0x402E000000000000);
    v759 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_123;
  }

LABEL_109:
  objc_msgSend_strokeGroup2(v645, v659, v660, v661, v662, v663);
  v699 = (void *)objc_claimAutoreleasedReturnValue();
  v705 = (unint64_t)objc_msgSend_count(v699, v700, v701, v702, v703, v704) < 4;

  if (!v705)
  {
LABEL_137:
    objc_msgSend_strokeGroup1(v645, v706, v707, v708, v709, v710);
    v836 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v836, v837, v838, v839, v840, v841) == 1)
    {
      objc_msgSend_strokeGroup2(v645, v842, v843, v844, v845, v846);
      v847 = (void *)objc_claimAutoreleasedReturnValue();
      v853 = objc_msgSend_count(v847, v848, v849, v850, v851, v852) == 1;

      if (v853)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x4812000000;
        v1036 = sub_1BE78913C;
        *(_QWORD *)v1037 = sub_1BE789160;
        *(_QWORD *)&v1037[8] = &unk_1BE94989A;
        *(_QWORD *)&v1037[16] = 0;
        v1038 = 0.0;
        *(_QWORD *)&v1037[24] = 0;
        v854 = (void *)objc_opt_class();
        objc_msgSend_strokeGroup1(v645, v855, v856, v857, v858, v859);
        v860 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v860, v861, v862, v863, v864, v865);
        v866 = (void *)objc_claimAutoreleasedReturnValue();
        v867 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v1034[0] = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v1034[1] = 3221225472;
        *(_QWORD *)&v1034[2] = sub_1BE789178;
        *(_QWORD *)&v1034[3] = &unk_1E77F2B80;
        *(_QWORD *)&v1034[4] = buf;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v854, v868, (uint64_t)v866, 0, 1, (uint64_t)v1034);

        v1025 = 0.0;
        v1026 = &v1025;
        v1027 = 0x4812000000;
        v1028 = sub_1BE78913C;
        v1029 = sub_1BE789160;
        v1030 = &unk_1BE94989A;
        __p = 0;
        v1032 = 0;
        v1033 = 0;
        v869 = (void *)objc_opt_class();
        objc_msgSend_strokeGroup2(v645, v870, v871, v872, v873, v874);
        v875 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v875, v876, v877, v878, v879, v880);
        v881 = (void *)objc_claimAutoreleasedReturnValue();
        v1024[0] = v867;
        *(_QWORD *)&v1024[1] = 3221225472;
        *(_QWORD *)&v1024[2] = sub_1BE78929C;
        *(_QWORD *)&v1024[3] = &unk_1E77F2B80;
        *(_QWORD *)&v1024[4] = &v1025;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v869, v882, (uint64_t)v881, 0, 1, (uint64_t)v1024);

        v1023 = 0.0;
        v883 = (void *)objc_opt_class();
        objc_msgSend_lineOrientationForStrokePoints_error_(v883, v884, *(_QWORD *)&buf[8] + 48, (uint64_t)&v1023, v885, v886);
        v888 = v887;
        v1022 = 0.0;
        v889 = (void *)objc_opt_class();
        objc_msgSend_lineOrientationForStrokePoints_error_(v889, v890, (uint64_t)(v1026 + 6), (uint64_t)&v1022, v891, v892);
        v760 = 0;
        v761 = 1;
        if (v1023 < 1.0 && v1022 < 1.0)
        {
          if (vabdd_f64(v888, v897) >= 0.392699082)
          {
            v760 = 0;
          }
          else
          {
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v893, (uint64_t)CFSTR("Two parallel lines (err1=%.3f, err2=%.3f, ori1=%.3f, ori2=%.3f)."), v894, v895, v896, *(_QWORD *)&v1023, *(_QWORD *)&v1022, *(_QWORD *)&v888, *(_QWORD *)&v897, v987);
            v760 = (id)objc_claimAutoreleasedReturnValue();
            v761 = 0;
          }
        }
        _Block_object_dispose(&v1025, 8);
        if (__p)
        {
          v1032 = __p;
          operator delete(__p);
        }
        _Block_object_dispose(buf, 8);
        if (*(_QWORD *)&v1037[16])
        {
          *(_QWORD *)&v1037[24] = *(_QWORD *)&v1037[16];
          operator delete(*(void **)&v1037[16]);
        }
        goto LABEL_145;
      }
    }
    else
    {

    }
    v760 = 0;
    v761 = 1;
    goto LABEL_145;
  }
  objc_msgSend_strokeGroup2(v645, v706, v707, v708, v709, v710);
  v711 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v711, v712, v713, v714, v715, v716);
  v1021 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isFinished(v1021, v717, v718, v719, v720, v721) & 1) != 0)
  {
LABEL_136:

    goto LABEL_137;
  }
  objc_msgSend_groupBounds1(v645, v722, v723, v724, v725, v726);
  v728 = v727;
  objc_msgSend_groupBounds2(v645, v729, v730, v731, v732, v733);
  if (v728 <= v739)
    objc_msgSend_groupBounds2(v645, v734, v735, v736, v737, v738);
  else
    objc_msgSend_groupBounds1(v645, v734, v735, v736, v737, v738);
  v762 = v745;
  v763 = self->_minimumDrawingSize;
  if (v762 > v763)
  {
    objc_msgSend_groupBounds1(v645, v740, v741, v742, v743, v744);
    v765 = v764;
    objc_msgSend_groupBounds2(v645, v766, v767, v768, v769, v770);
    if (v765 <= v776)
      objc_msgSend_groupBounds2(v645, v771, v772, v773, v774, v775);
    else
      objc_msgSend_groupBounds1(v645, v771, v772, v773, v774, v775);
  }
  v777 = 0;
  v778 = v763 * 4.0;
  while (1)
  {
    objc_msgSend_strokeGroup2(v645, v740, v741, v742, v743, v744);
    v779 = (void *)objc_claimAutoreleasedReturnValue();
    v785 = v777 < objc_msgSend_count(v779, v780, v781, v782, v783, v784) - 2;

    if (!v785)
      break;
    objc_msgSend_strokeGroup2(v645, v786, v787, v788, v789, v790);
    v791 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v791, v792, v777, v793, v794, v795);
    v796 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_encodedStrokeIdentifier(v796, v797, v798, v799, v800, v801);
    v802 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v646, v803, (uint64_t)v802, v804, v805, v806);
    v807 = (void *)objc_claimAutoreleasedReturnValue();

    if (v807)
    {
      objc_msgSend_doubleValue(v807, v808, v809, v810, v811, v812);
      v814 = v813;
    }
    else
    {
      v815 = (void *)objc_opt_class();
      objc_msgSend_arcLengthForStroke_(v815, v816, (uint64_t)v796, v817, v818, v819);
      v814 = v820;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v821, v822, v823, v824, v825);
      v826 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodedStrokeIdentifier(v796, v827, v828, v829, v830, v831);
      v832 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v646, v833, (uint64_t)v826, (uint64_t)v832, v834, v835);

    }
    ++v777;
    if (v814 > v778)
      goto LABEL_136;
  }
  v975 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_strokeGroup2(v645, v786, v787, v788, v789, v790);
  v976 = (void *)objc_claimAutoreleasedReturnValue();
  v982 = objc_msgSend_count(v976, v977, v978, v979, v980, v981);
  objc_msgSend_stringWithFormat_(v975, v983, (uint64_t)CFSTR("Second group with an unfinished stroke and only a few (%li) other short strokes"), v984, v985, v986, v982 - 1);
  v760 = (id)objc_claimAutoreleasedReturnValue();

LABEL_124:
  v761 = 0;
LABEL_145:

  v898 = (__CFString *)v760;
  v758 = v898;
  if (!v761)
    goto LABEL_148;

LABEL_147:
  objc_msgSend_strokeGroup1(v998, v76, v77, v78, v79, v80);
  v899 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedStrokesGroup1(v998, v900, v901, v902, v903, v904);
  v905 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE78815C(self, v905);
  v906 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v995, v907, v908, v909, v910, v911);
  v912 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE7882C8(self, v899, v906, v912, 1);
  v913 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v993, v914, (uint64_t)v913, v915, v916, v917);
  objc_msgSend_addObject_(v994, v918, (uint64_t)v913, v919, v920, v921);
  objc_msgSend_strokeGroup2(v998, v922, v923, v924, v925, v926);
  v927 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedStrokesGroup2(v998, v928, v929, v930, v931, v932);
  v933 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE78815C(self, v933);
  v934 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v995, v935, v936, v937, v938, v939);
  v940 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE7882C8(self, v927, v934, v940, 0);
  v941 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v993, v942, (uint64_t)v941, v943, v944, v945);
  objc_msgSend_addObject_(v994, v946, (uint64_t)v941, v947, v948, v949);
LABEL_154:

  v971 = [CHStrokeGroupingResult alloc];
  v756 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v971, v972, (uint64_t)v993, (uint64_t)v994, (uint64_t)v991, v973);

LABEL_155:
  return v756;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
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
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CHDrawing *v38;
  CHDrawing *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  CHDrawing *v47;
  CHDrawing *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
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
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  double *v98;
  id *v99;
  void *v100;
  void *v101;
  id *v102;
  id v104;
  id obj;
  _QWORD v106[4];
  CHDrawing *v107;
  CHDrawing *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v100 = v17;
  if (self->_reorderStrokes && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_orderedStrokeIdentifiers(v17, v12, v13, v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokesForIdentifiers_(self, v19, v18, v20, v21, v22);
  }
  else
  {
    objc_msgSend_strokeIdentifiers(v17, v12, v13, v14, v15, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v23, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = sub_1BE7897CC;
    v113[3] = &unk_1E77F2B30;
    v113[4] = self;
    objc_msgSend_sortedArrayUsingComparator_(v29, v30, (uint64_t)v113, v31, v32, v33);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_strokesForIdentifiers_(self, v34, v18, v35, v36, v37);
  }
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (id)v18;
  if (a5)
    v38 = objc_alloc_init(CHDrawing);
  else
    v38 = 0;
  v39 = objc_alloc_init(CHDrawing);
  v102 = a5;
  v98 = a7;
  v99 = a8;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v101;
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v109, (uint64_t)v114, 16, v41);
  if (v42)
  {
    v43 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v110 != v43)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        v46 = (void *)objc_opt_class();
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = sub_1BE7898F4;
        v106[3] = &unk_1E77F4200;
        v47 = v38;
        v107 = v47;
        v48 = v39;
        v108 = v48;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v46, v49, (uint64_t)v45, 0, 1, (uint64_t)v106);
        if (v38)
        {
          objc_msgSend_endStroke(v47, v50, v51, v52, v53, v54);
          objc_msgSend_startTimestamp(v45, v55, v56, v57, v58, v59);
          objc_msgSend_addStartTime_(v47, v60, v61, v62, v63, v64);
          objc_msgSend_endTimestamp(v45, v65, v66, v67, v68, v69);
          objc_msgSend_addEndTime_(v47, v70, v71, v72, v73, v74);
        }
        objc_msgSend_endStroke(v48, v50, v51, v52, v53, v54, v98);
        objc_msgSend_startTimestamp(v45, v75, v76, v77, v78, v79);
        objc_msgSend_addStartTime_(v48, v80, v81, v82, v83, v84);
        objc_msgSend_endTimestamp(v45, v85, v86, v87, v88, v89);
        objc_msgSend_addEndTime_(v48, v90, v91, v92, v93, v94);

      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v95, (uint64_t)&v109, (uint64_t)v114, 16, v96);
    }
    while (v42);
  }

  if (v102)
    *v102 = objc_retainAutorelease(v38);
  if (a6)
    *a6 = objc_retainAutorelease(v104);
  if (v98)
    *v98 = 1.0;
  if (v99)
    *v99 = 0;

  return v39;
}

- (NSArray)textInputTargets
{
  return self->_textInputTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTargets, 0);
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
}

@end
