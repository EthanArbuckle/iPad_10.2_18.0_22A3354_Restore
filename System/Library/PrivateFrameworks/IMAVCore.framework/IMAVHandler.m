@implementation IMAVHandler

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedInstance(IMAVController, a2, a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vcCapabilitiesChanged_(v9, v6, a3, v7, v8);

}

+ (void)initialize
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v4, v5, v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v9, v8, (uint64_t)a1, (uint64_t)sel_ensureHandlerSetup, *MEMORY[0x24BE30328], 0);

  }
}

+ (void)ensureHandlerSetup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  uint8_t v12[16];

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_faceTimeSupported(v5, v6, v7, v8, v9);

  if ((v10 & 1) != 0)
  {
    if (qword_253DE9480 != -1)
      dispatch_once(&qword_253DE9480, &unk_24DA57080);
  }
  else
  {
    sub_2190076D0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "VC is not supported on this device, not setting up the AV Handler", v12, 2u);
    }

  }
}

- (void)_handleIncomingWithAccount:(id)a3 fromHandle:(id)a4 conference:(id)a5 properites:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  const __CFString *v49;
  NSObject *v50;
  const __CFString *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const __CFString *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *isVideo_callerProperties;
  _BOOL4 v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  _BOOL4 v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int isInitiator;
  const char *v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  uint64_t v124;
  const char *v125;
  int v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unsigned int v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unsigned int v165;
  NSObject *v166;
  _BOOL4 v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  NSObject *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  char isEqualToIgnoringCase;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  _BOOL4 v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  NSObject *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  NSObject *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSObject *v210;
  const char *v211;
  NSObject *v212;
  NSObject *v213;
  NSObject *v214;
  NSObject *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  char v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  int v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  NSObject *v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  int hasRunningConference;
  NSObject *v239;
  NSObject *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  NSObject *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  NSObject *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  NSObject *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
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
  void *v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  int isFastUserSwitched;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  NSObject *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  NSObject *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t k;
  void *v340;
  char v341;
  NSObject *v342;
  _BOOL4 v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  IMAVChat *v352;
  const char *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  NSObject *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t m;
  void *v377;
  char v378;
  NSObject *v379;
  _BOOL4 v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  void *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  NSObject *v402;
  NSObject *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  void *v408;
  NSObject *v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  NSObject *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  NSObject *v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  NSObject *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  NSObject *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  id v452;
  const char *v453;
  uint64_t v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t j;
  void *v462;
  NSObject *v463;
  NSObject *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  const char *v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  id v479;
  uint64_t i;
  void *v481;
  NSObject *v482;
  NSObject *v483;
  void *v484;
  void *v485;
  void *v486;
  id v487;
  id v488;
  uint64_t v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  int v496;
  void *v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  _BYTE v514[128];
  _BYTE v515[128];
  _BYTE v516[128];
  uint8_t v517[128];
  uint8_t buf[4];
  void *v519;
  __int16 v520;
  uint64_t v521;
  uint64_t v522;

  v522 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v497 = v10;
  objc_msgSend__avChatWaitingForReplyFromIMHandle_orConferenceID_(IMAVChat, v13, (uint64_t)v10, (uint64_t)v11, v14);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v19 = v11;
    objc_msgSend__avChatWithConferenceID_(IMAVChat, v15, (uint64_t)v11, v16, v17);
    v493 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    v493 = 0;
  }
  objc_msgSend__avChatConnectingFromIMHandle_(IMAVChat, v15, (uint64_t)v497, v16, v17);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_blockMultipleIncomingInvitations(v24, v25, v26, v27, v28);

  objc_msgSend_sharedInstance(IMAVController, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_blockIncomingInvitationsDuringCall(v34, v35, v36, v37, v38);

  objc_msgSend_objectForKey_(v12, v40, *MEMORY[0x24BE50450], v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v496 = objc_msgSend_BOOLValue(v43, v44, v45, v46, v47);

  sub_2190076D0();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    if (v29)
      v49 = CFSTR("NO");
    else
      v49 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v519 = (void *)v49;
    _os_log_impl(&dword_218FEA000, v48, OS_LOG_TYPE_DEFAULT, "Allowing multiple invitations: %@", buf, 0xCu);
  }
  v495 = (void *)v18;

  sub_2190076D0();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    if (v39)
      v51 = CFSTR("NO");
    else
      v51 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v519 = (void *)v51;
    _os_log_impl(&dword_218FEA000, v50, OS_LOG_TYPE_DEFAULT, "Allowing incoming invitations during call: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(IMAVController, v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasRunningConference(v57, v58, v59, v60, v61))
      v62 = CFSTR("YES");
    else
      v62 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v519 = (void *)v62;
    _os_log_impl(&dword_218FEA000, v52, OS_LOG_TYPE_DEFAULT, "Has running conference %@", buf, 0xCu);

  }
  objc_msgSend_objectForKey_(v12, v63, *MEMORY[0x24BE50460], v64, v65);
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_BOOLValue(v492, v66, v67, v68, v69))
  {
    v490 = (uint64_t)v12;
    sub_2190076D0();
    isVideo_callerProperties = objc_claimAutoreleasedReturnValue();
    v75 = os_log_type_enabled(isVideo_callerProperties, OS_LOG_TYPE_DEFAULT);
    v76 = v495;
    v77 = v493;
    if (!v493)
    {
      if (v75)
      {
        *(_DWORD *)buf = 138412290;
        v519 = v19;
        _os_log_impl(&dword_218FEA000, isVideo_callerProperties, OS_LOG_TYPE_DEFAULT, "This is is a re-initiate and we do not have a chat running for CID (%@)", buf, 0xCu);
      }
      goto LABEL_157;
    }
    if (v75)
    {
      *(_DWORD *)buf = 138412546;
      v519 = v493;
      v520 = 2112;
      v521 = (uint64_t)v19;
      _os_log_impl(&dword_218FEA000, isVideo_callerProperties, OS_LOG_TYPE_DEFAULT, "We already have a chat running for %@  (%@)", buf, 0x16u);
    }

    objc_msgSend_participantMatchingIMHandle_(v493, v78, (uint64_t)v497, v79, v80);
    isVideo_callerProperties = objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    if (isVideo_callerProperties)
    {
      if (v82)
      {
        *(_DWORD *)buf = 138412290;
        v519 = isVideo_callerProperties;
        _os_log_impl(&dword_218FEA000, v81, OS_LOG_TYPE_DEFAULT, "Re-initiate for: %@", buf, 0xCu);
      }

      if (objc_msgSend_hasConnectingSessions(isVideo_callerProperties, v83, v84, v85, v86)
        && (objc_msgSend_localParticipant(v493, v87, v88, v89, v90),
            v91 = (void *)objc_claimAutoreleasedReturnValue(),
            isInitiator = objc_msgSend_isInitiator(v91, v92, v93, v94, v95),
            v91,
            isInitiator))
      {
        sub_2190076D0();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v97 = "We already started a re-invite and we are the initiator dropping invite on the floor";
LABEL_59:
          _os_log_impl(&dword_218FEA000, v81, OS_LOG_TYPE_DEFAULT, v97, buf, 2u);
        }
      }
      else
      {
        objc_msgSend__processIncomingCallProperties_(isVideo_callerProperties, v87, v490, v89, v90);
        v81 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_setIsReinitiate_(v81, v188, 1, v189, v190);
        objc_msgSend__sendResponse_callInfo_(isVideo_callerProperties, v191, 0, (uint64_t)v81, v192);
      }
    }
    else if (v82)
    {
      *(_WORD *)buf = 0;
      v97 = "[WARN] No participant found to re-initiate";
      goto LABEL_59;
    }

LABEL_157:
    v12 = (id)v490;
    goto LABEL_158;
  }
  v76 = v495;
  if (!v495)
  {
    if (v494)
      v126 = v39;
    else
      v126 = 1;
    if ((v126 & 1) != 0)
    {
      if (!v39)
        goto LABEL_107;
      objc_msgSend_sharedInstance(IMAVCallManager, v70, v71, v72, v73);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend_callState(v127, v128, v129, v130, v131);

      if (v132 == 3)
      {
        v490 = (uint64_t)v12;
        sub_2190076D0();
        v137 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_218FEA000, v137, OS_LOG_TYPE_DEFAULT, "We have a call we're making, declining conference ID: %@", buf, 0xCu);
        }

        objc_msgSend_sharedInstance(IMAVController, v138, v139, v140, v141);
        isVideo_callerProperties = objc_claimAutoreleasedReturnValue();
        objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(isVideo_callerProperties, v142, (uint64_t)v497, 2, v490, 0, v19);
        goto LABEL_134;
      }
      objc_msgSend_sharedInstance(IMAVCallManager, v133, v134, v135, v136);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v227 = objc_msgSend_callState(v222, v223, v224, v225, v226);

      if (v227 == 1)
      {
        v490 = (uint64_t)v12;
        sub_2190076D0();
        v232 = objc_claimAutoreleasedReturnValue();
        v77 = v493;
        if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_218FEA000, v232, OS_LOG_TYPE_DEFAULT, "We have a call we're invited to, declining conference ID: %@", buf, 0xCu);
        }
