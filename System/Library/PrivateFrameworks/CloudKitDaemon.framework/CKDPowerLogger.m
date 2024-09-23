@implementation CKDPowerLogger

- (void)logOperationCombinedMetrics:(id)a3 forOperationID:(id)a4 operationType:(int64_t)a5 operationGroupID:(id)a6 operationGroupName:(id)a7 operationGroupQuantity:(unint64_t)a8 operationQualityOfService:(int64_t)a9 xpcActivityIdentifier:(id)a10 appContainerTuple:(id)a11
{
  id v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const __CFString *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const __CFString *v61;
  const __CFString *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  double v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  double v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  void *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  void *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  void *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  void *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  void *v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  NSObject *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  id v245;
  __CFString *v246;
  __CFString *v247;
  __CFString *v248;
  __CFString *v249;
  id v250;
  CKDPowerLogger *v251;
  void *v252;
  void *v254;
  uint8_t buf[4];
  void *v256;
  _QWORD v257[38];
  _QWORD v258[40];

  v258[38] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = (__CFString *)a4;
  v18 = (__CFString *)a6;
  v19 = (__CFString *)a7;
  v20 = (__CFString *)a10;
  v21 = a11;
  v251 = self;
  v22 = (void *)objc_opt_class();
  if (objc_msgSend_isEnabled(v22, v23, v24))
  {
    objc_msgSend_cloudKitMetrics(v16, v25, v26);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = v16;
    objc_msgSend_MMCSMetrics(v16, v27, v28);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = v18;
    v249 = v17;
    if (v17)
      v30 = v17;
    else
      v30 = &stru_1E7838F48;
    v257[0] = CFSTR("operationID");
    v257[1] = CFSTR("operationGroupID");
    if (v18)
      v31 = v18;
    else
      v31 = &stru_1E7838F48;
    v258[0] = v30;
    v258[1] = v31;
    v247 = v19;
    if (v19)
      v32 = v19;
    else
      v32 = &stru_1E7838F48;
    v258[2] = v32;
    v257[2] = CFSTR("operationGroupName");
    v257[3] = CFSTR("operationGroupQuantity");
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v29, a8);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v258[3] = v244;
    v257[4] = CFSTR("operationQualityOfService");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v33, a9);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    v258[4] = v243;
    v257[5] = CFSTR("operationType");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v34, a5);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v258[5] = v242;
    v257[6] = CFSTR("containerIdentifier");
    objc_msgSend_containerID(v21, v35, v36);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v241, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    v240 = (void *)v39;
    if (v39)
      v42 = (const __CFString *)v39;
    else
      v42 = &stru_1E7838F48;
    v258[6] = v42;
    v257[7] = CFSTR("containerEnvironment");
    v43 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_containerID(v21, v40, v41);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_environment(v239, v44, v45);
    objc_msgSend_numberWithInteger_(v43, v47, v46);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v258[7] = v238;
    v257[8] = CFSTR("bundleIdentifier");
    objc_msgSend_applicationID(v21, v48, v49);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifier(v237, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    v236 = (void *)v52;
    if (v52)
      v55 = (const __CFString *)v52;
    else
      v55 = &stru_1E7838F48;
    v258[8] = v55;
    v257[9] = CFSTR("sourceAppBundleIdentifier");
    v245 = v21;
    objc_msgSend_applicationID(v21, v53, v54);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v235, v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    v234 = (void *)v58;
    if (v58)
      v61 = (const __CFString *)v58;
    else
      v61 = &stru_1E7838F48;
    v246 = v20;
    if (v20)
      v62 = v20;
    else
      v62 = &stru_1E7838F48;
    v258[9] = v61;
    v258[10] = v62;
    v257[10] = CFSTR("xpcActivityIdentifier");
    v257[11] = CFSTR("CKStartDate");
    objc_msgSend_startDate(v214, v59, v60);
    v65 = objc_claimAutoreleasedReturnValue();
    v233 = (void *)v65;
    if (!v65)
    {
      objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v63, v64);
      v65 = objc_claimAutoreleasedReturnValue();
    }
    v213 = (void *)v65;
    v258[11] = v65;
    v257[12] = CFSTR("CKDuration");
    v66 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_duration(v214, v63, v64);
    objc_msgSend_numberWithUnsignedInteger_(v66, v68, (unint64_t)v67);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v258[12] = v232;
    v257[13] = CFSTR("CKBytesUploaded");
    v69 = (void *)MEMORY[0x1E0CB37E8];
    v72 = objc_msgSend_bytesUploaded(v214, v70, v71);
    objc_msgSend_numberWithUnsignedInteger_(v69, v73, v72);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v258[13] = v231;
    v257[14] = CFSTR("CKBytesDownloaded");
    v74 = (void *)MEMORY[0x1E0CB37E8];
    v77 = objc_msgSend_bytesDownloaded(v214, v75, v76);
    objc_msgSend_numberWithUnsignedInteger_(v74, v78, v77);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v258[14] = v230;
    v257[15] = CFSTR("CKConnections");
    v79 = (void *)MEMORY[0x1E0CB37E8];
    v82 = objc_msgSend_connections(v214, v80, v81);
    objc_msgSend_numberWithUnsignedInteger_(v79, v83, v82);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v258[15] = v229;
    v257[16] = CFSTR("CKConnectionsCreated");
    v84 = (void *)MEMORY[0x1E0CB37E8];
    v87 = objc_msgSend_connectionsCreated(v214, v85, v86);
    objc_msgSend_numberWithUnsignedInteger_(v84, v88, v87);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    v258[16] = v228;
    v257[17] = CFSTR("CKRecordsUploaded");
    v89 = (void *)MEMORY[0x1E0CB37E8];
    v92 = objc_msgSend_recordsUploaded(v214, v90, v91);
    objc_msgSend_numberWithUnsignedInteger_(v89, v93, v92);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v258[17] = v227;
    v257[18] = CFSTR("CKRecordsDownloaded");
    v94 = (void *)MEMORY[0x1E0CB37E8];
    v97 = objc_msgSend_recordsDownloaded(v214, v95, v96);
    objc_msgSend_numberWithUnsignedInteger_(v94, v98, v97);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v258[18] = v226;
    v257[19] = CFSTR("CKRecordsDeleted");
    v99 = (void *)MEMORY[0x1E0CB37E8];
    v102 = objc_msgSend_recordsDeleted(v214, v100, v101);
    objc_msgSend_numberWithUnsignedInteger_(v99, v103, v102);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v258[19] = v225;
    v257[20] = CFSTR("CKAssetsUploaded");
    v104 = (void *)MEMORY[0x1E0CB37E8];
    v107 = objc_msgSend_assetsUploaded(v214, v105, v106);
    objc_msgSend_numberWithUnsignedInteger_(v104, v108, v107);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v258[20] = v224;
    v257[21] = CFSTR("CKAssetsUploadedFileSize");
    v109 = (void *)MEMORY[0x1E0CB37E8];
    v112 = objc_msgSend_assetsUploadedFileSize(v214, v110, v111);
    objc_msgSend_numberWithUnsignedInteger_(v109, v113, v112);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v258[21] = v223;
    v257[22] = CFSTR("CKAssetsDownloaded");
    v114 = (void *)MEMORY[0x1E0CB37E8];
    v117 = objc_msgSend_assetsDownloaded(v214, v115, v116);
    objc_msgSend_numberWithUnsignedInteger_(v114, v118, v117);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    v258[22] = v222;
    v257[23] = CFSTR("CKAssetsDownloadedFileSize");
    v119 = (void *)MEMORY[0x1E0CB37E8];
    v122 = objc_msgSend_assetsDownloadedFileSize(v214, v120, v121);
    objc_msgSend_numberWithUnsignedInteger_(v119, v123, v122);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v258[23] = v221;
    v257[24] = CFSTR("CKRetries");
    v124 = (void *)MEMORY[0x1E0CB37E8];
    v127 = objc_msgSend_retries(v214, v125, v126);
    objc_msgSend_numberWithUnsignedInteger_(v124, v128, v127);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v258[24] = v220;
    v257[25] = CFSTR("CKNumberOfRequests");
    v129 = (void *)MEMORY[0x1E0CB37E8];
    v132 = objc_msgSend_requestCount(v214, v130, v131);
    objc_msgSend_numberWithUnsignedInteger_(v129, v133, v132);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v258[25] = v219;
    v257[26] = CFSTR("CKProtoRequestOperationsByCount");
    objc_msgSend_requestOperationCountsByType(v214, v134, v135);
    v136 = objc_claimAutoreleasedReturnValue();
    v218 = (void *)v136;
    v139 = MEMORY[0x1E0C9AA70];
    if (v136)
      v140 = v136;
    else
      v140 = MEMORY[0x1E0C9AA70];
    v258[26] = v140;
    v257[27] = CFSTR("MMCSDuration");
    v141 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_duration(v252, v137, v138);
    objc_msgSend_numberWithUnsignedInteger_(v141, v143, (unint64_t)v142);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v258[27] = v217;
    v257[28] = CFSTR("MMCSBytesUploaded");
    v144 = (void *)MEMORY[0x1E0CB37E8];
    v147 = objc_msgSend_bytesUploaded(v252, v145, v146);
    objc_msgSend_numberWithUnsignedInteger_(v144, v148, v147);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v258[28] = v216;
    v257[29] = CFSTR("MMCSBytesDownloaded");
    v149 = (void *)MEMORY[0x1E0CB37E8];
    v152 = objc_msgSend_bytesDownloaded(v252, v150, v151);
    objc_msgSend_numberWithUnsignedInteger_(v149, v153, v152);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v258[29] = v215;
    v257[30] = CFSTR("MMCSConnections");
    v154 = (void *)MEMORY[0x1E0CB37E8];
    v157 = objc_msgSend_connections(v252, v155, v156);
    objc_msgSend_numberWithUnsignedInteger_(v154, v158, v157);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v258[30] = v159;
    v257[31] = CFSTR("MMCSConnectionsCreated");
    v160 = (void *)MEMORY[0x1E0CB37E8];
    v163 = objc_msgSend_connectionsCreated(v252, v161, v162);
    objc_msgSend_numberWithUnsignedInteger_(v160, v164, v163);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v258[31] = v165;
    v257[32] = CFSTR("MMCSBytesFulfilledLocally");
    v166 = (void *)MEMORY[0x1E0CB37E8];
    v169 = objc_msgSend_bytesFulfilledLocally(v252, v167, v168);
    objc_msgSend_numberWithUnsignedLongLong_(v166, v170, v169);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v258[32] = v171;
    v257[33] = CFSTR("MMCSBytesResumed");
    v172 = (void *)MEMORY[0x1E0CB37E8];
    v175 = objc_msgSend_bytesResumed(v252, v173, v174);
    objc_msgSend_numberWithUnsignedLongLong_(v172, v176, v175);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v258[33] = v177;
    v257[34] = CFSTR("MMCSNumberOfRequests");
    v178 = (void *)MEMORY[0x1E0CB37E8];
    v181 = objc_msgSend_requestCount(v252, v179, v180);
    objc_msgSend_numberWithUnsignedInteger_(v178, v182, v181);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v258[34] = v183;
    v257[35] = CFSTR("MMCSTotalBytesByChunkProfile");
    objc_msgSend_totalBytesByChunkProfile(v252, v184, v185);
    v186 = objc_claimAutoreleasedReturnValue();
    v189 = (void *)v186;
    if (v186)
      v190 = v186;
    else
      v190 = v139;
    v258[35] = v190;
    v257[36] = CFSTR("MMCSChunkCountByChunkProfile");
    objc_msgSend_chunkCountByChunkProfile(v252, v187, v188);
    v191 = objc_claimAutoreleasedReturnValue();
    v194 = (void *)v191;
    if (v191)
      v195 = v191;
    else
      v195 = v139;
    v258[36] = v195;
    v257[37] = CFSTR("MMCSFileCountByChunkProfile");
    objc_msgSend_fileCountByChunkProfile(v252, v192, v193);
    v196 = objc_claimAutoreleasedReturnValue();
    v198 = (void *)v196;
    if (v196)
      v199 = v196;
    else
      v199 = v139;
    v258[37] = v199;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v197, (uint64_t)v258, v257, 38);
    v254 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v233)
    objc_msgSend_zoneIDs(v214, v200, v201);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneIDsToZoneNamesString_(v251, v203, (uint64_t)v202);
    v204 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v250;
    v21 = v245;
    if (v204)
    {
      v207 = (void *)objc_msgSend_mutableCopy(v254, v205, v206);
      objc_msgSend_setObject_forKeyedSubscript_(v207, v208, (uint64_t)v204, CFSTR("ZoneNames"));
      v211 = objc_msgSend_copy(v207, v209, v210);

      v254 = (void *)v211;
    }
    v18 = v248;
    v17 = v249;
    v20 = v246;
    v19 = v247;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v212 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v256 = v254;
      _os_log_debug_impl(&dword_1BE990000, v212, OS_LOG_TYPE_DEBUG, "Logging power event: %@", buf, 0xCu);
    }
    PLLogRegisteredEvent();

  }
}

