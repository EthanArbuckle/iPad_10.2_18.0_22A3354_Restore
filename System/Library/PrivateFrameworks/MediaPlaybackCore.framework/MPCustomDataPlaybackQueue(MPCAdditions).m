@implementation MPCustomDataPlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  void *v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  _MPCProtoTracklist *v10;
  id v11;
  _MPCProtoTracklistIndexPath *v12;
  NSMutableArray *accountInfos;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  const __CFString *v18;
  _MPCProtoRadioCreationProperties *v19;
  _MPCProtoRadioCreationProperties *v20;
  _MPCProtoDelegateInfo *accountInfo;
  _MPCProtoDelegateInfo *v22;
  void *v23;
  _MPCProtoDelegateInfo *v24;
  uint64_t v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  MPCPlaybackRequestEnvironment *v52;
  NSObject *v53;
  MPCPlaybackRequestEnvironment *v54;
  void *v55;
  MPCPlaybackRequestEnvironment *p_super;
  NSObject *v57;
  unint64_t v58;
  int v59;
  uint64_t v60;
  char *v61;
  int v62;
  int v63;
  const __CFString *v64;
  int v65;
  const __CFString *v66;
  int v67;
  NSObject *v68;
  int v69;
  NSObject *v70;
  id v71;
  MPCPlaybackRequestEnvironment *v72;
  void *v73;
  unint64_t v74;
  int v75;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountCapabilities;
  int v77;
  int v78;
  const __CFString *v79;
  int v80;
  const __CFString *v81;
  int v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  _BYTE *v88;
  uint64_t quot;
  lldiv_t v90;
  uint64_t v91;
  const UInt8 *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  int v99;
  id v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  int v114;
  NSObject *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  uint64_t accountID;
  _BYTE *v121;
  uint64_t v122;
  lldiv_t v123;
  uint64_t v124;
  const UInt8 *v125;
  __CFString *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  NSObject *v130;
  void *v131;
  int v132;
  id v133;
  NSObject *v134;
  NSObject *v135;
  void *v136;
  NSObject *v137;
  void *v138;
  id v139;
  int v140;
  unsigned __int8 *v141;
  uint64_t v142;
  NSObject *v143;
  NSObject *v144;
  id v145;
  void *v146;
  void *v147;
  MPCMutablePlaybackRequestEnvironment *v148;
  void *v149;
  MPCMutablePlaybackDelegationProperties *v150;
  const __CFString *v151;
  __CFString *v152;
  const __CFString *v153;
  MPCMutablePlaybackDelegationProperties *v154;
  id v155;
  int v156;
  MPCPlaybackRequestEnvironment *v157;
  void *v158;
  void *v159;
  void *v160;
  NSObject *v161;
  id v162;
  id v163;
  int v164;
  unsigned __int8 *v165;
  NSObject *v166;
  NSObject *v167;
  void *v168;
  void *v169;
  MPCMutablePlaybackRequestEnvironment *v170;
  void *v171;
  MPCMutablePlaybackRequestEnvironment *v172;
  MPCMutablePlaybackDelegationProperties *v173;
  const __CFString *v174;
  __CFString *v175;
  const __CFString *v176;
  MPCMutablePlaybackDelegationProperties *v177;
  id v178;
  int v179;
  MPCPlaybackRequestEnvironment *v180;
  void *v181;
  void *v182;
  void *v183;
  NSObject *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  NSObject *v189;
  char v190;
  id v191;
  void *v192;
  dispatch_semaphore_t v193;
  void *v194;
  NSObject *v195;
  uint64_t v196;
  NSObject *v197;
  uint64_t v198;
  NSObject *v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  id v203;
  void *v204;
  NSObject *v205;
  void *v206;
  void *v207;
  void *v208;
  NSObject *v209;
  char v210;
  id v211;
  dispatch_semaphore_t v212;
  void *v213;
  NSObject *v214;
  uint64_t v215;
  NSObject *v216;
  uint64_t v217;
  unsigned __int8 *v218;
  id v219;
  NSObject *v220;
  uint64_t v221;
  uint64_t v222;
  id v223;
  id v224;
  void *v225;
  NSObject *v226;
  id v227;
  NSObject *v228;
  id v229;
  NSObject *v230;
  void *v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  int v236;
  id v237;
  void *v238;
  uint64_t v239;
  id v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  NSObject *v248;
  id v249;
  NSObject *v250;
  void *v251;
  void *v252;
  id v253;
  uint64_t v254;
  void *v255;
  int v256;
  void *v257;
  uint64_t v258;
  id v259;
  void *v260;
  uint64_t v261;
  void *v262;
  id v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  id v278;
  id v279;
  id v280;
  id v281;
  id v282;
  MPCMutablePlaybackRequestEnvironment *v283;
  void *v284;
  int v285;
  uint64_t v286;
  void *v287;
  id v288;
  void *v289;
  MPCPlaybackRequestEnvironment *v290;
  _MPCProtoTracklist *v291;
  int v292;
  id v293;
  _MPCProtoRadioCreationProperties *v294;
  _MPCProtoTracklistIndexPath *v295;
  _MPCProtoDelegateInfo *v296;
  id v297;
  void *v298;
  NSMutableArray *v299;
  _QWORD *v300;
  _QWORD *v301;
  _MPCProtoDelegateInfo *v302;
  id v303;
  void *v304;
  void *v305;
  int v306;
  void *v307;
  int v308;
  void *v309;
  id v310;
  void *v311;
  _QWORD *v312;
  void *v313;
  id v314;
  id v315;
  _QWORD v316[2];
  void (*v317)(uint64_t, void *, void *, uint64_t);
  void *v318;
  void *v319;
  _MPCProtoRadioCreationProperties *v320;
  _QWORD *v321;
  _QWORD v322[2];
  void (*v323)(uint64_t, void *, void *, uint64_t);
  void *v324;
  _MPCProtoTracklist *v325;
  id v326;
  _MPCProtoTracklistIndexPath *v327;
  void *v328;
  _QWORD *v329;
  _BYTE *v330;
  id *v331;
  _QWORD *v332;
  id v333[5];
  id v334;
  id v335;
  _QWORD v336[5];
  id v337;
  _BYTE v338[24];
  uint64_t (*v339)(uint64_t, uint64_t);
  void (*v340)(uint64_t);
  id v341;
  _BYTE buf[40];
  MPCMutablePlaybackRequestEnvironment *v343;
  MPCPlaybackRequestEnvironment *v344;
  _QWORD *v345;
  char v346;
  char v347;
  char v348;
  _BYTE v349[12];
  __int16 v350;
  uint64_t v351;
  id v352;
  const __CFString *v353;
  uint64_t v354;
  void (*v355)(uint64_t, int, id);
  void *v356;
  NSObject *v357;
  _BYTE *v358;
  uint64_t v359;

  v359 = *MEMORY[0x24BDAC8D0];
  v312 = a4;
  objc_msgSend(a1, "identifier");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v313, "isEqualToString:", CFSTR("InProcess-com.apple.mediaplayer.playbackcontext")))
  {
    objc_msgSend(a1, "mediaRemoteOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (*)(void))v312[2];
LABEL_3:
    v8();

LABEL_4:
    goto LABEL_375;
  }
  if (objc_msgSend(v313, "isEqualToString:", CFSTR("com.apple.music.playbackqueue.tracklist")))
  {
    objc_msgSend(a1, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 5, CFSTR("Missing tracklist data in playback queue."));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(_QWORD *, _QWORD, void *))v312[2])(v312, 0, v38);

