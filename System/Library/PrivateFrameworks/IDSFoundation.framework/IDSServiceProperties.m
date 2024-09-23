@implementation IDSServiceProperties

- (unsigned)adHocServiceType
{
  return self->_adHocServiceType;
}

- (NSString)launchDarwinNotification
{
  if ((*((_BYTE *)self + 47) & 1) != 0)
    return self->_launchNotification;
  else
    return (NSString *)0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLinkedServiceNames, 0);
  objc_storeStrong((id *)&self->_linkedServiceNames, 0);
  objc_storeStrong((id *)&self->_legacyIdentifier, 0);
  objc_storeStrong((id *)&self->_dataUsageBundleID, 0);
  objc_storeStrong((id *)&self->_superService, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_queryService, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_duetIdentifiersIndices, 0);
  objc_storeStrong((id *)&self->_allowedTrafficClassesIndices, 0);
  objc_storeStrong((id *)&self->_launchNotification, 0);
}

- (IDSServiceProperties)initWithServiceIdentifier:(id)a3
{
  const char *v4;
  void *v5;
  double v6;
  IDSServiceProperties *v7;

  _IDSServiceDictionaryForIdentifier((uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = (IDSServiceProperties *)(id)objc_msgSend_initWithServiceDictionary_(self, v4, (uint64_t)v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (IDSServiceProperties)initWithServiceDictionary:(id)a3
{
  id v4;
  const char *v5;
  IDSServiceProperties *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  NSString *protocolName;
  const char *v13;
  double v14;
  uint64_t v15;
  NSString *identifier;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  uint64_t v22;
  NSString *serviceName;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  uint64_t v29;
  NSString *pushTopic;
  const char *v31;
  double v32;
  uint64_t v33;
  NSString *legacyIdentifier;
  const char *v35;
  double v36;
  uint64_t v37;
  NSString *displayName;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  uint64_t v48;
  const char *v49;
  double v50;
  NSString *v51;
  IDSServiceProperties *v52;
  NSString *launchNotification;
  uint64_t v54;
  NSString *superService;
  const char *v56;
  double v57;
  uint64_t v58;
  NSString *dataUsageBundleID;
  const char *v60;
  double v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  const char *v66;
  double v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  const char *v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  const char *v84;
  double v85;
  uint64_t v86;
  NSSet *allowedTrafficClassesIndices;
  const char *v88;
  double v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  double v93;
  char v94;
  const char *v95;
  double v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  double v100;
  char v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  double v107;
  char v108;
  const char *v109;
  double v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  char v115;
  const char *v116;
  double v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  char v122;
  const char *v123;
  double v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  double v128;
  const char *v129;
  double v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  double v134;
  char v135;
  const char *v136;
  double v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  double v141;
  char v142;
  const char *v143;
  double v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  double v148;
  char v149;
  const char *v150;
  double v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  double v155;
  char v156;
  const char *v157;
  double v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  double v162;
  char v163;
  const char *v164;
  double v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  double v169;
  char v170;
  const char *v171;
  double v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  double v176;
  char v177;
  const char *v178;
  double v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  double v183;
  const char *v184;
  double v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  double v189;
  char v190;
  const char *v191;
  double v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  double v196;
  const char *v197;
  double v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  double v202;
  char v203;
  const char *v204;
  double v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  double v209;
  char v210;
  const char *v211;
  double v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  double v216;
  char v217;
  const char *v218;
  double v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  double v223;
  char v224;
  const char *v225;
  double v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  double v230;
  char v231;
  const char *v232;
  double v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  double v237;
  char v238;
  const char *v239;
  double v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  double v244;
  const char *v245;
  double v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  double v250;
  char v251;
  const char *v252;
  double v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  double v257;
  char v258;
  const char *v259;
  double v260;
  void *v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  double v265;
  char v266;
  const char *v267;
  double v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  double v272;
  char v273;
  const char *v274;
  double v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  double v279;
  char v280;
  const char *v281;
  double v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  double v286;
  char v287;
  const char *v288;
  double v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  double v293;
  const char *v294;
  double v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  double v299;
  char v300;
  const char *v301;
  double v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  double v306;
  char v307;
  const char *v308;
  double v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  double v313;
  char v314;
  const char *v315;
  double v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  double v320;
  int v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  double v325;
  char v326;
  const char *v327;
  double v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  double v332;
  char v333;
  const char *v334;
  double v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  double v339;
  char v340;
  const char *v341;
  double v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  double v346;
  char v347;
  const char *v348;
  double v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  double v353;
  char v354;
  const char *v355;
  double v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  double v360;
  char v361;
  const char *v362;
  double v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  double v367;
  char v368;
  const char *v369;
  double v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  double v374;
  char v375;
  const char *v376;
  double v377;
  void *v378;
  const char *v379;
  uint64_t v380;
  double v381;
  char v382;
  const char *v383;
  double v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  double v388;
  char v389;
  const char *v390;
  double v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  double v395;
  char v396;
  const char *v397;
  double v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  double v402;
  char v403;
  const char *v404;
  double v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  double v409;
  char v410;
  const char *v411;
  double v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  double v416;
  char v417;
  const char *v418;
  double v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  double v423;
  char v424;
  const char *v425;
  double v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  double v430;
  int v431;
  const char *v432;
  uint64_t v433;
  double v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  double v439;
  int v440;
  const char *v441;
  uint64_t v442;
  double v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  double v448;
  char v449;
  const char *v450;
  double v451;
  void *v452;
  const char *v453;
  uint64_t v454;
  double v455;
  const char *v456;
  double v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  double v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t i;
  void *v467;
  const char *v468;
  uint64_t v469;
  double v470;
  char v471;
  const char *v472;
  double v473;
  void *v474;
  const char *v475;
  uint64_t v476;
  double v477;
  char v478;
  const char *v479;
  double v480;
  void *v481;
  uint64_t v482;
  NSSet *duetIdentifiersIndices;
  const char *v484;
  double v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  double v489;
  void *v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  double v494;
  void *v495;
  uint64_t v496;
  NSString *queryService;
  const char *v498;
  double v499;
  uint64_t v500;
  NSArray *linkedServiceNames;
  const char *v502;
  double v503;
  uint64_t v504;
  NSArray *queryLinkedServiceNames;
  const char *v506;
  double v507;
  void *v508;
  const char *v509;
  uint64_t v510;
  double v511;
  char v512;
  const char *v513;
  double v514;
  void *v515;
  const char *v516;
  uint64_t v517;
  double v518;
  const char *v519;
  double v520;
  void *v521;
  const char *v522;
  uint64_t v523;
  double v524;
  char v525;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  objc_super v535;
  _BYTE v536[128];
  uint64_t v537;

  v537 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v535.receiver = self;
  v535.super_class = (Class)IDSServiceProperties;
  v6 = -[IDSServiceProperties init](&v535, sel_init);
  if (!v6)
  {
LABEL_186:
    v52 = v6;
    goto LABEL_187;
  }
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("Identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend__resolveProtocolName_(v6, v9, (uint64_t)v4, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    protocolName = v6->_protocolName;
    v6->_protocolName = (NSString *)v11;

    objc_msgSend_objectForKey_(v4, v13, (uint64_t)CFSTR("Identifier"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v15;

    objc_msgSend_objectForKey_(v4, v17, (uint64_t)CFSTR("ServiceName"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__stringToUseGivenName_(v6, v20, (uint64_t)v19, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    serviceName = v6->_serviceName;
    v6->_serviceName = (NSString *)v22;

    objc_msgSend_objectForKey_(v4, v24, (uint64_t)CFSTR("PushTopic"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__stringToUseGivenName_(v6, v27, (uint64_t)v26, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    pushTopic = v6->_pushTopic;
    v6->_pushTopic = (NSString *)v29;

    objc_msgSend_objectForKey_(v4, v31, (uint64_t)CFSTR("LegacyIdentifier"), v32);
    v33 = objc_claimAutoreleasedReturnValue();
    legacyIdentifier = v6->_legacyIdentifier;
    v6->_legacyIdentifier = (NSString *)v33;

    objc_msgSend_objectForKey_(v4, v35, (uint64_t)CFSTR("DisplayName"), v36);
    v37 = objc_claimAutoreleasedReturnValue();
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v37;

    objc_msgSend_objectForKey_(v4, v39, (uint64_t)CFSTR("DataProtectionClass"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v530 = v41;
    if (v41)
      LOBYTE(v41) = objc_msgSend_unsignedIntValue(v41, v42, v43, v44);
    v6->_dataProtectionClass = v41;
    objc_msgSend_objectForKey_(v4, v42, (uint64_t)CFSTR("LaunchDarwinNotification"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v4, v46, (uint64_t)CFSTR("LaunchMachServiceNotification"), v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v528 = (void *)v48;
    if (v48)
    {
      objc_msgSend__resolveShouldUseMachNotification_(v6, v49, v48, v50);
      v51 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v45)
      {
LABEL_11:
        v529 = v45;
        objc_msgSend_objectForKey_(v4, v49, (uint64_t)CFSTR("SuperService"), v50);
        v54 = objc_claimAutoreleasedReturnValue();
        superService = v6->_superService;
        v6->_superService = (NSString *)v54;

        objc_msgSend_objectForKey_(v4, v56, (uint64_t)CFSTR("DataUsageBundleID"), v57);
        v58 = objc_claimAutoreleasedReturnValue();
        dataUsageBundleID = v6->_dataUsageBundleID;
        v6->_dataUsageBundleID = (NSString *)v58;

        objc_msgSend_objectForKey_(v4, v60, (uint64_t)CFSTR("AdHocServiceType"), v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_adHocServiceType = objc_msgSend_unsignedIntValue(v62, v63, v64, v65);

        objc_msgSend_objectForKey_(v4, v66, (uint64_t)CFSTR("ControlCategory"), v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_controlCategory = objc_msgSend_unsignedIntValue(v68, v69, v70, v71);

        objc_msgSend_objectForKey_(v4, v72, (uint64_t)CFSTR("ConstraintType"), v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_constraintType = objc_msgSend_unsignedIntValue(v74, v75, v76, v77);

        objc_msgSend_objectForKey_(v4, v78, (uint64_t)CFSTR("FirewallNotificationStyle"), v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_firewallNotificationStyle = objc_msgSend_unsignedIntValue(v80, v81, v82, v83);

        objc_msgSend_objectForKey_(v4, v84, (uint64_t)CFSTR("AllowedTrafficClasses"), v85);
        v527 = (void *)objc_claimAutoreleasedReturnValue();
        sub_19B94E674(v527);
        v86 = objc_claimAutoreleasedReturnValue();
        allowedTrafficClassesIndices = v6->_allowedTrafficClassesIndices;
        v6->_allowedTrafficClassesIndices = (NSSet *)v86;

        objc_msgSend_objectForKey_(v4, v88, (uint64_t)CFSTR("AllowLocalDelivery"), v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v90, v91, v92, v93))
          v94 = 2;
        else
          v94 = 0;
        *((_BYTE *)v6 + 42) = *((_BYTE *)v6 + 42) & 0xFD | v94;

        objc_msgSend_objectForKey_(v4, v95, (uint64_t)CFSTR("AllowPartialSendsToSucceed"), v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v97, v98, v99, v100))
          v101 = 16;
        else
          v101 = 0;
        *((_BYTE *)v6 + 42) = *((_BYTE *)v6 + 42) & 0xEF | v101;

        objc_msgSend_objectForKey_(v4, v102, (uint64_t)CFSTR("CanUseLargePayload"), v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v104, v105, v106, v107))
          v108 = 32;
        else
          v108 = 0;
        *((_BYTE *)v6 + 42) = *((_BYTE *)v6 + 42) & 0xDF | v108;

        objc_msgSend_objectForKey_(v4, v109, (uint64_t)CFSTR("SendOnePerToken"), v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v111, v112, v113, v114))
          v115 = 64;
        else
          v115 = 0;
        *((_BYTE *)v6 + 42) = *((_BYTE *)v6 + 42) & 0xBF | v115;

        objc_msgSend_objectForKey_(v4, v116, (uint64_t)CFSTR("SupportsPhoneNumberRegistration"), v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v118, v119, v120, v121))
          v122 = 0x80;
        else
          v122 = 0;
        *((_BYTE *)v6 + 42) = v122 & 0x80 | *((_BYTE *)v6 + 42) & 0x7F;

        objc_msgSend_objectForKey_(v4, v123, (uint64_t)CFSTR("iCloudService"), v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xFE | objc_msgSend_BOOLValue(v125, v126, v127, v128);

        objc_msgSend_objectForKey_(v4, v129, (uint64_t)CFSTR("TunnelService"), v130);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v131, v132, v133, v134))
          v135 = 2;
        else
          v135 = 0;
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xFD | v135;

        objc_msgSend_objectForKey_(v4, v136, (uint64_t)CFSTR("ShouldShowUsageNotifications"), v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v138, v139, v140, v141))
          v142 = 8;
        else
          v142 = 0;
        *((_BYTE *)v6 + 42) = *((_BYTE *)v6 + 42) & 0xF7 | v142;

        objc_msgSend_objectForKey_(v4, v143, (uint64_t)CFSTR("AutoConfigureVettedAddresses"), v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v145, v146, v147, v148))
          v149 = 8;
        else
          v149 = 0;
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xF7 | v149;

        objc_msgSend_objectForKey_(v4, v150, (uint64_t)CFSTR("AutoConfigureDSID"), v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v152, v153, v154, v155))
          v156 = 16;
        else
          v156 = 0;
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xEF | v156;

        objc_msgSend_objectForKey_(v4, v157, (uint64_t)CFSTR("SyncAccounts"), v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v159, v160, v161, v162))
          v163 = 32;
        else
          v163 = 0;
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xDF | v163;

        objc_msgSend_objectForKey_(v4, v164, (uint64_t)CFSTR("NoSyncPhoneNumberAccounts"), v165);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v166, v167, v168, v169))
          v170 = 64;
        else
          v170 = 0;
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xBF | v170;

        objc_msgSend_objectForKey_(v4, v171, (uint64_t)CFSTR("AllowProxyDelivery"), v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v173, v174, v175, v176))
          v177 = 0x80;
        else
          v177 = 0;
        *((_BYTE *)v6 + 43) = v177 & 0x80 | *((_BYTE *)v6 + 43) & 0x7F;

        objc_msgSend_objectForKey_(v4, v178, (uint64_t)CFSTR("WantsLocalReflectedSend"), v179);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xFE | objc_msgSend_BOOLValue(v180, v181, v182, v183);

        objc_msgSend_objectForKey_(v4, v184, (uint64_t)CFSTR("WantsNetworkAvailableHint"), v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v186, v187, v188, v189))
          v190 = 2;
        else
          v190 = 0;
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xFD | v190;

        objc_msgSend_objectForKey_(v4, v191, (uint64_t)CFSTR("AllowLaunchOnNearbyDevicesChanged"), v192);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_allowLaunchOnNearbyDevicesChanged = objc_msgSend_BOOLValue(v193, v194, v195, v196);

        objc_msgSend_objectForKey_(v4, v197, (uint64_t)CFSTR("WatchOnlyService"), v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v199, v200, v201, v202))
          v203 = 4;
        else
          v203 = 0;
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xFB | v203;

        objc_msgSend_objectForKey_(v4, v204, (uint64_t)CFSTR("AllowDuplicateMessages"), v205);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v206, v207, v208, v209))
          v210 = 8;
        else
          v210 = 0;
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xF7 | v210;

        objc_msgSend_objectForKey_(v4, v211, (uint64_t)CFSTR("UseiMessageCallerID"), v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v213, v214, v215, v216))
          v217 = 16;
        else
          v217 = 0;
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xEF | v217;

        objc_msgSend_objectForKey_(v4, v218, (uint64_t)CFSTR("UseFaceTimeCallerID"), v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v220, v221, v222, v223))
          v224 = 32;
        else
          v224 = 0;
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xDF | v224;

        objc_msgSend_objectForKey_(v4, v225, (uint64_t)CFSTR("AllowPendingMessagesForInactiveDevice"), v226);
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v227, v228, v229, v230))
          v231 = 64;
        else
          v231 = 0;
        *((_BYTE *)v6 + 44) = *((_BYTE *)v6 + 44) & 0xBF | v231;

        objc_msgSend_objectForKey_(v4, v232, (uint64_t)CFSTR("AllowSendingMessagesToInactiveDevice"), v233);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v234, v235, v236, v237))
          v238 = 0x80;
        else
          v238 = 0;
        *((_BYTE *)v6 + 44) = v238 & 0x80 | *((_BYTE *)v6 + 44) & 0x7F;

        objc_msgSend_objectForKey_(v4, v239, (uint64_t)CFSTR("ClassAProtectedTraffic"), v240);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xFE | objc_msgSend_BOOLValue(v241, v242, v243, v244);

        objc_msgSend_objectForKey_(v4, v245, (uint64_t)CFSTR("SilentlyFailMessagesOnSwitch"), v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v247, v248, v249, v250))
          v251 = 2;
        else
          v251 = 0;
        *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xFD | v251;

        objc_msgSend_objectForKey_(v4, v252, (uint64_t)CFSTR("AllowCloudDelivery"), v253);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v254, v255, v256, v257))
          v258 = 4;
        else
          v258 = 0;
        *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xFB | v258;

        if (v6->_adHocServiceType == 2)
        {
          *((_BYTE *)v6 + 45) &= ~8u;
        }
        else
        {
          objc_msgSend_objectForKey_(v4, v259, (uint64_t)CFSTR("AllowLiveMessageDelivery"), v260);
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xF7 | (8 * (v261 != 0));

        }
        objc_msgSend_objectForKey_(v4, v259, (uint64_t)CFSTR("EnabledOnlyWhenPaired"), v260);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v262, v263, v264, v265))
          v266 = 16;
        else
          v266 = 0;
        *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xEF | v266;

        objc_msgSend_objectForKey_(v4, v267, (uint64_t)CFSTR("forceHTTPQueries"), v268);
        v269 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v269, v270, v271, v272))
          v273 = 32;
        else
          v273 = 0;
        *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xDF | v273;

        objc_msgSend_objectForKey_(v4, v274, (uint64_t)CFSTR("WantsRemoteErrors"), v275);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v276, v277, v278, v279))
          v280 = 64;
        else
          v280 = 0;
        *((_BYTE *)v6 + 45) = *((_BYTE *)v6 + 45) & 0xBF | v280;

        objc_msgSend_objectForKey_(v4, v281, (uint64_t)CFSTR("UseTransportZone"), v282);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v283, v284, v285, v286))
          v287 = 0x80;
        else
          v287 = 0;
        *((_BYTE *)v6 + 45) = v287 & 0x80 | *((_BYTE *)v6 + 45) & 0x7F;

        objc_msgSend_objectForKey_(v4, v288, (uint64_t)CFSTR("DontFilterSelfMessagesForUnknownDevice"), v289);
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xFE | objc_msgSend_BOOLValue(v290, v291, v292, v293);

        objc_msgSend_objectForKey_(v4, v294, (uint64_t)CFSTR("PassThroughMessagesFromStorage"), v295);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v296, v297, v298, v299))
          v300 = 2;
        else
          v300 = 0;
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xFD | v300;

        objc_msgSend_objectForKey_(v4, v301, (uint64_t)CFSTR("PushToWakeDisabled"), v302);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v303, v304, v305, v306))
          v307 = 4;
        else
          v307 = 0;
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xFB | v307;

        objc_msgSend_objectForKey_(v4, v308, (uint64_t)CFSTR("DisableOnLowRAMDevice"), v309);
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v310, v311, v312, v313))
          v314 = 8;
        else
          v314 = 0;
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xF7 | v314;

        if (v6->_adHocServiceType == 2)
        {
          *((_BYTE *)v6 + 42) |= 4u;
        }
        else
        {
          objc_msgSend_objectForKey_(v4, v315, (uint64_t)CFSTR("AllowMagnetDelivery"), v316);
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_BOOLValue(v317, v318, v319, v320) & 1) != 0)
            LOBYTE(v321) = 4;
          else
            v321 = (*((unsigned __int8 *)v6 + 43) >> 5) & 4;
          *((_BYTE *)v6 + 42) = *((_BYTE *)v6 + 42) & 0xFB | v321;

        }
        objc_msgSend_objectForKey_(v4, v315, (uint64_t)CFSTR("HoldMessagesUntilClassCUnlock"), v316);
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v322, v323, v324, v325))
          v326 = 4;
        else
          v326 = 0;
        *((_BYTE *)v6 + 43) = *((_BYTE *)v6 + 43) & 0xFB | v326;

        objc_msgSend_objectForKey_(v4, v327, (uint64_t)CFSTR("WantsPendingMessageUpdates"), v328);
        v329 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v329, v330, v331, v332))
          v333 = 16;
        else
          v333 = 0;
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xEF | v333;

        objc_msgSend_objectForKey_(v4, v334, (uint64_t)CFSTR("WantsPendingResourceUpdates"), v335);
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v336, v337, v338, v339))
          v340 = 64;
        else
          v340 = 0;
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xBF | v340;

        objc_msgSend_objectForKey_(v4, v341, (uint64_t)CFSTR("CrossAccountMessages"), v342);
        v343 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v343, v344, v345, v346))
          v347 = 2;
        else
          v347 = 0;
        *((_BYTE *)v6 + 47) = *((_BYTE *)v6 + 47) & 0xFD | v347;

        objc_msgSend_objectForKey_(v4, v348, (uint64_t)CFSTR("BlockRemoteTimeouts"), v349);
        v350 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v350, v351, v352, v353))
          v354 = 4;
        else
          v354 = 0;
        *((_BYTE *)v6 + 47) = *((_BYTE *)v6 + 47) & 0xFB | v354;

        objc_msgSend_objectForKey_(v4, v355, (uint64_t)CFSTR("AllowWakingMessages"), v356);
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v357, v358, v359, v360))
          v361 = 8;
        else
          v361 = 0;
        *((_BYTE *)v6 + 47) = *((_BYTE *)v6 + 47) & 0xF7 | v361;

        objc_msgSend_objectForKey_(v4, v362, (uint64_t)CFSTR("AllowUrgentMessages"), v363);
        v364 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v364, v365, v366, v367))
          v368 = 16;
        else
          v368 = 0;
        *((_BYTE *)v6 + 47) = *((_BYTE *)v6 + 47) & 0xEF | v368;

        objc_msgSend_objectForKey_(v4, v369, (uint64_t)CFSTR("PrototypingOnly"), v370);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v371, v372, v373, v374))
          v375 = 32;
        else
          v375 = 0;
        *((_BYTE *)v6 + 47) = *((_BYTE *)v6 + 47) & 0xDF | v375;

        objc_msgSend_objectForKey_(v4, v376, (uint64_t)CFSTR("IsFamilyService"), v377);
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v378, v379, v380, v381))
          v382 = 64;
        else
          v382 = 0;
        *((_BYTE *)v6 + 47) = *((_BYTE *)v6 + 47) & 0xBF | v382;

        objc_msgSend_objectForKey_(v4, v383, (uint64_t)CFSTR("IsInvitationService"), v384);
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v385, v386, v387, v388))
          v389 = 0x80;
        else
          v389 = 0;
        *((_BYTE *)v6 + 47) = v389 & 0x80 | *((_BYTE *)v6 + 47) & 0x7F;

        objc_msgSend_objectForKey_(v4, v390, (uint64_t)CFSTR("HadStandalonePreference"), v391);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v392, v393, v394, v395))
          v396 = 2;
        else
          v396 = 0;
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xFD | v396;

        objc_msgSend_objectForKey_(v4, v397, (uint64_t)CFSTR("RestrictedLogging"), v398);
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v399, v400, v401, v402))
          v403 = 4;
        else
          v403 = 0;
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xFB | v403;

        objc_msgSend_objectForKey_(v4, v404, (uint64_t)CFSTR("FirewallAutoEnroll"), v405);
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v406, v407, v408, v409))
          v410 = 8;
        else
          v410 = 0;
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xF7 | v410;

        objc_msgSend_objectForKey_(v4, v411, (uint64_t)CFSTR("DisableFirewall"), v412);
        v413 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v413, v414, v415, v416))
          v417 = 16;
        else
          v417 = 0;
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xEF | v417;

        objc_msgSend_objectForKey_(v4, v418, (uint64_t)CFSTR("SupportsOfflineDelivery"), v419);
        v420 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v420, v421, v422, v423))
          v424 = 0x80;
        else
          v424 = 0;
        *((_BYTE *)v6 + 48) = v424 & 0x80 | *((_BYTE *)v6 + 48) & 0x7F;

        objc_msgSend_objectForKey_(v4, v425, (uint64_t)CFSTR("ApplicationKeyIndex"), v426);
        v427 = (void *)objc_claimAutoreleasedReturnValue();
        v431 = objc_msgSend_unsignedIntValue(v427, v428, v429, v430);
        if (v431)
        {
          if (objc_msgSend_unsignedIntValue(v427, v432, v433, v434) > 1)
            LOBYTE(v431) = 0;
          else
            LOBYTE(v431) = objc_msgSend_unsignedIntValue(v427, v432, v435, v434);
        }
        v6->_applicationKeyIndex = v431;
        objc_msgSend_objectForKey_(v4, v432, (uint64_t)CFSTR("KTRegistrationDataIndex"), v434);
        v436 = (void *)objc_claimAutoreleasedReturnValue();
        v440 = objc_msgSend_unsignedIntValue(v436, v437, v438, v439);
        if (v440)
        {
          if (objc_msgSend_unsignedIntValue(v436, v441, v442, v443) > 3)
            LOBYTE(v440) = 0;
          else
            LOBYTE(v440) = objc_msgSend_unsignedIntValue(v436, v441, v444, v443);
        }
        v6->_ktRegistrationDataIndex = v440;
        objc_msgSend_objectForKey_(v4, v441, (uint64_t)CFSTR("TinkerMessagingOnly"), v443);
        v445 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v445, v446, v447, v448))
          v449 = 0x80;
        else
          v449 = 0;
        *((_BYTE *)v6 + 46) = v449 & 0x80 | *((_BYTE *)v6 + 46) & 0x7F;

        objc_msgSend_objectForKey_(v4, v450, (uint64_t)CFSTR("DefaultSendModeNormal"), v451);
        v452 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xFE | objc_msgSend_BOOLValue(v452, v453, v454, v455);

        v6->_linkedDeviceRelationships = 1;
        objc_msgSend_objectForKey_(v4, v456, (uint64_t)CFSTR("LinkedDeviceRelationships"), v457);
        v458 = (void *)objc_claimAutoreleasedReturnValue();
        v531 = 0u;
        v532 = 0u;
        v533 = 0u;
        v534 = 0u;
        v460 = objc_msgSend_countByEnumeratingWithState_objects_count_(v458, v459, (uint64_t)&v531, 0.0, v536, 16);
        if (v460)
        {
          v464 = v460;
          v465 = *(_QWORD *)v532;
          do
          {
            for (i = 0; i != v464; ++i)
            {
              if (*(_QWORD *)v532 != v465)
                objc_enumerationMutation(v458);
              v6->_linkedDeviceRelationships |= objc_msgSend_intValue(*(void **)(*((_QWORD *)&v531 + 1) + 8 * i), v461, v462, v463);
            }
            v464 = objc_msgSend_countByEnumeratingWithState_objects_count_(v458, v461, (uint64_t)&v531, v463, v536, 16);
          }
          while (v464);
        }
        objc_msgSend_objectForKey_(v4, v461, (uint64_t)CFSTR("EnabledOnlyOnStandaloneDevices"), v463);
        v467 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v467, v468, v469, v470))
          v471 = 64;
        else
          v471 = 0;
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xBF | v471;

        objc_msgSend_objectForKey_(v4, v472, (uint64_t)CFSTR("DisabledOnTinkerWatch"), v473);
        v474 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v474, v475, v476, v477))
          v478 = 32;
        else
          v478 = 0;
        *((_BYTE *)v6 + 46) = *((_BYTE *)v6 + 46) & 0xDF | v478;

        objc_msgSend_objectForKey_(v4, v479, (uint64_t)CFSTR("DuetIdentifiers"), v480);
        v481 = (void *)objc_claimAutoreleasedReturnValue();
        sub_19B94E674(v481);
        v482 = objc_claimAutoreleasedReturnValue();
        duetIdentifiersIndices = v6->_duetIdentifiersIndices;
        v6->_duetIdentifiersIndices = (NSSet *)v482;

        objc_msgSend_objectForKey_(v4, v484, (uint64_t)CFSTR("MinCompatibilityVersion"), v485);
        v486 = (void *)objc_claimAutoreleasedReturnValue();
        v490 = v486;
        if (v486)
          LOBYTE(v486) = objc_msgSend_unsignedCharValue(v486, v487, v488, v489);
        v6->_minCompatibilityVersion = v486;
        objc_msgSend_objectForKey_(v4, v487, (uint64_t)CFSTR("AccountSyncMinCompatibilityVersion"), v489);
        v491 = (void *)objc_claimAutoreleasedReturnValue();
        v495 = v491;
        if (v491)
          LOBYTE(v491) = objc_msgSend_unsignedCharValue(v491, v492, v493, v494);
        v6->_accountSyncMinCompatibilityVersion = v491;
        objc_msgSend_objectForKey_(v4, v492, (uint64_t)CFSTR("QueryServiceName"), v494);
        v496 = objc_claimAutoreleasedReturnValue();
        queryService = v6->_queryService;
        v6->_queryService = (NSString *)v496;

        if (!v6->_queryService)
          objc_storeStrong((id *)&v6->_queryService, v6->_pushTopic);
        objc_msgSend_objectForKey_(v4, v498, (uint64_t)CFSTR("LinkedServices"), v499);
        v500 = objc_claimAutoreleasedReturnValue();
        linkedServiceNames = v6->_linkedServiceNames;
        v6->_linkedServiceNames = (NSArray *)v500;

        objc_msgSend_objectForKey_(v4, v502, (uint64_t)CFSTR("QueryLinkedServices"), v503);
        v504 = objc_claimAutoreleasedReturnValue();
        queryLinkedServiceNames = v6->_queryLinkedServiceNames;
        v6->_queryLinkedServiceNames = (NSArray *)v504;

        objc_msgSend_objectForKey_(v4, v506, (uint64_t)CFSTR("IsUserDrivenRealTime"), v507);
        v508 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v508, v509, v510, v511))
          v512 = 32;
        else
          v512 = 0;
        *((_BYTE *)v6 + 48) = *((_BYTE *)v6 + 48) & 0xDF | v512;

        objc_msgSend_objectForKey_(v4, v513, (uint64_t)CFSTR("IsUltraConstrainedPushAllowed"), v514);
        v515 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v6 + 49) = *((_BYTE *)v6 + 49) & 0xFE | objc_msgSend_BOOLValue(v515, v516, v517, v518);

        objc_msgSend_objectForKey_(v4, v519, (uint64_t)CFSTR("RequiresPinnedIdentity"), v520);
        v521 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_BOOLValue(v521, v522, v523, v524))
          v525 = 2;
        else
          v525 = 0;
        *((_BYTE *)v6 + 49) = *((_BYTE *)v6 + 49) & 0xFD | v525;

        goto LABEL_186;
      }
      *((_BYTE *)v6 + 47) |= 1u;
      v51 = v45;
    }
    launchNotification = v6->_launchNotification;
    v6->_launchNotification = v51;

    goto LABEL_11;
  }
  _IMWarn();
  v52 = 0;
