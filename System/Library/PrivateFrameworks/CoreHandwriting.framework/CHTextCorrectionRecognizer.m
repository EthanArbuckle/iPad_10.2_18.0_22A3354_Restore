@implementation CHTextCorrectionRecognizer

- (CHTextCorrectionRecognizer)initWithLocales:(id)a3 remoteRecognition:(BOOL)a4 priority:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CHTextCorrectionRecognizer *v14;
  uint64_t v15;
  NSArray *locales;
  const char *v17;
  uint64_t RecognizerForLocales_sessionMode_remote_priority;
  CHRecognizingText *textRecognizer;
  CHRemoteSketchRecognizer *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CHSketchRecognizer *v25;
  CHRecognizingSketch *shapeRecognizer;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CHCornerDetector *v31;
  CHCornerDetector *cornerDetector;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v38;

  v6 = a4;
  v8 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CHTextCorrectionRecognizer;
  v14 = -[CHTextCorrectionRecognizer init](&v38, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v9, v10, v11, v12, v13);
    locales = v14->_locales;
    v14->_locales = (NSArray *)v15;

    v14->_isRemoteRecognition = v6;
    RecognizerForLocales_sessionMode_remote_priority = objc_msgSend_createRecognizerForLocales_sessionMode_remote_priority_(CHRecognitionSession, v17, (uint64_t)v8, 1, v6, a5);
    textRecognizer = v14->__textRecognizer;
    v14->__textRecognizer = (CHRecognizingText *)RecognizerForLocales_sessionMode_remote_priority;

    if (v6)
    {
      v20 = [CHRemoteSketchRecognizer alloc];
      v25 = (CHSketchRecognizer *)objc_msgSend_initWithPriority_(v20, v21, a5, v22, v23, v24);
    }
    else
    {
      v25 = objc_alloc_init(CHSketchRecognizer);
    }
    shapeRecognizer = v14->__shapeRecognizer;
    v14->__shapeRecognizer = (CHRecognizingSketch *)v25;

    objc_msgSend_setMaxRecognitionResultCount_(v14->__shapeRecognizer, v27, 3, v28, v29, v30);
    v31 = objc_alloc_init(CHCornerDetector);
    cornerDetector = v14->__cornerDetector;
    v14->__cornerDetector = v31;

    objc_msgSend_setShouldUseDynamicSampling_(v14->__cornerDetector, v33, 0, v34, v35, v36);
  }

  return v14;
}

