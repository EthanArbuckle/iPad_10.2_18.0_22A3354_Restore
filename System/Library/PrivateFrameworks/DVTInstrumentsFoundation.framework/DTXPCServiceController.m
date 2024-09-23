@implementation DTXPCServiceController

+ (id)sharedInstance
{
  if (qword_25576FBC0 != -1)
    dispatch_once(&qword_25576FBC0, &unk_24EB27950);
  return (id)qword_25576FBC8;
}

- (DTXPCServiceController)init
{
  DTXPCServiceController *v2;
  uint64_t v3;
  NSMutableDictionary *registrationDictsByPid;
  dispatch_queue_t v5;
  OS_dispatch_queue *guard;
  dispatch_queue_t v7;
  OS_dispatch_queue *execMonitorQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DTXPCServiceController;
  v2 = -[DTXPCServiceController init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    registrationDictsByPid = v2->_registrationDictsByPid;
    v2->_registrationDictsByPid = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("XPCServiceController guard", 0);
    guard = v2->_guard;
    v2->_guard = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("XPCServiceController exec monitor", 0);
    execMonitorQueue = v2->_execMonitorQueue;
    v2->_execMonitorQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)releaseAssertionsMadeByClient:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (sub_222B7B4D8() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2112;
    v9 = v3;
    v4 = v7;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@ releasing active assertions taken on behalf of client %@", (uint8_t *)&v6, 0x16u);

  }
  if (v3)
  {
    +[DTAssertionManager sharedInstance](DTAssertionManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeClaimsHeldByClient:", v3);

  }
}

- (void)registerClient:(id)a3 forXPCService:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  id v14;
  void (**v15)(id, id, _QWORD, uint64_t, uint64_t, void *);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  int v47;
  NSObject *guard;
  id v49;
  id v50;
  void (**v51)(id, id, _QWORD, uint64_t, uint64_t, void *);
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  char v63;
  _QWORD *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  int v73;
  NSObject *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  char v119;
  char v120;
  id v121;
  id v122;
  void *v123;
  char v124;
  id v125;
  int v126;
  int v127;
  DTXPCServiceController *v128;
  int v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void (**v133)(id, id, _QWORD, uint64_t, uint64_t, void *);
  id v134;
  id v135;
  uint64_t v136;
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  int v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  char v146;
  id v147[5];
  id v148;
  id v149;
  id v150;
  DTXPCServiceController *v151;
  id v152;
  id v153;
  id v154;
  int v155;
  char v156;
  char v157;
  char v158;
  _QWORD v159[2];
  void (*v160)(uint64_t, pid_t);
  void *v161;
  id v162;
  id v163;
  _QWORD aBlock[5];
  id v165;
  id v166;
  void (**v167)(id, id, _QWORD, uint64_t, uint64_t, void *);
  int v168;
  _QWORD block[5];
  id v170;
  id v171;
  id v172;
  id v173;
  uint64_t *v174;
  _BYTE *v175;
  void **v176;
  int v177;
  int v178;
  char v179;
  char v180;
  char v181;
  char v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  id v188;
  id v189;
  size_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  char v206;
  void *v207;
  void **v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  void (*v211)(uint64_t);
  id v212;
  _BYTE buf[24];
  uint64_t (*v214)(uint64_t, uint64_t);
  void (*v215)(uint64_t);
  id v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint8_t v221[128];
  _BYTE v222[24];
  uint64_t v223;

  v223 = *MEMORY[0x24BDAC8D0];
  v137 = a3;
  v138 = a4;
  v134 = a5;
  v135 = a6;
  v14 = a7;
  v15 = (void (**)(id, id, _QWORD, uint64_t, uint64_t, void *))a8;
  if (v15)
  {
    v128 = self;
    v133 = v15;
    v16 = v138;
    v127 = sub_222B7B4D8();
    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_KillExistingKey[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v17, "isEqualToNumber:", MEMORY[0x24BDBD1C0]);

    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_RequestingPidKey[0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v18, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_OnceOnlyKey[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_EnableExtensionKey[0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v20, "isEqualToNumber:", MEMORY[0x24BDBD1C8]);

    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_DisableMemoryLimitsKey[0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v21, "isEqualToNumber:", MEMORY[0x24BDBD1C8]);

    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_AppExtensionHoldContainerBundleIDKey[0]);
    v131 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", DTProcessControlServiceOption_AppExtensionHoldContainerURLKey);
    v136 = objc_claimAutoreleasedReturnValue();
    if (!v129)
    {
      v130 = 0;
      goto LABEL_46;
    }
    if (!(v131 | v136))
    {
      v130 = 0;
      v136 = 0;
      goto LABEL_46;
    }
    objc_msgSend(MEMORY[0x24BE72FB8], "defaultManager");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      v189 = 0;
      objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v131, 0, &v189);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v189;
      objc_msgSend(v22, "URL");
      v24 = objc_claimAutoreleasedReturnValue();

      v136 = v24;
      if (v23)
        goto LABEL_19;
    }
    else
    {
      v23 = 0;
    }
    if (v136)
    {
      v117 = v23;
      if (v127 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v136;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Hold Start %@:%@", buf, 0x16u);
      }
      v188 = 0;
      objc_msgSend(v123, "holdPlugInsInApplication:withError:", v136, &v188);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v188;
      v25 = v127;
      if (!v121)
        v25 = 0;
      if (v25 == 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v121;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Hold Error: %@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v136);
        v116 = (id)objc_claimAutoreleasedReturnValue();
        v186 = 0u;
        v187 = 0u;
        v184 = 0u;
        v185 = 0u;
        objc_msgSend(v116, "builtInPlugInsURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "relativePath");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "URLsForResourcesWithExtension:subdirectory:", CFSTR("appex"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v184, v221, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v185;
LABEL_26:
          v31 = 0;
          while (1)
          {
            if (*(_QWORD *)v185 != v30)
              objc_enumerationMutation(v28);
            v32 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v31);
            objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "bundleIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqualToString:", v16);

            if ((v35 & 1) != 0)
              break;
            if (v29 == ++v31)
            {
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v184, v221, 16);
              if (v29)
                goto LABEL_26;
              goto LABEL_32;
            }
          }
          v36 = v32;

          if (!v36)
            goto LABEL_42;
          if (v127 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v16;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Terminate %@:%@", buf, 0x16u);
          }
          v183 = 0;
          objc_msgSend(v123, "terminatePlugInAtURL:withError:", v36, &v183);
          v37 = v183;
          if (v37 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v121;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DTXPCServiceController: ExtensionAssertion Terminate Error: %@", buf, 0xCu);
          }

        }
        else
        {
LABEL_32:
          v36 = v28;
        }

