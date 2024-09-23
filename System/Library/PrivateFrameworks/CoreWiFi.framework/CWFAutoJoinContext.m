@implementation CWFAutoJoinContext

- (BOOL)isEqualToAutoJoinContext:(id)a3
{
  id v4;
  CWFAutoJoinParameters *autoJoinParameters;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CWFAutoJoinParameters *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CWFAutoJoinParameters *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSOrderedSet *knownNetworks;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSOrderedSet *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSOrderedSet *v35;
  uint64_t v36;
  NSOrderedSet *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *recentChannelList;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSArray *v53;
  NSArray *v54;
  uint64_t v55;
  NSArray *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  NSArray *remainingChannelList;
  NSArray *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  NSArray *SSIDList;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSArray *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSArray *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  NSArray *ANQPElementIDList;
  NSArray *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSArray *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSArray *v105;
  uint64_t v106;
  NSArray *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t maxScanChannelCount;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t maxScanSSIDCount;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t maxScanCacheAge;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t maxANQPCacheAge;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int64_t minRSSI;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t dwellTime;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int passiveScan;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int cacheOnly;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int useCacheForPreviouslyScannedChannels;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t maxScanCycles;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  int BSSChannelsOnly;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  unint64_t maxBSSChannelCount;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  unint64_t maxBSSChannelAge;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  unint64_t maxHiddenKnownNetworkSSIDAge;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int includeAdjacent5GHzChannel;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  int allowStandalone6GHz;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  int include6GHzChannels;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  int alwaysIncludeRemainingNon2GHzChannels;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  int allowDeferredCandidates;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  int didForceAllRemainingChannels;
  BOOL v247;
  void *v248;
  void *v250;
  NSArray *v251;
  NSOrderedSet *v252;
  void *v253;
  void *v254;
  void *v255;
  NSArray *v256;
  void *v257;
  NSOrderedSet *v258;
  void *v259;
  NSArray *v260;
  NSArray *v261;
  void *v262;
  NSArray *v263;
  void *v264;
  void *v265;
  NSArray *v266;
  NSArray *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;

  v4 = a3;
  autoJoinParameters = self->_autoJoinParameters;
  objc_msgSend_autoJoinParameters(v4, v6, v7, v8, v9);
  v14 = (CWFAutoJoinParameters *)objc_claimAutoreleasedReturnValue();
  if (autoJoinParameters != v14)
  {
    if (!self->_autoJoinParameters
      || (objc_msgSend_autoJoinParameters(v4, v10, v11, v12, v13),
          (v271 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v23 = 0;
      goto LABEL_101;
    }
    v19 = self->_autoJoinParameters;
    objc_msgSend_autoJoinParameters(v4, v15, v16, v17, v18);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v19, v20, (uint64_t)v270, v21, v22))
    {
      v23 = 0;
LABEL_100:

      goto LABEL_101;
    }
  }
  knownNetworks = self->_knownNetworks;
  objc_msgSend_knownNetworks(v4, v10, v11, v12, v13);
  v29 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  if (knownNetworks != v29)
  {
    if (!self->_knownNetworks)
    {
      v23 = 0;
LABEL_84:

      goto LABEL_99;
    }
    objc_msgSend_knownNetworks(v4, v25, v26, v27, v28);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_97;
    v269 = (void *)v30;
    v35 = self->_knownNetworks;
    objc_msgSend_knownNetworks(v4, v31, v32, v33, v34);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v38 = (void *)v36;
    if ((objc_msgSend_isEqual_(v37, v39, v36, v40, v41) & 1) == 0)
    {

LABEL_96:
      goto LABEL_97;
    }
    v268 = v38;
  }
  recentChannelList = self->_recentChannelList;
  objc_msgSend_recentChannelList(v4, v25, v26, v27, v28);
  v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (recentChannelList == v47)
  {
LABEL_18:
    remainingChannelList = self->_remainingChannelList;
    objc_msgSend_remainingChannelList(v4, v43, v44, v45, v46);
    v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v266 = remainingChannelList;
    if (remainingChannelList != v62)
    {
      if (!self->_remainingChannelList)
      {
        v23 = 0;
LABEL_80:

        if (recentChannelList != v47)
        {

        }
        goto LABEL_82;
      }
      v267 = v62;
      objc_msgSend_remainingChannelList(v4, v63, v64, v65, v66);
      v67 = objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        v262 = (void *)v67;
        v72 = self->_remainingChannelList;
        objc_msgSend_remainingChannelList(v4, v68, v69, v70, v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v72, v74, (uint64_t)v73, v75, v76) & 1) != 0)
        {
          v259 = v73;
          goto LABEL_26;
        }

      }
      if (recentChannelList == v47)
      {

        goto LABEL_94;
      }
