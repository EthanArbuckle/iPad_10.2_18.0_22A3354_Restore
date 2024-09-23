@implementation CoreDAVDiscoveryTaskGroup

- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 httpPorts:(id)a5 httpsPorts:(id)a6 httpServiceString:(id)a7 httpsServiceString:(id)a8 wellKnownPath:(id)a9 potentialContextPaths:(id)a10 requiredComplianceClass:(id)a11
{
  id v18;
  CoreDAVDiscoveryTaskGroup *v19;
  uint64_t v20;
  NSString *requiredComplianceClass;
  NSMutableArray *v22;
  NSMutableArray *discoveries;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)CoreDAVDiscoveryTaskGroup;
  v19 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v31, sel_initWithAccountInfoProvider_taskManager_, a3, a4);
  if (v19)
  {
    objc_msgSend(v18, "lowercaseString", v25, v26, v27, v28, v29, v30);
    v20 = objc_claimAutoreleasedReturnValue();
    requiredComplianceClass = v19->_requiredComplianceClass;
    v19->_requiredComplianceClass = (NSString *)v20;

    objc_storeStrong((id *)&v19->_httpPorts, a5);
    objc_storeStrong((id *)&v19->_httpsPorts, a6);
    objc_storeStrong((id *)&v19->_httpServiceString, a7);
    objc_storeStrong((id *)&v19->_httpsServiceString, a8);
    objc_storeStrong((id *)&v19->_wellKnownPath, a9);
    objc_storeStrong((id *)&v19->_potentialContextPaths, a10);
    v19->_didReceiveAuthenticationError = 0;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    discoveries = v19->_discoveries;
    v19->_discoveries = v22;

  }
  return v19;
}

- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 httpPorts:(id)a5 httpsPorts:(id)a6 httpServiceString:(id)a7 httpsServiceString:(id)a8 wellKnownPaths:(id)a9 requiredComplianceClass:(id)a10
{
  return -[CoreDAVDiscoveryTaskGroup initWithAccountInfoProvider:taskManager:httpPorts:httpsPorts:httpServiceString:httpsServiceString:wellKnownPath:potentialContextPaths:requiredComplianceClass:](self, "initWithAccountInfoProvider:taskManager:httpPorts:httpsPorts:httpServiceString:httpsServiceString:wellKnownPath:potentialContextPaths:requiredComplianceClass:", a3, a4, a5, a6, a7, a8, 0, a9, a10);
}

- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CoreDAVDiscoveryTaskGroup *v12;

  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "cdvArrayWithIntegers:", 80, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "cdvArrayWithIntegers:", 443, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CoreDAVDiscoveryTaskGroup initWithAccountInfoProvider:taskManager:httpPorts:httpsPorts:httpServiceString:httpsServiceString:wellKnownPath:potentialContextPaths:requiredComplianceClass:](self, "initWithAccountInfoProvider:taskManager:httpPorts:httpsPorts:httpServiceString:httpsServiceString:wellKnownPath:potentialContextPaths:requiredComplianceClass:", v8, v7, v9, v10, 0, 0, 0, v11, 0);

  return v12;
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__CoreDAVDiscoveryTaskGroup_taskGroupWillCancelWithError___block_invoke;
  v6[3] = &unk_24C1D9AB8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v5, v6);

}

void __58__CoreDAVDiscoveryTaskGroup_taskGroupWillCancelWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveryTask:gotAccountInfo:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

- (void)cancelTaskGroup
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_discoveries;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setShouldFailAllTasks:", 1);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CoreDAVDiscoveryTaskGroup;
  -[CoreDAVTaskGroup cancelTaskGroup](&v8, sel_cancelTaskGroup);
}

- (void)startTaskGroup
{
  void *v3;
  void *p_accountInfoProvider;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  CoreDAVDiscoveryAccountInfo *v10;
  id v11;
  CoreDAVDiscoveryAccountInfo *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  CoreDAVDiscoveryAccountInfo *v19;
  id v20;
  CoreDAVDiscoveryAccountInfo *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  NSString **v36;
  NSString *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  CoreDAVDiscoveryAccountInfo *v81;
  id v82;
  CoreDAVDiscoveryAccountInfo *v83;
  void *v84;
  id v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSMutableArray *obj;
  id obja;
  NSString **p_httpsServiceString;
  CoreDAVDiscoveryTaskGroup *v107;
  NSString **p_httpServiceString;
  id v109;
  id *location;
  _QWORD v111[5];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[5];
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint8_t v139[128];
  uint8_t buf[4];
  const char *v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  void *v145;
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_accountInfoProvider = &self->super._accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
    _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_INFO, "%s - Started", buf, 0xCu);
  }

  v107 = self;
  p_httpServiceString = &self->_httpServiceString;
  location = (id *)&self->super._accountInfoProvider;
  if (!self->_httpServiceString && !self->_httpsServiceString)
  {
    v42 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v42, "serverRoot");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(WeakRetained, "serverRoot");
      p_accountInfoProvider = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(p_accountInfoProvider, "length"))
        goto LABEL_42;
    }
    -[CoreDAVDiscoveryTaskGroup wellKnownPath](self, "wellKnownPath");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[CoreDAVDiscoveryTaskGroup wellKnownPath](self, "wellKnownPath");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");

      if (v43)
      {

      }
      self = v107;
      if (v46)
      {
        v47 = location;
        v48 = objc_loadWeakRetained(location);
        objc_msgSend(v48, "scheme");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = v49;
        if (v49 && objc_msgSend(v49, "length"))
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("https"), CFSTR("http"), 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        obja = v50;
        v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v127, v138, 16);
        if (v102)
        {
          v101 = *(_QWORD *)v128;
          do
          {
            v71 = 0;
            do
            {
              if (*(_QWORD *)v128 != v101)
                objc_enumerationMutation(obja);
              v103 = v71;
              v72 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v71);
              v123 = 0u;
              v124 = 0u;
              v125 = 0u;
              v126 = 0u;
              v73 = objc_loadWeakRetained(v47);
              objc_msgSend(v72, "lowercaseString");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVDiscoveryTaskGroup allDiscoveryPorts:withScheme:](self, "allDiscoveryPorts:withScheme:", v73, v74);
              v75 = (void *)objc_claimAutoreleasedReturnValue();

              v109 = v75;
              v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
              if (v76)
              {
                v77 = v76;
                v78 = *(_QWORD *)v124;
                do
                {
                  for (i = 0; i != v77; ++i)
                  {
                    if (*(_QWORD *)v124 != v78)
                      objc_enumerationMutation(v109);
                    v80 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
                    v81 = [CoreDAVDiscoveryAccountInfo alloc];
                    v82 = objc_loadWeakRetained(v47);
                    v83 = -[CoreDAVDiscoveryAccountInfo initWithAccountInfoProvider:](v81, "initWithAccountInfoProvider:", v82);

                    -[CoreDAVDiscoveryAccountInfo setScheme:](v83, "setScheme:", v72);
                    -[CoreDAVDiscoveryAccountInfo setPort:](v83, "setPort:", objc_msgSend(v80, "integerValue"));
                    -[CoreDAVDiscoveryAccountInfo setStarted:](v83, "setStarted:", 1);
                    -[NSMutableArray addObject:](self->_discoveries, "addObject:", v83);
                    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v85 = objc_loadWeakRetained(v47);
                    objc_msgSend(v84, "logHandleForAccountInfoProvider:", v85);
                    v86 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v86)
                    {
                      v87 = v86;
                      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                      {
                        v88 = -[NSMutableArray count](self->_discoveries, "count") - 1;
                        -[CoreDAVDiscoveryAccountInfo url](v83, "url");
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 136315650;
                        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
                        v142 = 2048;
                        v143 = v88;
                        self = v107;
                        v144 = 2112;
                        v145 = v89;
                        _os_log_impl(&dword_209602000, v87, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);

                      }
                    }

                    v47 = location;
                  }
                  v77 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
                }
                while (v77);
              }

              v71 = v103 + 1;
            }
            while (v103 + 1 != v102);
            v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v127, v138, 16);
          }
          while (v102);
        }
        v41 = obja;

        if (-[NSMutableArray count](self->_discoveries, "count"))
        {
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v90 = self->_discoveries;
          v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v119, v136, 16);
          if (v91)
          {
            v92 = v91;
            v93 = *(_QWORD *)v120;
            do
            {
              for (j = 0; j != v92; ++j)
              {
                if (*(_QWORD *)v120 != v93)
                  objc_enumerationMutation(v90);
                v95 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
                objc_msgSend(v95, "serverRoot");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreDAVDiscoveryTaskGroup wellKnownPath](self, "wellKnownPath");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "setServerRoot:", v97);

                objc_msgSend(v95, "url");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "setServerRoot:", v96);
                -[CoreDAVDiscoveryTaskGroup startWellKnownLocationTask:withURL:](self, "startWellKnownLocationTask:withURL:", v95, v98);

              }
              v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v119, v136, 16);
            }
            while (v92);
            v41 = obja;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v117[0] = MEMORY[0x24BDAC760];
          v117[1] = 3221225472;
          v117[2] = __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke;
          v117[3] = &unk_24C1D9AB8;
          v117[4] = self;
          v118 = v99;
          v90 = v99;
          -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v90, v117);

        }
        v65 = v100;