LABEL_187:

  return v52;
}

- (id)_stringToUseGivenName:(id)a3
{
  const char *v4;
  NSString *v5;
  double v6;
  int isEqualToString;
  NSString *identifier;
  NSString *v9;

  v5 = (NSString *)a3;
  if (!v5
    || (isEqualToString = objc_msgSend_isEqualToString_(self->_identifier, v4, (uint64_t)v5, v6),
        identifier = v5,
        isEqualToString))
  {
    identifier = self->_identifier;
  }
  v9 = identifier;

  return v9;
}

- (id)_resolveProtocolName:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  __CFString *v8;

  objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("ProtocolName"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = CFSTR("com.apple.private.alloy");
  if (v4 && (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("com.apple.private.alloy"), v6) & 1) == 0)
    v8 = v7;

  return v8;
}

- (NSString)launchMachServiceNotification
{
  uint64_t v2;
  double v3;
  NSString *launchNotification;
  NSString *v5;

  if ((*((_BYTE *)self + 47) & 1) != 0)
  {
    launchNotification = 0;
    goto LABEL_5;
  }
  launchNotification = self->_launchNotification;
  if (launchNotification)
  {
LABEL_5:
    v5 = launchNotification;
    return v5;
  }
  objc_msgSend__identifierWithProtocolAndMachServiceSuffix(self, a2, v2, v3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)_identifierWithProtocolAndMachServiceSuffix
{
  double v2;

  return (id)objc_msgSend_stringByAppendingString_(self->_identifier, a2, (uint64_t)CFSTR("-idswake"), v2);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)wantsTinkerDevices
{
  return (self->_linkedDeviceRelationships >> 1) & 1;
}

- (BOOL)isInvitationService
{
  return *((unsigned __int8 *)self + 47) >> 7;
}

- (BOOL)isFamilyService
{
  return (*((unsigned __int8 *)self + 47) >> 6) & 1;
}

- (BOOL)canUseLargePayload
{
  _BOOL4 v3;

  if ((_os_feature_enabled_impl() & 1) != 0)
    LOBYTE(v3) = 1;
  else
    return (*((unsigned __int8 *)self + 42) >> 5) & 1;
  return v3;
}

- (id)_resolveShouldUseMachNotification:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  char isEqualToString;
  id v12;

  v4 = a3;
  objc_msgSend__identifierWithProtocolAndMachServiceSuffix(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)v4, v10);

  if ((isEqualToString & 1) != 0)
    v12 = 0;
  else
    v12 = v4;

  return v12;
}

- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;

  v4 = a3;
  objc_msgSend_sharedDefaults(MEMORY[0x1E0D36AF8], a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v7, v4, v8);
  objc_msgSend_preferencesDomain(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_appID_(v6, v14, v9, v15, CFSTR("needsLaunchOnNearbyDevicesChanged"), v13);

  objc_msgSend_sharedDefaults(MEMORY[0x1E0D36AF8], v16, v17, v18);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferencesDomain(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronizeAppID_(v25, v23, (uint64_t)v22, v24);

}

- (BOOL)needsLaunchOnNearbyDevicesChanged
{
  uint64_t v2;
  double v3;
  int v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  char v20;

  v5 = objc_msgSend_allowLaunchOnNearbyDevicesChanged(self, a2, v2, v3);
  if (v5)
  {
    objc_msgSend_sharedDefaults(MEMORY[0x1E0D36AF8], v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferencesDomain(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_copyValueForKey_appID_(v9, v14, (uint64_t)CFSTR("needsLaunchOnNearbyDevicesChanged"), v15, v13);
    v20 = objc_msgSend_BOOLValue(v16, v17, v18, v19);

    LOBYTE(v5) = v20;
  }
  return v5;
}

- (BOOL)allowLocalDelivery
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  double v6;

  if ((objc_msgSend_allowWiProxDelivery(self, a2, v2, v3) & 1) != 0)
    return 1;
  else
    return MEMORY[0x1E0DE7D20](self, sel_allowMagnetDelivery, v5, v6);
}

- (NSString)preferencesDomain
{
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = qword_1EE409BE0;
  objc_msgSend_identifier(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v7, (uint64_t)CFSTR("%@.%@"), v8, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)legacyPreferencesDomain
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_legacyIdentifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = qword_1EE409BE0;
    objc_msgSend_legacyIdentifier(self, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v9, v12, (uint64_t)CFSTR("%@.%@"), v13, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return (NSString *)v14;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_identifier(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayName(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushTopic(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceName(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protocolName(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("IDSServiceProperties: %p [Identifier: %@ Display Name: %@ Topic: %@   Service: %@   Protocol: %@]"), v24, self, v6, v10, v14, v18, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSArray)duetIdentifiers
{
  uint64_t v2;
  double v3;
  NSSet *duetIdentifiersIndices;
  const char *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  duetIdentifiersIndices = self->_duetIdentifiersIndices;
  if (duetIdentifiersIndices)
  {
    sub_19B9A29C0(duetIdentifiersIndices);
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_serviceName(self, a2, v2, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_serviceName(self, v7, v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v15, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    return (NSArray *)v14;
  }
}

- (unint64_t)minCompatibilityVersion
{
  return self->_minCompatibilityVersion;
}

- (unint64_t)accountSyncMinCompatibilityVersion
{
  return self->_accountSyncMinCompatibilityVersion;
}

- (NSSet)allowedTrafficClasses
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  if (self->_allowedTrafficClassesIndices)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    sub_19B9A29C0(self->_allowedTrafficClassesIndices);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend_initWithArray_(v3, v5, (uint64_t)v4, v6);

  }
  else
  {
    v7 = 0;
  }
  return (NSSet *)v7;
}

- (BOOL)isFirewallEnabled
{
  uint64_t v2;
  double v3;
  int v5;

  v5 = objc_msgSend_allowCrossAccountMessages(self, a2, v2, v3);
  if (v5)
    LOBYTE(v5) = (*((_BYTE *)self + 48) & 0x10) == 0;
  return v5;
}

- (BOOL)disallowFirewallAutoEnroll
{
  uint64_t v2;
  double v3;

  if ((*((_BYTE *)self + 48) & 8) != 0)
    return 1;
  else
    return objc_msgSend_isFirewallEnabled(self, a2, v2, v3) ^ 1;
}

- (BOOL)shouldAllowLiveMessageDelivery
{
  return (*((unsigned __int8 *)self + 45) >> 3) & 1;
}

- (NSArray)allInterestedQueryServices
{
  uint64_t v2;
  double v3;
  NSArray *queryLinkedServiceNames;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  queryLinkedServiceNames = self->_queryLinkedServiceNames;
  if (!queryLinkedServiceNames && !self->_queryService)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  if (objc_msgSend_count(queryLinkedServiceNames, a2, v2, v3))
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v6, (uint64_t)self->_queryService, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v8, v9, (uint64_t)self->_queryLinkedServiceNames, v10);
    v14 = (void *)objc_msgSend_copy(v8, v11, v12, v13);

    return (NSArray *)v14;
  }
  else
  {
    v16[0] = self->_queryService;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v16, v7, 1);
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (unsigned)constraintType
{
  return self->_constraintType;
}

- (unsigned)ktRegistrationDataIndex
{
  return self->_ktRegistrationDataIndex;
}

- (unsigned)applicationKeyIndex
{
  return self->_applicationKeyIndex;
}

- (unsigned)firewallNotificationStyle
{
  return self->_firewallNotificationStyle;
}

- (int64_t)linkedDeviceRelationships
{
  return self->_linkedDeviceRelationships;
}

- (unsigned)controlCategory
{
  return self->_controlCategory;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSServiceProperties *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  char v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  char v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  int v60;
  unsigned int v61;
  char v62;

  v4 = objc_alloc_init(IDSServiceProperties);
  objc_msgSend_setServiceName_(v4, v5, (uint64_t)self->_serviceName, v6);
  objc_msgSend_setProtocolName_(v4, v7, (uint64_t)self->_protocolName, v8);
  objc_msgSend_setDisplayName_(v4, v9, (uint64_t)self->_displayName, v10);
  objc_msgSend_setIdentifier_(v4, v11, (uint64_t)self->_identifier, v12);
  objc_msgSend_setLegacyIdentifier_(v4, v13, (uint64_t)self->_legacyIdentifier, v14);
  objc_msgSend_setPushTopic_(v4, v15, (uint64_t)self->_pushTopic, v16);
  objc_storeStrong((id *)&v4->_launchNotification, self->_launchNotification);
  *((_BYTE *)v4 + 47) = *((_BYTE *)v4 + 47) & 0xFE | *((_BYTE *)self + 47) & 1;
  objc_msgSend_setSuperService_(v4, v17, (uint64_t)self->_superService, v18);
  objc_msgSend_setDataUsageBundleID_(v4, v19, (uint64_t)self->_dataUsageBundleID, v20);
  v4->_adHocServiceType = self->_adHocServiceType;
  v4->_controlCategory = self->_controlCategory;
  v4->_constraintType = self->_constraintType;
  v4->_firewallNotificationStyle = self->_firewallNotificationStyle;
  objc_storeStrong((id *)&v4->_allowedTrafficClassesIndices, self->_allowedTrafficClassesIndices);
  v21 = *((_BYTE *)v4 + 42) & 0xFD | (2 * ((*((unsigned __int8 *)self + 42) >> 1) & 1));
  *((_BYTE *)v4 + 42) = v21;
  v22 = v21 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 42) >> 4) & 1));
  *((_BYTE *)v4 + 42) = v22;
  v23 = v22 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 42) >> 5) & 1));
  *((_BYTE *)v4 + 42) = v23;
  LOBYTE(v23) = v23 & 0xBF | (((*((_BYTE *)self + 42) & 0x40) != 0) << 6);
  *((_BYTE *)v4 + 42) = v23;
  v24 = *((_BYTE *)self + 42) & 0x80 | v23 & 0x7F;
  *((_BYTE *)v4 + 42) = v24;
  v25 = *((_BYTE *)v4 + 47) & 0xFD | (2 * ((*((unsigned __int8 *)self + 47) >> 1) & 1));
  *((_BYTE *)v4 + 47) = v25;
  v26 = v25 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 47) >> 2) & 1));
  *((_BYTE *)v4 + 47) = v26;
  v27 = v26 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 47) >> 3) & 1));
  *((_BYTE *)v4 + 47) = v27;
  v28 = v27 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 47) >> 4) & 1));
  *((_BYTE *)v4 + 47) = v28;
  v29 = v28 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 47) >> 5) & 1));
  *((_BYTE *)v4 + 47) = v29;
  LOBYTE(v29) = v29 & 0xBF | (((*((_BYTE *)self + 47) & 0x40) != 0) << 6);
  *((_BYTE *)v4 + 47) = v29;
  *((_BYTE *)v4 + 47) = *((_BYTE *)self + 47) & 0x80 | v29 & 0x7F;
  v30 = *((_BYTE *)v4 + 43) & 0xFE | *((_BYTE *)self + 43) & 1;
  *((_BYTE *)v4 + 43) = v30;
  v31 = v30 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 43) >> 1) & 1));
  *((_BYTE *)v4 + 43) = v31;
  v32 = v24 & 0xF7 | (8 * ((*((_BYTE *)self + 42) & 8) != 0));
  *((_BYTE *)v4 + 42) = v32;
  v33 = v31 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 43) >> 3) & 1));
  *((_BYTE *)v4 + 43) = v33;
  v34 = v33 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 43) >> 4) & 1));
  *((_BYTE *)v4 + 43) = v34;
  v35 = v34 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 43) >> 5) & 1));
  *((_BYTE *)v4 + 43) = v35;
  LOBYTE(v35) = v35 & 0xBF | (((*((_BYTE *)self + 43) & 0x40) != 0) << 6);
  *((_BYTE *)v4 + 43) = v35;
  LOBYTE(v23) = *((_BYTE *)self + 43) & 0x80 | v35 & 0x7F;
  *((_BYTE *)v4 + 43) = v23;
  v36 = *((_BYTE *)v4 + 44) & 0xFE | *((_BYTE *)self + 44) & 1;
  *((_BYTE *)v4 + 44) = v36;
  v37 = v36 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 44) >> 1) & 1));
  *((_BYTE *)v4 + 44) = v37;
  v4->_allowLaunchOnNearbyDevicesChanged = self->_allowLaunchOnNearbyDevicesChanged;
  v38 = v37 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 44) >> 2) & 1));
  *((_BYTE *)v4 + 44) = v38;
  v39 = v38 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 44) >> 3) & 1));
  *((_BYTE *)v4 + 44) = v39;
  v40 = v39 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 44) >> 4) & 1));
  *((_BYTE *)v4 + 44) = v40;
  v41 = v40 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 44) >> 5) & 1));
  *((_BYTE *)v4 + 44) = v41;
  LOBYTE(v41) = v41 & 0xBF | (((*((_BYTE *)self + 44) & 0x40) != 0) << 6);
  *((_BYTE *)v4 + 44) = v41;
  *((_BYTE *)v4 + 44) = *((_BYTE *)self + 44) & 0x80 | v41 & 0x7F;
  v42 = *((_BYTE *)v4 + 45) & 0xFE | *((_BYTE *)self + 45) & 1;
  *((_BYTE *)v4 + 45) = v42;
  v43 = v42 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 45) >> 1) & 1));
  *((_BYTE *)v4 + 45) = v43;
  v44 = v43 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 45) >> 2) & 1));
  *((_BYTE *)v4 + 45) = v44;
  v45 = v44 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 45) >> 4) & 1));
  *((_BYTE *)v4 + 45) = v45;
  v46 = v45 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 45) >> 5) & 1));
  *((_BYTE *)v4 + 45) = v46;
  LOBYTE(v46) = v46 & 0xBF | (((*((_BYTE *)self + 45) & 0x40) != 0) << 6);
  *((_BYTE *)v4 + 45) = v46;
  LOBYTE(v35) = *((_BYTE *)self + 45) & 0x80 | v46 & 0x7F;
  *((_BYTE *)v4 + 45) = v35;
  v47 = *((_BYTE *)v4 + 46) & 0xFE | *((_BYTE *)self + 46) & 1;
  *((_BYTE *)v4 + 46) = v47;
  v48 = v47 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 46) >> 1) & 1));
  *((_BYTE *)v4 + 46) = v48;
  *((_BYTE *)v4 + 42) = *((_BYTE *)self + 42) & 4 | v32 & 0xFB;
  *((_BYTE *)v4 + 43) = *((_BYTE *)self + 43) & 4 | v23 & 0xFB;
  *((_BYTE *)v4 + 45) = *((_BYTE *)self + 45) & 8 | v35 & 0xF7;
  v49 = v48 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 46) >> 3) & 1));
  *((_BYTE *)v4 + 46) = v49;
  v50 = v49 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 46) >> 4) & 1));
  *((_BYTE *)v4 + 46) = v50;
  v4->_linkedDeviceRelationships = self->_linkedDeviceRelationships;
  v51 = v50 & 0xFFFFFFBF | (((*((unsigned __int8 *)self + 46) >> 6) & 1) << 6);
  *((_BYTE *)v4 + 46) = v51;
  v52 = *((_BYTE *)self + 46) & 0x80 | v51 & 0x7F;
  *((_BYTE *)v4 + 46) = v52;
  v53 = v52 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 46) >> 5) & 1));
  *((_BYTE *)v4 + 46) = v53;
  *((_BYTE *)v4 + 46) = v53 & 0xFB | *((_BYTE *)self + 46) & 4;
  objc_storeStrong((id *)&v4->_duetIdentifiersIndices, self->_duetIdentifiersIndices);
  v4->_minCompatibilityVersion = self->_minCompatibilityVersion;
  v4->_accountSyncMinCompatibilityVersion = self->_accountSyncMinCompatibilityVersion;
  v4->_dataProtectionClass = self->_dataProtectionClass;
  objc_msgSend_setQueryService_(v4, v54, (uint64_t)self->_queryService, v55);
  objc_msgSend_setLinkedServiceNames_(v4, v56, (uint64_t)self->_linkedServiceNames, v57);
  objc_msgSend_setQueryLinkedServiceNames_(v4, v58, (uint64_t)self->_queryLinkedServiceNames, v59);
  v60 = *((_BYTE *)v4 + 48) & 0xFE | *((_BYTE *)self + 48) & 1;
  *((_BYTE *)v4 + 48) = v60;
  v4->_applicationKeyIndex = self->_applicationKeyIndex;
  v4->_ktRegistrationDataIndex = self->_ktRegistrationDataIndex;
  v61 = v60 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 48) >> 3) & 1));
  *((_BYTE *)v4 + 48) = v61;
  LOBYTE(v61) = v61 & 0xEF | (16 * ((*((_BYTE *)self + 48) & 0x10) != 0));
  *((_BYTE *)v4 + 48) = v61;
  v62 = *((_BYTE *)self + 48) & 0x80 | v61 & 0x7F;
  *((_BYTE *)v4 + 48) = v62;
  *((_BYTE *)v4 + 48) = v62 & 0xDF | *((_BYTE *)self + 48) & 0x20;
  LOBYTE(v61) = *((_BYTE *)v4 + 49) & 0xFE | *((_BYTE *)self + 49) & 1;
  *((_BYTE *)v4 + 49) = v61;
  *((_BYTE *)v4 + 49) = v61 & 0xFD | *((_BYTE *)self + 49) & 2;
  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_pushTopic, a3);
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)queryService
{
  return self->_queryService;
}

