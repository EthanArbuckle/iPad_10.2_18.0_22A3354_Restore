@implementation VPNConnectionStore

void __26__VPNConnectionStore_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setConfigurations:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_configurationChanged");

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setVpnServiceCountDirty:", 1);

}

- (void)setConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (void)_configurationChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__VPNConnectionStore__configurationChanged__block_invoke;
  block[3] = &unk_24EE4DA98;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (id)currentConnection:(BOOL)a3 withGrade:(unint64_t)a4
{
  VPNConnection *v4;
  VPNConnection **gradeCurrentConnection;
  void *v8;
  uint64_t v9;
  VPNConnection *v10;

  if (a4 == 2)
  {
    v4 = 0;
  }
  else
  {
    if (a3 && !self->_gradeCurrentConnectionHasBeenSet[a4])
    {
      gradeCurrentConnection = self->_gradeCurrentConnection;
      if (!self->_gradeCurrentConnection[a4])
      {
        -[VPNConnectionStore activeVPNIDWithGrade:](self, "activeVPNIDWithGrade:", a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNConnectionStore connectionWithServiceID:withGrade:](self, "connectionWithServiceID:withGrade:", v8, a4);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = gradeCurrentConnection[a4];
        gradeCurrentConnection[a4] = (VPNConnection *)v9;

        self->_gradeCurrentConnectionHasBeenSet[a4] = 1;
      }
    }
    v4 = self->_gradeCurrentConnection[a4];
  }
  return v4;
}

- (id)connectionWithServiceID:(id)a3 withGrade:(unint64_t)a4
{
  id v6;
  VPNConnection *v7;
  VPNConnection *v8;
  VPNConnection *v9;
  uint64_t v10;
  VPNConnection *i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSMutableDictionary **connectionDict;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v22;
  VPNConnection *v23;
  unsigned __int8 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 == 8 || a4 == 2)
  {
    v7 = self->_gradeCurrentConnection[a4];
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v7;
    v9 = (VPNConnection *)-[VPNConnection countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v9; i = (VPNConnection *)((char *)i + 1))
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "serviceID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v6);

          if (v14)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        v9 = (VPNConnection *)-[VPNConnection countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

    if (v9)
      goto LABEL_20;
  }
  else
  {
    -[VPNConnection serviceID](self->_gradeCurrentConnection[a4], "serviceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "isEqual:", v15);

    if (v16)
    {
      v9 = self->_gradeCurrentConnection[a4];
      if (v9)
        goto LABEL_20;
    }
  }
  connectionDict = self->_connectionDict;
  v18 = self->_connectionDict[a4];
  if (!v18)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v20 = connectionDict[a4];
    connectionDict[a4] = v19;

    v18 = connectionDict[a4];
  }
  -[NSMutableDictionary objectForKey:](v18, "objectForKey:", v6);
  v9 = (VPNConnection *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[VPNConnectionStore optionsForServiceID:withGrade:](self, "optionsForServiceID:withGrade:", v6, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22
      || (v23 = -[VPNConnection initWithServiceID:options:]([VPNConnection alloc], "initWithServiceID:options:", v6, v22)) == 0)
    {

      v9 = 0;
      goto LABEL_22;
    }
    v9 = v23;
    -[NSMutableDictionary setObject:forKey:](connectionDict[a4], "setObject:forKey:", v23, v6);

  }
LABEL_20:
  if (-[VPNConnection vpnConnectionType](v9, "vpnConnectionType") == 3)
  {
    v24 = 0;
    -[VPNConnectionStore isTypeEnabledWithServiceID:withGrade:outProviderAvailable:](self, "isTypeEnabledWithServiceID:withGrade:outProviderAvailable:", v6, a4, &v24);
    -[VPNConnection setIsProviderAvailable:](v9, "setIsProviderAvailable:", v24);
  }
LABEL_22:

  return v9;
}

- (id)optionsForServiceID:(id)a3 withGrade:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  __CFString *v99;
  int v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t j;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t k;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  char v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  int v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  const __CFString *v214;
  const __CFString *v215;
  const __CFString *v216;
  const __CFString *v217;
  const __CFString *v218;
  const __CFString *v219;
  void *v220;
  const __CFString *v221;
  const __CFString *v222;
  const __CFString *v223;
  const __CFString *v224;
  const __CFString *v225;
  const __CFString *v226;
  const __CFString *v227;
  const __CFString *v228;
  const __CFString *v229;
  void *v231;
  void *v232;
  char v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  int v243;
  void *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t i;
  void *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  void *v262;
  void *v263;
  void *v264;
  char v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t m;
  void *v285;
  uint64_t v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  int v296;
  void *v297;
  _BOOL4 v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  __CFString *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  __CFString *v316;
  id v317;
  __CFString *v318;
  __CFString *v319;
  __CFString *v320;
  VPNConnectionStore *v321;
  void *v322;
  __CFString *v323;
  __CFString *v324;
  __CFString *v325;
  __CFString *v326;
  __CFString *v327;
  __CFString *v328;
  __CFString *v329;
  __CFString *v330;
  __CFString *v331;
  id v332;
  __CFString *v333;
  __CFString *v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  _BYTE v358[128];
  _BYTE v359[128];
  uint64_t v360;

  v360 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v351 = 0u;
  v352 = 0u;
  v353 = 0u;
  v354 = 0u;
  -[VPNConnectionStore configurations](self, "configurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v351, v359, 16);
  if (v8)
  {
    v321 = self;
    v9 = *(_QWORD *)v352;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v352 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v351 + 1) + 8 * v10);
      if (objc_msgSend(v11, "grade") != 3)
      {
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v6);

        if ((v13 & 1) != 0)
          break;
      }
      if (v8 == (void *)++v10)
      {
        v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v351, v359, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v15 = v11;

    if (!v15)
    {
      v8 = 0;
      goto LABEL_201;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("VPNGrade"));

    objc_msgSend(v15, "name");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationName");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationIdentifier");
    v333 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = &unk_24EE55028;
    v316 = (__CFString *)v18;
    v317 = v6;
    if (a4 > 1)
    {
      v303 = v15;
      v14 = v15;
      switch(a4)
      {
        case 2uLL:
          objc_msgSend(v15, "appVPN");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "protocol");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v28 = &unk_24EE55088;
          }
          else
          {
            objc_msgSend(v15, "appVPN");
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "protocol");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v233 = objc_opt_isKindOfClass();

            if ((v233 & 1) != 0)
              v28 = &unk_24EE550A0;
            else
              v28 = &unk_24EE550B8;
          }
          v302 = v8;
          objc_msgSend(v8, "setValue:forKey:", v28, CFSTR("VPNType"));
          objc_msgSend(v15, "appVPN");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v234, "isEnabled"))
            v235 = &unk_24EE55070;
          else
            v235 = &unk_24EE55028;
          v332 = v235;

          objc_msgSend(v15, "appVPN");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "protocol");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "serverAddress");
          v334 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "appVPN");
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "protocol");
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "username");
          v331 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "appVPN");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v239) = objc_msgSend(v240, "isOnDemandEnabled");

          if ((_DWORD)v239)
            v241 = &unk_24EE55070;
          else
            v241 = &unk_24EE55028;
          v315 = v241;
          objc_msgSend(v15, "appVPN");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = objc_msgSend(v242, "isOnDemandUserOverrideDisabled");

          if (v243)
            v244 = &unk_24EE55070;
          else
            v244 = &unk_24EE55028;
          v299 = v244;
          v349 = 0u;
          v350 = 0u;
          v347 = 0u;
          v348 = 0u;
          objc_msgSend(v15, "appVPN");
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "appRules");
          v246 = (void *)objc_claimAutoreleasedReturnValue();

          v247 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v347, v358, 16);
          if (v247)
          {
            v248 = v247;
            v249 = *(_QWORD *)v348;
            do
            {
              for (i = 0; i != v248; ++i)
              {
                if (*(_QWORD *)v348 != v249)
                  objc_enumerationMutation(v246);
                v251 = *(void **)(*((_QWORD *)&v347 + 1) + 8 * i);
                objc_msgSend(v251, "matchSigningIdentifier");
                v252 = objc_claimAutoreleasedReturnValue();
                if (v252)
                {
                  v253 = (void *)v252;
                  objc_msgSend(v251, "matchSigningIdentifier");
                  v254 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectForKeyedSubscript:", v254);
                  v255 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v255)
                  {
                    objc_msgSend(v251, "matchDomains");
                    v256 = objc_claimAutoreleasedReturnValue();
                    if (v256
                      && (v257 = (void *)v256,
                          objc_msgSend(v251, "matchDomains"),
                          v258 = (void *)objc_claimAutoreleasedReturnValue(),
                          v259 = objc_msgSend(v258, "count"),
                          v258,
                          v257,
                          v259))
                    {
                      objc_msgSend(v251, "matchDomains");
                      v260 = (void *)objc_claimAutoreleasedReturnValue();
                      v261 = objc_msgSend(v260, "count");

                      if (v261 == 1)
                      {
                        objc_msgSend(v251, "matchDomains");
                        v262 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v262, "objectAtIndexedSubscript:", 0);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v262 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v262, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_DOMAINS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                      }
                      v263 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v251, "matchSigningIdentifier");
                      v264 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", v263, v264);

                    }
                    else
                    {
                      objc_msgSend(v251, "matchSigningIdentifier");
                      v262 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", &stru_24EE4DF70, v262);
                    }

                  }
                }
              }
              v248 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v347, v358, 16);
            }
            while (v248);
          }

          v322 = 0;
          v323 = 0;
          v328 = 0;
          v329 = 0;
          v330 = 0;
          v306 = 0;
          v307 = 0;
          v325 = 0;
          v326 = 0;
          v327 = 0;
          v324 = 0;
          v99 = 0;
          v100 = 0;
          v101 = &unk_24EE55058;
          v312 = &unk_24EE55058;
          v313 = &unk_24EE55028;
          v20 = &unk_24EE55028;
          v304 = 0;
          v305 = &unk_24EE55058;
          v310 = &unk_24EE55028;
          v311 = &unk_24EE55028;
          v308 = 0;
          v309 = &unk_24EE55028;
          v314 = &unk_24EE55070;
          v8 = v302;
          v14 = v303;
          v102 = v299;
          goto LABEL_138;
        case 3uLL:
          objc_msgSend(v15, "alwaysOnVPN");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "isEnabled");
          v98 = &unk_24EE55070;
          if (!v97)
            v98 = &unk_24EE55028;
          v332 = v98;

          objc_msgSend(v8, "setValue:forKey:", &unk_24EE55088, CFSTR("VPNType"));
          v322 = 0;
          v323 = 0;
          v328 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v306 = 0;
          v307 = 0;
          v325 = 0;
          v326 = 0;
          v327 = 0;
          v324 = 0;
          v99 = 0;
          v308 = 0;
          v309 = &unk_24EE55028;
          v100 = 0;
          v334 = 0;
          v101 = &unk_24EE55058;
          v313 = &unk_24EE55028;
          v314 = &unk_24EE55028;
          v315 = &unk_24EE55028;
          v102 = &unk_24EE55028;
          v304 = 0;
          v305 = &unk_24EE55058;
          v311 = &unk_24EE55028;
          v312 = &unk_24EE55058;
          goto LABEL_233;
        case 4uLL:
          v103 = objc_msgSend(v15, "grade");
          v104 = &unk_24EE55070;
          if (v103 != 1)
            v104 = &unk_24EE55028;
          v309 = v104;
          objc_msgSend(v15, "dnsSettings");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "settings");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v107 = objc_opt_isKindOfClass();

          objc_msgSend(v15, "dnsSettings");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "settings");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v109;
          if ((v107 & 1) != 0)
          {
            objc_msgSend(v109, "serverURL");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "absoluteString");
            v334 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v322 = 0;
            v323 = 0;
            v328 = 0;
            v329 = 0;
            v330 = 0;
            v331 = 0;
            v306 = 0;
            v307 = 0;
            v325 = 0;
            v326 = 0;
            v327 = 0;
            v324 = 0;
            v99 = 0;
            v308 = 0;
            v100 = 0;
            v20 = &unk_24EE55028;
            v314 = &unk_24EE55028;
            v315 = &unk_24EE55028;
            v102 = &unk_24EE55028;
            v304 = 0;
            v305 = &unk_24EE55058;
            v311 = &unk_24EE55028;
            v312 = &unk_24EE55058;
            v332 = &unk_24EE55028;
            v313 = &unk_24EE55028;
            v310 = &unk_24EE55028;
            v101 = &unk_24EE550A0;
          }
          else
          {
            objc_opt_class();
            v265 = objc_opt_isKindOfClass();

            objc_msgSend(v15, "dnsSettings");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v266, "settings");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v268 = v267;
            if ((v265 & 1) != 0)
            {
              objc_msgSend(v267, "serverName");
              v334 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v322 = 0;
              v323 = 0;
              v328 = 0;
              v329 = 0;
              v330 = 0;
              v331 = 0;
              v306 = 0;
              v307 = 0;
              v325 = 0;
              v326 = 0;
              v327 = 0;
              v324 = 0;
              v99 = 0;
              v308 = 0;
              v100 = 0;
              v20 = &unk_24EE55028;
              v314 = &unk_24EE55028;
              v315 = &unk_24EE55028;
              v102 = &unk_24EE55028;
              v304 = 0;
              v305 = &unk_24EE55058;
              v311 = &unk_24EE55028;
              v312 = &unk_24EE55058;
              v332 = &unk_24EE55028;
              v313 = &unk_24EE55028;
              v310 = &unk_24EE55028;
              v101 = &unk_24EE55040;
            }
            else
            {
              objc_msgSend(v267, "servers");
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v273, "firstObject");
              v334 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v322 = 0;
              v323 = 0;
              v328 = 0;
              v329 = 0;
              v330 = 0;
              v331 = 0;
              v306 = 0;
              v307 = 0;
              v325 = 0;
              v326 = 0;
              v327 = 0;
              v324 = 0;
              v99 = 0;
              v308 = 0;
              v100 = 0;
              v101 = &unk_24EE55058;
              v20 = &unk_24EE55028;
              v314 = &unk_24EE55028;
              v315 = &unk_24EE55028;
              v102 = &unk_24EE55028;
              v304 = 0;
              v305 = &unk_24EE55058;
              v311 = &unk_24EE55028;
              v312 = &unk_24EE55058;
              v332 = &unk_24EE55028;
              v313 = &unk_24EE55028;
              v310 = &unk_24EE55028;
            }
          }
          goto LABEL_138;
        case 5uLL:
          v320 = v17;
          v301 = v8;
          objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = objc_msgSend(v112, "isSupervised");

          v114 = &unk_24EE55070;
          v345 = 0u;
          v346 = 0u;
          if (!v113)
            v114 = &unk_24EE55028;
          v309 = v114;
          v343 = 0uLL;
          v344 = 0uLL;
          objc_msgSend(v15, "dnsProxy");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "perApp");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "appRules");
          v117 = (void *)objc_claimAutoreleasedReturnValue();

          v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v343, v357, 16);
          if (v118)
          {
            v119 = v118;
            v120 = *(_QWORD *)v344;
            do
            {
              for (j = 0; j != v119; ++j)
              {
                if (*(_QWORD *)v344 != v120)
                  objc_enumerationMutation(v117);
                v122 = *(void **)(*((_QWORD *)&v343 + 1) + 8 * j);
                objc_msgSend(v122, "matchSigningIdentifier");
                v123 = objc_claimAutoreleasedReturnValue();
                if (v123)
                {
                  v124 = (void *)v123;
                  objc_msgSend(v122, "matchSigningIdentifier");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectForKeyedSubscript:", v125);
                  v126 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v126)
                  {
                    objc_msgSend(v122, "matchDomains");
                    v127 = objc_claimAutoreleasedReturnValue();
                    if (v127
                      && (v128 = (void *)v127,
                          objc_msgSend(v122, "matchDomains"),
                          v129 = (void *)objc_claimAutoreleasedReturnValue(),
                          v130 = objc_msgSend(v129, "count"),
                          v129,
                          v128,
                          v130))
                    {
                      objc_msgSend(v122, "matchDomains");
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      v132 = objc_msgSend(v131, "count");

                      if (v132 == 1)
                      {
                        objc_msgSend(v122, "matchDomains");
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v133, "objectAtIndexedSubscript:", 0);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v133, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_DOMAINS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                      }
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v122, "matchSigningIdentifier");
                      v135 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", v134, v135);

                    }
                    else
                    {
                      objc_msgSend(v122, "matchSigningIdentifier");
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", &stru_24EE4DF70, v133);
                    }

                  }
                }
              }
              v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v343, v357, 16);
            }
            while (v119);
          }

          v14 = v15;
          objc_msgSend(v15, "externalIdentifier");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v136 != 0;

          v322 = 0;
          v323 = 0;
          v328 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v306 = 0;
          v307 = 0;
          v325 = 0;
          v326 = 0;
          v327 = 0;
          v324 = 0;
          v99 = 0;
          v308 = 0;
          v334 = 0;
          v20 = &unk_24EE55028;
          v314 = &unk_24EE55028;
          v315 = &unk_24EE55028;
          v102 = &unk_24EE55028;
          v304 = 0;
          v305 = &unk_24EE55058;
          v311 = &unk_24EE55028;
          v312 = &unk_24EE55058;
          v332 = &unk_24EE55028;
          v313 = &unk_24EE55028;
          v310 = &unk_24EE55028;
          v101 = &unk_24EE550B8;
          goto LABEL_103;
        case 6uLL:
          v320 = v17;
          v301 = v8;
          v341 = 0u;
          v342 = 0u;
          v339 = 0u;
          v340 = 0u;
          objc_msgSend(v15, "contentFilter");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "perApp");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "appRules");
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v339, v356, 16);
          if (v140)
          {
            v141 = v140;
            v142 = *(_QWORD *)v340;
            do
            {
              for (k = 0; k != v141; ++k)
              {
                if (*(_QWORD *)v340 != v142)
                  objc_enumerationMutation(v139);
                v144 = *(void **)(*((_QWORD *)&v339 + 1) + 8 * k);
                objc_msgSend(v144, "matchSigningIdentifier");
                v145 = objc_claimAutoreleasedReturnValue();
                if (v145)
                {
                  v146 = (void *)v145;
                  objc_msgSend(v144, "matchSigningIdentifier");
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectForKeyedSubscript:", v147);
                  v148 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v148)
                  {
                    objc_msgSend(v144, "matchDomains");
                    v149 = objc_claimAutoreleasedReturnValue();
                    if (v149
                      && (v150 = (void *)v149,
                          objc_msgSend(v144, "matchDomains"),
                          v151 = (void *)objc_claimAutoreleasedReturnValue(),
                          v152 = objc_msgSend(v151, "count"),
                          v151,
                          v150,
                          v152))
                    {
                      objc_msgSend(v144, "matchDomains");
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      v154 = objc_msgSend(v153, "count");

                      if (v154 == 1)
                      {
                        objc_msgSend(v144, "matchDomains");
                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v155, "objectAtIndexedSubscript:", 0);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v155, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_DOMAINS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                      }
                      v156 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v144, "matchSigningIdentifier");
                      v157 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", v156, v157);

                    }
                    else
                    {
                      objc_msgSend(v144, "matchSigningIdentifier");
                      v155 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", &stru_24EE4DF70, v155);
                    }

                  }
                }
              }
              v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v339, v356, 16);
            }
            while (v141);
          }

          v14 = v303;
          objc_msgSend(v303, "externalIdentifier");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v158 != 0;

          v322 = 0;
          v323 = 0;
          v328 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v306 = 0;
          v307 = 0;
          v325 = 0;
          v326 = 0;
          v327 = 0;
          v324 = 0;
          v99 = 0;
          v334 = 0;
          v101 = &unk_24EE55058;
          v313 = &unk_24EE55028;
          v314 = &unk_24EE55028;
          v20 = &unk_24EE55028;
          v315 = &unk_24EE55028;
          v102 = &unk_24EE55028;
          v304 = 0;
          v305 = &unk_24EE55058;
          v311 = &unk_24EE55028;
          v312 = &unk_24EE55058;
          v332 = &unk_24EE55028;
          v308 = 0;
          v309 = &unk_24EE55028;
          v310 = &unk_24EE55028;