- (id)textCorrectionResultForDrawing:(id)a3 targetContentInfo:(id)a4 originalDrawing:(id)a5 lastStroke:(id)a6 localTypedContextBounds:(CGRect)a7 normalizedDrawingScaleFactor:(double)a8 previousCorrectionResult:(id)a9
{
  double height;
  CGFloat y;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
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
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int shouldAllowSpaceInsertionGestureForLocale;
  id v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSUInteger v107;
  char v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  void *v131;
  CHTextCorrectionResult *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  void *isCharacterLevel_error;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  double v182;
  double v183;
  BOOL v184;
  const char *v185;
  uint64_t v186;
  int isDrawingCenterOnBlank_targetContentInfo_insertionLocation;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  char isDirectionDownward;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  id v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  NSObject *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  NSObject *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  char isCharacterLevel;
  CHTextInputGesture *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  void *Stroke_preferCharacterLevel;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  unint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  _BOOL4 v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  int v311;
  CHTextCorrectionResult *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
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
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  id v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  NSUInteger v359;
  NSUInteger v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  double v373;
  CGFloat v374;
  double v375;
  CGFloat v376;
  double v377;
  CGFloat v378;
  double v379;
  CGFloat v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  void *v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  BOOL v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  double v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  double v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  double MinY;
  double v410;
  NSObject *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  id v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  void *v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  unint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  id v448;
  id v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  void *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  __CFString *v512;
  double v513;
  CGFloat v514;
  double v515;
  CGFloat v516;
  double v517;
  CGFloat v518;
  double v519;
  CGFloat v520;
  id v521;
  int v522;
  const char *v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  NSObject *v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  const char *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  void *v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  id v554;
  const char *v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  void *v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  unint64_t v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  void *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  const char *v589;
  uint64_t v590;
  uint64_t v591;
  CHRecognizingText *v592;
  char isKindOfClass;
  CHRecognizingText *v594;
  char v595;
  const char *v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  NSObject *v601;
  CHRecognizingText *v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  const char *v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  const char *v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  const char *v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  const char *v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  const char *v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  const char *v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  const char *v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  const char *v643;
  uint64_t v644;
  void *v645;
  id v646;
  _BOOL4 v647;
  NSObject *v648;
  CHRecognizingText *v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  const char *v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  const char *v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t v665;
  const char *v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  const char *v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  const char *v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t v679;
  const char *v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  const char *v686;
  uint64_t v687;
  uint64_t v688;
  uint64_t v689;
  const char *v690;
  uint64_t v691;
  void *v692;
  id v693;
  id v694;
  id v695;
  const char *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  void *v701;
  const char *v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  void *v707;
  void *v708;
  const char *v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  int isEqualToString;
  const char *v714;
  uint64_t v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  void *v719;
  const char *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  void *v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  const char *v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  const char *v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  unint64_t i;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  void *v747;
  const char *v748;
  void *v749;
  const char *v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t v753;
  const char *v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  int v758;
  double v759;
  double v760;
  int v761;
  int v762;
  int v763;
  NSObject *v764;
  const char *v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  void *v770;
  const char *v771;
  uint64_t v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  const char *v776;
  uint64_t v777;
  uint64_t v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  uint64_t v783;
  const char *v784;
  BOOL v785;
  const char *v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  uint64_t v790;
  uint64_t v791;
  int v792;
  const char *v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  const char *v798;
  uint64_t v799;
  uint64_t v800;
  uint64_t v801;
  uint64_t v802;
  void *v803;
  const char *v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  uint64_t v808;
  void *v809;
  const char *v810;
  uint64_t v811;
  void *v812;
  const char *v813;
  uint64_t v814;
  uint64_t v815;
  const char *v816;
  uint64_t v817;
  uint64_t v818;
  CHTokenizedTextResult *v819;
  const char *v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  const char *v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  const char *v830;
  uint64_t v831;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  void *v835;
  const char *v836;
  uint64_t v837;
  uint64_t v838;
  uint64_t v839;
  uint64_t v840;
  uint64_t v841;
  const char *v842;
  void *v843;
  const char *v844;
  uint64_t v845;
  uint64_t v846;
  uint64_t v847;
  CHTextCorrectionResult *v848;
  const char *v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  uint64_t v853;
  void *v854;
  const char *v855;
  void *v856;
  BOOL v857;
  const char *v858;
  uint64_t v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  void *v863;
  const char *v864;
  uint64_t v865;
  uint64_t v866;
  uint64_t v867;
  uint64_t v868;
  char isValid;
  NSObject *v870;
  uint64_t v872;
  BOOL v873;
  const char *v874;
  uint64_t v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  double v879;
  double v880;
  double v881;
  double v882;
  CGFloat v883;
  const char *v884;
  uint64_t v885;
  uint64_t v886;
  uint64_t v887;
  uint64_t v888;
  void *v889;
  const char *v890;
  uint64_t v891;
  uint64_t v892;
  uint64_t v893;
  char hasSuffix;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  uint64_t v899;
  uint64_t v900;
  void *v901;
  void *v902;
  const char *v903;
  uint64_t v904;
  uint64_t v905;
  void *v906;
  const char *v907;
  uint64_t v908;
  uint64_t v909;
  uint64_t v910;
  void *v911;
  id v912;
  void *v913;
  const char *v914;
  uint64_t v915;
  uint64_t v916;
  uint64_t v917;
  const char *v918;
  uint64_t v919;
  uint64_t v920;
  uint64_t v921;
  uint64_t v922;
  uint64_t v923;
  uint64_t v924;
  CGFloat v925;
  CGFloat v926;
  CGFloat v927;
  CGFloat v928;
  double v929;
  double MaxY;
  const char *v931;
  uint64_t v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  void *v936;
  const char *v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  double v942;
  double v943;
  BOOL v944;
  const char *v945;
  uint64_t v946;
  uint64_t v947;
  uint64_t v948;
  uint64_t v949;
  void *v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  uint64_t v954;
  uint64_t v955;
  double v956;
  uint64_t v957;
  const char *v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  void *v964;
  const char *v965;
  uint64_t v966;
  uint64_t v967;
  uint64_t v968;
  uint64_t v969;
  double v970;
  double v971;
  CGFloat v972;
  double v973;
  CGFloat v974;
  double v975;
  double v976;
  const char *v977;
  uint64_t v978;
  uint64_t v979;
  uint64_t v980;
  uint64_t v981;
  uint64_t v982;
  const char *v983;
  double v984;
  double v985;
  double MaxX;
  double v987;
  double v988;
  double MinX;
  const char *v990;
  uint64_t v991;
  uint64_t v992;
  uint64_t v993;
  uint64_t v994;
  void *v995;
  const char *v996;
  uint64_t v997;
  uint64_t v998;
  uint64_t v999;
  uint64_t v1000;
  double v1001;
  double v1002;
  const char *v1003;
  uint64_t v1004;
  uint64_t v1005;
  uint64_t v1006;
  uint64_t v1007;
  uint64_t v1008;
  double v1009;
  double v1010;
  uint64_t v1011;
  const char *v1012;
  uint64_t v1013;
  uint64_t v1014;
  uint64_t v1015;
  uint64_t v1016;
  const char *v1017;
  uint64_t v1018;
  const char *v1019;
  uint64_t v1020;
  uint64_t v1021;
  uint64_t v1022;
  const char *v1023;
  CHTextCorrectionResult *v1024;
  const char *v1025;
  uint64_t v1026;
  uint64_t v1027;
  uint64_t v1028;
  uint64_t v1029;
  void *v1030;
  const char *v1031;
  void *v1032;
  const char *v1033;
  uint64_t v1034;
  uint64_t v1035;
  uint64_t v1036;
  uint64_t v1037;
  int v1038;
  const char *v1039;
  uint64_t v1040;
  uint64_t v1041;
  uint64_t v1042;
  uint64_t v1043;
  const char *v1044;
  uint64_t v1045;
  uint64_t v1046;
  uint64_t v1047;
  uint64_t v1048;
  uint64_t v1049;
  const char *v1050;
  uint64_t v1051;
  uint64_t v1052;
  const char *v1053;
  CGFloat v1054;
  CGFloat v1055;
  BOOL v1056;
  const char *v1057;
  uint64_t v1058;
  uint64_t v1059;
  uint64_t v1060;
  const char *v1061;
  uint64_t v1062;
  uint64_t v1063;
  uint64_t v1064;
  uint64_t v1065;
  uint64_t v1066;
  uint64_t v1067;
  const char *v1068;
  uint64_t v1069;
  uint64_t v1070;
  uint64_t v1071;
  uint64_t v1072;
  void *v1073;
  const char *v1074;
  uint64_t v1075;
  uint64_t v1076;
  uint64_t v1077;
  uint64_t v1078;
  const char *v1079;
  const char *v1080;
  const char *v1081;
  uint64_t v1082;
  uint64_t v1083;
  uint64_t v1084;
  uint64_t v1085;
  const char *v1086;
  uint64_t v1087;
  uint64_t v1088;
  uint64_t v1089;
  const char *v1090;
  void *v1091;
  CHTextCorrectionResult *v1092;
  const char *v1093;
  uint64_t v1094;
  uint64_t v1095;
  uint64_t v1096;
  uint64_t v1097;
  void *v1098;
  const char *v1099;
  uint64_t v1100;
  void *v1101;
  void *rect2a;
  CGFloat rect2;
  void *v1104;
  CGFloat v1105;
  uint64_t v1106;
  CGFloat v1107;
  void *v1108;
  void *v1109;
  int rect1;
  CGFloat rect1a;
  CGFloat rect1_8;
  id rect1_16;
  uint64_t rect1_16a;
  id rect1_24;
  id v1116;
  CGFloat rect;
  void *recta;
  id v1119;
  void *v1120;
  id v1121;
  id v1122;
  uint64_t v1123;
  const char *v1124;
  id v1125;
  void *v1126;
  uint64_t v1127;
  id v1128;
  id v1129;
  uint64_t v1130;
  void *v1131;
  uint64_t v1132;
  void *v1133;
  void *v1134;
  unint64_t v1135;
  id v1136;
  void *v1137;
  void *v1138;
  id v1139;
  double v1140[2];
  _QWORD v1141[4];
  uint64_t v1142;
  uint64_t *v1143;
  uint64_t v1144;
  uint64_t v1145;
  double v1146;
  id *v1147;
  uint64_t v1148;
  unint64_t v1149;
  BOOL v1150;
  uint8_t buf[16];
  void (*v1152)(uint64_t, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v1153;
  id *v1154;
  uint64_t *v1155;
  uint64_t v1156;
  NSRange v1157;
  CGRect v1158;
  CGRect v1159;
  CGRect v1160;
  CGRect v1161;
  CGRect v1162;
  CGRect v1163;
  CGRect v1164;
  CGRect v1165;
  CGRect v1166;
  CGRect v1167;
  CGRect v1168;
  CGRect v1169;
  CGRect v1170;
  CGRect v1171;
  CGRect v1172;

  height = a7.size.height;
  rect = a7.size.width;
  y = a7.origin.y;
  rect1_8 = a7.origin.x;
  v1156 = *MEMORY[0x1E0C80C00];
  v1139 = a3;
  v1128 = a4;
  v17 = a5;
  rect1_24 = a6;
  v1116 = a9;
  v1138 = v17;
  v23 = objc_msgSend_strokeCount(v17, v18, v19, v20, v21, v22);
  if (v23 != objc_msgSend_strokeCount(v1139, v24, v25, v26, v27, v28))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v34 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_FAULT, "The original and rescaled drawings should have equal stroke counts", buf, 2u);
    }

  }
  v35 = objc_msgSend_pointCount(v17, v29, v30, v31, v32, v33);
  if (v35 != objc_msgSend_pointCount(v1139, v36, v37, v38, v39, v40))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v46 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v46, OS_LOG_TYPE_FAULT, "The original and rescaled drawings should have equal total point counts", buf, 2u);
    }

  }
  if (objc_msgSend_strokeCount(v1139, v41, v42, v43, v44, v45) != 1)
    goto LABEL_97;
  objc_msgSend_locales(self, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v52, v53, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  shouldAllowSpaceInsertionGestureForLocale = objc_msgSend_shouldAllowSpaceInsertionGestureForLocale_(CHRecognizerConfiguration, v59, (uint64_t)v58, v60, v61, v62);

  if (!shouldAllowSpaceInsertionGestureForLocale)
    goto LABEL_29;
  v64 = v1139;
  v65 = v1138;
  v71 = v1128;
  if (!self)
    goto LABEL_27;
  if (objc_msgSend_strokeCount(v65, v66, v67, v68, v69, v70) != 1)
    goto LABEL_27;
  if ((unint64_t)objc_msgSend_pointCountForStrokeIndex_(v65, v72, 0, v73, v74, v75) < 2)
    goto LABEL_27;
  objc_msgSend_bounds(v65, v76, v77, v78, v79, v80);
  if (v86 >= 10.0)
    goto LABEL_27;
  objc_msgSend_bounds(v65, v81, v82, v83, v84, v85);
  if (v92 <= 10.0)
    goto LABEL_27;
  objc_msgSend_bounds(v65, v87, v88, v89, v90, v91);
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v100 = v99;
  v101 = (void *)objc_opt_class();
  v106 = objc_msgSend_defaultTextAffectedRangeForTargetContentInfo_(v101, v102, (uint64_t)v71, v103, v104, v105);
  buf[0] = 0;
  v108 = sub_1BE85AE4C(v71, v106, v107, (BOOL *)buf, 0, 0, v94, v96, v98, v100, rect1_8, y, rect, height);
  v112 = buf[0] ? 0 : v108;
  if ((v112 & 1) != 0)
  {
    objc_msgSend_sketchRecognitionResultsForDrawing_options_(self->__shapeRecognizer, v109, (uint64_t)v64, 0, v110, v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v113, v114, v115, v116, v117, v118);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121
      && objc_msgSend_isVerticalBarShapeFromLineResult_originalDrawing_isDirectionDownward_(CHTextInputGesture, v119, (uint64_t)v121, (uint64_t)v65, 0, v120))
    {
      objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v122, 0, v123, v124, v125);
      v1133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_boundsForStrokeIndexes_(v64, v126, (uint64_t)v1133, v127, v128, v129);
      objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v130, (uint64_t)CFSTR(" "), (uint64_t)v1133, (uint64_t)&stru_1E77F6F28, 0);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = [CHTextCorrectionResult alloc];
      objc_msgSend_textInputTarget(v71, v133, v134, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      isCharacterLevel_error = (void *)objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v132, v139, (uint64_t)v138, v106, 0, (uint64_t)v131, 7, 1, 0);

    }
    else
    {
      isCharacterLevel_error = 0;
    }

  }
  else
  {
LABEL_27:
    isCharacterLevel_error = 0;
  }

  if (!isCharacterLevel_error)
  {
LABEL_29:
    v146 = v1139;
    v147 = v1138;
    v148 = v1128;
    if (!self)
    {
      isCharacterLevel_error = 0;
LABEL_48:

      if (isCharacterLevel_error)
        goto LABEL_204;
      if (objc_msgSend_strokeCoveredTextRange(v148, v141, v142, v143, v144, v145) == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend_containsCommittedStrokes(v148, v217, v218, v219, v220, v221) & 1) != 0)
      {
        goto LABEL_97;
      }
      v1136 = v146;
      v1125 = v147;
      v1121 = rect1_24;
      v222 = v148;
      v1129 = v1116;
      if (!self)
      {
        v334 = 0;
        goto LABEL_89;
      }
      if (objc_msgSend_strokeCoveredTextRange(v222, v223, v224, v225, v226, v227) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v233 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v233, OS_LOG_TYPE_FAULT))
        {
          v1157.location = objc_msgSend_strokeCoveredTextRange(v222, v234, v235, v236, v237, v238);
          NSStringFromRange(v1157);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v239;
          _os_log_impl(&dword_1BE607000, v233, OS_LOG_TYPE_FAULT, "Invalid stroke covered range when recognizing editing gesture. %@", buf, 0xCu);

        }
      }
      if (objc_msgSend_strokeCount(v1136, v228, v229, v230, v231, v232) != 1)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v245 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v245, OS_LOG_TYPE_FAULT))
        {
          v251 = objc_msgSend_strokeCount(v1136, v246, v247, v248, v249, v250);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v251;
          _os_log_impl(&dword_1BE607000, v245, OS_LOG_TYPE_FAULT, "Cannot recognize editing gesture for drawing with %ld strokes.", buf, 0xCu);
        }

      }
      if (objc_msgSend_resultType(v1129, v240, v241, v242, v243, v244) == 3
        || objc_msgSend_resultType(v1129, v252, v253, v254, v255, v256) == 6)
      {
        isCharacterLevel = objc_msgSend_isCharacterLevel(v1129, v252, v253, v254, v255, v256);
      }
      else
      {
        isCharacterLevel = 0;
      }
      v258 = [CHTextInputGesture alloc];
      objc_msgSend_locales(self, v259, v260, v261, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v264, v265, v266, v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v1100) = isCharacterLevel;
      Stroke_preferCharacterLevel = (void *)objc_msgSend_initWithGestureType_targetContentInfo_locale_normalizedDrawing_originalDrawing_lastStroke_preferCharacterLevel_(v258, v271, 0, (uint64_t)v222, (uint64_t)v270, (uint64_t)v1136, v1125, v1121, v1100);

      objc_msgSend_sketchRecognitionResultsForDrawing_options_(self->__shapeRecognizer, v273, (uint64_t)v1136, 0, v274, v275);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      v282 = v276;
      if (v276)
      {
        v283 = objc_msgSend_indexOfObjectPassingTest_(v276, v277, (uint64_t)&unk_1E77F1A90, v279, v280, v281);
        v288 = objc_msgSend_indexOfObjectPassingTest_(v282, v284, (uint64_t)&unk_1E77F6358, v285, v286, v287);
        v293 = objc_msgSend_indexOfObjectPassingTest_(v282, v289, (uint64_t)&unk_1E77F6378, v290, v291, v292);
        v298 = objc_msgSend_indexOfObjectPassingTest_(v282, v294, (uint64_t)&unk_1E77F6398, v295, v296, v297);
      }
      else
      {
        v283 = 0x7FFFFFFFFFFFFFFFLL;
        v288 = 0x7FFFFFFFFFFFFFFFLL;
        v293 = 0x7FFFFFFFFFFFFFFFLL;
        v298 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v299 = objc_msgSend_count(v282, v277, v278, v279, v280, v281);
      v304 = v288 < 2;
      if (!v293)
        v304 = 1;
      v305 = 2;
      if (!v293)
        v305 = 5;
      if (v288 < 2)
        v305 = 4;
      if (!v299)
        v304 = 1;
      if (v304)
        v306 = v305;
      else
        v306 = 6;
      if (!v304 && v298)
      {
        objc_msgSend_setDrawing_(self->__cornerDetector, v300, (uint64_t)v1136, v301, v302, v303);
        if (!v283 && !objc_msgSend_directionChangeCount(self->__cornerDetector, v300, v307, v301, v302, v303))
        {
          objc_msgSend_objectAtIndexedSubscript_(v282, v300, 0, v301, v302, v303);
          v901 = (void *)objc_claimAutoreleasedReturnValue();
          v902 = (void *)objc_opt_class();
          objc_msgSend_verticalBarGestureFromLineResult_currentGesture_(v902, v903, (uint64_t)v901, (uint64_t)Stroke_preferCharacterLevel, v904, v905);
          v906 = (void *)objc_claimAutoreleasedReturnValue();
          v911 = v906;
          if (v906)
          {
            v912 = v906;

            Stroke_preferCharacterLevel = v912;
          }
          else
          {
            objc_msgSend_setGestureType_(Stroke_preferCharacterLevel, v907, 3, v908, v909, v910);
          }

          goto LABEL_88;
        }
        v306 = 3;
      }
      objc_msgSend_setGestureType_(Stroke_preferCharacterLevel, v300, v306, v301, v302, v303);
LABEL_88:
      LOBYTE(v1146) = 0;
      objc_msgSend_getAffectedRange_expandedToFullTokens_(Stroke_preferCharacterLevel, v308, (uint64_t)buf, (uint64_t)&v1146, v309, v310);
      v311 = LOBYTE(v1146);
      v312 = [CHTextCorrectionResult alloc];
      objc_msgSend_textInputTarget(v222, v313, v314, v315, v316, v317);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      v319 = *(_QWORD *)buf;
      v320 = *(_QWORD *)&buf[8];
      objc_msgSend_textResult(Stroke_preferCharacterLevel, v321, v322, v323, v324, v325);
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      v332 = objc_msgSend_gestureType(Stroke_preferCharacterLevel, v327, v328, v329, v330, v331);
      v334 = (void *)objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v312, v333, (uint64_t)v318, v319, v320, (uint64_t)v326, v332, v311 == 0, 0);