LABEL_106:

        objc_msgSend_sharedInstance(IMAVController, v278, v279, v280, v281);
        isVideo_callerProperties = objc_claimAutoreleasedReturnValue();
        objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(isVideo_callerProperties, v282, (uint64_t)v497, 2, v490, 0, v19);
        goto LABEL_159;
      }
      objc_msgSend_sharedInstance(IMAVController, v228, v229, v230, v231);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      hasRunningConference = objc_msgSend_hasRunningConference(v233, v234, v235, v236, v237);

      if (hasRunningConference)
      {
        sub_2190076D0();
        v239 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_218FEA000, v239, OS_LOG_TYPE_DEFAULT, "In active conference, declining conference ID: %@", buf, 0xCu);
        }

        sub_2190076D0();
        v240 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__activeChat(IMAVChat, v241, v242, v243, v244);
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v245;
          _os_log_impl(&dword_218FEA000, v240, OS_LOG_TYPE_DEFAULT, "Active chat: %@", buf, 0xCu);

        }
        sub_2190076D0();
        v246 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__nonFinalChat(IMAVChat, v247, v248, v249, v250);
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v251;
          _os_log_impl(&dword_218FEA000, v246, OS_LOG_TYPE_DEFAULT, "Non final chat: %@", buf, 0xCu);

        }
        sub_2190076D0();
        v252 = objc_claimAutoreleasedReturnValue();
        v77 = v493;
        if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__connectedChat(IMAVChat, v253, v254, v255, v256);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v257;
          _os_log_impl(&dword_218FEA000, v252, OS_LOG_TYPE_DEFAULT, "Connected chat: %@", buf, 0xCu);

        }
        sub_2190076D0();
        v258 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__avChatArray(IMAVChat, v259, v260, v261, v262);
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v263;
          _os_log_impl(&dword_218FEA000, v258, OS_LOG_TYPE_DEFAULT, "All chats: %@", buf, 0xCu);

        }
        objc_msgSend__activeChat(IMAVChat, v264, v265, v266, v267);
        v268 = (void *)objc_claimAutoreleasedReturnValue();

        if (v268)
        {
          v490 = (uint64_t)v12;
          sub_2190076D0();
          v232 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend__activeChat(IMAVChat, v273, v274, v275, v276);
            v277 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v519 = v277;
            _os_log_impl(&dword_218FEA000, v232, OS_LOG_TYPE_DEFAULT, "Simple ActiveChat: %@", buf, 0xCu);

          }
          goto LABEL_106;
        }
        v512 = 0u;
        v513 = 0u;
        v510 = 0u;
        v511 = 0u;
        objc_msgSend__avChatArray(IMAVChat, v269, v270, v271, v272);
        v470 = (void *)objc_claimAutoreleasedReturnValue();
        v472 = objc_msgSend_countByEnumeratingWithState_objects_count_(v470, v471, (uint64_t)&v510, (uint64_t)v517, 16);
        if (v472)
        {
          v477 = v472;
          v478 = *(_QWORD *)v511;
          while (2)
          {
            v479 = v9;
            for (i = 0; i != v477; ++i)
            {
              if (*(_QWORD *)v511 != v478)
                objc_enumerationMutation(v470);
              v481 = *(void **)(*((_QWORD *)&v510 + 1) + 8 * i);
              if (objc_msgSend_isActive(v481, v473, v474, v475, v476))
              {
                sub_2190076D0();
                v482 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v482, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v481;
                  _os_log_impl(&dword_218FEA000, v482, OS_LOG_TYPE_DEFAULT, "chat that was active: %@", buf, 0xCu);
                }

                v9 = v479;
                goto LABEL_210;
              }
            }
            v477 = objc_msgSend_countByEnumeratingWithState_objects_count_(v470, v473, (uint64_t)&v510, (uint64_t)v517, 16);
            v9 = v479;
            if (v477)
              continue;
            break;
          }
        }
LABEL_210:

        sub_2190076D0();
        v483 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v483, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v483, OS_LOG_TYPE_DEFAULT, "[IMAVController hasRunningConference] claimed to have an active chat, but we really don't... *******FILE THIS PLEASE*****", buf, 2u);
        }

        sub_2190076D0();
        v193 = objc_claimAutoreleasedReturnValue();
        v77 = v493;
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v193, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVController hasRunningConference] claimed to have an active chat, but we really don't...", buf, 2u);
        }
      }
      else
      {
LABEL_107:
        if (!v29)
        {
          LODWORD(v204) = 0;
          v77 = v493;
          goto LABEL_111;
        }
        objc_msgSend__incomingInvitations(IMAVChat, v70, v71, v72, v73);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v493;
        if (objc_msgSend_count(v283, v284, v285, v286, v287))
        {

        }
        else
        {
          objc_msgSend__outgoingInvitations(IMAVChat, v288, v289, v290, v291);
          v397 = (void *)objc_claimAutoreleasedReturnValue();
          v204 = objc_msgSend_count(v397, v398, v399, v400, v401);

          if (!v204)
            goto LABEL_111;
        }
        sub_2190076D0();
        v402 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v402, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v19;
          _os_log_impl(&dword_218FEA000, v402, OS_LOG_TYPE_DEFAULT, "We have active invite, declining conference ID: %@", buf, 0xCu);
        }

        sub_2190076D0();
        v403 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v403, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__activeChat(IMAVChat, v404, v405, v406, v407);
          v408 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v408;
          _os_log_impl(&dword_218FEA000, v403, OS_LOG_TYPE_DEFAULT, "Active chat: %@", buf, 0xCu);

        }
        sub_2190076D0();
        v409 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v409, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__nonFinalChat(IMAVChat, v410, v411, v412, v413);
          v414 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v414;
          _os_log_impl(&dword_218FEA000, v409, OS_LOG_TYPE_DEFAULT, "Non final chat: %@", buf, 0xCu);

        }
        sub_2190076D0();
        v415 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v415, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__connectedChat(IMAVChat, v416, v417, v418, v419);
          v420 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v420;
          _os_log_impl(&dword_218FEA000, v415, OS_LOG_TYPE_DEFAULT, "Connected chat: %@", buf, 0xCu);

        }
        sub_2190076D0();
        v421 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v421, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__avChatArray(IMAVChat, v422, v423, v424, v425);
          v426 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v519 = v426;
          _os_log_impl(&dword_218FEA000, v421, OS_LOG_TYPE_DEFAULT, "All chats: %@", buf, 0xCu);

        }
        objc_msgSend__nonFinalChat(IMAVChat, v427, v428, v429, v430);
        v431 = (void *)objc_claimAutoreleasedReturnValue();

        if (v431)
        {
          v490 = (uint64_t)v12;
          sub_2190076D0();
          v436 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v436, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend__nonFinalChat(IMAVChat, v437, v438, v439, v440);
            v441 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v519 = v441;
            _os_log_impl(&dword_218FEA000, v436, OS_LOG_TYPE_DEFAULT, "Simple nonFinalChat: %@", buf, 0xCu);

          }
          v76 = 0;