- (void)setQueryService:(id)a3
{
  objc_storeStrong((id *)&self->_queryService, a3);
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
  objc_storeStrong((id *)&self->_protocolName, a3);
}

- (NSString)superService
{
  return self->_superService;
}

- (void)setSuperService:(id)a3
{
  objc_storeStrong((id *)&self->_superService, a3);
}

- (NSString)dataUsageBundleID
{
  return self->_dataUsageBundleID;
}

- (void)setDataUsageBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsageBundleID, a3);
}

- (BOOL)allowWiProxDelivery
{
  return (*((unsigned __int8 *)self + 42) >> 1) & 1;
}

- (BOOL)allowMagnetDelivery
{
  return (*((unsigned __int8 *)self + 42) >> 2) & 1;
}

- (BOOL)shouldShowUsageNotifications
{
  return (*((unsigned __int8 *)self + 42) >> 3) & 1;
}

- (BOOL)allowPartialSendsToSucceed
{
  return (*((unsigned __int8 *)self + 42) >> 4) & 1;
}

- (BOOL)sendOnePerToken
{
  return (*((unsigned __int8 *)self + 42) >> 6) & 1;
}

- (BOOL)wantsPhoneNumberAccount
{
  return *((unsigned __int8 *)self + 42) >> 7;
}