LABEL_42:
      }
      v23 = v117;
      goto LABEL_45;
    }
LABEL_19:
    v121 = 0;
    if (v23)
    {
      v130 = 0;
      if (v127)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v23;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: Error retrieving LSApplicationRecord for %@, %@", buf, 0x16u);
        }
        v121 = 0;
        v130 = 0;
      }
    }
    else
    {
      v130 = 0;
    }
LABEL_45:

LABEL_46:
    v38 = objc_msgSend(v16, "containsString:", CFSTR("LaunchDaemons"));
    v124 = objc_msgSend(v16, "containsString:", CFSTR("LaunchAgents"));
    objc_msgSend(v16, "pathExtension");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("plist"));

    if (!v40)
    {
      v45 = 0;
      v122 = 0;
      v46 = v16;
      goto LABEL_55;
    }
    if ((DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
    {
      v56 = (void *)MEMORY[0x24BDD1540];
      v207 = (void *)*MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Daemon profiling is not supported on customer installations."));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v57;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v207, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v58);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_112:
      if (v44)
      {
        v133[2](v133, v16, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v44);
        goto LABEL_114;
      }
      v132 = 0xFFFFFFFFLL;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v16);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("Label"));
      v45 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("Program"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v109;
      if (v109)
      {
        v122 = v109;
      }
      else
      {
        objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("ProgramArguments"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "firstObject");
        v122 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v45)
      {
        v112 = (void *)MEMORY[0x24BDD1540];
        v219 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load plist for launchd job with path: %@"), 0);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v220 = v113;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v220, &v219, 1);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v133[2](v133, 0, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v115);

        v16 = v122;
        v44 = v108;
        goto LABEL_114;
      }

      v46 = v45;
LABEL_55:
      if (objc_msgSend(v46, "hasPrefix:", CFSTR("com.apple."))
        && (DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
      {
        v81 = (void *)MEMORY[0x24BDD1540];
        v217 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC service is restricted: %@"), v46);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = v82;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v218, &v217, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v133[2](v133, v46, 0, v132, 0xFFFFFFFFLL, v84);

        v44 = v45;
        v16 = v46;
LABEL_114:

        v15 = v133;
        goto LABEL_115;
      }
      if ((_DWORD)v132 == -1)
        v47 = 3;
      else
        v47 = 1;
      v118 = v14;
      if (sub_222B7B4D8() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v47;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v46;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v132 & ~((int)v132 >> 31);
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: calling xpc_service_create: serviceType=%d, identifier=%@, pid %d", buf, 0x18u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v214 = sub_222B7CCA0;
      v215 = sub_222B7CCB0;
      v216 = 0;
      v207 = 0;
      v208 = &v207;
      v209 = 0x3032000000;
      v210 = sub_222B7CCA0;
      v211 = sub_222B7CCB0;
      v212 = 0;
      v203 = 0;
      v204 = &v203;
      v205 = 0x2020000000;
      v206 = 0;
      guard = v128->_guard;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222B7CCB8;
      block[3] = &unk_24EB2A438;
      block[4] = v128;
      v49 = v46;
      v170 = v49;
      v177 = v132;
      v50 = v137;
      v171 = v50;
      v174 = &v203;
      v179 = 1;
      v180 = v38;
      v181 = v124;
      v51 = v133;
      v173 = v51;
      v125 = v45;
      v172 = v125;
      v175 = buf;
      v178 = v47;
      v176 = &v207;
      v182 = v126;
      dispatch_sync(guard, block);
      if (*((_BYTE *)v204 + 24))
      {
        v52 = (void *)MEMORY[0x24BDD1540];
        v201 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC service name %@ already under observation for pid: %d"), v49, v132);
        v14 = v118;
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v202 = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2](v51, v49, 0, v132, 0xFFFFFFFFLL, v55);

LABEL_108:
        _Block_object_dispose(&v203, 8);
        _Block_object_dispose(&v207, 8);

        _Block_object_dispose(buf, 8);
        v16 = v49;
        v44 = v125;
        goto LABEL_114;
      }
      v14 = v118;
      if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && !v208[5])
      {
        v98 = (void *)MEMORY[0x24BDD1540];
        v199 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create xpc registration object."));
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v200 = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v54);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2](v51, v49, 0, v132, 0xFFFFFFFFLL, v99);

        goto LABEL_108;
      }
      v53 = _Block_copy(v51);
      if (v126)
      {
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_222B7D1E8;
        aBlock[3] = &unk_24EB2A488;
        v167 = v51;
        aBlock[4] = v128;
        v165 = v50;
        v166 = v49;
        v168 = v132;
        v59 = _Block_copy(aBlock);

        v53 = v59;
      }
      v60 = v132;
      v61 = (void *)MEMORY[0x24BDAC760];
      v62 = v125;
      if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v85 = v208[5];
        if (v85)
        {
          v86 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
          v139[0] = MEMORY[0x24BDAC760];
          v139[1] = 3221225472;
          v139[2] = sub_222B7DF9C;
          v139[3] = &unk_24EB2A5A0;
          v53 = v53;
          v140 = v53;
          v141 = v132;
          if (authorized_xpc_attach(v85, 0, v86, (uint64_t)v134, (uint64_t)v135, (uint64_t)v118, v139))
          {
            v87 = (void *)MEMORY[0x24BDD1540];
            v193 = *MEMORY[0x24BDD0FC8];
            v88 = (void *)MEMORY[0x24BDD17C8];
            v89 = objc_retainAutorelease(v49);
            objc_msgSend(v88, "stringWithFormat:", CFSTR("Unable to use privileged helper to register for xpc-based launch: %s (parent: %d)"), objc_msgSend(v89, "UTF8String"), v132);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = v90;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, id, _QWORD, uint64_t, uint64_t, void *))v53 + 2))(v53, v89, 0, v132, 0xFFFFFFFFLL, v92);

          }
          v54 = v140;
        }
        else
        {
          v100 = (void *)MEMORY[0x24BDD1540];
          v191 = *MEMORY[0x24BDD0FC8];
          v101 = (void *)MEMORY[0x24BDD17C8];
          v102 = objc_retainAutorelease(v49);
          objc_msgSend(v101, "stringWithFormat:", CFSTR("Unable to register for xpc-based launch: %s (parent: %d)"), objc_msgSend(v102, "UTF8String"), v132);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v192 = v54;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, id, _QWORD, uint64_t, uint64_t, void *))v53 + 2))(v53, v102, 0, v132, 0xFFFFFFFFLL, v104);

        }
        goto LABEL_108;
      }
      v63 = v120;
      if ((int)v132 > 0)
        v63 = 1;
      if ((v63 & 1) == 0)
      {
        v159[0] = MEMORY[0x24BDAC760];
        v159[1] = 3221225472;
        v160 = sub_222B7D2AC;
        v161 = &unk_24EB2A4B0;
        v162 = v122;
        v163 = v49;
        v64 = v159;
        v190 = 0;
        *(_DWORD *)&v222[8] = 0;
        *(_QWORD *)v222 = 0xE00000001;
        sysctl((int *)v222, 3u, 0, &v190, 0, 0);
        v190 += 50;
        v65 = (char *)malloc_type_calloc(1uLL, v190, 0xF47FF19uLL);
        if (!sysctl((int *)v222, 3u, v65, &v190, 0, 0) && (int)(v190 / 0x288) >= 1)
        {
          v66 = (v190 / 0x288);
          v67 = v65 + 243;
          do
          {
            v68 = (void *)MEMORY[0x227679C5C]();
            ((void (*)(_QWORD *, _QWORD, char *, _QWORD, _QWORD))v160)(v64, *(unsigned int *)(v67 - 203), v67, *(unsigned int *)(v67 + 153), *(unsigned int *)(v67 + 161));
            objc_autoreleasePoolPop(v68);
            v67 += 648;
            --v66;
          }
          while (v66);
        }
        free(v65);

        v60 = v132;
        v62 = v125;
        v61 = (void *)MEMORY[0x24BDAC760];
      }
      v147[1] = v61;
      v147[2] = (id)3221225472;
      v147[3] = sub_222B7D41C;
      v147[4] = &unk_24EB2A528;
      v156 = v127;
      v69 = v49;
      v148 = v69;
      v149 = v118;
      v157 = v119;
      v70 = v50;
      v150 = v70;
      v151 = v128;
      v152 = v134;
      v153 = v135;
      v53 = v53;
      v154 = v53;
      v155 = v60;
      v158 = v120 ^ 1;
      xpc_service_set_attach_handler();
      if (v130)
      {
        if (v127 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v222 = 138412290;
          *(_QWORD *)&v222[4] = v69;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Release Start %@", v222, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BE72FB8], "defaultManager");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v147[0] = 0;
        objc_msgSend(v71, "releaseHold:withError:", v130, v147);
        v72 = v147[0];

        v73 = v127;
        if (!v72)
          v73 = 0;
        if (v73 == 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v222 = 138412290;
          *(_QWORD *)&v222[4] = v72;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Release Error: %@", v222, 0xCu);
        }

        v60 = v132;
        v62 = v125;
      }
      if (v62)
      {
        if (!xpc_service_kickstart_with_flags())
        {
LABEL_105:

          v54 = v148;
          goto LABEL_108;
        }
        if (v127)
        {
          v74 = MEMORY[0x24BDACB70];
          v75 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v76 = xpc_strerror();
            *(_DWORD *)v222 = 136315138;
            *(_QWORD *)&v222[4] = v76;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "xpc_service_kickstart_with_flags error: %s", v222, 0xCu);
          }

          v60 = v132;
        }
        v77 = (void *)MEMORY[0x24BDD1540];
        v197 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to launch: %@ (parent: %d) Error: %s"), v69, v60, xpc_strerror());
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = v78;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 3, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, _QWORD, uint64_t, uint64_t, void *))v53 + 2))(v53, v69, 0, v60, 0xFFFFFFFFLL, v80);

      }
      else
      {
        if (!objc_msgSend(v69, "length") || !v129)
          goto LABEL_105;
        objc_msgSend(MEMORY[0x24BE72FB0], "defaultHost");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v195 = *MEMORY[0x24BE72FC8];
        v196 = v69;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v144[0] = MEMORY[0x24BDAC760];
        v144[1] = 3221225472;
        v144[2] = sub_222B7DD78;
        v144[3] = &unk_24EB2A550;
        v95 = v69;
        v145 = v95;
        v146 = v129;
        objc_msgSend(v93, "continuouslyDiscoverPlugInsForAttributes:flags:found:", v94, 512, v144);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        v142[0] = MEMORY[0x24BDAC760];
        v142[1] = 3221225472;
        v142[2] = sub_222B7DF40;
        v142[3] = &unk_24EB2A578;
        v97 = v96;
        v143 = v97;
        -[DTXPCServiceController _registryModify:identifier:parent:client:block:](v128, "_registryModify:identifier:parent:client:block:", 1, v95, v132, v70, v142);

        v78 = v145;
      }

      goto LABEL_105;
    }
    *(_QWORD *)buf = 1024;
    v41 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 1024));
    if (sysctlbyname("kern.bootargs", (void *)objc_msgSend(v41, "mutableBytes"), (size_t *)buf, 0, 0))
    {
      perror("sysctlbyname(\"kern.bootargs\",...)");
      v43 = 0;
    }
    else
    {
      objc_msgSend(v41, "setLength:", *(_QWORD *)buf);
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v41, 4);
      v43 = v42;
      if (v42
        && (objc_msgSend(v42, "rangeOfString:", CFSTR("amfi_unrestrict_task_for_pid=1")) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend(v43, "rangeOfString:", CFSTR("amfi=3")) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend(v43, "rangeOfString:", CFSTR("amfi_get_out_of_my_way=1")) != 0x7FFFFFFFFFFFFFFFLL))
      {
        v44 = 0;
LABEL_111:

        goto LABEL_112;
      }
    }
    v105 = (void *)MEMORY[0x24BDD1540];
    v203 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("amfi_unrestrict_task_for_pid=1 is required in your boot-args to profile daemons or agents."));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = v106;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v207, &v203, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v107);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_111;
  }
