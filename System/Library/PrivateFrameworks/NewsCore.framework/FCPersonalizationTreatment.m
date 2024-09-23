@implementation FCPersonalizationTreatment

- (unint64_t)scoringVersion
{
  return self->_scoringVersion;
}

- (FCPersonalizationScoringConfig)defaultScoringConfig
{
  return self->_defaultScoringConfig;
}

- (double)baselineImpressionPrior
{
  return self->_baselineImpressionPrior;
}

- (FCPersonalizationTreatment)initWithPersonalizationTreatmentDictionary:(id)a3
{
  id v5;
  FCPersonalizationTreatment *v6;
  FCPersonalizationTreatment *v7;
  _OWORD *v8;
  NTPBPersonalizationTreatment *pbTreatment;
  FCPersonalizationScoringConfig *v10;
  void *v11;
  uint64_t v12;
  FCPersonalizationScoringConfig *defaultScoringConfig;
  FCPersonalizationScoringConfig *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  FCPersonalizationScoringConfig *topicFeedScoringConfig;
  FCPersonalizationScoringConfig *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  FCPersonalizationScoringConfig *magazineFeedArticleScoringConfig;
  FCPersonalizationScoringConfig *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  FCPersonalizationScoringConfig *magazineFeedIssueScoringConfig;
  FCPersonalizationScoringConfig *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  FCPersonalizationScoringConfig *legacyAudioFeedScoringConfig;
  FCPersonalizationScoringConfig *v34;
  void *v35;
  uint64_t v36;
  FCPersonalizationScoringConfig *audioFeedScoringConfig;
  FCPersonalizationScoringConfig *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  FCPersonalizationScoringConfig *articleRecirculationPrimaryScoringConfig;
  FCPersonalizationScoringConfig *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  FCPersonalizationScoringConfig *articleRecirculationSecondaryScoringConfig;
  FCPersonalizationScoringConfig *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  FCPersonalizationScoringConfig *articleRecirculationTertiaryScoringConfig;
  FCPersonalizationScoringConfig *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  FCPersonalizationScoringConfig *articleRecirculationQuaternaryScoringConfig;
  FCPersonalizationScoringConfig *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  FCPersonalizationScoringConfig *bestOfBundleScoringConfig;
  FCPersonalizationScoringConfig *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  FCPersonalizationScoringConfig *curatedScoringConfig;
  FCPersonalizationScoringConfig *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  FCPersonalizationScoringConfig *curatedIssuesScoringConfig;
  FCPersonalizationScoringConfig *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  FCPersonalizationScoringConfig *forYouScoringConfig;
  FCPersonalizationScoringConfig *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  FCPersonalizationScoringConfig *greatStoriesYouMissedScoringConfig;
  FCPersonalizationScoringConfig *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  FCPersonalizationScoringConfig *latestStoriesScoringConfig;
  FCPersonalizationScoringConfig *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  FCPersonalizationScoringConfig *localNewsScoringConfig;
  FCPersonalizationScoringConfig *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  FCPersonalizationScoringConfig *newspaperMagazineFeedScoringConfig;
  FCPersonalizationScoringConfig *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  FCPersonalizationScoringConfig *todayWidgetScoringConfig;
  FCPersonalizationScoringConfig *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  FCPersonalizationScoringConfig *tagWidgetScoringConfig;
  FCPersonalizationScoringConfig *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  FCPersonalizationScoringConfig *notificationScoringConfig;
  FCPersonalizationScoringConfig *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  FCPersonalizationScoringConfig *mySportsGroupScoringConfig;
  FCPersonalizationScoringConfig *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  FCPersonalizationScoringConfig *mySportsGroupForYouScoringConfig;
  FCPersonalizationScoringConfig *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  FCPersonalizationScoringConfig *mySportsTopicsScoringConfig;
  FCPersonalizationScoringConfig *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  FCPersonalizationScoringConfig *sportsTopStoriesScoringConfig;
  FCPersonalizationScoringConfig *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  FCPersonalizationScoringConfig *introToSportsGroupScoringConfig;
  FCPersonalizationScoringConfig *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  FCPersonalizationScoringConfig *introToSportsGroupForYouScoringConfig;
  FCPersonalizationScoringConfig *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  FCPersonalizationScoringConfig *highlightsGroupScoringConfig;
  FCPersonalizationScoringConfig *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  FCPersonalizationScoringConfig *articleListTagFeedGroupScoringConfig;
  FCPersonalizationScoringConfig *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  FCPersonalizationScoringConfig *tagFeedScoringConfig;
  FCPersonalizationScoringConfig *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  FCPersonalizationScoringConfig *newspaperTodayFeedScoringConfig;
  FCPersonalizationScoringConfig *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  FCPersonalizationScoringConfig *moreForYouScoringConfig;
  FCPersonalizationScoringConfig *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  FCPersonalizationScoringConfig *localSectionGroupScoringConfig;
  FCPersonalizationScoringConfig *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  FCPersonalizationScoringConfig *newspaperSectionGroupScoringConfig;
  FCPersonalizationScoringConfig *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  FCPersonalizationScoringConfig *sportsEventArticlesGroupScoringConfig;
  FCPersonalizationScoringConfig *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  FCPersonalizationScoringConfig *tagForYouGroupScoringConfig;
  FCPersonalizationScoringConfig *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  FCPersonalizationScoringConfig *tagRecentStoriesScoringConfig;
  FCPersonalizationScoringConfig *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  FCPersonalizationScoringConfig *tagDateRangeScoringConfig;
  FCPersonalizationScoringConfig *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  FCPersonalizationScoringConfig *sportsEventTopicGroupScoringConfig;
  FCPersonalizationScoringConfig *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  FCPersonalizationScoringConfig *affinityGroupScoringConfig;
  FCPersonalizationTopicsConfig *v208;
  void *v209;
  uint64_t v210;
  FCPersonalizationTopicsConfig *defaultTopicsConfig;
  FCPersonalizationTopicsConfig *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  FCPersonalizationTopicsConfig *topicFeedTopicsConfig;
  FCPersonalizationTopicsConfig *v217;
  void *v218;
  void *v219;
  uint64_t v220;
  FCPersonalizationTopicsConfig *magazineFeedArticleTopicsConfig;
  FCPersonalizationTopicsConfig *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  FCPersonalizationTopicsConfig *magazineFeedIssueTopicsConfig;
  FCPersonalizationTopicsConfig *v227;
  void *v228;
  void *v229;
  uint64_t v230;
  FCPersonalizationTopicsConfig *legacyAudioFeedTopicsConfig;
  FCPersonalizationTopicsConfig *v232;
  void *v233;
  uint64_t v234;
  FCPersonalizationTopicsConfig *audioFeedTopicsConfig;
  FCPersonalizationTopicsConfig *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  FCPersonalizationTopicsConfig *articleRecirculationPrimaryTopicsConfig;
  FCPersonalizationTopicsConfig *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  FCPersonalizationTopicsConfig *articleRecirculationSecondaryTopicsConfig;
  FCPersonalizationTopicsConfig *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  FCPersonalizationTopicsConfig *articleRecirculationTertiaryTopicsConfig;
  FCPersonalizationTopicsConfig *v251;
  void *v252;
  void *v253;
  uint64_t v254;
  FCPersonalizationTopicsConfig *articleRecirculationQuaternaryTopicsConfig;
  FCPersonalizationTopicsConfig *v256;
  void *v257;
  void *v258;
  uint64_t v259;
  FCPersonalizationTopicsConfig *bestOfBundleTopicsConfig;
  FCPersonalizationTopicsConfig *v261;
  void *v262;
  void *v263;
  uint64_t v264;
  FCPersonalizationTopicsConfig *curatedTopicsConfig;
  FCPersonalizationTopicsConfig *v266;
  void *v267;
  void *v268;
  uint64_t v269;
  FCPersonalizationTopicsConfig *curatedIssuesTopicsConfig;
  FCPersonalizationTopicsConfig *v271;
  void *v272;
  void *v273;
  uint64_t v274;
  FCPersonalizationTopicsConfig *forYouTopicsConfig;
  FCPersonalizationTopicsConfig *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  FCPersonalizationTopicsConfig *greatStoriesYouMissedTopicsConfig;
  FCPersonalizationTopicsConfig *v281;
  void *v282;
  void *v283;
  uint64_t v284;
  FCPersonalizationTopicsConfig *latestStoriesTopicsConfig;
  FCPersonalizationTopicsConfig *v286;
  void *v287;
  void *v288;
  uint64_t v289;
  FCPersonalizationTopicsConfig *localNewsTopicsConfig;
  FCPersonalizationTopicsConfig *v291;
  void *v292;
  void *v293;
  uint64_t v294;
  FCPersonalizationTopicsConfig *newspaperMagazineFeedTopicsConfig;
  FCPersonalizationTopicsConfig *v296;
  void *v297;
  void *v298;
  uint64_t v299;
  FCPersonalizationTopicsConfig *todayWidgetTopicsConfig;
  FCPersonalizationTopicsConfig *v301;
  void *v302;
  void *v303;
  uint64_t v304;
  FCPersonalizationTopicsConfig *tagWidgetTopicsConfig;
  FCPersonalizationTopicsConfig *v306;
  void *v307;
  void *v308;
  uint64_t v309;
  FCPersonalizationTopicsConfig *mySportsGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v311;
  void *v312;
  void *v313;
  uint64_t v314;
  FCPersonalizationTopicsConfig *mySportsGroupForYouTopicsConfig;
  FCPersonalizationTopicsConfig *v316;
  void *v317;
  void *v318;
  uint64_t v319;
  FCPersonalizationTopicsConfig *mySportsTopicsTopicsConfig;
  FCPersonalizationTopicsConfig *v321;
  void *v322;
  void *v323;
  uint64_t v324;
  FCPersonalizationTopicsConfig *sportsTopStoriesTopicsConfig;
  FCPersonalizationTopicsConfig *v326;
  void *v327;
  void *v328;
  uint64_t v329;
  FCPersonalizationTopicsConfig *introToSportsGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v331;
  void *v332;
  void *v333;
  uint64_t v334;
  FCPersonalizationTopicsConfig *introToSportsGroupForYouTopicsConfig;
  FCPersonalizationTopicsConfig *v336;
  void *v337;
  void *v338;
  uint64_t v339;
  FCPersonalizationTopicsConfig *highlightsGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v341;
  void *v342;
  void *v343;
  uint64_t v344;
  FCPersonalizationTopicsConfig *articleListTagFeedGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v346;
  void *v347;
  void *v348;
  uint64_t v349;
  FCPersonalizationTopicsConfig *tagFeedTopicsConfig;
  FCPersonalizationTopicsConfig *v351;
  void *v352;
  void *v353;
  uint64_t v354;
  FCPersonalizationTopicsConfig *newspaperTodayFeedTopicsConfig;
  FCPersonalizationTopicsConfig *v356;
  void *v357;
  void *v358;
  uint64_t v359;
  FCPersonalizationTopicsConfig *moreForYouTopicsConfig;
  FCPersonalizationTopicsConfig *v361;
  void *v362;
  void *v363;
  uint64_t v364;
  FCPersonalizationTopicsConfig *localSectionGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v366;
  void *v367;
  void *v368;
  uint64_t v369;
  FCPersonalizationTopicsConfig *newspaperSectionGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v371;
  void *v372;
  void *v373;
  uint64_t v374;
  FCPersonalizationTopicsConfig *sportsEventArticlesGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v376;
  void *v377;
  void *v378;
  uint64_t v379;
  FCPersonalizationTopicsConfig *tagForYouGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v381;
  void *v382;
  void *v383;
  uint64_t v384;
  FCPersonalizationTopicsConfig *tagRecentStoriesTopicsConfig;
  FCPersonalizationTopicsConfig *v386;
  void *v387;
  void *v388;
  uint64_t v389;
  FCPersonalizationTopicsConfig *tagDateRangeTopicsConfig;
  FCPersonalizationTopicsConfig *v391;
  void *v392;
  void *v393;
  uint64_t v394;
  FCPersonalizationTopicsConfig *sportsEventTopicGroupTopicsConfig;
  FCPersonalizationTopicsConfig *v396;
  void *v397;
  void *v398;
  uint64_t v399;
  FCPersonalizationTopicsConfig *affinityGroupTopicsConfig;
  FCPersonalizationOntologyLevelConfig *v401;
  void *v402;
  uint64_t v403;
  FCPersonalizationOntologyLevelConfig *defaultOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v405;
  void *v406;
  void *v407;
  uint64_t v408;
  FCPersonalizationOntologyLevelConfig *topicFeedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v410;
  void *v411;
  void *v412;
  uint64_t v413;
  FCPersonalizationOntologyLevelConfig *magazineFeedArticleOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v415;
  void *v416;
  void *v417;
  uint64_t v418;
  FCPersonalizationOntologyLevelConfig *magazineFeedIssueOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v420;
  void *v421;
  void *v422;
  uint64_t v423;
  FCPersonalizationOntologyLevelConfig *legacyAudioFeedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v425;
  void *v426;
  uint64_t v427;
  FCPersonalizationOntologyLevelConfig *audioFeedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v429;
  void *v430;
  void *v431;
  uint64_t v432;
  FCPersonalizationOntologyLevelConfig *articleRecirculationPrimaryOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v434;
  void *v435;
  void *v436;
  uint64_t v437;
  FCPersonalizationOntologyLevelConfig *articleRecirculationSecondaryOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v439;
  void *v440;
  void *v441;
  uint64_t v442;
  FCPersonalizationOntologyLevelConfig *articleRecirculationTertiaryOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v444;
  void *v445;
  void *v446;
  uint64_t v447;
  FCPersonalizationOntologyLevelConfig *articleRecirculationQuaternaryOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v449;
  void *v450;
  void *v451;
  uint64_t v452;
  FCPersonalizationOntologyLevelConfig *bestOfBundleOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v454;
  void *v455;
  void *v456;
  uint64_t v457;
  FCPersonalizationOntologyLevelConfig *curatedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v459;
  void *v460;
  void *v461;
  uint64_t v462;
  FCPersonalizationOntologyLevelConfig *curatedIssuesOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v464;
  void *v465;
  void *v466;
  uint64_t v467;
  FCPersonalizationOntologyLevelConfig *forYouOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v469;
  void *v470;
  void *v471;
  uint64_t v472;
  FCPersonalizationOntologyLevelConfig *greatStoriesYouMissedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v474;
  void *v475;
  void *v476;
  uint64_t v477;
  FCPersonalizationOntologyLevelConfig *latestStoriesOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v479;
  void *v480;
  void *v481;
  uint64_t v482;
  FCPersonalizationOntologyLevelConfig *localNewsOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v484;
  void *v485;
  void *v486;
  uint64_t v487;
  FCPersonalizationOntologyLevelConfig *newspaperMagazineFeedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v489;
  void *v490;
  void *v491;
  uint64_t v492;
  FCPersonalizationOntologyLevelConfig *todayWidgetOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v494;
  void *v495;
  void *v496;
  uint64_t v497;
  FCPersonalizationOntologyLevelConfig *tagWidgetOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v499;
  void *v500;
  void *v501;
  uint64_t v502;
  FCPersonalizationOntologyLevelConfig *mySportsGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v504;
  void *v505;
  void *v506;
  uint64_t v507;
  FCPersonalizationOntologyLevelConfig *mySportsGroupForYouOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v509;
  void *v510;
  void *v511;
  uint64_t v512;
  FCPersonalizationOntologyLevelConfig *mySportsTopicsOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v514;
  void *v515;
  void *v516;
  uint64_t v517;
  FCPersonalizationOntologyLevelConfig *sportsTopStoriesOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v519;
  void *v520;
  void *v521;
  uint64_t v522;
  FCPersonalizationOntologyLevelConfig *introToSportsGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v524;
  void *v525;
  void *v526;
  uint64_t v527;
  FCPersonalizationOntologyLevelConfig *introToSportsGroupForYouOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v529;
  void *v530;
  void *v531;
  uint64_t v532;
  FCPersonalizationOntologyLevelConfig *highlightsGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v534;
  void *v535;
  void *v536;
  uint64_t v537;
  FCPersonalizationOntologyLevelConfig *articleListTagFeedGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v539;
  void *v540;
  void *v541;
  uint64_t v542;
  FCPersonalizationOntologyLevelConfig *tagFeedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v544;
  void *v545;
  void *v546;
  uint64_t v547;
  FCPersonalizationOntologyLevelConfig *newspaperTodayFeedOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v549;
  void *v550;
  void *v551;
  uint64_t v552;
  FCPersonalizationOntologyLevelConfig *moreForYouOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v554;
  void *v555;
  void *v556;
  uint64_t v557;
  FCPersonalizationOntologyLevelConfig *localSectionGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v559;
  void *v560;
  void *v561;
  uint64_t v562;
  FCPersonalizationOntologyLevelConfig *newspaperSectionGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v564;
  void *v565;
  void *v566;
  uint64_t v567;
  FCPersonalizationOntologyLevelConfig *sportsEventArticlesGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v569;
  void *v570;
  void *v571;
  uint64_t v572;
  FCPersonalizationOntologyLevelConfig *tagForYouGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v574;
  void *v575;
  void *v576;
  uint64_t v577;
  FCPersonalizationOntologyLevelConfig *tagRecentStoriesOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v579;
  void *v580;
  void *v581;
  uint64_t v582;
  FCPersonalizationOntologyLevelConfig *tagDateRangeOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v584;
  void *v585;
  void *v586;
  uint64_t v587;
  FCPersonalizationOntologyLevelConfig *sportsEventTopicGroupOntologyLevelConfig;
  FCPersonalizationOntologyLevelConfig *v589;
  void *v590;
  void *v591;
  uint64_t v592;
  FCPersonalizationOntologyLevelConfig *affinityGroupOntologyLevelConfig;
  uint64_t v594;
  void *v595;
  void *v596;
  void *v597;
  uint64_t v598;
  void *v599;
  void *v600;
  uint64_t v601;
  void *v602;
  void *v603;
  uint64_t v604;
  void *v605;
  void *v606;
  uint64_t v607;
  void *v608;
  void *v609;
  uint64_t v610;
  void *v611;
  void *v612;
  uint64_t v613;
  void *v614;
  void *v615;
  uint64_t v616;
  void *v617;
  void *v618;
  uint64_t v619;
  void *v620;
  void *v621;
  uint64_t v622;
  void *v623;
  void *v624;
  uint64_t v625;
  void *v626;
  void *v627;
  uint64_t v628;
  void *v629;
  void *v630;
  uint64_t v631;
  void *v632;
  void *v633;
  uint64_t v634;
  void *v635;
  void *v636;
  uint64_t v637;
  void *v638;
  void *v639;
  uint64_t v640;
  void *v641;
  void *v642;
  uint64_t v643;
  void *v644;
  void *v645;
  uint64_t v646;
  void *v647;
  void *v648;
  uint64_t v649;
  void *v650;
  void *v651;
  uint64_t v652;
  void *v653;
  void *v654;
  uint64_t v655;
  void *v656;
  void *v657;
  uint64_t v658;
  void *v659;
  void *v660;
  uint64_t v661;
  void *v662;
  void *v663;
  uint64_t v664;
  void *v665;
  void *v666;
  uint64_t v667;
  void *v668;
  void *v669;
  uint64_t v670;
  void *v671;
  void *v672;
  uint64_t v673;
  void *v674;
  void *v675;
  uint64_t v676;
  void *v677;
  void *v678;
  uint64_t v679;
  void *v680;
  void *v681;
  uint64_t v682;
  void *v683;
  void *v684;
  uint64_t v685;
  void *v686;
  void *v687;
  uint64_t v688;
  void *v689;
  void *v690;
  uint64_t v691;
  void *v692;
  void *v693;
  uint64_t v694;
  void *v695;
  void *v696;
  uint64_t v697;
  void *v698;
  void *v699;
  uint64_t v700;
  void *v701;
  void *v702;
  uint64_t v703;
  void *v704;
  void *v705;
  uint64_t v706;
  void *v707;
  void *v708;
  uint64_t v709;
  void *v710;
  void *v711;
  uint64_t v712;
  void *v713;
  void *v714;
  uint64_t v715;
  void *v716;
  void *v717;
  void *v718;
  uint64_t v719;
  void *v720;
  void *v721;
  uint64_t v722;
  void *v723;
  void *v724;
  uint64_t v725;
  void *v726;
  void *v727;
  uint64_t v728;
  void *v729;
  void *v730;
  uint64_t v731;
  void *v732;
  void *v733;
  uint64_t v734;
  void *v735;
  void *v736;
  uint64_t v737;
  void *v738;
  void *v739;
  uint64_t v740;
  void *v741;
  void *v742;
  uint64_t v743;
  void *v744;
  void *v745;
  uint64_t v746;
  void *v747;
  void *v748;
  uint64_t v749;
  void *v750;
  void *v751;
  uint64_t v752;
  void *v753;
  void *v754;
  uint64_t v755;
  void *v756;
  void *v757;
  uint64_t v758;
  void *v759;
  void *v760;
  uint64_t v761;
  void *v762;
  void *v763;
  uint64_t v764;
  void *v765;
  void *v766;
  uint64_t v767;
  void *v768;
  void *v769;
  uint64_t v770;
  void *v771;
  void *v772;
  uint64_t v773;
  void *v774;
  void *v775;
  uint64_t v776;
  void *v777;
  void *v778;
  uint64_t v779;
  void *v780;
  void *v781;
  uint64_t v782;
  void *v783;
  void *v784;
  uint64_t v785;
  void *v786;
  void *v787;
  uint64_t v788;
  void *v789;
  void *v790;
  uint64_t v791;
  void *v792;
  void *v793;
  uint64_t v794;
  void *v795;
  void *v796;
  uint64_t v797;
  void *v798;
  void *v799;
  uint64_t v800;
  void *v801;
  void *v802;
  uint64_t v803;
  void *v804;
  void *v805;
  uint64_t v806;
  void *v807;
  void *v808;
  uint64_t v809;
  void *v810;
  void *v811;
  uint64_t v812;
  void *v813;
  void *v814;
  uint64_t v815;
  void *v816;
  void *v817;
  uint64_t v818;
  void *v819;
  void *v820;
  uint64_t v821;
  void *v822;
  void *v823;
  uint64_t v824;
  void *v825;
  void *v826;
  uint64_t v827;
  void *v828;
  void *v829;
  uint64_t v830;
  void *v831;
  void *v832;
  uint64_t v833;
  void *v834;
  void *v835;
  uint64_t v836;
  void *v837;
  void *v838;
  uint64_t v839;
  void *v840;
  void *v841;
  uint64_t v842;
  void *v843;
  void *v844;
  uint64_t v845;
  void *v846;
  void *v847;
  uint64_t v848;
  void *v849;
  void *v850;
  uint64_t v851;
  void *v852;
  void *v853;
  uint64_t v854;
  void *v855;
  void *v856;
  uint64_t v857;
  void *v858;
  void *v859;
  uint64_t v860;
  void *v861;
  void *v862;
  uint64_t v863;
  void *v864;
  void *v865;
  uint64_t v866;
  void *v867;
  void *v868;
  uint64_t v869;
  void *v870;
  void *v871;
  uint64_t v872;
  void *v873;
  void *v874;
  uint64_t v875;
  void *v876;
  void *v877;
  uint64_t v878;
  void *v879;
  void *v880;
  uint64_t v881;
  void *v882;
  void *v883;
  uint64_t v884;
  void *v885;
  void *v886;
  uint64_t v887;
  void *v888;
  void *v889;
  uint64_t v890;
  void *v891;
  void *v892;
  uint64_t v893;
  void *v894;
  void *v895;
  uint64_t v896;
  void *v897;
  void *v898;
  uint64_t v899;
  void *v900;
  void *v901;
  uint64_t v902;
  void *v903;
  void *v904;
  uint64_t v905;
  void *v906;
  void *v907;
  uint64_t v908;
  void *v909;
  void *v910;
  uint64_t v911;
  void *v912;
  void *v913;
  uint64_t v914;
  void *v915;
  void *v916;
  uint64_t v917;
  void *v918;
  void *v919;
  uint64_t v920;
  void *v921;
  void *v922;
  uint64_t v923;
  void *v924;
  void *v925;
  uint64_t v926;
  void *v927;
  void *v928;
  uint64_t v929;
  void *v930;
  void *v931;
  uint64_t v932;
  void *v933;
  void *v934;
  uint64_t v935;
  void *v936;
  void *v937;
  uint64_t v938;
  void *v939;
  void *v940;
  uint64_t v941;
  void *v942;
  void *v943;
  uint64_t v944;
  void *v945;
  void *v946;
  uint64_t v947;
  void *v948;
  void *v949;
  FCPersonalizationTagScoringConfig *v950;
  void *v951;
  uint64_t v952;
  FCPersonalizationTagScoringConfig *defaultTagScoringConfig;
  FCPersonalizationTagScoringConfig *v954;
  void *v955;
  void *v956;
  uint64_t v957;
  FCPersonalizationTagScoringConfig *sportsTagScoringConfig;
  double v959;
  double v960;
  double v961;
  double v962;
  double v963;
  double v964;
  double v965;
  double v966;
  double v968;
  double v969;
  double v970;
  double v971;
  double v972;
  double v973;
  double v974;
  uint64_t v975;
  uint64_t v976;
  double v977;
  double v979;
  double v981;
  double v982;
  double v983;
  double v984;
  double v985;
  double v986;
  double v987;
  double v989;
  uint64_t v990;
  uint64_t v991;
  double v992;
  double v993;
  double v994;
  double v995;
  double v996;
  double v997;
  double v998;
  double v999;
  double v1000;
  double v1001;
  double v1002;
  double v1003;
  double v1004;
  double v1005;
  double v1006;
  double v1007;
  double v1008;
  double v1009;
  double v1010;
  double v1011;
  double v1012;
  double v1013;
  double v1014;
  double v1015;
  double v1016;
  double v1017;
  double v1018;
  double v1019;
  double v1020;
  double v1021;
  double v1022;
  double v1023;
  double v1024;
  double v1025;
  double v1026;
  double v1027;
  double v1028;
  double v1029;
  double v1030;
  double v1031;
  double v1032;
  double v1033;
  double v1034;
  double v1035;
  double v1036;
  double v1037;
  double v1038;
  double v1039;
  double v1040;
  double v1041;
  double v1042;
  double v1043;
  double v1044;
  double v1045;
  double v1046;
  double v1047;
  double v1048;
  double v1049;
  double v1050;
  double v1051;
  double v1052;
  double v1053;
  double v1054;
  double v1055;
  double v1056;
  double v1057;
  double v1058;
  double v1059;
  double v1060;
  double v1061;
  double v1062;
  double v1063;
  double v1064;
  double v1065;
  double v1066;
  double v1067;
  double v1068;
  double v1069;
  double v1070;
  double v1071;
  double v1072;
  double v1073;
  double v1074;
  double v1075;
  double v1076;
  double v1077;
  double v1078;
  double v1079;
  double v1080;
  double v1081;
  double v1082;
  double v1083;
  double v1084;
  double v1085;
  double v1086;
  double v1087;
  double v1088;
  double v1089;
  double v1090;
  double v1091;
  double v1092;
  double v1093;
  double v1094;
  double v1095;
  double v1096;
  double v1097;
  double v1098;
  double v1099;
  double v1100;
  double v1101;
  double v1102;
  double v1103;
  double v1104;
  double v1105;
  double v1106;
  double v1108;
  double v1109;
  double v1111;
  double v1112;
  double v1113;
  double v1114;
  double v1115;
  double v1116;
  double v1117;
  double v1118;
  double v1119;
  double v1120;
  double v1121;
  double v1122;
  double v1123;
  double v1124;
  double v1125;
  double v1126;
  double v1127;
  double v1128;
  double v1129;
  double v1130;
  double v1131;
  double v1132;
  double v1133;
  double v1134;
  double v1135;
  double v1136;
  double v1137;
  double v1138;
  double v1139;
  double v1140;
  double v1141;
  double v1142;
  double v1143;
  double v1144;
  double v1145;
  double v1146;
  double v1147;
  double v1148;
  double v1149;
  double v1150;
  uint64_t v1151;
  uint64_t v1152;
  uint64_t v1153;
  uint64_t v1154;
  uint64_t v1155;
  uint64_t v1156;
  uint64_t v1157;
  uint64_t v1158;
  uint64_t v1159;
  uint64_t v1160;
  uint64_t v1161;
  uint64_t v1162;
  uint64_t v1163;
  uint64_t v1164;
  uint64_t v1165;
  uint64_t v1166;
  uint64_t v1167;
  uint64_t v1168;
  uint64_t v1169;
  uint64_t v1170;
  uint64_t v1171;
  uint64_t v1172;
  uint64_t v1173;
  uint64_t v1174;
  uint64_t v1175;
  uint64_t v1176;
  uint64_t v1177;
  uint64_t v1178;
  uint64_t v1179;
  uint64_t v1180;
  uint64_t v1181;
  uint64_t v1182;
  uint64_t v1183;
  uint64_t v1184;
  uint64_t v1185;
  uint64_t v1186;
  uint64_t v1187;
  uint64_t v1188;
  uint64_t v1189;
  uint64_t v1190;
  uint64_t v1191;
  uint64_t v1192;
  uint64_t v1193;
  uint64_t v1194;
  uint64_t v1195;
  uint64_t v1196;
  uint64_t v1197;
  uint64_t v1198;
  uint64_t v1199;
  uint64_t v1200;
  uint64_t v1201;
  uint64_t v1202;
  uint64_t v1203;
  uint64_t v1204;
  uint64_t v1205;
  uint64_t v1206;
  uint64_t v1207;
  uint64_t v1208;
  uint64_t v1209;
  uint64_t v1210;
  uint64_t v1211;
  uint64_t v1212;
  uint64_t v1213;
  uint64_t v1214;
  uint64_t v1215;
  uint64_t v1216;
  uint64_t v1217;
  uint64_t v1218;
  uint64_t v1219;
  uint64_t v1220;
  uint64_t v1221;
  uint64_t v1222;
  uint64_t v1223;
  uint64_t v1224;
  uint64_t v1225;
  uint64_t v1226;
  uint64_t v1227;
  uint64_t v1228;
  uint64_t v1229;
  uint64_t v1230;
  uint64_t v1231;
  uint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  uint64_t v1235;
  uint64_t v1236;
  uint64_t v1237;
  uint64_t v1238;
  double v1239;
  double v1241;
  uint64_t v1243;
  unint64_t v1244;
  uint64_t v1245;
  unint64_t v1246;
  double v1247;
  uint64_t v1248;
  uint64_t v1249;
  double v1250;
  double v1252;
  double v1253;
  double v1255;
  double v1256;
  double v1257;
  double v1258;
  double v1260;
  double v1262;
  double v1263;
  double v1264;
  double v1265;
  double v1267;
  double v1268;
  double v1270;
  double v1272;
  double v1273;
  double v1274;
  double v1275;
  double v1276;
  double v1277;
  double v1278;
  double v1279;
  double v1281;
  uint64_t v1283;
  uint64_t v1284;
  double v1285;
  uint64_t v1286;
  uint64_t v1287;
  uint64_t v1288;
  uint64_t v1289;
  double v1290;
  uint64_t v1292;
  uint64_t v1293;
  uint64_t v1294;
  uint64_t v1295;
  double unsubscribeClickValue;
  __int128 v1297;
  __int128 v1298;
  __int128 v1299;
  __int128 v1300;
  __int128 v1301;
  __int128 v1302;
  __int128 v1303;
  __int128 v1304;
  __int128 v1305;
  __int128 v1306;
  __int128 v1307;
  __int128 v1308;
  __int128 v1309;
  __int128 v1310;
  double v1311;
  void *v1312;
  _QWORD v1314[5];
  objc_super v1315;

  v5 = a3;
  v1315.receiver = self;
  v1315.super_class = (Class)FCPersonalizationTreatment;
  v6 = -[FCPersonalizationTreatment init](&v1315, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = (_OWORD *)&v6->_featureImpressionsByAction[2];
    pbTreatment = v6->_pbTreatment;
    v6->_pbTreatment = 0;

    objc_storeStrong((id *)&v7->_treatmentDictionary, a3);
    v7->_treatmentID = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("treatmentId"), 0);
    v10 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("defaultScoringConfig"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCPersonalizationScoringConfig initWithConfigDictionary:](v10, "initWithConfigDictionary:", v11);
    defaultScoringConfig = v7->_defaultScoringConfig;
    v7->_defaultScoringConfig = (FCPersonalizationScoringConfig *)v12;

    v14 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("topicFeedScoringConfig"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v14, "initWithConfigDictionary:defaultConfig:", v15, v16);
    topicFeedScoringConfig = v7->_topicFeedScoringConfig;
    v7->_topicFeedScoringConfig = (FCPersonalizationScoringConfig *)v17;

    v19 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("magazineFeedArticleScoringConfig"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v19, "initWithConfigDictionary:defaultConfig:", v20, v21);
    magazineFeedArticleScoringConfig = v7->_magazineFeedArticleScoringConfig;
    v7->_magazineFeedArticleScoringConfig = (FCPersonalizationScoringConfig *)v22;

    v24 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("magazineFeedIssueScoringConfig"), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v24, "initWithConfigDictionary:defaultConfig:", v25, v26);
    magazineFeedIssueScoringConfig = v7->_magazineFeedIssueScoringConfig;
    v7->_magazineFeedIssueScoringConfig = (FCPersonalizationScoringConfig *)v27;

    v29 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("audioFeedScoringConfig"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v29, "initWithConfigDictionary:defaultConfig:", v30, v31);
    legacyAudioFeedScoringConfig = v7->_legacyAudioFeedScoringConfig;
    v7->_legacyAudioFeedScoringConfig = (FCPersonalizationScoringConfig *)v32;

    v34 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("audioFeed2ScoringConfig"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v34, "initWithConfigDictionary:defaultConfig:", v35, v7->_legacyAudioFeedScoringConfig);
    audioFeedScoringConfig = v7->_audioFeedScoringConfig;
    v7->_audioFeedScoringConfig = (FCPersonalizationScoringConfig *)v36;

    v38 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationPrimaryScoringConfig"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v38, "initWithConfigDictionary:defaultConfig:", v39, v40);
    articleRecirculationPrimaryScoringConfig = v7->_articleRecirculationPrimaryScoringConfig;
    v7->_articleRecirculationPrimaryScoringConfig = (FCPersonalizationScoringConfig *)v41;

    v43 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationSecondaryScoringConfig"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v43, "initWithConfigDictionary:defaultConfig:", v44, v45);
    articleRecirculationSecondaryScoringConfig = v7->_articleRecirculationSecondaryScoringConfig;
    v7->_articleRecirculationSecondaryScoringConfig = (FCPersonalizationScoringConfig *)v46;

    v48 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationTertiaryScoringConfig"), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v48, "initWithConfigDictionary:defaultConfig:", v49, v50);
    articleRecirculationTertiaryScoringConfig = v7->_articleRecirculationTertiaryScoringConfig;
    v7->_articleRecirculationTertiaryScoringConfig = (FCPersonalizationScoringConfig *)v51;

    v53 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationQuaternaryScoringConfig"), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v53, "initWithConfigDictionary:defaultConfig:", v54, v55);
    articleRecirculationQuaternaryScoringConfig = v7->_articleRecirculationQuaternaryScoringConfig;
    v7->_articleRecirculationQuaternaryScoringConfig = (FCPersonalizationScoringConfig *)v56;

    v58 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("bestOfBundleScoringConfig"), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v58, "initWithConfigDictionary:defaultConfig:", v59, v60);
    bestOfBundleScoringConfig = v7->_bestOfBundleScoringConfig;
    v7->_bestOfBundleScoringConfig = (FCPersonalizationScoringConfig *)v61;

    v63 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("curatedScoringConfig"), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v63, "initWithConfigDictionary:defaultConfig:", v64, v65);
    curatedScoringConfig = v7->_curatedScoringConfig;
    v7->_curatedScoringConfig = (FCPersonalizationScoringConfig *)v66;

    v68 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("curatedIssuesScoringConfig"), 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v68, "initWithConfigDictionary:defaultConfig:", v69, v70);
    curatedIssuesScoringConfig = v7->_curatedIssuesScoringConfig;
    v7->_curatedIssuesScoringConfig = (FCPersonalizationScoringConfig *)v71;

    v73 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("forYouScoringConfig"), 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v73, "initWithConfigDictionary:defaultConfig:", v74, v75);
    forYouScoringConfig = v7->_forYouScoringConfig;
    v7->_forYouScoringConfig = (FCPersonalizationScoringConfig *)v76;

    v78 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("greatStoriesYouMissedScoringConfig"), 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment forYouScoringConfig](v7, "forYouScoringConfig");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v78, "initWithConfigDictionary:defaultConfig:", v79, v80);
    greatStoriesYouMissedScoringConfig = v7->_greatStoriesYouMissedScoringConfig;
    v7->_greatStoriesYouMissedScoringConfig = (FCPersonalizationScoringConfig *)v81;

    v83 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("latestStoriesScoringConfig"), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment forYouScoringConfig](v7, "forYouScoringConfig");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v83, "initWithConfigDictionary:defaultConfig:", v84, v85);
    latestStoriesScoringConfig = v7->_latestStoriesScoringConfig;
    v7->_latestStoriesScoringConfig = (FCPersonalizationScoringConfig *)v86;

    v88 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("localNewsScoringConfig"), 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v88, "initWithConfigDictionary:defaultConfig:", v89, v90);
    localNewsScoringConfig = v7->_localNewsScoringConfig;
    v7->_localNewsScoringConfig = (FCPersonalizationScoringConfig *)v91;

    v93 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperMagazineFeedScoringConfig"), 0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v93, "initWithConfigDictionary:defaultConfig:", v94, v95);
    newspaperMagazineFeedScoringConfig = v7->_newspaperMagazineFeedScoringConfig;
    v7->_newspaperMagazineFeedScoringConfig = (FCPersonalizationScoringConfig *)v96;

    v98 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("todayWidgetScoringConfig"), 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v98, "initWithConfigDictionary:defaultConfig:", v99, v100);
    todayWidgetScoringConfig = v7->_todayWidgetScoringConfig;
    v7->_todayWidgetScoringConfig = (FCPersonalizationScoringConfig *)v101;

    v103 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagWidgetScoringConfig"), 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v103, "initWithConfigDictionary:defaultConfig:", v104, v105);
    tagWidgetScoringConfig = v7->_tagWidgetScoringConfig;
    v7->_tagWidgetScoringConfig = (FCPersonalizationScoringConfig *)v106;

    v108 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("notificationScoringConfig"), 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v108, "initWithConfigDictionary:defaultConfig:", v109, v110);
    notificationScoringConfig = v7->_notificationScoringConfig;
    v7->_notificationScoringConfig = (FCPersonalizationScoringConfig *)v111;

    v113 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsGroupScoringConfig"), 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v113, "initWithConfigDictionary:defaultConfig:", v114, v115);
    mySportsGroupScoringConfig = v7->_mySportsGroupScoringConfig;
    v7->_mySportsGroupScoringConfig = (FCPersonalizationScoringConfig *)v116;

    v118 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsGroupForYouScoringConfig"), 0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v118, "initWithConfigDictionary:defaultConfig:", v119, v120);
    mySportsGroupForYouScoringConfig = v7->_mySportsGroupForYouScoringConfig;
    v7->_mySportsGroupForYouScoringConfig = (FCPersonalizationScoringConfig *)v121;

    v123 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsTopicsScoringConfig"), 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v123, "initWithConfigDictionary:defaultConfig:", v124, v125);
    mySportsTopicsScoringConfig = v7->_mySportsTopicsScoringConfig;
    v7->_mySportsTopicsScoringConfig = (FCPersonalizationScoringConfig *)v126;

    v128 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsTopStoriesScoringConfig"), 0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v128, "initWithConfigDictionary:defaultConfig:", v129, v130);
    sportsTopStoriesScoringConfig = v7->_sportsTopStoriesScoringConfig;
    v7->_sportsTopStoriesScoringConfig = (FCPersonalizationScoringConfig *)v131;

    v133 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("introToSportsGroupScoringConfig"), 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v133, "initWithConfigDictionary:defaultConfig:", v134, v135);
    introToSportsGroupScoringConfig = v7->_introToSportsGroupScoringConfig;
    v7->_introToSportsGroupScoringConfig = (FCPersonalizationScoringConfig *)v136;

    v138 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("introToSportsGroupForYouScoringConfig"), 0);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v138, "initWithConfigDictionary:defaultConfig:", v139, v140);
    introToSportsGroupForYouScoringConfig = v7->_introToSportsGroupForYouScoringConfig;
    v7->_introToSportsGroupForYouScoringConfig = (FCPersonalizationScoringConfig *)v141;

    v143 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("highlightsGroupScoringConfig"), 0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v143, "initWithConfigDictionary:defaultConfig:", v144, v145);
    highlightsGroupScoringConfig = v7->_highlightsGroupScoringConfig;
    v7->_highlightsGroupScoringConfig = (FCPersonalizationScoringConfig *)v146;

    v148 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleListTagFeedGroupScoringConfig"), 0);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v148, "initWithConfigDictionary:defaultConfig:", v149, v150);
    articleListTagFeedGroupScoringConfig = v7->_articleListTagFeedGroupScoringConfig;
    v7->_articleListTagFeedGroupScoringConfig = (FCPersonalizationScoringConfig *)v151;

    v153 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagFeedScoringConfig"), 0);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v153, "initWithConfigDictionary:defaultConfig:", v154, v155);
    tagFeedScoringConfig = v7->_tagFeedScoringConfig;
    v7->_tagFeedScoringConfig = (FCPersonalizationScoringConfig *)v156;

    v158 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperTodayFeedScoringConfig"), 0);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v158, "initWithConfigDictionary:defaultConfig:", v159, v160);
    newspaperTodayFeedScoringConfig = v7->_newspaperTodayFeedScoringConfig;
    v7->_newspaperTodayFeedScoringConfig = (FCPersonalizationScoringConfig *)v161;

    v163 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("moreForYouScoringConfig"), 0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v163, "initWithConfigDictionary:defaultConfig:", v164, v165);
    moreForYouScoringConfig = v7->_moreForYouScoringConfig;
    v7->_moreForYouScoringConfig = (FCPersonalizationScoringConfig *)v166;

    v168 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("localSectionGroupScoringConfig"), 0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v168, "initWithConfigDictionary:defaultConfig:", v169, v170);
    localSectionGroupScoringConfig = v7->_localSectionGroupScoringConfig;
    v7->_localSectionGroupScoringConfig = (FCPersonalizationScoringConfig *)v171;

    v173 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperSectionGroupScoringConfig"), 0);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v173, "initWithConfigDictionary:defaultConfig:", v174, v175);
    newspaperSectionGroupScoringConfig = v7->_newspaperSectionGroupScoringConfig;
    v7->_newspaperSectionGroupScoringConfig = (FCPersonalizationScoringConfig *)v176;

    v178 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsEventArticlesGroupScoringConfig"), 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v178, "initWithConfigDictionary:defaultConfig:", v179, v180);
    sportsEventArticlesGroupScoringConfig = v7->_sportsEventArticlesGroupScoringConfig;
    v7->_sportsEventArticlesGroupScoringConfig = (FCPersonalizationScoringConfig *)v181;

    v183 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagForYouGroupScoringConfig"), 0);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v183, "initWithConfigDictionary:defaultConfig:", v184, v185);
    tagForYouGroupScoringConfig = v7->_tagForYouGroupScoringConfig;
    v7->_tagForYouGroupScoringConfig = (FCPersonalizationScoringConfig *)v186;

    v188 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagRecentStoriesScoringConfig"), 0);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v188, "initWithConfigDictionary:defaultConfig:", v189, v190);
    tagRecentStoriesScoringConfig = v7->_tagRecentStoriesScoringConfig;
    v7->_tagRecentStoriesScoringConfig = (FCPersonalizationScoringConfig *)v191;

    v193 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagDateRangeScoringConfig"), 0);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v193, "initWithConfigDictionary:defaultConfig:", v194, v195);
    tagDateRangeScoringConfig = v7->_tagDateRangeScoringConfig;
    v7->_tagDateRangeScoringConfig = (FCPersonalizationScoringConfig *)v196;

    v198 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsEventTopicGroupScoringConfig"), 0);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v198, "initWithConfigDictionary:defaultConfig:", v199, v200);
    sportsEventTopicGroupScoringConfig = v7->_sportsEventTopicGroupScoringConfig;
    v7->_sportsEventTopicGroupScoringConfig = (FCPersonalizationScoringConfig *)v201;

    v203 = [FCPersonalizationScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("affinityGroupScoringConfig"), 0);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultScoringConfig](v7, "defaultScoringConfig");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = -[FCPersonalizationScoringConfig initWithConfigDictionary:defaultConfig:](v203, "initWithConfigDictionary:defaultConfig:", v204, v205);
    affinityGroupScoringConfig = v7->_affinityGroupScoringConfig;
    v7->_affinityGroupScoringConfig = (FCPersonalizationScoringConfig *)v206;

    v208 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("defaultTopicsConfig"), 0);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = -[FCPersonalizationTopicsConfig initWithConfig:](v208, "initWithConfig:", v209);
    defaultTopicsConfig = v7->_defaultTopicsConfig;
    v7->_defaultTopicsConfig = (FCPersonalizationTopicsConfig *)v210;

    v212 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("topicFeedTopicsConfig"), 0);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v215 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v212, "initWithConfig:defaultConfig:", v213, v214);
    topicFeedTopicsConfig = v7->_topicFeedTopicsConfig;
    v7->_topicFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v215;

    v217 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("magazineFeedArticleTopicsConfig"), 0);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v217, "initWithConfig:defaultConfig:", v218, v219);
    magazineFeedArticleTopicsConfig = v7->_magazineFeedArticleTopicsConfig;
    v7->_magazineFeedArticleTopicsConfig = (FCPersonalizationTopicsConfig *)v220;

    v222 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("magazineFeedIssueTopicsConfig"), 0);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v225 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v222, "initWithConfig:defaultConfig:", v223, v224);
    magazineFeedIssueTopicsConfig = v7->_magazineFeedIssueTopicsConfig;
    v7->_magazineFeedIssueTopicsConfig = (FCPersonalizationTopicsConfig *)v225;

    v227 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("audioFeedTopicsConfig"), 0);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v227, "initWithConfig:defaultConfig:", v228, v229);
    legacyAudioFeedTopicsConfig = v7->_legacyAudioFeedTopicsConfig;
    v7->_legacyAudioFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v230;

    v232 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("audioFeed2TopicsConfig"), 0);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v232, "initWithConfig:defaultConfig:", v233, v7->_legacyAudioFeedTopicsConfig);
    audioFeedTopicsConfig = v7->_audioFeedTopicsConfig;
    v7->_audioFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v234;

    v236 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationPrimaryTopicsConfig"), 0);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v236, "initWithConfig:defaultConfig:", v237, v238);
    articleRecirculationPrimaryTopicsConfig = v7->_articleRecirculationPrimaryTopicsConfig;
    v7->_articleRecirculationPrimaryTopicsConfig = (FCPersonalizationTopicsConfig *)v239;

    v241 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationSecondaryTopicsConfig"), 0);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v241, "initWithConfig:defaultConfig:", v242, v243);
    articleRecirculationSecondaryTopicsConfig = v7->_articleRecirculationSecondaryTopicsConfig;
    v7->_articleRecirculationSecondaryTopicsConfig = (FCPersonalizationTopicsConfig *)v244;

    v246 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationTertiaryTopicsConfig"), 0);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v246, "initWithConfig:defaultConfig:", v247, v248);
    articleRecirculationTertiaryTopicsConfig = v7->_articleRecirculationTertiaryTopicsConfig;
    v7->_articleRecirculationTertiaryTopicsConfig = (FCPersonalizationTopicsConfig *)v249;

    v251 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationQuaternaryTopicsConfig"), 0);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v251, "initWithConfig:defaultConfig:", v252, v253);
    articleRecirculationQuaternaryTopicsConfig = v7->_articleRecirculationQuaternaryTopicsConfig;
    v7->_articleRecirculationQuaternaryTopicsConfig = (FCPersonalizationTopicsConfig *)v254;

    v256 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("bestOfBundleTopicsConfig"), 0);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    v259 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v256, "initWithConfig:defaultConfig:", v257, v258);
    bestOfBundleTopicsConfig = v7->_bestOfBundleTopicsConfig;
    v7->_bestOfBundleTopicsConfig = (FCPersonalizationTopicsConfig *)v259;

    v261 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("curatedTopicsConfig"), 0);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v261, "initWithConfig:defaultConfig:", v262, v263);
    curatedTopicsConfig = v7->_curatedTopicsConfig;
    v7->_curatedTopicsConfig = (FCPersonalizationTopicsConfig *)v264;

    v266 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("curatedIssuesTopicsConfig"), 0);
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v266, "initWithConfig:defaultConfig:", v267, v268);
    curatedIssuesTopicsConfig = v7->_curatedIssuesTopicsConfig;
    v7->_curatedIssuesTopicsConfig = (FCPersonalizationTopicsConfig *)v269;

    v271 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("forYouTopicsConfig"), 0);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v271, "initWithConfig:defaultConfig:", v272, v273);
    forYouTopicsConfig = v7->_forYouTopicsConfig;
    v7->_forYouTopicsConfig = (FCPersonalizationTopicsConfig *)v274;

    v276 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("greatStoriesYouMissedTopicsConfig"), 0);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment forYouTopicsConfig](v7, "forYouTopicsConfig");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    v279 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v276, "initWithConfig:defaultConfig:", v277, v278);
    greatStoriesYouMissedTopicsConfig = v7->_greatStoriesYouMissedTopicsConfig;
    v7->_greatStoriesYouMissedTopicsConfig = (FCPersonalizationTopicsConfig *)v279;

    v281 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("latestStoriesTopicsConfig"), 0);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment forYouTopicsConfig](v7, "forYouTopicsConfig");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v281, "initWithConfig:defaultConfig:", v282, v283);
    latestStoriesTopicsConfig = v7->_latestStoriesTopicsConfig;
    v7->_latestStoriesTopicsConfig = (FCPersonalizationTopicsConfig *)v284;

    v286 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("localNewsTopicsConfig"), 0);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v286, "initWithConfig:defaultConfig:", v287, v288);
    localNewsTopicsConfig = v7->_localNewsTopicsConfig;
    v7->_localNewsTopicsConfig = (FCPersonalizationTopicsConfig *)v289;

    v291 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperMagazineFeedTopicsConfig"), 0);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v291, "initWithConfig:defaultConfig:", v292, v293);
    newspaperMagazineFeedTopicsConfig = v7->_newspaperMagazineFeedTopicsConfig;
    v7->_newspaperMagazineFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v294;

    v296 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("todayWidgetTopicsConfig"), 0);
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    v299 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v296, "initWithConfig:defaultConfig:", v297, v298);
    todayWidgetTopicsConfig = v7->_todayWidgetTopicsConfig;
    v7->_todayWidgetTopicsConfig = (FCPersonalizationTopicsConfig *)v299;

    v301 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("tagWidgetTopicsConfig"), 0);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v301, "initWithConfig:defaultConfig:", v302, v303);
    tagWidgetTopicsConfig = v7->_tagWidgetTopicsConfig;
    v7->_tagWidgetTopicsConfig = (FCPersonalizationTopicsConfig *)v304;

    v306 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsGroupTopicsConfig"), 0);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    v309 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v306, "initWithConfig:defaultConfig:", v307, v308);
    mySportsGroupTopicsConfig = v7->_mySportsGroupTopicsConfig;
    v7->_mySportsGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v309;

    v311 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsGroupForYouTopicsConfig"), 0);
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    v314 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v311, "initWithConfig:defaultConfig:", v312, v313);
    mySportsGroupForYouTopicsConfig = v7->_mySportsGroupForYouTopicsConfig;
    v7->_mySportsGroupForYouTopicsConfig = (FCPersonalizationTopicsConfig *)v314;

    v316 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsTopicsTopicsConfig"), 0);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    v319 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v316, "initWithConfig:defaultConfig:", v317, v318);
    mySportsTopicsTopicsConfig = v7->_mySportsTopicsTopicsConfig;
    v7->_mySportsTopicsTopicsConfig = (FCPersonalizationTopicsConfig *)v319;

    v321 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsTopStoriesTopicsConfig"), 0);
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    v324 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v321, "initWithConfig:defaultConfig:", v322, v323);
    sportsTopStoriesTopicsConfig = v7->_sportsTopStoriesTopicsConfig;
    v7->_sportsTopStoriesTopicsConfig = (FCPersonalizationTopicsConfig *)v324;

    v326 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("introToSportsGroupTopicsConfig"), 0);
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    v329 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v326, "initWithConfig:defaultConfig:", v327, v328);
    introToSportsGroupTopicsConfig = v7->_introToSportsGroupTopicsConfig;
    v7->_introToSportsGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v329;

    v331 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("introToSportsGroupForYouTopicsConfig"), 0);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    v334 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v331, "initWithConfig:defaultConfig:", v332, v333);
    introToSportsGroupForYouTopicsConfig = v7->_introToSportsGroupForYouTopicsConfig;
    v7->_introToSportsGroupForYouTopicsConfig = (FCPersonalizationTopicsConfig *)v334;

    v336 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("highlightsGroupTopicsConfig"), 0);
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    v339 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v336, "initWithConfig:defaultConfig:", v337, v338);
    highlightsGroupTopicsConfig = v7->_highlightsGroupTopicsConfig;
    v7->_highlightsGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v339;

    v341 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("articleListTagFeedGroupTopicsConfig"), 0);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v343 = (void *)objc_claimAutoreleasedReturnValue();
    v344 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v341, "initWithConfig:defaultConfig:", v342, v343);
    articleListTagFeedGroupTopicsConfig = v7->_articleListTagFeedGroupTopicsConfig;
    v7->_articleListTagFeedGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v344;

    v346 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("tagFeedTopicsConfig"), 0);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    v349 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v346, "initWithConfig:defaultConfig:", v347, v348);
    tagFeedTopicsConfig = v7->_tagFeedTopicsConfig;
    v7->_tagFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v349;

    v351 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperTodayFeedTopicsConfig"), 0);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    v354 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v351, "initWithConfig:defaultConfig:", v352, v353);
    newspaperTodayFeedTopicsConfig = v7->_newspaperTodayFeedTopicsConfig;
    v7->_newspaperTodayFeedTopicsConfig = (FCPersonalizationTopicsConfig *)v354;

    v356 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("moreForYouTopicsConfig"), 0);
    v357 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    v359 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v356, "initWithConfig:defaultConfig:", v357, v358);
    moreForYouTopicsConfig = v7->_moreForYouTopicsConfig;
    v7->_moreForYouTopicsConfig = (FCPersonalizationTopicsConfig *)v359;

    v361 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("localSectionGroupTopicsConfig"), 0);
    v362 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    v364 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v361, "initWithConfig:defaultConfig:", v362, v363);
    localSectionGroupTopicsConfig = v7->_localSectionGroupTopicsConfig;
    v7->_localSectionGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v364;

    v366 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperSectionGroupTopicsConfig"), 0);
    v367 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    v369 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v366, "initWithConfig:defaultConfig:", v367, v368);
    newspaperSectionGroupTopicsConfig = v7->_newspaperSectionGroupTopicsConfig;
    v7->_newspaperSectionGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v369;

    v371 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsEventArticlesGroupTopicsConfig"), 0);
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v373 = (void *)objc_claimAutoreleasedReturnValue();
    v374 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v371, "initWithConfig:defaultConfig:", v372, v373);
    sportsEventArticlesGroupTopicsConfig = v7->_sportsEventArticlesGroupTopicsConfig;
    v7->_sportsEventArticlesGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v374;

    v376 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("tagForYouGroupTopicsConfig"), 0);
    v377 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    v379 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v376, "initWithConfig:defaultConfig:", v377, v378);
    tagForYouGroupTopicsConfig = v7->_tagForYouGroupTopicsConfig;
    v7->_tagForYouGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v379;

    v381 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("tagRecentStoriesTopicsConfig"), 0);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    v384 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v381, "initWithConfig:defaultConfig:", v382, v383);
    tagRecentStoriesTopicsConfig = v7->_tagRecentStoriesTopicsConfig;
    v7->_tagRecentStoriesTopicsConfig = (FCPersonalizationTopicsConfig *)v384;

    v386 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("tagDateRangeTopicsConfig"), 0);
    v387 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    v389 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v386, "initWithConfig:defaultConfig:", v387, v388);
    tagDateRangeTopicsConfig = v7->_tagDateRangeTopicsConfig;
    v7->_tagDateRangeTopicsConfig = (FCPersonalizationTopicsConfig *)v389;

    v391 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsEventTopicGroupTopicsConfig"), 0);
    v392 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v393 = (void *)objc_claimAutoreleasedReturnValue();
    v394 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v391, "initWithConfig:defaultConfig:", v392, v393);
    sportsEventTopicGroupTopicsConfig = v7->_sportsEventTopicGroupTopicsConfig;
    v7->_sportsEventTopicGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v394;

    v396 = [FCPersonalizationTopicsConfig alloc];
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("affinityGroupTopicsConfig"), 0);
    v397 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTopicsConfig](v7, "defaultTopicsConfig");
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    v399 = -[FCPersonalizationTopicsConfig initWithConfig:defaultConfig:](v396, "initWithConfig:defaultConfig:", v397, v398);
    affinityGroupTopicsConfig = v7->_affinityGroupTopicsConfig;
    v7->_affinityGroupTopicsConfig = (FCPersonalizationTopicsConfig *)v399;

    v401 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("defaultOntologyLevelConfig"), 0);
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    v403 = -[FCPersonalizationOntologyLevelConfig initWithConfig:](v401, "initWithConfig:", v402);
    defaultOntologyLevelConfig = v7->_defaultOntologyLevelConfig;
    v7->_defaultOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v403;

    v405 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("topicFeedOntologyLevelConfig"), 0);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    v408 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v405, "initWithConfig:defaultConfig:", v406, v407);
    topicFeedOntologyLevelConfig = v7->_topicFeedOntologyLevelConfig;
    v7->_topicFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v408;

    v410 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("magazineFeedArticleOntologyLevelConfig"), 0);
    v411 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    v413 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v410, "initWithConfig:defaultConfig:", v411, v412);
    magazineFeedArticleOntologyLevelConfig = v7->_magazineFeedArticleOntologyLevelConfig;
    v7->_magazineFeedArticleOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v413;

    v415 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("magazineFeedIssueOntologyLevelConfig"), 0);
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    v418 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v415, "initWithConfig:defaultConfig:", v416, v417);
    magazineFeedIssueOntologyLevelConfig = v7->_magazineFeedIssueOntologyLevelConfig;
    v7->_magazineFeedIssueOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v418;

    v420 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("audioFeedOntologyLevelConfig"), 0);
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    v423 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v420, "initWithConfig:defaultConfig:", v421, v422);
    legacyAudioFeedOntologyLevelConfig = v7->_legacyAudioFeedOntologyLevelConfig;
    v7->_legacyAudioFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v423;

    v425 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("audioFeed2OntologyLevelConfig"), 0);
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    v427 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v425, "initWithConfig:defaultConfig:", v426, v7->_legacyAudioFeedOntologyLevelConfig);
    audioFeedOntologyLevelConfig = v7->_audioFeedOntologyLevelConfig;
    v7->_audioFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v427;

    v429 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationPrimaryOntologyLevelConfig"), 0);
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    v432 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v429, "initWithConfig:defaultConfig:", v430, v431);
    articleRecirculationPrimaryOntologyLevelConfig = v7->_articleRecirculationPrimaryOntologyLevelConfig;
    v7->_articleRecirculationPrimaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v432;

    v434 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationSecondaryOntologyLevelConfig"), 0);
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v436 = (void *)objc_claimAutoreleasedReturnValue();
    v437 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v434, "initWithConfig:defaultConfig:", v435, v436);
    articleRecirculationSecondaryOntologyLevelConfig = v7->_articleRecirculationSecondaryOntologyLevelConfig;
    v7->_articleRecirculationSecondaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v437;

    v439 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationTertiaryOntologyLevelConfig"), 0);
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v441 = (void *)objc_claimAutoreleasedReturnValue();
    v442 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v439, "initWithConfig:defaultConfig:", v440, v441);
    articleRecirculationTertiaryOntologyLevelConfig = v7->_articleRecirculationTertiaryOntologyLevelConfig;
    v7->_articleRecirculationTertiaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v442;

    v444 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleRecirculationQuaternaryOntologyLevelConfig"), 0);
    v445 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    v447 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v444, "initWithConfig:defaultConfig:", v445, v446);
    articleRecirculationQuaternaryOntologyLevelConfig = v7->_articleRecirculationQuaternaryOntologyLevelConfig;
    v7->_articleRecirculationQuaternaryOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v447;

    v449 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("bestOfBundleOntologyLevelConfig"), 0);
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v451 = (void *)objc_claimAutoreleasedReturnValue();
    v452 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v449, "initWithConfig:defaultConfig:", v450, v451);
    bestOfBundleOntologyLevelConfig = v7->_bestOfBundleOntologyLevelConfig;
    v7->_bestOfBundleOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v452;

    v454 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("curatedOntologyLevelConfig"), 0);
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v456 = (void *)objc_claimAutoreleasedReturnValue();
    v457 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v454, "initWithConfig:defaultConfig:", v455, v456);
    curatedOntologyLevelConfig = v7->_curatedOntologyLevelConfig;
    v7->_curatedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v457;

    v459 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("curatedIssuesOntologyLevelConfig"), 0);
    v460 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v461 = (void *)objc_claimAutoreleasedReturnValue();
    v462 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v459, "initWithConfig:defaultConfig:", v460, v461);
    curatedIssuesOntologyLevelConfig = v7->_curatedIssuesOntologyLevelConfig;
    v7->_curatedIssuesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v462;

    v464 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("forYouOntologyLevelConfig"), 0);
    v465 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v466 = (void *)objc_claimAutoreleasedReturnValue();
    v467 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v464, "initWithConfig:defaultConfig:", v465, v466);
    forYouOntologyLevelConfig = v7->_forYouOntologyLevelConfig;
    v7->_forYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v467;

    v469 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("greatStoriesYouMissedOntologyLevelConfig"), 0);
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment forYouOntologyLevelConfig](v7, "forYouOntologyLevelConfig");
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    v472 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v469, "initWithConfig:defaultConfig:", v470, v471);
    greatStoriesYouMissedOntologyLevelConfig = v7->_greatStoriesYouMissedOntologyLevelConfig;
    v7->_greatStoriesYouMissedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v472;

    v474 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("latestStoriesOntologyLevelConfig"), 0);
    v475 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment forYouOntologyLevelConfig](v7, "forYouOntologyLevelConfig");
    v476 = (void *)objc_claimAutoreleasedReturnValue();
    v477 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v474, "initWithConfig:defaultConfig:", v475, v476);
    latestStoriesOntologyLevelConfig = v7->_latestStoriesOntologyLevelConfig;
    v7->_latestStoriesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v477;

    v479 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("localNewsOntologyLevelConfig"), 0);
    v480 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v481 = (void *)objc_claimAutoreleasedReturnValue();
    v482 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v479, "initWithConfig:defaultConfig:", v480, v481);
    localNewsOntologyLevelConfig = v7->_localNewsOntologyLevelConfig;
    v7->_localNewsOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v482;

    v484 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperMagazineFeedOntologyLevelConfig"), 0);
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v486 = (void *)objc_claimAutoreleasedReturnValue();
    v487 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v484, "initWithConfig:defaultConfig:", v485, v486);
    newspaperMagazineFeedOntologyLevelConfig = v7->_newspaperMagazineFeedOntologyLevelConfig;
    v7->_newspaperMagazineFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v487;

    v489 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("todayWidgetOntologyLevelConfig"), 0);
    v490 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    v492 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v489, "initWithConfig:defaultConfig:", v490, v491);
    todayWidgetOntologyLevelConfig = v7->_todayWidgetOntologyLevelConfig;
    v7->_todayWidgetOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v492;

    v494 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagWidgetOntologyLevelConfig"), 0);
    v495 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v496 = (void *)objc_claimAutoreleasedReturnValue();
    v497 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v494, "initWithConfig:defaultConfig:", v495, v496);
    tagWidgetOntologyLevelConfig = v7->_tagWidgetOntologyLevelConfig;
    v7->_tagWidgetOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v497;

    v499 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsGroupOntologyLevelConfig"), 0);
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v501 = (void *)objc_claimAutoreleasedReturnValue();
    v502 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v499, "initWithConfig:defaultConfig:", v500, v501);
    mySportsGroupOntologyLevelConfig = v7->_mySportsGroupOntologyLevelConfig;
    v7->_mySportsGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v502;

    v504 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsGroupForYouOntologyLevelConfig"), 0);
    v505 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    v507 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v504, "initWithConfig:defaultConfig:", v505, v506);
    mySportsGroupForYouOntologyLevelConfig = v7->_mySportsGroupForYouOntologyLevelConfig;
    v7->_mySportsGroupForYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v507;

    v509 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("mySportsTopicsOntologyLevelConfig"), 0);
    v510 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v511 = (void *)objc_claimAutoreleasedReturnValue();
    v512 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v509, "initWithConfig:defaultConfig:", v510, v511);
    mySportsTopicsOntologyLevelConfig = v7->_mySportsTopicsOntologyLevelConfig;
    v7->_mySportsTopicsOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v512;

    v514 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsTopStoriesOntologyLevelConfig"), 0);
    v515 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v516 = (void *)objc_claimAutoreleasedReturnValue();
    v517 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v514, "initWithConfig:defaultConfig:", v515, v516);
    sportsTopStoriesOntologyLevelConfig = v7->_sportsTopStoriesOntologyLevelConfig;
    v7->_sportsTopStoriesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v517;

    v519 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("introToSportsGroupOntologyLevelConfig"), 0);
    v520 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v521 = (void *)objc_claimAutoreleasedReturnValue();
    v522 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v519, "initWithConfig:defaultConfig:", v520, v521);
    introToSportsGroupOntologyLevelConfig = v7->_introToSportsGroupOntologyLevelConfig;
    v7->_introToSportsGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v522;

    v524 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("introToSportsGroupForYouOntologyLevelConfig"), 0);
    v525 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v526 = (void *)objc_claimAutoreleasedReturnValue();
    v527 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v524, "initWithConfig:defaultConfig:", v525, v526);
    introToSportsGroupForYouOntologyLevelConfig = v7->_introToSportsGroupForYouOntologyLevelConfig;
    v7->_introToSportsGroupForYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v527;

    v529 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("highlightsGroupOntologyLevelConfig"), 0);
    v530 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v531 = (void *)objc_claimAutoreleasedReturnValue();
    v532 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v529, "initWithConfig:defaultConfig:", v530, v531);
    highlightsGroupOntologyLevelConfig = v7->_highlightsGroupOntologyLevelConfig;
    v7->_highlightsGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v532;

    v534 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("articleListTagFeedGroupOntologyLevelConfig"), 0);
    v535 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v536 = (void *)objc_claimAutoreleasedReturnValue();
    v537 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v534, "initWithConfig:defaultConfig:", v535, v536);
    articleListTagFeedGroupOntologyLevelConfig = v7->_articleListTagFeedGroupOntologyLevelConfig;
    v7->_articleListTagFeedGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v537;

    v539 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagFeedOntologyLevelConfig"), 0);
    v540 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v541 = (void *)objc_claimAutoreleasedReturnValue();
    v542 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v539, "initWithConfig:defaultConfig:", v540, v541);
    tagFeedOntologyLevelConfig = v7->_tagFeedOntologyLevelConfig;
    v7->_tagFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v542;

    v544 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperTodayFeedOntologyLevelConfig"), 0);
    v545 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v546 = (void *)objc_claimAutoreleasedReturnValue();
    v547 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v544, "initWithConfig:defaultConfig:", v545, v546);
    newspaperTodayFeedOntologyLevelConfig = v7->_newspaperTodayFeedOntologyLevelConfig;
    v7->_newspaperTodayFeedOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v547;

    v549 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("moreForYouOntologyLevelConfig"), 0);
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v551 = (void *)objc_claimAutoreleasedReturnValue();
    v552 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v549, "initWithConfig:defaultConfig:", v550, v551);
    moreForYouOntologyLevelConfig = v7->_moreForYouOntologyLevelConfig;
    v7->_moreForYouOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v552;

    v554 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("localSectionGroupOntologyLevelConfig"), 0);
    v555 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v556 = (void *)objc_claimAutoreleasedReturnValue();
    v557 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v554, "initWithConfig:defaultConfig:", v555, v556);
    localSectionGroupOntologyLevelConfig = v7->_localSectionGroupOntologyLevelConfig;
    v7->_localSectionGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v557;

    v559 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("newspaperSectionGroupOntologyLevelConfig"), 0);
    v560 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v561 = (void *)objc_claimAutoreleasedReturnValue();
    v562 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v559, "initWithConfig:defaultConfig:", v560, v561);
    newspaperSectionGroupOntologyLevelConfig = v7->_newspaperSectionGroupOntologyLevelConfig;
    v7->_newspaperSectionGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v562;

    v564 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsEventArticlesGroupOntologyLevelConfig"), 0);
    v565 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v566 = (void *)objc_claimAutoreleasedReturnValue();
    v567 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v564, "initWithConfig:defaultConfig:", v565, v566);
    sportsEventArticlesGroupOntologyLevelConfig = v7->_sportsEventArticlesGroupOntologyLevelConfig;
    v7->_sportsEventArticlesGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v567;

    v569 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagForYouGroupOntologyLevelConfig"), 0);
    v570 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v571 = (void *)objc_claimAutoreleasedReturnValue();
    v572 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v569, "initWithConfig:defaultConfig:", v570, v571);
    tagForYouGroupOntologyLevelConfig = v7->_tagForYouGroupOntologyLevelConfig;
    v7->_tagForYouGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v572;

    v574 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagRecentStoriesOntologyLevelConfig"), 0);
    v575 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v576 = (void *)objc_claimAutoreleasedReturnValue();
    v577 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v574, "initWithConfig:defaultConfig:", v575, v576);
    tagRecentStoriesOntologyLevelConfig = v7->_tagRecentStoriesOntologyLevelConfig;
    v7->_tagRecentStoriesOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v577;

    v579 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("tagDateRangeOntologyLevelConfig"), 0);
    v580 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v581 = (void *)objc_claimAutoreleasedReturnValue();
    v582 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v579, "initWithConfig:defaultConfig:", v580, v581);
    tagDateRangeOntologyLevelConfig = v7->_tagDateRangeOntologyLevelConfig;
    v7->_tagDateRangeOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v582;

    v584 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsEventTopicGroupOntologyLevelConfig"), 0);
    v585 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v586 = (void *)objc_claimAutoreleasedReturnValue();
    v587 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v584, "initWithConfig:defaultConfig:", v585, v586);
    sportsEventTopicGroupOntologyLevelConfig = v7->_sportsEventTopicGroupOntologyLevelConfig;
    v7->_sportsEventTopicGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v587;

    v589 = [FCPersonalizationOntologyLevelConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("affinityGroupOntologyLevelConfig"), 0);
    v590 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultOntologyLevelConfig](v7, "defaultOntologyLevelConfig");
    v591 = (void *)objc_claimAutoreleasedReturnValue();
    v592 = -[FCPersonalizationOntologyLevelConfig initWithConfig:defaultConfig:](v589, "initWithConfig:defaultConfig:", v590, v591);
    affinityGroupOntologyLevelConfig = v7->_affinityGroupOntologyLevelConfig;
    v7->_affinityGroupOntologyLevelConfig = (FCPersonalizationOntologyLevelConfig *)v592;

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowDefaultScoringConfig"), 0);
    v594 = objc_claimAutoreleasedReturnValue();
    v595 = (void *)v594;
    v596 = (void *)MEMORY[0x1E0C9AA70];
    if (v594)
      v597 = (void *)v594;
    else
      v597 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v7->_shadowDefaultScoringConfig, v597);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTopicFeedScoringConfig"), 0);
    v598 = objc_claimAutoreleasedReturnValue();
    v599 = (void *)v598;
    if (v598)
      v600 = (void *)v598;
    else
      v600 = v596;
    objc_storeStrong((id *)&v7->_shadowTopicFeedScoringConfig, v600);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMagazineFeedArticleScoringConfig"), 0);
    v601 = objc_claimAutoreleasedReturnValue();
    v602 = (void *)v601;
    if (v601)
      v603 = (void *)v601;
    else
      v603 = v596;
    objc_storeStrong((id *)&v7->_shadowMagazineFeedArticleScoringConfig, v603);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMagazineFeedIssueScoringConfig"), 0);
    v604 = objc_claimAutoreleasedReturnValue();
    v605 = (void *)v604;
    if (v604)
      v606 = (void *)v604;
    else
      v606 = v596;
    objc_storeStrong((id *)&v7->_shadowMagazineFeedIssueScoringConfig, v606);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAudioFeedScoringConfig"), 0);
    v607 = objc_claimAutoreleasedReturnValue();
    v608 = (void *)v607;
    if (v607)
      v609 = (void *)v607;
    else
      v609 = v596;
    objc_storeStrong((id *)&v7->_shadowLegacyAudioFeedScoringConfig, v609);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAudioFeed2ScoringConfig"), 0);
    v610 = objc_claimAutoreleasedReturnValue();
    v611 = (void *)v610;
    if (v610)
      v612 = (void *)v610;
    else
      v612 = v596;
    objc_storeStrong((id *)&v7->_shadowAudioFeedScoringConfig, v612);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationPrimaryScoringConfig"), 0);
    v613 = objc_claimAutoreleasedReturnValue();
    v614 = (void *)v613;
    if (v613)
      v615 = (void *)v613;
    else
      v615 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationPrimaryScoringConfig, v615);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationSecondaryScoringConfig"), 0);
    v616 = objc_claimAutoreleasedReturnValue();
    v617 = (void *)v616;
    if (v616)
      v618 = (void *)v616;
    else
      v618 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationSecondaryScoringConfig, v618);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationTertiaryScoringConfig"), 0);
    v619 = objc_claimAutoreleasedReturnValue();
    v620 = (void *)v619;
    if (v619)
      v621 = (void *)v619;
    else
      v621 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationTertiaryScoringConfig, v621);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationQuaternaryScoringConfig"), 0);
    v622 = objc_claimAutoreleasedReturnValue();
    v623 = (void *)v622;
    if (v622)
      v624 = (void *)v622;
    else
      v624 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationQuaternaryScoringConfig, v624);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowBestOfBundleScoringConfig"), 0);
    v625 = objc_claimAutoreleasedReturnValue();
    v626 = (void *)v625;
    if (v625)
      v627 = (void *)v625;
    else
      v627 = v596;
    objc_storeStrong((id *)&v7->_shadowBestOfBundleScoringConfig, v627);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowCuratedScoringConfig"), 0);
    v628 = objc_claimAutoreleasedReturnValue();
    v629 = (void *)v628;
    if (v628)
      v630 = (void *)v628;
    else
      v630 = v596;
    objc_storeStrong((id *)&v7->_shadowCuratedScoringConfig, v630);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowCuratedIssuesScoringConfig"), 0);
    v631 = objc_claimAutoreleasedReturnValue();
    v632 = (void *)v631;
    if (v631)
      v633 = (void *)v631;
    else
      v633 = v596;
    objc_storeStrong((id *)&v7->_shadowCuratedIssuesScoringConfig, v633);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowForYouScoringConfig"), 0);
    v634 = objc_claimAutoreleasedReturnValue();
    v635 = (void *)v634;
    if (v634)
      v636 = (void *)v634;
    else
      v636 = v596;
    objc_storeStrong((id *)&v7->_shadowForYouScoringConfig, v636);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowGreatStoriesYouMissedScoringConfig"), 0);
    v637 = objc_claimAutoreleasedReturnValue();
    v638 = (void *)v637;
    if (v637)
      v639 = (void *)v637;
    else
      v639 = v596;
    objc_storeStrong((id *)&v7->_shadowGreatStoriesYouMissedScoringConfig, v639);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLatestStoriesScoringConfig"), 0);
    v640 = objc_claimAutoreleasedReturnValue();
    v641 = (void *)v640;
    if (v640)
      v642 = (void *)v640;
    else
      v642 = v596;
    objc_storeStrong((id *)&v7->_shadowLatestStoriesScoringConfig, v642);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLocalNewsScoringConfig"), 0);
    v643 = objc_claimAutoreleasedReturnValue();
    v644 = (void *)v643;
    if (v643)
      v645 = (void *)v643;
    else
      v645 = v596;
    objc_storeStrong((id *)&v7->_shadowLocalNewsScoringConfig, v645);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperMagazineFeedScoringConfig"), 0);
    v646 = objc_claimAutoreleasedReturnValue();
    v647 = (void *)v646;
    if (v646)
      v648 = (void *)v646;
    else
      v648 = v596;
    objc_storeStrong((id *)&v7->_shadowNewspaperMagazineFeedScoringConfig, v648);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTodayWidgetScoringConfig"), 0);
    v649 = objc_claimAutoreleasedReturnValue();
    v650 = (void *)v649;
    if (v649)
      v651 = (void *)v649;
    else
      v651 = v596;
    objc_storeStrong((id *)&v7->_shadowTodayWidgetScoringConfig, v651);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagWidgetScoringConfig"), 0);
    v652 = objc_claimAutoreleasedReturnValue();
    v653 = (void *)v652;
    if (v652)
      v654 = (void *)v652;
    else
      v654 = v596;
    objc_storeStrong((id *)&v7->_shadowTagWidgetScoringConfig, v654);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNotificationScoringConfig"), 0);
    v655 = objc_claimAutoreleasedReturnValue();
    v656 = (void *)v655;
    if (v655)
      v657 = (void *)v655;
    else
      v657 = v596;
    objc_storeStrong((id *)&v7->_shadowNotificationScoringConfig, v657);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsGroupScoringConfig"), 0);
    v658 = objc_claimAutoreleasedReturnValue();
    v659 = (void *)v658;
    if (v658)
      v660 = (void *)v658;
    else
      v660 = v596;
    objc_storeStrong((id *)&v7->_shadowMySportsGroupScoringConfig, v660);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsGroupForYouScoringConfig"), 0);
    v661 = objc_claimAutoreleasedReturnValue();
    v662 = (void *)v661;
    if (v661)
      v663 = (void *)v661;
    else
      v663 = v596;
    objc_storeStrong((id *)&v7->_shadowMySportsGroupForYouScoringConfig, v663);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsTopicsScoringConfig"), 0);
    v664 = objc_claimAutoreleasedReturnValue();
    v665 = (void *)v664;
    if (v664)
      v666 = (void *)v664;
    else
      v666 = v596;
    objc_storeStrong((id *)&v7->_shadowMySportsTopicsScoringConfig, v666);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsTopStoriesScoringConfig"), 0);
    v667 = objc_claimAutoreleasedReturnValue();
    v668 = (void *)v667;
    if (v667)
      v669 = (void *)v667;
    else
      v669 = v596;
    objc_storeStrong((id *)&v7->_shadowSportsTopStoriesScoringConfig, v669);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowIntroToSportsGroupScoringConfig"), 0);
    v670 = objc_claimAutoreleasedReturnValue();
    v671 = (void *)v670;
    if (v670)
      v672 = (void *)v670;
    else
      v672 = v596;
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupScoringConfig, v672);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowIntroToSportsGroupForYouScoringConfig"), 0);
    v673 = objc_claimAutoreleasedReturnValue();
    v674 = (void *)v673;
    if (v673)
      v675 = (void *)v673;
    else
      v675 = v596;
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupForYouScoringConfig, v675);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowHighlightsGroupScoringConfig"), 0);
    v676 = objc_claimAutoreleasedReturnValue();
    v677 = (void *)v676;
    if (v676)
      v678 = (void *)v676;
    else
      v678 = v596;
    objc_storeStrong((id *)&v7->_shadowHighlightsGroupScoringConfig, v678);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleListTagFeedGroupScoringConfig"), 0);
    v679 = objc_claimAutoreleasedReturnValue();
    v680 = (void *)v679;
    if (v679)
      v681 = (void *)v679;
    else
      v681 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleListTagFeedGroupScoringConfig, v681);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagFeedScoringConfig"), 0);
    v682 = objc_claimAutoreleasedReturnValue();
    v683 = (void *)v682;
    if (v682)
      v684 = (void *)v682;
    else
      v684 = v596;
    objc_storeStrong((id *)&v7->_shadowTagFeedScoringConfig, v684);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperTodayFeedScoringConfig"), 0);
    v685 = objc_claimAutoreleasedReturnValue();
    v686 = (void *)v685;
    if (v685)
      v687 = (void *)v685;
    else
      v687 = v596;
    objc_storeStrong((id *)&v7->_shadowNewspaperTodayFeedScoringConfig, v687);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMoreForYouScoringConfig"), 0);
    v688 = objc_claimAutoreleasedReturnValue();
    v689 = (void *)v688;
    if (v688)
      v690 = (void *)v688;
    else
      v690 = v596;
    objc_storeStrong((id *)&v7->_shadowMoreForYouScoringConfig, v690);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLocalSectionGroupScoringConfig"), 0);
    v691 = objc_claimAutoreleasedReturnValue();
    v692 = (void *)v691;
    if (v691)
      v693 = (void *)v691;
    else
      v693 = v596;
    objc_storeStrong((id *)&v7->_shadowLocalSectionGroupScoringConfig, v693);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperSectionGroupScoringConfig"), 0);
    v694 = objc_claimAutoreleasedReturnValue();
    v695 = (void *)v694;
    if (v694)
      v696 = (void *)v694;
    else
      v696 = v596;
    objc_storeStrong((id *)&v7->_shadowNewspaperSectionGroupScoringConfig, v696);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsEventArticlesGroupScoringConfig"), 0);
    v697 = objc_claimAutoreleasedReturnValue();
    v698 = (void *)v697;
    if (v697)
      v699 = (void *)v697;
    else
      v699 = v596;
    objc_storeStrong((id *)&v7->_shadowSportsEventArticlesGroupScoringConfig, v699);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagForYouGroupScoringConfig"), 0);
    v700 = objc_claimAutoreleasedReturnValue();
    v701 = (void *)v700;
    if (v700)
      v702 = (void *)v700;
    else
      v702 = v596;
    objc_storeStrong((id *)&v7->_shadowTagForYouGroupScoringConfig, v702);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagRecentStoriesScoringConfig"), 0);
    v703 = objc_claimAutoreleasedReturnValue();
    v704 = (void *)v703;
    if (v703)
      v705 = (void *)v703;
    else
      v705 = v596;
    objc_storeStrong((id *)&v7->_shadowTagRecentStoriesScoringConfig, v705);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagDateRangeScoringConfig"), 0);
    v706 = objc_claimAutoreleasedReturnValue();
    v707 = (void *)v706;
    if (v706)
      v708 = (void *)v706;
    else
      v708 = v596;
    objc_storeStrong((id *)&v7->_shadowTagDateRangeScoringConfig, v708);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsEventTopicGroupScoringConfig"), 0);
    v709 = objc_claimAutoreleasedReturnValue();
    v710 = (void *)v709;
    if (v709)
      v711 = (void *)v709;
    else
      v711 = v596;
    objc_storeStrong((id *)&v7->_shadowSportsEventTopicGroupScoringConfig, v711);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAffinityGroupScoringConfig"), 0);
    v712 = objc_claimAutoreleasedReturnValue();
    v713 = (void *)v712;
    if (v712)
      v714 = (void *)v712;
    else
      v714 = v596;
    objc_storeStrong((id *)&v7->_shadowAffinityGroupScoringConfig, v714);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowDefaultTopicsConfig"), 0);
    v715 = objc_claimAutoreleasedReturnValue();
    v716 = (void *)v715;
    v717 = (void *)MEMORY[0x1E0C9AA60];
    if (v715)
      v718 = (void *)v715;
    else
      v718 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_shadowDefaultTopicsConfig, v718);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTopicFeedTopicsConfig"), 0);
    v719 = objc_claimAutoreleasedReturnValue();
    v720 = (void *)v719;
    if (v719)
      v721 = (void *)v719;
    else
      v721 = v717;
    objc_storeStrong((id *)&v7->_shadowTopicFeedTopicsConfig, v721);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMagazineFeedArticleTopicsConfig"), 0);
    v722 = objc_claimAutoreleasedReturnValue();
    v723 = (void *)v722;
    if (v722)
      v724 = (void *)v722;
    else
      v724 = v717;
    objc_storeStrong((id *)&v7->_shadowMagazineFeedArticleTopicsConfig, v724);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMagazineFeedIssueTopicsConfig"), 0);
    v725 = objc_claimAutoreleasedReturnValue();
    v726 = (void *)v725;
    if (v725)
      v727 = (void *)v725;
    else
      v727 = v717;
    objc_storeStrong((id *)&v7->_shadowMagazineFeedIssueTopicsConfig, v727);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAudioFeedTopicsConfig"), 0);
    v728 = objc_claimAutoreleasedReturnValue();
    v729 = (void *)v728;
    if (v728)
      v730 = (void *)v728;
    else
      v730 = v717;
    objc_storeStrong((id *)&v7->_shadowLegacyAudioFeedTopicsConfig, v730);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAudioFeed2TopicsConfig"), 0);
    v731 = objc_claimAutoreleasedReturnValue();
    v732 = (void *)v731;
    if (v731)
      v733 = (void *)v731;
    else
      v733 = v717;
    objc_storeStrong((id *)&v7->_shadowAudioFeedTopicsConfig, v733);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationPrimaryTopicsConfig"), 0);
    v734 = objc_claimAutoreleasedReturnValue();
    v735 = (void *)v734;
    if (v734)
      v736 = (void *)v734;
    else
      v736 = v717;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationPrimaryTopicsConfig, v736);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationSecondaryTopicsConfig"), 0);
    v737 = objc_claimAutoreleasedReturnValue();
    v738 = (void *)v737;
    if (v737)
      v739 = (void *)v737;
    else
      v739 = v717;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationSecondaryTopicsConfig, v739);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationTertiaryTopicsConfig"), 0);
    v740 = objc_claimAutoreleasedReturnValue();
    v741 = (void *)v740;
    if (v740)
      v742 = (void *)v740;
    else
      v742 = v717;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationTertiaryTopicsConfig, v742);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationQuaternaryTopicsConfig"), 0);
    v743 = objc_claimAutoreleasedReturnValue();
    v744 = (void *)v743;
    if (v743)
      v745 = (void *)v743;
    else
      v745 = v717;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationQuaternaryTopicsConfig, v745);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowBestOfBundleTopicsConfig"), 0);
    v746 = objc_claimAutoreleasedReturnValue();
    v747 = (void *)v746;
    if (v746)
      v748 = (void *)v746;
    else
      v748 = v717;
    objc_storeStrong((id *)&v7->_shadowBestOfBundleTopicsConfig, v748);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowCuratedTopicsConfig"), 0);
    v749 = objc_claimAutoreleasedReturnValue();
    v750 = (void *)v749;
    if (v749)
      v751 = (void *)v749;
    else
      v751 = v717;
    objc_storeStrong((id *)&v7->_shadowCuratedTopicsConfig, v751);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowCuratedIssuesTopicsConfig"), 0);
    v752 = objc_claimAutoreleasedReturnValue();
    v753 = (void *)v752;
    if (v752)
      v754 = (void *)v752;
    else
      v754 = v717;
    objc_storeStrong((id *)&v7->_shadowCuratedIssuesTopicsConfig, v754);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowForYouTopicsConfig"), 0);
    v755 = objc_claimAutoreleasedReturnValue();
    v756 = (void *)v755;
    if (v755)
      v757 = (void *)v755;
    else
      v757 = v717;
    objc_storeStrong((id *)&v7->_shadowForYouTopicsConfig, v757);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowGreatStoriesYouMissedTopicsConfig"), 0);
    v758 = objc_claimAutoreleasedReturnValue();
    v759 = (void *)v758;
    if (v758)
      v760 = (void *)v758;
    else
      v760 = v717;
    objc_storeStrong((id *)&v7->_shadowGreatStoriesYouMissedTopicsConfig, v760);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLatestStoriesTopicsConfig"), 0);
    v761 = objc_claimAutoreleasedReturnValue();
    v762 = (void *)v761;
    if (v761)
      v763 = (void *)v761;
    else
      v763 = v717;
    objc_storeStrong((id *)&v7->_shadowLatestStoriesTopicsConfig, v763);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLocalNewsTopicsConfig"), 0);
    v764 = objc_claimAutoreleasedReturnValue();
    v765 = (void *)v764;
    if (v764)
      v766 = (void *)v764;
    else
      v766 = v717;
    objc_storeStrong((id *)&v7->_shadowLocalNewsTopicsConfig, v766);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperMagazineFeedTopicsConfig"), 0);
    v767 = objc_claimAutoreleasedReturnValue();
    v768 = (void *)v767;
    if (v767)
      v769 = (void *)v767;
    else
      v769 = v717;
    objc_storeStrong((id *)&v7->_shadowNewspaperMagazineFeedTopicsConfig, v769);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTodayWidgetTopicsConfig"), 0);
    v770 = objc_claimAutoreleasedReturnValue();
    v771 = (void *)v770;
    if (v770)
      v772 = (void *)v770;
    else
      v772 = v717;
    objc_storeStrong((id *)&v7->_shadowTodayWidgetTopicsConfig, v772);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagWidgetTopicsConfig"), 0);
    v773 = objc_claimAutoreleasedReturnValue();
    v774 = (void *)v773;
    if (v773)
      v775 = (void *)v773;
    else
      v775 = v717;
    objc_storeStrong((id *)&v7->_shadowTagWidgetTopicsConfig, v775);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsGroupTopicsConfig"), 0);
    v776 = objc_claimAutoreleasedReturnValue();
    v777 = (void *)v776;
    if (v776)
      v778 = (void *)v776;
    else
      v778 = v717;
    objc_storeStrong((id *)&v7->_shadowMySportsGroupTopicsConfig, v778);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsGroupForYouTopicsConfig"), 0);
    v779 = objc_claimAutoreleasedReturnValue();
    v780 = (void *)v779;
    if (v779)
      v781 = (void *)v779;
    else
      v781 = v717;
    objc_storeStrong((id *)&v7->_shadowMySportsGroupForYouTopicsConfig, v781);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsTopicsTopicsConfig"), 0);
    v782 = objc_claimAutoreleasedReturnValue();
    v783 = (void *)v782;
    if (v782)
      v784 = (void *)v782;
    else
      v784 = v717;
    objc_storeStrong((id *)&v7->_shadowMySportsTopicsTopicsConfig, v784);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsTopStoriesTopicsConfig"), 0);
    v785 = objc_claimAutoreleasedReturnValue();
    v786 = (void *)v785;
    if (v785)
      v787 = (void *)v785;
    else
      v787 = v717;
    objc_storeStrong((id *)&v7->_shadowSportsTopStoriesTopicsConfig, v787);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowIntroToSportsGroupTopicsConfig"), 0);
    v788 = objc_claimAutoreleasedReturnValue();
    v789 = (void *)v788;
    if (v788)
      v790 = (void *)v788;
    else
      v790 = v717;
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupTopicsConfig, v790);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowIntroToSportsGroupForYouTopicsConfig"), 0);
    v791 = objc_claimAutoreleasedReturnValue();
    v792 = (void *)v791;
    if (v791)
      v793 = (void *)v791;
    else
      v793 = v717;
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupForYouTopicsConfig, v793);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowHighlightsGroupTopicsConfig"), 0);
    v794 = objc_claimAutoreleasedReturnValue();
    v795 = (void *)v794;
    if (v794)
      v796 = (void *)v794;
    else
      v796 = v717;
    objc_storeStrong((id *)&v7->_shadowHighlightsGroupTopicsConfig, v796);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleListTagFeedGroupTopicsConfig"), 0);
    v797 = objc_claimAutoreleasedReturnValue();
    v798 = (void *)v797;
    if (v797)
      v799 = (void *)v797;
    else
      v799 = v717;
    objc_storeStrong((id *)&v7->_shadowArticleListTagFeedGroupTopicsConfig, v799);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagFeedTopicsConfig"), 0);
    v800 = objc_claimAutoreleasedReturnValue();
    v801 = (void *)v800;
    if (v800)
      v802 = (void *)v800;
    else
      v802 = v717;
    objc_storeStrong((id *)&v7->_shadowTagFeedTopicsConfig, v802);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperTodayFeedTopicsConfig"), 0);
    v803 = objc_claimAutoreleasedReturnValue();
    v804 = (void *)v803;
    if (v803)
      v805 = (void *)v803;
    else
      v805 = v717;
    objc_storeStrong((id *)&v7->_shadowNewspaperTodayFeedTopicsConfig, v805);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMoreForYouTopicsConfig"), 0);
    v806 = objc_claimAutoreleasedReturnValue();
    v807 = (void *)v806;
    if (v806)
      v808 = (void *)v806;
    else
      v808 = v717;
    objc_storeStrong((id *)&v7->_shadowMoreForYouTopicsConfig, v808);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLocalSectionGroupTopicsConfig"), 0);
    v809 = objc_claimAutoreleasedReturnValue();
    v810 = (void *)v809;
    if (v809)
      v811 = (void *)v809;
    else
      v811 = v717;
    objc_storeStrong((id *)&v7->_shadowLocalSectionGroupTopicsConfig, v811);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperSectionGroupTopicsConfig"), 0);
    v812 = objc_claimAutoreleasedReturnValue();
    v813 = (void *)v812;
    if (v812)
      v814 = (void *)v812;
    else
      v814 = v717;
    objc_storeStrong((id *)&v7->_shadowNewspaperSectionGroupTopicsConfig, v814);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsEventArticlesGroupTopicsConfig"), 0);
    v815 = objc_claimAutoreleasedReturnValue();
    v816 = (void *)v815;
    if (v815)
      v817 = (void *)v815;
    else
      v817 = v717;
    objc_storeStrong((id *)&v7->_shadowSportsEventArticlesGroupTopicsConfig, v817);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagForYouGroupTopicsConfig"), 0);
    v818 = objc_claimAutoreleasedReturnValue();
    v819 = (void *)v818;
    if (v818)
      v820 = (void *)v818;
    else
      v820 = v717;
    objc_storeStrong((id *)&v7->_shadowTagForYouGroupTopicsConfig, v820);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagRecentStoriesTopicsConfig"), 0);
    v821 = objc_claimAutoreleasedReturnValue();
    v822 = (void *)v821;
    if (v821)
      v823 = (void *)v821;
    else
      v823 = v717;
    objc_storeStrong((id *)&v7->_shadowTagRecentStoriesTopicsConfig, v823);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagDateRangeTopicsConfig"), 0);
    v824 = objc_claimAutoreleasedReturnValue();
    v825 = (void *)v824;
    if (v824)
      v826 = (void *)v824;
    else
      v826 = v717;
    objc_storeStrong((id *)&v7->_shadowTagDateRangeTopicsConfig, v826);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsEventTopicGroupTopicsConfig"), 0);
    v827 = objc_claimAutoreleasedReturnValue();
    v828 = (void *)v827;
    if (v827)
      v829 = (void *)v827;
    else
      v829 = v717;
    objc_storeStrong((id *)&v7->_shadowSportsEventTopicGroupTopicsConfig, v829);

    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAffinityGroupTopicsConfig"), 0);
    v830 = objc_claimAutoreleasedReturnValue();
    v831 = (void *)v830;
    if (v830)
      v832 = (void *)v830;
    else
      v832 = v717;
    objc_storeStrong((id *)&v7->_shadowAffinityGroupTopicsConfig, v832);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowDefaultOntologyLevelConfig"), 0);
    v833 = objc_claimAutoreleasedReturnValue();
    v834 = (void *)v833;
    if (v833)
      v835 = (void *)v833;
    else
      v835 = v596;
    objc_storeStrong((id *)&v7->_shadowDefaultOntologyLevelConfig, v835);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTopicFeedOntologyLevelConfig"), 0);
    v836 = objc_claimAutoreleasedReturnValue();
    v837 = (void *)v836;
    if (v836)
      v838 = (void *)v836;
    else
      v838 = v596;
    objc_storeStrong((id *)&v7->_shadowTopicFeedOntologyLevelConfig, v838);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMagazineFeedArticleOntologyLevelConfig"), 0);
    v839 = objc_claimAutoreleasedReturnValue();
    v840 = (void *)v839;
    if (v839)
      v841 = (void *)v839;
    else
      v841 = v596;
    objc_storeStrong((id *)&v7->_shadowMagazineFeedArticleOntologyLevelConfig, v841);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMagazineFeedIssueOntologyLevelConfig"), 0);
    v842 = objc_claimAutoreleasedReturnValue();
    v843 = (void *)v842;
    if (v842)
      v844 = (void *)v842;
    else
      v844 = v596;
    objc_storeStrong((id *)&v7->_shadowMagazineFeedIssueOntologyLevelConfig, v844);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAudioFeedOntologyLevelConfig"), 0);
    v845 = objc_claimAutoreleasedReturnValue();
    v846 = (void *)v845;
    if (v845)
      v847 = (void *)v845;
    else
      v847 = v596;
    objc_storeStrong((id *)&v7->_shadowLegacyAudioFeedOntologyLevelConfig, v847);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAudioFeed2OntologyLevelConfig"), 0);
    v848 = objc_claimAutoreleasedReturnValue();
    v849 = (void *)v848;
    if (v848)
      v850 = (void *)v848;
    else
      v850 = v596;
    objc_storeStrong((id *)&v7->_shadowAudioFeedOntologyLevelConfig, v850);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationPrimaryOntologyLevelConfig"), 0);
    v851 = objc_claimAutoreleasedReturnValue();
    v852 = (void *)v851;
    if (v851)
      v853 = (void *)v851;
    else
      v853 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationPrimaryOntologyLevelConfig, v853);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationSecondaryOntologyLevelConfig"), 0);
    v854 = objc_claimAutoreleasedReturnValue();
    v855 = (void *)v854;
    if (v854)
      v856 = (void *)v854;
    else
      v856 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationSecondaryOntologyLevelConfig, v856);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationTertiaryOntologyLevelConfig"), 0);
    v857 = objc_claimAutoreleasedReturnValue();
    v858 = (void *)v857;
    if (v857)
      v859 = (void *)v857;
    else
      v859 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationTertiaryOntologyLevelConfig, v859);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleRecirculationQuaternaryOntologyLevelConfig"), 0);
    v860 = objc_claimAutoreleasedReturnValue();
    v861 = (void *)v860;
    if (v860)
      v862 = (void *)v860;
    else
      v862 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleRecirculationQuaternaryOntologyLevelConfig, v862);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowBestOfBundleOntologyLevelConfig"), 0);
    v863 = objc_claimAutoreleasedReturnValue();
    v864 = (void *)v863;
    if (v863)
      v865 = (void *)v863;
    else
      v865 = v596;
    objc_storeStrong((id *)&v7->_shadowBestOfBundleOntologyLevelConfig, v865);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowCuratedOntologyLevelConfig"), 0);
    v866 = objc_claimAutoreleasedReturnValue();
    v867 = (void *)v866;
    if (v866)
      v868 = (void *)v866;
    else
      v868 = v596;
    objc_storeStrong((id *)&v7->_shadowCuratedOntologyLevelConfig, v868);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowCuratedIssuesOntologyLevelConfig"), 0);
    v869 = objc_claimAutoreleasedReturnValue();
    v870 = (void *)v869;
    if (v869)
      v871 = (void *)v869;
    else
      v871 = v596;
    objc_storeStrong((id *)&v7->_shadowCuratedIssuesOntologyLevelConfig, v871);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowForYouOntologyLevelConfig"), 0);
    v872 = objc_claimAutoreleasedReturnValue();
    v873 = (void *)v872;
    if (v872)
      v874 = (void *)v872;
    else
      v874 = v596;
    objc_storeStrong((id *)&v7->_shadowForYouOntologyLevelConfig, v874);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowGreatStoriesYouMissedOntologyLevelConfig"), 0);
    v875 = objc_claimAutoreleasedReturnValue();
    v876 = (void *)v875;
    if (v875)
      v877 = (void *)v875;
    else
      v877 = v596;
    objc_storeStrong((id *)&v7->_shadowGreatStoriesYouMissedOntologyLevelConfig, v877);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLatestStoriesOntologyLevelConfig"), 0);
    v878 = objc_claimAutoreleasedReturnValue();
    v879 = (void *)v878;
    if (v878)
      v880 = (void *)v878;
    else
      v880 = v596;
    objc_storeStrong((id *)&v7->_shadowLatestStoriesOntologyLevelConfig, v880);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLocalNewsOntologyLevelConfig"), 0);
    v881 = objc_claimAutoreleasedReturnValue();
    v882 = (void *)v881;
    if (v881)
      v883 = (void *)v881;
    else
      v883 = v596;
    objc_storeStrong((id *)&v7->_shadowLocalNewsOntologyLevelConfig, v883);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperMagazineFeedOntologyLevelConfig"), 0);
    v884 = objc_claimAutoreleasedReturnValue();
    v885 = (void *)v884;
    if (v884)
      v886 = (void *)v884;
    else
      v886 = v596;
    objc_storeStrong((id *)&v7->_shadowNewspaperMagazineFeedOntologyLevelConfig, v886);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTodayWidgetOntologyLevelConfig"), 0);
    v887 = objc_claimAutoreleasedReturnValue();
    v888 = (void *)v887;
    if (v887)
      v889 = (void *)v887;
    else
      v889 = v596;
    objc_storeStrong((id *)&v7->_shadowTodayWidgetOntologyLevelConfig, v889);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagWidgetOntologyLevelConfig"), 0);
    v890 = objc_claimAutoreleasedReturnValue();
    v891 = (void *)v890;
    if (v890)
      v892 = (void *)v890;
    else
      v892 = v596;
    objc_storeStrong((id *)&v7->_shadowTagWidgetOntologyLevelConfig, v892);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsGroupOntologyLevelConfig"), 0);
    v893 = objc_claimAutoreleasedReturnValue();
    v894 = (void *)v893;
    if (v893)
      v895 = (void *)v893;
    else
      v895 = v596;
    objc_storeStrong((id *)&v7->_shadowMySportsGroupOntologyLevelConfig, v895);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsGroupForYouOntologyLevelConfig"), 0);
    v896 = objc_claimAutoreleasedReturnValue();
    v897 = (void *)v896;
    if (v896)
      v898 = (void *)v896;
    else
      v898 = v596;
    objc_storeStrong((id *)&v7->_shadowMySportsGroupForYouOntologyLevelConfig, v898);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMySportsTopicsOntologyLevelConfig"), 0);
    v899 = objc_claimAutoreleasedReturnValue();
    v900 = (void *)v899;
    if (v899)
      v901 = (void *)v899;
    else
      v901 = v596;
    objc_storeStrong((id *)&v7->_shadowMySportsTopicsOntologyLevelConfig, v901);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsTopStoriesOntologyLevelConfig"), 0);
    v902 = objc_claimAutoreleasedReturnValue();
    v903 = (void *)v902;
    if (v902)
      v904 = (void *)v902;
    else
      v904 = v596;
    objc_storeStrong((id *)&v7->_shadowSportsTopStoriesOntologyLevelConfig, v904);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowIntroToSportsGroupOntologyLevelConfig"), 0);
    v905 = objc_claimAutoreleasedReturnValue();
    v906 = (void *)v905;
    if (v905)
      v907 = (void *)v905;
    else
      v907 = v596;
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupOntologyLevelConfig, v907);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowIntroToSportsGroupForYouOntologyLevelConfig"), 0);
    v908 = objc_claimAutoreleasedReturnValue();
    v909 = (void *)v908;
    if (v908)
      v910 = (void *)v908;
    else
      v910 = v596;
    objc_storeStrong((id *)&v7->_shadowIntroToSportsGroupForYouOntologyLevelConfig, v910);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowHighlightsGroupOntologyLevelConfig"), 0);
    v911 = objc_claimAutoreleasedReturnValue();
    v912 = (void *)v911;
    if (v911)
      v913 = (void *)v911;
    else
      v913 = v596;
    objc_storeStrong((id *)&v7->_shadowHighlightsGroupOntologyLevelConfig, v913);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowArticleListTagFeedGroupOntologyLevelConfig"), 0);
    v914 = objc_claimAutoreleasedReturnValue();
    v915 = (void *)v914;
    if (v914)
      v916 = (void *)v914;
    else
      v916 = v596;
    objc_storeStrong((id *)&v7->_shadowArticleListTagFeedGroupOntologyLevelConfig, v916);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagFeedOntologyLevelConfig"), 0);
    v917 = objc_claimAutoreleasedReturnValue();
    v918 = (void *)v917;
    if (v917)
      v919 = (void *)v917;
    else
      v919 = v596;
    objc_storeStrong((id *)&v7->_shadowTagFeedOntologyLevelConfig, v919);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperTodayFeedOntologyLevelConfig"), 0);
    v920 = objc_claimAutoreleasedReturnValue();
    v921 = (void *)v920;
    if (v920)
      v922 = (void *)v920;
    else
      v922 = v596;
    objc_storeStrong((id *)&v7->_shadowNewspaperTodayFeedOntologyLevelConfig, v922);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowMoreForYouOntologyLevelConfig"), 0);
    v923 = objc_claimAutoreleasedReturnValue();
    v924 = (void *)v923;
    if (v923)
      v925 = (void *)v923;
    else
      v925 = v596;
    objc_storeStrong((id *)&v7->_shadowMoreForYouOntologyLevelConfig, v925);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowLocalSectionGroupOntologyLevelConfig"), 0);
    v926 = objc_claimAutoreleasedReturnValue();
    v927 = (void *)v926;
    if (v926)
      v928 = (void *)v926;
    else
      v928 = v596;
    objc_storeStrong((id *)&v7->_shadowLocalSectionGroupOntologyLevelConfig, v928);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowNewspaperSectionGroupOntologyLevelConfig"), 0);
    v929 = objc_claimAutoreleasedReturnValue();
    v930 = (void *)v929;
    if (v929)
      v931 = (void *)v929;
    else
      v931 = v596;
    objc_storeStrong((id *)&v7->_shadowNewspaperSectionGroupOntologyLevelConfig, v931);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsEventArticlesGroupOntologyLevelConfig"), 0);
    v932 = objc_claimAutoreleasedReturnValue();
    v933 = (void *)v932;
    if (v932)
      v934 = (void *)v932;
    else
      v934 = v596;
    objc_storeStrong((id *)&v7->_shadowSportsEventArticlesGroupOntologyLevelConfig, v934);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagForYouGroupOntologyLevelConfig"), 0);
    v935 = objc_claimAutoreleasedReturnValue();
    v936 = (void *)v935;
    if (v935)
      v937 = (void *)v935;
    else
      v937 = v596;
    objc_storeStrong((id *)&v7->_shadowTagForYouGroupOntologyLevelConfig, v937);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagRecentStoriesOntologyLevelConfig"), 0);
    v938 = objc_claimAutoreleasedReturnValue();
    v939 = (void *)v938;
    if (v938)
      v940 = (void *)v938;
    else
      v940 = v596;
    objc_storeStrong((id *)&v7->_shadowTagRecentStoriesOntologyLevelConfig, v940);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowTagDateRangeOntologyLevelConfig"), 0);
    v941 = objc_claimAutoreleasedReturnValue();
    v942 = (void *)v941;
    if (v941)
      v943 = (void *)v941;
    else
      v943 = v596;
    objc_storeStrong((id *)&v7->_shadowTagDateRangeOntologyLevelConfig, v943);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowSportsEventTopicGroupOntologyLevelConfig"), 0);
    v944 = objc_claimAutoreleasedReturnValue();
    v945 = (void *)v944;
    if (v944)
      v946 = (void *)v944;
    else
      v946 = v596;
    objc_storeStrong((id *)&v7->_shadowSportsEventTopicGroupOntologyLevelConfig, v946);

    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("shadowAffinityGroupOntologyLevelConfig"), 0);
    v947 = objc_claimAutoreleasedReturnValue();
    v948 = (void *)v947;
    if (v947)
      v949 = (void *)v947;
    else
      v949 = v596;
    objc_storeStrong((id *)&v7->_shadowAffinityGroupOntologyLevelConfig, v949);

    v950 = [FCPersonalizationTagScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("defaultTagScoringConfig"), 0);
    v951 = (void *)objc_claimAutoreleasedReturnValue();
    v952 = -[FCPersonalizationTagScoringConfig initWithConfigDictionary:](v950, "initWithConfigDictionary:", v951);
    defaultTagScoringConfig = v7->_defaultTagScoringConfig;
    v7->_defaultTagScoringConfig = (FCPersonalizationTagScoringConfig *)v952;

    v954 = [FCPersonalizationTagScoringConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("sportsTagScoringConfig"), 0);
    v955 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationTreatment defaultTagScoringConfig](v7, "defaultTagScoringConfig");
    v956 = (void *)objc_claimAutoreleasedReturnValue();
    v957 = -[FCPersonalizationTagScoringConfig initWithConfigDictionary:defaultConfig:](v954, "initWithConfigDictionary:defaultConfig:", v955, v956);
    sportsTagScoringConfig = v7->_sportsTagScoringConfig;
    v7->_sportsTagScoringConfig = (FCPersonalizationTagScoringConfig *)v957;

    v959 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateMinimum"), 4.0);
    if (v959 < 0.0)
      v959 = 4.0;
    v7->_hourlyFlowRateMinimum = v959;
    v960 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateSubscriptionCountBuffer"), 0.0);
    if (v960 < 0.0)
      v960 = 0.0;
    v7->_hourlyFlowRateSubscriptionCountBuffer = v960;
    v961 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateDampeningFactor"), 2.0);
    if (v961 <= 0.0)
      v961 = 2.0;
    v7->_hourlyFlowRateDampeningFactor = v961;
    v962 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRatePerSubscription"), 1.0);
    if (v962 < 0.0)
      v962 = 1.0;
    v7->_hourlyFlowRatePerSubscription = v962;
    v963 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("extraHeadlinesToShowTheUser"), 0.0);
    if (v963 < 0.0)
      v963 = 0.0;
    v7->_extraArticlesToShowUser = (uint64_t)v963;
    v964 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateAlpha"), 0.535544906);
    if (v964 <= 0.0)
      v964 = 0.535544906;
    v7->_hourlyFlowRateAlpha = v964;
    v965 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateBeta"), 0.464455094);
    if (v965 <= 0.0)
      v965 = 0.464455094;
    v7->_hourlyFlowRateBeta = v965;
    v7->_hourlyFlowRateGamma = fmax(FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateGamma"), 0.0), 0.0);
    v966 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("flowRateDecayFactor"), 0.99);
    if (v966 >= 1.0 || v966 < 0.0)
      v966 = 0.99;
    v7->_hourlyFlowRateDecayFactor = v966;
    v968 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("flowRatePriorWeight"), 1.0);
    if (v968 < 0.0)
      v968 = 1.0;
    v7->_hourlyFlowRatePriorWeight = v968;
    v969 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateFloor"), 1.0);
    if (v969 < 0.0)
      v969 = 1.0;
    v7->_hourlyFlowRateFloor = v969;
    v970 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("hourlyFlowRateCeiling"), 416.66);
    if (v970 < 0.0)
      v970 = 416.66;
    v7->_hourlyFlowRateCeiling = v970;
    v971 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("baselineImpressionPrior"), 60.0);
    if (v971 < 0.0)
      v971 = 60.0;
    v7->_baselineImpressionPrior = v971;
    v972 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("featureImpressionPrior"), 0.0);
    if (v972 < 0.0)
      v972 = 0.0;
    v7->_featureImpressionPrior = v972;
    v973 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("articleLengthLongThreshold"), 5000.0);
    if (v973 < 0.0)
      v973 = 5000.0;
    v7->_articleLengthLongThreshold = v973;
    v974 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("articleLengthMediumThreshold"), 2000.0);
    if (v974 < 0.0)
      v974 = 2000.0;
    v7->_articleLengthMediumThreshold = v974;
    v975 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("publisherTopicIDEventCountMinimum"), 5);
    v976 = (uint64_t)(double)v975;
    if (v975 < 0)
      v976 = 5;
    v7->_publisherTopicIDEventCountMinimum = v976;
    v977 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherDiversificationPenalty"), 0.2);
    if (v977 > 1.0 || v977 < 0.0)
      v977 = 0.2;
    v7->_publisherDiversificationPenalty = v977;
    v979 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherDiversificationInitialPenalty"), 0.4);
    if (v979 > 1.0 || v979 < 0.0)
      v979 = 0.4;
    v7->_publisherDiversificationInitialPenalty = v979;
    v981 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherDiversificationPenaltyHalfLife"), 200.0);
    if (v981 <= 0.0)
      v981 = 200.0;
    v7->_publisherDiversificationPenaltyHalfLife = v981;
    v982 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("heavyClickMinimumDuration"), 7.0);
    if (v982 < 0.0)
      v982 = 7.0;
    v7->_heavyClickMinimumDuration = v982;
    v983 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackVisitedMinimumDuration"), 10.0);
    if (v983 < 0.0)
      v983 = 10.0;
    v7->_trackVisitedMinimumDuration = (uint64_t)v983;
    v984 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackListenedMinimumDuration"), 30.0);
    if (v984 < 0.0)
      v984 = 30.0;
    v7->_trackListenedMinimumDuration = (uint64_t)v984;
    v985 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("swipeToArticleWeakClickMinimumDuration"), 4.0);
    if (v985 < 0.0)
      v985 = 4.0;
    v7->_swipeToArticleWeakClickMinimumDuration = v985;
    v986 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("swipeToArticleHeavyClickMinimumDuration"), 10.0);
    if (v986 < 0.0)
      v986 = 10.0;
    v7->_swipeToArticleHeavyClickMinimumDuration = v986;
    v987 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("lowQualityContentThreshold"), 0.2);
    if (v987 > 1.0 || v987 < 0.0)
      v987 = 0.2;
    v7->_lowQualityContentThreshold = v987;
    v989 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("sportsTagSeenMinimumDuration"), 3.0);
    if (v989 < 0.0)
      v989 = 3.0;
    v7->_sportsTagSeenMinimumDuration = v989;
    v7->_sportsTagSeenEnableFeedSource = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("sportsTagSeenEnableFeedSource"), 0);
    v7->_sportsTagSeenEnableSportsManagementSource = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("sportsTagSeenEnableSportsManagementSource"), 1);
    v7->_sportsTagSeenEnableSportsManagementDetailSource = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("sportsTagSeenEnableSportsManagementDetailSource"), 1);
    v990 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("thumbnailMinHammingDistance"), 37);
    v991 = (uint64_t)(double)v990;
    if (v990 <= 0)
      v991 = 37;
    v7->_thumbnailMinHammingDistance = v991;
    v992 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("presentationImpressionValue"), 1.0);
    if (v992 < 0.0)
      v992 = 1.0;
    v7->_presentationImpressionValue = v992;
    v993 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("heavyClickImpressionValue"), 3.0);
    if (v993 < 0.0)
      v993 = 3.0;
    v7->_heavyClickImpressionValue = v993;
    v994 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("likeImpressionValue"), 2.0);
    if (v994 < 0.0)
      v994 = 2.0;
    v7->_likeImpressionValue = v994;
    v995 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("shareImpressionValue"), 2.0);
    if (v995 < 0.0)
      v995 = 2.0;
    v7->_shareImpressionValue = v995;
    v996 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("savedImpressionValue"), 1.0);
    if (v996 < 0.0)
      v996 = 1.0;
    v7->_savedImpressionValue = v996;
    v997 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeImpressionValue"), 10.0);
    if (v997 < 0.0)
      v997 = 10.0;
    v7->_subscribeImpressionValue = v997;
    v998 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeRelatedImpressionValue"), 0.0);
    if (v998 < 0.0)
      v998 = 0.0;
    v7->_subscribeRelatedImpressionValue = v998;
    v999 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionImpressionValue"), 5.0);
    if (v999 < 0.0)
      v999 = 5.0;
    v7->_existingSubscriptionImpressionValue = v999;
    v1000 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionRelatedImpressionValue"), 0.0);
    if (v1000 < 0.0)
      v1000 = 0.0;
    v7->_existingSubscriptionRelatedImpressionValue = v1000;
    v1001 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("tappedImpressionValue"), 0.0);
    if (v1001 < 0.0)
      v1001 = 0.0;
    v7->_tappedImpressionValue = v1001;
    v1002 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("weakClickImpressionValue"), 0.0);
    if (v1002 < 0.0)
      v1002 = 0.0;
    v7->_weakClickImpressionValue = v1002;
    v1003 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unsubscribeImpressionValue"), 0.0);
    if (v1003 < 0.0)
      v1003 = 0.0;
    v7->_unsubscribeImpressionValue = v1003;
    v1004 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("visitImpressionValue"), 3.0);
    if (v1004 < 0.0)
      v1004 = 3.0;
    v7->_visitImpressionValue = v1004;
    v1005 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("dislikeImpressionValue"), 50.0);
    if (v1005 < 0.0)
      v1005 = 50.0;
    v7->_dislikeImpressionValue = v1005;
    v1006 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationFeedImpressionValue"), 0.0);
    if (v1006 < 0.0)
      v1006 = 0.0;
    v7->_recommendationPresentationFeedImpressionValue = v1006;
    v1007 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationExploreImpressionValue"), 4.0);
    if (v1007 < 0.0)
      v1007 = 4.0;
    v7->_recommendationPresentationExploreImpressionValue = v1007;
    v1008 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("premiumSubscriptionActivationImpressionValue"), 25.0);
    if (v1008 < 0.0)
      v1008 = 25.0;
    v7->_premiumSubscriptionActivationImpressionValue = v1008;
    v1009 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("muteImpressionValue"), 50.0);
    if (v1009 < 0.0)
      v1009 = 50.0;
    v7->_muteImpressionValue = v1009;
    v1010 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unmuteImpressionValue"), 0.0);
    if (v1010 < 0.0)
      v1010 = 0.0;
    v7->_unmuteImpressionValue = v1010;
    v1011 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoInitiatePlaybackImpressionValue"), 1.0);
    if (v1011 < 0.0)
      v1011 = 1.0;
    v7->_videoInitiatePlaybackImpressionValue = v1011;
    v1012 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoCompletePlaybackImpressionValue"), 2.0);
    if (v1012 < 0.0)
      v1012 = 2.0;
    v7->_videoCompletePlaybackImpressionValue = v1012;
    v1013 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete25ImpressionValue"), 0.0);
    if (v1013 < 0.0)
      v1013 = 0.0;
    v7->_videoComplete25ImpressionValue = v1013;
    v1014 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete50ImpressionValue"), 0.0);
    if (v1014 < 0.0)
      v1014 = 0.0;
    v7->_videoComplete50ImpressionValue = v1014;
    v1015 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete75ImpressionValue"), 0.0);
    if (v1015 < 0.0)
      v1015 = 0.0;
    v7->_videoComplete75ImpressionValue = v1015;
    v1016 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetPresentationImpressionValue"), 0.0);
    if (v1016 < 0.0)
      v1016 = 0.0;
    v7->_newsTodayWidgetPresentationImpressionValue = v1016;
    v1017 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetClickImpressionValue"), 0.0);
    if (v1017 < 0.0)
      v1017 = 0.0;
    v7->_newsTodayWidgetClickImpressionValue = v1017;
    v1018 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetVideoPlaybackImpressionValue"), 0.0);
    if (v1018 < 0.0)
      v1018 = 0.0;
    v7->_newsTodayWidgetVideoPlaybackImpressionValue = v1018;
    v1019 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInstallImpressionValue"), 0.0);
    if (v1019 < 0.0)
      v1019 = 0.0;
    v7->_appInstallImpressionValue = v1019;
    v1020 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInFocusImpressionValue"), 0.0);
    if (v1020 < 0.0)
      v1020 = 0.0;
    v7->_appInFocusImpressionValue = v1020;
    v1021 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariHistoryImpressionValue"), 0.0);
    if (v1021 < 0.0)
      v1021 = 0.0;
    v7->_safariHistoryImpressionValue = v1021;
    v1022 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForSourceMoreFromFeedImpressionValue"), 0.0);
    if (v1022 < 0.0)
      v1022 = 0.0;
    v7->_publisherBoostForSourceMoreFromFeedImpressionValue = v1022;
    v1023 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicBoostForSourceRelatedFeedImpressionValue"), 0.0);
    if (v1023 < 0.0)
      v1023 = 0.0;
    v7->_topicBoostForSourceRelatedFeedImpressionValue = v1023;
    v1024 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForIssueOpenImpressionValue"), 0.0);
    if (v1024 < 0.0)
      v1024 = 0.0;
    v7->_publisherBoostForIssueOpenImpressionValue = v1024;
    v1025 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackVisitedImpressionValue"), 1.0);
    if (v1025 < 0.0)
      v1025 = 1.0;
    v7->_trackVisitedImpressionValue = v1025;
    v1026 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackListenedImpressionValue"), 3.0);
    if (v1026 < 0.0)
      v1026 = 3.0;
    v7->_trackListenedImpressionValue = v1026;
    v1027 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackFinishedImpressionValue"), 10.0);
    if (v1027 < 0.0)
      v1027 = 10.0;
    v7->_trackFinishedImpressionValue = v1027;
    v1028 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("sportsTagSeenImpressionValue"), 1.0);
    if (v1028 < 0.0)
      v1028 = 1.0;
    v7->_sportsTagSeenImpressionValue = v1028;
    v1029 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("ignoreImpressionValue"), 50.0);
    if (v1029 < 0.0)
      v1029 = 50.0;
    v7->_ignoreImpressionValue = v1029;
    v1030 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("presentationBaselineImpressionValue"), 1.0);
    if (v1030 < 0.0)
      v1030 = 1.0;
    v7->_presentationBaselineImpressionValue = v1030;
    v1031 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("heavyClickBaselineImpressionValue"), 0.0);
    if (v1031 < 0.0)
      v1031 = 0.0;
    v7->_heavyClickBaselineImpressionValue = v1031;
    v1032 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("likeBaselineImpressionValue"), 0.0);
    if (v1032 < 0.0)
      v1032 = 0.0;
    v7->_likeBaselineImpressionValue = v1032;
    v1033 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("shareBaselineImpressionValue"), 0.0);
    if (v1033 < 0.0)
      v1033 = 0.0;
    v7->_shareBaselineImpressionValue = v1033;
    v1034 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("savedBaselineImpressionValue"), 0.0);
    if (v1034 < 0.0)
      v1034 = 0.0;
    v7->_savedBaselineImpressionValue = v1034;
    v1035 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeBaselineImpressionValue"), 0.0);
    if (v1035 < 0.0)
      v1035 = 0.0;
    v7->_subscribeBaselineImpressionValue = v1035;
    v1036 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeRelatedBaselineImpressionValue"), 0.0);
    if (v1036 < 0.0)
      v1036 = 0.0;
    v7->_subscribeRelatedBaselineImpressionValue = v1036;
    v1037 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionBaselineImpressionValue"), 0.0);
    if (v1037 < 0.0)
      v1037 = 0.0;
    v7->_existingSubscriptionBaselineImpressionValue = v1037;
    v1038 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionRelatedBaselineImpressionValue"), 0.0);
    if (v1038 < 0.0)
      v1038 = 0.0;
    v7->_existingSubscriptionRelatedBaselineImpressionValue = v1038;
    v1039 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("tappedBaselineImpressionValue"), 0.0);
    if (v1039 < 0.0)
      v1039 = 0.0;
    v7->_tappedBaselineImpressionValue = v1039;
    v1040 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("weakClickBaselineImpressionValue"), 0.0);
    if (v1040 < 0.0)
      v1040 = 0.0;
    v7->_weakClickBaselineImpressionValue = v1040;
    v1041 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unsubscribeBaselineImpressionValue"), 0.0);
    if (v1041 < 0.0)
      v1041 = 0.0;
    v7->_unsubscribeBaselineImpressionValue = v1041;
    v1042 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("visitBaselineImpressionValue"), 0.0);
    if (v1042 < 0.0)
      v1042 = 0.0;
    v7->_visitBaselineImpressionValue = v1042;
    v1043 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("dislikeBaselineImpressionValue"), 0.0);
    if (v1043 < 0.0)
      v1043 = 0.0;
    v7->_dislikeBaselineImpressionValue = v1043;
    v1044 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationFeedBaselineImpressionValue"), 0.0);
    if (v1044 < 0.0)
      v1044 = 0.0;
    v7->_recommendationPresentationFeedBaselineImpressionValue = v1044;
    v1045 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationExploreBaselineImpressionValue"), 0.0);
    if (v1045 < 0.0)
      v1045 = 0.0;
    v7->_recommendationPresentationExploreBaselineImpressionValue = v1045;
    v1046 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("premiumSubscriptionActivationBaselineImpressionValue"), 0.0);
    if (v1046 < 0.0)
      v1046 = 0.0;
    v7->_premiumSubscriptionActivationBaselineImpressionValue = v1046;
    v1047 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("muteBaselineImpressionValue"), 0.0);
    if (v1047 < 0.0)
      v1047 = 0.0;
    v7->_muteBaselineImpressionValue = v1047;
    v1048 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unmuteBaselineImpressionValue"), 0.0);
    if (v1048 < 0.0)
      v1048 = 0.0;
    v7->_unmuteBaselineImpressionValue = v1048;
    v1049 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoInitiatePlaybackBaselineImpressionValue"), 0.0);
    if (v1049 < 0.0)
      v1049 = 0.0;
    v7->_videoInitiatePlaybackBaselineImpressionValue = v1049;
    v1050 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoCompletePlaybackBaselineImpressionValue"), 0.0);
    if (v1050 < 0.0)
      v1050 = 0.0;
    v7->_videoCompletePlaybackBaselineImpressionValue = v1050;
    v1051 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete25BaselineImpressionValue"), 0.0);
    if (v1051 < 0.0)
      v1051 = 0.0;
    v7->_videoComplete25BaselineImpressionValue = v1051;
    v1052 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete50BaselineImpressionValue"), 0.0);
    if (v1052 < 0.0)
      v1052 = 0.0;
    v7->_videoComplete50BaselineImpressionValue = v1052;
    v1053 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete75BaselineImpressionValue"), 0.0);
    if (v1053 < 0.0)
      v1053 = 0.0;
    v7->_videoComplete75BaselineImpressionValue = v1053;
    v1054 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetPresentationBaselineImpressionValue"), 1.0);
    if (v1054 < 0.0)
      v1054 = 1.0;
    v7->_newsTodayWidgetPresentationBaselineImpressionValue = v1054;
    v1055 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetClickBaselineImpressionValue"), 0.0);
    if (v1055 < 0.0)
      v1055 = 0.0;
    v7->_newsTodayWidgetClickBaselineImpressionValue = v1055;
    v1056 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetVideoPlaybackBaselineImpressionValue"), 0.0);
    if (v1056 < 0.0)
      v1056 = 0.0;
    v7->_newsTodayWidgetVideoPlaybackBaselineImpressionValue = v1056;
    v1057 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInstallBaselineImpressionValue"), 0.0);
    if (v1057 < 0.0)
      v1057 = 0.0;
    v7->_appInstallBaselineImpressionValue = v1057;
    v1058 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInFocusBaselineImpressionValue"), 0.0);
    if (v1058 < 0.0)
      v1058 = 0.0;
    v7->_appInFocusBaselineImpressionValue = v1058;
    v1059 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariHistoryBaselineImpressionValue"), 0.0);
    if (v1059 < 0.0)
      v1059 = 0.0;
    v7->_safariHistoryBaselineImpressionValue = v1059;
    v1060 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForSourceMoreFromFeedBaselineImpressionValue"), 0.0);
    if (v1060 < 0.0)
      v1060 = 0.0;
    v7->_publisherBoostForSourceMoreFromFeedBaselineImpressionValue = v1060;
    v1061 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicBoostForSourceRelatedFeedBaselineImpressionValue"), 0.0);
    if (v1061 < 0.0)
      v1061 = 0.0;
    v7->_topicBoostForSourceRelatedFeedBaselineImpressionValue = v1061;
    v1062 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForIssueOpenBaselineImpressionValue"), 0.0);
    if (v1062 < 0.0)
      v1062 = 0.0;
    v7->_publisherBoostForIssueOpenBaselineImpressionValue = v1062;
    v1063 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackVisitedBaselineImpressionValue"), 1.0);
    if (v1063 < 0.0)
      v1063 = 1.0;
    v7->_trackVisitedBaselineImpressionValue = v1063;
    v1064 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackListenedBaselineImpressionValue"), 3.0);
    if (v1064 < 0.0)
      v1064 = 3.0;
    v7->_trackListenedBaselineImpressionValue = v1064;
    v1065 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackFinishedBaselineImpressionValue"), 10.0);
    if (v1065 < 0.0)
      v1065 = 10.0;
    v7->_trackFinishedBaselineImpressionValue = v1065;
    v1066 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("sportsTagSeenBaselineImpressionValue"), 1.0);
    if (v1066 < 0.0)
      v1066 = 1.0;
    v7->_sportsTagSeenBaselineImpressionValue = v1066;
    v1067 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("ignoreBaselineImpressionValue"), 0.0);
    if (v1067 < 0.0)
      v1067 = 0.0;
    v7->_ignoreBaselineImpressionValue = v1067;
    v1068 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("presentationClickValue"), 0.0);
    if (v1068 < 0.0)
      v1068 = 0.0;
    v7->_presentationClickValue = v1068;
    v1069 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("heavyClickClickValue"), 3.0);
    if (v1069 < 0.0)
      v1069 = 3.0;
    v7->_heavyClickClickValue = v1069;
    v1070 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("likeClickValue"), 2.0);
    if (v1070 < 0.0)
      v1070 = 2.0;
    v7->_likeClickValue = v1070;
    v1071 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("shareClickValue"), 2.0);
    if (v1071 < 0.0)
      v1071 = 2.0;
    v7->_shareClickValue = v1071;
    v1072 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("savedClickValue"), 1.0);
    if (v1072 < 0.0)
      v1072 = 1.0;
    v7->_savedClickValue = v1072;
    v1073 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeClickValue"), 10.0);
    if (v1073 < 0.0)
      v1073 = 10.0;
    v7->_subscribeClickValue = v1073;
    v1074 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeRelatedClickValue"), 0.0);
    if (v1074 < 0.0)
      v1074 = 0.0;
    v7->_subscribeRelatedClickValue = v1074;
    v1075 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionClickValue"), 5.0);
    if (v1075 < 0.0)
      v1075 = 5.0;
    v7->_existingSubscriptionClickValue = v1075;
    v1076 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionRelatedClickValue"), 0.0);
    if (v1076 < 0.0)
      v1076 = 0.0;
    v7->_existingSubscriptionRelatedClickValue = v1076;
    v1077 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("tappedClickValue"), 0.0);
    if (v1077 < 0.0)
      v1077 = 0.0;
    v7->_tappedClickValue = v1077;
    v1078 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("weakClickClickValue"), 1.0);
    if (v1078 < 0.0)
      v1078 = 1.0;
    v7->_weakClickClickValue = v1078;
    v1079 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unsubscribeClickValue"), 0.0);
    if (v1079 < 0.0)
      v1079 = 0.0;
    v7->_unsubscribeClickValue = v1079;
    v1080 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("visitClickValue"), 3.0);
    if (v1080 < 0.0)
      v1080 = 3.0;
    v7->_visitClickValue = v1080;
    v1081 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("dislikeClickValue"), 0.0);
    if (v1081 < 0.0)
      v1081 = 0.0;
    v7->_dislikeClickValue = v1081;
    v1082 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationFeedClickValue"), 0.0);
    if (v1082 < 0.0)
      v1082 = 0.0;
    v7->_recommendationPresentationFeedClickValue = v1082;
    v1083 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationExploreClickValue"), 0.0);
    if (v1083 < 0.0)
      v1083 = 0.0;
    v7->_recommendationPresentationExploreClickValue = v1083;
    v1084 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("premiumSubscriptionActivationClickValue"), 25.0);
    if (v1084 < 0.0)
      v1084 = 25.0;
    v7->_premiumSubscriptionActivationClickValue = v1084;
    v1085 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("muteClickValue"), 0.0);
    if (v1085 < 0.0)
      v1085 = 0.0;
    v7->_muteClickValue = v1085;
    v1086 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unmuteClickValue"), 0.0);
    if (v1086 < 0.0)
      v1086 = 0.0;
    v7->_unmuteClickValue = v1086;
    v1087 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoInitiatePlaybackClickValue"), 1.0);
    if (v1087 < 0.0)
      v1087 = 1.0;
    v7->_videoInitiatePlaybackClickValue = v1087;
    v1088 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoCompletePlaybackClickValue"), 2.0);
    if (v1088 < 0.0)
      v1088 = 2.0;
    v7->_videoCompletePlaybackClickValue = v1088;
    v1089 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete25ClickValue"), 0.0);
    if (v1089 < 0.0)
      v1089 = 0.0;
    v7->_videoComplete25ClickValue = v1089;
    v1090 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete50ClickValue"), 0.0);
    if (v1090 < 0.0)
      v1090 = 0.0;
    v7->_videoComplete50ClickValue = v1090;
    v1091 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete75ClickValue"), 0.0);
    if (v1091 < 0.0)
      v1091 = 0.0;
    v7->_videoComplete75ClickValue = v1091;
    v1092 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetPresentationClickValue"), 0.0);
    if (v1092 < 0.0)
      v1092 = 0.0;
    v7->_newsTodayWidgetPresentationClickValue = v1092;
    v1093 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetClickClickValue"), 1.0);
    if (v1093 < 0.0)
      v1093 = 1.0;
    v7->_newsTodayWidgetClickClickValue = v1093;
    v1094 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetVideoPlaybackClickValue"), 1.0);
    if (v1094 < 0.0)
      v1094 = 1.0;
    v7->_newsTodayWidgetVideoPlaybackClickValue = v1094;
    v1095 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInstallClickValue"), 0.0);
    if (v1095 < 0.0)
      v1095 = 0.0;
    v7->_appInstallClickValue = v1095;
    v1096 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInFocusClickValue"), 0.0);
    if (v1096 < 0.0)
      v1096 = 0.0;
    v7->_appInFocusClickValue = v1096;
    v1097 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariHistoryClickValue"), 0.0);
    if (v1097 < 0.0)
      v1097 = 0.0;
    v7->_safariHistoryClickValue = v1097;
    v1098 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForSourceMoreFromFeedClickValue"), 0.0);
    if (v1098 < 0.0)
      v1098 = 0.0;
    v7->_publisherBoostForSourceMoreFromFeedClickValue = v1098;
    v1099 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicBoostForSourceRelatedFeedClickValue"), 0.0);
    if (v1099 < 0.0)
      v1099 = 0.0;
    v7->_topicBoostForSourceRelatedFeedClickValue = v1099;
    v1100 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForIssueOpenClickValue"), 0.0);
    if (v1100 < 0.0)
      v1100 = 0.0;
    v7->_publisherBoostForIssueOpenClickValue = v1100;
    v1101 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackVisitedClickValue"), 1.0);
    if (v1101 < 0.0)
      v1101 = 1.0;
    v7->_trackVisitedClickValue = v1101;
    v1102 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackListenedClickValue"), 3.0);
    if (v1102 < 0.0)
      v1102 = 3.0;
    v7->_trackListenedClickValue = v1102;
    v1103 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackFinishedClickValue"), 10.0);
    if (v1103 < 0.0)
      v1103 = 10.0;
    v7->_trackFinishedClickValue = v1103;
    v1104 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("sportsTagSeenClickValue"), 0.0);
    if (v1104 < 0.0)
      v1104 = 0.0;
    v7->_sportsTagSeenClickValue = v1104;
    v1105 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("ignoreClickValue"), 0.0);
    if (v1105 < 0.0)
      v1105 = 0.0;
    v7->_ignoreClickValue = v1105;
    v1106 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("metaGroupingRelatednessThreshold"), 0.7);
    if (v1106 > 1.0 || v1106 < 0.0)
      v1106 = 0.7;
    v7->_metaGroupingRelatednessThreshold = v1106;
    v1108 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("metaGroupingRelatednessKWeight"), 0.1);
    if (v1108 < 0.0)
      v1108 = 0.1;
    v7->_metaGroupingRelatednessKWeight = v1108;
    v1109 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("metaGroupingTopicScoreWeight"), 0.5);
    if (v1109 > 1.0 || v1109 < 0.0)
      v1109 = 0.5;
    v7->_metaGroupingTopicScoreWeight = v1109;
    v1111 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("metaGroupingHighestScoringRelativeScoreMultiplier"), 100.0);
    if (v1111 <= 0.0)
      v1111 = 100.0;
    v7->_metaGroupingHighestScoringRelativeScoreMultiplier = v1111;
    v1112 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("metaGroupingSubscribedTopicMultiplier"), 5.0);
    if (v1112 <= 0.0)
      v1112 = 5.0;
    v7->_metaGroupingSubscribedTopicMultiplier = v1112;
    v1113 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("presentationBaselineClickValue"), 0.0);
    if (v1113 < 0.0)
      v1113 = 0.0;
    v7->_presentationBaselineClickValue = v1113;
    v1114 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("heavyClickBaselineClickValue"), 0.0);
    if (v1114 < 0.0)
      v1114 = 0.0;
    v7->_heavyClickBaselineClickValue = v1114;
    v1115 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("likeBaselineClickValue"), 0.0);
    if (v1115 < 0.0)
      v1115 = 0.0;
    v7->_likeBaselineClickValue = v1115;
    v1116 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("shareBaselineClickValue"), 0.0);
    if (v1116 < 0.0)
      v1116 = 0.0;
    v7->_shareBaselineClickValue = v1116;
    v1117 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("savedBaselineClickValue"), 0.0);
    if (v1117 < 0.0)
      v1117 = 0.0;
    v7->_savedBaselineClickValue = v1117;
    v1118 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeBaselineClickValue"), 0.0);
    if (v1118 < 0.0)
      v1118 = 0.0;
    v7->_subscribeBaselineClickValue = v1118;
    v1119 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("subscribeRelatedBaselineClickValue"), 0.0);
    if (v1119 < 0.0)
      v1119 = 0.0;
    v7->_subscribeRelatedBaselineClickValue = v1119;
    v1120 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionBaselineClickValue"), 0.0);
    if (v1120 < 0.0)
      v1120 = 0.0;
    v7->_existingSubscriptionBaselineClickValue = v1120;
    v1121 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("existingSubscriptionRelatedBaselineClickValue"), 0.0);
    if (v1121 < 0.0)
      v1121 = 0.0;
    v7->_existingSubscriptionRelatedBaselineClickValue = v1121;
    v1122 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("tappedBaselineClickValue"), 0.0);
    if (v1122 < 0.0)
      v1122 = 0.0;
    v7->_tappedBaselineClickValue = v1122;
    v1123 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("weakClickBaselineClickValue"), 1.0);
    if (v1123 < 0.0)
      v1123 = 1.0;
    v7->_weakClickBaselineClickValue = v1123;
    v1124 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unsubscribeBaselineClickValue"), 0.0);
    if (v1124 < 0.0)
      v1124 = 0.0;
    v7->_unsubscribeBaselineClickValue = v1124;
    v1125 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("visitBaselineClickValue"), 0.0);
    if (v1125 < 0.0)
      v1125 = 0.0;
    v7->_visitBaselineClickValue = v1125;
    v1126 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("dislikeBaselineClickValue"), 0.0);
    if (v1126 < 0.0)
      v1126 = 0.0;
    v7->_dislikeBaselineClickValue = v1126;
    v1127 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationFeedBaselineClickValue"), 0.0);
    if (v1127 < 0.0)
      v1127 = 0.0;
    v7->_recommendationPresentationFeedBaselineClickValue = v1127;
    v1128 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("recommendationPresentationExploreBaselineClickValue"), 0.0);
    if (v1128 < 0.0)
      v1128 = 0.0;
    v7->_recommendationPresentationExploreBaselineClickValue = v1128;
    v1129 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("premiumSubscriptionActivationBaselineClickValue"), 0.0);
    if (v1129 < 0.0)
      v1129 = 0.0;
    v7->_premiumSubscriptionActivationBaselineClickValue = v1129;
    v1130 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("muteBaselineClickValue"), 0.0);
    if (v1130 < 0.0)
      v1130 = 0.0;
    v7->_muteBaselineClickValue = v1130;
    v1131 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("unmuteBaselineClickValue"), 0.0);
    if (v1131 < 0.0)
      v1131 = 0.0;
    v7->_unmuteBaselineClickValue = v1131;
    v1132 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoInitiatePlaybackBaselineClickValue"), 0.0);
    if (v1132 < 0.0)
      v1132 = 0.0;
    v7->_videoInitiatePlaybackBaselineClickValue = v1132;
    v1133 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoCompletePlaybackBaselineClickValue"), 0.0);
    if (v1133 < 0.0)
      v1133 = 0.0;
    v7->_videoCompletePlaybackBaselineClickValue = v1133;
    v1134 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete25BaselineClickValue"), 0.0);
    if (v1134 < 0.0)
      v1134 = 0.0;
    v7->_videoComplete25BaselineClickValue = v1134;
    v1135 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete50BaselineClickValue"), 0.0);
    if (v1135 < 0.0)
      v1135 = 0.0;
    v7->_videoComplete50BaselineClickValue = v1135;
    v1136 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("videoComplete75BaselineClickValue"), 0.0);
    if (v1136 < 0.0)
      v1136 = 0.0;
    v7->_videoComplete75BaselineClickValue = v1136;
    v1137 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetPresentationBaselineClickValue"), 0.0);
    if (v1137 < 0.0)
      v1137 = 0.0;
    v7->_newsTodayWidgetPresentationBaselineClickValue = v1137;
    v1138 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetClickBaselineClickValue"), 1.0);
    if (v1138 < 0.0)
      v1138 = 1.0;
    v7->_newsTodayWidgetClickBaselineClickValue = v1138;
    v1139 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("newsTodayWidgetVideoPlaybackBaselineClickValue"), 0.0);
    if (v1139 < 0.0)
      v1139 = 0.0;
    v7->_newsTodayWidgetVideoPlaybackBaselineClickValue = v1139;
    v1140 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInstallBaselineClickValue"), 0.0);
    if (v1140 < 0.0)
      v1140 = 0.0;
    v7->_appInstallBaselineClickValue = v1140;
    v1141 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appInFocusBaselineClickValue"), 0.0);
    if (v1141 < 0.0)
      v1141 = 0.0;
    v7->_appInFocusBaselineClickValue = v1141;
    v1142 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariHistoryBaselineClickValue"), 0.0);
    if (v1142 < 0.0)
      v1142 = 0.0;
    v7->_safariHistoryBaselineClickValue = v1142;
    v1143 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForSourceMoreFromFeedBaselineClickValue"), 0.0);
    if (v1143 < 0.0)
      v1143 = 0.0;
    v7->_publisherBoostForSourceMoreFromFeedBaselineClickValue = v1143;
    v1144 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicBoostForSourceRelatedFeedBaselineClickValue"), 0.0);
    if (v1144 < 0.0)
      v1144 = 0.0;
    v7->_topicBoostForSourceRelatedFeedBaselineClickValue = v1144;
    v1145 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherBoostForIssueOpenBaselineClickValue"), 0.0);
    if (v1145 < 0.0)
      v1145 = 0.0;
    v7->_publisherBoostForIssueOpenBaselineClickValue = v1145;
    v1146 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackVisitedBaselineClickValue"), 1.0);
    if (v1146 < 0.0)
      v1146 = 1.0;
    v7->_trackVisitedBaselineClickValue = v1146;
    v1147 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackListenedBaselineClickValue"), 3.0);
    if (v1147 < 0.0)
      v1147 = 3.0;
    v7->_trackListenedBaselineClickValue = v1147;
    v1148 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trackFinishedBaselineClickValue"), 10.0);
    if (v1148 < 0.0)
      v1148 = 10.0;
    v7->_trackFinishedBaselineClickValue = v1148;
    v1149 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("sportsTagSeenBaselineClickValue"), 0.0);
    if (v1149 < 0.0)
      v1149 = 0.0;
    v7->_sportsTagSeenBaselineClickValue = v1149;
    v1150 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("ignoreBaselineClickValue"), 0.0);
    if (v1150 < 0.0)
      v1150 = 0.0;
    v7->_ignoreBaselineClickValue = v1150;
    v1151 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minClusterSizeIPhone"), 3);
    v1152 = (uint64_t)(double)v1151;
    if (v1151 <= 0)
      v1152 = 3;
    v7->_minClusterSizeIPhone = v1152;
    v1153 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxClusterSizeIPhone"), 30);
    v1154 = (uint64_t)(double)v1153;
    if (v1153 <= 0)
      v1154 = 30;
    v7->_maxClusterSizeIPhone = v1154;
    v1155 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minMoreForYouSizeIPhone"), 3);
    v1156 = (uint64_t)(double)v1155;
    if (v1155 <= 0)
      v1156 = 3;
    v7->_minMoreForYouSizeIPhone = v1156;
    v1157 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxMoreForYouSizeIPhone"), 30);
    v1158 = (uint64_t)(double)v1157;
    if (v1157 <= 0)
      v1158 = 30;
    v7->_maxMoreForYouSizeIPhone = v1158;
    v1159 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minIdealClusterSizeIPhone"), 3);
    v1160 = (uint64_t)(double)v1159;
    if (v1159 <= 0)
      v1160 = 3;
    v7->_minIdealClusterSizeIPhone = v1160;
    v1161 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxIdealClusterSizeIPhone"), 5);
    v1162 = (uint64_t)(double)v1161;
    if (v1161 <= 0)
      v1162 = 5;
    v7->_maxIdealClusterSizeIPhone = v1162;
    v1163 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minClusterSizeIPhoneAutoFavorite"), 3);
    v1164 = (uint64_t)(double)v1163;
    if (v1163 <= 0)
      v1164 = 3;
    v7->_minClusterSizeIPhoneAutoFavorite = v1164;
    v1165 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxClusterSizeIPhoneAutoFavorite"), 3);
    v1166 = (uint64_t)(double)v1165;
    if (v1165 <= 0)
      v1166 = 3;
    v7->_maxClusterSizeIPhoneAutoFavorite = v1166;
    v1167 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minIdealClusterSizeIPhoneAutoFavorite"), 3);
    v1168 = (uint64_t)(double)v1167;
    if (v1167 <= 0)
      v1168 = 3;
    v7->_minIdealClusterSizeIPhoneAutoFavorite = v1168;
    v1169 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxIdealClusterSizeIPhoneAutoFavorite"), 3);
    v1170 = (uint64_t)(double)v1169;
    if (v1169 <= 0)
      v1170 = 3;
    v7->_maxIdealClusterSizeIPhoneAutoFavorite = v1170;
    v1171 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPhone"), 2);
    v1172 = (uint64_t)(double)v1171;
    if (v1171 <= 0)
      v1172 = 2;
    v7->_maxPublisherOccurrencesIPhone = v1172;
    v1173 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPhoneBestOfBundle"), 2);
    v1174 = (uint64_t)(double)v1173;
    if (v1173 <= 0)
      v1174 = 2;
    v7->_maxPublisherOccurrencesIPhoneBestOfBundle = v1174;
    v1175 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPhoneForYouGroup"), 2);
    v1176 = (uint64_t)(double)v1175;
    if (v1175 <= 0)
      v1176 = 2;
    v7->_maxPublisherOccurrencesIPhoneForYouGroup = v1176;
    v1177 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPhoneGreatStoriesYouMissed"), 2);
    v1178 = (uint64_t)(double)v1177;
    if (v1177 <= 0)
      v1178 = 2;
    v7->_maxPublisherOccurrencesIPhoneGreatStoriesYouMissed = v1178;
    v1179 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPhone"), 1);
    v1180 = (uint64_t)(double)v1179;
    if (v1179 < 0)
      v1180 = 1;
    v7->_maxUnpaidArticlesIPhone = v1180;
    v1181 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPhoneBestOfBundle"), 99);
    v1182 = (uint64_t)(double)v1181;
    if (v1181 < 0)
      v1182 = 99;
    v7->_maxUnpaidArticlesIPhoneBestOfBundle = v1182;
    v1183 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPhoneForYouGroup"), 1);
    v1184 = (uint64_t)(double)v1183;
    if (v1183 < 0)
      v1184 = 1;
    v7->_maxUnpaidArticlesIPhoneForYouGroup = v1184;
    v1185 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPhoneGreatStoriesYouMissed"), 1);
    v1186 = (uint64_t)(double)v1185;
    if (v1185 < 0)
      v1186 = 1;
    v7->_maxUnpaidArticlesIPhoneGreatStoriesYouMissed = v1186;
    v1187 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPhone"), 0);
    v1188 = (uint64_t)(double)v1187;
    if (v1187 < 0)
      v1188 = 0;
    v7->_maxNativeAdCountIPhone = v1188;
    v1189 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPhoneBestOfBundle"), 0);
    v1190 = (uint64_t)(double)v1189;
    if (v1189 < 0)
      v1190 = 0;
    v7->_maxNativeAdCountIPhoneBestOfBundle = v1190;
    v1191 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPhoneForYouGroup"), 0);
    v1192 = (uint64_t)(double)v1191;
    if (v1191 < 0)
      v1192 = 0;
    v7->_maxNativeAdCountIPhoneForYouGroup = v1192;
    v1193 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPhoneGreatStoriesYouMissed"), 0);
    v1194 = (uint64_t)(double)v1193;
    if (v1193 < 0)
      v1194 = 0;
    v7->_maxNativeAdCountIPhoneGreatStoriesYouMissed = v1194;
    v1195 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minClusterSizeIPad"), 3);
    v1196 = (uint64_t)(double)v1195;
    if (v1195 <= 0)
      v1196 = 3;
    v7->_minClusterSizeIPad = v1196;
    v1197 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxClusterSizeIPad"), 30);
    v1198 = (uint64_t)(double)v1197;
    if (v1197 <= 0)
      v1198 = 30;
    v7->_maxClusterSizeIPad = v1198;
    v1199 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minMoreForYouSizeIPad"), 3);
    v1200 = (uint64_t)(double)v1199;
    if (v1199 <= 0)
      v1200 = 3;
    v7->_minMoreForYouSizeIPad = v1200;
    v1201 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxMoreForYouSizeIPad"), 30);
    v1202 = (uint64_t)(double)v1201;
    if (v1201 <= 0)
      v1202 = 30;
    v7->_maxMoreForYouSizeIPad = v1202;
    v1203 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minIdealClusterSizeIPad"), 5);
    v1204 = (uint64_t)(double)v1203;
    if (v1203 <= 0)
      v1204 = 5;
    v7->_minIdealClusterSizeIPad = v1204;
    v1205 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxIdealClusterSizeIPad"), 9);
    v1206 = (uint64_t)(double)v1205;
    if (v1205 <= 0)
      v1206 = 9;
    v7->_maxIdealClusterSizeIPad = v1206;
    v1207 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minClusterSizeIPadAutoFavorite"), 5);
    v1208 = (uint64_t)(double)v1207;
    if (v1207 <= 0)
      v1208 = 5;
    v7->_minClusterSizeIPadAutoFavorite = v1208;
    v1209 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxClusterSizeIPadAutoFavorite"), 5);
    v1210 = (uint64_t)(double)v1209;
    if (v1209 <= 0)
      v1210 = 5;
    v7->_maxClusterSizeIPadAutoFavorite = v1210;
    v1211 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minIdealClusterSizeIPadAutoFavorite"), 5);
    v1212 = (uint64_t)(double)v1211;
    if (v1211 <= 0)
      v1212 = 5;
    v7->_minIdealClusterSizeIPadAutoFavorite = v1212;
    v1213 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxIdealClusterSizeIPadAutoFavorite"), 5);
    v1214 = (uint64_t)(double)v1213;
    if (v1213 <= 0)
      v1214 = 5;
    v7->_maxIdealClusterSizeIPadAutoFavorite = v1214;
    v1215 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPad"), 2);
    v1216 = (uint64_t)(double)v1215;
    if (v1215 <= 0)
      v1216 = 2;
    v7->_maxPublisherOccurrencesIPad = v1216;
    v1217 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPadBestOfBundle"), 2);
    v1218 = (uint64_t)(double)v1217;
    if (v1217 <= 0)
      v1218 = 2;
    v7->_maxPublisherOccurrencesIPadBestOfBundle = v1218;
    v1219 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPadForYouGroup"), 2);
    v1220 = (uint64_t)(double)v1219;
    if (v1219 <= 0)
      v1220 = 2;
    v7->_maxPublisherOccurrencesIPadForYouGroup = v1220;
    v1221 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxPublisherOccurrencesIPadGreatStoriesYouMissed"), 2);
    v1222 = (uint64_t)(double)v1221;
    if (v1221 <= 0)
      v1222 = 2;
    v7->_maxPublisherOccurrencesIPadGreatStoriesYouMissed = v1222;
    v1223 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPad"), 1);
    v1224 = (uint64_t)(double)v1223;
    if (v1223 < 0)
      v1224 = 1;
    v7->_maxUnpaidArticlesIPad = v1224;
    v1225 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPadBestOfBundle"), 99);
    v1226 = (uint64_t)(double)v1225;
    if (v1225 < 0)
      v1226 = 99;
    v7->_maxUnpaidArticlesIPadBestOfBundle = v1226;
    v1227 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPadForYouGroup"), 1);
    v1228 = (uint64_t)(double)v1227;
    if (v1227 < 0)
      v1228 = 1;
    v7->_maxUnpaidArticlesIPadForYouGroup = v1228;
    v1229 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxUnpaidArticlesIPadGreatStoriesYouMissed"), 1);
    v1230 = (uint64_t)(double)v1229;
    if (v1229 < 0)
      v1230 = 1;
    v7->_maxUnpaidArticlesIPadGreatStoriesYouMissed = v1230;
    v1231 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPad"), 0);
    v1232 = (uint64_t)(double)v1231;
    if (v1231 < 0)
      v1232 = 0;
    v7->_maxNativeAdCountIPad = v1232;
    v1233 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPadBestOfBundle"), 0);
    v1234 = (uint64_t)(double)v1233;
    if (v1233 < 0)
      v1234 = 0;
    v7->_maxNativeAdCountIPadBestOfBundle = v1234;
    v1235 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPadForYouGroup"), 0);
    v1236 = (uint64_t)(double)v1235;
    if (v1235 < 0)
      v1236 = 0;
    v7->_maxNativeAdCountIPadForYouGroup = v1236;
    v1237 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNativeAdCountIPadGreatStoriesYouMissed"), 0);
    v1238 = (uint64_t)(double)v1237;
    if (v1237 < 0)
      v1238 = 0;
    v7->_maxNativeAdCountIPadGreatStoriesYouMissed = v1238;
    v1239 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("relatedTopicMultiplier"), 0.8);
    if (v1239 > 1.0 || v1239 < 0.0)
      v1239 = 0.8;
    v7->_relatedTopicMultiplier = v1239;
    v1241 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("relatedTopicRatioFilter"), 0.3);
    if (v1241 > 1.0 || v1241 < 0.0)
      v1241 = 0.3;
    v7->_relatedTopicRatioFilter = v1241;
    v7->_managedTopicMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("managedTopicMultiplier"), 1.0);
    v7->_managedWinnerTopicMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("managedWinnerTopicMultiplier"), 1.0);
    v7->_topicAutofavoritedMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicAutofavoritedMultiplier"), 1.0);
    v7->_topicFavoritedMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicFavoritedMultiplier"), 1.0);
    v7->_topicGroupSizeMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicGroupSizeMultiplier"), 1.0);
    v7->_topicGroupableMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicGroupableMultiplier"), 1.0);
    v7->_channelScoreWeight = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("channelScoreWeight"), 0.5);
    v7->_topicScoreWeight = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicScoreWeight"), 0.5);
    v7->_topicSpecificityMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicSpecificityMultiplier"), 1.0);
    v1243 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("publisherDiversityMinPublisherCount"), 3);
    v1244 = (unint64_t)(double)v1243;
    if (v1243 <= 0)
      v1244 = 3;
    v7->_publisherDiversityMinPublisherCount = v1244;
    v1245 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("publisherDiversityMaxPublisherCount"), 10);
    v1246 = (unint64_t)(double)v1245;
    if (v1245 <= 0)
      v1246 = 10;
    v7->_publisherDiversityMaxPublisherCount = v1246;
    v1247 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("publisherDiversityMaxArticleFilter"), 0.3);
    if (v1247 <= 0.0)
      v1247 = 0.3;
    v7->_publisherDiversityMaxArticleFilter = v1247;
    v1248 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxEvergreenArticlesPerGroup"), 2);
    v1249 = (uint64_t)(double)v1248;
    if (v1248 < 0)
      v1249 = 2;
    v7->_maxEvergreenArticlesPerGroup = v1249;
    v1250 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariSignalWeight"), 1.0);
    if (v1250 > 1.0 || v1250 < 0.0)
      v1250 = 1.0;
    v7->_safariSignalWeight = v1250;
    v1252 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariTimeDecayMultiplier"), 0.99);
    if (v1252 <= 0.0)
      v1252 = 0.99;
    v7->_safariTimeDecayMultiplier = v1252;
    v1253 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariOccurrenceDecayMultiplier"), 0.995);
    if (v1253 > 1.0 || v1253 < 0.0)
      v1253 = 0.995;
    v7->_safariOccurrenceDecayMultiplier = v1253;
    v1255 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariEventBlackoutSeconds"), 90.0);
    if (v1255 < 0.0)
      v1255 = 90.0;
    v7->_safariEventBlackoutSeconds = v1255;
    v1256 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinObservationsSafari"), 4.0);
    if (v1256 <= 0.0)
      v1256 = 4.0;
    v7->_autoFavoriteMinObservationsSafari = v1256;
    v1257 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinScoreSafari"), 3.0);
    if (v1257 <= 0.0)
      v1257 = 3.0;
    v7->_autoFavoriteMinScoreSafari = v1257;
    v7->_safariTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariTagFavorabilityExponent"), 1.0);
    v7->_safariPriorFactorExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("safariPriorFactorExponent"), 0.0);
    v1258 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appUsageSignalWeight"), 1.0);
    if (v1258 > 1.0 || v1258 < 0.0)
      v1258 = 1.0;
    v7->_appUsageSignalWeight = v1258;
    v1260 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appUsageTimeDecayMultiplier"), 0.99);
    if (v1260 > 1.0 || v1260 < 0.0)
      v1260 = 0.99;
    v7->_appUsageTimeDecayMultiplier = v1260;
    v1262 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appUsageOccurrenceDecayMultiplier"), 0.995);
    if (v1262 <= 0.0)
      v1262 = 0.995;
    v7->_appUsageOccurrenceDecayMultiplier = v1262;
    v1263 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinObservationsExtAppUsage"), 1.0);
    if (v1263 <= 0.0)
      v1263 = 1.0;
    v7->_autoFavoriteMinObservationsExtAppUsage = v1263;
    v1264 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinScoreExtAppUsage"), 1.0);
    if (v1264 <= 0.0)
      v1264 = 1.0;
    v7->_autoFavoriteMinScoreExtAppUsage = v1264;
    v7->_appUsageTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appUsageTagFavorabilityExponent"), 1.0);
    v7->_appUsagePriorFactorExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("appUsagePriorFactorExponent"), 0.0);
    v1265 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("portraitSignalWeight"), 1.0);
    if (v1265 > 1.0 || v1265 < 0.0)
      v1265 = 1.0;
    v7->_portraitSignalWeight = v1265;
    v1267 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("portraitDecayRate"), 1209600.0);
    if (v1267 < 0.0)
      v1267 = 1209600.0;
    v7->_portraitDecayRate = v1267;
    v1268 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("portraitGlobalThreshold"), 0.6);
    if (v1268 > 1.0 || v1268 < 0.0)
      v1268 = 0.6;
    v7->_portraitGlobalThreshold = v1268;
    v7->_portraitTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("portraitTagFavorabilityExponent"), 1.0);
    v7->_portraitPriorFactorExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("portraitPriorFactorExponent"), 0.0);
    v1270 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("internalUsageSignalWeight"), 1.0);
    if (v1270 > 1.0 || v1270 < 0.0)
      v1270 = 1.0;
    v7->_internalUsageSignalWeight = v1270;
    v1272 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMaxIdleTime"), 604800.0);
    if (v1272 <= 0.0)
      v1272 = 604800.0;
    v7->_autoFavoriteMaxIdleTime = v1272;
    v1273 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinClicks"), 10.0);
    if (v1273 <= 0.0)
      v1273 = 10.0;
    v7->_autoFavoriteMinClicks = v1273;
    v1274 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinEvents"), 25.0);
    if (v1274 <= 0.0)
      v1274 = 25.0;
    v7->_autoFavoriteMinEvents = v1274;
    v1275 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinRate"), 0.1);
    if (v1275 <= 0.0)
      v1275 = 0.1;
    v7->_autoFavoriteMinRate = v1275;
    v1276 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteMinRelativeRate"), 0.75);
    if (v1276 <= 0.0)
      v1276 = 0.75;
    v7->_autoFavoriteMinRelativeRate = v1276;
    v1277 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoUnfavoriteFactor"), 1.1);
    if (v1277 <= 0.0)
      v1277 = 1.1;
    v7->_autoUnfavoriteFactor = v1277;
    v1278 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoGroupableFactor"), 0.8);
    if (v1278 <= 0.0)
      v1278 = 0.8;
    v7->_autoGroupableFactor = v1278;
    v7->_autoFavoriteTagFavorabilityExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoriteTagFavorabilityExponent"), 1.0);
    v7->_autoFavoritePriorFactorExponent = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("autoFavoritePriorFactorExponent"), 1.0);
    v1279 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("groupImpressionBiasCorrectionFactor"), 1.0);
    if (v1279 >= 1.0 || v1279 < 0.0)
      v1279 = 1.0;
    v7->_groupImpressionBiasCorrectionFactor = v1279;
    v1281 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("indexImpressionBiasCorrectionFactor"), 1.0);
    if (v1281 >= 1.0 || v1281 < 0.0)
      v1281 = 1.0;
    v7->_indexImpressionBiasCorrectionFactor = v1281;
    v1283 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNumberOfSuggestions"), 40);
    v1284 = (uint64_t)(double)v1283;
    if (v1283 < 0)
      v1284 = 40;
    v7->_maxNumberOfSuggestions = v1284;
    v1285 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("uGroupMinimumSubscribedChannelSourceFeedArticleRatio"), 0.5);
    if (v1285 < 0.0)
      v1285 = 0.5;
    v7->_uGroupMinimumSubscribedChannelSourceFeedArticleRatio = v1285;
    v7->_numEventsToDisableDefaultTopics = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("numEventsToDisableDefaultTopics"), -1);
    v1286 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("numSubscriptionsToDisableDefaultTopics"), 5);
    v1287 = (uint64_t)(double)v1286;
    if (v1286 < 0)
      v1287 = 5;
    v7->_numSubscriptionsToDisableDefaultTopics = v1287;
    v1288 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("auditionedAutoFavoritesEmitterLimit"), 1);
    v1289 = (uint64_t)(double)v1288;
    if (v1288 < 0)
      v1289 = 1;
    v7->_auditionedAutoFavoritesEmitterLimit = v1289;
    v1290 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topicDiversityThreshold"), 1.0);
    if (v1290 >= 1.0 || v1290 < 0.0)
      v1290 = 1.0;
    v7->_topicDiversityThreshold = v1290;
    v1292 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("topicDiversityWindowSize"), 3);
    v1293 = (uint64_t)(double)v1292;
    if (v1292 <= 0)
      v1293 = 3;
    v7->_topicDiversityWindowSize = v1293;
    v1294 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("minBaselineEventsToSubmitUserVector"), 0);
    v1295 = (uint64_t)(double)v1294;
    if (v1294 < 0)
      v1295 = 0;
    v7->_minBaselineEventsToSubmitUserVector = v1295;
    v7->_personalizesSportsTagsInUserVector = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("personalizesFavoritedSportsTags"), 0);
    v7->_shadowModeScoringEnabled = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("shadowModeScoringEnabled"), 0);
    v7->_topicFeedFilterMutedTopics = (double)FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("topicFeedFilterMutedTopics"), 1);
    v7->_magazineFeedGroupScoreWeight = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("magazineFeedGroupScoreWeight"), 0.0);
    v7->_audioFeedGroupScoreWeight = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("audioFeedGroupScoreWeight"), 0.0);
    v7->_forYouGroupFilteredSubsetCount = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("forYouGroupFilteredSubsetCount"), 100);
    v7->_forYouGroupAllowUnfilteredArticles = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("forYouGroupAllowUnfilteredArticles"), 0);
    v7->_topStoriesGroupAggregatesGroupBias = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("topStoriesGroupAggregatesGroupBias"), 1.0);
    v7->_trendingGroupAggregatesGroupBias = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("trendingGroupAggregatesGroupBias"), 1.0);
    v7->_clicksToImpressionsRatioMaximum = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("clicksToImpressionsRatioMaximum"), 1.0);
    v7->_featureClicksByAction[1] = v7->_presentationClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[2] = *(_OWORD *)&v7->_tappedClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[4] = *(_OWORD *)&v7->_heavyClickClickValue;
    v7->_featureClicksByAction[6] = v7->_dislikeClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[7] = *(_OWORD *)&v7->_shareClickValue;
    unsubscribeClickValue = v7->_unsubscribeClickValue;
    v7->_featureClicksByAction[9] = v7->_subscribeClickValue;
    v7->_featureClicksByAction[10] = unsubscribeClickValue;
    v7->_featureClicksByAction[11] = v7->_visitClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[12] = *(_OWORD *)&v7->_subscribeRelatedClickValue;
    v7->_featureClicksByAction[14] = v7->_existingSubscriptionRelatedClickValue;
    v1297 = *(_OWORD *)&v7->_premiumSubscriptionActivationClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[17] = v1297;
    *(_OWORD *)&v7->_featureClicksByAction[19] = *(_OWORD *)&v7->_unmuteClickValue;
    v7->_featureClicksByAction[21] = v7->_videoCompletePlaybackClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[24] = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[26] = *(_OWORD *)&v7->_appInFocusClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[28] = *(_OWORD *)&v7->_videoComplete25ClickValue;
    v7->_featureClicksByAction[30] = v7->_videoComplete75ClickValue;
    *(_OWORD *)&v7->_featureClicksByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedClickValue;
    v7->_featureClicksByAction[33] = v7->_publisherBoostForIssueOpenClickValue;
    v7->_featureImpressionsByAction[1] = v7->_presentationImpressionValue;
    v1298 = *(_OWORD *)&v7->_heavyClickImpressionValue;
    v1299 = *(_OWORD *)&v7->_shareImpressionValue;
    *v8 = *(_OWORD *)&v7->_tappedImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[4] = v1298;
    v7->_featureImpressionsByAction[6] = v7->_dislikeImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[7] = v1299;
    *(double *)&v1298 = v7->_unsubscribeImpressionValue;
    v7->_featureImpressionsByAction[9] = v7->_subscribeImpressionValue;
    *(_QWORD *)&v7->_featureImpressionsByAction[10] = v1298;
    v7->_featureImpressionsByAction[11] = v7->_visitImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[12] = *(_OWORD *)&v7->_subscribeRelatedImpressionValue;
    v7->_featureImpressionsByAction[14] = v7->_existingSubscriptionRelatedImpressionValue;
    v1300 = *(_OWORD *)&v7->_premiumSubscriptionActivationImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[17] = v1300;
    *(_OWORD *)&v7->_featureImpressionsByAction[19] = *(_OWORD *)&v7->_unmuteImpressionValue;
    v7->_featureImpressionsByAction[21] = v7->_videoCompletePlaybackImpressionValue;
    v1301 = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[24] = v1301;
    v1302 = *(_OWORD *)&v7->_videoComplete25ImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[26] = *(_OWORD *)&v7->_appInFocusImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[28] = v1302;
    v7->_featureImpressionsByAction[30] = v7->_videoComplete75ImpressionValue;
    *(_OWORD *)&v7->_featureImpressionsByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedImpressionValue;
    v7->_featureImpressionsByAction[33] = v7->_publisherBoostForIssueOpenImpressionValue;
    v7->_baselineClicksByAction[1] = v7->_presentationBaselineClickValue;
    v1303 = *(_OWORD *)&v7->_heavyClickBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[2] = *(_OWORD *)&v7->_tappedBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[4] = v1303;
    v7->_baselineClicksByAction[6] = v7->_dislikeBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[7] = *(_OWORD *)&v7->_shareBaselineClickValue;
    v7->_baselineClicksByAction[9] = v7->_subscribeBaselineClickValue;
    v7->_baselineClicksByAction[10] = v7->_unsubscribeBaselineClickValue;
    v7->_baselineClicksByAction[11] = v7->_visitBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[12] = *(_OWORD *)&v7->_subscribeRelatedBaselineClickValue;
    v7->_baselineClicksByAction[14] = v7->_existingSubscriptionRelatedBaselineClickValue;
    v1304 = *(_OWORD *)&v7->_premiumSubscriptionActivationBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[17] = v1304;
    *(_OWORD *)&v7->_baselineClicksByAction[19] = *(_OWORD *)&v7->_unmuteBaselineClickValue;
    v7->_baselineClicksByAction[21] = v7->_videoCompletePlaybackBaselineClickValue;
    v1305 = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[24] = v1305;
    v1306 = *(_OWORD *)&v7->_videoComplete25BaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[26] = *(_OWORD *)&v7->_appInFocusBaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[28] = v1306;
    v7->_baselineClicksByAction[30] = v7->_videoComplete75BaselineClickValue;
    *(_OWORD *)&v7->_baselineClicksByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedBaselineClickValue;
    v7->_baselineClicksByAction[33] = v7->_publisherBoostForIssueOpenBaselineClickValue;
    v7->_baselineImpressionsByAction[1] = v7->_presentationBaselineImpressionValue;
    v1307 = *(_OWORD *)&v7->_heavyClickBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[2] = *(_OWORD *)&v7->_tappedBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[4] = v1307;
    v7->_baselineImpressionsByAction[6] = v7->_dislikeBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[7] = *(_OWORD *)&v7->_shareBaselineImpressionValue;
    v7->_baselineImpressionsByAction[9] = v7->_subscribeBaselineImpressionValue;
    v7->_baselineImpressionsByAction[10] = v7->_unsubscribeBaselineImpressionValue;
    v7->_baselineImpressionsByAction[11] = v7->_visitBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[12] = *(_OWORD *)&v7->_subscribeRelatedBaselineImpressionValue;
    v7->_baselineImpressionsByAction[14] = v7->_existingSubscriptionRelatedBaselineImpressionValue;
    v1308 = *(_OWORD *)&v7->_premiumSubscriptionActivationBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[15] = *(_OWORD *)&v7->_recommendationPresentationFeedBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[17] = v1308;
    *(_OWORD *)&v7->_baselineImpressionsByAction[19] = *(_OWORD *)&v7->_unmuteBaselineImpressionValue;
    v7->_baselineImpressionsByAction[21] = v7->_videoCompletePlaybackBaselineImpressionValue;
    v1309 = *(_OWORD *)&v7->_newsTodayWidgetVideoPlaybackBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[22] = *(_OWORD *)&v7->_newsTodayWidgetPresentationBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[24] = v1309;
    v1310 = *(_OWORD *)&v7->_videoComplete25BaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[26] = *(_OWORD *)&v7->_appInFocusBaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[28] = v1310;
    v7->_baselineImpressionsByAction[30] = v7->_videoComplete75BaselineImpressionValue;
    *(_OWORD *)&v7->_baselineImpressionsByAction[31] = *(_OWORD *)&v7->_publisherBoostForSourceMoreFromFeedBaselineImpressionValue;
    v7->_baselineImpressionsByAction[33] = v7->_publisherBoostForIssueOpenBaselineImpressionValue;
    v7->_filterableNotificationThresholdMultiplier = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("filterableNotificationThresholdMultiplier"), 1.0);
    v1311 = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("minimumMyMagazinesIssueScoreBaselineMultiplier"), 0.0);
    if (v1311 < 0.0)
      v1311 = 0.0;
    v7->_minimumMyMagazinesIssueScoreBaselineMultiplier = v1311;
    v7->_reorderHeadlinesUsingEmbeddingScoreBeforeGrouping = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("reorderHeadlinesUsingTitleEmbeddingScoreBeforeGrouping"), 0);
    v7->_maxNumberOfTotalTopicAndChannelGroups = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("maxNumberOfTotalTopicAndChannelGroups"), 1000);
    v7->_scoringVersion = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("scoringVersion"), 0);
    FCAppConfigurationNumberValue(v5, (uint64_t)CFSTR("maxExternalSignalEventCount"), &unk_1E470AD18);
    v1312 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_maxExternalSignalEventCount = objc_msgSend(v1312, "integerValue");

    v1314[0] = MEMORY[0x1E0C809B0];
    v1314[1] = 3221225472;
    v1314[2] = __73__FCPersonalizationTreatment_initWithPersonalizationTreatmentDictionary___block_invoke;
    v1314[3] = &unk_1E463AB90;
    v1314[4] = v5;
    v7->_computeUserVectorWithTabi = __73__FCPersonalizationTreatment_initWithPersonalizationTreatmentDictionary___block_invoke((uint64_t)v1314);
  }

  return v7;
}