- (BOOL)iCloudBasedService
{
  return *((_BYTE *)self + 43) & 1;
}

- (BOOL)tunnelService
{
  return (*((unsigned __int8 *)self + 43) >> 1) & 1;
}

- (BOOL)holdsMessagesUntilFirstUnlock
{
  return (*((unsigned __int8 *)self + 43) >> 2) & 1;
}

- (BOOL)shouldAutoRegisterAllHandles
{
  return (*((unsigned __int8 *)self + 43) >> 3) & 1;
}

- (BOOL)shouldRegisterUsingDSHandle
{
  return (*((unsigned __int8 *)self + 43) >> 4) & 1;
}

- (BOOL)shouldSyncAccounts
{
  return (*((unsigned __int8 *)self + 43) >> 5) & 1;
}

- (BOOL)shouldNotSyncPhoneNumberAccounts
{
  return (*((unsigned __int8 *)self + 43) >> 6) & 1;
}

- (BOOL)shouldAllowProxyDelivery
{
  return *((unsigned __int8 *)self + 43) >> 7;
}

- (BOOL)wantsLocalReflectedSend
{
  return *((_BYTE *)self + 44) & 1;
}

- (BOOL)wantsNetworkAvailableHint
{
  return (*((unsigned __int8 *)self + 44) >> 1) & 1;
}

