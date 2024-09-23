@implementation CKDDirectoryContext

- (CKDDirectoryContext)initWithContainer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  int isInstalled;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  void *v101;
  int v102;
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
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  void *v137;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  void *v185;
  const char *v186;
  void *v187;
  void *v188;
  const char *v189;
  void *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  void *v201;
  void *v202;
  void *v203;
  id v204;
  void *v205;
  void *v206;
  void *v207;
  id obj;
  id v209;
  id v210;
  objc_super v211;
  uint8_t buf[4];
  void *v213;
  __int16 v214;
  id v215;
  uint64_t v216;

  v216 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v211.receiver = self;
  v211.super_class = (Class)CKDDirectoryContext;
  v7 = -[CKDDirectoryContext init](&v211, sel_init);
  if (!v7)
    goto LABEL_43;
  objc_msgSend_containerID(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v8;

  objc_msgSend_containerIdentifier(*((void **)v7 + 1), v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v7 + 3);
  *((_QWORD *)v7 + 3) = v12;

  objc_msgSend_applicationBundleID(v4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CA5848]);
  v210 = 0;
  v19 = (void *)objc_msgSend_initWithBundleIdentifier_error_(v17, v18, (uint64_t)v16, &v210);
  v22 = v210;
  if (v22)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v213 = v16;
      v214 = 2112;
      v215 = v22;
      _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an extension: %@", buf, 0x16u);
    }
  }
  else if (v19)
  {
    objc_msgSend_containingBundleRecord(v19, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v27;
  }
  v28 = objc_alloc(MEMORY[0x1E0CA5870]);
  v209 = v22;
  v30 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v28, v29, (uint64_t)v16, 0, &v209);
  v31 = v209;

  if (v19)
    v32 = v19;
  else
    v32 = v30;
  v33 = v32;
  v203 = v30;
  objc_msgSend_applicationState(v30, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  isInstalled = objc_msgSend_isInstalled(v36, v37, v38);

  if (isInstalled)
  {
    objc_msgSend_dataContainerURL(v33, v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  v202 = v33;
  obj = (id)v42;
  objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v40, v42, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleID(v4, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(v4, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend_personaID(v4, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v46, v53, (uint64_t)v52);
    v54 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v54;
  }
  objc_msgSend_stringByAppendingString_(v46, v50, *((_QWORD *)v7 + 3));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_environment(*((void **)v7 + 1), v56, v57);
  CKContainerEnvironmentString();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v55, v59, (uint64_t)v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_accountOverrideInfo(v4, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_accountOverrideInfo(v4, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v69;
  if (v66)
  {
    objc_msgSend_accountID(v69, v70, v71);
    v73 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_altDSID(v69, v70, v71);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v75)
      goto LABEL_22;
    objc_msgSend_accountOverrideInfo(v4, v76, v77);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_altDSID(v72, v78, v79);
    v73 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v73;
  objc_msgSend_stringByAppendingString_(v60, v74, v73);
  v81 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v81;
LABEL_22:
  v204 = v31;
  v207 = v43;
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_options(v4, v76, v77);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fakeEntitlements(v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_count(v85, v86, v87);

    if (v88)
    {
      v89 = v60;
      v90 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend_options(v4, v76, v77);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fakeEntitlements(v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithJSONObject_options_error_(v90, v95, (uint64_t)v94, 0, 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (v96
        && (v97 = objc_alloc(MEMORY[0x1E0CB3940]),
            (v99 = objc_msgSend_initWithData_encoding_(v97, v98, (uint64_t)v96, 4)) != 0))
      {
        v101 = (void *)v99;
        v102 = 0;
        v103 = (void *)v99;
        objc_msgSend_stringByAppendingString_(v89, v100, v99);
      }
      else
      {
        v102 = 1;
        CKShortRandomID();
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0;
        objc_msgSend_stringByAppendingString_(v89, v104, (uint64_t)v103);
      }
      v105 = objc_claimAutoreleasedReturnValue();

      if (v102)
      v60 = (void *)v105;
      v43 = v207;
    }
  }
  objc_msgSend_CKSafeHashStringForPathComponent(v60, v76, v77);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)v7 + 2, v106);
  objc_msgSend_deviceContext(v4, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDevice(v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v205 = v19;
  v206 = v16;
  v201 = v60;
  if (v112)
  {
    objc_msgSend_deviceContext(v4, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDevice(v115, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_daemonServer(v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataDirectory(v121, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_deviceContext(v4, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDevice(v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceID(v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v124, v134, (uint64_t)v133, 1);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    CKCurrentPersonaID();
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v137)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v136, (uint64_t)CFSTR("ClientData-%@"), v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v135, v139, (uint64_t)v138, 1);
      v140 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v135, v136, (uint64_t)CFSTR("ClientData"), 1);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v140, v141, (uint64_t)CFSTR("cloudd_db"), 1);
    v155 = objc_claimAutoreleasedReturnValue();
    v156 = (void *)*((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = v155;

    objc_msgSend_applicationBundleID(v4, v157, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSafeStringForPathComponent(v159, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v140, v163, (uint64_t)v162, 1);
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    if (obj)
      objc_storeStrong((id *)v7 + 4, v164);
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v164, v165, (uint64_t)v106, 1);
    v166 = objc_claimAutoreleasedReturnValue();
    v167 = (void *)*((_QWORD *)v7 + 5);
    *((_QWORD *)v7 + 5) = v166;

    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v164, v168, (uint64_t)CFSTR("Caches"), 1);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v169, v170, (uint64_t)v106, 1);
    v171 = objc_claimAutoreleasedReturnValue();
    v172 = (void *)*((_QWORD *)v7 + 6);
    *((_QWORD *)v7 + 6) = v171;

    v174 = v205;
    v173 = v206;
    v175 = v204;
  }
  else
  {
    if (obj)
    {
      objc_storeStrong((id *)v7 + 4, obj);
      objc_msgSend_containerDirectory(v7, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v144, v145, (uint64_t)CFSTR("CloudKit"), 1);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v124, v146, (uint64_t)CFSTR("cloudd_db"), 1);
      v147 = objc_claimAutoreleasedReturnValue();
      v148 = (void *)*((_QWORD *)v7 + 7);
      *((_QWORD *)v7 + 7) = v147;

      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v124, v149, (uint64_t)v106, 1);
      v150 = objc_claimAutoreleasedReturnValue();
      v151 = (void *)*((_QWORD *)v7 + 5);
      *((_QWORD *)v7 + 5) = v150;

      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v43, v152, (uint64_t)v106, 1);
      v153 = objc_claimAutoreleasedReturnValue();
      v154 = (void *)*((_QWORD *)v7 + 6);
      *((_QWORD *)v7 + 6) = v153;

    }
    else
    {
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v43, 0, (uint64_t)CFSTR("cloudd_db"), 1);
      v176 = objc_claimAutoreleasedReturnValue();
      v177 = (void *)*((_QWORD *)v7 + 7);
      *((_QWORD *)v7 + 7) = v176;

      objc_msgSend_applicationBundleID(v4, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSafeStringForPathComponent(v180, v181, v182);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v43, v184, (uint64_t)v183, 1);
      v185 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v185, v186, (uint64_t)v106, 1);
      v187 = (void *)objc_claimAutoreleasedReturnValue();

      v188 = (void *)*((_QWORD *)v7 + 4);
      *((_QWORD *)v7 + 4) = 0;

      objc_storeStrong((id *)v7 + 5, v187);
      v124 = (void *)*((_QWORD *)v7 + 6);
      *((_QWORD *)v7 + 6) = v187;
    }
    v175 = v204;
    v174 = v19;
    v173 = v206;
  }

  objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v189, (uint64_t)obj, 1);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = (void *)MEMORY[0x1E0C94FC8];
  objc_msgSend_applicationBundleID(v4, v192, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier_(v191, v195, (uint64_t)v194);
  v196 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v190, v197, (uint64_t)v196, 1);
  v198 = objc_claimAutoreleasedReturnValue();
  v199 = (void *)*((_QWORD *)v7 + 8);
  *((_QWORD *)v7 + 8) = v198;

LABEL_43:
  return (CKDDirectoryContext *)v7;
}

- (id)applicationCachesDirectoryForDataContainerDirectory:(id)a3 usingHomeCachesDirectory:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v8 = v5;
  if (v5)
  {
    objc_msgSend_path(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v9, v10, (uint64_t)CFSTR("Library"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v11, v12, (uint64_t)CFSTR("Caches"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v4)
      CKGetPersonaAwareHomeCacheDirectory();
    else
      CKGetPersonaAwareCacheDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByDeletingLastPathComponent(v9, v14, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  CKGetRealPath();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v17 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v23 = v17;
    objc_msgSend_CKSanitizedPath(v16, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v26;
    _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Got caches path: %@", (uint8_t *)&v27, 0xCu);

  }
  objc_msgSend_stringByAppendingPathComponent_(v16, v18, (uint64_t)CFSTR("CloudKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v20, (uint64_t)v19, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSURL)fileDownloadDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_daemonCachesDirectory, a2, (uint64_t)CFSTR("Assets"), 1);
}

- (NSURL)packageStagingDirectory
{
  return self->_packageStagingDirectory;
}

- (NSURL)frameworkCachesDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_daemonCachesDirectory, a2, (uint64_t)CFSTR("FrameworkCaches"), 1);
}

- (NSURL)temporaryDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_daemonCachesDirectory, a2, (uint64_t)CFSTR("tmp"), 1);
}

- (NSURL)containerDirectory
{
  return self->_containerDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageStagingDirectory, 0);
  objc_storeStrong((id *)&self->_daemonDatabaseDirectory, 0);
  objc_storeStrong((id *)&self->_daemonCachesDirectory, 0);
  objc_storeStrong((id *)&self->_containerCloudKitDirectory, 0);
  objc_storeStrong((id *)&self->_containerDirectory, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSeparationHash, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

+ (id)daemonDatabaseDirectoryName
{
  return CFSTR("cloudd_db");
}

- (CKDDirectoryContext)initWithTestRootDirectory:(id)a3
{
  id v5;
  CKDDirectoryContext *v6;
  CKDDirectoryContext *v7;
  NSString *containerIdentifier;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSURL *containerCloudKitDirectory;
  const char *v19;
  uint64_t v20;
  NSURL *daemonCachesDirectory;
  const char *v22;
  uint64_t v23;
  NSURL *daemonDatabaseDirectory;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSURL *packageStagingDirectory;
  objc_super v33;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKDDirectoryContext;
  v6 = -[CKDDirectoryContext init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    containerIdentifier = v6->_containerIdentifier;
    v6->_containerIdentifier = (NSString *)CFSTR("com.apple.test.container");

    objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v9, (uint64_t)v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_containerDirectory, a3);
    objc_msgSend_containerDirectory(v7, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v13, v14, (uint64_t)CFSTR("CloudKit"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v15, v16, (uint64_t)CFSTR("FakeTestHash"), 1);
    v17 = objc_claimAutoreleasedReturnValue();
    containerCloudKitDirectory = v7->_containerCloudKitDirectory;
    v7->_containerCloudKitDirectory = (NSURL *)v17;

    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v10, v19, (uint64_t)CFSTR("FakeTestHash"), 1);
    v20 = objc_claimAutoreleasedReturnValue();
    daemonCachesDirectory = v7->_daemonCachesDirectory;
    v7->_daemonCachesDirectory = (NSURL *)v20;

    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v7->_daemonCachesDirectory, v22, (uint64_t)CFSTR("SQLiteDBs"), 1);
    v23 = objc_claimAutoreleasedReturnValue();
    daemonDatabaseDirectory = v7->_daemonDatabaseDirectory;
    v7->_daemonDatabaseDirectory = (NSURL *)v23;

    objc_msgSend_applicationCachesDirectoryForDataContainerDirectory_usingHomeCachesDirectory_(v7, v25, (uint64_t)v5, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier_(MEMORY[0x1E0C94FC8], v27, (uint64_t)CFSTR("FakeTestStagingPathSuffix"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v26, v29, (uint64_t)v28, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    packageStagingDirectory = v7->_packageStagingDirectory;
    v7->_packageStagingDirectory = (NSURL *)v30;

  }
  return v7;
}

- (NSURL)mmcsWorkingDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_containerCloudKitDirectory, a2, (uint64_t)CFSTR("MMCS"), 1);
}

- (NSURL)recordCacheDirectory
{
  return (NSURL *)objc_msgSend_URLByAppendingPathComponent_isDirectory_(self->_containerCloudKitDirectory, a2, (uint64_t)CFSTR("Records"), 1);
}

- (id)description
{
  return (id)((uint64_t (*)(CKDDirectoryContext *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("containerCloudKitDirectory");
  objc_msgSend_containerCloudKitDirectory(self, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKSanitizedPath(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v9;
  v38[1] = CFSTR("daemonCachesDirectory");
  objc_msgSend_daemonCachesDirectory(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKSanitizedPath(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v15;
  v38[2] = CFSTR("packageStagingDirectory");
  objc_msgSend_packageStagingDirectory(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKSanitizedPath(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v39, v38, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_containerDirectory(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v29 = (void *)objc_msgSend_mutableCopy(v23, v27, v28);

    objc_msgSend_containerDirectory(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v29, v36, (uint64_t)v35, CFSTR("containerDirectory"));

    v23 = v29;
  }
  return v23;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSString)dataSeparationHash
{
  return self->_dataSeparationHash;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSURL)containerCloudKitDirectory
{
  return self->_containerCloudKitDirectory;
}

- (NSURL)daemonCachesDirectory
{
  return self->_daemonCachesDirectory;
}

- (NSURL)daemonDatabaseDirectory
{
  return self->_daemonDatabaseDirectory;
}

@end