LABEL_92:

        goto LABEL_31;
      }
LABEL_44:
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_loadWeakRetained(location);
      objc_msgSend(v51, "logHandleForAccountInfoProvider:", v52);
      v53 = objc_claimAutoreleasedReturnValue();

      if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
        _os_log_impl(&dword_209602000, v53, OS_LOG_TYPE_INFO, "%s - Attempting PROPFIND", buf, 0xCu);
      }

      v54 = objc_loadWeakRetained(location);
      objc_msgSend(v54, "scheme");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = (__CFString *)objc_loadWeakRetained(location);
      v57 = v56;
      if (v55)
      {
        -[__CFString scheme](v56, "scheme");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "lowercaseString");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = CFSTR("https");
        if ((objc_msgSend(v59, "isEqualToString:", CFSTR("https")) & 1) == 0)
        {
          v61 = objc_loadWeakRetained(location);
          objc_msgSend(v61, "scheme");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "lowercaseString");
          v60 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        }
        v63 = objc_loadWeakRetained(location);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v60);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVDiscoveryTaskGroup setupDiscoveries:withSchemes:](self, "setupDiscoveries:withSchemes:", v63, v64);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = (__CFString *)v60;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("https"), CFSTR("http"), 0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVDiscoveryTaskGroup setupDiscoveries:withSchemes:](self, "setupDiscoveries:withSchemes:", v57, v63);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (objc_msgSend(v41, "count"))
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v65 = v41;
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
        if (v66)
        {
          v67 = v66;
          v68 = *(_QWORD *)v114;
          do
          {
            for (k = 0; k != v67; ++k)
            {
              if (*(_QWORD *)v114 != v68)
                objc_enumerationMutation(v65);
              -[CoreDAVDiscoveryTaskGroup startPropfindTask:](self, "startPropfindTask:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * k));
            }
            v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
          }
          while (v67);
        }
        v41 = v65;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = MEMORY[0x24BDAC760];
        v111[1] = 3221225472;
        v111[2] = __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke_268;
        v111[3] = &unk_24C1D9AB8;
        v111[4] = self;
        v112 = v70;
        v65 = v70;
        -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v65, v111);

      }
      goto LABEL_92;
    }

    if (v43)
    {
LABEL_42:

    }
    goto LABEL_44;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v7, "logHandleForAccountInfoProvider:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
    _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_INFO, "%s - Attempting SRV lookups first", buf, 0xCu);
  }

  p_httpsServiceString = &self->_httpsServiceString;
  if (self->_httpsServiceString)
  {
    v10 = [CoreDAVDiscoveryAccountInfo alloc];
    v11 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    v12 = -[CoreDAVDiscoveryAccountInfo initWithAccountInfoProvider:](v10, "initWithAccountInfoProvider:", v11);

    -[CoreDAVDiscoveryAccountInfo setScheme:](v12, "setScheme:", CFSTR("https"));
    -[CoreDAVDiscoveryAccountInfo setStarted:](v12, "setStarted:", 1);
    -[NSMutableArray addObject:](self->_discoveries, "addObject:", v12);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v13, "logHandleForAccountInfoProvider:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = -[NSMutableArray count](self->_discoveries, "count") - 1;
        -[CoreDAVDiscoveryAccountInfo url](v12, "url");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
        v142 = 2048;
        v143 = v17;
        v144 = 2112;
        v145 = v18;
        _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);

      }
    }

    p_accountInfoProvider = &self->super._accountInfoProvider;
  }
  if (*p_httpServiceString)
  {
    v19 = [CoreDAVDiscoveryAccountInfo alloc];
    v20 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    v21 = -[CoreDAVDiscoveryAccountInfo initWithAccountInfoProvider:](v19, "initWithAccountInfoProvider:", v20);

    -[CoreDAVDiscoveryAccountInfo setScheme:](v21, "setScheme:", CFSTR("http"));
    -[CoreDAVDiscoveryAccountInfo setStarted:](v21, "setStarted:", 1);
    -[NSMutableArray addObject:](self->_discoveries, "addObject:", v21);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v22, "logHandleForAccountInfoProvider:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = -[NSMutableArray count](self->_discoveries, "count") - 1;
        -[CoreDAVDiscoveryAccountInfo url](v21, "url");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
        v142 = 2048;
        v143 = v26;
        v144 = 2112;
        v145 = v27;
        _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);

      }
    }

  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = self->_discoveries;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v132;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v132 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * m);
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v32, "scheme");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("https")) == 0;
        v36 = p_httpServiceString;
        if (!v35)
          v36 = p_httpsServiceString;
        v37 = *v36;
        v38 = objc_loadWeakRetained(location);
        objc_msgSend(v38, "host");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@%@"), v37, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        -[CoreDAVDiscoveryTaskGroup startSRVLookup:serviceString:](v107, "startSRVLookup:serviceString:", v32, v40);
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
    }
    while (v29);
  }
  v41 = obj;
LABEL_31:

}

void __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveryTask:gotAccountInfo:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