- (BOOL)allowLaunchOnNearbyDevicesChanged
{
  return self->_allowLaunchOnNearbyDevicesChanged;
}

- (BOOL)watchOnlyService
{
  return (*((unsigned __int8 *)self + 44) >> 2) & 1;
}

- (BOOL)allowsDuplicates
{
  return (*((unsigned __int8 *)self + 44) >> 3) & 1;
}

- (BOOL)useiMessageCallerID
{
  return (*((unsigned __int8 *)self + 44) >> 4) & 1;
}

- (BOOL)useFaceTimeCallerID
{
  return (*((unsigned __int8 *)self + 44) >> 5) & 1;
}

- (BOOL)allowPendingMessagesForInactiveDevice
{
  return (*((unsigned __int8 *)self + 44) >> 6) & 1;
}

- (BOOL)allowSendingMessagesToInactiveDevice
{
  return *((unsigned __int8 *)self + 44) >> 7;
}

- (BOOL)shouldProtectTrafficUsingClassA
{
  return *((_BYTE *)self + 45) & 1;
}

- (BOOL)shouldSilentlyFailMessagesOnSwitch
{
  return (*((unsigned __int8 *)self + 45) >> 1) & 1;
}

- (BOOL)shouldAllowCloudDelivery
{
  return (*((unsigned __int8 *)self + 45) >> 2) & 1;
}