LABEL_197:

          objc_msgSend_sharedInstance(IMAVController, v465, v466, v467, v468);
          isVideo_callerProperties = objc_claimAutoreleasedReturnValue();
          objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(isVideo_callerProperties, v469, (uint64_t)v497, 2, v490, 0, v19);
          goto LABEL_157;
        }
        v452 = v9;
        v508 = 0u;
        v509 = 0u;
        v506 = 0u;
        v507 = 0u;
        objc_msgSend__avChatArray(IMAVChat, v432, v433, v434, v435);
        v436 = objc_claimAutoreleasedReturnValue();
        v454 = objc_msgSend_countByEnumeratingWithState_objects_count_(v436, v453, (uint64_t)&v506, (uint64_t)v516, 16);
        if (v454)
        {
          v459 = v454;
          v460 = *(_QWORD *)v507;
          while (2)
          {
            for (j = 0; j != v459; ++j)
            {
              if (*(_QWORD *)v507 != v460)
                objc_enumerationMutation(v436);
              v462 = *(void **)(*((_QWORD *)&v506 + 1) + 8 * j);
              if (objc_msgSend_isActive(v462, v455, v456, v457, v458))
              {
                v490 = (uint64_t)v12;
                sub_2190076D0();
                v464 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v464, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v462;
                  _os_log_impl(&dword_218FEA000, v464, OS_LOG_TYPE_DEFAULT, "chat that was active: %@", buf, 0xCu);
                }

                v9 = v452;
                v76 = 0;
                v77 = v493;
                goto LABEL_197;
              }
            }
            v459 = objc_msgSend_countByEnumeratingWithState_objects_count_(v436, v455, (uint64_t)&v506, (uint64_t)v516, 16);
            if (v459)
              continue;
            break;
          }
        }

        sub_2190076D0();
        v463 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v463, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v463, OS_LOG_TYPE_DEFAULT, "[IMAVController hasRunningConference] claimed to have an active chat, but we really don't... *******FILE THIS PLEASE*****", buf, 2u);
        }

        sub_2190076D0();
        v193 = objc_claimAutoreleasedReturnValue();
        v9 = v452;
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v193, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVController hasRunningConference] claimed to have an active chat, but we really don't...", buf, 2u);
        }
        v77 = v493;
      }
    }
    else
    {
      sub_2190076D0();
      v193 = objc_claimAutoreleasedReturnValue();
      v77 = v493;
      if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_otherIMHandle(v494, v194, v195, v196, v197);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ID(v198, v199, v200, v201, v202);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v519 = v203;
        v520 = 2112;
        v521 = (uint64_t)v494;
        _os_log_impl(&dword_218FEA000, v193, OS_LOG_TYPE_DEFAULT, "We already have a chat connecting from %@  (%@), accepting incoming invite and declining existing chat", buf, 0x16u);

      }
    }
    LODWORD(v204) = v126 ^ 1;

    goto LABEL_111;
  }
  sub_2190076D0();
  v98 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_otherIMHandle(v495, v99, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ID(v103, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v519 = v108;
    v520 = 2112;
    v521 = (uint64_t)v495;
    _os_log_impl(&dword_218FEA000, v98, OS_LOG_TYPE_DEFAULT, "We already have a chat awaiting reply from %@  (%@)", buf, 0x16u);

  }
  objc_msgSend_remoteParticipants(v495, v109, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend_count(v113, v114, v115, v116, v117);

  if (v118 >= 2)
  {
    objc_msgSend_sharedInstance(IMAVController, v119, v120, v121, v122);
    v123 = objc_claimAutoreleasedReturnValue();
    v124 = (uint64_t)v12;
    isVideo_callerProperties = v123;
    v490 = v124;
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v123, v125, (uint64_t)v497, 2, v124, v9, v19);
LABEL_156:
    v77 = v493;
    goto LABEL_157;
  }
  v487 = v9;
  objc_msgSend_participantMatchingIMHandle_(v495, v119, (uint64_t)v497, v121, v122);
  v143 = objc_claimAutoreleasedReturnValue();
  v144 = (uint64_t)v12;
  objc_msgSend_objectForKey_(v12, v145, *MEMORY[0x24BE50468], v146, v147);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v148, (uint64_t)v484, v149, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v151, v152, *MEMORY[0x24BE504F0], v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = objc_msgSend_sessionID(v495, v156, v157, v158, v159);
  v165 = objc_msgSend_unsignedIntValue(v155, v161, v162, v163, v164);
  sub_2190076D0();
  v166 = objc_claimAutoreleasedReturnValue();
  v167 = os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT);
  v491 = (void *)v143;
  if (v143)
  {
    if (v167)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v166, OS_LOG_TYPE_DEFAULT, "We have cross invites", buf, 2u);
    }

    if (v160 == v165)
    {
      v12 = (id)v144;
      if (!v19
        || (objc_msgSend_conferenceID(v495, v168, v169, v170, v171),
            v172 = (void *)objc_claimAutoreleasedReturnValue(),
            v172,
            !v172))
      {
LABEL_81:
        sub_2190076D0();
        v215 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v215, OS_LOG_TYPE_DEFAULT, "Cross invites: We are the host, declining incoming invite", buf, 2u);
        }

        objc_msgSend_sharedInstance(IMAVController, v216, v217, v218, v219);
        v210 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v210, v220, (uint64_t)v497, 2, (uint64_t)v12, v487, v19);
LABEL_84:
        LODWORD(v204) = 0;
LABEL_85:
        v77 = v493;

        v221 = v204;
        v76 = v495;
        goto LABEL_86;
      }
      sub_2190076D0();
      v173 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v173, OS_LOG_TYPE_DEFAULT, "Using conference IDs to pick the host", buf, 2u);
      }

      objc_msgSend_conferenceID(v495, v174, v175, v176, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v19, v179, (uint64_t)v178, v180, v181);

      if ((isEqualToIgnoringCase & 1) != 0)
      {
        v187 = 0;
      }
      else
      {
        objc_msgSend_conferenceID(v495, v183, v184, v185, v186);
        v442 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = objc_msgSend_compare_(v19, v443, (uint64_t)v442, v444, v445) == 1;

      }
      sub_2190076D0();
      v446 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v446, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_conferenceID(v495, v447, v448, v449, v450);
        v451 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v519 = v451;
        _os_log_impl(&dword_218FEA000, v446, OS_LOG_TYPE_DEFAULT, "Cross invites: our   conference ID %@", buf, 0xCu);

      }
      sub_2190076D0();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v19;
        _os_log_impl(&dword_218FEA000, v214, OS_LOG_TYPE_DEFAULT, "Cross invites: their conference ID %@", buf, 0xCu);
      }
    }
    else
    {
      sub_2190076D0();
      v212 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v212, OS_LOG_TYPE_DEFAULT, "Using session IDs to pick the host", buf, 2u);
      }

      v187 = v160 < v165;
      sub_2190076D0();
      v213 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v519) = v160;
        _os_log_impl(&dword_218FEA000, v213, OS_LOG_TYPE_DEFAULT, "Cross invites: our   session ID %u", buf, 8u);
      }

      sub_2190076D0();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v519) = v165;
        _os_log_impl(&dword_218FEA000, v214, OS_LOG_TYPE_DEFAULT, "Cross invites: their session ID %u", buf, 8u);
      }
      v12 = (id)v144;
    }

    if (v187)
    {
      sub_2190076D0();
      v210 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v210, OS_LOG_TYPE_DEFAULT, "They are the host, cancelling our outgoing invite", buf, 2u);
      }
      LODWORD(v204) = 1;
      goto LABEL_85;
    }
    goto LABEL_81;
  }
  if (v167)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v166, OS_LOG_TYPE_DEFAULT, "Buddy not found, this is not a cross invite", buf, 2u);
  }

  v12 = (id)v144;
  if (v39)
  {
    sub_2190076D0();
    v205 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v205, OS_LOG_TYPE_DEFAULT, "Not allowing incoming invitation during call, declining...", buf, 2u);
    }

    objc_msgSend_sharedInstance(IMAVController, v206, v207, v208, v209);
    v210 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v210, v211, (uint64_t)v497, 2, v144, v487, v19);
    goto LABEL_84;
  }
  LODWORD(v204) = 0;
  v221 = 1;
  v76 = v495;
  v77 = v493;
LABEL_86:

  v9 = v487;
  if ((v221 & 1) == 0)
    goto LABEL_158;
LABEL_111:
  objc_msgSend_allBuddyListIMHandles(MEMORY[0x24BE50280], v70, v71, v72, v73);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v296 = objc_msgSend_indexOfObjectIdenticalTo_(v292, v293, (uint64_t)v497, v294, v295);

  if ((objc_msgSend_hasConferencing(v497, v297, v298, v299, v300) & 1) == 0 && v296 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setCapabilities_(v497, v301, 0x1000000E0000, v303, v304);
    objc_msgSend_setPersonStatus_(v497, v305, 4, v306, v307);
  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v301, v302, v303, v304);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  isFastUserSwitched = objc_msgSend_isFastUserSwitched(v308, v309, v310, v311, v312);

  if (isFastUserSwitched)
  {
    sub_2190076D0();
    v318 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v318, OS_LOG_TYPE_DEFAULT, "We're fast user switched out, declining invite", buf, 2u);
    }

    objc_msgSend_sharedInstance(IMAVController, v319, v320, v321, v322);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    v490 = (uint64_t)v12;
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v323, v324, (uint64_t)v497, 1, (uint64_t)v12, v9, v19);

    sub_2190076D0();
    v325 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v325, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v519 = v497;
      v520 = 2048;
      v521 = 3;
      _os_log_impl(&dword_218FEA000, v325, OS_LOG_TYPE_DEFAULT, "Notifying delegates about inviteFailedFromIMHandle %@ reason %ld", buf, 0x16u);
    }

    v500 = 0u;
    v501 = 0u;
    v498 = 0u;
    v499 = 0u;
    objc_msgSend_sharedInstance(IMAVController, v326, v327, v328, v329);
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delegates(v330, v331, v332, v333, v334);
    isVideo_callerProperties = objc_claimAutoreleasedReturnValue();

    v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(isVideo_callerProperties, v335, (uint64_t)&v498, (uint64_t)v514, 16);
    if (v336)
    {
      v337 = v336;
      v485 = v19;
      v338 = *(_QWORD *)v499;
      do
      {
        for (k = 0; k != v337; ++k)
        {
          if (*(_QWORD *)v499 != v338)
            objc_enumerationMutation(isVideo_callerProperties);
          v340 = *(void **)(*((_QWORD *)&v498 + 1) + 8 * k);
          v341 = objc_opt_respondsToSelector();
          sub_2190076D0();
          v342 = objc_claimAutoreleasedReturnValue();
          v343 = os_log_type_enabled(v342, OS_LOG_TYPE_DEFAULT);
          if ((v341 & 1) != 0)
          {
            if (v343)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v340;
              _os_log_impl(&dword_218FEA000, v342, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
            }

            objc_msgSend_inviteFailedFromIMHandle_reason_(v340, v344, (uint64_t)v497, 3, v345);
          }
          else
          {
            if (v343)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v340;
              _os_log_impl(&dword_218FEA000, v342, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
            }

          }
        }
        v337 = objc_msgSend_countByEnumeratingWithState_objects_count_(isVideo_callerProperties, v346, (uint64_t)&v498, (uint64_t)v514, 16);
      }
      while (v337);
      v19 = v485;
LABEL_134:
      v76 = v495;
      goto LABEL_156;
    }
