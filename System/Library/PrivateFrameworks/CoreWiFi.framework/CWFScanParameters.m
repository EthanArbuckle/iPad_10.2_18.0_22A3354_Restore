@implementation CWFScanParameters

- (unint64_t)maximumCacheAge
{
  return self->_acceptableCacheAge / 0x3E8;
}

- (void)setMaximumCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = 1000 * a3;
}

- (BOOL)cacheOnly
{
  return self->_acceptableCacheAge == -1;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_acceptableCacheAge = a3 << 63 >> 63;
}

- (unint64_t)maximumANQPCacheAgeForPasspointScanResults
{
  return self->_acceptableANQPCacheAgeForPasspointScanResults / 0x3E8;
}

- (void)setMaximumANQPCacheAgeForPasspointScanResults:(unint64_t)a3
{
  self->_acceptableANQPCacheAgeForPasspointScanResults = 1000 * a3;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
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
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("channels=%@, "), v8, v9, self->_channels);
  objc_msgSend_redactedForWiFi(self->_SSID, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR("SSID=%@, "), v16, v17, v14);

  objc_msgSend_redactedForWiFi(self->_BSSID, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v23, (uint64_t)CFSTR("BSSID=%@, "), v24, v25, v22);

  objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR("shortSSID=%lu, "), v27, v28, self->_shortSSID);
  objc_msgSend_componentsJoinedByString_(self->_SSIDList, v29, (uint64_t)CFSTR(", "), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR("SSIDList=[%@], "), v39, v40, v37);

  objc_msgSend_appendFormat_(v6, v41, (uint64_t)CFSTR("numberOfScans=%lu, "), v42, v43, self->_numberOfScans);
  objc_msgSend_appendFormat_(v6, v44, (uint64_t)CFSTR("restTime=%lu, "), v45, v46, self->_restTime);
  objc_msgSend_appendFormat_(v6, v47, (uint64_t)CFSTR("dwellTime=%lu, "), v48, v49, self->_dwellTime);
  objc_msgSend_appendFormat_(v6, v50, (uint64_t)CFSTR("acceptableCacheAge=%lu, "), v51, v52, self->_acceptableCacheAge);
  objc_msgSend_appendFormat_(v6, v53, (uint64_t)CFSTR("BSSType=%u, "), v54, v55, self->_BSSType);
  objc_msgSend_appendFormat_(v6, v56, (uint64_t)CFSTR("PHYMode=%u, "), v57, v58, self->_PHYMode);
  objc_msgSend_appendFormat_(v6, v59, (uint64_t)CFSTR("scanType=%u, "), v60, v61, self->_scanType);
  objc_msgSend_appendFormat_(v6, v62, (uint64_t)CFSTR("minRSSI=%ld, "), v63, v64, self->_minimumRSSI);
  objc_msgSend_appendFormat_(v6, v65, (uint64_t)CFSTR("maxAge=%lu, "), v66, v67, self->_maximumAge);
  objc_msgSend_appendFormat_(v6, v68, (uint64_t)CFSTR("minTimestamp=%llu, "), v69, v70, self->_minimumTimestamp);
  objc_msgSend_appendFormat_(v6, v71, (uint64_t)CFSTR("scanFlags=0x%x, "), v72, v73, self->_scanFlags);
  objc_msgSend_appendFormat_(v6, v74, (uint64_t)CFSTR("merge=%d, "), v75, v76, self->_mergeScanResults);
  objc_msgSend_appendFormat_(v6, v77, (uint64_t)CFSTR("includeHidden=%d, "), v78, v79, self->_includeHiddenNetworks);
  objc_msgSend_appendFormat_(v6, v80, (uint64_t)CFSTR("includeProperties=%@, "), v81, v82, self->_includeProperties);
  objc_msgSend_appendFormat_(v6, v83, (uint64_t)CFSTR("includeScanResults=%@, "), v84, v85, self->_includeScanResults);
  objc_msgSend_appendFormat_(v6, v86, (uint64_t)CFSTR("includeMatchingKnownNetworks=%d, "), v87, v88, self->_includeMatchingKnownNetworkProfiles);
  objc_msgSend_appendFormat_(v6, v89, (uint64_t)CFSTR("ANQPElementIDList=%@, "), v90, v91, self->_ANQPElementIDListForPasspointScanResults);
  objc_msgSend_appendFormat_(v6, v92, (uint64_t)CFSTR("acceptableANQPCacheAge=%lu, "), v93, v94, self->_acceptableANQPCacheAgeForPasspointScanResults);
  objc_msgSend_appendFormat_(v6, v95, (uint64_t)CFSTR("maxANQPAge=%lu, "), v96, v97, self->_maximumANQPAgeForPasspointScanResults);
  objc_msgSend_appendFormat_(v6, v98, (uint64_t)CFSTR("exclude6GChannels=%d, "), v99, v100, self->_exclude6GChannels);
  objc_msgSend_appendFormat_(v6, v101, (uint64_t)CFSTR("matchNetworkNamePrefix=%@, "), v102, v103, self->_matchNetworkNamePrefix);
  objc_msgSend_appendFormat_(v6, v104, (uint64_t)CFSTR("filterPredicate=%@, "), v105, v106, self->_filterPredicate);
  objc_msgSend_appendFormat_(v6, v107, (uint64_t)CFSTR("includeBeaconCache=%d, "), v108, v109, self->_includeBeaconCacheResults);
  objc_msgSend_appendFormat_(v6, v110, (uint64_t)CFSTR("includeBackgroundCache=%d"), v111, v112, self->_includeBackgroundScanCacheResults);
  return v6;
}

