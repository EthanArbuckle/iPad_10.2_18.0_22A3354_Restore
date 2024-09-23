@implementation WFGetNetworkDetailsAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  id *v25;
  void *v26;
  id *v27;
  void *v28;
  id *v29;
  void *v30;
  id *v31;
  void *v32;
  id *v33;
  void *v34;
  id *v35;
  void *v36;
  id *v37;
  void *v38;
  id *v39;
  void *v40;
  id v41;
  id *v42;
  void *v43;
  id v44;
  id *v45;
  void *v46;
  id v47;
  id *v48;
  void *v49;
  id v50;
  id *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id *v115;
  id v116;
  id obj;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  WFGetNetworkDetailsAction *v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  id v136;
  _QWORD v137[5];
  id v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  _BYTE v144[128];
  id v145;
  id *v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  const __CFString *v158;
  uint64_t v159;
  uint64_t v160;
  const __CFString *v161;
  const __CFString *v162;
  const __CFString *v163;
  const __CFString *v164;
  const __CFString *v165;
  const __CFString *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  const __CFString *v170;
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  v104 = a3;
  v123 = self;
  -[WFGetNetworkDetailsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNetworkDetailsNetwork"), objc_opt_class());
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v105, "isEqualToString:", CFSTR("Wi-Fi")))
  {
    if (!objc_msgSend(v105, "isEqualToString:", CFSTR("Cellular")))
      goto LABEL_87;
    v145 = 0;
    v146 = &v145;
    v147 = 0x2050000000;
    v5 = (id)getCTTelephonyNetworkInfoClass_softClass;
    v148 = getCTTelephonyNetworkInfoClass_softClass;
    if (!getCTTelephonyNetworkInfoClass_softClass)
    {
      v158 = (const __CFString *)MEMORY[0x24BDAC760];
      v159 = 3221225472;
      v160 = (uint64_t)__getCTTelephonyNetworkInfoClass_block_invoke;
      v161 = (const __CFString *)&unk_24F8BB430;
      v162 = (const __CFString *)&v145;
      __getCTTelephonyNetworkInfoClass_block_invoke((uint64_t)&v158);
      v5 = v146[3];
    }
    v6 = (objc_class *)objc_retainAutorelease(v5);
    _Block_object_dispose(&v145, 8);
    v107 = objc_alloc_init(v6);
    v145 = 0;
    v146 = &v145;
    v147 = 0x2050000000;
    v7 = (id)getCoreTelephonyClientClass_softClass;
    v148 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      v158 = (const __CFString *)MEMORY[0x24BDAC760];
      v159 = 3221225472;
      v160 = (uint64_t)__getCoreTelephonyClientClass_block_invoke;
      v161 = (const __CFString *)&unk_24F8BB430;
      v162 = (const __CFString *)&v145;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)&v158);
      v7 = v146[3];
    }
    v8 = (objc_class *)objc_retainAutorelease(v7);
    _Block_object_dispose(&v145, 8);
    v9 = [v8 alloc];
    v122 = (void *)objc_msgSend(v9, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    v136 = 0;
    objc_msgSend(v122, "getActiveContexts:", &v136);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v136;
    objc_msgSend(v10, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "if_map:", &__block_literal_global_5240);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = v13;
    v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
    if (!v121)
    {
LABEL_86:

      -[WFGetNetworkDetailsAction finishRunningWithError:](v123, "finishRunningWithError:", v11);
      goto LABEL_87;
    }
    v120 = *(_QWORD *)v133;
LABEL_10:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v133 != v120)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * v14);
      v131 = v11;
      objc_msgSend(v122, "getLocalizedOperatorName:error:", v15, &v131);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v131;

      -[WFGetNetworkDetailsAction parameterValueForKey:ofClass:](v123, "parameterValueForKey:ofClass:", CFSTR("WFCellularDetail"), objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE193E8]), "initWithDisplayedCarrierName:", v16);
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("Carrier Name")))
      {
        v19 = v16;
        if (!v19)
          goto LABEL_70;
        goto LABEL_69;
      }
      if (!objc_msgSend(v18, "isEqualToString:", CFSTR("Radio Technology")))
        break;
      objc_msgSend(getCTServiceDescriptorClass(), "descriptorWithSubscriptionContext:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v107, "serviceCurrentRadioAccessTechnology");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v119);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      if (v118)
      {
        v116 = v118;
        v158 = 0;
        v159 = (uint64_t)&v158;
        v160 = 0x2020000000;
        v22 = (id *)getCTRadioAccessTechnologyGPRSSymbolLoc_ptr;
        v161 = (const __CFString *)getCTRadioAccessTechnologyGPRSSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyGPRSSymbolLoc_ptr)
        {
          v23 = CoreTelephonyLibrary();
          v22 = (id *)dlsym(v23, "CTRadioAccessTechnologyGPRS");
          *(_QWORD *)(v159 + 24) = v22;
          getCTRadioAccessTechnologyGPRSSymbolLoc_ptr = (uint64_t)v22;
        }
        _Block_object_dispose(&v158, 8);
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyGPRS(void)");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, CFSTR("WFGetNetworkDetailsAction.m"), 28, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v24 = *v22;
        v145 = v24;
        v158 = CFSTR("GPRS");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v25 = (id *)getCTRadioAccessTechnologyEdgeSymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyEdgeSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyEdgeSymbolLoc_ptr)
        {
          v26 = CoreTelephonyLibrary();
          v25 = (id *)dlsym(v26, "CTRadioAccessTechnologyEdge");
          v140[3] = (uint64_t)v25;
          getCTRadioAccessTechnologyEdgeSymbolLoc_ptr = (uint64_t)v25;
        }
        _Block_object_dispose(&v139, 8);
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyEdge(void)");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, CFSTR("WFGetNetworkDetailsAction.m"), 29, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v115 = (id *)*v25;
        v146 = v115;
        v159 = (uint64_t)CFSTR("Edge");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v27 = (id *)getCTRadioAccessTechnologyWCDMASymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyWCDMASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyWCDMASymbolLoc_ptr)
        {
          v28 = CoreTelephonyLibrary();
          v27 = (id *)dlsym(v28, "CTRadioAccessTechnologyWCDMA");
          v140[3] = (uint64_t)v27;
          getCTRadioAccessTechnologyWCDMASymbolLoc_ptr = (uint64_t)v27;
        }
        _Block_object_dispose(&v139, 8);
        if (!v27)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyWCDMA(void)");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "handleFailureInFunction:file:lineNumber:description:", v83, CFSTR("WFGetNetworkDetailsAction.m"), 30, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v114 = *v27;
        v147 = (uint64_t)v114;
        v160 = (uint64_t)CFSTR("WCDMA");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v29 = (id *)getCTRadioAccessTechnologyHSDPASymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyHSDPASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyHSDPASymbolLoc_ptr)
        {
          v30 = CoreTelephonyLibrary();
          v29 = (id *)dlsym(v30, "CTRadioAccessTechnologyHSDPA");
          v140[3] = (uint64_t)v29;
          getCTRadioAccessTechnologyHSDPASymbolLoc_ptr = (uint64_t)v29;
        }
        _Block_object_dispose(&v139, 8);
        if (!v29)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyHSDPA(void)");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "handleFailureInFunction:file:lineNumber:description:", v85, CFSTR("WFGetNetworkDetailsAction.m"), 31, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v113 = *v29;
        v148 = (uint64_t)v113;
        v161 = CFSTR("HSDPA");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v31 = (id *)getCTRadioAccessTechnologyHSUPASymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyHSUPASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyHSUPASymbolLoc_ptr)
        {
          v32 = CoreTelephonyLibrary();
          v31 = (id *)dlsym(v32, "CTRadioAccessTechnologyHSUPA");
          v140[3] = (uint64_t)v31;
          getCTRadioAccessTechnologyHSUPASymbolLoc_ptr = (uint64_t)v31;
        }
        _Block_object_dispose(&v139, 8);
        if (!v31)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyHSUPA(void)");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "handleFailureInFunction:file:lineNumber:description:", v87, CFSTR("WFGetNetworkDetailsAction.m"), 32, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v112 = *v31;
        v149 = v112;
        v162 = CFSTR("HSUPA");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v33 = (id *)getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr)
        {
          v34 = CoreTelephonyLibrary();
          v33 = (id *)dlsym(v34, "CTRadioAccessTechnologyCDMA1x");
          v140[3] = (uint64_t)v33;
          getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr = (uint64_t)v33;
        }
        _Block_object_dispose(&v139, 8);
        if (!v33)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyCDMA1x(void)");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "handleFailureInFunction:file:lineNumber:description:", v89, CFSTR("WFGetNetworkDetailsAction.m"), 33, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v111 = *v33;
        v150 = v111;
        v163 = CFSTR("CDMA 1x");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v35 = (id *)getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr)
        {
          v36 = CoreTelephonyLibrary();
          v35 = (id *)dlsym(v36, "CTRadioAccessTechnologyCDMAEVDORev0");
          v140[3] = (uint64_t)v35;
          getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr = (uint64_t)v35;
        }
        _Block_object_dispose(&v139, 8);
        if (!v35)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyCDMAEVDORev0(void)");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "handleFailureInFunction:file:lineNumber:description:", v91, CFSTR("WFGetNetworkDetailsAction.m"), 34, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v110 = *v35;
        v151 = v110;
        v164 = CFSTR("CDMA EV-DO Rev 0");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v37 = (id *)getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr)
        {
          v38 = CoreTelephonyLibrary();
          v37 = (id *)dlsym(v38, "CTRadioAccessTechnologyCDMAEVDORevA");
          v140[3] = (uint64_t)v37;
          getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr = (uint64_t)v37;
        }
        _Block_object_dispose(&v139, 8);
        if (!v37)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyCDMAEVDORevA(void)");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "handleFailureInFunction:file:lineNumber:description:", v93, CFSTR("WFGetNetworkDetailsAction.m"), 35, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v109 = *v37;
        v152 = v109;
        v165 = CFSTR("CDMA EV-DO Rev A");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v39 = (id *)getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr)
        {
          v40 = CoreTelephonyLibrary();
          v39 = (id *)dlsym(v40, "CTRadioAccessTechnologyCDMAEVDORevB");
          v140[3] = (uint64_t)v39;
          getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr = (uint64_t)v39;
        }
        _Block_object_dispose(&v139, 8);
        if (!v39)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyCDMAEVDORevB(void)");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "handleFailureInFunction:file:lineNumber:description:", v95, CFSTR("WFGetNetworkDetailsAction.m"), 36, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v41 = *v39;
        v153 = v41;
        v166 = CFSTR("CDMA EV-DO Rev B");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v42 = (id *)getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr)
        {
          v43 = CoreTelephonyLibrary();
          v42 = (id *)dlsym(v43, "CTRadioAccessTechnologyeHRPD");
          v140[3] = (uint64_t)v42;
          getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr = (uint64_t)v42;
        }
        _Block_object_dispose(&v139, 8);
        if (!v42)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyeHRPD(void)");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, CFSTR("WFGetNetworkDetailsAction.m"), 37, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v44 = *v42;
        v154 = v44;
        v167 = CFSTR("HRPD");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v45 = (id *)getCTRadioAccessTechnologyLTESymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyLTESymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyLTESymbolLoc_ptr)
        {
          v46 = CoreTelephonyLibrary();
          v45 = (id *)dlsym(v46, "CTRadioAccessTechnologyLTE");
          v140[3] = (uint64_t)v45;
          getCTRadioAccessTechnologyLTESymbolLoc_ptr = (uint64_t)v45;
        }
        _Block_object_dispose(&v139, 8);
        if (!v45)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyLTE(void)");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, CFSTR("WFGetNetworkDetailsAction.m"), 38, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v47 = *v45;
        v155 = v47;
        v168 = CFSTR("LTE");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v48 = (id *)getCTRadioAccessTechnologyNRNSASymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyNRNSASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyNRNSASymbolLoc_ptr)
        {
          v49 = CoreTelephonyLibrary();
          v48 = (id *)dlsym(v49, "CTRadioAccessTechnologyNRNSA");
          v140[3] = (uint64_t)v48;
          getCTRadioAccessTechnologyNRNSASymbolLoc_ptr = (uint64_t)v48;
        }
        _Block_object_dispose(&v139, 8);
        if (!v48)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyNRNSA(void)");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v101, CFSTR("WFGetNetworkDetailsAction.m"), 39, CFSTR("%s"), dlerror(), v104);

          goto LABEL_101;
        }
        v108 = v24;
        v50 = *v48;
        v156 = v50;
        v169 = CFSTR("5G NR NSA");
        v139 = 0;
        v140 = &v139;
        v141 = 0x2020000000;
        v51 = (id *)getCTRadioAccessTechnologyNRSymbolLoc_ptr;
        v142 = getCTRadioAccessTechnologyNRSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyNRSymbolLoc_ptr)
        {
          v52 = CoreTelephonyLibrary();
          v51 = (id *)dlsym(v52, "CTRadioAccessTechnologyNR");
          v140[3] = (uint64_t)v51;
          getCTRadioAccessTechnologyNRSymbolLoc_ptr = (uint64_t)v51;
        }
        _Block_object_dispose(&v139, 8);
        if (!v51)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCTRadioAccessTechnologyNR(void)");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, CFSTR("WFGetNetworkDetailsAction.m"), 40, CFSTR("%s"), dlerror(), v104);