- (FCPersonalizationOntologyLevelConfig)defaultOntologyLevelConfig
{
  return self->_defaultOntologyLevelConfig;
}

- (FCPersonalizationTopicsConfig)defaultTopicsConfig
{
  return self->_defaultTopicsConfig;
}

- (FCPersonalizationTopicsConfig)forYouTopicsConfig
{
  return self->_forYouTopicsConfig;
}

- (FCPersonalizationScoringConfig)forYouScoringConfig
{
  return self->_forYouScoringConfig;
}

- (FCPersonalizationOntologyLevelConfig)forYouOntologyLevelConfig
{
  return self->_forYouOntologyLevelConfig;
}

- (FCPersonalizationTagScoringConfig)defaultTagScoringConfig
{
  return self->_defaultTagScoringConfig;
}

- (int64_t)treatmentID
{
  return self->_treatmentID;
}

- (BOOL)shadowModeScoringEnabled
{
  return self->_shadowModeScoringEnabled;
}

- (int64_t)publisherTopicIDEventCountMinimum
{
  return self->_publisherTopicIDEventCountMinimum;
}

- (double)publisherDiversificationPenalty
{
  return self->_publisherDiversificationPenalty;
}

- (double)featureImpressionPrior
{
  return self->_featureImpressionPrior;
}