- (BOOL)isEqualToScanParameters:(id)a3
{
  void *v3;
  id v5;
  NSArray *channels;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  NSString *SSID;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSString *v39;
  uint64_t v40;
  NSString *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSString *BSSID;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSString *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSString *v57;
  uint64_t v58;
  NSString *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t shortSSID;
  NSArray *SSIDList;
  NSArray *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSArray *v85;
  uint64_t v86;
  NSArray *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t numberOfScans;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t restTime;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t dwellTime;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t acceptableCacheAge;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int BSSType;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int PHYMode;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int scanType;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int64_t minimumRSSI;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t maximumAge;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t minimumTimestamp;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int mergeScanResults;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int includeHiddenNetworks;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int scanFlags;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  NSSet *includeProperties;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSSet *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  NSArray *v170;
  BOOL v171;
  void *v173;
  NSArray *includeScanResults;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  NSArray *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  NSSet *v187;
  int includeMatchingKnownNetworkProfiles;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSArray *ANQPElementIDListForPasspointScanResults;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  NSArray *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  NSArray *v206;
  unint64_t acceptableANQPCacheAgeForPasspointScanResults;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  unint64_t maximumANQPAgeForPasspointScanResults;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  int exclude6GChannels;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  NSString *matchNetworkNamePrefix;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  NSString *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  NSArray *v235;
  NSPredicate *filterPredicate;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  NSPredicate *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  int includeBeaconCacheResults;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  int includeBackgroundScanCacheResults;
  NSString *v255;
  void *v256;
  void *v257;
  void *v258;
  NSPredicate *v259;
  void *v260;
  NSPredicate *v261;
  NSString *v262;
  NSString *v263;
  void *v264;
  void *v265;
  NSArray *v266;
  NSArray *v267;
  void *v268;
  void *v269;
  void *v270;
  NSArray *v271;
  void *v272;
  NSArray *v273;
  NSSet *v274;
  NSSet *v275;
  void *v276;
  void *v277;
  NSArray *v278;
  void *v279;
  NSArray *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;

  v5 = a3;
  channels = self->_channels;
  objc_msgSend_channels(v5, v7, v8, v9, v10);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (channels != v15)
  {
    if (!self->_channels
      || (objc_msgSend_channels(v5, v11, v12, v13, v14), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v26 = 0;
      goto LABEL_67;
    }
    v3 = (void *)v16;
    v21 = self->_channels;
    objc_msgSend_channels(v5, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      v26 = 0;
LABEL_66:

      goto LABEL_67;
    }
    v284 = v22;
  }
  SSID = self->_SSID;
  objc_msgSend_SSID(v5, v11, v12, v13, v14);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (SSID != v32)
  {
    if (!self->_SSID)
    {
      v26 = 0;
      goto LABEL_65;
    }
    objc_msgSend_SSID(v5, v28, v29, v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_31;
    v38 = (void *)v33;
    v39 = self->_SSID;
    objc_msgSend_SSID(v5, v34, v35, v36, v37);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v39;
    v42 = (void *)v40;
    if ((objc_msgSend_isEqual_(v41, v43, v40, v44, v45) & 1) == 0)
    {

LABEL_31:
LABEL_32:
      v26 = 0;
      goto LABEL_33;
    }
    v282 = v42;
    v283 = v38;
  }
  BSSID = self->_BSSID;
  objc_msgSend_BSSID(v5, v28, v29, v30, v31);
  v51 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (BSSID == v51)
  {
    shortSSID = self->_shortSSID;
    if (shortSSID == objc_msgSend_shortSSID(v5, v47, v48, v49, v50))
    {
LABEL_21:
      SSIDList = self->_SSIDList;
      objc_msgSend_SSIDList(v5, v69, v70, v71, v72);
      v75 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (SSIDList != v75)
      {
        if (!self->_SSIDList)
        {
          v26 = 0;
          goto LABEL_61;
        }
        v280 = v75;
        objc_msgSend_SSIDList(v5, v76, v77, v78, v79);
        v80 = objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          v277 = (void *)v80;
          v278 = SSIDList;
          v85 = self->_SSIDList;
          objc_msgSend_SSIDList(v5, v81, v82, v83, v84);
          v86 = objc_claimAutoreleasedReturnValue();
          v87 = v85;
          v88 = (void *)v86;
          if ((objc_msgSend_isEqual_(v87, v89, v86, v90, v91) & 1) != 0)
          {
            v276 = v88;
LABEL_37:
            numberOfScans = self->_numberOfScans;
            if (numberOfScans != objc_msgSend_numberOfScans(v5, v76, v77, v78, v79))
              goto LABEL_57;
            restTime = self->_restTime;
            if (restTime != objc_msgSend_restTime(v5, v93, v94, v95, v96))
              goto LABEL_57;
            dwellTime = self->_dwellTime;
            if (dwellTime != objc_msgSend_dwellTime(v5, v98, v99, v100, v101))
              goto LABEL_57;
            acceptableCacheAge = self->_acceptableCacheAge;
            if (acceptableCacheAge != objc_msgSend_acceptableCacheAge(v5, v103, v104, v105, v106))
              goto LABEL_57;
            BSSType = self->_BSSType;
            if (BSSType != objc_msgSend_BSSType(v5, v108, v109, v110, v111))
              goto LABEL_57;
            PHYMode = self->_PHYMode;
            if (PHYMode != objc_msgSend_PHYMode(v5, v113, v114, v115, v116)
              || (scanType = self->_scanType, scanType != objc_msgSend_scanType(v5, v118, v119, v120, v121))|| (minimumRSSI = self->_minimumRSSI, minimumRSSI != objc_msgSend_minimumRSSI(v5, v123, v124, v125, v126))|| (maximumAge = self->_maximumAge, maximumAge != objc_msgSend_maximumAge(v5, v128, v129, v130, v131))|| (minimumTimestamp = self->_minimumTimestamp, minimumTimestamp != objc_msgSend_minimumTimestamp(v5, v133, v134, v135, v136))|| (mergeScanResults = self->_mergeScanResults, mergeScanResults != objc_msgSend_mergeScanResults(v5, v138, v139, v140, v141))|| (includeHiddenNetworks = self->_includeHiddenNetworks, includeHiddenNetworks != objc_msgSend_includeHiddenNetworks(v5, v143, v144, v145, v146))|| (scanFlags = self->_scanFlags, scanFlags != objc_msgSend_scanFlags(v5, v148, v149, v150, v151)))
            {
LABEL_57:
              v171 = 0;
              v26 = 0;
              goto LABEL_58;
            }
            includeProperties = self->_includeProperties;
            objc_msgSend_includeProperties(v5, v153, v154, v155, v156);
            v274 = includeProperties;
            v275 = (NSSet *)objc_claimAutoreleasedReturnValue();
            if (includeProperties != v275)
            {
              if (!self->_includeProperties)
              {
                v171 = 0;
LABEL_113:

                v26 = v171;
LABEL_58:
                v75 = v280;
                if (v278 != v280)
                {

                  v75 = v280;
                  v26 = v171;
                }
LABEL_61:

                if (BSSID == v51)
                  goto LABEL_63;
                goto LABEL_62;
              }
              objc_msgSend_includeProperties(v5, v158, v159, v160, v161);
              v272 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v272)
                goto LABEL_55;
              v166 = self->_includeProperties;
              objc_msgSend_includeProperties(v5, v162, v163, v164, v165);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v166, v167, (uint64_t)v270, v168, v169) & 1) == 0)
              {

LABEL_55:
                if (v278 == v280)
                {
                  v170 = v278;
                  goto LABEL_121;
                }
                goto LABEL_119;
              }
            }
            includeScanResults = self->_includeScanResults;
            objc_msgSend_includeScanResults(v5, v158, v159, v160, v161);
            v273 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v271 = includeScanResults;
            if (includeScanResults != v273)
            {
              if (!self->_includeScanResults)
              {
                v171 = 0;
LABEL_111:

                if (v274 != v275)
                {

                }
                goto LABEL_113;
              }
              objc_msgSend_includeScanResults(v5, v175, v176, v177, v178);
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v269)
                goto LABEL_81;
              v183 = self->_includeScanResults;
              objc_msgSend_includeScanResults(v5, v179, v180, v181, v182);
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v183, v184, (uint64_t)v268, v185, v186) & 1) == 0)
              {

LABEL_81:
                if (v274 == v275)
                {
                  v187 = v274;
                  goto LABEL_118;
                }
                goto LABEL_116;
              }
            }
            includeMatchingKnownNetworkProfiles = self->_includeMatchingKnownNetworkProfiles;
            if (includeMatchingKnownNetworkProfiles != objc_msgSend_includeMatchingKnownNetworkProfiles(v5, v175, v176, v177, v178))
            {
              v171 = 0;
              goto LABEL_109;
            }
            ANQPElementIDListForPasspointScanResults = self->_ANQPElementIDListForPasspointScanResults;
            objc_msgSend_ANQPElementIDListForPasspointScanResults(v5, v189, v190, v191, v192);
            v266 = ANQPElementIDListForPasspointScanResults;
            v267 = (NSArray *)objc_claimAutoreleasedReturnValue();
            if (ANQPElementIDListForPasspointScanResults != v267)
            {
              if (!self->_ANQPElementIDListForPasspointScanResults)
              {
                v171 = 0;
LABEL_108:

LABEL_109:
                if (v271 != v273)
                {

                }
                goto LABEL_111;
              }
              objc_msgSend_ANQPElementIDListForPasspointScanResults(v5, v194, v195, v196, v197);
              v265 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v265)
                goto LABEL_90;
              v202 = self->_ANQPElementIDListForPasspointScanResults;
              objc_msgSend_ANQPElementIDListForPasspointScanResults(v5, v198, v199, v200, v201);
              v264 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v202, v203, (uint64_t)v264, v204, v205) & 1) == 0)
              {

LABEL_90:
                if (v271 == v273)
                {
                  v206 = v271;
LABEL_115:

                  if (v274 == v275)
                  {
LABEL_117:
                    v187 = v275;
LABEL_118:

                    if (v278 == v280)
                    {
LABEL_120:
                      v170 = v280;
LABEL_121:

                      if (BSSID == v51)
                        goto LABEL_72;
                      goto LABEL_69;
                    }
LABEL_119:

                    goto LABEL_120;
                  }
LABEL_116:

                  goto LABEL_117;
                }
LABEL_91:

LABEL_92:
                v206 = v273;
                goto LABEL_115;
              }
            }
            acceptableANQPCacheAgeForPasspointScanResults = self->_acceptableANQPCacheAgeForPasspointScanResults;
            if (acceptableANQPCacheAgeForPasspointScanResults != objc_msgSend_acceptableANQPCacheAgeForPasspointScanResults(v5, v194, v195, v196, v197)|| (maximumANQPAgeForPasspointScanResults = self->_maximumANQPAgeForPasspointScanResults, maximumANQPAgeForPasspointScanResults != objc_msgSend_maximumANQPAgeForPasspointScanResults(v5, v208, v209, v210, v211))|| (exclude6GChannels = self->_exclude6GChannels, exclude6GChannels != objc_msgSend_exclude6GChannels(v5, v213, v214, v215, v216)))
            {
              v171 = 0;
              goto LABEL_105;
            }
            matchNetworkNamePrefix = self->_matchNetworkNamePrefix;
            objc_msgSend_matchNetworkNamePrefix(v5, v218, v219, v220, v221);
            v262 = matchNetworkNamePrefix;
            v263 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (matchNetworkNamePrefix != v263)
            {
              if (!self->_matchNetworkNamePrefix)
              {
                v171 = 0;
LABEL_155:

LABEL_105:
                if (v266 != v267)
                {

                }
                goto LABEL_108;
              }
              objc_msgSend_matchNetworkNamePrefix(v5, v223, v224, v225, v226);
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v260)
              {
                v26 = 0;
                goto LABEL_134;
              }
              v231 = self->_matchNetworkNamePrefix;
              objc_msgSend_matchNetworkNamePrefix(v5, v227, v228, v229, v230);
              v258 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v231, v232, (uint64_t)v258, v233, v234) & 1) == 0)
              {

                if (v266 == v267)
                {
                  v235 = v266;
                }
                else
                {

                  v235 = v267;
                }

                if (v271 == v273)
                  goto LABEL_92;
                goto LABEL_91;
              }
            }
            filterPredicate = self->_filterPredicate;
            objc_msgSend_filterPredicate(v5, v223, v224, v225, v226);
            v261 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
            v259 = filterPredicate;
            if (filterPredicate != v261)
            {
              if (!self->_filterPredicate)
                goto LABEL_151;
              objc_msgSend_filterPredicate(v5, v237, v238, v239, v240);
              v257 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v257)
              {
LABEL_150:

                v171 = 0;
                goto LABEL_153;
              }
              v245 = self->_filterPredicate;
              objc_msgSend_filterPredicate(v5, v241, v242, v243, v244);
              v256 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_isEqual_(v245, v246, (uint64_t)v256, v247, v248))
              {
                v26 = 0;
LABEL_131:

                if (v262 == v263)
                {
                  v255 = v262;
                  goto LABEL_135;
                }

LABEL_134:
                v255 = v263;
LABEL_135:

                if (v266 != v267)
                {

                }
                if (v271 != v273)
                {

                }
                if (v274 != v275)
                {

                }
                if (v278 != v280)
                {

                }
                if (BSSID != v51)
                {

                }
                if (SSID != v32)
                {

                }
LABEL_33:
                v22 = v284;
                if (channels == v15)
                  goto LABEL_67;
                goto LABEL_66;
              }
            }
            includeBeaconCacheResults = self->_includeBeaconCacheResults;
            if (includeBeaconCacheResults == objc_msgSend_includeBeaconCacheResults(v5, v237, v238, v239, v240))
            {
              includeBackgroundScanCacheResults = self->_includeBackgroundScanCacheResults;
              v26 = includeBackgroundScanCacheResults == objc_msgSend_includeBackgroundScanCacheResults(v5, v250, v251, v252, v253);
              v171 = v26;
              if (v259 != v261)
                goto LABEL_131;
              goto LABEL_152;
            }
            if (v259 != v261)
            {

              goto LABEL_150;
            }
