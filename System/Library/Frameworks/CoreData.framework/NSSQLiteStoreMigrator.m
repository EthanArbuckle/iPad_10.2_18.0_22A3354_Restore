@implementation NSSQLiteStoreMigrator

id __70___NSSQLiteStoreMigrator_initWithStore_destinationModel_mappingModel___block_invoke(uint64_t a1)
{
  id result;

  result = -[NSSQLiteConnection fetchTableNames](*(id *)(*(_QWORD *)(a1 + 32) + 48));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = result;
  return result;
}

void __37___NSSQLiteStoreMigrator__disconnect__block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

void __43___NSSQLiteStoreMigrator_performMigration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSSQLEntity_DerivedAttributesExtension *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  _BYTE *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void (**v67)(_QWORD, _QWORD, _QWORD);
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void (**v72)(_QWORD, _QWORD, _QWORD);
  NSSQLEntity_DerivedAttributesExtension *v73;
  NSSQLEntity_DerivedAttributesExtension *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t ii;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  _BYTE *v88;
  void *v89;
  void *v90;
  BOOL v91;
  uint64_t v92;
  id *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t jj;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t kk;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t mm;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t nn;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t i1;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t i2;
  uint64_t v144;
  void *v145;
  _QWORD *v146;
  void *v147;
  uint64_t v148;
  int v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i3;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t i4;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t i5;
  _DWORD *v172;
  void *v173;
  int v174;
  _BOOL4 v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  NSObject *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t i6;
  void *v188;
  void *v189;
  NSSQLiteStatement *v190;
  void *v191;
  NSSQLiteStatement *v192;
  NSSQLiteStatement *v193;
  void *v194;
  NSSQLiteStatement *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t i7;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t i8;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  unint64_t i9;
  void *v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  NSSQLiteStatement *v217;
  NSSQLiteStatement *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t i10;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t i11;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t i12;
  uint64_t v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t i13;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t i14;
  uint64_t v244;
  void *v245;
  id v246;
  double v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  double v254;
  double v255;
  uint64_t v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  uint64_t v268;
  id v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  void *v276;
  void *v277;
  uint64_t v278;
  void *v279;
  uint64_t v280;
  uint64_t v281;
  unsigned int *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  NSSQLiteStatement *v287;
  _QWORD *v288;
  _QWORD *v289;
  void *v290;
  uint64_t v291;
  uint64_t v292;
  id v293;
  _BYTE *v294;
  void *v295;
  void *v296;
  uint64_t v297;
  void *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  unsigned int *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  NSSQLiteStatement *v308;
  void *v309;
  uint64_t v310;
  id v311;
  int v312;
  uint64_t v313;
  double v314;
  double v315;
  double v316;
  uint64_t v317;
  NSSQLiteStatement *v318;
  NSSQLiteStatement *v319;
  NSString *sqlString;
  NSSQLiteStatement *PrimaryKeyTable;
  uint64_t v322;
  void *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  uint64_t v329;
  NSSQLiteStatement *v330;
  uint64_t v331;
  void *v332;
  uint64_t v333;
  void *v334;
  uint64_t v335;
  void *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  NSSQLiteStatement *v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  void *v355;
  id v356;
  uint64_t v357;
  uint64_t v358;
  NSSQLiteStatement *v359;
  NSString *v360;
  NSSQLiteStatement *v361;
  NSString *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  void *v368;
  _QWORD *v369;
  uint64_t v370;
  uint64_t v371;
  id v372;
  uint64_t v373;
  NSString *v374;
  NSSQLiteStatement *v375;
  NSSQLiteStatement *v376;
  NSString *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t i15;
  uint64_t v382;
  void *v383;
  _QWORD *v384;
  uint64_t v385;
  _QWORD *v386;
  uint64_t v387;
  id v388;
  uint64_t v389;
  NSString *v390;
  NSSQLiteStatement *v391;
  NSSQLiteStatement *v392;
  NSString *v393;
  NSString *v394;
  NSSQLiteStatement *v395;
  NSSQLiteStatement *v396;
  NSString *v397;
  double v398;
  double v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  double v406;
  double v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  void *v415;
  id v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  double v435;
  double v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  CFMutableArrayRef v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  double v450;
  double v451;
  uint64_t v452;
  void *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t i16;
  uint64_t v457;
  void *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  double v465;
  void *v466;
  double v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  double v474;
  double v475;
  void *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  void *v485;
  int v486;
  void *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t i17;
  uint64_t v491;
  void *v492;
  NSSQLiteStatement *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  NSSQLiteStatement *v500;
  id v501;
  double v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  double v509;
  double v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  void *v520;
  void *v521;
  void *v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t i18;
  _QWORD *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  void *v533;
  uint64_t v534;
  double v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  double v542;
  double v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t i19;
  void *v552;
  void *v553;
  void *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t i20;
  _QWORD *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  double v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  double v573;
  double v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  _QWORD *v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  void *v591;
  void *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  int v596;
  uint64_t v597;
  double v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  double v605;
  double v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t i21;
  _QWORD *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  void *v623;
  double v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  double v632;
  double v633;
  void *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t i22;
  _QWORD *v644;
  void *v645;
  double v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  double v653;
  double v654;
  void *v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t i23;
  _QWORD *v665;
  void *v666;
  double v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  double v674;
  double v675;
  void *v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  void *v684;
  void *v685;
  uint64_t v686;
  uint64_t v687;
  uint64_t i32;
  uint64_t v689;
  void *v690;
  NSSQLiteStatement *v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t v695;
  uint64_t v696;
  uint64_t v697;
  NSSQLiteStatement *v698;
  void *v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t i33;
  uint64_t v703;
  void *v704;
  NSSQLiteStatement *v705;
  uint64_t v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  NSSQLiteStatement *v712;
  id v713;
  double v714;
  uint64_t v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  double v721;
  double v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  void *v730;
  void *v731;
  double v732;
  double v733;
  void *v734;
  double v735;
  double v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t i24;
  _QWORD *v740;
  uint64_t v741;
  uint64_t v742;
  uint64_t v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  void *v747;
  double v748;
  double v749;
  void *v750;
  double v751;
  double v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t i25;
  _QWORD *v756;
  uint64_t v757;
  uint64_t v758;
  uint64_t v759;
  uint64_t v760;
  uint64_t v761;
  uint64_t v762;
  void *v763;
  double v764;
  double v765;
  uint64_t v766;
  void *v767;
  double v768;
  double v769;
  uint64_t v770;
  uint64_t v771;
  uint64_t v772;
  uint64_t v773;
  void *v774;
  uint64_t v775;
  void *v776;
  void *v777;
  void *v778;
  void *v779;
  void *v780;
  void *v781;
  void *v782;
  uint64_t v783;
  uint64_t v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  void *v790;
  uint64_t v791;
  double v792;
  uint64_t v793;
  uint64_t v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  double v799;
  double v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  void *v808;
  uint64_t v809;
  void *v810;
  void *v811;
  uint64_t v812;
  uint64_t v813;
  uint64_t i26;
  _QWORD *v815;
  uint64_t v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  uint64_t v821;
  void *v822;
  void *v823;
  void *v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t i27;
  _QWORD *v828;
  uint64_t v829;
  uint64_t v830;
  uint64_t v831;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  void *v835;
  double v836;
  double v837;
  double v838;
  void *v839;
  uint64_t v840;
  char v841;
  void *v842;
  uint64_t v843;
  void *v844;
  void *v845;
  uint64_t v846;
  uint64_t v847;
  uint64_t i28;
  void *v849;
  void *v850;
  uint64_t v851;
  uint64_t v852;
  double v853;
  double v854;
  double v855;
  void *v856;
  double v857;
  int hasPersistentHistory;
  void *v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  uint64_t v865;
  uint64_t v866;
  double v867;
  double v868;
  void *v869;
  char v870;
  double v871;
  double v872;
  NSSQLiteStatement **v873;
  double v874;
  double v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  uint64_t v879;
  uint64_t v880;
  uint64_t v881;
  uint64_t v882;
  char v883;
  uint64_t v884;
  uint64_t v885;
  uint64_t i29;
  _QWORD *v887;
  uint64_t v888;
  uint64_t v889;
  uint64_t v890;
  uint64_t v891;
  uint64_t v892;
  uint64_t v893;
  void *v894;
  double v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  uint64_t v899;
  uint64_t v900;
  uint64_t v901;
  void *v902;
  uint64_t v903;
  uint64_t v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  double v909;
  double v910;
  uint64_t v911;
  uint64_t v912;
  uint64_t v913;
  uint64_t v914;
  uint64_t v915;
  uint64_t v916;
  double v917;
  double v918;
  void *v919;
  uint64_t v920;
  uint64_t v921;
  uint64_t v922;
  uint64_t v923;
  uint64_t v924;
  uint64_t v925;
  uint64_t v926;
  uint64_t v927;
  uint64_t i30;
  _QWORD *v929;
  uint64_t v930;
  uint64_t v931;
  uint64_t v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  void *v936;
  double v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  uint64_t v942;
  uint64_t v943;
  double v944;
  double v945;
  __CFString *v946;
  void *v947;
  void *v948;
  id v949;
  uint64_t v950;
  uint64_t v951;
  uint64_t v952;
  void *v953;
  uint64_t v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  uint64_t v958;
  uint64_t v959;
  double v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t v966;
  double v967;
  double v968;
  void *v969;
  uint64_t v970;
  uint64_t v971;
  uint64_t v972;
  uint64_t v973;
  uint64_t v974;
  uint64_t v975;
  uint64_t v976;
  uint64_t v977;
  uint64_t v978;
  id *v979;
  void *v980;
  uint64_t v981;
  _QWORD *v982;
  void *v983;
  uint64_t v984;
  uint64_t v985;
  uint64_t v986;
  uint64_t v987;
  void *v988;
  void *v989;
  void *v990;
  uint64_t v991;
  uint64_t v992;
  void *v993;
  uint64_t v994;
  char *v995;
  _QWORD *v996;
  void *v997;
  uint64_t v998;
  uint64_t v999;
  uint64_t v1000;
  uint64_t v1001;
  __CFString *v1002;
  __CFString *v1003;
  void *length;
  const __CFString *v1005;
  uint64_t v1006;
  uint64_t v1007;
  uint64_t v1008;
  uint64_t v1009;
  uint64_t v1010;
  uint64_t v1011;
  uint64_t v1012;
  double v1013;
  double v1014;
  void *v1015;
  uint64_t v1016;
  void *v1017;
  uint64_t v1018;
  const __CFString *v1019;
  void *v1020;
  uint64_t v1021;
  id v1022;
  void *v1023;
  uint64_t v1024;
  void *v1025;
  uint64_t v1026;
  id v1027;
  uint64_t v1028;
  uint64_t v1029;
  uint64_t v1030;
  uint64_t v1031;
  uint64_t v1032;
  uint64_t v1033;
  const __CFString *v1034;
  void *v1035;
  id v1036;
  id v1037;
  uint64_t v1038;
  void *v1039;
  _BYTE *v1040;
  void *v1041;
  void *v1042;
  _QWORD *v1043;
  id v1044;
  id v1045;
  id v1046;
  id v1047;
  id v1048;
  uint64_t v1049;
  uint64_t v1050;
  uint64_t v1051;
  void *v1052;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  void *v1057;
  void *v1058;
  void *v1059;
  void *v1060;
  void *v1061;
  void *v1062;
  void *v1063;
  void *v1064;
  void *v1065;
  void *i31;
  uint64_t v1067;
  uint64_t v1068;
  void *v1069;
  void *v1070;
  void *v1071;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  id objf;
  id v1079;
  int v1080;
  id v1081;
  id v1082;
  id v1083;
  int v1084;
  id v1085;
  id v1086;
  id v1087;
  id v1088;
  id v1089;
  id v1090;
  id v1091;
  id v1092;
  id v1093;
  id v1094;
  id v1095;
  int v1096;
  id v1097;
  id v1098;
  id v1099;
  id v1100;
  int v1101;
  id v1102;
  id v1103;
  id v1104;
  id v1105;
  char *v1106;
  char *v1107;
  _QWORD *v1108;
  id v1109;
  id v1110;
  id v1111;
  NSString *v1112;
  id v1113;
  id v1114;
  id v1115;
  id v1116;
  id v1117;
  id v1118;
  id v1119;
  id v1120;
  id v1121;
  id v1122;
  char *v1123;
  char *v1124;
  id v1125;
  id v1126;
  id v1127;
  id v1128;
  id v1129;
  id v1130;
  __CFString *v1131;
  id v1132;
  id v1133;
  id v1134;
  id v1135;
  id v1136;
  char v1137;
  id v1138;
  id v1139;
  uint64_t v1140;
  __int128 v1141;
  __int128 v1142;
  __int128 v1143;
  __int128 v1144;
  __int128 v1145;
  __int128 v1146;
  __int128 v1147;
  __int128 v1148;
  __int128 v1149;
  __int128 v1150;
  __int128 v1151;
  __int128 v1152;
  __int128 v1153;
  __int128 v1154;
  __int128 v1155;
  __int128 v1156;
  __int128 v1157;
  __int128 v1158;
  __int128 v1159;
  __int128 v1160;
  __int128 v1161;
  __int128 v1162;
  __int128 v1163;
  __int128 v1164;
  __int128 v1165;
  __int128 v1166;
  __int128 v1167;
  __int128 v1168;
  __int128 v1169;
  __int128 v1170;
  __int128 v1171;
  __int128 v1172;
  __int128 v1173;
  __int128 v1174;
  __int128 v1175;
  __int128 v1176;
  __int128 v1177;
  __int128 v1178;
  __int128 v1179;
  __int128 v1180;
  __int128 v1181;
  __int128 v1182;
  __int128 v1183;
  __int128 v1184;
  __int128 v1185;
  __int128 v1186;
  __int128 v1187;
  __int128 v1188;
  __int128 v1189;
  __int128 v1190;
  __int128 v1191;
  __int128 v1192;
  __int128 v1193;
  __int128 v1194;
  __int128 v1195;
  __int128 v1196;
  __int128 v1197;
  __int128 v1198;
  __int128 v1199;
  __int128 v1200;
  __int128 v1201;
  __int128 v1202;
  __int128 v1203;
  __int128 v1204;
  __int128 v1205;
  __int128 v1206;
  __int128 v1207;
  __int128 v1208;
  __int128 v1209;
  __int128 v1210;
  __int128 v1211;
  __int128 v1212;
  __int128 v1213;
  __int128 v1214;
  __int128 v1215;
  __int128 v1216;
  __int128 v1217;
  __int128 v1218;
  __int128 v1219;
  __int128 v1220;
  __int128 v1221;
  __int128 v1222;
  __int128 v1223;
  __int128 v1224;
  __int128 v1225;
  __int128 v1226;
  __int128 v1227;
  __int128 v1228;
  __int128 v1229;
  __int128 v1230;
  __int128 v1231;
  __int128 v1232;
  __int128 v1233;
  __int128 v1234;
  __int128 v1235;
  __int128 v1236;
  __int128 v1237;
  __int128 v1238;
  __int128 v1239;
  __int128 v1240;
  __int128 v1241;
  __int128 v1242;
  __int128 v1243;
  __int128 v1244;
  __int128 v1245;
  __int128 v1246;
  __int128 v1247;
  __int128 v1248;
  __int128 v1249;
  __int128 v1250;
  __int128 v1251;
  __int128 v1252;
  __int128 v1253;
  __int128 v1254;
  __int128 v1255;
  __int128 v1256;
  __int128 v1257;
  __int128 v1258;
  __int128 v1259;
  __int128 v1260;
  __int128 v1261;
  __int128 v1262;
  __int128 v1263;
  __int128 v1264;
  __int128 v1265;
  __int128 v1266;
  __int128 v1267;
  __int128 v1268;
  __int128 v1269;
  __int128 v1270;
  __int128 v1271;
  __int128 v1272;
  __int128 v1273;
  __int128 v1274;
  __int128 v1275;
  __int128 v1276;
  __int128 v1277;
  __int128 v1278;
  __int128 v1279;
  __int128 v1280;
  _BYTE v1281[128];
  _QWORD v1282[2];
  _QWORD v1283[2];
  _QWORD v1284[2];
  _QWORD v1285[2];
  _QWORD v1286[2];
  _BYTE v1287[128];
  _QWORD v1288[2];
  _QWORD v1289[2];
  _BYTE v1290[128];
  _QWORD v1291[2];
  _QWORD v1292[2];
  _BYTE v1293[128];
  _QWORD v1294[2];
  _QWORD v1295[2];
  _QWORD v1296[2];
  _QWORD v1297[2];
  _QWORD v1298[2];
  _BYTE v1299[128];
  _BYTE v1300[128];
  _QWORD v1301[2];
  _BYTE v1302[128];
  _BYTE v1303[128];
  _BYTE v1304[128];
  _QWORD v1305[2];
  _BYTE v1306[128];
  _QWORD v1307[2];
  _QWORD v1308[2];
  _BYTE v1309[128];
  _QWORD v1310[2];
  _QWORD v1311[2];
  _BYTE v1312[128];
  _QWORD v1313[2];
  _BYTE v1314[128];
  _QWORD v1315[2];
  _BYTE v1316[128];
  _BYTE v1317[128];
  _BYTE v1318[128];
  _QWORD v1319[2];
  _BYTE v1320[128];
  _QWORD v1321[2];
  _BYTE v1322[128];
  _QWORD v1323[2];
  _BYTE v1324[128];
  _QWORD v1325[2];
  _BYTE v1326[128];
  _QWORD v1327[2];
  _BYTE v1328[128];
  _BYTE v1329[128];
  _QWORD v1330[2];
  _BYTE v1331[128];
  _BYTE v1332[128];
  _QWORD v1333[2];
  _BYTE v1334[128];
  _BYTE v1335[128];
  _QWORD v1336[2];
  _QWORD v1337[2];
  _QWORD v1338[2];
  _QWORD v1339[2];
  _QWORD v1340[2];
  __int128 v1341;
  __int128 v1342;
  __int128 v1343;
  __int128 v1344;
  __int128 v1345;
  __int128 v1346;
  __int128 v1347;
  __int128 v1348;
  __int128 v1349;
  __int128 v1350;
  __int128 v1351;
  __int128 v1352;
  __int128 v1353;
  __int128 v1354;
  __int128 v1355;
  __int128 v1356;
  __int128 v1357;
  __int128 v1358;
  __int128 v1359;
  __int128 v1360;
  __int128 v1361;
  __int128 v1362;
  __int128 v1363;
  __int128 v1364;
  __int128 v1365;
  __int128 v1366;
  __int128 v1367;
  __int128 v1368;
  int v1369;
  _DWORD *v1370;
  uint64_t v1371;
  uint64_t v1372;
  void (*v1373)(uint64_t, void *, void *);
  void *v1374;
  uint64_t v1375;
  uint64_t v1376;
  NSSQLEntity_DerivedAttributesExtension *v1377;
  uint64_t v1378;

  v1 = MEMORY[0x1E0C80A78](a1);
  v1378 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v1052 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v1140 = v1;
  if (*(_BYTE *)(v1 + 64))
  {
    _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning lightweight migration on connection"), v4, v5, v6, v7, v8, v9, (uint64_t)v1034);
    v1040 = (_BYTE *)(v1 + 65);
    v16 = *(unsigned __int8 *)(v1 + 64);
    if (!*(_BYTE *)(v1 + 65))
      goto LABEL_7;
    if (*(_BYTE *)(v1 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Increasing SQLite cache size to 117MB"), v10, v11, v12, v13, v14, v15, (uint64_t)v1034);
  }
  else
  {
    v1040 = (_BYTE *)(v1 + 65);
    if (!*(_BYTE *)(v1 + 65))
      goto LABEL_9;
  }
  -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(*(_QWORD *)(v1 + 32) + 48), CFSTR("pragma cache_size = 30000"));
  v16 = *(unsigned __int8 *)(v1 + 64);
LABEL_7:
  if (v16)
    _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning creation of schema migration statements"), v10, v11, v12, v13, v14, v15, (uint64_t)v1034);
LABEL_9:
  v17 = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v18;
  v1044 = (id)MEMORY[0x18D76B4E4](v17);
  v20 = *(_QWORD *)(v1 + 32);
  if (!v20)
  {
    v1048 = 0;
    goto LABEL_313;
  }
  v1041 = (void *)MEMORY[0x18D76B4E4]();
  v21 = *(_QWORD *)(v20 + 24);
  if (v21)
    v22 = *(_QWORD *)(v21 + 40);
  else
    v22 = 0;
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v22);
  v1276 = 0u;
  v1275 = 0u;
  v1274 = 0u;
  v1273 = 0u;
  v23 = *(_QWORD *)(v20 + 16);
  if (v23)
    v24 = *(void **)(v23 + 40);
  else
    v24 = 0;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v1273, &v1357, 16);
  if (v25)
  {
    v1049 = *(_QWORD *)v1274;
    v1094 = v24;
    do
    {
      v1067 = 0;
      v1047 = (id)v25;
      do
      {
        if (*(_QWORD *)v1274 != v1049)
          objc_enumerationMutation(v24);
        v26 = *(_QWORD *)(*((_QWORD *)&v1273 + 1) + 8 * v1067);
        context = (void *)MEMORY[0x18D76B4E4]();
        v1062 = (void *)objc_msgSend((id)v26, "entityDescription");
        v27 = (NSSQLEntity_DerivedAttributesExtension *)-[NSSQLModel _sqlEntityWithRenamingIdentifier:](*(_QWORD *)(v20 + 24), (void *)objc_msgSend(v1062, "renamingIdentifier"));
        v1057 = (void *)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription");
        if (v27)
        {
          v28 = v26 ? *(_DWORD *)(v26 + 184) : 0;
          if (LODWORD(v27[4]._triggerSQL) != v28)
          {
            objc_msgSend(*(id *)(v20 + 72), "setObject:forKey:", v26, -[NSSQLEntity_DerivedAttributesExtension name](v27, "name"));
            *(_BYTE *)(v20 + 136) = 1;
            v1349 = 0u;
            v1350 = 0u;
            v1351 = 0u;
            v1352 = 0u;
            v29 = (void *)objc_msgSend((id)v26, "toManyRelationships");
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v1349, &v1371, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v1350;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v1350 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(_QWORD *)(*((_QWORD *)&v1349 + 1) + 8 * i);
                  if (v33)
                  {
                    v34 = *(_BYTE **)(v33 + 56);
                    if (v34)
                    {
                      if (v34[88])
                      {
                        v35 = (void *)objc_msgSend(v34, "entity");
                        v36 = (void *)objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend(v35, "name"));
                        if (v36)
                        {
                          objc_msgSend(v36, "addObject:", v34);
                        }
                        else
                        {
                          v1034 = 0;
                          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v34);
                          objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v37, objc_msgSend(v35, "name"));

                        }
                      }
                    }
                  }
                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v1349, &v1371, 16);
              }
              while (v30);
            }
            v24 = v1094;
            if (v26)
            {
              v38 = *(void **)(v26 + 152);
              if (v38)
              {
                if (objc_msgSend(v38, "count"))
                {
                  v1348 = 0u;
                  v1347 = 0u;
                  v1346 = 0u;
                  v1345 = 0u;
                  v39 = objc_msgSend((id)v26, "model");
                  v40 = v39 ? *(void **)(v39 + 40) : 0;
                  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v1345, &v1369, 16);
                  if (v41)
                  {
                    v1079 = v40;
                    v1083 = *(id *)v1346;
                    do
                    {
                      v42 = 0;
                      v1107 = (char *)v41;
                      do
                      {
                        if (*(id *)v1346 != v1083)
                          objc_enumerationMutation(v40);
                        v43 = *(void **)(*((_QWORD *)&v1345 + 1) + 8 * (_QWORD)v42);
                        v1341 = 0u;
                        v1342 = 0u;
                        v1343 = 0u;
                        v1344 = 0u;
                        v44 = (void *)objc_msgSend(v43, "foreignEntityKeyColumns");
                        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v1341, &v1365, 16);
                        v1124 = v42;
                        if (v45)
                        {
                          v46 = *(_QWORD *)v1342;
                          do
                          {
                            for (j = 0; j != v45; ++j)
                            {
                              if (*(_QWORD *)v1342 != v46)
                                objc_enumerationMutation(v44);
                              v48 = *(void **)(*((_QWORD *)&v1341 + 1) + 8 * j);
                              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "foreignKey"), "toOneRelationship"), "destinationEntity"), "isEqual:", v26))
                              {
                                v49 = (void *)objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend(v43, "name"));
                                if (v49)
                                {
                                  objc_msgSend(v49, "addObject:", v48);
                                }
                                else
                                {
                                  v1034 = 0;
                                  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v48);
                                  objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v50, objc_msgSend(v43, "name"));

                                }
                              }
                            }
                            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v1341, &v1365, 16);
                          }
                          while (v45);
                        }
                        v42 = v1124 + 1;
                        v24 = v1094;
                        v40 = v1079;
                      }
                      while (v1124 + 1 != v1107);
                      v41 = objc_msgSend(v1079, "countByEnumeratingWithState:objects:count:", &v1345, &v1369, 16);
                    }
                    while (v41);
                  }
                }
              }
            }
            v1280 = 0u;
            v1279 = 0u;
            v1278 = 0u;
            v1277 = 0u;
            v51 = (void *)objc_msgSend((id)v26, "manyToManyRelationships");
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v1277, &v1361, 16);
            if (v52)
            {
              v53 = *(_QWORD *)v1278;
              do
              {
                for (k = 0; k != v52; ++k)
                {
                  if (*(_QWORD *)v1278 != v53)
                    objc_enumerationMutation(v51);
                  v55 = *(_QWORD *)(*((_QWORD *)&v1277 + 1) + 8 * k);
                  v56 = (void *)objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend((id)v26, "name"));
                  if (v56)
                  {
                    objc_msgSend(v56, "addObject:", v55);
                  }
                  else
                  {
                    v1034 = 0;
                    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v55);
                    objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v57, objc_msgSend((id)v26, "name"));

                  }
                }
                v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v1277, &v1361, 16);
              }
              while (v52);
            }
            v25 = (uint64_t)v1047;
          }
        }
        v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v58, "addObjectsFromArray:", objc_msgSend(v1057, "attributeKeys"));
        objc_msgSend(v58, "addObjectsFromArray:", objc_msgSend(v1062, "attributeKeys"));
        v1272 = 0u;
        v1271 = 0u;
        v1270 = 0u;
        v1269 = 0u;
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v1269, &v1353, 16);
        if (v59)
        {
          v60 = *(_QWORD *)v1270;
          do
          {
            for (m = 0; m != v59; ++m)
            {
              if (*(_QWORD *)v1270 != v60)
                objc_enumerationMutation(v58);
              v62 = *(_QWORD *)(*((_QWORD *)&v1269 + 1) + 8 * m);
              -[_NSSQLiteStoreMigrator _determineAttributeTriggerToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v62, (uint64_t)v27, v26);
              -[_NSSQLiteStoreMigrator _determineRTreeExtensionsToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v62, v27, (void *)v26);
            }
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v1269, &v1353, 16);
          }
          while (v59);
        }

        v63 = (void *)objc_msgSend((id)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription"), "indexes");
        v64 = (void *)objc_msgSend((id)objc_msgSend((id)v26, "entityDescription"), "indexes");
        v65 = objc_msgSend(v63, "sortedArrayUsingComparator:", &__block_literal_global_425);
        v66 = objc_msgSend(v64, "sortedArrayUsingComparator:", &__block_literal_global_426);
        v1371 = MEMORY[0x1E0C809B0];
        v1372 = 3221225472;
        v1373 = __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke;
        v1374 = &unk_1E1EE0768;
        v1375 = v20;
        v1376 = v26;
        v1377 = v27;
        v67 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(&v1371, "copy");
        v67[2](v67, v65, v66);

        v68 = (void *)objc_msgSend((id)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription"), "_uniquenessConstraintsAsFetchIndexes");
        v69 = (void *)objc_msgSend((id)objc_msgSend((id)v26, "entityDescription"), "_uniquenessConstraintsAsFetchIndexes");
        v70 = objc_msgSend(v68, "sortedArrayUsingComparator:", &__block_literal_global_427);
        v71 = objc_msgSend(v69, "sortedArrayUsingComparator:", &__block_literal_global_428);
        v1371 = MEMORY[0x1E0C809B0];
        v1372 = 3221225472;
        v1373 = __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke;
        v1374 = &unk_1E1EE0768;
        v1375 = v20;
        v1376 = v26;
        v1377 = v27;
        v72 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(&v1371, "copy");
        v72[2](v72, v70, v71);

        v73 = -[NSSQLEntity derivedAttributesExtension](v27);
        if (v73)
          objc_msgSend(*(id *)(v20 + 184), "addObject:", v73);
        v74 = -[NSSQLEntity derivedAttributesExtension]((NSSQLEntity_DerivedAttributesExtension *)v26);
        if (v74)
          objc_msgSend(*(id *)(v20 + 192), "addObject:", v74);
        if (v27)
          objc_msgSend(obj, "removeObject:", v27);
        objc_autoreleasePoolPop(context);
        ++v1067;
      }
      while (v1067 != v25);
      v75 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v1273, &v1357, 16);
      v25 = v75;
    }
    while (v75);
  }
  v1368 = 0u;
  v1367 = 0u;
  v1366 = 0u;
  v1365 = 0u;
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1365, &v1371, 16);
  if (v76)
  {
    v1125 = *(id *)v1366;
    do
    {
      for (n = 0; n != v76; ++n)
      {
        if (*(id *)v1366 != v1125)
          objc_enumerationMutation(obj);
        v78 = *(void **)(*((_QWORD *)&v1365 + 1) + 8 * n);
        v79 = (void *)MEMORY[0x18D76B4E4]();
        v1364 = 0u;
        v1363 = 0u;
        v1362 = 0u;
        v1361 = 0u;
        v80 = (void *)objc_msgSend((id)objc_msgSend(v78, "entityDescription"), "attributeKeys");
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v1361, &v1369, 16);
        if (v81)
        {
          v82 = *(_QWORD *)v1362;
          do
          {
            for (ii = 0; ii != v81; ++ii)
            {
              if (*(_QWORD *)v1362 != v82)
                objc_enumerationMutation(v80);
              v84 = *(_QWORD *)(*((_QWORD *)&v1361 + 1) + 8 * ii);
              -[_NSSQLiteStoreMigrator _determineAttributeTriggerToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v84, (uint64_t)v78, 0);
              -[_NSSQLiteStoreMigrator _determineRTreeExtensionsToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:](v20, v84, v78, 0);
            }
            v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v1361, &v1369, 16);
          }
          while (v81);
        }
        objc_autoreleasePoolPop(v79);
      }
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1365, &v1371, 16);
    }
    while (v76);
  }
  v1363 = 0u;
  v1364 = 0u;
  v1361 = 0u;
  v1362 = 0u;
  v85 = (void *)objc_msgSend(*(id *)(v20 + 40), "entityMappings");
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v1361, &v1369, 16);
  if (v86)
  {
    v87 = *(void **)v1362;
    contexta = *(void **)v1362;
    v1058 = v85;
    do
    {
      v1126 = 0;
      v1063 = (void *)v86;
      do
      {
        if (*(void **)v1362 != v87)
          objc_enumerationMutation(v85);
        v88 = *(_BYTE **)(*((_QWORD *)&v1361 + 1) + 8 * (_QWORD)v1126);
        v1095 = (id)MEMORY[0x18D76B4E4]();
        v89 = (void *)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", objc_msgSend(v88, "destinationEntityName"));
        v90 = (void *)objc_msgSend(*(id *)(v20 + 24), "entityNamed:", objc_msgSend(v88, "sourceEntityName"));
        v1108 = -[_NSSQLEntityMigrationDescription initWithEntityMapping:sourceEntity:destinationEntity:]([_NSSQLEntityMigrationDescription alloc], v88, v90, v89);
        if (v90)
          v91 = v89 == 0;
        else
          v91 = 1;
        if (!v91)
          objc_msgSend(*(id *)(v20 + 88), "setObject:forKey:", v89, objc_msgSend(v90, "name"));
        if (objc_msgSend(v88, "mappingType") != 3 && !objc_msgSend((id)objc_msgSend(v89, "name"), "length"))
        {
LABEL_985:
          v1020 = (void *)MEMORY[0x1E0C99D80];
          v1021 = objc_msgSend(v88, "name");
          v1017 = (void *)objc_msgSend(v1020, "dictionaryWithObjectsAndKeys:", v1021, CFSTR("entityMapping"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v88, "mappingType")), CFSTR("mappingType"), 0);
          v1018 = *MEMORY[0x1E0C99768];
          v1019 = CFSTR("Unsupported entity mapping type with empty entity name");
LABEL_986:
          v1022 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v1018, 134110, (uint64_t)v1019, v1017);
          objc_exception_throw(v1022);
        }
        v92 = objc_msgSend(v89, "name");
        switch(objc_msgSend(v88, "mappingType"))
        {
          case 2:
            *(_BYTE *)(v20 + 136) = 1;
            v93 = (id *)(v20 + 96);
            if (!v92)
              goto LABEL_143;
            goto LABEL_142;
          case 3:
            *(_BYTE *)(v20 + 136) = 1;
            if (!objc_msgSend((id)objc_msgSend(v90, "name"), "length"))
              goto LABEL_985;
            v102 = objc_msgSend(v90, "name");
            v103 = (void *)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v102);
            v104 = v103;
            if (v103
              && (v105 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("NSEntityRenamingShouldRebaseKey"))) != 0&& objc_msgSend(v105, "isEqualToString:", v102))
            {
              _NSCoreDataLog(2, (uint64_t)CFSTR("Collapsing Entity Hierarchy for: %@"), v106, v107, v108, v109, v110, v111, v102);
              objc_msgSend(*(id *)(v20 + 72), "setObject:forKey:", v104, objc_msgSend(v90, "name"));
            }
            else
            {
              objc_msgSend(*(id *)(v20 + 104), "setObject:forKey:", v1108, v102);
            }
            goto LABEL_143;
          case 4:
            goto LABEL_141;
          case 5:
            if (!v88 || (v88[120] & 2) == 0)
              goto LABEL_137;
            if (!*(_QWORD *)(v20 + 56))
              *(_QWORD *)(v20 + 56) = -[NSSQLiteConnection fetchTableCreationSQL](*(id *)(v20 + 48));
            v94 = (void *)objc_msgSend((id)objc_msgSend(v90, "rootEntity"), "tableName");
            v1368 = 0u;
            v1367 = 0u;
            v1366 = 0u;
            v1365 = 0u;
            v95 = *(void **)(v20 + 56);
            v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v1365, &v1371, 16);
            if (!v96)
              goto LABEL_129;
            v97 = *(_QWORD *)v1366;
            break;
          default:
            v1015 = (void *)MEMORY[0x1E0C99D80];
            v1016 = objc_msgSend(v88, "name");
            v1017 = (void *)objc_msgSend(v1015, "dictionaryWithObjectsAndKeys:", v1016, CFSTR("entityMapping"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v88, "mappingType")), CFSTR("mappingType"), 0);
            v1018 = *MEMORY[0x1E0C99768];
            v1019 = CFSTR("Unsupported entity mapping type");
            goto LABEL_986;
        }
        while (2)
        {
          for (jj = 0; jj != v96; ++jj)
          {
            if (*(_QWORD *)v1366 != v97)
              objc_enumerationMutation(v95);
            v99 = *(void **)(*((_QWORD *)&v1365 + 1) + 8 * jj);
            v100 = objc_msgSend(v99, "firstObject");
            v101 = (void *)objc_msgSend(v99, "lastObject");
            if ((objc_msgSend(v94, "isEqual:", v100) & 1) != 0)
            {
              v112 = objc_msgSend(v101, "rangeOfString:", CFSTR(" UNIQUE"));
              v85 = v1058;
              v86 = (uint64_t)v1063;
              v87 = contexta;
              if (v112 != 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_139;
LABEL_137:
              v93 = (id *)(v20 + 112);
              if (!v92)
                goto LABEL_143;
LABEL_142:
              objc_msgSend(*v93, "setObject:forKey:", v1108, v92);
              goto LABEL_143;
            }
          }
          v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v1365, &v1371, 16);
          if (v96)
            continue;
          break;
        }