LABEL_103:
          v8 = v301;
          v17 = v320;
          break;
        default:
          v14 = v15;
          if (a4 - 7 > 1)
          {
            v322 = 0;
            v323 = 0;
            v328 = 0;
            v329 = 0;
            v330 = 0;
            v331 = 0;
            v306 = 0;
            v307 = 0;
            v325 = 0;
            v326 = 0;
            v327 = 0;
            v324 = 0;
            v99 = 0;
            v308 = 0;
            v309 = &unk_24EE55028;
            v100 = 0;
            v334 = 0;
            v313 = &unk_24EE55028;
            v314 = &unk_24EE55028;
            v101 = &unk_24EE55058;
            v315 = &unk_24EE55028;
            v102 = &unk_24EE55028;
            v304 = 0;
            v305 = &unk_24EE55058;
            v311 = &unk_24EE55028;
            v312 = &unk_24EE55058;
            v332 = &unk_24EE55028;
LABEL_233:
            v310 = &unk_24EE55028;
          }
          else
          {
            v319 = v17;
            objc_msgSend(v15, "relay");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v81, "isEnabled");
            v83 = &unk_24EE55070;
            if (!v82)
              v83 = &unk_24EE55028;
            v332 = v83;

            objc_msgSend(v15, "relay");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "relays");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "lastObject");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "HTTP3RelayURL");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "absoluteString");
            v88 = objc_claimAutoreleasedReturnValue();

            v334 = (__CFString *)v88;
            if (!v88)
            {
              objc_msgSend(v303, "relay");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "relays");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "lastObject");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "HTTP2RelayURL");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "absoluteString");
              v334 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v303, "relay");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "perApp");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "appRules");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v300 = v8;
            if (objc_msgSend(v95, "count"))
            {
              v298 = 1;
            }
            else
            {
              objc_msgSend(v303, "relay");
              v274 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v274, "matchDomains");
              v275 = (void *)objc_claimAutoreleasedReturnValue();
              v298 = objc_msgSend(v275, "count") != 0;

            }
            objc_msgSend(v303, "relay");
            v276 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v276, "matchDomains");
            v308 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v303, "relay");
            v277 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v277, "excludedDomains");
            v307 = (void *)objc_claimAutoreleasedReturnValue();

            v337 = 0u;
            v338 = 0u;
            v335 = 0u;
            v336 = 0u;
            objc_msgSend(v303, "relay");
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v278, "perApp");
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v279, "appRules");
            v280 = (void *)objc_claimAutoreleasedReturnValue();

            v281 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v335, v355, 16);
            if (v281)
            {
              v282 = v281;
              v283 = *(_QWORD *)v336;
              do
              {
                for (m = 0; m != v282; ++m)
                {
                  if (*(_QWORD *)v336 != v283)
                    objc_enumerationMutation(v280);
                  v285 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * m);
                  objc_msgSend(v285, "matchSigningIdentifier");
                  v286 = objc_claimAutoreleasedReturnValue();
                  if (v286)
                  {
                    v287 = (void *)v286;
                    objc_msgSend(v285, "matchSigningIdentifier");
                    v288 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "objectForKeyedSubscript:", v288);
                    v289 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v289)
                    {
                      objc_msgSend(v285, "matchSigningIdentifier");
                      v290 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", &stru_24EE4DF70, v290);

                    }
                  }
                }
                v282 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v335, v355, 16);
              }
              while (v282);
            }

            v322 = 0;
            v323 = 0;
            v328 = 0;
            v329 = 0;
            v330 = 0;
            v331 = 0;
            v325 = 0;
            v326 = 0;
            v327 = 0;
            v324 = 0;
            v99 = 0;
            v304 = 0;
            v101 = &unk_24EE55058;
            v313 = &unk_24EE55028;
            v314 = &unk_24EE55028;
            v20 = &unk_24EE55028;
            v315 = &unk_24EE55028;
            v102 = &unk_24EE55028;
            v305 = &unk_24EE55058;
            v306 = 0;
            v311 = &unk_24EE55028;
            v312 = &unk_24EE55058;
            v309 = &unk_24EE55028;
            v310 = &unk_24EE55028;
            v8 = v300;
            v14 = v303;
            v17 = v319;
            v100 = v298;
          }
          break;
      }
      goto LABEL_138;
    }
    v318 = v17;
    objc_msgSend(v15, "VPN");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "protocol");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    v14 = v15;
    if ((v23 & 1) != 0)
    {
      v24 = &unk_24EE55088;
    }
    else
    {
      objc_msgSend(v15, "VPN");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "protocol");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) != 0)
      {
        v24 = &unk_24EE550A0;
      }
      else
      {
        objc_msgSend(v15, "VPN");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "protocol");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v34 = objc_opt_isKindOfClass();

        if ((v34 & 1) != 0)
          v24 = &unk_24EE55058;
        else
          v24 = &unk_24EE550B8;
      }
    }
    objc_msgSend(v8, "setValue:forKey:", v24, CFSTR("VPNType"));
    objc_msgSend(v15, "VPN");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "isEnabled"))
      v36 = &unk_24EE55070;
    else
      v36 = &unk_24EE55028;
    v332 = v36;

    objc_msgSend(v15, "VPN");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "protocol");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "serverAddress");
    v334 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "VPN");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "protocol");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "username");
    v331 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "VPN");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "onDemandRules");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v15, "VPN");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isOnDemandEnabled");

      if (v44)
        v45 = &unk_24EE55070;
      else
        v45 = &unk_24EE55028;
      v315 = v45;
      objc_msgSend(v15, "VPN");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isOnDemandUserOverrideDisabled");

      if (v47)
        v48 = &unk_24EE55070;
      else
        v48 = &unk_24EE55028;
      v314 = &unk_24EE55070;
    }
    else
    {
      v314 = &unk_24EE55028;
      v315 = &unk_24EE55028;
      v48 = &unk_24EE55028;
    }
    objc_msgSend(v15, "VPN");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "protocol");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "passwordKeychainItem");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v15, "VPN");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "protocol");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "passwordKeychainItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v330 = (__CFString *)objc_msgSend(v54, "copyPassword");

    }
    else
    {
      v330 = 0;
    }
    objc_msgSend(v15, "VPN");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "protocol");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    objc_msgSend(v15, "VPN");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "protocol");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v57 & 1) != 0)
    {

      if (objc_msgSend(v59, "authenticationMethod") == 1)
      {
        v304 = 0;
        v60 = &unk_24EE55040;
      }
      else
      {
        objc_msgSend(v59, "sharedSecretKeychainItem");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69)
        {
          objc_msgSend(v59, "sharedSecretKeychainItem");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v304 = (__CFString *)objc_msgSend(v70, "copyPassword");

        }
        else
        {
          v304 = 0;
        }
        v60 = &unk_24EE55058;
      }
      v305 = v60;
      objc_msgSend(v59, "localIdentifier");
      v329 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "remoteIdentifier");
      v328 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "identityReferenceInternal");
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      if (v168)
      {
        objc_msgSend(v59, "identityReferenceInternal");
        v322 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v322 = 0;
      }
      v169 = &unk_24EE55058;
      if (objc_msgSend(v59, "useExtendedAuthentication"))
      {
        objc_msgSend(v59, "username");
        v170 = (void *)objc_claimAutoreleasedReturnValue();

        if (v170)
        {
          v169 = &unk_24EE55040;
        }
        else
        {
          objc_msgSend(v59, "identityReferenceInternal");
          v171 = (void *)objc_claimAutoreleasedReturnValue();

          if (v171)
            v169 = &unk_24EE550A0;
        }
      }
      v312 = v169;

      v323 = 0;
      v310 = &unk_24EE55028;
      v311 = &unk_24EE55028;
      v313 = &unk_24EE55028;