LABEL_151:
            v171 = 0;
LABEL_152:

LABEL_153:
            if (v262 != v263)
            {

            }
            goto LABEL_155;
          }

          v173 = v279;
          if (BSSID != v51)
            goto LABEL_71;
        }
        else
        {

          if (BSSID != v51)
          {
LABEL_69:
            v173 = v279;
LABEL_71:

LABEL_72:
            goto LABEL_74;
          }
        }

LABEL_74:
        if (SSID == v32)
          goto LABEL_31;
        goto LABEL_30;
      }
      v278 = SSIDList;
      v280 = v75;
      goto LABEL_37;
    }
LABEL_26:
    v26 = 0;
    goto LABEL_63;
  }
  if (!self->_BSSID)
    goto LABEL_26;
  objc_msgSend_BSSID(v5, v47, v48, v49, v50);
  v52 = objc_claimAutoreleasedReturnValue();
  if (!v52)
    goto LABEL_29;
  v281 = (void *)v52;
  v57 = self->_BSSID;
  objc_msgSend_BSSID(v5, v53, v54, v55, v56);
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = v57;
  v60 = (void *)v58;
  if ((objc_msgSend_isEqual_(v59, v61, v58, v62, v63) & 1) == 0)
  {

LABEL_29:
    if (SSID == v32)
    {

      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }
  v279 = v60;
  v68 = self->_shortSSID;
  if (v68 == objc_msgSend_shortSSID(v5, v64, v65, v66, v67))
    goto LABEL_21;
  v26 = 0;
LABEL_62:

LABEL_63:
  if (SSID != v32)
  {

  }
LABEL_65:
  v22 = v284;

  if (channels != v15)
    goto LABEL_66;
LABEL_67:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  CWFScanParameters *v4;
  CWFScanParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToScanParameters;

  v4 = (CWFScanParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToScanParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToScanParameters = objc_msgSend_isEqualToScanParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToScanParameters = 0;
  }

  return isEqualToScanParameters;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t minimumTimestamp;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL includeMatchingKnownNetworkProfiles;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t acceptableANQPCacheAgeForPasspointScanResults;
  unint64_t maximumANQPAgeForPasspointScanResults;
  _BOOL4 exclude6GChannels;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int8x16_t v63;
  unint64_t v64;
  BOOL includeHiddenNetworks;
  uint64_t v67;
  _BOOL8 mergeScanResults;
  uint64_t scanFlags;
  uint64_t v70;
  int8x16_t v71;
  int8x16_t v72;
  uint64_t v73;
  int scanType;
  int PHYMode;
  int BSSType;
  unint64_t shortSSID;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v82 = objc_msgSend_hash(self->_channels, a2, v2, v3, v4);
  v81 = objc_msgSend_hash(self->_SSID, v6, v7, v8, v9);
  v80 = objc_msgSend_hash(self->_BSSID, v10, v11, v12, v13);
  shortSSID = self->_shortSSID;
  v78 = objc_msgSend_hash(self->_SSIDList, v14, v15, v16, v17);
  v71 = *(int8x16_t *)&self->_numberOfScans;
  v72 = *(int8x16_t *)&self->_dwellTime;
  PHYMode = self->_PHYMode;
  BSSType = self->_BSSType;
  scanType = self->_scanType;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v18, self->_minimumRSSI, v19, v20);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_hash(v79, v21, v22, v23, v24);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v25, self->_maximumAge, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_hash(v28, v29, v30, v31, v32);
  mergeScanResults = self->_mergeScanResults;
  includeHiddenNetworks = self->_includeHiddenNetworks;
  scanFlags = self->_scanFlags;
  v70 = v33;
  minimumTimestamp = self->_minimumTimestamp;
  v67 = objc_msgSend_hash(self->_includeProperties, v35, v36, v37, v38);
  v43 = objc_msgSend_hash(self->_includeScanResults, v39, v40, v41, v42);
  includeMatchingKnownNetworkProfiles = self->_includeMatchingKnownNetworkProfiles;
  v49 = objc_msgSend_hash(self->_ANQPElementIDListForPasspointScanResults, v45, v46, v47, v48);
  acceptableANQPCacheAgeForPasspointScanResults = self->_acceptableANQPCacheAgeForPasspointScanResults;
  maximumANQPAgeForPasspointScanResults = self->_maximumANQPAgeForPasspointScanResults;
  exclude6GChannels = self->_exclude6GChannels;
  v57 = objc_msgSend_hash(self->_matchNetworkNamePrefix, v53, v54, v55, v56);
  v62 = objc_msgSend_hash(self->_filterPredicate, v58, v59, v60, v61);
  v63 = veorq_s8(v71, v72);
  v64 = *(_QWORD *)&veor_s8(*(int8x8_t *)v63.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v63, v63, 8uLL)) ^ shortSSID ^ minimumTimestamp ^ acceptableANQPCacheAgeForPasspointScanResults ^ maximumANQPAgeForPasspointScanResults ^ mergeScanResults ^ includeHiddenNetworks ^ includeMatchingKnownNetworkProfiles ^ v62 ^ scanFlags ^ PHYMode ^ scanType ^ BSSType ^ self->_includeBackgroundScanCacheResults ^ exclude6GChannels ^ self->_includeBeaconCacheResults ^ v57 ^ v49 ^ v43 ^ v67 ^ v81 ^ v82 ^ v70 ^ v73 ^ v78 ^ v80;

  return v64;
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
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFScanParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setSSID_(v11, v12, (uint64_t)self->_SSID, v13, v14);
  objc_msgSend_setBSSID_(v11, v15, (uint64_t)self->_BSSID, v16, v17);
  objc_msgSend_setShortSSID_(v11, v18, self->_shortSSID, v19, v20);
  objc_msgSend_setSSIDList_(v11, v21, (uint64_t)self->_SSIDList, v22, v23);
  objc_msgSend_setChannels_(v11, v24, (uint64_t)self->_channels, v25, v26);
  objc_msgSend_setBSSType_(v11, v27, self->_BSSType, v28, v29);
  objc_msgSend_setScanType_(v11, v30, self->_scanType, v31, v32);
  objc_msgSend_setAcceptableCacheAge_(v11, v33, self->_acceptableCacheAge, v34, v35);
  objc_msgSend_setMergeScanResults_(v11, v36, self->_mergeScanResults, v37, v38);
  objc_msgSend_setRestTime_(v11, v39, self->_restTime, v40, v41);
  objc_msgSend_setDwellTime_(v11, v42, self->_dwellTime, v43, v44);
  objc_msgSend_setNumberOfScans_(v11, v45, self->_numberOfScans, v46, v47);
  objc_msgSend_setPHYMode_(v11, v48, self->_PHYMode, v49, v50);
  objc_msgSend_setMinimumRSSI_(v11, v51, self->_minimumRSSI, v52, v53);
  objc_msgSend_setMaximumAge_(v11, v54, self->_maximumAge, v55, v56);
  objc_msgSend_setMinimumTimestamp_(v11, v57, self->_minimumTimestamp, v58, v59);
  objc_msgSend_setIncludeHiddenNetworks_(v11, v60, self->_includeHiddenNetworks, v61, v62);
  objc_msgSend_setScanFlags_(v11, v63, self->_scanFlags, v64, v65);
  objc_msgSend_setIncludeProperties_(v11, v66, (uint64_t)self->_includeProperties, v67, v68);
  objc_msgSend_setIncludeScanResults_(v11, v69, (uint64_t)self->_includeScanResults, v70, v71);
  objc_msgSend_setIncludeMatchingKnownNetworkProfiles_(v11, v72, self->_includeMatchingKnownNetworkProfiles, v73, v74);
  objc_msgSend_setANQPElementIDListForPasspointScanResults_(v11, v75, (uint64_t)self->_ANQPElementIDListForPasspointScanResults, v76, v77);
  objc_msgSend_setAcceptableANQPCacheAgeForPasspointScanResults_(v11, v78, self->_acceptableANQPCacheAgeForPasspointScanResults, v79, v80);
  objc_msgSend_setMaximumANQPAgeForPasspointScanResults_(v11, v81, self->_maximumANQPAgeForPasspointScanResults, v82, v83);
  objc_msgSend_setExclude6GChannels_(v11, v84, self->_exclude6GChannels, v85, v86);
  objc_msgSend_setMatchNetworkNamePrefix_(v11, v87, (uint64_t)self->_matchNetworkNamePrefix, v88, v89);
  objc_msgSend_setFilterPredicate_(v11, v90, (uint64_t)self->_filterPredicate, v91, v92);
  objc_msgSend_setIncludeBeaconCacheResults_(v11, v93, self->_includeBeaconCacheResults, v94, v95);
  objc_msgSend_setIncludeBackgroundScanCacheResults_(v11, v96, self->_includeBackgroundScanCacheResults, v97, v98);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *SSID;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  id v99;

  SSID = self->_SSID;
  v99 = a3;
  objc_msgSend_encodeObject_forKey_(v99, v5, (uint64_t)SSID, (uint64_t)CFSTR("_SSID"), v6);
  objc_msgSend_encodeObject_forKey_(v99, v7, (uint64_t)self->_BSSID, (uint64_t)CFSTR("_BSSID"), v8);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v9, self->_shortSSID, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v13, (uint64_t)v12, (uint64_t)CFSTR("_shortSSID"), v14);

  objc_msgSend_encodeObject_forKey_(v99, v15, (uint64_t)self->_SSIDList, (uint64_t)CFSTR("_SSIDList"), v16);
  objc_msgSend_encodeObject_forKey_(v99, v17, (uint64_t)self->_channels, (uint64_t)CFSTR("_channels"), v18);
  objc_msgSend_encodeInteger_forKey_(v99, v19, self->_scanType, (uint64_t)CFSTR("_scanType"), v20);
  objc_msgSend_encodeInteger_forKey_(v99, v21, self->_PHYMode, (uint64_t)CFSTR("_PHYMode"), v22);
  objc_msgSend_encodeInteger_forKey_(v99, v23, self->_BSSType, (uint64_t)CFSTR("_BSSType"), v24);
  objc_msgSend_encodeInteger_forKey_(v99, v25, self->_minimumRSSI, (uint64_t)CFSTR("_minimumRSSI"), v26);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, self->_maximumAge, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v31, (uint64_t)v30, (uint64_t)CFSTR("_maximumAge"), v32);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v33, self->_minimumTimestamp, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v37, (uint64_t)v36, (uint64_t)CFSTR("_minimumTimestamp"), v38);

  objc_msgSend_encodeBool_forKey_(v99, v39, self->_includeHiddenNetworks, (uint64_t)CFSTR("_includeHiddenNetworks"), v40);
  objc_msgSend_encodeBool_forKey_(v99, v41, self->_mergeScanResults, (uint64_t)CFSTR("_mergeScanResults"), v42);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v43, self->_restTime, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v47, (uint64_t)v46, (uint64_t)CFSTR("_restTime"), v48);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v49, self->_dwellTime, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v53, (uint64_t)v52, (uint64_t)CFSTR("_dwellTime"), v54);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v55, self->_numberOfScans, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v59, (uint64_t)v58, (uint64_t)CFSTR("_numberOfScans"), v60);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v61, self->_acceptableCacheAge, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v65, (uint64_t)v64, (uint64_t)CFSTR("_acceptableCacheAge"), v66);

  objc_msgSend_encodeInteger_forKey_(v99, v67, self->_scanFlags, (uint64_t)CFSTR("_scanFlags"), v68);
  objc_msgSend_encodeObject_forKey_(v99, v69, (uint64_t)self->_includeProperties, (uint64_t)CFSTR("_includeProperties"), v70);
  objc_msgSend_encodeObject_forKey_(v99, v71, (uint64_t)self->_includeScanResults, (uint64_t)CFSTR("_includeScanResults"), v72);
  objc_msgSend_encodeBool_forKey_(v99, v73, self->_includeMatchingKnownNetworkProfiles, (uint64_t)CFSTR("_includeMatchingKnownNetworkProfiles"), v74);
  objc_msgSend_encodeObject_forKey_(v99, v75, (uint64_t)self->_ANQPElementIDListForPasspointScanResults, (uint64_t)CFSTR("_ANQPElementIDListForPasspointScanResults"), v76);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v77, self->_acceptableANQPCacheAgeForPasspointScanResults, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v81, (uint64_t)v80, (uint64_t)CFSTR("_acceptableANQPCacheAgeForPasspointScanResults"), v82);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v83, self->_maximumANQPAgeForPasspointScanResults, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v87, (uint64_t)v86, (uint64_t)CFSTR("_maximumANQPAgeForPasspointScanResults"), v88);

  objc_msgSend_encodeBool_forKey_(v99, v89, self->_exclude6GChannels, (uint64_t)CFSTR("_exclude6GChannels"), v90);
  objc_msgSend_encodeObject_forKey_(v99, v91, (uint64_t)self->_matchNetworkNamePrefix, (uint64_t)CFSTR("_matchNetworkNamePrefix"), v92);
  objc_msgSend_encodeObject_forKey_(v99, v93, (uint64_t)self->_filterPredicate, (uint64_t)CFSTR("_filterPredicate"), v94);
  objc_msgSend_encodeBool_forKey_(v99, v95, self->_includeBeaconCacheResults, (uint64_t)CFSTR("_includeBeaconCacheResults"), v96);
  objc_msgSend_encodeBool_forKey_(v99, v97, self->_includeBackgroundScanCacheResults, (uint64_t)CFSTR("_includeBackgroundScanCacheResults"), v98);

}