LABEL_101:
          __break(1u);
        }
        v157 = *v51;
        v170 = CFSTR("5G NR");
        v53 = (void *)MEMORY[0x24BDBCE70];
        v54 = v157;
        objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", &v158, &v145, 13);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "objectForKeyedSubscript:", v116);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(v116, "stringByReplacingOccurrencesOfString:withString:", CFSTR("CTRadioAccessTechnology"), &stru_24F8BBA48);
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v19 = 0;
      }

LABEL_68:
      if (v19)
        goto LABEL_69;
LABEL_70:
      v11 = v17;

      if (v121 == ++v14)
      {
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
        v121 = v77;
        if (!v77)
          goto LABEL_86;
        goto LABEL_10;
      }
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("Country Code")))
    {
      v130 = v17;
      v56 = (void *)objc_msgSend(v122, "copyMobileCountryCode:error:", v15, &v130);
      v57 = v130;

      if (v56)
      {
        v129 = v57;
        v58 = (void *)objc_msgSend(v122, "copyMobileSubscriberIsoCountryCode:error:", v56, &v129);
        v59 = v129;

        objc_msgSend(v58, "uppercaseString");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        v57 = v59;
      }
      else
      {
        v19 = 0;
      }

LABEL_80:
      v17 = v57;
      if (!v19)
        goto LABEL_70;
LABEL_69:
      v65 = (void *)MEMORY[0x24BE19458];
      objc_msgSend(MEMORY[0x24BE19470], "networkLocation");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = v124;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "configurationWithOrigin:disclosureLevel:disclosureWarnings:", v66, 1, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:privacyConfiguration:", v19, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGetNetworkDetailsAction output](v123, "output");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addItem:", v69);

      goto LABEL_70;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("Is Roaming Abroad")))
    {
      v128 = v17;
      v60 = (void *)objc_msgSend(v122, "copyServingPlmn:error:", v15, &v128);
      v57 = v128;

      if (objc_msgSend(v60, "BOOLValue"))
      {
        v127 = v57;
        v61 = (void *)objc_msgSend(v122, "copyIsInHomeCountry:error:", v15, &v127);
        v62 = v127;

        v63 = objc_msgSend(v61, "BOOLValue");
        v64 = v63 ^ 1u;
        v57 = v62;
      }
      else
      {
        v64 = 0;
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v64);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_80;
    }
    if (!objc_msgSend(v18, "isEqualToString:", CFSTR("Number of Signal Bars")))
      goto LABEL_70;
    objc_msgSend(getCTServiceDescriptorClass(), "descriptorWithSubscriptionContext:", v15);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v17;
    objc_msgSend(v122, "getPublicSignalStrength:error:", v71, &v126);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v126;

    if (v72)
    {
      v125 = v73;
      v74 = (void *)objc_msgSend(v122, "copyServingPlmn:error:", v15, &v125);
      v17 = v125;

      v75 = objc_msgSend(v74, "BOOLValue");
      if (v75)
      {
        objc_msgSend(v72, "displayBars");
        v76 = objc_claimAutoreleasedReturnValue();
LABEL_84:
        v19 = (id)v76;

        goto LABEL_68;
      }
    }
    else
    {
      v17 = v73;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
    v76 = objc_claimAutoreleasedReturnValue();
    goto LABEL_84;
  }
  -[WFGetNetworkDetailsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWiFiDetail"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = MEMORY[0x24BDAC760];
  v137[1] = 3221225472;
  v137[2] = __56__WFGetNetworkDetailsAction_runAsynchronouslyWithInput___block_invoke;
  v137[3] = &unk_24F8B0F40;
  v137[4] = self;
  v138 = v4;
  v106 = v4;
  +[WFWiFiSettingsClient createClientWithCompletionHandler:](WFWiFiSettingsClient, "createClientWithCompletionHandler:", v137);

LABEL_87:
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v15;
  objc_super v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[WFGetNetworkDetailsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFNetworkDetailsNetwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Wi-Fi")))
  {
    -[WFGetNetworkDetailsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFWiFiDetail"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TX Rate")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("RX Rate")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("RSSI")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("Noise")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("Channel Number")))
    {
      v26[0] = objc_opt_class();
      v7 = v26;
    }
    else
    {
      v25 = objc_opt_class();
      v7 = &v25;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Cellular")))
  {
    -[WFGetNetworkDetailsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFCellularDetail"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Is Roaming Abroad")))
    {
      v24 = objc_opt_class();
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = &v24;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Number of Signal Bars")))
    {
      v23 = objc_opt_class();
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = &v23;
    }
    else
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Carrier Name")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("Country Code")) & 1) == 0
        && !objc_msgSend(v9, "isEqualToString:", CFSTR("Radio Technology")))
      {
        getWFActionsLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[WFGetNetworkDetailsAction outputContentClasses]";
          v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_FAULT, "%s Unexpected cellularSubject: %@", buf, 0x16u);
        }

        v17.receiver = self;
        v17.super_class = (Class)WFGetNetworkDetailsAction;
        -[WFGetNetworkDetailsAction outputContentClasses](&v17, sel_outputContentClasses);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v22 = objc_opt_class();
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = &v22;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v8 = (void *)v13;