LABEL_91:
      v248 = v264;
LABEL_92:

LABEL_93:
LABEL_94:
      if (knownNetworks == v29)
      {
LABEL_97:

        goto LABEL_98;
      }
      goto LABEL_95;
    }
    v267 = v62;
LABEL_26:
    SSIDList = self->_SSIDList;
    objc_msgSend_SSIDList(v4, v63, v64, v65, v66);
    v82 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v263 = SSIDList;
    if (SSIDList != v82)
    {
      if (!self->_SSIDList)
      {
        v23 = 0;
LABEL_78:

        v62 = v267;
        if (v266 != v267)
        {

          v62 = v267;
        }
        goto LABEL_80;
      }
      objc_msgSend_SSIDList(v4, v78, v79, v80, v81);
      v83 = objc_claimAutoreleasedReturnValue();
      if (!v83)
        goto LABEL_87;
      v257 = (void *)v83;
      v260 = v82;
      v88 = self->_SSIDList;
      objc_msgSend_SSIDList(v4, v84, v85, v86, v87);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v88, v90, (uint64_t)v89, v91, v92) & 1) == 0)
      {

        if (v266 == v267)
        {

        }
        else
        {

        }
        v248 = v264;
        if (recentChannelList == v47)
          goto LABEL_93;
        goto LABEL_92;
      }
      v255 = v89;
      v82 = v260;
    }
    ANQPElementIDList = self->_ANQPElementIDList;
    objc_msgSend_ANQPElementIDList(v4, v78, v79, v80, v81);
    v94 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (ANQPElementIDList == v94)
    {
      v256 = ANQPElementIDList;
      v99 = v94;
      v261 = v82;
      goto LABEL_45;
    }
    if (!self->_ANQPElementIDList)
    {
      v23 = 0;
      goto LABEL_73;
    }
    v256 = ANQPElementIDList;
    v99 = v94;
    objc_msgSend_ANQPElementIDList(v4, v95, v96, v97, v98);
    v100 = objc_claimAutoreleasedReturnValue();
    if (!v100)
    {
      v23 = 0;
      goto LABEL_75;
    }
    v254 = (void *)v100;
    v261 = v82;
    v105 = self->_ANQPElementIDList;
    objc_msgSend_ANQPElementIDList(v4, v101, v102, v103, v104);
    v106 = objc_claimAutoreleasedReturnValue();
    v107 = v105;
    v108 = (void *)v106;
    if ((objc_msgSend_isEqual_(v107, v109, v106, v110, v111) & 1) != 0)
    {
      v253 = v108;
LABEL_45:
      maxScanChannelCount = self->_maxScanChannelCount;
      if (maxScanChannelCount != objc_msgSend_maxScanChannelCount(v4, v95, v96, v97, v98))
        goto LABEL_67;
      maxScanSSIDCount = self->_maxScanSSIDCount;
      if (maxScanSSIDCount != objc_msgSend_maxScanSSIDCount(v4, v113, v114, v115, v116))
        goto LABEL_67;
      maxScanCacheAge = self->_maxScanCacheAge;
      if (maxScanCacheAge == objc_msgSend_maxScanCacheAge(v4, v118, v119, v120, v121)
        && (maxANQPCacheAge = self->_maxANQPCacheAge,
            maxANQPCacheAge == objc_msgSend_maxANQPCacheAge(v4, v123, v124, v125, v126))
        && (minRSSI = self->_minRSSI, minRSSI == objc_msgSend_minRSSI(v4, v128, v129, v130, v131))
        && (dwellTime = self->_dwellTime, dwellTime == objc_msgSend_dwellTime(v4, v133, v134, v135, v136))
        && (passiveScan = self->_passiveScan,
            passiveScan == objc_msgSend_passiveScan(v4, v138, v139, v140, v141))
        && (cacheOnly = self->_cacheOnly, cacheOnly == objc_msgSend_cacheOnly(v4, v143, v144, v145, v146))
        && (useCacheForPreviouslyScannedChannels = self->_useCacheForPreviouslyScannedChannels,
            useCacheForPreviouslyScannedChannels == objc_msgSend_useCacheForPreviouslyScannedChannels(v4, v148, v149, v150, v151)))
      {
        v258 = v29;
        v251 = v47;
        v252 = knownNetworks;
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v153, v154, v155, v156, self->_minBSSLocationAccuracy);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_minBSSLocationAccuracy(v4, v159, v160, v161, v162);
        objc_msgSend_numberWithDouble_(v158, v163, v164, v165, v166);
        v167 = v157;
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToNumber_(v157, v169, (uint64_t)v168, v170, v171))
        {
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v172, v173, v174, v175, self->_maxBSSLocationDistance);
          v176 = objc_claimAutoreleasedReturnValue();
          v177 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_maxBSSLocationDistance(v4, v178, v179, v180, v181);
          objc_msgSend_numberWithDouble_(v177, v182, v183, v184, v185);
          v186 = objc_claimAutoreleasedReturnValue();
          v250 = (void *)v176;
          v187 = (void *)v176;
          v188 = (void *)v186;
          if (!objc_msgSend_isEqualToNumber_(v187, v189, v186, v190, v191))
            goto LABEL_107;
          maxScanCycles = self->_maxScanCycles;
          if (maxScanCycles != objc_msgSend_maxScanCycles(v4, v192, v193, v194, v195))
            goto LABEL_107;
          BSSChannelsOnly = self->_BSSChannelsOnly;
          if (BSSChannelsOnly != objc_msgSend_BSSChannelsOnly(v4, v197, v198, v199, v200))
            goto LABEL_107;
          maxBSSChannelCount = self->_maxBSSChannelCount;
          if (maxBSSChannelCount != objc_msgSend_maxBSSChannelCount(v4, v202, v203, v204, v205))
            goto LABEL_107;
          maxBSSChannelAge = self->_maxBSSChannelAge;
          if (maxBSSChannelAge == objc_msgSend_maxBSSChannelAge(v4, v207, v208, v209, v210)
            && (maxHiddenKnownNetworkSSIDAge = self->_maxHiddenKnownNetworkSSIDAge,
                maxHiddenKnownNetworkSSIDAge == objc_msgSend_maxHiddenKnownNetworkSSIDAge(v4, v212, v213, v214, v215))
            && (includeAdjacent5GHzChannel = self->_includeAdjacent5GHzChannel,
                includeAdjacent5GHzChannel == objc_msgSend_includeAdjacent5GHzChannel(v4, v217, v218, v219, v220))&& (allowStandalone6GHz = self->_allowStandalone6GHz, allowStandalone6GHz == objc_msgSend_allowStandalone6GHz(v4, v222, v223, v224, v225))&& (include6GHzChannels = self->_include6GHzChannels, include6GHzChannels == objc_msgSend_include6GHzChannels(v4, v227, v228, v229, v230))&& (alwaysIncludeRemainingNon2GHzChannels = self->_alwaysIncludeRemainingNon2GHzChannels, alwaysIncludeRemainingNon2GHzChannels == objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v4, v232, v233, v234, v235))&& (allowDeferredCandidates = self->_allowDeferredCandidates, allowDeferredCandidates == objc_msgSend_allowDeferredCandidates(v4,
                                                           v237,
                                                           v238,
                                                           v239,
                                                           v240)))
          {
            didForceAllRemainingChannels = self->_didForceAllRemainingChannels;
            v23 = didForceAllRemainingChannels == objc_msgSend_didForceAllRemainingChannels(v4, v242, v243, v244, v245);
          }
          else
          {
LABEL_107:
            v23 = 0;
          }

        }
        else
        {

          v23 = 0;
        }
        v94 = v99;
        v247 = v256 == v99;
        v47 = v251;
        knownNetworks = v252;
        v29 = v258;
      }
      else
      {
LABEL_67:
        v23 = 0;
        v94 = v99;
        v247 = v256 == v99;
      }
      v82 = v261;
      if (!v247)
      {
        v99 = v94;

LABEL_75:
LABEL_76:
        if (v263 != v82)
        {

        }
        goto LABEL_78;
      }