- (CWFScanParameters)initWithCoder:(id)a3
{
  id v4;
  CWFScanParameters *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *SSID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *BSSID;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *SSIDList;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSArray *channels;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  NSSet *includeProperties;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  NSArray *includeScanResults;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  NSArray *ANQPElementIDListForPasspointScanResults;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  NSString *matchNetworkNamePrefix;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  NSPredicate *filterPredicate;
  const char *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  objc_super v194;

  v4 = a3;
  v194.receiver = self;
  v194.super_class = (Class)CWFScanParameters;
  v5 = -[CWFScanParameters init](&v194, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_SSID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_BSSID"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_shortSSID"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shortSSID = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22, v23);

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend_setWithObjects_(v24, v27, v25, v28, v29, v26, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("_SSIDList"), v32);
    v33 = objc_claimAutoreleasedReturnValue();
    SSIDList = v5->_SSIDList;
    v5->_SSIDList = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend_setWithObjects_(v35, v38, v36, v39, v40, v37, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v42, (uint64_t)v41, (uint64_t)CFSTR("_channels"), v43);
    v44 = objc_claimAutoreleasedReturnValue();
    channels = v5->_channels;
    v5->_channels = (NSArray *)v44;

    v5->_scanType = objc_msgSend_decodeIntegerForKey_(v4, v46, (uint64_t)CFSTR("_scanType"), v47, v48);
    v5->_BSSType = objc_msgSend_decodeIntegerForKey_(v4, v49, (uint64_t)CFSTR("_BSSType"), v50, v51);
    v5->_PHYMode = objc_msgSend_decodeIntegerForKey_(v4, v52, (uint64_t)CFSTR("_PHYMode"), v53, v54);
    v5->_minimumRSSI = objc_msgSend_decodeIntegerForKey_(v4, v55, (uint64_t)CFSTR("_minimumRSSI"), v56, v57);
    v58 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, (uint64_t)CFSTR("_maximumAge"), v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumAge = objc_msgSend_unsignedIntegerValue(v61, v62, v63, v64, v65);

    v66 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("_minimumTimestamp"), v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumTimestamp = objc_msgSend_unsignedLongLongValue(v69, v70, v71, v72, v73);

    v5->_includeHiddenNetworks = objc_msgSend_decodeBoolForKey_(v4, v74, (uint64_t)CFSTR("_includeHiddenNetworks"), v75, v76);
    v5->_mergeScanResults = objc_msgSend_decodeBoolForKey_(v4, v77, (uint64_t)CFSTR("_mergeScanResults"), v78, v79);
    v80 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, (uint64_t)CFSTR("_restTime"), v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_restTime = objc_msgSend_unsignedIntegerValue(v83, v84, v85, v86, v87);

    v88 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v88, (uint64_t)CFSTR("_dwellTime"), v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dwellTime = objc_msgSend_unsignedIntegerValue(v91, v92, v93, v94, v95);

    v96 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, (uint64_t)CFSTR("_numberOfScans"), v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfScans = objc_msgSend_unsignedIntegerValue(v99, v100, v101, v102, v103);

    v104 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v105, v104, (uint64_t)CFSTR("_acceptableCacheAge"), v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_acceptableCacheAge = objc_msgSend_unsignedIntegerValue(v107, v108, v109, v110, v111);

    v5->_scanFlags = objc_msgSend_decodeIntegerForKey_(v4, v112, (uint64_t)CFSTR("_scanFlags"), v113, v114);
    v115 = (void *)MEMORY[0x1E0C99E60];
    v116 = objc_opt_class();
    v117 = objc_opt_class();
    objc_msgSend_setWithObjects_(v115, v118, v116, v119, v120, v117, 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v122, (uint64_t)v121, (uint64_t)CFSTR("_includeProperties"), v123);
    v124 = objc_claimAutoreleasedReturnValue();
    includeProperties = v5->_includeProperties;
    v5->_includeProperties = (NSSet *)v124;

    v126 = (void *)MEMORY[0x1E0C99E60];
    v127 = objc_opt_class();
    v128 = objc_opt_class();
    objc_msgSend_setWithObjects_(v126, v129, v127, v130, v131, v128, 0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v133, (uint64_t)v132, (uint64_t)CFSTR("_includeScanResults"), v134);
    v135 = objc_claimAutoreleasedReturnValue();
    includeScanResults = v5->_includeScanResults;
    v5->_includeScanResults = (NSArray *)v135;

    v5->_includeMatchingKnownNetworkProfiles = objc_msgSend_decodeBoolForKey_(v4, v137, (uint64_t)CFSTR("_includeMatchingKnownNetworkProfiles"), v138, v139);
    v140 = (void *)MEMORY[0x1E0C99E60];
    v141 = objc_opt_class();
    v142 = objc_opt_class();
    objc_msgSend_setWithObjects_(v140, v143, v141, v144, v145, v142, 0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v147, (uint64_t)v146, (uint64_t)CFSTR("_ANQPElementIDListForPasspointScanResults"), v148);
    v149 = objc_claimAutoreleasedReturnValue();
    ANQPElementIDListForPasspointScanResults = v5->_ANQPElementIDListForPasspointScanResults;
    v5->_ANQPElementIDListForPasspointScanResults = (NSArray *)v149;

    v151 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v152, v151, (uint64_t)CFSTR("_acceptableANQPCacheAgeForPasspointScanResults"), v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_acceptableANQPCacheAgeForPasspointScanResults = objc_msgSend_unsignedIntegerValue(v154, v155, v156, v157, v158);

    v159 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v160, v159, (uint64_t)CFSTR("_maximumANQPAgeForPasspointScanResults"), v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumANQPAgeForPasspointScanResults = objc_msgSend_unsignedIntegerValue(v162, v163, v164, v165, v166);

    v5->_exclude6GChannels = objc_msgSend_decodeBoolForKey_(v4, v167, (uint64_t)CFSTR("_exclude6GChannels"), v168, v169);
    v170 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v171, v170, (uint64_t)CFSTR("_matchNetworkNamePrefix"), v172);
    v173 = objc_claimAutoreleasedReturnValue();
    matchNetworkNamePrefix = v5->_matchNetworkNamePrefix;
    v5->_matchNetworkNamePrefix = (NSString *)v173;

    v175 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v176, v175, (uint64_t)CFSTR("_filterPredicate"), v177);
    v178 = objc_claimAutoreleasedReturnValue();
    filterPredicate = v5->_filterPredicate;
    v5->_filterPredicate = (NSPredicate *)v178;

    objc_msgSend_acceptVisitor_flags_(v5->_filterPredicate, v180, (uint64_t)v5, 3, v181);
    if ((objc_msgSend_invalidPredicate(v5, v182, v183, v184, v185) & 1) == 0)
      objc_msgSend_allowEvaluation(v5->_filterPredicate, v186, v187, v188, v189);
    v5->_includeBeaconCacheResults = objc_msgSend_decodeBoolForKey_(v4, v186, (uint64_t)CFSTR("_includeBeaconCacheResults"), v188, v189);
    v5->_includeBackgroundScanCacheResults = objc_msgSend_decodeBoolForKey_(v4, v190, (uint64_t)CFSTR("_includeBackgroundScanCacheResults"), v191, v192);
  }

  return v5;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend_expressionType(a3, a2, (uint64_t)a3, v3, v4);
  if (v6 <= 0x13 && ((1 << v6) & 0x8001C) != 0)
    MEMORY[0x1E0DE7D20](self, sel_setInvalidPredicate_, 1, v7, v8);
}

