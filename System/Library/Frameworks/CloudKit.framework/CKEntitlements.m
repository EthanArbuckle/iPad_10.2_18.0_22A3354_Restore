@implementation CKEntitlements

- (BOOL)isBackgroundAssetsExtension
{
  uint64_t v2;
  uint64_t v3;
  BOOL v5;
  void *v8;
  const char *v9;

  if (byte_1EDF6A0E0)
    v5 = byte_1EDF75458 == 0;
  else
    v5 = 0;
  if (v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, CFSTR("CKEntitlements.m"), 433, CFSTR("This value should only be read in the daemon"));

  }
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.isBackgroundAssetsExtension"));
}

- (BOOL)isEqual:(id)a3
{
  CKEntitlements *v4;
  CKEntitlements *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int isEqual;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  int v74;
  _BOOL4 v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  int hasMasqueradingEntitlement;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  int hasProtectionDataEntitlement;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  int hasZoneProtectionDataEntitlement;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  int hasCloudKitSystemServiceEntitlement;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  int hasSystemLaunchDaemonEntitlement;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  int hasDarkWakeNetworkReachabilityEnabledEntitlement;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  int hasAllowAccessDuringBuddyEntitlement;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  int hasLightweightPCSEntitlement;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  int hasOutOfProcessUIEntitlement;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  int hasParticipantPIIEntitlement;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  int hasDisplaysSystemAcceptPromptEntitlement;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  int v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  int hasNonLegacyShareURLEntitlement;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  int hasAllowUnverifiedAccountEntitlement;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  unsigned int v190;
  int hasAllowRealTimeOperationsEntitlement;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  int hasExplicitCodeOperationURLEntitlement;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  int v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  int v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  int v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  int hasVFSOpenByIDEntitlement;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  int hasNetworkSocketDelegateEntitlement;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  int hasAllowPackagesEntitlement;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  int hasEnvironmentEntitlement;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  int hasCustomAccountsEntitlement;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  int v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  int hasAssetBoundaryKeyEntitlement;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  int hasTemporaryDeviceCapabilitiesEntitlement;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  int hasAllowFakeEntitlementsEntitlement;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  int v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  void *v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  int v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  int hasAlwaysAllowPublishAssetsEntitlement;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  int hasAllowOnDeviceAssetStreamingEntitlement;
  const char *v397;
  uint64_t v398;
  uint64_t v399;

  v4 = (CKEntitlements *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sub_18A5CD2C4(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18A5CD2C4(self);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        sub_18A5CD2C4(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18A5CD2C4(self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v9, v11, (uint64_t)v10, v12);

        if (!isEqual)
          goto LABEL_78;
      }
      objc_msgSend_applicationBundleID(v5, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleID(self, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v22)
      {

      }
      else
      {
        v26 = (void *)v22;
        objc_msgSend_applicationBundleID(v5, v23, v24, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applicationBundleID(self, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend_isEqual_(v27, v32, (uint64_t)v31, v33);

        if (!v34)
          goto LABEL_78;
      }
      objc_msgSend_associatedApplicationBundleID(v5, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_associatedApplicationBundleID(self, v39, v40, v41);
      v42 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v42)
      {

      }
      else
      {
        v46 = (void *)v42;
        objc_msgSend_associatedApplicationBundleID(v5, v43, v44, v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_associatedApplicationBundleID(self, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_isEqual_(v47, v52, (uint64_t)v51, v53);

        if (!v54)
          goto LABEL_78;
      }
      objc_msgSend_apsEnvironmentEntitlement(v5, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apsEnvironmentEntitlement(self, v59, v60, v61);
      v62 = objc_claimAutoreleasedReturnValue();
      if (v58 == (void *)v62)
      {

      }
      else
      {
        v66 = (void *)v62;
        objc_msgSend_apsEnvironmentEntitlement(v5, v63, v64, v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apsEnvironmentEntitlement(self, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend_isEqual_(v67, v72, (uint64_t)v71, v73);

        if (!v74)
          goto LABEL_78;
      }
      v75 = sub_18A5CD440(v5);
      if (v75 != sub_18A5CD440(self))
        goto LABEL_78;
      hasMasqueradingEntitlement = objc_msgSend_hasMasqueradingEntitlement(v5, v76, v77, v78);
      if (hasMasqueradingEntitlement != objc_msgSend_hasMasqueradingEntitlement(self, v80, v81, v82))
        goto LABEL_78;
      hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v5, v83, v84, v85);
      if (hasProtectionDataEntitlement != objc_msgSend_hasProtectionDataEntitlement(self, v87, v88, v89))
        goto LABEL_78;
      hasZoneProtectionDataEntitlement = objc_msgSend_hasZoneProtectionDataEntitlement(v5, v90, v91, v92);
      if (hasZoneProtectionDataEntitlement != objc_msgSend_hasZoneProtectionDataEntitlement(self, v94, v95, v96))goto LABEL_78;
      hasCloudKitSystemServiceEntitlement = objc_msgSend_hasCloudKitSystemServiceEntitlement(v5, v97, v98, v99);
      if (hasCloudKitSystemServiceEntitlement != objc_msgSend_hasCloudKitSystemServiceEntitlement(self, v101, v102, v103))goto LABEL_78;
      hasSystemLaunchDaemonEntitlement = objc_msgSend_hasSystemLaunchDaemonEntitlement(v5, v104, v105, v106);
      if (hasSystemLaunchDaemonEntitlement != objc_msgSend_hasSystemLaunchDaemonEntitlement(self, v108, v109, v110))goto LABEL_78;
      hasDarkWakeNetworkReachabilityEnabledEntitlement = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v5, v111, v112, v113);
      if (hasDarkWakeNetworkReachabilityEnabledEntitlement != objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(self, v115, v116, v117))goto LABEL_78;
      hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v5, v118, v119, v120);
      if (hasAllowAccessDuringBuddyEntitlement != objc_msgSend_hasAllowAccessDuringBuddyEntitlement(self, v122, v123, v124))goto LABEL_78;
      hasLightweightPCSEntitlement = objc_msgSend_hasLightweightPCSEntitlement(v5, v125, v126, v127);
      if (hasLightweightPCSEntitlement != objc_msgSend_hasLightweightPCSEntitlement(self, v129, v130, v131))goto LABEL_78;
      hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v5, v132, v133, v134);
      if (hasOutOfProcessUIEntitlement != objc_msgSend_hasOutOfProcessUIEntitlement(self, v136, v137, v138))goto LABEL_78;
      hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v5, v139, v140, v141);
      if (hasParticipantPIIEntitlement != objc_msgSend_hasParticipantPIIEntitlement(self, v143, v144, v145))goto LABEL_78;
      hasDisplaysSystemAcceptPromptEntitlement = objc_msgSend_hasDisplaysSystemAcceptPromptEntitlement(v5, v146, v147, v148);
      if (hasDisplaysSystemAcceptPromptEntitlement != objc_msgSend_hasDisplaysSystemAcceptPromptEntitlement(self, v150, v151, v152))goto LABEL_78;
      objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v5, v153, v154, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(self, v157, v158, v159);
      v160 = objc_claimAutoreleasedReturnValue();
      if (v156 == (void *)v160)
      {

      }
      else
      {
        v164 = (void *)v160;
        objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v5, v161, v162, v163);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(self, v166, v167, v168);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v172 = objc_msgSend_isEqual_(v165, v170, (uint64_t)v169, v171);

        if (!v172)
          goto LABEL_78;
      }
      hasNonLegacyShareURLEntitlement = objc_msgSend_hasNonLegacyShareURLEntitlement(v5, v173, v174, v175);
      if (hasNonLegacyShareURLEntitlement != objc_msgSend_hasNonLegacyShareURLEntitlement(self, v177, v178, v179))goto LABEL_78;
      hasAllowUnverifiedAccountEntitlement = objc_msgSend_hasAllowUnverifiedAccountEntitlement(v5, v180, v181, v182);
      if (hasAllowUnverifiedAccountEntitlement != objc_msgSend_hasAllowUnverifiedAccountEntitlement(self, v184, v185, v186))goto LABEL_78;
      if (v5)
      {
        v190 = sub_18A5CD0A0(v5, CFSTR("com.apple.private.cloudkit.notifyOnAccountWarmup"));
        if (self)
        {
          if (v190 != sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.notifyOnAccountWarmup")))
            goto LABEL_78;
        }
        else if ((v190 & 1) != 0)
        {
          goto LABEL_78;
        }
      }
      else if (self
             && (sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.notifyOnAccountWarmup")) & 1) != 0)
      {
        goto LABEL_78;
      }
      hasAllowRealTimeOperationsEntitlement = objc_msgSend_hasAllowRealTimeOperationsEntitlement(v5, v187, v188, v189);
      if (hasAllowRealTimeOperationsEntitlement != objc_msgSend_hasAllowRealTimeOperationsEntitlement(self, v192, v193, v194))goto LABEL_78;
      hasExplicitCodeOperationURLEntitlement = objc_msgSend_hasExplicitCodeOperationURLEntitlement(v5, v195, v196, v197);
      if (hasExplicitCodeOperationURLEntitlement != objc_msgSend_hasExplicitCodeOperationURLEntitlement(self, v199, v200, v201))goto LABEL_78;
      objc_msgSend_codeServiceURLEntitlement(v5, v202, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_codeServiceURLEntitlement(self, v206, v207, v208);
      v209 = objc_claimAutoreleasedReturnValue();
      if (v205 == (void *)v209)
      {

      }
      else
      {
        v213 = (void *)v209;
        objc_msgSend_codeServiceURLEntitlement(v5, v210, v211, v212);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_codeServiceURLEntitlement(self, v215, v216, v217);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v221 = objc_msgSend_isEqual_(v214, v219, (uint64_t)v218, v220);

        if (!v221)
          goto LABEL_78;
      }
      objc_msgSend_codeServiceURLByServiceEntitlement(v5, v222, v223, v224);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_codeServiceURLByServiceEntitlement(self, v226, v227, v228);
      v229 = objc_claimAutoreleasedReturnValue();
      if (v225 == (void *)v229)
      {

      }
      else
      {
        v233 = (void *)v229;
        objc_msgSend_codeServiceURLByServiceEntitlement(v5, v230, v231, v232);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_codeServiceURLByServiceEntitlement(self, v235, v236, v237);
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v241 = objc_msgSend_isEqual_(v234, v239, (uint64_t)v238, v240);

        if (!v241)
          goto LABEL_78;
      }
      objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(v5, v242, v243, v244);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(self, v246, v247, v248);
      v249 = objc_claimAutoreleasedReturnValue();
      if (v245 == (void *)v249)
      {

      }
      else
      {
        v253 = (void *)v249;
        objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(v5, v250, v251, v252);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(self, v255, v256, v257);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        v261 = objc_msgSend_isEqual_(v254, v259, (uint64_t)v258, v260);

        if (!v261)
          goto LABEL_78;
      }
      hasVFSOpenByIDEntitlement = objc_msgSend_hasVFSOpenByIDEntitlement(v5, v262, v263, v264);
      if (hasVFSOpenByIDEntitlement != objc_msgSend_hasVFSOpenByIDEntitlement(self, v266, v267, v268))
        goto LABEL_78;
      hasNetworkSocketDelegateEntitlement = objc_msgSend_hasNetworkSocketDelegateEntitlement(v5, v269, v270, v271);
      if (hasNetworkSocketDelegateEntitlement != objc_msgSend_hasNetworkSocketDelegateEntitlement(self, v273, v274, v275))goto LABEL_78;
      hasAllowPackagesEntitlement = objc_msgSend_hasAllowPackagesEntitlement(v5, v276, v277, v278);
      if (hasAllowPackagesEntitlement != objc_msgSend_hasAllowPackagesEntitlement(self, v280, v281, v282))
        goto LABEL_78;
      hasEnvironmentEntitlement = objc_msgSend_hasEnvironmentEntitlement(v5, v283, v284, v285);
      if (hasEnvironmentEntitlement != objc_msgSend_hasEnvironmentEntitlement(self, v287, v288, v289))
        goto LABEL_78;
      hasCustomAccountsEntitlement = objc_msgSend_hasCustomAccountsEntitlement(v5, v290, v291, v292);
      if (hasCustomAccountsEntitlement != objc_msgSend_hasCustomAccountsEntitlement(self, v294, v295, v296))goto LABEL_78;
      objc_msgSend_clientPrefixEntitlement(v5, v297, v298, v299);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientPrefixEntitlement(self, v301, v302, v303);
      v304 = objc_claimAutoreleasedReturnValue();
      if (v300 == (void *)v304)
      {

      }
      else
      {
        v308 = (void *)v304;
        objc_msgSend_clientPrefixEntitlement(v5, v305, v306, v307);
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clientPrefixEntitlement(self, v310, v311, v312);
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        v316 = objc_msgSend_isEqual_(v309, v314, (uint64_t)v313, v315);

        if (!v316)
          goto LABEL_78;
      }
      hasAssetBoundaryKeyEntitlement = objc_msgSend_hasAssetBoundaryKeyEntitlement(v5, v317, v318, v319);
      if (hasAssetBoundaryKeyEntitlement != objc_msgSend_hasAssetBoundaryKeyEntitlement(self, v321, v322, v323))goto LABEL_78;
      hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v5, v324, v325, v326);
      if (hasTemporaryDeviceCapabilitiesEntitlement != objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(self, v328, v329, v330))goto LABEL_78;
      hasAllowFakeEntitlementsEntitlement = objc_msgSend_hasAllowFakeEntitlementsEntitlement(v5, v331, v332, v333);
      if (hasAllowFakeEntitlementsEntitlement != objc_msgSend_hasAllowFakeEntitlementsEntitlement(self, v335, v336, v337))goto LABEL_78;
      v341 = objc_msgSend_containerEnvironment(v5, v338, v339, v340);
      if (v341 != objc_msgSend_containerEnvironment(self, v342, v343, v344))
        goto LABEL_78;
      objc_msgSend_developmentContainerEnvironmentOverrides(v5, v345, v346, v347);
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_developmentContainerEnvironmentOverrides(self, v349, v350, v351);
      v352 = objc_claimAutoreleasedReturnValue();
      if (v348 == (void *)v352)
      {

      }
      else
      {
        v356 = (void *)v352;
        objc_msgSend_developmentContainerEnvironmentOverrides(v5, v353, v354, v355);
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_developmentContainerEnvironmentOverrides(self, v358, v359, v360);
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        v364 = objc_msgSend_isEqual_(v357, v362, (uint64_t)v361, v363);

        if (!v364)
          goto LABEL_78;
      }
      objc_msgSend_cloudServices(v5, v365, v366, v367);
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cloudServices(self, v369, v370, v371);
      v372 = objc_claimAutoreleasedReturnValue();
      if (v368 == (void *)v372)
      {

      }
      else
      {
        v376 = (void *)v372;
        objc_msgSend_cloudServices(v5, v373, v374, v375);
        v377 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cloudServices(self, v378, v379, v380);
        v381 = (void *)objc_claimAutoreleasedReturnValue();
        v384 = objc_msgSend_isEqual_(v377, v382, (uint64_t)v381, v383);

        if (!v384)
          goto LABEL_78;
      }
      hasAlwaysAllowPublishAssetsEntitlement = objc_msgSend_hasAlwaysAllowPublishAssetsEntitlement(v5, v385, v386, v387);
      if (hasAlwaysAllowPublishAssetsEntitlement == objc_msgSend_hasAlwaysAllowPublishAssetsEntitlement(self, v389, v390, v391))
      {
        hasAllowOnDeviceAssetStreamingEntitlement = objc_msgSend_hasAllowOnDeviceAssetStreamingEntitlement(v5, v392, v393, v394);
        v17 = hasAllowOnDeviceAssetStreamingEntitlement ^ objc_msgSend_hasAllowOnDeviceAssetStreamingEntitlement(self, v397, v398, v399) ^ 1;
        goto LABEL_79;
      }
LABEL_78:
      LOBYTE(v17) = 0;
LABEL_79:

      goto LABEL_80;
    }
    LOBYTE(v17) = 0;
  }
LABEL_80:

  return v17;
}

- (NSArray)cloudServices
{
  return (NSArray *)sub_18A5E9210(self, CFSTR("com.apple.developer.icloud-services"));
}

- (BOOL)hasCloudKitSystemServiceEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.systemService"));
}

- (NSString)applicationBundleID
{
  CKEntitlements *v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  NSString *procName;
  NSString *v7;
  void *v8;
  int pid;
  NSString *v10;
  NSString *cachedApplicationBundleID;
  _QWORD v13[5];
  char buffer[1024];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2 || (v3 = v2->_cachedApplicationBundleID) == 0)
  {
    sub_18A5CD2C4(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (v2)
        procName = v2->_procName;
      else
        procName = 0;
      v7 = procName;
      CKAppIdentifierFromTeamAppTuple(v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        objc_storeStrong((id *)&v2->_cachedApplicationBundleID, v8);

    }
    else
    {
      if (v2)
        pid = v2->_pid;
      else
        pid = 0;
      buffer[0] = 0;
      if (proc_pidinfo(pid, 11, 1uLL, buffer, 1024) || !buffer[0])
      {
LABEL_18:
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = sub_18A7F1550;
        v13[3] = &unk_1E1F5FAA8;
        v13[4] = v2;
        if (qword_1ECD969F0 == -1)
        {
          if (v2)
          {
LABEL_20:
            cachedApplicationBundleID = v2->_cachedApplicationBundleID;
LABEL_21:
            v4 = cachedApplicationBundleID;

            goto LABEL_22;
          }
        }
        else
        {
          dispatch_once(&qword_1ECD969F0, v13);
          if (v2)
            goto LABEL_20;
        }
        cachedApplicationBundleID = 0;
        goto LABEL_21;
      }
      if (v2)
        v10 = v2->_procName;
      else
        v10 = 0;
      v7 = v10;
      CKWarnForInvalidApplicationIdentifier(0, v7);
    }

    goto LABEL_18;
  }
  v4 = v3;
LABEL_22:
  objc_sync_exit(v2);

  return v4;
}

- (NSDictionary)serviceNameForContainerIdentifierMapEntitlement
{
  return (NSDictionary *)sub_18A5E9210(self, CFSTR("com.apple.private.cloudkit.serviceNameForContainerMap"));
}

- (BOOL)hasMasqueradingEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.masquerade"));
}

- (BOOL)hasEnvironmentEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.setEnvironment"));
}

- (BOOL)hasZoneProtectionDataEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.zoneprotectiondata"));
}

- (BOOL)hasVFSOpenByIDEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.vfs.open-by-id"));
}

- (BOOL)hasSystemLaunchDaemonEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.systemLaunchDaemonAccess"));
}

- (BOOL)hasProtectionDataEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.protectiondata"));
}

- (BOOL)hasParticipantPIIEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.participant-pii"));
}

- (BOOL)hasOutOfProcessUIEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.oopui"));
}

- (BOOL)hasNonLegacyShareURLEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.nonLegacySharingURL"));
}

- (BOOL)hasNetworkSocketDelegateEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.network.socket-delegate"));
}

- (BOOL)hasLightweightPCSEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.lightweightPCS"));
}

- (BOOL)hasExplicitCodeOperationURLEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.explicitCodeOperationURL"));
}

- (BOOL)hasDisplaysSystemAcceptPromptEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.displaysSystemAcceptPrompt"));
}

- (BOOL)hasDarkWakeNetworkReachabilityEnabledEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.dark-wake-push"));
}

- (BOOL)hasCustomAccountsEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.customAccounts"));
}

- (BOOL)hasAssetBoundaryKeyEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.assetBoundaryKey"));
}

- (BOOL)hasAlwaysAllowPublishAssetsEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.publishAssets"));
}

- (BOOL)hasAllowUnverifiedAccountEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.allowUnverifiedAccount"));
}

- (BOOL)hasAllowRealTimeOperationsEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.realTimeOperations"));
}