LABEL_124:
      objc_msgSend(v15, "VPN");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "protocol");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "proxySettings");
      v174 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = &unk_24EE55058;
      if (!v174)
      {
        v306 = 0;
        v307 = 0;
        v325 = 0;
        v326 = 0;
        v327 = 0;
        v324 = 0;
        v99 = 0;
        v100 = 0;
        v20 = &unk_24EE55028;
        v308 = 0;
        v309 = &unk_24EE55028;
LABEL_137:
        v102 = v48;
LABEL_138:
        v213 = v102;
        if (objc_msgSend(v102, "BOOLValue")
          && -[VPNConnectionStore configurationIsManaged:](v321, "configurationIsManaged:", v14))
        {
          objc_msgSend(v8, "setValue:forKey:", v213, CFSTR("VPNOnDemandUserOverrideDisabled"));
        }
        objc_msgSend(v8, "setValue:forKey:", v332, CFSTR("VPNEnabled"));
        if (v331)
          v214 = v331;
        else
          v214 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v214, CFSTR("authorization"));
        if (v334)
          v215 = v334;
        else
          v215 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v215, CFSTR("server"));
        if (v17)
          v216 = v17;
        else
          v216 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v216, CFSTR("dispName"));
        if (v304)
          v217 = v304;
        else
          v217 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v217, CFSTR("secret"));
        objc_msgSend(v8, "setValue:forKey:", v311, CFSTR("securID"));
        objc_msgSend(v8, "setValue:forKey:", &unk_24EE55040, CFSTR("encrypLevel"));
        objc_msgSend(v8, "setValue:forKey:", v312, CFSTR("eapType"));
        objc_msgSend(v8, "setValue:forKey:", v101, CFSTR("dnsType"));
        objc_msgSend(v8, "setValue:forKey:", v309, CFSTR("dnsProhibitDisablement"));
        objc_msgSend(v8, "setValue:forKey:", v305, CFSTR("authType"));
        if (v323)
          v218 = v323;
        else
          v218 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v218, CFSTR("group"));
        if (v330)
          v219 = v330;
        else
          v219 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v219, CFSTR("password"));
        objc_msgSend(v8, "setValue:forKey:", v313, CFSTR("VPNSendAllTraffic"));
        objc_msgSend(v8, "setValue:forKey:", v310, CFSTR("VPNAlwaysPrompt"));
        if (v322)
          objc_msgSend(v8, "setValue:forKey:", v322, CFSTR("VPNCertificate"));
        if (v306)
          v220 = v306;
        else
          v220 = &unk_24EE55028;
        objc_msgSend(v8, "setValue:forKey:", v220, CFSTR("VPNProxyType"));
        if (v326)
          v221 = v326;
        else
          v221 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v221, CFSTR("VPNProxyServer"));
        if (v325)
          v222 = v325;
        else
          v222 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v222, CFSTR("VPNProxyPort"));
        if (v327)
          v223 = v327;
        else
          v223 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v223, CFSTR("VPNProxyPacFile"));
        objc_msgSend(v8, "setValue:forKey:", v20, CFSTR("VPNProxyAuthenticate"));
        if (v324)
          v224 = v324;
        else
          v224 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v224, CFSTR("VPNProxyUsername"));
        objc_msgSend(v8, "setValue:forKey:", v314, CFSTR("VPNOnDemandCapable"));
        objc_msgSend(v8, "setValue:forKey:", v315, CFSTR("VPNOnDemandEnabled"));
        if (v99)
          v225 = v99;
        else
          v225 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v225, CFSTR("VPNProxyPassword"));
        objc_msgSend(v8, "setValue:forKey:", &unk_24EE55028, CFSTR("VPNPasswordRequired"));
        if (v316)
          v226 = v316;
        else
          v226 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v226, CFSTR("VPNApplicationName"));
        if (v333)
          v227 = v333;
        else
          v227 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v227, CFSTR("VPNApplicationBundleID"));
        if (v329)
          v228 = v329;
        else
          v228 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v228, CFSTR("VPNLocalIdentifier"));
        if (v328)
          v229 = v328;
        else
          v229 = &stru_24EE4DF70;
        objc_msgSend(v8, "setValue:forKey:", v229, CFSTR("VPNRemoteIdentifier"));
        v6 = v317;
        if (v100)
          objc_msgSend(v8, "setValue:forKey:", &unk_24EE55070, CFSTR("VPNIsPerApp"));
        if (objc_msgSend(v19, "count"))
          objc_msgSend(v8, "setValue:forKey:", v19, CFSTR("VPNIncludedBundleIDs"));
        if (objc_msgSend(v308, "count"))
          objc_msgSend(v8, "setValue:forKey:", v308, CFSTR("VPNMatchDomains"));
        if (objc_msgSend(v307, "count"))
          objc_msgSend(v8, "setValue:forKey:", v307, CFSTR("VPNExcludeDomains"));

        goto LABEL_200;
      }
      objc_msgSend(v15, "VPN");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "protocol");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "proxySettings");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v177, "autoProxyConfigurationEnabled");

      if ((v178 & 1) != 0)
      {
        v179 = &unk_24EE550A0;
      }
      else
      {
        objc_msgSend(v15, "VPN");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "protocol");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "proxySettings");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = objc_msgSend(v182, "HTTPEnabled");

        v179 = &unk_24EE55040;
        if (!v183)
          v179 = &unk_24EE55058;
      }
      v306 = v179;
      objc_msgSend(v15, "VPN");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "protocol");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "proxySettings");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "proxyAutoConfigURL");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "absoluteString");
      v327 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "VPN");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "protocol");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "proxySettings");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "HTTPServer");
      v191 = (void *)objc_claimAutoreleasedReturnValue();

      if (v191)
      {
        objc_msgSend(v15, "VPN");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "protocol");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "proxySettings");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "HTTPServer");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "address");
        v326 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v196 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v15, "VPN");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "protocol");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "proxySettings");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "HTTPServer");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v200, "port"));
        v325 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "VPN");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "protocol");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "proxySettings");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "HTTPServer");
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v204, "authenticationRequired");

        if (v100)
        {
          objc_msgSend(v14, "VPN");
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "protocol");
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v206, "proxySettings");
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "HTTPServer");
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v208, "username");
          v324 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "VPN");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "protocol");
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "proxySettings");
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v211, "HTTPServer");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (__CFString *)objc_msgSend(v212, "copyPassword");

          v307 = 0;
          v308 = 0;
          v100 = 0;
          v20 = &unk_24EE55070;
          v101 = &unk_24EE55058;
          v309 = &unk_24EE55028;
LABEL_136:
          v17 = v318;
          goto LABEL_137;
        }
        v324 = 0;
        v99 = 0;
        v307 = 0;
        v308 = 0;
      }
      else
      {
        v325 = 0;
        v326 = 0;
        v324 = 0;
        v99 = 0;
        v307 = 0;
        v308 = 0;
        v100 = 0;
      }
      v20 = &unk_24EE55028;
      v309 = &unk_24EE55028;
      goto LABEL_136;
    }
    objc_opt_class();
    v61 = objc_opt_isKindOfClass();

    objc_msgSend(v15, "VPN");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "protocol");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if ((v61 & 1) != 0)
    {
      objc_msgSend(v63, "sharedSecretKeychainItem");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        objc_msgSend(v15, "VPN");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "protocol");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "sharedSecretKeychainItem");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v304 = (__CFString *)objc_msgSend(v68, "copyPassword");

      }
      else
      {
        v304 = 0;
      }
      objc_msgSend(v15, "VPN");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "protocol");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "IPv4Settings");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = objc_msgSend(v161, "overridePrimary");

      if (v162)
        v163 = &unk_24EE55070;
      else
        v163 = &unk_24EE55028;
      v313 = v163;
      objc_msgSend(v15, "VPN");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "protocol");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = objc_msgSend(v165, "authenticationMethod");

      v322 = 0;
      v323 = 0;
      v328 = 0;
      v329 = 0;
      if (v166 == 2)
        v167 = &unk_24EE55070;
      else
        v167 = &unk_24EE55028;
      v305 = &unk_24EE55058;
      v311 = v167;
      v312 = &unk_24EE55058;
      v310 = &unk_24EE55028;
      v17 = v318;
      goto LABEL_124;
    }
    objc_opt_class();
    v71 = objc_opt_isKindOfClass();

    v313 = &unk_24EE55028;
    if ((v71 & 1) == 0)
    {
      v322 = 0;
      v323 = 0;
      v328 = 0;
      v329 = 0;
      v304 = 0;
      v305 = &unk_24EE55058;
      v311 = &unk_24EE55028;
      v312 = &unk_24EE55058;
      v310 = &unk_24EE55028;
      goto LABEL_124;
    }
    objc_msgSend(v15, "VPN");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "protocol");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "authenticationMethod");

    objc_msgSend(v15, "VPN");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "protocol");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v76;
    if (v74 == 1)
    {
      objc_msgSend(v76, "identityReferenceInternal");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v78)
      {
        v322 = 0;
        v323 = 0;
        v304 = 0;
LABEL_257:
        objc_msgSend(v15, "VPN");
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v294, "protocol");
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        v296 = objc_msgSend(v295, "extendedAuthPasswordPrompt");

        v328 = 0;
        v329 = 0;
        if (v296)
          v297 = &unk_24EE55070;
        else
          v297 = &unk_24EE55028;
        v310 = v297;
        v311 = &unk_24EE55028;
        v305 = &unk_24EE55058;
        v312 = &unk_24EE55058;
        goto LABEL_124;
      }
      objc_msgSend(v15, "VPN");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "protocol");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "identityReferenceInternal");
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      v323 = 0;
      v304 = 0;
    }
    else
    {
      objc_msgSend(v76, "sharedSecretKeychainItem");
      v269 = (void *)objc_claimAutoreleasedReturnValue();

      if (v269)
      {
        objc_msgSend(v15, "VPN");
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v270, "protocol");
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v271, "sharedSecretKeychainItem");
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        v304 = (__CFString *)objc_msgSend(v272, "copyPassword");

      }
      else
      {
        v304 = 0;
      }
      objc_msgSend(v15, "VPN");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v291, "protocol");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "localIdentifier");
      v293 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v293)
      {
        v322 = 0;
        v323 = 0;
        goto LABEL_257;
      }
      objc_msgSend(v15, "VPN");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "protocol");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "localIdentifier");
      v322 = 0;
      v323 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_257;
  }
LABEL_10:
  v14 = v7;
LABEL_200:

LABEL_201:
  return v8;
}

- (id)activeVPNIDWithGrade:(unint64_t)a3
{
  NSUUID *v3;
  BOOL *gradeActiveVPNIDLoaded;
  id v7;
  NSUUID **gradeActiveVPNID;
  NSUUID *v9;
  uint64_t v10;
  NSUUID *v11;
  NSUUID *v12;

  if (a3 == 2)
  {
    v3 = 0;
  }
  else
  {
    gradeActiveVPNIDLoaded = self->_gradeActiveVPNIDLoaded;
    if (!self->_gradeActiveVPNIDLoaded[a3])
    {
      v7 = -[VPNConnectionStore copyActiveVPNIDsFromPrefsForGrade:](self, "copyActiveVPNIDsFromPrefsForGrade:", a3);
      gradeActiveVPNID = self->_gradeActiveVPNID;
      v9 = self->_gradeActiveVPNID[a3];
      self->_gradeActiveVPNID[a3] = 0;

      if (v7 && objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "firstObject");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = gradeActiveVPNID[a3];
        gradeActiveVPNID[a3] = (NSUUID *)v10;

      }
      v12 = gradeActiveVPNID[a3];
      if (v12)
        LOBYTE(v12) = 1;
      else
        gradeActiveVPNID[a3] = 0;
      gradeActiveVPNIDLoaded[a3] = (char)v12;

    }
    v3 = self->_gradeActiveVPNID[a3];
  }
  return v3;
}