- (void)visitPredicateOperator:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend_operatorType(a3, a2, (uint64_t)a3, v3, v4);
  if (v6 == 11 || v6 == 6)
    MEMORY[0x1E0DE7D20](self, sel_setInvalidPredicate_, 1, v7, v8);
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)shortSSID
{
  return self->_shortSSID;
}

- (void)setShortSSID:(unint64_t)a3
{
  self->_shortSSID = a3;
}

- (NSArray)SSIDList
{
  return self->_SSIDList;
}

- (void)setSSIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)numberOfScans
{
  return self->_numberOfScans;
}

- (void)setNumberOfScans:(unint64_t)a3
{
  self->_numberOfScans = a3;
}

- (unint64_t)restTime
{
  return self->_restTime;
}

- (void)setRestTime:(unint64_t)a3
{
  self->_restTime = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_dwellTime = a3;
}

- (unint64_t)acceptableCacheAge
{
  return self->_acceptableCacheAge;
}

- (void)setAcceptableCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = a3;
}

- (int)BSSType
{
  return self->_BSSType;
}

- (void)setBSSType:(int)a3
{
  self->_BSSType = a3;
}

- (int)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(int)a3
{
  self->_PHYMode = a3;
}

- (int)scanType
{
  return self->_scanType;
}

- (void)setScanType:(int)a3
{
  self->_scanType = a3;
}

