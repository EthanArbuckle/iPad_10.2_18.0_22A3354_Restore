@implementation CKMergeableDeltaMetadata

+ (id)replacementDeltaMetadatasForDeltaDirectory:(id)a3 withNextDeltaMetadata:(id)a4 currentStateVector:(id)a5 deltaDirectoryDeliveryRequirements:(unint64_t)a6 error:(id *)a7
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  char v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  id v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  char hasAtomStateNotInStateVector;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  const char *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  id v193;
  const char *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t j;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  void *v205;
  const char *v206;
  const char *v207;
  const char *v208;
  const char *v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  id v237;
  const char *v238;
  id v239;
  const char *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t n;
  void *v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  CKMergeableDeltaMetadata *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  CKMergeableDeltaVectors *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  void *v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  const char *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t ii;
  const char *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  CKMergeableDeltaMetadata *v327;
  CKMergeableDeltaVectors *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  const char *v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  void *v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  int isEquivalent;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  int v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  const char *v367;
  void *v368;
  id v369;
  id v370;
  const char *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t jj;
  void *v378;
  void *v379;
  const char *v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  char v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  void *v414;
  NSObject *v415;
  const char *v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  void *v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  BOOL v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  void *v452;
  id v453;
  const char *v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t kk;
  void *v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  char v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  id v473;
  uint64_t v474;
  void *v475;
  void *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  void *v485;
  const char *v486;
  uint64_t v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  void *v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  const char *v516;
  uint64_t v517;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  const char *v522;
  uint64_t v523;
  uint64_t v524;
  void *v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  void *v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  void *v533;
  const char *v534;
  uint64_t v535;
  void *v536;
  const char *v537;
  void *v538;
  const char *v539;
  uint64_t v540;
  void *v541;
  NSObject *v542;
  void *v543;
  NSObject *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  void *v548;
  void *v549;
  NSObject *v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  void *v554;
  void *v555;
  NSObject *v556;
  void *v557;
  NSObject *v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  const char *v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  const char *v569;
  uint64_t v570;
  uint64_t v571;
  void *v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  void *v576;
  const char *v577;
  uint64_t v578;
  uint64_t v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  void *v584;
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  void *v588;
  const char *v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  const char *v593;
  void *v594;
  const __CFString *v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  id v599;
  void *v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  void *v608;
  const char *v609;
  uint64_t v610;
  uint64_t v611;
  void *v612;
  const char *v613;
  uint64_t v614;
  uint64_t v615;
  void *v616;
  const char *v617;
  uint64_t v618;
  uint64_t v619;
  void *v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  void *v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  void *v629;
  const __CFString *v630;
  void *v632;
  unint64_t v634;
  void *v635;
  char v636;
  id v637;
  id v638;
  id v640;
  id v641;
  id v642;
  id v643;
  void *v644;
  uint64_t v645;
  id v646;
  uint64_t v647;
  id v648;
  void *v649;
  void *v650;
  void *v651;
  id v652;
  uint64_t k;
  void (**v654)(void *, void *);
  id v655;
  id v656;
  id v657;
  id v658;
  uint64_t v659;
  int isEqual;
  uint64_t v661;
  uint64_t v662;
  void *v663;
  id v664;
  id v665;
  id v666;
  id v667;
  void *v668;
  void *v669;
  void *v670;
  void *context;
  void *contexta;
  int contextb;
  id contextc;
  id contextd;
  void *contexte;
  void *contextf;
  uint64_t v678;
  int v679;
  uint64_t (**v680)(void *, void *, _QWORD);
  void *v681;
  void *v682;
  id v683;
  id obj;
  id v685;
  id v686;
  id v687;
  id v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  id v694;
  uint64_t m;
  void *v696;
  void (**v697)(void *, _QWORD);
  void *v698;
  void *v699;
  void *v700;
  id v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  _QWORD v714[4];
  id v715;
  id v716;
  id v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  _QWORD v722[4];
  id v723;
  SEL v724;
  id v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  _QWORD aBlock[4];
  id v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  _QWORD v736[4];
  id v737;
  id v738;
  void *v739;
  id v740;
  id v741;
  _BYTE *v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  _BYTE buf[24];
  void *v764;
  __int16 v765;
  uint64_t v766;
  __int16 v767;
  const __CFString *v768;
  _BYTE v769[128];
  _BYTE v770[128];
  _BYTE v771[128];
  _QWORD v772[2];
  _BYTE v773[128];
  _BYTE v774[128];
  _BYTE v775[128];
  _BYTE v776[128];
  _BYTE v777[128];
  _BYTE v778[128];
  _BYTE v779[128];
  _BYTE v780[128];
  uint64_t v781;

  v781 = *MEMORY[0x1E0C80C00];
  v643 = a3;
  v10 = a4;
  v701 = a5;
  v683 = (id)objc_opt_new();
  v635 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_vectors(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_timestampCount(v18, v19, v20, v21);

  if (!v22)
  {

    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v640 = v643;
    v10 = 0;
    v57 = 1;
    goto LABEL_8;
  }
  v23 = (void *)objc_opt_new();
  objc_msgSend_vectors(v10, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_previous(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unionVector_(v23, v32, (uint64_t)v31, v33);

  objc_msgSend_vectors(v10, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v37, v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector((void *)v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unionVector_(v23, v46, (uint64_t)v45, v47);

  objc_msgSend_clockVector(v701, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v41) = objc_msgSend_isEqual_(v23, v52, (uint64_t)v51, v53);

  if ((v41 & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v54, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Next delta %@ was not generated using current state vector %@"), v10, v701);

  objc_msgSend_setByAddingObject_(v643, v55, (uint64_t)v10, v56);
  v640 = (id)objc_claimAutoreleasedReturnValue();
  v57 = 0;
LABEL_8:
  v58 = (void *)objc_opt_new();
  objc_msgSend_deliverableDeltaMetadatasInDeltaSet_withMergeableValueCurrentStateVector_deliveryRequirements_(a1, v59, (uint64_t)v640, (uint64_t)v58, a6);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v634 = a6;
  if ((v57 & 1) != 0)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  if ((objc_msgSend_containsObject_(v60, v61, (uint64_t)v10, v62) & 1) == 0)
  {
    objc_msgSend_allObjects(v643, v63, v64, v65);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v70, (uint64_t)v69, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v73);

    v74 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v72;
      _os_log_fault_impl(&dword_18A5C5000, v74, OS_LOG_TYPE_FAULT, "Next delta %@ may not be deliverable with aggregated delta directory metadata %@", buf, 0x16u);
    }

    goto LABEL_18;
  }
  if (!v10)
  {
LABEL_19:
    v636 = 1;
    goto LABEL_20;
  }
  if ((objc_msgSend_containsObject_(v643, v63, (uint64_t)v10, v65) & 1) != 0)
  {
    v636 = 0;
LABEL_20:
    v700 = v10;
    v637 = v60;
    goto LABEL_21;
  }
  v700 = v10;
  v420 = (void *)objc_msgSend_mutableCopy(v60, v66, v67, v68);
  objc_msgSend_removeObject_(v420, v421, (uint64_t)v10, v422);
  v637 = (id)objc_msgSend_copy(v420, v423, v424, v425);

  v636 = 0;
LABEL_21:
  v638 = v60;

  v668 = (void *)objc_opt_new();
  v699 = (void *)objc_opt_new();
  v682 = (void *)objc_opt_new();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v75, v76, v77);
  v669 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v78, v79, v80);
  v670 = (void *)objc_claimAutoreleasedReturnValue();
  v762 = 0u;
  v761 = 0u;
  v760 = 0u;
  v759 = 0u;
  obj = v637;
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v759, (uint64_t)v780, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v760;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v760 != v83)
          objc_enumerationMutation(obj);
        v85 = *(void **)(*((_QWORD *)&v759 + 1) + 8 * i);
        v86 = (void *)MEMORY[0x18D76DE4C]();
        v87 = v701;
        objc_msgSend_vectors(v85, v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        hasAtomStateNotInStateVector = objc_msgSend_hasAtomStateNotInStateVector_(v95, v96, (uint64_t)v87, v97);

        if ((hasAtomStateNotInStateVector & 1) == 0)
        {
          v102 = (void *)objc_msgSend_mutableCopy(v87, v99, v100, v101);
          objc_msgSend_vectors(v85, v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v106, v107, v108, v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clockVector(v110, v111, v112, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_intersectVector_(v102, v115, (uint64_t)v114, v116);

          v120 = (void *)objc_msgSend_mutableCopy(v102, v117, v118, v119);
          objc_msgSend_vectors(v85, v121, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v124, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_minusStateVector_(v120, v129, (uint64_t)v128, v130);

          if (objc_msgSend_timestampCount(v120, v131, v132, v133))
          {
            objc_msgSend_addObject_(v668, v134, (uint64_t)v85, v135);
            objc_msgSend_unionStateVector_(v699, v136, (uint64_t)v120, v137);
            objc_msgSend_allSiteIdentifiers(v120, v138, v139, v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_unionSet_(v682, v142, (uint64_t)v141, v143);

            objc_msgSend_setObject_forKey_(v669, v144, (uint64_t)v102, (uint64_t)v85);
            objc_msgSend_setObject_forKey_(v670, v145, (uint64_t)v120, (uint64_t)v85);
          }

        }
        objc_autoreleasePoolPop(v86);
      }
      v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v146, (uint64_t)&v759, (uint64_t)v780, 16);
    }
    while (v82);
  }

  v655 = (id)objc_msgSend_count(v668, v147, v148, v149);
  v150 = (void *)objc_opt_new();
  if (v655)
  {
    v758 = 0u;
    v757 = 0u;
    v756 = 0u;
    v755 = 0u;
    v658 = v638;
    v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v658, v151, (uint64_t)&v755, (uint64_t)v779, 16);
    if (v152)
    {
      v661 = *(_QWORD *)v756;
      do
      {
        v153 = 0;
        v664 = (id)v152;
        do
        {
          if (*(_QWORD *)v756 != v661)
            objc_enumerationMutation(v658);
          v678 = v153;
          v154 = *(void **)(*((_QWORD *)&v755 + 1) + 8 * v153);
          context = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_vectors(v154, v155, v156, v157);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removals(v158, v159, v160, v161);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v689 = (void *)objc_msgSend_mutableCopy(v162, v163, v164, v165);

          objc_msgSend_intersectStateVector_(v689, v166, (uint64_t)v699, v167);
          objc_msgSend_vectors(v154, v168, v169, v170);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v171, v172, v173, v174);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v685 = (id)objc_msgSend_mutableCopy(v175, v176, v177, v178);

          objc_msgSend_intersectStateVector_(v685, v179, (uint64_t)v699, v180);
          v694 = v689;
          objc_msgSend_unionStateVector_(v694, v181, (uint64_t)v685, v182);
          if (objc_msgSend_timestampCount(v694, v183, v184, v185))
          {
            objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v694, v186, (uint64_t)v682, v187);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_allSiteIdentifiers(v188, v189, v190, v191);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            v754 = 0u;
            v753 = 0u;
            v752 = 0u;
            v751 = 0u;
            v193 = v192;
            v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v751, (uint64_t)v778, 16);
            if (v197)
            {
              v198 = *(_QWORD *)v752;
              do
              {
                for (j = 0; j != v197; ++j)
                {
                  if (*(_QWORD *)v752 != v198)
                    objc_enumerationMutation(v193);
                  v200 = *(_QWORD *)(*((_QWORD *)&v751 + 1) + 8 * j);
                  objc_msgSend_objectForKeyedSubscript_(v150, v195, v200, v196);
                  v203 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v203)
                  {
                    v203 = (void *)objc_opt_new();
                    objc_msgSend_setObject_forKeyedSubscript_(v150, v204, (uint64_t)v203, v200);
                  }
                  objc_msgSend_clockValuesForSiteIdentifier_(v188, v201, v200, v202);
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addIndexes_withObject_(v203, v206, (uint64_t)v205, (uint64_t)v154);

                }
                v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v195, (uint64_t)&v751, (uint64_t)v778, 16);
              }
              while (v197);
            }

          }
          objc_autoreleasePoolPop(context);
          v153 = v678 + 1;
        }
        while ((id)(v678 + 1) != v664);
        v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v658, v207, (uint64_t)&v755, (uint64_t)v779, 16);
      }
      while (v152);
    }

  }
  v644 = (void *)objc_opt_new();
  if (v655)
  {
    v690 = (void *)objc_opt_new();
    v750 = 0u;
    v749 = 0u;
    v748 = 0u;
    v747 = 0u;
    v641 = v668;
    v647 = objc_msgSend_countByEnumeratingWithState_objects_count_(v641, v208, (uint64_t)&v747, (uint64_t)v777, 16);
    if (v647)
    {
      v645 = *(_QWORD *)v748;
      do
      {
        for (k = 0; k != v647; ++k)
        {
          if (*(_QWORD *)v748 != v645)
            objc_enumerationMutation(v641);
          contexta = *(void **)(*((_QWORD *)&v747 + 1) + 8 * k);
          v649 = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_objectForKey_(v669, v209, (uint64_t)contexta, v210);
          v651 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v670, v211, (uint64_t)contexta, v212);
          v665 = (id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v764) = 0;
          objc_msgSend_vectors(contexta, v213, v214, v215);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dependencies(v216, v217, v218, v219);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          v224 = (void *)objc_msgSend_mutableCopy(v220, v221, v222, v223);

          objc_msgSend_allSiteIdentifiers(v665, v225, v226, v227);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          v745 = 0u;
          v746 = 0u;
          v743 = 0u;
          v744 = 0u;
          v656 = v228;
          v662 = objc_msgSend_countByEnumeratingWithState_objects_count_(v656, v229, (uint64_t)&v743, (uint64_t)v776, 16);
          if (v662)
          {
            v659 = *(_QWORD *)v744;
            while (2)
            {
              for (m = 0; m != v662; ++m)
              {
                if (*(_QWORD *)v744 != v659)
                  objc_enumerationMutation(v656);
                v233 = *(_QWORD *)(*((_QWORD *)&v743 + 1) + 8 * m);
                objc_msgSend_removeAllObjects(v690, v230, v231, v232);
                objc_msgSend_objectForKeyedSubscript_(v150, v234, v233, v235);
                v236 = (void *)objc_claimAutoreleasedReturnValue();
                v736[0] = MEMORY[0x1E0C809B0];
                v736[1] = 3221225472;
                v736[2] = sub_18A74FF80;
                v736[3] = &unk_1E1F63DB0;
                v686 = v236;
                v737 = v686;
                v237 = v690;
                v738 = v237;
                v739 = contexta;
                v740 = v699;
                v741 = v701;
                v742 = buf;
                objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v665, v238, v233, (uint64_t)v736);
                if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                {

                  goto LABEL_76;
                }
                v679 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
                v734 = 0u;
                v735 = 0u;
                v732 = 0u;
                v733 = 0u;
                v239 = v237;
                v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v239, v240, (uint64_t)&v732, (uint64_t)v775, 16);
                if (v244)
                {
                  v245 = *(_QWORD *)v733;
                  do
                  {
                    for (n = 0; n != v244; ++n)
                    {
                      if (*(_QWORD *)v733 != v245)
                        objc_enumerationMutation(v239);
                      v247 = *(void **)(*((_QWORD *)&v732 + 1) + 8 * n);
                      objc_msgSend_vectors(v247, v241, v242, v243);
                      v248 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_contents(v248, v249, v250, v251);
                      v252 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_clockVector(v252, v253, v254, v255);
                      v256 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_unionVector_(v224, v257, (uint64_t)v256, v258);

                      objc_msgSend_vectors(v247, v259, v260, v261);
                      v262 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_dependencies(v262, v263, v264, v265);
                      v266 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_unionVector_(v224, v267, (uint64_t)v266, v268);

                    }
                    v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v239, v241, (uint64_t)&v732, (uint64_t)v775, 16);
                  }
                  while (v244);
                }

                if (v679)
                  goto LABEL_76;
              }
              v662 = objc_msgSend_countByEnumeratingWithState_objects_count_(v656, v230, (uint64_t)&v743, (uint64_t)v776, 16);
              if (v662)
                continue;
              break;
            }
          }