- (BOOL)hasAllowPackagesEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.packages"));
}

- (BOOL)hasAllowOnDeviceAssetStreamingEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.onDeviceStreaming"));
}

- (BOOL)hasAllowFakeEntitlementsEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.fakeEntitlements"));
}

- (BOOL)hasAllowAccessDuringBuddyEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.buddyAccess"));
}

- (NSArray)developmentContainerEnvironmentOverrides
{
  return (NSArray *)sub_18A5E9210(self, CFSTR("com.apple.developer.icloud-container-development-container-identifiers"));
}

- (int64_t)containerEnvironment
{
  void *v2;
  const char *v3;
  void *v4;
  int64_t v5;
  const char *v6;

  sub_18A5E9210(self, CFSTR("com.apple.developer.icloud-container-environment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (!v2)
    goto LABEL_4;
  v5 = 1;
  if (objc_msgSend_compare_options_(v2, v3, (uint64_t)CFSTR("production"), 1))
  {
    objc_msgSend_compare_options_(v4, v6, (uint64_t)CFSTR("development"), 1);
LABEL_4:
    v5 = 2;
  }

  return v5;
}

- (NSString)codeServiceURLEntitlement
{
  return (NSString *)sub_18A5E9210(self, CFSTR("com.apple.developer.icloud-code-destination"));
}

- (NSDictionary)codeServiceURLByServiceEntitlement
{
  return (NSDictionary *)sub_18A5E9210(self, CFSTR("com.apple.developer.icloud-code-destination-by-service"));
}

- (NSDictionary)codeServiceURLByContainerAndServiceEntitlement
{
  return (NSDictionary *)sub_18A5E9210(self, CFSTR("com.apple.developer.icloud-code-destination-by-container-and-service"));
}

- (NSString)clientPrefixEntitlement
{
  return (NSString *)sub_18A5E9210(self, CFSTR("com.apple.private.cloudkit.prefix"));
}

- (NSString)associatedApplicationBundleID
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *procName;
  void *v9;

  sub_18A5E9210(self, CFSTR("com.apple.developer.associated-application-identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_firstObject(v3, v4, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      procName = self->_procName;
    else
      procName = 0;
    CKAppIdentifierFromTeamAppTuple(v3, procName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)apsEnvironmentEntitlement
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_18A5E9210(self, CFSTR("aps-environment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CKEntitlements)initWithAuditToken:(id *)a3 pid:(int)a4
{
  uint64_t v4;
  __int128 v7;
  __SecTask *v8;
  const char *v9;
  void (**v10)(_QWORD);
  const char *v11;
  const __CFArray *v12;
  CFDictionaryRef v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSError *secEntitlementsError;
  NSObject *v18;
  CKEntitlements *v19;
  NSError *v20;
  NSError *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  __int128 v25;
  int v26;
  id v27;
  const char *v28;
  uint64_t v29;
  audit_token_t *p_token;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  NSError *v51;
  uint8_t buf[8];
  CFErrorRef error;
  _QWORD aBlock[5];
  const __CFString *v55;
  audit_token_t token;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  uint64_t v93;

  v4 = *(_QWORD *)&a4;
  v93 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(0, &token);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A5D4598;
  aBlock[3] = &unk_1E1F5F680;
  aBlock[4] = v8;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  error = 0;
  if (v8)
  {
    objc_opt_self();
    *(_QWORD *)token.val = CFSTR("com.apple.private.cloudkit.masquerade");
    *(_QWORD *)&token.val[2] = CFSTR("com.apple.private.cloudkit.setEnvironment");
    *(_QWORD *)&token.val[4] = CFSTR("com.apple.private.cloudkit.customAccounts");
    *(_QWORD *)&token.val[6] = CFSTR("com.apple.private.cloudkit.assetBoundaryKey");
    v57 = CFSTR("com.apple.private.cloudkit.protectiondata");
    v58 = CFSTR("com.apple.private.cloudkit.systemService");
    v59 = CFSTR("com.apple.private.dark-wake-push");
    v60 = CFSTR("com.apple.private.cloudkit.buddyAccess");
    v61 = CFSTR("com.apple.private.cloudkit.lightweightPCS");
    v62 = CFSTR("com.apple.private.cloudkit.oopui");
    v63 = CFSTR("com.apple.private.cloudkit.participant-pii");
    v64 = CFSTR("com.apple.private.cloudkit.displaysSystemAcceptPrompt");
    v65 = CFSTR("com.apple.private.cloudkit.spi");
    v66 = CFSTR("com.apple.private.cloudkit.systemLaunchDaemonAccess");
    v67 = CFSTR("com.apple.private.cloudkit.packages");
    v68 = CFSTR("com.apple.private.vfs.open-by-id");
    v69 = CFSTR("com.apple.private.network.socket-delegate");
    v70 = CFSTR("com.apple.private.cloudkit.serviceNameForContainerMap");
    v71 = CFSTR("application-identifier");
    v72 = CFSTR("com.apple.developer.associated-application-identifier");
    v73 = CFSTR("com.apple.private.cloudkit.prefix");
    v74 = CFSTR("aps-environment");
    v75 = CFSTR("aps-connection-initiate");
    v76 = CFSTR("com.apple.developer.icloud-container-environment");
    v77 = CFSTR("com.apple.developer.icloud-container-development-container-identifiers");
    v78 = CFSTR("com.apple.developer.icloud-services");
    v79 = CFSTR("com.apple.private.cloudkit.fakeEntitlements");
    v80 = CFSTR("com.apple.private.cloudkit.zoneprotectiondata");
    v81 = CFSTR("com.apple.private.cloudkit.nonLegacySharingURL");
    v82 = CFSTR("com.apple.private.cloudkit.allowUnverifiedAccount");
    v83 = CFSTR("com.apple.private.cloudkit.notifyOnAccountWarmup");
    v84 = CFSTR("com.apple.private.cloudkit.realTimeOperations");
    v85 = CFSTR("com.apple.developer.icloud-code-destination");
    v86 = CFSTR("com.apple.developer.icloud-code-destination-by-service");
    v87 = CFSTR("com.apple.developer.icloud-code-destination-by-container-and-service");
    v88 = CFSTR("com.apple.private.cloudkit.explicitCodeOperationURL");
    v89 = CFSTR("com.apple.private.cloudkit.supportservice");
    v90 = CFSTR("com.apple.private.cloudkit.publishAssets");
    v91 = CFSTR("com.apple.private.cloudkit.onDeviceStreaming");
    v92 = CFSTR("com.apple.private.cloudkit.temporary.deviceCapabilities");
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)&token, 40);
    v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v13 = SecTaskCopyValuesForEntitlements(v8, v12, &error);

    if (error)
    {
      secEntitlementsError = self->_secEntitlementsError;
      self->_secEntitlementsError = (NSError *)error;

      error = 0;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v18 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v51 = self->_secEntitlementsError;
        token.val[0] = 138543618;
        *(_QWORD *)&token.val[1] = v8;
        LOWORD(token.val[3]) = 2114;
        *(_QWORD *)((char *)&token.val[3] + 2) = v51;
        _os_log_error_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_ERROR, "Couldn't fetch client entitlements from sec task %{public}@ because we got an error from Security: %{public}@", (uint8_t *)&token, 0x16u);
      }
      v19 = 0;
    }
    else
    {
      v23 = (void *)objc_msgSend_mutableCopy(v13, v14, v15, v16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = *(_OWORD *)&a3->var0[4];
        *(_OWORD *)token.val = *(_OWORD *)a3->var0;
        *(_OWORD *)&token.val[4] = v25;
        objc_msgSend_daemonInitHook_mutableEntitlements_(self, v24, (uint64_t)&token, (uint64_t)v23);
      }
      v26 = proc_name(v4, &token, 0x40u);
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      p_token = (audit_token_t *)"???";
      if (v26 > 0)
        p_token = &token;
      v31 = (void *)objc_msgSend_initWithFormat_(v27, v28, (uint64_t)CFSTR("%s(%d)"), v29, p_token, v4);
      v34 = v31;
      if (__sTestOverridesAvailable
        && ((objc_msgSend_isEqualToString_(v31, v32, (uint64_t)CFSTR("xctest"), v33) & 1) != 0
         || objc_msgSend_hasPrefix_(v34, v35, (uint64_t)CFSTR("xctest("), v36)))
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v37 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_ERROR, "Allowing xctest access to CloudKitTesting.  Note that parts of CloudKit are non-functional in an un-entitled process.  Strongly consider moving to an entitled test host", buf, 2u);
        }
        objc_msgSend_objectForKeyedSubscript_(v23, v38, (uint64_t)CFSTR("application-identifier"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40 == 0;

        if (v41)
          objc_msgSend_setObject_forKeyedSubscript_(v23, v42, (uint64_t)CFSTR("com.apple.xctest"), (uint64_t)CFSTR("application-identifier"));
        objc_msgSend_objectForKeyedSubscript_(v23, v42, (uint64_t)CFSTR("com.apple.developer.icloud-services"), v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44 == 0;

        if (v45)
        {
          v55 = CFSTR("CloudKit");
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)&v55, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v23, v47, (uint64_t)v46, (uint64_t)CFSTR("com.apple.developer.icloud-services"));

        }
      }
      v48 = objc_msgSend_initWithEntitlementsDict_(self, v32, (uint64_t)v23, v33);
      v49 = (void *)v48;
      if (v48)
      {
        *(_DWORD *)(v48 + 8) = v4;
        objc_storeStrong((id *)(v48 + 40), v34);
      }
      self = v49;

      v19 = self;
    }

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Can't fetch client entitlements from a NULL secTask for pid %d"), v4);
    v20 = (NSError *)objc_claimAutoreleasedReturnValue();
    v21 = self->_secEntitlementsError;
    self->_secEntitlementsError = v20;

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v22 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      token.val[0] = 67109120;
      token.val[1] = v4;
      _os_log_error_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_ERROR, "Can't fetch client entitlements from a NULL secTask for pid %d", (uint8_t *)&token, 8u);
    }
    v19 = 0;
  }
  v10[2](v10);

  return v19;
}

