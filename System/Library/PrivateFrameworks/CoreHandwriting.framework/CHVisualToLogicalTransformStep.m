@implementation CHVisualToLogicalTransformStep

- (CHVisualToLogicalTransformStep)initWithBaseDirection:(int)a3 mode:(int)a4
{
  CRBiDiTransform *v5;
  CHVisualToLogicalTransformStep *v6;
  CHVisualToLogicalTransformStep *v7;
  objc_class *v8;
  Class isa;
  objc_super v11;

  v5 = *(CRBiDiTransform **)&a3;
  v11.receiver = self;
  v11.super_class = (Class)CHVisualToLogicalTransformStep;
  v6 = -[CHVisualToLogicalTransformStep init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_bidiTransform = v5;
    v6->_mode = a4;
    v8 = (objc_class *)objc_alloc_init(MEMORY[0x1E0DBEC50]);
    isa = v7[1].super.super.super.isa;
    v7[1].super.super.super.isa = v8;

  }
  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
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
  NSObject *v49;
  CRBiDiTransform *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
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
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  CHVisualToLogicalTransformStep *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  BOOL v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  __int16 v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  const char *v186;
  const char *v187;
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
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t i;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  unint64_t j;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  BOOL v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
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
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  id v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  id v285;
  CRBiDiTransform *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  objc_class *v290;
  const char *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
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
  CRBiDiTransform *v307;
  NSObject *v308;
  const char *v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
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
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  id v356;
  id v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  void *v369;
  id v370;
  const char *v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t k;
  uint64_t v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  id v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  __CFString *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  void *v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  id v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  id v434;
  int v435;
  id v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  void *v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  void *v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  char v489;
  CHTokenizedTextResultToken *v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  double v507;
  double v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  double v514;
  double v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  double v521;
  double v522;
  const char *v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  double v528;
  double v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  void *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
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
  uint64_t v552;
  const char *v553;
  double v554;
  double v555;
  double v556;
  double v557;
  void *v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  const char *v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  unint64_t m;
  void *v569;
  const char *v570;
  uint64_t v571;
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
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  CHTokenizedTextResultToken *v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  double v608;
  double v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  double v615;
  double v616;
  const char *v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  double v622;
  double v623;
  const char *v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  double v629;
  double v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  void *v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  const char *v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  const char *v654;
  double v655;
  double v656;
  double v657;
  double v658;
  void *v659;
  const char *v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  const char *v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  NSObject *v670;
  const char *v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  void *v683;
  uint64_t v684;
  const char *v685;
  uint64_t v686;
  uint64_t v687;
  uint64_t v688;
  void *v689;
  const char *v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  void *v695;
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
  uint64_t v707;
  const char *v708;
  const char *v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  unint64_t n;
  const char *v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  void *v719;
  const char *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  void *v729;
  const char *v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  const char *v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  uint64_t v738;
  void *v739;
  const char *v740;
  uint64_t v741;
  uint64_t v742;
  uint64_t v743;
  const char *v744;
  uint64_t v745;
  uint64_t v746;
  uint64_t v747;
  uint64_t v748;
  void *v749;
  const char *v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  void *v755;
  const char *v756;
  uint64_t v757;
  uint64_t v758;
  uint64_t v759;
  void *v760;
  const char *v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  void *v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  void *v769;
  CRBiDiTransform *v770;
  const char *v771;
  uint64_t v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  void *v776;
  const char *v777;
  uint64_t v778;
  uint64_t v779;
  uint64_t v780;
  CRBiDiTransform *bidiTransform;
  id v783;
  id *v784;
  void *v785;
  void *v786;
  uint64_t v787;
  unsigned int isNaturallyRTL;
  uint64_t v789;
  id v790;
  void *v791;
  void *v792;
  uint64_t v793;
  void *v794;
  id v795;
  id v796;
  void *v797;
  void *v798;
  id v799;
  uint64_t (*v800)(uint64_t, uint64_t);
  void *v801;
  id v802;
  void *v803;
  void *v804;
  void *v805;
  id v806;
  id v807;
  unint64_t v809;
  void *v810;
  id *v811;
  void *v812;
  id v813;
  void *v814;
  id v815;
  id v816;
  void *v817;
  id v818;
  id obj;
  void *v820;
  void *v821;
  void *v822;
  void *v823;
  void *v824;
  unint64_t v825;
  void *v826;
  void *v827;
  _QWORD v828[5];
  id v829;
  id v830;
  id v831;
  unsigned __int8 v832;
  _QWORD v833[5];
  id v834;
  __int128 *v835;
  __int128 v836;
  __int128 v837;
  __int128 v838;
  __int128 v839;
  __int128 v840;
  __int128 v841;
  __int128 v842;
  __int128 v843;
  __int128 v844;
  uint64_t v845;
  __int16 v846;
  __int128 v847;
  __int128 v848;
  __int128 v849;
  __int128 v850;
  _BYTE buf[24];
  uint64_t (*v852)(uint64_t, uint64_t);
  CHVisualToLogicalTransformStep *v853;
  __int128 *v854;
  __int128 *v855;
  __int128 *v856;
  uint64_t v857;

  v857 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v783 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v811 = v5;
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHVisualToLogicalTransformStep is running", buf, 2u);
  }

  bidiTransform = self->_bidiTransform;
  if (((unint64_t)bidiTransform & 0xFFFFFFFFFFFFFFFELL) != 0xFE || self->_mode != 4)
    goto LABEL_13;
  v12 = v5;
  *(_QWORD *)&v847 = 0;
  *((_QWORD *)&v847 + 1) = &v847;
  v848 = 0x2020000000uLL;
  *(_QWORD *)&v840 = 0;
  *((_QWORD *)&v840 + 1) = &v840;
  *(_QWORD *)&v841 = 0x2020000000;
  *((_QWORD *)&v841 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v836 = 0;
  *((_QWORD *)&v836 + 1) = &v836;
  *(_QWORD *)&v837 = 0x2020000000;
  *((_QWORD *)&v837 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend_result(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v12, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v30, v31, 0, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v12, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_tokenColumnCount(v41, v42, v43, v44, v45, v46);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_1BE8B4480;
  v852 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E77F6848;
  v854 = &v847;
  v853 = self;
  v855 = &v836;
  v856 = &v840;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v18, v48, (uint64_t)v35, 0, v47, (uint64_t)buf);

  if (((unint64_t)self->_bidiTransform & 0xFFFFFFFFFFFFFFFELL) == 0xFE)
    self->_bidiTransform = *(CRBiDiTransform **)(*((_QWORD *)&v847 + 1) + 24);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v49 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    goto LABEL_11;
  }
  v49 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
LABEL_11:
    v50 = self->_bidiTransform;
    LODWORD(v844) = 134217984;
    *(_QWORD *)((char *)&v844 + 4) = v50;
    _os_log_impl(&dword_1BE607000, v49, OS_LOG_TYPE_DEBUG, "CHVisualToLogicalTransformStep resolved base direction to %li", (uint8_t *)&v844, 0xCu);
  }