LABEL_129:
        v85 = v1058;
        v86 = (uint64_t)v1063;
        v87 = contexta;
LABEL_139:
        if (v1108)
        {
          *((_BYTE *)v1108 + 96) = 1;
          objc_msgSend(v88, "setMappingType:", 4);
          objc_msgSend(v88, "setName:", objc_msgSend((id)objc_msgSend(v88, "name"), "stringByAppendingString:", CFSTR("_AsCopy")));
          *((_DWORD *)v1108 + 12) = 2;
        }
        else
        {
          objc_msgSend(v88, "setMappingType:", 4);
          objc_msgSend(v88, "setName:", objc_msgSend((id)objc_msgSend(v88, "name"), "stringByAppendingString:", CFSTR("_AsCopy")));
        }
LABEL_141:
        v93 = (id *)(v20 + 120);
        if (v92)
          goto LABEL_142;
LABEL_143:

        objc_autoreleasePoolPop(v1095);
        v1126 = (char *)v1126 + 1;
      }
      while (v1126 != (id)v86);
      v113 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v1361, &v1369, 16);
      v86 = v113;
    }
    while (v113);
  }
  v1345 = 0u;
  v1346 = 0u;
  v1347 = 0u;
  v1348 = 0u;
  v114 = *(void **)(v20 + 112);
  v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v1345, &v1371, 16);
  if (v115)
  {
    v116 = *(_QWORD *)v1346;
    do
    {
      for (kk = 0; kk != v115; ++kk)
      {
        if (*(_QWORD *)v1346 != v116)
          objc_enumerationMutation(v114);
        v118 = *(_QWORD *)(*((_QWORD *)&v1345 + 1) + 8 * kk);
        v119 = (void *)MEMORY[0x18D76B4E4]();
        -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, objc_msgSend(*(id *)(v20 + 112), "objectForKey:", v118), (void *)objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v118), "rootEntity"), 3);
        objc_autoreleasePoolPop(v119);
      }
      v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v1345, &v1371, 16);
    }
    while (v115);
  }
  v120 = objc_alloc(MEMORY[0x1E0C99E20]);
  v121 = *(_QWORD *)(v20 + 16);
  if (v121)
    v122 = *(void **)(v121 + 40);
  else
    v122 = 0;
  v123 = (void *)objc_msgSend(v120, "initWithCapacity:", objc_msgSend(v122, "count"));
  v1344 = 0u;
  v1343 = 0u;
  v1342 = 0u;
  v1341 = 0u;
  v124 = *(void **)(v20 + 120);
  v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v1341, &v1369, 16);
  if (v125)
  {
    v126 = *(_QWORD *)v1342;
    do
    {
      for (mm = 0; mm != v125; ++mm)
      {
        if (*(_QWORD *)v1342 != v126)
          objc_enumerationMutation(v124);
        objc_msgSend(v123, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", *(_QWORD *)(*((_QWORD *)&v1341 + 1) + 8 * mm)), "rootEntity"));
      }
      v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v1341, &v1369, 16);
    }
    while (v125);
  }
  v1280 = 0u;
  v1279 = 0u;
  v1278 = 0u;
  v1277 = 0u;
  v128 = *(void **)(v20 + 112);
  v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v1277, &v1365, 16);
  if (v129)
  {
    v130 = *(_QWORD *)v1278;
    do
    {
      for (nn = 0; nn != v129; ++nn)
      {
        if (*(_QWORD *)v1278 != v130)
          objc_enumerationMutation(v128);
        objc_msgSend(v123, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", *(_QWORD *)(*((_QWORD *)&v1277 + 1) + 8 * nn)), "rootEntity"));
      }
      v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v1277, &v1365, 16);
    }
    while (v129);
  }
  v1276 = 0u;
  v1275 = 0u;
  v1274 = 0u;
  v1273 = 0u;
  v132 = *(void **)(v20 + 96);
  v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v1273, &v1361, 16);
  if (v133)
  {
    v134 = *(_QWORD *)v1274;
    do
    {
      for (i1 = 0; i1 != v133; ++i1)
      {
        if (*(_QWORD *)v1274 != v134)
          objc_enumerationMutation(v132);
        v136 = *(_QWORD *)(*((_QWORD *)&v1273 + 1) + 8 * i1);
        v137 = (void *)MEMORY[0x18D76B4E4]();
        v138 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v136), "rootEntity");
        v139 = objc_msgSend(*(id *)(v20 + 96), "objectForKey:", v136);
        if (objc_msgSend(v123, "containsObject:", v138))
          v140 = 3;
        else
          v140 = 0;
        -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, v139, v138, v140);
        objc_autoreleasePoolPop(v137);
      }
      v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v1273, &v1361, 16);
    }
    while (v133);
  }
  v1272 = 0u;
  v1271 = 0u;
  v1270 = 0u;
  v1269 = 0u;
  v1127 = *(id *)(v20 + 104);
  v141 = objc_msgSend(v1127, "countByEnumeratingWithState:objects:count:", &v1269, &v1357, 16);
  if (v141)
  {
    v142 = *(_QWORD *)v1270;
    do
    {
      for (i2 = 0; i2 != v141; ++i2)
      {
        if (*(_QWORD *)v1270 != v142)
          objc_enumerationMutation(v1127);
        v144 = *(_QWORD *)(*((_QWORD *)&v1269 + 1) + 8 * i2);
        v145 = (void *)MEMORY[0x18D76B4E4]();
        v146 = (_QWORD *)objc_msgSend(*(id *)(v20 + 24), "entityNamed:", v144);
        v147 = (void *)objc_msgSend(v146, "rootEntity");
        v148 = objc_msgSend(*(id *)(v20 + 104), "objectForKey:", v144);
        if (v146 && !v146[20] || objc_msgSend(*(id *)(v20 + 104), "objectForKey:", objc_msgSend(v147, "name")))
        {
          v149 = 1;
        }
        else
        {
          v147 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v20 + 88), "objectForKey:", objc_msgSend(v147, "name")), "rootEntity");
          v149 = 3;
        }
        -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, v148, v147, v149);
        objc_autoreleasePoolPop(v145);
      }
      v141 = objc_msgSend(v1127, "countByEnumeratingWithState:objects:count:", &v1269, &v1357, 16);
    }
    while (v141);
  }
  v1268 = 0u;
  v1267 = 0u;
  v1266 = 0u;
  v1265 = 0u;
  v150 = *(void **)(v20 + 80);
  v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v1265, &v1353, 16);
  if (v151)
  {
    v152 = *(_QWORD *)v1266;
    do
    {
      for (i3 = 0; i3 != v151; ++i3)
      {
        if (*(_QWORD *)v1266 != v152)
          objc_enumerationMutation(v150);
        v154 = *(_QWORD *)(*((_QWORD *)&v1265 + 1) + 8 * i3);
        v155 = (void *)MEMORY[0x18D76B4E4]();
        v156 = (void *)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v154);
        v157 = objc_msgSend(*(id *)(v20 + 120), "objectForKey:", objc_msgSend(v156, "name"));
        if (v157)
          -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, v157, (void *)objc_msgSend(v156, "rootEntity"), 3);
        objc_autoreleasePoolPop(v155);
      }
      v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v1265, &v1353, 16);
    }
    while (v151);
  }
  v1264 = 0u;
  v1263 = 0u;
  v1262 = 0u;
  v1261 = 0u;
  v1128 = *(id *)(v20 + 120);
  v158 = objc_msgSend(v1128, "countByEnumeratingWithState:objects:count:", &v1261, &v1349, 16);
  if (v158)
  {
    v159 = *(_QWORD *)v1262;
    do
    {
      for (i4 = 0; i4 != v158; ++i4)
      {
        if (*(_QWORD *)v1262 != v159)
          objc_enumerationMutation(v1128);
        v161 = *(_QWORD *)(*((_QWORD *)&v1261 + 1) + 8 * i4);
        v162 = (void *)MEMORY[0x18D76B4E4]();
        v163 = (void *)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", v161);
        if (!objc_msgSend(*(id *)(v20 + 80), "objectForKey:", v161))
        {
          v164 = (void *)objc_msgSend(v163, "rootEntity");
          v165 = objc_msgSend(*(id *)(v20 + 128), "objectForKey:", objc_msgSend(v164, "name"));
          if (v165 && *(_DWORD *)(v165 + 24) != 2)
            v166 = 3;
          else
            v166 = 2;
          -[_NSSQLiteStoreMigrator _addEntityMigration:toTableMigrationForRootEntity:tableMigrationType:](v20, objc_msgSend(*(id *)(v20 + 120), "objectForKey:", v161), v164, v166);
        }
        objc_autoreleasePoolPop(v162);
      }
      v158 = objc_msgSend(v1128, "countByEnumeratingWithState:objects:count:", &v1261, &v1349, 16);
    }
    while (v158);
  }

  v1129 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4 * objc_msgSend(*(id *)(v20 + 128), "count"));
  v1109 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v20 + 128), "allValues"), "sortedArrayUsingComparator:", &__block_literal_global_21);
  v167 = *(_QWORD *)(v20 + 48);
  if (!v167)
  {
    v1084 = 0;
    goto LABEL_999;
  }
  v1084 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v167, (uint64_t)CFSTR("ANSCKRECORDMETADATA"), 0);
  v168 = *(_QWORD *)(v20 + 48);
  if (!v168)
  {
LABEL_999:
    v1080 = 0;
    goto LABEL_217;
  }
  v1080 = -[NSSQLiteConnection _hasTableWithName:isTemp:](v168, (uint64_t)CFSTR("ANSCKHISTORYANALYZERSTATE"), 0);