- (int64_t)minimumRSSI
{
  return self->_minimumRSSI;
}

- (void)setMinimumRSSI:(int64_t)a3
{
  self->_minimumRSSI = a3;
}

- (unint64_t)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(unint64_t)a3
{
  self->_maximumAge = a3;
}

- (unint64_t)minimumTimestamp
{
  return self->_minimumTimestamp;
}

- (void)setMinimumTimestamp:(unint64_t)a3
{
  self->_minimumTimestamp = a3;
}

- (BOOL)mergeScanResults
{
  return self->_mergeScanResults;
}

- (void)setMergeScanResults:(BOOL)a3
{
  self->_mergeScanResults = a3;
}

- (BOOL)includeHiddenNetworks
{
  return self->_includeHiddenNetworks;
}

- (void)setIncludeHiddenNetworks:(BOOL)a3
{
  self->_includeHiddenNetworks = a3;
}

- (int)scanFlags
{
  return self->_scanFlags;
}

- (void)setScanFlags:(int)a3
{
  self->_scanFlags = a3;
}

- (NSSet)includeProperties
{
  return self->_includeProperties;
}

- (void)setIncludeProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)includeScanResults
{
  return self->_includeScanResults;
}

- (void)setIncludeScanResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)includeMatchingKnownNetworkProfiles
{
  return self->_includeMatchingKnownNetworkProfiles;
}

