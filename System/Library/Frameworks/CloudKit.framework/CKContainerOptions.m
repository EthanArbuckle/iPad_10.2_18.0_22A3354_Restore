@implementation CKContainerOptions

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(self, v4, (uint64_t)v12, v5);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(self, v6, (uint64_t)v12, v7);
  objc_msgSend_setApplicationBundleIdentifierOverrideForPushTopicGeneration_(self, v8, (uint64_t)v12, v9);
  objc_msgSend_setApplicationBundleIdentifierOverrideForTCC_(self, v10, (uint64_t)v12, v11);

}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setApplicationBundleIdentifierOverrideForTCC:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void)setApplicationBundleIdentifierOverrideForPushTopicGeneration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceReferenceProtocol, 0);
  objc_storeStrong((id *)&self->_immediateUseDatabaseScopeForTesting, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForTCC, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForPushTopicGeneration, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_encryptionServiceName, 0);
  objc_storeStrong((id *)&self->_accountOverrideInfo, 0);
  objc_storeStrong((id *)&self->_supportedDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_fakeEntitlements, 0);
}

- (BOOL)isEqual:(id)a3
{
  CKContainerOptions *v4;
  CKContainerOptions *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  int isServiceManatee;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  int OnlyManatee;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  int v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  int v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  int v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  int v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  int v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  int v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  int v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  int v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  int v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  int ChangesForMergeableValues;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  int v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  int v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  char v246;

  v4 = (CKContainerOptions *)a3;
  if (self == v4)
  {
    v246 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = objc_msgSend_captureResponseHTTPHeaders(v5, v6, v7, v8);
      if (v9 != objc_msgSend_captureResponseHTTPHeaders(self, v10, v11, v12))
        goto LABEL_36;
      v16 = objc_msgSend_useZoneWidePCS(v5, v13, v14, v15);
      if (v16 != objc_msgSend_useZoneWidePCS(self, v17, v18, v19))
        goto LABEL_36;
      v23 = objc_msgSend_holdAllOperations(v5, v20, v21, v22);
      if (v23 != objc_msgSend_holdAllOperations(self, v24, v25, v26))
        goto LABEL_36;
      objc_msgSend_accountOverrideInfo(v5, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountOverrideInfo(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CKObjectsAreBothNilOrEqual(v30, v34);

      if (!v35)
        goto LABEL_36;
      v39 = objc_msgSend_qualityOfService(v5, v36, v37, v38);
      if (v39 != objc_msgSend_qualityOfService(self, v40, v41, v42))
        goto LABEL_36;
      v46 = objc_msgSend_returnPCSMetadata(v5, v43, v44, v45);
      if (v46 != objc_msgSend_returnPCSMetadata(self, v47, v48, v49))
        goto LABEL_36;
      v53 = objc_msgSend_mmcsEncryptionSupport(v5, v50, v51, v52);
      if (v53 != objc_msgSend_mmcsEncryptionSupport(self, v54, v55, v56))
        goto LABEL_36;
      objc_msgSend_encryptionServiceName(v5, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encryptionServiceName(self, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = CKObjectsAreBothNilOrEqual(v60, v64);

      if (!v65)
        goto LABEL_36;
      isServiceManatee = objc_msgSend_isServiceManatee(v5, v66, v67, v68);
      if (isServiceManatee != objc_msgSend_isServiceManatee(self, v70, v71, v72))
        goto LABEL_36;
      v76 = objc_msgSend_bypassPCSEncryption(v5, v73, v74, v75);
      if (v76 != objc_msgSend_bypassPCSEncryption(self, v77, v78, v79))
        goto LABEL_36;
      v83 = objc_msgSend_enforceNamedOperationGroups(v5, v80, v81, v82);
      if (v83 != objc_msgSend_enforceNamedOperationGroups(self, v84, v85, v86))
        goto LABEL_36;
      OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v5, v87, v88, v89);
      if (OnlyManatee != objc_msgSend_forceEnableReadOnlyManatee(self, v91, v92, v93))
        goto LABEL_36;
      objc_msgSend_uploadRequestConfiguration(v5, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uploadRequestConfiguration(self, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = CKObjectsAreBothNilOrEqual(v97, v101);

      if (!v102)
        goto LABEL_36;
      objc_msgSend_personaIdentifier(v5, v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_personaIdentifier(self, v107, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = CKObjectsAreBothNilOrEqual(v106, v110);

      if (!v111)
        goto LABEL_36;
      v115 = objc_msgSend_useClearAssetEncryption(v5, v112, v113, v114);
      if (v115 != objc_msgSend_useClearAssetEncryption(self, v116, v117, v118))
        goto LABEL_36;
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v5, v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v123, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = CKObjectsAreBothNilOrEqual(v122, v126);

      if (!v127)
        goto LABEL_36;
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v5, v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = CKObjectsAreBothNilOrEqual(v131, v135);

      if (!v136)
        goto LABEL_36;
      objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v5, v137, v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = CKObjectsAreBothNilOrEqual(v140, v144);

      if (!v145)
        goto LABEL_36;
      objc_msgSend_applicationBundleIdentifierOverrideForTCC(v5, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v150, v151, v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = CKObjectsAreBothNilOrEqual(v149, v153);

      if (!v154)
        goto LABEL_36;
      objc_msgSend_fakeEntitlements(v5, v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fakeEntitlements(self, v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CKObjectsAreBothNilOrEqual(v158, v162);

      if (!v163)
        goto LABEL_36;
      v167 = objc_msgSend_useAnonymousToServerShareParticipants(v5, v164, v165, v166);
      if (v167 != objc_msgSend_useAnonymousToServerShareParticipants(self, v168, v169, v170))
        goto LABEL_36;
      v174 = objc_msgSend_encryptMergeableValueMetadata(v5, v171, v172, v173);
      if (v174 != objc_msgSend_encryptMergeableValueMetadata(self, v175, v176, v177))
        goto LABEL_36;
      objc_msgSend_testDeviceReferenceProtocol(v5, v178, v179, v180);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReferenceProtocol(self, v182, v183, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = CKObjectsAreBothNilOrEqual(v181, v185);

      if (!v186)
        goto LABEL_36;
      v190 = objc_msgSend_returnRequestOperationProto(v5, v187, v188, v189);
      if (v190 != objc_msgSend_returnRequestOperationProto(self, v191, v192, v193))
        goto LABEL_36;
      v197 = objc_msgSend_maintainRecordUploadOrder(v5, v194, v195, v196);
      if (v197 != objc_msgSend_maintainRecordUploadOrder(self, v198, v199, v200))
        goto LABEL_36;
      v204 = objc_msgSend_addDatabaseScopeToZoneIDs(v5, v201, v202, v203);
      if (v204 != objc_msgSend_addDatabaseScopeToZoneIDs(self, v205, v206, v207))
        goto LABEL_36;
      ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(v5, v208, v209, v210);
      if (ChangesForMergeableValues != objc_msgSend_fetchChangesForMergeableValues(self, v212, v213, v214))goto LABEL_36;
      v218 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(v5, v215, v216, v217);
      if (v218 != objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v219, v220, v221))
        goto LABEL_36;
      v225 = objc_msgSend_acceptServerSignedRecords(v5, v222, v223, v224);
      if (v225 != objc_msgSend_acceptServerSignedRecords(self, v226, v227, v228))
        goto LABEL_36;
      objc_msgSend_supportedDeviceCapabilities(v5, v229, v230, v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_supportedDeviceCapabilities(self, v233, v234, v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = CKObjectsAreBothNilOrEqual(v232, v236);

      if (v237)
      {
        objc_msgSend_immediateUseDatabaseScopeForTesting(v5, v238, v239, v240);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_immediateUseDatabaseScopeForTesting(self, v242, v243, v244);
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        v246 = CKObjectsAreBothNilOrEqual(v241, v245);

      }
      else
      {
LABEL_36:
        v246 = 0;
      }

    }
    else
    {
      v246 = 0;
    }
  }

  return v246;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKContainerOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CKAccountOverrideInfo *accountOverrideInfo;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
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
  uint64_t v39;
  NSString *encryptionServiceName;
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
  uint64_t v56;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSString *personaIdentifier;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSString *applicationBundleIdentifierOverrideForPushTopicGeneration;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSString *applicationBundleIdentifierOverrideForTCC;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSDictionary *fakeEntitlements;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  CKTestDeviceReferenceProtocol *testDeviceReferenceProtocol;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSArray *supportedDeviceCapabilities;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  NSNumber *immediateUseDatabaseScopeForTesting;

  v4 = objc_alloc_init(CKContainerOptions);
  v4->_captureResponseHTTPHeaders = objc_msgSend_captureResponseHTTPHeaders(self, v5, v6, v7);
  v4->_useZoneWidePCS = objc_msgSend_useZoneWidePCS(self, v8, v9, v10);
  v4->_holdAllOperations = objc_msgSend_holdAllOperations(self, v11, v12, v13);
  objc_msgSend_accountOverrideInfo(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  accountOverrideInfo = v4->_accountOverrideInfo;
  v4->_accountOverrideInfo = (CKAccountOverrideInfo *)v21;

  v4->_qualityOfService = objc_msgSend_qualityOfService(self, v23, v24, v25);
  v4->_returnPCSMetadata = objc_msgSend_returnPCSMetadata(self, v26, v27, v28);
  v4->_mmcsEncryptionSupport = objc_msgSend_mmcsEncryptionSupport(self, v29, v30, v31);
  objc_msgSend_encryptionServiceName(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_copy(v35, v36, v37, v38);
  encryptionServiceName = v4->_encryptionServiceName;
  v4->_encryptionServiceName = (NSString *)v39;

  v4->_isServiceManatee = objc_msgSend_isServiceManatee(self, v41, v42, v43);
  v4->_bypassPCSEncryption = objc_msgSend_bypassPCSEncryption(self, v44, v45, v46);
  v4->_enforceNamedOperationGroups = objc_msgSend_enforceNamedOperationGroups(self, v47, v48, v49);
  v4->_forceEnableReadOnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v50, v51, v52);
  objc_msgSend_uploadRequestConfiguration(self, v53, v54, v55);
  v56 = objc_claimAutoreleasedReturnValue();
  uploadRequestConfiguration = v4->_uploadRequestConfiguration;
  v4->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v56;

  objc_msgSend_personaIdentifier(self, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_copy(v61, v62, v63, v64);
  personaIdentifier = v4->_personaIdentifier;
  v4->_personaIdentifier = (NSString *)v65;

  v4->_useClearAssetEncryption = objc_msgSend_useClearAssetEncryption(self, v67, v68, v69);
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend_copy(v73, v74, v75, v76);
  applicationBundleIdentifierOverrideForContainerAccess = v4->_applicationBundleIdentifierOverrideForContainerAccess;
  v4->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v77;

  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend_copy(v82, v83, v84, v85);
  applicationBundleIdentifierOverrideForNetworkAttribution = v4->_applicationBundleIdentifierOverrideForNetworkAttribution;
  v4->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v86;

  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend_copy(v91, v92, v93, v94);
  applicationBundleIdentifierOverrideForPushTopicGeneration = v4->_applicationBundleIdentifierOverrideForPushTopicGeneration;
  v4->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v95;

  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_copy(v100, v101, v102, v103);
  applicationBundleIdentifierOverrideForTCC = v4->_applicationBundleIdentifierOverrideForTCC;
  v4->_applicationBundleIdentifierOverrideForTCC = (NSString *)v104;

  objc_msgSend_fakeEntitlements(self, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v109, v110, v111, v112);
  v113 = objc_claimAutoreleasedReturnValue();
  fakeEntitlements = v4->_fakeEntitlements;
  v4->_fakeEntitlements = (NSDictionary *)v113;

  v4->_useAnonymousToServerShareParticipants = objc_msgSend_useAnonymousToServerShareParticipants(self, v115, v116, v117);
  v4->_encryptMergeableValueMetadata = objc_msgSend_encryptMergeableValueMetadata(self, v118, v119, v120);
  objc_msgSend_testDeviceReferenceProtocol(self, v121, v122, v123);
  v124 = objc_claimAutoreleasedReturnValue();
  testDeviceReferenceProtocol = v4->_testDeviceReferenceProtocol;
  v4->_testDeviceReferenceProtocol = (CKTestDeviceReferenceProtocol *)v124;

  v4->_returnRequestOperationProto = objc_msgSend_returnRequestOperationProto(self, v126, v127, v128);
  v4->_maintainRecordUploadOrder = objc_msgSend_maintainRecordUploadOrder(self, v129, v130, v131);
  v4->_addDatabaseScopeToZoneIDs = objc_msgSend_addDatabaseScopeToZoneIDs(self, v132, v133, v134);
  v4->_fetchChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v135, v136, v137);
  v4->_prefersHiddenAllowedSharingOptionsUI = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v138, v139, v140);
  v4->_acceptServerSignedRecords = objc_msgSend_acceptServerSignedRecords(self, v141, v142, v143);
  objc_msgSend_supportedDeviceCapabilities(self, v144, v145, v146);
  v147 = objc_claimAutoreleasedReturnValue();
  supportedDeviceCapabilities = v4->_supportedDeviceCapabilities;
  v4->_supportedDeviceCapabilities = (NSArray *)v147;

  objc_msgSend_immediateUseDatabaseScopeForTesting(self, v149, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = objc_msgSend_copy(v152, v153, v154, v155);
  immediateUseDatabaseScopeForTesting = v4->_immediateUseDatabaseScopeForTesting;
  v4->_immediateUseDatabaseScopeForTesting = (NSNumber *)v156;

  return v4;
}

- (CKContainerOptions)init
{
  CKContainerOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKContainerOptions;
  result = -[CKContainerOptions init](&v3, sel_init);
  if (result)
  {
    result->_mmcsEncryptionSupport = 1;
    result->_qualityOfService = -1;
  }
  return result;
}

- (void)setIsServiceManatee:(BOOL)a3
{
  self->_isServiceManatee = a3;
}

- (id)sqliteRepresentation
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t isServiceManatee;
  const char *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t OnlyManatee;
  const char *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  const char *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  const char *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  const char *v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  const char *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  const char *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  const char *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  void *v224;
  const char *v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  const char *v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  const char *v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t ChangesForMergeableValues;
  const char *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  const char *v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  const char *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  void *v272;
  void *v273;
  const char *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  void *v279;
  const char *v280;
  const char *v281;
  void *v282;
  id v283;
  NSObject *v284;
  id v285;
  const char *v286;
  void *v287;
  id v289;
  uint8_t buf[4];
  id v291;
  uint64_t v292;

  v292 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_captureResponseHTTPHeaders(self, v5, v6, v7);
  objc_msgSend_numberWithBool_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_captureResponseHTTPHeaders);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v11, (uint64_t)v12);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_useZoneWidePCS(self, v15, v16, v17);
  objc_msgSend_numberWithBool_(v14, v19, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_useZoneWidePCS);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v21, (uint64_t)v22);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_holdAllOperations(self, v25, v26, v27);
  objc_msgSend_numberWithBool_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_holdAllOperations);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v31, (uint64_t)v32);

  objc_msgSend_accountOverrideInfo(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sqliteRepresentation(v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountOverrideInfo);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v43, (uint64_t)v41, (uint64_t)v42);

  v44 = (void *)MEMORY[0x1E0CB37E8];
  v48 = objc_msgSend_qualityOfService(self, v45, v46, v47);
  objc_msgSend_numberWithInteger_(v44, v49, v48, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_qualityOfService);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v53, (uint64_t)v51, (uint64_t)v52);

  v54 = (void *)MEMORY[0x1E0CB37E8];
  v58 = objc_msgSend_returnPCSMetadata(self, v55, v56, v57);
  objc_msgSend_numberWithBool_(v54, v59, v58, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_returnPCSMetadata);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v63, (uint64_t)v61, (uint64_t)v62);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  v68 = objc_msgSend_mmcsEncryptionSupport(self, v65, v66, v67);
  objc_msgSend_numberWithUnsignedInteger_(v64, v69, v68, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mmcsEncryptionSupport);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v73, (uint64_t)v71, (uint64_t)v72);

  objc_msgSend_encryptionServiceName(self, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptionServiceName);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v79, (uint64_t)v77, (uint64_t)v78);

  v80 = (void *)MEMORY[0x1E0CB37E8];
  isServiceManatee = objc_msgSend_isServiceManatee(self, v81, v82, v83);
  objc_msgSend_numberWithBool_(v80, v85, isServiceManatee, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isServiceManatee);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v89, (uint64_t)v87, (uint64_t)v88);

  v90 = (void *)MEMORY[0x1E0CB37E8];
  v94 = objc_msgSend_bypassPCSEncryption(self, v91, v92, v93);
  objc_msgSend_numberWithBool_(v90, v95, v94, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bypassPCSEncryption);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v99, (uint64_t)v97, (uint64_t)v98);

  v100 = (void *)MEMORY[0x1E0CB37E8];
  v104 = objc_msgSend_enforceNamedOperationGroups(self, v101, v102, v103);
  objc_msgSend_numberWithBool_(v100, v105, v104, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_enforceNamedOperationGroups);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v107, (uint64_t)v108);

  v110 = (void *)MEMORY[0x1E0CB37E8];
  OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v111, v112, v113);
  objc_msgSend_numberWithBool_(v110, v115, OnlyManatee, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_forceEnableReadOnlyManatee);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v119, (uint64_t)v117, (uint64_t)v118);

  objc_msgSend_uploadRequestConfiguration(self, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sqliteRepresentation(v123, v124, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uploadRequestConfiguration);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v129, (uint64_t)v127, (uint64_t)v128);

  v130 = (void *)MEMORY[0x1E0CB37E8];
  v134 = objc_msgSend_forceEnableReadOnlyManatee(self, v131, v132, v133);
  objc_msgSend_numberWithBool_(v130, v135, v134, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_forceEnableReadOnlyManatee);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v139, (uint64_t)v137, (uint64_t)v138);

  objc_msgSend_personaIdentifier(self, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_personaIdentifier);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v145, (uint64_t)v143, (uint64_t)v144);

  v146 = (void *)MEMORY[0x1E0CB37E8];
  v150 = objc_msgSend_useClearAssetEncryption(self, v147, v148, v149);
  objc_msgSend_numberWithBool_(v146, v151, v150, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_useClearAssetEncryption);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v155, (uint64_t)v153, (uint64_t)v154);

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v156, v157, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v161, (uint64_t)v159, (uint64_t)v160);

  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v162, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v167, (uint64_t)v165, (uint64_t)v166);

  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v168, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v173, (uint64_t)v171, (uint64_t)v172);

  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v174, v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v179, (uint64_t)v177, (uint64_t)v178);

  objc_msgSend_fakeEntitlements(self, v180, v181, v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fakeEntitlements);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v185, (uint64_t)v183, (uint64_t)v184);

  v186 = (void *)MEMORY[0x1E0CB37E8];
  v190 = objc_msgSend_useAnonymousToServerShareParticipants(self, v187, v188, v189);
  objc_msgSend_numberWithBool_(v186, v191, v190, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v195, (uint64_t)v193, (uint64_t)v194);

  v196 = (void *)MEMORY[0x1E0CB37E8];
  v200 = objc_msgSend_encryptMergeableValueMetadata(self, v197, v198, v199);
  objc_msgSend_numberWithBool_(v196, v201, v200, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptMergeableValueMetadata);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v205, (uint64_t)v203, (uint64_t)v204);

  objc_msgSend_testDeviceReferenceProtocol(self, v206, v207, v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sqliteRepresentation(v209, v210, v211, v212);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_testDeviceReferenceProtocol);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v215, (uint64_t)v213, (uint64_t)v214);

  v216 = (void *)MEMORY[0x1E0CB37E8];
  v220 = objc_msgSend_returnRequestOperationProto(self, v217, v218, v219);
  objc_msgSend_numberWithBool_(v216, v221, v220, v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_returnRequestOperationProto);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v225, (uint64_t)v223, (uint64_t)v224);

  v226 = (void *)MEMORY[0x1E0CB37E8];
  v230 = objc_msgSend_maintainRecordUploadOrder(self, v227, v228, v229);
  objc_msgSend_numberWithBool_(v226, v231, v230, v232);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_maintainRecordUploadOrder);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v235, (uint64_t)v233, (uint64_t)v234);

  v236 = (void *)MEMORY[0x1E0CB37E8];
  v240 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v237, v238, v239);
  objc_msgSend_numberWithBool_(v236, v241, v240, v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v245, (uint64_t)v243, (uint64_t)v244);

  v246 = (void *)MEMORY[0x1E0CB37E8];
  ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v247, v248, v249);
  objc_msgSend_numberWithBool_(v246, v251, ChangesForMergeableValues, v252);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fetchChangesForMergeableValues);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v255, (uint64_t)v253, (uint64_t)v254);

  v256 = (void *)MEMORY[0x1E0CB37E8];
  v260 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v257, v258, v259);
  objc_msgSend_numberWithBool_(v256, v261, v260, v262);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v265, (uint64_t)v263, (uint64_t)v264);

  objc_msgSend_supportedDeviceCapabilities(self, v266, v267, v268);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sqliteRepresentations_(CKDeviceCapability, v270, (uint64_t)v269, v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedDeviceCapabilities);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v274, (uint64_t)v272, (uint64_t)v273);

  objc_msgSend_immediateUseDatabaseScopeForTesting(self, v275, v276, v277);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v280, (uint64_t)v278, (uint64_t)v279);

  v289 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v281, (uint64_t)v3, 0, &v289);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v283 = v289;
  if (v283)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v284 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v291 = v283;
      _os_log_error_impl(&dword_18A5C5000, v284, OS_LOG_TYPE_ERROR, "Error converting CKContainerOptions to JSON: %@", buf, 0xCu);
    }
  }
  v285 = objc_alloc(MEMORY[0x1E0CB3940]);
  v287 = (void *)objc_msgSend_initWithData_encoding_(v285, v286, (uint64_t)v282, 4);

  return v287;
}