LABEL_73:

      goto LABEL_76;
    }

    v82 = v261;
    if (v263 == v261)
    {

LABEL_88:
      if (v266 != v267)
      {

      }
      if (recentChannelList == v47)
        goto LABEL_93;
      goto LABEL_91;
    }

LABEL_87:
    goto LABEL_88;
  }
  if (!self->_recentChannelList)
  {
    v23 = 0;
LABEL_82:

    if (knownNetworks != v29)
    {

    }
    goto LABEL_84;
  }
  objc_msgSend_recentChannelList(v4, v43, v44, v45, v46);
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v53 = recentChannelList;
    v265 = (void *)v48;
    v54 = self->_recentChannelList;
    objc_msgSend_recentChannelList(v4, v49, v50, v51, v52);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v54;
    v57 = (void *)v55;
    if ((objc_msgSend_isEqual_(v56, v58, v55, v59, v60) & 1) != 0)
    {
      v264 = v57;
      recentChannelList = v53;
      goto LABEL_18;
    }

  }
  if (knownNetworks != v29)
  {
LABEL_95:

    goto LABEL_96;
  }

LABEL_98:
  v23 = 0;
LABEL_99:
  if (autoJoinParameters != v14)
    goto LABEL_100;
LABEL_101:

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  CWFAutoJoinContext *v4;
  CWFAutoJoinContext *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAutoJoinContext;

  v4 = (CWFAutoJoinContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAutoJoinContext = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAutoJoinContext = objc_msgSend_isEqualToAutoJoinContext_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAutoJoinContext = 0;
  }

  return isEqualToAutoJoinContext;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t maxScanChannelCount;
  unint64_t maxScanSSIDCount;
  _BOOL8 passiveScan;
  BOOL cacheOnly;
  BOOL useCacheForPreviouslyScannedChannels;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int8x16_t v52;
  unint64_t v53;
  int8x16_t v55;
  int8x16_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = objc_msgSend_hash(self->_autoJoinParameters, a2, v2, v3, v4);
  v60 = objc_msgSend_hash(self->_knownNetworks, v6, v7, v8, v9);
  v59 = objc_msgSend_hash(self->_recentChannelList, v10, v11, v12, v13);
  v58 = objc_msgSend_hash(self->_remainingChannelList, v14, v15, v16, v17);
  v57 = objc_msgSend_hash(self->_SSIDList, v18, v19, v20, v21);
  v26 = objc_msgSend_hash(self->_ANQPElementIDList, v22, v23, v24, v25);
  maxScanChannelCount = self->_maxScanChannelCount;
  maxScanSSIDCount = self->_maxScanSSIDCount;
  passiveScan = self->_passiveScan;
  cacheOnly = self->_cacheOnly;
  useCacheForPreviouslyScannedChannels = self->_useCacheForPreviouslyScannedChannels;
  v56 = *(int8x16_t *)&self->_maxScanCacheAge;
  v55 = *(int8x16_t *)&self->_minRSSI;
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v32, v33, v34, v35, self->_minBSSLocationAccuracy);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_hash(v36, v37, v38, v39, v40);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v42, v43, v44, v45, self->_maxBSSLocationDistance);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_hash(v46, v47, v48, v49, v50);
  v52 = veorq_s8(v56, v55);
  v53 = *(_QWORD *)&veor_s8(*(int8x8_t *)v52.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL)) ^ passiveScan ^ cacheOnly ^ useCacheForPreviouslyScannedChannels ^ (unint64_t)(self->_BSSChannelsOnly ^ self->_includeAdjacent5GHzChannel ^ self->_allowStandalone6GHz ^ self->_include6GHzChannels) ^ maxScanChannelCount ^ self->_didForceAllRemainingChannels ^ self->_alwaysIncludeRemainingNon2GHzChannels ^ self->_allowDeferredCandidates ^ maxScanSSIDCount ^ self->_maxScanCycles ^ self->_maxBSSChannelCount ^ self->_maxBSSChannelAge ^ self->_maxHiddenKnownNetworkSSIDAge ^ v51 ^ v41 ^ v26 ^ v57 ^ v58 ^ v59 ^ v60 ^ v61;

  return v53;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinContext, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setAutoJoinParameters_(v11, v12, (uint64_t)self->_autoJoinParameters, v13, v14);
  objc_msgSend_setKnownNetworks_(v11, v15, (uint64_t)self->_knownNetworks, v16, v17);
  objc_msgSend_setRecentChannelList_(v11, v18, (uint64_t)self->_recentChannelList, v19, v20);
  objc_msgSend_setRemainingChannelList_(v11, v21, (uint64_t)self->_remainingChannelList, v22, v23);
  objc_msgSend_setSSIDList_(v11, v24, (uint64_t)self->_SSIDList, v25, v26);
  objc_msgSend_setANQPElementIDList_(v11, v27, (uint64_t)self->_ANQPElementIDList, v28, v29);
  objc_msgSend_setMaxScanChannelCount_(v11, v30, self->_maxScanChannelCount, v31, v32);
  objc_msgSend_setMaxScanSSIDCount_(v11, v33, self->_maxScanSSIDCount, v34, v35);
  objc_msgSend_setMaxScanCacheAge_(v11, v36, self->_maxScanCacheAge, v37, v38);
  objc_msgSend_setMaxANQPCacheAge_(v11, v39, self->_maxANQPCacheAge, v40, v41);
  objc_msgSend_setMinRSSI_(v11, v42, self->_minRSSI, v43, v44);
  objc_msgSend_setDwellTime_(v11, v45, self->_dwellTime, v46, v47);
  objc_msgSend_setPassiveScan_(v11, v48, self->_passiveScan, v49, v50);
  objc_msgSend_setCacheOnly_(v11, v51, self->_cacheOnly, v52, v53);
  objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v11, v54, self->_useCacheForPreviouslyScannedChannels, v55, v56);
  objc_msgSend_setMinBSSLocationAccuracy_(v11, v57, v58, v59, v60, self->_minBSSLocationAccuracy);
  objc_msgSend_setMaxBSSLocationDistance_(v11, v61, v62, v63, v64, self->_maxBSSLocationDistance);
  objc_msgSend_setMaxScanCycles_(v11, v65, self->_maxScanCycles, v66, v67);
  objc_msgSend_setBSSChannelsOnly_(v11, v68, self->_BSSChannelsOnly, v69, v70);
  objc_msgSend_setMaxBSSChannelCount_(v11, v71, self->_maxBSSChannelCount, v72, v73);
  objc_msgSend_setMaxBSSChannelAge_(v11, v74, self->_maxBSSChannelAge, v75, v76);
  objc_msgSend_setMaxHiddenKnownNetworkSSIDAge_(v11, v77, self->_maxHiddenKnownNetworkSSIDAge, v78, v79);
  objc_msgSend_setIncludeAdjacent5GHzChannel_(v11, v80, self->_includeAdjacent5GHzChannel, v81, v82);
  objc_msgSend_setAllowStandalone6GHz_(v11, v83, self->_allowStandalone6GHz, v84, v85);
  objc_msgSend_setInclude6GHzChannels_(v11, v86, self->_include6GHzChannels, v87, v88);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v11, v89, self->_alwaysIncludeRemainingNon2GHzChannels, v90, v91);
  objc_msgSend_setAllowDeferredCandidates_(v11, v92, self->_allowDeferredCandidates, v93, v94);
  objc_msgSend_setDidForceAllRemainingChannels_(v11, v95, self->_didForceAllRemainingChannels, v96, v97);
  return v11;
}