LABEL_89:
      v340 = objc_msgSend_resultType(v334, v335, v336, v337, v338, v339);
      if (objc_msgSend_shouldReclassifyGestureType_(CHTextInputGesture, v341, v340, v342, v343, v344))
      {
        v350 = objc_msgSend_resultType(v334, v345, v346, v347, v348, v349);
        if ((objc_msgSend_isEditGestureForDrawing_targetContentInfo_tentativeResultType_(CHTextInputGesture, v351, (uint64_t)v1125, (uint64_t)v222, v350, v352) & 1) == 0)
        {

          goto LABEL_97;
        }
      }
      if (objc_msgSend_resultType(v1129, v345, v346, v347, v348, v349) == 6)
      {
        sub_1BE85AAA8(self, v1129, v1125, v1121, v222);
        v353 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v353 = v334;
      }
      isCharacterLevel_error = v353;

      if (!isCharacterLevel_error)
      {
LABEL_97:
        v354 = (void *)objc_opt_class();
        v1130 = objc_msgSend_defaultTextAffectedRangeForTargetContentInfo_(v354, v355, (uint64_t)v1128, v356, v357, v358);
        v360 = v359;
        v1119 = v1139;
        v1122 = v1128;
        rect1_16 = v1138;
        if (!self)
        {
          isCharacterLevel_error = 0;
LABEL_203:

          goto LABEL_204;
        }
        v1141[0] = 0;
        *(CGFloat *)&v1141[1] = y;
        v1141[2] = 0x3FF0000000000000;
        *(double *)&v1141[3] = height * a8;
        objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v361, (uint64_t)v1141, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v362, v363);
        v1109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99E08], v364, (uint64_t)v1109, v365, v366, v367, CHRecognitionOptionFrameContext[0], 0);
        v1137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bounds(v1119, v368, v369, v370, v371, v372);
        v374 = v373;
        v376 = v375;
        v378 = v377;
        v380 = v379;
        objc_msgSend_referenceSubstring(v1122, v381, v382, v383, v384, v385);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        v392 = objc_msgSend_length(v386, v387, v388, v389, v390, v391) == 0;

        if (v392)
        {
          objc_msgSend_textInputTarget(v1122, v393, v394, v395, v396, v397);
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_frame(v403, v404, v405, v406, v407, v408);
          MinY = CGRectGetMinY(v1160);
          v1161.origin.x = v374;
          v1161.origin.y = v376;
          v1161.size.width = v378;
          v1161.size.height = v380;
          v410 = CGRectGetMinY(v1161);

          v402 = MinY - v410;
          if (fabs(MinY - v410) <= 8.98846567e307)
            goto LABEL_107;
        }
        else
        {
          v1158.origin.x = rect1_8;
          v1158.origin.y = y;
          v1158.size.width = rect;
          v1158.size.height = height;
          v398 = CGRectGetMinY(v1158);
          v1159.origin.x = v374;
          v1159.origin.y = v376;
          v1159.size.width = v378;
          v1159.size.height = v380;
          v402 = v398 - CGRectGetMinY(v1159) + -16.0;
          if (fabs(v402) <= 8.98846567e307)
            goto LABEL_107;
        }
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v411 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v411, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v411, OS_LOG_TYPE_ERROR, "Anchor point has a dummy large value, resetting to zero.", buf, 2u);
        }

        v402 = 0.0;