LABEL_217:
  *(_BYTE *)(v20 + 216) = v1084 | v1080;
  obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1280 = 0u;
  v1279 = 0u;
  v1278 = 0u;
  v1277 = 0u;
  v169 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1277, &v1371, 16);
  if (v169)
  {
    v1096 = 0;
    v170 = *(_QWORD *)v1278;
    while (1)
    {
      for (i5 = 0; i5 != v169; ++i5)
      {
        if (*(_QWORD *)v1278 != v170)
          objc_enumerationMutation(v1109);
        v172 = *(_DWORD **)(*((_QWORD *)&v1277 + 1) + 8 * i5);
        v173 = (void *)MEMORY[0x18D76B4E4]();
        -[_NSSQLTableMigrationDescription appendStatementsToRenameTables:migrationContext:]((uint64_t)v172, v1129, v20);
        if (-[_NSSQLiteStoreMigrator enforceCloudKitConstraintsForEntity:](v20, (void *)objc_msgSend(v172, "rootEntity")))
        {
          if (!v172)
          {
            v174 = 0;
LABEL_231:
            v1096 |= v174 == 0;
            goto LABEL_232;
          }
          v174 = v172[6];
          if ((v174 - 1) > 2)
            goto LABEL_231;
          v175 = v174 == 3;
          v176 = (void *)-[_NSSQLTableMigrationDescription newCloudKitMetadataUpdateStatements:]((uint64_t)v172, obja);
          if (v176)
          {
            objc_msgSend(*(id *)(v20 + 208), "addObjectsFromArray:", v176);
          }
          else
          {
            v177 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableMigration returned nil cloudkit update statements: %@");
            _NSCoreDataLog(17, v177, v178, v179, v180, v181, v182, v183, (uint64_t)v172);
            v184 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v1369 = 138412290;
              v1370 = v172;
              _os_log_fault_impl(&dword_18A253000, v184, OS_LOG_TYPE_FAULT, "CoreData: tableMigration returned nil cloudkit update statements: %@", (uint8_t *)&v1369, 0xCu);
            }
          }

          v1096 |= v175;
        }
LABEL_232:
        objc_autoreleasePoolPop(v173);
      }
      v169 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1277, &v1371, 16);
      if (!v169)
        goto LABEL_236;
    }
  }
  LOBYTE(v1096) = 0;
LABEL_236:
  if (objc_msgSend(obja, "count"))
  {
    objc_msgSend(obja, "sortUsingComparator:", &__block_literal_global_384);
    v1276 = 0u;
    v1275 = 0u;
    v1274 = 0u;
    v1273 = 0u;
    v185 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v1273, &v1369, 16);
    if (v185)
    {
      v186 = *(_QWORD *)v1274;
      do
      {
        for (i6 = 0; i6 != v185; ++i6)
        {
          if (*(_QWORD *)v1274 != v186)
            objc_enumerationMutation(obja);
          v188 = *(void **)(*((_QWORD *)&v1273 + 1) + 8 * i6);
          v189 = (void *)MEMORY[0x18D76B4E4]();
          if (v1084)
          {
            v190 = [NSSQLiteStatement alloc];
            v191 = (void *)MEMORY[0x1E0CB3940];
            v1034 = (const __CFString *)objc_msgSend(v188, "objectAtIndexedSubscript:", 1);
            objc_msgSend(v188, "objectAtIndexedSubscript:", 0);
            v192 = -[NSSQLiteStatement initWithEntity:sqlString:](v190, "initWithEntity:sqlString:", 0, objc_msgSend(v191, "stringWithFormat:", CFSTR("UPDATE ANSCKRECORDMETADATA SET ZENTITYID = %@ WHERE ZENTITYID = %@")));
            objc_msgSend(*(id *)(v20 + 208), "addObject:", v192);

          }
          if (v1080)
          {
            v193 = [NSSQLiteStatement alloc];
            v194 = (void *)MEMORY[0x1E0CB3940];
            v1034 = (const __CFString *)objc_msgSend(v188, "objectAtIndexedSubscript:", 1);
            objc_msgSend(v188, "objectAtIndexedSubscript:", 0);
            v195 = -[NSSQLiteStatement initWithEntity:sqlString:](v193, "initWithEntity:sqlString:", 0, objc_msgSend(v194, "stringWithFormat:", CFSTR("UPDATE ANSCKHISTORYANALYZERSTATE SET ZENTITYID = %@ WHERE ZENTITYID = %@")));
            objc_msgSend(*(id *)(v20 + 208), "addObject:", v195);

          }
          objc_autoreleasePoolPop(v189);
        }
        v185 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v1273, &v1369, 16);
      }
      while (v185);
    }
  }

  if ((objc_msgSend(*(id *)(v20 + 208), "count") != 0) | v1096 & 1)
  {
    v196 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v20 + 8), "metadata"), "mutableCopy");
    objc_msgSend(v196, "setObject:forKey:", MEMORY[0x1E0C9AA70], CFSTR("PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"));
    v197 = *(_QWORD *)(v20 + 8);
    if (v197)
      -[NSSQLCore _setMetadata:clean:](v197, v196, 0);

  }
  v198 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1272 = 0u;
  v1271 = 0u;
  v1270 = 0u;
  v1269 = 0u;
  v199 = objc_msgSend(v1129, "countByEnumeratingWithState:objects:count:", &v1269, &v1365, 16);
  if (v199)
  {
    v200 = *(_QWORD *)v1270;
    do
    {
      for (i7 = 0; i7 != v199; ++i7)
      {
        if (*(_QWORD *)v1270 != v200)
          objc_enumerationMutation(v1129);
        v202 = *(void **)(*((_QWORD *)&v1269 + 1) + 8 * i7);
        if (objc_msgSend((id)objc_msgSend(v202, "sqlString"), "containsString:", CFSTR("RENAME TO Z_")))
          objc_msgSend(v198, "addObject:", v202);
      }
      v199 = objc_msgSend(v1129, "countByEnumeratingWithState:objects:count:", &v1269, &v1365, 16);
    }
    while (v199);
  }
  if (objc_msgSend(v198, "count"))
  {
    v1085 = (id)MEMORY[0x18D76B4E4]();
    v203 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v1097 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v1268 = 0u;
    v1267 = 0u;
    v1266 = 0u;
    v1265 = 0u;
    v204 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v1265, &v1361, 16);
    if (v204)
    {
      v205 = *(_QWORD *)v1266;
      do
      {
        for (i8 = 0; i8 != v204; ++i8)
        {
          if (*(_QWORD *)v1266 != v205)
            objc_enumerationMutation(v198);
          v207 = *(void **)(*((_QWORD *)&v1265 + 1) + 8 * i8);
          v208 = (void *)MEMORY[0x18D76B4E4]();
          v209 = (void *)objc_msgSend((id)objc_msgSend(v207, "sqlString"), "componentsSeparatedByString:", CFSTR(" "));
          if (objc_msgSend(v209, "count") == 6)
          {
            objc_msgSend(v203, "addObject:", objc_msgSend(v209, "objectAtIndexedSubscript:", 2));
            objc_msgSend(v1097, "addObject:", objc_msgSend(v209, "lastObject"));
          }
          objc_autoreleasePoolPop(v208);
        }
        v204 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v1265, &v1361, 16);
      }
      while (v204);
    }
    v210 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v211 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    for (i9 = 0; objc_msgSend(v203, "count") > i9; ++i9)
    {
      v213 = (void *)MEMORY[0x18D76B4E4]();
      v214 = (void *)objc_msgSend(v203, "objectAtIndexedSubscript:", i9);
      v215 = objc_msgSend(v1097, "objectAtIndexedSubscript:", i9);
      v216 = objc_msgSend(v214, "stringByAppendingString:", CFSTR("TEMP"));
      v217 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](*(NSSQLiteStatement **)(v20 + 32), (uint64_t)v214, v216);
      objc_msgSend(v210, "addObject:", v217);
      v218 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](*(NSSQLiteStatement **)(v20 + 32), v216, v215);
      objc_msgSend(v211, "addObject:", v218);

      objc_autoreleasePoolPop(v213);
    }
    objc_msgSend(v1129, "removeObjectsInArray:", v198);
    objc_msgSend(v1129, "insertObjects:atIndexes:", v211, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v211, "count")));
    objc_msgSend(v1129, "insertObjects:atIndexes:", v210, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v210, "count")));
    objc_autoreleasePoolPop(v1085);
  }
  v1264 = 0u;
  v1263 = 0u;
  v1262 = 0u;
  v1261 = 0u;
  v219 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1261, &v1357, 16);
  if (v219)
  {
    v220 = *(_QWORD *)v1262;
    do
    {
      for (i10 = 0; i10 != v219; ++i10)
      {
        if (*(_QWORD *)v1262 != v220)
          objc_enumerationMutation(v1109);
        v222 = *(_QWORD *)(*((_QWORD *)&v1261 + 1) + 8 * i10);
        v223 = (void *)MEMORY[0x18D76B4E4]();
        -[_NSSQLTableMigrationDescription appendStatementsToCreateOrDropTables:migrationContext:](v222, v1129, v20);
        objc_autoreleasePoolPop(v223);
      }
      v219 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1261, &v1357, 16);
    }
    while (v219);
  }
  v1260 = 0u;
  v1259 = 0u;
  v1258 = 0u;
  v1257 = 0u;
  v224 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1257, &v1353, 16);
  if (v224)
  {
    v225 = *(_QWORD *)v1258;
    do
    {
      for (i11 = 0; i11 != v224; ++i11)
      {
        if (*(_QWORD *)v1258 != v225)
          objc_enumerationMutation(v1109);
        v227 = *(_QWORD *)(*((_QWORD *)&v1257 + 1) + 8 * i11);
        v228 = (void *)MEMORY[0x18D76B4E4]();
        -[_NSSQLTableMigrationDescription appendStatementsToPerformMigration:migrationContext:](v227, v1129, v20);
        objc_autoreleasePoolPop(v228);
      }
      v224 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1257, &v1353, 16);
    }
    while (v224);
  }
  v1256 = 0u;
  v1255 = 0u;
  v1254 = 0u;
  v1253 = 0u;
  v229 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1253, &v1349, 16);
  if (v229)
  {
    v230 = *(_QWORD *)v1254;
    do
    {
      for (i12 = 0; i12 != v229; ++i12)
      {
        if (*(_QWORD *)v1254 != v230)
          objc_enumerationMutation(v1109);
        v232 = *(_QWORD *)(*((_QWORD *)&v1253 + 1) + 8 * i12);
        v233 = (void *)MEMORY[0x18D76B4E4]();
        -[_NSSQLTableMigrationDescription appendStatementsToCompleteMigration:migrationContext:](v232, v1129, v20);
        objc_autoreleasePoolPop(v233);
      }
      v229 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1253, &v1349, 16);
    }
    while (v229);
  }
  *(_QWORD *)(v20 + 176) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1249 = 0u;
  v1250 = 0u;
  v1251 = 0u;
  v1252 = 0u;
  v234 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1249, &v1345, 16);
  if (v234)
  {
    v235 = *(_QWORD *)v1250;
    do
    {
      for (i13 = 0; i13 != v234; ++i13)
      {
        if (*(_QWORD *)v1250 != v235)
          objc_enumerationMutation(v1109);
        v237 = *(_QWORD *)(*((_QWORD *)&v1249 + 1) + 8 * i13);
        v238 = (void *)MEMORY[0x18D76B4E4]();
        -[_NSSQLTableMigrationDescription appendDefaultValueStatementsToCompleteMigration:migrationContext:](v237, *(void **)(v20 + 176), v20);
        objc_autoreleasePoolPop(v238);
      }
      v234 = objc_msgSend(v1109, "countByEnumeratingWithState:objects:count:", &v1249, &v1345, 16);
    }
    while (v234);
  }
  v1248 = 0u;
  v1247 = 0u;
  v1246 = 0u;
  v1245 = 0u;
  v239 = *(_QWORD *)(v20 + 16);
  if (v239)
    v240 = *(void **)(v239 + 40);
  else
    v240 = 0;
  v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v1245, &v1341, 16);
  if (v241)
  {
    v242 = *(_QWORD *)v1246;
    do
    {
      for (i14 = 0; i14 != v241; ++i14)
      {
        if (*(_QWORD *)v1246 != v242)
          objc_enumerationMutation(v240);
        v244 = *(_QWORD *)(*((_QWORD *)&v1245 + 1) + 8 * i14);
        v245 = (void *)MEMORY[0x18D76B4E4]();
        v246 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](*(_QWORD *)(v20 + 32), v244, 0);
        objc_msgSend(v1129, "addObjectsFromArray:", v246);

        objc_autoreleasePoolPop(v245);
      }
      v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v1245, &v1341, 16);
    }
    while (v241);
  }

  objc_autoreleasePoolPop(v1041);
  v1048 = v1129;