LABEL_159:
    v76 = v495;
    goto LABEL_157;
  }
  v76 = v495;
  if ((v496 & 1) == 0)
  {
    objc_msgSend_sharedInstance(IMAVController, v314, v315, v316, v317);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cameraCapable(v347, v348, v349, v350, v351);

  }
  if (v497)
  {
    v352 = [IMAVChat alloc];
    v490 = (uint64_t)v12;
    isVideo_callerProperties = objc_msgSend_initIncomingFrom_isVideo_callerProperties_(v352, v353, (uint64_t)v497, v496 ^ 1u, (uint64_t)v12);
    objc_msgSend__setConferenceID_(isVideo_callerProperties, v354, (uint64_t)v19, v355, v356);
    if (!(_DWORD)v204)
    {
      objc_msgSend__handleIncomingAVChatForNotification_(self, v357, (uint64_t)isVideo_callerProperties, v359, v360);
      goto LABEL_157;
    }
    v486 = v19;
    v488 = v9;
    objc_msgSend_beginChat(isVideo_callerProperties, v357, v358, v359, v360);
    sub_2190076D0();
    v361 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v361, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v519 = isVideo_callerProperties;
      _os_log_impl(&dword_218FEA000, v361, OS_LOG_TYPE_DEFAULT, "Notifying delegates about invitedToIMAVChat %@", buf, 0xCu);
    }

    v504 = 0u;
    v505 = 0u;
    v502 = 0u;
    v503 = 0u;
    objc_msgSend_sharedInstance(IMAVController, v362, v363, v364, v365);
    v366 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delegates(v366, v367, v368, v369, v370);
    v371 = (void *)objc_claimAutoreleasedReturnValue();

    v373 = objc_msgSend_countByEnumeratingWithState_objects_count_(v371, v372, (uint64_t)&v502, (uint64_t)v515, 16);
    if (v373)
    {
      v374 = v373;
      v375 = *(_QWORD *)v503;
      do
      {
        for (m = 0; m != v374; ++m)
        {
          if (*(_QWORD *)v503 != v375)
            objc_enumerationMutation(v371);
          v377 = *(void **)(*((_QWORD *)&v502 + 1) + 8 * m);
          v378 = objc_opt_respondsToSelector();
          sub_2190076D0();
          v379 = objc_claimAutoreleasedReturnValue();
          v380 = os_log_type_enabled(v379, OS_LOG_TYPE_DEFAULT);
          if ((v378 & 1) != 0)
          {
            if (v380)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v377;
              _os_log_impl(&dword_218FEA000, v379, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
            }

            objc_msgSend_invitedToIMAVChat_(v377, v381, (uint64_t)isVideo_callerProperties, v382, v383);
          }
          else
          {
            if (v380)
            {
              *(_DWORD *)buf = 138412290;
              v519 = v377;
              _os_log_impl(&dword_218FEA000, v379, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
            }

          }
        }
        v374 = objc_msgSend_countByEnumeratingWithState_objects_count_(v371, v384, (uint64_t)&v502, (uint64_t)v515, 16);
      }
      while (v374);
    }

    objc_msgSend_acceptInvitation(isVideo_callerProperties, v385, v386, v387, v388);
    v76 = v495;
    objc_msgSend_cancelInvitation(v495, v389, v390, v391, v392);
    objc_msgSend_endChat(v494, v393, v394, v395, v396);
    v19 = v486;
    v9 = v488;
    goto LABEL_156;
  }
LABEL_158:

}

- (void)account:(id)a3 conference:(id)a4 receivedInvitationFrom:(id)a5 properties:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  sub_2190076D0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138412546;
    v30 = v11;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "Incoming VC Invitation from: %@   conference ID: %@", (uint8_t *)&v29, 0x16u);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountForUniqueID_(v19, v20, (uint64_t)v13, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imHandleWithInfo_(v23, v24, (uint64_t)v11, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__handleIncomingWithAccount_fromHandle_conference_properites_(self, v28, (uint64_t)v23, (uint64_t)v27, (uint64_t)v10, v12);

}

- (void)account:(id)a3 conference:(id)a4 receivedResponseToInvitationFrom:(id)a5 properties:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
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
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
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
  void *v41;
  const char *v42;
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
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BE50288];
  v12 = a5;
  v13 = a3;
  objc_msgSend_sharedInstance(v11, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountForUniqueID_(v18, v19, (uint64_t)v13, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v22;
  objc_msgSend_imHandleWithInfo_(v22, v23, (uint64_t)v12, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ID(v26, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v77 = v32;
    _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "Incoming VC Response from: %@", buf, 0xCu);

  }
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v33, (uint64_t)v10, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v36;
  if (v26)
    objc_msgSend_setObject_forKey_(v36, v37, (uint64_t)v26, *MEMORY[0x24BE504D0], v39);
  objc_msgSend_objectForKey_(v10, v37, *MEMORY[0x24BE504E0], v38, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v42, (uint64_t)v41, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v45, v46, *MEMORY[0x24BE504F0], v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_unsignedIntValue(v49, v50, v51, v52, v53);
  if (!v9)
  {
    v62 = 0;
LABEL_15:
    objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v54, (uint64_t)v26, (uint64_t)v9, v57, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__responseToVCInvite_(v67, v72, (uint64_t)v40, v73, v74);
    goto LABEL_16;
  }
  objc_msgSend__avChatWithConferenceID_(IMAVChat, v54, (uint64_t)v9, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v58;
  if (!v58 || objc_msgSend_state(v58, v54, v59, v60, v61) != 4)
    goto LABEL_15;
  sub_2190076D0();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v77 = v62;
    v78 = 2112;
    v79 = v9;
    _os_log_impl(&dword_218FEA000, v63, OS_LOG_TYPE_DEFAULT, "We already have a chat running for %@  (%@)", buf, 0x16u);
  }

  objc_msgSend_participantMatchingIMHandle_(v62, v64, (uint64_t)v26, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
  if (v67)
  {
    if (v69)
    {
      *(_DWORD *)buf = 138412290;
      v77 = v67;
      _os_log_impl(&dword_218FEA000, v68, OS_LOG_TYPE_DEFAULT, "Accept re-initiate for: %@", buf, 0xCu);
    }

    objc_msgSend__processResponseDictionary_allowSecondConnection_(v67, v70, (uint64_t)v10, 1, v71);
  }
  else
  {
    if (v69)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v68, OS_LOG_TYPE_DEFAULT, "[WARN] No participant found to accept re-initiate", buf, 2u);
    }

  }
LABEL_16:

}

- (void)account:(id)a3 conference:(id)a4 receivedCancelInvitationFrom:(id)a5 properties:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
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
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
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
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  NSObject *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  unsigned int v69;
  void *v70;
  int v71;
  id v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (void *)MEMORY[0x24BE50288];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend_sharedInstance(v10, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountForUniqueID_(v18, v19, (uint64_t)v13, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imHandleWithInfo_(v22, v23, (uint64_t)v12, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ID(v26, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 138412290;
    v72 = v32;
    _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "Incoming VC Cancel from: %@", (uint8_t *)&v71, 0xCu);

  }
  objc_msgSend_objectForKey_(v11, v33, *MEMORY[0x24BE504E0], v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v37, (uint64_t)v36, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v40, v41, *MEMORY[0x24BE504F0], v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v40, v45, *MEMORY[0x24BE504D8], v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_unsignedIntValue(v44, v49, v50, v51, v52);
  objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v54, (uint64_t)v26, (uint64_t)v9, v53, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
  if (v55)
  {
    if (v57)
    {
      v71 = 138412290;
      v72 = v55;
      _os_log_impl(&dword_218FEA000, v56, OS_LOG_TYPE_DEFAULT, "Found chat to cancel: %@", (uint8_t *)&v71, 0xCu);
    }

    v66 = objc_msgSend_intValue(v48, v62, v63, v64, v65);
    if (v66 == 10)
      v69 = 29;
    else
      v69 = 1;
    if (v66 == 8)
      objc_msgSend__cancelInvitationWithReason_error_(v55, v67, 27, 0, v68);
    else
      objc_msgSend__cancelInvitationWithReason_error_(v55, v67, v69, 0, v68);
  }
  else
  {
    if (v57)
    {
      objc_msgSend_ID(v26, v58, v59, v60, v61);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 138412546;
      v72 = v9;
      v73 = 2112;
      v74 = v70;
      _os_log_impl(&dword_218FEA000, v56, OS_LOG_TYPE_DEFAULT, "[WARN] Found no VC chat to cancel for conference: %@ with buddy: %@", (uint8_t *)&v71, 0x16u);

    }
  }

}

- (void)account:(id)a3 conference:(id)a4 receivedAVMessage:(unsigned int)a5 from:(id)a6 sessionID:(unsigned int)a7 userInfo:(id)a8
{
  uint64_t v9;
  uint64_t v11;
  id v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;

  v9 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a5;
  v35 = a3;
  v13 = a6;
  v14 = a8;
  objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v15, 0, (uint64_t)a4, v9, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountForUniqueID_(v21, v22, (uint64_t)v35, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imHandleWithInfo_(v25, v26, (uint64_t)v13, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantMatchingIMHandle_(v20, v30, (uint64_t)v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_handleGenericAVMessageFromParticipant_type_userInfo_(v20, v34, (uint64_t)v33, v11, (uint64_t)v14);
  }

}

- (void)account:(id)a3 conference:(id)a4 peerIDChangedFromID:(id)a5 toID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  sub_2190076D0();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_218FEA000, v13, OS_LOG_TYPE_DEFAULT, "Account: %@    Requested changing of Peer ID from: %@  to %@", (uint8_t *)&v22, 0x20u);
  }

  objc_msgSend__avChatWithConferenceID_(IMAVChat, v14, (uint64_t)v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  if (v17)
  {
    objc_msgSend__peerID_changedTo_(v17, v18, (uint64_t)v11, (uint64_t)v12, v19);
  }
  else
  {
    sub_2190076D0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138413058;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "%@ requested a change of conference (%@) peer ID: %@  to: %@  but it doesn't exist!", (uint8_t *)&v22, 0x2Au);
    }

  }
}

- (void)account:(id)a3 conference:(id)a4 changedToNewConferenceID:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412802;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Account: %@    Requested changing of conference ID: %@  to %@", (uint8_t *)&v21, 0x20u);
  }

  objc_msgSend__avChatWithConferenceID_(IMAVChat, v11, (uint64_t)v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v21 = 138412290;
      v22 = v9;
      _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "VC Conference ID Set to: %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend__setConferenceID_(v14, v17, (uint64_t)v9, v18, v19);
  }
  else
  {
    if (v16)
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "** VC Conference ID could not be set!", (uint8_t *)&v21, 2u);
    }

    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412802;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "%@ requested a change of conference ID: %@  to: %@  but it doesn't exist!", (uint8_t *)&v21, 0x20u);
    }

  }
}