LABEL_107:
        v1140[0] = a8 * 0.0;
        v1140[1] = v402 * a8 * 0.7;
        objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v399, (uint64_t)v1140, (uint64_t)"{CGPoint=dd}", v400, v401);
        v1108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v1137, v412, (uint64_t)v1108, (uint64_t)CHRecognitionOptionDrawingAnchorPoint[0], v413, v414);
        v415 = v1122;
        objc_msgSend_referenceSubstring(v415, v416, v417, v418, v419, v420);
        v421 = (void *)objc_claimAutoreleasedReturnValue();
        v426 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v415, v422, v1130, v423, v424, v425);
        v432 = objc_msgSend_length(v421, v427, v428, v429, v430, v431);
        v438 = 0;
        if (v432 && (v426 & 0x8000000000000000) == 0)
        {
          if (v426 <= objc_msgSend_length(v421, v433, v434, v435, v436, v437))
          {
            objc_msgSend_substringToIndex_(v421, v439, v426, v440, v441, v442);
            v438 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v438 = 0;
          }
        }
        v1126 = (void *)v438;

        if (v360)
        {
LABEL_123:
          v1106 = 0;
          rect1 = 1;
          v497 = v1126;
          if (!v1126)
            goto LABEL_136;
LABEL_124:
          if (objc_msgSend_length(v497, v443, v444, v445, v446, v447))
          {
            v503 = objc_msgSend_length(v497, v498, v499, v500, v501, v502);
            v508 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v497, v504, v503 - 1, v505, v506, v507);
            objc_msgSend_substringWithRange_(v497, v509, v508, (uint64_t)v509, v510, v511);
            v512 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v512 = &stru_1E77F6F28;
          }
          objc_msgSend_bounds(rect1_16, v498, v499, v500, v501, v502);
          v514 = v513;
          v516 = v515;
          v518 = v517;
          v520 = v519;
          v521 = v415;
          v1146 = 0.0;
          *(double *)&v1142 = 6.0;
          v1150 = 0;
          v522 = sub_1BE85AE4C(v521, v1130, v360, &v1150, &v1146, (double *)&v1142, v514, v516, v518, v520, rect1_8, y, rect, height);
          if (v1150)
          {
            v528 = 1;
            if (qword_1EF568E88 == -1)
            {
LABEL_129:
              v529 = (id)qword_1EF568E18[0];
              if (os_log_type_enabled(v529, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v528;
                _os_log_impl(&dword_1BE607000, v529, OS_LOG_TYPE_DEBUG, "SpaceBehavior: %li", buf, 0xCu);
              }

              objc_msgSend_setObject_forKey_(v1137, v530, (uint64_t)v1126, (uint64_t)CHRecognitionOptionTextBefore[0], v531, v532);
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v533, v528, v534, v535, v536);
              v537 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v1137, v538, (uint64_t)v537, (uint64_t)CHRecognitionOptionPrecedingSpaceBehavior[0], v539, v540);

              if (rect1
                && objc_msgSend_lastCharacterLevelPosition(v521, v541, v542, v543, v544, v545) != 0x7FFFFFFFFFFFFFFFLL
                && objc_msgSend_lastCharacterLevelPosition(v521, v546, v547, v548, v549, v550) == v1130)
              {
                objc_msgSend_setObject_forKey_(v1137, v551, MEMORY[0x1E0C9AAB0], (uint64_t)CHRecognitionOptionIsPreviousResultCharacterLevel[0], v552, v553);
              }

LABEL_136:
              v554 = v415;
              objc_msgSend_referenceSubstring(v554, v555, v556, v557, v558, v559);
              v560 = (void *)objc_claimAutoreleasedReturnValue();
              v565 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v554, v561, v1130 + v360, v562, v563, v564);
              recta = 0;
              if (objc_msgSend_length(v560, v566, v567, v568, v569, v570) && (v565 & 0x8000000000000000) == 0)
              {
                if (v565 <= objc_msgSend_length(v560, v571, v572, v573, v574, v575))
                {
                  objc_msgSend_substringFromIndex_(v560, v576, v565, v577, v578, v579);
                  v580 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v581, (uint64_t)CFSTR("%C"), v582, v583, v584, 65532);
                  v585 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v580, v586, (uint64_t)v585, (uint64_t)&stru_1E77F6F28, v587, v588);
                  recta = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  recta = 0;
                }
              }

              if (recta)
                objc_msgSend_setObject_forKey_(v1137, v589, (uint64_t)recta, (uint64_t)CHRecognitionOptionTextAfter[0], v590, v591);
              v592 = self->__textRecognizer;
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              v594 = self->__textRecognizer;
              objc_opt_class();
              v595 = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v601 = (id)qword_1EF568E48;
                if (os_log_type_enabled(v601, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE607000, v601, OS_LOG_TYPE_DEBUG, "Running local recognition", buf, 2u);
                }

                v602 = self->__textRecognizer;
                v608 = objc_msgSend_contentType(v554, v603, v604, v605, v606, v607);
                objc_msgSend_setContentType_(v602, v609, v608, v610, v611, v612);
                v618 = objc_msgSend_autoCapitalizationMode(v554, v613, v614, v615, v616, v617);
                objc_msgSend_setAutoCapitalizationMode_(v602, v619, v618, v620, v621, v622);
                v628 = objc_msgSend_autoCorrectionMode(v554, v623, v624, v625, v626, v627);
                objc_msgSend_setAutoCorrectionMode_(v602, v629, v628, v630, v631, v632);
                v638 = objc_msgSend_baseWritingDirection(v554, v633, v634, v635, v636, v637);
                objc_msgSend_setBaseWritingDirection_(v602, v639, v638, v640, v641, v642);
                objc_msgSend_textRecognitionResultForDrawing_options_shouldCancel_(v602, v643, (uint64_t)v1119, (uint64_t)v1137, 0, v644);
                v645 = (void *)objc_claimAutoreleasedReturnValue();

                v646 = 0;
                if (!v645)
                {
                  v647 = 0;
                  v645 = 0;
                  if (!v360)
                    goto LABEL_182;
LABEL_159:
                  objc_msgSend_referenceSubstringInRange_(v554, v596, v1130, v360, v599, v600);
                  v692 = (void *)objc_claimAutoreleasedReturnValue();
                  v693 = v645;
                  v694 = v692;
                  objc_opt_self();
                  v695 = v693;
                  v701 = v695;
                  v645 = v695;
                  if (v694)
                  {
                    objc_msgSend_topTranscription(v695, v696, v697, v698, v699, v700);
                    v707 = (void *)objc_claimAutoreleasedReturnValue();
                    v645 = v701;
                    if (v707)
                    {
                      objc_msgSend_topTranscription(v701, v702, v703, v704, v705, v706);
                      v708 = (void *)objc_claimAutoreleasedReturnValue();
                      isEqualToString = objc_msgSend_isEqualToString_(v708, v709, (uint64_t)v694, v710, v711, v712);

                      v645 = v701;
                      if (isEqualToString)
                      {
                        objc_msgSend_transcriptionPaths(v701, v714, v715, v716, v717, v718);
                        v719 = (void *)objc_claimAutoreleasedReturnValue();
                        v725 = (void *)objc_msgSend_mutableCopy(v719, v720, v721, v722, v723, v724);

                        v731 = objc_msgSend_tokenColumnCount(v701, v726, v727, v728, v729, v730);
                        objc_msgSend_firstObject(v725, v732, v733, v734, v735, v736);
                        v1104 = (void *)objc_claimAutoreleasedReturnValue();
                        for (i = 1; ; ++i)
                        {
                          if (i >= objc_msgSend_count(v725, v737, v738, v739, v740, v741))
                          {
                            v645 = v701;
                            goto LABEL_195;
                          }
                          objc_msgSend_objectAtIndexedSubscript_(v725, v743, i, v744, v745, v746);
                          v747 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v701, v748, (uint64_t)v747, 0, v731, 0);
                          v749 = (void *)objc_claimAutoreleasedReturnValue();

                          if ((objc_msgSend_isEqualToString_(v749, v750, (uint64_t)v694, v751, v752, v753) & 1) == 0)
                            break;

                        }
                        objc_msgSend_objectAtIndexedSubscript_(v725, v754, i, v755, v756, v757);
                        v812 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_atIndexedSubscript_(v725, v813, (uint64_t)v812, 0, v814, v815);
                        objc_msgSend_setObject_atIndexedSubscript_(v725, v816, (uint64_t)v1104, i, v817, v818);
                        v819 = [CHTokenizedTextResult alloc];
                        objc_msgSend_tokenColumns(v701, v820, v821, v822, v823, v824);
                        rect2a = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_transcriptionPathScores(v701, v825, v826, v827, v828, v829);
                        v1101 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_trailingSeparator(v701, v830, v831, v832, v833, v834);
                        v835 = (void *)objc_claimAutoreleasedReturnValue();
                        v841 = objc_msgSend_recognizerGenerationIdentifier(v701, v836, v837, v838, v839, v840);
                        v645 = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v819, v842, (uint64_t)rect2a, (uint64_t)v725, (uint64_t)v1101, (uint64_t)v835, v841);

LABEL_195:
                      }
                    }
                  }

                  goto LABEL_197;
                }
                goto LABEL_158;
              }
              if ((v595 & 1) == 0)
              {
                v646 = 0;
                goto LABEL_181;
              }
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v648 = (id)qword_1EF568E48;
              if (os_log_type_enabled(v648, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE607000, v648, OS_LOG_TYPE_DEBUG, "Running remote recognition", buf, 2u);
              }

              v649 = self->__textRecognizer;
              v655 = objc_msgSend_contentType(v554, v650, v651, v652, v653, v654);
              objc_msgSend_setContentType_(v649, v656, v655, v657, v658, v659);
              v665 = objc_msgSend_autoCapitalizationMode(v554, v660, v661, v662, v663, v664);
              objc_msgSend_setAutoCapitalizationMode_(v649, v666, v665, v667, v668, v669);
              v675 = objc_msgSend_autoCorrectionMode(v554, v670, v671, v672, v673, v674);
              objc_msgSend_setAutoCorrectionMode_(v649, v676, v675, v677, v678, v679);
              v685 = objc_msgSend_baseWritingDirection(v554, v680, v681, v682, v683, v684);
              objc_msgSend_setBaseWritingDirection_(v649, v686, v685, v687, v688, v689);
              v1146 = 0.0;
              objc_msgSend_textRecognitionResultForDrawing_options_error_(v649, v690, (uint64_t)v1119, (uint64_t)v1137, (uint64_t)&v1146, v691);
              v645 = (void *)objc_claimAutoreleasedReturnValue();
              v646 = *(id *)&v1146;
              if (v645)
              {

LABEL_158:
                v647 = objc_msgSend_tokenColumnCount(v645, v596, v597, v598, v599, v600) == 1;
                if (v360)
                  goto LABEL_159;
                goto LABEL_182;
              }
              if (qword_1EF568E88 == -1)
              {
                v764 = (id)qword_1EF568E48;
                if (!os_log_type_enabled(v764, OS_LOG_TYPE_ERROR))
                {
LABEL_180:

LABEL_181:
                  v645 = 0;
                  v647 = 0;
                  if (v360)
                    goto LABEL_159;
LABEL_182:
                  if (!v647)
                  {
                    v360 = 0;
                    v791 = 0;
LABEL_199:
                    if ((rect1 & 1) != 0)
                    {
                      v843 = v645;
                    }
                    else
                    {
                      v843 = (void *)objc_msgSend_mutableCopy(v645, v596, v597, v598, v599, v600);
                      objc_msgSend_setPrecedingLineBreaks_(v843, v844, v1106, v845, v846, v847);

                    }
                    v848 = [CHTextCorrectionResult alloc];
                    objc_msgSend_textInputTarget(v554, v849, v850, v851, v852, v853);
                    v854 = (void *)objc_claimAutoreleasedReturnValue();
                    isCharacterLevel_error = (void *)objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v848, v855, (uint64_t)v854, v1130, v360, (uint64_t)v843, 1, v791, v646);

                    goto LABEL_203;
                  }
                  objc_msgSend_topTranscription(v645, v596, v597, v598, v599, v600);
                  v694 = (id)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_length(v694, v771, v772, v773, v774, v775))
                  {
                    objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v694, v776, 0, v777, v778, v779);
                    v785 = v784 == (const char *)objc_msgSend_length(v694, v784, v780, v781, v782, v783);
                    v791 = v785;
                    if (v785)
                      v792 = rect1;
                    else
                      v792 = 0;
                    if (v792 == 1)
                    {
                      if (objc_msgSend_lastCharacterLevelPosition(v554, v786, v787, v788, v789, v790) == 0x7FFFFFFFFFFFFFFFLL
                        || objc_msgSend_lastCharacterLevelPosition(v554, v793, v794, v795, v796, v797) != v1130)
                      {
                        v360 = 0;
                        v791 = 1;
                      }
                      else
                      {
                        *(_OWORD *)buf = xmmword_1BE8D6920;
                        objc_msgSend_locales(self, v798, v799, v800, v801, v802);
                        v803 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_firstObject(v803, v804, v805, v806, v807, v808);
                        v809 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend__improvedSingleCharacterOneColumnTextResult_targetContentInfo_insertionRange_locale_affectedRange_(CHTextCorrectionRecognizer, v810, (uint64_t)v645, (uint64_t)v554, v1130, v360, v809, buf);
                        v811 = objc_claimAutoreleasedReturnValue();

                        v360 = *(_QWORD *)&buf[8];
                        v1130 = *(_QWORD *)buf;
                        v791 = 1;
                        v645 = (void *)v811;
                      }
                    }
                    else
                    {
                      v360 = 0;
                    }
                    goto LABEL_198;
                  }
                  v360 = 0;