LABEL_374:
      goto LABEL_375;
    }
    v10 = -[_MPCProtoTracklist initWithData:]([_MPCProtoTracklist alloc], "initWithData:", v9);
    *(_QWORD *)v338 = 0;
    *(_QWORD *)&v338[8] = v338;
    *(_QWORD *)&v338[16] = 0x3032000000;
    v339 = __Block_byref_object_copy__22101;
    v340 = __Block_byref_object_dispose__22102;
    objc_msgSend(a1, "featureName");
    v341 = (id)objc_claimAutoreleasedReturnValue();
    v333[0] = 0;
    v333[1] = v333;
    v333[2] = (id)0x3032000000;
    v333[3] = __Block_byref_object_copy__22101;
    v333[4] = __Block_byref_object_dispose__22102;
    objc_msgSend(a1, "queueGroupingID");
    v334 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BDDCA88]);
    v336[0] = 0;
    v336[1] = v336;
    v336[2] = 0x3032000000;
    v336[3] = __Block_byref_object_copy__22101;
    v336[4] = __Block_byref_object_dispose__22102;
    v337 = 0;
    if (v10)
    {
      v12 = v10->_startingItemIndexPath;
      accountInfos = v10->_accountInfos;
    }
    else
    {
      v12 = 0;
      accountInfos = 0;
    }
    v299 = accountInfos;
    -[NSMutableArray firstObject](v299, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v322[0] = MEMORY[0x24BDAC760];
    v322[1] = 3221225472;
    v323 = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke;
    v324 = &unk_24CAB7DB8;
    v329 = v312;
    v291 = v10;
    v325 = v291;
    v293 = v11;
    v326 = v293;
    v330 = v338;
    v331 = v333;
    v332 = v336;
    v295 = v12;
    v327 = v295;
    v328 = a1;
    v303 = v14;
    v301 = v322;
    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activeAccount");
    v305 = (void *)objc_claimAutoreleasedReturnValue();

    if (v305)
    {
      if ((objc_msgSend(v305, "hasCatalogPlaybackCapability") & 1) != 0)
      {
        if (!v303)
        {
          _MPCLogCategoryMusicBehavior();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = 0;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v305;
            _os_log_impl(&dword_210BD8000, v53, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [empty accountInfo] account=%{public}@", buf, 0x16u);
          }

          v50 = v305;
          v54 = [MPCPlaybackRequestEnvironment alloc];
          objc_msgSend(v50, "userIdentity");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          p_super = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v54, "initWithUserIdentity:", v55);

          v323((uint64_t)v301, p_super, 0, 0);
          goto LABEL_372;
        }
        v16 = v303;
        v17 = v16;
        v289 = v9;
        if ((a3 & 1) == 0)
        {
          v308 = 0;
          v18 = CFSTR("assume DELEGATION (legacy client)");
LABEL_75:
          v68 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 0;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = a3 & 1;
            _os_log_impl(&dword_210BD8000, v68, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation NOT SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
          }
          v69 = 0;
          goto LABEL_110;
        }
        if (v16[2])
        {
          v308 = 0;
          v58 = 0;
          v59 = 0;
          v18 = CFSTR("accountCapabilities.contains(DELEGATION) == NO");
          v60 = (uint64_t)v16;
          v61 = (char *)(v16 + 1);
          while (v58 < *((_QWORD *)v61 + 1))
          {
            v62 = -[_MPCProtoDelegateInfo accountCapabilitiesAtIndex:](v60, v58);
            v63 = v308;
            if (v308)
              v64 = v18;
            else
              v64 = CFSTR("accountCapabilities.contains(DELEGATION) == YES");
            if (v62 == 3)
              v65 = 1;
            else
              v65 = v308;
            if (v62 == 3)
              v66 = CFSTR("accountCapabilities.contains(DELEGATION_INLINE) == YES");
            else
              v66 = v18;
            if (v62 == 3)
              v67 = 1;
            else
              v67 = v59;
            if (v62 != 2)
              v63 = v65;
            v308 = v63;
            if (v62 == 2)
              v18 = v64;
            else
              v18 = v66;
            if (v62 == 2)
              v59 = 1;
            else
              v59 = v67;
            ++v58;
          }
          v17 = (_QWORD *)v60;
          if ((v59 & 1) == 0)
            goto LABEL_75;
        }
        else
        {
          v308 = 0;
          v18 = CFSTR("assume DELEGATION (legacy client)");
        }
        _MPCLogCategoryMusicBehavior();
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = 1;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1;
          _os_log_impl(&dword_210BD8000, v68, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
        }
LABEL_110:
        v9 = v289;

        +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "activeAccount");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = v17[4];
        v88 = &buf[25];
        quot = v87;
        do
        {
          v90 = lldiv(quot, 10);
          quot = v90.quot;
          if (v90.rem >= 0)
            LOBYTE(v91) = v90.rem;
          else
            v91 = -v90.rem;
          *(v88 - 2) = v91 + 48;
          v92 = v88 - 2;
          --v88;
        }
        while (v90.quot);
        if (v87 < 0)
        {
          *(v88 - 2) = 45;
          v92 = v88 - 2;
        }
        v93 = (__CFString *)CFStringCreateWithBytes(0, v92, &buf[24] - v92, 0x8000100u, 0);
        +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "accountForDSID:", v93);
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        if (v95)
        {
          if ((objc_msgSend(v95, "isDelegated") & 1) == 0)
          {
            _MPCLogCategoryMusicBehavior();
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v95;
              _os_log_impl(&dword_210BD8000, v96, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using specified account [matching non-delegate account] account=%{public}@", buf, 0x16u);
            }
            goto LABEL_129;
          }
          if (v69)
          {
            _MPCLogCategoryMusicBehavior();
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v95;
              _os_log_impl(&dword_210BD8000, v96, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using delegate account [matching account] account=%{public}@", buf, 0x16u);
            }
LABEL_129:

            v100 = v95;
            v99 = 0;
            v285 = 0;
LABEL_195:
            v50 = v100;
            v117 = 0;
LABEL_196:

            p_super = (MPCPlaybackRequestEnvironment *)v117;
            if (p_super)
            {
              v323((uint64_t)v301, 0, 0, (uint64_t)p_super);
LABEL_372:

              goto LABEL_373;
            }
            v140 = objc_msgSend(v50, "isDelegated") ^ 1;
            if (v285)
              LOBYTE(v140) = 0;
            if ((v140 & 1) != 0)
            {
              v157 = [MPCPlaybackRequestEnvironment alloc];
              objc_msgSend(v50, "userIdentity");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              p_super = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v157, "initWithUserIdentity:", v158);

              if (v99)
                v159 = (void *)MEMORY[0x24BDBD1C8];
              else
                v159 = 0;
              v323((uint64_t)v301, p_super, v159, 0);
              goto LABEL_372;
            }
            v141 = v17;
            v278 = v50;
            objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
            v276 = (void *)objc_claimAutoreleasedReturnValue();
            v280 = *((id *)v141 + 13);
            v142 = *((_QWORD *)v141 + 4);
            _MPCLogCategoryDelegation();
            v143 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v141;
              *(_WORD *)&buf[12] = 2113;
              *(_QWORD *)&buf[14] = v280;
              *(_WORD *)&buf[22] = 2049;
              *(_QWORD *)&buf[24] = v142;
              _os_log_impl(&dword_210BD8000, v143, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Received account info for potential delegation - UUID=%{private}@ - DSID=%{private}lld", buf, 0x20u);
            }

            if (!v280 || !v142)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 7, CFSTR("Invalid delegation info: %@"), v141);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              _MPCLogCategoryDelegation();
              v161 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v141;
                _os_log_impl(&dword_210BD8000, v161, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Getting delegated playback request environment failed [no valid delegation info]", buf, 0xCu);
              }

              v283 = 0;
              v162 = objc_retainAutorelease(v160);
              v145 = v162;