- (void)setIncludeMatchingKnownNetworkProfiles:(BOOL)a3
{
  self->_includeMatchingKnownNetworkProfiles = a3;
}

- (NSArray)ANQPElementIDListForPasspointScanResults
{
  return self->_ANQPElementIDListForPasspointScanResults;
}

- (void)setANQPElementIDListForPasspointScanResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)acceptableANQPCacheAgeForPasspointScanResults
{
  return self->_acceptableANQPCacheAgeForPasspointScanResults;
}

- (void)setAcceptableANQPCacheAgeForPasspointScanResults:(unint64_t)a3
{
  self->_acceptableANQPCacheAgeForPasspointScanResults = a3;
}

- (unint64_t)maximumANQPAgeForPasspointScanResults
{
  return self->_maximumANQPAgeForPasspointScanResults;
}

- (void)setMaximumANQPAgeForPasspointScanResults:(unint64_t)a3
{
  self->_maximumANQPAgeForPasspointScanResults = a3;
}

- (BOOL)exclude6GChannels
{
  return self->_exclude6GChannels;
}

- (void)setExclude6GChannels:(BOOL)a3
{
  self->_exclude6GChannels = a3;
}

- (NSString)matchNetworkNamePrefix
{
  return self->_matchNetworkNamePrefix;
}

- (void)setMatchNetworkNamePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)includeBeaconCacheResults
{
  return self->_includeBeaconCacheResults;
}

- (void)setIncludeBeaconCacheResults:(BOOL)a3
{
  self->_includeBeaconCacheResults = a3;
}

- (BOOL)includeBackgroundScanCacheResults
{
  return self->_includeBackgroundScanCacheResults;
}

- (void)setIncludeBackgroundScanCacheResults:(BOOL)a3
{
  self->_includeBackgroundScanCacheResults = a3;
}

- (BOOL)invalidPredicate
{
  return self->_invalidPredicate;
}

- (void)setInvalidPredicate:(BOOL)a3
{
  self->_invalidPredicate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_matchNetworkNamePrefix, 0);
  objc_storeStrong((id *)&self->_ANQPElementIDListForPasspointScanResults, 0);
  objc_storeStrong((id *)&self->_includeScanResults, 0);
  objc_storeStrong((id *)&self->_includeProperties, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_SSIDList, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_channels, 0);
}

@end