void __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke_268(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveryTask:gotAccountInfo:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

- (id)setupDiscoveries:(id)a3 withSchemes:(id)a4
{
  id v6;
  id v7;
  _UNKNOWN **v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  NSObject *v20;
  _UNKNOWN **v21;
  CoreDAVDiscoveryTaskGroup *v22;
  id v23;
  void *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
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
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v7;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v51;
    v8 = &off_24C1D9000;
    v9 = 0x2545A3000uLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v51 != v27)
        {
          v11 = v10;
          objc_enumerationMutation(obj);
          v10 = v11;
        }
        v29 = v10;
        v36 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v10);
        if ((objc_msgSend(v36, "isEqualToString:", CFSTR("https")) & 1) != 0)
          v40 = 0;
        else
          v40 = objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v9 + 3376)), "count");
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[CoreDAVDiscoveryTaskGroup allDiscoveryPorts:withScheme:](self, "allDiscoveryPorts:withScheme:", v6, v36);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
        if (v33)
        {
          v32 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v47 != v32)
                objc_enumerationMutation(v31);
              v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              -[CoreDAVDiscoveryTaskGroup allDiscoveryPaths:](self, "allDiscoveryPaths:", v6);
              v13 = (id)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
              if (!v39)
                goto LABEL_29;
              v35 = v13;
              v34 = i;
              v13 = 0;
              v37 = *(_QWORD *)v43;
              do
              {
                for (j = 0; j != v39; ++j)
                {
                  v41 = v13;
                  if (*(_QWORD *)v43 != v37)
                    objc_enumerationMutation(v35);
                  v15 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
                  v16 = (void *)objc_msgSend(objc_alloc((Class)v8[49]), "initWithAccountInfoProvider:", v6);
                  objc_msgSend(v16, "setScheme:", v36);
                  objc_msgSend(v16, "setServerRoot:", v15);
                  objc_msgSend(v16, "setPort:", objc_msgSend(v38, "integerValue"));
                  objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v9 + 3376)), "insertObject:atIndex:", v16, v40 + j);
                  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                  objc_msgSend(v17, "logHandleForAccountInfoProvider:", WeakRetained);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v19)
                  {
                    v20 = v19;
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v16, "url");
                      v21 = v8;
                      v22 = self;
                      v23 = v6;
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315650;
                      v55 = "-[CoreDAVDiscoveryTaskGroup setupDiscoveries:withSchemes:]";
                      v56 = 2048;
                      v57 = v40 + j;
                      v58 = 2112;
                      v59 = v24;
                      _os_log_impl(&dword_209602000, v20, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);

                      v6 = v23;
                      self = v22;
                      v8 = v21;
                      v9 = 0x2545A3000;
                    }

                  }
                  v13 = v41;
                  if (!v41)
                    v13 = v16;

                }
                v39 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
                v40 += j;
              }
              while (v39);

              if (v13)
              {
                objc_msgSend(v13, "setStarted:", 1);
                objc_msgSend(v30, "addObject:", v13);
                i = v34;
LABEL_29:

                continue;
              }
              i = v34;
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
          }
          while (v33);
        }

        v10 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v28);
  }

  return v30;
}

- (id)allDiscoveryPorts:(id)a3 withScheme:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "port"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "port"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("https")))
      v10 = 104;
    else
      v10 = 96;
    objc_msgSend(v8, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.isa + v10));
  }

  return v8;
}

- (id)allDiscoveryPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverRoot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "serverRoot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);
  }
  else
  {
    -[CoreDAVDiscoveryTaskGroup potentialContextPaths](self, "potentialContextPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);
  }

  return v5;
}

- (void)startSRVLookup:(id)a3 serviceString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  CoreDAVSRVLookupTask *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "-[CoreDAVDiscoveryTaskGroup startSRVLookup:serviceString:]";
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_INFO, "%s - URL: [%@], serviceString: [%@]", (uint8_t *)&v15, 0x20u);

    }
  }

  objc_msgSend(v6, "setStarted:", 1);
  v13 = -[CoreDAVSRVLookupTask initWithServiceString:]([CoreDAVSRVLookupTask alloc], "initWithServiceString:", v7);
  -[CoreDAVTask setDelegate:](v13, "setDelegate:", self);
  -[CoreDAVTask setAccountInfoProvider:](v13, "setAccountInfoProvider:", v6);
  -[CoreDAVTask setTimeoutInterval:](v13, "setTimeoutInterval:", self->super._timeoutInterval);
  if (self->super._isCancelling)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v13, v14);
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v13);
    v14 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v14, "submitIndependentCoreDAVTask:", v13);
  }

}

- (void)startWellKnownLocationTask:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  CoreDAVPropFindTask *v13;
  void *v14;
  CoreDAVPropFindTask *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  CoreDAVDiscoveryTaskGroup *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "-[CoreDAVDiscoveryTaskGroup startWellKnownLocationTask:withURL:]";
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_INFO, "%s - URL: [%@]", buf, 0x16u);

    }
  }

  objc_msgSend(v6, "setStarted:", 1);
  v13 = [CoreDAVPropFindTask alloc];
  -[CoreDAVDiscoveryTaskGroup propFindProperties](self, "propFindProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v13, "initWithPropertiesToFind:atURL:withDepth:", v14, v7, 2);

  -[CoreDAVTask setAccountInfoProvider:](v15, "setAccountInfoProvider:", v6);
  -[CoreDAVTask setTimeoutInterval:](v15, "setTimeoutInterval:", self->super._timeoutInterval);
  objc_initWeak((id *)buf, v15);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __64__CoreDAVDiscoveryTaskGroup_startWellKnownLocationTask_withURL___block_invoke;
  v22 = &unk_24C1D9B08;
  objc_copyWeak(&v26, (id *)buf);
  v23 = self;
  v16 = v6;
  v24 = v16;
  v17 = v7;
  v25 = v17;
  -[CoreDAVTask setCompletionBlock:](v15, "setCompletionBlock:", &v19);
  if (!v17 || self->super._isCancelling)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0, v19, v20, v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v15, v18);
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v15, v19, v20, v21, v22, v23, v24);
    v18 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v18, "submitIndependentCoreDAVTask:", v15);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

void __64__CoreDAVDiscoveryTaskGroup_startWellKnownLocationTask_withURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "responseStatusCode") == 405)
    {
      objc_msgSend(*(id *)(a1 + 32), "startWellKnownFallbackHeadTask:withURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (v3)
      {
        objc_msgSend(v3, "domain");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
        {
          v5 = objc_msgSend(v3, "code");

          if (v5 == 401)
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
            objc_msgSend(v6, "logHandleForAccountInfoProvider:", v7);
            v8 = objc_claimAutoreleasedReturnValue();

            if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v28 = "-[CoreDAVDiscoveryTaskGroup startWellKnownLocationTask:withURL:]_block_invoke";
              _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_INFO, "%s - Bailing early because of 401 on .well-known", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "noteDefinitiveAuthFailureFromTask:", WeakRetained);
            objc_msgSend(*(id *)(a1 + 32), "propFindTaskFinished:", WeakRetained);
            goto LABEL_24;
          }
        }
        else
        {

        }
        v11 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
        objc_sync_enter(v11);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeObject:", *(_QWORD *)(a1 + 40));
        v12 = *(void **)(a1 + 32);
        v13 = *(void **)(a1 + 40);
        v14 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(v13, "scheme");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayWithObject:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setupDiscoveries:withSchemes:", v13, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_sync_exit(v11);
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v23 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(a1 + 32), "startPropfindTask:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v19);
        }

        goto LABEL_24;
      }
      objc_msgSend(*(id *)(a1 + 32), "extractPrincipalURLFromPropFindTask:error:", WeakRetained, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      if (v9)
        objc_msgSend(v10, "propFindTaskFinished:", WeakRetained);
      else
        objc_msgSend(v10, "startWellKnownFallbackHeadTask:withURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    }
LABEL_24:

  }
}