- (id)copyActiveVPNIDsFromPrefsForGrade:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0u;
  v43 = 0u;
  v6 = 1;
  if (a3)
    v6 = 2;
  v40 = v6;
  v41 = v5;
  v44 = 0uLL;
  v45 = 0uLL;
  -[VPNConnectionStore configurations](self, "configurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    v11 = a3 - 2;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend(v13, "grade") != 3)
        {
          switch(v11)
          {
            case 0uLL:
              objc_msgSend(v13, "appVPN");
              v14 = objc_claimAutoreleasedReturnValue();
              if (!v14)
                continue;
              v15 = (void *)v14;
              objc_msgSend(v13, "appVPN");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEnabled");

              if (!v17)
                continue;
              goto LABEL_35;
            case 1uLL:
              objc_msgSend(v13, "alwaysOnVPN");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_21;
            case 2uLL:
              objc_msgSend(v13, "dnsSettings");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_21;
            case 3uLL:
              objc_msgSend(v13, "dnsProxy");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_21;
            case 4uLL:
              objc_msgSend(v13, "contentFilter");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
              v23 = v22;

              if (v23)
                goto LABEL_40;
              continue;
            case 5uLL:
              objc_msgSend(v13, "relay");
              v24 = objc_claimAutoreleasedReturnValue();
              if (!v24)
                continue;
              v19 = (void *)v24;
              objc_msgSend(v13, "relay");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEnabled") & 1) == 0)
                goto LABEL_31;
              objc_msgSend(v13, "relay");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "matchDomains");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "count"))
              {

                goto LABEL_36;
              }
              objc_msgSend(v13, "relay");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "perApp");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "appRules");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v32, "count");

              if (!v38)
                goto LABEL_35;
              continue;
            case 6uLL:
              objc_msgSend(v13, "relay");
              v27 = objc_claimAutoreleasedReturnValue();
              if (!v27)
                continue;
              v19 = (void *)v27;
              objc_msgSend(v13, "relay");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEnabled") & 1) == 0)
                goto LABEL_31;
              objc_msgSend(v13, "relay");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "matchDomains");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v29, "count"))
              {

              }
              else
              {
                objc_msgSend(v13, "relay");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "perApp");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "appRules");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v33, "count");

                if (!v39)
                  continue;
              }
LABEL_35:
              objc_msgSend(v13, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObject:", v19);
              goto LABEL_36;
            default:
              objc_msgSend(v13, "VPN");
              v18 = objc_claimAutoreleasedReturnValue();
              if (!v18)
                continue;
              v19 = (void *)v18;
              objc_msgSend(v13, "VPN");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEnabled") & 1) != 0)
              {
                v21 = objc_msgSend(v13, "grade");

                if (v21 == v40)
                {
LABEL_40:
                  objc_msgSend(v13, "identifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "addObject:", v30);

                  goto LABEL_41;
                }
              }
              else
              {
LABEL_31:

LABEL_36:
              }
              break;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v9);
  }
LABEL_41:

  return v41;
}

- (NSArray)configurations
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (id)activeVPNIDsWithGrade:(unint64_t)a3
{
  NSUUID *v5;
  NSUUID *v6;
  BOOL v7;
  NSUUID *v9;

  if (a3 != 8 && a3 != 2)
    return 0;
  if (!self->_gradeActiveVPNIDLoaded[a3])
  {
    v5 = -[VPNConnectionStore copyActiveVPNIDsFromPrefsForGrade:](self, "copyActiveVPNIDsFromPrefsForGrade:", a3);
    v6 = self->_gradeActiveVPNID[a3];
    self->_gradeActiveVPNID[a3] = v5;

    if (self->_gradeActiveVPNID[a3])
    {
      v7 = 1;
    }
    else
    {
      self->_gradeActiveVPNID[a3] = (NSUUID *)MEMORY[0x24BDBD1A8];

      v7 = 0;
    }
    self->_gradeActiveVPNIDLoaded[a3] = v7;
  }
  v9 = self->_gradeActiveVPNID[a3];
  return v9;
}

- (id)vpnServiceTotalCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") + v7;
    -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9 + v11 + objc_msgSend(v12, "count");
    -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13 + objc_msgSend(v14, "count");

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VPNConnectionStore)init
{
  VPNConnectionStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *storeQueue;
  NSArray *configurations;
  NEConfigurationManager *v6;
  NEConfigurationManager *configurationManager;
  NEConfigurationManager *v8;
  OS_dispatch_queue *v9;
  uint64_t v10;
  NEConfigurationManager *v11;
  OS_dispatch_queue *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VPNConnectionStore;
  v2 = -[VPNConnectionStore init](&v19, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = dispatch_queue_create("MobileVPN Settings", 0);
    storeQueue = v2->_storeQueue;
    v2->_storeQueue = (OS_dispatch_queue *)v3;

    configurations = v2->_configurations;
    v2->_configurations = 0;

    v6 = (NEConfigurationManager *)objc_alloc_init(MEMORY[0x24BDE26D0]);
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = v6;

    v8 = v2->_configurationManager;
    v9 = v2->_storeQueue;
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __26__VPNConnectionStore_init__block_invoke;
    v16[3] = &unk_24EE4DD80;
    objc_copyWeak(&v17, &location);
    -[NEConfigurationManager loadConfigurationsWithCompletionQueue:handler:](v8, "loadConfigurationsWithCompletionQueue:handler:", v9, v16);
    v11 = v2->_configurationManager;
    v12 = v2->_storeQueue;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __26__VPNConnectionStore_init__block_invoke_2;
    v14[3] = &unk_24EE4DDA8;
    objc_copyWeak(&v15, &location);
    -[NEConfigurationManager setChangedQueue:andHandler:](v11, "setChangedQueue:andHandler:", v12, v14);
    v2->_vpnServiceCountDirty = 1;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __43__VPNConnectionStore__configurationChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v2 = 0;
  v22 = *MEMORY[0x24BDAC8D0];
  do
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + v2 + 8) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + v2 + 168) = 0;
    v3 = *(_QWORD *)(a1 + 32) + 8 * v2;
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

    v5 = *(_QWORD *)(a1 + 32) + 8 * v2;
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = 0;

    v7 = *(_QWORD *)(a1 + 32) + 256;
    if (*(_QWORD *)(v7 + 8 * v2))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = *(id *)(v7 + 8 * v2);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * v2 + 256), "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "optionsForServiceID:withGrade:", v13, v2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "updateWithOptions:", v15);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

    }
    ++v2;
  }
  while (v2 != 9);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("VPNNEConfigurationChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)gradePresent:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return a3 == 3;
  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "count") != 0;

  return v7;
}

+ (unint64_t)connectionTypeFromVPNType:(__CFString *)a3
{
  _BOOL4 v4;
  unint64_t v5;

  v4 = CFStringCompare(a3, (CFStringRef)*MEMORY[0x24BDF5A08], 1uLL) != kCFCompareEqualTo;
  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x24BDF59E8], 1uLL) == kCFCompareEqualTo)
    return 2;
  if (CFStringCompare(a3, CFSTR("VPN"), 1uLL) == kCFCompareEqualTo)
    return 3;
  v5 = 4 * v4;
  if (CFStringCompare(a3, CFSTR("IKEv2"), 1uLL))
    return v5;
  else
    return 4;
}

+ (__CFString)vpnTypeFromConnectionType:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
    return (__CFString *)*MEMORY[0x24BDF5A08];
  v3 = CFSTR("IKEv2");
  if (a3 == 2)
    v3 = CFSTR("IPsec");
  if (a3 == 3)
    return CFSTR("VPN");
  else
    return v3;
}

+ (id)sharedInstance
{
  void *v2;
  VPNConnectionStore *v3;
  void *v4;

  v2 = (void *)sVPNConnectionStore;
  if (!sVPNConnectionStore)
  {
    v3 = objc_alloc_init(VPNConnectionStore);
    v4 = (void *)sVPNConnectionStore;
    sVPNConnectionStore = (uint64_t)v3;

    v2 = (void *)sVPNConnectionStore;
  }
  return v2;
}

- (id)queue
{
  return self->_storeQueue;
}

void __26__VPNConnectionStore_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "storeQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __26__VPNConnectionStore_init__block_invoke_3;
  v9[3] = &unk_24EE4DD80;
  objc_copyWeak(&v10, v4);
  objc_msgSend(v6, "loadConfigurationsWithCompletionQueue:handler:", v8, v9);

  objc_destroyWeak(&v10);
}

void __26__VPNConnectionStore_init__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setConfigurations:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_configurationChanged");

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setVpnServiceCountDirty:", 1);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  if ((VPNConnectionStore *)sVPNConnectionStore == self)
  {
    sVPNConnectionStore = 0;

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboard.vpn-changed"), 0);
  v4.receiver = self;
  v4.super_class = (Class)VPNConnectionStore;
  -[VPNConnectionStore dealloc](&v4, sel_dealloc);
}