LABEL_12:

  _Block_object_dispose(&v836, 8);
  _Block_object_dispose(&v840, 8);
  _Block_object_dispose(&v847, 8);

LABEL_13:
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v785 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v51, v52, v53, v54, v55);
  v786 = (void *)objc_claimAutoreleasedReturnValue();
  v809 = 0;
  while (1)
  {
    objc_msgSend_result(v811, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v61, v62, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v809 < objc_msgSend_count(v67, v68, v69, v70, v71, v72);

    if (!v73)
      break;
    objc_msgSend_result(v811, v74, v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v79, v80, v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v85, v86, v809, v87, v88, v89);
    v803 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v90, v91, v92, v93, v94);
    v797 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v95, v96, v97, v98, v99);
    v806 = (id)objc_claimAutoreleasedReturnValue();
    v100 = self;
    objc_msgSend_string(MEMORY[0x1E0CB3940], v101, v102, v103, v104, v105);
    v814 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(MEMORY[0x1E0CB3940], v106, v107, v108, v109, v110);
    v812 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v111, v112, v113, v114, v115);
    v804 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v116, v117, v118, v119, v120);
    v805 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v121, v122, v123, v124, v125);
    v794 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v126, v127, v128, v129, v130);
    v810 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v131, v132, v133, v134, v135);
    v801 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v844 = 0;
    *((_QWORD *)&v844 + 1) = &v844;
    v845 = 0x2020000000;
    v846 = 32;
    objc_msgSend_leftContext(v811, v136, v137, v138, v139, v140);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146)
    {
      objc_msgSend_leftContext(v811, v141, v142, v143, v144, v145);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend_length(v147, v148, v149, v150, v151, v152) == 0;

      v100 = self;
      if (!v153)
      {
        objc_msgSend_leftContext(v811, v141, v142, v143, v144, v145);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_leftContext(v811, v155, v156, v157, v158, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = objc_msgSend_length(v160, v161, v162, v163, v164, v165);
        v171 = objc_msgSend_characterAtIndex_(v154, v167, v166 - 1, v168, v169, v170);
        *(_WORD *)(*((_QWORD *)&v844 + 1) + 24) = v171;

        v100 = self;
      }
    }
    objc_msgSend_result(v811, v141, v142, v143, v144, v145);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v811, v173, v174, v175, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend_tokenColumnCount(v178, v179, v180, v181, v182, v183);
    v833[0] = MEMORY[0x1E0C809B0];
    v833[1] = 3221225472;
    v833[2] = sub_1BE8B601C;
    v833[3] = &unk_1E77F6870;
    v833[4] = v100;
    v835 = &v844;
    v185 = v794;
    v834 = v185;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v172, v186, (uint64_t)v803, 0, v184, (uint64_t)v833);

    v799 = v185;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v187, v188, v189, v190, v191);
    v820 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v192, v193, v194, v195, v196);
    v817 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v197, v198, v199, v200, v201);
    v824 = (void *)objc_claimAutoreleasedReturnValue();
    v849 = 0u;
    v850 = 0u;
    v847 = 0u;
    v848 = 0u;
    obj = v799;
    v209 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v202, (uint64_t)&v847, (uint64_t)buf, 16, v203);
    if (v209)
    {
      v210 = 0;
      v211 = *(_QWORD *)v848;
      do
      {
        for (i = 0; i != v209; ++i)
        {
          if (*(_QWORD *)v848 != v211)
            objc_enumerationMutation(obj);
          v213 = *(void **)(*((_QWORD *)&v847 + 1) + 8 * i);
          objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v204, v205, v206, v207, v208);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          for (j = 0; ; ++j)
          {
            objc_msgSend_string(v213, v214, v215, v216, v217, v218);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            v227 = j < objc_msgSend_length(v221, v222, v223, v224, v225, v226);

            if (!v227)
              break;
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v228, v210 + j, v230, v231, v232);
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v219, v234, (uint64_t)v233, v235, v236, v237);

          }
          v238 = (void *)objc_msgSend_copy(v219, v228, v229, v230, v231, v232);
          objc_msgSend_addObject_(v824, v239, (uint64_t)v238, v240, v241, v242);

          objc_msgSend_string(v213, v243, v244, v245, v246, v247);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v820, v249, (uint64_t)v248, v250, v251, v252);

          objc_msgSend_string(v213, v253, v254, v255, v256, v257);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          v264 = objc_msgSend_length(v258, v259, v260, v261, v262, v263);

          v210 += v264 + 1;
        }
        v209 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v204, (uint64_t)&v847, (uint64_t)buf, 16, v208);
      }
      while (v209);
    }

    objc_msgSend_componentsJoinedByString_(v820, v265, (uint64_t)CFSTR(" "), v266, v267, v268);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setString_(v817, v270, (uint64_t)v269, v271, v272, v273);

    v279 = (id)objc_msgSend_copy(v817, v274, v275, v276, v277, v278);
    v285 = (id)objc_msgSend_copy(v824, v280, v281, v282, v283, v284);

    v800 = (uint64_t (*)(uint64_t, uint64_t))v279;
    v796 = v285;

    v286 = self->_bidiTransform;
    v287 = 4;
    if (v286 != (CRBiDiTransform *)255)
      v287 = 0;
    if (v286 == (CRBiDiTransform *)254)
      v287 = 3;
    v288 = 2;
    if (v286 != (CRBiDiTransform *)1)
      v288 = 0;
    if (!v286)
      v288 = 1;
    if ((uint64_t)v286 <= 253)
      v289 = v288;
    else
      v289 = v287;
    v832 = 1;
    v290 = self[1].super.super.super.isa;
    v830 = v801;
    v831 = v806;
    v829 = v812;
    objc_msgSend_transformVisualToLogical_visualDirectionality_logicalBaseDirectionality_baseDirectionalityPredictionMode_outTokenizedLogicalOrderIndexes_outReorderingPermutation_outMirroredVisualString_outLogicalBaseDirection_(v290, v291, (uint64_t)v800, 2, v289, 0, &v831, &v830, &v829, &v832);
    v798 = (void *)objc_claimAutoreleasedReturnValue();
    v795 = v831;

    v818 = v830;
    v802 = v829;

    self->_bidiTransform = (CRBiDiTransform *)v832;
    if (!v798)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v308 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v308, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v308, OS_LOG_TYPE_FAULT, "CHVisualToLogicalTransformStep encountered ubidi failure", buf, 2u);
      }

      v784 = v811;
      goto LABEL_93;
    }
    v815 = v796;
    v790 = v795;
    v813 = v802;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v292, v293, v294, v295, v296);
    v792 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v297, v298, v299, v300, v301);
    v791 = (void *)objc_claimAutoreleasedReturnValue();
    v307 = self->_bidiTransform;
    if (v307 == (CRBiDiTransform *)1)
    {
      isNaturallyRTL = 1;
    }
    else if (v307 == (CRBiDiTransform *)255)
    {
      isNaturallyRTL = objc_msgSend__isNaturallyRTL(v813, v302, v303, v304, v305, v306);
    }
    else
    {
      isNaturallyRTL = 0;
    }
    v838 = 0u;
    v839 = 0u;
    v836 = 0u;
    v837 = 0u;
    v807 = v790;
    v787 = objc_msgSend_countByEnumeratingWithState_objects_count_(v807, v309, (uint64_t)&v836, (uint64_t)&v847, 16, v310);
    if (v787)
    {
      v789 = *(_QWORD *)v837;
      do
      {
        v793 = 0;
        while (2)
        {
          if (*(_QWORD *)v837 != v789)
            objc_enumerationMutation(v807);
          v825 = 0;
          v316 = *(void **)(*((_QWORD *)&v836 + 1) + 8 * v793);
          while (1)
          {
            if (v825 >= objc_msgSend_count(v815, v311, v312, v313, v314, v315))
              goto LABEL_75;
            objc_msgSend_objectAtIndexedSubscript_(v815, v317, v825, v318, v319, v320);
            v821 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_array(v316, v321, v322, v323, v324, v325);
            v326 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_sortedArrayUsingSelector_(v326, v327, (uint64_t)sel_compare_, v328, v329, v330);
            v331 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_array(v821, v332, v333, v334, v335, v336);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_sortedArrayUsingSelector_(v337, v338, (uint64_t)sel_compare_, v339, v340, v341);
            v342 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_isEqualToArray_(v331, v343, (uint64_t)v342, v344, v345, v346))
              break;

            ++v825;
          }
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v347, v825, v348, v349, v350);
          v351 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v792, v352, (uint64_t)v351, v353, v354, v355);

          v356 = v813;
          v357 = v316;
          v358 = (void *)MEMORY[0x1E0CB37A0];
          v364 = objc_msgSend_count(v357, v359, v360, v361, v362, v363);
          objc_msgSend_stringWithCapacity_(v358, v365, v364, v366, v367, v368);
          v369 = (void *)objc_claimAutoreleasedReturnValue();
          v842 = 0u;
          v843 = 0u;
          v840 = 0u;
          v841 = 0u;
          v370 = v357;
          v378 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v371, (uint64_t)&v840, (uint64_t)buf, 16, v372);
          if (v378)
          {
            v379 = *(_QWORD *)v841;
            do
            {
              for (k = 0; k != v378; ++k)
              {
                if (*(_QWORD *)v841 != v379)
                  objc_enumerationMutation(v370);
                v381 = objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v840 + 1) + 8 * k), v373, v374, v375, v376, v377);
                objc_msgSend_substringWithRange_(v356, v382, v381, 1, v383, v384);
                v385 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_appendString_(v369, v386, (uint64_t)v385, v387, v388, v389);

              }
              v378 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v373, (uint64_t)&v840, (uint64_t)buf, 16, v377);
            }
            while (v378);
          }

          v395 = (void *)objc_msgSend_copy(v369, v390, v391, v392, v393, v394);
          v396 = v395;
          v405 = CFSTR("الله");
          if ((objc_msgSend_isEqualToString_(v396, v397, (uint64_t)CFSTR("اللّه"), v398, v399, v400) & 1) == 0
            && (objc_msgSend_isEqualToString_(v396, v401, (uint64_t)CFSTR("اللَّه"), v402, v403, v404) & 1) == 0)
          {
            v405 = CFSTR("لله");
            if ((objc_msgSend_isEqualToString_(v396, v406, (uint64_t)CFSTR("للّه"), v407, v408, v409) & 1) == 0
              && (objc_msgSend_isEqualToString_(v396, v410, (uint64_t)CFSTR("للَّه"), v411, v412, v413) & 1) == 0)
            {
              v405 = (__CFString *)v396;
            }
          }

          v414 = (void *)objc_opt_class();
          objc_msgSend_performInverseBiDiForNumeric_isRTLContext_(v414, v415, (uint64_t)v405, isNaturallyRTL, v416, v417);
          v418 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObject_(v791, v419, (uint64_t)v418, v420, v421, v422);
          if (v825 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_75:

            v435 = 0;
            v428 = v804;
            v434 = v805;
            goto LABEL_76;
          }
          if (++v793 != v787)
            continue;
          break;
        }
        v787 = objc_msgSend_countByEnumeratingWithState_objects_count_(v807, v311, (uint64_t)&v836, (uint64_t)&v847, 16, v315);
      }
      while (v787);
    }

    v428 = (id)objc_msgSend_copy(v792, v423, v424, v425, v426, v427);
    v434 = (id)objc_msgSend_copy(v791, v429, v430, v431, v432, v433);
    v435 = 1;