- (void)startWellKnownFallbackHeadTask:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  CoreDAVHeadTask *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[CoreDAVDiscoveryTaskGroup startWellKnownFallbackHeadTask:withURL:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_INFO, "%s - URL: [%@]", buf, 0x16u);
  }

  v11 = -[CoreDAVTask initWithURL:]([CoreDAVHeadTask alloc], "initWithURL:", v7);
  -[CoreDAVTask setAccountInfoProvider:](v11, "setAccountInfoProvider:", v6);
  -[CoreDAVTask setTimeoutInterval:](v11, "setTimeoutInterval:", self->super._timeoutInterval);
  -[CoreDAVTask setAllowAutomaticRedirects:](v11, "setAllowAutomaticRedirects:", 0);
  objc_initWeak((id *)buf, v11);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__CoreDAVDiscoveryTaskGroup_startWellKnownFallbackHeadTask_withURL___block_invoke;
  v14[3] = &unk_24C1D9B30;
  objc_copyWeak(&v16, (id *)buf);
  v14[4] = self;
  v12 = v7;
  v15 = v12;
  -[CoreDAVTask setCompletionBlock:](v11, "setCompletionBlock:", v14);
  if (self->super._isCancelling)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v11, v13);
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v11);
    v13 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v13, "submitIndependentCoreDAVTask:", v11);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __68__CoreDAVDiscoveryTaskGroup_startWellKnownFallbackHeadTask_withURL___block_invoke(id *a1)
{
  id WeakRetained;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(*((id *)a1[4] + 4), "removeObject:", WeakRetained);
    v3 = a1[4];
    if (v3[40])
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "completeDiscovery:error:", WeakRetained, v4);

      goto LABEL_31;
    }
    objc_msgSend(WeakRetained, "accountInfoProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("CoreDAVErrorDomain")))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 1)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)a1[4] + 2);
        objc_msgSend(v9, "logHandleForAccountInfoProvider:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = v11;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = (id)objc_opt_class();
            v13 = v39;
            _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_INFO, "Task cancelled: [%@]", buf, 0xCu);

          }
        }

        objc_msgSend(a1[4], "completeDiscovery:error:", WeakRetained, v6);
        goto LABEL_30;
      }
    }
    else
    {

    }
    if (CDVHTTPStatusCodeRepresentsRedirection(objc_msgSend(WeakRetained, "responseStatusCode")))
    {
      objc_msgSend(WeakRetained, "responseHeaders");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "CDVObjectForKeyCaseInsensitive:", CFSTR("Location"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(WeakRetained, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLWithString:relativeToURL:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "absoluteURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(a1[5], "scheme");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "hasPrefix:", CFSTR("https")))
        {

LABEL_28:
          objc_msgSend(a1[4], "startWellKnownLocationTask:withURL:", v5, v19);
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        objc_msgSend(v19, "scheme");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("https"));

        if ((v22 & 1) != 0)
          goto LABEL_28;
      }
      else
      {

      }
    }
    else
    {
      v19 = 0;
    }
    v23 = *((id *)a1[4] + 18);
    objc_sync_enter(v23);
    objc_msgSend(*((id *)a1[4] + 18), "removeObject:", v5);
    v24 = a1[4];
    v25 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v5, "scheme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithObject:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setupDiscoveries:withSchemes:", v5, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v23);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(v29);
          objc_msgSend(a1[4], "startPropfindTask:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), (_QWORD)v33);
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v30);
    }

    goto LABEL_29;
  }
LABEL_31:

}

- (void)startOptionsTask:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  CoreDAVOptionsTask *v10;
  void *v11;
  CoreDAVOptionsTask *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[CoreDAVDiscoveryTaskGroup startOptionsTask:]";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_INFO, "%s - URL: [%@]", (uint8_t *)&v14, 0x16u);

    }
  }

  v10 = [CoreDAVOptionsTask alloc];
  objc_msgSend(v4, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CoreDAVTask initWithURL:](v10, "initWithURL:", v11);

  -[CoreDAVTask setDelegate:](v12, "setDelegate:", self);
  -[CoreDAVTask setAccountInfoProvider:](v12, "setAccountInfoProvider:", v4);
  -[CoreDAVTask setTimeoutInterval:](v12, "setTimeoutInterval:", self->super._timeoutInterval);
  if (self->super._isCancelling)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v12, v13);
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v12);
    v13 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v13, "submitIndependentCoreDAVTask:", v12);
  }

}

- (void)startPropfindTask:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  CoreDAVPropFindTask *v10;
  void *v11;
  void *v12;
  CoreDAVPropFindTask *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CoreDAVDiscoveryTaskGroup *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CoreDAVDiscoveryTaskGroup startPropfindTask:]";
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_INFO, "%s - URL: [%@]", buf, 0x16u);

    }
  }

  objc_msgSend(v4, "setStarted:", 1);
  v10 = [CoreDAVPropFindTask alloc];
  -[CoreDAVDiscoveryTaskGroup propFindProperties](self, "propFindProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v10, "initWithPropertiesToFind:atURL:withDepth:", v11, v12, 2);

  -[CoreDAVTask setAccountInfoProvider:](v13, "setAccountInfoProvider:", v4);
  -[CoreDAVTask setTimeoutInterval:](v13, "setTimeoutInterval:", self->super._timeoutInterval);
  objc_initWeak((id *)buf, v13);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __47__CoreDAVDiscoveryTaskGroup_startPropfindTask___block_invoke;
  v18 = &unk_24C1D9A90;
  objc_copyWeak(&v20, (id *)buf);
  v19 = self;
  -[CoreDAVTask setCompletionBlock:](v13, "setCompletionBlock:", &v15);
  if (self->super._isCancelling)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0, v15, v16, v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v13, v14);
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v13, v15, v16, v17, v18);
    v14 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v14, "submitIndependentCoreDAVTask:", v13);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __47__CoreDAVDiscoveryTaskGroup_startPropfindTask___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 40));

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", v2);
    objc_msgSend(*(id *)(a1 + 32), "propFindTaskFinished:", v2);
  }

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CoreDAVDiscoveryTaskGroup srvLookupTask:error:](self, "srvLookupTask:error:", v7, v6);

}