- (BOOL)disableToggle
{
  unint64_t v3;
  BOOL v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  v4 = 1;
  v5 = 0uLL;
  do
  {
    v15 = v5;
    v16 = v5;
    *((_QWORD *)&v13 + 1) = *((_QWORD *)&v5 + 1);
    v14 = v5;
    -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", v3, (_QWORD)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "onDemandAction") == 2 || !objc_msgSend(v11, "isProviderAvailable"))
          {

            return v4;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v4 = v3++ < 8;
    v5 = 0uLL;
  }
  while (v3 != 9);
  return 0;
}

- (unint64_t)aggregateStatus
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  v4 = 1;
  do
  {
    if (v3 != 6 && (v3 & 0x7FFFFFFFFFFFFFFELL) != 4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", v3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (v10)
            {
              v11 = objc_msgSend(v10, "status");
              if (v11 != v4)
              {
                if (v11 == 6)
                {
                  v4 = 6;
                }
                else
                {
                  if (v11 == 3)
                  {
                    v4 = 3;
                    goto LABEL_32;
                  }
                  if (v11 != 2 || v4 == 6)
                  {
                    if (v4 != 2 && v4 != 6 && v11 == 4)
                      v4 = 4;
                  }
                  else
                  {
                    v4 = 2;
                  }
                }
              }
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_32:

    }
    ++v3;
  }
  while (v3 != 9);
  return v4;
}

- (unint64_t)aggregateStatus:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = 1;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v9)
        {
          v10 = objc_msgSend(v9, "status");
          if (v10 != v7)
          {
            if (v10 == 6)
            {
              v7 = 6;
            }
            else
            {
              if (v10 == 3)
              {
                v7 = 3;
                goto LABEL_30;
              }
              if (v10 != 2 || v7 == 6)
              {
                if (v7 != 2 && v7 != 6 && v10 == 4)
                  v7 = 4;
              }
              else
              {
                v7 = 2;
              }
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = 1;
  }
LABEL_30:

  return v7;
}

- (id)aggregateAlert
{
  uint64_t v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  v4 = 0uLL;
  do
  {
    v15 = v4;
    v16 = v4;
    *((_QWORD *)&v13 + 1) = *((_QWORD *)&v4 + 1);
    v14 = v4;
    -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", v3, (_QWORD)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v10)
          {
            objc_msgSend(v10, "alertText");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "length"))
            {

              return v11;
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

    ++v3;
    v4 = 0uLL;
  }
  while (v3 != 9);
  return &stru_24EE4DF70;
}

- (id)aggregateStatusText
{
  unint64_t v3;
  void *v4;

  v3 = -[VPNConnectionStore aggregateStatus](self, "aggregateStatus");
  if (v3 != 1)
    goto LABEL_4;
  -[VPNConnectionStore aggregateAlert](self, "aggregateAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

LABEL_4:
    +[VPNConnection statusTextForStatus:](VPNConnection, "statusTextForStatus:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)aggregateStatusText:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[VPNConnectionStore aggregateStatus:](self, "aggregateStatus:", a3);
  if (v4 != 1)
    goto LABEL_4;
  -[VPNConnectionStore aggregateAlert](self, "aggregateAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

LABEL_4:
    +[VPNConnection statusTextForStatus:](VPNConnection, "statusTextForStatus:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)currentOnlyConnectionGrade
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[VPNConnectionStore vpnServiceTotalCount](self, "vpnServiceTotalCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "intValue") == 1)
  {
    v4 = 0;
    while (1)
    {
      -[VPNConnectionStore currentConnectionWithGrade:](self, "currentConnectionWithGrade:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        break;
      if (++v4 == 9)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v4 = 0;
  }

  return v4;
}

- (BOOL)isUserCreatedVPN:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[VPNConnectionStore configurations](self, "configurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
      if (objc_msgSend(v9, "grade") != 3)
      {
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
          break;
      }
      if (v6 == (id)++v8)
      {
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v6 = v9;

    if (!v6
      || (objc_msgSend(v6, "applicationName"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
    {
      v12 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v6, "payloadInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "profileIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v12 = 1;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    objc_msgSend(v17, "installedProfilesWithFilterFlags:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = v18;
    v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v5);
          v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v6, "payloadInfo", (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "profileIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if ((v27 & 1) != 0)
          {
            v12 = 0;
            goto LABEL_27;
          }
        }
        v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v20)
          continue;
        break;
      }
      v12 = 1;
    }
LABEL_27:

  }
  else
  {
LABEL_10:
    v12 = 0;
  }

LABEL_15:
  return v12;
}

- (BOOL)isProfileBacked:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[VPNConnectionStore configurations](self, "configurations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      if (objc_msgSend(v9, "grade") != 3)
      {
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
          break;
      }
      if (v6 == (id)++v8)
      {
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v6 = v9;

    if (!v6)
    {
      LOBYTE(v12) = 0;
      goto LABEL_16;
    }
    objc_msgSend(v6, "payloadInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "profileIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payloadInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profileIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "installedProfileWithIdentifier:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v12) = v5 != 0;
  }
  else
  {
LABEL_10:
    LOBYTE(v12) = 0;
  }

LABEL_16:
  return (char)v12;
}

- (void)_connectionsChanged
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("VPNConnectionsChangedNotification"), self);

}

- (void)removeConnection:(id)a3 withGrade:(unint64_t)a4
{
  VPNConnection *v6;
  VPNConnection **gradeCurrentConnection;
  VPNConnection *v8;
  NSMutableDictionary *v9;
  void *v10;
  VPNConnection *v11;

  v6 = (VPNConnection *)a3;
  if (a4 != 2)
  {
    gradeCurrentConnection = self->_gradeCurrentConnection;
    v11 = v6;
    if (self->_gradeCurrentConnection[a4] == v6)
    {
      -[VPNConnection disconnect](v6, "disconnect");
      v8 = gradeCurrentConnection[a4];
      gradeCurrentConnection[a4] = 0;

      self->_gradeCurrentConnectionHasBeenSet[a4] = 0;
    }
    v9 = self->_connectionDict[a4];
    -[VPNConnection serviceID](v11, "serviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    -[VPNConnectionStore _connectionsChanged](self, "_connectionsChanged");
    v6 = v11;
  }

}

- (id)currentPerAppConnections:(BOOL)a3 withGrade:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  VPNConnection *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  VPNConnection *v13;
  VPNConnection *v14;
  VPNConnection **gradeCurrentConnection;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3 && !self->_gradeCurrentConnectionHasBeenSet[a4] && !self->_gradeCurrentConnection[a4])
  {
    gradeCurrentConnection = self->_gradeCurrentConnection;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[VPNConnectionStore activeVPNIDsWithGrade:](self, "activeVPNIDsWithGrade:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          -[VPNConnectionStore connectionWithServiceID:withGrade:](self, "connectionWithServiceID:withGrade:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (!v9)
              v9 = (VPNConnection *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
            -[VPNConnection addObject:](v9, "addObject:", v12);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v13 = gradeCurrentConnection[a4];
    gradeCurrentConnection[a4] = v9;
    v14 = v9;

    self->_gradeCurrentConnectionHasBeenSet[a4] = 1;
  }
  return self->_gradeCurrentConnection[a4];
}

- (id)currentConnectionWithGrade:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;

  v6 = 0;
  if (a3 != 2 && a3 != 8)
  {
    -[VPNConnectionStore currentConnection:withGrade:](self, "currentConnection:withGrade:", 1, a3, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)currentConnectionsWithGrade:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 8 || a3 == 2)
  {
    -[VPNConnectionStore currentPerAppConnections:withGrade:](self, "currentPerAppConnections:withGrade:", 1, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VPNConnectionStore currentConnection:withGrade:](self, "currentConnection:withGrade:", 1, a3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v7[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    return v6;
  }
}

- (id)_defaultDictForType:(unint64_t)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = v5;
  if (!a3)
    objc_msgSend(v5, "setValue:forKey:", *MEMORY[0x24BDF5AC0], CFSTR("AuthenticationMethod"));
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, CFSTR("ConnectByDefault"), v11, CFSTR("Alternate Number"), v12, CFSTR("DO NOT SAVE"), v13, CFSTR("Main Number"), v8, CFSTR("EAP"), v7, CFSTR("L2TP"), v4, *MEMORY[0x24BDF5A18], v6, *MEMORY[0x24BDF5C30], 0);

  return v14;
}

- (BOOL)setOptions:(id)a3 toConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  char v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  char v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  uint64_t v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  id v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  NSObject *v208;
  uint64_t v209;
  _BOOL4 v210;
  id v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  id v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  id v238;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNGrade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v8 == 2)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNOnDemandEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNOnDemandEnabled"));
      v18 = objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject BOOLValue](v18, "BOOLValue");
      objc_msgSend(v6, "appVPN");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setOnDemandEnabled:", v20);

LABEL_12:
LABEL_16:
      LOBYTE(v19) = 1;
    }
  }
  else
  {
    if (v8 != 1)
    {
      if (v8)
      {
LABEL_62:
        LOBYTE(v19) = 0;
        goto LABEL_63;
      }
      objc_msgSend(v6, "VPN");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x24BDE2748]);
        objc_msgSend(v6, "setVPN:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNOnDemandEnabled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNOnDemandEnabled"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        objc_msgSend(v6, "VPN");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "onDemandRules");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v18 = VPNSettingsCopyLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[VPNConnectionStore setOptions:toConfiguration:].cold.2();
          goto LABEL_12;
        }
LABEL_15:
        objc_msgSend(v6, "VPN");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setOnDemandEnabled:", v15);

        goto LABEL_16;
      }
      if (v10 != 4)
      {
        if (v10 != 2)
        {
          if (!v10)
          {
            objc_msgSend(v6, "VPN");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "protocol");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v6, "VPN");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "protocol");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
                goto LABEL_62;
            }
            else
            {
              v43 = objc_alloc_init(MEMORY[0x24BDE2770]);
              objc_msgSend(v6, "VPN");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setProtocol:", v43);

            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
            v45 = objc_claimAutoreleasedReturnValue();
            if (v45
              && (v46 = (void *)v45,
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret")),
                  v47 = (void *)objc_claimAutoreleasedReturnValue(),
                  v48 = objc_msgSend(v47, "length"),
                  v47,
                  v46,
                  v48))
            {
              objc_msgSend(v6, "VPN");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "protocol");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setMachineAuthenticationMethod:", 1);

              objc_msgSend(v6, "VPN");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "protocol");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "sharedSecretKeychainItem");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                objc_msgSend(v6, "VPN");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "protocol");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "sharedSecretKeychainItem");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                v57 = (void *)objc_msgSend(v56, "copyPassword");
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v57, "isEqualToString:", v58);

                if ((v59 & 1) != 0)
                  goto LABEL_86;
              }
              objc_msgSend(v6, "VPN");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "protocol");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "sharedSecretKeychainItem");
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (v62)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "VPN");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "protocol");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "sharedSecretKeychainItem");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "setPassword:", v63);
              }
              else
              {
                v129 = objc_alloc(MEMORY[0x24BDE26F8]);
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = (void *)objc_msgSend(v129, "initWithPassword:domain:", v63, 0);
                objc_msgSend(v6, "VPN");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "protocol");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "setSharedSecretKeychainItem:", v64);
              }

            }
            else
            {
              objc_msgSend(v6, "VPN");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "protocol");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "sharedSecretKeychainItem");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setIdentifier:", 0);
            }

LABEL_86:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNSendAllTraffic"));
            v130 = (void *)objc_claimAutoreleasedReturnValue();

            if (v130)
            {
              objc_msgSend(v6, "VPN");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "protocol");
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v132, "IPv4Settings");
              v133 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v133)
              {
                v134 = objc_alloc_init(MEMORY[0x24BDE26F0]);
                objc_msgSend(v6, "VPN");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v135, "protocol");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v136, "setIPv4Settings:", v134);

              }
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNSendAllTraffic"));
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = objc_msgSend(v137, "BOOLValue");
              objc_msgSend(v6, "VPN");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "protocol");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "IPv4Settings");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v141, "setOverridePrimary:", v138);

            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("securID"));
            v142 = objc_claimAutoreleasedReturnValue();
            if (v142)
            {
              v143 = (void *)v142;
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("securID"));
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              v145 = objc_msgSend(v144, "BOOLValue");

              if (v145)
              {
                objc_msgSend(v6, "VPN");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "protocol");
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v146, "setAuthenticationMethod:", 2);
LABEL_103:

                v85 = 1;
                goto LABEL_104;
              }
            }
            objc_msgSend(v6, "VPN");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "protocol");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = 1;
            objc_msgSend(v147, "setAuthenticationMethod:", 1);

LABEL_104:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dispName"));
            v155 = objc_claimAutoreleasedReturnValue();
            if (v155)
            {
              v156 = (void *)v155;
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dispName"));
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v158 = objc_msgSend(v157, "length");

              if (v158)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dispName"));
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setName:", v159);

              }
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("server"));
            v160 = objc_claimAutoreleasedReturnValue();
            if (v160)
            {
              v161 = (void *)v160;
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("server"));
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              v163 = objc_msgSend(v162, "length");

              if (v163)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("server"));
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "VPN");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v165, "protocol");
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setServerAddress:", v164);

              }
            }
            if (v85)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authorization"));
              v167 = objc_claimAutoreleasedReturnValue();
              if (v167
                && (v168 = (void *)v167,
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authorization")),
                    v169 = (void *)objc_claimAutoreleasedReturnValue(),
                    v170 = objc_msgSend(v169, "length"),
                    v169,
                    v168,
                    v170))
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authorization"));
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "VPN");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "protocol");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "setUsername:", v171);

              }
              else
              {
                objc_msgSend(v6, "VPN");
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v171, "protocol");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "setUsername:", 0);
              }

              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
              v176 = objc_claimAutoreleasedReturnValue();
              if (v176)
              {
                v177 = (void *)v176;
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v179 = objc_msgSend(v178, "length");

                if (v179)
                {
                  objc_msgSend(v6, "VPN");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "protocol");
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v181, "passwordKeychainItem");
                  v182 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v182)
                  {
                    objc_msgSend(v6, "VPN");
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v183, "protocol");
                    v184 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v184, "passwordKeychainItem");
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    v186 = (void *)objc_msgSend(v185, "copyPassword");

                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
                    v187 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v184) = objc_msgSend(v186, "isEqualToString:", v187);

                    if ((v184 & 1) != 0)
                      goto LABEL_124;
                  }
                  objc_msgSend(v6, "VPN");
                  v188 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v188, "protocol");
                  v189 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v189, "passwordKeychainItem");
                  v190 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v190)
                  {
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
                    v191 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "VPN");
                    v192 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v192, "protocol");
                    v193 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v193, "passwordKeychainItem");
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v194, "setPassword:", v191);
                  }
                  else
                  {
                    v238 = objc_alloc(MEMORY[0x24BDE26F8]);
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
                    v191 = (void *)objc_claimAutoreleasedReturnValue();
                    v192 = (void *)objc_msgSend(v238, "initWithPassword:domain:", v191, 0);
                    objc_msgSend(v6, "VPN");
                    v193 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v193, "protocol");
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v194, "setPasswordKeychainItem:", v192);
                  }

LABEL_123:
LABEL_124:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNCertificate"));
                  v195 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v195)
                  {
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNCertificate"));
                    v196 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "VPN");
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v197, "protocol");
                    v198 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v198, "setIdentityReferenceInternal:", v196);

                  }
                  else
                  {
                    objc_msgSend(v6, "VPN");
                    v196 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v196, "protocol");
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v197, "setIdentityReferenceInternal:", 0);
                  }

                  objc_msgSend(v6, "VPN");
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v199, "protocol");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v200, "proxySettings");
                  v18 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyType"));
                  v201 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v201)
                  {
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyType"));
                    v202 = (void *)objc_claimAutoreleasedReturnValue();
                    v201 = (void *)objc_msgSend(v202, "unsignedIntegerValue");

                    if (v201 == (void *)1)
                    {
                      if (!v18)
                      {
                        v211 = objc_alloc_init(MEMORY[0x24BDE2738]);
                        objc_msgSend(v6, "VPN");
                        v212 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v212, "protocol");
                        v213 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v213, "setProxySettings:", v211);

                        objc_msgSend(v6, "VPN");
                        v214 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v214, "protocol");
                        v215 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v215, "proxySettings");
                        v18 = objc_claimAutoreleasedReturnValue();

                      }
                      -[NSObject setAutoProxyConfigurationEnabled:](v18, "setAutoProxyConfigurationEnabled:", 0);
                      -[NSObject setAutoProxyDiscovery:](v18, "setAutoProxyDiscovery:", 0);
                      -[NSObject setHTTPEnabled:](v18, "setHTTPEnabled:", 1);
                      v208 = v18;
                      v209 = 1;
                      goto LABEL_139;
                    }
                    if (v201 == (void *)2)
                    {
                      if (!v18)
                      {
                        v203 = objc_alloc_init(MEMORY[0x24BDE2738]);
                        objc_msgSend(v6, "VPN");
                        v204 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v204, "protocol");
                        v205 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v205, "setProxySettings:", v203);

                        objc_msgSend(v6, "VPN");
                        v206 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v206, "protocol");
                        v207 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v207, "proxySettings");
                        v18 = objc_claimAutoreleasedReturnValue();

                      }
                      -[NSObject setAutoProxyConfigurationEnabled:](v18, "setAutoProxyConfigurationEnabled:", 1);
                      -[NSObject setAutoProxyDiscovery:](v18, "setAutoProxyDiscovery:", 1);
                      -[NSObject setHTTPEnabled:](v18, "setHTTPEnabled:", 0);
                      v208 = v18;
                      v209 = 0;
LABEL_139:
                      -[NSObject setHTTPSEnabled:](v208, "setHTTPSEnabled:", v209);
                      v210 = v18 != 0;