- (CWFAutoJoinParameters)autoJoinParameters
{
  return self->_autoJoinParameters;
}

- (void)setAutoJoinParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSOrderedSet)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)recentChannelList
{
  return self->_recentChannelList;
}

- (void)setRecentChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)remainingChannelList
{
  return self->_remainingChannelList;
}

- (void)setRemainingChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)SSIDList
{
  return self->_SSIDList;
}

- (void)setSSIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)ANQPElementIDList
{
  return self->_ANQPElementIDList;
}

- (void)setANQPElementIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)maxScanChannelCount
{
  return self->_maxScanChannelCount;
}

- (void)setMaxScanChannelCount:(unint64_t)a3
{
  self->_maxScanChannelCount = a3;
}

- (BOOL)BSSChannelsOnly
{
  return self->_BSSChannelsOnly;
}

- (void)setBSSChannelsOnly:(BOOL)a3
{
  self->_BSSChannelsOnly = a3;
}

- (unint64_t)maxBSSChannelCount
{
  return self->_maxBSSChannelCount;
}

- (void)setMaxBSSChannelCount:(unint64_t)a3
{
  self->_maxBSSChannelCount = a3;
}

- (unint64_t)maxBSSChannelAge
{
  return self->_maxBSSChannelAge;
}