- (CKEntitlements)initWithEntitlementsDict:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKEntitlements *v8;
  uint64_t v9;
  NSDictionary *entitlementsDict;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKEntitlements;
  v8 = -[CKEntitlements init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend_CKDeepCopy(v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    entitlementsDict = v8->_entitlementsDict;
    v8->_entitlementsDict = (NSDictionary *)v9;

  }
  return v8;
}

- (BOOL)validateEntitlementsWithSDKVersion:(unsigned int)a3 error:(id *)a4
{
  CKEntitlements *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  __CFString *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  CKEntitlements *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t i;
  const char *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t m;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  char v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t j;
  const char *v95;
  void *v96;
  NSObject *v97;
  id *v98;
  BOOL v99;
  const __CFString *v100;
  id *v101;
  __CFString *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  id v117;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t k;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  char isKindOfClass;
  void *v129;
  NSObject *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  void *v137;
  NSObject *v138;
  const char *v139;
  const char *v141;
  uint64_t v142;
  const char *v143;
  id Property;
  id v145;
  const char *v146;
  uint64_t v147;
  char isEqual;
  const char *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  __CFString *v156;
  __CFString *v157;
  __CFString *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  id v162;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  unsigned int v169;
  id newValue;
  __CFString *v171;
  CKEntitlements *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint8_t buf[4];
  void *v210;
  __int16 v211;
  uint64_t v212;
  __int16 v213;
  const __CFString *v214;
  __int16 v215;
  const __CFString *v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _QWORD v226[2];
  _QWORD v227[2];
  _QWORD v228[4];
  _QWORD v229[30];

  v229[27] = *MEMORY[0x1E0C80C00];
  v172 = self;
  if (self)
    self = (CKEntitlements *)objc_getProperty(self, a2, 24, 1);
  v5 = self;
  newValue = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  v229[0] = CFSTR("com.apple.private.cloudkit.masquerade");
  v229[1] = CFSTR("com.apple.private.cloudkit.setEnvironment");
  v229[2] = CFSTR("com.apple.private.cloudkit.customAccounts");
  v229[3] = CFSTR("com.apple.private.cloudkit.assetBoundaryKey");
  v229[4] = CFSTR("com.apple.private.cloudkit.protectiondata");
  v229[5] = CFSTR("com.apple.private.cloudkit.systemService");
  v229[6] = CFSTR("com.apple.private.dark-wake-push");
  v229[7] = CFSTR("com.apple.private.cloudkit.buddyAccess");
  v229[8] = CFSTR("com.apple.private.cloudkit.lightweightPCS");
  v229[9] = CFSTR("com.apple.private.cloudkit.oopui");
  v229[10] = CFSTR("com.apple.private.cloudkit.participant-pii");
  v229[11] = CFSTR("com.apple.private.cloudkit.displaysSystemAcceptPrompt");
  v229[12] = CFSTR("com.apple.private.cloudkit.systemLaunchDaemonAccess");
  v229[13] = CFSTR("com.apple.private.cloudkit.packages");
  v229[14] = CFSTR("com.apple.private.vfs.open-by-id");
  v229[15] = CFSTR("com.apple.private.network.socket-delegate");
  v229[16] = CFSTR("com.apple.private.cloudkit.fakeEntitlements");
  v229[17] = CFSTR("com.apple.private.cloudkit.zoneprotectiondata");
  v229[18] = CFSTR("com.apple.private.cloudkit.nonLegacySharingURL");
  v229[19] = CFSTR("com.apple.private.cloudkit.allowUnverifiedAccount");
  v229[20] = CFSTR("com.apple.private.cloudkit.notifyOnAccountWarmup");
  v229[21] = CFSTR("com.apple.private.cloudkit.explicitCodeOperationURL");
  v229[22] = CFSTR("com.apple.private.cloudkit.realTimeOperations");
  v229[23] = CFSTR("com.apple.private.cloudkit.supportservice");
  v229[24] = CFSTR("com.apple.private.cloudkit.publishAssets");
  v229[25] = CFSTR("com.apple.private.cloudkit.onDeviceStreaming");
  v229[26] = CFSTR("com.apple.private.cloudkit.temporary.deviceCapabilities");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v229, 27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v228[0] = CFSTR("application-identifier");
  v228[1] = CFSTR("com.apple.private.cloudkit.prefix");
  v228[2] = CFSTR("aps-environment");
  v228[3] = CFSTR("com.apple.developer.icloud-code-destination");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v228, 4);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v227[0] = CFSTR("com.apple.developer.icloud-container-development-container-identifiers");
  v227[1] = CFSTR("com.apple.developer.icloud-services");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v227, 2);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v226[0] = CFSTR("com.apple.private.cloudkit.serviceNameForContainerMap");
  v226[1] = CFSTR("com.apple.developer.icloud-code-destination-by-service");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v226, 2);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = 0u;
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  v14 = v10;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v205, (uint64_t)v225, 16);
  v169 = HIWORD(a3);
  v171 = v14;
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v206;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v206 != v20)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * v21);
        objc_msgSend_addObject_(0, v17, (uint64_t)v22, v18);
        sub_18A5E9210(v172, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 && (objc_opt_respondsToSelector() & 1) == 0)
        {
          v24 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, v24);

          v25 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v210 = v23;
            v211 = 2114;
            v212 = (uint64_t)v22;
            _os_log_error_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected something that supports -BOOLValue", buf, 0x16u);
          }

          if (v169 > 0xE)
          {
            v14 = v171;
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKErrorDomain"), 8, CFSTR("Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected something that supports -BOOLValue"), v23, v22);
              v99 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v99 = 0;
            }
            v27 = v171;
            goto LABEL_169;
          }
          objc_msgSend_setObject_forKeyedSubscript_(newValue, v26, 0, (uint64_t)v22);
          v14 = v171;
        }

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v205, (uint64_t)v225, 16);
    }
    while (v19);
  }

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v27 = v166;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v201, (uint64_t)v224, 16);
  v32 = v172;
  if (v29)
  {
    v33 = v29;
    v34 = *(_QWORD *)v202;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v202 != v34)
          objc_enumerationMutation(v27);
        v36 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * v35);
        objc_msgSend_addObject_(0, v30, (uint64_t)v36, v31);
        sub_18A5E9210(v172, v36);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v37 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, v37);

            v38 = (id)ck_log_facility_ck;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v210 = v23;
              v211 = 2114;
              v212 = (uint64_t)v36;
              _os_log_error_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a string", buf, 0x16u);
            }

            if (v169 > 0xE)
            {
              v14 = v171;
              v98 = a4;
              if (a4)
              {
                v151 = v36;
                goto LABEL_111;
              }
LABEL_168:
              v99 = 0;
              goto LABEL_169;
            }
            objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, (uint64_t)v36);
            v14 = v171;
          }
        }

        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v201, (uint64_t)v224, 16);
    }
    while (v33);
  }

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v27 = v165;
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v40, (uint64_t)&v197, (uint64_t)v223, 16);
  if (!v41)
    goto LABEL_60;
  v44 = v41;
  v45 = *(_QWORD *)v198;
  v154 = *(_QWORD *)v198;
  v157 = v27;
  do
  {
    v46 = 0;
    v160 = v44;
    do
    {
      if (*(_QWORD *)v198 != v45)
        objc_enumerationMutation(v27);
      v47 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * v46);
      objc_msgSend_addObject_(0, v42, (uint64_t)v47, v43);
      sub_18A5E9210(v32, v47);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_50;
        v195 = 0u;
        v196 = 0u;
        v193 = 0u;
        v194 = 0u;
        v48 = v23;
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v193, (uint64_t)v222, 16);
        if (!v50)
        {

          v14 = v171;
          goto LABEL_58;
        }
        v51 = v50;
        v52 = *(_QWORD *)v194;
        v53 = 1;
        do
        {
          for (i = 0; i != v51; ++i)
          {
            if (*(_QWORD *)v194 != v52)
              objc_enumerationMutation(v48);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              v53 = 0;
          }
          v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v55, (uint64_t)&v193, (uint64_t)v222, 16);
        }
        while (v51);

        v14 = v171;
        v45 = v154;
        v27 = v157;
        v44 = v160;
        if ((v53 & 1) == 0)
        {
LABEL_50:
          v56 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, v56);

          v57 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v210 = v23;
            v211 = 2114;
            v212 = (uint64_t)v47;
            _os_log_error_impl(&dword_18A5C5000, v57, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected an array of strings", buf, 0x16u);
          }

          if (v169 > 0xE
            || (objc_msgSend_isEqualToString_(v47, v39, (uint64_t)CFSTR("com.apple.developer.icloud-services"), v58) & 1) != 0)
          {
            v98 = a4;
            if (a4)
            {
              v150 = v23;
              v151 = v47;
              v100 = CFSTR("Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected an array of strings");
              goto LABEL_118;
            }
            goto LABEL_168;
          }
          objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, (uint64_t)v47);
        }
      }