LABEL_140:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPacFile"));
                      v216 = (void *)objc_claimAutoreleasedReturnValue();
                      v217 = objc_msgSend(v216, "length");

                      if (v217)
                      {
                        if (v210
                          && -[NSObject autoProxyConfigurationEnabled](v18, "autoProxyConfigurationEnabled")&& (-[NSObject HTTPEnabled](v18, "HTTPEnabled") & 1) == 0)
                        {
                          v218 = (void *)MEMORY[0x24BDBCF48];
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPacFile"));
                          v219 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v218, "URLWithString:", v219);
                          v220 = (void *)objc_claimAutoreleasedReturnValue();
                          -[NSObject setProxyAutoConfigURL:](v18, "setProxyAutoConfigURL:", v220);

                          -[NSObject setAutoProxyDiscovery:](v18, "setAutoProxyDiscovery:", 0);
                        }
                      }
                      else
                      {
                        -[NSObject setProxyAutoConfigURL:](v18, "setProxyAutoConfigURL:", 0);
                      }
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyServer"));
                      v221 = objc_claimAutoreleasedReturnValue();
                      if (v221
                        && (v222 = (void *)v221,
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPort")),
                            v223 = (void *)objc_claimAutoreleasedReturnValue(),
                            v223,
                            v222,
                            v223))
                      {
                        if (v210
                          && (-[NSObject autoProxyConfigurationEnabled](v18, "autoProxyConfigurationEnabled") & 1) == 0
                          && -[NSObject HTTPEnabled](v18, "HTTPEnabled"))
                        {
                          v224 = objc_alloc(MEMORY[0x24BDE2730]);
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyServer"));
                          v225 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPort"));
                          v226 = (void *)objc_claimAutoreleasedReturnValue();
                          v227 = (void *)objc_msgSend(v224, "initWithType:address:port:", 1, v225, (int)objc_msgSend(v226, "intValue"));

                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyAuthenticate"));
                          v228 = (void *)objc_claimAutoreleasedReturnValue();
                          LODWORD(v226) = objc_msgSend(v228, "BOOLValue");

                          if ((_DWORD)v226)
                          {
                            objc_msgSend(v227, "setAuthenticationRequired:", 1);
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyUsername"));
                            v229 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v227, "setUsername:", v229);

                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPassword"));
                            v230 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v227, "setPassword:", v230);

                          }
                          -[NSObject setHTTPServer:](v18, "setHTTPServer:", v227);
                          v231 = objc_alloc(MEMORY[0x24BDE2730]);
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyServer"));
                          v232 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPort"));
                          v233 = (void *)objc_claimAutoreleasedReturnValue();
                          v234 = (void *)objc_msgSend(v231, "initWithType:address:port:", 2, v232, (int)objc_msgSend(v233, "intValue"));

                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyAuthenticate"));
                          v235 = (void *)objc_claimAutoreleasedReturnValue();
                          LODWORD(v233) = objc_msgSend(v235, "BOOLValue");

                          if ((_DWORD)v233)
                          {
                            objc_msgSend(v234, "setAuthenticationRequired:", 1);
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyUsername"));
                            v236 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v234, "setUsername:", v236);

                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNProxyPassword"));
                            v237 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v234, "setPassword:", v237);

                          }
                          -[NSObject setHTTPSServer:](v18, "setHTTPSServer:", v234);

                        }
                      }
                      else
                      {
                        -[NSObject setHTTPServer:](v18, "setHTTPServer:", 0);
                        -[NSObject setHTTPSServer:](v18, "setHTTPSServer:", 0);
                      }
                      goto LABEL_12;
                    }
                  }
                  v210 = v18 != 0;
                  if (!v201 && v18)
                  {
                    -[NSObject setAutoProxyConfigurationEnabled:](v18, "setAutoProxyConfigurationEnabled:", 0);
                    -[NSObject setAutoProxyDiscovery:](v18, "setAutoProxyDiscovery:", 0);
                    -[NSObject setHTTPEnabled:](v18, "setHTTPEnabled:", 0);
                    -[NSObject setHTTPSEnabled:](v18, "setHTTPSEnabled:", 0);
                    v210 = 1;
                  }
                  goto LABEL_140;
                }
              }
            }
            else
            {
              objc_msgSend(v6, "VPN");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "protocol");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "setUsername:", 0);

            }
            objc_msgSend(v6, "VPN");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v191, "protocol");
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "passwordKeychainItem");
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "setIdentifier:", 0);
            goto LABEL_123;
          }
          v31 = VPNSettingsCopyLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[VPNConnectionStore setOptions:toConfiguration:].cold.1();
          goto LABEL_61;
        }
        objc_msgSend(v6, "VPN");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "protocol");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          v86 = objc_alloc_init(MEMORY[0x24BDE2768]);
          objc_msgSend(v6, "VPN");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setProtocol:", v86);

          goto LABEL_58;
        }
        objc_msgSend(v6, "VPN");
        v31 = objc_claimAutoreleasedReturnValue();
        -[NSObject protocol](v31, "protocol");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "VPN");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "protocol");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v42 = objc_opt_isKindOfClass();

          if ((v42 & 1) != 0)
            goto LABEL_62;
LABEL_58:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNCertificate"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "VPN");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "protocol");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v90;
          if (v88)
          {
            v85 = 1;
            objc_msgSend(v90, "setAuthenticationMethod:", 1);

            objc_msgSend(v6, "VPN");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "protocol");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "sharedSecretKeychainItem");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setIdentifier:", 0);

            objc_msgSend(v6, "VPN");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "protocol");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setLocalIdentifier:", 0);

            goto LABEL_104;
          }
          objc_msgSend(v90, "setAuthenticationMethod:", 2);

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
          v109 = objc_claimAutoreleasedReturnValue();
          if (v109
            && (v110 = (void *)v109,
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret")),
                v111 = (void *)objc_claimAutoreleasedReturnValue(),
                v112 = objc_msgSend(v111, "length"),
                v111,
                v110,
                v112))
          {
            objc_msgSend(v6, "VPN");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "protocol");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "sharedSecretKeychainItem");
            v115 = (void *)objc_claimAutoreleasedReturnValue();

            if (v115)
            {
              objc_msgSend(v6, "VPN");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "protocol");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "sharedSecretKeychainItem");
              v118 = (void *)objc_claimAutoreleasedReturnValue();

              v119 = (void *)objc_msgSend(v118, "copyPassword");
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_msgSend(v119, "isEqualToString:", v120);

              if ((v121 & 1) != 0)
              {
LABEL_99:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("group"));
                v150 = objc_claimAutoreleasedReturnValue();
                if (v150
                  && (v151 = (void *)v150,
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("group")),
                      v152 = (void *)objc_claimAutoreleasedReturnValue(),
                      v153 = objc_msgSend(v152, "length"),
                      v152,
                      v151,
                      v153))
                {
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("group"));
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "VPN");
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "protocol");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v154, "setLocalIdentifier:", v70);

                }
                else
                {
                  objc_msgSend(v6, "VPN");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "protocol");
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "setLocalIdentifier:", 0);
                }
                goto LABEL_103;
              }
            }
            objc_msgSend(v6, "VPN");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "protocol");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "sharedSecretKeychainItem");
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            if (v124)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "VPN");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "protocol");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "sharedSecretKeychainItem");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "setPassword:", v125);
            }
            else
            {
              v149 = objc_alloc(MEMORY[0x24BDE26F8]);
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v126 = (void *)objc_msgSend(v149, "initWithPassword:domain:", v125, 0);
              objc_msgSend(v6, "VPN");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "protocol");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "setSharedSecretKeychainItem:", v126);
            }

          }
          else
          {
            objc_msgSend(v6, "VPN");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "protocol");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "sharedSecretKeychainItem");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "setIdentifier:", 0);
          }

          goto LABEL_99;
        }

LABEL_61:
        goto LABEL_62;
      }
      objc_msgSend(v6, "VPN");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "protocol");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v6, "VPN");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "protocol");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v36 = objc_opt_isKindOfClass();

        if ((v36 & 1) == 0)
          goto LABEL_62;
      }
      else
      {
        v67 = objc_alloc_init(MEMORY[0x24BDE2760]);
        objc_msgSend(v6, "VPN");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setProtocol:", v67);

      }
      objc_msgSend(v6, "VPN");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "protocol");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNLocalIdentifier"));
      v71 = objc_claimAutoreleasedReturnValue();
      if (v71
        && (v72 = (void *)v71,
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNLocalIdentifier")),
            v73 = (void *)objc_claimAutoreleasedReturnValue(),
            v74 = objc_msgSend(v73, "length"),
            v73,
            v72,
            v74))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNLocalIdentifier"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setLocalIdentifier:", v75);

      }
      else
      {
        objc_msgSend(v70, "setLocalIdentifier:", 0);
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNRemoteIdentifier"));
      v76 = objc_claimAutoreleasedReturnValue();
      if (v76
        && (v77 = (void *)v76,
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNRemoteIdentifier")),
            v78 = (void *)objc_claimAutoreleasedReturnValue(),
            v79 = objc_msgSend(v78, "length"),
            v78,
            v77,
            v79))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNRemoteIdentifier"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setRemoteIdentifier:", v80);

      }
      else
      {
        objc_msgSend(v70, "setRemoteIdentifier:", 0);
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eapType"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eapType"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = (void *)objc_msgSend(v82, "unsignedIntegerValue");

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authType"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (v83)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authType"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (void *)objc_msgSend(v84, "unsignedIntegerValue");

      }
      if (v81)
      {
        objc_msgSend(v70, "setUseExtendedAuthentication:", 1);
        v85 = v81 != (void *)2;
      }
      else
      {
        objc_msgSend(v70, "setUseExtendedAuthentication:", 0);
        v85 = 0;
      }
      if (v83 == (void *)1)
      {
        objc_msgSend(v70, "setAuthenticationMethod:", 1);
      }
      else
      {
        objc_msgSend(v70, "setAuthenticationMethod:", 2);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
        v97 = objc_claimAutoreleasedReturnValue();
        if (v97)
        {
          v98 = (void *)v97;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v99, "length");

          if (v100)
          {
            objc_msgSend(v70, "sharedSecretKeychainItem");
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            if (v101)
            {
              objc_msgSend(v70, "sharedSecretKeychainItem");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = (void *)objc_msgSend(v102, "copyPassword");
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = objc_msgSend(v103, "isEqualToString:", v104);

              if ((v105 & 1) != 0)
                goto LABEL_75;
            }
            objc_msgSend(v70, "sharedSecretKeychainItem");
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            if (v106)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "sharedSecretKeychainItem");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setPassword:", v107);
            }
            else
            {
              v148 = objc_alloc(MEMORY[0x24BDE26F8]);
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secret"));
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = (void *)objc_msgSend(v148, "initWithPassword:domain:", v107, 0);
              objc_msgSend(v70, "setSharedSecretKeychainItem:", v108);
            }

LABEL_74:
LABEL_75:
            objc_msgSend(v70, "setDefaultsForUIConfiguration");
            goto LABEL_104;
          }
        }
      }
      objc_msgSend(v70, "sharedSecretKeychainItem");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setIdentifier:", 0);
      goto LABEL_74;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNOnDemandEnabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VPNOnDemandEnabled"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v22, "BOOLValue");

      objc_msgSend(v6, "VPN");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "onDemandRules");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        goto LABEL_15;
      v31 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[VPNConnectionStore setOptions:toConfiguration:].cold.2();
      goto LABEL_61;
    }
  }
LABEL_63:

  return (char)v19;
}

- (BOOL)createVPNWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  VPNConnectionStore *v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dispName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDE26C8]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dispName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:grade:", v7, 1);

    v9 = -[VPNConnectionStore setOptions:toConfiguration:](self, "setOptions:toConfiguration:", v4, v8);
    if (v9)
    {
      -[VPNConnectionStore configurationManager](self, "configurationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNConnectionStore storeQueue](self, "storeQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __43__VPNConnectionStore_createVPNWithOptions___block_invoke;
      v13[3] = &unk_24EE4DDF8;
      v14 = v8;
      v15 = self;
      objc_msgSend(v10, "saveConfiguration:withCompletionQueue:handler:", v14, v11, v13);

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

void __43__VPNConnectionStore_createVPNWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configurationManager");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__VPNConnectionStore_createVPNWithOptions___block_invoke_139;
    v7[3] = &unk_24EE4DDD0;
    v7[4] = *(_QWORD *)(a1 + 40);
    -[NSObject loadConfigurationsWithCompletionQueue:handler:](v5, "loadConfigurationsWithCompletionQueue:handler:", v6, v7);

  }
}

uint64_t __43__VPNConnectionStore_createVPNWithOptions___block_invoke_139(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfigurations:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_configurationChanged");
  return objc_msgSend(*(id *)(a1 + 32), "setVpnServiceCountDirty:", 1);
}

- (BOOL)updateVPNWithServiceID:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  VPNConnectionStore *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VPNConnectionStore configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
      if (objc_msgSend(v12, "grade") != 3)
      {
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v6);

        if ((v14 & 1) != 0)
          break;
      }
      if (v9 == (id)++v11)
      {
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v9 = v12;

    if (v9 && -[VPNConnectionStore setOptions:toConfiguration:](self, "setOptions:toConfiguration:", v7, v9))
    {
      -[VPNConnectionStore configurationManager](self, "configurationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNConnectionStore storeQueue](self, "storeQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke;
      v19[3] = &unk_24EE4DDF8;
      v9 = v9;
      v20 = v9;
      v21 = self;
      objc_msgSend(v16, "saveConfiguration:withCompletionQueue:handler:", v9, v17, v19);

      v15 = 1;
      v8 = v20;
      goto LABEL_14;
    }
    v15 = 0;
  }
  else
  {
LABEL_10:
    v15 = 0;
LABEL_14:

  }
  return v15;
}

