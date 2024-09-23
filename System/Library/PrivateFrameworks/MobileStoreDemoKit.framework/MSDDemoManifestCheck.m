@implementation MSDDemoManifestCheck

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  return (id)sharedInstance_shared_1;
}

void __38__MSDDemoManifestCheck_sharedInstance__block_invoke()
{
  MSDDemoManifestCheck *v0;
  void *v1;

  v0 = objc_alloc_init(MSDDemoManifestCheck);
  v1 = (void *)sharedInstance_shared_1;
  sharedInstance_shared_1 = (uint64_t)v0;

}

- (MSDDemoManifestCheck)init
{
  MSDDemoManifestCheck *v2;
  MSDDemoManifestCheck *v3;
  void *v4;
  void *v5;
  WhitelistChecker *v6;
  void *v7;
  char v8;
  void *v9;
  MSDDemoManifestCheck *v10;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSDDemoManifestCheck;
  v2 = -[MSDDemoManifestCheck init](&v13, sel_init);
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  -[MSDDemoManifestCheck getAllowedSymLinks](v2, "getAllowedSymLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck setAllowedSymLinks:](v3, "setAllowedSymLinks:", v4);

  -[MSDDemoManifestCheck getSettingsComponentNames](v3, "getSettingsComponentNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck setSettingsComponentNames:](v3, "setSettingsComponentNames:", v5);

  v6 = objc_alloc_init(WhitelistChecker);
  -[MSDDemoManifestCheck setWhitelistChecker:](v3, "setWhitelistChecker:", v6);

  -[MSDDemoManifestCheck whitelistChecker](v3, "whitelistChecker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "load");

  if ((v8 & 1) == 0)
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck init].cold.1();

    goto LABEL_7;
  }
  v9 = (void *)objc_opt_new();
  -[MSDDemoManifestCheck setBlocklistedItems:](v3, "setBlocklistedItems:", v9);

  v10 = v3;
LABEL_8:

  return v10;
}

- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4
{
  id v6;
  id v7;
  MSDDemoManifestCheck *v8;
  MSDDemoManifestCheck *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSDDemoManifestCheck;
  v8 = -[MSDDemoManifestCheck init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDDemoManifestCheck getAllowedSymLinks](v8, "getAllowedSymLinks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck setAllowedSymLinks:](v9, "setAllowedSymLinks:", v10);

    -[MSDDemoManifestCheck getSettingsComponentNames](v9, "getSettingsComponentNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck setSettingsComponentNames:](v9, "setSettingsComponentNames:", v11);

    -[MSDDemoManifestCheck setWhitelistChecker:](v9, "setWhitelistChecker:", v6);
    -[MSDDemoManifestCheck setCheckType:](v9, "setCheckType:", v7);
  }

  return v9;
}

- (id)verifyFactoryManifestSignature:(id)a3 forDataSectionKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)MGCopyAnswer();
  objc_msgSend(v6, "objectForKey:", CFSTR("Info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (!v10)
  {
    objc_msgSend(0, "objectForKey:", CFSTR("MinimumOSVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) == 0)
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ExcludeBlocklistItem"));
  -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:](self, "verifyManifestSignature:forDataSectionKeys:withOptions:", v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFBoolean *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __SecKey *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  int v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  __SecKey *v49;
  void *v50;
  unsigned __int8 *v51;
  const __CFData *v52;
  __CFString *v53;
  int v54;
  __CFString *v55;
  MSDDemoManifestCheck *v56;
  int v57;
  NSObject *v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t i;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  __CFString *v105;
  void *v106;
  __CFString *v107;
  __CFString *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const __CFBoolean *cf;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  const __CFString *algorithm;
  uint64_t v122;
  uint64_t v123;
  _BOOL4 v124;
  uint64_t v125;
  id v126;
  void *v127;
  NSObject *obj;
  id v129;
  void *v130;
  int v131;
  uint64_t v132;
  __CFString *v133;
  MSDDemoManifestCheck *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  CFErrorRef error;
  uint8_t v152[128];
  uint8_t buf[4];
  const char *v154;
  __int16 v155;
  _BYTE v156[10];
  void *v157;
  __int16 v158;
  CFErrorRef v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _QWORD v162[3];
  _QWORD v163[3];
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  v126 = a3;
  v119 = a4;
  v8 = a5;
  v129 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  error = 0;
  defaultLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl(&dword_213A7E000, v9, OS_LOG_TYPE_DEFAULT, "%s: Verifying a separate component manifest.", buf, 0xCu);
  }

  objc_msgSend(v8, "objectForKey:", CFSTR("RigorousTestingOverride"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ExcludeBlocklistItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v126);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v12);

  }
  v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v126, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

  v16 = (const __CFBoolean *)MGCopyAnswer();
  cf = v16;
  if (v16)
    v17 = CFBooleanGetValue(v16) != 0;
  else
    v17 = 1;
  v124 = v17;
  objc_msgSend(v126, "objectForKey:", CFSTR("Certificates"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v18;
  if (!v18)
  {
    defaultLogHandle();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.1();
    v33 = 0;
    v21 = 0;
    v22 = 0;
    v34 = 0;
    v23 = 0;
LABEL_102:

    if (cf)
      CFRelease(cf);
    v103 = 0;
    goto LABEL_112;
  }
  v134 = self;
  v115 = v15;
  v116 = v8;
  v117 = v10;
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  obj = v18;
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v147, v164, 16);
  if (!v19)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_31;
  }
  v20 = v19;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v132 = *(_QWORD *)v148;
  while (2)
  {
    v24 = 0;
    v25 = v22;
    do
    {
      if (*(_QWORD *)v148 != v132)
        objc_enumerationMutation(obj);
      v26 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v24);
      -[NSObject objectForKey:](obj, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("TypeOfSignature"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "objectForKey:", CFSTR("Certificate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        defaultLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.6();
        v10 = v117;
        v15 = v115;
        v21 = v28;
        goto LABEL_96;
      }
      v21 = v28;
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        defaultLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.7(v61, v62, v63, v64, v65, v66, v67, v68);
LABEL_95:
        v10 = v117;
        v15 = v115;
LABEL_96:

        v33 = 0;
        v34 = 0;
        goto LABEL_102;
      }
      if (!objc_msgSend(v28, "count"))
      {
        defaultLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.8(v61, v82, v83, v84, v85, v86, v87, v88);
        goto LABEL_95;
      }
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("UAT")))
      {
        v29 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigning:](v134, "createPublicKeyForDevelopmentSigning:", v28);
        v23 = CFSTR("Skip");
        if (!v29)
          goto LABEL_93;
LABEL_26:
        v31 = v21;
        goto LABEL_27;
      }
      v30 = -[MSDDemoManifestCheck createPublicKeyForStrongSigning:](v134, "createPublicKeyForStrongSigning:", v28);
      if (!v30)
      {
        v29 = -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:](v134, "createPublicKeyAppleISTSigning:", v28);
        v23 = CFSTR("AppleISTCertCheck");
        if (!v29)
        {
LABEL_93:
          defaultLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.9(v61, v89, v90, v91, v92, v93, v94, v95);
          goto LABEL_95;
        }
        goto LABEL_26;
      }
      v29 = (__SecKey *)v30;
      v31 = v21;
      if (-[MSDDemoManifestCheck isManualSigning:](v134, "isManualSigning:", v21))
        v23 = CFSTR("Skip");
      else
        v23 = CFSTR("Default");
LABEL_27:
      v162[0] = CFSTR("publicKey");
      v162[1] = CFSTR("TypeOfSignature");
      v163[0] = v29;
      v163[1] = v22;
      v162[2] = CFSTR("RigorousCheckType");
      v163[2] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, v162, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "setObject:forKeyedSubscript:", v32, v26);

      ++v24;
      v21 = v31;
      v25 = v22;
    }
    while (v20 != v24);
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v147, v164, 16);
    v21 = v31;
    if (v20)
      continue;
    break;
  }