LABEL_313:
  objc_autoreleasePoolPop(v1044);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v1340[0] = CFSTR("Creation of entity migration statements");
  v1340[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v247 - v19);
  objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1340, 2), CFSTR("1.1"));
  if (!v1048)
  {
    v309 = (void *)MEMORY[0x1E0CB35C8];
    v1034 = CFSTR("reason");
    v310 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to generate statements to perform migration"));
    v311 = (id)objc_msgSend(v309, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v310);
    v1131 = 0;
    v1082 = 0;
    v1048 = 0;
    v312 = 0;
    v313 = v1140;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1140 + 40) + 8) + 40) = v311;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1140 + 48) + 8) + 24) = 0;
    goto LABEL_1005;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 72), "count"))
  {
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Creating statements to update entity keys"), v248, v249, v250, v251, v252, v253, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v255 = v254;
    v1039 = (void *)MEMORY[0x18D76B4E4]();
    v256 = *(_QWORD *)(v1140 + 32);
    if (v256 && objc_msgSend(*(id *)(v256 + 72), "count"))
    {
      v1035 = (void *)MEMORY[0x18D76B4E4]();
      v1064 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * objc_msgSend(*(id *)(v256 + 72), "count"));
      v1130 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(v256 + 72), "count"));
      v1098 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(v256 + 72), "count"));
      v1356 = 0u;
      v1355 = 0u;
      v1354 = 0u;
      v1353 = 0u;
      v257 = *(void **)(v256 + 72);
      v258 = objc_msgSend(v257, "countByEnumeratingWithState:objects:count:", &v1353, &v1371, 16);
      if (v258)
      {
        v259 = *(_QWORD *)v1354;
        do
        {
          v260 = 0;
          do
          {
            if (*(_QWORD *)v1354 != v259)
              objc_enumerationMutation(v257);
            v261 = *(_QWORD *)(*((_QWORD *)&v1353 + 1) + 8 * v260);
            v262 = (void *)MEMORY[0x18D76B4E4]();
            v263 = objc_msgSend(*(id *)(v256 + 24), "entityNamed:", v261);
            v264 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v256 + 72), "objectForKey:", v261), "rootEntity");
            v265 = (void *)objc_msgSend(v1130, "objectForKey:", objc_msgSend(v264, "name"));
            if (v265)
            {
              objc_msgSend(v265, "addObject:", v263);
            }
            else
            {
              v266 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v263, 0);
              objc_msgSend(v1130, "setObject:forKey:", v266, objc_msgSend(v264, "name"));

            }
            v267 = (void *)objc_msgSend(v1098, "objectForKey:", objc_msgSend(v264, "name"));
            if (v267)
            {
              if (v263)
                v268 = *(unsigned int *)(v263 + 184);
              else
                v268 = 0;
              objc_msgSend(v267, "appendFormat:", CFSTR(",%u"), v268);
            }
            else
            {
              v269 = objc_alloc(MEMORY[0x1E0CB37A0]);
              if (v263)
                v270 = *(unsigned int *)(v263 + 184);
              else
                v270 = 0;
              v271 = (void *)objc_msgSend(v269, "initWithFormat:", CFSTR("%u"), v270);
              objc_msgSend(v1098, "setObject:forKey:", v271, objc_msgSend(v264, "name"));

            }
            objc_autoreleasePoolPop(v262);
            ++v260;
          }
          while (v258 != v260);
          v272 = objc_msgSend(v257, "countByEnumeratingWithState:objects:count:", &v1353, &v1371, 16);
          v258 = v272;
        }
        while (v272);
      }
      v1352 = 0u;
      v1351 = 0u;
      v1350 = 0u;
      v1349 = 0u;
      v1037 = *(id *)(v256 + 128);
      v273 = objc_msgSend(v1037, "countByEnumeratingWithState:objects:count:", &v1349, &v1369, 16);
      if (v273)
      {
        v1038 = *(_QWORD *)v1350;
        do
        {
          v1045 = 0;
          v1036 = (id)v273;
          do
          {
            if (*(_QWORD *)v1350 != v1038)
              objc_enumerationMutation(v1037);
            v274 = *(_QWORD *)(*((_QWORD *)&v1349 + 1) + 8 * (_QWORD)v1045);
            v1042 = (void *)MEMORY[0x18D76B4E4]();
            v275 = (void *)objc_msgSend(*(id *)(v256 + 16), "entityNamed:", v274);
            v276 = (void *)objc_msgSend(v1130, "objectForKey:", objc_msgSend(v275, "name"));
            if (objc_msgSend(v276, "count"))
            {
              v1110 = (id)objc_msgSend(v1098, "objectForKey:", objc_msgSend(v275, "name"));
              v277 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE OR FAIL "));
              objc_msgSend(v277, "appendString:", objc_msgSend(v275, "tableName"));
              objc_msgSend(v277, "appendString:", CFSTR(" SET "));
              objc_msgSend(v277, "appendString:", CFSTR("Z_ENT"));
              objc_msgSend(v277, "appendString:", CFSTR(" =(CASE"));
              v1348 = 0u;
              v1347 = 0u;
              v1346 = 0u;
              v1345 = 0u;
              v278 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v1345, &v1365, 16);
              v279 = v275;
              if (!v278)
                goto LABEL_358;
              v280 = *(_QWORD *)v1346;
              while (1)
              {
                v281 = 0;
                do
                {
                  if (*(_QWORD *)v1346 != v280)
                    objc_enumerationMutation(v276);
                  v282 = *(unsigned int **)(*((_QWORD *)&v1345 + 1) + 8 * v281);
                  v283 = objc_msgSend(*(id *)(v256 + 72), "objectForKey:", objc_msgSend(v282, "name"));
                  objc_msgSend(v277, "appendString:", CFSTR(" WHEN "));
                  objc_msgSend(v277, "appendString:", CFSTR("Z_ENT"));
                  if (v282)
                  {
                    v284 = v282[46];
                    if (v283)
                      goto LABEL_352;
                  }
                  else
                  {
                    v284 = 0;
                    if (v283)
                    {
LABEL_352:
                      v285 = *(unsigned int *)(v283 + 184);
                      goto LABEL_353;
                    }
                  }
                  v285 = 0;
LABEL_353:
                  objc_msgSend(v277, "appendFormat:", CFSTR(" = %d THEN %d"), v284, v285);
                  ++v281;
                }
                while (v278 != v281);
                v286 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v1345, &v1365, 16);
                v278 = v286;
                if (!v286)
                {
LABEL_358:
                  objc_msgSend(v277, "appendString:", CFSTR(" ELSE "));
                  v275 = v279;
                  objc_msgSend(v277, "appendString:", CFSTR("Z_ENT"));
                  objc_msgSend(v277, "appendString:", CFSTR(" END) WHERE "));
                  objc_msgSend(v277, "appendString:", CFSTR("Z_ENT"));
                  objc_msgSend(v277, "appendString:", CFSTR(" IN ("));
                  objc_msgSend(v277, "appendString:", v1110);
                  objc_msgSend(v277, "appendString:", CFSTR(")"));
                  v287 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(v256 + 32), (uint64_t)v277);
                  objc_msgSend(v1064, "addObject:", v287);

                  break;
                }
              }
            }
            v1344 = 0u;
            v1343 = 0u;
            v1342 = 0u;
            v1341 = 0u;
            if (v275)
            {
              v288 = v275;
              do
              {
                if (!v288)
                  goto LABEL_390;
                v289 = v288;
                v288 = (_QWORD *)v288[21];
              }
              while (v288 != v289);
              v290 = (void *)v289[9];
            }
            else
            {
LABEL_390:
              v290 = 0;
            }
            v291 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v1341, &v1361, 16);
            v1059 = v275;
            if (!v291)
              goto LABEL_388;
            v292 = *(_QWORD *)v1342;
            contextb = v290;
            v1050 = *(_QWORD *)v1342;
            do
            {
              v293 = 0;
              v1068 = v291;
              do
              {
                if (*(_QWORD *)v1342 != v292)
                  objc_enumerationMutation(v290);
                v294 = *(_BYTE **)(*((_QWORD *)&v1341 + 1) + 8 * (_QWORD)v293);
                v1111 = (id)MEMORY[0x18D76B4E4]();
                if (v294)
                {
                  if (v294[24] == 4)
                  {
                    v295 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v294, "toOneRelationship"), "destinationEntity"), "rootEntity");
                    v296 = (void *)objc_msgSend(v1130, "objectForKey:", objc_msgSend(v295, "name"));
                    if (objc_msgSend(v296, "count"))
                    {
                      v1081 = (id)objc_msgSend(v1098, "objectForKey:", objc_msgSend(v295, "name"));
                      v297 = objc_msgSend(v294, "columnName");
                      v298 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE OR FAIL "));
                      objc_msgSend(v298, "appendString:", objc_msgSend(v1059, "tableName"));
                      objc_msgSend(v298, "appendString:", CFSTR(" SET "));
                      objc_msgSend(v298, "appendString:", v297);
                      objc_msgSend(v298, "appendString:", CFSTR(" =(CASE"));
                      v1280 = 0u;
                      v1279 = 0u;
                      v1278 = 0u;
                      v1277 = 0u;
                      v299 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v1277, &v1357, 16);
                      objb = v293;
                      v300 = v256;
                      if (!v299)
                        goto LABEL_385;
                      v301 = *(_QWORD *)v1278;
                      while (1)
                      {
                        v302 = 0;
                        do
                        {
                          if (*(_QWORD *)v1278 != v301)
                            objc_enumerationMutation(v296);
                          v303 = *(unsigned int **)(*((_QWORD *)&v1277 + 1) + 8 * v302);
                          v304 = objc_msgSend(*(id *)(v300 + 72), "objectForKey:", objc_msgSend(v303, "name"));
                          objc_msgSend(v298, "appendString:", CFSTR(" WHEN "));
                          objc_msgSend(v298, "appendString:", v297);
                          if (v303)
                          {
                            v305 = v303[46];
                            if (v304)
                              goto LABEL_379;
                          }
                          else
                          {
                            v305 = 0;
                            if (v304)
                            {
LABEL_379:
                              v306 = *(unsigned int *)(v304 + 184);
                              goto LABEL_380;
                            }
                          }
                          v306 = 0;
LABEL_380:
                          objc_msgSend(v298, "appendFormat:", CFSTR(" = %d THEN %d"), v305, v306);
                          ++v302;
                        }
                        while (v299 != v302);
                        v307 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v1277, &v1357, 16);
                        v299 = v307;
                        if (!v307)
                        {
LABEL_385:
                          objc_msgSend(v298, "appendString:", CFSTR(" ELSE "));
                          v256 = v300;
                          v290 = contextb;
                          v292 = v1050;
                          v291 = v1068;
                          v293 = objb;
                          objc_msgSend(v298, "appendString:", v297);
                          objc_msgSend(v298, "appendString:", CFSTR(" END) WHERE "));
                          objc_msgSend(v298, "appendString:", v297);
                          objc_msgSend(v298, "appendString:", CFSTR(" IN ("));
                          objc_msgSend(v298, "appendString:", v1081);
                          objc_msgSend(v298, "appendString:", CFSTR(")"));
                          v308 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(v256 + 32), (uint64_t)v298);
                          objc_msgSend(v1064, "addObject:", v308);

                          break;
                        }
                      }
                    }
                  }
                }
                objc_autoreleasePoolPop(v1111);
                v293 = (char *)v293 + 1;
              }
              while (v293 != (id)v291);
              v291 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v1341, &v1361, 16);
            }
            while (v291);