void __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configurationManager");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke_141;
    v7[3] = &unk_24EE4DDD0;
    v7[4] = *(_QWORD *)(a1 + 40);
    -[NSObject loadConfigurationsWithCompletionQueue:handler:](v5, "loadConfigurationsWithCompletionQueue:handler:", v6, v7);

  }
}

uint64_t __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke_141(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfigurations:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_configurationChanged");
  return objc_msgSend(*(id *)(a1 + 32), "setVpnServiceCountDirty:", 1);
}

- (BOOL)deleteVPNWithServiceID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  VPNConnectionStore *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[VPNConnectionStore configurations](self, "configurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
      if (objc_msgSend(v10, "grade") != 3)
      {
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v14 = v10;

    if (v14)
    {
      -[VPNConnectionStore configurationManager](self, "configurationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNConnectionStore storeQueue](self, "storeQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke;
      v18[3] = &unk_24EE4DDF8;
      v19 = v14;
      v20 = self;
      v5 = v14;
      objc_msgSend(v15, "removeConfiguration:withCompletionQueue:handler:", v5, v16, v18);

      v13 = 1;
      goto LABEL_13;
    }
    v13 = 0;
  }
  else
  {
LABEL_10:
    v13 = 0;
LABEL_13:

  }
  return v13;
}

void __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configurationManager");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_142;
    v7[3] = &unk_24EE4DDD0;
    v7[4] = *(_QWORD *)(a1 + 40);
    -[NSObject loadConfigurationsWithCompletionQueue:handler:](v5, "loadConfigurationsWithCompletionQueue:handler:", v6, v7);

  }
}

uint64_t __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_142(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfigurations:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_configurationChanged");
  return objc_msgSend(*(id *)(a1 + 32), "setVpnServiceCountDirty:", 1);
}

- (BOOL)configurationIsManaged:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "payloadInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "payloadInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "profileSource");

    objc_msgSend(v3, "payloadInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v9 = objc_msgSend(v7, "profileSource") == 2;
      v10 = v8;
    }
    else
    {
      objc_msgSend(v7, "profileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "installedProfileWithIdentifier:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          v9 = objc_msgSend(v12, "isManagedByMDM");
        else
          v9 = 0;

      }
      else
      {
        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setActiveVPNID:(id)a3 withGrade:(unint64_t)a4
{
  id v7;
  Class *v8;
  id *v9;
  Class v10;
  id *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;

  v7 = a3;
  if (a4 != 2)
  {
    v8 = &self->super.isa + a4;
    v10 = v8[12];
    v9 = (id *)(v8 + 12);
    if ((-[objc_class isEqual:](v10, "isEqual:", v7) & 1) == 0)
    {
      if (-[VPNConnectionStore saveActiveVPNIDToPreferences:withGrade:](self, "saveActiveVPNIDToPreferences:withGrade:", v7, a4))
      {
        v11 = (id *)(&self->super.isa + a4);
        objc_msgSend(v11[3], "disconnect");
        objc_storeStrong(v9, a3);
        -[VPNConnectionStore connectionWithServiceID:withGrade:](self, "connectionWithServiceID:withGrade:", *v9, a4);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v11[3];
        v11[3] = (id)v12;

        -[VPNConnectionStore _connectionsChanged](self, "_connectionsChanged");
      }
      else
      {
        v14 = VPNSettingsCopyLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[VPNConnectionStore setActiveVPNID:withGrade:].cold.1();

      }
    }
  }

}

- (BOOL)isActiveVPNID:(id)a3 withGrade:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[VPNConnectionStore activeVPNIDWithGrade:](self, "activeVPNIDWithGrade:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "isEqual:", v6);

  return (char)self;
}

- (BOOL)alwaysOnToggleEnabledForServiceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VPNConnectionStore configurations](self, "configurations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      if (objc_msgSend(v9, "grade") != 3)
      {
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
          break;
      }
      if (v6 == (id)++v8)
      {
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v6 = v9;

    if (v6)
    {
      objc_msgSend(v6, "alwaysOnVPN");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "alwaysOnVPN");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "isToggleEnabled");
        goto LABEL_14;
      }
    }
    v12 = 0;
  }
  else
  {
LABEL_10:
    v12 = 0;
LABEL_14:

  }
  return v12;
}

- (id)organizationForServiceID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[VPNConnectionStore configurations](self, "configurations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
      if (objc_msgSend(v10, "grade") != 3)
      {
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_15;
    objc_msgSend(v13, "payloadInfo");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v13, "payloadInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "payloadOrganization");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v13, "payloadInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "payloadOrganization");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
    objc_msgSend(v13, "applicationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v13, "applicationName");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "appVPN");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = 2;
      }
      else
      {
        objc_msgSend(v13, "dnsProxy");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v24 = 5;
        }
        else
        {
          objc_msgSend(v13, "contentFilter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            v24 = 6;
          else
            v24 = 0;
        }
      }
      +[VPNConnectionStore applicationNameForConfiguration:withGrade:](VPNConnectionStore, "applicationNameForConfiguration:withGrade:", v13, v24);
      v20 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_10:

LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CUSTOM"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v20;
LABEL_17:

  return v19;
}

- (id)organizationForService:(__SCNetworkService *)a3
{
  const __SCNetworkProtocol *v3;
  const __SCNetworkProtocol *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = SCNetworkServiceCopyProtocol(a3, CFSTR("com.apple.payload"));
  if (v3)
  {
    v4 = v3;
    SCNetworkProtocolGetConfiguration(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v4);

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)getProfileIDForServiceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VPNConnectionStore configurations](self, "configurations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "grade") != 3)
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            objc_msgSend(v9, "payloadInfo");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "profileIdentifier");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)vpnServicesForCurrentSetWithGrade:(unint64_t)a3 excludePerApp:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(void *, void *);
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v68;
  id v69;
  VPNConnectionStore *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  _BOOL4 v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v78 = a4;
  v96 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[VPNConnectionStore configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_76;
  v69 = v8;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  if ((unint64_t)objc_msgSend(v9, "count") <= 0x20)
    v10 = compareConfigurationNames;
  else
    v10 = compareConfigurationNamesNonLocalized;
  objc_msgSend(v9, "sortUsingFunction:context:", v10, 0);
  v11 = 1;
  if (a3)
    v11 = 2;
  v76 = v11;
  v77 = v7;
  v80 = v6;
  v70 = self;
  v71 = a3;
  if (a3 == 4)
  {
    v91 = 0uLL;
    v92 = 0uLL;
    v89 = 0uLL;
    v90 = 0uLL;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    if (v13)
    {
      v14 = v13;
      v15 = v9;
      v16 = 0;
      v17 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v90 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          if (objc_msgSend(v19, "grade") != 3)
          {
            objc_msgSend(v19, "dnsSettings");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (void *)v20;
              v22 = objc_msgSend(v19, "grade");

              if (v22 == 1)
              {
                objc_msgSend(v19, "identifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v23);

                v16 = 1;
              }
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      }
      while (v14);

      v9 = v15;
      if ((v16 & 1) != 0)
        goto LABEL_73;
    }
    else
    {

    }
    v68 = v9;
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v57 = v12;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v86 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          if (objc_msgSend(v62, "grade") != 3)
          {
            objc_msgSend(v62, "dnsSettings");
            v63 = objc_claimAutoreleasedReturnValue();
            if (v63)
            {
              v64 = (void *)v63;
              v65 = objc_msgSend(v62, "grade");

              if (v65 == 2)
              {
                objc_msgSend(v62, "identifier");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v66);

              }
            }
          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      }
      while (v59);
    }
  }
  else
  {
    v83 = 0uLL;
    v84 = 0uLL;
    v81 = 0uLL;
    v82 = 0uLL;
    v68 = v9;
    v24 = v9;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    v26 = v78;
    if (v25)
    {
      v27 = v25;
      v28 = *(_QWORD *)v82;
      v79 = v24;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v82 != v28)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
          if (objc_msgSend(v30, "grade") != 3)
          {
            if (!v26
              || (objc_msgSend(v30, "externalIdentifier"),
                  v31 = (void *)objc_claimAutoreleasedReturnValue(),
                  v31,
                  !v31))
            {
              switch(v71)
              {
                case 2uLL:
                  objc_msgSend(v30, "appVPN");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v32)
                  {
                    objc_msgSend(v30, "appVPN");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "isEnabled");

                    objc_msgSend(v30, "identifier");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v34)
                      v36 = v80;
                    else
                      v36 = v77;
                    objc_msgSend(v36, "addObject:", v35);
                    goto LABEL_56;
                  }
                  continue;
                case 3uLL:
                  objc_msgSend(v30, "alwaysOnVPN");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_39;
                case 5uLL:
                  objc_msgSend(v30, "dnsProxy");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_39;
                case 6uLL:
                  objc_msgSend(v30, "contentFilter");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
                  v42 = v37;

                  if (v42)
                    goto LABEL_40;
                  continue;
                case 7uLL:
                  objc_msgSend(v30, "relay");
                  v43 = objc_claimAutoreleasedReturnValue();
                  if (!v43)
                    continue;
                  v35 = (void *)v43;
                  objc_msgSend(v30, "relay");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "matchDomains");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v45, "count"))
                  {

                    goto LABEL_56;
                  }
                  objc_msgSend(v30, "relay");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "perApp");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "appRules");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = objc_msgSend(v51, "count");

                  v24 = v79;
                  v26 = v78;

                  if (!v74)
                  {
LABEL_40:
                    objc_msgSend(v30, "identifier");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "addObject:", v35);
                    goto LABEL_56;
                  }
                  continue;
                case 8uLL:
                  objc_msgSend(v30, "relay");
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (!v46)
                    continue;
                  v47 = (void *)v46;
                  objc_msgSend(v30, "relay");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "matchDomains");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v49, "count"))
                  {

                  }
                  else
                  {
                    objc_msgSend(v30, "relay");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "perApp");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "appRules");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = objc_msgSend(v53, "count");

                    v24 = v79;
                    v26 = v78;

                    if (!v75)
                      continue;
                  }
                  objc_msgSend(v30, "relay");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = objc_msgSend(v54, "isEnabled");

                  objc_msgSend(v30, "identifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v55)
                    v56 = v80;
                  else
                    v56 = v77;
                  objc_msgSend(v56, "addObject:", v35);
                  v26 = v78;
                  v24 = v79;
LABEL_56:

                  break;
                default:
                  objc_msgSend(v30, "VPN");
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (!v38)
                    continue;
                  v39 = (void *)v38;
                  v40 = objc_msgSend(v30, "grade");

                  v41 = v40 == v76;
                  v24 = v79;
                  if (!v41)
                    continue;
                  goto LABEL_40;
              }
            }
          }
        }
        v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
      }
      while (v27);
    }
  }
  v9 = v68;

  v6 = v80;
LABEL_73:
  v7 = v77;
  if (objc_msgSend(v77, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v77);
  objc_storeStrong((id *)&v70->_gradeVPNServiceIDs[v71], v6);

  v8 = v69;
LABEL_76:

  return v6;
}

- (id)vpnServicesForCurrentSetWithGrade:(unint64_t)a3
{
  return -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:excludePerApp:](self, "vpnServicesForCurrentSetWithGrade:excludePerApp:", a3, 0);
}