- (double)articleLengthMediumThreshold
{
  return self->_articleLengthMediumThreshold;
}

- (double)articleLengthLongThreshold
{
  return self->_articleLengthLongThreshold;
}

- (double)clicksToImpressionsRatioMaximum
{
  return self->_clicksToImpressionsRatioMaximum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowAffinityGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagForYouGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperTodayFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperMagazineFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedIssuesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssueOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedArticleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowDefaultOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_shadowAffinityGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagForYouGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperTodayFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperMagazineFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedIssuesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssueTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedArticleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowDefaultTopicsConfig, 0);
  objc_storeStrong((id *)&self->_shadowAffinityGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagForYouGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperTodayFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNotificationScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperMagazineFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedIssuesScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowCuratedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssueScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedArticleScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_shadowDefaultScoringConfig, 0);
  objc_storeStrong((id *)&self->_affinityGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagDateRangeOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagForYouGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_localSectionGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_moreForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_newspaperTodayFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_highlightsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_tagWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_todayWidgetOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_newspaperMagazineFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_localNewsOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_latestStoriesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_forYouOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_curatedIssuesOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_curatedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_bestOfBundleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_audioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssueOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedArticleOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_topicFeedOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_defaultOntologyLevelConfig, 0);
  objc_storeStrong((id *)&self->_affinityGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagDateRangeTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagForYouGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_localSectionGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_moreForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_newspaperTodayFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_highlightsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupTopicsConfig, 0);
  objc_storeStrong((id *)&self->_tagWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_todayWidgetTopicsConfig, 0);
  objc_storeStrong((id *)&self->_newspaperMagazineFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_localNewsTopicsConfig, 0);
  objc_storeStrong((id *)&self->_latestStoriesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_forYouTopicsConfig, 0);
  objc_storeStrong((id *)&self->_curatedIssuesTopicsConfig, 0);
  objc_storeStrong((id *)&self->_curatedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_bestOfBundleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryTopicsConfig, 0);
  objc_storeStrong((id *)&self->_audioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssueTopicsConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedArticleTopicsConfig, 0);
  objc_storeStrong((id *)&self->_topicFeedTopicsConfig, 0);
  objc_storeStrong((id *)&self->_defaultTopicsConfig, 0);
  objc_storeStrong((id *)&self->_sportsTagScoringConfig, 0);
  objc_storeStrong((id *)&self->_defaultTagScoringConfig, 0);
  objc_storeStrong((id *)&self->_affinityGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagDateRangeScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagForYouGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_localSectionGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_moreForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_newspaperTodayFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_highlightsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsScoringConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_mySportsGroupScoringConfig, 0);
  objc_storeStrong((id *)&self->_notificationScoringConfig, 0);
  objc_storeStrong((id *)&self->_tagWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_todayWidgetScoringConfig, 0);
  objc_storeStrong((id *)&self->_newspaperMagazineFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_localNewsScoringConfig, 0);
  objc_storeStrong((id *)&self->_latestStoriesScoringConfig, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedScoringConfig, 0);
  objc_storeStrong((id *)&self->_forYouScoringConfig, 0);
  objc_storeStrong((id *)&self->_curatedIssuesScoringConfig, 0);
  objc_storeStrong((id *)&self->_curatedScoringConfig, 0);
  objc_storeStrong((id *)&self->_bestOfBundleScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryScoringConfig, 0);
  objc_storeStrong((id *)&self->_audioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssueScoringConfig, 0);
  objc_storeStrong((id *)&self->_magazineFeedArticleScoringConfig, 0);
  objc_storeStrong((id *)&self->_topicFeedScoringConfig, 0);
  objc_storeStrong((id *)&self->_defaultScoringConfig, 0);
  objc_storeStrong((id *)&self->_treatmentDictionary, 0);
  objc_storeStrong((id *)&self->_pbTreatment, 0);
}