LABEL_76:

          if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            v269 = [CKMergeableDeltaMetadata alloc];
            objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v270, v271, v272);
            v687 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUIDString(v687, v273, v274, v275);
            v696 = (void *)objc_claimAutoreleasedReturnValue();
            v276 = [CKMergeableDeltaVectors alloc];
            objc_msgSend_vectors(contexta, v277, v278, v279);
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_previous(v280, v281, v282, v283);
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_vectors(contexta, v285, v286, v287);
            v288 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removals(v288, v289, v290, v291);
            v292 = (void *)objc_claimAutoreleasedReturnValue();
            v294 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v276, v293, (uint64_t)v284, (uint64_t)v651, v292, v224);
            v295 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend_identifier(contexta, v296, v297, v298);
            v299 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setWithObject_(v295, v300, (uint64_t)v299, v301);
            v302 = (void *)objc_claimAutoreleasedReturnValue();
            v304 = (void *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v269, v303, (uint64_t)v696, (uint64_t)v294, v302);

            objc_msgSend_identifier(contexta, v305, v306, v307);
            v308 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v644, v309, (uint64_t)v304, (uint64_t)v308);

          }
          _Block_object_dispose(buf, 8);

          objc_autoreleasePoolPop(v649);
        }
        v647 = objc_msgSend_countByEnumeratingWithState_objects_count_(v641, v310, (uint64_t)&v747, (uint64_t)v777, 16);
      }
      while (v647);
    }

  }
  v663 = (void *)objc_opt_new();
  if ((v636 & 1) != 0)
  {
    v314 = 0;
    v688 = 0;
    contextb = 0;
  }
  else
  {
    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v311, v312, v313);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18A7501F0;
    aBlock[3] = &unk_1E1F63DD8;
    v646 = v315;
    v731 = v646;
    v697 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v728 = 0u;
    v729 = 0u;
    v726 = 0u;
    v727 = 0u;
    contextc = obj;
    v317 = objc_msgSend_countByEnumeratingWithState_objects_count_(contextc, v316, (uint64_t)&v726, (uint64_t)v774, 16);
    if (v317)
    {
      v318 = *(_QWORD *)v727;
      do
      {
        for (ii = 0; ii != v317; ++ii)
        {
          if (*(_QWORD *)v727 != v318)
            objc_enumerationMutation(contextc);
          v697[2](v697, *(_QWORD *)(*((_QWORD *)&v726 + 1) + 8 * ii));
        }
        v317 = objc_msgSend_countByEnumeratingWithState_objects_count_(contextc, v320, (uint64_t)&v726, (uint64_t)v774, 16);
      }
      while (v317);
    }

    v722[0] = MEMORY[0x1E0C809B0];
    v722[1] = 3221225472;
    v722[2] = sub_18A7503E0;
    v722[3] = &unk_1E1F63E00;
    v642 = v646;
    v723 = v642;
    v724 = a2;
    v725 = a1;
    v680 = (uint64_t (**)(void *, void *, _QWORD))_Block_copy(v722);
    objc_msgSend_allObjects(contextc, v321, v322, v323);
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v324, v325, (uint64_t)v680, v326);
    v650 = (void *)objc_claimAutoreleasedReturnValue();

    v327 = [CKMergeableDeltaMetadata alloc];
    v328 = [CKMergeableDeltaVectors alloc];
    v329 = (void *)objc_opt_new();
    v330 = (void *)objc_opt_new();
    v331 = (void *)objc_opt_new();
    v332 = (void *)objc_opt_new();
    v334 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v328, v333, (uint64_t)v329, (uint64_t)v330, v331, v332);
    v337 = (void *)objc_msgSend_initWithVectors_(v327, v335, (uint64_t)v334, v336);

    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v338, (uint64_t)v700, v339);
    v648 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObjectsFromArray_(v648, v340, (uint64_t)v650, v341);
    v720 = 0u;
    v721 = 0u;
    v718 = 0u;
    v719 = 0u;
    v666 = v648;
    v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(v666, v342, (uint64_t)&v718, (uint64_t)v773, 16);
    if (v343)
    {
      v344 = *(_QWORD *)v719;
      do
      {
        v345 = 0;
        v346 = v337;
        do
        {
          if (*(_QWORD *)v719 != v344)
            objc_enumerationMutation(v666);
          v347 = *(void **)(*((_QWORD *)&v718 + 1) + 8 * v345);
          v348 = (void *)MEMORY[0x18D76DE4C]();
          v352 = (void *)objc_msgSend_copy(v346, v349, v350, v351);
          v772[0] = v346;
          v772[1] = v347;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v353, (uint64_t)v772, 2);
          v354 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v355, (uint64_t)v354, v356);
          v337 = (void *)objc_claimAutoreleasedReturnValue();

          isEquivalent = objc_msgSend__isEquivalent_(v337, v357, (uint64_t)v352, v358);
          if (v347 == v700)
            v363 = 0;
          else
            v363 = isEquivalent;
          if (v363 == 1)
          {
            objc_msgSend_identifier(v347, v360, v361, v362);
            v364 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v663, v365, (uint64_t)v364, v366);

          }
          objc_autoreleasePoolPop(v348);
          ++v345;
          v346 = v337;
        }
        while (v343 != v345);
        v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(v666, v367, (uint64_t)&v718, (uint64_t)v773, 16);
      }
      while (v343);
    }

    v368 = (void *)objc_opt_new();
    v714[0] = MEMORY[0x1E0C809B0];
    v714[1] = 3221225472;
    v714[2] = sub_18A75069C;
    v714[3] = &unk_1E1F63E28;
    v369 = v700;
    v715 = v369;
    v652 = v663;
    v716 = v652;
    v657 = v368;
    v717 = v657;
    v654 = (void (**)(void *, void *))_Block_copy(v714);
    v691 = (void *)objc_opt_new();
    v712 = 0u;
    v713 = 0u;
    v710 = 0u;
    v711 = 0u;
    v370 = contextc;
    v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v371, (uint64_t)&v710, (uint64_t)v771, 16);
    if (v375)
    {
      v376 = *(_QWORD *)v711;
      do
      {
        for (jj = 0; jj != v375; ++jj)
        {
          if (*(_QWORD *)v711 != v376)
            objc_enumerationMutation(v370);
          v378 = *(void **)(*((_QWORD *)&v710 + 1) + 8 * jj);
          objc_msgSend_identifier(v378, v372, v373, v374);
          v379 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v691, v380, (uint64_t)v378, (uint64_t)v379);

        }
        v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v372, (uint64_t)&v710, (uint64_t)v771, 16);
      }
      while (v375);
    }

    objc_msgSend_allObjects(v652, v381, v382, v383);
    v384 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsForKeys_(v691, v385, (uint64_t)v384, v386);

    v654[2](v654, v691);
    v390 = objc_msgSend_mutableCopy(v644, v387, v388, v389);

    v692 = (void *)v390;
    objc_msgSend_allObjects(v652, v391, v392, v393);
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsForKeys_(v692, v395, (uint64_t)v394, v396);

    v654[2](v654, v692);
    if (objc_msgSend_count(v657, v397, v398, v399))
    {
      v632 = (void *)objc_msgSend_mutableCopy(v657, v400, v401, v402);
      objc_msgSend_addObject_(v632, v403, (uint64_t)v369, v404);
      objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v405, (uint64_t)v632, v406);
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, void *))v697)[2](v697, v314);
      v708 = 0u;
      v709 = 0u;
      v706 = 0u;
      v707 = 0u;
      contextd = v657;
      v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(contextd, v407, (uint64_t)&v706, (uint64_t)v770, 16);
      if (v408)
      {
        v688 = 0;
        v409 = 0;
        v410 = *(_QWORD *)v707;
        do
        {
          v411 = 0;
          do
          {
            if (*(_QWORD *)v707 != v410)
              objc_enumerationMutation(contextd);
            v412 = *(_QWORD *)(*((_QWORD *)&v706 + 1) + 8 * v411);
            if (v680[2](v680, v314, v412) != -1)
            {
              v414 = ck_log_initialization_block;
              if (ck_log_initialization_predicate != -1)
                dispatch_once(&ck_log_initialization_predicate, v414);

              v415 = (id)ck_log_facility_distributed_sync;
              if (os_log_type_enabled(v415, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v314;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v412;
                _os_log_fault_impl(&dword_18A5C5000, v415, OS_LOG_TYPE_FAULT, "Invariant violation while folding existing deltas into next delta: updated next delta %@ is not strictly greater than existing delta %@", buf, 0x16u);
              }

              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v416, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Invariant violation while folding existing deltas into next delta: updated next delta %@ is not strictly greater than existing delta %@"), v314, v412);
              v417 = objc_claimAutoreleasedReturnValue();

              v409 = 1;
              v688 = (id)v417;
            }
            ++v411;
          }
          while (v408 != v411);
          v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(contextd, v413, (uint64_t)&v706, (uint64_t)v770, 16);
        }
        while (v408);
      }
      else
      {
        v688 = 0;
        v409 = 0;
      }

    }
    else
    {
      v688 = 0;
      v409 = 0;
      v314 = (void *)objc_msgSend_copy(v369, v400, v401, v402);
    }
    objc_msgSend_setReplacedDeltaIdentifiers_(v314, v418, (uint64_t)v652, v419);

    contextb = v409 & 1;
  }
  objc_msgSend_setReplacementDeltaMetadatas_(v683, v311, (uint64_t)v644, v313);
  if (objc_msgSend_count(v663, v426, v427, v428))
  {
    objc_msgSend_setRemovableDeltaMetadatas_(v683, v429, (uint64_t)v663, v431);
    objc_msgSend_setUpdatedNextDeltaMetadata_(v683, v432, (uint64_t)v314, v433);
  }
  objc_msgSend_replacementDeltaMetadatas(v683, v429, v430, v431);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  v667 = v314;
  if (objc_msgSend_count(v434, v435, v436, v437))
  {

  }
  else
  {
    objc_msgSend_removableDeltaMetadatas(v683, v438, v439, v440);
    v444 = (void *)objc_claimAutoreleasedReturnValue();
    v448 = objc_msgSend_count(v444, v445, v446, v447) == 0;

    if (v448)
      goto LABEL_180;
  }
  v449 = (void *)objc_msgSend_mutableCopy(obj, v441, v442, v443);
  v452 = v449;
  if ((v636 & 1) == 0)
    objc_msgSend_addObject_(v449, v450, (uint64_t)v700, v451);
  v698 = (void *)objc_opt_new();
  v704 = 0u;
  v705 = 0u;
  v702 = 0u;
  v703 = 0u;
  v453 = v452;
  v458 = objc_msgSend_countByEnumeratingWithState_objects_count_(v453, v454, (uint64_t)&v702, (uint64_t)v769, 16);
  if (v458)
  {
    v459 = *(_QWORD *)v703;
    do
    {
      for (kk = 0; kk != v458; ++kk)
      {
        if (*(_QWORD *)v703 != v459)
          objc_enumerationMutation(v453);
        v461 = *(void **)(*((_QWORD *)&v702 + 1) + 8 * kk);
        if (v461 == v700)
        {
          objc_msgSend_updatedNextDeltaMetadata(v683, v455, v456, v457);
          v474 = objc_claimAutoreleasedReturnValue();
          v475 = (void *)v474;
          v476 = v700;
          if (v474)
            v476 = (void *)v474;
          v473 = v476;
        }
        else
        {
          objc_msgSend_removableDeltaMetadatas(v683, v455, v456, v457);
          v462 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v461, v463, v464, v465);
          v466 = (void *)objc_claimAutoreleasedReturnValue();
          v469 = objc_msgSend_containsObject_(v462, v467, (uint64_t)v466, v468);

          if ((v469 & 1) != 0)
          {
            v473 = 0;
            goto LABEL_153;
          }
          objc_msgSend_replacementDeltaMetadatas(v683, v470, v471, v472);
          v475 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v461, v477, v478, v479);
          v480 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v475, v481, (uint64_t)v480, v482);
          v483 = objc_claimAutoreleasedReturnValue();
          v484 = (void *)v483;
          if (v483)
            v485 = (void *)v483;
          else
            v485 = v461;
          v473 = v485;

        }
        if (v473)
          objc_msgSend_addObject_(v698, v486, (uint64_t)v473, v487);