LABEL_23:
    goto LABEL_24;
  }
  getWFActionsLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[WFGetNetworkDetailsAction outputContentClasses]";
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_FAULT, "%s Unexpected subject: %@", buf, 0x16u);
  }

  v16.receiver = self;
  v16.super_class = (Class)WFGetNetworkDetailsAction;
  -[WFGetNetworkDetailsAction outputContentClasses](&v16, sel_outputContentClasses);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v8;
}

void __56__WFGetNetworkDetailsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Network Name")))
    {
      objc_msgSend(v7, "networkName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x24BE195F0]);
      objc_msgSend(v7, "networkName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithDisplayedNetworkName:", v10);

      if (!v8)
        goto LABEL_23;
      goto LABEL_20;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("BSSID")))
    {
      objc_msgSend(v7, "BSSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_new();
      goto LABEL_8;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("TX Rate")))
    {
      objc_msgSend(v7, "txRate");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RX Rate")))
    {
      objc_msgSend(v7, "rxRate");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RSSI")))
    {
      objc_msgSend(v7, "RSSI");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Noise")))
    {
      objc_msgSend(v7, "noise");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Hardware MAC Address")))
      {
        objc_msgSend(v7, "hardwareMACAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hardwareMACAddress");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22)
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE19558]), "initWithDisplayedMACAddress:", v8);
LABEL_8:
          v11 = (void *)v12;
          if (!v8)
            goto LABEL_23;
          goto LABEL_20;
        }