LABEL_31:

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  obj = v119;
  v112 = v21;
  v109 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v143, v161, 16);
  v33 = 0;
  v34 = 0;
  v35 = 0;
  if (v109)
  {
    v110 = *(_QWORD *)v144;
    algorithm = (const __CFString *)*MEMORY[0x24BDE9330];
    v122 = *MEMORY[0x24BDBD240];
    while (1)
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v144 != v110)
          objc_enumerationMutation(obj);
        v37 = v33;
        v111 = v36;
        v38 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v36);
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v127 = v38;
        objc_msgSend(v126, "objectForKey:");
        v120 = (id)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v139, v160, 16);
        if (!v125)
          goto LABEL_50;
        v123 = *(_QWORD *)v140;
        while (2)
        {
          v39 = 0;
          do
          {
            v131 = v35;
            v133 = v23;
            v40 = v34;
            v41 = v22;
            if (*(_QWORD *)v140 != v123)
              objc_enumerationMutation(v120);
            v42 = *(const __CFString **)(*((_QWORD *)&v139 + 1) + 8 * v39);
            objc_msgSend(v126, "objectForKey:", v127);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKey:", v42);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "objectForKey:", CFSTR("Certificate"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "objectForKey:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45;
            v33 = v37;
            if (!v45)
            {
              defaultLogHandle();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.3();
LABEL_100:
              v15 = v115;
              v8 = v116;

              v22 = v41;
              v10 = v117;
              v21 = v112;
LABEL_101:
              v23 = v133;
              goto LABEL_102;
            }
            objc_msgSend(v45, "objectForKey:", CFSTR("TypeOfSignature"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v124 & objc_msgSend(v47, "isEqualToString:", CFSTR("UAT"))) == 1)
            {
              defaultLogHandle();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.4(v79, v96, v97, v98, v99, v100, v101, v102);
              goto LABEL_99;
            }
            -[MSDDemoManifestCheck getComponentData:](v134, "getComponentData:", v34);
            v48 = (const __CFString *)objc_claimAutoreleasedReturnValue();

            if (!v48)
            {
              defaultLogHandle();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.5();
              v33 = 0;
LABEL_99:
              v41 = v47;
              goto LABEL_100;
            }
            v49 = (__SecKey *)objc_msgSend(v46, "objectForKey:", CFSTR("publicKey"));
            v50 = v34;
            v37 = (__CFString *)v48;
            v51 = _MobileAssetHashAssetData(v122, v42, v48);
            objc_msgSend(v34, "objectForKey:", CFSTR("Signature"));
            v52 = (const __CFData *)objc_claimAutoreleasedReturnValue();
            LODWORD(v49) = SecKeyVerifySignature(v49, algorithm, (CFDataRef)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v51, 20), v52, &error);
            free(v51);
            v130 = v50;
            if (!(_DWORD)v49)
            {
              defaultLogHandle();
              v80 = objc_claimAutoreleasedReturnValue();
              v81 = v115;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                v155 = 2114;
                *(_QWORD *)v156 = v42;
                *(_WORD *)&v156[8] = 2114;
                v157 = v127;
                v158 = 2114;
                v159 = error;
                _os_log_error_impl(&dword_213A7E000, v80, OS_LOG_TYPE_ERROR, "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@", buf, 0x2Au);
              }

LABEL_87:
              v21 = v112;
              v33 = v37;
              v34 = v130;
              v22 = v47;
              v15 = v81;
              v8 = v116;
              v10 = v117;
              goto LABEL_101;
            }
            objc_msgSend(v46, "objectForKey:", CFSTR("RigorousCheckType"));
            v53 = (__CFString *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v50, "setObject:forKey:", v53, CFSTR("RigorousCheckType"));
            v54 = -[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("Skip"));
            v55 = v53;
            if (-[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("AppleISTCertCheck"))
              && objc_msgSend(v127, "isEqualToString:", CFSTR("Apps"))
              && !-[MSDDemoManifestCheck validateISTSignedApp:manifest:](v134, "validateISTSignedApp:manifest:", v42, v126))
            {
              v133 = v53;
              v81 = v115;
              goto LABEL_87;
            }
            v35 = v54 ^ 1 | v131;

            ++v39;
            v34 = v130;
            v22 = v47;
            v23 = v55;
          }
          while (v125 != v39);
          v125 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v139, v160, 16);
          if (v125)
            continue;
          break;
        }
LABEL_50:

        v21 = v112;
        v36 = v111 + 1;
        v56 = v134;
        v33 = v37;
      }
      while (v111 + 1 != v109);
      v109 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v143, v161, 16);
      if (!v109)
        goto LABEL_54;
    }
  }
  v56 = v134;
LABEL_54:

  v15 = v115;
  if (!os_variant_has_internal_content()
    || !v118
    || (v57 = v35 & 1, v57 == objc_msgSend(v118, "BOOLValue")))
  {
    if ((v35 & 1) == 0)
      goto LABEL_60;
    goto LABEL_66;
  }
  defaultLogHandle();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = objc_msgSend(v118, "BOOLValue");
    *(_DWORD *)buf = 136315650;
    v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    v155 = 1024;
    *(_DWORD *)v156 = v57;
    *(_WORD *)&v156[4] = 1024;
    *(_DWORD *)&v156[6] = v59;
    _os_log_impl(&dword_213A7E000, v58, OS_LOG_TYPE_DEFAULT, "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d", buf, 0x18u);
  }

  if ((objc_msgSend(v118, "BOOLValue") & 1) != 0)
  {
LABEL_66:
    v8 = v116;
    v10 = v117;
    if (-[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](v56, "secureManifestCheckForSegmentedManifest:options:", v126, v116))
    {
      goto LABEL_67;
    }
    v105 = v33;
    v106 = v34;
    v107 = v105;
    defaultLogHandle();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:].cold.2();
    v8 = v116;
    v10 = v117;
    v15 = v115;
    v21 = v112;
    v108 = v107;
    v34 = v106;
    v33 = v108;
    goto LABEL_102;
  }
LABEL_60:
  defaultLogHandle();
  v60 = objc_claimAutoreleasedReturnValue();
  v10 = v117;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v154 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl(&dword_213A7E000, v60, OS_LOG_TYPE_DEFAULT, "%s: Skipping rigorous manifest testing.", buf, 0xCu);
  }

  v8 = v116;