LABEL_388:
            objc_autoreleasePoolPop(v1042);
            v1045 = (char *)v1045 + 1;
          }
          while (v1045 != v1036);
          v273 = objc_msgSend(v1037, "countByEnumeratingWithState:objects:count:", &v1349, &v1369, 16);
        }
        while (v273);
      }

      objc_autoreleasePoolPop(v1035);
      v1082 = v1064;
    }
    else
    {
      v1082 = 0;
    }
    objc_autoreleasePoolPop(v1039);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1339[0] = CFSTR("Creation of update entity keys statements");
    v1339[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v314 - v255);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1339, 2), CFSTR("1.2"));
  }
  else
  {
    v1082 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(v1140 + 32) + 136))
  {
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Creating statements to update primary key table"), v248, v249, v250, v251, v252, v253, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v316 = v315;
    v1065 = (void *)MEMORY[0x18D76B4E4]();
    v317 = *(_QWORD *)(v1140 + 32);
    if (v317)
    {
      v1060 = (void *)MEMORY[0x18D76B4E4]();
      *(_QWORD *)(v317 + 144) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v1112 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@_ORIG"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_PRIMARYKEY"));
      v318 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
      v319 = v318;
      if (v318)
      {
        sqlString = v318->_sqlString;
        if (sqlString != v1112)
        {

          v319->_sqlString = (NSString *)-[NSString copy](v1112, "copy");
        }
      }

      objc_msgSend(*(id *)(v317 + 144), "addObject:", v319);
      PrimaryKeyTable = -[NSSQLiteAdapter newCreatePrimaryKeyTableStatement](*(NSSQLiteStatement **)(v317 + 32));
      objc_msgSend(*(id *)(v317 + 144), "addObject:", PrimaryKeyTable);

      v322 = *(_QWORD *)(v317 + 16);
      if (v322)
        v323 = *(void **)(v322 + 40);
      else
        v323 = 0;
      v1352 = 0u;
      v1351 = 0u;
      v1350 = 0u;
      v1349 = 0u;
      v324 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v1349, &v1371, 16);
      if (v324)
      {
        v325 = *(_QWORD *)v1350;
        do
        {
          v326 = 0;
          do
          {
            if (*(_QWORD *)v1350 != v325)
              objc_enumerationMutation(v323);
            v327 = *(_QWORD *)(*((_QWORD *)&v1349 + 1) + 8 * v326);
            v328 = (void *)MEMORY[0x18D76B4E4]();
            if (v327)
              v329 = *(_QWORD *)(v327 + 160) == 0;
            else
              v329 = 0;
            v330 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](*(NSSQLiteStatement **)(v317 + 32), v327, v329 << 63 >> 63);
            objc_msgSend(*(id *)(v317 + 144), "addObject:", v330);

            objc_autoreleasePoolPop(v328);
            ++v326;
          }
          while (v324 != v326);
          v331 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v1349, &v1371, 16);
          v324 = v331;
        }
        while (v331);
      }
      v1069 = (void *)MEMORY[0x18D76B4E4]();
      v1348 = 0u;
      v1347 = 0u;
      v1346 = 0u;
      v1345 = 0u;
      v332 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v317 + 8), "ancillarySQLModels"), "allValues");
      v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v1345, &v1369, 16);
      if (v333)
      {
        v1086 = *(id *)v1346;
        objc = v332;
        do
        {
          v334 = 0;
          v1099 = (id)v333;
          do
          {
            if (*(id *)v1346 != v1086)
              objc_enumerationMutation(objc);
            v335 = *(_QWORD *)(*((_QWORD *)&v1345 + 1) + 8 * (_QWORD)v334);
            v1341 = 0u;
            v1342 = 0u;
            v1343 = 0u;
            v1344 = 0u;
            if (v335)
              v336 = *(void **)(v335 + 40);
            else
              v336 = 0;
            v337 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v1341, &v1365, 16);
            if (v337)
            {
              v338 = *(_QWORD *)v1342;
              do
              {
                v339 = 0;
                do
                {
                  if (*(_QWORD *)v1342 != v338)
                    objc_enumerationMutation(v336);
                  v340 = *(_QWORD *)(*((_QWORD *)&v1341 + 1) + 8 * v339);
                  v341 = (void *)MEMORY[0x18D76B4E4]();
                  if (v340)
                    v342 = *(_QWORD *)(v340 + 160) == 0;
                  else
                    v342 = 0;
                  v343 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](*(NSSQLiteStatement **)(v317 + 32), v340, v342 << 63 >> 63);
                  objc_msgSend(*(id *)(v317 + 144), "addObject:", v343);

                  objc_autoreleasePoolPop(v341);
                  ++v339;
                }
                while (v337 != v339);
                v344 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v1341, &v1365, 16);
                v337 = v344;
              }
              while (v344);
            }
            v334 = (char *)v334 + 1;
          }
          while (v334 != v1099);
          v345 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v1345, &v1369, 16);
          v333 = v345;
        }
        while (v345);
      }
      objc_autoreleasePoolPop(v1069);
      v1280 = 0u;
      v1279 = 0u;
      v1278 = 0u;
      v1277 = 0u;
      v346 = *(void **)(v317 + 96);
      v347 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v1277, &v1361, 16);
      if (v347)
      {
        v348 = *(_QWORD *)v1278;
        do
        {
          v349 = 0;
          do
          {
            if (*(_QWORD *)v1278 != v348)
              objc_enumerationMutation(v346);
            v350 = *(_QWORD *)(*((_QWORD *)&v1277 + 1) + 8 * v349);
            v351 = (void *)MEMORY[0x18D76B4E4]();
            v352 = objc_msgSend(*(id *)(v317 + 96), "valueForKey:", v350);
            if (v352)
            {
              v353 = *(_QWORD *)(v352 + 32);
              if (v353)
              {
                if (!*(_QWORD *)(v353 + 160))
                {
                  if (objc_msgSend(*(id *)(v353 + 152), "count"))
                  {
                    v354 = -[_NSSQLiteStoreMigrator _originalRootsForAddedEntity:](v317, (_QWORD *)v353);
                    v355 = v354;
                    if (!v354 || !objc_msgSend(v354, "count"))
                      goto LABEL_461;
                    if (objc_msgSend(v355, "count") == 1)
                    {
                      v356 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v357 = objc_msgSend(v355, "lastObject");
                      if (v357)
                        v358 = *(unsigned int *)(v357 + 184);
                      else
                        v358 = 0;
                      v1112 = (NSString *)objc_msgSend(v356, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = (SELECT %@ FROM %@_ORIG WHERE %@ = %d) WHERE %@ = %d"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_ENT"), v358, CFSTR("Z_ENT"), *(unsigned int *)(v353 + 184));
                    }
                    else
                    {
                      v360 = v1112;
                    }
                    v359 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
                  }
                  else
                  {
                    v1112 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = 0 WHERE %@ = %d"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_ENT"), *(unsigned int *)(v353 + 184));
                    v359 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
                  }
                  v361 = v359;
                  if (v359)
                  {
                    v362 = v359->_sqlString;
                    if (v362 != v1112)
                    {

                      v361->_sqlString = (NSString *)-[NSString copy](v1112, "copy");
                    }
                  }

                  objc_msgSend(*(id *)(v317 + 144), "addObject:", v361);
                }
              }
            }
LABEL_461:
            objc_autoreleasePoolPop(v351);
            ++v349;
          }
          while (v347 != v349);
          v363 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v1277, &v1361, 16);
          v347 = v363;
        }
        while (v363);
      }
      v1276 = 0u;
      v1275 = 0u;
      v1274 = 0u;
      v1273 = 0u;
      v1113 = *(id *)(v317 + 120);
      v364 = objc_msgSend(v1113, "countByEnumeratingWithState:objects:count:", &v1273, &v1357, 16);
      if (v364)
      {
        v365 = *(_QWORD *)v1274;
        do
        {
          v366 = 0;
          do
          {
            if (*(_QWORD *)v1274 != v365)
              objc_enumerationMutation(v1113);
            v367 = *(_QWORD *)(*((_QWORD *)&v1273 + 1) + 8 * v366);
            v368 = (void *)MEMORY[0x18D76B4E4]();
            v369 = (_QWORD *)objc_msgSend(*(id *)(v317 + 120), "valueForKey:", v367);
            if (v369)
            {
              v370 = v369[4];
              if (v370)
              {
                if (!*(_QWORD *)(v370 + 160))
                {
                  v371 = objc_msgSend(v369, "sourceEntity");
                  v372 = objc_alloc(MEMORY[0x1E0CB3940]);
                  if (v371)
                    v373 = *(unsigned int *)(v371 + 184);
                  else
                    v373 = 0;
                  v374 = (NSString *)objc_msgSend(v372, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = (SELECT %@ FROM %@_ORIG WHERE %@ = %d) WHERE %@ = %d"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_ENT"), v373, CFSTR("Z_ENT"), *(unsigned int *)(v370 + 184));
                  v375 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
                  v376 = v375;
                  if (v375)
                  {
                    v377 = v375->_sqlString;
                    if (v377 != v374)
                    {

                      v376->_sqlString = (NSString *)-[NSString copy](v374, "copy");
                    }
                  }

                  objc_msgSend(*(id *)(v317 + 144), "addObject:", v376);
                }
              }
            }
            objc_autoreleasePoolPop(v368);
            ++v366;
          }
          while (v364 != v366);
          v378 = objc_msgSend(v1113, "countByEnumeratingWithState:objects:count:", &v1273, &v1357, 16);
          v364 = v378;
        }
        while (v378);
      }
      v1272 = 0u;
      v1271 = 0u;
      v1270 = 0u;
      v1269 = 0u;
      v1114 = *(id *)(v317 + 112);
      v379 = objc_msgSend(v1114, "countByEnumeratingWithState:objects:count:", &v1269, &v1353, 16);
      if (v379)
      {
        v380 = *(_QWORD *)v1270;
        do
        {
          for (i15 = 0; i15 != v379; ++i15)
          {
            if (*(_QWORD *)v1270 != v380)
              objc_enumerationMutation(v1114);
            v382 = *(_QWORD *)(*((_QWORD *)&v1269 + 1) + 8 * i15);
            v383 = (void *)MEMORY[0x18D76B4E4]();
            v384 = (_QWORD *)objc_msgSend(*(id *)(v317 + 112), "valueForKey:", v382);
            if (v384)
            {
              v385 = v384[4];
              if (v385)
              {
                if (!*(_QWORD *)(v385 + 160))
                {
                  v386 = (_QWORD *)objc_msgSend(v384, "sourceEntity");
                  v387 = (uint64_t)v386;
                  if (v386 && !v386[20])
                  {
                    v388 = objc_alloc(MEMORY[0x1E0CB3940]);
                  }
                  else
                  {
                    v387 = objc_msgSend(v386, "rootEntity");
                    v388 = objc_alloc(MEMORY[0x1E0CB3940]);
                    if (!v387)
                    {
                      v389 = 0;
                      goto LABEL_497;
                    }
                  }
                  v389 = *(unsigned int *)(v387 + 184);
LABEL_497:
                  v390 = (NSString *)objc_msgSend(v388, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = (SELECT %@ FROM %@_ORIG WHERE %@ = %d) WHERE %@ = %d"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_ENT"), v389, CFSTR("Z_ENT"), *(unsigned int *)(v385 + 184));
                  v391 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
                  v392 = v391;
                  if (v391)
                  {
                    v393 = v391->_sqlString;
                    if (v393 != v390)
                    {

                      v392->_sqlString = (NSString *)-[NSString copy](v390, "copy");
                    }
                  }

                  objc_msgSend(*(id *)(v317 + 144), "addObject:", v392);
                }
              }
            }
            objc_autoreleasePoolPop(v383);
          }
          v379 = objc_msgSend(v1114, "countByEnumeratingWithState:objects:count:", &v1269, &v1353, 16);
        }
        while (v379);
      }
      v1034 = CFSTR("Z_PRIMARYKEY");
      v394 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TABLE %@_ORIG"));
      v395 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
      v396 = v395;
      if (v395)
      {
        v397 = v395->_sqlString;
        if (v397 != v394)
        {

          v396->_sqlString = (NSString *)-[NSString copy](v394, "copy");
        }
      }

      objc_msgSend(*(id *)(v317 + 144), "addObject:", v396);
      objc_autoreleasePoolPop(v1060);
    }
    objc_autoreleasePoolPop(v1065);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1338[0] = CFSTR("Creation of update primary key table statements");
    v1338[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v398 - v316);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1338, 2), CFSTR("1.3"));
  }
  if (*(_BYTE *)(v1140 + 64))
    _NSCoreDataLog(4, (uint64_t)CFSTR("Finished creating schema migration statements"), v248, v249, v250, v251, v252, v253, (uint64_t)v1034);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v1337[0] = CFSTR("Total preparation time for schema migration statements");
  v1337[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v399 - v19);
  objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1337, 2), CFSTR("1.0"));
  if (*(_BYTE *)(v1140 + 64))
    _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning formal transaction"), v400, v401, v402, v403, v404, v405, (uint64_t)v1034);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v407 = v406;
  -[NSSQLiteConnection beginTransaction](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48));
  v414 = *(_QWORD *)(v1140 + 32);
  if (v414 && *(_BYTE *)(v414 + 218))
  {
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning forced migration"), v408, v409, v410, v411, v412, v413, (uint64_t)v1034);
  }
  else
  {
    if (*(_BYTE *)(v1140 + 64))
    {
      _NSCoreDataLog(4, (uint64_t)CFSTR("Checking metadata"), v408, v409, v410, v411, v412, v413, (uint64_t)v1034);
      v414 = *(_QWORD *)(v1140 + 32);
    }
    if (v414)
      v415 = *(void **)(v414 + 16);
    else
      v415 = 0;
    v416 = -[NSManagedObjectModel _entityVersionHashesDigest]((id)objc_msgSend(v415, "managedObjectModel"));
    if (objc_msgSend((id)objc_msgSend(-[NSSQLiteConnection fetchMetadata](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48)), "objectForKey:", 0x1E1EF0E90), "isEqualToString:", v416))
    {
      _NSCoreDataLog(2, (uint64_t)CFSTR("Migration was completed by another client"), v417, v418, v419, v420, v421, v422, (uint64_t)v1034);
      v1131 = 0;
LABEL_522:
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Committing formal transaction"), v423, v424, v425, v426, v427, v428, (uint64_t)v1034);
      -[NSSQLiteConnection commitTransaction](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48));
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished committing formal transaction"), v429, v430, v431, v432, v433, v434, (uint64_t)v1034);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v436 = v435;
      v1285[0] = CFSTR("Time for COMMIT");
      v1285[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v435 - v407);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1285, 2), CFSTR("2.17"));
      v1284[0] = CFSTR("Total formal transaction time");
      v1284[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v436 - v19);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1284, 2), CFSTR("2.0"));
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Checkpointing WAL journal"), v437, v438, v439, v440, v441, v442, (uint64_t)v1034);
      v443 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), CFSTR("pragma wal_checkpoint(truncate)"));
      if (v443)
        CFRelease(v443);
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished checkpointing WAL journal"), v444, v445, v446, v447, v448, v449, (uint64_t)v1034);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1140 + 48) + 8) + 24) = 1;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Successfully completed lightweight migration on connection"), v444, v445, v446, v447, v448, v449, (uint64_t)v1034);
      if (*v1040)
        -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), CFSTR("pragma cache_size = 512"));
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v451 = v450;
      v1283[0] = CFSTR("Checkpoint time");
      v1283[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v450 - v436);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1283, 2), CFSTR("3.0"));
      v1282[0] = CFSTR("Total migration time (on connection)");
      v1282[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v451 - v3);
      v452 = MEMORY[0x18D76B4E4](objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1282, 2), CFSTR("0.0")));
      if (*(_BYTE *)(v1140 + 64))
      {
        v453 = (void *)objc_msgSend((id)objc_msgSend(v1052, "allKeys"), "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
        v1143 = 0u;
        v1144 = 0u;
        v1141 = 0u;
        v1142 = 0u;
        v454 = objc_msgSend(v453, "countByEnumeratingWithState:objects:count:", &v1141, v1281, 16);
        if (v454)
        {
          v455 = *(_QWORD *)v1142;
          do
          {
            for (i16 = 0; i16 != v454; ++i16)
            {
              if (*(_QWORD *)v1142 != v455)
                objc_enumerationMutation(v453);
              v457 = *(_QWORD *)(*((_QWORD *)&v1141 + 1) + 8 * i16);
              v458 = (void *)objc_msgSend(v1052, "objectForKey:", v457);
              objc_msgSend(v458, "firstObject");
              objc_msgSend((id)objc_msgSend(v458, "lastObject"), "doubleValue");
              if (v465 > 0.01)
                _NSCoreDataLog(4, (uint64_t)CFSTR("    Migration step %@ '%@' took %2.2f seconds"), v459, v460, v461, v462, v463, v464, v457);
            }
            v454 = objc_msgSend(v453, "countByEnumeratingWithState:objects:count:", &v1141, v1281, 16);
          }
          while (v454);
        }
      }
      v312 = 0;
      v466 = (void *)v452;
      v313 = v1140;
      objc_autoreleasePoolPop(v466);
      goto LABEL_1005;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v467;
  v1336[0] = CFSTR("Beginning formal transaction");
  v1336[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v467 - v407);
  objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1336, 2), CFSTR("2.1"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 152), "objectForKey:", CFSTR("deleted")), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v475 = v474;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin dropping attribute extensions."), v468, v469, v470, v471, v472, v473, (uint64_t)v1034);
    v1244 = 0u;
    v1243 = 0u;
    v1242 = 0u;
    v1241 = 0u;
    v476 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 152), "objectForKey:", CFSTR("deleted"));
    v477 = objc_msgSend(v476, "countByEnumeratingWithState:objects:count:", &v1241, v1335, 16);
    if (v477)
    {
      v1115 = *(id *)v1242;
      v1087 = v476;
      do
      {
        v484 = 0;
        v1100 = (id)v477;
        do
        {
          if (*(id *)v1242 != v1115)
            objc_enumerationMutation(v1087);
          v485 = *(void **)(*((_QWORD *)&v1241 + 1) + 8 * (_QWORD)v484);
          v1132 = (id)MEMORY[0x18D76B4E4]();
          v486 = objc_msgSend(v485, "validate:", *(_QWORD *)(v1140 + 56));
          if (v486)
          {
            v1240 = 0u;
            v1239 = 0u;
            v1238 = 0u;
            v1237 = 0u;
            v487 = (void *)objc_msgSend(v485, "dropSQLStrings");
            v488 = objc_msgSend(v487, "countByEnumeratingWithState:objects:count:", &v1237, v1334, 16);
            if (v488)
            {
              v489 = *(_QWORD *)v1238;
              do
              {
                for (i17 = 0; i17 != v488; ++i17)
                {
                  if (*(_QWORD *)v1238 != v489)
                    objc_enumerationMutation(v487);
                  v491 = *(_QWORD *)(*((_QWORD *)&v1237 + 1) + 8 * i17);
                  v492 = (void *)MEMORY[0x18D76B4E4]();
                  v493 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v491);
                  v500 = v493;
                  if (*(_BYTE *)(v1140 + 64))
                    _NSCoreDataLog(4, (uint64_t)CFSTR("Executing drop attribute extension statement: %@"), v494, v495, v496, v497, v498, v499, (uint64_t)v493);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v500);

                  objc_autoreleasePoolPop(v492);
                }
                v488 = objc_msgSend(v487, "countByEnumeratingWithState:objects:count:", &v1237, v1334, 16);
              }
              while (v488);
            }
          }
          else
          {
            v501 = *(id *)(*(_QWORD *)(*(_QWORD *)(v1140 + 40) + 8) + 40);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1140 + 48) + 8) + 24) = 0;
          }
          objc_autoreleasePoolPop(v1132);
          if (!v486)
            goto LABEL_844;
          v484 = (char *)v484 + 1;
        }
        while (v484 != v1100);
        v477 = objc_msgSend(v1087, "countByEnumeratingWithState:objects:count:", &v1241, v1335, 16);
      }
      while (v477);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished dropping attribute extensions."), v478, v479, v480, v481, v482, v483, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1333[0] = CFSTR("Drop attribute extensions");
    v1333[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v502 - v475);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1333, 2), CFSTR("2.2"));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 184), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v510 = v509;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin dropping derived properties."), v503, v504, v505, v506, v507, v508, (uint64_t)v1034);
    v1236 = 0u;
    v1235 = 0u;
    v1234 = 0u;
    v1233 = 0u;
    v1116 = *(id *)(*(_QWORD *)(v1140 + 32) + 184);
    v517 = objc_msgSend(v1116, "countByEnumeratingWithState:objects:count:", &v1233, v1332, 16);
    if (v517)
    {
      v1133 = *(id *)v1234;
      do
      {
        v518 = 0;
        do
        {
          if (*(id *)v1234 != v1133)
            objc_enumerationMutation(v1116);
          v519 = *(_QWORD *)(*((_QWORD *)&v1233 + 1) + 8 * v518);
          v520 = (void *)MEMORY[0x18D76B4E4]();
          if (v519)
          {
            -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL](v519);
            v521 = *(void **)(v519 + 32);
          }
          else
          {
            v521 = 0;
          }
          v522 = (void *)objc_msgSend(v521, "valueForKey:", CFSTR("dropStatements"));
          v1232 = 0u;
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v523 = objc_msgSend(v522, "countByEnumeratingWithState:objects:count:", &v1229, v1331, 16);
          if (v523)
          {
            v524 = *(_QWORD *)v1230;
            do
            {
              for (i18 = 0; i18 != v523; ++i18)
              {
                if (*(_QWORD *)v1230 != v524)
                  objc_enumerationMutation(v522);
                v526 = *(_QWORD **)(*((_QWORD *)&v1229 + 1) + 8 * i18);
                v533 = (void *)MEMORY[0x18D76B4E4]();
                if (*(_BYTE *)(v1140 + 64))
                  _NSCoreDataLog(4, (uint64_t)CFSTR("Executing drop derived property statement: %@"), v527, v528, v529, v530, v531, v532, (uint64_t)v526);
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v526);
                objc_autoreleasePoolPop(v533);
              }
              v523 = objc_msgSend(v522, "countByEnumeratingWithState:objects:count:", &v1229, v1331, 16);
            }
            while (v523);
          }
          objc_autoreleasePoolPop(v520);
          ++v518;
        }
        while (v518 != v517);
        v534 = objc_msgSend(v1116, "countByEnumeratingWithState:objects:count:", &v1233, v1332, 16);
        v517 = v534;
      }
      while (v534);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("End dropping derived properties."), v511, v512, v513, v514, v515, v516, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1330[0] = CFSTR("Drop derived properties");
    v1330[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v535 - v510);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1330, 2), CFSTR("2.3"));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 168), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v543 = v542;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin dropping indices."), v536, v537, v538, v539, v540, v541, (uint64_t)v1034);
    v1228 = 0u;
    v1227 = 0u;
    v1226 = 0u;
    v1225 = 0u;
    v1117 = *(id *)(*(_QWORD *)(v1140 + 32) + 168);
    v550 = objc_msgSend(v1117, "countByEnumeratingWithState:objects:count:", &v1225, v1329, 16);
    if (v550)
    {
      v1134 = *(id *)v1226;
      do
      {
        for (i19 = 0; i19 != v550; ++i19)
        {
          if (*(id *)v1226 != v1134)
            objc_enumerationMutation(v1117);
          v552 = *(void **)(*((_QWORD *)&v1225 + 1) + 8 * i19);
          v553 = (void *)MEMORY[0x18D76B4E4]();
          v554 = (void *)objc_msgSend(v552, "dropStatementsForStore:", *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 8));
          v1224 = 0u;
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v555 = objc_msgSend(v554, "countByEnumeratingWithState:objects:count:", &v1221, v1328, 16);
          if (v555)
          {
            v556 = *(_QWORD *)v1222;
            do
            {
              for (i20 = 0; i20 != v555; ++i20)
              {
                if (*(_QWORD *)v1222 != v556)
                  objc_enumerationMutation(v554);
                v558 = *(_QWORD **)(*((_QWORD *)&v1221 + 1) + 8 * i20);
                v565 = (void *)MEMORY[0x18D76B4E4]();
                if (*(_BYTE *)(v1140 + 64))
                  _NSCoreDataLog(4, (uint64_t)CFSTR("Executing drop index statement: %@"), v559, v560, v561, v562, v563, v564, (uint64_t)v558);
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v558);
                objc_autoreleasePoolPop(v565);
              }
              v555 = objc_msgSend(v554, "countByEnumeratingWithState:objects:count:", &v1221, v1328, 16);
            }
            while (v555);
          }
          objc_autoreleasePoolPop(v553);
        }
        v550 = objc_msgSend(v1117, "countByEnumeratingWithState:objects:count:", &v1225, v1329, 16);
      }
      while (v550);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished dropping indices."), v544, v545, v546, v547, v548, v549, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1327[0] = CFSTR("Drop indices");
    v1327[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v566 - v543);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1327, 2), CFSTR("2.4"));
  }
  if (objc_msgSend(v1048, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v574 = v573;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin entity schema & data migration statements."), v567, v568, v569, v570, v571, v572, (uint64_t)v1034);
    v1220 = 0u;
    v1219 = 0u;
    v1218 = 0u;
    v1217 = 0u;
    v581 = objc_msgSend(v1048, "countByEnumeratingWithState:objects:count:", &v1217, v1326, 16);
    if (v581)
    {
      v582 = *(_QWORD *)v1218;
      do
      {
        v583 = 0;
        do
        {
          if (*(_QWORD *)v1218 != v582)
            objc_enumerationMutation(v1048);
          v584 = *(_QWORD **)(*((_QWORD *)&v1217 + 1) + 8 * v583);
          v591 = (void *)MEMORY[0x18D76B4E4]();
          if (*(_BYTE *)(v1140 + 64))
            _NSCoreDataLog(4, (uint64_t)CFSTR("Executing entity schema & data migration statement: %@"), v585, v586, v587, v588, v589, v590, (uint64_t)v584);
          if (*(_BYTE *)(v1140 + 66))
          {
            v592 = (void *)objc_msgSend(v584, "sqlString");
            if (objc_msgSend(v592, "hasPrefix:", CFSTR("CREATE TABLE Z_48ACTIONMEDIAPLAYBACKS_")))
            {
              v593 = *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48);
              if (!v593
                || (-[NSSQLiteConnection _hasTableWithName:isTemp:](v593, (uint64_t)CFSTR("Z_48ACTIONMEDIAPLAYBACKS_"), 0) & 1) == 0)
              {
                goto LABEL_636;
              }
              goto LABEL_635;
            }
            if (!objc_msgSend(v592, "isEqualToString:", CFSTR("DROP TABLE Z_47ACTIONMEDIAPLAYBACKS_")))
            {
              v596 = objc_msgSend(v592, "isEqualToString:", CFSTR("ALTER TABLE Z_47ACTIONMEDIAPLAYBACKS_TEMP RENAME TO Z_48ACTIONMEDIAPLAYBACKS_"));
              v594 = *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48);
              if (!v596)
                goto LABEL_637;
              if (!v594
                || !-[NSSQLiteConnection _hasTableWithName:isTemp:](v594, (uint64_t)CFSTR("Z_48ACTIONMEDIAPLAYBACKS_"), 0))
              {
LABEL_636:
                v594 = *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48);
LABEL_637:
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v594, v584);
                goto LABEL_639;
              }
LABEL_635:
              -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), CFSTR("DROP TABLE Z_48ACTIONMEDIAPLAYBACKS_"));
              goto LABEL_636;
            }
            v595 = *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48);
            if (v595
              && -[NSSQLiteConnection _hasTableWithName:isTemp:](v595, (uint64_t)CFSTR("Z_47ACTIONMEDIAPLAYBACKS_"), 0))
            {
              -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), CFSTR("DROP TABLE Z_47ACTIONMEDIAPLAYBACKS_"));
            }
          }
          else
          {
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v584);
          }