LABEL_197:
                  v791 = 0;
LABEL_198:

                  goto LABEL_199;
                }
              }
              else
              {
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v764 = (id)qword_1EF568E48;
                if (!os_log_type_enabled(v764, OS_LOG_TYPE_ERROR))
                  goto LABEL_180;
              }
              objc_msgSend_description(v646, v765, v766, v767, v768, v769);
              v770 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v770;
              _os_log_impl(&dword_1BE607000, v764, OS_LOG_TYPE_ERROR, "Remote Recognition error: %@", buf, 0xCu);

              goto LABEL_180;
            }
          }
          else
          {
            v758 = v522;
            v759 = v1146;
            v760 = *(double *)&v1142;
            v761 = objc_msgSend_containsCommittedStrokes(v521, v523, v524, v525, v526, v527);
            v762 = v758 ^ 1;
            if (v759 < 0.0)
              v763 = v758 ^ 1;
            else
              v763 = 0;
            if (v759 > v760)
              v762 = 1;
            if (v762 | v763 | v761)
              v528 = 2;
            else
              v528 = 1;
            if (qword_1EF568E88 == -1)
              goto LABEL_129;
          }
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          goto LABEL_129;
        }
        v448 = rect1_16;
        v449 = v415;
        objc_msgSend_sharedSettings(CHTextInputProtoSettings, v450, v451, v452, v453, v454);
        v455 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_autoLineBreakEnabled(v455, v456, v457, v458, v459, v460)
          && (objc_msgSend_isSingleLine(v449, v461, v462, v463, v464, v465) & 1) == 0
          && objc_msgSend_supportsAutoLineBreaks(v449, v466, v467, v468, v469, v470))
        {
          objc_msgSend_sharedSettings(CHTextInputProtoSettings, v471, v472, v473, v474, v475);
          v476 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend_autoLineBreakRequireWeakCursor(v476, v477, v478, v479, v480, v481)
            || (objc_msgSend_isCursorStrong(v449, v482, v483, v484, v485, v486) & 1) == 0)
          {
            objc_msgSend_strokeCoveredTextRange(v449, v482, v483, v484, v485, v486);
            if (!v491 && (objc_msgSend_containsCommittedStrokes(v449, 0, v487, v488, v489, v490) & 1) == 0)
            {
              objc_msgSend_referenceSubstringRange(v449, v492, v493, v494, v495, v496);
              v873 = v872 == 0;

              if (!v873)
              {
                objc_msgSend_bounds(v448, v874, v875, v876, v877, v878);
                rect1a = v879;
                v1105 = v881;
                v1107 = v880;
                v883 = v882;
                objc_msgSend_referenceSubstring(v449, v884, v885, v886, v887, v888);
                v889 = (void *)objc_claimAutoreleasedReturnValue();
                hasSuffix = objc_msgSend_hasSuffix_(v889, v890, (uint64_t)CFSTR("\n\n"), v891, v892, v893);

                if ((hasSuffix & 1) != 0)
                {
                  v900 = 2;
                }
                else
                {
                  objc_msgSend_referenceSubstring(v449, v895, v896, v897, v898, v899);
                  v913 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v900) = objc_msgSend_hasSuffix_(v913, v914, (uint64_t)CFSTR("\n"), v915, v916, v917);

                  v900 = v900;
                }
                objc_msgSend_referenceSubstringRange(v449, v895, v896, v897, v898, v899);
                v923 = (uint64_t)&v918[~v900];
                if (v923 >= 1)
                {
                  v924 = objc_msgSend_characterRectsInReferenceSubstring(v449, v918, v919, v920, v921, v922) + 32 * v923;
                  v925 = *(double *)v924;
                  v926 = *(double *)(v924 + 8);
                  v927 = *(double *)(v924 + 16);
                  v928 = *(double *)(v924 + 24);
                  v1162.origin.x = rect1a;
                  v1162.size.width = v1105;
                  v1162.origin.y = v1107;
                  v1162.size.height = v883;
                  v929 = CGRectGetMinY(v1162);
                  v1163.origin.x = v925;
                  v1163.origin.y = v926;
                  v1163.size.width = v927;
                  v1163.size.height = v928;
                  MaxY = CGRectGetMaxY(v1163);
                  objc_msgSend_sharedSettings(CHTextInputProtoSettings, v931, v932, v933, v934, v935);
                  v936 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_autoLineBreakMinVerticalDistance(v936, v937, v938, v939, v940, v941);
                  v942 = v929 - MaxY;
                  v944 = v942 < v943;

                  if (!v944)
                  {
                    objc_msgSend_sharedSettings(CHTextInputProtoSettings, v945, v946, v947, v948, v949);
                    v950 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_autoLineBreakDualBreakVerticalDistance(v950, v951, v952, v953, v954, v955);
                    v957 = v942 < v956 ? 1 : 2;

                    v963 = v957 - v900;
                    if (v963 >= 1)
                    {
                      objc_msgSend_textInputTarget(v449, v958, v959, v960, v961, v962);
                      v964 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_frame(v964, v965, v966, v967, v968, v969);
                      rect2 = v970;
                      v972 = v971;
                      v974 = v973;
                      v976 = v975;

                      v1146 = 0.0;
                      v1147 = (id *)&v1146;
                      v1148 = 0x2020000000;
                      v1149 = 0xFFEFFFFFFFFFFFFFLL;
                      *(double *)&v1142 = 0.0;
                      v1143 = &v1142;
                      v1144 = 0x2020000000;
                      v1145 = 0x7FEFFFFFFFFFFFFFLL;
                      v982 = objc_msgSend_referenceSubstringRange(v449, v977, v978, v979, v980, v981);
                      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                      *(_QWORD *)&buf[8] = 3221225472;
                      v1152 = sub_1BE85B3A8;
                      v1153 = &unk_1E77F63C0;
                      v1154 = (id *)&v1146;
                      v1155 = &v1142;
                      objc_msgSend_enumerateCharacterRectsInRange_reverse_block_(v449, v983, v982, (uint64_t)v983, 1, (uint64_t)buf);
                      v984 = *((double *)v1147 + 3);
                      if (v984 == -1.79769313e308)
                        goto LABEL_231;
                      v1164.origin.x = v972;
                      v1164.origin.y = v974;
                      v1164.size.width = v976;
                      v1164.size.height = rect2;
                      if (v984 > CGRectGetMaxX(v1164))
                        goto LABEL_231;
                      v985 = *((double *)v1147 + 3);
                      v1165.origin.x = v972;
                      v1165.origin.y = v974;
                      v1165.size.width = v976;
                      v1165.size.height = rect2;
                      MaxX = CGRectGetMaxX(v1165);
                      v1166.origin.x = v972;
                      v1166.origin.y = v974;
                      v1166.size.width = v976;
                      v1166.size.height = rect2;
                      if (v985 <= MaxX + CGRectGetWidth(v1166) * -0.25)
                      {
LABEL_231:
                        v1167.origin.x = v972;
                        v1167.origin.y = v974;
                        v1167.size.width = v976;
                        v1167.size.height = rect2;
                        *((CGFloat *)v1147 + 3) = CGRectGetMaxX(v1167);
                      }
                      v987 = *((double *)v1143 + 3);
                      if (v987 == 1.79769313e308)
                        goto LABEL_235;
                      v1168.origin.x = v972;
                      v1168.origin.y = v974;
                      v1168.size.width = v976;
                      v1168.size.height = rect2;
                      if (v987 < CGRectGetMinX(v1168))
                        goto LABEL_235;
                      v988 = *((double *)v1143 + 3);
                      v1169.origin.x = v972;
                      v1169.origin.y = v974;
                      v1169.size.width = v976;
                      v1169.size.height = rect2;
                      MinX = CGRectGetMinX(v1169);
                      v1170.origin.x = v972;
                      v1170.origin.y = v974;
                      v1170.size.width = v976;
                      v1170.size.height = rect2;
                      if (v988 >= MinX + CGRectGetWidth(v1170) * 0.25)
                      {
LABEL_235:
                        v1171.origin.x = v972;
                        v1171.origin.y = v974;
                        v1171.size.width = v976;
                        v1171.size.height = rect2;
                        *((CGFloat *)v1143 + 3) = CGRectGetMinX(v1171);
                      }
                      objc_msgSend_sharedSettings(CHTextInputProtoSettings, v990, v991, v992, v993, v994);
                      v995 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_autoLineBreakAreaWidthFactor(v995, v996, v997, v998, v999, v1000);
                      v1002 = v1001;

                      v1008 = objc_msgSend_baseWritingDirection(v449, v1003, v1004, v1005, v1006, v1007);
                      v1009 = v976 * v1002;
                      v1010 = v1008 == 1 ? *((double *)v1147 + 3) - v1009 : *((double *)v1143 + 3);
                      v1172.origin.x = rect1a;
                      v1172.size.width = v1105;
                      v1172.origin.y = v1107;
                      v1172.size.height = v883;
                      v1054 = v974;
                      v1055 = rect2;
                      v1056 = CGRectIntersectsRect(v1172, *(CGRect *)(&v1009 - 2));
                      _Block_object_dispose(&v1142, 8);
                      _Block_object_dispose(&v1146, 8);
                      if (v1056)
                      {

                        objc_msgSend_stringByAppendingString_(v1126, v1057, (uint64_t)CFSTR("\n"), v1058, v1059, v1060);
                        v497 = (void *)objc_claimAutoreleasedReturnValue();

                        rect1 = 0;
                        v1106 = v963 & ~(v963 >> 63);
                        v1126 = v497;
                        if (!v497)
                          goto LABEL_136;
                        goto LABEL_124;
                      }
                    }
                  }
                }
              }
              goto LABEL_122;
            }
          }

        }