LABEL_67:
  if (!objc_msgSend(v10, "BOOLValue"))
    goto LABEL_109;
  -[MSDDemoManifestCheck blocklistedItems](v56, "blocklistedItems");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "count");

  if (!v70)
  {
    defaultLogHandle();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A7E000, v71, OS_LOG_TYPE_DEFAULT, "No items blocklisted, skip blocklist item exclusion", buf, 2u);
    }
    goto LABEL_107;
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v71 = v126;
  v72 = -[NSObject countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v135, v152, 16);
  if (!v72)
  {
LABEL_107:
    v10 = v117;
    goto LABEL_108;
  }
  v73 = v72;
  v74 = v34;
  v75 = *(_QWORD *)v136;
  do
  {
    for (i = 0; i != v73; ++i)
    {
      if (*(_QWORD *)v136 != v75)
        objc_enumerationMutation(v71);
      v77 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
      -[NSObject objectForKey:ofType:](v71, "objectForKey:ofType:", v77, objc_opt_class());
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (v78)
        -[MSDDemoManifestCheck removeBlocklistedItemFromSection:withName:](v134, "removeBlocklistedItemFromSection:withName:", v78, v77);

    }
    v73 = -[NSObject countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v135, v152, 16);
  }
  while (v73);
  v10 = v117;
  v21 = v112;
  v34 = v74;
  v8 = v116;
  v15 = v115;
LABEL_108:

LABEL_109:
  if (cf)
    CFRelease(cf);
  v103 = v126;
LABEL_112:

  return v103;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3
{
  return -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](self, "secureManifestCheckForSegmentedManifest:options:", a3, 0);
}

- (BOOL)checkFileForEntitlements:(id)a3 forCorrespondingManifestEntry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  BOOL v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;

  v6 = a3;
  v39 = a4;
  -[MSDDemoManifestCheck itemBeingInstalled](self, "itemBeingInstalled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("TypeOfFiles"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      defaultLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:].cold.4();
      goto LABEL_10;
    }
    -[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

    if (v13)
    {
      v36 = v9;
      v37 = v8;
      v38 = v6;
      objc_msgSend(v8, "objectForKey:", CFSTR("Identifier"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v35, "rangeValue");
      v16 = v15;
      -[MSDDemoManifestCheck getInstallationOrder](self, "getInstallationOrder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14 + v16;
      v19 = (v14 + v16 - 1);
      if (v14 + v16 - 1 >= 0)
      {
        while (1)
        {
          objc_msgSend(v17, "objectAtIndex:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSDDemoManifestCheck getBackupItemName:](self, "getBackupItemName:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", CFSTR("Manifest"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "objectForKey:", v39);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            break;

          --v18;
          --v19;
          if (v18 < 1)
            goto LABEL_7;
        }
        objc_msgSend(v22, "objectForKey:", CFSTR("RigorousCheckType"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("Skip"));

        v8 = v37;
        v6 = v38;
        v9 = v36;
        if ((v32 & 1) != 0)
          goto LABEL_20;
LABEL_19:
        if (MISValidateSignatureAndCopyInfo())
        {
LABEL_20:
          v27 = 1;
          goto LABEL_21;
        }
        defaultLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:].cold.2(v26);
LABEL_10:

        v27 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_7:

      v8 = v37;
      v6 = v38;
      v9 = v36;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ExtensionData")) & 1) != 0
           || (objc_msgSend(v9, "isEqualToString:", CFSTR("AppData")) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", CFSTR("GroupData")))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("Identifier"));
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        defaultLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:].cold.3();

        goto LABEL_10;
      }
      objc_msgSend(v28, "objectForKey:", CFSTR("RigorousCheckType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Skip"));

      if ((v30 & 1) != 0)
        goto LABEL_20;
      goto LABEL_19;
    }
    defaultLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:].cold.1();
    goto LABEL_10;
  }
  v27 = 1;
LABEL_22:

  return v27;
}

- (__SecKey)createPublicKeyForStrongSigning:(id)a3
{
  id v4;
  uint64_t MobileStoreSigner;
  NSObject *v6;
  NSObject *v7;
  __SecKey *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v4 = a3;
  MobileStoreSigner = SecPolicyCreateMobileStoreSigner();
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (MobileStoreSigner)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "Verifying strong signing", v17, 2u);
    }

    v8 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, MobileStoreSigner, 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyForStrongSigning:].cold.1(v7, v10, v11, v12, v13, v14, v15, v16);

    v8 = 0;
  }

  return v8;
}

- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3
{
  id v4;
  NSObject *v5;
  __SecKey *v6;
  uint8_t v8[16];

  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "Verifying development signing", v8, 2u);
  }

  v6 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigningStandard:](self, "createPublicKeyForDevelopmentSigningStandard:", v4);
  return v6;
}

- (__SecKey)createPublicKeyAppleISTSigning:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t DemoDigitalCatalogSigning;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  const __CFAllocator *v10;
  id v11;
  const UInt8 *v12;
  void *v13;
  const __CFData *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v20;
  const UInt8 *v21;
  void *v22;
  const __CFData *v23;
  __SecCertificate *v24;
  NSObject *v25;
  const __CFData *v26;
  SecCertificateRef v27;
  void *v28;
  __SecKey *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[8];
  CFStringRef commonName;

  v4 = a3;
  commonName = 0;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.1(v25, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_24;
  }
  v7 = DemoDigitalCatalogSigning;
  if (objc_msgSend(v4, "count") != 2)
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.8();
    goto LABEL_24;
  }
  objc_msgSend(v4, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v15 = 0;
    goto LABEL_21;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  objc_msgSend(v4, "objectAtIndex:", 0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const UInt8 *)objc_msgSend(v11, "bytes");
  objc_msgSend(v4, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFDataCreate(v10, v12, objc_msgSend(v13, "length"));

  if (!v14)
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.2();
LABEL_24:
    v15 = 0;
LABEL_36:
    v28 = 0;
    v29 = 0;
    goto LABEL_14;
  }
  SecCertificateCreateWithData(v10, v14);
  SecCertificateCopyOrganizationalUnit();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("1.2.840.113635.100.6.60"));

  if ((v17 & 1) == 0)
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.7();
    goto LABEL_36;
  }
  objc_msgSend(v4, "objectAtIndex:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
LABEL_21:
    v28 = 0;
    v29 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "objectAtIndex:", 1);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = (const UInt8 *)objc_msgSend(v20, "bytes");
  objc_msgSend(v4, "objectAtIndex:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CFDataCreate(v10, v21, objc_msgSend(v22, "length"));

  if (!v23)
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.3();
    goto LABEL_36;
  }
  v24 = SecCertificateCreateWithData(v10, v23);
  SecCertificateCopyCommonName(v24, &commonName);
  v25 = (id)commonName;
  if ((-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("DemoUnit CA")) & 1) == 0)
  {
    defaultLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.6((uint64_t)&commonName, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_35;
  }
  v26 = CFDataCreate(v10, demoUnitRootCACert_crt, demoUnitRootCACert_crt_len);
  if (!v26)
  {
    defaultLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.4(v38, v45, v46, v47, v48, v49, v50, v51);
    goto LABEL_35;
  }
  v27 = SecCertificateCreateWithData(v10, v26);
  if (!v27)
  {
    defaultLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:].cold.5(v38, v52, v53, v54, v55, v56, v57, v58);
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, v7, v28);
LABEL_14:

LABEL_15:
  return v29;
}

- (__SecKey)createPublicKeyForDevelopmentSigningStandard:(id)a3
{
  id v4;
  uint64_t TestMobileStoreSigner;
  __SecKey *v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  TestMobileStoreSigner = SecPolicyCreateTestMobileStoreSigner();
  if (TestMobileStoreSigner)
  {
    v6 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, TestMobileStoreSigner, 0);
  }
  else
  {
    defaultLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigningStandard:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v6 = 0;
  }

  return v6;
}