LABEL_639:
          objc_autoreleasePoolPop(v591);
          ++v583;
        }
        while (v581 != v583);
        v597 = objc_msgSend(v1048, "countByEnumeratingWithState:objects:count:", &v1217, v1326, 16);
        v581 = v597;
      }
      while (v597);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished entity schema & data migration statements."), v575, v576, v577, v578, v579, v580, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1325[0] = CFSTR("Execution of entity schema and data migration statements");
    v1325[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v598 - v574);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1325, 2), CFSTR("2.5"));

    v1048 = 0;
  }
  if (objc_msgSend(v1082, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v606 = v605;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin updating entity key columns."), v599, v600, v601, v602, v603, v604, (uint64_t)v1034);
    v1216 = 0u;
    v1215 = 0u;
    v1214 = 0u;
    v1213 = 0u;
    v613 = objc_msgSend(v1082, "countByEnumeratingWithState:objects:count:", &v1213, v1324, 16);
    if (v613)
    {
      v614 = *(_QWORD *)v1214;
      do
      {
        for (i21 = 0; i21 != v613; ++i21)
        {
          if (*(_QWORD *)v1214 != v614)
            objc_enumerationMutation(v1082);
          v616 = *(_QWORD **)(*((_QWORD *)&v1213 + 1) + 8 * i21);
          v623 = (void *)MEMORY[0x18D76B4E4]();
          if (*(_BYTE *)(v1140 + 64))
            _NSCoreDataLog(4, (uint64_t)CFSTR("Executing entity key column update statement: %@"), v617, v618, v619, v620, v621, v622, (uint64_t)v616);
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v616);
          objc_autoreleasePoolPop(v623);
        }
        v613 = objc_msgSend(v1082, "countByEnumeratingWithState:objects:count:", &v1213, v1324, 16);
      }
      while (v613);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished updating entity key columns."), v607, v608, v609, v610, v611, v612, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1323[0] = CFSTR("Execution of entity key column updates");
    v1323[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v624 - v606);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1323, 2), CFSTR("2.6"));

    v1082 = 0;
  }
  v625 = *(_QWORD *)(v1140 + 32);
  if (*(_BYTE *)(v625 + 136))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v633 = v632;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin updating primary key table."), v626, v627, v628, v629, v630, v631, (uint64_t)v1034);
    v1212 = 0u;
    v1211 = 0u;
    v1210 = 0u;
    v1209 = 0u;
    v634 = *(void **)(*(_QWORD *)(v1140 + 32) + 144);
    v641 = objc_msgSend(v634, "countByEnumeratingWithState:objects:count:", &v1209, v1322, 16);
    if (v641)
    {
      v642 = *(_QWORD *)v1210;
      do
      {
        for (i22 = 0; i22 != v641; ++i22)
        {
          if (*(_QWORD *)v1210 != v642)
            objc_enumerationMutation(v634);
          v644 = *(_QWORD **)(*((_QWORD *)&v1209 + 1) + 8 * i22);
          v645 = (void *)MEMORY[0x18D76B4E4]();
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v644);
          objc_autoreleasePoolPop(v645);
        }
        v641 = objc_msgSend(v634, "countByEnumeratingWithState:objects:count:", &v1209, v1322, 16);
      }
      while (v641);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished updating primary key table."), v635, v636, v637, v638, v639, v640, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1321[0] = CFSTR("Update primary key table");
    v1321[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v646 - v633);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1321, 2), CFSTR("2.7"));
    v625 = *(_QWORD *)(v1140 + 32);
  }
  if (objc_msgSend(*(id *)(v625 + 176), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v654 = v653;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Begin updating default values."), v647, v648, v649, v650, v651, v652, (uint64_t)v1034);
    v1208 = 0u;
    v1207 = 0u;
    v1206 = 0u;
    v1205 = 0u;
    v655 = *(void **)(*(_QWORD *)(v1140 + 32) + 176);
    v662 = objc_msgSend(v655, "countByEnumeratingWithState:objects:count:", &v1205, v1320, 16);
    if (v662)
    {
      v663 = *(_QWORD *)v1206;
      do
      {
        for (i23 = 0; i23 != v662; ++i23)
        {
          if (*(_QWORD *)v1206 != v663)
            objc_enumerationMutation(v655);
          v665 = *(_QWORD **)(*((_QWORD *)&v1205 + 1) + 8 * i23);
          v666 = (void *)MEMORY[0x18D76B4E4]();
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v665);
          objc_autoreleasePoolPop(v666);
        }
        v662 = objc_msgSend(v655, "countByEnumeratingWithState:objects:count:", &v1205, v1320, 16);
      }
      while (v662);
    }
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished updating default values."), v656, v657, v658, v659, v660, v661, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1319[0] = CFSTR("Update default values");
    v1319[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v667 - v654);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1319, 2), CFSTR("2.7.1"));
  }
  if (!objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 152), "objectForKey:", CFSTR("inserted")), "count"))
  {
LABEL_729:
    if (objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 160), "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v722 = v721;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Begin index creation and updates."), v715, v716, v717, v718, v719, v720, (uint64_t)v1034);
      v1192 = 0u;
      v1191 = 0u;
      v1190 = 0u;
      v1189 = 0u;
      v1089 = *(id *)(*(_QWORD *)(v1140 + 32) + 160);
      v729 = objc_msgSend(v1089, "countByEnumeratingWithState:objects:count:", &v1189, v1314, 16);
      if (v729)
      {
        v1102 = *(id *)v1190;
        do
        {
          v730 = 0;
          v1119 = (id)v729;
          do
          {
            if (*(id *)v1190 != v1102)
              objc_enumerationMutation(v1089);
            v731 = *(void **)(*((_QWORD *)&v1189 + 1) + 8 * (_QWORD)v730);
            v1136 = (id)MEMORY[0x18D76B4E4]();
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v733 = v732;
            v734 = (void *)objc_msgSend(v731, "generateStatementsForStore:", *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 8));
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v736 = v735;
            v1313[0] = CFSTR("Generate index creation statements");
            v1313[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v735 - v733);
            objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1313, 2), CFSTR("2.9.1"));
            v1187 = 0u;
            v1188 = 0u;
            v1185 = 0u;
            v1186 = 0u;
            v737 = objc_msgSend(v734, "countByEnumeratingWithState:objects:count:", &v1185, v1312, 16);
            if (v737)
            {
              v738 = *(_QWORD *)v1186;
              do
              {
                for (i24 = 0; i24 != v737; ++i24)
                {
                  if (*(_QWORD *)v1186 != v738)
                    objc_enumerationMutation(v734);
                  v740 = *(_QWORD **)(*((_QWORD *)&v1185 + 1) + 8 * i24);
                  v747 = (void *)MEMORY[0x18D76B4E4]();
                  if (*(_BYTE *)(v1140 + 64))
                    _NSCoreDataLog(4, (uint64_t)CFSTR("Executing index creation statement: %@"), v741, v742, v743, v744, v745, v746, (uint64_t)v740);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v740);
                  objc_autoreleasePoolPop(v747);
                }
                v737 = objc_msgSend(v734, "countByEnumeratingWithState:objects:count:", &v1185, v1312, 16);
              }
              while (v737);
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v749 = v748;
            v1311[0] = CFSTR("Execute index creation statements");
            v1311[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v748 - v736);
            objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1311, 2), CFSTR("2.9.2"));
            v750 = (void *)objc_msgSend(v731, "bulkUpdateStatementsForStore:", *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 8));
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v752 = v751;
            v1310[0] = CFSTR("Generate index update statements");
            v1310[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v751 - v749);
            objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1310, 2), CFSTR("2.9.3"));
            v1183 = 0u;
            v1184 = 0u;
            v1181 = 0u;
            v1182 = 0u;
            v753 = objc_msgSend(v750, "countByEnumeratingWithState:objects:count:", &v1181, v1309, 16);
            if (v753)
            {
              v754 = *(_QWORD *)v1182;
              do
              {
                for (i25 = 0; i25 != v753; ++i25)
                {
                  if (*(_QWORD *)v1182 != v754)
                    objc_enumerationMutation(v750);
                  v756 = *(_QWORD **)(*((_QWORD *)&v1181 + 1) + 8 * i25);
                  v763 = (void *)MEMORY[0x18D76B4E4]();
                  if (*(_BYTE *)(v1140 + 64))
                    _NSCoreDataLog(4, (uint64_t)CFSTR("Executing index update statement: %@"), v757, v758, v759, v760, v761, v762, (uint64_t)v756);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v756);
                  objc_autoreleasePoolPop(v763);
                }
                v753 = objc_msgSend(v750, "countByEnumeratingWithState:objects:count:", &v1181, v1309, 16);
              }
              while (v753);
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v1308[0] = CFSTR("Execute index update statements");
            v1308[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v764 - v752);
            objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1308, 2), CFSTR("2.9.4"));
            objc_autoreleasePoolPop(v1136);
            v730 = (char *)v730 + 1;
          }
          while (v730 != v1119);
          v729 = objc_msgSend(v1089, "countByEnumeratingWithState:objects:count:", &v1189, v1314, 16);
        }
        while (v729);
      }
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished index creation and updates."), v723, v724, v725, v726, v727, v728, (uint64_t)v1034);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1307[0] = CFSTR("Total index creation and update time");
      v1307[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v765 - v722);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1307, 2), CFSTR("2.9"));
    }
    v766 = *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 16);
    if (v766)
      v767 = *(void **)(v766 + 32);
    else
      v767 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v769 = v768;
    v1179 = 0u;
    v1180 = 0u;
    v1177 = 0u;
    v1178 = 0u;
    v770 = objc_msgSend(v767, "countByEnumeratingWithState:objects:count:", &v1177, v1306, 16);
    if (v770)
    {
      v1137 = 0;
      v771 = *(_QWORD *)v1178;
      do
      {
        v772 = 0;
        do
        {
          if (*(_QWORD *)v1178 != v771)
            objc_enumerationMutation(v767);
          v773 = *(_QWORD *)(*((_QWORD *)&v1177 + 1) + 8 * v772);
          v774 = (void *)MEMORY[0x18D76B4E4]();
          v775 = objc_msgSend(v767, "objectForKey:", v773);
          v776 = (void *)v775;
          if (v775)
          {
            if (!*(_QWORD *)(v775 + 160))
            {
              v777 = *(void **)(v775 + 152);
              if (v777)
              {
                if (objc_msgSend(v777, "count"))
                {
                  v778 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v776, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("_NSEntityOmitSubentityColumnIndex"));
                  v779 = v778;
                  if (v778)
                  {
                    if (objc_msgSend(v778, "isNSString"))
                    {
                      v780 = (void *)objc_msgSend(v779, "lowercaseString");
                      v781 = v780;
                      if (v780)
                      {
                        if ((objc_msgSend(v780, "isEqualToString:", CFSTR("yes")) & 1) != 0
                          || objc_msgSend(v781, "isEqualToString:", CFSTR("1")))
                        {
                          v782 = (void *)MEMORY[0x1E0CB3940];
                          v1034 = (const __CFString *)objc_msgSend(v776, "tableName");
                          v783 = objc_msgSend(v782, "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS %@_Z_ENT_INDEX"));
                          v790 = (void *)v783;
                          if (*(_BYTE *)(v1140 + 64))
                            _NSCoreDataLog(4, (uint64_t)CFSTR("Executing drop Z_ENT index statement: %@"), v784, v785, v786, v787, v788, v789, v783);
                          -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v790);
                          v1137 = 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          objc_autoreleasePoolPop(v774);
          ++v772;
        }
        while (v770 != v772);
        v791 = objc_msgSend(v767, "countByEnumeratingWithState:objects:count:", &v1177, v1306, 16);
        v770 = v791;
      }
      while (v791);
      if ((v1137 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v1305[0] = CFSTR("Dropping Z_ENT indices");
        v1305[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v792 - v769);
        objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1305, 2), CFSTR("2.10"));
      }
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 192), "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v800 = v799;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Begin updating derived properties."), v793, v794, v795, v796, v797, v798, (uint64_t)v1034);
      v1175 = 0u;
      v1176 = 0u;
      v1173 = 0u;
      v1174 = 0u;
      v1090 = *(id *)(*(_QWORD *)(v1140 + 32) + 192);
      v801 = objc_msgSend(v1090, "countByEnumeratingWithState:objects:count:", &v1173, v1304, 16);
      if (v801)
      {
        v1103 = *(id *)v1174;
        do
        {
          v808 = 0;
          v1120 = (id)v801;
          do
          {
            if (*(id *)v1174 != v1103)
              objc_enumerationMutation(v1090);
            v809 = *(_QWORD *)(*((_QWORD *)&v1173 + 1) + 8 * (_QWORD)v808);
            v1138 = (id)MEMORY[0x18D76B4E4]();
            if (v809)
            {
              -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL](v809);
              v810 = *(void **)(v809 + 32);
            }
            else
            {
              v810 = 0;
            }
            v811 = (void *)objc_msgSend(v810, "valueForKey:", CFSTR("dataStatements"));
            v1171 = 0u;
            v1172 = 0u;
            v1169 = 0u;
            v1170 = 0u;
            v812 = objc_msgSend(v811, "countByEnumeratingWithState:objects:count:", &v1169, v1303, 16);
            if (v812)
            {
              v813 = *(_QWORD *)v1170;
              do
              {
                for (i26 = 0; i26 != v812; ++i26)
                {
                  if (*(_QWORD *)v1170 != v813)
                    objc_enumerationMutation(v811);
                  v815 = *(_QWORD **)(*((_QWORD *)&v1169 + 1) + 8 * i26);
                  v822 = (void *)MEMORY[0x18D76B4E4]();
                  if (*(_BYTE *)(v1140 + 64))
                    _NSCoreDataLog(4, (uint64_t)CFSTR("Executing derived property update statement (data): %@"), v816, v817, v818, v819, v820, v821, (uint64_t)v815);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v815);
                  objc_autoreleasePoolPop(v822);
                }
                v812 = objc_msgSend(v811, "countByEnumeratingWithState:objects:count:", &v1169, v1303, 16);
              }
              while (v812);
            }
            if (v809)
            {
              -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL](v809);
              v823 = *(void **)(v809 + 32);
            }
            else
            {
              v823 = 0;
            }
            v824 = (void *)objc_msgSend(v823, "valueForKey:", CFSTR("triggerCreationStatements"));
            v1167 = 0u;
            v1168 = 0u;
            v1165 = 0u;
            v1166 = 0u;
            v825 = objc_msgSend(v824, "countByEnumeratingWithState:objects:count:", &v1165, v1302, 16);
            if (v825)
            {
              v826 = *(_QWORD *)v1166;
              do
              {
                for (i27 = 0; i27 != v825; ++i27)
                {
                  if (*(_QWORD *)v1166 != v826)
                    objc_enumerationMutation(v824);
                  v828 = *(_QWORD **)(*((_QWORD *)&v1165 + 1) + 8 * i27);
                  v835 = (void *)MEMORY[0x18D76B4E4]();
                  if (*(_BYTE *)(v1140 + 64))
                    _NSCoreDataLog(4, (uint64_t)CFSTR("Executing derived property update statement (trigger): %@"), v829, v830, v831, v832, v833, v834, (uint64_t)v828);
                  -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v828);
                  objc_autoreleasePoolPop(v835);
                }
                v825 = objc_msgSend(v824, "countByEnumeratingWithState:objects:count:", &v1165, v1302, 16);
              }
              while (v825);
            }
            objc_autoreleasePoolPop(v1138);
            v808 = (char *)v808 + 1;
          }
          while (v808 != v1120);
          v801 = objc_msgSend(v1090, "countByEnumeratingWithState:objects:count:", &v1173, v1304, 16);
        }
        while (v801);
      }
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished updating derived properties."), v802, v803, v804, v805, v806, v807, (uint64_t)v1034);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1301[0] = CFSTR("Update derived properties");
      v1301[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v836 - v800);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1301, 2), CFSTR("2.11"));
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v838 = v837;
    v1091 = (id)MEMORY[0x18D76B4E4]();
    v1163 = 0u;
    v1164 = 0u;
    v1161 = 0u;
    v1162 = 0u;
    v839 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 8), "ancillarySQLModels"), "allValues");
    v840 = objc_msgSend(v839, "countByEnumeratingWithState:objects:count:", &v1161, v1300, 16);
    if (v840)
    {
      v841 = 0;
      v1104 = v839;
      v1121 = *(id *)v1162;
      do
      {
        v842 = 0;
        v1139 = (id)v840;
        do
        {
          if (*(id *)v1162 != v1121)
            objc_enumerationMutation(v1104);
          v843 = *(_QWORD *)(*((_QWORD *)&v1161 + 1) + 8 * (_QWORD)v842);
          v844 = (void *)MEMORY[0x18D76B4E4]();
          v1159 = 0u;
          v1160 = 0u;
          v1157 = 0u;
          v1158 = 0u;
          if (v843)
            v845 = *(void **)(v843 + 40);
          else
            v845 = 0;
          v846 = objc_msgSend(v845, "countByEnumeratingWithState:objects:count:", &v1157, v1299, 16);
          if (v846)
          {
            v847 = *(_QWORD *)v1158;
            do
            {
              for (i28 = 0; i28 != v846; ++i28)
              {
                if (*(_QWORD *)v1158 != v847)
                  objc_enumerationMutation(v845);
                v849 = *(void **)(*((_QWORD *)&v1157 + 1) + 8 * i28);
                v850 = (void *)MEMORY[0x18D76B4E4]();
                v851 = *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48);
                v852 = objc_msgSend(v849, "tableName");
                if (v851 && -[NSSQLiteConnection _hasTableWithName:isTemp:](v851, v852, 0))
                {
                  -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), (uint64_t)v849, 0);
                  v841 = 1;
                }
                objc_autoreleasePoolPop(v850);
              }
              v846 = objc_msgSend(v845, "countByEnumeratingWithState:objects:count:", &v1157, v1299, 16);
            }
            while (v846);
          }
          objc_autoreleasePoolPop(v844);
          v842 = (char *)v842 + 1;
        }
        while (v842 != v1139);
        v840 = objc_msgSend(v1104, "countByEnumeratingWithState:objects:count:", &v1161, v1300, 16);
      }
      while (v840);
    }
    else
    {
      v841 = 0;
    }
    objc_autoreleasePoolPop(v1091);
    if ((v841 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1298[0] = CFSTR("Update ancillary model primary keys");
      v1298[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v853 - v838);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1298, 2), CFSTR("2.12"));
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v855 = v854;
    v856 = (void *)MEMORY[0x18D76B4E4]();
    if (-[NSSQLiteConnection hasIndexTrackingTable](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48)))
    {
      -[NSSQLiteConnection dropIndexTrackingTable](*(void **)(*(_QWORD *)(v1140 + 32) + 48));
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1297[0] = CFSTR("Drop index tracking table");
      v1297[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v857 - v855);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1297, 2), CFSTR("2.13"));
    }
    objc_autoreleasePoolPop(v856);
    hasPersistentHistory = -[NSSQLiteConnection _hasPersistentHistoryTables](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48));
    if (hasPersistentHistory)
    {
      v859 = (void *)MEMORY[0x18D76B4E4]();
      v860 = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v868 = v867;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning persistent history metadata tables update"), v861, v862, v863, v864, v865, v866, (uint64_t)v1034);
      v869 = (void *)MEMORY[0x18D76B4E4](v860);
      v870 = -[_NSSQLiteStoreMigrator deleteStatementsForHistory](*(_QWORD *)(v1140 + 32));
      objc_autoreleasePoolPop(v869);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v872 = v871;
      v1296[0] = CFSTR("Generate persistent history delete statements");
      v1296[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v871 - v868);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1296, 2), CFSTR("2.14.1"));
      v873 = -[_NSSQLiteStoreMigrator updateStatementsForHistoryChanges](*(NSSQLiteStatement ***)(v1140 + 32));
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v875 = v874;
      v1295[0] = CFSTR("Generate persistent history update statements");
      v1295[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v874 - v872);
      v876 = objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1295, 2), CFSTR("2.14.2"));
      if (v873)
        v883 = v870;
      else
        v883 = 0;
      if ((v883 & 1) != 0)
      {
        v1155 = 0u;
        v1156 = 0u;
        v1153 = 0u;
        v1154 = 0u;
        v884 = objc_msgSend(v873, "countByEnumeratingWithState:objects:count:", &v1153, v1293, 16);
        if (v884)
        {
          v885 = *(_QWORD *)v1154;
          do
          {
            for (i29 = 0; i29 != v884; ++i29)
            {
              if (*(_QWORD *)v1154 != v885)
                objc_enumerationMutation(v873);
              v887 = *(_QWORD **)(*((_QWORD *)&v1153 + 1) + 8 * i29);
              v894 = (void *)MEMORY[0x18D76B4E4]();
              if (*(_BYTE *)(v1140 + 64))
                _NSCoreDataLog(4, (uint64_t)CFSTR("Executing history migration statement: %@"), v888, v889, v890, v891, v892, v893, (uint64_t)v887);
              -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v887);
              objc_autoreleasePoolPop(v894);
            }
            v884 = objc_msgSend(v873, "countByEnumeratingWithState:objects:count:", &v1153, v1293, 16);
          }
          while (v884);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v1292[0] = CFSTR("Execution of persistent history migration");
        v1292[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v895 - v875);
        objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1292, 2), CFSTR("2.14.4"));
      }
      else
      {
        if (*(_BYTE *)(v1140 + 64))
          _NSCoreDataLog(2, (uint64_t)CFSTR("Dropping Persistent History b/c of an issue with migration"), v877, v878, v879, v880, v881, v882, (uint64_t)v1034);
        v902 = (void *)MEMORY[0x18D76B4E4](v876);
        -[NSSQLiteConnection dropHistoryTrackingTables](*(id **)(*(_QWORD *)(v1140 + 32) + 48));
        objc_autoreleasePoolPop(v902);
        if (*(_BYTE *)(v1140 + 64))
          _NSCoreDataLog(2, (uint64_t)CFSTR("Finished dropping Persistent History b/c of an issue with migration"), v903, v904, v905, v906, v907, v908, (uint64_t)v1034);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v1294[0] = CFSTR("Drop persistent history tables");
        v1294[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v909 - v875);
        objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1294, 2), CFSTR("2.14.3"));
      }
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Completed persistent history metadata tables update"), v896, v897, v898, v899, v900, v901, (uint64_t)v1034);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1291[0] = CFSTR("Total persistent history migration");
      v1291[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v910 - v868);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1291, 2), CFSTR("2.14"));
      objc_autoreleasePoolPop(v859);
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 208), "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v918 = v917;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Beginning CloudKit metadata tables update"), v911, v912, v913, v914, v915, v916, (uint64_t)v1034);
      v1151 = 0u;
      v1152 = 0u;
      v1149 = 0u;
      v1150 = 0u;
      v919 = *(void **)(*(_QWORD *)(v1140 + 32) + 208);
      v926 = objc_msgSend(v919, "countByEnumeratingWithState:objects:count:", &v1149, v1290, 16);
      if (v926)
      {
        v927 = *(_QWORD *)v1150;
        do
        {
          for (i30 = 0; i30 != v926; ++i30)
          {
            if (*(_QWORD *)v1150 != v927)
              objc_enumerationMutation(v919);
            v929 = *(_QWORD **)(*((_QWORD *)&v1149 + 1) + 8 * i30);
            v936 = (void *)MEMORY[0x18D76B4E4]();
            if (*(_BYTE *)(v1140 + 64))
              _NSCoreDataLog(4, (uint64_t)CFSTR("Executing CloudKit metadata table update: %@"), v930, v931, v932, v933, v934, v935, (uint64_t)v929);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v929);
            objc_autoreleasePoolPop(v936);
          }
          v926 = objc_msgSend(v919, "countByEnumeratingWithState:objects:count:", &v1149, v1290, 16);
        }
        while (v926);
      }
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished CloudKit metadata tables update"), v920, v921, v922, v923, v924, v925, (uint64_t)v1034);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1289[0] = CFSTR("CloudKit metadata updates");
      v1289[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v937 - v918);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1289, 2), CFSTR("2.15"));
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v945 = v944;
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Updating metadata"), v938, v939, v940, v941, v942, v943, (uint64_t)v1034);
    v946 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 8), "metadata"), "mutableCopy");
    v1131 = v946;
    v947 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 16), "managedObjectModel");
    v948 = (void *)objc_msgSend(v947, "entityVersionHashesByName");
    -[__CFString setObject:forKey:](v946, "setObject:forKey:", v948, CFSTR("NSStoreModelVersionHashes"));
    v949 = -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v947, v948);
    -[__CFString setObject:forKey:](v946, "setObject:forKey:", v949, 0x1E1EF0E90);
    -[__CFString setObject:forKey:](v946, "setObject:forKey:", objc_msgSend(v947, "versionChecksum"), CFSTR("NSStoreModelVersionChecksumKey"));
    if (v947)
      v950 = objc_msgSend((id)objc_msgSend(v947, "versionIdentifiers"), "allObjects");
    else
      v950 = 0;
    -[__CFString setObject:forKey:](v946, "setObject:forKey:", v950, CFSTR("NSStoreModelVersionIdentifiers"));
    v951 = objc_msgSend((id)objc_opt_class(), "_annotatesMigrationMetadata");
    if ((_DWORD)v951)
      v951 = -[__CFString setObject:forKey:](v946, "setObject:forKey:", CFSTR("NSSQLiteInPlaceMigrationManager"), CFSTR("migrationManagerClass"));
    v952 = *(_QWORD *)(v1140 + 32);
    if (v952 && *(_BYTE *)(v952 + 217))
      v951 = -[__CFString setValue:forKey:](v946, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreDeferredLightweightMigrationOptionKey"));
    v953 = (void *)MEMORY[0x18D76B4E4](v951);
    -[NSSQLiteConnection saveMetadata:](*(_QWORD **)(*(_QWORD *)(v1140 + 32) + 48), v946);
    -[NSSQLiteConnection saveCachedModel:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), (uint64_t)v947);
    if (hasPersistentHistory)
      -[NSSQLiteConnection processMigrationRequestForHash:stageLabel:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), (uint64_t)v949, *(_QWORD *)(*(_QWORD *)(v1140 + 32) + 232));
    objc_autoreleasePoolPop(v953);
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished updating metadata"), v954, v955, v956, v957, v958, v959, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v407 = v960;
    v1288[0] = CFSTR("Update store metadata");
    v1288[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v960 - v945);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1288, 2), CFSTR("2.16"));
    if (-[NSMappingModel _hasInferredMappingNeedingValidation](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 40)))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v968 = v967;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Starting inferred mapping validation"), v961, v962, v963, v964, v965, v966, (uint64_t)v1034);
      v1147 = 0u;
      v1148 = 0u;
      v1145 = 0u;
      v1146 = 0u;
      v1046 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 40), "entityMappings");
      v1051 = objc_msgSend(v1046, "countByEnumeratingWithState:objects:count:", &v1145, v1287, 16);
      if (v1051)
      {
        contextc = *(void **)v1146;
        do
        {
          for (i31 = 0; i31 != (void *)v1051; i31 = (char *)i31 + 1)
          {
            if (*(void **)v1146 != contextc)
              objc_enumerationMutation(v1046);
            v1071 = *(void **)(*((_QWORD *)&v1145 + 1) + 8 * (_QWORD)i31);
            v1061 = (void *)MEMORY[0x18D76B4E4]();
            if (v1071)
            {
              v969 = (void *)objc_msgSend(v1071, "userInfo");
              if (objc_msgSend((id)objc_msgSend(v969, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue"))
              {
                if (*(_BYTE *)(v1140 + 64))
                {
                  v970 = objc_msgSend(v1071, "name");
                  _NSCoreDataLog(4, (uint64_t)CFSTR("Executing inferred mapping validation: %@"), v971, v972, v973, v974, v975, v976, v970);
                }
                v978 = *(_QWORD *)(v1140 + 32);
                v977 = *(_QWORD *)(v1140 + 40);
                if (!v978)
                  goto LABEL_993;
                v1043 = *(_QWORD **)(v977 + 8);
                v979 = (id *)objc_msgSend(*(id *)(v978 + 16), "entityNamed:", objc_msgSend(v1071, "destinationEntityName"));
                v1360 = 0u;
                v1359 = 0u;
                v1358 = 0u;
                v1357 = 0u;
                v980 = (void *)objc_msgSend(v1071, "attributeMappings");
                v981 = objc_msgSend(v980, "countByEnumeratingWithState:objects:count:", &v1357, &v1371, 16);
                if (v981)
                {
                  v1092 = *(id *)v1358;
                  obje = v980;
                  do
                  {
                    v1105 = (id)v981;
                    v1122 = 0;
                    do
                    {
                      if (*(id *)v1358 != v1092)
                        objc_enumerationMutation(v980);
                      v982 = *(_QWORD **)(*((_QWORD *)&v1357 + 1) + 8 * (_QWORD)v1122);
                      v1353 = 0u;
                      v1354 = 0u;
                      v1355 = 0u;
                      v1356 = 0u;
                      if (v982)
                        v983 = (void *)v982[2];
                      else
                        v983 = 0;
                      v984 = objc_msgSend(v983, "countByEnumeratingWithState:objects:count:", &v1353, &v1369, 16);
                      if (v984)
                      {
                        v985 = *(_QWORD *)v1354;
                        do
                        {
                          v986 = 0;
                          do
                          {
                            if (*(_QWORD *)v1354 != v985)
                              objc_enumerationMutation(v983);
                            if (!objc_msgSend(*(id *)(*((_QWORD *)&v1353 + 1) + 8 * v986), "isEqualToString:", NSPropertyTransformMandatoryPropertyValidation))
                            {
                              v1023 = (void *)MEMORY[0x1E0C99DA0];
                              v1024 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v982, CFSTR("propertyMapping"));
LABEL_989:
                              objc_exception_throw((id)objc_msgSend(v1023, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unrecognized transform validation in property mapping"), v1024));
                            }
                            v987 = objc_msgSend(v982, "name");
                            if (v979)
                              v988 = (void *)objc_msgSend(v979[5], "objectForKey:", v987);
                            else
                              v988 = 0;
                            v989 = (void *)objc_msgSend(v988, "propertyDescription");
                            if (v989 && objc_msgSend(v989, "superCompositeAttribute"))
                            {
                              v990 = (void *)objc_msgSend((id)objc_msgSend(v988, "propertyDescription"), "superCompositeAttribute");
                              while ((objc_msgSend(v990, "isOptional") & 1) == 0)
                              {
                                v990 = (void *)objc_msgSend(v990, "superCompositeAttribute");
                                if (!v990)
                                  goto LABEL_936;
                              }
                            }
                            else
                            {
LABEL_936:
                              if (-[_NSSQLiteStoreMigrator _countNullsInColumn:forEntity:](v978, v988, (uint64_t)v979) >= 1)
                              {
                                v1025 = (void *)MEMORY[0x1E0CB35C8];
                                v1026 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Validation error missing attribute values on mandatory destination attribute"), CFSTR("reason"), objc_msgSend(v979, "name"), CFSTR("entity"), objc_msgSend(v988, "name"), CFSTR("attribute"), 0);
                                goto LABEL_992;
                              }
                            }
                            ++v986;
                          }
                          while (v986 != v984);
                          v991 = objc_msgSend(v983, "countByEnumeratingWithState:objects:count:", &v1353, &v1369, 16);
                          v984 = v991;
                        }
                        while (v991);
                      }
                      v1122 = (char *)v1122 + 1;
                      v980 = obje;
                    }
                    while (v1122 != v1105);
                    v992 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v1357, &v1371, 16);
                    v981 = v992;
                  }
                  while (v992);
                }
                v1352 = 0u;
                v1351 = 0u;
                v1350 = 0u;
                v1349 = 0u;
                v993 = (void *)objc_msgSend(v1071, "relationshipMappings");
                v994 = objc_msgSend(v993, "countByEnumeratingWithState:objects:count:", &v1349, &v1365, 16);
                if (!v994)
                  goto LABEL_978;
                v1093 = *(id *)v1350;
                objf = v993;
LABEL_947:
                v995 = 0;
                v1106 = (char *)v994;
                while (1)
                {
                  if (*(id *)v1350 != v1093)
                    objc_enumerationMutation(v993);
                  v996 = *(_QWORD **)(*((_QWORD *)&v1349 + 1) + 8 * (_QWORD)v995);
                  v1345 = 0u;
                  v1346 = 0u;
                  v1347 = 0u;
                  v1348 = 0u;
                  v997 = v996 ? (void *)v996[2] : 0;
                  v998 = objc_msgSend(v997, "countByEnumeratingWithState:objects:count:", &v1345, &v1361, 16);
                  v1123 = v995;
                  if (v998)
                    break;
LABEL_974:
                  v995 = v1123 + 1;
                  v993 = objf;
                  if (v1123 + 1 == v1106)
                  {
                    v994 = objc_msgSend(objf, "countByEnumeratingWithState:objects:count:", &v1349, &v1365, 16);
                    if (!v994)
                      goto LABEL_978;
                    goto LABEL_947;
                  }
                }
                v999 = *(_QWORD *)v1346;
                while (2)
                {
                  v1000 = 0;
LABEL_955:
                  if (*(_QWORD *)v1346 != v999)
                    objc_enumerationMutation(v997);
                  if (!objc_msgSend(*(id *)(*((_QWORD *)&v1345 + 1) + 8 * v1000), "isEqualToString:", NSPropertyTransformMandatoryPropertyValidation))
                  {
                    v1023 = (void *)MEMORY[0x1E0C99DA0];
                    v1024 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v996, CFSTR("propertyMapping"));
                    goto LABEL_989;
                  }
                  v1001 = objc_msgSend(v996, "name");
                  if (v979
                    && (v1002 = (__CFString *)objc_msgSend(v979[5], "objectForKey:", v1001), (v1003 = v1002) != 0))
                  {
                    if (LOBYTE(v1002->length) == 7)
                    {
                      if (-[_NSSQLiteStoreMigrator _countNullsInColumn:forEntity:](v978, (void *)-[__CFString foreignKey](v1002, "foreignKey"), (uint64_t)v979) >= 1)
                      {
                        v1025 = (void *)MEMORY[0x1E0CB35C8];
                        v1026 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Validation error missing attribute values on mandatory destination relationship"), CFSTR("reason"), objc_msgSend(v979, "name"), CFSTR("entity"), -[__CFString name](v1003, "name"), CFSTR("attribute"), 0);
                        goto LABEL_992;
                      }
                      goto LABEL_969;
                    }
                    if (!-[__CFString isToMany](v1002, "isToMany"))
                    {
                      if (LOBYTE(v1003->length) == 9)
                      {
                        v1005 = -[NSSQLManyToMany inverseColumnName](v1003);
                        if (-[_NSSQLiteStoreMigrator _countUnreferencedPrimaryKeysForEntity:inForeignKeyColumnName:fromTable:](v978, (uint64_t)v979, (uint64_t)v1005, -[__CFString correlationTableName](v1003, "correlationTableName")) >= 1)
                        {
LABEL_991:
                          v1025 = (void *)MEMORY[0x1E0CB35C8];
                          v1026 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Validation error missing relationship values on mandatory destination destination"), CFSTR("reason"), objc_msgSend(v979, "name"), CFSTR("entity"), -[__CFString name](v1003, "name"), CFSTR("relationship"), 0);
LABEL_992:
                          v1043[5] = objc_msgSend(v1025, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v1026);
                          v977 = *(_QWORD *)(v1140 + 40);
LABEL_993:
                          v1027 = *(id *)(*(_QWORD *)(v977 + 8) + 40);
                          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("validation error"), CFSTR("validation failed"), 0));
                        }
                      }
LABEL_969:
                      if (v998 == ++v1000)
                      {
                        v1006 = objc_msgSend(v997, "countByEnumeratingWithState:objects:count:", &v1345, &v1361, 16);
                        v998 = v1006;
                        if (!v1006)
                          goto LABEL_974;
                        continue;
                      }
                      goto LABEL_955;
                    }
                    length = (void *)v1003[1].length;
                  }
                  else
                  {
                    if ((objc_msgSend(0, "isToMany") & 1) == 0)
                      goto LABEL_969;
                    v1003 = 0;
                    length = 0;
                  }
                  break;
                }
                if (-[_NSSQLiteStoreMigrator _countUnreferencedPrimaryKeysForEntity:inForeignKeyColumnName:fromTable:](v978, (uint64_t)v979, objc_msgSend((id)objc_msgSend(length, "foreignKey"), "columnName"), objc_msgSend((id)-[__CFString destinationEntity](v1003, "destinationEntity"), "tableName")) >= 1)goto LABEL_991;
                goto LABEL_969;
              }
            }
LABEL_978:
            objc_autoreleasePoolPop(v1061);
          }
          v1051 = objc_msgSend(v1046, "countByEnumeratingWithState:objects:count:", &v1145, v1287, 16);
        }
        while (v1051);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v1014 = v1013;
      if (*(_BYTE *)(v1140 + 64))
        _NSCoreDataLog(4, (uint64_t)CFSTR("Finished inferred mapping validation"), v1007, v1008, v1009, v1010, v1011, v1012, (uint64_t)v1034);
      v1286[0] = CFSTR("Inferred mapping validation");
      v1286[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v1014 - v968);
      objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1286, 2), CFSTR("2.16b"));
    }
    goto LABEL_522;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v675 = v674;
  if (*(_BYTE *)(v1140 + 64))
    _NSCoreDataLog(4, (uint64_t)CFSTR("Begin attribute extension updates."), v668, v669, v670, v671, v672, v673, (uint64_t)v1034);
  v1204 = 0u;
  v1203 = 0u;
  v1202 = 0u;
  v1201 = 0u;
  v676 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1140 + 32) + 152), "objectForKey:", CFSTR("inserted"));
  v677 = objc_msgSend(v676, "countByEnumeratingWithState:objects:count:", &v1201, v1318, 16);
  if (!v677)
  {
LABEL_726:
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Finished attribute extension updates."), v678, v679, v680, v681, v682, v683, (uint64_t)v1034);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v1315[0] = CFSTR("Update attribute extensions");
    v1315[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v714 - v675);
    objc_msgSend(v1052, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1315, 2), CFSTR("2.8"));
    goto LABEL_729;
  }
  v1088 = *(id *)v1202;
  v1070 = v676;