LABEL_305:

              v229 = v145;
              if (v229)
              {
                _MPCLogCategoryMusicBehavior();
                v230 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  *(_QWORD *)&buf[4] = v141;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v229;
                  _os_log_impl(&dword_210BD8000, v230, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [failed to create delegate request environment] dsidError=%{public}@", buf, 0x16u);
                }

                v323((uint64_t)v301, 0, 0, (uint64_t)v229);
                v231 = v283;
                goto LABEL_370;
              }
              if (!v308)
              {
                if (v99)
                {
                  v231 = (void *)MEMORY[0x24BDBD1C8];
                }
                else if ((v141[116] & 8) != 0)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v141[112]);
                  v231 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v231 = 0;
                }
                v323((uint64_t)v301, v283, v231, 0);
                goto LABEL_371;
              }
              objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
              v232 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v278, "userIdentity");
              v233 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)v349 = 0;
              objc_msgSend(v232, "getPropertiesForUserIdentity:error:", v233, v349);
              v231 = (void *)objc_claimAutoreleasedReturnValue();
              v234 = *(id *)v349;

              if (v234)
              {
                v323((uint64_t)v301, 0, 0, (uint64_t)v234);

              }
              else
              {
                objc_msgSend(v231, "delegateToken");
                v311 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v311, "type") == 1)
                {
                  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 604800.0);
                  v235 = (void *)objc_claimAutoreleasedReturnValue();
                  v236 = objc_msgSend(v311, "expiresBeforeDate:", v235);

                  if (!v236)
                  {
                    if (v99)
                    {
                      v234 = (id)MEMORY[0x24BDBD1C8];
                    }
                    else if ((v141[116] & 8) != 0)
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v141[112]);
                      v234 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v234 = 0;
                    }
                    if (!v283)
                    {
                      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                      v271 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void __MPCPlaybackRequestEnvironmentFromProtoAccountInfo(_MPCProtoDelegateInfo *__strong, MPRemotePlaybackQueuePlaybackContextOptions, void (^__strong)(MPCPlaybackRequestEnvironment * _Nullable __strong, NSNumber * _Nullable __strong, NSError * _Nullable __strong))");
                      v272 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v271, "handleFailureInFunction:file:lineNumber:description:", v272, CFSTR("MPRemotePlaybackQueue+MPCAdditions.m"), 375, CFSTR("Failed to produce playback request environment for accountInfo: %@, desiredAccount: %@"), v141, v278);

                    }
                    ((void (*)(_QWORD *))v323)(v301);
                    goto LABEL_369;
                  }
                }
                v237 = *((id *)v141 + 12);
                if (v237)
                {
                  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
                  v238 = (void *)objc_claimAutoreleasedReturnValue();
                  v239 = *((_QWORD *)v141 + 4);
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = ____MPCPlaybackRequestEnvironmentFromProtoAccountInfo_block_invoke;
                  *(_QWORD *)&buf[24] = &unk_24CAB7FA0;
                  v345 = v301;
                  v346 = v99;
                  v347 = v285;
                  v348 = 1;
                  *(_QWORD *)&buf[32] = v141;
                  v343 = v283;
                  v344 = (MPCPlaybackRequestEnvironment *)v278;
                  objc_msgSend(v238, "updateCredentialsWithDelegateTokenE:forDSID:completion:", v237, v239, buf);

                  v240 = v345;
                }
                else
                {
                  v240 = *((id *)v141 + 11);
                  if (v240)
                  {
                    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
                    v241 = (void *)objc_claimAutoreleasedReturnValue();
                    v242 = *((_QWORD *)v141 + 4);
                    v335 = 0;
                    objc_msgSend(v241, "getDelegateTokenBWithTokenA:forDSID:error:", v240, v242, &v335);
                    v287 = (void *)objc_claimAutoreleasedReturnValue();
                    v282 = v335;

                    v243 = (void *)MEMORY[0x24BDD1540];
                    v353 = CFSTR("MPCErrorUserInfoKeyRemoteCommandStatusCode");
                    v354 = (uint64_t)CFSTR("MPCErrorUserInfoKeyCustomDataType");
                    *(_QWORD *)buf = &unk_24CB16E90;
                    *(_QWORD *)&buf[8] = CFSTR("com.apple.music/wha-delegation/b");
                    v355 = (void (*)(uint64_t, int, id))CFSTR("MPCErrorUserInfoKeyCustomData");
                    objc_msgSend(v287, "data");
                    v244 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&buf[16] = v244;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v353, 3);
                    v245 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v243, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), 74, v245, CFSTR("Delegation token missing or expired for %@"), v283);
                    v246 = (void *)objc_claimAutoreleasedReturnValue();
                    v323((uint64_t)v301, 0, 0, (uint64_t)v246);

                  }
                  else
                  {
                    v269 = (void *)MEMORY[0x24BDD1540];
                    v353 = CFSTR("MPCErrorUserInfoKeyRemoteCommandStatusCode");
                    *(_QWORD *)buf = &unk_24CB16E90;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v353, 1);
                    v282 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v269, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), 74, v282, CFSTR("Delegation token missing and inline delegation missing tokens"));
                    v287 = (void *)objc_claimAutoreleasedReturnValue();
                    v323((uint64_t)v301, 0, 0, (uint64_t)v287);
                  }

                }
                v234 = v231;

              }
              v311 = 0;
              v231 = v283;
              v283 = 0;
LABEL_369:

              v229 = v311;
              p_super = &v283->super;
LABEL_370:

              v283 = (MPCMutablePlaybackRequestEnvironment *)p_super;
