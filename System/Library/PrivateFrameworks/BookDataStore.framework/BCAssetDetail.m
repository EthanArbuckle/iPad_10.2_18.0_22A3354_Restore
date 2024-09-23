@implementation BCAssetDetail

- (id)mutableCopy
{
  BCMutableAssetDetail *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableAssetDetail alloc];
  return (id)MEMORY[0x24BEDD108](v3, sel_initWithCloudData_, self, v4, v5);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a4;
  BUProtocolCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend__configureFromAssetDetail_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5E5D8();

  }
}

- (void)_configureFromAssetDetail:(id)a3 withMergers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t isFinished;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int8 v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  double v104;
  double v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  const char *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  double v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  double v232;
  double v233;
  double v234;
  double v235;
  NSObject *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  NSObject *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  double v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  int v290;
  NSObject *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  objc_super v307;
  uint8_t buf[4];
  void *v309;
  __int16 v310;
  void *v311;
  __int16 v312;
  void *v313;
  __int16 v314;
  void *v315;
  __int16 v316;
  double v317;
  uint64_t v318;

  v318 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v307.receiver = self;
  v307.super_class = (Class)BCAssetDetail;
  -[BCCloudData configureFromCloudData:withMergers:](&v307, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_assetID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v12, (uint64_t)v11, (uint64_t)CFSTR("assetID"), v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  isFinished = objc_msgSend_isFinished(v6, v15, v16, v17, v18);
  objc_msgSend_numberWithBool_(v14, v20, isFinished, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v24, (uint64_t)v23, (uint64_t)CFSTR("isFinished"), v25);

  v26 = (void *)MEMORY[0x24BDD16E0];
  v31 = objc_msgSend_notFinished(v6, v27, v28, v29, v30);
  objc_msgSend_numberWithBool_(v26, v32, v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v36, (uint64_t)v35, (uint64_t)CFSTR("notFinished"), v37);

  v38 = (void *)MEMORY[0x24BDD16E0];
  v43 = objc_msgSend_taste(self, v39, v40, v41, v42);
  v48 = objc_msgSend_taste(v6, v44, v45, v46, v47);
  v52 = v43 & 3;
  if ((v48 & 3) != 0)
    v52 = v48 & 3;
  objc_msgSend_numberWithShort_(v38, v49, v52 | (v48 | v43) & 4u, v50, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v54, (uint64_t)v53, (uint64_t)CFSTR("taste"), v55);

  v56 = (void *)MEMORY[0x24BDD16E0];
  v61 = objc_msgSend_tasteSyncedToStore(v6, v57, v58, v59, v60);
  objc_msgSend_numberWithShort_(v56, v62, v61, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v66, (uint64_t)v65, (uint64_t)CFSTR("tasteSyncedToStore"), v67);

  objc_msgSend_dateFinished(v6, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentDate_forKey_(self, v73, (uint64_t)v72, (uint64_t)CFSTR("dateFinished"), v74);

  v75 = (void *)MEMORY[0x24BDD16E0];
  v80 = objc_msgSend_finishedDateKind(v6, v76, v77, v78, v79);
  objc_msgSend_numberWithShort_(v75, v81, v80, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v85, (uint64_t)v84, (uint64_t)CFSTR("finishedDateKind"), v86);

  objc_msgSend_lastOpenDate(v6, v87, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentDate_forKey_(self, v92, (uint64_t)v91, (uint64_t)CFSTR("lastOpenDate"), v93);

  objc_msgSend_readingPositionLocationUpdateDate(v6, v94, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v98;
  if (v98)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v98, v99, v100, v101, v102);
    v105 = v104;
    objc_msgSend_readingPositionLocationUpdateDate(self, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v110, v111, v112, v113, v114);
    v116 = v115;

    if (v105 > v116)
    {
      v117 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_readingProgress(v6, v99, v100, v101, v102);
      objc_msgSend_numberWithFloat_(v117, v118, v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v123, (uint64_t)v122, (uint64_t)CFSTR("readingProgress"), v124);

      v125 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_readingProgressHighWaterMark(v6, v126, v127, v128, v129);
      objc_msgSend_numberWithFloat_(v125, v130, v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v135, (uint64_t)v134, (uint64_t)CFSTR("readingProgressHighWaterMark"), v136);

      objc_msgSend_readingPositionCFIString(v6, v137, v138, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v142, (uint64_t)v141, (uint64_t)CFSTR("readingPositionCFIString"), v143);

      objc_msgSend_readingPositionAnnotationVersion(v6, v144, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v149, (uint64_t)v148, (uint64_t)CFSTR("readingPositionAnnotationVersion"), v150);

      objc_msgSend_readingPositionAssetVersion(v6, v151, v152, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v156, (uint64_t)v155, (uint64_t)CFSTR("readingPositionAssetVersion"), v157);

      objc_msgSend_readingPositionUserData(v6, v158, v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_opt_class();
      objc_msgSend_setDifferentValue_forKey_klass_(self, v164, (uint64_t)v162, (uint64_t)CFSTR("readingPositionUserData"), v163);

      v165 = (void *)MEMORY[0x24BDD16E0];
      v170 = objc_msgSend_readingPositionLocationRangeStart(v6, v166, v167, v168, v169);
      objc_msgSend_numberWithInt_(v165, v171, v170, v172, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v175, (uint64_t)v174, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v176);

      v177 = (void *)MEMORY[0x24BDD16E0];
      v182 = objc_msgSend_readingPositionLocationRangeEnd(v6, v178, v179, v180, v181);
      objc_msgSend_numberWithInt_(v177, v183, v182, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v187, (uint64_t)v186, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v188);

      v189 = (void *)MEMORY[0x24BDD16E0];
      v194 = objc_msgSend_readingPositionAbsolutePhysicalLocation(v6, v190, v191, v192, v193);
      objc_msgSend_numberWithInt_(v189, v195, v194, v196, v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v199, (uint64_t)v198, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v200);

      objc_msgSend_readingPositionStorageUUID(v6, v201, v202, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v206, (uint64_t)v205, (uint64_t)CFSTR("readingPositionStorageUUID"), v207);

      objc_msgSend_setDifferentDate_forKey_(self, v208, (uint64_t)v103, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v209);
    }
  }
  objc_msgSend_datePlaybackTimeUpdated(v6, v99, v100, v101, v102);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  if (v214)
  {
    objc_msgSend_datePlaybackTimeUpdated(self, v210, v211, v212, v213);
    v215 = objc_claimAutoreleasedReturnValue();
    if (!v215)
      goto LABEL_9;
    v220 = (void *)v215;
    objc_msgSend_timeIntervalSinceReferenceDate(v214, v216, v217, v218, v219);
    v222 = v221;
    objc_msgSend_datePlaybackTimeUpdated(self, v223, v224, v225, v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v227, v228, v229, v230, v231);
    v233 = v232;

    if (v222 <= v233)
    {
      BDSCloudKitAudiobookLog();
      v263 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_assetID(self, v264, v265, v266, v267);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_datePlaybackTimeUpdated(self, v269, v270, v271, v272);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bookmarkTime(self, v274, v275, v276, v277);
        v279 = v278;
        objc_msgSend_bookmarkTime(v6, v280, v281, v282, v283);
        *(_DWORD *)buf = 138413314;
        v309 = v268;
        v310 = 2112;
        v311 = v273;
        v312 = 2048;
        v313 = v279;
        v314 = 2112;
        v315 = v214;
        v316 = 2048;
        v317 = v284;
        _os_log_impl(&dword_227D4F000, v263, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Configuring bookmark time, ignoring as my bookmark time is same or newer old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);

      }
    }
    else
    {
LABEL_9:
      objc_msgSend_bookmarkTime(v6, v216, v217, v218, v219);
      v235 = v234;
      BDSCloudKitAudiobookLog();
      v236 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_assetID(self, v237, v238, v239, v240);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_datePlaybackTimeUpdated(self, v242, v243, v244, v245);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bookmarkTime(self, v247, v248, v249, v250);
        *(_DWORD *)buf = 138413314;
        v309 = v241;
        v310 = 2112;
        v311 = v246;
        v312 = 2048;
        v313 = v251;
        v314 = 2112;
        v315 = v214;
        v316 = 2048;
        v317 = v235;
        _os_log_impl(&dword_227D4F000, v236, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Configuring bookmark time old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);

      }
      objc_msgSend_datePlaybackTimeUpdated(v6, v252, v253, v254, v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentDate_forKey_(self, v257, (uint64_t)v256, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v258);

      objc_msgSend_setDifferentBookmarkTime_(self, v259, v260, v261, v262, v235);
    }
  }
  objc_msgSend_shared(MEMORY[0x24BE0FC08], v210, v211, v212, v213);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v290 = objc_msgSend_verboseLoggingEnabled(v285, v286, v287, v288, v289);

  if (v290)
  {
    BDSCloudKitDevelopmentLog();
    v291 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v291, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_assetID(self, v292, v293, v294, v295);
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v297, v298, v299, v300);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetID(v6, v302, v303, v304, v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v309 = v296;
      v310 = 2112;
      v311 = v301;
      v312 = 2112;
      v313 = v306;
      _os_log_impl(&dword_227D4F000, v291, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail configured: %@ %@ from assetDetail:%@\\\"\", buf, 0x20u);

    }
  }

}

- (BOOL)setDifferentBookmarkTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;

  objc_msgSend_bookmarkTime(self, a2, v3, v4, v5);
  if (v12 == a3 || vabdd_f64(a3, v12) <= 0.001)
    return 0;
  objc_msgSend_setBookmarkTime_(self, v8, v9, v10, v11, a3);
  return 1;
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int v8;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t isFinished;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
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
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  float v105;
  float v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  float v111;
  float v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  float v117;
  float v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  float v123;
  float v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  int v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  int v251;
  int v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  int v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  double v276;
  double v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  double v282;
  BOOL v283;
  int v285;
  int v286;
  int v287;
  int v288;
  void *v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  int v296;
  int v297;
  int isEqual;
  int v299;
  int v300;
  int v301;
  int v302;
  int isEqualToDate;
  int v304;
  int v305;
  char v306;
  int isEqualToString;
  unsigned int v308;
  objc_super v309;

  v4 = a4;
  v6 = a3;
  BUProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v309.receiver = self;
  v309.super_class = (Class)BCAssetDetail;
  v8 = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v309, sel_isEqualExceptForDate_ignoringEmptySalt_, v6, v4);

  objc_msgSend_assetID(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(v7, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21);

  isFinished = objc_msgSend_isFinished(self, v22, v23, v24, v25);
  v31 = objc_msgSend_isFinished(v7, v27, v28, v29, v30);
  v305 = objc_msgSend_notFinished(self, v32, v33, v34, v35);
  v304 = objc_msgSend_notFinished(v7, v36, v37, v38, v39);
  v44 = objc_msgSend_taste(self, v40, v41, v42, v43);
  v287 = objc_msgSend_taste(v7, v45, v46, v47, v48);
  v286 = objc_msgSend_tasteSyncedToStore(self, v49, v50, v51, v52);
  v285 = objc_msgSend_tasteSyncedToStore(v7, v53, v54, v55, v56);
  objc_msgSend_dateFinished(self, v57, v58, v59, v60);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v65)
  {
    objc_msgSend_dateFinished(v7, v61, v62, v63, v64);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      isEqualToDate = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend_dateFinished(self, v61, v62, v63, v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateFinished(v7, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToDate = objc_msgSend_isEqualToDate_(v66, v72, (uint64_t)v71, v73, v74);

  if (!v65)
    goto LABEL_6;
LABEL_7:

  v302 = objc_msgSend_finishedDateKind(self, v75, v76, v77, v78);
  v301 = objc_msgSend_finishedDateKind(v7, v79, v80, v81, v82);
  objc_msgSend_lastOpenDate(self, v83, v84, v85, v86);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v91)
  {
    objc_msgSend_lastOpenDate(v7, v87, v88, v89, v90);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v300 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  objc_msgSend_lastOpenDate(self, v87, v88, v89, v90);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastOpenDate(v7, v93, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v300 = objc_msgSend_isEqualToDate_(v92, v98, (uint64_t)v97, v99, v100);

  if (!v91)
    goto LABEL_12;
LABEL_13:

  objc_msgSend_readingProgress(self, v101, v102, v103, v104);
  v106 = v105;
  objc_msgSend_readingProgress(v7, v107, v108, v109, v110);
  v112 = v111;
  objc_msgSend_readingProgressHighWaterMark(self, v113, v114, v115, v116);
  v118 = v117;
  objc_msgSend_readingProgressHighWaterMark(v7, v119, v120, v121, v122);
  v124 = v123;
  objc_msgSend_readingPositionCFIString(self, v125, v126, v127, v128);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v133)
  {
    objc_msgSend_readingPositionCFIString(v7, v129, v130, v131, v132);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v299 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  objc_msgSend_readingPositionCFIString(self, v129, v130, v131, v132);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionCFIString(v7, v135, v136, v137, v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v299 = objc_msgSend_isEqualToString_(v134, v140, (uint64_t)v139, v141, v142);

  if (!v133)
    goto LABEL_18;
LABEL_19:

  objc_msgSend_readingPositionAssetVersion(self, v143, v144, v145, v146);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v151)
  {
    objc_msgSend_readingPositionAssetVersion(v7, v147, v148, v149, v150);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v297 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  objc_msgSend_readingPositionAssetVersion(self, v147, v148, v149, v150);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionAssetVersion(v7, v153, v154, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v297 = objc_msgSend_isEqualToString_(v152, v158, (uint64_t)v157, v159, v160);

  if (!v151)
    goto LABEL_24;
LABEL_25:

  objc_msgSend_readingPositionAnnotationVersion(self, v161, v162, v163, v164);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v169)
  {
    objc_msgSend_readingPositionAnnotationVersion(v7, v165, v166, v167, v168);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v296 = 1;
LABEL_30:

      goto LABEL_31;
    }
  }
  objc_msgSend_readingPositionAnnotationVersion(self, v165, v166, v167, v168);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionAnnotationVersion(v7, v171, v172, v173, v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v296 = objc_msgSend_isEqualToString_(v170, v176, (uint64_t)v175, v177, v178);

  if (!v169)
    goto LABEL_30;
LABEL_31:

  objc_msgSend_readingPositionUserData(self, v179, v180, v181, v182);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v308 = v8;
  if (!v187)
  {
    objc_msgSend_readingPositionUserData(v7, v183, v184, v185, v186);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      isEqual = 1;
LABEL_36:

      goto LABEL_37;
    }
  }
  objc_msgSend_readingPositionUserData(self, v183, v184, v185, v186);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionUserData(v7, v189, v190, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v188, v194, (uint64_t)v193, v195, v196);

  if (!v187)
    goto LABEL_36;
LABEL_37:

  v295 = objc_msgSend_readingPositionLocationRangeStart(self, v197, v198, v199, v200);
  v294 = objc_msgSend_readingPositionLocationRangeStart(v7, v201, v202, v203, v204);
  v293 = objc_msgSend_readingPositionLocationRangeEnd(self, v205, v206, v207, v208);
  v292 = objc_msgSend_readingPositionLocationRangeEnd(v7, v209, v210, v211, v212);
  v291 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v213, v214, v215, v216);
  v290 = objc_msgSend_readingPositionAbsolutePhysicalLocation(v7, v217, v218, v219, v220);
  objc_msgSend_readingPositionStorageUUID(self, v221, v222, v223, v224);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionStorageUUID(v7, v226, v227, v228, v229);
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  v289 = v225;
  objc_msgSend_readingPositionLocationUpdateDate(self, v231, v232, v233, v234);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v239)
  {
    objc_msgSend_readingPositionLocationUpdateDate(v7, v235, v236, v237, v238);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v288 = 1;
LABEL_42:

      goto LABEL_43;
    }
  }
  objc_msgSend_readingPositionLocationUpdateDate(self, v235, v236, v237, v238);
  v240 = isFinished;
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionLocationUpdateDate(v7, v242, v243, v244, v245);
  v246 = v31;
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = objc_msgSend_isEqualToDate_(v241, v248, (uint64_t)v247, v249, v250);

  v31 = v246;
  isFinished = v240;
  if (!v239)
    goto LABEL_42;
LABEL_43:
  v251 = isFinished ^ v31;
  v252 = v305 ^ v304;

  objc_msgSend_datePlaybackTimeUpdated(self, v253, v254, v255, v256);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v261)
  {
    objc_msgSend_datePlaybackTimeUpdated(v7, v257, v258, v259, v260);
    isFinished = objc_claimAutoreleasedReturnValue();
    if (!isFinished)
    {
      v306 = 1;
LABEL_48:

      goto LABEL_49;
    }
  }
  objc_msgSend_datePlaybackTimeUpdated(self, v257, v258, v259, v260);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_datePlaybackTimeUpdated(v7, v263, v264, v265, v266);
  v267 = v44;
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v306 = objc_msgSend_isEqualToDate_(v262, v269, (uint64_t)v268, v270, v271);

  v44 = v267;
  if (!v261)
    goto LABEL_48;