LABEL_122:

        goto LABEL_123;
      }
      goto LABEL_204;
    }
    v149 = v146;
    v150 = v147;
    v151 = v148;
    objc_msgSend_sharedSettings(CHTextInputProtoSettings, v152, v153, v154, v155, v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_lineBreakVerticalBarGestureEnabled(v157, v158, v159, v160, v161, v162)
      || objc_msgSend_strokeCount(v150, v163, v164, v165, v166, v167) != 1
      || (unint64_t)objc_msgSend_pointCountForStrokeIndex_(v150, v168, 0, v169, v170, v171) < 2
      || (objc_msgSend_bounds(v150, v172, v173, v174, v175, v176), v182 >= 10.0))
    {

      goto LABEL_46;
    }
    objc_msgSend_bounds(v150, v177, v178, v179, v180, v181);
    v184 = v183 > 10.0;

    if (!v184)
      goto LABEL_46;
    *(_QWORD *)buf = 0x7FFFFFFFFFFFFFFFLL;
    isDrawingCenterOnBlank_targetContentInfo_insertionLocation = objc_msgSend_isDrawingCenterOnBlank_targetContentInfo_insertionLocation_(CHTextInputGesture, v185, (uint64_t)v150, (uint64_t)v151, (uint64_t)buf, v186);
    LOBYTE(v1146) = 0;
    v191 = *(_QWORD *)buf == 0x7FFFFFFFFFFFFFFFLL ? 0 : isDrawingCenterOnBlank_targetContentInfo_insertionLocation;
    if (v191 != 1)
      goto LABEL_46;
    objc_msgSend_sketchRecognitionResultsForDrawing_options_(self->__shapeRecognizer, v188, (uint64_t)v149, 0, v189, v190);
    v1134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v1134, v192, v193, v194, v195, v196);
    isCharacterLevel_error = (void *)objc_claimAutoreleasedReturnValue();
    if (!isCharacterLevel_error)
    {
LABEL_266:

      goto LABEL_47;
    }
    isDirectionDownward = objc_msgSend_isVerticalBarShapeFromLineResult_originalDrawing_isDirectionDownward_(CHTextInputGesture, v197, (uint64_t)isCharacterLevel_error, (uint64_t)v150, (uint64_t)&v1146, v198);

    if ((isDirectionDownward & 1) == 0)
      goto LABEL_46;
    v1135 = objc_msgSend_referenceSubstringRange(v151, v200, v201, v202, v203, v204);
    v1124 = v205;
    if (!LOBYTE(v1146)
      && (objc_msgSend_sharedSettings(CHTextInputProtoSettings, v205, v206, v207, v208, v209),
          v210 = (void *)objc_claimAutoreleasedReturnValue(),
          v216 = objc_msgSend_lineBreakVerticalBarUpToDelete(v210, v211, v212, v213, v214, v215),
          v210,
          (v216 & 1) != 0)
      || (objc_msgSend_isSingleLine(v151, v205, v206, v207, v208, v209) & 1) != 0)
    {
      isCharacterLevel_error = 0;
    }
    else
    {
      v1011 = *(_QWORD *)buf;
      v1017 = 0;
      if (objc_msgSend_isCursorStrong(v151, v205, v206, v207, v208, v209)
        && objc_msgSend_selectedTextRange(v151, v1012, v1013, v1014, v1015, v1016) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v1011 = objc_msgSend_selectedTextRange(v151, v1012, v1018, v1014, v1015, v1016);
        v1017 = v1012;
      }
      v1123 = (uint64_t)v1017;
      objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v1012, 0, v1014, v1015, v1016);
      v1120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_boundsForStrokeIndexes_(v149, v1019, (uint64_t)v1120, v1020, v1021, v1022);
      rect1_16a = v1011;
      objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v1023, (uint64_t)CFSTR("\n"), (uint64_t)v1120, (uint64_t)&stru_1E77F6F28, 0);
      v1131 = (void *)objc_claimAutoreleasedReturnValue();
      v1024 = [CHTextCorrectionResult alloc];
      objc_msgSend_textInputTarget(v151, v1025, v1026, v1027, v1028, v1029);
      v1030 = (void *)objc_claimAutoreleasedReturnValue();
      isCharacterLevel_error = (void *)objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v1024, v1031, (uint64_t)v1030, rect1_16a, v1123, (uint64_t)v1131, 1, 0, 0);

    }
    if (isCharacterLevel_error || LOBYTE(v1146))
      goto LABEL_47;
    objc_msgSend_sharedSettings(CHTextInputProtoSettings, v205, v206, v207, v208, v209);
    v1032 = (void *)objc_claimAutoreleasedReturnValue();
    v1038 = objc_msgSend_lineBreakVerticalBarUpToDelete(v1032, v1033, v1034, v1035, v1036, v1037);

    if (!v1038)
    {
LABEL_46:
      isCharacterLevel_error = 0;
LABEL_47:

      goto LABEL_48;
    }
    isCharacterLevel_error = 0;
    if (*(_QWORD *)buf < v1135 || *(_QWORD *)buf > (unint64_t)&v1124[v1135])
      goto LABEL_47;
    if (objc_msgSend_isCursorStrong(v151, v1039, v1040, v1041, v1042, v1043))
    {
      v1049 = objc_msgSend_selectedTextRange(v151, v1044, v1045, v1046, v1047, v1048);
      v1052 = 0x7FFFFFFFFFFFFFFFLL;
      if (v1049 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v1053 = 0;
LABEL_260:
        if (v1052 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_265:
          v1127 = v1052;
          v1132 = (uint64_t)v1053;
          objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v1053, 0, v1046, v1047, v1048);
          v1134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_boundsForStrokeIndexes_(v149, v1086, (uint64_t)v1134, v1087, v1088, v1089);
          objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v1090, (uint64_t)&stru_1E77F6F28, (uint64_t)v1134, (uint64_t)&stru_1E77F6F28, 0);
          v1091 = (void *)objc_claimAutoreleasedReturnValue();
          v1092 = [CHTextCorrectionResult alloc];
          objc_msgSend_textInputTarget(v151, v1093, v1094, v1095, v1096, v1097);
          v1098 = (void *)objc_claimAutoreleasedReturnValue();
          isCharacterLevel_error = (void *)objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v1092, v1099, (uint64_t)v1098, v1127, v1132, (uint64_t)v1091, 1, 0, 0);

          goto LABEL_266;
        }
        if (*(_QWORD *)buf > v1135)
        {
          v1067 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v151, v1053, *(uint64_t *)buf, v1046, v1047, v1048);
          objc_msgSend_referenceSubstring(v151, v1068, v1069, v1070, v1071, v1072);
          v1073 = (void *)objc_claimAutoreleasedReturnValue();
          v1078 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v1073, v1074, v1067 - 1, v1075, v1076, v1077);
          v1080 = v1079;

          if (v1078 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v1085 = objc_msgSend_absoluteLocationFromRelativeLocation_(v151, v1081, v1078, v1082, v1083, v1084);
            if (v1085 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v1053 = v1080;
              v1052 = v1085;
              goto LABEL_265;
            }
          }
        }
        goto LABEL_46;
      }
      *(_QWORD *)buf = objc_msgSend_selectedTextRange(v151, v1050, v1051, v1046, v1047, v1048);
      objc_msgSend_selectedTextRange(v151, v1061, v1062, v1063, v1064, v1065);
      if (v1053)
      {
        v1052 = objc_msgSend_selectedTextRange(v151, v1053, v1066, v1046, v1047, v1048);
        goto LABEL_260;
      }
    }
    else
    {
      v1053 = 0;
    }
    v1052 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_260;
  }