LABEL_371:

              p_super = &v283->super;
              goto LABEL_372;
            }
            if (v278)
            {
              objc_msgSend(v278, "userIdentity");
              v275 = objc_claimAutoreleasedReturnValue();
              _MPCLogCategoryDelegation();
              v144 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v141;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v278;
                _os_log_impl(&dword_210BD8000, v144, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - delegation supported [found existing account] account=%{public}@", buf, 0x16u);
              }

              v145 = 0;
            }
            else
            {
              v186 = (void *)MEMORY[0x24BEC8A58];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v142);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v186, "specificAccountWithDSID:", v187);
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v188, "identityAllowingDelegation:", 1);
              v275 = objc_claimAutoreleasedReturnValue();

              _MPCLogCategoryDelegation();
              v189 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v141;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v275;
                _os_log_impl(&dword_210BD8000, v189, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Creating delegated identity [] userIdentity=%{public}@", buf, 0x16u);
              }

              v335 = 0;
              v190 = objc_msgSend(v276, "insertPropertiesForUserIdentity:usingBlock:error:", v275, &__block_literal_global_180, &v335);
              v191 = v335;
              if ((v190 & 1) == 0)
              {
                v218 = v141;
                if (v191)
                {
                  v147 = v191;
                  v219 = v191;
                }
                else
                {
                  v147 = 0;
                  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 7, CFSTR("Failed to create delegated account from info: %@"), v141);
                  v219 = (id)objc_claimAutoreleasedReturnValue();
                  v218 = v141;
                }
                _MPCLogCategoryDelegation();
                v228 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  *(_QWORD *)&buf[4] = v218;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v219;
                  _os_log_impl(&dword_210BD8000, v228, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [property insertion failed] - error=%{public}@", buf, 0x16u);
                }

                v145 = objc_retainAutorelease(v219);
                goto LABEL_302;
              }
              v192 = v191;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              *(_QWORD *)&buf[24] = __Block_byref_object_copy__22101;
              *(_QWORD *)&buf[32] = __Block_byref_object_dispose__22102;
              v343 = 0;
              v193 = dispatch_semaphore_create(0);
              v352 = v280;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v352, 1);
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              v353 = (const __CFString *)MEMORY[0x24BDAC760];
              v354 = 3221225472;
              v355 = ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke_184;
              v356 = &unk_24CAB8008;
              v358 = buf;
              v195 = v193;
              v357 = v195;
              objc_msgSend(v276, "addDelegationUUIDs:forUserIdentity:completionHandler:", v194, v275, &v353);

              dispatch_semaphore_wait(v195, 0xFFFFFFFFFFFFFFFFLL);
              v196 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              if (v196)
              {
                _MPCLogCategoryDelegation();
                v197 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
                {
                  v198 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                  *(_DWORD *)v349 = 134218242;
                  *(_QWORD *)&v349[4] = v141;
                  v350 = 2114;
                  v351 = v198;
                  _os_log_impl(&dword_210BD8000, v197, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [uuid addition failed] - error=%{public}@", v349, 0x16u);
                }

                v145 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
              }
              else
              {
                v145 = 0;
              }

              _Block_object_dispose(buf, 8);
              if (v196)
              {
                v283 = 0;
                goto LABEL_304;
              }
            }
            +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "anyDelegationHostingAccount");
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            if (v147)
            {
              v148 = [MPCMutablePlaybackRequestEnvironment alloc];
              objc_msgSend(v147, "userIdentity");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v283 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v148, "initWithUserIdentity:", v149);

              v150 = [MPCMutablePlaybackDelegationProperties alloc];
              v151 = (const __CFString *)*((id *)v141 + 6);
              v152 = (__CFString *)v151;
              if (v151)
                v153 = v151;
              else
                v153 = CFSTR("unknown-guid");
              v154 = -[MPCPlaybackDelegationProperties initWithStoreAccountID:deviceGUID:](v150, "initWithStoreAccountID:deviceGUID:", v142, v153);

              v155 = *((id *)v141 + 7);
              -[MPCMutablePlaybackDelegationProperties setDeviceName:](v154, "setDeviceName:", v155);

              if ((v141[116] & 4) != 0)
                v156 = *((_DWORD *)v141 + 18);
              else
                v156 = 0;
              v200 = (v156 - 1);
              if (v200 < 4)
                v201 = v200 + 1;
              else
                v201 = 0;
              -[MPCMutablePlaybackDelegationProperties setSystemReleaseType:](v154, "setSystemReleaseType:", v201);
              v202 = *((id *)v141 + 8);
              -[MPCMutablePlaybackDelegationProperties setRequestUserAgent:](v154, "setRequestUserAgent:", v202);

              v203 = *((id *)v141 + 10);
              if (v203)
              {
                objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", v203);
                v204 = (void *)objc_claimAutoreleasedReturnValue();
                -[MPCMutablePlaybackDelegationProperties setTimeZone:](v154, "setTimeZone:", v204);

              }
              _MPCLogCategoryDelegation();
              v205 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v141;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v154;
                _os_log_impl(&dword_210BD8000, v205, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Delegation supported - properties=%{public}@", buf, 0x16u);
              }

              -[MPCMutablePlaybackRequestEnvironment setDelegationProperties:](v283, "setDelegationProperties:", v154);
              goto LABEL_303;
            }
            _MPCLogCategoryDelegation();
            v199 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v141;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v278;
              _os_log_impl(&dword_210BD8000, v199, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - delegation failed [no delegation host] account=%{public}@", buf, 0x16u);
            }

            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 73, CFSTR("No host for delegated account: %@"), v141);
            v145 = (id)objc_claimAutoreleasedReturnValue();
            v147 = 0;
LABEL_302:
            v283 = 0;
LABEL_303:

LABEL_304:
            v162 = (id)v275;
            goto LABEL_305;
          }
          _MPCLogCategoryMusicBehavior();
          v115 = objc_claimAutoreleasedReturnValue();
          v102 = v115;
          if ((a3 & 2) == 0)
          {
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              MPCHashedDSIDFromDSID(v93);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v116;
              *(_WORD *)&buf[22] = 2113;
              *(_QWORD *)&buf[24] = v93;
              _os_log_impl(&dword_210BD8000, v102, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [delegate account match, delegate not allowed, fallback not allowed] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);

            }