LABEL_153:

      }
      v458 = objc_msgSend_countByEnumeratingWithState_objects_count_(v453, v455, (uint64_t)&v702, (uint64_t)v769, 16);
    }
    while (v458);
  }

  objc_msgSend_allObjects(v453, v488, v489, v490);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v492, (uint64_t)v491, v493);
  v693 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allObjects(v698, v494, v495, v496);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v498, (uint64_t)v497, v499);
  v681 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vectors(v693, v500, v501, v502);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v503, v504, v505, v506);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectors(v681, v508, v509, v510);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v511, v512, v513, v514);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v497) = objc_msgSend_isEqual_(v507, v516, (uint64_t)v515, v517);

  objc_msgSend_vectors(v693, v518, v519, v520);
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(v521, v522, v523, v524);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectors(v681, v526, v527, v528);
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(v529, v530, v531, v532);
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v511) = objc_msgSend_isEqual_(v525, v534, (uint64_t)v533, v535);

  v536 = (void *)objc_opt_new();
  objc_msgSend_deliverableDeltaMetadatasInDeltaSet_withMergeableValueCurrentStateVector_deliveryRequirements_(CKMergeableDeltaMetadata, v537, (uint64_t)v698, (uint64_t)v536, v634);
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v538, v539, (uint64_t)v698, v540);

  if ((v497 & v511) != 1 || !v698)
  {
    v541 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v541);

    v542 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v542, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v700;
      _os_log_impl(&dword_18A5C5000, v542, OS_LOG_TYPE_INFO, "Invariant violation debug: next delta is %@", buf, 0xCu);
    }

    v543 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v543);

    v544 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v544, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_updatedNextDeltaMetadata(v683, v545, v546, v547);
      v548 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v548;
      _os_log_impl(&dword_18A5C5000, v544, OS_LOG_TYPE_INFO, "Invariant violation debug: updated next delta is %@", buf, 0xCu);

    }
    v549 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v549);

    v550 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v550, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_replacementDeltaMetadatas(v683, v551, v552, v553);
      v554 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v554;
      _os_log_impl(&dword_18A5C5000, v550, OS_LOG_TYPE_INFO, "Invariant violation debug: replaced deltas are %@", buf, 0xCu);

    }
    v555 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v555);

    v556 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v556, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = obj;
      _os_log_impl(&dword_18A5C5000, v556, OS_LOG_TYPE_INFO, "Invariant violation debug: deliverable server deltas are %@", buf, 0xCu);
    }

    v557 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v557);

    v558 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v558, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_vectors(v693, v559, v560, v561);
      v601 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v601, v602, v603, v604);
      contextf = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectors(v681, v605, v606, v607);
      v608 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v608, v609, v610, v611);
      v612 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectors(v693, v613, v614, v615);
      v616 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removals(v616, v617, v618, v619);
      v620 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectors(v681, v621, v622, v623);
      v624 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removals(v624, v625, v626, v627);
      v628 = objc_claimAutoreleasedReturnValue();
      v629 = (void *)v628;
      v630 = CFSTR("not ");
      if (isEqual)
        v630 = &stru_1E1F66ED0;
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = contextf;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v612;
      *(_WORD *)&buf[22] = 2112;
      v764 = v620;
      v765 = 2112;
      v766 = v628;
      v767 = 2112;
      v768 = v630;
      _os_log_fault_impl(&dword_18A5C5000, v558, OS_LOG_TYPE_FAULT, "Invariant violation while calculating replacement deltas: contents vector %@ vs. %@, removals vector %@ vs. %@, %@deliverable", buf, 0x34u);

    }
    objc_msgSend_vectors(v693, v562, v563, v564);
    v565 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contents(v565, v566, v567, v568);
    contexte = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectors(v681, v569, v570, v571);
    v572 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contents(v572, v573, v574, v575);
    v576 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectors(v693, v577, v578, v579);
    v580 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removals(v580, v581, v582, v583);
    v584 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectors(v681, v585, v586, v587);
    v588 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removals(v588, v589, v590, v591);
    v592 = objc_claimAutoreleasedReturnValue();
    v594 = (void *)v592;
    v595 = CFSTR("not ");
    if (isEqual)
      v595 = &stru_1E1F66ED0;
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v593, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Invariant violation while calculating replacement deltas: contents vector %@ vs. %@, removals vector %@ vs. %@, %@deliverable"), contexte, v576, v584, v592, v595);
    v596 = objc_claimAutoreleasedReturnValue();

    contextb = 1;
    v688 = (id)v596;
  }