uint64_t __73__FCPersonalizationTreatment_initWithPersonalizationTreatmentDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  objc_opt_class();
  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("news.features.enableTabiBasedUserVector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    v5 = &unk_1E470AD30;
  v7 = objc_msgSend(v5, "integerValue");

  if (v7 == 1)
    return 1;
  if (v7 == 2)
    return 0;
  return FCAppConfigurationBoolValue(*(void **)(a1 + 32), (uint64_t)CFSTR("computeUserVectorWithTabi"), 0);
}

- (FCPersonalizationTreatment)init
{
  return -[FCPersonalizationTreatment initWithPersonalizationTreatmentDictionary:](self, "initWithPersonalizationTreatmentDictionary:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTreatment)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  FCPersonalizationTreatment *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("treatmentDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FCPersonalizationTreatment initWithPersonalizationTreatmentDictionary:](self, "initWithPersonalizationTreatmentDictionary:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (*(_OWORD *)&self->_pbTreatment != 0)
  {
    v5 = v4;
    objc_msgSend(v4, "encodeObject:forKey:");
    v4 = v5;
  }

}

- (double)featureClicksByAction
{
  return self->_featureClicksByAction;
}

- (double)featureImpressionsByAction
{
  return self->_featureImpressionsByAction;
}

- (double)baselineClicksByAction
{
  return self->_baselineClicksByAction;
}

- (double)baselineImpressionsByAction
{
  return self->_baselineImpressionsByAction;
}

- (id)treatmentDictionary
{
  return self->_treatmentDictionary;
}

- (double)hourlyFlowRateMinimum
{
  return self->_hourlyFlowRateMinimum;
}

- (double)hourlyFlowRateSubscriptionCountBuffer
{
  return self->_hourlyFlowRateSubscriptionCountBuffer;
}

- (double)hourlyFlowRateDampeningFactor
{
  return self->_hourlyFlowRateDampeningFactor;
}

- (double)hourlyFlowRatePerSubscription
{
  return self->_hourlyFlowRatePerSubscription;
}

- (int64_t)extraArticlesToShowUser
{
  return self->_extraArticlesToShowUser;
}

- (double)hourlyFlowRateDecayFactor
{
  return self->_hourlyFlowRateDecayFactor;
}

- (double)hourlyFlowRatePriorWeight
{
  return self->_hourlyFlowRatePriorWeight;
}

- (double)hourlyFlowRateFloor
{
  return self->_hourlyFlowRateFloor;
}

- (double)hourlyFlowRateCeiling
{
  return self->_hourlyFlowRateCeiling;
}

- (double)hourlyFlowRateAlpha
{
  return self->_hourlyFlowRateAlpha;
}

- (double)hourlyFlowRateBeta
{
  return self->_hourlyFlowRateBeta;
}

- (double)hourlyFlowRateGamma
{
  return self->_hourlyFlowRateGamma;
}

- (double)publisherDiversificationInitialPenalty
{
  return self->_publisherDiversificationInitialPenalty;
}

- (double)publisherDiversificationPenaltyHalfLife
{
  return self->_publisherDiversificationPenaltyHalfLife;
}

- (double)presentationImpressionValue
{
  return self->_presentationImpressionValue;
}

- (double)heavyClickImpressionValue
{
  return self->_heavyClickImpressionValue;
}

- (double)likeImpressionValue
{
  return self->_likeImpressionValue;
}

- (double)shareImpressionValue
{
  return self->_shareImpressionValue;
}

- (double)savedImpressionValue
{
  return self->_savedImpressionValue;
}

- (double)subscribeImpressionValue
{
  return self->_subscribeImpressionValue;
}

- (double)subscribeRelatedImpressionValue
{
  return self->_subscribeRelatedImpressionValue;
}

- (double)existingSubscriptionImpressionValue
{
  return self->_existingSubscriptionImpressionValue;
}

- (double)existingSubscriptionRelatedImpressionValue
{
  return self->_existingSubscriptionRelatedImpressionValue;
}

- (double)unsubscribeImpressionValue
{
  return self->_unsubscribeImpressionValue;
}

- (double)tappedImpressionValue
{
  return self->_tappedImpressionValue;
}

- (double)weakClickImpressionValue
{
  return self->_weakClickImpressionValue;
}

- (double)visitImpressionValue
{
  return self->_visitImpressionValue;
}

- (double)dislikeImpressionValue
{
  return self->_dislikeImpressionValue;
}

- (double)recommendationPresentationFeedImpressionValue
{
  return self->_recommendationPresentationFeedImpressionValue;
}

- (double)recommendationPresentationExploreImpressionValue
{
  return self->_recommendationPresentationExploreImpressionValue;
}

- (double)premiumSubscriptionActivationImpressionValue
{
  return self->_premiumSubscriptionActivationImpressionValue;
}

- (double)muteImpressionValue
{
  return self->_muteImpressionValue;
}

- (double)unmuteImpressionValue
{
  return self->_unmuteImpressionValue;
}

- (double)videoInitiatePlaybackImpressionValue
{
  return self->_videoInitiatePlaybackImpressionValue;
}

- (double)videoCompletePlaybackImpressionValue
{
  return self->_videoCompletePlaybackImpressionValue;
}

- (double)videoComplete25ImpressionValue
{
  return self->_videoComplete25ImpressionValue;
}

- (double)videoComplete50ImpressionValue
{
  return self->_videoComplete50ImpressionValue;
}

- (double)videoComplete75ImpressionValue
{
  return self->_videoComplete75ImpressionValue;
}

- (double)newsTodayWidgetPresentationImpressionValue
{
  return self->_newsTodayWidgetPresentationImpressionValue;
}

- (double)newsTodayWidgetClickImpressionValue
{
  return self->_newsTodayWidgetClickImpressionValue;
}

- (double)newsTodayWidgetVideoPlaybackImpressionValue
{
  return self->_newsTodayWidgetVideoPlaybackImpressionValue;
}

- (double)appInstallImpressionValue
{
  return self->_appInstallImpressionValue;
}

- (double)appInFocusImpressionValue
{
  return self->_appInFocusImpressionValue;
}

- (double)safariHistoryImpressionValue
{
  return self->_safariHistoryImpressionValue;
}

- (double)publisherBoostForSourceMoreFromFeedImpressionValue
{
  return self->_publisherBoostForSourceMoreFromFeedImpressionValue;
}

- (double)topicBoostForSourceRelatedFeedImpressionValue
{
  return self->_topicBoostForSourceRelatedFeedImpressionValue;
}

- (double)publisherBoostForIssueOpenImpressionValue
{
  return self->_publisherBoostForIssueOpenImpressionValue;
}

- (double)trackVisitedImpressionValue
{
  return self->_trackVisitedImpressionValue;
}

- (double)trackListenedImpressionValue
{
  return self->_trackListenedImpressionValue;
}

- (double)trackFinishedImpressionValue
{
  return self->_trackFinishedImpressionValue;
}

- (double)sportsTagSeenImpressionValue
{
  return self->_sportsTagSeenImpressionValue;
}

- (double)ignoreImpressionValue
{
  return self->_ignoreImpressionValue;
}

- (double)presentationClickValue
{
  return self->_presentationClickValue;
}

- (double)heavyClickClickValue
{
  return self->_heavyClickClickValue;
}

- (double)likeClickValue
{
  return self->_likeClickValue;
}

- (double)shareClickValue
{
  return self->_shareClickValue;
}

- (double)savedClickValue
{
  return self->_savedClickValue;
}

- (double)subscribeClickValue
{
  return self->_subscribeClickValue;
}

- (double)subscribeRelatedClickValue
{
  return self->_subscribeRelatedClickValue;
}

- (double)existingSubscriptionClickValue
{
  return self->_existingSubscriptionClickValue;
}

- (double)existingSubscriptionRelatedClickValue
{
  return self->_existingSubscriptionRelatedClickValue;
}

- (double)unsubscribeClickValue
{
  return self->_unsubscribeClickValue;
}

- (double)tappedClickValue
{
  return self->_tappedClickValue;
}

- (double)weakClickClickValue
{
  return self->_weakClickClickValue;
}

- (double)visitClickValue
{
  return self->_visitClickValue;
}

- (double)dislikeClickValue
{
  return self->_dislikeClickValue;
}

- (double)recommendationPresentationFeedClickValue
{
  return self->_recommendationPresentationFeedClickValue;
}

- (double)recommendationPresentationExploreClickValue
{
  return self->_recommendationPresentationExploreClickValue;
}

- (double)premiumSubscriptionActivationClickValue
{
  return self->_premiumSubscriptionActivationClickValue;
}

- (double)muteClickValue
{
  return self->_muteClickValue;
}

- (double)unmuteClickValue
{
  return self->_unmuteClickValue;
}

- (double)videoInitiatePlaybackClickValue
{
  return self->_videoInitiatePlaybackClickValue;
}

- (double)videoCompletePlaybackClickValue
{
  return self->_videoCompletePlaybackClickValue;
}

- (double)videoComplete25ClickValue
{
  return self->_videoComplete25ClickValue;
}

- (double)videoComplete50ClickValue
{
  return self->_videoComplete50ClickValue;
}

- (double)videoComplete75ClickValue
{
  return self->_videoComplete75ClickValue;
}

- (double)newsTodayWidgetPresentationClickValue
{
  return self->_newsTodayWidgetPresentationClickValue;
}

- (double)newsTodayWidgetClickClickValue
{
  return self->_newsTodayWidgetClickClickValue;
}

- (double)newsTodayWidgetVideoPlaybackClickValue
{
  return self->_newsTodayWidgetVideoPlaybackClickValue;
}

- (double)appInstallClickValue
{
  return self->_appInstallClickValue;
}

- (double)appInFocusClickValue
{
  return self->_appInFocusClickValue;
}

- (double)safariHistoryClickValue
{
  return self->_safariHistoryClickValue;
}

- (double)publisherBoostForSourceMoreFromFeedClickValue
{
  return self->_publisherBoostForSourceMoreFromFeedClickValue;
}

- (double)topicBoostForSourceRelatedFeedClickValue
{
  return self->_topicBoostForSourceRelatedFeedClickValue;
}

- (double)publisherBoostForIssueOpenClickValue
{
  return self->_publisherBoostForIssueOpenClickValue;
}

- (double)trackVisitedClickValue
{
  return self->_trackVisitedClickValue;
}

- (double)trackListenedClickValue
{
  return self->_trackListenedClickValue;
}

- (double)trackFinishedClickValue
{
  return self->_trackFinishedClickValue;
}

- (double)sportsTagSeenClickValue
{
  return self->_sportsTagSeenClickValue;
}

- (double)ignoreClickValue
{
  return self->_ignoreClickValue;
}

- (double)presentationBaselineImpressionValue
{
  return self->_presentationBaselineImpressionValue;
}

- (double)heavyClickBaselineImpressionValue
{
  return self->_heavyClickBaselineImpressionValue;
}

- (double)likeBaselineImpressionValue
{
  return self->_likeBaselineImpressionValue;
}

- (double)shareBaselineImpressionValue
{
  return self->_shareBaselineImpressionValue;
}

- (double)savedBaselineImpressionValue
{
  return self->_savedBaselineImpressionValue;
}

- (double)subscribeBaselineImpressionValue
{
  return self->_subscribeBaselineImpressionValue;
}

- (double)subscribeRelatedBaselineImpressionValue
{
  return self->_subscribeRelatedBaselineImpressionValue;
}

- (double)existingSubscriptionBaselineImpressionValue
{
  return self->_existingSubscriptionBaselineImpressionValue;
}

- (double)existingSubscriptionRelatedBaselineImpressionValue
{
  return self->_existingSubscriptionRelatedBaselineImpressionValue;
}

- (double)unsubscribeBaselineImpressionValue
{
  return self->_unsubscribeBaselineImpressionValue;
}

- (double)tappedBaselineImpressionValue
{
  return self->_tappedBaselineImpressionValue;
}

- (double)weakClickBaselineImpressionValue
{
  return self->_weakClickBaselineImpressionValue;
}

- (double)visitBaselineImpressionValue
{
  return self->_visitBaselineImpressionValue;
}

- (double)dislikeBaselineImpressionValue
{
  return self->_dislikeBaselineImpressionValue;
}

- (double)recommendationPresentationFeedBaselineImpressionValue
{
  return self->_recommendationPresentationFeedBaselineImpressionValue;
}

- (double)recommendationPresentationExploreBaselineImpressionValue
{
  return self->_recommendationPresentationExploreBaselineImpressionValue;
}

- (double)premiumSubscriptionActivationBaselineImpressionValue
{
  return self->_premiumSubscriptionActivationBaselineImpressionValue;
}

- (double)muteBaselineImpressionValue
{
  return self->_muteBaselineImpressionValue;
}

- (double)unmuteBaselineImpressionValue
{
  return self->_unmuteBaselineImpressionValue;
}

- (double)videoInitiatePlaybackBaselineImpressionValue
{
  return self->_videoInitiatePlaybackBaselineImpressionValue;
}

- (double)videoCompletePlaybackBaselineImpressionValue
{
  return self->_videoCompletePlaybackBaselineImpressionValue;
}

- (double)videoComplete25BaselineImpressionValue
{
  return self->_videoComplete25BaselineImpressionValue;
}

- (double)videoComplete50BaselineImpressionValue
{
  return self->_videoComplete50BaselineImpressionValue;
}

- (double)videoComplete75BaselineImpressionValue
{
  return self->_videoComplete75BaselineImpressionValue;
}

- (double)newsTodayWidgetPresentationBaselineImpressionValue
{
  return self->_newsTodayWidgetPresentationBaselineImpressionValue;
}

- (double)newsTodayWidgetClickBaselineImpressionValue
{
  return self->_newsTodayWidgetClickBaselineImpressionValue;
}

- (double)newsTodayWidgetVideoPlaybackBaselineImpressionValue
{
  return self->_newsTodayWidgetVideoPlaybackBaselineImpressionValue;
}

- (double)appInstallBaselineImpressionValue
{
  return self->_appInstallBaselineImpressionValue;
}

- (double)appInFocusBaselineImpressionValue
{
  return self->_appInFocusBaselineImpressionValue;
}

- (double)safariHistoryBaselineImpressionValue
{
  return self->_safariHistoryBaselineImpressionValue;
}

- (double)publisherBoostForSourceMoreFromFeedBaselineImpressionValue
{
  return self->_publisherBoostForSourceMoreFromFeedBaselineImpressionValue;
}

- (double)topicBoostForSourceRelatedFeedBaselineImpressionValue
{
  return self->_topicBoostForSourceRelatedFeedBaselineImpressionValue;
}

- (double)publisherBoostForIssueOpenBaselineImpressionValue
{
  return self->_publisherBoostForIssueOpenBaselineImpressionValue;
}

- (double)trackVisitedBaselineImpressionValue
{
  return self->_trackVisitedBaselineImpressionValue;
}

- (double)trackListenedBaselineImpressionValue
{
  return self->_trackListenedBaselineImpressionValue;
}

- (double)trackFinishedBaselineImpressionValue
{
  return self->_trackFinishedBaselineImpressionValue;
}

- (double)sportsTagSeenBaselineImpressionValue
{
  return self->_sportsTagSeenBaselineImpressionValue;
}

- (double)ignoreBaselineImpressionValue
{
  return self->_ignoreBaselineImpressionValue;
}

- (double)presentationBaselineClickValue
{
  return self->_presentationBaselineClickValue;
}

- (double)heavyClickBaselineClickValue
{
  return self->_heavyClickBaselineClickValue;
}

- (double)likeBaselineClickValue
{
  return self->_likeBaselineClickValue;
}

- (double)shareBaselineClickValue
{
  return self->_shareBaselineClickValue;
}

- (double)savedBaselineClickValue
{
  return self->_savedBaselineClickValue;
}

- (double)subscribeBaselineClickValue
{
  return self->_subscribeBaselineClickValue;
}

- (double)subscribeRelatedBaselineClickValue
{
  return self->_subscribeRelatedBaselineClickValue;
}

- (double)existingSubscriptionBaselineClickValue
{
  return self->_existingSubscriptionBaselineClickValue;
}

- (double)existingSubscriptionRelatedBaselineClickValue
{
  return self->_existingSubscriptionRelatedBaselineClickValue;
}

- (double)unsubscribeBaselineClickValue
{
  return self->_unsubscribeBaselineClickValue;
}

- (double)tappedBaselineClickValue
{
  return self->_tappedBaselineClickValue;
}

- (double)weakClickBaselineClickValue
{
  return self->_weakClickBaselineClickValue;
}

- (double)visitBaselineClickValue
{
  return self->_visitBaselineClickValue;
}

- (double)dislikeBaselineClickValue
{
  return self->_dislikeBaselineClickValue;
}

- (double)recommendationPresentationFeedBaselineClickValue
{
  return self->_recommendationPresentationFeedBaselineClickValue;
}

- (double)recommendationPresentationExploreBaselineClickValue
{
  return self->_recommendationPresentationExploreBaselineClickValue;
}

- (double)premiumSubscriptionActivationBaselineClickValue
{
  return self->_premiumSubscriptionActivationBaselineClickValue;
}

- (double)muteBaselineClickValue
{
  return self->_muteBaselineClickValue;
}

- (double)unmuteBaselineClickValue
{
  return self->_unmuteBaselineClickValue;
}

- (double)videoInitiatePlaybackBaselineClickValue
{
  return self->_videoInitiatePlaybackBaselineClickValue;
}

- (double)videoCompletePlaybackBaselineClickValue
{
  return self->_videoCompletePlaybackBaselineClickValue;
}

- (double)videoComplete25BaselineClickValue
{
  return self->_videoComplete25BaselineClickValue;
}

- (double)videoComplete50BaselineClickValue
{
  return self->_videoComplete50BaselineClickValue;
}

- (double)videoComplete75BaselineClickValue
{
  return self->_videoComplete75BaselineClickValue;
}

- (double)newsTodayWidgetPresentationBaselineClickValue
{
  return self->_newsTodayWidgetPresentationBaselineClickValue;
}

- (double)newsTodayWidgetClickBaselineClickValue
{
  return self->_newsTodayWidgetClickBaselineClickValue;
}

- (double)newsTodayWidgetVideoPlaybackBaselineClickValue
{
  return self->_newsTodayWidgetVideoPlaybackBaselineClickValue;
}

- (double)appInstallBaselineClickValue
{
  return self->_appInstallBaselineClickValue;
}

- (double)appInFocusBaselineClickValue
{
  return self->_appInFocusBaselineClickValue;
}

- (double)safariHistoryBaselineClickValue
{
  return self->_safariHistoryBaselineClickValue;
}

- (double)publisherBoostForSourceMoreFromFeedBaselineClickValue
{
  return self->_publisherBoostForSourceMoreFromFeedBaselineClickValue;
}

- (double)topicBoostForSourceRelatedFeedBaselineClickValue
{
  return self->_topicBoostForSourceRelatedFeedBaselineClickValue;
}

- (double)publisherBoostForIssueOpenBaselineClickValue
{
  return self->_publisherBoostForIssueOpenBaselineClickValue;
}

- (double)trackVisitedBaselineClickValue
{
  return self->_trackVisitedBaselineClickValue;
}

- (double)trackListenedBaselineClickValue
{
  return self->_trackListenedBaselineClickValue;
}

- (double)trackFinishedBaselineClickValue
{
  return self->_trackFinishedBaselineClickValue;
}

- (double)sportsTagSeenBaselineClickValue
{
  return self->_sportsTagSeenBaselineClickValue;
}

- (double)ignoreBaselineClickValue
{
  return self->_ignoreBaselineClickValue;
}

- (double)heavyClickMinimumDuration
{
  return self->_heavyClickMinimumDuration;
}

- (int64_t)trackVisitedMinimumDuration
{
  return self->_trackVisitedMinimumDuration;
}

- (int64_t)trackListenedMinimumDuration
{
  return self->_trackListenedMinimumDuration;
}

- (double)swipeToArticleWeakClickMinimumDuration
{
  return self->_swipeToArticleWeakClickMinimumDuration;
}

- (double)swipeToArticleHeavyClickMinimumDuration
{
  return self->_swipeToArticleHeavyClickMinimumDuration;
}

- (double)lowQualityContentThreshold
{
  return self->_lowQualityContentThreshold;
}

- (double)sportsTagSeenMinimumDuration
{
  return self->_sportsTagSeenMinimumDuration;
}

- (BOOL)sportsTagSeenEnableFeedSource
{
  return self->_sportsTagSeenEnableFeedSource;
}

- (BOOL)sportsTagSeenEnableSportsManagementSource
{
  return self->_sportsTagSeenEnableSportsManagementSource;
}

- (BOOL)sportsTagSeenEnableSportsManagementDetailSource
{
  return self->_sportsTagSeenEnableSportsManagementDetailSource;
}

- (int64_t)thumbnailMinHammingDistance
{
  return self->_thumbnailMinHammingDistance;
}

- (int64_t)minClusterSizeIPhone
{
  return self->_minClusterSizeIPhone;
}

- (int64_t)maxClusterSizeIPhone
{
  return self->_maxClusterSizeIPhone;
}

- (int64_t)minMoreForYouSizeIPhone
{
  return self->_minMoreForYouSizeIPhone;
}

- (int64_t)maxMoreForYouSizeIPhone
{
  return self->_maxMoreForYouSizeIPhone;
}

- (int64_t)minIdealClusterSizeIPhone
{
  return self->_minIdealClusterSizeIPhone;
}

- (int64_t)maxIdealClusterSizeIPhone
{
  return self->_maxIdealClusterSizeIPhone;
}

- (int64_t)minClusterSizeIPhoneAutoFavorite
{
  return self->_minClusterSizeIPhoneAutoFavorite;
}

- (int64_t)maxClusterSizeIPhoneAutoFavorite
{
  return self->_maxClusterSizeIPhoneAutoFavorite;
}

- (int64_t)minIdealClusterSizeIPhoneAutoFavorite
{
  return self->_minIdealClusterSizeIPhoneAutoFavorite;
}

- (int64_t)maxIdealClusterSizeIPhoneAutoFavorite
{
  return self->_maxIdealClusterSizeIPhoneAutoFavorite;
}

- (int64_t)maxPublisherOccurrencesIPhone
{
  return self->_maxPublisherOccurrencesIPhone;
}

- (int64_t)maxPublisherOccurrencesIPhoneBestOfBundle
{
  return self->_maxPublisherOccurrencesIPhoneBestOfBundle;
}

- (int64_t)maxPublisherOccurrencesIPhoneForYouGroup
{
  return self->_maxPublisherOccurrencesIPhoneForYouGroup;
}

- (int64_t)maxPublisherOccurrencesIPhoneGreatStoriesYouMissed
{
  return self->_maxPublisherOccurrencesIPhoneGreatStoriesYouMissed;
}

- (int64_t)maxUnpaidArticlesIPhone
{
  return self->_maxUnpaidArticlesIPhone;
}

- (int64_t)maxUnpaidArticlesIPhoneBestOfBundle
{
  return self->_maxUnpaidArticlesIPhoneBestOfBundle;
}

- (int64_t)maxUnpaidArticlesIPhoneForYouGroup
{
  return self->_maxUnpaidArticlesIPhoneForYouGroup;
}

- (int64_t)maxUnpaidArticlesIPhoneGreatStoriesYouMissed
{
  return self->_maxUnpaidArticlesIPhoneGreatStoriesYouMissed;
}

- (int64_t)maxNativeAdCountIPhone
{
  return self->_maxNativeAdCountIPhone;
}

- (int64_t)maxNativeAdCountIPhoneBestOfBundle
{
  return self->_maxNativeAdCountIPhoneBestOfBundle;
}

- (int64_t)maxNativeAdCountIPhoneForYouGroup
{
  return self->_maxNativeAdCountIPhoneForYouGroup;
}

- (int64_t)maxNativeAdCountIPhoneGreatStoriesYouMissed
{
  return self->_maxNativeAdCountIPhoneGreatStoriesYouMissed;
}

- (int64_t)minClusterSizeIPad
{
  return self->_minClusterSizeIPad;
}

- (int64_t)maxClusterSizeIPad
{
  return self->_maxClusterSizeIPad;
}

- (int64_t)minMoreForYouSizeIPad
{
  return self->_minMoreForYouSizeIPad;
}

- (int64_t)maxMoreForYouSizeIPad
{
  return self->_maxMoreForYouSizeIPad;
}

- (int64_t)minIdealClusterSizeIPad
{
  return self->_minIdealClusterSizeIPad;
}

- (int64_t)maxIdealClusterSizeIPad
{
  return self->_maxIdealClusterSizeIPad;
}

- (int64_t)minClusterSizeIPadAutoFavorite
{
  return self->_minClusterSizeIPadAutoFavorite;
}

- (int64_t)maxClusterSizeIPadAutoFavorite
{
  return self->_maxClusterSizeIPadAutoFavorite;
}

- (int64_t)minIdealClusterSizeIPadAutoFavorite
{
  return self->_minIdealClusterSizeIPadAutoFavorite;
}

- (int64_t)maxIdealClusterSizeIPadAutoFavorite
{
  return self->_maxIdealClusterSizeIPadAutoFavorite;
}

- (int64_t)maxPublisherOccurrencesIPad
{
  return self->_maxPublisherOccurrencesIPad;
}

- (int64_t)maxPublisherOccurrencesIPadBestOfBundle
{
  return self->_maxPublisherOccurrencesIPadBestOfBundle;
}

- (int64_t)maxPublisherOccurrencesIPadForYouGroup
{
  return self->_maxPublisherOccurrencesIPadForYouGroup;
}

- (int64_t)maxPublisherOccurrencesIPadGreatStoriesYouMissed
{
  return self->_maxPublisherOccurrencesIPadGreatStoriesYouMissed;
}

- (int64_t)maxUnpaidArticlesIPad
{
  return self->_maxUnpaidArticlesIPad;
}

- (int64_t)maxUnpaidArticlesIPadBestOfBundle
{
  return self->_maxUnpaidArticlesIPadBestOfBundle;
}

- (int64_t)maxUnpaidArticlesIPadForYouGroup
{
  return self->_maxUnpaidArticlesIPadForYouGroup;
}

- (int64_t)maxUnpaidArticlesIPadGreatStoriesYouMissed
{
  return self->_maxUnpaidArticlesIPadGreatStoriesYouMissed;
}

- (int64_t)maxNativeAdCountIPad
{
  return self->_maxNativeAdCountIPad;
}

- (int64_t)maxNativeAdCountIPadBestOfBundle
{
  return self->_maxNativeAdCountIPadBestOfBundle;
}

- (int64_t)maxNativeAdCountIPadForYouGroup
{
  return self->_maxNativeAdCountIPadForYouGroup;
}

- (int64_t)maxNativeAdCountIPadGreatStoriesYouMissed
{
  return self->_maxNativeAdCountIPadGreatStoriesYouMissed;
}

- (double)relatedTopicMultiplier
{
  return self->_relatedTopicMultiplier;
}

- (double)relatedTopicRatioFilter
{
  return self->_relatedTopicRatioFilter;
}

- (double)managedTopicMultiplier
{
  return self->_managedTopicMultiplier;
}

- (double)managedWinnerTopicMultiplier
{
  return self->_managedWinnerTopicMultiplier;
}

- (double)topicAutofavoritedMultiplier
{
  return self->_topicAutofavoritedMultiplier;
}

- (double)topicFavoritedMultiplier
{
  return self->_topicFavoritedMultiplier;
}

- (double)topicGroupSizeMultiplier
{
  return self->_topicGroupSizeMultiplier;
}

- (double)topicGroupableMultiplier
{
  return self->_topicGroupableMultiplier;
}

- (double)channelScoreWeight
{
  return self->_channelScoreWeight;
}

- (double)topicScoreWeight
{
  return self->_topicScoreWeight;
}

- (double)topicSpecificityMultiplier
{
  return self->_topicSpecificityMultiplier;
}

- (unint64_t)publisherDiversityMinPublisherCount
{
  return self->_publisherDiversityMinPublisherCount;
}

- (unint64_t)publisherDiversityMaxPublisherCount
{
  return self->_publisherDiversityMaxPublisherCount;
}

- (double)publisherDiversityMaxArticleFilter
{
  return self->_publisherDiversityMaxArticleFilter;
}

- (int64_t)maxEvergreenArticlesPerGroup
{
  return self->_maxEvergreenArticlesPerGroup;
}

- (double)internalUsageSignalWeight
{
  return self->_internalUsageSignalWeight;
}

- (double)autoFavoriteMinClicks
{
  return self->_autoFavoriteMinClicks;
}

- (double)autoFavoriteMinEvents
{
  return self->_autoFavoriteMinEvents;
}

- (double)autoFavoriteMinRate
{
  return self->_autoFavoriteMinRate;
}

- (double)autoFavoriteMinRelativeRate
{
  return self->_autoFavoriteMinRelativeRate;
}

- (double)autoUnfavoriteFactor
{
  return self->_autoUnfavoriteFactor;
}

- (double)autoGroupableFactor
{
  return self->_autoGroupableFactor;
}

- (double)autoFavoriteTagFavorabilityExponent
{
  return self->_autoFavoriteTagFavorabilityExponent;
}

- (double)autoFavoritePriorFactorExponent
{
  return self->_autoFavoritePriorFactorExponent;
}

- (double)autoFavoriteMaxIdleTime
{
  return self->_autoFavoriteMaxIdleTime;
}

- (double)safariSignalWeight
{
  return self->_safariSignalWeight;
}

- (double)safariTimeDecayMultiplier
{
  return self->_safariTimeDecayMultiplier;
}

- (double)safariOccurrenceDecayMultiplier
{
  return self->_safariOccurrenceDecayMultiplier;
}

- (double)autoFavoriteMinObservationsSafari
{
  return self->_autoFavoriteMinObservationsSafari;
}

- (double)autoFavoriteMinScoreSafari
{
  return self->_autoFavoriteMinScoreSafari;
}

- (double)safariTagFavorabilityExponent
{
  return self->_safariTagFavorabilityExponent;
}

- (double)safariPriorFactorExponent
{
  return self->_safariPriorFactorExponent;
}

- (double)safariEventBlackoutSeconds
{
  return self->_safariEventBlackoutSeconds;
}

- (double)appUsageSignalWeight
{
  return self->_appUsageSignalWeight;
}

- (double)appUsageTimeDecayMultiplier
{
  return self->_appUsageTimeDecayMultiplier;
}

- (double)appUsageOccurrenceDecayMultiplier
{
  return self->_appUsageOccurrenceDecayMultiplier;
}

- (double)autoFavoriteMinObservationsExtAppUsage
{
  return self->_autoFavoriteMinObservationsExtAppUsage;
}

- (double)autoFavoriteMinScoreExtAppUsage
{
  return self->_autoFavoriteMinScoreExtAppUsage;
}

- (double)appUsageTagFavorabilityExponent
{
  return self->_appUsageTagFavorabilityExponent;
}

- (double)appUsagePriorFactorExponent
{
  return self->_appUsagePriorFactorExponent;
}

- (double)portraitSignalWeight
{
  return self->_portraitSignalWeight;
}

- (double)portraitDecayRate
{
  return self->_portraitDecayRate;
}

- (double)portraitGlobalThreshold
{
  return self->_portraitGlobalThreshold;
}

- (double)portraitTagFavorabilityExponent
{
  return self->_portraitTagFavorabilityExponent;
}

- (double)portraitPriorFactorExponent
{
  return self->_portraitPriorFactorExponent;
}

- (double)groupImpressionBiasCorrectionFactor
{
  return self->_groupImpressionBiasCorrectionFactor;
}

- (double)indexImpressionBiasCorrectionFactor
{
  return self->_indexImpressionBiasCorrectionFactor;
}

- (int64_t)maxNumberOfSuggestions
{
  return self->_maxNumberOfSuggestions;
}

- (double)uGroupMinimumSubscribedChannelSourceFeedArticleRatio
{
  return self->_uGroupMinimumSubscribedChannelSourceFeedArticleRatio;
}

- (int64_t)numEventsToDisableDefaultTopics
{
  return self->_numEventsToDisableDefaultTopics;
}

- (int64_t)numSubscriptionsToDisableDefaultTopics
{
  return self->_numSubscriptionsToDisableDefaultTopics;
}

- (double)metaGroupingRelatednessThreshold
{
  return self->_metaGroupingRelatednessThreshold;
}

- (double)metaGroupingRelatednessKWeight
{
  return self->_metaGroupingRelatednessKWeight;
}

- (double)metaGroupingTopicScoreWeight
{
  return self->_metaGroupingTopicScoreWeight;
}

- (double)metaGroupingHighestScoringRelativeScoreMultiplier
{
  return self->_metaGroupingHighestScoringRelativeScoreMultiplier;
}

- (double)metaGroupingSubscribedTopicMultiplier
{
  return self->_metaGroupingSubscribedTopicMultiplier;
}

- (int64_t)auditionedAutoFavoritesEmitterLimit
{
  return self->_auditionedAutoFavoritesEmitterLimit;
}

- (double)topicDiversityThreshold
{
  return self->_topicDiversityThreshold;
}

- (int64_t)topicDiversityWindowSize
{
  return self->_topicDiversityWindowSize;
}

- (int64_t)minBaselineEventsToSubmitUserVector
{
  return self->_minBaselineEventsToSubmitUserVector;
}

- (BOOL)personalizesSportsTagsInUserVector
{
  return self->_personalizesSportsTagsInUserVector;
}

- (FCPersonalizationScoringConfig)topicFeedScoringConfig
{
  return self->_topicFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)magazineFeedArticleScoringConfig
{
  return self->_magazineFeedArticleScoringConfig;
}

- (FCPersonalizationScoringConfig)magazineFeedIssueScoringConfig
{
  return self->_magazineFeedIssueScoringConfig;
}

- (FCPersonalizationScoringConfig)legacyAudioFeedScoringConfig
{
  return self->_legacyAudioFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)audioFeedScoringConfig
{
  return self->_audioFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationPrimaryScoringConfig
{
  return self->_articleRecirculationPrimaryScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationSecondaryScoringConfig
{
  return self->_articleRecirculationSecondaryScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationTertiaryScoringConfig
{
  return self->_articleRecirculationTertiaryScoringConfig;
}

- (FCPersonalizationScoringConfig)articleRecirculationQuaternaryScoringConfig
{
  return self->_articleRecirculationQuaternaryScoringConfig;
}

- (FCPersonalizationScoringConfig)bestOfBundleScoringConfig
{
  return self->_bestOfBundleScoringConfig;
}

- (FCPersonalizationScoringConfig)curatedScoringConfig
{
  return self->_curatedScoringConfig;
}

- (FCPersonalizationScoringConfig)curatedIssuesScoringConfig
{
  return self->_curatedIssuesScoringConfig;
}

- (FCPersonalizationScoringConfig)greatStoriesYouMissedScoringConfig
{
  return self->_greatStoriesYouMissedScoringConfig;
}

- (FCPersonalizationScoringConfig)latestStoriesScoringConfig
{
  return self->_latestStoriesScoringConfig;
}

- (FCPersonalizationScoringConfig)localNewsScoringConfig
{
  return self->_localNewsScoringConfig;
}

- (FCPersonalizationScoringConfig)newspaperMagazineFeedScoringConfig
{
  return self->_newspaperMagazineFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)todayWidgetScoringConfig
{
  return self->_todayWidgetScoringConfig;
}

- (FCPersonalizationScoringConfig)tagWidgetScoringConfig
{
  return self->_tagWidgetScoringConfig;
}

- (FCPersonalizationScoringConfig)notificationScoringConfig
{
  return self->_notificationScoringConfig;
}

- (FCPersonalizationScoringConfig)mySportsGroupScoringConfig
{
  return self->_mySportsGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)mySportsGroupForYouScoringConfig
{
  return self->_mySportsGroupForYouScoringConfig;
}

- (FCPersonalizationScoringConfig)mySportsTopicsScoringConfig
{
  return self->_mySportsTopicsScoringConfig;
}

- (FCPersonalizationScoringConfig)sportsTopStoriesScoringConfig
{
  return self->_sportsTopStoriesScoringConfig;
}

- (FCPersonalizationScoringConfig)introToSportsGroupScoringConfig
{
  return self->_introToSportsGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)introToSportsGroupForYouScoringConfig
{
  return self->_introToSportsGroupForYouScoringConfig;
}

- (FCPersonalizationScoringConfig)highlightsGroupScoringConfig
{
  return self->_highlightsGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)articleListTagFeedGroupScoringConfig
{
  return self->_articleListTagFeedGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)tagFeedScoringConfig
{
  return self->_tagFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)newspaperTodayFeedScoringConfig
{
  return self->_newspaperTodayFeedScoringConfig;
}

- (FCPersonalizationScoringConfig)moreForYouScoringConfig
{
  return self->_moreForYouScoringConfig;
}

- (FCPersonalizationScoringConfig)localSectionGroupScoringConfig
{
  return self->_localSectionGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)newspaperSectionGroupScoringConfig
{
  return self->_newspaperSectionGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)sportsEventArticlesGroupScoringConfig
{
  return self->_sportsEventArticlesGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)tagForYouGroupScoringConfig
{
  return self->_tagForYouGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)tagRecentStoriesScoringConfig
{
  return self->_tagRecentStoriesScoringConfig;
}

- (FCPersonalizationScoringConfig)tagDateRangeScoringConfig
{
  return self->_tagDateRangeScoringConfig;
}

- (FCPersonalizationScoringConfig)sportsEventTopicGroupScoringConfig
{
  return self->_sportsEventTopicGroupScoringConfig;
}

- (FCPersonalizationScoringConfig)affinityGroupScoringConfig
{
  return self->_affinityGroupScoringConfig;
}

- (FCPersonalizationTagScoringConfig)sportsTagScoringConfig
{
  return self->_sportsTagScoringConfig;
}

- (FCPersonalizationTopicsConfig)topicFeedTopicsConfig
{
  return self->_topicFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)magazineFeedArticleTopicsConfig
{
  return self->_magazineFeedArticleTopicsConfig;
}

- (FCPersonalizationTopicsConfig)magazineFeedIssueTopicsConfig
{
  return self->_magazineFeedIssueTopicsConfig;
}

- (FCPersonalizationTopicsConfig)legacyAudioFeedTopicsConfig
{
  return self->_legacyAudioFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)audioFeedTopicsConfig
{
  return self->_audioFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationPrimaryTopicsConfig
{
  return self->_articleRecirculationPrimaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationSecondaryTopicsConfig
{
  return self->_articleRecirculationSecondaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationTertiaryTopicsConfig
{
  return self->_articleRecirculationTertiaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleRecirculationQuaternaryTopicsConfig
{
  return self->_articleRecirculationQuaternaryTopicsConfig;
}

- (FCPersonalizationTopicsConfig)bestOfBundleTopicsConfig
{
  return self->_bestOfBundleTopicsConfig;
}

- (FCPersonalizationTopicsConfig)curatedTopicsConfig
{
  return self->_curatedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)curatedIssuesTopicsConfig
{
  return self->_curatedIssuesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)greatStoriesYouMissedTopicsConfig
{
  return self->_greatStoriesYouMissedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)latestStoriesTopicsConfig
{
  return self->_latestStoriesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)localNewsTopicsConfig
{
  return self->_localNewsTopicsConfig;
}

- (FCPersonalizationTopicsConfig)newspaperMagazineFeedTopicsConfig
{
  return self->_newspaperMagazineFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)todayWidgetTopicsConfig
{
  return self->_todayWidgetTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagWidgetTopicsConfig
{
  return self->_tagWidgetTopicsConfig;
}

- (FCPersonalizationTopicsConfig)mySportsGroupTopicsConfig
{
  return self->_mySportsGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)mySportsGroupForYouTopicsConfig
{
  return self->_mySportsGroupForYouTopicsConfig;
}

- (FCPersonalizationTopicsConfig)mySportsTopicsTopicsConfig
{
  return self->_mySportsTopicsTopicsConfig;
}

- (FCPersonalizationTopicsConfig)sportsTopStoriesTopicsConfig
{
  return self->_sportsTopStoriesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)introToSportsGroupTopicsConfig
{
  return self->_introToSportsGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)introToSportsGroupForYouTopicsConfig
{
  return self->_introToSportsGroupForYouTopicsConfig;
}

- (FCPersonalizationTopicsConfig)highlightsGroupTopicsConfig
{
  return self->_highlightsGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)articleListTagFeedGroupTopicsConfig
{
  return self->_articleListTagFeedGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagFeedTopicsConfig
{
  return self->_tagFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)newspaperTodayFeedTopicsConfig
{
  return self->_newspaperTodayFeedTopicsConfig;
}

- (FCPersonalizationTopicsConfig)moreForYouTopicsConfig
{
  return self->_moreForYouTopicsConfig;
}

- (FCPersonalizationTopicsConfig)localSectionGroupTopicsConfig
{
  return self->_localSectionGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)newspaperSectionGroupTopicsConfig
{
  return self->_newspaperSectionGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)sportsEventArticlesGroupTopicsConfig
{
  return self->_sportsEventArticlesGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagForYouGroupTopicsConfig
{
  return self->_tagForYouGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagRecentStoriesTopicsConfig
{
  return self->_tagRecentStoriesTopicsConfig;
}

- (FCPersonalizationTopicsConfig)tagDateRangeTopicsConfig
{
  return self->_tagDateRangeTopicsConfig;
}

- (FCPersonalizationTopicsConfig)sportsEventTopicGroupTopicsConfig
{
  return self->_sportsEventTopicGroupTopicsConfig;
}

- (FCPersonalizationTopicsConfig)affinityGroupTopicsConfig
{
  return self->_affinityGroupTopicsConfig;
}

- (FCPersonalizationOntologyLevelConfig)topicFeedOntologyLevelConfig
{
  return self->_topicFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)magazineFeedArticleOntologyLevelConfig
{
  return self->_magazineFeedArticleOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)magazineFeedIssueOntologyLevelConfig
{
  return self->_magazineFeedIssueOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)legacyAudioFeedOntologyLevelConfig
{
  return self->_legacyAudioFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)audioFeedOntologyLevelConfig
{
  return self->_audioFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationPrimaryOntologyLevelConfig
{
  return self->_articleRecirculationPrimaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationSecondaryOntologyLevelConfig
{
  return self->_articleRecirculationSecondaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationTertiaryOntologyLevelConfig
{
  return self->_articleRecirculationTertiaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleRecirculationQuaternaryOntologyLevelConfig
{
  return self->_articleRecirculationQuaternaryOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)bestOfBundleOntologyLevelConfig
{
  return self->_bestOfBundleOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)curatedOntologyLevelConfig
{
  return self->_curatedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)curatedIssuesOntologyLevelConfig
{
  return self->_curatedIssuesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)greatStoriesYouMissedOntologyLevelConfig
{
  return self->_greatStoriesYouMissedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)latestStoriesOntologyLevelConfig
{
  return self->_latestStoriesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)localNewsOntologyLevelConfig
{
  return self->_localNewsOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)newspaperMagazineFeedOntologyLevelConfig
{
  return self->_newspaperMagazineFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)todayWidgetOntologyLevelConfig
{
  return self->_todayWidgetOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagWidgetOntologyLevelConfig
{
  return self->_tagWidgetOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)mySportsGroupOntologyLevelConfig
{
  return self->_mySportsGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)mySportsGroupForYouOntologyLevelConfig
{
  return self->_mySportsGroupForYouOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)mySportsTopicsOntologyLevelConfig
{
  return self->_mySportsTopicsOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)sportsTopStoriesOntologyLevelConfig
{
  return self->_sportsTopStoriesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)introToSportsGroupOntologyLevelConfig
{
  return self->_introToSportsGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)introToSportsGroupForYouOntologyLevelConfig
{
  return self->_introToSportsGroupForYouOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)highlightsGroupOntologyLevelConfig
{
  return self->_highlightsGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)articleListTagFeedGroupOntologyLevelConfig
{
  return self->_articleListTagFeedGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagFeedOntologyLevelConfig
{
  return self->_tagFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)newspaperTodayFeedOntologyLevelConfig
{
  return self->_newspaperTodayFeedOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)moreForYouOntologyLevelConfig
{
  return self->_moreForYouOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)localSectionGroupOntologyLevelConfig
{
  return self->_localSectionGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)newspaperSectionGroupOntologyLevelConfig
{
  return self->_newspaperSectionGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)sportsEventArticlesGroupOntologyLevelConfig
{
  return self->_sportsEventArticlesGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagForYouGroupOntologyLevelConfig
{
  return self->_tagForYouGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagRecentStoriesOntologyLevelConfig
{
  return self->_tagRecentStoriesOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)tagDateRangeOntologyLevelConfig
{
  return self->_tagDateRangeOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)sportsEventTopicGroupOntologyLevelConfig
{
  return self->_sportsEventTopicGroupOntologyLevelConfig;
}

- (FCPersonalizationOntologyLevelConfig)affinityGroupOntologyLevelConfig
{
  return self->_affinityGroupOntologyLevelConfig;
}

- (NSDictionary)shadowDefaultScoringConfig
{
  return self->_shadowDefaultScoringConfig;
}

- (NSDictionary)shadowTopicFeedScoringConfig
{
  return self->_shadowTopicFeedScoringConfig;
}

- (NSDictionary)shadowMagazineFeedArticleScoringConfig
{
  return self->_shadowMagazineFeedArticleScoringConfig;
}

- (NSDictionary)shadowMagazineFeedIssueScoringConfig
{
  return self->_shadowMagazineFeedIssueScoringConfig;
}

- (NSDictionary)shadowLegacyAudioFeedScoringConfig
{
  return self->_shadowLegacyAudioFeedScoringConfig;
}

- (NSDictionary)shadowAudioFeedScoringConfig
{
  return self->_shadowAudioFeedScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationPrimaryScoringConfig
{
  return self->_shadowArticleRecirculationPrimaryScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationSecondaryScoringConfig
{
  return self->_shadowArticleRecirculationSecondaryScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationTertiaryScoringConfig
{
  return self->_shadowArticleRecirculationTertiaryScoringConfig;
}

- (NSDictionary)shadowArticleRecirculationQuaternaryScoringConfig
{
  return self->_shadowArticleRecirculationQuaternaryScoringConfig;
}

- (NSDictionary)shadowBestOfBundleScoringConfig
{
  return self->_shadowBestOfBundleScoringConfig;
}

- (NSDictionary)shadowCuratedScoringConfig
{
  return self->_shadowCuratedScoringConfig;
}

- (NSDictionary)shadowCuratedIssuesScoringConfig
{
  return self->_shadowCuratedIssuesScoringConfig;
}

- (NSDictionary)shadowForYouScoringConfig
{
  return self->_shadowForYouScoringConfig;
}

- (NSDictionary)shadowGreatStoriesYouMissedScoringConfig
{
  return self->_shadowGreatStoriesYouMissedScoringConfig;
}

- (NSDictionary)shadowLatestStoriesScoringConfig
{
  return self->_shadowLatestStoriesScoringConfig;
}

- (NSDictionary)shadowLocalNewsScoringConfig
{
  return self->_shadowLocalNewsScoringConfig;
}

- (NSDictionary)shadowNewspaperMagazineFeedScoringConfig
{
  return self->_shadowNewspaperMagazineFeedScoringConfig;
}

- (NSDictionary)shadowTodayWidgetScoringConfig
{
  return self->_shadowTodayWidgetScoringConfig;
}

- (NSDictionary)shadowTagWidgetScoringConfig
{
  return self->_shadowTagWidgetScoringConfig;
}

- (NSDictionary)shadowNotificationScoringConfig
{
  return self->_shadowNotificationScoringConfig;
}

- (NSDictionary)shadowMySportsGroupScoringConfig
{
  return self->_shadowMySportsGroupScoringConfig;
}

- (NSDictionary)shadowMySportsGroupForYouScoringConfig
{
  return self->_shadowMySportsGroupForYouScoringConfig;
}

- (NSDictionary)shadowMySportsTopicsScoringConfig
{
  return self->_shadowMySportsTopicsScoringConfig;
}

- (NSDictionary)shadowSportsTopStoriesScoringConfig
{
  return self->_shadowSportsTopStoriesScoringConfig;
}

- (NSDictionary)shadowIntroToSportsGroupScoringConfig
{
  return self->_shadowIntroToSportsGroupScoringConfig;
}

- (NSDictionary)shadowIntroToSportsGroupForYouScoringConfig
{
  return self->_shadowIntroToSportsGroupForYouScoringConfig;
}

- (NSDictionary)shadowHighlightsGroupScoringConfig
{
  return self->_shadowHighlightsGroupScoringConfig;
}

- (NSDictionary)shadowArticleListTagFeedGroupScoringConfig
{
  return self->_shadowArticleListTagFeedGroupScoringConfig;
}

- (NSDictionary)shadowTagFeedScoringConfig
{
  return self->_shadowTagFeedScoringConfig;
}

- (NSDictionary)shadowNewspaperTodayFeedScoringConfig
{
  return self->_shadowNewspaperTodayFeedScoringConfig;
}

- (NSDictionary)shadowMoreForYouScoringConfig
{
  return self->_shadowMoreForYouScoringConfig;
}

- (NSDictionary)shadowLocalSectionGroupScoringConfig
{
  return self->_shadowLocalSectionGroupScoringConfig;
}

- (NSDictionary)shadowNewspaperSectionGroupScoringConfig
{
  return self->_shadowNewspaperSectionGroupScoringConfig;
}

- (NSDictionary)shadowSportsEventArticlesGroupScoringConfig
{
  return self->_shadowSportsEventArticlesGroupScoringConfig;
}

- (NSDictionary)shadowTagForYouGroupScoringConfig
{
  return self->_shadowTagForYouGroupScoringConfig;
}

- (NSDictionary)shadowTagRecentStoriesScoringConfig
{
  return self->_shadowTagRecentStoriesScoringConfig;
}

- (NSDictionary)shadowTagDateRangeScoringConfig
{
  return self->_shadowTagDateRangeScoringConfig;
}

- (NSDictionary)shadowSportsEventTopicGroupScoringConfig
{
  return self->_shadowSportsEventTopicGroupScoringConfig;
}

- (NSDictionary)shadowAffinityGroupScoringConfig
{
  return self->_shadowAffinityGroupScoringConfig;
}

- (NSArray)shadowDefaultTopicsConfig
{
  return self->_shadowDefaultTopicsConfig;
}

- (NSArray)shadowTopicFeedTopicsConfig
{
  return self->_shadowTopicFeedTopicsConfig;
}

- (NSArray)shadowMagazineFeedArticleTopicsConfig
{
  return self->_shadowMagazineFeedArticleTopicsConfig;
}

- (NSArray)shadowMagazineFeedIssueTopicsConfig
{
  return self->_shadowMagazineFeedIssueTopicsConfig;
}

- (NSArray)shadowLegacyAudioFeedTopicsConfig
{
  return self->_shadowLegacyAudioFeedTopicsConfig;
}

- (NSArray)shadowAudioFeedTopicsConfig
{
  return self->_shadowAudioFeedTopicsConfig;
}

- (NSArray)shadowArticleRecirculationPrimaryTopicsConfig
{
  return self->_shadowArticleRecirculationPrimaryTopicsConfig;
}

- (NSArray)shadowArticleRecirculationSecondaryTopicsConfig
{
  return self->_shadowArticleRecirculationSecondaryTopicsConfig;
}

- (NSArray)shadowArticleRecirculationTertiaryTopicsConfig
{
  return self->_shadowArticleRecirculationTertiaryTopicsConfig;
}

- (NSArray)shadowArticleRecirculationQuaternaryTopicsConfig
{
  return self->_shadowArticleRecirculationQuaternaryTopicsConfig;
}

- (NSArray)shadowBestOfBundleTopicsConfig
{
  return self->_shadowBestOfBundleTopicsConfig;
}

- (NSArray)shadowCuratedTopicsConfig
{
  return self->_shadowCuratedTopicsConfig;
}

- (NSArray)shadowCuratedIssuesTopicsConfig
{
  return self->_shadowCuratedIssuesTopicsConfig;
}

- (NSArray)shadowForYouTopicsConfig
{
  return self->_shadowForYouTopicsConfig;
}

- (NSArray)shadowGreatStoriesYouMissedTopicsConfig
{
  return self->_shadowGreatStoriesYouMissedTopicsConfig;
}

- (NSArray)shadowLatestStoriesTopicsConfig
{
  return self->_shadowLatestStoriesTopicsConfig;
}

- (NSArray)shadowLocalNewsTopicsConfig
{
  return self->_shadowLocalNewsTopicsConfig;
}

- (NSArray)shadowNewspaperMagazineFeedTopicsConfig
{
  return self->_shadowNewspaperMagazineFeedTopicsConfig;
}

- (NSArray)shadowTodayWidgetTopicsConfig
{
  return self->_shadowTodayWidgetTopicsConfig;
}

- (NSArray)shadowTagWidgetTopicsConfig
{
  return self->_shadowTagWidgetTopicsConfig;
}

- (NSArray)shadowMySportsGroupTopicsConfig
{
  return self->_shadowMySportsGroupTopicsConfig;
}

- (NSArray)shadowMySportsGroupForYouTopicsConfig
{
  return self->_shadowMySportsGroupForYouTopicsConfig;
}

- (NSArray)shadowMySportsTopicsTopicsConfig
{
  return self->_shadowMySportsTopicsTopicsConfig;
}

- (NSArray)shadowSportsTopStoriesTopicsConfig
{
  return self->_shadowSportsTopStoriesTopicsConfig;
}

- (NSArray)shadowIntroToSportsGroupTopicsConfig
{
  return self->_shadowIntroToSportsGroupTopicsConfig;
}

- (NSArray)shadowIntroToSportsGroupForYouTopicsConfig
{
  return self->_shadowIntroToSportsGroupForYouTopicsConfig;
}

- (NSArray)shadowHighlightsGroupTopicsConfig
{
  return self->_shadowHighlightsGroupTopicsConfig;
}

- (NSArray)shadowArticleListTagFeedGroupTopicsConfig
{
  return self->_shadowArticleListTagFeedGroupTopicsConfig;
}

- (NSArray)shadowTagFeedTopicsConfig
{
  return self->_shadowTagFeedTopicsConfig;
}

- (NSArray)shadowNewspaperTodayFeedTopicsConfig
{
  return self->_shadowNewspaperTodayFeedTopicsConfig;
}

- (NSArray)shadowMoreForYouTopicsConfig
{
  return self->_shadowMoreForYouTopicsConfig;
}

- (NSArray)shadowLocalSectionGroupTopicsConfig
{
  return self->_shadowLocalSectionGroupTopicsConfig;
}

- (NSArray)shadowNewspaperSectionGroupTopicsConfig
{
  return self->_shadowNewspaperSectionGroupTopicsConfig;
}

- (NSArray)shadowSportsEventArticlesGroupTopicsConfig
{
  return self->_shadowSportsEventArticlesGroupTopicsConfig;
}

- (NSArray)shadowTagForYouGroupTopicsConfig
{
  return self->_shadowTagForYouGroupTopicsConfig;
}

- (NSArray)shadowTagRecentStoriesTopicsConfig
{
  return self->_shadowTagRecentStoriesTopicsConfig;
}

- (NSArray)shadowTagDateRangeTopicsConfig
{
  return self->_shadowTagDateRangeTopicsConfig;
}

- (NSArray)shadowSportsEventTopicGroupTopicsConfig
{
  return self->_shadowSportsEventTopicGroupTopicsConfig;
}

- (NSArray)shadowAffinityGroupTopicsConfig
{
  return self->_shadowAffinityGroupTopicsConfig;
}

- (NSDictionary)shadowDefaultOntologyLevelConfig
{
  return self->_shadowDefaultOntologyLevelConfig;
}

- (NSDictionary)shadowTopicFeedOntologyLevelConfig
{
  return self->_shadowTopicFeedOntologyLevelConfig;
}

- (NSDictionary)shadowMagazineFeedArticleOntologyLevelConfig
{
  return self->_shadowMagazineFeedArticleOntologyLevelConfig;
}

- (NSDictionary)shadowMagazineFeedIssueOntologyLevelConfig
{
  return self->_shadowMagazineFeedIssueOntologyLevelConfig;
}

- (NSDictionary)shadowLegacyAudioFeedOntologyLevelConfig
{
  return self->_shadowLegacyAudioFeedOntologyLevelConfig;
}

- (NSDictionary)shadowAudioFeedOntologyLevelConfig
{
  return self->_shadowAudioFeedOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationPrimaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationPrimaryOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationSecondaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationSecondaryOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationTertiaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationTertiaryOntologyLevelConfig;
}

- (NSDictionary)shadowArticleRecirculationQuaternaryOntologyLevelConfig
{
  return self->_shadowArticleRecirculationQuaternaryOntologyLevelConfig;
}

- (NSDictionary)shadowBestOfBundleOntologyLevelConfig
{
  return self->_shadowBestOfBundleOntologyLevelConfig;
}

- (NSDictionary)shadowCuratedOntologyLevelConfig
{
  return self->_shadowCuratedOntologyLevelConfig;
}

- (NSDictionary)shadowCuratedIssuesOntologyLevelConfig
{
  return self->_shadowCuratedIssuesOntologyLevelConfig;
}

- (NSDictionary)shadowForYouOntologyLevelConfig
{
  return self->_shadowForYouOntologyLevelConfig;
}

- (NSDictionary)shadowGreatStoriesYouMissedOntologyLevelConfig
{
  return self->_shadowGreatStoriesYouMissedOntologyLevelConfig;
}

- (NSDictionary)shadowLatestStoriesOntologyLevelConfig
{
  return self->_shadowLatestStoriesOntologyLevelConfig;
}

- (NSDictionary)shadowLocalNewsOntologyLevelConfig
{
  return self->_shadowLocalNewsOntologyLevelConfig;
}

- (NSDictionary)shadowNewspaperMagazineFeedOntologyLevelConfig
{
  return self->_shadowNewspaperMagazineFeedOntologyLevelConfig;
}

- (NSDictionary)shadowTodayWidgetOntologyLevelConfig
{
  return self->_shadowTodayWidgetOntologyLevelConfig;
}

- (NSDictionary)shadowTagWidgetOntologyLevelConfig
{
  return self->_shadowTagWidgetOntologyLevelConfig;
}

- (NSDictionary)shadowMySportsGroupOntologyLevelConfig
{
  return self->_shadowMySportsGroupOntologyLevelConfig;
}

- (NSDictionary)shadowMySportsGroupForYouOntologyLevelConfig
{
  return self->_shadowMySportsGroupForYouOntologyLevelConfig;
}

- (NSDictionary)shadowMySportsTopicsOntologyLevelConfig
{
  return self->_shadowMySportsTopicsOntologyLevelConfig;
}

- (NSDictionary)shadowSportsTopStoriesOntologyLevelConfig
{
  return self->_shadowSportsTopStoriesOntologyLevelConfig;
}

- (NSDictionary)shadowIntroToSportsGroupOntologyLevelConfig
{
  return self->_shadowIntroToSportsGroupOntologyLevelConfig;
}

- (NSDictionary)shadowIntroToSportsGroupForYouOntologyLevelConfig
{
  return self->_shadowIntroToSportsGroupForYouOntologyLevelConfig;
}

- (NSDictionary)shadowHighlightsGroupOntologyLevelConfig
{
  return self->_shadowHighlightsGroupOntologyLevelConfig;
}

- (NSDictionary)shadowArticleListTagFeedGroupOntologyLevelConfig
{
  return self->_shadowArticleListTagFeedGroupOntologyLevelConfig;
}

- (NSDictionary)shadowTagFeedOntologyLevelConfig
{
  return self->_shadowTagFeedOntologyLevelConfig;
}

- (NSDictionary)shadowNewspaperTodayFeedOntologyLevelConfig
{
  return self->_shadowNewspaperTodayFeedOntologyLevelConfig;
}

- (NSDictionary)shadowMoreForYouOntologyLevelConfig
{
  return self->_shadowMoreForYouOntologyLevelConfig;
}

- (NSDictionary)shadowLocalSectionGroupOntologyLevelConfig
{
  return self->_shadowLocalSectionGroupOntologyLevelConfig;
}

- (NSDictionary)shadowNewspaperSectionGroupOntologyLevelConfig
{
  return self->_shadowNewspaperSectionGroupOntologyLevelConfig;
}

- (NSDictionary)shadowSportsEventArticlesGroupOntologyLevelConfig
{
  return self->_shadowSportsEventArticlesGroupOntologyLevelConfig;
}

- (NSDictionary)shadowTagForYouGroupOntologyLevelConfig
{
  return self->_shadowTagForYouGroupOntologyLevelConfig;
}

- (NSDictionary)shadowTagRecentStoriesOntologyLevelConfig
{
  return self->_shadowTagRecentStoriesOntologyLevelConfig;
}

- (NSDictionary)shadowTagDateRangeOntologyLevelConfig
{
  return self->_shadowTagDateRangeOntologyLevelConfig;
}

- (NSDictionary)shadowSportsEventTopicGroupOntologyLevelConfig
{
  return self->_shadowSportsEventTopicGroupOntologyLevelConfig;
}

- (NSDictionary)shadowAffinityGroupOntologyLevelConfig
{
  return self->_shadowAffinityGroupOntologyLevelConfig;
}

- (double)topicFeedFilterMutedTopics
{
  return self->_topicFeedFilterMutedTopics;
}

- (double)magazineFeedGroupScoreWeight
{
  return self->_magazineFeedGroupScoreWeight;
}

- (double)audioFeedGroupScoreWeight
{
  return self->_audioFeedGroupScoreWeight;
}

- (int64_t)forYouGroupFilteredSubsetCount
{
  return self->_forYouGroupFilteredSubsetCount;
}

- (BOOL)forYouGroupAllowUnfilteredArticles
{
  return self->_forYouGroupAllowUnfilteredArticles;
}

- (double)topStoriesGroupAggregatesGroupBias
{
  return self->_topStoriesGroupAggregatesGroupBias;
}

- (double)trendingGroupAggregatesGroupBias
{
  return self->_trendingGroupAggregatesGroupBias;
}

- (double)filterableNotificationThresholdMultiplier
{
  return self->_filterableNotificationThresholdMultiplier;
}

- (double)minimumMyMagazinesIssueScoreBaselineMultiplier
{
  return self->_minimumMyMagazinesIssueScoreBaselineMultiplier;
}

- (BOOL)reorderHeadlinesUsingEmbeddingScoreBeforeGrouping
{
  return self->_reorderHeadlinesUsingEmbeddingScoreBeforeGrouping;
}

- (int64_t)maxNumberOfTotalTopicAndChannelGroups
{
  return self->_maxNumberOfTotalTopicAndChannelGroups;
}

- (int64_t)maxExternalSignalEventCount
{
  return self->_maxExternalSignalEventCount;
}

- (BOOL)computeUserVectorWithTabi
{
  return self->_computeUserVectorWithTabi;
}

- (void)setComputeUserVectorWithTabi:(BOOL)a3
{
  self->_computeUserVectorWithTabi = a3;
}

@end