LABEL_157:

            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 67, CFSTR("cannot create playback context without user identity"));
            v117 = (id)objc_claimAutoreleasedReturnValue();
            v99 = 0;
            v285 = 0;
            v50 = 0;
            goto LABEL_196;
          }
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v86;
            _os_log_impl(&dword_210BD8000, v102, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [delegate account match, delegate not allowed, fallback allowed] account=%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v69)
          {
            _MPCLogCategoryMusicBehavior();
            v97 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
            {
              MPCHashedDSIDFromDSID(v93);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v98;
              *(_WORD *)&buf[22] = 2113;
              *(_QWORD *)&buf[24] = v93;
              _os_log_impl(&dword_210BD8000, v97, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | creating delegate account [no match, delegate allowed, incoming account supports delegation] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);

            }
            v99 = 0;
            v100 = 0;
            v285 = 1;
            goto LABEL_195;
          }
          _MPCLogCategoryMusicBehavior();
          v101 = objc_claimAutoreleasedReturnValue();
          v102 = v101;
          if ((a3 & 2) == 0)
          {
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
            {
              MPCHashedDSIDFromDSID(v93);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218755;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 0;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v103;
              *(_WORD *)&buf[28] = 2113;
              *(_QWORD *)&buf[30] = v93;
              _os_log_impl(&dword_210BD8000, v102, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [no match, fallback not allowed] incomingAccountSupportsDelegation=%{BOOL}u delegateAccount=%{public}@[%{private}@]", buf, 0x26u);

            }
            goto LABEL_157;
          }
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v86;
            _os_log_impl(&dword_210BD8000, v102, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [no match, fallback allowed] account=%{public}@", buf, 0x16u);
          }
        }

        v100 = v86;
        v285 = 0;
        v99 = 1;
        goto LABEL_195;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 27, CFSTR("Subscription required for shared queue, and user doesn't have playback capability: %@"), v305);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v323((uint64_t)v301, 0, 0, (uint64_t)v50);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 27, CFSTR("Subscription required for shared queue and no active account found"));
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v323((uint64_t)v301, 0, 0, (uint64_t)v50);
    }
LABEL_373:

    _Block_object_dispose(v336, 8);
    _Block_object_dispose(v333, 8);

    _Block_object_dispose(v338, 8);
    goto LABEL_374;
  }
  if (objc_msgSend(v313, "isEqualToString:", CFSTR("com.apple.music.playbackqueue.radio")))
  {
    objc_msgSend(a1, "data");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v309)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 8, CFSTR("Missing creation properties data in playback queue."));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(_QWORD *, _QWORD, void *))v312[2])(v312, 0, v51);