LABEL_115:

}

- (int)_configureInstance:(id)a3 identifier:(id)a4 servicePid:(int)a5 environment:(id)a6 arguments:(id)a7 options:(id)a8
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  char v15;
  _BOOL4 ShouldCaptureOutputWithOptions;
  void *v17;
  int v18;
  xpc_object_t v19;
  id v20;
  int v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = a8;
  v13 = sub_222B7B4D8();
  objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_LeaveSuspendedKey[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToNumber:", MEMORY[0x24BDBD1C0]);

  ShouldCaptureOutputWithOptions = DTProcessShouldCaptureOutputWithOptions(v12);
  objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_DisableMemoryLimitsKey[0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "isEqualToNumber:", MEMORY[0x24BDBD1C8]);
  if (v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "xpc_service_instance_is_configurable(): true", buf, 2u);
  }
  if (objc_msgSend(v11, "count"))
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_222B7E2DC;
    v23[3] = &unk_24EB2A5C8;
    v24 = v19;
    v20 = v19;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v23);
    xpc_service_instance_set_environment();

  }
  if (ShouldCaptureOutputWithOptions && !pipe((int *)buf))
  {
    xpc_service_instance_dup2();
    xpc_service_instance_dup2();
    v21 = *(_DWORD *)buf;
    close(v26);
    fcntl(v21, 2, 1);
    if ((v15 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v21 = -1;
    if ((v15 & 1) != 0)
    {
LABEL_9:
      if (v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "xpc launch: started *not* suspended", buf, 2u);
      }
      goto LABEL_17;
    }
  }
  if (v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "xpc launch: starting suspended", buf, 2u);
  }
  xpc_service_instance_set_start_suspended();