- (CKContainerOptions)initWithCoder:(id)a3
{
  id v4;
  CKContainerOptions *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  CKAccountOverrideInfo *accountOverrideInfo;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSString *encryptionServiceName;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  NSString *personaIdentifier;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  NSString *applicationBundleIdentifierOverrideForPushTopicGeneration;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  NSString *applicationBundleIdentifierOverrideForTCC;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  NSDictionary *fakeEntitlements;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  id v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  CKTestDeviceReferenceProtocol *testDeviceReferenceProtocol;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  NSArray *supportedDeviceCapabilities;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  NSNumber *immediateUseDatabaseScopeForTesting;
  objc_super v135;
  _QWORD v136[6];

  v136[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)CKContainerOptions;
  v5 = -[CKContainerOptions init](&v135, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_captureResponseHTTPHeaders);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_captureResponseHTTPHeaders = objc_msgSend_decodeBoolForKey_(v4, v7, (uint64_t)v6, v8);

    NSStringFromSelector(sel_useZoneWidePCS);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useZoneWidePCS = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)v9, v11);

    NSStringFromSelector(sel_holdAllOperations);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_holdAllOperations = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)v12, v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_accountOverrideInfo);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    v18 = objc_claimAutoreleasedReturnValue();
    accountOverrideInfo = v5->_accountOverrideInfo;
    v5->_accountOverrideInfo = (CKAccountOverrideInfo *)v18;

    NSStringFromSelector(sel_qualityOfService);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_qualityOfService = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)v20, v22);

    NSStringFromSelector(sel_returnPCSMetadata);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_returnPCSMetadata = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)v23, v25);

    NSStringFromSelector(sel_mmcsEncryptionSupport);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mmcsEncryptionSupport = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)v26, v28);

    v29 = objc_opt_class();
    NSStringFromSelector(sel_encryptionServiceName);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v29, (uint64_t)v30);
    v32 = objc_claimAutoreleasedReturnValue();
    encryptionServiceName = v5->_encryptionServiceName;
    v5->_encryptionServiceName = (NSString *)v32;

    NSStringFromSelector(sel_isServiceManatee);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isServiceManatee = objc_msgSend_decodeBoolForKey_(v4, v35, (uint64_t)v34, v36);

    NSStringFromSelector(sel_bypassPCSEncryption);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bypassPCSEncryption = objc_msgSend_decodeBoolForKey_(v4, v38, (uint64_t)v37, v39);

    NSStringFromSelector(sel_enforceNamedOperationGroups);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enforceNamedOperationGroups = objc_msgSend_decodeBoolForKey_(v4, v41, (uint64_t)v40, v42);

    NSStringFromSelector(sel_forceEnableReadOnlyManatee);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_forceEnableReadOnlyManatee = objc_msgSend_decodeBoolForKey_(v4, v44, (uint64_t)v43, v45);

    v46 = objc_opt_class();
    NSStringFromSelector(sel_uploadRequestConfiguration);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v46, (uint64_t)v47);
    v49 = objc_claimAutoreleasedReturnValue();
    uploadRequestConfiguration = v5->_uploadRequestConfiguration;
    v5->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v49;

    v51 = objc_opt_class();
    NSStringFromSelector(sel_personaIdentifier);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v51, (uint64_t)v52);
    v54 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v54;

    NSStringFromSelector(sel_useClearAssetEncryption);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useClearAssetEncryption = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)v56, v58);

    v59 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v59, (uint64_t)v60);
    v62 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v62;

    v64 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v64, (uint64_t)v65);
    v67 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v67;

    v69 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v71, v69, (uint64_t)v70);
    v72 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForPushTopicGeneration = v5->_applicationBundleIdentifierOverrideForPushTopicGeneration;
    v5->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v72;

    v74 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v74, (uint64_t)v75);
    v77 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForTCC = v5->_applicationBundleIdentifierOverrideForTCC;
    v5->_applicationBundleIdentifierOverrideForTCC = (NSString *)v77;

    v79 = (void *)MEMORY[0x1E0C99E60];
    v136[0] = objc_opt_class();
    v136[1] = objc_opt_class();
    v136[2] = objc_opt_class();
    v136[3] = objc_opt_class();
    v136[4] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v80, (uint64_t)v136, 5);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v79, v82, (uint64_t)v81, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fakeEntitlements);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v84, (uint64_t)v85);
    v87 = objc_claimAutoreleasedReturnValue();
    fakeEntitlements = v5->_fakeEntitlements;
    v5->_fakeEntitlements = (NSDictionary *)v87;

    NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useAnonymousToServerShareParticipants = objc_msgSend_decodeBoolForKey_(v4, v90, (uint64_t)v89, v91);

    NSStringFromSelector(sel_encryptMergeableValueMetadata);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_encryptMergeableValueMetadata = objc_msgSend_decodeBoolForKey_(v4, v93, (uint64_t)v92, v94);

    if (__sTestOverridesAvailable)
    {
      v95 = sub_18A70E2C0();
      NSStringFromSelector(sel_testDeviceReferenceProtocol);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, (uint64_t)v95, (uint64_t)v96);
      v98 = objc_claimAutoreleasedReturnValue();
      testDeviceReferenceProtocol = v5->_testDeviceReferenceProtocol;
      v5->_testDeviceReferenceProtocol = (CKTestDeviceReferenceProtocol *)v98;

    }
    NSStringFromSelector(sel_returnRequestOperationProto);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_returnRequestOperationProto = objc_msgSend_decodeBoolForKey_(v4, v101, (uint64_t)v100, v102);

    NSStringFromSelector(sel_maintainRecordUploadOrder);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maintainRecordUploadOrder = objc_msgSend_decodeBoolForKey_(v4, v104, (uint64_t)v103, v105);

    NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_addDatabaseScopeToZoneIDs = objc_msgSend_decodeBoolForKey_(v4, v107, (uint64_t)v106, v108);

    NSStringFromSelector(sel_fetchChangesForMergeableValues);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fetchChangesForMergeableValues = objc_msgSend_decodeBoolForKey_(v4, v110, (uint64_t)v109, v111);

    NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prefersHiddenAllowedSharingOptionsUI = objc_msgSend_decodeBoolForKey_(v4, v113, (uint64_t)v112, v114);

    NSStringFromSelector(sel_acceptServerSignedRecords);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_acceptServerSignedRecords = objc_msgSend_decodeBoolForKey_(v4, v116, (uint64_t)v115, v117);

    v118 = (void *)MEMORY[0x1E0C99E60];
    v119 = objc_opt_class();
    v120 = objc_opt_class();
    v121 = objc_opt_class();
    objc_msgSend_setWithObjects_(v118, v122, v119, v123, v120, v121, 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_supportedDeviceCapabilities);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v126, (uint64_t)v124, (uint64_t)v125);
    v127 = objc_claimAutoreleasedReturnValue();
    supportedDeviceCapabilities = v5->_supportedDeviceCapabilities;
    v5->_supportedDeviceCapabilities = (NSArray *)v127;

    v129 = objc_opt_class();
    NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v131, v129, (uint64_t)v130);
    v132 = objc_claimAutoreleasedReturnValue();
    immediateUseDatabaseScopeForTesting = v5->_immediateUseDatabaseScopeForTesting;
    v5->_immediateUseDatabaseScopeForTesting = (NSNumber *)v132;

  }
  return v5;
}