LABEL_180:
  objc_autoreleasePoolPop(v635);
  if (contextb)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v688);
    v597 = objc_opt_new();

    v598 = (void *)v597;
  }
  else
  {
    v598 = v683;
  }
  v599 = v598;

  return v599;
}

+ (id)deliverableDeltaMetadatasInDeltaSet:(id)a3 withMergeableValueCurrentStateVector:(id)a4 deliveryRequirements:(unint64_t)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
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
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  char *v139;
  void *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t k;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  const char *v186;
  const char *v187;
  uint64_t v188;
  char *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t m;
  void *v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
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
  const char *v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  char v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t n;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  id v256;
  id v257;
  const char *v258;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  id v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t ii;
  void *v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  const char *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t jj;
  void *v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  BOOL v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  const char *v326;
  id v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t kk;
  void *v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  char hasAtomStateNotInStateVector;
  const char *v345;
  uint64_t v346;
  const char *v347;
  void *v348;
  void *v349;
  id v350;
  uint64_t v351;
  uint64_t v352;
  char *v353;
  char *v354;
  id v355;
  void *context;
  void *contexta;
  char *v358;
  char *v359;
  void *v360;
  void *v361;
  id v362;
  void *v363;
  id obj;
  id obja;
  id objb;
  char *objc;
  id objd;
  void *v369;
  unint64_t v370;
  id v371;
  id v372;
  id v373;
  id v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  _QWORD v392[4];
  id v393;
  id v394;
  id v395;
  uint64_t v396;
  id v397;
  id v398;
  id v399;
  id v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  _BYTE v429[128];
  _BYTE v430[128];
  _BYTE v431[128];
  _BYTE v432[128];
  _BYTE v433[128];
  _BYTE v434[128];
  _BYTE v435[128];
  _BYTE v436[128];
  _BYTE v437[128];
  _BYTE v438[128];
  uint64_t v439;

  v439 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v362 = a4;
  v348 = (void *)MEMORY[0x18D76DE4C]();
  v349 = v7;
  v370 = a5;
  if (a5)
  {
    v369 = (void *)objc_opt_new();
    v377 = (void *)objc_opt_new();
    v376 = (void *)objc_opt_new();
    v363 = (void *)objc_opt_new();
    v427 = 0u;
    v428 = 0u;
    v425 = 0u;
    v426 = 0u;
    v8 = v7;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v425, (uint64_t)v438, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v426;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v426 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v425 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_vectors(v13, v15, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_previous(v18, v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v22, v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v363, v27, (uint64_t)v26, v28);

          objc_msgSend_vectors(v13, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v32, v33, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v363, v41, (uint64_t)v40, v42);

          objc_msgSend_vectors(v13, v43, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removals(v46, v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v50, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v363, v55, (uint64_t)v54, v56);

          objc_msgSend_vectors(v13, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dependencies(v60, v61, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v64, v65, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v363, v69, (uint64_t)v68, v70);

          objc_autoreleasePoolPop(v14);
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v71, (uint64_t)&v425, (uint64_t)v438, 16);
      }
      while (v10);
    }

    objc_msgSend_allSiteIdentifiers(v362, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v363, v76, (uint64_t)v75, v77);

    v361 = (void *)objc_opt_new();
    v375 = (void *)objc_opt_new();
    v379 = (void *)objc_opt_new();
    v378 = (void *)objc_opt_new();
    v423 = 0u;
    v424 = 0u;
    v421 = 0u;
    v422 = 0u;
    obj = v8;
    v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v421, (uint64_t)v437, 16);
    if (v79)
    {
      v80 = *(_QWORD *)v422;
      do
      {
        for (j = 0; j != v79; ++j)
        {
          if (*(_QWORD *)v422 != v80)
            objc_enumerationMutation(obj);
          v82 = *(void **)(*((_QWORD *)&v421 + 1) + 8 * j);
          v83 = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_vectors(v82, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v91, v92, (uint64_t)v363, v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_vectors(v82, v95, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_previous(v98, v99, v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v102, v103, (uint64_t)v363, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_vectors(v82, v106, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dependencies(v109, v110, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v113, v114, (uint64_t)v363, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addAllClockValuesFromVector_(v361, v117, (uint64_t)v94, v118);
          objc_msgSend_identifier(v82, v119, v120, v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v375, v123, (uint64_t)v94, (uint64_t)v122);

          if ((v370 & 1) != 0)
          {
            objc_msgSend_identifier(v82, v124, v125, v126);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v379, v128, (uint64_t)v105, (uint64_t)v127);

          }
          if (v370 >= 2)
          {
            objc_msgSend_identifier(v82, v124, v125, v126);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v378, v130, (uint64_t)v116, (uint64_t)v129);

          }
          objc_autoreleasePoolPop(v83);
        }
        v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v131, (uint64_t)&v421, (uint64_t)v437, 16);
      }
      while (v79);
    }

    objc_msgSend_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_(v362, v132, (uint64_t)v363, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAllClockValuesFromVector_(v361, v135, (uint64_t)v134, v136);

    v419 = 0u;
    v420 = 0u;
    v417 = 0u;
    v418 = 0u;
    v355 = obj;
    v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v355, v137, (uint64_t)&v417, (uint64_t)v436, 16);
    if (v138)
    {
      v351 = *(_QWORD *)v418;
      do
      {
        v139 = 0;
        v353 = (char *)v138;
        do
        {
          if (*(_QWORD *)v418 != v351)
            objc_enumerationMutation(v355);
          v358 = v139;
          v140 = *(void **)(*((_QWORD *)&v417 + 1) + 8 * (_QWORD)v139);
          context = (void *)MEMORY[0x18D76DE4C]();
          v415 = 0u;
          v416 = 0u;
          v413 = 0u;
          v414 = 0u;
          obja = v363;
          v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v141, (uint64_t)&v413, (uint64_t)v435, 16);
          if (v144)
          {
            v371 = *(id *)v414;
            do
            {
              for (k = 0; k != v144; ++k)
              {
                if (*(id *)v414 != v371)
                  objc_enumerationMutation(obja);
                v146 = *(_QWORD *)(*((_QWORD *)&v413 + 1) + 8 * k);
                objc_msgSend_objectForKeyedSubscript_(v377, v142, v146, v143);
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v149)
                {
                  v149 = (void *)objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v377, v150, (uint64_t)v149, v146);
                }
                objc_msgSend_objectForKeyedSubscript_(v376, v147, v146, v148);
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v154)
                {
                  v154 = (void *)objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v376, v155, (uint64_t)v154, v146);
                }
                objc_msgSend_identifier(v140, v151, v152, v153);
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v375, v157, (uint64_t)v156, v158);
                v159 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_identifier(v140, v160, v161, v162);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v379, v164, (uint64_t)v163, v165);
                v166 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_identifier(v140, v167, v168, v169);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v378, v171, (uint64_t)v170, v172);
                v173 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_clockValuesForSiteIdentifier_(v159, v174, v146, v175);
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addIndexes_withObject_(v149, v177, (uint64_t)v176, (uint64_t)v140);

                objc_msgSend_clockValuesForSiteIdentifier_(v166, v178, v146, v179);
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addIndexes_withObject_(v154, v181, (uint64_t)v180, (uint64_t)v140);

                objc_msgSend_clockValuesForSiteIdentifier_(v173, v182, v146, v183);
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addIndexes_withObject_(v154, v185, (uint64_t)v184, (uint64_t)v140);

              }
              v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v142, (uint64_t)&v413, (uint64_t)v435, 16);
            }
            while (v144);
          }

          objc_autoreleasePoolPop(context);
          v139 = v358 + 1;
        }
        while (v358 + 1 != v353);
        v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v355, v186, (uint64_t)&v417, (uint64_t)v436, 16);
      }
      while (v138);
    }

    v411 = 0u;
    v412 = 0u;
    v409 = 0u;
    v410 = 0u;
    v350 = v363;
    v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v350, v187, (uint64_t)&v409, (uint64_t)v434, 16);
    if (v188)
    {
      v352 = *(_QWORD *)v410;
      do
      {
        v189 = 0;
        v354 = (char *)v188;
        do
        {
          if (*(_QWORD *)v410 != v352)
            objc_enumerationMutation(v350);
          v359 = v189;
          v190 = *(_QWORD *)(*((_QWORD *)&v409 + 1) + 8 * (_QWORD)v189);
          contexta = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_clockValuesForSiteIdentifier_(v361, v191, v190, v192);
          v372 = (id)objc_claimAutoreleasedReturnValue();
          v407 = 0u;
          v408 = 0u;
          v405 = 0u;
          v406 = 0u;
          objb = v355;
          v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v193, (uint64_t)&v405, (uint64_t)v433, 16);
          if (v197)
          {
            v198 = *(_QWORD *)v406;
            do
            {
              for (m = 0; m != v197; ++m)
              {
                if (*(_QWORD *)v406 != v198)
                  objc_enumerationMutation(objb);
                v200 = *(void **)(*((_QWORD *)&v405 + 1) + 8 * m);
                objc_msgSend_identifier(v200, v194, v195, v196);
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v379, v202, (uint64_t)v201, v203);
                v204 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_identifier(v200, v205, v206, v207);
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v378, v209, (uint64_t)v208, v210);
                v211 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_clockValuesForSiteIdentifier_(v204, v212, v190, v213);
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_containsIndexes_(v372, v215, (uint64_t)v214, v216) & 1) == 0)
                {

LABEL_52:
                  objc_msgSend_addObject_(v369, v223, (uint64_t)v200, v224);
                  goto LABEL_53;
                }
                objc_msgSend_clockValuesForSiteIdentifier_(v211, v217, v190, v218);
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                v222 = objc_msgSend_containsIndexes_(v372, v220, (uint64_t)v219, v221);

                if ((v222 & 1) == 0)
                  goto LABEL_52;
LABEL_53:

              }
              v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v194, (uint64_t)&v405, (uint64_t)v433, 16);
            }
            while (v197);
          }

          objc_autoreleasePoolPop(contexta);
          v189 = v359 + 1;
        }
        while (v359 + 1 != v354);
        v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v350, v225, (uint64_t)&v409, (uint64_t)v434, 16);
      }
      while (v188);
    }

    for (objc = 0; (unint64_t)objc < objc_msgSend_count(v369, v226, v227, v228); ++objc)
    {
      v360 = (void *)MEMORY[0x18D76DE4C]();
      objc_msgSend_objectAtIndexedSubscript_(v369, v232, (uint64_t)objc, v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      v403 = 0u;
      v404 = 0u;
      v401 = 0u;
      v402 = 0u;
      v373 = v350;
      v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v235, (uint64_t)&v401, (uint64_t)v432, 16);
      if (v238)
      {
        v239 = *(_QWORD *)v402;
        do
        {
          for (n = 0; n != v238; ++n)
          {
            if (*(_QWORD *)v402 != v239)
              objc_enumerationMutation(v373);
            v241 = *(_QWORD *)(*((_QWORD *)&v401 + 1) + 8 * n);
            objc_msgSend_objectForKeyedSubscript_(v377, v236, v241, v237);
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v376, v243, v241, v244);
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v234, v246, v247, v248);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v375, v250, (uint64_t)v249, v251);
            v252 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_clockValuesForSiteIdentifier_(v252, v253, v241, v254);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            v392[0] = MEMORY[0x1E0C809B0];
            v392[1] = 3221225472;
            v392[2] = sub_18A751D40;
            v392[3] = &unk_1E1F63E78;
            v393 = v369;
            v394 = v378;
            v395 = v379;
            v396 = v241;
            v397 = v362;
            v256 = v255;
            v398 = v256;
            v257 = v242;
            v399 = v257;
            v400 = v375;
            objc_msgSend_enumerateObjectsForIndexes_usingBlock_(v245, v258, (uint64_t)v256, (uint64_t)v392);

          }
          v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v236, (uint64_t)&v401, (uint64_t)v432, 16);
        }
        while (v238);
      }

      objc_autoreleasePoolPop(v360);
    }
    objd = (id)objc_msgSend_mutableCopy(v355, v229, v230, v231);
    objc_msgSend_set(v369, v260, v261, v262);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(objd, v264, (uint64_t)v263, v265);

    v269 = (void *)objc_msgSend_mutableCopy(v362, v266, v267, v268);
    v390 = 0u;
    v391 = 0u;
    v388 = 0u;
    v389 = 0u;
    v270 = objd;
    v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v271, (uint64_t)&v388, (uint64_t)v431, 16);
    if (v272)
    {
      v273 = *(_QWORD *)v389;
      do
      {
        for (ii = 0; ii != v272; ++ii)
        {
          if (*(_QWORD *)v389 != v273)
            objc_enumerationMutation(v270);
          v275 = *(void **)(*((_QWORD *)&v388 + 1) + 8 * ii);
          v276 = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_vectors(v275, v277, v278, v279);
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v280, v281, v282, v283);
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionStateVector_(v269, v285, (uint64_t)v284, v286);

          objc_autoreleasePoolPop(v276);
        }
        v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v287, (uint64_t)&v388, (uint64_t)v431, 16);
      }
      while (v272);
    }

    v386 = 0u;
    v387 = 0u;
    v384 = 0u;
    v385 = 0u;
    v374 = v270;
    v289 = objc_msgSend_countByEnumeratingWithState_objects_count_(v374, v288, (uint64_t)&v384, (uint64_t)v430, 16);
    if (v289)
    {
      v290 = *(_QWORD *)v385;
      do
      {
        for (jj = 0; jj != v289; ++jj)
        {
          if (*(_QWORD *)v385 != v290)
            objc_enumerationMutation(v374);
          v292 = *(void **)(*((_QWORD *)&v384 + 1) + 8 * jj);
          v293 = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_vectors(v292, v294, v295, v296);
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removals(v297, v298, v299, v300);
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          v305 = objc_msgSend_timestampCount(v301, v302, v303, v304) == 0;

          if (!v305)
          {
            objc_msgSend_vectors(v292, v306, v307, v308);
            v309 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removals(v309, v310, v311, v312);
            v313 = (void *)objc_claimAutoreleasedReturnValue();
            v317 = (void *)objc_msgSend_mutableCopy(v313, v314, v315, v316);

            objc_msgSend_clockVector(v269, v318, v319, v320);
            v321 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_intersectVector_(v317, v322, (uint64_t)v321, v323);

            objc_msgSend_unionStateVector_(v269, v324, (uint64_t)v317, v325);
          }
          objc_autoreleasePoolPop(v293);
        }
        v289 = objc_msgSend_countByEnumeratingWithState_objects_count_(v374, v326, (uint64_t)&v384, (uint64_t)v430, 16);
      }
      while (v289);
    }

    v382 = 0u;
    v383 = 0u;
    v380 = 0u;
    v381 = 0u;
    v327 = v369;
    v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(v327, v328, (uint64_t)&v380, (uint64_t)v429, 16);
    if (v329)
    {
      v330 = *(_QWORD *)v381;
      do
      {
        for (kk = 0; kk != v329; ++kk)
        {
          if (*(_QWORD *)v381 != v330)
            objc_enumerationMutation(v327);
          v332 = *(void **)(*((_QWORD *)&v380 + 1) + 8 * kk);
          v333 = (void *)MEMORY[0x18D76DE4C]();
          objc_msgSend_vectors(v332, v334, v335, v336);
          v337 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v337, v338, v339, v340);
          v341 = (void *)objc_claimAutoreleasedReturnValue();
          hasAtomStateNotInStateVector = objc_msgSend_hasAtomStateNotInStateVector_(v341, v342, (uint64_t)v269, v343);

          if ((hasAtomStateNotInStateVector & 1) == 0)
            objc_msgSend_addObject_(v374, v345, (uint64_t)v332, v346);
          objc_autoreleasePoolPop(v333);
        }
        v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(v327, v347, (uint64_t)&v380, (uint64_t)v429, 16);
      }
      while (v329);
    }

  }
  else
  {
    v374 = v7;
  }
  objc_autoreleasePoolPop(v348);

  return v374;
}