LABEL_17:
  if (v18)
    xpc_service_instance_set_jetsam_properties();

  return v21;
}

- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  sub_222B7B4D8();
  v17 = objc_retainAutorelease(v12);
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)xpc_service_create_from_specifier();
  if (v18)
  {
    v23 = v17;
    v24 = v14;
    v25 = v15;
    v28 = v16;
    v26 = v13;
    v27 = v18;
    xpc_service_set_attach_handler();
    xpc_service_kickstart_with_flags();

  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to find service with specifier '%@'."), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DTXPCServiceController"), 1, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, _QWORD, uint64_t, void *))v16 + 2))(v16, v17, 0, 0, 0xFFFFFFFFLL, v22);

  }
}

- (void)_registryModify:(BOOL)a3 identifier:(id)a4 parent:(int)a5 client:(id)a6 block:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  _QWORD aBlock[5];
  id v21;
  id v22;
  id v23;
  int v24;

  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222B7E89C;
  aBlock[3] = &unk_24EB2A640;
  aBlock[4] = self;
  v15 = v13;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v24 = a5;
  v17 = v14;
  v23 = v17;
  v18 = (void (**)(_QWORD))_Block_copy(aBlock);
  v19 = v18;
  if (v10)
    dispatch_sync((dispatch_queue_t)self->_guard, v18);
  else
    v18[2](v18);

}

- (void)_matchRemove:(id)a3
{
  id v4;
  NSMutableDictionary *registrationDictsByPid;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  registrationDictsByPid = self->_registrationDictsByPid;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B7EB34;
  v7[3] = &unk_24EB2A690;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](registrationDictsByPid, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)unregisterClient:(id)a3 withIdentifier:(id)a4 parent:(int)a5
{
  id v8;
  id v9;
  NSObject *guard;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a4;
  guard = self->_guard;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B7EE90;
  block[3] = &unk_24EB29800;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(guard, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_execMonitorQueue, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_registrationDictsByPid, 0);
}

@end