LABEL_343:
      goto LABEL_375;
    }
    v19 = -[_MPCProtoRadioCreationProperties initWithData:]([_MPCProtoRadioCreationProperties alloc], "initWithData:", v309);
    v20 = v19;
    if (v19)
      accountInfo = v19->_accountInfo;
    else
      accountInfo = 0;
    v22 = accountInfo;
    v316[0] = MEMORY[0x24BDAC760];
    v316[1] = 3221225472;
    v317 = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6;
    v318 = &unk_24CAB7E20;
    v321 = v312;
    v319 = a1;
    v294 = v20;
    v320 = v294;
    v302 = v22;
    v300 = v316;
    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activeAccount");
    v304 = (void *)objc_claimAutoreleasedReturnValue();

    if (v304)
    {
      if ((objc_msgSend(v304, "hasCatalogPlaybackCapability") & 1) != 0)
      {
        if (!v302)
        {
          _MPCLogCategoryMusicBehavior();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = 0;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v304;
            _os_log_impl(&dword_210BD8000, v70, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [empty accountInfo] account=%{public}@", buf, 0x16u);
          }

          v71 = v304;
          v72 = [MPCPlaybackRequestEnvironment alloc];
          objc_msgSend(v71, "userIdentity");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v72, "initWithUserIdentity:", v73);
          v317((uint64_t)v300, v52, 0, 0);
          goto LABEL_342;
        }
        v24 = v302;
        v25 = (uint64_t)v24;
        v296 = v24;
        if ((a3 & 1) == 0)
        {
          v306 = 0;
          v26 = CFSTR("assume DELEGATION (legacy client)");
LABEL_151:
          _MPCLogCategoryMusicBehavior();
          v113 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v26;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 0;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = a3 & 1;
            _os_log_impl(&dword_210BD8000, v113, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation NOT SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
          }
          v114 = 0;
          goto LABEL_161;
        }
        if (v24->_accountCapabilities.count)
        {
          v306 = 0;
          v74 = 0;
          v75 = 0;
          v26 = CFSTR("accountCapabilities.contains(DELEGATION) == NO");
          p_accountCapabilities = &v24->_accountCapabilities;
          while (v74 < p_accountCapabilities->count)
          {
            v77 = -[_MPCProtoDelegateInfo accountCapabilitiesAtIndex:](v25, v74);
            v78 = v306;
            if (v306)
              v79 = v26;
            else
              v79 = CFSTR("accountCapabilities.contains(DELEGATION) == YES");
            if (v77 == 3)
              v80 = 1;
            else
              v80 = v306;
            if (v77 == 3)
              v81 = CFSTR("accountCapabilities.contains(DELEGATION_INLINE) == YES");
            else
              v81 = v26;
            if (v77 == 3)
              v82 = 1;
            else
              v82 = v75;
            if (v77 != 2)
              v78 = v80;
            v306 = v78;
            if (v77 == 2)
              v26 = v79;
            else
              v26 = v81;
            if (v77 == 2)
              v75 = 1;
            else
              v75 = v82;
            ++v74;
            v25 = (uint64_t)v296;
          }
          if ((v75 & 1) == 0)
            goto LABEL_151;
        }
        else
        {
          v306 = 0;
          v26 = CFSTR("assume DELEGATION (legacy client)");
        }
        _MPCLogCategoryMusicBehavior();
        v113 = objc_claimAutoreleasedReturnValue();
        v114 = 1;
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1;
          _os_log_impl(&dword_210BD8000, v113, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
        }
LABEL_161:

        +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "activeAccount");
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        accountID = v296->_accountID;
        v121 = &buf[25];
        v122 = accountID;
        do
        {
          v123 = lldiv(v122, 10);
          v122 = v123.quot;
          if (v123.rem >= 0)
            LOBYTE(v124) = v123.rem;
          else
            v124 = -v123.rem;
          *(v121 - 2) = v124 + 48;
          v125 = v121 - 2;
          --v121;
        }
        while (v123.quot);
        if (accountID < 0)
        {
          *(v121 - 2) = 45;
          v125 = v121 - 2;
        }
        v126 = (__CFString *)CFStringCreateWithBytes(0, v125, &buf[24] - v125, 0x8000100u, 0);
        +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "accountForDSID:", v126);
        v128 = (void *)objc_claimAutoreleasedReturnValue();

        if (v128)
        {
          if ((objc_msgSend(v128, "isDelegated") & 1) == 0)
          {
            _MPCLogCategoryMusicBehavior();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v296;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v128;
              _os_log_impl(&dword_210BD8000, v129, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using specified account [matching non-delegate account] account=%{public}@", buf, 0x16u);
            }
            goto LABEL_180;
          }
          if (v114)
          {
            _MPCLogCategoryMusicBehavior();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v296;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v128;
              _os_log_impl(&dword_210BD8000, v129, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using delegate account [matching account] account=%{public}@", buf, 0x16u);
            }
LABEL_180:

            v133 = v128;
            v132 = 0;
            v292 = 0;
LABEL_228:
            v52 = (MPCPlaybackRequestEnvironment *)v133;
            v139 = 0;
LABEL_229:

            v163 = v139;
            if (v163)
            {
              v317((uint64_t)v300, 0, 0, (uint64_t)v163);
LABEL_341:

              goto LABEL_342;
            }
            v164 = -[MPCPlaybackRequestEnvironment isDelegated](v52, "isDelegated") ^ 1;
            if (v292)
              LOBYTE(v164) = 0;
            if ((v164 & 1) != 0)
            {
              v180 = [MPCPlaybackRequestEnvironment alloc];
              -[MPCPlaybackRequestEnvironment userIdentity](v52, "userIdentity");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v180, "initWithUserIdentity:", v181);

              if (v132)
                v182 = (void *)MEMORY[0x24BDBD1C8];
              else
                v182 = 0;
              v317((uint64_t)v300, v172, v182, 0);
LABEL_252:

              goto LABEL_342;
            }
            v165 = v296;
            v290 = v52;
            objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            v297 = *((id *)v165 + 13);
            v286 = *((_QWORD *)v165 + 4);
            _MPCLogCategoryDelegation();
            v166 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v165;
              *(_WORD *)&buf[12] = 2113;
              *(_QWORD *)&buf[14] = v297;
              *(_WORD *)&buf[22] = 2049;
              *(_QWORD *)&buf[24] = v286;
              _os_log_impl(&dword_210BD8000, v166, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Received account info for potential delegation - UUID=%{private}@ - DSID=%{private}lld", buf, 0x20u);
            }

            if (!v297 || !v286)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 7, CFSTR("Invalid delegation info: %@"), v165);
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              _MPCLogCategoryDelegation();
              v184 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v165;
                _os_log_impl(&dword_210BD8000, v184, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Getting delegated playback request environment failed [no valid delegation info]", buf, 0xCu);
              }

              v185 = objc_retainAutorelease(v183);
              v172 = 0;
              v281 = v185;
              goto LABEL_336;
            }
            if (v290)
            {
              -[MPCPlaybackRequestEnvironment userIdentity](v290, "userIdentity");
              v279 = (id)objc_claimAutoreleasedReturnValue();
              _MPCLogCategoryDelegation();
              v167 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v165;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v290;
                _os_log_impl(&dword_210BD8000, v167, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - delegation supported [found existing account] account=%{public}@", buf, 0x16u);
              }

              v281 = 0;
            }
            else
            {
              v206 = (void *)MEMORY[0x24BEC8A58];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v286);
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v206, "specificAccountWithDSID:", v207);
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v208, "identityAllowingDelegation:", 1);
              v279 = (id)objc_claimAutoreleasedReturnValue();

              _MPCLogCategoryDelegation();
              v209 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v165;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v279;
                _os_log_impl(&dword_210BD8000, v209, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Creating delegated identity [] userIdentity=%{public}@", buf, 0x16u);
              }

              v333[0] = 0;
              v210 = objc_msgSend(v284, "insertPropertiesForUserIdentity:usingBlock:error:", v279, &__block_literal_global_180, v333);
              v211 = v333[0];
              if ((v210 & 1) == 0)
              {
                if (v211)
                {
                  v169 = v211;
                  v227 = v211;
                }
                else
                {
                  v169 = 0;
                  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 7, CFSTR("Failed to create delegated account from info: %@"), v165);
                  v227 = (id)objc_claimAutoreleasedReturnValue();
                }
                v247 = v227;
                _MPCLogCategoryDelegation();
                v248 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  *(_QWORD *)&buf[4] = v165;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v247;
                  _os_log_impl(&dword_210BD8000, v248, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [property insertion failed] - error=%{public}@", buf, 0x16u);
                }

                v281 = objc_retainAutorelease(v247);
                goto LABEL_333;
              }
              v277 = v211;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              *(_QWORD *)&buf[24] = __Block_byref_object_copy__22101;
              *(_QWORD *)&buf[32] = __Block_byref_object_dispose__22102;
              v343 = 0;
              v212 = dispatch_semaphore_create(0);
              v336[0] = v297;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v336, 1);
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              v353 = (const __CFString *)MEMORY[0x24BDAC760];
              v354 = 3221225472;
              v355 = ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke_184;
              v356 = &unk_24CAB8008;
              v358 = buf;
              v214 = v212;
              v357 = v214;
              objc_msgSend(v284, "addDelegationUUIDs:forUserIdentity:completionHandler:", v213, v279, &v353);

              dispatch_semaphore_wait(v214, 0xFFFFFFFFFFFFFFFFLL);
              v215 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              if (v215)
              {
                _MPCLogCategoryDelegation();
                v216 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
                {
                  v217 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                  *(_DWORD *)v338 = 134218242;
                  *(_QWORD *)&v338[4] = v165;
                  *(_WORD *)&v338[12] = 2114;
                  *(_QWORD *)&v338[14] = v217;
                  _os_log_impl(&dword_210BD8000, v216, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [uuid addition failed] - error=%{public}@", v338, 0x16u);
                }

                v281 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
              }
              else
              {
                v281 = 0;
              }

              _Block_object_dispose(buf, 8);
              if (v215)
              {
                v172 = 0;
                goto LABEL_335;
              }
            }
            +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "anyDelegationHostingAccount");
            v169 = (void *)objc_claimAutoreleasedReturnValue();

            if (v169)
            {
              v170 = [MPCMutablePlaybackRequestEnvironment alloc];
              objc_msgSend(v169, "userIdentity");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v170, "initWithUserIdentity:", v171);

              v173 = [MPCMutablePlaybackDelegationProperties alloc];
              v174 = (const __CFString *)*((id *)v165 + 6);
              v175 = (__CFString *)v174;
              if (v174)
                v176 = v174;
              else
                v176 = CFSTR("unknown-guid");
              v177 = -[MPCPlaybackDelegationProperties initWithStoreAccountID:deviceGUID:](v173, "initWithStoreAccountID:deviceGUID:", v286, v176);

              v178 = *((id *)v165 + 7);
              -[MPCMutablePlaybackDelegationProperties setDeviceName:](v177, "setDeviceName:", v178);

              if ((v165[116] & 4) != 0)
                v179 = *((_DWORD *)v165 + 18);
              else
                v179 = 0;
              v221 = (v179 - 1);
              if (v221 < 4)
                v222 = v221 + 1;
              else
                v222 = 0;
              -[MPCMutablePlaybackDelegationProperties setSystemReleaseType:](v177, "setSystemReleaseType:", v222);
              v223 = *((id *)v165 + 8);
              -[MPCMutablePlaybackDelegationProperties setRequestUserAgent:](v177, "setRequestUserAgent:", v223);

              v224 = *((id *)v165 + 10);
              if (v224)
              {
                objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", v224);
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                -[MPCMutablePlaybackDelegationProperties setTimeZone:](v177, "setTimeZone:", v225);

              }
              _MPCLogCategoryDelegation();
              v226 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v165;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v177;
                _os_log_impl(&dword_210BD8000, v226, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Delegation supported - properties=%{public}@", buf, 0x16u);
              }

              -[MPCMutablePlaybackRequestEnvironment setDelegationProperties:](v172, "setDelegationProperties:", v177);
              goto LABEL_334;
            }
            _MPCLogCategoryDelegation();
            v220 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v165;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v290;
              _os_log_impl(&dword_210BD8000, v220, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - delegation failed [no delegation host] account=%{public}@", buf, 0x16u);
            }

            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 73, CFSTR("No host for delegated account: %@"), v165);
            v281 = (id)objc_claimAutoreleasedReturnValue();
            v169 = 0;