- (BOOL)accountInfoCacheIsDisabled
{
  return self->_accountInfoCacheIsDisabled;
}

- (CKTestDeviceReferenceProtocol)testDeviceReferenceProtocol
{
  return (CKTestDeviceReferenceProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUseZoneWidePCS:(BOOL)a3
{
  self->_useZoneWidePCS = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t isServiceManatee;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t OnlyManatee;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t ChangesForMergeableValues;
  void *v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  const char *v187;
  id v188;

  v188 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v8 = objc_msgSend_captureResponseHTTPHeaders(self, v5, v6, v7);
  NSStringFromSelector(sel_captureResponseHTTPHeaders);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v10, v8, (uint64_t)v9);

  v14 = objc_msgSend_useZoneWidePCS(self, v11, v12, v13);
  NSStringFromSelector(sel_useZoneWidePCS);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v16, v14, (uint64_t)v15);

  v20 = objc_msgSend_holdAllOperations(self, v17, v18, v19);
  NSStringFromSelector(sel_holdAllOperations);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v22, v20, (uint64_t)v21);

  objc_msgSend_accountOverrideInfo(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountOverrideInfo);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v28, (uint64_t)v26, (uint64_t)v27);

  v32 = objc_msgSend_qualityOfService(self, v29, v30, v31);
  NSStringFromSelector(sel_qualityOfService);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v188, v34, v32, (uint64_t)v33);

  v38 = objc_msgSend_returnPCSMetadata(self, v35, v36, v37);
  NSStringFromSelector(sel_returnPCSMetadata);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v40, v38, (uint64_t)v39);

  v44 = objc_msgSend_mmcsEncryptionSupport(self, v41, v42, v43);
  NSStringFromSelector(sel_mmcsEncryptionSupport);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v188, v46, v44, (uint64_t)v45);

  objc_msgSend_encryptionServiceName(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptionServiceName);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v52, (uint64_t)v50, (uint64_t)v51);

  isServiceManatee = objc_msgSend_isServiceManatee(self, v53, v54, v55);
  NSStringFromSelector(sel_isServiceManatee);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v58, isServiceManatee, (uint64_t)v57);

  v62 = objc_msgSend_bypassPCSEncryption(self, v59, v60, v61);
  NSStringFromSelector(sel_bypassPCSEncryption);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v64, v62, (uint64_t)v63);

  v68 = objc_msgSend_enforceNamedOperationGroups(self, v65, v66, v67);
  NSStringFromSelector(sel_enforceNamedOperationGroups);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v70, v68, (uint64_t)v69);

  OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v71, v72, v73);
  NSStringFromSelector(sel_forceEnableReadOnlyManatee);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v76, OnlyManatee, (uint64_t)v75);

  objc_msgSend_uploadRequestConfiguration(self, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uploadRequestConfiguration);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v82, (uint64_t)v80, (uint64_t)v81);

  objc_msgSend_personaIdentifier(self, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_personaIdentifier);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v88, (uint64_t)v86, (uint64_t)v87);

  v92 = objc_msgSend_useClearAssetEncryption(self, v89, v90, v91);
  NSStringFromSelector(sel_useClearAssetEncryption);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v94, v92, (uint64_t)v93);

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v100, (uint64_t)v98, (uint64_t)v99);

  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v106, (uint64_t)v104, (uint64_t)v105);

  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v112, (uint64_t)v110, (uint64_t)v111);

  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v113, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v118, (uint64_t)v116, (uint64_t)v117);

  objc_msgSend_fakeEntitlements(self, v119, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fakeEntitlements);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v124, (uint64_t)v122, (uint64_t)v123);

  v128 = objc_msgSend_useAnonymousToServerShareParticipants(self, v125, v126, v127);
  NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v130, v128, (uint64_t)v129);

  v134 = objc_msgSend_encryptMergeableValueMetadata(self, v131, v132, v133);
  NSStringFromSelector(sel_encryptMergeableValueMetadata);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v136, v134, (uint64_t)v135);

  if (__sTestOverridesAvailable)
  {
    objc_msgSend_testDeviceReferenceProtocol(self, v137, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_testDeviceReferenceProtocol);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v188, v142, (uint64_t)v140, (uint64_t)v141);

  }
  v143 = objc_msgSend_returnRequestOperationProto(self, v137, v138, v139);
  NSStringFromSelector(sel_returnRequestOperationProto);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v145, v143, (uint64_t)v144);

  v149 = objc_msgSend_maintainRecordUploadOrder(self, v146, v147, v148);
  NSStringFromSelector(sel_maintainRecordUploadOrder);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v151, v149, (uint64_t)v150);

  v155 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v152, v153, v154);
  NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v157, v155, (uint64_t)v156);

  ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v158, v159, v160);
  NSStringFromSelector(sel_fetchChangesForMergeableValues);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v163, ChangesForMergeableValues, (uint64_t)v162);

  v167 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v164, v165, v166);
  NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v169, v167, (uint64_t)v168);

  v173 = objc_msgSend_acceptServerSignedRecords(self, v170, v171, v172);
  NSStringFromSelector(sel_acceptServerSignedRecords);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v188, v175, v173, (uint64_t)v174);

  objc_msgSend_supportedDeviceCapabilities(self, v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedDeviceCapabilities);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v181, (uint64_t)v179, (uint64_t)v180);

  objc_msgSend_immediateUseDatabaseScopeForTesting(self, v182, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v188, v187, (uint64_t)v185, (uint64_t)v186);

  objc_autoreleasePoolPop(v4);
}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  return (CKAccountOverrideInfo *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)applicationBundleIdentifierOverrideForTCC
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)applicationBundleIdentifierOverrideForPushTopicGeneration
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)forceEnableReadOnlyManatee
{
  return self->_forceEnableReadOnlyManatee;
}