- (void)setMaxBSSChannelAge:(unint64_t)a3
{
  self->_maxBSSChannelAge = a3;
}

- (unint64_t)maxScanSSIDCount
{
  return self->_maxScanSSIDCount;
}

- (void)setMaxScanSSIDCount:(unint64_t)a3
{
  self->_maxScanSSIDCount = a3;
}

- (unint64_t)maxHiddenKnownNetworkSSIDAge
{
  return self->_maxHiddenKnownNetworkSSIDAge;
}

- (void)setMaxHiddenKnownNetworkSSIDAge:(unint64_t)a3
{
  self->_maxHiddenKnownNetworkSSIDAge = a3;
}

- (unint64_t)maxScanCacheAge
{
  return self->_maxScanCacheAge;
}

- (void)setMaxScanCacheAge:(unint64_t)a3
{
  self->_maxScanCacheAge = a3;
}

- (unint64_t)maxANQPCacheAge
{
  return self->_maxANQPCacheAge;
}

- (void)setMaxANQPCacheAge:(unint64_t)a3
{
  self->_maxANQPCacheAge = a3;
}

- (unint64_t)maxScanCycles
{
  return self->_maxScanCycles;
}

- (void)setMaxScanCycles:(unint64_t)a3
{
  self->_maxScanCycles = a3;
}