- (void)srvLookupTask:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  char *v19;
  char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  CoreDAVDiscoveryAccountInfo *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSMutableArray *obja;
  NSMutableArray *obj;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  NSObject *v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v63 = a4;
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
  v64 = v6;
  if (!self->super._isCancelling)
  {
    objc_msgSend(v6, "accountInfoProvider");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v65, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v82 = "-[CoreDAVDiscoveryTaskGroup srvLookupTask:error:]";
        v83 = 2112;
        v84 = v12;
        v85 = 2112;
        v86 = v63;
        _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_INFO, "%s - URL: [%@],  error: [%@]", buf, 0x20u);

      }
    }

    -[NSObject domain](v63, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("CoreDAVErrorDomain")))
    {
      v14 = -[NSObject code](v63, "code") == 1;

      if (v14)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v15, "logHandleForAccountInfoProvider:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = v17;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (char *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v82 = v19;
            v20 = v19;
            _os_log_impl(&dword_209602000, v18, OS_LOG_TYPE_INFO, "Task cancelled: [%{public}@]", buf, 0xCu);

          }
        }

        -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v64, v63);
        goto LABEL_59;
      }
    }
    else
    {

    }
    objc_msgSend(v64, "fetchedRecords");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "count"))
    {
      objc_msgSend(v62, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "target");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "port");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v25, "logHandleForAccountInfoProvider:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v65, "url");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v82 = "-[CoreDAVDiscoveryTaskGroup srvLookupTask:error:]";
          v83 = 2112;
          v84 = v29;
          v85 = 2112;
          v86 = v22;
          v87 = 2048;
          v88 = v24;
          _os_log_impl(&dword_209602000, v28, OS_LOG_TYPE_INFO, "%s - URL: [%@] srvHost: [%@], srvPort: [%ld]", buf, 0x2Au);

        }
      }

      if (-[NSObject length](v22, "length") && v24)
      {
        objc_msgSend(v65, "setHost:", v22);
        objc_msgSend(v65, "setPort:", v24);
      }
    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v21, "logHandleForAccountInfoProvider:", v30);
      v22 = objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v22 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v65, "url");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v82 = "-[CoreDAVDiscoveryTaskGroup srvLookupTask:error:]";
          v83 = 2112;
          v84 = v31;
          _os_log_impl(&dword_209602000, v22, OS_LOG_TYPE_INFO, "%s - Could not find any SRV records.  URL: [%@]", buf, 0x16u);

        }
      }
    }

    objc_msgSend(v65, "serverRoot");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32
      || (objc_msgSend(v65, "serverRoot"),
          v22 = objc_claimAutoreleasedReturnValue(),
          !-[NSObject length](v22, "length")))
    {
      -[CoreDAVDiscoveryTaskGroup wellKnownPath](self, "wellKnownPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        -[CoreDAVDiscoveryTaskGroup wellKnownPath](self, "wellKnownPath");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "length");

        if (v32)
        {

          if (!v35)
          {
LABEL_35:
            obja = self->_discoveries;
            objc_sync_enter(obja);
            -[NSMutableArray removeObject:](self->_discoveries, "removeObject:", v65);
            v36 = (void *)MEMORY[0x24BDBCE30];
            objc_msgSend(v65, "scheme");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "arrayWithObject:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVDiscoveryTaskGroup setupDiscoveries:withSchemes:](self, "setupDiscoveries:withSchemes:", v65, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_sync_exit(obja);
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v40 = v39;
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
            if (v41)
            {
              v42 = *(_QWORD *)v67;
              do
              {
                for (i = 0; i != v41; ++i)
                {
                  if (*(_QWORD *)v67 != v42)
                    objc_enumerationMutation(v40);
                  -[CoreDAVDiscoveryTaskGroup startPropfindTask:](self, "startPropfindTask:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
                }
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
              }
              while (v41);
            }
LABEL_58:

LABEL_59:
            goto LABEL_60;
          }
        }
        else if (!v35)
        {
          goto LABEL_35;
        }
        v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        obj = self->_discoveries;
        objc_sync_enter(obj);
        -[NSMutableArray removeObject:](self->_discoveries, "removeObject:", v65);
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(v65, "scheme");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lowercaseString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVDiscoveryTaskGroup allDiscoveryPorts:withScheme:](self, "allDiscoveryPorts:withScheme:", v65, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
        if (v48)
        {
          v49 = *(_QWORD *)v75;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v75 != v49)
                objc_enumerationMutation(v47);
              v51 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
              v52 = -[CoreDAVDiscoveryAccountInfo initWithAccountInfoProvider:]([CoreDAVDiscoveryAccountInfo alloc], "initWithAccountInfoProvider:", v65);
              -[CoreDAVDiscoveryAccountInfo setPort:](v52, "setPort:", objc_msgSend(v51, "integerValue"));
              -[CoreDAVDiscoveryAccountInfo setStarted:](v52, "setStarted:", 1);
              objc_msgSend(v44, "addObject:", v52);
              -[NSMutableArray addObject:](self->_discoveries, "addObject:", v52);

            }
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
          }
          while (v48);
        }

        objc_sync_exit(obj);
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v40 = v44;
        v53 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        if (v53)
        {
          v54 = *(_QWORD *)v71;
          do
          {
            for (k = 0; k != v53; ++k)
            {
              if (*(_QWORD *)v71 != v54)
                objc_enumerationMutation(v40);
              v56 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
              objc_msgSend(v56, "serverRoot");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVDiscoveryTaskGroup wellKnownPath](self, "wellKnownPath");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setServerRoot:", v58);

              objc_msgSend(v56, "url");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setServerRoot:", v57);
              -[CoreDAVDiscoveryTaskGroup startWellKnownLocationTask:withURL:](self, "startWellKnownLocationTask:withURL:", v56, v59);

            }
            v53 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          }
          while (v53);
        }
        goto LABEL_58;
      }

      if (!v32)
        goto LABEL_35;
    }

    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v6, v7);

LABEL_60:
}

- (void)completeOptionsTask:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  NSString *v14;
  NSString *requiredComplianceClass;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSString *v24;
  NSString *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->super._isCancelling)
  {
    objc_msgSend(v6, "accountInfoProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v10, "logHandleForAccountInfoProvider:", WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v32 = v9;
        objc_msgSend(v9, "url");
        v14 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
        requiredComplianceClass = self->_requiredComplianceClass;
        if (v7)
        {
          v16 = 0;
        }
        else
        {
          objc_msgSend(v6, "responseHeaders");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 136316162;
        v34 = "-[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:]";
        v35 = 2112;
        v36 = v14;
        v37 = 2112;
        v38 = requiredComplianceClass;
        v39 = 2112;
        v40 = v7;
        v41 = 2112;
        v42 = v16;
        _os_log_impl(&dword_209602000, v13, OS_LOG_TYPE_INFO, "%s - URL: [%@], requiredComplianceClass: [%@], error: [%@], responseHeaders: [%@]", buf, 0x34u);
        if (!v7)

        v9 = v32;
      }

    }
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
      {
        v18 = objc_msgSend(v7, "code");

        if (v18 == 401)
          -[CoreDAVDiscoveryTaskGroup setDidReceiveAuthenticationError:](self, "setDidReceiveAuthenticationError:", 1);
      }
      else
      {

      }
      -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v6, v7);
      goto LABEL_32;
    }
    objc_msgSend(v6, "responseHeaders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CDVCleanedStringsFromResponseHeaders(v19, CFSTR("DAV"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_requiredComplianceClass)
    {
      if ((objc_msgSend(v20, "containsObject:") & 1) == 0)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v21, "logHandleForAccountInfoProvider:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v23 = v23;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = self->_requiredComplianceClass;
            objc_msgSend(v9, "url");
            v25 = (NSString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v34 = "-[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:]";
            v35 = 2112;
            v36 = v24;
            v37 = 2112;
            v38 = v25;
            v26 = "%s - No mention of compliance class [%@] in \"DAV\" header at URL: [%@]";
            v27 = v23;
            v28 = 32;
LABEL_28:
            _os_log_impl(&dword_209602000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
    else if (!objc_msgSend(v20, "count"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v21, "logHandleForAccountInfoProvider:", v30);
      v23 = objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v23 = v23;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "url");
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v34 = "-[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:]";
          v35 = 2112;
          v36 = v25;
          v26 = "%s - No \"DAV\" header at URL: [%@]";
          v27 = v23;
          v28 = 22;
          goto LABEL_28;
        }
LABEL_29:

      }
LABEL_30:

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v6, v31);

      goto LABEL_31;
    }
    objc_msgSend(v9, "setServerComplianceClasses:", v20);
    objc_msgSend(v6, "responseHeaders");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setServerHeaders:", v29);

    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v6, 0);
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v6, v8);