- (BOOL)holdAllOperations
{
  return self->_holdAllOperations;
}

- (BOOL)bypassPCSEncryption
{
  return self->_bypassPCSEncryption;
}

- (BOOL)useAnonymousToServerShareParticipants
{
  return self->_useAnonymousToServerShareParticipants;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSDictionary)fakeEntitlements
{
  CKContainerOptions *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fakeEntitlements;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)addDatabaseScopeToZoneIDs
{
  return self->_addDatabaseScopeToZoneIDs;
}

- (BOOL)useZoneWidePCS
{
  return self->_useZoneWidePCS;
}

- (BOOL)useClearAssetEncryption
{
  return self->_useClearAssetEncryption;
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return (CKUploadRequestConfiguration *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)returnRequestOperationProto
{
  return self->_returnRequestOperationProto;
}

- (BOOL)returnPCSMetadata
{
  return self->_returnPCSMetadata;
}

- (BOOL)prefersHiddenAllowedSharingOptionsUI
{
  return self->_prefersHiddenAllowedSharingOptionsUI;
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)mmcsEncryptionSupport
{
  return self->_mmcsEncryptionSupport;
}

- (BOOL)maintainRecordUploadOrder
{
  return self->_maintainRecordUploadOrder;
}

- (BOOL)isServiceManatee
{
  return self->_isServiceManatee;
}

- (BOOL)fetchChangesForMergeableValues
{
  return self->_fetchChangesForMergeableValues;
}

- (BOOL)enforceNamedOperationGroups
{
  return self->_enforceNamedOperationGroups;
}

- (NSString)encryptionServiceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)encryptMergeableValueMetadata
{
  return self->_encryptMergeableValueMetadata;
}