- (__SecKey)createPublicKey:(id)a3 usingPolicy:(__SecPolicy *)a4 anchors:(id)a5
{
  id v7;
  const __CFArray *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  __SecKey *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  int v29;
  SecTrustRef trust;

  v7 = a3;
  v8 = (const __CFArray *)a5;
  trust = 0;
  v29 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v24[5];
  v24[5] = v9;

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke;
  v22[3] = &unk_24D0AD980;
  v22[4] = &v23;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);
  v11 = (const void *)v24[5];
  if (!v11)
  {
LABEL_14:
    v12 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (SecTrustCreateWithCertificates(v11, a4, &trust))
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.5();
    goto LABEL_13;
  }
  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.4();
    goto LABEL_13;
  }
  if (MEMORY[0x2199BB884](trust, &v29))
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.3();
    goto LABEL_13;
  }
  if (v29 != 1 && v29 != 4)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.1();
    goto LABEL_13;
  }
  v12 = (__SecKey *)MEMORY[0x2199BB86C](trust);
  if (!v12)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:].cold.2(v13, v15, v16, v17, v18, v19, v20, v21);
LABEL_13:

    goto LABEL_14;
  }
  if (a4)
LABEL_15:
    CFRelease(a4);
LABEL_16:
  if (trust)
  {
    CFRelease(trust);
    trust = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke(uint64_t a1, const __CFData *a2, uint64_t a3, _BYTE *a4)
{
  SecCertificateRef v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SecCertificateRef v17;

  v6 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], a2);
  if (v6)
  {
    v17 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

  }
  else
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

    *a4 = 1;
  }
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  unsigned __int8 *v10;
  id v11;
  const void *v12;
  CC_LONG v13;
  id v14;
  const uint8_t *v15;
  size_t v16;
  OSStatus v17;
  NSObject *v19;

  v7 = a4;
  v8 = a3;
  defaultLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MSDDemoManifestCheck verifySignature:forData:withKey:].cold.2();

  v10 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x871388B4uLL);
  v11 = objc_retainAutorelease(v7);
  v12 = (const void *)objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");

  CC_SHA1(v12, v13, v10);
  v14 = objc_retainAutorelease(v8);
  v15 = (const uint8_t *)objc_msgSend(v14, "bytes");
  v16 = objc_msgSend(v14, "length");

  v17 = SecKeyRawVerify(a5, 0x8002u, v10, 0x14uLL, v15, v16);
  free(v10);
  if (v17)
  {
    defaultLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[MSDDemoManifestCheck verifySignature:forData:withKey:].cold.1(v17, v19);

  }
  return v17 == 0;
}

- (BOOL)isManualSigning:(id)a3
{
  const __CFData *v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  __CFString *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v25[16];
  uint8_t buf[8];
  CFStringRef commonName;

  commonName = 0;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck isManualSigning:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_12;
  }
  v4 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v3);
  if (!v4)
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck isManualSigning:].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_12:

    v6 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  SecCertificateCopyCommonName(v4, &commonName);
  CFRelease(v5);
  v6 = (__CFString *)commonName;
  if (-[__CFString isEqualToString:]((id)commonName, "isEqualToString:", CFSTR("Demo Content Signing")))
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "A certificate for manual signing is used.", buf, 2u);
    }
    v8 = 1;
    goto LABEL_16;
  }
LABEL_13:
  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "A certificate for non-manual signing is used.", v25, 2u);
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("Apps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("Manifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("Info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("AppType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("Dependencies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11
    || objc_msgSend(v11, "count") == 1
    && (objc_msgSend(v12, "objectForKey:", CFSTR("ProvisioningProfiles")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    v14 = 1;
  }
  else
  {
    defaultLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck validateISTSignedApp:manifest:].cold.1();

    v14 = 0;
  }

  return v14;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_11;
  }
  -[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v9);

  }
  -[MSDDemoManifestCheck setSegmentedManifestWithRigorousFlag:](self, "setSegmentedManifestWithRigorousFlag:", v6);
  objc_msgSend(v6, "objectForKey:", CFSTR("Version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck setManifestVersion:](self, "setManifestVersion:", objc_msgSend(v10, "unsignedIntValue"));

  if (!-[MSDDemoManifestCheck runSecurityCheck:](self, "runSecurityCheck:", v7))
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:].cold.2(v13, v21, v22, v23, v24, v25, v26, v27);
LABEL_11:

    v11 = 0;
    goto LABEL_6;
  }
  -[MSDDemoManifestCheck registerEntitlementNotificationHandler](self, "registerEntitlementNotificationHandler");
  v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)runSecurityCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  MSDDemoManifestCheck *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[MSDDemoManifestCheck getSecurityCheckSectionNames](self, "getSecurityCheckSectionNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck getappIconLayoutBackupName](self, "getappIconLayoutBackupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  -[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke;
  v24[3] = &unk_24D0AD9D0;
  v10 = v5;
  v25 = v10;
  v26 = self;
  v30 = &v31;
  v11 = v4;
  v27 = v11;
  v12 = v6;
  v28 = v12;
  v13 = v7;
  v29 = v13;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v24);

  if (*((_BYTE *)v32 + 24))
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[MSDDemoManifestCheck runSecurityCheck:]";
      _os_log_impl(&dword_213A7E000, v14, OS_LOG_TYPE_DEFAULT, "%s:Cleared all checks for manifest. Approving future installations", buf, 0xCu);
    }
  }
  else
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck runSecurityCheck:].cold.1(v14, v17, v18, v19, v20, v21, v22, v23);
  }

  v15 = *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v10 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2;
    v11[3] = &unk_24D0AD9A8;
    v11[4] = *(_QWORD *)(a1 + 40);
    v8 = v10;
    v9 = *(_QWORD *)(a1 + 72);
    v12 = v8;
    v16 = v9;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v17 = a4;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  char *v7;
  id v8;
  void *v9;
  char *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "checkType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "checkType");
  else
    objc_msgSend(v8, "objectForKey:", CFSTR("RigorousCheckType"));
  v10 = (char *)objc_claimAutoreleasedReturnValue();

  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getComponentData:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Skip")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Default")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "runSecurityChecksForSection:dataType:componentName:options:", v13, *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("AppleISTCertCheck")))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 40), v7);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "allowedISTSignedComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v14);

      if (v16)
      {
        if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 56))
          && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 64)))
        {
          defaultLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v23 = (const char *)v14;
            _os_log_impl(&dword_213A7E000, v17, OS_LOG_TYPE_DEFAULT, "About to run app layout checks for %{public}@", buf, 0xCu);
          }

          v18 = objc_msgSend(*(id *)(a1 + 32), "runAppLayoutSecurityCheck:", v13);
        }
        else
        {
          v18 = objc_msgSend(*(id *)(a1 + 32), "runSecurityChecksForSection:dataType:componentName:options:", v13, *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v18;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        defaultLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_2();

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      defaultLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v23 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        v24 = 2114;
        v25 = v10;
        v26 = 2114;
        v27 = v7;
        v28 = 2114;
        v29 = v19;
        _os_log_error_impl(&dword_213A7E000, v14, OS_LOG_TYPE_ERROR, "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).", buf, 0x2Au);
      }
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    defaultLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_1((uint64_t)v7, a1, v21);

    *a4 = 1;
    **(_BYTE **)(a1 + 80) = 1;
  }

}

- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  BOOL v16;
  BOOL v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[MSDDemoManifestCheck settingsComponentNames](self, "settingsComponentNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v11);

  if (v15)
    v16 = -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:](self, "runSettingsSecurityCheckForSection:component:", v13, v11);
  else
    v16 = -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:](self, "runFileSecurityChecksForSection:dataType:options:", v13, v10, v12);
  v17 = v16;

  return v17;
}

- (BOOL)runSettingsSecurityCheckForSection:(id)a3 component:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("locale")))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Data"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("language"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      defaultLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:].cold.1();
      goto LABEL_17;
    }
    -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("region"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      defaultLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:].cold.2();
LABEL_17:

LABEL_11:
      v12 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("display")))
    {
      defaultLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:].cold.4();
      goto LABEL_11;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("Data"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HDR"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      defaultLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:].cold.3();
      goto LABEL_17;
    }
  }

  v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4
{
  return -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:](self, "runFileSecurityChecksForSection:dataType:options:", a3, a4, 0);
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t i;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  MSDDemoManifestCheck *v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  __int16 v64;
  void *v65;
  char v66;
  uint64_t v67;
  int v68;
  void *v69;
  NSObject *v70;
  BOOL v71;
  NSObject *v72;
  NSObject *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *context;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  id obj;
  id obja;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("ExcludeBlocklistItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v12, "macOS");

  if ((_DWORD)a4)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "checkManifest:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "BOOLValue"))
    {
      -[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v15);

    }
    else if (v15)
    {
      defaultLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.2();
      v34 = 4;
LABEL_67:

      if (v34 == 4)
        goto LABEL_83;
      v71 = 1;
      goto LABEL_85;
    }
    v76 = v10;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v23 = v13;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
    if (v24)
    {
      v25 = v24;
      v92 = v15;
      v94 = v13;
      obj = v8;
      v79 = v11;
      v81 = v9;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = *(_QWORD *)v111;
      while (2)
      {
        v30 = 0;
        v31 = v26;
        v32 = v27;
        v33 = v28;
        do
        {
          if (*(_QWORD *)v111 != v29)
            objc_enumerationMutation(v23);
          v27 = *(id *)(*((_QWORD *)&v110 + 1) + 8 * v30);

          objc_msgSend(v23, "objectForKey:", v27);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "valueForKey:", CFSTR("MSDManifestFileAttributes"));
          v28 = objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            defaultLogHandle();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.1();

            v28 = 0;
            v34 = 4;
            goto LABEL_65;
          }
          ++v30;
          v31 = v26;
          v32 = v27;
          v33 = v28;
        }
        while (v25 != v30);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
        if (v25)
          continue;
        break;
      }
      v34 = 0;
LABEL_65:
      v11 = v79;
      v8 = obj;
      v15 = v92;

      v9 = v81;
      v13 = v94;
    }
    else
    {
      v34 = 0;
      v26 = 0;
      v28 = 0;
    }

    v10 = v76;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0B8418);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName");
  v18 = objc_claimAutoreleasedReturnValue();
  -[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = (void *)v18;
  v78 = v11;
  if (objc_msgSend(v9, "isEqualToString:", v18))
  {
    -[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "checkManifest:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "BOOLValue"))
    {
      -[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObjectsFromArray:", v21);

    }
    else if (v21)
    {
      v84 = v21;
      defaultLogHandle();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.2();

      v35 = 0;
      v69 = 0;
      v44 = 0;
      v68 = 4;
      goto LABEL_61;
    }

  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v84 = v19;
  v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
  if (!v86)
  {
    v35 = 0;
    v69 = 0;
    v44 = 0;
    v68 = 0;
LABEL_61:
    v38 = v83;
    goto LABEL_81;
  }
  v75 = v19;
  v77 = v10;
  v35 = 0;
  v36 = 0;
  v91 = 0;
  v85 = *(_QWORD *)v107;
  v38 = v83;
  v37 = v84;
  v80 = v17;
  v82 = v9;
  while (2)
  {
    v39 = 0;
    v40 = v36;
    v41 = v91;
    do
    {
      if (*(_QWORD *)v107 != v85)
      {
        v42 = v39;
        objc_enumerationMutation(v37);
        v39 = v42;
      }
      v87 = v39;
      v43 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v39);
      context = (void *)MEMORY[0x2199BB9B0]();
      v95 = v43;
      objc_msgSend(v37, "objectForKey:", v43);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "valueForKey:", CFSTR("MSDManifestFileAttributes"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        defaultLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.1();
        v19 = v75;
        goto LABEL_80;
      }
      v45 = objc_msgSend(v17, "containsObject:", v9);
      v91 = v44;
      objc_msgSend(v44, "valueForKey:", CFSTR("NSFileType"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v89 = v46;
      v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("NSFileTypeRegular"));
      if (v45)
      {
        if (((v47 & 1) != 0 || (objc_msgSend(v46, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) != 0)
          && !-[MSDDemoManifestCheck isValidDataContainerFile:](self, "isValidDataContainerFile:", v95))
        {
          goto LABEL_77;
        }
      }
      else if ((v47 & 1) == 0 && (objc_msgSend(v46, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) == 0)
      {
        objc_msgSend(v90, "valueForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        -[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
        if (!v49)
        {

          v35 = v48;
          v38 = v83;
LABEL_77:
          defaultLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v40 = v89;
            -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.6();
            goto LABEL_79;
          }
LABEL_78:
          v40 = v89;
LABEL_79:
          v19 = v75;
          v44 = v91;
LABEL_80:

          objc_autoreleasePoolPop(context);
          v68 = 4;
          v69 = v40;
          v10 = v77;
          goto LABEL_81;
        }
        v50 = v49;
        v93 = 0;
        v51 = *(_QWORD *)v103;
        v52 = v95;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v103 != v51)
              objc_enumerationMutation(obja);
            v54 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
            if (objc_msgSend(v52, "rangeOfString:", v54) != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectForKey:", v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              v100 = 0u;
              v101 = 0u;
              v98 = 0u;
              v99 = 0u;
              v57 = v56;
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
              if (v58)
              {
                v59 = v58;
                v60 = self;
                v61 = *(_QWORD *)v99;
                while (2)
                {
                  for (j = 0; j != v59; ++j)
                  {
                    if (*(_QWORD *)v99 != v61)
                      objc_enumerationMutation(v57);
                    if (objc_msgSend(v48, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j)) != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v93 = 1;
                      goto LABEL_49;
                    }
                  }
                  v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
                  if (v59)
                    continue;
                  break;
                }
LABEL_49:
                self = v60;
                v52 = v95;
              }

            }
          }
          v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
        }
        while (v50);

        v35 = v48;
        v17 = v80;
        v9 = v82;
        v38 = v83;
        v37 = v84;
        if ((v93 & 1) == 0)
          goto LABEL_77;
      }
      objc_msgSend(v91, "valueForKey:", CFSTR("NSFilePosixPermissions"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "longValue");

      if ((v64 & 0xC00) != 0)
      {
        defaultLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.5();
        goto LABEL_78;
      }
      if (objc_msgSend(v9, "isEqualToString:", v38))
      {
        -[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "handleSystemContainerFiles:withMetadata:", v95, v90);

        if ((v66 & 1) == 0)
        {
          defaultLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:].cold.4();
          goto LABEL_78;
        }
      }

      objc_autoreleasePoolPop(context);
      v39 = v87 + 1;
      v40 = v89;
      v41 = v91;
    }
    while (v87 + 1 != v86);
    v67 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
    v36 = v89;
    v86 = v67;
    if (v67)
      continue;
    break;
  }
  v68 = 0;
  v19 = v75;
  v10 = v77;
  v44 = v91;
  v69 = v89;
LABEL_81:

  if (v68 == 4)
  {
    v8 = v19;
    v11 = v78;
LABEL_83:
    v71 = 0;
  }
  else
  {
    v71 = 1;
    v8 = v19;
    v11 = v78;
  }
LABEL_85:

  return v71;
}

- (BOOL)runAppLayoutSecurityCheck:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  NSObject *v37;
  const char *v38;
  uint32_t v39;
  NSObject *v40;
  const char *v41;
  uint32_t v42;
  NSObject *v43;
  const char *v44;
  uint32_t v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  BOOL v52;
  BOOL v53;
  NSObject *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "macOS");

  if (v9)
  {
    objc_msgSend(v6, "addObject:", &unk_24D0B85F8);
    objc_msgSend(v7, "addObject:", CFSTR("staff"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = &unk_24D0B8430;
LABEL_7:
    objc_msgSend(v10, "setWithArray:", v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "addObject:", &unk_24D0B8610);
  objc_msgSend(v6, "addObject:", &unk_24D0B8628);
  objc_msgSend(v7, "addObject:", CFSTR("mobile"));
  objc_msgSend(v7, "addObject:", CFSTR("wheel"));
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "iOS");

  if (v13)
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = &unk_24D0B8448;
    goto LABEL_7;
  }
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "tvOS");

  v10 = (void *)MEMORY[0x24BDBCF20];
  if (v15)
  {
    v11 = &unk_24D0B8460;
    goto LABEL_7;
  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCF20]);