LABEL_33:
}

- (void)optionsTask:(id)a3 error:(id)a4
{
  NSMutableSet *outstandingTasks;
  id v7;
  id v8;

  outstandingTasks = self->super._outstandingTasks;
  v7 = a4;
  v8 = a3;
  -[NSMutableSet removeObject:](outstandingTasks, "removeObject:", v8);
  -[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:](self, "completeOptionsTask:error:", v8, v7);

}

- (void)propFindTaskFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "multiStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v4);
  if (!self->super._isCancelling)
  {
    objc_msgSend(v4, "accountInfoProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v23 = "-[CoreDAVDiscoveryTaskGroup propFindTaskFinished:]";
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v6;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_INFO, "%s - URL: [%@], parsedResponses: [%@], error: [%@]", buf, 0x2Au);

      }
    }

    if (v7)
    {
      objc_msgSend(v7, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
      {
        v15 = objc_msgSend(v7, "code");

        if (v15 == 401)
          -[CoreDAVDiscoveryTaskGroup setDidReceiveAuthenticationError:](self, "setDidReceiveAuthenticationError:", 1);
      }
      else
      {

      }
      v16 = 0;
    }
    else
    {
      v21 = 0;
      -[CoreDAVDiscoveryTaskGroup extractPrincipalURLFromPropFindTask:error:](self, "extractPrincipalURLFromPropFindTask:error:", v4, &v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;
      if (!v17)
      {
        objc_msgSend(v8, "setPrincipalURL:", v16);
        objc_msgSend(v8, "principalURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "relativePath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "CDVStringByAppendingSlashIfNeeded");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setServerRoot:", v20);

        -[CoreDAVDiscoveryTaskGroup startOptionsTask:](self, "startOptionsTask:", v8);
        v7 = 0;
        goto LABEL_16;
      }
      v7 = v17;
    }
    -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v4, v7);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVDiscoveryTaskGroup completeDiscovery:error:](self, "completeDiscovery:error:", v4, v8);
LABEL_17:

}

- (void)completeDiscovery:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  char *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  char *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  char *v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  char *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  id v70;
  void *v71;
  NSObject *v72;
  char *v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  char *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  dispatch_time_t when;
  id v89;
  id obj;
  id obja;
  void *v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v99;
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[5];
  _QWORD block[4];
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[5];
  _QWORD v111[5];
  id v112;
  _QWORD v113[5];
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  _BYTE v125[128];
  uint8_t v126[128];
  uint8_t buf[4];
  const char *v128;
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  id v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v97 = a4;
  v92 = v5;
  objc_msgSend(v5, "accountInfoProvider");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_accountInfoProvider = &self->super._accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v99, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "principalURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "serverComplianceClasses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v128 = "-[CoreDAVDiscoveryTaskGroup completeDiscovery:error:]";
      v129 = 2112;
      v130 = (uint64_t)v11;
      v131 = 2112;
      v132 = v12;
      v133 = 2112;
      v134 = v13;
      v135 = 2112;
      v136 = v97;
      _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_INFO, "%s - URL: [%@] principalURL: [%@] complianceClasses: [%@] error: [%@]", buf, 0x34u);

    }
  }

  v124 = 0;
  v123 = 0;
  v122 = 0;
  v121 = 0;
  v120 = 0;
  -[CoreDAVDiscoveryTaskGroup getDiscoveryStatus:priorFailed:subsequentFailed:priorIncomplete:subsequentIncomplete:priorSuccess:subsequentSuccess:](self, "getDiscoveryStatus:priorFailed:subsequentFailed:priorIncomplete:subsequentIncomplete:priorSuccess:subsequentSuccess:", v99, &v124, 0, &v123, &v122, &v121, &v120);
  v93 = v124;
  v14 = v123;
  v100 = v122;
  v96 = v121;
  v94 = v120;
  v95 = v14;
  v15 = objc_msgSend(v14, "count");
  v16 = objc_msgSend(v100, "count") + v15;
  if (v97)
  {
    objc_msgSend(v99, "setError:");
    if (!objc_msgSend(v96, "count") && !-[CoreDAVDiscoveryTaskGroup shouldBailEarly](self, "shouldBailEarly"))
    {
      v17 = self->_discoveries;
      objc_sync_enter(v17);
      v18 = -[NSMutableArray indexOfObject:](self->_discoveries, "indexOfObject:", v99);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVDiscoveryTaskGroup.m"), 995, CFSTR("Current discovery was not found."));

      }
      if (v18 + 1 < (unint64_t)-[NSMutableArray count](self->_discoveries, "count"))
      {
        -[NSMutableArray objectAtIndex:](self->_discoveries, "objectAtIndex:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "started") & 1) == 0 && !self->super._isCancelling)
        {
          -[CoreDAVDiscoveryTaskGroup startPropfindTask:](self, "startPropfindTask:", v19);
          ++v16;
        }

      }
      objc_sync_exit(v17);

    }
    if (v16)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v20, "logHandleForAccountInfoProvider:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = v22;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v99, "url");
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v24;
          v129 = 2048;
          v130 = v16;
          _os_log_impl(&dword_209602000, v23, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, waiting for %lu incomplete.", buf, 0x16u);

        }
      }

    }
    else if (objc_msgSend(v96, "count") || objc_msgSend(v94, "count"))
    {
      if (objc_msgSend(v96, "count"))
        v41 = v96;
      else
        v41 = v94;
      objc_msgSend(v41, "objectAtIndex:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVDiscoveryTaskGroup setDiscoveredAccountInfo:](self, "setDiscoveredAccountInfo:", v42);

      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v43, "logHandleForAccountInfoProvider:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v46 = v45;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v99, "url");
          v47 = (char *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVDiscoveryTaskGroup discoveredAccountInfo](self, "discoveredAccountInfo");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "principalURL");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v47;
          v129 = 2112;
          v130 = (uint64_t)v49;
          _os_log_impl(&dword_209602000, v46, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, returning previous success %@.", buf, 0x16u);

        }
      }

      v119[0] = MEMORY[0x24BDAC760];
      v119[1] = 3221225472;
      v119[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke;
      v119[3] = &unk_24C1D9A40;
      v119[4] = self;
      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v119);
    }
    else if (objc_msgSend(v93, "count"))
    {
      v89 = v99;
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      obja = v93;
      v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
      v61 = v89;
      if (v60)
      {
        v62 = *(_QWORD *)v116;
        do
        {
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v116 != v62)
              objc_enumerationMutation(obja);
            v64 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
            objc_msgSend(v64, "error");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "domain");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v66, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")) & 1) != 0)
            {
              objc_msgSend(v64, "error");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = objc_msgSend(v67, "code") == 401;

              if (v68)
              {
                v61 = v64;

                goto LABEL_86;
              }
            }
            else
            {

            }
          }
          v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
        }
        while (v60);
        v61 = v89;
      }