LABEL_49:

  objc_msgSend_bookmarkTime(self, v272, v273, v274, v275);
  v277 = v276;
  objc_msgSend_bookmarkTime(v7, v278, v279, v280, v281);
  v283 = 0;
  if (((v308 & isEqualToString ^ 1 | v251 | v252) & 1) == 0
    && ((isEqualToDate ^ 1) & 1) == 0
    && v302 == v301
    && ((v300 ^ 1) & 1) == 0
    && v106 == v112
    && v118 == v124
    && ((v299 ^ 1) & 1) == 0
    && ((isEqual ^ 1) & 1) == 0
    && ((v297 ^ 1) & 1) == 0
    && ((v296 ^ 1) & 1) == 0
    && v295 == v294
    && v293 == v292
    && v291 == v290
    && v289 == v230
    && ((v288 ^ 1) & 1) == 0
    && v44 == v287
    && v286 == v285)
  {
    if (v277 == v282)
      v283 = v306;
    else
      v283 = 0;
  }

  return v283;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char isEqualToString;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int8 v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned __int8 v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  _BOOL4 v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  double v164;
  double v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  double v176;
  NSObject *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  NSObject *v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  const char *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  int v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  double v261;
  double v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  double v272;
  _BOOL4 v273;
  char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  double v288;
  double v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  double v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  double v324;
  double v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const __CFString *v330;
  double v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  double v346;
  double v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  double v357;
  double v358;
  NSObject *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  void *v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  void *v383;
  double v384;
  double v385;
  NSObject *v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const __CFString *v401;
  const char *v402;
  uint64_t v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  double v413;
  double v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  double v424;
  double v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  NSObject *v429;
  _BOOL4 v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  const __CFString *v445;
  const __CFString *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  double v451;
  const char *v452;
  NSObject *v453;
  uint32_t v454;
  NSObject *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  double v480;
  double v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  const __CFString *v486;
  double v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  NSObject *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  const __CFString *v506;
  int hasChanges;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  void *v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  int v517;
  NSObject *v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  void *v528;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  void *v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  __CFString *v538;
  const char *v539;
  const char *v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  const char *v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  const char *v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  void *v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  void *v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  void *v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  double v580;
  double v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  void *v586;
  const char *v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  const __CFString *v591;
  double v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  _BOOL4 v597;
  void *v598;
  char *v599;
  objc_super v600;
  uint8_t buf[4];
  void *v602;
  __int16 v603;
  void *v604;
  __int16 v605;
  const __CFString *v606;
  __int16 v607;
  void *v608;
  __int16 v609;
  double v610;
  uint64_t v611;

  v611 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v600.receiver = self;
  v600.super_class = (Class)BCAssetDetail;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v600, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_verboseLoggingEnabled(v11, v12, v13, v14, v15);

    if (v16)
    {
      BDSCloudKitDevelopmentLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227D4F000, v20, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail resolveConflictsFromRecord:withResolvers: record != nil\\\"\", buf, 2u);
      }

    }
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v17, (uint64_t)v6, v18, v19);
    v21 = (const char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetID(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v26, v27, (uint64_t)v21, v28, v29);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_227E5E698(self, v21, v35, v36, v37);

      objc_msgSend_setAssetID_(self, v38, (uint64_t)v21, v39, v40);
    }
    v599 = (char *)v21;
    objc_msgSend_modificationDate(self, v31, v32, v33, v34);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
      goto LABEL_12;
    v46 = (void *)v41;
    objc_msgSend_modificationDate(self, v42, v43, v44, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v47, v48, v49, v50, v51);
    v53 = v52;
    objc_msgSend_modificationDate(v6, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v58, v59, v60, v61, v62);
    v64 = v63;

    if (v53 >= v64)
    {
      objc_msgSend_modificationDate(self, v65, v66, v67, v68);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      if (v282)
      {
        objc_msgSend_modificationDate(v6, v278, v279, v280, v281);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v283, v284, v285, v286, v287);
        v289 = v288;
        objc_msgSend_modificationDate(self, v290, v291, v292, v293);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v294, v295, v296, v297, v298);
        v154 = v289 != v299;

      }
      else
      {
        v154 = 0;
      }

      BDSCloudKitLog();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v556, v557, v558, v559);
        v560 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v561, v562, v563, v564);
        v565 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v565, v566, v567, v568, v569);
        v570 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_modificationDate(self, v571, v572, v573, v574);
        v575 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v575, v576, v577, v578, v579);
        v581 = v580;
        objc_msgSend_modificationDate(v6, v582, v583, v584, v585);
        v586 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v586, v587, v588, v589, v590);
        v591 = CFSTR("newer");
        *(_DWORD *)buf = 138412802;
        v602 = v560;
        if (v581 == v592)
          v591 = CFSTR("the same");
        v603 = 2112;
        v604 = v570;
        v605 = 2114;
        v606 = v591;
        _os_log_impl(&dword_227D4F000, v88, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my basic properties as my modification date is %{public}@.", buf, 0x20u);

      }
    }
    else
    {
LABEL_12:
      BDSCloudKitLog();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v70, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v75, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v79, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v602 = v74;
        v603 = 2112;
        v604 = v84;
        _os_log_impl(&dword_227D4F000, v69, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@ adopting general record properties.", buf, 0x16u);

      }
      objc_msgSend_objectForKey_(v6, v85, (uint64_t)CFSTR("isFinished"), v86, v87);
      v88 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v89, (uint64_t)v88, (uint64_t)CFSTR("isFinished"), v90);
      objc_msgSend_objectForKey_(v6, v91, (uint64_t)CFSTR("notFinished"), v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v95, (uint64_t)v94, (uint64_t)CFSTR("notFinished"), v96);
      objc_msgSend_objectForKey_(v6, v97, (uint64_t)CFSTR("taste"), v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend_taste(self, v101, v102, v103, v104);
      v110 = objc_msgSend_shortValue(v100, v106, v107, v108, v109);
      v114 = v105 & 3;
      if ((v110 & 3) != 0)
        v114 = v110 & 3;
      objc_msgSend_numberWithShort_(MEMORY[0x24BDD16E0], v111, v114 | (v110 | v105) & 4u, v112, v113);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v116, (uint64_t)v115, (uint64_t)CFSTR("taste"), v117);

      objc_msgSend_objectForKey_(v6, v118, (uint64_t)CFSTR("tasteSyncedToStore"), v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v122, (uint64_t)v121, (uint64_t)CFSTR("tasteSyncedToStore"), v123);
      objc_msgSend_objectForKey_(v6, v124, (uint64_t)CFSTR("dateFinished"), v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentDate_forKey_(self, v128, (uint64_t)v127, (uint64_t)CFSTR("dateFinished"), v129);
      objc_msgSend_encryptedValues(v6, v130, v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v134, v135, (uint64_t)CFSTR("finishedDateKind"), v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setDifferentNumber_forKey_(self, v139, (uint64_t)v138, (uint64_t)CFSTR("finishedDateKind"), v140);
      objc_msgSend_objectForKey_(v6, v141, (uint64_t)CFSTR("lastOpenDate"), v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentDate_forKey_(self, v145, (uint64_t)v144, (uint64_t)CFSTR("lastOpenDate"), v146);
      objc_msgSend_modificationDate(v6, v147, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentDate_forKey_(self, v152, (uint64_t)v151, (uint64_t)CFSTR("modificationDate"), v153);

      v154 = 0;
    }

    objc_msgSend_objectForKey_(v6, v155, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v158;
    if (v158
      && (objc_msgSend_timeIntervalSinceReferenceDate(v158, v159, v160, v161, v162),
          v165 = v164,
          objc_msgSend_readingPositionLocationUpdateDate(self, v166, v167, v168, v169),
          v170 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_timeIntervalSinceReferenceDate(v170, v171, v172, v173, v174),
          v176 = v175,
          v170,
          v165 > v176))
    {
      v597 = v154;
      v598 = v163;
      BDSCloudKitLog();
      v177 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v178, v179, v180, v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v183, v184, v185, v186);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v187, v188, v189, v190, v191);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v602 = v182;
        v603 = 2112;
        v604 = v192;
        _os_log_impl(&dword_227D4F000, v177, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@ adopting reading position properties.", buf, 0x16u);

      }
      objc_msgSend_objectForKey_(v6, v193, (uint64_t)CFSTR("readingProgress"), v194, v195);
      v196 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v197, (uint64_t)v196, (uint64_t)CFSTR("readingProgress"), v198);
      objc_msgSend_objectForKey_(v6, v199, (uint64_t)CFSTR("readingProgressHighWaterMark"), v200, v201);
      v596 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v202, (uint64_t)v596, (uint64_t)CFSTR("readingProgressHighWaterMark"), v203);
      objc_msgSend_objectForKey_(v6, v204, (uint64_t)CFSTR("readingPositionCFIString"), v205, v206);
      v595 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v207, (uint64_t)v595, (uint64_t)CFSTR("readingPositionCFIString"), v208);
      objc_msgSend_objectForKey_(v6, v209, (uint64_t)CFSTR("readingPositionAssetVersion"), v210, v211);
      v594 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v212, (uint64_t)v594, (uint64_t)CFSTR("readingPositionAssetVersion"), v213);
      objc_msgSend_objectForKey_(v6, v214, (uint64_t)CFSTR("readingPositionAnnotationVersion"), v215, v216);
      v593 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v217, (uint64_t)v593, (uint64_t)CFSTR("readingPositionAnnotationVersion"), v218);
      objc_msgSend_objectForKey_(v6, v219, (uint64_t)CFSTR("readingPositionUserData"), v220, v221);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = objc_opt_class();
      objc_msgSend_setDifferentValue_forKey_klass_(self, v224, (uint64_t)v222, (uint64_t)CFSTR("readingPositionUserData"), v223);
      objc_msgSend_objectForKey_(v6, v225, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v226, v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v229, (uint64_t)v228, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v230);
      objc_msgSend_objectForKey_(v6, v231, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v232, v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v235, (uint64_t)v234, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v236);
      objc_msgSend_objectForKey_(v6, v237, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v238, v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentNumber_forKey_(self, v241, (uint64_t)v240, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v242);
      objc_msgSend_objectForKey_(v6, v243, (uint64_t)CFSTR("readingPositionStorageUUID"), v244, v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v247, (uint64_t)v246, (uint64_t)CFSTR("readingPositionStorageUUID"), v248);
      objc_msgSend_objectForKey_(v6, v249, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v250, v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentDate_forKey_(self, v253, (uint64_t)v252, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v254);

      v163 = v598;
      v255 = v597;
    }
    else
    {
      objc_msgSend_readingPositionLocationUpdateDate(self, v159, v160, v161, v162);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      if (v260)
      {
        objc_msgSend_timeIntervalSinceReferenceDate(v163, v256, v257, v258, v259);
        v262 = v261;
        objc_msgSend_readingPositionLocationUpdateDate(self, v263, v264, v265, v266);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v267, v268, v269, v270, v271);
        v273 = v262 != v272;

      }
      else
      {
        v273 = 0;
      }

      v255 = v273 || v154;
      BDSCloudKitLog();
      v196 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v300, v301, v302, v303);
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v305, v306, v307, v308);
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v309, v310, v311, v312, v313);
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_readingPositionLocationUpdateDate(self, v315, v316, v317, v318);
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v319, v320, v321, v322, v323);
        v325 = v324;
        objc_msgSend_timeIntervalSinceReferenceDate(v163, v326, v327, v328, v329);
        v330 = CFSTR("newer");
        *(_DWORD *)buf = 138412802;
        v602 = v304;
        if (v325 == v331)
          v330 = CFSTR("the same");
        v603 = 2112;
        v604 = v314;
        v605 = 2114;
        v606 = v330;
        _os_log_impl(&dword_227D4F000, v196, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my reading position properties as my reading position update date is %{public}@.", buf, 0x20u);

      }
    }

    objc_msgSend_objectForKey_(v6, v332, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v333, v334);
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    if (v339)
    {
      objc_msgSend_datePlaybackTimeUpdated(self, v335, v336, v337, v338);
      v340 = objc_claimAutoreleasedReturnValue();
      if (!v340)
        goto LABEL_36;
      v345 = (void *)v340;
      objc_msgSend_timeIntervalSinceReferenceDate(v339, v341, v342, v343, v344);
      v347 = v346;
      objc_msgSend_datePlaybackTimeUpdated(self, v348, v349, v350, v351);
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v352, v353, v354, v355, v356);
      v358 = v357;

      if (v347 > v358)
      {
LABEL_36:
        BDSCloudKitLog();
        v359 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v359, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_assetID(self, v360, v361, v362, v363);
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v365, v366, v367, v368);
          v369 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v369, v370, v371, v372, v373);
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v602 = v364;
          v603 = 2112;
          v604 = v374;
          _os_log_impl(&dword_227D4F000, v359, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Resolving conflicts from record %@ adopting playback time properties.", buf, 0x16u);

        }
        objc_msgSend_objectForKey_(v6, v375, (uint64_t)CFSTR("bookmarkTime"), v376, v377);
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        v383 = v378;
        if (v378)
        {
          objc_msgSend_doubleValue(v378, v379, v380, v381, v382);
          v385 = v384;
          BDSCloudKitAudiobookLog();
          v386 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v386, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_assetID(self, v387, v388, v389, v390);
            v391 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_datePlaybackTimeUpdated(self, v392, v393, v394, v395);
            v396 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bookmarkTime(self, v397, v398, v399, v400);
            *(_DWORD *)buf = 138413314;
            v602 = v391;
            v603 = 2112;
            v604 = v396;
            v605 = 2048;
            v606 = v401;
            v607 = 2112;
            v608 = v339;
            v609 = 2048;
            v610 = v385;
            _os_log_impl(&dword_227D4F000, v386, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Resolving bookmark time old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);

          }
          objc_msgSend_setDifferentDate_forKey_(self, v402, (uint64_t)v339, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v403);
          objc_msgSend_setDifferentBookmarkTime_(self, v404, v405, v406, v407, v385);
        }
        else
        {
          BDSCloudKitAudiobookLog();
          v492 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v492, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_assetID(self, v493, v494, v495, v496);
            v497 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v602 = v497;
            _os_log_impl(&dword_227D4F000, v492, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as bookmark time is NULL.", buf, 0xCu);

          }
        }