- (BOOL)enabledOnlyWhenPaired
{
  return (*((unsigned __int8 *)self + 45) >> 4) & 1;
}

- (BOOL)forceHTTPQueriesOnly
{
  return (*((unsigned __int8 *)self + 45) >> 5) & 1;
}

- (BOOL)wantsRemoteErrors
{
  return (*((unsigned __int8 *)self + 45) >> 6) & 1;
}

- (BOOL)useTransportZone
{
  return *((unsigned __int8 *)self + 45) >> 7;
}

- (BOOL)dontFilterSelfMessagesForUnknownDevice
{
  return *((_BYTE *)self + 46) & 1;
}

- (BOOL)passThroughMessagesFromStorage
{
  return (*((unsigned __int8 *)self + 46) >> 1) & 1;
}

- (BOOL)pushToWakeDisabled
{
  return (*((unsigned __int8 *)self + 46) >> 2) & 1;
}

- (BOOL)disableOnLowRAMDevice
{
  return (*((unsigned __int8 *)self + 46) >> 3) & 1;
}

- (BOOL)wantsPendingMessageUpdates
{
  return (*((unsigned __int8 *)self + 46) >> 4) & 1;
}

- (BOOL)wantsPendingResourceUpdates
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (BOOL)allowCrossAccountMessages
{
  return (*((unsigned __int8 *)self + 47) >> 1) & 1;
}