LABEL_86:

      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v74, "logHandleForAccountInfoProvider:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (v76)
      {
        v77 = v76;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v89, "url");
          v78 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "url");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v78;
          v129 = 2112;
          v130 = (uint64_t)v79;
          _os_log_impl(&dword_209602000, v77, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, returning prior error %@.", buf, 0x16u);

        }
      }

      objc_msgSend(v61, "error");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = MEMORY[0x24BDAC760];
      v113[1] = 3221225472;
      v113[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_278;
      v113[3] = &unk_24C1D9AB8;
      v113[4] = self;
      v114 = v61;
      v81 = v61;
      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v80, v113);

    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v69, "logHandleForAccountInfoProvider:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        v72 = v71;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v99, "url");
          v73 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v128 = v73;
          _os_log_impl(&dword_209602000, v72, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, returning error.", buf, 0xCu);

        }
      }

      v111[0] = MEMORY[0x24BDAC760];
      v111[1] = 3221225472;
      v111[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_279;
      v111[3] = &unk_24C1D9AB8;
      v111[4] = self;
      v112 = v97;
      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v112, v111);

    }
  }
  else
  {
    objc_msgSend(v99, "principalURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVDiscoveryTaskGroup.m"), 1043, CFSTR("Should not be here without a principal URL"));

    }
    objc_msgSend(v99, "setSuccess:", 1);
    v110[0] = MEMORY[0x24BDAC760];
    v110[1] = 3221225472;
    v110[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_282;
    v110[3] = &unk_24C1D9A40;
    v110[4] = self;
    obj = (id)MEMORY[0x20BD114EC](v110);
    when = dispatch_time(0, 5000000000);
    if (objc_msgSend(v100, "count"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v27, "logHandleForAccountInfoProvider:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = objc_msgSend(v100, "count");
          *(_DWORD *)buf = 134217984;
          v128 = (const char *)v31;
          _os_log_impl(&dword_209602000, v30, OS_LOG_TYPE_INFO, "Principal information found. Tearing down %lu outstanding tasks", buf, 0xCu);
        }

      }
      v32 = (void *)-[NSMutableSet copy](self->super._outstandingTasks, "copy");
      v108 = 0u;
      v109 = 0u;
      v107 = 0u;
      v106 = 0u;
      v33 = v32;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v107;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v107 != v35)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
            objc_msgSend(v37, "accountInfoProvider");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v100, "containsObject:", v38);

            if (v39)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "finishCoreDAVTaskWithError:", v40);

              --v16;
            }
          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
        }
        while (v34);
      }

      if (v16 != objc_msgSend(v95, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVDiscoveryTaskGroup.m"), 1073, CFSTR("A subsequent incomplete discovery was not cancelled"));

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_285;
      block[3] = &unk_24C1D9B58;
      v105 = obj;
      dispatch_after(when, MEMORY[0x24BDAC9B8], block);

    }
    else if (objc_msgSend(v95, "count"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v50, "logHandleForAccountInfoProvider:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        v53 = v52;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v99, "url");
          v54 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v54;
          v129 = 2048;
          v130 = v16;
          _os_log_impl(&dword_209602000, v53, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ success, waiting for prior %lu incomplete.", buf, 0x16u);

        }
      }

      v101[0] = MEMORY[0x24BDAC760];
      v101[1] = 3221225472;
      v101[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_291;
      v101[3] = &unk_24C1D9B58;
      v102 = obj;
      dispatch_after(when, MEMORY[0x24BDAC9B8], v101);

    }
    else
    {
      if (objc_msgSend(v96, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVDiscoveryTaskGroup.m"), 1083, CFSTR("Prior successful discovery should have already cancelled this task"));

      }
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVDiscoveryTaskGroup.m"), 1084, CFSTR("Some tasks have not been not cancelled"));

      }
      -[CoreDAVDiscoveryTaskGroup setDiscoveredAccountInfo:](self, "setDiscoveredAccountInfo:", v99);
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(v55, "logHandleForAccountInfoProvider:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        v58 = v57;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v99, "url");
          v59 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v128 = v59;
          _os_log_impl(&dword_209602000, v58, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ success, returning.", buf, 0xCu);

        }
      }

      v103[0] = MEMORY[0x24BDAC760];
      v103[1] = 3221225472;
      v103[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_290;
      v103[3] = &unk_24C1D9A40;
      v103[4] = self;
      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v103);
    }

  }
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "discoveredAccountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoveryTask:gotAccountInfo:error:", v2, v3, 0);

}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_278(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoveryTask:gotAccountInfo:error:", v2, 0, v3);

}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_279(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveryTask:gotAccountInfo:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_282(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v2, "logHandleForAccountInfoProvider:", WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
        *(_DWORD *)buf = 134217984;
        v21 = v6;
        _os_log_impl(&dword_209602000, v5, OS_LOG_TYPE_INFO, "Giving up on all outstanding tasks since we found some information already. Tearing down %lu outstanding tasks", buf, 0xCu);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0, (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "finishCoreDAVTaskWithError:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

uint64_t __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_285(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_290(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "discoveredAccountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoveryTask:gotAccountInfo:error:", v2, v3, 0);

}

uint64_t __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_291(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)noteDefinitiveAuthFailureFromTask:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CoreDAVDiscoveryTaskGroup setShouldBailEarly:](self, "setShouldBailEarly:", 1);
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_INFO, "Received definitive 401, canceling remaining tasks", buf, 2u);
  }

  v8 = (void *)-[NSMutableSet copy](self->super._outstandingTasks, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (v14 != v4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0, (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "finishCoreDAVTaskWithError:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v11);
  }

}

- (id)propFindProperties
{
  CoreDAVItemParserMapping *v2;
  CoreDAVItemParserMapping *v3;
  CoreDAVItemParserMapping *v4;
  void *v5;

  v2 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v2, "setNameSpace:", CFSTR("DAV:"));
  -[CoreDAVItemParserMapping setName:](v2, "setName:", CFSTR("current-user-principal"));
  -[CoreDAVItemParserMapping setParseClass:](v2, "setParseClass:", objc_opt_class());
  v3 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v3, "setNameSpace:", CFSTR("DAV:"));
  -[CoreDAVItemParserMapping setName:](v3, "setName:", CFSTR("resourcetype"));
  -[CoreDAVItemParserMapping setParseClass:](v3, "setParseClass:", objc_opt_class());
  v4 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v4, "setNameSpace:", CFSTR("DAV:"));
  -[CoreDAVItemParserMapping setName:](v4, "setName:", CFSTR("principal-URL"));
  -[CoreDAVItemParserMapping setParseClass:](v4, "setParseClass:", objc_opt_class());
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v2, v3, v4, 0);

  return v5;
}