LABEL_8:
  v65 = v16;
  -[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v19)
  {
    v21 = v19;
    v67 = *(_QWORD *)v69;
    v62 = *MEMORY[0x24BDD0CA0];
    v61 = *MEMORY[0x24BDD0C68];
    v58 = *MEMORY[0x24BDD0C78];
    v59 = *MEMORY[0x24BDD0CB0];
    v57 = *MEMORY[0x24BDD0CC8];
    *(_QWORD *)&v20 = 134218242;
    v56 = v20;
    v63 = v18;
    v60 = v6;
    v66 = v7;
    do
    {
      v22 = 0;
      v64 = v21;
      do
      {
        if (*(_QWORD *)v69 != v67)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v22);
        objc_msgSend(v18, "objectForKey:", v23, v56);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          defaultLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[MSDDemoManifestCheck runAppLayoutSecurityCheck:].cold.1();
          goto LABEL_106;
        }
        objc_msgSend(v24, "objectForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile"));
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (-[NSObject isEqualToString:](v25, "isEqualToString:", &stru_24D0AE900) & 1) == 0)
          {
            defaultLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              -[MSDDemoManifestCheck runAppLayoutSecurityCheck:].cold.2();

LABEL_106:
            v28 = 6;
            goto LABEL_93;
          }
        }
        objc_msgSend(v24, "objectForKey:", CFSTR("MSDManifestFileAttributes"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v26, "objectForKey:", CFSTR("NSFileType"));
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if ((-[NSObject isEqualToString:](v27, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) != 0)
              {
                v28 = 3;
                goto LABEL_46;
              }
              if ((-[NSObject isEqualToString:](v27, "isEqualToString:", CFSTR("NSFileTypeRegular")) & 1) != 0)
              {
                if ((objc_msgSend(v65, "containsObject:", v23) & 1) != 0)
                {
                  objc_msgSend(v26, "objectForKey:", v62);
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    if (-[NSObject integerValue](v29, "integerValue") == 501)
                    {
                      objc_msgSend(v26, "objectForKey:", v61);
                      v30 = objc_claimAutoreleasedReturnValue();

                      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v7 = v66;
                        if ((objc_msgSend(v6, "containsObject:", v30) & 1) != 0)
                        {
                          objc_msgSend(v26, "objectForKey:", v59);
                          v31 = objc_claimAutoreleasedReturnValue();
                          if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            if ((-[NSObject isEqualToString:](v31, "isEqualToString:", CFSTR("mobile")) & 1) != 0)
                            {
                              objc_msgSend(v26, "objectForKey:", v58);
                              v32 = objc_claimAutoreleasedReturnValue();

                              if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v6 = v60;
                                if ((objc_msgSend(v66, "containsObject:", v32) & 1) != 0)
                                {
                                  objc_msgSend(v26, "objectForKey:", v57);
                                  v33 = objc_claimAutoreleasedReturnValue();
                                  if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    if ((-[NSObject integerValue](v33, "integerValue") & 0xC00) == 0)
                                    {
                                      v28 = 1;
                                      goto LABEL_42;
                                    }
                                    defaultLogHandle();
                                    v46 = objc_claimAutoreleasedReturnValue();
                                    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      v28 = 6;
LABEL_78:
                                      v6 = v60;
LABEL_42:

LABEL_43:
                                      v7 = v66;
LABEL_44:

                                      v18 = v63;
LABEL_45:

                                      v21 = v64;
                                      goto LABEL_46;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    v73 = v23;
                                    v47 = v46;
                                    v48 = "IS&T signed component contains setuid item: %{public}@";
                                  }
                                  else
                                  {
                                    defaultLogHandle();
                                    v46 = objc_claimAutoreleasedReturnValue();
                                    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                                      goto LABEL_77;
                                    *(_DWORD *)buf = 138543362;
                                    v73 = v23;
                                    v47 = v46;
                                    v48 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }
                                  _os_log_error_impl(&dword_213A7E000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
                                  goto LABEL_77;
                                }
                                defaultLogHandle();
                                v33 = objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  v28 = 6;
                                  goto LABEL_42;
                                }
                                *(_DWORD *)buf = 138543618;
                                v73 = (uint64_t)v66;
                                v74 = 2114;
                                v75 = v23;
                                v43 = v33;
                                v44 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                v45 = 22;
                              }
                              else
                              {
                                defaultLogHandle();
                                v33 = objc_claimAutoreleasedReturnValue();
                                v6 = v60;
                                if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                                  goto LABEL_75;
                                *(_DWORD *)buf = 138543362;
                                v73 = v23;
                                v43 = v33;
                                v44 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                v45 = 12;
                              }
                              _os_log_error_impl(&dword_213A7E000, v43, OS_LOG_TYPE_ERROR, v44, buf, v45);
                              goto LABEL_75;
                            }
                            defaultLogHandle();
                            v33 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              v28 = 6;
                              v32 = v31;
                              goto LABEL_78;
                            }
                            *(_DWORD *)buf = 138543618;
                            v73 = (uint64_t)CFSTR("mobile");
                            v74 = 2114;
                            v75 = v23;
                            v40 = v33;
                            v41 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            v42 = 22;
                          }
                          else
                          {
                            defaultLogHandle();
                            v33 = objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                              goto LABEL_73;
                            *(_DWORD *)buf = 138543362;
                            v73 = v23;
                            v40 = v33;
                            v41 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            v42 = 12;
                          }
                          _os_log_error_impl(&dword_213A7E000, v40, OS_LOG_TYPE_ERROR, v41, buf, v42);
                          goto LABEL_73;
                        }
                        defaultLogHandle();
                        v32 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          v28 = 6;
                          goto LABEL_44;
                        }
                        *(_DWORD *)buf = 138543618;
                        v73 = (uint64_t)v6;
                        v74 = 2114;
                        v75 = v23;
                        v37 = v32;
                        v38 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        v39 = 22;
                      }
                      else
                      {
                        defaultLogHandle();
                        v32 = objc_claimAutoreleasedReturnValue();
                        v7 = v66;
                        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                          goto LABEL_71;
                        *(_DWORD *)buf = 138543362;
                        v73 = v23;
                        v37 = v32;
                        v38 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        v39 = 12;
                      }
                      _os_log_error_impl(&dword_213A7E000, v37, OS_LOG_TYPE_ERROR, v38, buf, v39);
                      goto LABEL_71;
                    }
                    defaultLogHandle();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      v28 = 6;
                      v30 = v29;
                      goto LABEL_43;
                    }
                    *(_DWORD *)buf = v56;
                    v73 = 501;
                    v74 = 2114;
                    v75 = v23;
                    v34 = v32;
                    v35 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    v36 = 22;
                  }
                  else
                  {
                    defaultLogHandle();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                      goto LABEL_69;
                    *(_DWORD *)buf = 138543362;
                    v73 = v23;
                    v34 = v32;
                    v35 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    v36 = 12;
                  }
                  _os_log_error_impl(&dword_213A7E000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
                  goto LABEL_69;
                }
                defaultLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v73 = v23;
                  v49 = v30;
                  v50 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }
              else
              {
                defaultLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v73 = v23;
                  v49 = v30;
                  v50 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }
            else
            {
              defaultLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v73 = v23;
                v49 = v30;
                v50 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl(&dword_213A7E000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
              }
            }
            v28 = 6;
            goto LABEL_45;
          }
        }
        defaultLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v73 = v23;
          _os_log_error_impl(&dword_213A7E000, v27, OS_LOG_TYPE_ERROR, "IS&T signed component in wrong format (no file attributes) for %{public}@", buf, 0xCu);
        }
        v28 = 6;