LABEL_204:
  objc_msgSend_textResult(isCharacterLevel_error, v141, v142, v143, v144, v145);
  v856 = (void *)objc_claimAutoreleasedReturnValue();
  v857 = v856 == 0;

  if (!v857)
  {
    objc_msgSend_textResult(isCharacterLevel_error, v858, v859, v860, v861, v862);
    v863 = (void *)objc_claimAutoreleasedReturnValue();
    isValid = objc_msgSend_isValid(v863, v864, v865, v866, v867, v868);

    if ((isValid & 1) == 0)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v870 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v870, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v870, OS_LOG_TYPE_FAULT, "Expected nil or valid tokenized result as output of CHTextCorrectionRecognizer.", buf, 2u);
      }

    }
  }

  return isCharacterLevel_error;
}

+ (_NSRange)defaultTextAffectedRangeForTargetContentInfo:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t active;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSUInteger v22;
  NSUInteger v23;
  _NSRange result;

  v3 = a3;
  active = objc_msgSend_activePreviewRange(v3, v4, v5, v6, v7, v8);
  v15 = objc_msgSend_selectedTextRange(v3, v10, v11, v12, v13, v14);
  if (active == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v16;
      active = v15;
      goto LABEL_6;
    }
    active = objc_msgSend_textContentLength(v3, v16, v17, v18, v19, v20);
  }
  v21 = 0;
LABEL_6:

  v22 = active;
  v23 = (NSUInteger)v21;
  result.length = v23;
  result.location = v22;
  return result;
}

+ (id)_improvedSingleCharacterOneColumnTextResult:(id)a3 targetContentInfo:(id)a4 insertionRange:(_NSRange)a5 locale:(id)a6 affectedRange:(_NSRange *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  id v55;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
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
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  BOOL v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  uint64_t i;
  void *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  CHTokenizedTextResultToken *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  double v176;
  double v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  double v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  double v190;
  double v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  double v197;
  double v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  unint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  double v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  CHTokenizedTextResultToken *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  double v297;
  double v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  double v304;
  double v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  double v311;
  double v312;
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
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  double v343;
  double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  double v349;
  double v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  void *v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  double v380;
  double v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  _BOOL4 v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  void *v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  void *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  char isEqualToString;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  CHTokenizedTextResultToken *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  double v443;
  double v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  double v450;
  double v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
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
  void *v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  double v489;
  double v490;
  double v491;
  double v492;
  double v493;
  double v494;
  double v495;
  double v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  double v525;
  double v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  void *v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  void *v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  void *v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  void *v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  void *v575;
  uint64_t v576;
  const char *v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  void *v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
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
  CHTokenizedTextResult *v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  void *v600;
  const char *v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  void *v606;
  const char *v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  const char *v613;
  const char *v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  NSUInteger v618;
  unint64_t v619;
  void *v621;
  CHMutableTokenizedResultColumn *v622;
  void *v623;
  void *v624;
  double v625;
  double v626;
  double v627;
  double v628;
  double v629;
  double v630;
  double v631;
  double v632;
  double v633;
  uint64_t v634;
  void *v635;
  id v636;
  unint64_t v637;
  id obj;
  id v639;
  void *v640;
  double v641;
  double v642;
  void *v643;
  double v644;
  void *v645;
  void *v646;
  double v647;
  double v648;
  uint64_t v649;
  double v650;
  void *v651;
  uint64_t v652;
  void *v653;
  double v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  _OWORD v659[8];
  _OWORD v660[8];
  _OWORD v661[8];
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  CHMutableTokenizedResultColumn *v666;
  uint8_t v667[128];
  uint8_t buf[4];
  uint64_t v669;
  uint64_t v670;

  length = a5.length;
  location = a5.location;
  v670 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v636 = a4;
  v639 = a6;
  v635 = v11;
  if (objc_msgSend_tokenColumnCount(v11, v12, v13, v14, v15, v16) != 1)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v22 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v669 = objc_msgSend_tokenColumnCount(v11, v23, v24, v25, v26, v27);
      _os_log_impl(&dword_1BE607000, v22, OS_LOG_TYPE_FAULT, "Unexpected number of token columns in text result refinement for single character mode. Expected 1 token column, got %lu", buf, 0xCu);
    }

  }
  objc_msgSend_referenceSubstringRange(v636, v17, v18, v19, v20, v21);
  if (!v28)
    goto LABEL_17;
  v33 = objc_msgSend_referenceSubstringRange(v636, v28, v29, v30, v31, v32);
  if (!location)
    goto LABEL_17;
  if (location < v33)
    goto LABEL_17;
  if (length)
    goto LABEL_17;
  v38 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v636, v34, location, v35, v36, v37);
  objc_msgSend_referenceSubstring(v636, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v619 = objc_msgSend_rangeOfTokenAtCharacterIndex_inString_locale_(CHTextInputGesture, v45, v38 - 1, (uint64_t)v44, (uint64_t)v639, v46);
  v48 = v47;

  if (v619 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_17;
  v618 = v38 - v619;
  v54 = v38 - v619 < v48 && v38 >= v619;
  if (!v54 && v619 + v48 != v38)
  {
LABEL_17:
    v55 = v11;
    goto LABEL_18;
  }
  objc_msgSend_referenceSubstring(v636, v49, v50, v51, v52, v53);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringWithRange_(v57, v58, v619, v618, v59, v60);
  v640 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_tokenColumns(v11, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v66, v67, v68, v69, v70, v71);
  v621 = (void *)objc_claimAutoreleasedReturnValue();

  v622 = objc_alloc_init(CHMutableTokenizedResultColumn);
  objc_msgSend_transcriptionPaths(v11, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v77, v78, v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v634 = objc_msgSend_indexAtPosition_(v83, v84, 0, v85, v86, v87);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v88, v89, v90, v91, v92);
  v623 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v93, v94, v95, v96, v97);
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  v637 = 0;
LABEL_20:
  objc_msgSend_textTokenRows(v621, v98, v99, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v637 < objc_msgSend_count(v103, v104, v105, v106, v107, v108);

  if (v109)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v110, v111, v112, v113, v114);
    v651 = (void *)objc_claimAutoreleasedReturnValue();
    v664 = 0u;
    v665 = 0u;
    v662 = 0u;
    v663 = 0u;
    objc_msgSend_textTokenRows(v621, v115, v116, v117, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v120, v121, v637, v122, v123, v124);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v125, (uint64_t)&v662, (uint64_t)v667, 16, v126);
    if (!v127)
    {
      v658 = 0;
      v653 = 0;
      v626 = 0.0;
      v633 = 0.0;
      v650 = 0.0;
      goto LABEL_64;
    }
    v658 = 0;
    v653 = 0;
    v649 = *(_QWORD *)v663;
    v133 = 1;
    v626 = 0.0;
    v633 = 0.0;
    v650 = 0.0;
    while (1)
    {
      v652 = v127;
      for (i = 0; i != v652; ++i)
      {
        if (*(_QWORD *)v663 != v649)
          objc_enumerationMutation(obj);
        v135 = *(void **)(*((_QWORD *)&v662 + 1) + 8 * i);
        v136 = objc_msgSend_properties(v135, v128, v129, v130, v131, v132);
        if ((v133 & 1) != 0)
        {
          v142 = v136;
          objc_msgSend_string(v135, v137, v138, v139, v140, v141);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = objc_msgSend_autoCapitalizationMode(v636, v144, v145, v146, v147, v148);
          if ((v149 - 1) < 3)
            goto LABEL_32;
          if (v149 == 4)
          {
            objc_msgSend_uppercaseStringWithLocale_(v143, v150, (uint64_t)v639, v151, v152, v153);
            v657 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

            objc_msgSend_stringByAppendingString_(v640, v154, (uint64_t)v657, v155, v156, v157);
          }
          else
          {
            if (v149 == 5)
            {
LABEL_32:
              objc_msgSend_lowercaseStringWithLocale_(v143, v150, (uint64_t)v639, v151, v152, v153);
              v657 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_33;
            }
            v657 = v143;
            objc_msgSend_stringByAppendingString_(v640, v150, (uint64_t)v143, v151, v152, v153);
          }
          v656 = (void *)objc_claimAutoreleasedReturnValue();
          v158 = [CHTokenizedTextResultToken alloc];
          objc_msgSend_strokeIndexes(v135, v159, v160, v161, v162, v163);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = objc_msgSend_wordID(v135, v165, v166, v167, v168, v169);
          objc_msgSend_recognitionScore(v135, v171, v172, v173, v174, v175);
          v177 = v176;
          objc_msgSend_recognitionScore(v135, v178, v179, v180, v181, v182);
          v184 = v183;
          objc_msgSend_combinedScore(v135, v185, v186, v187, v188, v189);
          v191 = v190;
          objc_msgSend_alignmentScore(v135, v192, v193, v194, v195, v196);
          v198 = v197;
          objc_msgSend_recognizerSourceLocale(v135, v199, v200, v201, v202, v203);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          v641 = v198;
          v644 = v191;
          v647 = v184;
          v654 = v177;
          v210 = objc_msgSend_inputSources(v135, v205, v206, v207, v208, v209);
          v216 = objc_msgSend_substrokeCount(v135, v211, v212, v213, v214, v215);
          objc_msgSend_bounds(v135, v217, v218, v219, v220, v221);
          v223 = v222;
          v225 = v224;
          v227 = v226;
          v229 = v228;
          objc_msgSend_originalBounds(v135, v230, v231, v232, v233, v234);
          v241 = v240;
          v243 = v242;
          v245 = v244;
          v247 = v246;
          if (v135)
            objc_msgSend_principalLines(v135, v235, v236, v237, v238, v239);
          else
            memset(v661, 0, sizeof(v661));
          v248 = v142 & 0xFFFFFFFFFFFFFFDFLL;
          v249 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v158, v235, (uint64_t)v656, (uint64_t)v164, v170, v248, v204, v210 | 0x100, v654, v647, v644, v641, v223, v225, v227, v229, v216, v241, v243,
                           v245,
                           v247,
                           v661);

          objc_msgSend_addObject_(v651, v250, (uint64_t)v249, v251, v252, v253);
          objc_msgSend_combinedScore(v249, v254, v255, v256, v257, v258);
          v648 = v259;
          objc_msgSend_precedingSeparatorForToken_(v635, v260, (uint64_t)v135, v261, v262, v263);
          v655 = (void *)objc_claimAutoreleasedReturnValue();
          if (v637 != v634)
            goto LABEL_54;
          if (objc_msgSend_length(v655, v264, v265, v266, v267, v268))
          {
            objc_msgSend_string(v135, v269, v270, v271, v272, v273);
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingFormat_(v640, v275, (uint64_t)CFSTR("%@%@"), v276, v277, v278, v655, v274);
            v645 = (void *)objc_claimAutoreleasedReturnValue();

            v279 = [CHTokenizedTextResultToken alloc];
            objc_msgSend_strokeIndexes(v135, v280, v281, v282, v283, v284);
            v285 = (void *)objc_claimAutoreleasedReturnValue();
            v291 = objc_msgSend_wordID(v135, v286, v287, v288, v289, v290);
            objc_msgSend_recognitionScore(v135, v292, v293, v294, v295, v296);
            v298 = v297;
            objc_msgSend_recognitionScore(v135, v299, v300, v301, v302, v303);
            v305 = v304;
            objc_msgSend_combinedScore(v135, v306, v307, v308, v309, v310);
            v312 = v311;
            objc_msgSend_alignmentScore(v135, v313, v314, v315, v316, v317);
            v319 = v318;
            objc_msgSend_recognizerSourceLocale(v135, v320, v321, v322, v323, v324);
            v325 = (void *)objc_claimAutoreleasedReturnValue();
            v627 = v319;
            v629 = v312;
            v631 = v305;
            v642 = v298;
            v331 = objc_msgSend_inputSources(v135, v326, v327, v328, v329, v330);
            v337 = objc_msgSend_substrokeCount(v135, v332, v333, v334, v335, v336);
            objc_msgSend_bounds(v135, v338, v339, v340, v341, v342);
            v344 = v343;
            v346 = v345;
            v348 = v347;
            v350 = v349;
            objc_msgSend_originalBounds(v135, v351, v352, v353, v354, v355);
            v362 = v361;
            v364 = v363;
            v366 = v365;
            v368 = v367;
            if (v135)
              objc_msgSend_principalLines(v135, v356, v357, v358, v359, v360);
            else
              memset(v660, 0, sizeof(v660));
            v369 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v279, v356, (uint64_t)v645, (uint64_t)v285, v291, v248, v325, v331 | 0x200, v642, v631, v629, v627, v344, v346, v348, v350, v337, v362, v364,
                             v366,
                             v368,
                             v660);

            objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v370, (uint64_t)v369, v371, v372, v373);
            v374 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_combinedScore(v369, v375, v376, v377, v378, v379);
            v381 = v380;

            v633 = v633 + v381;
            v653 = (void *)v374;
          }
          objc_msgSend_string(v135, v269, v270, v271, v272, v273);
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          v388 = objc_msgSend_length(v382, v383, v384, v385, v386, v387) == 1;

          if (v388)
          {
            objc_msgSend_string(v135, v389, v390, v391, v392, v393);
            v394 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_uppercaseStringWithLocale_(v394, v395, (uint64_t)v639, v396, v397, v398);
            v399 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_isEqualToString_(v399, v400, (uint64_t)v657, v401, v402, v403))
            {
              objc_msgSend_string(v135, v404, v405, v406, v407, v408);
              v409 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lowercaseStringWithLocale_(v409, v410, (uint64_t)v639, v411, v412, v413);
              v414 = objc_claimAutoreleasedReturnValue();

              v399 = (void *)v414;
            }
            objc_msgSend_string(v135, v404, v405, v406, v407, v408);
            v415 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v399, v416, (uint64_t)v415, v417, v418, v419);

            if ((isEqualToString & 1) != 0)
            {
              v425 = (uint64_t)v658;
            }
            else
            {
              objc_msgSend_stringByAppendingString_(v640, v421, (uint64_t)v399, v422, v423, v424);
              v643 = (void *)objc_claimAutoreleasedReturnValue();
              v426 = [CHTokenizedTextResultToken alloc];
              objc_msgSend_strokeIndexes(v135, v427, v428, v429, v430, v431);
              v646 = (void *)objc_claimAutoreleasedReturnValue();
              v437 = objc_msgSend_wordID(v135, v432, v433, v434, v435, v436);
              objc_msgSend_modelScore(v135, v438, v439, v440, v441, v442);
              v444 = v443;
              objc_msgSend_recognitionScore(v135, v445, v446, v447, v448, v449);
              v451 = v450;
              objc_msgSend_combinedScore(v135, v452, v453, v454, v455, v456);
              v458 = v457;
              objc_msgSend_alignmentScore(v135, v459, v460, v461, v462, v463);
              v465 = v464;
              objc_msgSend_recognizerSourceLocale(v135, v466, v467, v468, v469, v470);
              v471 = (void *)objc_claimAutoreleasedReturnValue();
              v625 = v465;
              v628 = v458;
              v630 = v451;
              v632 = v444;
              v477 = objc_msgSend_inputSources(v135, v472, v473, v474, v475, v476);
              v483 = objc_msgSend_substrokeCount(v135, v478, v479, v480, v481, v482);
              objc_msgSend_bounds(v135, v484, v485, v486, v487, v488);
              v490 = v489;
              v492 = v491;
              v494 = v493;
              v496 = v495;
              objc_msgSend_originalBounds(v135, v497, v498, v499, v500, v501);
              v508 = v507;
              v510 = v509;
              v512 = v511;
              v514 = v513;
              if (v135)
                objc_msgSend_principalLines(v135, v502, v503, v504, v505, v506);
              else
                memset(v659, 0, sizeof(v659));
              v515 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v426, v502, (uint64_t)v643, (uint64_t)v646, v437, v248, v471, v477 | 0x100, v632, v630, v628, v625, v490, v492, v494, v496, v483, v508, v510,
                               v512,
                               v514,
                               v659);

              objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v516, (uint64_t)v515, v517, v518, v519);
              v425 = objc_claimAutoreleasedReturnValue();

              objc_msgSend_combinedScore(v515, v520, v521, v522, v523, v524);
              v526 = v525;

              v626 = v626 + v526;
            }

          }
          else
          {
LABEL_54:
            v425 = (uint64_t)v658;
          }

          v650 = v650 + v648;
          v658 = (void *)v425;
          goto LABEL_25;
        }
        objc_msgSend_addObject_(v651, v137, (uint64_t)v135, v139, v140, v141);
        if (v653)
          objc_msgSend_addObject_(v653, v128, (uint64_t)v135, v130, v131, v132);
        if (v658)
          objc_msgSend_addObject_(v658, v128, (uint64_t)v135, v130, v131, v132);
        else
          v658 = 0;