- (void)_notifyOfIncomingInvitationFor:(id)a3 notifyInvitationListeners:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  char v33;
  NSObject *v34;
  _BOOL4 v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t isVideo;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  const __CFString *v63;
  uint64_t v64;

  v4 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v61 = v5;
    v62 = 2112;
    v63 = v7;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "chat %@ notifyInvitationListeners %@", buf, 0x16u);
  }

  if (v4)
  {
    if (!objc_msgSend_state(v5, v8, v9, v10, v11))
    {
      v54 = (uint64_t)v5;
      objc_msgSend_beginChat(v5, v12, v13, v14, v15);
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend_sharedInstance(IMAVController, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_delegates(v20, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v55, (uint64_t)v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v56 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            sub_2190076D0();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v31;
              _os_log_impl(&dword_218FEA000, v32, OS_LOG_TYPE_DEFAULT, "Checking delegate: %@", buf, 0xCu);
            }

            v33 = objc_opt_respondsToSelector();
            sub_2190076D0();
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if ((v33 & 1) != 0)
            {
              if (v35)
              {
                *(_DWORD *)buf = 138412290;
                v61 = v31;
                _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
              }

              objc_msgSend_invitedToIMAVChat_(v31, v36, v54, v37, v38);
            }
            else
            {
              if (v35)
              {
                *(_DWORD *)buf = 138412290;
                v61 = v31;
                _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
              }

            }
          }
          v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v39, (uint64_t)&v55, (uint64_t)v59, 16);
        }
        while (v28);
      }

      v5 = (id)v54;
    }
    objc_msgSend_initiatorIMHandle(v5, v12, v13, v14, v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ID(v40, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    isVideo = objc_msgSend_isVideo(v5, v46, v47, v48, v49);
    objc_msgSend__submitCallStartedLoggingWithRecipientID_isCaller_isVideo_(v5, v51, (uint64_t)v45, 0, isVideo);

    if (ShouldAutoAcceptInvitations())
      objc_msgSend_performSelector_withObject_afterDelay_(v5, v52, (uint64_t)sel_acceptInvitation, 0, v53, 0.0);
  }

}

- (void)_enqueueIMAVChatForNetworkActivation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *pendingLookups;
  NSMutableArray *v14;
  NSMutableArray *pendingChats;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  NSMutableArray *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  id v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int isScreenLit;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  double v86;
  NSObject *v87;
  double v88;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  id v100;
  id v101;
  id v102;
  const char *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  id v140;
  IMAVHandler *v141;
  id v142[3];
  id location;
  uint8_t v144[128];
  uint8_t buf[4];
  uint64_t v146;
  __int16 v147;
  double v148;
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_pendingChats, v5, (uint64_t)v4, v6, v7) & 1) == 0)
  {
    if (!self->_pendingLookups)
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      pendingLookups = self->_pendingLookups;
      self->_pendingLookups = v12;

    }
    if (!self->_pendingChats)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      pendingChats = self->_pendingChats;
      self->_pendingChats = v14;

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v8, v9, v10, v11);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_allowAnyNetwork(v134, v16, v17, v18, v19) & 1) != 0)
    {
      sub_2190076D0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "We're allowed to use any network, bypassing check", buf, 2u);
      }

      if (objc_msgSend_state(v4, v25, v26, v27, v28) > 4)
        goto LABEL_47;
      sub_2190076D0();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v146 = (uint64_t)v4;
        _os_log_impl(&dword_218FEA000, v29, OS_LOG_TYPE_DEFAULT, "Notifying for chat: %@", buf, 0xCu);
      }

      objc_msgSend__notifyOfIncomingInvitationFor_notifyInvitationListeners_(self, v30, (uint64_t)v4, 1, v31);
      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      v32 = self->_pendingChats;
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v135, (uint64_t)v144, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v136;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v136 != v36)
              objc_enumerationMutation(v32);
            v38 = *(id *)(*((_QWORD *)&v135 + 1) + 8 * i);
            if (v38 != v4)
            {
              sub_2190076D0();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v146 = (uint64_t)v38;
                _os_log_impl(&dword_218FEA000, v39, OS_LOG_TYPE_DEFAULT, "Declining other chat: %@", buf, 0xCu);
              }

              objc_msgSend_declineInvitationWithResponse_(v38, v40, 2, v41, v42);
            }
          }
          v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v135, (uint64_t)v144, 16);
        }
        while (v35);
      }
    }
    else
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v20, v21, v22, v23);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend_wifiAllowedForBundleId_(v43, v44, (uint64_t)CFSTR("com.apple.facetime"), v45, v46);

      objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v47;
      v58 = objc_msgSend_nonWifiFaceTimeAvailable(v52, v54, v55, v56, v57);

      if (v58)
        v63 = 2.0;
      else
        v63 = 15.0;
      if (v58)
        v64 = (void *)(v53 | 2);
      else
        v64 = (void *)v53;
      objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v59, v60, v61, v62);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      isScreenLit = objc_msgSend_isScreenLit(v65, v66, v67, v68, v69);

      if (isScreenLit)
      {
        v71 = objc_alloc_init(MEMORY[0x24BDBCE60]);
        objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v72, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateScreenLightLastChanged(v76, v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_timeIntervalSinceDate_(v71, v82, (uint64_t)v81, v83, v84);
        v86 = v85;
        sub_2190076D0();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v146 = *(_QWORD *)&v86;
          _os_log_impl(&dword_218FEA000, v87, OS_LOG_TYPE_DEFAULT, "Time since lights on: %f", buf, 0xCu);
        }

        if (v86 <= 0.0)
        {
          v88 = v63;
        }
        else
        {
          v88 = 0.0;
          if (v86 < v63)
            v88 = v63 - v86;
        }

      }
      else
      {
        v88 = v63;
      }
      IMTimeOfDay();
      v90 = v89;
      objc_msgSend__timings(v4, v91, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startTimingForKey_(v95, v96, (uint64_t)CFSTR("incoming-network-check"), v97, v98);

      sub_2190076D0();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v146 = 0x403E000000000000;
        v147 = 2048;
        v148 = v88;
        _os_log_impl(&dword_218FEA000, v99, OS_LOG_TYPE_DEFAULT, "Starting availability check with network timeout: %fs   wifi timeout: %fs", buf, 0x16u);
      }

      v100 = objc_alloc(MEMORY[0x24BE50330]);
      objc_initWeak(&location, v100);
      v101 = v100;
      v139[0] = MEMORY[0x24BDAC760];
      v139[1] = 3221225472;
      v139[2] = sub_218FEEA88;
      v139[3] = &unk_24DA570A8;
      v102 = v4;
      v140 = v102;
      v142[1] = v90;
      objc_copyWeak(v142, &location);
      v141 = self;
      v142[2] = v64;
      v32 = (NSMutableArray *)objc_msgSend_initWithFlags_options_timeout_wifiTimeout_completionBlock_(v101, v103, (uint64_t)v64, 0, (uint64_t)v139, 30.0, v88);

      sub_2190076D0();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_initiatorIMHandle(v102, v105, v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ID(v109, v110, v111, v112, v113);
        v114 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_conferenceID(v102, v115, v116, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v146 = (uint64_t)v114;
        v147 = 2112;
        v148 = *(double *)&v119;
        _os_log_impl(&dword_218FEA000, v104, OS_LOG_TYPE_DEFAULT, "Enqueing VC Invitation from: %@   conference ID: %@", buf, 0x16u);

      }
      objc_msgSend_setContext_(v32, v120, (uint64_t)v102, v121, v122);
      objc_msgSend_addObject_(self->_pendingLookups, v123, (uint64_t)v32, v124, v125);
      objc_msgSend_addObject_(self->_pendingChats, v126, (uint64_t)v102, v127, v128);
      sub_2190076D0();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v146 = (uint64_t)v102;
        _os_log_impl(&dword_218FEA000, v129, OS_LOG_TYPE_DEFAULT, "Adding pendingChat %@", buf, 0xCu);
      }

      objc_msgSend_start(v32, v130, v131, v132, v133);
      objc_destroyWeak(v142);

      objc_destroyWeak(&location);
    }