LABEL_46:

        if (v28 != 3)
          goto LABEL_93;
        ++v22;
      }
      while (v21 != v22);
      v51 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      v21 = v51;
    }
    while (v51);
  }
  v28 = 0;
LABEL_93:

  if (v28)
    v52 = v28 == 6;
  else
    v52 = 1;
  v53 = !v52;

  return v53;
}

- (void)registerEntitlementNotificationHandler
{
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__MSDDemoManifestCheck_registerEntitlementNotificationHandler__block_invoke;
  v5[3] = &unk_24D0AD9F8;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("CheckEntitlementsNotify"), 0, 0, v5);

}

void __62__MSDDemoManifestCheck_registerEntitlementNotificationHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "Notification received for entitlement check for: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setItemBeingInstalled:", v7);

}

- (id)getSecurityCheckSectionNames
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "macOS");

    v4 = (void *)MEMORY[0x24BDBCF20];
    if (v3)
      v5 = &unk_24D0B8478;
    else
      v5 = &unk_24D0B8490;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = &unk_24D0B84A8;
  }
  objc_msgSend(v4, "setWithArray:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getManifestData:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    objc_msgSend(v4, "objectForKey:ofType:", CFSTR("Data"), objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)getComponentData:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = CFSTR("Manifest");
  objc_msgSend(v3, "objectForKey:", CFSTR("Manifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (v4 = CFSTR("Settings"),
        objc_msgSend(v3, "objectForKey:", CFSTR("Settings")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v3, "objectForKey:ofType:", v4, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getBackupSectionName
{
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
    return CFSTR("BackupData");
  else
    return CFSTR("Backup");
}

- (id)getappIconLayoutBackupName
{
  void *v2;
  int v3;

  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") != 7)
    return CFSTR("backup.Merge.AppIconLayout");
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "macOS");

  if (v3)
    return CFSTR("dockLayout");
  else
    return CFSTR("appIconLayout");
}

- (id)getInstallationOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("InstallationOrder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("CriticalComponents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "addObjectsFromArray:", v6);
    objc_msgSend(v5, "objectForKey:", CFSTR("Components"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  else
  {
    -[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("InstallationOrder"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)getBackupItemName:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("/BackupData/"), "length"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (BOOL)isValidDataContainerFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;

  v3 = a3;
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(".."));

        if (v9)
        {
          if (!v7)
          {
            defaultLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[MSDDemoManifestCheck isValidDataContainerFile:].cold.2();
            goto LABEL_12;
          }
          v10 = -1;
        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("."));

          v10 = v12 ^ 1;
        }
        v7 += v10;
        ++v6;
      }
      while (objc_msgSend(v5, "count") > v6);
    }
    v13 = 1;
  }
  else
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MSDDemoManifestCheck isValidDataContainerFile:].cold.1();
LABEL_12:

    v13 = 0;
  }

  return v13;
}

- (id)getAllowedSymLinks
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "iOS"))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0B84C0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.carrier"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator_1.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator_2.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator.merged.plist"));
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("/var/db/timezone/zoneinfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("/var/db/timezone/localtime"));

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0B84D8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("/var/mobile/Media/Books"));

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("/var/mobile/Library/Shortcuts/ToolKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("/var/mobile/Library/Shortcuts/ToolKit/Tools-active"));

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("Binaries/0/Debug-xros"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("/var/mobile/XcodeBuiltProducts/PressDemoScripts.xctestproducts/Tests/0/Debug-xros"));

    v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Containers/Data/Application/"));
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Containers/Shared/AppGroup/"));
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Containers/Shared/Extension/"));
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Library/Cookies"));
    objc_msgSend(v11, "addObject:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.PeoplePicker.plist"));
    objc_msgSend(v11, "addObject:", CFSTR("/private/var/mobile/Library/Preferences/.GlobalPreferences.plist"));
    objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("/var/mobile/Containers/"));

    return v2;
  }
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rOS");

  if (v5)
    goto LABEL_4;
  return v2;
}