- (BOOL)captureResponseHTTPHeaders
{
  return self->_captureResponseHTTPHeaders;
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

- (void)setPersonaIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)setCaptureResponseHTTPHeaders:(BOOL)a3
{
  self->_captureResponseHTTPHeaders = a3;
}

- (CKContainerOptions)initWithSqliteRepresentation:(id)a3
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
  id v13;
  CKContainerOptions *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  CKAccountOverrideInfo *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  CKAccountOverrideInfo *accountOverrideInfo;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSString *encryptionServiceName;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  CKUploadRequestConfiguration *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  NSString *personaIdentifier;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  NSString *applicationBundleIdentifierOverrideForPushTopicGeneration;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSString *applicationBundleIdentifierOverrideForTCC;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  NSDictionary *fakeEntitlements;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  id v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  CKTestDeviceReferenceProtocol *testDeviceReferenceProtocol;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  NSArray *supportedDeviceCapabilities;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  NSNumber *immediateUseDatabaseScopeForTesting;
  CKContainerOptions *v223;
  NSObject *v224;
  objc_super v226;
  id v227;
  uint8_t buf[4];
  id v229;
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v227 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v11, (uint64_t)v10, 0, &v227);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v227;
    if (v13 || !v12)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v224 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v229 = v13;
        _os_log_error_impl(&dword_18A5C5000, v224, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKContainerOptions: %@", buf, 0xCu);
      }
      v223 = 0;
    }
    else
    {
      v226.receiver = self;
      v226.super_class = (Class)CKContainerOptions;
      v14 = -[CKContainerOptions init](&v226, sel_init);
      if (v14)
      {
        NSStringFromSelector(sel_captureResponseHTTPHeaders);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_captureResponseHTTPHeaders = objc_msgSend_BOOLValue(v18, v19, v20, v21);

        NSStringFromSelector(sel_useZoneWidePCS);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v23, (uint64_t)v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_useZoneWidePCS = objc_msgSend_BOOLValue(v25, v26, v27, v28);

        NSStringFromSelector(sel_holdAllOperations);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v30, (uint64_t)v29, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_holdAllOperations = objc_msgSend_BOOLValue(v32, v33, v34, v35);

        v36 = [CKAccountOverrideInfo alloc];
        NSStringFromSelector(sel_accountOverrideInfo);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v38, (uint64_t)v37, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend_initWithSqliteRepresentation_(v36, v41, (uint64_t)v40, v42);
        accountOverrideInfo = v14->_accountOverrideInfo;
        v14->_accountOverrideInfo = (CKAccountOverrideInfo *)v43;

        NSStringFromSelector(sel_qualityOfService);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v46, (uint64_t)v45, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_qualityOfService = objc_msgSend_integerValue(v48, v49, v50, v51);

        NSStringFromSelector(sel_returnPCSMetadata);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v53, (uint64_t)v52, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_returnPCSMetadata = objc_msgSend_BOOLValue(v55, v56, v57, v58);

        NSStringFromSelector(sel_mmcsEncryptionSupport);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v60, (uint64_t)v59, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_mmcsEncryptionSupport = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65);

        NSStringFromSelector(sel_encryptionServiceName);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v67, (uint64_t)v66, v68);
        v69 = objc_claimAutoreleasedReturnValue();
        encryptionServiceName = v14->_encryptionServiceName;
        v14->_encryptionServiceName = (NSString *)v69;

        NSStringFromSelector(sel_isServiceManatee);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v72, (uint64_t)v71, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_isServiceManatee = objc_msgSend_BOOLValue(v74, v75, v76, v77);

        NSStringFromSelector(sel_bypassPCSEncryption);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v79, (uint64_t)v78, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_bypassPCSEncryption = objc_msgSend_BOOLValue(v81, v82, v83, v84);

        NSStringFromSelector(sel_enforceNamedOperationGroups);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v86, (uint64_t)v85, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_enforceNamedOperationGroups = objc_msgSend_BOOLValue(v88, v89, v90, v91);

        NSStringFromSelector(sel_forceEnableReadOnlyManatee);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v93, (uint64_t)v92, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_forceEnableReadOnlyManatee = objc_msgSend_BOOLValue(v95, v96, v97, v98);

        v99 = [CKUploadRequestConfiguration alloc];
        NSStringFromSelector(sel_uploadRequestConfiguration);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v101, (uint64_t)v100, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_initWithSqliteRepresentation_(v99, v104, (uint64_t)v103, v105);
        uploadRequestConfiguration = v14->_uploadRequestConfiguration;
        v14->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v106;

        NSStringFromSelector(sel_forceEnableReadOnlyManatee);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v109, (uint64_t)v108, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_forceEnableReadOnlyManatee = objc_msgSend_BOOLValue(v111, v112, v113, v114);

        NSStringFromSelector(sel_personaIdentifier);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v116, (uint64_t)v115, v117);
        v118 = objc_claimAutoreleasedReturnValue();
        personaIdentifier = v14->_personaIdentifier;
        v14->_personaIdentifier = (NSString *)v118;

        NSStringFromSelector(sel_useClearAssetEncryption);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v121, (uint64_t)v120, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_useClearAssetEncryption = objc_msgSend_BOOLValue(v123, v124, v125, v126);

        NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v128, (uint64_t)v127, v129);
        v130 = objc_claimAutoreleasedReturnValue();
        applicationBundleIdentifierOverrideForContainerAccess = v14->_applicationBundleIdentifierOverrideForContainerAccess;
        v14->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v130;

        NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v133, (uint64_t)v132, v134);
        v135 = objc_claimAutoreleasedReturnValue();
        applicationBundleIdentifierOverrideForNetworkAttribution = v14->_applicationBundleIdentifierOverrideForNetworkAttribution;
        v14->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v135;

        NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v138, (uint64_t)v137, v139);
        v140 = objc_claimAutoreleasedReturnValue();
        applicationBundleIdentifierOverrideForPushTopicGeneration = v14->_applicationBundleIdentifierOverrideForPushTopicGeneration;
        v14->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v140;

        NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v143, (uint64_t)v142, v144);
        v145 = objc_claimAutoreleasedReturnValue();
        applicationBundleIdentifierOverrideForTCC = v14->_applicationBundleIdentifierOverrideForTCC;
        v14->_applicationBundleIdentifierOverrideForTCC = (NSString *)v145;

        NSStringFromSelector(sel_fakeEntitlements);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v148, (uint64_t)v147, v149);
        v150 = objc_claimAutoreleasedReturnValue();
        fakeEntitlements = v14->_fakeEntitlements;
        v14->_fakeEntitlements = (NSDictionary *)v150;

        NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v153, (uint64_t)v152, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_useAnonymousToServerShareParticipants = objc_msgSend_BOOLValue(v155, v156, v157, v158);

        NSStringFromSelector(sel_encryptMergeableValueMetadata);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v160, (uint64_t)v159, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_encryptMergeableValueMetadata = objc_msgSend_BOOLValue(v162, v163, v164, v165);

        if (__sTestOverridesAvailable)
        {
          v166 = objc_alloc((Class)sub_18A70E2C0());
          NSStringFromSelector(sel_testDeviceReferenceProtocol);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v12, v168, (uint64_t)v167, v169);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend_initWithSqliteRepresentation_(v166, v171, (uint64_t)v170, v172);
          testDeviceReferenceProtocol = v14->_testDeviceReferenceProtocol;
          v14->_testDeviceReferenceProtocol = (CKTestDeviceReferenceProtocol *)v173;

        }
        NSStringFromSelector(sel_returnRequestOperationProto);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v176, (uint64_t)v175, v177);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_returnRequestOperationProto = objc_msgSend_BOOLValue(v178, v179, v180, v181);

        NSStringFromSelector(sel_maintainRecordUploadOrder);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v183, (uint64_t)v182, v184);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_maintainRecordUploadOrder = objc_msgSend_BOOLValue(v185, v186, v187, v188);

        NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v190, (uint64_t)v189, v191);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_addDatabaseScopeToZoneIDs = objc_msgSend_BOOLValue(v192, v193, v194, v195);

        NSStringFromSelector(sel_fetchChangesForMergeableValues);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v197, (uint64_t)v196, v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_fetchChangesForMergeableValues = objc_msgSend_BOOLValue(v199, v200, v201, v202);

        NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v204, (uint64_t)v203, v205);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_prefersHiddenAllowedSharingOptionsUI = objc_msgSend_BOOLValue(v206, v207, v208, v209);

        NSStringFromSelector(sel_supportedDeviceCapabilities);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v211, (uint64_t)v210, v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_fromSqliteRepresentations_(CKDeviceCapability, v214, (uint64_t)v213, v215);
        v216 = objc_claimAutoreleasedReturnValue();
        supportedDeviceCapabilities = v14->_supportedDeviceCapabilities;
        v14->_supportedDeviceCapabilities = (NSArray *)v216;

        NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v219, (uint64_t)v218, v220);
        v221 = objc_claimAutoreleasedReturnValue();
        immediateUseDatabaseScopeForTesting = v14->_immediateUseDatabaseScopeForTesting;
        v14->_immediateUseDatabaseScopeForTesting = (NSNumber *)v221;

      }
      self = v14;
      v223 = self;
    }

  }
  else
  {
    v223 = 0;
  }

  return v223;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUseMMCSEncryptionV2:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  ((void (*)(CKContainerOptions *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_setMmcsEncryptionSupport_, v3);
}

- (void)setFakeEntitlements:(id)a3
{
  CKContainerOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *fakeEntitlements;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  fakeEntitlements = v4->_fakeEntitlements;
  v4->_fakeEntitlements = (NSDictionary *)v8;

  objc_sync_exit(v4);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_CKDescriptionClassName(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(self, v7, v8, v9);
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("%@:(%tu)"), v12, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t isServiceManatee;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t OnlyManatee;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t ChangesForMergeableValues;
  const char *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  id v174;

  v174 = a3;
  v7 = objc_msgSend_captureResponseHTTPHeaders(self, v4, v5, v6);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v8, (uint64_t)CFSTR("captureResponseHTTPHeaders"), v7, 0);
  v12 = objc_msgSend_useZoneWidePCS(self, v9, v10, v11);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v13, (uint64_t)CFSTR("useZoneWidePCS"), v12, 0);
  v17 = objc_msgSend_holdAllOperations(self, v14, v15, v16);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v18, (uint64_t)CFSTR("holdAllOperations"), v17, 0);
  objc_msgSend_accountOverrideInfo(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v23, (uint64_t)CFSTR("accountOverrideInfo"), (uint64_t)v22, 1);

  if (objc_msgSend_qualityOfService(self, v24, v25, v26) != -1)
  {
    v30 = objc_msgSend_qualityOfService(self, v27, v28, v29);
    CKStringForQOS(v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v174, v35, (uint64_t)CFSTR("qualityOfService"), (uint64_t)v34, 0);

  }
  v36 = objc_msgSend_returnPCSMetadata(self, v27, v28, v29);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v37, (uint64_t)CFSTR("returnPCSMetadata"), v36, 0);
  if (objc_msgSend_mmcsEncryptionSupport(self, v38, v39, v40) != 1)
  {
    v44 = objc_msgSend_mmcsEncryptionSupport(self, v41, v42, v43);
    CKStringFromCKMMCSEncryptionSupport(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v174, v46, (uint64_t)CFSTR("mmcsEncryptionSupport"), (uint64_t)v45, 0);

  }
  objc_msgSend_encryptionServiceName(self, v41, v42, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v48, (uint64_t)CFSTR("encryptionServiceName"), (uint64_t)v47, 0);

  isServiceManatee = objc_msgSend_isServiceManatee(self, v49, v50, v51);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v53, (uint64_t)CFSTR("isServiceManatee"), isServiceManatee, 0);
  v57 = objc_msgSend_bypassPCSEncryption(self, v54, v55, v56);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v58, (uint64_t)CFSTR("bypassPCSEncryption"), v57, 0);
  v62 = objc_msgSend_enforceNamedOperationGroups(self, v59, v60, v61);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v63, (uint64_t)CFSTR("enforceNamedOperationGroups"), v62, 0);
  OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v64, v65, v66);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v68, (uint64_t)CFSTR("forceEnableReadOnlyManatee"), OnlyManatee, 0);
  objc_msgSend_uploadRequestConfiguration(self, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v73, (uint64_t)CFSTR("uploadRequestConfiguration"), (uint64_t)v72, 1);

  v77 = objc_msgSend_forceEnableReadOnlyManatee(self, v74, v75, v76);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v78, (uint64_t)CFSTR("forceEnableReadOnlyManatee"), v77, 0);
  objc_msgSend_personaIdentifier(self, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v83, (uint64_t)CFSTR("personaIdentifier"), (uint64_t)v82, 0);

  v87 = objc_msgSend_useClearAssetEncryption(self, v84, v85, v86);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v88, (uint64_t)CFSTR("useClearAssetEncryption"), v87, 0);
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v93, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess"), (uint64_t)v92, 0);

  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v98, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"), (uint64_t)v97, 0);

  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v103, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForPushTopicGeneration"), (uint64_t)v102, 0);

  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v108, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForTCC"), (uint64_t)v107, 0);

  objc_msgSend_fakeEntitlements(self, v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v113, (uint64_t)CFSTR("fakeEntitlements"), (uint64_t)v112, 0);

  v117 = objc_msgSend_useAnonymousToServerShareParticipants(self, v114, v115, v116);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v118, (uint64_t)CFSTR("useAnonymousToServerShareParticipants"), v117, 0);
  v122 = objc_msgSend_encryptMergeableValueMetadata(self, v119, v120, v121);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v123, (uint64_t)CFSTR("encryptMergeableValueMetadata"), v122, 0);
  objc_msgSend_testDeviceReferenceProtocol(self, v124, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v128, (uint64_t)CFSTR("testDeviceReferenceProtocol"), (uint64_t)v127, 0);

  v132 = objc_msgSend_returnRequestOperationProto(self, v129, v130, v131);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v133, (uint64_t)CFSTR("returnRequestOperationProto"), v132, 0);
  v137 = objc_msgSend_maintainRecordUploadOrder(self, v134, v135, v136);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v138, (uint64_t)CFSTR("maintainRecordUploadOrder"), v137, 0);
  v142 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v139, v140, v141);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v143, (uint64_t)CFSTR("addDatabaseScopeToZoneIDs"), v142, 0);
  ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v144, v145, v146);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v148, (uint64_t)CFSTR("fetchChangesForMergeableValues"), ChangesForMergeableValues, 0);
  v152 = objc_msgSend_fetchChangesForMergeableValues(self, v149, v150, v151);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v153, (uint64_t)CFSTR("fetchChangesForMergeableValues"), v152, 0);
  v157 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v154, v155, v156);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v158, (uint64_t)CFSTR("prefersHiddenAllowedSharingOptionsUI"), v157, 0);
  v162 = objc_msgSend_acceptServerSignedRecords(self, v159, v160, v161);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v163, (uint64_t)CFSTR("acceptServerSignedRecords"), v162, 0);
  objc_msgSend_supportedDeviceCapabilities(self, v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v168, (uint64_t)CFSTR("supportedDeviceCapabilities"), (uint64_t)v167, 0);

  objc_msgSend_immediateUseDatabaseScopeForTesting(self, v169, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v173, (uint64_t)CFSTR("immediateUseDatabaseScopeForTesting"), (uint64_t)v172, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKContainerOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKContainerOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

  objc_msgSend_accountOverrideInfo(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);

  objc_msgSend_personaIdentifier(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);

  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  objc_msgSend_fakeEntitlements(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (NSArray)supportedDeviceCapabilities
{
  return self->_supportedDeviceCapabilities;
}

- (void)setSupportedDeviceCapabilities:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  const char *v30;
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
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  NSArray *supportedDeviceCapabilities;
  NSArray *v50;
  CKContainerOptions *v51;
  id v52;
  id obj;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v51 = self;
    v5 = (void *)objc_opt_new();
    v54 = (NSArray *)objc_opt_new();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v52 = v4;
    obj = v4;
    v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v61, (uint64_t)v66, 16);
    if (v56)
    {
      v55 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v62 != v55)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend_name(v11, v7, v8, v9, v51);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v5, v13, (uint64_t)v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v19 = v15;
            v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v57, (uint64_t)v65, 16);
            if (v21)
            {
              v25 = v21;
              v26 = *(_QWORD *)v58;
              while (2)
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v58 != v26)
                    objc_enumerationMutation(v19);
                  v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
                  objc_msgSend_value(v11, v22, v23, v24);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v28) = objc_msgSend_isEqualToString_(v28, v30, (uint64_t)v29, v31);

                  if ((v28 & 1) != 0)
                  {

                    goto LABEL_20;
                  }
                }
                v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v57, (uint64_t)v65, 16);
                if (v25)
                  continue;
                break;
              }
            }

            objc_msgSend_value(v11, v32, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v19, v36, (uint64_t)v35, v37);
          }
          else
          {
            v38 = (void *)MEMORY[0x1E0C99DE8];
            objc_msgSend_value(v11, v16, v17, v18);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_arrayWithObject_(v38, v39, (uint64_t)v35, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v11, v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v5, v46, (uint64_t)v41, (uint64_t)v45);

          }
          objc_msgSend_addObject_(v54, v47, (uint64_t)v11, v48);