LABEL_47:
  }

}

- (void)_handleIncomingAVChatForNotification:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_initiatorIMHandle(v4, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ID(v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferenceID(v4, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v15;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Handling VC Invitation from: %@   conference ID: %@", (uint8_t *)&v27, 0x16u);

  }
  sub_2190076D0();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "Will try to bring up network if needed", (uint8_t *)&v27, 2u);
  }

  objc_msgSend__enqueueIMAVChatForNetworkActivation_(self, v22, (uint64_t)v4, v23, v24);
  objc_msgSend__notifyOfIncomingInvitationFor_notifyInvitationListeners_(self, v25, (uint64_t)v4, 0, v26);

}

- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  IMAVChat *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  NSObject *isRelayed_GUID;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int shouldRunACConferences;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  NSObject *v101;
  char v102;
  NSObject *v103;
  _BOOL4 v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  NSObject *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  _BOOL4 v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  const char *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  double v162;
  double v163;
  NSObject *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  double v173;
  double v174;
  NSObject *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSObject *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  NSObject *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  double v211;
  double v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  NSObject *v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  NSObject *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  id v252;
  id v253;
  uint64_t v254;
  void *v255;
  double v256;
  double v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  uint8_t v262[128];
  uint8_t buf[4];
  _BYTE v264[34];
  __int16 v265;
  const __CFString *v266;
  uint64_t v267;
  NSSize v268;

  v7 = a7;
  v267 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  sub_2190076D0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)&v264[8] = 1024;
    v15 = CFSTR("NO");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v264 = v11;
    if (v7)
      v15 = CFSTR("YES");
    *(_DWORD *)&v264[10] = a4;
    *(_WORD *)&v264[14] = 2112;
    *(_QWORD *)&v264[16] = v12;
    *(_WORD *)&v264[24] = 2112;
    *(_QWORD *)&v264[26] = v13;
    v265 = 2112;
    v266 = v15;
    _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "account %@   avAction %d   withArguments %@   toAVChat %@   isVideo %@", buf, 0x30u);
  }

  if (!a4)
  {
    sub_2190076D0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "Told to create an outgoing chat", buf, 2u);
    }

    objc_msgSend_objectForKey_(v12, v29, (uint64_t)CFSTR("Initiator"), v30, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v32, (uint64_t)v22, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v12, v36, (uint64_t)CFSTR("Other"), v37, v38);
    v254 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v39, v254, v40, v41);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v12, v42, (uint64_t)CFSTR("IsRelayed"), v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

    objc_msgSend_objectForKey_(v12, v51, (uint64_t)CFSTR("GUID"), v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v54;
    if (!v35 || !v255 || !v54)
    {
      sub_2190076D0();
      isRelayed_GUID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(isRelayed_GUID, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v264 = v35;
        *(_WORD *)&v264[8] = 2112;
        *(_QWORD *)&v264[10] = v255;
        *(_WORD *)&v264[18] = 2112;
        *(_QWORD *)&v264[20] = v55;
        _os_log_impl(&dword_218FEA000, isRelayed_GUID, OS_LOG_TYPE_DEFAULT, "Missing arguments to create outgoing chat, initiatorIMHandle %@ otherIMHandle %@ guid %@", buf, 0x20u);
      }
      v82 = (void *)v254;
      goto LABEL_43;
    }
    v250 = v35;
    v251 = v22;
    v252 = v11;
    v56 = v54;
    v57 = [IMAVChat alloc];
    objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v58, (uint64_t)v255, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = (void *)v56;
    isRelayed_GUID = objc_msgSend__initOutgoingTo_isVideo_isRelayed_GUID_(v57, v62, (uint64_t)v61, v7, v50, v56);

    objc_msgSend_sharedInstance(IMAVController, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__shouldRunConferences(v68, v69, v70, v71, v72))
    {

    }
    else
    {
      objc_msgSend_sharedInstance(IMAVController, v73, v74, v75, v76);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      shouldRunACConferences = objc_msgSend__shouldRunACConferences(v83, v84, v85, v86, v87);

      if (!shouldRunACConferences)
      {
LABEL_42:
        v82 = (void *)v254;
        v35 = v250;
        v22 = v251;
        v55 = v249;
LABEL_43:

        goto LABEL_44;
      }
    }
    v260 = 0u;
    v261 = 0u;
    v258 = 0u;
    v259 = 0u;
    objc_msgSend_sharedInstance(IMAVController, v77, v78, v79, v80, v12);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delegates(v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v258, (uint64_t)v262, 16);
    if (v96)
    {
      v97 = v96;
      v98 = *(_QWORD *)v259;
      do
      {
        for (i = 0; i != v97; ++i)
        {
          if (*(_QWORD *)v259 != v98)
            objc_enumerationMutation(v94);
          v100 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * i);
          sub_2190076D0();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v264 = v100;
            _os_log_impl(&dword_218FEA000, v101, OS_LOG_TYPE_DEFAULT, "Checking delegate: %@", buf, 0xCu);
          }

          v102 = objc_opt_respondsToSelector();
          sub_2190076D0();
          v103 = objc_claimAutoreleasedReturnValue();
          v104 = os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT);
          if ((v102 & 1) != 0)
          {
            if (v104)
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v264 = v100;
              _os_log_impl(&dword_218FEA000, v103, OS_LOG_TYPE_DEFAULT, " => Dispatching to delegate: %@", buf, 0xCu);
            }

            objc_msgSend_createdOutgoingIMAVChat_(v100, v105, (uint64_t)isRelayed_GUID, v106, v107);
          }
          else
          {
            if (v104)
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v264 = v100;
              _os_log_impl(&dword_218FEA000, v103, OS_LOG_TYPE_DEFAULT, " => **NOT** Dispatching to delegate: %@", buf, 0xCu);
            }

          }
        }
        v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v108, (uint64_t)&v258, (uint64_t)v262, 16);
      }
      while (v97);
    }

    v11 = v252;
    v12 = v248;
    goto LABEL_42;
  }
  objc_msgSend__avChatWithGUID_(IMAVChat, v16, (uint64_t)v13, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    switch(a4)
    {
      case 1u:
        sub_2190076D0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v264 = v22;
          _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, "Told to accept chat %@", buf, 0xCu);
        }

        objc_msgSend_acceptInvitation(v22, v24, v25, v26, v27);
        break;
      case 2u:
        sub_2190076D0();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v264 = v22;
          _os_log_impl(&dword_218FEA000, v109, OS_LOG_TYPE_DEFAULT, "Told to decline chat %@", buf, 0xCu);
        }

        objc_msgSend_declineInvitation(v22, v110, v111, v112, v113);
        break;
      case 3u:
        sub_2190076D0();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v264 = v22;
          _os_log_impl(&dword_218FEA000, v114, OS_LOG_TYPE_DEFAULT, "Told to cancel chat %@", buf, 0xCu);
        }

        objc_msgSend_cancelInvitation(v22, v115, v116, v117, v118);
        break;
      case 4u:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("EndedReason"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_intValue(v81, v119, v120, v121, v122);
        sub_2190076D0();
        v124 = objc_claimAutoreleasedReturnValue();
        v125 = os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v123)
        {
          if (v125)
          {
            _NSStringDescriptionForIMAVChatEndedReason(v123, v126, v127, v128, v129);
            v130 = v22;
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v264 = v130;
            *(_WORD *)&v264[8] = 2112;
            *(_QWORD *)&v264[10] = v131;
            _os_log_impl(&dword_218FEA000, v124, OS_LOG_TYPE_DEFAULT, "Told to end chat %@ with reason %@", buf, 0x16u);

            v22 = v130;
          }

          objc_msgSend_endChatWithReason_(v22, v132, v123, v133, v134);
        }
        else
        {
          if (v125)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v264 = v22;
            _os_log_impl(&dword_218FEA000, v124, OS_LOG_TYPE_DEFAULT, "Told to end chat %@", buf, 0xCu);
          }

          objc_msgSend_endChat(v22, v244, v245, v246, v247);
        }
        goto LABEL_20;
      case 5u:
        sub_2190076D0();
        v135 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v264 = v22;
          _os_log_impl(&dword_218FEA000, v135, OS_LOG_TYPE_DEFAULT, "Told to inviteAll on chat %@", buf, 0xCu);
        }

        objc_msgSend_inviteAll(v22, v136, v137, v138, v139);
        break;
      case 6u:
        sub_2190076D0();
        v140 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v264 = v22;
          _os_log_impl(&dword_218FEA000, v140, OS_LOG_TYPE_DEFAULT, "Told to inviteAdditionalPeers on chat %@", buf, 0xCu);
        }

        objc_msgSend_objectForKey_(v12, v141, (uint64_t)CFSTR("Buddy"), v142, v143);
        v81 = objc_claimAutoreleasedReturnValue();
        objc_msgSend__imHandleFromProxyRepresentation_(IMAVChat, v144, (uint64_t)v81, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v12, v148, (uint64_t)CFSTR("AdditionalPeers"), v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v12, v152, (uint64_t)CFSTR("ExcludingPushTokens"), v153, v154);
        v155 = v22;
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_invite_additionalPeers_excludingPushTokens_(v155, v157, (uint64_t)v147, (uint64_t)v151, (uint64_t)v156);

        v22 = v155;
        goto LABEL_20;
      case 7u:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("InvitationTimeoutTime"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v81, v158, v159, v160, v161);
        v163 = v162;
        sub_2190076D0();
        v164 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(double *)v264 = v163;
          *(_WORD *)&v264[8] = 2112;
          *(_QWORD *)&v264[10] = v22;
          _os_log_impl(&dword_218FEA000, v164, OS_LOG_TYPE_DEFAULT, "Told to setInvitationTimeoutTime to %f on chat %@", buf, 0x16u);
        }

        objc_msgSend_setInvitationTimeoutTime_(v22, v165, v166, v167, v168, v163);
        goto LABEL_20;
      case 8u:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("ConnectionTimeoutTime"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v81, v169, v170, v171, v172);
        v174 = v173;
        sub_2190076D0();
        v175 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(double *)v264 = v174;
          *(_WORD *)&v264[8] = 2112;
          *(_QWORD *)&v264[10] = v22;
          _os_log_impl(&dword_218FEA000, v175, OS_LOG_TYPE_DEFAULT, "Told to setConnectionTimeoutTime to %f on chat %@", buf, 0x16u);
        }

        objc_msgSend_setConnectionTimeoutTime_(v22, v176, v177, v178, v179, v174);
        goto LABEL_20;
      case 9u:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("IsMute"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        v184 = objc_msgSend_BOOLValue(v81, v180, v181, v182, v183);
        sub_2190076D0();
        v185 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v184;
          *(_WORD *)&v264[4] = 2112;
          *(_QWORD *)&v264[6] = v22;
          _os_log_impl(&dword_218FEA000, v185, OS_LOG_TYPE_DEFAULT, "Told to setMute to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setMute_(v22, v186, v184, v187, v188);
        goto LABEL_20;
      case 0xAu:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("IsRelayed"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        v193 = objc_msgSend_BOOLValue(v81, v189, v190, v191, v192);
        sub_2190076D0();
        v194 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v193;
          *(_WORD *)&v264[4] = 2112;
          *(_QWORD *)&v264[6] = v22;
          _os_log_impl(&dword_218FEA000, v194, OS_LOG_TYPE_DEFAULT, "Told to setRelayed to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setRelayed_(v22, v195, v193, v196, v197);
        goto LABEL_20;
      case 0xBu:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("IsSendingAudio"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        v202 = objc_msgSend_BOOLValue(v81, v198, v199, v200, v201);
        sub_2190076D0();
        v203 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v202;
          *(_WORD *)&v264[4] = 2112;
          *(_QWORD *)&v264[6] = v22;
          _os_log_impl(&dword_218FEA000, v203, OS_LOG_TYPE_DEFAULT, "Told to setIsSendingAudio to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setIsSendingAudio_(v22, v204, v202, v205, v206);
        goto LABEL_20;
      case 0xCu:
        v253 = v13;
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("AspectRatio"), v20, v21);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        v256 = 0.0;
        v257 = 0.0;
        objc_msgSend_getValue_(v207, v208, (uint64_t)&v256, v209, v210);
        v211 = v256;
        v212 = v257;
        objc_msgSend_objectForKey_(v12, v213, (uint64_t)CFSTR("Orientation"), v214, v215);
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        v221 = objc_msgSend_unsignedIntValue(v216, v217, v218, v219, v220);
        objc_msgSend_objectForKey_(v12, v222, (uint64_t)CFSTR("CameraType"), v223, v224);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        v230 = objc_msgSend_unsignedIntValue(v225, v226, v227, v228, v229);
        sub_2190076D0();
        v231 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
        {
          v268.width = v211;
          v268.height = v212;
          NSStringFromSize(v268);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v264 = v232;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)&v264[10] = v221;
          *(_WORD *)&v264[14] = 1024;
          *(_DWORD *)&v264[16] = v230;
          *(_WORD *)&v264[20] = 2112;
          *(_QWORD *)&v264[22] = v22;
          _os_log_impl(&dword_218FEA000, v231, OS_LOG_TYPE_DEFAULT, "Told to setLocalAspectRatio %@ for orientation %d cameraType %d on chat %@", buf, 0x22u);

        }
        objc_msgSend_setLocalAspectRatio_cameraOrientation_cameraType_(v22, v233, v221, v230, v234, v211, v212);

        v13 = v253;
        break;
      case 0xDu:
        objc_msgSend_objectForKey_(v12, v19, (uint64_t)CFSTR("IsSendingVideo"), v20, v21);
        v81 = objc_claimAutoreleasedReturnValue();
        v239 = objc_msgSend_BOOLValue(v81, v235, v236, v237, v238);
        sub_2190076D0();
        v240 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v264 = v239;
          *(_WORD *)&v264[4] = 2112;
          *(_QWORD *)&v264[6] = v22;
          _os_log_impl(&dword_218FEA000, v240, OS_LOG_TYPE_DEFAULT, "Told to setIsSendingVideo to %d on chat %@", buf, 0x12u);
        }

        objc_msgSend_setIsSendingVideo_(v22, v241, v239, v242, v243);
        goto LABEL_20;
      default:
        break;
    }
  }
  else
  {
    sub_2190076D0();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v81, OS_LOG_TYPE_DEFAULT, "We don't have this chat, ignoring...", buf, 2u);
    }