LABEL_76:

    v436 = v428;
    v816 = v434;

    v442 = objc_msgSend_count(obj, v437, v438, v439, v440, v441);
    if (v442 == objc_msgSend_count(v436, v443, v444, v445, v446, v447))
    {
      if (v435)
      {
        if (objc_msgSend_count(obj, v448, v449, v450, v451, v452))
        {
          objc_msgSend_objectAtIndexedSubscript_(v436, v453, 0, v454, v455, v456);
          v457 = (void *)objc_claimAutoreleasedReturnValue();
          v463 = objc_msgSend_unsignedIntegerValue(v457, v458, v459, v460, v461, v462);

          objc_msgSend_objectAtIndexedSubscript_(obj, v464, v463, v465, v466, v467);
          v468 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v816, v469, 0, v470, v471, v472);
          v826 = (void *)objc_claimAutoreleasedReturnValue();
          v478 = objc_msgSend_properties(v468, v473, v474, v475, v476, v477);
          objc_msgSend_objectAtIndexedSubscript_(obj, v479, 0, v480, v481, v482);
          v483 = (void *)objc_claimAutoreleasedReturnValue();
          v489 = objc_msgSend_properties(v483, v484, v485, v486, v487, v488);

          v490 = [CHTokenizedTextResultToken alloc];
          objc_msgSend_strokeIndexes(v468, v491, v492, v493, v494, v495);
          v822 = (void *)objc_claimAutoreleasedReturnValue();
          v501 = objc_msgSend_wordID(v468, v496, v497, v498, v499, v500);
          objc_msgSend_modelScore(v468, v502, v503, v504, v505, v506);
          v508 = v507;
          objc_msgSend_recognitionScore(v468, v509, v510, v511, v512, v513);
          v515 = v514;
          objc_msgSend_combinedScore(v468, v516, v517, v518, v519, v520);
          v522 = v521;
          objc_msgSend_alignmentScore(v468, v523, v524, v525, v526, v527);
          v529 = v528;
          objc_msgSend_recognizerSourceLocale(v468, v530, v531, v532, v533, v534);
          v535 = (void *)objc_claimAutoreleasedReturnValue();
          v541 = objc_msgSend_inputSources(v468, v536, v537, v538, v539, v540);
          v547 = objc_msgSend_substrokeCount(v468, v542, v543, v544, v545, v546);
          objc_msgSend_bounds(v468, v548, v549, v550, v551, v552);
          v558 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v490, v553, (uint64_t)v826, (uint64_t)v822, v501, v489 & 0x20 | v478 & 0xFFFFFFFFFFFFFFDFLL, v535, v541, v508, v515, v522, v529, v554, v555, v556, v557, v547);

          objc_msgSend_addObject_(v810, v559, (uint64_t)v558, v560, v561, v562);
          for (m = 1; m < objc_msgSend_count(obj, v563, v564, v565, v566, v567); ++m)
          {
            objc_msgSend_objectAtIndexedSubscript_(v436, v453, m, v454, v455, v456);
            v569 = (void *)objc_claimAutoreleasedReturnValue();
            v575 = objc_msgSend_unsignedIntegerValue(v569, v570, v571, v572, v573, v574);

            objc_msgSend_objectAtIndexedSubscript_(obj, v576, v575, v577, v578, v579);
            v580 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v816, v581, m, v582, v583, v584);
            v827 = (void *)objc_claimAutoreleasedReturnValue();
            v590 = objc_msgSend_properties(v580, v585, v586, v587, v588, v589);
            v591 = [CHTokenizedTextResultToken alloc];
            objc_msgSend_strokeIndexes(v580, v592, v593, v594, v595, v596);
            v823 = (void *)objc_claimAutoreleasedReturnValue();
            v602 = objc_msgSend_wordID(v580, v597, v598, v599, v600, v601);
            objc_msgSend_modelScore(v580, v603, v604, v605, v606, v607);
            v609 = v608;
            objc_msgSend_recognitionScore(v580, v610, v611, v612, v613, v614);
            v616 = v615;
            objc_msgSend_combinedScore(v580, v617, v618, v619, v620, v621);
            v623 = v622;
            objc_msgSend_alignmentScore(v580, v624, v625, v626, v627, v628);
            v630 = v629;
            objc_msgSend_recognizerSourceLocale(v580, v631, v632, v633, v634, v635);
            v636 = (void *)objc_claimAutoreleasedReturnValue();
            v642 = objc_msgSend_inputSources(v580, v637, v638, v639, v640, v641);
            v648 = objc_msgSend_substrokeCount(v580, v643, v644, v645, v646, v647);
            objc_msgSend_bounds(v580, v649, v650, v651, v652, v653);
            v659 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v591, v654, (uint64_t)v827, (uint64_t)v823, v602, v590 | 0x20, v636, v642, v609, v616, v623, v630, v655, v656, v657, v658, v648);

            objc_msgSend_addObject_(v810, v660, (uint64_t)v659, v661, v662, v663);
          }
        }
        goto LABEL_92;
      }
    }
    else
    {
      v664 = objc_msgSend_count(obj, v448, v449, v450, v451, v452);
      if (v664 != objc_msgSend_count(v436, v665, v666, v667, v668, v669))
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v670 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v670, OS_LOG_TYPE_FAULT))
        {
          v676 = objc_msgSend_count(obj, v671, v672, v673, v674, v675);
          v682 = objc_msgSend_count(v436, v677, v678, v679, v680, v681);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v676;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v682;
          *(_WORD *)&buf[22] = 2112;
          v852 = v800;
          _os_log_impl(&dword_1BE607000, v670, OS_LOG_TYPE_FAULT, "CHVisualToLogicalTransformStep resulted in inconsistent token mapping. visualTokensInPath count (%lu) != tokenMapping count (%lu) for visual string %@", buf, 0x20u);
        }

      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v852 = sub_1BE8A7340;
    v853 = (CHVisualToLogicalTransformStep *)sub_1BE8A7350;
    v854 = 0;
    v683 = (void *)MEMORY[0x1E0CB37A0];
    v684 = objc_msgSend_length(v813, v448, v449, v450, v451, v452);
    objc_msgSend_stringWithCapacity_(v683, v685, v684, v686, v687, v688);
    v689 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v811, v690, v691, v692, v693, v694);
    v695 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v811, v696, v697, v698, v699, v700);
    v701 = (void *)objc_claimAutoreleasedReturnValue();
    v707 = objc_msgSend_tokenColumnCount(v701, v702, v703, v704, v705, v706);
    v828[0] = MEMORY[0x1E0C809B0];
    v828[1] = 3221225472;
    v828[2] = sub_1BE8B660C;
    v828[3] = &unk_1E77F46B0;
    v828[4] = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v695, v708, (uint64_t)v803, 0, v707, (uint64_t)v828);

    for (n = 0; n < objc_msgSend_count(v818, v709, v710, v711, v712, v713); ++n)
    {
      objc_msgSend_objectAtIndexedSubscript_(v818, v715, n, v716, v717, v718);
      v719 = (void *)objc_claimAutoreleasedReturnValue();
      v725 = objc_msgSend_integerValue(v719, v720, v721, v722, v723, v724);
      objc_msgSend_substringWithRange_(v813, v726, v725, 1, v727, v728);
      v729 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v689, v730, (uint64_t)v729, v731, v732, v733);

    }
    objc_msgSend_setString_(*(void **)(*(_QWORD *)&buf[8] + 40), v715, (uint64_t)v689, v716, v717, v718);
    v739 = (void *)objc_msgSend_copy(*(void **)(*(_QWORD *)&buf[8] + 40), v734, v735, v736, v737, v738);
    objc_msgSend_addObject_(v810, v740, (uint64_t)v739, v741, v742, v743);

    _Block_object_dispose(buf, 8);
LABEL_92:
    objc_msgSend_addObject_(v785, v453, (uint64_t)v810, v454, v455, v456);
    objc_msgSend_result(v811, v744, v745, v746, v747, v748);
    v749 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v749, v750, v751, v752, v753, v754);
    v755 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v755, v756, v809, v757, v758, v759);
    v760 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v786, v761, (uint64_t)v760, v762, v763, v764);

    v804 = v436;
    v805 = v816;
LABEL_93:

    _Block_object_dispose(&v844, 8);
    ++v809;
    if (!v798)
      goto LABEL_100;
  }
  objc_msgSend_result(v811, v74, v75, v76, v77, v78);
  v765 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v765, v766, (uint64_t)v785, (uint64_t)v786, v767, v768);
  v769 = (void *)objc_claimAutoreleasedReturnValue();
  if (v811)
    objc_storeStrong(v811 + 3, v769);

  v770 = self->_bidiTransform;
  objc_msgSend_result(v811, v771, v772, v773, v774, v775);
  v776 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseWritingDirection_(v776, v777, (uint64_t)v770, v778, v779, v780);

  if (self->_mode == 6)
    self->_bidiTransform = bidiTransform;
  v784 = v811;
LABEL_100:

  return v784;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.super.isa, 0);
}

@end