LABEL_20:

        }
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v61, (uint64_t)v66, 16);
      }
      while (v56);
    }

    supportedDeviceCapabilities = v51->_supportedDeviceCapabilities;
    v51->_supportedDeviceCapabilities = v54;

    v4 = v52;
  }
  else
  {
    v50 = self->_supportedDeviceCapabilities;
    self->_supportedDeviceCapabilities = 0;

  }
}

- (void)setAccountOverrideInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setMmcsEncryptionSupport:(unint64_t)a3
{
  self->_mmcsEncryptionSupport = a3;
}

- (void)setEncryptionServiceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setBypassPCSEncryption:(BOOL)a3
{
  self->_bypassPCSEncryption = a3;
}

- (void)setEnforceNamedOperationGroups:(BOOL)a3
{
  self->_enforceNamedOperationGroups = a3;
}

- (void)setForceEnableReadOnlyManatee:(BOOL)a3
{
  self->_forceEnableReadOnlyManatee = a3;
}

- (void)setUseClearAssetEncryption:(BOOL)a3
{
  self->_useClearAssetEncryption = a3;
}

- (void)setAccountInfoCacheIsDisabled:(BOOL)a3
{
  self->_accountInfoCacheIsDisabled = a3;
}

- (void)setUseAnonymousToServerShareParticipants:(BOOL)a3
{
  self->_useAnonymousToServerShareParticipants = a3;
}