LABEL_20:

  }
LABEL_44:

}

- (void)pendingVCRequestComplete
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v5, (uint64_t)CFSTR("__kIMAVControllerPendingAVInvitationRequestComplete"), 0, v6);

}

- (void)pendingACRequestComplete
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v5, (uint64_t)CFSTR("__kIMAVControllerPendingACInvitationRequestComplete"), 0, v6);

}

- (void)setupComplete
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int shouldObserveConferences;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int shouldRunACConferences;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_listener(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v10, v11, v12, v13, v14);
  v102 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(IMAVController, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__shouldRunACConferences(v19, v20, v21, v22, v23) & 1) == 0)
  {
    objc_msgSend_sharedInstance(IMAVController, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    shouldObserveConferences = objc_msgSend__shouldObserveConferences(v28, v29, v30, v31, v32);

    if (!shouldObserveConferences)
      goto LABEL_5;
    objc_msgSend_objectForKey_(v102, v34, (uint64_t)CFSTR("ACChatProxy"), v36, v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(IMAVCallManager, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__updateACChatProxyWithInfo_(v42, v43, (uint64_t)v19, v44, v45);

  }
LABEL_5:
  objc_msgSend_sharedInstance(IMAVController, v34, v35, v36, v37);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__shouldRunConferences(v46, v47, v48, v49, v50) & 1) == 0)
  {
    objc_msgSend_sharedInstance(IMAVController, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend__shouldObserveConferences(v55, v56, v57, v58, v59);

    if (!v60)
      goto LABEL_9;
    objc_msgSend_objectForKey_(v102, v61, (uint64_t)CFSTR("AVChatProxy"), v63, v64);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(IMAVCallManager, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__updateAVChatProxyWithInfo_(v69, v70, (uint64_t)v46, v71, v72);

  }
LABEL_9:
  objc_msgSend_sharedInstance(IMAVController, v61, v62, v63, v64);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v73, v74, v75, v76, v77))
  {

LABEL_12:
    objc_msgSend_sharedInstance(IMAVController, v82, v83, v84, v85);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pushCachedVCCapsToDaemon(v92, v93, v94, v95, v96);

    goto LABEL_13;
  }
  objc_msgSend_sharedInstance(IMAVController, v78, v79, v80, v81);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v86, v87, v88, v89, v90);

  if (shouldRunACConferences)
    goto LABEL_12;