LABEL_62:

        if ((v255 & 1) == 0)
          goto LABEL_64;
        goto LABEL_63;
      }
    }
    objc_msgSend_datePlaybackTimeUpdated(self, v335, v336, v337, v338);
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    if (v412)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(v339, v408, v409, v410, v411);
      v414 = v413;
      objc_msgSend_datePlaybackTimeUpdated(self, v415, v416, v417, v418);
      v419 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v419, v420, v421, v422, v423);
      v425 = v424;

      if (v414 != v425)
        v255 = 1;
    }

    if (!v339)
    {
      BDSCloudKitAudiobookLog();
      v455 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v455, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_assetID(self, v456, v457, v458, v459);
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v461, v462, v463, v464);
        v465 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v465, v466, v467, v468, v469);
        v470 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_datePlaybackTimeUpdated(self, v471, v472, v473, v474);
        v475 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v475, v476, v477, v478, v479);
        v481 = v480;
        objc_msgSend_timeIntervalSinceReferenceDate(0, v482, v483, v484, v485);
        v486 = CFSTR("newer");
        *(_DWORD *)buf = 138412802;
        v602 = v460;
        if (v481 == v487)
          v486 = CFSTR("the same");
        v603 = 2112;
        v604 = v470;
        v605 = 2114;
        v606 = v486;
        _os_log_impl(&dword_227D4F000, v455, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my playback time properties as my playback time update date is %{public}@.", buf, 0x20u);

      }
      if (!v255)
      {
LABEL_64:
        hasChanges = objc_msgSend_hasChanges(self, v488, v489, v490, v491);
        objc_msgSend_shared(MEMORY[0x24BE0FC08], v508, v509, v510, v511);
        v512 = (void *)objc_claimAutoreleasedReturnValue();
        v517 = objc_msgSend_verboseLoggingEnabled(v512, v513, v514, v515, v516);

        if (hasChanges)
        {
          if (v517)
          {
            BDSCloudKitDevelopmentLog();
            v518 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v518, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_assetID(self, v519, v520, v521, v522);
              v523 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v6, v524, v525, v526, v527);
              v528 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordName(v528, v529, v530, v531, v532);
              v533 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_debugDescription(self, v534, v535, v536, v537);
              v538 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v602 = v523;
              v603 = 2112;
              v604 = v533;
              v605 = 2112;
              v606 = v538;
              v539 = "\"\\\"BCAssetDetail %@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_71:
              _os_log_impl(&dword_227D4F000, v518, OS_LOG_TYPE_DEFAULT, v539, buf, 0x20u);

              goto LABEL_72;
            }
            goto LABEL_72;
          }
        }
        else if (v517)
        {
          BDSCloudKitDevelopmentLog();
          v518 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v518, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_assetID(self, v540, v541, v542, v543);
            v523 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v6, v544, v545, v546, v547);
            v528 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordName(v528, v548, v549, v550, v551);
            v533 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_debugDescription(self, v552, v553, v554, v555);
            v538 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v602 = v523;
            v603 = 2112;
            v604 = v533;
            v605 = 2112;
            v606 = v538;
            v539 = "\"\\\"BCAssetDetail %@ Resolving: Identical properties from record: %@ %@\\\"\";
            goto LABEL_71;
          }