- (void)setEncryptMergeableValueMetadata:(BOOL)a3
{
  self->_encryptMergeableValueMetadata = a3;
}

- (void)setMaintainRecordUploadOrder:(BOOL)a3
{
  self->_maintainRecordUploadOrder = a3;
}

- (void)setAddDatabaseScopeToZoneIDs:(BOOL)a3
{
  self->_addDatabaseScopeToZoneIDs = a3;
}

- (void)setFetchChangesForMergeableValues:(BOOL)a3
{
  self->_fetchChangesForMergeableValues = a3;
}

- (void)setPrefersHiddenAllowedSharingOptionsUI:(BOOL)a3
{
  self->_prefersHiddenAllowedSharingOptionsUI = a3;
}

- (BOOL)acceptServerSignedRecords
{
  return self->_acceptServerSignedRecords;
}

- (void)setAcceptServerSignedRecords:(BOOL)a3
{
  self->_acceptServerSignedRecords = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setReturnPCSMetadata:(BOOL)a3
{
  self->_returnPCSMetadata = a3;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setReturnRequestOperationProto:(BOOL)a3
{
  self->_returnRequestOperationProto = a3;
}

- (void)setHoldAllOperations:(BOOL)a3
{
  self->_holdAllOperations = a3;
}

- (NSNumber)immediateUseDatabaseScopeForTesting
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setImmediateUseDatabaseScopeForTesting:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void)setTestDeviceReferenceProtocol:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

@end