- (id)vpnServiceCountWithGrade:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appNameForServiceID:(id)a3 withGrade:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[VPNConnectionStore configurations](self, "configurations", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "grade") != 3)
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v6);

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  +[VPNConnectionStore applicationNameForConfiguration:withGrade:](VPNConnectionStore, "applicationNameForConfiguration:withGrade:", v8, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)enable:(BOOL)a3 serviceID:(id)a4 withGrade:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  _BOOL8 v18;
  BOOL v19;
  VPNConnectionStore *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  VPNConnectionStore *v32;
  _QWORD v33[4];
  id v34;
  VPNConnectionStore *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v6 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[VPNConnectionStore configurations](self, "configurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v32 = self;
    v11 = v6;
    v12 = *(_QWORD *)v37;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
      if (objc_msgSend(v14, "grade") != 3)
      {
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v8);

        if ((v16 & 1) != 0)
          break;
      }
      if (v10 == (id)++v13)
      {
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v10 = v14;

    if (!v10)
    {
LABEL_33:
      v17 = 0;
      goto LABEL_34;
    }
    v18 = v11;
    switch(a5)
    {
      case 0uLL:
        v19 = objc_msgSend(v10, "grade") == 1;
        goto LABEL_18;
      case 1uLL:
        v19 = objc_msgSend(v10, "grade") == 2;
LABEL_18:
        v20 = v32;
        if (!v19)
          goto LABEL_33;
        objc_msgSend(v10, "VPN");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_33;
        objc_msgSend(v10, "VPN");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      case 2uLL:
        objc_msgSend(v10, "appVPN");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v32;
        if (!v24)
          goto LABEL_33;
        objc_msgSend(v10, "appVPN");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      case 3uLL:
        objc_msgSend(v10, "alwaysOnVPN");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v32;
        if (!v25)
          goto LABEL_33;
        objc_msgSend(v10, "alwaysOnVPN");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      case 4uLL:
        objc_msgSend(v10, "dnsSettings");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v32;
        if (!v26)
          goto LABEL_33;
        objc_msgSend(v10, "dnsSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      case 5uLL:
        objc_msgSend(v10, "dnsProxy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v32;
        if (!v27)
          goto LABEL_33;
        objc_msgSend(v10, "dnsProxy");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      default:
        v18 = v11;
        v20 = v32;
        if (a5 - 7 > 1)
          goto LABEL_31;
        objc_msgSend(v10, "relay");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_33;
        objc_msgSend(v10, "relay");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
        v28 = v22;
        objc_msgSend(v22, "setEnabled:", v18);

LABEL_31:
        -[VPNConnectionStore configurationManager](v20, "configurationManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNConnectionStore storeQueue](v20, "storeQueue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke;
        v33[3] = &unk_24EE4DDF8;
        v10 = v10;
        v34 = v10;
        v35 = v20;
        objc_msgSend(v29, "saveConfiguration:withCompletionQueue:handler:", v10, v30, v33);

        v17 = 1;
        v9 = v34;
        break;
    }
  }
  else
  {
LABEL_10:
    v17 = 0;
  }

LABEL_34:
  return v17;
}

void __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configurationManager");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke_167;
    v7[3] = &unk_24EE4DDD0;
    v7[4] = *(_QWORD *)(a1 + 40);
    -[NSObject loadConfigurationsWithCompletionQueue:handler:](v5, "loadConfigurationsWithCompletionQueue:handler:", v6, v7);

  }
}

uint64_t __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke_167(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfigurations:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_configurationChanged");
  return objc_msgSend(*(id *)(a1 + 32), "setVpnServiceCountDirty:", 1);
}

- (BOOL)isTypeEnabledWithServiceID:(id)a3 withGrade:(unint64_t)a4 outProviderAvailable:(BOOL *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  __CFString *v33;
  uint64_t i;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  const __SCPreferences *v50;
  const __SCPreferences *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a5)
    *a5 = 1;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[VPNConnectionStore configurations](self, "configurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v60;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v13);
      if (objc_msgSend(v14, "grade") != 3)
      {
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v8);

        if ((v16 & 1) != 0)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        if (v11)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    v17 = v14;

    if (!v17)
      goto LABEL_49;
    if (a4 <= 1)
    {
      objc_msgSend(v17, "VPN");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_49;
      objc_msgSend(v17, "VPN");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "protocol");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v17, "VPN");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      goto LABEL_48;
    }
    switch(a4)
    {
      case 4uLL:
        objc_msgSend(v17, "dnsSettings");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3uLL:
        objc_msgSend(v17, "alwaysOnVPN");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2uLL:
        objc_msgSend(v17, "appVPN");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
          goto LABEL_49;
        objc_msgSend(v17, "appVPN");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "protocol");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v45 = objc_opt_isKindOfClass();

        if ((v45 & 1) != 0)
        {
          objc_msgSend(v17, "appVPN");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
          v23 = v22;
          objc_msgSend(v22, "protocol");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "pluginType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_50;
          objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "appState");
            v28 = objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v29 = (void *)v28;
              objc_msgSend(v27, "appState");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v30, "isInstalled") & 1) != 0)
              {
                objc_msgSend(v27, "appState");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "isValid");

                if (v32)
                {
                  if (!a5)
                  {
                    v48 = 1;
                    goto LABEL_57;
                  }
                  objc_msgSend(v27, "plugInKitPlugins");
                  v55 = 0u;
                  v56 = 0u;
                  v57 = 0u;
                  v58 = 0u;
                  v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  v54 = -[__CFString countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
                  if (v54)
                  {
                    v52 = v27;
                    v53 = *(_QWORD *)v56;
                    while (2)
                    {
                      for (i = 0; i != v54; ++i)
                      {
                        if (*(_QWORD *)v56 != v53)
                          objc_enumerationMutation(v33);
                        v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                        if (a4 > 1)
                        {
                          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "protocol");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.networkextension.packet-tunnel")))
                          {

LABEL_61:
                            v41 = 1;
                            goto LABEL_62;
                          }
                          objc_msgSend(v35, "protocol");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.networkextension.app-proxy"));

                          if ((v40 & 1) != 0)
                            goto LABEL_61;
                        }
                        else
                        {
                          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "protocol");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.networkextension.packet-tunnel"));

                          if ((v37 & 1) != 0)
                            goto LABEL_61;
                        }
                      }
                      v54 = -[__CFString countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
                      if (v54)
                        continue;
                      break;
                    }
                    v41 = 0;
LABEL_62:
                    v27 = v52;
                  }
                  else
                  {
                    v41 = 0;
                  }

                  *a5 = v41;
                  v48 = 1;
LABEL_56:

LABEL_57:
                  goto LABEL_51;
                }
              }
              else
              {

              }
            }
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VPN-%@.plist"), v25);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v50 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.mobilevpn"), v33);
          if (v50)
          {
            v51 = v50;
            v48 = objc_msgSend((id)SCPreferencesGetValue(v50, CFSTR("Enabled")), "BOOLValue");
            CFRelease(v51);
          }
          else
          {
            v48 = 0;
            *a5 = 0;
          }
          goto LABEL_56;
        }
LABEL_48:
        v25 = 0;
        v48 = 1;
        goto LABEL_51;
      default:
        if (a4 - 7 > 1)
          goto LABEL_49;
        objc_msgSend(v17, "relay");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
    v47 = v46;

    if (!v47)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_12:

  v17 = 0;
LABEL_49:
  v25 = 0;
LABEL_50:
  v48 = 0;
LABEL_51:

  return v48;
}

- (BOOL)isEnabledWithServiceID:(id)a3 withGrade:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[VPNConnectionStore configurations](self, "configurations", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
      if (objc_msgSend(v11, "grade") != 3)
      {
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v6);

        if ((v13 & 1) != 0)
          break;
      }
      if (v8 == (id)++v10)
      {
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v8 = v11;

    if (!v8)
    {
LABEL_33:
      v14 = 0;
      goto LABEL_34;
    }
    switch(a4)
    {
      case 0uLL:
        if (objc_msgSend(v8, "grade") != 1)
          goto LABEL_33;
        goto LABEL_19;
      case 1uLL:
        if (objc_msgSend(v8, "grade") != 2)
          goto LABEL_33;
LABEL_19:
        objc_msgSend(v8, "VPN");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_33;
        objc_msgSend(v8, "VPN");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
        v7 = v16;
        v14 = objc_msgSend(v16, "isEnabled");
        break;
      case 2uLL:
        objc_msgSend(v8, "appVPN");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_33;
        objc_msgSend(v8, "appVPN");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 3uLL:
        objc_msgSend(v8, "alwaysOnVPN");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          goto LABEL_33;
        objc_msgSend(v8, "alwaysOnVPN");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 4uLL:
        objc_msgSend(v8, "dnsSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_33;
        objc_msgSend(v8, "dnsSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 5uLL:
        objc_msgSend(v8, "dnsProxy");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_33;
        objc_msgSend(v8, "dnsProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 6uLL:
        objc_msgSend(v8, "contentFilter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_33;
        objc_msgSend(v8, "contentFilter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      default:
        if (a4 - 7 > 1)
          goto LABEL_33;
        objc_msgSend(v8, "relay");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_33;
        objc_msgSend(v8, "relay");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
    }
  }
  else
  {
LABEL_10:
    v14 = 0;
  }

LABEL_34:
  return v14;
}

+ (id)applicationNameForConfiguration:(id)a3 withGrade:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v5 = a3;
  objc_msgSend(v5, "applicationName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (!v5 || v6)
    goto LABEL_19;
  if (a4 <= 1)
  {
    objc_msgSend(v5, "VPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "VPN");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  switch(a4)
  {
    case 6uLL:
      objc_msgSend(v5, "application");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_16;
      goto LABEL_19;
    case 5uLL:
      objc_msgSend(v5, "dnsProxy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "protocol");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
        goto LABEL_18;
      objc_msgSend(v5, "dnsProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(v5, "appVPN");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocol");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
        goto LABEL_18;
      objc_msgSend(v5, "appVPN");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_18;
  }
LABEL_15:
  v18 = v11;
  objc_msgSend(v11, "protocol");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pluginType");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_16:
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.cisco.anyconnect.applevpn.plugin")) & 1) != 0)
    {
      v20 = CFSTR("com.cisco.Cisco-AnyConnect.vpnplugin");
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("net.juniper.sslvpn")))
      {
LABEL_24:
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v22, "count") >= 4
          && (objc_msgSend(v22, "lastObject"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("vpnplugin")),
              v23,
              (v24 & 1) != 0))
        {
          v25 = -2;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v22, "count") < 3)
            goto LABEL_30;
          v25 = -1;
        }
        objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v22, "count") + v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(" "));
        v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
        v7 = v7;

        if (!v7)
          goto LABEL_31;
        goto LABEL_20;
      }
      v20 = CFSTR("net.juniper.Junos-Pulse.vpnplugin");
    }

    v7 = (id)v20;
    goto LABEL_24;
  }
LABEL_19:
  if (!v7)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
LABEL_20:
  v21 = v7;
LABEL_32:

  return v21;
}

- (void)triggerLocalAuthenticationForConfigurationIdentifier:(id)a3 requestedByApp:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD1880];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", v8);

  if (v9)
  {
    -[VPNConnectionStore configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNConnectionStore storeQueue](self, "storeQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __90__VPNConnectionStore_triggerLocalAuthenticationForConfigurationIdentifier_requestedByApp___block_invoke;
    v12[3] = &unk_24EE4DA98;
    v13 = v6;
    objc_msgSend(v10, "triggerLocalAuthenticationForConfigurationWithID:withCompletionQueue:handler:", v9, v11, v12);

  }
}

uint64_t __90__VPNConnectionStore_triggerLocalAuthenticationForConfigurationIdentifier_requestedByApp___block_invoke()
{
  return SBSLaunchApplicationWithIdentifier();
}

- (void)iterateDNSServicesWithBlock:(BOOL)a3 iterBlock:(id)a4
{
  _BOOL8 v4;
  unsigned int (**v6)(id, _QWORD, uint64_t);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v4 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, _QWORD, uint64_t))a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:excludePerApp:](self, "vpnServicesForCurrentSetWithGrade:excludePerApp:", 5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, &unk_24EE55088);
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, &unk_24EE550D0);
  v25 = v9;
  objc_msgSend(v7, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v11;
  v24 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v13 = *(_QWORD *)v31;
    v22 = *(_QWORD *)v31;
    v23 = v8;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              if (!v6[2](v6, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), objc_msgSend(v15, "unsignedIntegerValue")))
              {

                v8 = v23;
                goto LABEL_22;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v19)
              continue;
            break;
          }
        }

        v13 = v22;
      }
      v8 = v23;
      v24 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }
LABEL_22:

}

uint64_t __60__VPNConnectionStore_iterateDNSServicesWithBlock_iterBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)iterateDNSServicesWithBlock:(id)a3
{
  -[VPNConnectionStore iterateDNSServicesWithBlock:iterBlock:](self, "iterateDNSServicesWithBlock:iterBlock:", 0, a3);
}

- (void)iterateContentFilterServicesWithBlock:(id)a3
{
  unsigned int (**v4)(id, _QWORD, uint64_t);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD, uint64_t))a3;
  -[VPNConnectionStore vpnServicesForCurrentSetWithGrade:](self, "vpnServicesForCurrentSetWithGrade:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), 6))
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (NEConfigurationManager)configurationManager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 344, 1);
}

- (void)setConfigurationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (OS_dispatch_queue)storeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 352, 1);
}

- (void)setStoreQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (unsigned)vpnServiceCountDirty
{
  return self->_vpnServiceCountDirty;
}

- (void)setVpnServiceCountDirty:(unsigned int)a3
{
  self->_vpnServiceCountDirty = a3;
}

- (unsigned)vpnServiceCount
{
  return self->_vpnServiceCount;
}

- (void)setVpnServiceCount:(unsigned int)a3
{
  self->_vpnServiceCount = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  for (i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_connectionDict[i + 8], 0);
  for (j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_gradeVPNServiceIDs[j + 8], 0);
  for (k = 160; k != 88; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
    k -= 8;
  }
  while (k != 16);
}

- (BOOL)saveActiveVPNIDToPreferences:(id)a3 withGrade:(unint64_t)a4
{
  return -[VPNConnectionStore enable:serviceID:withGrade:](self, "enable:serviceID:withGrade:", 1, a3, a4);
}

- (void)setOptions:toConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_226973000, v0, v1, "NEConfiguration is not IKEv2, L2TP, or Cisco IPsec: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setOptions:toConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_226973000, v0, v1, "NEConfiguration is not On Demand ready: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226973000, v0, v1, "Save error: %@ configuration: %@");
  OUTLINED_FUNCTION_3();
}

void __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226973000, v0, v1, "Remove error: %@ configuration: %@");
  OUTLINED_FUNCTION_3();
}

- (void)setActiveVPNID:withGrade:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_226973000, v0, v1, "Unable to set the active VPN to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