LABEL_58:

      ++v46;
      v32 = v172;
    }
    while (v46 != v44);
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v42, (uint64_t)&v197, (uint64_t)v223, 16);
  }
  while (v44);
LABEL_60:

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v27 = v164;
  v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v59, (uint64_t)&v189, (uint64_t)v221, 16);
  if (!v60)
  {
LABEL_87:

    v27 = CFSTR("com.apple.developer.associated-application-identifier");
    sub_18A5E9210(v32, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(0, v86, (uint64_t)v27, v87);
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_100:
          v96 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, v96);

          v97 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v210 = v23;
            v211 = 2114;
            v212 = (uint64_t)v27;
            _os_log_error_impl(&dword_18A5C5000, v97, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a string", buf, 0x16u);
          }

          if (v169 > 0xE)
          {
            v98 = a4;
            if (a4)
            {
              v151 = v27;
LABEL_111:
              v150 = v23;
              v100 = CFSTR("Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected a string");
              goto LABEL_118;
            }
            goto LABEL_168;
          }
          objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, (uint64_t)v27);
          goto LABEL_122;
        }
        v183 = 0u;
        v184 = 0u;
        v181 = 0u;
        v182 = 0u;
        v88 = v23;
        v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v181, (uint64_t)v219, 16);
        if (v90)
        {
          v91 = v90;
          v92 = *(_QWORD *)v182;
          v93 = 1;
          do
          {
            for (j = 0; j != v91; ++j)
            {
              if (*(_QWORD *)v182 != v92)
                objc_enumerationMutation(v88);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                v93 = 0;
            }
            v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v95, (uint64_t)&v181, (uint64_t)v219, 16);
          }
          while (v91);

          v14 = v171;
          v32 = v172;
          if ((v93 & 1) == 0)
            goto LABEL_100;
        }
        else
        {

        }
      }
    }