- (BOOL)blockRemoteTimeouts
{
  return (*((unsigned __int8 *)self + 47) >> 2) & 1;
}

- (BOOL)allowWakingMessages
{
  return (*((unsigned __int8 *)self + 47) >> 3) & 1;
}

- (BOOL)allowUrgentMessages
{
  return (*((unsigned __int8 *)self + 47) >> 4) & 1;
}

- (BOOL)prototypingOnly
{
  return (*((unsigned __int8 *)self + 47) >> 5) & 1;
}

- (BOOL)hadStandalonePreferences
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (BOOL)shouldHaveRestrictedStorage
{
  return (*((unsigned __int8 *)self + 48) >> 2) & 1;
}

- (BOOL)supportsOfflineDelivery
{
  return *((unsigned __int8 *)self + 48) >> 7;
}

- (BOOL)enabledOnlyOnStandaloneDevices
{
  return (*((unsigned __int8 *)self + 46) >> 6) & 1;
}

- (BOOL)tinkerMessagingOnly
{
  return *((unsigned __int8 *)self + 46) >> 7;
}

- (BOOL)disabledOnTinkerWatch
{
  return (*((unsigned __int8 *)self + 46) >> 5) & 1;
}

- (BOOL)isUltraConstrainedPushAllowed
{
  return *((_BYTE *)self + 49) & 1;
}

- (BOOL)requiresPinnedIdentity
{
  return (*((unsigned __int8 *)self + 49) >> 1) & 1;
}

- (NSString)legacyIdentifier
{
  return self->_legacyIdentifier;
}

- (void)setLegacyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_legacyIdentifier, a3);
}

- (NSArray)linkedServiceNames
{
  return self->_linkedServiceNames;
}

- (void)setLinkedServiceNames:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServiceNames, a3);
}

- (BOOL)isUserDrivenRealTime
{
  return (*((unsigned __int8 *)self + 48) >> 5) & 1;
}

- (NSArray)queryLinkedServiceNames
{
  return self->_queryLinkedServiceNames;
}

- (void)setQueryLinkedServiceNames:(id)a3
{
  objc_storeStrong((id *)&self->_queryLinkedServiceNames, a3);
}

@end