LABEL_19:
        v11 = 0;
        if (!v8)
        {
LABEL_23:
          objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

          goto LABEL_24;
        }
LABEL_20:
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v11)
          objc_msgSend(v14, "addObject:", v11);
        v16 = (void *)MEMORY[0x24BE19458];
        objc_msgSend(MEMORY[0x24BE19470], "networkLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "configurationWithOrigin:disclosureLevel:disclosureWarnings:", v17, 1, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:privacyConfiguration:", v8, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "output");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addItem:", v19);

        goto LABEL_23;
      }
      if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Channel Number")))
      {
        objc_msgSend(v7, "channel");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Wi-Fi Standard")))
        {
          getWFWorkflowExecutionLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            v24 = *(_QWORD *)(a1 + 40);
            v25 = 136315394;
            v26 = "-[WFGetNetworkDetailsAction runAsynchronouslyWithInput:]_block_invoke";
            v27 = 2112;
            v28 = v24;
            _os_log_impl(&dword_22D353000, v23, OS_LOG_TYPE_FAULT, "%s Unexpected WFWiFiDetailKey %@ in WFGetNetworkDetailsAction", (uint8_t *)&v25, 0x16u);
          }

          v8 = 0;
          v11 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v7, "wifiStandard");
        v13 = objc_claimAutoreleasedReturnValue();
      }
    }
    v8 = (void *)v13;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
LABEL_24:

}

uint64_t __56__WFGetNetworkDetailsAction_runAsynchronouslyWithInput___block_invoke_154(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "context");
}

@end