LABEL_333:
            v172 = 0;
LABEL_334:

LABEL_335:
            v185 = v279;
LABEL_336:

            v249 = v281;
            if (v249)
            {
              _MPCLogCategoryMusicBehavior();
              v250 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v165;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v249;
                _os_log_impl(&dword_210BD8000, v250, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [failed to create delegate request environment] dsidError=%{public}@", buf, 0x16u);
              }

              v317((uint64_t)v300, 0, 0, (uint64_t)v249);
              goto LABEL_340;
            }
            if (v306)
            {
              objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
              v251 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPCPlaybackRequestEnvironment userIdentity](v290, "userIdentity");
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)v338 = 0;
              objc_msgSend(v251, "getPropertiesForUserIdentity:error:", v252, v338);
              v307 = (void *)objc_claimAutoreleasedReturnValue();
              v253 = *(id *)v338;

              if (v253)
              {
                v317((uint64_t)v300, 0, 0, (uint64_t)v253);

LABEL_340:
                goto LABEL_341;
              }
              objc_msgSend(v307, "delegateToken");
              v298 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v298, "type") != 1
                || (objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 604800.0),
                    v255 = (void *)objc_claimAutoreleasedReturnValue(),
                    v256 = objc_msgSend(v298, "expiresBeforeDate:", v255),
                    v255,
                    v256))
              {
                v288 = *((id *)v165 + 12);
                if (v288)
                {
                  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
                  v257 = (void *)objc_claimAutoreleasedReturnValue();
                  v258 = *((_QWORD *)v165 + 4);
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = ____MPCPlaybackRequestEnvironmentFromProtoAccountInfo_block_invoke;
                  *(_QWORD *)&buf[24] = &unk_24CAB7FA0;
                  v345 = v300;
                  v346 = v132;
                  v347 = v292;
                  v348 = 1;
                  *(_QWORD *)&buf[32] = v165;
                  v343 = v172;
                  v344 = v290;
                  objc_msgSend(v257, "updateCredentialsWithDelegateTokenE:forDSID:completion:", v288, v258, buf);

                  v259 = v345;
                }
                else
                {
                  v259 = *((id *)v165 + 11);
                  if (v259)
                  {
                    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
                    v260 = (void *)objc_claimAutoreleasedReturnValue();
                    v261 = *((_QWORD *)v165 + 4);
                    v333[0] = 0;
                    objc_msgSend(v260, "getDelegateTokenBWithTokenA:forDSID:error:", v259, v261, v333);
                    v262 = (void *)objc_claimAutoreleasedReturnValue();
                    v263 = v333[0];

                    v264 = (void *)MEMORY[0x24BDD1540];
                    v353 = CFSTR("MPCErrorUserInfoKeyRemoteCommandStatusCode");
                    v354 = (uint64_t)CFSTR("MPCErrorUserInfoKeyCustomDataType");
                    *(_QWORD *)buf = &unk_24CB16E90;
                    *(_QWORD *)&buf[8] = CFSTR("com.apple.music/wha-delegation/b");
                    v355 = (void (*)(uint64_t, int, id))CFSTR("MPCErrorUserInfoKeyCustomData");
                    objc_msgSend(v262, "data");
                    v265 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&buf[16] = v265;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v353, 3);
                    v266 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v264, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), 74, v266, CFSTR("Delegation token missing or expired for %@"), v172);
                    v267 = (void *)objc_claimAutoreleasedReturnValue();
                    v317((uint64_t)v300, 0, 0, (uint64_t)v267);

                  }
                  else
                  {
                    v270 = (void *)MEMORY[0x24BDD1540];
                    v353 = CFSTR("MPCErrorUserInfoKeyRemoteCommandStatusCode");
                    *(_QWORD *)buf = &unk_24CB16E90;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v353, 1);
                    v262 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v270, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), 74, v262, CFSTR("Delegation token missing and inline delegation missing tokens"));
                    v263 = (id)objc_claimAutoreleasedReturnValue();
                    v317((uint64_t)v300, 0, 0, (uint64_t)v263);
                  }

                }
                goto LABEL_340;
              }
              if (v132)
              {
                v268 = (void *)MEMORY[0x24BDBD1C8];
              }
              else if ((v165[116] & 8) != 0)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v165[112]);
                v268 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v268 = 0;
              }
              if (!v172)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v273 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void __MPCPlaybackRequestEnvironmentFromProtoAccountInfo(_MPCProtoDelegateInfo *__strong, MPRemotePlaybackQueuePlaybackContextOptions, void (^__strong)(MPCPlaybackRequestEnvironment * _Nullable __strong, NSNumber * _Nullable __strong, NSError * _Nullable __strong))");
                v274 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v273, "handleFailureInFunction:file:lineNumber:description:", v274, CFSTR("MPRemotePlaybackQueue+MPCAdditions.m"), 375, CFSTR("Failed to produce playback request environment for accountInfo: %@, desiredAccount: %@"), v165, v290);

              }
              v317((uint64_t)v300, v172, v268, 0);

            }
            else
            {
              if (v132)
              {
                v254 = MEMORY[0x24BDBD1C8];
              }
              else if ((v165[116] & 8) != 0)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v165[112]);
                v254 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v254 = 0;
              }
              v307 = (void *)v254;
              ((void (*)(_QWORD *, MPCMutablePlaybackRequestEnvironment *))v317)(v300, v172);
            }

            goto LABEL_252;
          }
          _MPCLogCategoryMusicBehavior();
          v137 = objc_claimAutoreleasedReturnValue();
          v135 = v137;
          if ((a3 & 2) == 0)
          {
            if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
            {
              MPCHashedDSIDFromDSID(v126);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v296;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v138;
              *(_WORD *)&buf[22] = 2113;
              *(_QWORD *)&buf[24] = v126;
              _os_log_impl(&dword_210BD8000, v135, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [delegate account match, delegate not allowed, fallback not allowed] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);

            }
LABEL_191:

            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 67, CFSTR("cannot create playback context without user identity"));
            v139 = (id)objc_claimAutoreleasedReturnValue();
            v132 = 0;
            v292 = 0;
            v52 = 0;
            goto LABEL_229;
          }
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v296;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v119;
            _os_log_impl(&dword_210BD8000, v135, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [delegate account match, delegate not allowed, fallback allowed] account=%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v114)
          {
            _MPCLogCategoryMusicBehavior();
            v130 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
            {
              MPCHashedDSIDFromDSID(v126);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v296;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v131;
              *(_WORD *)&buf[22] = 2113;
              *(_QWORD *)&buf[24] = v126;
              _os_log_impl(&dword_210BD8000, v130, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | creating delegate account [no match, delegate allowed, incoming account supports delegation] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);

            }
            v132 = 0;
            v133 = 0;
            v292 = 1;
            goto LABEL_228;
          }
          _MPCLogCategoryMusicBehavior();
          v134 = objc_claimAutoreleasedReturnValue();
          v135 = v134;
          if ((a3 & 2) == 0)
          {
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              MPCHashedDSIDFromDSID(v126);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218755;
              *(_QWORD *)&buf[4] = v296;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 0;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v136;
              *(_WORD *)&buf[28] = 2113;
              *(_QWORD *)&buf[30] = v126;
              _os_log_impl(&dword_210BD8000, v135, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [no match, fallback not allowed] incomingAccountSupportsDelegation=%{BOOL}u delegateAccount=%{public}@[%{private}@]", buf, 0x26u);

            }
            goto LABEL_191;
          }
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v296;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v119;
            _os_log_impl(&dword_210BD8000, v135, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [no match, fallback allowed] account=%{public}@", buf, 0x16u);
          }
        }

        v133 = v119;
        v292 = 0;
        v132 = 1;
        goto LABEL_228;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 27, CFSTR("Subscription required for shared queue, and user doesn't have playback capability: %@"), v304);
      v52 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      v317((uint64_t)v300, 0, 0, (uint64_t)v52);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 27, CFSTR("Subscription required for shared queue and no active account found"));
      v52 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      v317((uint64_t)v300, 0, 0, (uint64_t)v52);
    }