LABEL_122:
    v102 = CFSTR("com.apple.developer.icloud-code-destination-by-container-and-service");

    sub_18A5E9210(v32, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(0, v104, (uint64_t)v102, v105);
    if (v103)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_148;
      v177 = 0u;
      v178 = 0u;
      v179 = 0u;
      v180 = 0u;
      v106 = v103;
      v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v107, (uint64_t)&v177, (uint64_t)v218, 16);
      if (!v108)
      {

        goto LABEL_157;
      }
      v109 = v108;
      v153 = v103;
      v156 = v102;
      v110 = *(_QWORD *)v178;
      v111 = 1;
      v159 = *(_QWORD *)v178;
      v162 = v106;
      do
      {
        v112 = 0;
        v168 = v109;
        do
        {
          if (*(_QWORD *)v178 != v110)
            objc_enumerationMutation(v106);
          v113 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * v112);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v106, v114, v113, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v117 = v116;
              v173 = 0u;
              v174 = 0u;
              v175 = 0u;
              v176 = 0u;
              v118 = v117;
              v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v119, (uint64_t)&v173, (uint64_t)v217, 16);
              if (v120)
              {
                v121 = v120;
                v122 = *(_QWORD *)v174;
                do
                {
                  for (k = 0; k != v121; ++k)
                  {
                    if (*(_QWORD *)v174 != v122)
                      objc_enumerationMutation(v118);
                    v124 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * k);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v118, v125, v124, v126);
                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();

                      if ((isKindOfClass & 1) != 0)
                        continue;
                    }
                    v111 = 0;
                  }
                  v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v125, (uint64_t)&v173, (uint64_t)v217, 16);
                }
                while (v121);
              }

              v14 = v171;
              v32 = v172;
              v110 = v159;
              v106 = v162;
              v109 = v168;
            }
            else
            {
              v111 = 0;
            }

          }
          else
          {
            v111 = 0;
          }
          ++v112;
        }
        while (v112 != v109);
        v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v114, (uint64_t)&v177, (uint64_t)v218, 16);
      }
      while (v109);

      v102 = v156;
      v103 = v153;
      if ((v111 & 1) == 0)
      {
LABEL_148:
        v129 = ck_log_initialization_block;
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, v129);

        v130 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v210 = v103;
          v211 = 2114;
          v212 = (uint64_t)v102;
          _os_log_error_impl(&dword_18A5C5000, v130, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a type of [ string : [ string : string ] ]", buf, 0x16u);
        }

        if (v169 > 0xE)
        {
          if (a4)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v131, (uint64_t)CFSTR("CKErrorDomain"), 8, CFSTR("Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected a type of [ string : [ string : string ] ]"), v103, v102);
            v99 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v99 = 0;
          }
          v23 = v103;
          v27 = v102;
          goto LABEL_169;
        }
        objc_msgSend_setObject_forKeyedSubscript_(newValue, v131, 0, (uint64_t)v102);
      }
    }