LABEL_72:

        }
        v274 = v599;
        goto LABEL_74;
      }
LABEL_63:
      objc_msgSend_incrementEditGeneration(self, v488, v489, v490, v491);
      goto LABEL_64;
    }
    objc_msgSend_objectForKey_(v6, v426, (uint64_t)CFSTR("bookmarkTime"), v427, v428);
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    BDSCloudKitAudiobookLog();
    v429 = objc_claimAutoreleasedReturnValue();
    v430 = os_log_type_enabled(v429, OS_LOG_TYPE_DEFAULT);
    if (v383)
    {
      if (v430)
      {
        objc_msgSend_assetID(self, v431, v432, v433, v434);
        v435 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_datePlaybackTimeUpdated(self, v436, v437, v438, v439);
        v440 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bookmarkTime(self, v441, v442, v443, v444);
        v446 = v445;
        objc_msgSend_doubleValue(v383, v447, v448, v449, v450);
        *(_DWORD *)buf = 138413314;
        v602 = v435;
        v603 = 2112;
        v604 = v440;
        v605 = 2048;
        v606 = v446;
        v607 = 2112;
        v608 = v339;
        v609 = 2048;
        v610 = v451;
        v452 = "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as my bookmark time is newer old:[%@ = %.2f]"
               " new:[%@ = %.2f].";
        v453 = v429;
        v454 = 52;
LABEL_60:
        _os_log_impl(&dword_227D4F000, v453, OS_LOG_TYPE_DEFAULT, v452, buf, v454);

      }
    }
    else if (v430)
    {
      objc_msgSend_assetID(self, v431, v432, v433, v434);
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_datePlaybackTimeUpdated(self, v498, v499, v500, v501);
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bookmarkTime(self, v502, v503, v504, v505);
      *(_DWORD *)buf = 138413058;
      v602 = v435;
      v603 = 2112;
      v604 = v440;
      v605 = 2048;
      v606 = v506;
      v607 = 2112;
      v608 = v339;
      v452 = "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as my bookmark time is newer old:[%@ = %.2f] new:[%@ = NULL].";
      v453 = v429;
      v454 = 42;
      goto LABEL_60;
    }

    goto LABEL_62;
  }
  BDSCloudKitLog();
  v274 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v274, OS_LOG_TYPE_ERROR))
    sub_227E5E604(self, v274, v275, v276, v277);