LABEL_342:

    goto LABEL_343;
  }
  if (objc_msgSend(v313, "isEqualToString:", CFSTR("com.apple.mediaplayer.playbackcontext")))
  {
    objc_msgSend(a1, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    MSVUnarchivedObjectOfClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a1;
    objc_msgSend(v27, "featureName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayActivityFeatureName:", v28);

    objc_msgSend(v27, "queueGroupingID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayActivityQueueGroupingID:", v29);

    objc_msgSend(v27, "siriRecommendationIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dataUsingEncoding:", 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayActivityRecommendationData:", v31);

    objc_msgSend(v27, "siriAssetInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSiriAssetInfo:", v32);

    objc_msgSend(v27, "siriReferenceIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSiriReferenceIdentifier:", v33);

    objc_msgSend(v27, "siriWHAMetricsInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSiriWHAMetricsInfo:", v34);

    objc_msgSend(v27, "privateListeningOverride");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrivateListeningOverride:", v35);

    if (objc_msgSend(v27, "isRequestingImmediatePlayback"))
      v36 = 20;
    else
      v36 = 0;
    objc_msgSend(v7, "setActionAfterQueueLoad:", v36);
    objc_msgSend(v27, "userIdentity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setUserIdentity:", v37);
    v8 = (void (*)(void))v312[2];
    goto LABEL_3;
  }
  if (!objc_msgSend(v313, "isEqualToString:", CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack")))
  {
    if (objc_msgSend(v313, "isEqualToString:", CFSTR("com.apple.music.playbackqueue.sharedlistening")))
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 58, CFSTR("Sharedlistening playback context cannot be used for remote set queue."));
    else
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 4, CFSTR("Unknown queue identifier: %@"), v313);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, _QWORD, void *))v312[2])(v312, 0, v6);
    goto LABEL_4;
  }
  objc_msgSend(a1, "data");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x24BE65C70];
  v41 = (void *)MEMORY[0x24BDBCF20];
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = 0;
  objc_msgSend(v40, "decodedObjectOfClasses:fromData:error:", v44, v39, &v315);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v315;

  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("original"));
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("supplemental"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isSupported](v47, "isSupported"))
  {
    _MPCLogCategoryPlayback();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "[RemotePlaybackQueue] using originalPlaybackContext", buf, 2u);
    }
    goto LABEL_138;
  }
  if (v48)
  {
    if (objc_msgSend(v48, "isSupported"))
    {
      _MPCLogCategoryPlayback();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v57, OS_LOG_TYPE_DEFAULT, "[RemotePlaybackQueue] originalPlaybackContext is not supported, using supplementalPlaybackContext", buf, 2u);
      }

      v49 = v47;
      v47 = v48;
      goto LABEL_138;
    }

    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 58, CFSTR("Neither the originalPlaybackContext nor the supplementalPlaybackContext are supported."));
    v83 = objc_claimAutoreleasedReturnValue();

    _MPCLogCategoryPlayback();
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      goto LABEL_137;
    *(_WORD *)buf = 0;
    v84 = "[RemotePlaybackQueue] Neither the originalPlaybackContext nor the supplementalPlaybackContext are supported.";
    goto LABEL_136;
  }

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 58, CFSTR("originalPlaybackContext is not supported and no supplementalPlaybackContext was provided."));
  v83 = objc_claimAutoreleasedReturnValue();

  _MPCLogCategoryPlayback();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v84 = "[RemotePlaybackQueue] originalPlaybackContext is not supported and no supplementalPlaybackContext was provided.";
LABEL_136:
    _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, v84, buf, 2u);
  }
LABEL_137:
  v47 = 0;
  v46 = (id)v83;
LABEL_138:

  if (v46)
  {
    ((void (*)(_QWORD *, _QWORD, id))v312[2])(v312, 0, v46);
  }
  else
  {
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSessionIdentifier:](v47, "setSessionIdentifier:", v104);

    if (-[NSObject conformsToProtocol:](v47, "conformsToProtocol:", &unk_254A9D5E8))
    {
      v105 = v47;
      -[NSObject playbackRequestEnvironment](v105, "playbackRequestEnvironment");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v314 = 0;
      objc_msgSend(v106, "rectifiedPlaybackRequestEnvironmentWithReasons:", &v314);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v310 = v314;

      if (v107)
      {
        _MPCLogCategoryPlayback();
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v310, "componentsJoinedByString:", CFSTR(", "));
          v109 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v110 = (void *)v109;
          *(_QWORD *)&buf[4] = v109;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v105;
          _os_log_impl(&dword_210BD8000, v108, OS_LOG_TYPE_DEFAULT, "[RemotePlaybackQueue] account rectification [%{public}@] context: %{public}@", buf, 0x16u);

        }
        -[NSObject setPlaybackRequestEnvironment:](v105, "setPlaybackRequestEnvironment:", v107);
      }

    }
    objc_msgSend(a1, "mediaRemoteOptions");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", *MEMORY[0x24BE65978]);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
      -[NSObject setQueueEndAction:](v47, "setQueueEndAction:", objc_msgSend(v112, "integerValue"));
    ((void (*)(_QWORD *, NSObject *, _QWORD))v312[2])(v312, v47, 0);

  }
LABEL_375:

}

@end