LABEL_699:
  v1135 = 0;
  objd = (id)v677;
  while (1)
  {
    if (*(id *)v1202 != v1088)
      objc_enumerationMutation(v1070);
    v684 = *(void **)(*((_QWORD *)&v1201 + 1) + 8 * (_QWORD)v1135);
    v1118 = (id)MEMORY[0x18D76B4E4]();
    v1101 = objc_msgSend(v684, "validate:", *(_QWORD *)(*(_QWORD *)(v1140 + 40) + 8) + 40);
    if (v1101)
    {
      v1200 = 0u;
      v1199 = 0u;
      v1198 = 0u;
      v1197 = 0u;
      v685 = (void *)objc_msgSend(v684, "insertSQLStrings");
      v686 = objc_msgSend(v685, "countByEnumeratingWithState:objects:count:", &v1197, v1317, 16);
      if (v686)
      {
        v687 = *(_QWORD *)v1198;
        do
        {
          for (i32 = 0; i32 != v686; ++i32)
          {
            if (*(_QWORD *)v1198 != v687)
              objc_enumerationMutation(v685);
            v689 = *(_QWORD *)(*((_QWORD *)&v1197 + 1) + 8 * i32);
            v690 = (void *)MEMORY[0x18D76B4E4]();
            v691 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v689);
            v698 = v691;
            if (*(_BYTE *)(v1140 + 64))
              _NSCoreDataLog(4, (uint64_t)CFSTR("Executing attribute extension insert statement: %@"), v692, v693, v694, v695, v696, v697, (uint64_t)v691);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v698);

            objc_autoreleasePoolPop(v690);
          }
          v686 = objc_msgSend(v685, "countByEnumeratingWithState:objects:count:", &v1197, v1317, 16);
        }
        while (v686);
      }
      v1196 = 0u;
      v1195 = 0u;
      v1194 = 0u;
      v1193 = 0u;
      v699 = (void *)objc_msgSend(v684, "bulkUpdateSQLStrings");
      v700 = objc_msgSend(v699, "countByEnumeratingWithState:objects:count:", &v1193, v1316, 16);
      if (v700)
      {
        v701 = *(_QWORD *)v1194;
        do
        {
          for (i33 = 0; i33 != v700; ++i33)
          {
            if (*(_QWORD *)v1194 != v701)
              objc_enumerationMutation(v699);
            v703 = *(_QWORD *)(*((_QWORD *)&v1193 + 1) + 8 * i33);
            v704 = (void *)MEMORY[0x18D76B4E4]();
            v705 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v703);
            v712 = v705;
            if (*(_BYTE *)(v1140 + 64))
              _NSCoreDataLog(4, (uint64_t)CFSTR("Executing attribute extension change statement: %@"), v706, v707, v708, v709, v710, v711, (uint64_t)v705);
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), v712);

            objc_autoreleasePoolPop(v704);
          }
          v700 = objc_msgSend(v699, "countByEnumeratingWithState:objects:count:", &v1193, v1316, 16);
        }
        while (v700);
      }
    }
    else
    {
      v713 = *(id *)(*(_QWORD *)(*(_QWORD *)(v1140 + 40) + 8) + 40);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1140 + 48) + 8) + 24) = 0;
    }
    objc_autoreleasePoolPop(v1118);
    if (!v1101)
      break;
    v1135 = (char *)v1135 + 1;
    if (v1135 == objd)
    {
      v677 = objc_msgSend(v1070, "countByEnumeratingWithState:objects:count:", &v1201, v1318, 16);
      if (v677)
        goto LABEL_699;
      goto LABEL_726;
    }
  }