- (CKMergeableDeltaMetadata)initWithVectors:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  CKMergeableDeltaMetadata *v15;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend_UUID(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CKMergeableDeltaMetadata *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(self, v14, (uint64_t)v13, (uint64_t)v5, 0);

  return v15;
}

- (CKMergeableDeltaMetadata)initWithIdentifier:(id)a3 vectors:(id)a4 replacedDeltaIdentifiers:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKMergeableDeltaMetadata *v17;
  uint64_t v18;
  NSString *identifier;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CKMergeableDeltaVectors *vectors;
  const char *v25;
  uint64_t v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  if (!v8 || !objc_msgSend_length(v8, v10, v11, v12))
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Identifier must not be nil or empty"));
  v28.receiver = self;
  v28.super_class = (Class)CKMergeableDeltaMetadata;
  v17 = -[CKMergeableDeltaMetadata init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend_copy(v8, v14, v15, v16);
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v23 = objc_msgSend_copy(v9, v20, v21, v22);
    vectors = v17->_vectors;
    v17->_vectors = (CKMergeableDeltaVectors *)v23;

    objc_msgSend_setReplacedDeltaIdentifiers_(v17, v25, (uint64_t)v13, v26);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKMergeableDeltaMetadata *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v4 = [CKMergeableDeltaMetadata alloc];
  objc_msgSend_identifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectors(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replacedDeltaIdentifiers(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

+ (id)mergeableDeltaMetadataByCombiningMetadatas:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  CKMergeableDeltaMetadata *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_CKMap_(a3, a2, (uint64_t)&unk_1E1F58938, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeableDeltaMetadataVectorsByCombiningVectors_(CKMergeableDeltaVectors, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CKMergeableDeltaMetadata alloc];
  v11 = (void *)objc_msgSend_initWithVectors_(v8, v9, (uint64_t)v7, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableDeltaMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  CKDPDistributedTimestamps *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  CKMergeableDeltaMetadata *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  CKMergeableDeltaVectors *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  id v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v9, v12, v10, v13, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_replacedDeltaIdentifiers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("timestampsProtobuf"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v34 = objc_opt_class();
    NSStringFromSelector(sel_previousVector);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v34, (uint64_t)v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_opt_class();
    NSStringFromSelector(sel_contentsVector);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v37, (uint64_t)v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_opt_class();
    NSStringFromSelector(sel_removalsVector);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v40, (uint64_t)v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_opt_class();
    NSStringFromSelector(sel_dependenciesVector);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v44, (uint64_t)v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = [CKMergeableDeltaVectors alloc];
    v50 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v48, v49, (uint64_t)v24, (uint64_t)v26, v43, v47);
    v52 = (void *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(self, v51, (uint64_t)v8, (uint64_t)v50, v17);

LABEL_10:
    self = v52;
    v33 = self;
    goto LABEL_11;
  }
  v21 = [CKDPDistributedTimestamps alloc];
  v24 = (void *)objc_msgSend_initWithData_(v21, v22, (uint64_t)v20, v23);
  v54 = 0;
  objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(CKMergeableDeltaVectors, v25, (uint64_t)v24, (uint64_t)&v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v54;
  if (!v27)
  {
    v52 = (void *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(self, v28, (uint64_t)v8, (uint64_t)v26, v17);
    goto LABEL_10;
  }
  v29 = v27;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v30 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v29;
    _os_log_error_impl(&dword_18A5C5000, v30, OS_LOG_TYPE_ERROR, "Error initializing mergeable delta metadata from data in coder: %@", buf, 0xCu);
  }
  objc_msgSend_failWithError_(v4, v31, (uint64_t)v29, v32);

  v33 = 0;
LABEL_11:

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;

  v4 = a3;
  objc_msgSend_vectors(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pDistributedTimestampsFromDeltaMetadataVectors_(CKMergeableDeltaVectors, v9, (uint64_t)v8, v10);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identifier(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_replacedDeltaIdentifiers(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_replacedDeltaIdentifiers);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  objc_msgSend_data(v28, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, (uint64_t)CFSTR("timestampsProtobuf"));

}

- (BOOL)isEqual:(id)a3
{
  const char *v4;
  uint64_t v5;
  CKMergeableDeltaMetadata *v6;
  CKMergeableDeltaMetadata *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;

  v6 = (CKMergeableDeltaMetadata *)a3;
  if (v6 == self)
  {
    v16 = 1;
  }
  else if (objc_msgSend__isEquivalent_(self, v4, (uint64_t)v6, v5)
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    objc_msgSend_identifier(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v7, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = CKObjectsAreBothNilOrEqual(v11, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_isEquivalent:(id)a3
{
  CKMergeableDeltaMetadata *v4;
  CKMergeableDeltaMetadata *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;

  v4 = (CKMergeableDeltaMetadata *)a3;
  if (v4 == self)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_vectors(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectors(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v9, v13))
      {
        objc_msgSend_replacedDeltaIdentifiers(self, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replacedDeltaIdentifiers(v5, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CKObjectsAreBothNilOrEqual(v17, v21);

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_identifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_vectors(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_replacedDeltaIdentifiers(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (CKMergeableDeltaVectors)vectors
{
  CKMergeableDeltaMetadata *v2;
  CKMergeableDeltaVectors *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_vectors;
  objc_sync_exit(v2);

  return v3;
}

- (void)setVectors:(id)a3
{
  CKMergeableDeltaMetadata *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKMergeableDeltaVectors *vectors;
  CKMergeableDeltaVectors *v10;

  v10 = (CKMergeableDeltaVectors *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_vectors != v10)
  {
    v8 = objc_msgSend_copy(v10, v5, v6, v7);
    vectors = v4->_vectors;
    v4->_vectors = (CKMergeableDeltaVectors *)v8;

  }
  objc_sync_exit(v4);

}

- (NSSet)replacedDeltaIdentifiers
{
  CKMergeableDeltaMetadata *v2;
  NSSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_replacedDeltaIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)setReplacedDeltaIdentifiers:(id)a3
{
  CKMergeableDeltaMetadata *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *replacedDeltaIdentifiers;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  replacedDeltaIdentifiers = v4->_replacedDeltaIdentifiers;
  v4->_replacedDeltaIdentifiers = (NSSet *)v8;

  objc_sync_exit(v4);
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_appendString_(v7, v8, (uint64_t)CFSTR("{\n"), v9);
  objc_msgSend_identifier(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v14, (uint64_t)CFSTR("  Identifier: %@\n"), v15, v13);

  objc_msgSend_vectors(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v19, v20, v5, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKIndentedString_skippingFirstLine_(v21, v22, 2, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v24, (uint64_t)CFSTR("  Vectors: %@\n"), v25, v23);

  objc_msgSend_replacedDeltaIdentifiers(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v29, v30, v31, v32))
  {
    objc_msgSend_description(v29, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKIndentedString_skippingFirstLine_(v36, v37, 2, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v39, (uint64_t)CFSTR("  ReplacedDeltas: %@\n"), v40, v38);

  }
  objc_msgSend_appendString_(v7, v33, (uint64_t)CFSTR("}"), v35);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 0, 0);
}

- (id)debugDescription
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 1, 1);
}

- (unint64_t)size
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_identifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  v10 = v9 + 2;
  if (v9 >= 0x80)
  {
    do
    {
      ++v10;
      v11 = v9 >> 14;
      v9 >>= 7;
    }
    while (v11);
  }

  objc_msgSend_vectors(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_protobufSize(v15, v16, v17, v18);
  v20 = v19 + 2;
  if (v19 >= 0x80)
  {
    do
    {
      ++v20;
      v21 = v19 >> 14;
      v19 >>= 7;
    }
    while (v21);
  }

  v22 = v10 + v20 + 122;
  objc_msgSend_replacedDeltaIdentifiers(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v28)
  {
    v32 = v28;
    v33 = *(_QWORD *)v40;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v26);
        v35 = objc_msgSend_length(*(void **)(*((_QWORD *)&v39 + 1) + 8 * v34), v29, v30, v31);
        v36 = v35 + 2;
        if (v35 >= 0x80)
        {
          do
          {
            ++v36;
            v37 = v35 >> 14;
            v35 >>= 7;
          }
          while (v37);
        }
        v22 += v36;
        ++v34;
      }
      while (v34 != v32);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v32);
  }

  return v22;
}

- (CKDistributedTimestampClockVector)previousVector
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_vectors(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_previous(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDistributedTimestampClockVector *)v8;
}

- (CKDistributedTimestampStateVector)contentsVector
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_vectors(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDistributedTimestampStateVector *)v8;
}

- (CKDistributedTimestampStateVector)removalsVector
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_vectors(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDistributedTimestampStateVector *)v8;
}

- (CKDistributedTimestampClockVector)dependenciesVector
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_vectors(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dependencies(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDistributedTimestampClockVector *)v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_replacedDeltaIdentifiers, 0);
  objc_storeStrong((id *)&self->_vectors, 0);
}

@end