+ (BOOL)isEnabled
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int isSystemInstalledBinary;
  BOOL result;

  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_processType(v3, v4, v5);

  result = v6 != 2
        && (objc_msgSend_currentProcess(CKDDaemonProcess, v7, v8),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v9, v10, v11),
            v9,
            isSystemInstalledBinary)
        && (CKIsRunningInSyncBubble() & 1) == 0
        && PLShouldLogRegisteredEvent() != 0;
  return result;
}

- (id)zoneIDsToZoneNamesString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  __CFString *v33;
  __CFString *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CKMainBundleIsAppleExecutable())
  {
    if (objc_msgSend_count(v3, v4, v5))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v7 = v3;
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v36, v40, 16);
      if (v9)
      {
        v12 = v9;
        v13 = *(_QWORD *)v37;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v37 != v13)
              objc_enumerationMutation(v7);
            objc_msgSend_zoneName(*(void **)(*((_QWORD *)&v36 + 1) + 8 * v14), v10, v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v6, v16, (uint64_t)v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v36, v40, 16);
        }
        while (v12);
      }

      objc_msgSend_allObjects(v6, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortedArrayUsingSelector_(v19, v20, (uint64_t)sel_localizedCaseInsensitiveCompare_);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_componentsJoinedByString_(v21, v22, (uint64_t)CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      v27 = objc_msgSend_count(v7, v25, v26);
      objc_msgSend_stringWithFormat_(v24, v28, (uint64_t)CFSTR("zoneNames:%lu:%@"), v27, v23, (_QWORD)v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend_length(v29, v30, v31) < 0x101)
      {
        v33 = v29;
      }
      else
      {
        objc_msgSend_substringToIndex_(v29, v32, 256);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v34 = v33;

    }
    else
    {
      v34 = &stru_1E7838F48;
    }
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)sharedLogger
{
  if (qword_1ED702870 != -1)
    dispatch_once(&qword_1ED702870, &unk_1E78339A8);
  return (id)qword_1ED702868;
}

@end