- (id)extractPrincipalURLFromPropFindTask:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  id v51;
  char v52;
  id *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "multiStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedResponses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accountInfoProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "successfulPropertiesToValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("resourcetype"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "principal");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      p_accountInfoProvider = &self->super._accountInfoProvider;
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(WeakRetained, "serverRoot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = objc_loadWeakRetained((id *)p_accountInfoProvider);
            objc_msgSend(v20, "serverRoot");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v57 = v21;
            _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_INFO, "Returning specified user principal [%@]", buf, 0xCu);

          }
        }

        if (objc_msgSend(v9, "port"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "port"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v44 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v9, "scheme");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "host");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_loadWeakRetained((id *)p_accountInfoProvider);
        objc_msgSend(v45, "serverRoot");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "CDVURLWithScheme:host:port:path:", v37, v26, v22, v46);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0;
        goto LABEL_44;
      }
    }
    objc_msgSend(v10, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("current-user-principal"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;
    if (v28)
    {
      objc_msgSend(v28, "unauthenticated");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v53 = a4;
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v30, "logHandleForAccountInfoProvider:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209602000, v32, OS_LOG_TYPE_DEFAULT, "Not authenticated to get current user principal", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 1;
LABEL_25:
        objc_msgSend(v10, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("principal-URL"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          objc_msgSend(v36, "href");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "payloadAsFullURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v39 = 0;
            a4 = v53;
            goto LABEL_44;
          }
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v40, "logHandleForAccountInfoProvider:", v48);
          v42 = objc_claimAutoreleasedReturnValue();

          if (!v42 || !os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
LABEL_39:

            v49 = v52;
            if (!v26)
              v49 = 0;
            a4 = v53;
            if ((v49 & 1) != 0)
            {
              v27 = 0;
LABEL_45:

LABEL_46:
              if (!a4)
                goto LABEL_49;
              goto LABEL_47;
            }
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 8, 0);
            v39 = objc_claimAutoreleasedReturnValue();
            v27 = 0;
LABEL_44:

            v26 = (void *)v39;
            goto LABEL_45;
          }
          *(_DWORD *)buf = 138412290;
          v57 = v10;
          v43 = "Could not find the href of the user's principal URL. Found properties: [%@]";
        }
        else
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v40, "logHandleForAccountInfoProvider:", v41);
          v42 = objc_claimAutoreleasedReturnValue();

          if (!v42 || !os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            goto LABEL_39;
          *(_DWORD *)buf = 138412290;
          v57 = v10;
          v43 = "Could not find the user's principal URL. Found properties: [%@]";
        }
        _os_log_impl(&dword_209602000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
        goto LABEL_39;
      }
      objc_msgSend(v22, "href");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "payloadAsFullURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v26 = 0;
        goto LABEL_46;
      }
      v53 = a4;
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v33, "logHandleForAccountInfoProvider:", v51);
      v35 = objc_claimAutoreleasedReturnValue();

      if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v22;
        _os_log_impl(&dword_209602000, v35, OS_LOG_TYPE_DEFAULT, "Could not find the current user principal's HREF.  Current user principal: [%@]", buf, 0xCu);
      }
    }
    else
    {
      v53 = a4;
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v33, "logHandleForAccountInfoProvider:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v10;
        _os_log_impl(&dword_209602000, v35, OS_LOG_TYPE_DEFAULT, "Could not find the current user principal. Found properties: [%@]", buf, 0xCu);
      }
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    goto LABEL_25;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v23, "logHandleForAccountInfoProvider:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v8;
    _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_DEFAULT, "We must have exactly one user principal for an account.  Parsed responses: [%@]", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 8, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  if (a4)
  {
LABEL_47:
    if (v26)
      *a4 = objc_retainAutorelease(v26);
  }
LABEL_49:

  return v27;
}

- (id)cleanedStringsFromResponseHeaders:(id)a3 forHeader:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18 = a4;
  objc_msgSend(v5, "CDVObjectForKeyCaseInsensitive:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "length"))
        {
          if (v11)
          {
            objc_msgSend(v11, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v16);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addToDiscoveryArray:(id *)a3 discovery:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  if (a3)
  {
    v7 = v5;
    if (*a3)
    {
      objc_msgSend(*a3, "addObject:", v5);
      v5 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      *a3 = v6;
    }
  }

}

- (void)getDiscoveryStatus:(id)a3 priorFailed:(id *)a4 subsequentFailed:(id *)a5 priorIncomplete:(id *)a6 subsequentIncomplete:(id *)a7 priorSuccess:(id *)a8 subsequentSuccess:(id *)a9
{
  id v15;
  id *v16;
  NSMutableArray *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  id *v24;
  NSMutableArray *obj;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  v29 = a4;
  if (a9)
    *a9 = 0;
  v26 = a6;
  v16 = a5;
  v27 = a7;
  v28 = a8;
  obj = self->_discoveries;
  objc_sync_enter(obj);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = self->_discoveries;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v18)
  {
    v19 = 0;
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v22 == v15)
        {
          v19 = 1;
        }
        else if (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "started"))
        {
          objc_msgSend(v22, "error");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            if ((v19 & 1) != 0)
              v24 = v16;
            else
              v24 = v29;
          }
          else if (objc_msgSend(v22, "success"))
          {
            if ((v19 & 1) != 0)
              v24 = a9;
            else
              v24 = v28;
          }
          else if ((v19 & 1) != 0)
          {
            v24 = v27;
          }
          else
          {
            v24 = v26;
          }
          -[CoreDAVDiscoveryTaskGroup addToDiscoveryArray:discovery:](self, "addToDiscoveryArray:discovery:", v24, v22, obj);
        }
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  objc_sync_exit(obj);
}

- (BOOL)didReceiveAuthenticationError
{
  return self->_didReceiveAuthenticationError;
}

- (void)setDidReceiveAuthenticationError:(BOOL)a3
{
  self->_didReceiveAuthenticationError = a3;
}

- (BOOL)shouldBailEarly
{
  return self->_shouldBailEarly;
}

- (void)setShouldBailEarly:(BOOL)a3
{
  self->_shouldBailEarly = a3;
}

- (CoreDAVAccountInfoProvider)discoveredAccountInfo
{
  return self->_discoveredAccountInfo;
}

- (void)setDiscoveredAccountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccountInfo, a3);
}

- (NSString)wellKnownPath
{
  return self->_wellKnownPath;
}

- (void)setWellKnownPath:(id)a3
{
  objc_storeStrong((id *)&self->_wellKnownPath, a3);
}

- (NSArray)potentialContextPaths
{
  return self->_potentialContextPaths;
}

- (void)setPotentialContextPaths:(id)a3
{
  objc_storeStrong((id *)&self->_potentialContextPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccountInfo, 0);
  objc_storeStrong((id *)&self->_discoveries, 0);
  objc_storeStrong((id *)&self->_potentialContextPaths, 0);
  objc_storeStrong((id *)&self->_wellKnownPath, 0);
  objc_storeStrong((id *)&self->_httpsServiceString, 0);
  objc_storeStrong((id *)&self->_httpServiceString, 0);
  objc_storeStrong((id *)&self->_httpsPorts, 0);
  objc_storeStrong((id *)&self->_httpPorts, 0);
  objc_storeStrong((id *)&self->_requiredComplianceClass, 0);
}

@end