LABEL_844:
  v1131 = 0;
  v312 = 1;
  v313 = v1140;
LABEL_1005:
  -[NSSQLiteConnection endFetchAndRecycleStatement:](*(_QWORD *)(*(_QWORD *)(v313 + 32) + 48), 0);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1140 + 48) + 8) + 24) && *(_BYTE *)(v1140 + 64))
    _NSCoreDataLog(4, (uint64_t)CFSTR("Failed lightweight migration on connection"), v1028, v1029, v1030, v1031, v1032, v1033, (uint64_t)v1034);
  if (*(_BYTE *)(v1140 + 65))
    -[NSSQLiteConnection _executeSQLString:](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48), CFSTR("pragma cache_size = 512"));
  if (v312)
  {
    if (*(_BYTE *)(v1140 + 64))
      _NSCoreDataLog(4, (uint64_t)CFSTR("Rolling back formal transaction"), v1028, v1029, v1030, v1031, v1032, v1033, (uint64_t)v1034);
    -[NSSQLiteConnection rollbackTransaction](*(_QWORD *)(*(_QWORD *)(v1140 + 32) + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1140 + 48) + 8) + 24) = 0;
  }
}

uint64_t __57___NSSQLiteStoreMigrator_createEntityMigrationStatements__block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;

  if (a2)
  {
    v5 = a2[6];
    if (a3)
    {
LABEL_3:
      v6 = a3[6];
      goto LABEL_4;
    }
  }
  else
  {
    v5 = 0;
    if (a3)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_4:
  if (v5 != v6)
  {
    if (a2)
    {
      v12 = (int)a2[6];
      if (v12 <= 3)
      {
        v13 = qword_18A50A420[v12];
        if (!a3)
          goto LABEL_41;
LABEL_23:
        v18 = (int)a3[6];
        if (v18 > 3)
          v19 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v19 = qword_18A50A420[v18];
LABEL_26:
        if (v13 < v19)
          return -1;
        if (v13 > v19)
          return 1;
        if (a2)
        {
          v20 = a2[6];
          if (a3)
          {
LABEL_32:
            v21 = a3[6];
            goto LABEL_33;
          }
        }
        else
        {
          v20 = 0;
          if (a3)
            goto LABEL_32;
        }
        v21 = 0;
LABEL_33:
        if (v20 > v21)
          return 1;
        else
          return -1;
      }
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (a3)
        goto LABEL_23;
    }
    else
    {
      v13 = 3;
      if (a3)
        goto LABEL_23;
    }
LABEL_41:
    v19 = 3;
    goto LABEL_26;
  }
  v7 = objc_msgSend(a2, "rootEntity");
  if (v7)
    v8 = *(_DWORD *)(v7 + 184);
  else
    v8 = 0;
  v9 = objc_msgSend(a3, "rootEntity");
  if (v9)
    v10 = *(_DWORD *)(v9 + 184);
  else
    v10 = 0;
  if (v8 == v10)
    return 0;
  v14 = objc_msgSend(a2, "rootEntity");
  if (v14)
    v15 = *(_DWORD *)(v14 + 184);
  else
    v15 = 0;
  v16 = objc_msgSend(a3, "rootEntity");
  if (v16)
    v17 = *(_DWORD *)(v16 + 184);
  else
    v17 = 0;
  if (v15 < v17)
    return 1;
  else
    return -1;
}

uint64_t __57___NSSQLiteStoreMigrator_createEntityMigrationStatements__block_invoke_382(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0), "compare:", objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  if (v5 == 1)
  {
    v18 = objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
    v7 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v8 = (void *)v18;
    return objc_msgSend(v8, "compare:", v7);
  }
  if (!v5)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CloudKit metadata migration generated a source / destination id mapping for identical ids: %@");
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)a2);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = a2;
      _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: CloudKit metadata migration generated a source / destination id mapping for identical ids: %@", buf, 0xCu);
    }
    return 0;
  }
  if (v5 != -1)
    return 0;
  v6 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v7 = objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v8 = (void *)v6;
  return objc_msgSend(v8, "compare:", v7);
}

void __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t j;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  uint64_t v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  void *context;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a2, "count");
  if (v6 | objc_msgSend(a3, "count"))
  {
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a2);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
    v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v35 = a1;
    v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "entityMappings");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v58;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v58 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x18D76B4E4]();
          if (objc_msgSend((id)objc_msgSend(v14, "destinationEntityName"), "isEqualToString:", objc_msgSend(*(id *)(v35 + 40), "name"))&& objc_msgSend(v14, "mappingType") == 5)
          {
            objc_msgSend(v36, "unionSet:", obj);
            objc_autoreleasePoolPop(v15);
            goto LABEL_35;
          }
          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        if (v11)
          continue;
        break;
      }
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          context = (void *)MEMORY[0x18D76B4E4]();
          v18 = objc_msgSend(v7, "containsObject:", v17);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v50;
            do
            {
              for (k = 0; k != v20; ++k)
              {
                if (*(_QWORD *)v50 != v21)
                  objc_enumerationMutation(v7);
                v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
                if (!objc_msgSend(v17, "_compare:", v23))
                {
                  v24 = -[NSFetchIndexDescription _isUnique]((uint64_t)v17);
                  if (v24 == -[NSFetchIndexDescription _isUnique]((uint64_t)v23))
                  {
                    if ((v18 & 1) == 0
                      || (objc_msgSend((id)objc_msgSend(v17, "name"), "isEqualToString:", objc_msgSend(v23, "name")) & 1) == 0)
                    {
                      objc_msgSend(v8, "removeObject:", v23);
                    }
                    v18 = 1;
                  }
                }
              }
              v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
            }
            while (v20);
          }
          if ((v18 & 1) == 0)
            objc_msgSend(v36, "addObject:", v17);
          objc_autoreleasePoolPop(context);
        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v39);
    }
LABEL_35:
    v64 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v25 = (void *)objc_msgSend(v8, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1));
    v63 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v26 = (void *)objc_msgSend(v36, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*(_QWORD *)(v35 + 32) + 160), "addObject:", -[NSSQLEntity indexForIndexDescription:](*(id **)(v35 + 40), *(id **)(*((_QWORD *)&v45 + 1) + 8 * m)));
        }
        v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
      }
      while (v28);
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v31 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v42;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*(_QWORD *)(v35 + 32) + 168), "addObject:", -[NSSQLEntity indexForIndexDescription:](*(id **)(v35 + 48), *(id **)(*((_QWORD *)&v41 + 1) + 8 * n)));
        }
        v32 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
      }
      while (v32);
    }

  }
}

uint64_t __89___NSSQLiteStoreMigrator__determineIndexesToMigrateForSourceEntity_andDestinationEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __89___NSSQLiteStoreMigrator__determineIndexesToMigrateForSourceEntity_andDestinationEntity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __103___NSSQLiteStoreMigrator__determineUniquenessConstraintsToMigrateForSourceEntity_andDestinationEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __103___NSSQLiteStoreMigrator__determineUniquenessConstraintsToMigrateForSourceEntity_andDestinationEntity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

@end