- (int64_t)minRSSI
{
  return self->_minRSSI;
}

- (void)setMinRSSI:(int64_t)a3
{
  self->_minRSSI = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_dwellTime = a3;
}

- (BOOL)passiveScan
{
  return self->_passiveScan;
}

- (void)setPassiveScan:(BOOL)a3
{
  self->_passiveScan = a3;
}

- (BOOL)cacheOnly
{
  return self->_cacheOnly;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_cacheOnly = a3;
}

- (BOOL)useCacheForPreviouslyScannedChannels
{
  return self->_useCacheForPreviouslyScannedChannels;
}

- (void)setUseCacheForPreviouslyScannedChannels:(BOOL)a3
{
  self->_useCacheForPreviouslyScannedChannels = a3;
}

- (double)minBSSLocationAccuracy
{
  return self->_minBSSLocationAccuracy;
}

- (void)setMinBSSLocationAccuracy:(double)a3
{
  self->_minBSSLocationAccuracy = a3;
}

- (double)maxBSSLocationDistance
{
  return self->_maxBSSLocationDistance;
}

- (void)setMaxBSSLocationDistance:(double)a3
{
  self->_maxBSSLocationDistance = a3;
}

- (BOOL)includeAdjacent5GHzChannel
{
  return self->_includeAdjacent5GHzChannel;
}

- (void)setIncludeAdjacent5GHzChannel:(BOOL)a3
{
  self->_includeAdjacent5GHzChannel = a3;
}

- (BOOL)allowStandalone6GHz
{
  return self->_allowStandalone6GHz;
}

- (void)setAllowStandalone6GHz:(BOOL)a3
{
  self->_allowStandalone6GHz = a3;
}

- (BOOL)include6GHzChannels
{
  return self->_include6GHzChannels;
}

- (void)setInclude6GHzChannels:(BOOL)a3
{
  self->_include6GHzChannels = a3;
}

- (BOOL)alwaysIncludeRemainingNon2GHzChannels
{
  return self->_alwaysIncludeRemainingNon2GHzChannels;
}

- (void)setAlwaysIncludeRemainingNon2GHzChannels:(BOOL)a3
{
  self->_alwaysIncludeRemainingNon2GHzChannels = a3;
}

- (BOOL)allowDeferredCandidates
{
  return self->_allowDeferredCandidates;
}

- (void)setAllowDeferredCandidates:(BOOL)a3
{
  self->_allowDeferredCandidates = a3;
}

- (BOOL)didForceAllRemainingChannels
{
  return self->_didForceAllRemainingChannels;
}

- (void)setDidForceAllRemainingChannels:(BOOL)a3
{
  self->_didForceAllRemainingChannels = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANQPElementIDList, 0);
  objc_storeStrong((id *)&self->_SSIDList, 0);
  objc_storeStrong((id *)&self->_remainingChannelList, 0);
  objc_storeStrong((id *)&self->_recentChannelList, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_autoJoinParameters, 0);
}

@end