LABEL_13:
  objc_msgSend_sharedInstance(IMAVCallManager, v82, v83, v84, v85);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateOverallChatState(v97, v98, v99, v100, v101);

}

- (void)account:(id)a3 conference:(id)a4 peerID:(id)a5 propertiesUpdated:(id)a6
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a6;
  objc_msgSend__avChatWaitingForReplyFromIMHandle_orConferenceID_(IMAVChat, v8, 0, (uint64_t)a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Chat: %@ properties updated to: %@", (uint8_t *)&v25, 0x16u);
  }

  objc_msgSend_remoteParticipants(v10, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateProperties_(v21, v22, (uint64_t)v7, v23, v24);

}

- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int shouldObserveConferences;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
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
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_isEqualToString_(v6, v8, (uint64_t)CFSTR("AVChatProxy"), v9, v10))
  {
    objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
    {

    }
    else
    {
      objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      shouldObserveConferences = objc_msgSend__shouldObserveConferences(v24, v25, v26, v27, v28);

      if (shouldObserveConferences)
      {
        sub_2190076D0();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v65 = 138412290;
          v66 = v6;
          _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "Received %@ property change", (uint8_t *)&v65, 0xCu);
        }

        objc_msgSend_sharedInstance(IMAVCallManager, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__updateAVChatProxyWithInfo_(v35, v36, (uint64_t)v7, v37, v38);
        goto LABEL_14;
      }
    }
  }
  if (objc_msgSend_isEqualToString_(v6, v11, (uint64_t)CFSTR("ACChatProxy"), v13, v14))
  {
    objc_msgSend_sharedInstance(IMAVController, v39, v40, v41, v42);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__shouldRunACConferences(v35, v43, v44, v45, v46))
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend_sharedInstance(IMAVController, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend__shouldObserveConferences(v51, v52, v53, v54, v55);

    if (v56)
    {
      sub_2190076D0();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v65 = 138412290;
        v66 = v6;
        _os_log_impl(&dword_218FEA000, v57, OS_LOG_TYPE_DEFAULT, "Received %@ property change", (uint8_t *)&v65, 0xCu);
      }

      objc_msgSend_sharedInstance(IMAVCallManager, v58, v59, v60, v61);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__updateACChatProxyWithInfo_(v35, v62, (uint64_t)v7, v63, v64);
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "Persistent property %@ changed", (uint8_t *)&v7, 0xCu);
  }

}

- (void)account:(id)a3 postedError:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int isEqualToString;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend_domain(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x24BE4FEF8], v13, v14);

  if (isEqualToString)
  {
    sub_2190076D0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v90 = (uint64_t)v5;
      v91 = 2112;
      v92 = v6;
      _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "Account: %@   Posted AV Error: %@", buf, 0x16u);
    }

    objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountForUniqueID_(v21, v22, (uint64_t)v5, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    sub_2190076D0();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138412546;
        v90 = (uint64_t)v25;
        v91 = 2112;
        v92 = v6;
        _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "Account: %@    Posted AV Error: %@", buf, 0x16u);
      }

      objc_msgSend_userInfo(v6, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v32, v33, (uint64_t)CFSTR("ID"), v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v32, v37, (uint64_t)CFSTR("conference"), v38, v39);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v32, v40, (uint64_t)CFSTR("properties"), v41, v42);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v86, v43, *MEMORY[0x24BE504F0], v44, v45);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v32, v46, (uint64_t)CFSTR("internalErrorDomain"), v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v32, v50, (uint64_t)CFSTR("internalUserInfo"), v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v32, v54, (uint64_t)CFSTR("internalCode"), v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2190076D0();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = (uint64_t)v32;
        _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "            UserInfo: %@", buf, 0xCu);
      }

      sub_2190076D0();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = (uint64_t)v88;
        _os_log_impl(&dword_218FEA000, v59, OS_LOG_TYPE_DEFAULT, "        conferenceID: %@", buf, 0xCu);
      }

      sub_2190076D0();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v65 = objc_msgSend_unsignedIntValue(v87, v61, v62, v63, v64);
        *(_DWORD *)buf = 67109120;
        LODWORD(v90) = v65;
        _os_log_impl(&dword_218FEA000, v60, OS_LOG_TYPE_DEFAULT, "           SessionID: %u", buf, 8u);
      }

      sub_2190076D0();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v49;
        _os_log_impl(&dword_218FEA000, v66, OS_LOG_TYPE_DEFAULT, "      internalDomain: %@", buf, 0xCu);
      }

      sub_2190076D0();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = (uint64_t)v57;
        _os_log_impl(&dword_218FEA000, v67, OS_LOG_TYPE_DEFAULT, "        internalCode: %@", buf, 0xCu);
      }
      v85 = (void *)v49;

      sub_2190076D0();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v53;
        _os_log_impl(&dword_218FEA000, v68, OS_LOG_TYPE_DEFAULT, "    internalUserInfo: %@", buf, 0xCu);
      }
      v69 = (void *)v53;

      v70 = (void *)v36;
      objc_msgSend_imHandleWithID_(v25, v71, v36, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend_unsignedIntValue(v87, v75, v76, v77, v78);
      objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v80, (uint64_t)v74, (uint64_t)v88, v79, 0);
      v26 = objc_claimAutoreleasedReturnValue();

      sub_2190076D0();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = (uint64_t)v26;
        _os_log_impl(&dword_218FEA000, v81, OS_LOG_TYPE_DEFAULT, "  Using found AVChat: %@", buf, 0xCu);
      }

      objc_msgSend__handleAVError_(v26, v82, (uint64_t)v6, v83, v84);
    }
    else if (v27)
    {
      *(_DWORD *)buf = 138412290;
      v90 = (uint64_t)v6;
      _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Posted AVError: %@ from nil account", buf, 0xCu);
    }

  }
}

- (void)account:(id)a3 relay:(id)a4 handleInitate:(id)a5 fromPerson:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_imHandleWithInfo_(v21, v22, (uint64_t)v12, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v26, (uint64_t)v25, (uint64_t)v10, 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantMatchingIMHandle_(v27, v28, (uint64_t)v25, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412802;
      v36 = v12;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_218FEA000, v32, OS_LOG_TYPE_DEFAULT, "Handling incoming relay initiate from person: %@    conference: %@   request: %@", (uint8_t *)&v35, 0x20u);
    }

    objc_msgSend__handleRelayInitate_fromParticipant_(v27, v33, (uint64_t)v11, (uint64_t)v31, v34);
  }
  else
  {
    sub_2190076D0();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412290;
      v36 = v9;
      _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "[WARN] Posted relay initiate: %@ from nil account", (uint8_t *)&v35, 0xCu);
    }
  }

}

- (void)account:(id)a3 relay:(id)a4 handleUpdate:(id)a5 fromPerson:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      v35 = 138412802;
      v36 = v12;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Handling incoming relay update from person: %@    conference: %@   request: %@", (uint8_t *)&v35, 0x20u);
    }

    objc_msgSend_imHandleWithInfo_(v21, v24, (uint64_t)v12, v25, v26);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v27, (uint64_t)v22, (uint64_t)v10, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantMatchingIMHandle_(v28, v29, (uint64_t)v22, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__handleRelayUpdate_fromParticipant_(v28, v33, (uint64_t)v11, (uint64_t)v32, v34);

  }
  else if (v23)
  {
    v35 = 138412290;
    v36 = v9;
    _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Posted relay update: %@ from nil account", (uint8_t *)&v35, 0xCu);
  }

}

- (void)account:(id)a3 relay:(id)a4 handleCancel:(id)a5 fromPerson:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountForUniqueID_(v17, v18, (uint64_t)v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      v35 = 138412802;
      v36 = v12;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Handling incoming relay cancel from person: %@    conference: %@   request: %@", (uint8_t *)&v35, 0x20u);
    }

    objc_msgSend_imHandleWithInfo_(v21, v24, (uint64_t)v12, v25, v26);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v27, (uint64_t)v22, (uint64_t)v10, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantMatchingIMHandle_(v28, v29, (uint64_t)v22, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__handleRelayCancel_fromParticipant_(v28, v33, (uint64_t)v11, (uint64_t)v32, v34);

  }
  else if (v23)
  {
    v35 = 138412290;
    v36 = v9;
    _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Posted relay cancel: %@ from nil account", (uint8_t *)&v35, 0xCu);
  }

}

- (void)account:(id)a3 conference:(id)a4 invitationSentSuccessfully:(BOOL)a5
{
  _BOOL8 v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend__bestGuessAVChatWithIMHandle_conferenceID_sessionID_properties_(IMAVChat, v7, 0, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteParticipants(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("NO");
    if (v5)
      v20 = CFSTR("YES");
    v24 = 138412546;
    v25 = v20;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "Handling invitation sent successfully: %@    conference: %@", (uint8_t *)&v24, 0x16u);
  }

  objc_msgSend__noteInviteDelivered_(v18, v21, v5, v22, v23);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLookups, 0);
  objc_storeStrong((id *)&self->_pendingChats, 0);
}

@end