- (id)getAllowedISTSignedComponents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("BackupData"), CFSTR("appIconLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("BackupData"), CFSTR("dockLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSDDemoManifestCheck getAllowedISTSignedComponentsFromManifest:](self, "getAllowedISTSignedComponentsFromManifest:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v9);
  objc_msgSend(v6, "addObjectsFromArray:", v10);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getAllowedISTSignedComponentsFromManifest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", CFSTR("com.retailtech.arkenstone"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.DigitalCatalog"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.demoloop"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.windward"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.DemoDiscoveryApp"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.DigitalSignage.iOS"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Apps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(obj);
        v29 = v6;
        objc_msgSend(v27, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Manifest"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Dependencies"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v38;
          v30 = *(_QWORD *)v38;
          v31 = v10;
          do
          {
            v14 = 0;
            v32 = v12;
            do
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14);
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ProvisioningProfiles")) & 1) == 0)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                v36 = 0u;
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v34;
                  do
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v34 != v19)
                        objc_enumerationMutation(v16);
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v15, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "addObject:", v21);

                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  }
                  while (v18);
                }

                v13 = v30;
                v10 = v31;
                v12 = v32;
              }
              ++v14;
            }
            while (v14 != v12);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v12);
        }

        v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v28);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)getSettingsComponentNames
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0B84F0);
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  MSDDemoManifestCheck *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v57;
    v35 = self;
    v36 = v6;
    v33 = *(_QWORD *)v57;
    v34 = v7;
    do
    {
      v11 = 0;
      v37 = v9;
      do
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(v6);
        v41 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v11);
        objc_msgSend(v6, "objectForKey:ofType:", v41, objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[MSDDemoManifestCheck getComponentData:](self, "getComponentData:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v38 = v13;
              v39 = v12;
              v40 = v11;
              v15 = (void *)objc_opt_new();
              v52 = 0u;
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              -[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
              if (v16)
              {
                v17 = v16;
                v43 = *(_QWORD *)v53;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v53 != v43)
                      objc_enumerationMutation(obj);
                    v19 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                    v48 = 0u;
                    v49 = 0u;
                    v50 = 0u;
                    v51 = 0u;
                    v20 = v14;
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
                    if (v21)
                    {
                      v22 = v21;
                      v23 = *(_QWORD *)v49;
                      do
                      {
                        for (j = 0; j != v22; ++j)
                        {
                          if (*(_QWORD *)v49 != v23)
                            objc_enumerationMutation(v20);
                          v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                          if ((objc_msgSend(v25, "isEqualToString:", v19, v33) & 1) != 0
                            || objc_msgSend(v25, "hasPrefix:", v19))
                          {
                            objc_msgSend(v15, "addObject:", v25);
                          }
                        }
                        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
                      }
                      while (v22);
                    }

                  }
                  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
                }
                while (v17);
              }

              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              v26 = v15;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
              v7 = v34;
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v45;
                do
                {
                  for (k = 0; k != v28; ++k)
                  {
                    if (*(_QWORD *)v45 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
                    defaultLogHandle();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      v61 = v31;
                      v62 = 2114;
                      v63 = v34;
                      v64 = 2114;
                      v65 = v41;
                      _os_log_impl(&dword_213A7E000, v32, OS_LOG_TYPE_DEFAULT, "Excluding %{public}@ from section: %{public}@ component:%{public}@", buf, 0x20u);
                    }

                    objc_msgSend(v14, "removeObjectForKey:", v31);
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
                }
                while (v28);
              }

              self = v35;
              v6 = v36;
              v10 = v33;
              v9 = v37;
              v13 = v38;
              v12 = v39;
              v11 = v40;
            }

          }
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v9);
  }

}

- (unsigned)manifestVersion
{
  return self->_manifestVersion;
}

- (void)setManifestVersion:(unsigned int)a3
{
  self->_manifestVersion = a3;
}

- (NSDictionary)segmentedManifestWithRigorousFlag
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegmentedManifestWithRigorousFlag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)allowedSymLinks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllowedSymLinks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)allowedISTSignedComponents
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllowedISTSignedComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (WhitelistChecker)whitelistChecker
{
  return (WhitelistChecker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWhitelistChecker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)itemBeingInstalled
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItemBeingInstalled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)checkType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCheckType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)settingsComponentNames
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSettingsComponentNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableSet)blocklistedItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBlocklistedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocklistedItems, 0);
  objc_storeStrong((id *)&self->_settingsComponentNames, 0);
  objc_storeStrong((id *)&self->_checkType, 0);
  objc_storeStrong((id *)&self->_itemBeingInstalled, 0);
  objc_storeStrong((id *)&self->_whitelistChecker, 0);
  objc_storeStrong((id *)&self->_allowedISTSignedComponents, 0);
  objc_storeStrong((id *)&self->_allowedSymLinks, 0);
  objc_storeStrong((id *)&self->_segmentedManifestWithRigorousFlag, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Loading Domains.plist failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "No certificates found in the manifest.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "rigorousTesting failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: No matching certificate for %{public}@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Manifest contains UAT component on prodFused device.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "Failed to parse payload for item: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)verifyManifestSignature:forDataSectionKeys:withOptions:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: signature type for certificate %{public}@ does not exist", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: cannot find certificates, or certificate format not correct.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: cannot find certificates, certificates list empty.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)verifyManifestSignature:(uint64_t)a3 forDataSectionKeys:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Certificate not valid.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)checkFileForEntitlements:forCorrespondingManifestEntry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "Could not locate the file:%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)checkFileForEntitlements:(os_log_t)log forCorrespondingManifestEntry:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  v3 = 1024;
  v4 = 0;
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "%s:There is unexpected invalid signature/entitlements:%08x", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)checkFileForEntitlements:forCorrespondingManifestEntry:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s Could not find a data container for:%{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)checkFileForEntitlements:forCorrespondingManifestEntry:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: %{public}@ section is not a dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyForStrongSigning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot create policy.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot create policy.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyAppleISTSigning:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Can not load appleIST leaf certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createPublicKeyAppleISTSigning:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Can not load appleIST intermediate certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot load certificate data.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot load certificate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyAppleISTSigning:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a2, a3, "CN did not match for appleIST.:%{public}@\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyAppleISTSigning:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "OU did not match for appleIST cert.:%{public}@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKeyAppleISTSigning:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "appleIST certificate count is unexpected\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createPublicKeyForDevelopmentSigningStandard:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot create policy.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKey:usingPolicy:anchors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: certificate trust evaluation failed: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKey:(uint64_t)a3 usingPolicy:(uint64_t)a4 anchors:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot extract public key.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKey:usingPolicy:anchors:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Cannot evaluate trust: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKey:usingPolicy:anchors:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Cannot set anchor certificates: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createPublicKey:usingPolicy:anchors:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Cannot create secure trust object: %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __60__MSDDemoManifestCheck_createPublicKey_usingPolicy_anchors___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot load certificate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)verifySignature:(int)a1 forData:(NSObject *)a2 withKey:.cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_213A7E000, a2, OS_LOG_TYPE_DEBUG, "%s: Failed in verifying signature(%d)", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)verifySignature:forData:withKey:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_213A7E000, v0, OS_LOG_TYPE_DEBUG, "verifySignature is called", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)isManualSigning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Certificate array in wrong format.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isManualSigning:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Cannot load certificate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)validateISTSignedApp:manifest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Apps signed by IS&T can only have Provisioning Profiles dependency.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)secureManifestCheckForSegmentedManifest:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Passed a null manifest for security checks", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)secureManifestCheckForSegmentedManifest:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Security checks failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runSecurityCheck:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Security checks failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 40);
  v4 = 136315650;
  v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  v6 = 2114;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "%s: Failed rigorous check for:%{public}@ (from %{public}@)", (uint8_t *)&v4, 0x20u);
}

void __41__MSDDemoManifestCheck_runSecurityCheck___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "Apple IST certificate is used to sign %{public}@ unexpected component", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runSettingsSecurityCheckForSection:component:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runSettingsSecurityCheckForSection:component:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runSettingsSecurityCheckForSection:component:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runSettingsSecurityCheckForSection:component:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "Component %{public}@ is not a Settings component", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "File attributes are nil for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Whitelist checker failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "System container check failed for file:%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.5()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_3_0(&dword_213A7E000, v1, (uint64_t)v1, "File permissions failed for file:%{public}@(%ld)", v2);
  OUTLINED_FUNCTION_1();
}

- (void)runFileSecurityChecksForSection:dataType:options:.cold.6()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_3_0(&dword_213A7E000, v1, (uint64_t)v1, "Not a valid fileType (%{public}@) for file: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)runAppLayoutSecurityCheck:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "IS&T signed component in wrong format (no manifest) for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runAppLayoutSecurityCheck:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "IS&T signed component in wrong format (symlink target) for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isValidDataContainerFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "Failed to get path components for file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isValidDataContainerFile:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, v0, v1, "Invalid data container file. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