LABEL_157:
    v27 = CFSTR("com.apple.developer.icloud-container-environment");

    sub_18A5E9210(v32, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(0, v132, (uint64_t)v27, v133);
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || objc_msgSend_compare_options_(v23, v136, (uint64_t)CFSTR("production"), 1)
        && objc_msgSend_compare_options_(v23, v134, (uint64_t)CFSTR("development"), 1))
      {
        v137 = ck_log_initialization_block;
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, v137);

        v138 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v210 = v23;
          v211 = 2114;
          v212 = (uint64_t)v27;
          v213 = 2114;
          v214 = CFSTR("production");
          v215 = 2114;
          v216 = CFSTR("development");
          _os_log_error_impl(&dword_18A5C5000, v138, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected \"%{public}@\" or \"%{public}@\", buf, 0x2Au);
        }

        if (v169 > 0xE)
        {
          if (a4)
          {
            v101 = a4;
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v139, (uint64_t)CFSTR("CKErrorDomain"), 8, CFSTR("Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected \"%@\" or \"%@\"), v23, v27, CFSTR("production"), CFSTR("development"));
            goto LABEL_119;
          }
          goto LABEL_168;
        }
        objc_msgSend_setObject_forKeyedSubscript_(newValue, v139, 0, (uint64_t)v27);
      }
    }
    objc_msgSend_addObject_(0, v134, (uint64_t)CFSTR("com.apple.private.cloudkit.spi"), v135);
    objc_msgSend_addObject_(0, v141, (uint64_t)CFSTR("aps-connection-initiate"), v142);
    if (v169 <= 0xE)
    {
      if (v32)
        Property = objc_getProperty(v32, v143, 24, 1);
      else
        Property = 0;
      v145 = Property;
      isEqual = objc_msgSend_isEqual_(v145, v146, (uint64_t)newValue, v147);

      v99 = 1;
      if (v32 && (isEqual & 1) == 0)
        objc_setProperty_atomic_copy(v32, v149, newValue, 24);
    }
    else
    {
      v99 = 1;
    }
    goto LABEL_169;
  }
  v63 = v60;
  v64 = *(_QWORD *)v190;
  v158 = v27;
  v152 = *(_QWORD *)v190;