LABEL_25:
        v133 = 0;
      }
      v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v128, (uint64_t)&v662, (uint64_t)v667, 16, v132);
      v133 = 0;
      if (!v127)
      {
LABEL_64:

        v531 = objc_msgSend_addTokenRowWithTokens_(v622, v527, (uint64_t)v651, v528, v529, v530);
        objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v532, v531, v533, v534, v535);
        v536 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v623, v537, (uint64_t)v536, v538, v539, v540);

        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v541, v542, v543, v544, v545, v650);
        v546 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v624, v547, (uint64_t)v546, v548, v549, v550);

        if (v653)
        {
          v555 = objc_msgSend_addTokenRowWithTokens_(v622, v551, (uint64_t)v653, v552, v553, v554);
          objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v556, v555, v557, v558, v559);
          v560 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v623, v561, (uint64_t)v560, v562, v563, v564);

          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v565, v566, v567, v568, v569, v633);
          v570 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v624, v571, (uint64_t)v570, v572, v573, v574);

        }
        v575 = v658;
        if (v658)
        {
          v576 = objc_msgSend_addTokenRowWithTokens_(v622, v551, (uint64_t)v658, v552, v553, v554);
          objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v577, v576, v578, v579, v580);
          v581 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v623, v582, (uint64_t)v581, v583, v584, v585);

          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v586, v587, v588, v589, v590, v626);
          v591 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v624, v592, (uint64_t)v591, v593, v594, v595);

          v575 = v658;
        }

        ++v637;
        goto LABEL_20;
      }
    }
  }
  v596 = [CHTokenizedTextResult alloc];
  v666 = v622;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v597, (uint64_t)&v666, 1, v598, v599);
  v600 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingSeparator(v635, v601, v602, v603, v604, v605);
  v606 = (void *)objc_claimAutoreleasedReturnValue();
  v612 = objc_msgSend_recognizerGenerationIdentifier(v635, v607, v608, v609, v610, v611);
  v55 = (id)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v596, v613, (uint64_t)v600, (uint64_t)v623, (uint64_t)v624, (uint64_t)v606, v612);

  if (a7)
  {
    a7->location = objc_msgSend_absoluteLocationFromRelativeLocation_(v636, v614, v619, v615, v616, v617);
    a7->length = v618;
  }

LABEL_18:
  return v55;
}

- (NSArray)locales
{
  return self->_locales;
}

- (BOOL)isRemoteRecognition
{
  return self->_isRemoteRecognition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cornerDetector, 0);
  objc_storeStrong((id *)&self->__shapeRecognizer, 0);
  objc_storeStrong((id *)&self->__textRecognizer, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end