LABEL_74:

}

- (id)recordType
{
  return CFSTR("assetDetail");
}

+ (id)propertyIDKey
{
  return CFSTR("assetID");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (BOOL)isAudiobook
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_datePlaybackTimeUpdated(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (NSString)debugDescription
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
  const __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
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
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v106;
  void *v107;
  int v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  const __CFString *v113;
  const __CFString *v114;
  void *v115;
  void *v116;

  v116 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isFinished(self, v6, v7, v8, v9))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v114 = v14;
  if (objc_msgSend_notFinished(self, v10, v11, v12, v13))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v113 = v19;
  objc_msgSend_dateFinished(self, v15, v16, v17, v18);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend_finishedDateKind(self, v20, v21, v22, v23);
  objc_msgSend_lastOpenDate(self, v24, v25, v26, v27);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend_taste(self, v28, v29, v30, v31);
  v108 = objc_msgSend_tasteSyncedToStore(self, v32, v33, v34, v35);
  objc_msgSend_readingProgress(self, v36, v37, v38, v39);
  v41 = v40;
  objc_msgSend_readingProgressHighWaterMark(self, v42, v43, v44, v45);
  v47 = v46;
  objc_msgSend_readingPositionCFIString(self, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionAnnotationVersion(self, v53, v54, v55, v56);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionAssetVersion(self, v57, v58, v59, v60);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionUserData(self, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_readingPositionLocationRangeStart(self, v66, v67, v68, v69);
  v75 = objc_msgSend_readingPositionLocationRangeEnd(self, v71, v72, v73, v74);
  v80 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v76, v77, v78, v79);
  objc_msgSend_readingPositionStorageUUID(self, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionLocationUpdateDate(self, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_datePlaybackTimeUpdated(self, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bookmarkTime(self, v96, v97, v98, v99);
  objc_msgSend_stringWithFormat_(v116, v100, (uint64_t)CFSTR("BCAssetDetail assetID: %@\n  (isFinished: %@, notFinished: %@, dateFinished: %@, finishedDateKind: %d, lastOpenDate: %@)  (taste: %x, tasteSyncedToStore: %d)  readingPosition=(\n    readingProgress:%.2f\n    readingProgressHighWaterMark:%.2f\n    cfi:%@\n    annotationVersion=%@\n    assetVersion=%@\n    userData=%@\n    locationRangeStart=%d    locationRangeEnd=%d    absolutePhysicalLocation=%d    storageUUID=%@\n    locationUpdateDate=%@)\n  playbackPosition=(\n    datePlaybackTimeUpdated=%@\n    bookmarkTime = %.2f)"), v101, v102, v115, v114, v113, v112, v111, v110, v109, v108, *(_QWORD *)&v41, *(_QWORD *)&v47, v52, v107, v106, v65,
    v70,
    v75,
    v80,
    v85,
    v90,
    v95,
    v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v104;
}

@end