LABEL_62:
  v65 = 0;
  v155 = v63;
  while (1)
  {
    if (*(_QWORD *)v190 != v64)
      objc_enumerationMutation(v27);
    v66 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v65);
    objc_msgSend_addObject_(0, v61, (uint64_t)v66, v62);
    sub_18A5E9210(v32, v66);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_85;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v161 = v66;
      v167 = v65;
      v67 = v23;
      v185 = 0u;
      v186 = 0u;
      v187 = 0u;
      v188 = 0u;
      objc_msgSend_allKeys(v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v185, (uint64_t)v220, 16);
      if (!v73)
      {

        v14 = v171;
        goto LABEL_85;
      }
      v74 = v73;
      v75 = *(_QWORD *)v186;
      v76 = 1;
      do
      {
        for (m = 0; m != v74; ++m)
        {
          if (*(_QWORD *)v186 != v75)
            objc_enumerationMutation(v71);
          v78 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v67, v79, v78, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v82 = objc_opt_isKindOfClass();

            if ((v82 & 1) != 0)
              continue;
          }
          v76 = 0;
        }
        v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v79, (uint64_t)&v185, (uint64_t)v220, 16);
      }
      while (v74);

      v14 = v171;
      v63 = v155;
      v27 = v158;
      v64 = v152;
      v65 = v167;
      v66 = v161;
      if ((v76 & 1) != 0)
        goto LABEL_85;
    }
    v83 = (uint64_t)v66;
    v84 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v84);

    v85 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v210 = v23;
      v211 = 2114;
      v212 = v83;
      _os_log_error_impl(&dword_18A5C5000, v85, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a dict of string : string", buf, 0x16u);
    }

    if (v169 > 0xE)
      break;
    objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, v83);
LABEL_85:

    ++v65;
    v32 = v172;
    if (v65 == v63)
    {
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v61, (uint64_t)&v189, (uint64_t)v221, 16);
      if (v63)
        goto LABEL_62;
      goto LABEL_87;
    }
  }
  v98 = a4;
  if (!a4)
    goto LABEL_168;
  v150 = v23;
  v151 = (void *)v83;
  v100 = CFSTR("Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected a dict of string : string");
LABEL_118:
  v101 = v98;
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, (uint64_t)CFSTR("CKErrorDomain"), 8, v100, v150, v151);
LABEL_119:
  v99 = 0;
  *v101 = (id)objc_claimAutoreleasedReturnValue();
LABEL_169:

  return v99;
}

- (CKEntitlements)initWithSqliteRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  CKEntitlements *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v11, (uint64_t)v10, 0, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v15 || !v12)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_log_error_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKEntitlements: %{public}@", buf, 0xCu);
      }
      v16 = 0;
    }
    else
    {
      self = (CKEntitlements *)(id)objc_msgSend_initWithEntitlementsDict_(self, v13, (uint64_t)v12, v14);
      v16 = self;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CKEntitlements)initWithCurrentProcess
{
  kern_return_t v3;
  kern_return_t v4;
  NSObject *v5;
  CKEntitlements *v6;
  uint64_t v7;
  const char *v8;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v12;
  uint8_t buf[16];
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)task_info_out = 0u;
  v12 = 0u;
  task_info_outCnt = 8;
  v3 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  if (v3)
  {
    v4 = v3;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v5 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v4;
      _os_log_error_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_ERROR, "Unable to get a self audit token: %d", buf, 8u);
    }
    v6 = 0;
  }
  else
  {
    v7 = getpid();
    *(_OWORD *)buf = *(_OWORD *)task_info_out;
    v14 = v12;
    self = (CKEntitlements *)(id)objc_msgSend_initWithAuditToken_pid_(self, v8, (uint64_t)buf, v7);
    v6 = self;
  }

  return v6;
}

- (BOOL)hasSPIEntitlement
{
  void *v2;
  BOOL v3;

  sub_18A5E9210(self, CFSTR("com.apple.private.cloudkit.spi"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCloudKitSupportServiceEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.supportservice"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_secEntitlementsError, 0);
  objc_storeStrong((id *)&self->_entitlementsDict, 0);
  objc_storeStrong((id *)&self->_cachedApplicationBundleID, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@<%p>: entitlements = %@, error = %@"), v7, v5, self, self->_entitlementsDict, self->_secEntitlementsError);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)entitlementsByAddingOverlay:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id Property;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  int pid;
  NSError *secEntitlementsError;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 24, 1);
    v12 = (void *)objc_msgSend_mutableCopy(Property, v9, v10, v11);
  }
  else
  {
    v12 = (void *)objc_msgSend_mutableCopy(0, v4, v5, v6);
  }
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v7;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v18)
  {
    v21 = v18;
    v22 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v16);
        v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v16, v19, v24, v20, (_QWORD)v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_null(MEMORY[0x1E0C99E38], v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 == v29)
          objc_msgSend_setObject_forKeyedSubscript_(v15, v30, 0, v24);
        else
          objc_msgSend_setObject_forKeyedSubscript_(v15, v30, (uint64_t)v25, v24);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v21);
  }

  v31 = objc_alloc((Class)objc_opt_class());
  v34 = objc_msgSend_initWithEntitlementsDict_(v31, v32, (uint64_t)v15, v33);
  v35 = (id *)v34;
  if (self)
  {
    pid = self->_pid;
    if (!v34)
      goto LABEL_19;
    goto LABEL_18;
  }
  pid = 0;
  if (v34)
LABEL_18:
    *(_DWORD *)(v34 + 8) = pid;
LABEL_19:
  if (!self)
  {
    sub_18A7F1540(v34, 0);
    secEntitlementsError = 0;
    if (!v35)
      goto LABEL_22;
    goto LABEL_21;
  }
  sub_18A7F1540(v34, self->_procName);
  secEntitlementsError = self->_secEntitlementsError;
  if (v35)
LABEL_21:
    objc_storeStrong(v35 + 4, secEntitlementsError);
LABEL_22:

  return v35;
}

- (BOOL)hasTemporaryDeviceCapabilitiesEntitlement
{
  return sub_18A5CD0A0(self, CFSTR("com.apple.private.cloudkit.temporary.deviceCapabilities"));
}

- (unint64_t)hash
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  sub_18A5CD2C4(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v3, v4, v5, v6);

  objc_msgSend_applicationBundleID(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_hash(v11, v12, v13, v14) ^ v7;

  return v15;
}

- (id)sqliteRepresentation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  const char *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (CKEntitlements *)objc_getProperty(self, a2, 24, 1);
  v4 = (void *)objc_msgSend_mutableCopy(self, a2, v2, v3);
  v13 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v5, (uint64_t)v4, 0, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_error_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_ERROR, "Error converting CKEntitlements to JSON: %{public}@", buf, 0xCu);
    }
  }
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = (void *)objc_msgSend_initWithData_encoding_(v9, v10, (uint64_t)v6, 4);

  return v11;
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);

}

@end
